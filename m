Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598BA1AF1F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 May 2019 05:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0F88934B;
	Mon, 13 May 2019 03:30:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12115892E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 May 2019 03:29:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 May 2019 20:29:59 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 12 May 2019 20:29:56 -0700
Date: Mon, 13 May 2019 11:29:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 2/3] drm/i915/gvt: Introduce enable_direct_flip
 attribute
Message-ID: <20190513032914.GZ12913@zhen-hp.sh.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <1557461728-2831-3-git-send-email-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1557461728-2831-3-git-send-email-tina.zhang@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 ville.syrjala@linux.intel.com, kraxel@redhat.com, daniel@ffwll.ch,
 kalyan.kondapally@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, zhiyuan.lv@intel.com
Content-Type: multipart/mixed; boundary="===============0758025652=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0758025652==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/qX1VF4Euib7a2dq"
Content-Disposition: inline


--/qX1VF4Euib7a2dq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.10 12:15:27 +0800, Tina Zhang wrote:
> This attribute is introduced to work as a switch of the gvt-g vGPU direct
> flip function. Userspace can simply switch on/off the direct flip
> function by echoing 1/0 to this attributte.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---

I do not think this is appropriate interface which doesn't align with
vGPU lifecycle and also doesn't work together with control state of vfio
gfx ioctl. Why this?

>  drivers/gpu/drm/i915/gvt/kvmgt.c | 38 ++++++++++++++++++++++++++++++++++=
++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index a68addf..2911818 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1581,12 +1581,50 @@ hw_id_show(struct device *dev, struct device_attr=
ibute *attr,
>  	return sprintf(buf, "\n");
>  }
> =20
> +static ssize_t
> +enable_direct_flip_show(struct device *dev, struct device_attribute *att=
r,
> +	 char *buf)
> +{
> +	struct mdev_device *mdev =3D mdev_from_dev(dev);
> +
> +	if (mdev) {
> +		struct intel_vgpu *vgpu =3D (struct intel_vgpu *)
> +			mdev_get_drvdata(mdev);
> +		return sprintf(buf, "%u\n",
> +			       vgpu->display.shadow_fbs.enable_direct_flip);
> +	}
> +	return sprintf(buf, "\n");
> +}
> +
> +static ssize_t
> +enable_direct_flip_store(struct device *dev, struct device_attribute *at=
tr,
> +			     const char *buf, size_t n)
> +{
> +	struct mdev_device *mdev =3D mdev_from_dev(dev);
> +	ssize_t ret;
> +	u32 val;
> +
> +	ret =3D kstrtou32(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (mdev) {
> +		struct intel_vgpu *vgpu =3D (struct intel_vgpu *)
> +			mdev_get_drvdata(mdev);
> +		vgpu->display.shadow_fbs.enable_direct_flip =3D !!val;
> +	}
> +
> +	return n;
> +}
> +
>  static DEVICE_ATTR_RO(vgpu_id);
>  static DEVICE_ATTR_RO(hw_id);
> +static DEVICE_ATTR_RW(enable_direct_flip);
> =20
>  static struct attribute *intel_vgpu_attrs[] =3D {
>  	&dev_attr_vgpu_id.attr,
>  	&dev_attr_hw_id.attr,
> +	&dev_attr_enable_direct_flip.attr,
>  	NULL
>  };
> =20
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--/qX1VF4Euib7a2dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNjkigAKCRCxBBozTXgY
J+EuAJ0UCxi0ZH8qjOb8lG3XG/CSFHIFhACeI7CvfRAQjHI6BxCs0mkxShhOU14=
=0kES
-----END PGP SIGNATURE-----

--/qX1VF4Euib7a2dq--

--===============0758025652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0758025652==--
