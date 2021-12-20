Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C537E47A537
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Dec 2021 07:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D63E10E579;
	Mon, 20 Dec 2021 06:58:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7A310E542
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Dec 2021 06:58:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220787036"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
 d="asc'?scan'208";a="220787036"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
 d="asc'?scan'208";a="606621969"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.59])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2021 22:58:44 -0800
Date: Mon, 20 Dec 2021 14:31:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH] i915/gvt: Stop tracking the pages of page table when
 failing to do shadow.
Message-ID: <20211220063118.GD26059@zhen-hp.sh.intel.com>
References: <20211216202900.1111-1-zhi.a.wang@intel.com>
 <20211217024739.GF1856@zhen-hp.sh.intel.com>
 <0ba174b6-8c32-328f-54ae-59ed3dc24a12@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <0ba174b6-8c32-328f-54ae-59ed3dc24a12@intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhi Wang <zhi.wang.linux@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.12.17 08:50:55 +0000, Wang, Zhi A wrote:
> On 12/17/2021 4:47 AM, Zhenyu Wang wrote:
> > On 2021.12.16 15:29:00 -0500, Zhi Wang wrote:
> >> The PPGTT page table inside a VM will be tracked when created. When a
> >> tracked page is modified, GVT-g will update the shadow page table
> >> accordingly.
> >>
> >> Sometimes, the guest will free a page belongs to a PPGTT page table, b=
ut
> >> doesn't unbind the page from its upper level. So the page is still
> > That's bad, right? Is there real case the guest driver might do this?
>=20
> Hi Zhenyu, Yes. This patch is cooked for a key customer which solves the=
=20
> prob caused by the windows driver. It is reported that the problem can=20
> be easily re-produced in their environment and the problem will be fixed=
=20
> after applying this patch.
>=20

I think we may try best to do sanity check of shadow pt modification with
quick fail back to invalidate, three times strikes doesn't seem good to me..

btw, you may split the change to convert from error message to debug info.

thanks

