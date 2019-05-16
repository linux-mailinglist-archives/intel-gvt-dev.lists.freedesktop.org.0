Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445320354
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 May 2019 12:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192848925F;
	Thu, 16 May 2019 10:22:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7658925F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 May 2019 10:22:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 03:22:06 -0700
X-ExtLoop1: 1
Received: from tinazhang-linux-1.bj.intel.com ([10.238.158.97])
 by orsmga002.jf.intel.com with ESMTP; 16 May 2019 03:22:05 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Date: Thu, 16 May 2019 18:16:46 +0800
Message-Id: <1558001806-28225-1-git-send-email-tina.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW4gc3RhY2ssIGludGVsX2d2dF9ndHRfZW50cnkgdmFsdWVzIG5lZWQgdG8gYmUgaW5pdGlhbGl6
ZWQgYmVmb3JlCmJlaW5nIHVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCA3ICsr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IGMyZjdkMjAuLjZkZjZlMGIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMKQEAgLTIxOTIsNyArMjE5Miw3IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21t
aW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCiAJLyog
dGhlIFZNIG1heSBjb25maWd1cmUgdGhlIHdob2xlIEdNIHNwYWNlIHdoZW4gYmFsbG9vbmluZyBp
cyB1c2VkICovCiAJaWYgKCF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIGdtYSkpCiAJCXJldHVy
biAwOwotCisJZS52YWw2NCA9IDA7CiAJZS50eXBlID0gR1RUX1RZUEVfR0dUVF9QVEU7CiAJbWVt
Y3B5KCh2b2lkICopJmUudmFsNjQgKyAob2ZmICYgKGluZm8tPmd0dF9lbnRyeV9zaXplIC0gMSkp
LCBwX2RhdGEsCiAJCQlieXRlcyk7CkBAIC0yMjQ1LDcgKzIyNDUsOCBAQCBzdGF0aWMgaW50IGVt
dWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBp
bnQgb2ZmLAogCiAJaWYgKCFwYXJ0aWFsX3VwZGF0ZSAmJiAob3BzLT50ZXN0X3ByZXNlbnQoJmUp
KSkgewogCQlnZm4gPSBvcHMtPmdldF9wZm4oJmUpOwotCQltID0gZTsKKwkJbS52YWw2NCA9IGUu
dmFsNjQ7CisJCW0udHlwZSA9IGUudHlwZTsKIAogCQkvKiBvbmUgUFRFIHVwZGF0ZSBtYXkgYmUg
aXNzdWVkIGluIG11bHRpcGxlIHdyaXRlcyBhbmQgdGhlCiAJCSAqIGZpcnN0IHdyaXRlIG1heSBu
b3QgY29uc3RydWN0IGEgdmFsaWQgZ2ZuCkBAIC0yMjY3LDYgKzIyNjgsOCBAQCBzdGF0aWMgaW50
IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25l
ZCBpbnQgb2ZmLAogCQl9IGVsc2UKIAkJCW9wcy0+c2V0X3BmbigmbSwgZG1hX2FkZHIgPj4gUEFH
RV9TSElGVCk7CiAJfSBlbHNlIHsKKwkJbS52YWw2NCA9IDA7CisJCW0udHlwZSA9IEdUVF9UWVBF
X0dHVFRfUFRFOwogCQlvcHMtPnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKIAkJ
b3BzLT5jbGVhcl9wcmVzZW50KCZtKTsKIAl9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
