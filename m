Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12F3668C7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Apr 2021 12:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E890589DBF;
	Wed, 21 Apr 2021 10:03:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2C89D56;
 Wed, 21 Apr 2021 10:03:30 +0000 (UTC)
IronPort-SDR: 9aawLUioAfOr6Bl5HGgNNAK5nmahbXcUfZTyWIID7NhCzzvlzBGNazPic/Iok3Z93T+Vymatzv
 r3QHgPna+jgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175779652"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
 d="asc'?scan'208";a="175779652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:03:30 -0700
IronPort-SDR: o1s91gcB+ASHJZNV9jpyQDbFvi6TqmFWsnj+FjH7wUZtPTJYcUvOMN2zcgbRBpw4/seA/XSxU5
 f3S+Q0GzmPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
 d="asc'?scan'208";a="427458086"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 21 Apr 2021 03:03:27 -0700
Date: Wed, 21 Apr 2021 17:45:22 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <20210421094522.GU1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============2001463298=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2001463298==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wfgmFf0LjPE7xkRl"
Content-Disposition: inline


--wfgmFf0LjPE7xkRl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here're queued gvt-next-fixes changes. Two ones are for code cleanup
on unused function or duplicated function call, with another one for
consistent function return type.

Thanks.
--
The following changes since commit d153e8c156dafeb847fd655f416cf81c007e8706:

  Merge tag 'drm-intel-next-fixes-2021-02-25' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-02-26 05:08:51 +1000)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-fixes-2021-04-21

for you to fetch changes up to 0349ec19c484ed40dbc725820673df4d94334e8c:

  drm/i915/gvt: Remove duplicated register accessible check (2021-04-21 17:56:06 +0800)

----------------------------------------------------------------
gvt-next-fixes-2021-04-21

- Remove one unused function warning (Jiapeng)
- Fix intel_gvt_init_device() return type (Dan)
- Remove one duplicated register accessible check (Zhenyu)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gvt: Fix error code in intel_gvt_init_device()

Jiapeng Chong (1):
      drm/i915/gvt: remove useless function

Zhenyu Wang (1):
      drm/i915/gvt: Remove duplicated register accessible check

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 -----
 drivers/gpu/drm/i915/gvt/gtt.c        | 6 ------
 drivers/gpu/drm/i915/gvt/gvt.c        | 8 ++++----
 3 files changed, 4 insertions(+), 15 deletions(-)

--wfgmFf0LjPE7xkRl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYH/0LAAKCRCxBBozTXgY
J99RAJ9gA+xkRroy5srps6Gqms8ZWVqjBACeJoW6wpt4m+5Hpc4eW0AAxaxXq5M=
=NtFT
-----END PGP SIGNATURE-----

--wfgmFf0LjPE7xkRl--

--===============2001463298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2001463298==--