>=20
> >> tracked. Later that page might be allocated to other clients, which ca=
uses
> >> a flood of garbage traps. As the page has been used for other purpose,
> >> doing the shadow on this page will always fail, which causes the error
> >> "guest page write error".
> >>
> >> The patch will identify this case by counting the times of failure of
> >> doing shadow on a tracked page. If the times of failure is larger than
> >> 3, GVT-g will stop tracking the page and release the sub level of the
> >> shadow pages accordingly.
> >>
> >> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gvt/gtt.c | 62 ++++++++++++++++++++++----------=
--
> >>   drivers/gpu/drm/i915/gvt/gtt.h |  1 +
> >>   2 files changed, 41 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt=
/gtt.c
> >> index d7054bfb3e7d..fbfa5b8f1544 100644
> >> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> >> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> >> @@ -778,6 +778,21 @@ static void ppgtt_free_all_spt(struct intel_vgpu =
*vgpu)
> >>   		ppgtt_free_spt(spt);
> >>   }
> >>  =20
> >> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, boo=
l force);
> >> +
> >> +static void ppgtt_handle_invalid_spt(struct intel_vgpu_ppgtt_spt *spt)
> >> +{
> >> +	if (spt->fail_cnt > 3) {
> >> +		ppgtt_invalidate_spt(spt, true);
> >> +	} else
> >> +		spt->fail_cnt++;
> >> +}
> >> +
> >> +static void ppgtt_set_spt_valid(struct intel_vgpu_ppgtt_spt *spt)
> >> +{
> >> +	spt->fail_cnt =3D 0;
> >> +}
> >> +
> >>   static int ppgtt_handle_guest_write_page_table_bytes(
> >>   		struct intel_vgpu_ppgtt_spt *spt,
> >>   		u64 pa, void *p_data, int bytes);
> >> @@ -791,12 +806,18 @@ static int ppgtt_write_protection_handler(
> >>   	int ret;
> >>  =20
> >>   	if (bytes !=3D 4 && bytes !=3D 8)
> >> -		return -EINVAL;
> >> +		goto invalid_spt;
> >>  =20
> >>   	ret =3D ppgtt_handle_guest_write_page_table_bytes(spt, gpa, data, b=
ytes);
> >>   	if (ret)
> >> -		return ret;
> >> -	return ret;
> >> +		goto invalid_spt;
> >> +
> >> +	ppgtt_set_spt_valid(spt);
> >> +	return 0;
> >> +
> >> +invalid_spt:
> >> +	ppgtt_handle_invalid_spt(spt);
> >> +	return 0;
> >>   }
> >>  =20
> >>   /* Find a spt by guest gfn. */
> >> @@ -941,10 +962,8 @@ static inline int ppgtt_put_spt(struct intel_vgpu=
_ppgtt_spt *spt)
> >>   	return atomic_dec_return(&spt->refcount);
> >>   }
> >>  =20
> >> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> >> -
> >>   static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *v=
gpu,
> >> -		struct intel_gvt_gtt_entry *e)
> >> +		struct intel_gvt_gtt_entry *e, bool force)
> >>   {
> >>   	struct drm_i915_private *i915 =3D vgpu->gvt->gt->i915;
> >>   	const struct intel_gvt_gtt_pte_ops *ops =3D vgpu->gvt->gtt.pte_ops;
> >> @@ -973,11 +992,11 @@ static int ppgtt_invalidate_spt_by_shadow_entry(=
struct intel_vgpu *vgpu,
> >>   	}
> >>   	s =3D intel_vgpu_find_spt_by_mfn(vgpu, ops->get_pfn(e));
> >>   	if (!s) {
> >> -		gvt_vgpu_err("fail to find shadow page: mfn: 0x%lx\n",
> >> +		gvt_dbg_mm("fail to find shadow page: mfn: 0x%lx\n",
> >>   				ops->get_pfn(e));
> >> -		return -ENXIO;
> >> +		return 0;
> >>   	}
> >> -	return ppgtt_invalidate_spt(s);
> >> +	return ppgtt_invalidate_spt(s, force);
> >>   }
> >>  =20
> >>   static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt =
*spt,
> >> @@ -998,9 +1017,8 @@ static inline void ppgtt_invalidate_pte(struct in=
tel_vgpu_ppgtt_spt *spt,
> >>   	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
> >>   }
> >>  =20
> >> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
> >> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, boo=
l force)
> >>   {
> >> -	struct intel_vgpu *vgpu =3D spt->vgpu;
> >>   	struct intel_gvt_gtt_entry e;
> >>   	unsigned long index;
> >>   	int ret;
> >> @@ -1008,7 +1026,7 @@ static int ppgtt_invalidate_spt(struct intel_vgp=
u_ppgtt_spt *spt)
> >>   	trace_spt_change(spt->vgpu->id, "die", spt,
> >>   			spt->guest_page.gfn, spt->shadow_page.type);
> >>  =20
> >> -	if (ppgtt_put_spt(spt) > 0)
> >> +	if (!force && ppgtt_put_spt(spt) > 0)
> >>   		return 0;
> >>  =20
> >>   	for_each_present_shadow_entry(spt, &e, index) {
> >> @@ -1032,7 +1050,7 @@ static int ppgtt_invalidate_spt(struct intel_vgp=
u_ppgtt_spt *spt)
> >>   		case GTT_TYPE_PPGTT_PDE_ENTRY:
> >>   			gvt_vdbg_mm("invalidate PMUL4/PDP/PDE entry\n");
> >>   			ret =3D ppgtt_invalidate_spt_by_shadow_entry(
> >> -					spt->vgpu, &e);
> >> +					spt->vgpu, &e, force);
> >>   			if (ret)
> >>   				goto fail;
> >>   			break;
> >> @@ -1046,7 +1064,7 @@ static int ppgtt_invalidate_spt(struct intel_vgp=
u_ppgtt_spt *spt)
> >>   	ppgtt_free_spt(spt);
> >>   	return 0;
> >>   fail:
> >> -	gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
> >> +	gvt_dbg_mm("fail: shadow page %p shadow entry 0x%llx type %d\n",
> >>   			spt, e.val64, e.type);
> >>   	return ret;
> >>   }
> >> @@ -1196,7 +1214,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu=
 *vgpu,
