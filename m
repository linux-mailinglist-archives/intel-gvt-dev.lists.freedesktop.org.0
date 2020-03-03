Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827B176F1B
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Mar 2020 07:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11CC89EAC;
	Tue,  3 Mar 2020 06:06:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2279789EAC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Mar 2020 06:06:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 22:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,510,1574150400"; 
 d="asc'?scan'208";a="412626558"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 02 Mar 2020 22:06:22 -0800
Date: Tue, 3 Mar 2020 13:54:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix unnecessary schedule timer when no
 vGPU exits
Message-ID: <20200303055412.GB28483@zhen-hp.sh.intel.com>
References: <20200229055445.31481-1-zhenyuw@linux.intel.com>
 <5e6958d6-4850-e167-348c-fa718938f4f5@intel.com>
MIME-Version: 1.0
In-Reply-To: <5e6958d6-4850-e167-348c-fa718938f4f5@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1362910135=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1362910135==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.03 12:45:01 +0800, Colin Xu wrote:
> Yes vgpu_lock is acquired after gvt->lock and vgpu_idr is in gvt domain so
> removing
>=20
> it doesn't need vgpu_lock but need gvt->lock. And remove idr first can
> guarantee
>=20
> that when vgpu destroy is on-going, other vgpu acquiring can exit asap so
> that no
>=20
> race-condition with the cleanup tasks.
>=20
> Thanks a lot for the fix!
>=20
> Acked-by: Colin Xu <colin.xu@intel.com>

Thanks for the review! Rebase onto -fixes for 5.6.

=46rom 777b1fe76c04302cb0ef996c3f92aab5a99a840b Mon Sep 17 00:00:00 2001
=46rom: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Sat, 29 Feb 2020 13:54:45 +0800
Subject: [PATCH] drm/i915/gvt: Fix unnecessary schedule timer when no vGPU
 exits

=46rom commit f25a49ab8ab9 ("drm/i915/gvt: Use vgpu_lock to protect per
vgpu access") the vgpu idr destroy is moved later than vgpu resource
destroy, then it would fail to stop timer for schedule policy clean
which to check vgpu idr for any left vGPU. So this trys to destroy
vgpu idr earlier.

Cc: Colin Xu <colin.xu@intel.com>
Fixes: f25a49ab8ab9 ("drm/i915/gvt: Use vgpu_lock to protect per vgpu acces=
s")
Acked-by: Colin Xu <colin.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgp=
u.c
index 487af6ea9972..345c2aa3b491 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -272,10 +272,17 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 {
 	struct intel_gvt *gvt =3D vgpu->gvt;
=20
-	mutex_lock(&vgpu->vgpu_lock);
-
 	WARN(vgpu->active, "vGPU is still active!\n");
=20
+	/*
+	 * remove idr first so later clean can judge if need to stop
+	 * service if no active vgpu.
+	 */
+	mutex_lock(&gvt->lock);
+	idr_remove(&gvt->vgpu_idr, vgpu->id);
+	mutex_unlock(&gvt->lock);
+
+	mutex_lock(&vgpu->vgpu_lock);
 	intel_gvt_debugfs_remove_vgpu(vgpu);
 	intel_vgpu_clean_sched_policy(vgpu);
 	intel_vgpu_clean_submission(vgpu);
@@ -290,7 +297,6 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 	mutex_unlock(&vgpu->vgpu_lock);
=20
 	mutex_lock(&gvt->lock);
-	idr_remove(&gvt->vgpu_idr, vgpu->id);
 	if (idr_is_empty(&gvt->vgpu_idr))
 		intel_gvt_clean_irq(gvt);
 	intel_gvt_update_vgpu_types(gvt);
--=20
2.25.0.rc2


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXl3xBAAKCRCxBBozTXgY
J4vLAJ4y+ab4DjopiVkoejSLiiTx6EqhqACfdijNdJh9MP/4kYCpfnXEWtn+ZVg=
=XEgl
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============1362910135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1362910135==--
