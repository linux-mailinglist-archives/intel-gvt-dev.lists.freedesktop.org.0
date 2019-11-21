Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BA104A79
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Nov 2019 06:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B024F6EAC9;
	Thu, 21 Nov 2019 05:57:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A016EAC9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 05:57:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 21:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="290210623"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by orsmga001.jf.intel.com with ESMTP; 20 Nov 2019 21:57:13 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix cmd length check for MI_ATOMIC
Date: Thu, 21 Nov 2019 13:57:45 +0800
Message-Id: <20191121055745.12723-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q29ycmVjdCB2YWxpZCBjb21tYW5kIGxlbmd0aCBjaGVjayBmb3IgTUlfQVRPTUlDLCBuZWVkIHRv
IGNoZWNrIGlubGluZQpkYXRhIGF2YWlsYWJsZSBmaWVsZCBpbnN0ZWFkIG9mIG9wZXJhbmQgZGF0
YSBsZW5ndGggZm9yIHdob2xlIGNvbW1hbmQuCgpGaXhlczogMDBhMzNiZTQwNjM0ICgiZHJtL2k5
MTUvZ3Z0OiBBZGQgdmFsaWQgbGVuZ3RoIGNoZWNrIGZvciBNSSB2YXJpYWJsZSBjb21tYW5kcyIp
CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6
aGVueXV3QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21k
X3BhcnNlci5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9w
YXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggNmEz
YWM4Y2RlOTVkLi4yMWExNzZjZDhhY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9jbWRfcGFyc2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuYwpAQCAtMTU5OSw5ICsxNTk5LDkgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9vcF8y
ZihzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCiAJaWYgKCEoY21kX3ZhbChzLCAwKSAmICgx
IDw8IDIyKSkpCiAJCXJldHVybiByZXQ7CiAKLQkvKiBjaGVjayBpZiBRV09SRCAqLwotCWlmIChE
V09SRF9GSUVMRCgwLCAyMCwgMTkpID09IDEpCi0JCXZhbGlkX2xlbiArPSA4OworCS8qIGNoZWNr
IGlubGluZSBkYXRhICovCisJaWYgKGNtZF92YWwocywgMCkgJiBCSVQoMTgpKQorCQl2YWxpZF9s
ZW4gPSBDTURfTEVOKDkpOwogCXJldCA9IGd2dF9jaGVja192YWxpZF9jbWRfbGVuZ3RoKGNtZF9s
ZW5ndGgocyksCiAJCQl2YWxpZF9sZW4pOwogCWlmIChyZXQpCi0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
