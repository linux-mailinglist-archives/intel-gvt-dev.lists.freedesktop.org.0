Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A217C4906
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Oct 2023 07:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20E910E2DF;
	Wed, 11 Oct 2023 05:10:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2B10E2DF;
 Wed, 11 Oct 2023 05:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697001012; x=1728537012;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=LmO749l49kGwiodjcLNRqxy+iBgNThipNfwI5s9+TVE=;
 b=kUAOEbo7XPMzY4718OWXfSRXJBCgIzIPcir93r+BWI2+1Xodcw638YaN
 IlXEgMcWBfuNaixDsZnZYUDF18deT00+g6lj2R9D8O3lTzvSCRcS/XpaA
 jYJHgsFpl7RRpkBlTqCRamrkM31Ht0GzOozYWvaWO3dyuzZgS0fwlkrYX
 3PZX6Bda7jcNviZqfl6wsXbb/D92kAyiKCDrKwFg9X61tExONH5/UWhoe
 aNojxC6g6fyx633CSB4XIXyeQCAhUqkTkn4EKuVZXKie4yzFJEIvqhpR/
 qk4c7GKqJ4mCWKIAx9q6C+1hbWIDtUQZUPTKXktE6GQvAq2jW9LyHTgSq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="451072444"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
 d="asc'?scan'208";a="451072444"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 22:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="783116901"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
 d="asc'?scan'208";a="783116901"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orsmga008.jf.intel.com with ESMTP; 10 Oct 2023 22:10:09 -0700
Date: Wed, 11 Oct 2023 13:07:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
Message-ID: <ZSYtkk0EldETrP8l@debian-scheme>
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="CKct9XpGQfK2jEzi"
Content-Disposition: inline
In-Reply-To: <871qeafszw.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--CKct9XpGQfK2jEzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.10.04 15:54:11 +0300, Jani Nikula wrote:
> On Tue, 26 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > gvt.h has no need to include i915_drv.h once the unused to_gvt() has
> > been removed.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> Zhenyu, Zhi, ping?
>=20

Sorry for late reply, as last week was full holiday here.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

I don't think I need to do extra pick and pull request for this or
let me know if you has question.

Thanks!

>=20
>=20
>=20
> > ---
> >  drivers/gpu/drm/i915/gvt/gvt.h | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/=
gvt.h
> > index 53a0a42a50db..3a0624fe63bf 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -39,7 +39,7 @@
> > =20
> >  #include <asm/kvm_page_track.h>
> > =20
> > -#include "i915_drv.h"
> > +#include "gt/intel_gt.h"
> >  #include "intel_gvt.h"
> > =20
> >  #include "debug.h"
> > @@ -368,11 +368,6 @@ struct intel_gvt {
> >  	struct dentry *debugfs_root;
> >  };
> > =20
> > -static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
> > -{
> > -	return i915->gvt;
> > -}
> > -
> >  enum {
> >  	/* Scheduling trigger by timer */
> >  	INTEL_GVT_REQUEST_SCHED =3D 0,
>=20
> --=20
> Jani Nikula, Intel

--CKct9XpGQfK2jEzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZSYtjgAKCRCxBBozTXgY
J+UFAKCZV2TC1Z7IOAjpYzz3nDekzZ4LsACgmqy6MfKf10SEe72vCHe8QCcYbns=
=gs/I
-----END PGP SIGNATURE-----

--CKct9XpGQfK2jEzi--
