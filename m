Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD0D685B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Oct 2019 19:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679D6E575;
	Mon, 14 Oct 2019 17:23:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856DF6E575;
 Mon, 14 Oct 2019 17:23:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so20597545wrv.13;
 Mon, 14 Oct 2019 10:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EGGdaz7JChYl4JPWAU70Za+RRAZ6S/LKBm6uuB4+/Xc=;
 b=CdaAu9lopaNSMPiIgUlg3MBaaa6nXDxNKcFBvV3bDWP1pA4di5/sLuQjVSEzVkUB25
 TL4xI2Sg7LdpxoORxGHC4yY5TKwhoR8Pqf1/Nlan9/cLVjpUA0UGKQGmfQaYC0LL0A5d
 qzvbCIzrHaydN7REe+86/CoRVgQ648qL4B7vlcmWAgTI37mRGPsIlpO0+U134NbKJin2
 maK6SOZtK16rF165LVX+xk7N3ztM6ER8pdKt2nmI8qB+GX6QtOUGzrp8pKcUKEpbzhty
 bhD9iToccKpI3D/oyOwRs/WXI2hLYiHXVYk8dz/CIYLtXFTBrUEvoRn9mE26VIQFIHqm
 f15Q==
X-Gm-Message-State: APjAAAVTNIYXeu1bBgxftHFPEEP857o6E7y3F/cSOpwoUbm8fvt4Ck3j
 nCM+bE1RQBnPfMDo/d38s4Q=
X-Google-Smtp-Source: APXvYqwzHqNY1eXa8Wf7T+/uPb0SEQxKfUwA6RcA+GYW/wDuACvWvp5czJ0hnFuczXqrqbCUluKYlA==
X-Received: by 2002:adf:e403:: with SMTP id g3mr24811494wrm.294.1571073784104; 
 Mon, 14 Oct 2019 10:23:04 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u11sm17480327wmd.32.2019.10.14.10.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:23:02 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:23:01 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 5/7] mdev: introduce virtio device and its device ops
Message-ID: <20191014172301.GA5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-6-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-6-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EGGdaz7JChYl4JPWAU70Za+RRAZ6S/LKBm6uuB4+/Xc=;
 b=RRPJF2yb4XFeB7uEMgAAHug959rwOOi8I/aMvVs+16qpBMg/xi88CdeE9Z0H9RouJ+
 fuML1Z9e9rjBfDAPLO3vADPa3LKcP9qnEf/xpsiWQnNh+luQFiGV3tK5aWSEkUPYzdfA
 KpZpZ+iy0Yoy/NcKo/yZtrnc6V+97GtwBpJroCZjdetayH+gySMvQCYQhbhgEwH6uh48
 WPbN59RIfr0Ttxd+BL05PY62ls2843A5TDjRJu5P2+VWH3gHHPu5bJlTNgtK5BrOavSZ
 bJycA88kKLnGA677mFQ8W/bpEIMLoXR5m1yU1geUzd8TFe+sPFHy6SrFhwmpW0BGfxq4
 DNXg==
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
Content-Type: multipart/mixed; boundary="===============0187130320=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0187130320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2019 at 04:15:55PM +0800, Jason Wang wrote:
> + * @set_vq_cb:			Set the interrut calback function for

s/interrut/interrupt/

s/calback/callback/

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2krvUACgkQnKSrs4Gr
c8hIpQgArOf5wNMCOOx9mrAoFEfDyFDnQGYWa6Ce2/25rBYZVN1BIaLrZLwRk4Za
aM65SiUsAMIh+UTdezqEPyUZCoRZbcxFRWUtyQZqHLCVg3yrwM++9xtTFclrIY0p
hP+v2ZVAMUT/1BQiaAo3+qlItEYbUDwtSl+wsSwzlvu9nFRlHjjdbUZAJmU78zv0
Y50LNaXQf3+E9GqPDj6nJEUSxpww44C1FOgxh9SErmqG8j7ReyAfng0loRKNdZbv
6g7U1I0J+vNgzcCxTSipVRS8EH0bOEY07w3OggpIoIRnOx6voaXYz8SMEQZ8tiRu
k0SSOtAyZ48s1BaOt3vREX8uYFlt0A==
=/ZZN
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--===============0187130320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0187130320==--
