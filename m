Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2404B327DC
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 07:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1634892B7;
	Mon,  3 Jun 2019 05:02:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F5892B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jun 2019 05:02:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 22:02:07 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga008.jf.intel.com with ESMTP; 02 Jun 2019 22:02:06 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: rename is_inhibit_context to
 is_restore_inhibit_context
Date: Mon,  3 Jun 2019 00:56:17 -0400
Message-Id: <20190603045617.31011-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHR3byBpbmhpYml0IGNvbnRleHRzOiByZXN0b3JlIGluaGliaXQgYW5kIHNhdmUg
aW5oaWJpdAp3ZSBuZWVkIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlIHR3by4KCkNjOiBXZWlu
YW4gTGkgPHdlaW5hbi56LmxpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlh
bi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2Nv
bnRleHQuYyB8IDkgKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250
ZXh0LmggfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgICAgfCAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKaW5kZXggOTZlMWVkZjIxYjNmLi4w
YzNlMmYyMWUyOGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2Nv
bnRleHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKQEAg
LTQzOCwxNCArNDM4LDExIEBAIHN0YXRpYyB2b2lkIHN3aXRjaF9tb2NzKHN0cnVjdCBpbnRlbF92
Z3B1ICpwcmUsIHN0cnVjdCBpbnRlbF92Z3B1ICpuZXh0LAogCiAjZGVmaW5lIENUWF9DT05URVhU
X0NPTlRST0xfVkFMCTB4MDMKIAotYm9vbCBpc19pbmhpYml0X2NvbnRleHQoc3RydWN0IGludGVs
X2NvbnRleHQgKmNlKQorYm9vbCBpc19yZXN0b3JlX2luaGliaXRfY29udGV4dChzdHJ1Y3QgaW50
ZWxfY29udGV4dCAqY2UpCiB7CiAJY29uc3QgdTMyICpyZWdfc3RhdGUgPSBjZS0+bHJjX3JlZ19z
dGF0ZTsKLQl1MzIgaW5oaWJpdF9tYXNrID0KLQkJX01BU0tFRF9CSVRfRU5BQkxFKENUWF9DVFJM
X0VOR0lORV9DVFhfUkVTVE9SRV9JTkhJQklUKTsKIAotCXJldHVybiBpbmhpYml0X21hc2sgPT0K
LQkJKHJlZ19zdGF0ZVtDVFhfQ09OVEVYVF9DT05UUk9MX1ZBTF0gJiBpbmhpYml0X21hc2spOwor
CXJldHVybiBJU19SRVNUT1JFX0lOSElCSVQocmVnX3N0YXRlW0NUWF9DT05URVhUX0NPTlRST0xf
VkFMXSk7CiB9CiAKIC8qIFN3aXRjaCByaW5nIG1taW8gdmFsdWVzIChjb250ZXh0KS4gKi8KQEAg
LTQ5Myw3ICs0OTAsNyBAQCBzdGF0aWMgdm9pZCBzd2l0Y2hfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdw
dSAqcHJlLAogCQkJICogaXRzZWxmLgogCQkJICovCiAJCQlpZiAobW1pby0+aW5fY29udGV4dCAm
JgotCQkJICAgICFpc19pbmhpYml0X2NvbnRleHQocy0+c2hhZG93W3JpbmdfaWRdKSkKKwkJCSAg
ICAhaXNfcmVzdG9yZV9pbmhpYml0X2NvbnRleHQocy0+c2hhZG93W3JpbmdfaWRdKSkKIAkJCQlj
b250aW51ZTsKIAogCQkJaWYgKG1taW8tPm1hc2spCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1p
b19jb250ZXh0LmgKaW5kZXggZjdlYWE0NDI0MDNmLi4wOGUzYTc3NWZhZTcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmgKQEAgLTQ5LDcgKzQ5LDcgQEAgdm9pZCBpbnRl
bF9ndnRfc3dpdGNoX21taW8oc3RydWN0IGludGVsX3ZncHUgKnByZSwKIAogdm9pZCBpbnRlbF9n
dnRfaW5pdF9lbmdpbmVfbW1pb19jb250ZXh0KHN0cnVjdCBpbnRlbF9ndnQgKmd2dCk7CiAKLWJv
b2wgaXNfaW5oaWJpdF9jb250ZXh0KHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSk7Citib29sIGlz
X3Jlc3RvcmVfaW5oaWJpdF9jb250ZXh0KHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSk7CiAKIGlu
dCBpbnRlbF92Z3B1X3Jlc3RvcmVfaW5oaWJpdF9jb250ZXh0KHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LAogCQkJCSAgICAgICBzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpyZXEpOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3NjaGVkdWxlci5jCmluZGV4IDhmM2JhNDliMDZmNS4uNWMyMDg3NjAwNDQyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0zMTMsNyArMzEzLDcgQEAgc3RhdGlj
IGludCBjb3B5X3dvcmtsb2FkX3RvX3JpbmdfYnVmZmVyKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmts
b2FkICp3b3JrbG9hZCkKIAl1MzIgKmNzOwogCWludCBlcnI7CiAKLQlpZiAoSVNfR0VOKHJlcS0+
aTkxNSwgOSkgJiYgaXNfaW5oaWJpdF9jb250ZXh0KHJlcS0+aHdfY29udGV4dCkpCisJaWYgKElT
X0dFTihyZXEtPmk5MTUsIDkpICYmIGlzX3Jlc3RvcmVfaW5oaWJpdF9jb250ZXh0KHJlcS0+aHdf
Y29udGV4dCkpCiAJCWludGVsX3ZncHVfcmVzdG9yZV9pbmhpYml0X2NvbnRleHQodmdwdSwgcmVx
KTsKIAogCS8qCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
