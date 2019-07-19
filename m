Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F16E3D2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2019 12:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562146E7F7;
	Fri, 19 Jul 2019 10:02:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9DD6E7F3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2019 10:02:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 03:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; 
 d="asc'?scan'208";a="176257422"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2019 03:02:39 -0700
Date: Fri, 19 Jul 2019 17:59:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Lu, Kechen" <kechen.lu@intel.com>
Subject: Re: [RFC PATCH v4 1/6] vfio: Define device specific irq type
 capability
Message-ID: <20190719095927.GG28809@zhen-hp.sh.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-2-kechen.lu@intel.com>
 <20190719060540.GC28809@zhen-hp.sh.intel.com>
 <31185F57AF7C4B4F87C41E735C23A6FE64DFC7@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <31185F57AF7C4B4F87C41E735C23A6FE64DFC7@shsmsx102.ccr.corp.intel.com>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang,
 Tina" <tina.zhang@intel.com>, Eric Auger <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: multipart/mixed; boundary="===============0798834580=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0798834580==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HKEL+t8MFpg/ASTE"
Content-Disposition: inline


--HKEL+t8MFpg/ASTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.19 09:02:33 +0000, Lu, Kechen wrote:
> Hi,
>=20
> > -----Original Message-----
> > From: Zhenyu Wang [mailto:zhenyuw@linux.intel.com]
> > Sent: Friday, July 19, 2019 2:06 PM
> > To: Lu, Kechen <kechen.lu@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org; kvm@vger.kernel.org; linux-=20
> > kernel@vger.kernel.org; Zhang, Tina <tina.zhang@intel.com>;=20
> > kraxel@redhat.com; zhenyuw@linux.intel.com; Lv, Zhiyuan=20
> > <zhiyuan.lv@intel.com>; Wang, Zhi A <zhi.a.wang@intel.com>; Tian,=20
> > Kevin <kevin.tian@intel.com>; Yuan, Hang <hang.yuan@intel.com>;=20
> > alex.williamson@redhat.com; Eric Auger <eric.auger@redhat.com>
> > Subject: Re: [RFC PATCH v4 1/6] vfio: Define device specific irq type=
=20
> > capability
> >=20
> > On 2019.07.18 23:56:35 +0800, Kechen Lu wrote:
> > > From: Tina Zhang <tina.zhang@intel.com>
> > >
> > > Cap the number of irqs with fixed indexes and use capability chains=
=20
> > > to chain device specific irqs.
> > >
> > > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > ---
> > >  include/uapi/linux/vfio.h | 19 ++++++++++++++++++-
> > >  1 file changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h=20
> > > index 8f10748dac79..be6adab4f759 100644
> > > --- a/include/uapi/linux/vfio.h
> > > +++ b/include/uapi/linux/vfio.h
> > > @@ -448,11 +448,27 @@ struct vfio_irq_info {
> > >  #define VFIO_IRQ_INFO_MASKABLE		(1 << 1)
> > >  #define VFIO_IRQ_INFO_AUTOMASKED	(1 << 2)
> > >  #define VFIO_IRQ_INFO_NORESIZE		(1 << 3)
> > > +#define VFIO_IRQ_INFO_FLAG_CAPS		(1 << 4) /* Info supports caps
> > */
> > >  	__u32	index;		/* IRQ index */
> > >  	__u32	count;		/* Number of IRQs within this index */
> > > +	__u32	cap_offset;	/* Offset within info struct of first cap */
> >=20
> > This still breaks ABI as argsz would be updated with this new field,=20
> > so it would cause compat issue. I think my last suggestion was to=20
> > assume cap list starts after vfio_irq_info.
> >
> =20
> In the common practice, the general logic is first use the "count" as the=
 "minsz" boundary to perform copy from user, and then perform following log=
ic, so that the incompatibility issue would not happen. BTW, this patch has=
 been double checked by Eric Auger before included in his patch-set.=20
>=20

yeah, sorry I was thinking vfio might fail in that case but it seems
current code assume argsz should be larger than minsz for count here,
so that's fine.

>=20
> > >  };
> > >  #define VFIO_DEVICE_GET_IRQ_INFO	_IO(VFIO_TYPE, VFIO_BASE + 9)
> > >
> > > +/*
> > > + * The irq type capability allows irqs unique to a specific device=
=20
> > > +or
> > > + * class of devices to be exposed.
> > > + *
> > > + * The structures below define version 1 of this capability.
> > > + */
> > > +#define VFIO_IRQ_INFO_CAP_TYPE      3
> > > +
> > > +struct vfio_irq_info_cap_type {
> > > +	struct vfio_info_cap_header header;
> > > +	__u32 type;     /* global per bus driver */
> > > +	__u32 subtype;  /* type specific */ };
> > > +
> > >  /**
> > >   * VFIO_DEVICE_SET_IRQS - _IOW(VFIO_TYPE, VFIO_BASE + 10, struct
> > vfio_irq_set)
> > >   *
> > > @@ -554,7 +570,8 @@ enum {
> > >  	VFIO_PCI_MSIX_IRQ_INDEX,
> > >  	VFIO_PCI_ERR_IRQ_INDEX,
> > >  	VFIO_PCI_REQ_IRQ_INDEX,
> > > -	VFIO_PCI_NUM_IRQS
> > > +	VFIO_PCI_NUM_IRQS =3D 5	/* Fixed user ABI, IRQ indexes >=3D5 use
> > */
> > > +				/* device specific cap to define content */
> > >  };
> > >
> > >  /*
> > > --
> > > 2.17.1
> > >
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--HKEL+t8MFpg/ASTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXTGUfwAKCRCxBBozTXgY
J/UoAJ44zsldWP7UQPboscULWpi5vt3WswCePRPUL9w/jjULfR02ApGsutPBcso=
=0x0A
-----END PGP SIGNATURE-----

--HKEL+t8MFpg/ASTE--

--===============0798834580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0798834580==--
