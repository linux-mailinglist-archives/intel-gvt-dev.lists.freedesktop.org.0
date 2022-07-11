Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF156D351
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Jul 2022 05:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E198BA83;
	Mon, 11 Jul 2022 03:21:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3595C8BA86;
 Mon, 11 Jul 2022 03:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657509696; x=1689045696;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=2qp4YipWUX/C4jVXBnzl+RaM7ZAO0S2pUK4iM5GtZHM=;
 b=AYaUV2q4WRjsfcUftPmzR2JRFJWpYVA80YEZfD3clr3xZHHhnq+tGE6a
 tbQnbFTmHJ2+4bFzz9FgowNjrQbsLHgRtnGlVsLyK0u7/PWN7EXbnAIbo
 bgvWb1wtgCLlm6syK/iqLf90ogRCwx5vLB7n+0xou0PwYDAuldcZM7JI2
 CdnPRVRRzEO1MRH0cTTbsnTAHHH8Ze1sNjKaPtGbXbTGr5hRp6kBhWFU/
 3MJjxekDKl0X/KrZpgwpLDrh9NVWHT4b+X0Wb/b+eEL6FtNXMUBuoVQ0x
 UawaqZDD7WYVNHOUeC6gAdwrFF8ga9ZstPRtEM8B+wPN+IegCEU91gr2f Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="310167898"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="310167898"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2022 20:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="652287059"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2022 20:21:32 -0700
Date: Mon, 11 Jul 2022 10:58:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: IS_ERR() vs NULL bug in
 intel_gvt_update_reg_whitelist()
Message-ID: <20220711025808.GQ1089@zhen-hp.sh.intel.com>
References: <Ysftoia2BPUyqVcD@kili>
 <01c7440e-8198-878c-cfb6-b54468b1dca5@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="EDT6MSV0B3GxyNyZ"
Content-Disposition: inline
In-Reply-To: <01c7440e-8198-878c-cfb6-b54468b1dca5@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--EDT6MSV0B3GxyNyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.08 10:55:52 +0200, Andrzej Hajda wrote:
> On 08.07.2022 10:41, Dan Carpenter wrote:
> > The shmem_pin_map() function returns NULL, it doesn't return error
> > pointers.
> >=20
> > Fixes: 97ea656521c8 ("drm/i915/gvt: Parse default state to update reg w=
hitelist")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks! Will push to -fixes.

>=20
> > ---
> >   drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i9=
15/gvt/cmd_parser.c
> > index b9eb75a2b400..1c35a41620ae 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -3117,9 +3117,9 @@ void intel_gvt_update_reg_whitelist(struct intel_=
vgpu *vgpu)
> >   			continue;
> >   		vaddr =3D shmem_pin_map(engine->default_state);
> > -		if (IS_ERR(vaddr)) {
> > -			gvt_err("failed to map %s->default state, err:%zd\n",
> > -				engine->name, PTR_ERR(vaddr));
> > +		if (!vaddr) {
> > +			gvt_err("failed to map %s->default state\n",
> > +				engine->name);
> >   			return;
> >   		}
>=20

--EDT6MSV0B3GxyNyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsuRtgAKCRCxBBozTXgY
J5q6AJ9VkM3j3Eu+FNObxEPkc6ZadRVuRACgkMngUibSKyZb9TIVSM9YGpiNsqg=
=CzlW
-----END PGP SIGNATURE-----

--EDT6MSV0B3GxyNyZ--
