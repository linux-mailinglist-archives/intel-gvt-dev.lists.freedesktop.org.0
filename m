Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA77B4702
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Sep 2019 07:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE416E124;
	Tue, 17 Sep 2019 05:48:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33326E121;
 Tue, 17 Sep 2019 05:48:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 22:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="386441241"
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.70])
 by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2019 22:48:56 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 5/9] drm/i915: vgpu context submission pv optimization
Date: Tue, 17 Sep 2019 13:48:16 +0800
Message-Id: <1568699301-2799-6-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568699301-2799-1-git-send-email-xiaolin.zhang@intel.com>
References: <1568699301-2799-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, zhiyuan.lv@intel.com,
 chris@chris-wilson.co.uk, zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SXQgaXMgcGVyZm9ybWFuY2Ugb3B0aW1pemF0aW9uIHRvIG92ZXJyaWRlIHRoZSBhY3R1YWwgc3Vi
bWlzaXNvbiBiYWNrZW5kCmluIG9yZGVyIHRvIGVsaW1pbmF0ZSBleGVjbGlzdHMgY3NiIHByb2Nl
c3MgYW5kIHJlZHVjZSBtbWlvIHRyYXAgbnVtYmVycwpmb3Igd29ya2xvYWQgc3VibWlzc2lvbiB3
aXRob3V0IGNvbnRleHQgc3dpdGNoIGludGVycnVwdCBieSB0YWxraW5nIHdpdGgKR1ZUIHZpYSBQ
ViBzdWJtaXNpc29uIG5vdGlmaWNhdGlvbiBtZWNoYW5pc20gYmV0d2VlbiBndWVzdCBhbmQgR1ZU
LgoKVXNlIFBWX1NVQk1JU1NJT04gdG8gY29udHJvbCB0aGlzIGxldmVsIG9mIHB2IG9wdGltaXph
dGlvbi4KCnYwOiBSRkMuCnYxOiByZWJhc2UuCnYyOiBhZGRlZCBwdiBvcHMgZm9yIHB2IGNvbnRl
eHQgc3VibWlzc2lvbi4gdG8gbWF4aW1pemUgY29kZSByZXN1c2UsCmludHJvZHVjZWQgMiBtb3Jl
IG9wcyAoc3VibWl0X3BvcnRzICYgcHJlZW1wdF9jb250ZXh0KSBpbnN0ZWFkIG9mIDEgb3AKKHNl
dF9kZWZhdWx0X3N1Ym1pc3Npb24pIGluIGVuZ2luZSBzdHJ1Y3R1cmUuIHB2IHZlcnNpb24gb2YK
c3VibWl0X3BvcnRzIGFuZCBwcmVlbXB0X2NvbnRleHQgaW1wbGVtZW50ZWQuCnYzOgoxLiB0byBy
ZWR1Y2UgbW9yZSBjb2RlIGR1cGxpY2F0aW9uLCBjb2RlIHJlZmFjdG9yIGFuZCByZXBsYWNlZCAy
IG9wcwoic3VibWl0X3BvcnRzICYgcHJlZW1wdF9jb250ZXgiIGZyb20gdjIgYnkgMSBvcHMgIndy
aXRlX2Rlc2MiCmluIGVuZ2luZSBzdHJ1Y3R1cmUuIHB2IHZlcnNpb24gb2Ygd3JpdGVfZGVzIGlt
cGxlbWVudGVkLgoyLiBhZGRlZCBWR1RfRzJWX0VMU1BfU1VCTUlUIGZvciBnMnYgcHYgbm90aWZp
Y2F0aW9uLgp2NDogaW1wbGVtZW50ZWQgcHYgZWxzcCBzdWJtaXNzaW9uIHRhc2tsZXQgYXMgdGhl
IGJhY2tlbmQgd29ya2xvYWQKc3VibWlzaXNvbiBieSB0YWxraW5nIHRvIEdWVCB3aXRoIFBWIG5v
dGlmaWNhaXRvbiBtZWNoYW5pc20gYW5kIHJlbmFtZWQKVkdUX0cyVl9FTFNQX1NVQk1JVCB0byBW
R1RfRzJWX1BWX1NVQk1JU0lJT04uCnY1OiBhZGRyZXNzZWQgdjQgY29tbWVudHMgZnJvbSBDaHJp
cywgaW50ZWxfcHZfc3VibWlzc2lvbi5jIGFkZGVkLgp2NjogYWRkcmVzc2VkIHY1IGNvbW1lbnRz
IGZyb20gQ2hyaXMsIHJlcGxhY2VkIGVuZ2luZSBpZCBieSBod19pZC4Kdjc6IHJlYmFzZS4Kdjg6
IGFkZHJlc3NlZCB2NyBjb21tZW50cyBmcm9tIENocmlzLgoKU2lnbmVkLW9mZi1ieTogWGlhb2xp
biBaaGFuZyA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9pbnRlbF9scmMuYyAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
dmdwdS5jICAgICAgICAgICB8ICAxOCArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1
LmggICAgICAgICAgIHwgIDE1ICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wdl9zdWJt
aXNzaW9uLmMgfCAzMDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hh
bmdlZCwgMzQxIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcHZfc3VibWlzc2lvbi5jCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9N
YWtlZmlsZQppbmRleCA2NThiOTMwLi5mNTAwY2YxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZQpAQCAt
MjUwLDcgKzI1MCw3IEBAIGk5MTUtJChDT05GSUdfRFJNX0k5MTVfU0VMRlRFU1QpICs9IFwKIAlz
ZWxmdGVzdHMvaWd0X3NwaW5uZXIubwogCiAjIHZpcnR1YWwgZ3B1IGNvZGUKLWk5MTUteSArPSBp
OTE1X3ZncHUubworaTkxNS15ICs9IGk5MTVfdmdwdS5vIGludGVsX3B2X3N1Ym1pc3Npb24ubwog
CiBpZmVxICgkKENPTkZJR19EUk1fSTkxNV9HVlQpLHkpCiBpOTE1LXkgKz0gaW50ZWxfZ3Z0Lm8K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2xyYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmMKaW5kZXggYTNmMGU0OS4uNTU4N2FmZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmMKQEAgLTI5MzMsMTAgKzI5MzMsMTQgQEAgdm9p
ZCBpbnRlbF9leGVjbGlzdHNfc2V0X2RlZmF1bHRfc3VibWlzc2lvbihzdHJ1Y3QgaW50ZWxfZW5n
aW5lX2NzICplbmdpbmUpCiAJZW5naW5lLT51bnBhcmsgPSBOVUxMOwogCiAJZW5naW5lLT5mbGFn
cyB8PSBJOTE1X0VOR0lORV9TVVBQT1JUU19TVEFUUzsKLQlpZiAoIWludGVsX3ZncHVfYWN0aXZl
KGVuZ2luZS0+aTkxNSkpIHsKLQkJZW5naW5lLT5mbGFncyB8PSBJOTE1X0VOR0lORV9IQVNfU0VN
QVBIT1JFUzsKLQkJaWYgKEhBU19MT0dJQ0FMX1JJTkdfUFJFRU1QVElPTihlbmdpbmUtPmk5MTUp
KQotCQkJZW5naW5lLT5mbGFncyB8PSBJOTE1X0VOR0lORV9IQVNfUFJFRU1QVElPTjsKKwllbmdp
bmUtPmZsYWdzIHw9IEk5MTVfRU5HSU5FX0hBU19TRU1BUEhPUkVTOworCWlmIChIQVNfTE9HSUNB
TF9SSU5HX1BSRUVNUFRJT04oZW5naW5lLT5pOTE1KSkKKwkJZW5naW5lLT5mbGFncyB8PSBJOTE1
X0VOR0lORV9IQVNfUFJFRU1QVElPTjsKKworCWlmIChpbnRlbF92Z3B1X2FjdGl2ZShlbmdpbmUt
Pmk5MTUpKSB7CisJCWVuZ2luZS0+ZmxhZ3MgJj0gfkk5MTVfRU5HSU5FX0hBU19TRU1BUEhPUkVT
OworCQllbmdpbmUtPmZsYWdzICY9IH5JOTE1X0VOR0lORV9IQVNfUFJFRU1QVElPTjsKKwkJaW50
ZWxfdmdwdV9jb25maWdfcHZfY2FwcyhlbmdpbmUtPmk5MTUsCVBWX1NVQk1JU1NJT04sIGVuZ2lu
ZSk7CiAJfQogCiAJaWYgKElOVEVMX0dFTihlbmdpbmUtPmk5MTUpID49IDEyKSAvKiBYWFggZGlz
YWJsZWQgZm9yIGRlYnVnZ2luZyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV92Z3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYwppbmRleCBlNDU4
ODkyLi5hNDg4YjY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYwpAQCAtOTcsNyArOTcsNyBA
QCB2b2lkIGk5MTVfZGV0ZWN0X3ZncHUoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2
KQogCW11dGV4X2luaXQoJmRldl9wcml2LT52Z3B1LmxvY2spOwogCiAJLyogZ3Vlc3QgZHJpdmVy
IFBWIGNhcGFiaWxpdHkgKi8KLQlkZXZfcHJpdi0+dmdwdS5wdl9jYXBzID0gUFZfUFBHVFRfVVBE
QVRFOworCWRldl9wcml2LT52Z3B1LnB2X2NhcHMgPSBQVl9QUEdUVF9VUERBVEUgfCBQVl9TVUJN
SVNTSU9OOwogCiAJaWYgKCFpbnRlbF92Z3B1X2NoZWNrX3B2X2NhcHMoZGV2X3ByaXYsIHNoYXJl
ZF9hcmVhKSkgewogCQlEUk1fSU5GTygiVmlydHVhbCBHUFUgZm9yIEludGVsIEdWVC1nIGRldGVj
dGVkLlxuIik7CkBAIC0zODksNiArMzg5LDcgQEAgdm9pZCBpbnRlbF92Z3B1X2NvbmZpZ19wdl9j
YXBzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAkJZW51bSBwdl9jYXBzIGNh
cCwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgaTkxNV9wcGd0dCAqcHBndHQ7CisJc3RydWN0IGlu
dGVsX2VuZ2luZV9jcyAqZW5naW5lOwogCiAJaWYgKCFpbnRlbF92Z3B1X2VuYWJsZWRfcHZfY2Fw
cyhkZXZfcHJpdiwgY2FwKSkKIAkJcmV0dXJuOwpAQCAtMzk5LDYgKzQwMCwxMSBAQCB2b2lkIGlu
dGVsX3ZncHVfY29uZmlnX3B2X2NhcHMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2
LAogCQlwcGd0dC0+dm0uaW5zZXJ0X2VudHJpZXMgPSBnZW44X3BwZ3R0X2luc2VydF80bHZsX3B2
OwogCQlwcGd0dC0+dm0uY2xlYXJfcmFuZ2UgPSBnZW44X3BwZ3R0X2NsZWFyXzRsdmxfcHY7CiAJ
fQorCisJaWYgKGNhcCA9PSBQVl9TVUJNSVNTSU9OKSB7CisJCWVuZ2luZSA9IChzdHJ1Y3QgaW50
ZWxfZW5naW5lX2NzICopZGF0YTsKKwkJdmdwdV9zZXRfcHZfc3VibWlzc2lvbihlbmdpbmUpOwor
CX0KIH0KIAogLyoqCkBAIC01OTQsNiArNjAwLDggQEAgc3RhdGljIGludCBpbnRlbF92Z3B1X3Nl
dHVwX3NoYXJlZF9wYWdlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAl1NjQg
Z3BhOwogCXUxNiB2ZXJfbWFqLCB2ZXJfbWluOwogCWludCByZXQgPSAwOworCWludCBpOworCXUz
MiBzaXplOwogCiAJLyogV2UgYWxsb2NhdGUgMSBwYWdlIHNoYXJlZCBiZXR3ZWVuIGd1ZXN0IGFu
ZCBHVlQgZm9yIGRhdGEgZXhjaGFuZ2UuCiAJICogICAgICAgX19fX19fX19fX18uLi4uLi4uLi4u
Li4uLi4uLi4uLi4KQEAgLTY2Niw2ICs2NzQsMTQgQEAgc3RhdGljIGludCBpbnRlbF92Z3B1X3Nl
dHVwX3NoYXJlZF9wYWdlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAlwdi0+
bm90aWZ5ID0gaW50ZWxfdmdwdV9wdl9ub3RpZnlfbW1pbzsKIAltdXRleF9pbml0KCZwdi0+c2Vu
ZF9tdXRleCk7CiAKKwkvKiBzZXR1cCBQViBwZXIgZW5naW5lIGRhdGEgZXhjaGFuZ2Ugc3RydWN0
dXJlICovCisJc2l6ZSA9IHNpemVvZihzdHJ1Y3QgcHZfc3VibWlzc2lvbik7CisJZm9yIChpID0g
MDsgaSA8IFBWX01BWF9FTkdJTkVTX05VTTsgaSsrKSB7CisJCXB2LT5wdl9lbHNwW2ldID0gKHZv
aWQgKiliYXNlICsgUFZfRUxTUF9PRkYgKyAgc2l6ZSAqIGk7CisJCXB2LT5wdl9lbHNwW2ldLT5z
dWJtaXR0ZWQgPSBmYWxzZTsKKwkJc3Bpbl9sb2NrX2luaXQoJnB2LT5wdl9lbHNwW2ldLT5sb2Nr
KTsKKwl9CisKIAlyZXR1cm4gcmV0OwogZXJyOgogCV9fZnJlZV9wYWdlKHZpcnRfdG9fcGFnZShi
YXNlKSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oCmluZGV4IGIwZmVlNWIuLmMzM2NiMDUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oCkBAIC0yOSw2ICsyOSw4IEBACiAKICNkZWZpbmUgUFZf
TUFKT1IJCTEKICNkZWZpbmUgUFZfTUlOT1IJCTAKKyNkZWZpbmUgUFZfTUFYX0VOR0lORVNfTlVN
CShWRUNTMV9IVyArIDEpCisjZGVmaW5lIFBWX0VMU1BfT0ZGCQkoUEFHRV9TSVpFLzgpCiAjZGVm
aW5lIFBWX0RFU0NfT0ZGCQkoUEFHRV9TSVpFLzQpCiAjZGVmaW5lIFBWX0NNRF9PRkYJCShQQUdF
X1NJWkUvMikKIApAQCAtMzcsNiArMzksNyBAQAogICovCiBlbnVtIHB2X2NhcHMgewogCVBWX1BQ
R1RUX1VQREFURSA9IDB4MSwKKwlQVl9TVUJNSVNTSU9OID0gMHgyLAogfTsKIAogLyogUFYgYWN0
aW9ucyAqLwpAQCAtNDUsNiArNDgsNyBAQCBlbnVtIGludGVsX3ZncHVfcHZfYWN0aW9uIHsKIAlQ
Vl9BQ1RJT05fUFBHVFRfTDRfQUxMT0MsCiAJUFZfQUNUSU9OX1BQR1RUX0w0X0NMRUFSLAogCVBW
X0FDVElPTl9QUEdUVF9MNF9JTlNFUlQsCisJUFZfQUNUSU9OX0VMU1BfU1VCTUlTU0lPTiwKIH07
CiAKIC8qCkBAIC01Niw2ICs2MCwxMyBAQCBzdHJ1Y3QgZ3Z0X3NoYXJlZF9wYWdlIHsKIAl1MTYg
dmVyX21pbm9yOwogfTsKIAorLyogd29ya2xvYWQgc3VibWlzc2lvbiBwdiBzdXBwb3J0IGRhdGEg
c3RydWN0dXJlICovCitzdHJ1Y3QgcHZfc3VibWlzc2lvbiB7CisJdTY0IGRlc2NzW0VYRUNMSVNU
X01BWF9QT1JUU107CisJYm9vbCBzdWJtaXR0ZWQ7CisJc3BpbmxvY2tfdCBsb2NrOworfTsKKwog
LyoKICAqIERlZmluaXRpb24gb2YgdGhlIGNvbW1hbmQgdHJhbnNwb3J0IG1lc3NhZ2UgaGVhZGVy
IChEVzApCiAgKgpAQCAtMTAwLDYgKzExMSw5IEBAIHN0cnVjdCBpOTE1X3ZpcnR1YWxfZ3B1X3B2
IHsKIAlzdHJ1Y3QgZ3Z0X3NoYXJlZF9wYWdlICpzaGFyZWRfcGFnZTsKIAlib29sIGVuYWJsZWQ7
CiAKKwkvKiBwZXIgZW5naW5lIFBWIHdvcmtsb2FkIHN1Ym1pc3Npb24gZGF0YSAqLworCXN0cnVj
dCBwdl9zdWJtaXNzaW9uICpwdl9lbHNwW1BWX01BWF9FTkdJTkVTX05VTV07CisKIAkvKiBQViBj
b21tYW5kIGJ1ZmZlciBzdXBwb3J0ICovCiAJc3RydWN0IHZncHVfcHZfY3RfYnVmZmVyIGN0YjsK
IAl1MzIgbmV4dF9mZW5jZTsKQEAgLTE2NCw0ICsxNzgsNSBAQCBib29sIGludGVsX3ZncHVfY2hl
Y2tfcHZfY2FwcyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCXZvaWQgX19p
b21lbSAqc2hhcmVkX2FyZWEpOwogdm9pZCBpbnRlbF92Z3B1X2NvbmZpZ19wdl9jYXBzKHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAkJZW51bSBwdl9jYXBzIGNhcCwgdm9pZCAq
ZGF0YSk7Cit2b2lkIHZncHVfc2V0X3B2X3N1Ym1pc3Npb24oc3RydWN0IGludGVsX2VuZ2luZV9j
cyAqZW5naW5lKTsKICNlbmRpZiAvKiBfSTkxNV9WR1BVX0hfICovCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wdl9zdWJtaXNzaW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9wdl9zdWJtaXNzaW9uLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMC4uMTA4M2Q1NgotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX3B2X3N1Ym1pc3Npb24uYwpAQCAtMCwwICsxLDMwMCBAQAorLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IE1JVAorLyoKKyAqIENvcHlyaWdodCDCqSAyMDE4IEludGVsIENvcnBvcmF0aW9u
CisgKi8KKworI2luY2x1ZGUgImk5MTVfdmdwdS5oIgorI2luY2x1ZGUgImd0L2ludGVsX2xyY19y
ZWcuaCIKKyNpbmNsdWRlICJndC9pbnRlbF9ndF9wbS5oIgorI2luY2x1ZGUgImk5MTVfdHJhY2Uu
aCIKKworI2RlZmluZSBDVFhfREVTQ19GT1JDRV9SRVNUT1JFIEJJVF9VTEwoMikKKworc3RhdGlj
IHU2NCBleGVjbGlzdHNfdXBkYXRlX2NvbnRleHQoc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEpCit7
CisJc3RydWN0IGludGVsX2NvbnRleHQgKmNlID0gcnEtPmh3X2NvbnRleHQ7CisJdTMyICpyZWdf
c3RhdGUgPSBjZS0+bHJjX3JlZ19zdGF0ZTsKKworCXJlZ19zdGF0ZVtDVFhfUklOR19UQUlMICsg
MV0gPSBpbnRlbF9yaW5nX3NldF90YWlsKHJxLT5yaW5nLCBycS0+dGFpbCk7CisKKwlyZXR1cm4g
Y2UtPmxyY19kZXNjOworfQorCitzdGF0aWMgaW5saW5lIHN0cnVjdCBpOTE1X3ByaW9saXN0ICp0
b19wcmlvbGlzdChzdHJ1Y3QgcmJfbm9kZSAqcmIpCit7CisJcmV0dXJuIHJiX2VudHJ5KHJiLCBz
dHJ1Y3QgaTkxNV9wcmlvbGlzdCwgbm9kZSk7Cit9CisKK3N0YXRpYyB2b2lkIHB2X3N1Ym1pdChz
dHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsCisJICAgICAgIHN0cnVjdCBpOTE1X3JlcXVl
c3QgKipvdXQsCisJICAgICAgIHN0cnVjdCBpOTE1X3JlcXVlc3QgKiplbmQpCit7CisJc3RydWN0
IGludGVsX2VuZ2luZV9leGVjbGlzdHMgKiBjb25zdCBleGVjbGlzdHMgPSAmZW5naW5lLT5leGVj
bGlzdHM7CisJc3RydWN0IGk5MTVfdmlydHVhbF9ncHVfcHYgKnB2ID0gZW5naW5lLT5pOTE1LT52
Z3B1LnB2OworCXN0cnVjdCBwdl9zdWJtaXNzaW9uICpwdl9lbHNwID0gcHYtPnB2X2Vsc3BbZW5n
aW5lLT5od19pZF07CisJc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7CisJaW50IG4sIGVycjsKKwor
CW1lbXNldChwdl9lbHNwLT5kZXNjcywgMCwgc2l6ZW9mKHB2X2Vsc3AtPmRlc2NzKSk7CisJbiA9
IDA7CisKKwlkbyB7CisJCXJxID0gKm91dCsrOworCQlwdl9lbHNwLT5kZXNjc1tuKytdID0gZXhl
Y2xpc3RzX3VwZGF0ZV9jb250ZXh0KHJxKTsKKwl9IHdoaWxlIChvdXQgIT0gZW5kKTsKKworCXNw
aW5fbG9jaygmcHZfZWxzcC0+bG9jayk7CisJcHZfZWxzcC0+c3VibWl0dGVkID0gdHJ1ZTsKKwl3
cml0ZWwoUFZfQUNUSU9OX0VMU1BfU1VCTUlTU0lPTiwgZXhlY2xpc3RzLT5zdWJtaXRfcmVnKTsK
KworI2RlZmluZSBkb25lIChSRUFEX09OQ0UocHZfZWxzcC0+c3VibWl0dGVkKSA9PSBmYWxzZSkK
KwllcnIgPSB3YWl0X2Zvcl9hdG9taWNfdXMoZG9uZSwgMTAwMCk7CisjdW5kZWYgZG9uZQorCXNw
aW5fdW5sb2NrKCZwdl9lbHNwLT5sb2NrKTsKKworCWlmICh1bmxpa2VseShlcnIpKQorCQlEUk1f
RVJST1IoIlBWICglcykgd29ya2xvYWQgc3VibWlzc2lvbiBmYWlsZWRcbiIsIGVuZ2luZS0+bmFt
ZSk7CisKK30KKworc3RhdGljIHN0cnVjdCBpOTE1X3JlcXVlc3QgKnNjaGVkdWxlX2luKHN0cnVj
dCBpOTE1X3JlcXVlc3QgKnJxLCBpbnQgaWR4KQoreworCXRyYWNlX2k5MTVfcmVxdWVzdF9pbihy
cSwgaWR4KTsKKworCWludGVsX2d0X3BtX2dldChycS0+ZW5naW5lLT5ndCk7CisJcmV0dXJuIGk5
MTVfcmVxdWVzdF9nZXQocnEpOworfQorCitzdGF0aWMgdm9pZCBwdl9kZXF1ZXVlKHN0cnVjdCBp
bnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKK3sKKwlzdHJ1Y3QgaW50ZWxfZW5naW5lX2V4ZWNsaXN0
cyAqIGNvbnN0IGV4ZWNsaXN0cyA9ICZlbmdpbmUtPmV4ZWNsaXN0czsKKwlzdHJ1Y3QgaTkxNV9y
ZXF1ZXN0ICoqZmlyc3QgPSBleGVjbGlzdHMtPmluZmxpZ2h0OworCXN0cnVjdCBpOTE1X3JlcXVl
c3QgKiogY29uc3QgbGFzdF9wb3J0ID0gZmlyc3QgKyBleGVjbGlzdHMtPnBvcnRfbWFzazsKKwlz
dHJ1Y3QgaTkxNV9yZXF1ZXN0ICpsYXN0ID0gZmlyc3RbMF07CisJc3RydWN0IGk5MTVfcmVxdWVz
dCAqKnBvcnQ7CisJYm9vbCBzdWJtaXQgPSBmYWxzZTsKKwlzdHJ1Y3QgcmJfbm9kZSAqcmI7CisK
Kwlsb2NrZGVwX2Fzc2VydF9oZWxkKCZlbmdpbmUtPmFjdGl2ZS5sb2NrKTsKKworCWlmIChsYXN0
KSB7CisJCWlmICgqKytmaXJzdCkKKwkJCXJldHVybjsKKwkJbGFzdCA9IE5VTEw7CisJfQorCisJ
cG9ydCA9IGZpcnN0OworCXdoaWxlICgocmIgPSByYl9maXJzdF9jYWNoZWQoJmV4ZWNsaXN0cy0+
cXVldWUpKSkgeworCQlzdHJ1Y3QgaTkxNV9wcmlvbGlzdCAqcCA9IHRvX3ByaW9saXN0KHJiKTsK
KwkJc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsICpybjsKKwkJaW50IGk7CisKKwkJcHJpb2xpc3Rf
Zm9yX2VhY2hfcmVxdWVzdF9jb25zdW1lKHJxLCBybiwgcCwgaSkgeworCQkJaWYgKGxhc3QgJiYg
cnEtPmh3X2NvbnRleHQgIT0gbGFzdC0+aHdfY29udGV4dCkgeworCQkJCWlmIChwb3J0ID09IGxh
c3RfcG9ydCkKKwkJCQkJZ290byBkb25lOworCisJCQkJKnBvcnQgPSBzY2hlZHVsZV9pbihsYXN0
LAorCQkJCQkJICAgIHBvcnQgLSBleGVjbGlzdHMtPmluZmxpZ2h0KTsKKwkJCQlwb3J0Kys7CisJ
CQl9CisKKworCQkJbGlzdF9kZWxfaW5pdCgmcnEtPnNjaGVkLmxpbmspOworCQkJX19pOTE1X3Jl
cXVlc3Rfc3VibWl0KHJxKTsKKwkJCXN1Ym1pdCA9IHRydWU7CisJCQlsYXN0ID0gcnE7CisJCX0K
KworCQlyYl9lcmFzZV9jYWNoZWQoJnAtPm5vZGUsICZleGVjbGlzdHMtPnF1ZXVlKTsKKwkJaTkx
NV9wcmlvbGlzdF9mcmVlKHApOworCX0KK2RvbmU6CisJZXhlY2xpc3RzLT5xdWV1ZV9wcmlvcml0
eV9oaW50ID0KKwkJcmIgPyB0b19wcmlvbGlzdChyYiktPnByaW9yaXR5IDogSU5UX01JTjsKKwlp
ZiAoc3VibWl0KSB7CisJCSpwb3J0ID0gc2NoZWR1bGVfaW4obGFzdCwgcG9ydCAtIGV4ZWNsaXN0
cy0+aW5mbGlnaHQpOworCQkqKytwb3J0ID0gTlVMTDsKKwkJcHZfc3VibWl0KGVuZ2luZSwgZmly
c3QsIHBvcnQpOworCX0KKwlleGVjbGlzdHMtPmFjdGl2ZSA9IGV4ZWNsaXN0cy0+aW5mbGlnaHQ7
Cit9CisKK3N0YXRpYyB2b2lkIHNjaGVkdWxlX291dChzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycSkK
K3sKKwl0cmFjZV9pOTE1X3JlcXVlc3Rfb3V0KHJxKTsKKworCWludGVsX2d0X3BtX3B1dChycS0+
ZW5naW5lLT5ndCk7CisJaTkxNV9yZXF1ZXN0X3B1dChycSk7Cit9CisKK3N0YXRpYyB2b2lkIHZn
cHVfcHZfc3VibWlzc2lvbl90YXNrbGV0KHVuc2lnbmVkIGxvbmcgZGF0YSkKK3sKKwlzdHJ1Y3Qg
aW50ZWxfZW5naW5lX2NzICogY29uc3QgZW5naW5lID0gKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3Mg
KilkYXRhOworCXN0cnVjdCBpbnRlbF9lbmdpbmVfZXhlY2xpc3RzICogY29uc3QgZXhlY2xpc3Rz
ID0gJmVuZ2luZS0+ZXhlY2xpc3RzOworCXN0cnVjdCBpOTE1X3JlcXVlc3QgKipwb3J0LCAqcnE7
CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKwlzdHJ1Y3QgaTkxNV92aXJ0dWFsX2dwdV9wdiAqcHYg
PSBlbmdpbmUtPmk5MTUtPnZncHUucHY7CisJc3RydWN0IHB2X3N1Ym1pc3Npb24gKnB2X2Vsc3Ag
PSBwdi0+cHZfZWxzcFtlbmdpbmUtPmh3X2lkXTsKKworCXNwaW5fbG9ja19pcnFzYXZlKCZlbmdp
bmUtPmFjdGl2ZS5sb2NrLCBmbGFncyk7CisKKwlmb3IgKHBvcnQgPSBleGVjbGlzdHMtPmluZmxp
Z2h0OyAocnEgPSAqcG9ydCk7IHBvcnQrKykgeworCQlpZiAoIWk5MTVfcmVxdWVzdF9jb21wbGV0
ZWQocnEpKQorCQkJYnJlYWs7CisKKwkJc2NoZWR1bGVfb3V0KHJxKTsKKwl9CisKKwlpZiAocG9y
dCAhPSBleGVjbGlzdHMtPmluZmxpZ2h0KSB7CisJCWludCBpZHggPSBwb3J0IC0gZXhlY2xpc3Rz
LT5pbmZsaWdodDsKKwkJaW50IHJlbSA9IEFSUkFZX1NJWkUoZXhlY2xpc3RzLT5pbmZsaWdodCkg
LSBpZHg7CisKKwkJbWVtbW92ZShleGVjbGlzdHMtPmluZmxpZ2h0LCBwb3J0LCByZW0gKiBzaXpl
b2YoKnBvcnQpKTsKKwl9CisKKwlpZiAoIXB2X2Vsc3AtPnN1Ym1pdHRlZCkKKwkJcHZfZGVxdWV1
ZShlbmdpbmUpOworCisJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZW5naW5lLT5hY3RpdmUubG9j
aywgZmxhZ3MpOworfQorCitzdGF0aWMgdm9pZCBwdl9yZXNldF9wcmVwYXJlKHN0cnVjdCBpbnRl
bF9lbmdpbmVfY3MgKmVuZ2luZSkKK3sKKwlzdHJ1Y3QgaW50ZWxfZW5naW5lX2V4ZWNsaXN0cyAq
IGNvbnN0IGV4ZWNsaXN0cyA9ICZlbmdpbmUtPmV4ZWNsaXN0czsKKworCUdFTV9UUkFDRSgiJXNc
biIsIGVuZ2luZS0+bmFtZSk7CisKKwkvKgorCSAqIFByZXZlbnQgcmVxdWVzdCBzdWJtaXNzaW9u
IHRvIHRoZSBoYXJkd2FyZSB1bnRpbCB3ZSBoYXZlCisJICogY29tcGxldGVkIHRoZSByZXNldCBp
biBpOTE1X2dlbV9yZXNldF9maW5pc2goKS4gSWYgYSByZXF1ZXN0CisJICogaXMgY29tcGxldGVk
IGJ5IG9uZSBlbmdpbmUsIGl0IG1heSB0aGVuIHF1ZXVlIGEgcmVxdWVzdAorCSAqIHRvIGEgc2Vj
b25kIHZpYSBpdHMgZXhlY2xpc3RzLT50YXNrbGV0ICpqdXN0KiBhcyB3ZSBhcmUKKwkgKiBjYWxs
aW5nIGVuZ2luZS0+aW5pdF9odygpIGFuZCBhbHNvIHdyaXRpbmcgdGhlIEVMU1AuCisJICogVHVy
bmluZyBvZmYgdGhlIGV4ZWNsaXN0cy0+dGFza2xldCB1bnRpbCB0aGUgcmVzZXQgaXMgb3Zlcgor
CSAqIHByZXZlbnRzIHRoZSByYWNlLgorCSAqLworCV9fdGFza2xldF9kaXNhYmxlX3N5bmNfb25j
ZSgmZXhlY2xpc3RzLT50YXNrbGV0KTsKK30KKworc3RhdGljIHZvaWQKK2NhbmNlbF9wb3J0X3Jl
cXVlc3RzKHN0cnVjdCBpbnRlbF9lbmdpbmVfZXhlY2xpc3RzICogY29uc3QgZXhlY2xpc3RzKQor
eworCXN0cnVjdCBpOTE1X3JlcXVlc3QgKiBjb25zdCAqcG9ydCwgKnJxOworCisJLyogTm90ZSB3
ZSBhcmUgb25seSB1c2luZyB0aGUgaW5mbGlnaHQgYW5kIG5vdCB0aGUgcGVuZGluZyBxdWV1ZSAq
LworCWZvciAocG9ydCA9IGV4ZWNsaXN0cy0+YWN0aXZlOyAocnEgPSAqcG9ydCk7IHBvcnQrKykK
KwkJc2NoZWR1bGVfb3V0KHJxKTsKKwlleGVjbGlzdHMtPmFjdGl2ZSA9CisJCW1lbXNldChleGVj
bGlzdHMtPmluZmxpZ2h0LCAwLCBzaXplb2YoZXhlY2xpc3RzLT5pbmZsaWdodCkpOworfQorCitz
dGF0aWMgdm9pZCBwdl9yZXNldChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsIGJvb2wg
c3RhbGxlZCkKK3sKKwlzdHJ1Y3QgaW50ZWxfZW5naW5lX2V4ZWNsaXN0cyAqIGNvbnN0IGV4ZWNs
aXN0cyA9ICZlbmdpbmUtPmV4ZWNsaXN0czsKKwlzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycTsKKwl1
bnNpZ25lZCBsb25nIGZsYWdzOworCisJc3Bpbl9sb2NrX2lycXNhdmUoJmVuZ2luZS0+YWN0aXZl
LmxvY2ssIGZsYWdzKTsKKworCWNhbmNlbF9wb3J0X3JlcXVlc3RzKGV4ZWNsaXN0cyk7CisKKwkv
KiBQdXNoIGJhY2sgYW55IGluY29tcGxldGUgcmVxdWVzdHMgZm9yIHJlcGxheSBhZnRlciB0aGUg
cmVzZXQuICovCisJcnEgPSBleGVjbGlzdHNfdW53aW5kX2luY29tcGxldGVfcmVxdWVzdHMoZXhl
Y2xpc3RzKTsKKwlpZiAoIXJxKQorCQlnb3RvIG91dF91bmxvY2s7CisKKwlpZiAoIWk5MTVfcmVx
dWVzdF9zdGFydGVkKHJxKSkKKwkJc3RhbGxlZCA9IGZhbHNlOworCisJX19pOTE1X3JlcXVlc3Rf
cmVzZXQocnEsIHN0YWxsZWQpOworCWludGVsX2xyX2NvbnRleHRfcmVzZXQoZW5naW5lLCBycS0+
aHdfY29udGV4dCwgcnEtPmhlYWQsIHN0YWxsZWQpOworCitvdXRfdW5sb2NrOgorCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmVuZ2luZS0+YWN0aXZlLmxvY2ssIGZsYWdzKTsKK30KKworc3RhdGlj
IHZvaWQgcHZfcmVzZXRfZmluaXNoKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkKK3sK
KwlzdHJ1Y3QgaW50ZWxfZW5naW5lX2V4ZWNsaXN0cyAqIGNvbnN0IGV4ZWNsaXN0cyA9ICZlbmdp
bmUtPmV4ZWNsaXN0czsKKworCWlmIChfX3Rhc2tsZXRfZW5hYmxlKCZleGVjbGlzdHMtPnRhc2ts
ZXQpKQorCQkvKiBBbmQga2ljayBpbiBjYXNlIHdlIG1pc3NlZCBhIG5ldyByZXF1ZXN0IHN1Ym1p
c3Npb24uICovCisJCXRhc2tsZXRfaGlfc2NoZWR1bGUoJmV4ZWNsaXN0cy0+dGFza2xldCk7CisK
KwlHRU1fVFJBQ0UoIiVzOiBkZXB0aC0+JWRcbiIsIGVuZ2luZS0+bmFtZSwKKwkJICBhdG9taWNf
cmVhZCgmZXhlY2xpc3RzLT50YXNrbGV0LmNvdW50KSk7Cit9CisKK3N0YXRpYyB2b2lkIHB2X2Nh
bmNlbF9yZXF1ZXN0cyhzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCit7CisJc3RydWN0
IGludGVsX2VuZ2luZV9leGVjbGlzdHMgKiBjb25zdCBleGVjbGlzdHMgPSAmZW5naW5lLT5leGVj
bGlzdHM7CisJc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsICpybjsKKwlzdHJ1Y3QgcmJfbm9kZSAq
cmI7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKworCUdFTV9UUkFDRSgiJXNcbiIsIGVuZ2luZS0+
bmFtZSk7CisKKwlzcGluX2xvY2tfaXJxc2F2ZSgmZW5naW5lLT5hY3RpdmUubG9jaywgZmxhZ3Mp
OworCisJLyogQ2FuY2VsIHRoZSByZXF1ZXN0cyBvbiB0aGUgSFcgYW5kIGNsZWFyIHRoZSBFTFNQ
IHRyYWNrZXIuICovCisJY2FuY2VsX3BvcnRfcmVxdWVzdHMoZXhlY2xpc3RzKTsKKworCS8qIE1h
cmsgYWxsIGV4ZWN1dGluZyByZXF1ZXN0cyBhcyBza2lwcGVkLiAqLworCWxpc3RfZm9yX2VhY2hf
ZW50cnkocnEsICZlbmdpbmUtPmFjdGl2ZS5yZXF1ZXN0cywgc2NoZWQubGluaykgeworCQlpZiAo
IWk5MTVfcmVxdWVzdF9zaWduYWxlZChycSkpCisJCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZycS0+
ZmVuY2UsIC1FSU8pOworCisJCWk5MTVfcmVxdWVzdF9tYXJrX2NvbXBsZXRlKHJxKTsKKwl9CisK
KwkvKiBGbHVzaCB0aGUgcXVldWVkIHJlcXVlc3RzIHRvIHRoZSB0aW1lbGluZSBsaXN0IChmb3Ig
cmV0aXJpbmcpLiAqLworCXdoaWxlICgocmIgPSByYl9maXJzdF9jYWNoZWQoJmV4ZWNsaXN0cy0+
cXVldWUpKSkgeworCQlzdHJ1Y3QgaTkxNV9wcmlvbGlzdCAqcCA9IHRvX3ByaW9saXN0KHJiKTsK
KwkJaW50IGk7CisKKwkJcHJpb2xpc3RfZm9yX2VhY2hfcmVxdWVzdF9jb25zdW1lKHJxLCBybiwg
cCwgaSkgeworCQkJbGlzdF9kZWxfaW5pdCgmcnEtPnNjaGVkLmxpbmspOworCQkJX19pOTE1X3Jl
cXVlc3Rfc3VibWl0KHJxKTsKKwkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnJxLT5mZW5jZSwgLUVJ
Tyk7CisJCQlpOTE1X3JlcXVlc3RfbWFya19jb21wbGV0ZShycSk7CisJCX0KKworCQlyYl9lcmFz
ZV9jYWNoZWQoJnAtPm5vZGUsICZleGVjbGlzdHMtPnF1ZXVlKTsKKwkJaTkxNV9wcmlvbGlzdF9m
cmVlKHApOworCX0KKworCWV4ZWNsaXN0cy0+cXVldWVfcHJpb3JpdHlfaGludCA9IElOVF9NSU47
CisJZXhlY2xpc3RzLT5xdWV1ZSA9IFJCX1JPT1RfQ0FDSEVEOworCisJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmZW5naW5lLT5hY3RpdmUubG9jaywgZmxhZ3MpOworfQorCit2b2lkIHZncHVfc2V0
X3B2X3N1Ym1pc3Npb24oc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQoreworCS8qCisJ
ICogV2UgaW5oZXJpdCBhIGJ1bmNoIG9mIGZ1bmN0aW9ucyBmcm9tIGV4ZWNsaXN0cyB0aGF0IHdl
J2QgbGlrZQorCSAqIHRvIGtlZXAgdXNpbmc6CisJICoKKwkgKiAgICBlbmdpbmUtPnN1Ym1pdF9y
ZXF1ZXN0ID0gZXhlY2xpc3RzX3N1Ym1pdF9yZXF1ZXN0OworCSAqICAgIGVuZ2luZS0+Y2FuY2Vs
X3JlcXVlc3RzID0gZXhlY2xpc3RzX2NhbmNlbF9yZXF1ZXN0czsKKwkgKiAgICBlbmdpbmUtPnNj
aGVkdWxlID0gZXhlY2xpc3RzX3NjaGVkdWxlOworCSAqCisJICogQnV0IHdlIG5lZWQgdG8gb3Zl
cnJpZGUgdGhlIGFjdHVhbCBzdWJtaXNzaW9uIGJhY2tlbmQgaW4gb3JkZXIKKwkgKiB0byB0YWxr
IHRvIHRoZSBHVlQgd2l0aCBQViBub3RpZmljYXRpb24gbWVzc2FnZS4KKwkgKi8KKworCWVuZ2lu
ZS0+ZXhlY2xpc3RzLnRhc2tsZXQuZnVuYyA9IHZncHVfcHZfc3VibWlzc2lvbl90YXNrbGV0Owor
CisJLyogZG8gbm90IHVzZSBleGVjbGlzdHMgcGFyay91bnBhcmsgKi8KKwllbmdpbmUtPnBhcmsg
PSBlbmdpbmUtPnVucGFyayA9IE5VTEw7CisKKwllbmdpbmUtPnJlc2V0LnByZXBhcmUgPSBwdl9y
ZXNldF9wcmVwYXJlOworCWVuZ2luZS0+cmVzZXQucmVzZXQgPSBwdl9yZXNldDsKKwllbmdpbmUt
PnJlc2V0LmZpbmlzaCA9IHB2X3Jlc2V0X2ZpbmlzaDsKKworCWVuZ2luZS0+Y2FuY2VsX3JlcXVl
c3RzID0gcHZfY2FuY2VsX3JlcXVlc3RzOworCisJZW5naW5lLT5mbGFncyAmPSB+STkxNV9FTkdJ
TkVfU1VQUE9SVFNfU1RBVFM7CisJZW5naW5lLT5mbGFncyB8PSBJOTE1X0VOR0lORV9ORUVEU19C
UkVBRENSVU1CX1RBU0tMRVQ7Cit9Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
