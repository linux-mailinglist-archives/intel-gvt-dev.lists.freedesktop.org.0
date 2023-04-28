Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E633E6F12D2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Apr 2023 09:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB11F10E0CC;
	Fri, 28 Apr 2023 07:50:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBD210E0CC;
 Fri, 28 Apr 2023 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682668223; x=1714204223;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=KNnnlR7dkv9MICRYZzU5PtUppjnivrDSfIyMh7ZmhoA=;
 b=jVjwe/uPQPELJjKK/aIMZaeZt/ucMODInac/f0JmlkQu02Q6Euu9qYj+
 FJNRLJtzsvvK5uEoxLgwhMZUeBHI0smsIJdN+apuCENZRFMXq1x6UBwDV
 HqAhI6TpQo+Br6dgixQHpwttG2SxMpQWB98Zm2RqceN7NLKafn20NpCNd
 gom/QbiOQaah9g7rEwszZaQsUbLbEV7Q5xbHYYySNTGar2Izv7SAdV6/x
 eEbfl/SYf4enGeExr49ENHKTcODmT+orXX1bek0D6zcddvmGLT+WXm9o4
 Y5QJk0y5mn+taHI7CzU0FyfehkUZHAYqfuWTHIDIrJKYLCmNXpPVQPjSO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346445098"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
 d="asc'?scan'208";a="346445098"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 00:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838762956"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
 d="asc'?scan'208";a="838762956"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 00:50:20 -0700
Date: Fri, 28 Apr 2023 15:47:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <ZEt6K2C0WJTePdk6@debian-scheme>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="O1DrvfLjZrkfbLCC"
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


--O1DrvfLjZrkfbLCC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one single change for gvt to use idr based dmabuf object
reference instead of old adhoc code. We've verified no regression
for internal test.

Thanks.
--
The following changes since commit d944eafed618a8507270b324ad9d5405bb7f0b3e:

  drm/i915: Check pipe source size when using skl+ scalers (2023-04-24 14:48:42 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2023-04-28

for you to fetch changes up to 004040fdb55fa55463730c95d1384cb67f9396c3:

  drm/i915/gvt: Make use of idr_find and idr_for_each_entry in dmabuf (2023-04-28 15:21:17 +0800)

----------------------------------------------------------------
gvt-next-fixes-2023-04-28

- Use idr based dmabuf object reference (Cai Huoqing)

----------------------------------------------------------------
Cai Huoqing (1):
      drm/i915/gvt: Make use of idr_find and idr_for_each_entry in dmabuf

 drivers/gpu/drm/i915/gvt/dmabuf.c | 58 ++++++++-------------------------------
 drivers/gpu/drm/i915/gvt/dmabuf.h |  1 -
 drivers/gpu/drm/i915/gvt/gvt.h    |  1 -
 drivers/gpu/drm/i915/gvt/vgpu.c   |  1 -
 4 files changed, 12 insertions(+), 49 deletions(-)

--O1DrvfLjZrkfbLCC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZEt6JgAKCRCxBBozTXgY
JxcUAJ9oa9K04SOpmYBTWT5H8VE3Mjw5WgCeIwjDP2hs8vLvrEwnxofpFoTxJ1A=
=xIkf
-----END PGP SIGNATURE-----

--O1DrvfLjZrkfbLCC--
