Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F648D78C9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Oct 2019 16:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C5D6E826;
	Tue, 15 Oct 2019 14:37:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56D36E826;
 Tue, 15 Oct 2019 14:37:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j18so24169523wrq.10;
 Tue, 15 Oct 2019 07:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=neBsjR3UuUvIqjWSRW2rTQl/yD7xf9xUmzZJeouSucY=;
 b=ibHSF06CcCsIZomQ1iCRMbnAQ0Lw40rRy6YwacpAFQQ97NdXNgrKEcBfiD5f9Wef1X
 0xaK//4azH/iWfpUGeOBOmkCIn/AQKCnEWmsnwlTeKACQrCKLJdUWFus7lfL+ge6F/eF
 2asTRrIdrTrQH1mG6b/nQ3SsDCLd3y6CH21M0QCHfFHofcEkcdt7E7CtoxQC3ROG1WI/
 0xF3q9nybi+OZ/DDjHGq5dKgSGmD3zwAtF8CrjbkibasMRPRDsuzpmiLIkdRHKXAJ/hS
 yFMTU4MlKlAZATMX55FEKFiPsll2KEIvNKlH+fG3ocNZ4mUkiiNyHL0muBgQkyBNxwFC
 eb4Q==
X-Gm-Message-State: APjAAAXOKa9qXCUc52uxeatRqDy1hNa6q9X6VMm3AbSnXrbeYCRfB20t
 y/tcXA9iyt2jd1jIwtDM2OK219YUoBkPFA==
X-Google-Smtp-Source: APXvYqzV3/RVLumtjzKMF39X/kb+3GTjFjA6Zi36mjTbF3VD42lPRp342ZlZGPdL0S+AnrxMQCU2bw==
X-Received: by 2002:a5d:674e:: with SMTP id l14mr29799012wrw.45.1571150243309; 
 Tue, 15 Oct 2019 07:37:23 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id r20sm29954681wrg.61.2019.10.15.07.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:37:22 -0700 (PDT)
Date: Tue, 15 Oct 2019 15:37:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
Message-ID: <20191015143720.GA13108@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191014174946.GC5359@stefanha-x1.localdomain>
 <6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=neBsjR3UuUvIqjWSRW2rTQl/yD7xf9xUmzZJeouSucY=;
 b=Ha/JGsd50SAmjoukDYzVJ+uuPpyS6R2PO/eaw9gkiIRIoM/HGQIlw9cEAjxcehLXgX
 xtPrKatNFAft1UWxIzn3Defz+Km3jvCRPXTsAq9Pq3ufY6HVgJoOWyGxGPfjPvEdYCas
 nmFfVEj8/OM25w2meSCjx2zxPPI1LmHgXKvgVJTMlwuYyyzncaqGB6hSe47Jkm2BmDdE
 7Q1oVk61trb1ophCLz3TyIvG+5B4wxLnGIWfh8XXAXF2YWMuNcBZpEq+5iu4OQD/KM2o
 pmgr9RP7X7EJ6h82CRMMDcjBoylZdxySRDcK25cQYOVMInHl93hoNZ/0PIMDNaEQWzXg
 37Ig==
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: multipart/mixed; boundary="===============1074494851=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1074494851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 11:37:17AM +0800, Jason Wang wrote:
>=20
> On 2019/10/15 =E4=B8=8A=E5=8D=881:49, Stefan Hajnoczi wrote:
> > On Fri, Oct 11, 2019 at 04:15:50PM +0800, Jason Wang wrote:
> > > There are hardware that can do virtio datapath offloading while having
> > > its own control path. This path tries to implement a mdev based
> > > unified API to support using kernel virtio driver to drive those
> > > devices. This is done by introducing a new mdev transport for virtio
> > > (virtio_mdev) and register itself as a new kind of mdev driver. Then
> > > it provides a unified way for kernel virtio driver to talk with mdev
> > > device implementation.
> > >=20
> > > Though the series only contains kernel driver support, the goal is to
> > > make the transport generic enough to support userspace drivers. This
> > > means vhost-mdev[1] could be built on top as well by resuing the
> > > transport.
> > >=20
> > > A sample driver is also implemented which simulate a virito-net
> > > loopback ethernet device on top of vringh + workqueue. This could be
> > > used as a reference implementation for real hardware driver.
> > >=20
> > > Consider mdev framework only support VFIO device and driver right now,
> > > this series also extend it to support other types. This is done
> > > through introducing class id to the device and pairing it with
> > > id_talbe claimed by the driver. On top, this seris also decouple
> > > device specific parents ops out of the common ones.
> > I was curious so I took a quick look and posted comments.
> >=20
> > I guess this driver runs inside the guest since it registers virtio
> > devices?
>=20
>=20
> It could run in either guest or host. But the main focus is to run in the
> host then we can use virtio drivers in containers.
>=20
>=20
> >=20
> > If this is used with physical PCI devices that support datapath
> > offloading then how are physical devices presented to the guest without
> > SR-IOV?
>=20
>=20
> We will do control path meditation through vhost-mdev[1] and vhost-vfio[2=
].
> Then we will present a full virtio compatible ethernet device for guest.
>=20
> SR-IOV is not a must, any mdev device that implements the API defined in
> patch 5 can be used by this framework.

What I'm trying to understand is: if you want to present a virtio-pci
device to the guest (e.g. using vhost-mdev or vhost-vfio), then how is
that related to this patch series?

Does this mean this patch series is useful mostly for presenting virtio
devices to containers or the host?

Stefan

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2l2aAACgkQnKSrs4Gr
c8ji7wf9FHyYry8VO4FqVBdQWMz/h/mmNTgeyBCpCasw+joJ3LRHOyyGPsu2BiOX
IhAuZvK3azvtP7vh1etYaoBrCPmyFBTh2UXsIYoGK1qpUzPNkB7nuGYTBPJgZbxd
jmJNDjc9wrrn9sWBJjkJaFYSjEDfob63FtUG2VM6f109LXI4bTyt03KqS1tZ75Hi
SSjVt95GYQ1xENjKUcVqV9ULwfsv0Wz/WQ2XIvn8Oij7NK9bKHWl3HLirrUE62FP
y6/3Y2fKKhes58jmY09L37Ym625X95M//6g2WYv+uR5rTTfo7jQBlLZ1tklwNY/k
X8Sw0iHJKxZjvZqItbu49kJtRJwm9g==
=nOrh
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

--===============1074494851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1074494851==--
