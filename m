Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF49DD95
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 10:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D3689240;
	Mon, 29 Apr 2019 08:19:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DB889240
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Apr 2019 08:19:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 01:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="139703495"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2019 01:19:33 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/i915/gvt: do not let TRTTE and 0x4dfc write
 passthrough to hardware
Date: Mon, 29 Apr 2019 04:13:57 -0400
Message-Id: <20190429081357.15569-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429081309.15428-1-yan.y.zhao@intel.com>
References: <20190429081309.15428-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

dGhlIHZHUFUgd3JpdGUgb24gVFJUVEUgYW5kIDB4NGRmYyBpcyBub3cgd3JpdGUgdG8gdnJlZyBm
aXJzdC4gdGhlaXIKdmFsdWVzIGFsbCBiZSByZXN0b3JlZCBoYXJkd2FyZSB3aGVuIGNvbnRleHQg
c3dpdGNoaW5nLgoKdjM6IGFkZCBmaXhlZCB0YWcgKHpoZW55dSkKCkZpeGVzOiBlMzljNWFkZDMy
MjEgKCJkcm0vaTkxNS9ndnQ6IHZHUFUgTU1JTyB2aXJ0dWFsaXphdGlvbiIpClNpZ25lZC1vZmYt
Ynk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYyB8IDE1IC0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9o
YW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKaW5kZXggMThm
MDFlZWIyNTEwLi40N2EzNmVlNWYwNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5j
CkBAIC0xMzY0LDcgKzEzNjQsNiBAQCBzdGF0aWMgaW50IGRtYV9jdHJsX3dyaXRlKHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogc3RhdGljIGludCBnZW45X3Ry
dHRlX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAog
CQl2b2lkICpwX2RhdGEsIHVuc2lnbmVkIGludCBieXRlcykKIHsKLQlzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYgPSB2Z3B1LT5ndnQtPmRldl9wcml2OwogCXUzMiB0cnR0ZSA9ICoo
dTMyICopcF9kYXRhOwogCiAJaWYgKCh0cnR0ZSAmIDEpICYmICh0cnR0ZSAmICgxIDw8IDEpKSA9
PSAwKSB7CkBAIC0xMzczLDExICsxMzcyLDYgQEAgc3RhdGljIGludCBnZW45X3RydHRlX3dyaXRl
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAJd3JpdGVfdnJlZyh2Z3B1LCBvZmZzZXQsIHBfZGF0YSwgYnl0ZXMpOwot
CS8qIFRSVFRFIGlzIG5vdCBwZXItY29udGV4dCAqLwotCi0JbW1pb19od19hY2Nlc3NfcHJlKGRl
dl9wcml2KTsKLQlJOTE1X1dSSVRFKF9NTUlPKG9mZnNldCksIHZncHVfdnJlZyh2Z3B1LCBvZmZz
ZXQpKTsKLQltbWlvX2h3X2FjY2Vzc19wb3N0KGRldl9wcml2KTsKIAogCXJldHVybiAwOwogfQpA
QCAtMTM4NSwxNSArMTM3OSw2IEBAIHN0YXRpYyBpbnQgZ2VuOV90cnR0ZV93cml0ZShzdHJ1Y3Qg
aW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIHN0YXRpYyBpbnQgZ2VuOV90
cnR0X2NoaWNrZW5fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBv
ZmZzZXQsCiAJCXZvaWQgKnBfZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVzKQogewotCXN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2X3ByaXY7Ci0JdTMyIHZh
bCA9ICoodTMyICopcF9kYXRhOwotCi0JaWYgKHZhbCAmIDEpIHsKLQkJLyogdW5ibG9jayBodyBs
b2dpYyAqLwotCQltbWlvX2h3X2FjY2Vzc19wcmUoZGV2X3ByaXYpOwotCQlJOTE1X1dSSVRFKF9N
TUlPKG9mZnNldCksIHZhbCk7Ci0JCW1taW9faHdfYWNjZXNzX3Bvc3QoZGV2X3ByaXYpOwotCX0K
IAl3cml0ZV92cmVnKHZncHUsIG9mZnNldCwgcF9kYXRhLCBieXRlcyk7CiAJcmV0dXJuIDA7CiB9
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
