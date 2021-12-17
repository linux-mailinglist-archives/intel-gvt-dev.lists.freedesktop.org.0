Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E63478394
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Dec 2021 04:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96F310E265;
	Fri, 17 Dec 2021 03:15:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD80C10E210
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Dec 2021 03:15:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="238410706"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
 d="asc'?scan'208";a="238410706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 19:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
 d="asc'?scan'208";a="506600559"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.59])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 19:14:59 -0800
Date: Fri, 17 Dec 2021 10:47:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] i915/gvt: Stop tracking the pages of page table when
 failing to do shadow.
Message-ID: <20211217024739.GF1856@zhen-hp.sh.intel.com>
References: <20211216202900.1111-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <20211216202900.1111-1-zhi.a.wang@intel.com>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.12.16 15:29:00 -0500, Zhi Wang wrote:
> The PPGTT page table inside a VM will be tracked when created. When a
> tracked page is modified, GVT-g will update the shadow page table
> accordingly.
>=20
> Sometimes, the guest will free a page belongs to a PPGTT page table, but
> doesn't unbind the page from its upper level. So the page is still

That's bad, right? Is there real case the guest driver might do this?

> tracked. Later that page might be allocated to other clients, which causes
> a flood of garbage traps. As the page has been used for other purpose,
> doing the shadow on this page will always fail, which causes the error
> "guest page write error".
>=20
> The patch will identify this case by counting the times of failure of
> doing shadow on a tracked page. If the times of failure is larger than
> 3, GVT-g will stop tracking the page and release the sub level of the
> shadow pages accordingly.
>=20
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 62 ++++++++++++++++++++++------------
>  drivers/gpu/drm/i915/gvt/gtt.h |  1 +
>  2 files changed, 41 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index d7054bfb3e7d..fbfa5b8f1544 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -778,6 +778,21 @@ static void ppgtt_free_all_spt(struct intel_vgpu *vg=
pu)
>  		ppgtt_free_spt(spt);
>  }
> =20
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, bool f=
orce);
> +
> +static void ppgtt_handle_invalid_spt(struct intel_vgpu_ppgtt_spt *spt)
> +{
> +	if (spt->fail_cnt > 3) {
> +		ppgtt_invalidate_spt(spt, true);
> +	} else
> +		spt->fail_cnt++;
> +}
> +
> +static void ppgtt_set_spt_valid(struct intel_vgpu_ppgtt_spt *spt)
> +{
> +	spt->fail_cnt =3D 0;
> +}
> +
>  static int ppgtt_handle_guest_write_page_table_bytes(
>  		struct intel_vgpu_ppgtt_spt *spt,
>  		u64 pa, void *p_data, int bytes);
> @@ -791,12 +806,18 @@ static int ppgtt_write_protection_handler(
>  	int ret;
> =20
>  	if (bytes !=3D 4 && bytes !=3D 8)
> -		return -EINVAL;
> +		goto invalid_spt;
> =20
>  	ret =3D ppgtt_handle_guest_write_page_table_bytes(spt, gpa, data, bytes=
);
>  	if (ret)
> -		return ret;
> -	return ret;
> +		goto invalid_spt;
> +
> +	ppgtt_set_spt_valid(spt);
> +	return 0;
> +
> +invalid_spt:
> +	ppgtt_handle_invalid_spt(spt);
> +	return 0;
>  }
> =20
>  /* Find a spt by guest gfn. */
> @@ -941,10 +962,8 @@ static inline int ppgtt_put_spt(struct intel_vgpu_pp=
gtt_spt *spt)
>  	return atomic_dec_return(&spt->refcount);
>  }
> =20
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> -
>  static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
> -		struct intel_gvt_gtt_entry *e)
> +		struct intel_gvt_gtt_entry *e, bool force)
>  {
>  	struct drm_i915_private *i915 =3D vgpu->gvt->gt->i915;
>  	const struct intel_gvt_gtt_pte_ops *ops =3D vgpu->gvt->gtt.pte_ops;
> @@ -973,11 +992,11 @@ static int ppgtt_invalidate_spt_by_shadow_entry(str=
uct intel_vgpu *vgpu,
>  	}
>  	s =3D intel_vgpu_find_spt_by_mfn(vgpu, ops->get_pfn(e));
>  	if (!s) {
> -		gvt_vgpu_err("fail to find shadow page: mfn: 0x%lx\n",
> +		gvt_dbg_mm("fail to find shadow page: mfn: 0x%lx\n",
>  				ops->get_pfn(e));
> -		return -ENXIO;
> +		return 0;
>  	}
> -	return ppgtt_invalidate_spt(s);
> +	return ppgtt_invalidate_spt(s, force);
>  }
> =20
>  static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
> @@ -998,9 +1017,8 @@ static inline void ppgtt_invalidate_pte(struct intel=
_vgpu_ppgtt_spt *spt,
>  	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
>  }
> =20
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, bool f=
orce)
>  {
> -	struct intel_vgpu *vgpu =3D spt->vgpu;
>  	struct intel_gvt_gtt_entry e;
>  	unsigned long index;
>  	int ret;
> @@ -1008,7 +1026,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_p=
pgtt_spt *spt)
>  	trace_spt_change(spt->vgpu->id, "die", spt,
>  			spt->guest_page.gfn, spt->shadow_page.type);
> =20
> -	if (ppgtt_put_spt(spt) > 0)
> +	if (!force && ppgtt_put_spt(spt) > 0)
>  		return 0;
> =20
>  	for_each_present_shadow_entry(spt, &e, index) {
> @@ -1032,7 +1050,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_p=
pgtt_spt *spt)
>  		case GTT_TYPE_PPGTT_PDE_ENTRY:
>  			gvt_vdbg_mm("invalidate PMUL4/PDP/PDE entry\n");
>  			ret =3D ppgtt_invalidate_spt_by_shadow_entry(
> -					spt->vgpu, &e);
> +					spt->vgpu, &e, force);
>  			if (ret)
>  				goto fail;
>  			break;
> @@ -1046,7 +1064,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_p=
pgtt_spt *spt)
>  	ppgtt_free_spt(spt);
>  	return 0;
>  fail:
> -	gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
> +	gvt_dbg_mm("fail: shadow page %p shadow entry 0x%llx type %d\n",
>  			spt, e.val64, e.type);
>  	return ret;
>  }
> @@ -1196,7 +1214,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *v=
gpu,
>  		ret =3D intel_gvt_hypervisor_dma_map_guest_page(vgpu,
>  				start_gfn + sub_index, PAGE_SIZE, &dma_addr);
>  		if (ret) {
> -			ppgtt_invalidate_spt(spt);
> +			ppgtt_invalidate_spt(spt, false);
>  			return ret;
>  		}
>  		sub_se.val64 =3D se->val64;
> @@ -1371,11 +1389,11 @@ static int ppgtt_handle_guest_entry_removal(struc=
t intel_vgpu_ppgtt_spt *spt,
>  		struct intel_vgpu_ppgtt_spt *s =3D
>  			intel_vgpu_find_spt_by_mfn(vgpu, ops->get_pfn(se));
>  		if (!s) {
> -			gvt_vgpu_err("fail to find guest page\n");
> -			ret =3D -ENXIO;
> +			gvt_dbg_mm("fail to find guest page\n");
> +			ret =3D 0;
>  			goto fail;
>  		}
> -		ret =3D ppgtt_invalidate_spt(s);
> +		ret =3D ppgtt_invalidate_spt(s, false);
>  		if (ret)
>  			goto fail;
>  	} else {
> @@ -1387,7 +1405,7 @@ static int ppgtt_handle_guest_entry_removal(struct =
intel_vgpu_ppgtt_spt *spt,
> =20
>  	return 0;
>  fail:
> -	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d\n",
> +	gvt_dbg_mm("fail: shadow page %p guest entry 0x%llx type %d\n",
>  			spt, se->val64, se->type);
>  	return ret;
>  }
> @@ -1422,7 +1440,7 @@ static int ppgtt_handle_guest_entry_add(struct inte=
l_vgpu_ppgtt_spt *spt,
>  	}
>  	return 0;
>  fail:
> -	gvt_vgpu_err("fail: spt %p guest entry 0x%llx type %d\n",
> +	gvt_dbg_mm("fail: spt %p guest entry 0x%llx type %d\n",
>  		spt, we->val64, we->type);
>  	return ret;
>  }
> @@ -1653,7 +1671,7 @@ static int ppgtt_handle_guest_write_page_table(
> =20
>  	return 0;
>  fail:
> -	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d.\n",
> +	gvt_dbg_mm("fail: shadow page %p guest entry 0x%llx type %d.\n",
>  			spt, we->val64, we->type);
>  	return ret;
>  }
> @@ -1798,7 +1816,7 @@ static void invalidate_ppgtt_mm(struct intel_vgpu_m=
m *mm)
>  		if (!ops->test_present(&se))
>  			continue;
> =20
> -		ppgtt_invalidate_spt_by_shadow_entry(vgpu, &se);
> +		ppgtt_invalidate_spt_by_shadow_entry(vgpu, &se, false);
>  		se.val64 =3D 0;
>  		ppgtt_set_shadow_root_entry(mm, &se, index);
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gt=
t.h
> index a3b0f59ec8bd..8b02ff5d9651 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -263,6 +263,7 @@ struct intel_vgpu_ppgtt_spt {
>  	} guest_page;
> =20
>  	DECLARE_BITMAP(post_shadow_bitmap, GTT_ENTRY_NUM_IN_ONE_PAGE);
> +	unsigned long fail_cnt;
>  	struct list_head post_shadow_list;
>  };
> =20
> --=20
> 2.17.1
>=20

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYbv6SwAKCRCxBBozTXgY
J2/MAJ0SzScDc2UEeZ7yb5RBx20drt7Y+gCfXMgZVsPA9wShdu4HS9CooPjuZYE=
=aVKb
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
