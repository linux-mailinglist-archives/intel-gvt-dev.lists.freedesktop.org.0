Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0676C508
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Aug 2023 07:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25A10E051;
	Wed,  2 Aug 2023 05:53:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0D310E012;
 Wed,  2 Aug 2023 05:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690955617; x=1722491617;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=v3k/WWP81GQQhf9KAORQbm099LD0ilo5eCi5Rq6qrcs=;
 b=n9xsAIUr/z8y2Abr5qI1Oe8XOe8b//4BZX5Ew5XVOZCyOwk11BxEDvWZ
 nHX1NR1HzrZmk4EekZp66rpPv3BNtP565qOBcOGRrKmE+8wOkK4yuslRg
 tbocf6dunNtEKB3UR2D+nc3VQkk8Yd+uCLwVuIidy/nBvva0jN9ROJgyF
 YFnQXxUdP1x3lJbBNODcdLWrIOf9ZEXC8pZ9RMD4wtaIws9KViHXs4rWV
 mzVEAfXptGv5WdFST2dF/XgZU0nzb69ahOqXgta/i/PCpgdKj/vMOh8Gg
 12QCeOvGeSOubgqsvneGxKdRLnC24ptB8TFfZmftfIfGgXGfMmnNCrRyA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373129615"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
 d="asc'?scan'208";a="373129615"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 22:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722742225"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
 d="asc'?scan'208";a="722742225"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 22:53:34 -0700
Date: Wed, 2 Aug 2023 13:54:07 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <ZMnvf46JqgeIuTir@debian-scheme>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="GVW4PLmQHlb2LPyx"
Content-Disposition: inline
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
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--GVW4PLmQHlb2LPyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here is one gvt fix for bug in AUX CH register message length get.
Please help to pick.

Thanks!
--
The following changes since commit e354f67733115b4453268f61e6e072e9b1ea7a2f:

  drm/i915: Fix an error handling path in igt_write_huge() (2023-07-25 08:38:12 +0100)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2023-08-02

for you to fetch changes up to 46d14e17095237007b59f56aae2d81ae2dcb0f93:

  drm/i915/gvt: Fix bug in getting msg length in AUX CH registers handler (2023-08-01 11:21:09 +0800)

----------------------------------------------------------------
gvt-fixes-2023-08-02

- Fix bug to get AUX CH register message length (Yan)

----------------------------------------------------------------
Yan Zhao (1):
      drm/i915/gvt: Fix bug in getting msg length in AUX CH registers handler

 drivers/gpu/drm/i915/gvt/edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--GVW4PLmQHlb2LPyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZMnveQAKCRCxBBozTXgY
Jzo8AJ9Xsw8Rcf9Jxth2hc3X9vvIGjzZhACfQLmRNhgsovOaVNR+Z4hulG8tJHQ=
=IwC2
-----END PGP SIGNATURE-----

--GVW4PLmQHlb2LPyx--