> >>   		ret =3D intel_gvt_hypervisor_dma_map_guest_page(vgpu,
> >>   				start_gfn + sub_index, PAGE_SIZE, &dma_addr);
> >>   		if (ret) {
> >> -			ppgtt_invalidate_spt(spt);
> >> +			ppgtt_invalidate_spt(spt, false);
> >>   			return ret;
> >>   		}
> >>   		sub_se.val64 =3D se->val64;
> >> @@ -1371,11 +1389,11 @@ static int ppgtt_handle_guest_entry_removal(st=
ruct intel_vgpu_ppgtt_spt *spt,
> >>   		struct intel_vgpu_ppgtt_spt *s =3D
> >>   			intel_vgpu_find_spt_by_mfn(vgpu, ops->get_pfn(se));
> >>   		if (!s) {
> >> -			gvt_vgpu_err("fail to find guest page\n");
> >> -			ret =3D -ENXIO;
> >> +			gvt_dbg_mm("fail to find guest page\n");
> >> +			ret =3D 0;
> >>   			goto fail;
> >>   		}
> >> -		ret =3D ppgtt_invalidate_spt(s);
> >> +		ret =3D ppgtt_invalidate_spt(s, false);
> >>   		if (ret)
> >>   			goto fail;
> >>   	} else {
> >> @@ -1387,7 +1405,7 @@ static int ppgtt_handle_guest_entry_removal(stru=
ct intel_vgpu_ppgtt_spt *spt,
> >>  =20
> >>   	return 0;
> >>   fail:
> >> -	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d\n",
> >> +	gvt_dbg_mm("fail: shadow page %p guest entry 0x%llx type %d\n",
> >>   			spt, se->val64, se->type);
> >>   	return ret;
> >>   }
> >> @@ -1422,7 +1440,7 @@ static int ppgtt_handle_guest_entry_add(struct i=
ntel_vgpu_ppgtt_spt *spt,
> >>   	}
> >>   	return 0;
> >>   fail:
> >> -	gvt_vgpu_err("fail: spt %p guest entry 0x%llx type %d\n",
> >> +	gvt_dbg_mm("fail: spt %p guest entry 0x%llx type %d\n",
> >>   		spt, we->val64, we->type);
> >>   	return ret;
> >>   }
> >> @@ -1653,7 +1671,7 @@ static int ppgtt_handle_guest_write_page_table(
> >>  =20
> >>   	return 0;
> >>   fail:
> >> -	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d.\n",
> >> +	gvt_dbg_mm("fail: shadow page %p guest entry 0x%llx type %d.\n",
> >>   			spt, we->val64, we->type);
> >>   	return ret;
> >>   }
> >> @@ -1798,7 +1816,7 @@ static void invalidate_ppgtt_mm(struct intel_vgp=
u_mm *mm)
> >>   		if (!ops->test_present(&se))
> >>   			continue;
> >>  =20
> >> -		ppgtt_invalidate_spt_by_shadow_entry(vgpu, &se);
> >> +		ppgtt_invalidate_spt_by_shadow_entry(vgpu, &se, false);
> >>   		se.val64 =3D 0;
> >>   		ppgtt_set_shadow_root_entry(mm, &se, index);
> >>  =20
> >> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt=
/gtt.h
> >> index a3b0f59ec8bd..8b02ff5d9651 100644
> >> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> >> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> >> @@ -263,6 +263,7 @@ struct intel_vgpu_ppgtt_spt {
> >>   	} guest_page;
> >>  =20
> >>   	DECLARE_BITMAP(post_shadow_bitmap, GTT_ENTRY_NUM_IN_ONE_PAGE);
> >> +	unsigned long fail_cnt;
> >>   	struct list_head post_shadow_list;
> >>   };
> >>  =20
> >> --=20
> >> 2.17.1
> >>
>=20

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYcAjMQAKCRCxBBozTXgY
J2BNAJ9kVswWYG+i9bWXY1cbgUZ7GLYFsQCcDNak5SAt5AZXa7oLy7Qz6g1MNxs=
=6B0d
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
