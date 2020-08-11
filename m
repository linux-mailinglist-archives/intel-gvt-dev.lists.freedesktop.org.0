Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EAC24189B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 10:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35289CF5;
	Tue, 11 Aug 2020 08:57:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1829C89B96;
 Tue, 11 Aug 2020 08:57:21 +0000 (UTC)
IronPort-SDR: KRhEesK2wzOZRyMFbHg48jUEnpPElz8cWe0TWJ2FVr7qeMb8cYgeUgmVy+wRIpdn+w1whcGomi
 4EAEF4pfpzig==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="218030519"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; 
 d="asc'?scan'208";a="218030519"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 01:57:20 -0700
IronPort-SDR: 6w6pEaNMHsf3yFldUzEZW7pA/PGPHU3iNV03jY5lWj7tErsW5U82MaqytpMB0xbzib4Zfiv61T
 11w2wjZrKpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; 
 d="asc'?scan'208";a="494611047"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 01:57:18 -0700
Date: Tue, 11 Aug 2020 16:39:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt:fix raw-wakeref not held
 calltrace in vGPU
Message-ID: <20200811083909.GM27035@zhen-hp.sh.intel.com>
References: <20200811030209.21058-1-yan.y.zhao@intel.com>
 <159713437103.2955.4439985576665396417@build.alporthouse.com>
MIME-Version: 1.0
In-Reply-To: <159713437103.2955.4439985576665396417@build.alporthouse.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 jani.nikula@linux.intel.com
Content-Type: multipart/mixed; boundary="===============2046057649=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2046057649==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="APsrsY0yTFDXy1q8"
Content-Disposition: inline


--APsrsY0yTFDXy1q8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.08.11 09:26:11 +0100, Chris Wilson wrote:
> Quoting Yan Zhao (2020-08-11 04:02:09)
> > UNCORE_HAS_FORCEWAKE is not turned on when intel_vgpu_active() returns
> > true, so the guest mmio writes go to gen2_write32().
>=20
> The vgpu writes are just memory traps, the device wakeref should not be
> required. It seems like we've accidentally added the assert to the wrong
> io accessors.

yeah, I agree. I did remember we didn't have that assert before for
vgpu case... maybe better hook with explicit vgpu_read()/vgpu_write()
that won't be affected by other changes.

--APsrsY0yTFDXy1q8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXzJZLQAKCRCxBBozTXgY
J1h0AJ9/XbyF3jeaoSuF1hm+FEEWH7I1OgCfQAOIVos3VAmLu4wrgp7BwMAP314=
=y+Gq
-----END PGP SIGNATURE-----

--APsrsY0yTFDXy1q8--

--===============2046057649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2046057649==--
