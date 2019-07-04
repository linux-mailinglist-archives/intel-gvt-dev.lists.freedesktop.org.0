Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E75F336
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Jul 2019 09:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC67C6E272;
	Thu,  4 Jul 2019 07:06:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEB96E272
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Jul 2019 07:06:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 00:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; d="scan'208";a="172357774"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2019 00:06:14 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Adding ppgtt to GVT GEM context after pin.
Date: Thu,  4 Jul 2019 15:06:13 +0800
Message-Id: <20190704070613.31609-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.22.0
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
Cc: zhenyuw@linux.intel.com, colin.xu@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2luZG93cyBndWVzdCBjYW4ndCBydW4gYWZ0ZXIgZm9yY2UtVERSIHdpdGggaG9zdCBsb2c6Ci4u
LgpndnQ6IHZncHUgMTogd29ya2xvYWQgc2hhZG93IHBwZ3R0IGlzbid0IHJlYWR5Cmd2dDogdmdw
dSAxOiBmYWlsIHRvIGRpc3BhdGNoIHdvcmtsb2FkLCBza2lwCi4uLgoKVGhlIGVycm9yIGlzIHJh
aXNlZCBieSBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdygpLCB3aGVuIGl0IGNoZWNrcwph
bmQgZm91bmQgdGhlIHNoYWRvd19tbSBpc24ndCBtYXJrZWQgYXMgc2hhZG93ZWQuCgpJbiB3b3Jr
IHRocmVhZCBiZWZvcmUgZWFjaCBzdWJtaXNzaW9uLCBhIHNoYWRvd19tbSBpcyBzZXQgdG8gc2hh
ZG93ZWQgaW46CnNoYWRvd19wcGd0dF9tbSgpCjwtaW50ZWxfdmdwdV9waW5fbW0oKQo8LXByZXBh
cmVfd29ya2xvYWQoKQo8LWRpc3BhdGNoX3dvcmtsb2FkKCkKPC13b3JrbG9hZF90aHJlYWQoKQpI
b3dldmVyIGNoZWNraW5nIHdoZXRoZXIgb3Igbm90IHNoYWRvd19tbSBpcyBzaGFkb3dlZCBpcyBw
cmlvciB0byBpdDoKc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKQo8LWRpc3BhdGNoX3dv
cmtsb2FkKCkKPC13b3JrbG9hZF90aHJlYWQoKQoKSW4gbm9ybWFsIGNhc2UsIGNyZWF0ZSB3b3Jr
bG9hZCB3aWxsIGNoZWNrIHRoZSBleGlzdGVuY2Ugb2Ygc2hhZG93X21tLAppZiBub3QgaXQgd2ls
bCBjcmVhdGUgYSBuZXcgb25lIGFuZCBtYXJrZWQgYXMgc2hhZG93ZWQuIElmIGFscmVhZHkgZXhp
c3QKaXQgd2lsbCByZXVzZSB0aGUgb2xkIG9uZS4gU2luY2Ugc2hhZG93X21tIGlzIHJldXNlZCwg
Y2hlY2tpbmcgb2Ygc2hhZG93ZWQKaW4gc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKSBh
Y3R1YWxseSBhbHdheXMgc2VlIHRoZSBzdGF0ZSBzZXQgaW4KY3JlYXRpb24sIGJ1dCBub3QgdGhl
IHN0YXRlIHNldCBpbiBpbnRlbF92Z3B1X3Bpbl9tbSgpLgoKV2hlbiBmb3JjZS1URFIsIGFsbCBl
bmdpbmVzIGFyZSByZXNldCwgc2luY2UgaXQncyBub3QgZG1sciBsZXZlbCwgYWxsCnBwZ3R0X21t
IGFyZSBpbnZhbGlkYXRlZCBidXQgbm90IGRlc3Ryb3llZC4gSW52YWxpZGF0aW9uIHdpbGwgbWFy
ayBhbGwKcmV1c2VkIHNoYWRvd19tbSBhcyBub3Qgc2hhZG93ZWQgYnV0IHN0aWxsIGtlZXBzIGlu
IHBwZ3R0X21tX2xpc3RfaGVhZC4KSWYgd29ya2xvYWQgc3VibWlzc2lvbiBwaGFzZSB0aG9zZSBz
aGFkb3dfbW0gYXJlIHJldXNlZCB3aXRoIHNoYWRvd2VkCm5vdCBzZXQsIHRoZW4gc2V0X2NvbnRl
eHRfcHBndHRfZnJvbV9zaGFkb3coKSB3aWxsIHJlcG9ydCBlcnJvci4KCkZpeGVzOiA0ZjE1NjY1
Y2NiYmEgKGRybS9pOTE1OiBBZGQgcHBndHQgdG8gR1ZUIEdFTSBjb250ZXh0KQoKdjI6Ck1vdmUg
c2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKSBhZnRlciBwcmVwYXJlX3dvcmtsb2FkKCku
ICh6aGVueXUpCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBDb2xp
biBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9z
Y2hlZHVsZXIuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9zY2hlZHVsZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwpp
bmRleCAxOTZiNDE1NWEzMDkuLjEwMDA0MDIwOTE4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9z
Y2hlZHVsZXIuYwpAQCAtNjg1LDEzICs2ODUsNiBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dvcmts
b2FkKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkKIAltdXRleF9sb2NrKCZ2
Z3B1LT52Z3B1X2xvY2spOwogCW11dGV4X2xvY2soJmRldl9wcml2LT5kcm0uc3RydWN0X211dGV4
KTsKIAotCXJldCA9IHNldF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KHdvcmtsb2FkLAotCQkJ
CQkgICAgcy0+c2hhZG93W3JpbmdfaWRdLT5nZW1fY29udGV4dCk7Ci0JaWYgKHJldCA8IDApIHsK
LQkJZ3Z0X3ZncHVfZXJyKCJ3b3JrbG9hZCBzaGFkb3cgcHBndHQgaXNuJ3QgcmVhZHlcbiIpOwot
CQlnb3RvIGVycl9yZXE7Ci0JfQotCiAJcmV0ID0gaW50ZWxfZ3Z0X3dvcmtsb2FkX3JlcV9hbGxv
Yyh3b3JrbG9hZCk7CiAJaWYgKHJldCkKIAkJZ290byBlcnJfcmVxOwpAQCAtNzA3LDYgKzcwMCwx
MyBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dvcmtsb2FkKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmts
b2FkICp3b3JrbG9hZCkKIAl9CiAKIAlyZXQgPSBwcmVwYXJlX3dvcmtsb2FkKHdvcmtsb2FkKTsK
KwlpZiAocmV0KQorCQlnb3RvIG91dDsKKworCXJldCA9IHNldF9jb250ZXh0X3BwZ3R0X2Zyb21f
c2hhZG93KHdvcmtsb2FkLAorCQkJCQkgICAgcy0+c2hhZG93W3JpbmdfaWRdLT5nZW1fY29udGV4
dCk7CisJaWYgKHJldCkKKwkJZ3Z0X3ZncHVfZXJyKCJ3b3JrbG9hZCBzaGFkb3cgcHBndHQgaXNu
J3QgcmVhZHlcbiIpOwogb3V0OgogCWlmIChyZXQpIHsKIAkJLyogV2UgbWlnaHQgc3RpbGwgbmVl
ZCB0byBhZGQgcmVxdWVzdCB3aXRoCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
