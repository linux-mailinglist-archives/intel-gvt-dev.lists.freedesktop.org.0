Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B251B2FAF1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 May 2019 13:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28D6E150;
	Thu, 30 May 2019 11:33:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56106E150
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 May 2019 11:33:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 04:33:13 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 30 May 2019 04:33:12 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: do not reference a virtual address after
 kunmap
Date: Thu, 30 May 2019 07:27:20 -0400
Message-Id: <20190530112720.8630-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530080906.30941-1-yan.y.zhao@intel.com>
References: <20190530080906.30941-1-yan.y.zhao@intel.com>
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

c3RvcmUgdGhlIGNvbnRleHQgY3RsIHZhbHVlIGludG8gbG9jYWwgdmFyaWFibGUsIHNvIGFzIG5v
dCB0byByZWZlcmVuY2UKYSB2aXJ0dWFsIGFkZHJlc3MgYWZ0ZXIga3VubWFwCgp2MjogdXNlIGxv
Y2FsIHZhcmlhYmxlIHRvIGF2b2lkIHJlZmVyZW5jaW5nIHZhZGRyIGFmdGVyIGt1bm1hcAoKU2ln
bmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1
bGVyLmMKaW5kZXggMzUzYjRkMGRhNmI0Li40ZTQ0ZDcwZmE3NzIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMKQEAgLTEzMiw2ICsxMzIsNyBAQCBzdGF0aWMgaW50IHBvcHVsYXRl
X3NoYWRvd19jb250ZXh0KHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkKIAl2
b2lkICpkc3Q7CiAJdW5zaWduZWQgbG9uZyBjb250ZXh0X2dwYSwgY29udGV4dF9wYWdlX251bTsK
IAlpbnQgaTsKKwl1MzIgY3R4X2N0cmxfdmFsOwogCiAJcGFnZSA9IGk5MTVfZ2VtX29iamVjdF9n
ZXRfcGFnZShjdHhfb2JqLCBMUkNfU1RBVEVfUE4pOwogCXNoYWRvd19yaW5nX2NvbnRleHQgPSBr
bWFwKHBhZ2UpOwpAQCAtMTUwLDYgKzE1MSw4IEBAIHN0YXRpYyBpbnQgcG9wdWxhdGVfc2hhZG93
X2NvbnRleHQoc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQogCUNPUFlfUkVH
X01BU0tFRChjdHhfY3RybCk7CiAJQ09QWV9SRUcoY3R4X3RpbWVzdGFtcCk7CiAKKwljdHhfY3Ry
bF92YWwgPSBzaGFkb3dfcmluZ19jb250ZXh0LT5jdHhfY3RybC52YWw7CisKIAlpZiAocmluZ19p
ZCA9PSBSQ1MwKSB7CiAJCUNPUFlfUkVHKGJiX3Blcl9jdHhfcHRyKTsKIAkJQ09QWV9SRUcocmNz
X2luZGlyZWN0X2N0eCk7CkBAIC0xNjgsNyArMTcxLDcgQEAgc3RhdGljIGludCBwb3B1bGF0ZV9z
aGFkb3dfY29udGV4dChzdHJ1Y3QgaW50ZWxfdmdwdV93b3JrbG9hZCAqd29ya2xvYWQpCiAJc3Jf
b2FfcmVncyh3b3JrbG9hZCwgKHUzMiAqKXNoYWRvd19yaW5nX2NvbnRleHQsIGZhbHNlKTsKIAlr
dW5tYXAocGFnZSk7CiAKLQlpZiAoSVNfUkVTVE9SRV9JTkhJQklUKHNoYWRvd19yaW5nX2NvbnRl
eHQtPmN0eF9jdHJsLnZhbCkpCisJaWYgKElTX1JFU1RPUkVfSU5ISUJJVChjdHhfY3RybF92YWwp
KQogCQlyZXR1cm4gMDsKIAogCWd2dF9kYmdfc2NoZWQoInJpbmcgaWQgJWQgd29ya2xvYWQgbHJj
YSAleCIsIHJpbmdfaWQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
