Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E87C4D82
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Oct 2023 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BC510E4CD;
	Wed, 11 Oct 2023 08:47:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2616910E5D1;
 Wed, 11 Oct 2023 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697014059; x=1728550059;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=eeweJrwy0aFxPV2tn4A0Z71vQVtpkZjZz4OiMG0AF7E=;
 b=U8v9/Mdl7D+zfPsvl3iug5DCxsrnvbkKB8RSqUJLt+SihC9H4rESH98E
 Y3CONFiaRO8niK+htWsn9miXFhkZx6+D7uBWuPN7qthS/5ZIIc1YuQwqm
 Qk/5qhut/YGeZVmI5gocBwZO0tMR39z9+KYHBEyn+ewm5ga+ujTrGBpfz
 I5dBfCwTRzQ72ez96rN7oE6kxNpyXhw1qyopD/0w383dchxRePE1TpXIV
 R3+TjlkrzqzeoKVMfvVRE7qRjQiVUnLP+QmJV2REXwuNvL7ptMBGAB1QG
 WWkT5WtdPOMxVoPScAu8VSKZBpmHota+w2HYYVzb6U+razNf/wVj19/XO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="388482723"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
 d="asc'?scan'208";a="388482723"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 01:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="870065564"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
 d="asc'?scan'208";a="870065564"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 01:47:37 -0700
Date: Wed, 11 Oct 2023 16:44:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
Message-ID: <ZSZgisH1n0L0jwoq@debian-scheme>
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com> <ZSYtkk0EldETrP8l@debian-scheme>
 <878r8963o6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="FG8EbypCkbhUzYvx"
Content-Disposition: inline
In-Reply-To: <878r8963o6.fsf@intel.com>
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
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--FG8EbypCkbhUzYvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.10.11 10:04:09 +0300, Jani Nikula wrote:
> On Wed, 11 Oct 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> > On 2023.10.04 15:54:11 +0300, Jani Nikula wrote:
> >> On Tue, 26 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> >> > gvt.h has no need to include i915_drv.h once the unused to_gvt() has
> >> > been removed.
> >> >
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>=20
> >> Zhenyu, Zhi, ping?
> >>=20
> >
> > Sorry for late reply, as last week was full holiday here.
> >
> > Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> >
> > I don't think I need to do extra pick and pull request for this or
> > let me know if you has question.
>=20
> Did you pick them up to gvt-next or shall I pick them up to
> drm-intel-next?
>=20
> If the former, I think I'd actually like a pull request, because
> otherwise the trees will be out-of-sync for a long time.
>=20

Sorry, I mean it's fine for me if you directly pick them for drm-intel-next.

thanks

--FG8EbypCkbhUzYvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZSZghgAKCRCxBBozTXgY
J+ekAJ0X8oqMUYaIb2rC7nQmOHMnYUe8WgCdHgQBizyVbFVpNOoxiAY6G638CXQ=
=s3Gd
-----END PGP SIGNATURE-----

--FG8EbypCkbhUzYvx--
