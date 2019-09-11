Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33ABAFB2C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Sep 2019 13:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B79B6E228;
	Wed, 11 Sep 2019 11:11:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BC56E223;
 Wed, 11 Sep 2019 11:11:09 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1i80We-0006rI-NY; Wed, 11 Sep 2019 11:11:04 +0000
From: Colin King <colin.king@canonical.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: fix spelling mistake "resseting" -> "resetting"
Date: Wed, 11 Sep 2019 12:11:04 +0100
Message-Id: <20190911111104.28357-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIGd2dF9kYmdfY29yZSBkZWJ1ZyBtZXNzYWdlLiBGaXgg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Zn
cHUuYwppbmRleCBkNWE2ZTRlM2QwZmQuLmVjZmQ5MWIxYjEyYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jCkBAIC01MzEsNyArNTMxLDcgQEAgdm9pZCBpbnRlbF9ndnRfcmVzZXRfdmdwdV9sb2Nr
ZWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGJvb2wgZG1sciwKIAlpbnRlbF9lbmdpbmVfbWFz
a190IHJlc2V0dGluZ19lbmcgPSBkbWxyID8gQUxMX0VOR0lORVMgOiBlbmdpbmVfbWFzazsKIAog
CWd2dF9kYmdfY29yZSgiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
XG4iKTsKLQlndnRfZGJnX2NvcmUoInJlc3NldGluZyB2Z3B1JWQsIGRtbHIgJWQsIGVuZ2luZV9t
YXNrICUwOHhcbiIsCisJZ3Z0X2RiZ19jb3JlKCJyZXNldHRpbmcgdmdwdSVkLCBkbWxyICVkLCBl
bmdpbmVfbWFzayAlMDh4XG4iLAogCQkgICAgIHZncHUtPmlkLCBkbWxyLCBlbmdpbmVfbWFzayk7
CiAKIAl2Z3B1LT5yZXNldHRpbmdfZW5nID0gcmVzZXR0aW5nX2VuZzsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
