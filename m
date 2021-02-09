Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CB314586
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Feb 2021 02:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B4B6E2C8;
	Tue,  9 Feb 2021 01:20:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F3E6E28B;
 Tue,  9 Feb 2021 01:20:49 +0000 (UTC)
IronPort-SDR: iBWQf/57CHNWblLEymLUUsYeKj0jWQTJjJWVrEg/LGwf4Eosvs3XuXeGycaGVm6d3Fw6xADoIf
 EdDuRuASLoCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243307902"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; 
 d="asc'?scan'208";a="243307902"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 17:20:49 -0800
IronPort-SDR: xHgTaQxoX3hCq9xhgAsysDhisuAhKaBA0Jq/xrwpGKbGduBZuWoqTnJEx4QhkcIBxTPSeAHYZu
 Q8rbY5SyZ7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; 
 d="asc'?scan'208";a="395838055"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 08 Feb 2021 17:20:47 -0800
Date: Tue, 9 Feb 2021 09:05:21 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [FYI PATCH] i915: kvmgt: the KVM mmu_lock is now an rwlock
Message-ID: <20210209010521.GB2043@zhen-hp.sh.intel.com>
References: <20210208113437.94661-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210208113437.94661-1-pbonzini@redhat.com>
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1103228175=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1103228175==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.02.08 06:34:37 -0500, Paolo Bonzini wrote:
> Adjust the KVMGT page tracking callbacks.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Thanks for that!

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/kvmgt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 60f1a386dd06..b4348256ae95 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1703,7 +1703,7 @@ static int kvmgt_page_track_add(unsigned long handl=
e, u64 gfn)
>  		return -EINVAL;
>  	}
> =20
> -	spin_lock(&kvm->mmu_lock);
> +	write_lock(&kvm->mmu_lock);
> =20
>  	if (kvmgt_gfn_is_write_protected(info, gfn))
>  		goto out;
> @@ -1712,7 +1712,7 @@ static int kvmgt_page_track_add(unsigned long handl=
e, u64 gfn)
>  	kvmgt_protect_table_add(info, gfn);
> =20
>  out:
> -	spin_unlock(&kvm->mmu_lock);
> +	write_unlock(&kvm->mmu_lock);
>  	srcu_read_unlock(&kvm->srcu, idx);
>  	return 0;
>  }
> @@ -1737,7 +1737,7 @@ static int kvmgt_page_track_remove(unsigned long ha=
ndle, u64 gfn)
>  		return -EINVAL;
>  	}
> =20
> -	spin_lock(&kvm->mmu_lock);
> +	write_lock(&kvm->mmu_lock);
> =20
>  	if (!kvmgt_gfn_is_write_protected(info, gfn))
>  		goto out;
> @@ -1746,7 +1746,7 @@ static int kvmgt_page_track_remove(unsigned long ha=
ndle, u64 gfn)
>  	kvmgt_protect_table_del(info, gfn);
> =20
>  out:
> -	spin_unlock(&kvm->mmu_lock);
> +	write_unlock(&kvm->mmu_lock);
>  	srcu_read_unlock(&kvm->srcu, idx);
>  	return 0;
>  }
> @@ -1772,7 +1772,7 @@ static void kvmgt_page_track_flush_slot(struct kvm =
*kvm,
>  	struct kvmgt_guest_info *info =3D container_of(node,
>  					struct kvmgt_guest_info, track_node);
> =20
> -	spin_lock(&kvm->mmu_lock);
> +	write_lock(&kvm->mmu_lock);
>  	for (i =3D 0; i < slot->npages; i++) {
>  		gfn =3D slot->base_gfn + i;
>  		if (kvmgt_gfn_is_write_protected(info, gfn)) {
> @@ -1781,7 +1781,7 @@ static void kvmgt_page_track_flush_slot(struct kvm =
*kvm,
>  			kvmgt_protect_table_del(info, gfn);
>  		}
>  	}
> -	spin_unlock(&kvm->mmu_lock);
> +	write_unlock(&kvm->mmu_lock);
>  }
> =20
>  static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
> --=20
> 2.26.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYCHfzAAKCRCxBBozTXgY
J3n+AJ9Pj+bM0fB2Uxzudpl3pyOKSapIIACfYnReH8KZw6239q6rLyJ7h+Qan8Q=
=JC7t
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--

--===============1103228175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1103228175==--
