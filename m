Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB6C22B43
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 07:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0045B891B1;
	Mon, 20 May 2019 05:42:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42415891AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 05:42:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 22:42:18 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga006.jf.intel.com with ESMTP; 19 May 2019 22:42:16 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH 2/2] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Date: Mon, 20 May 2019 13:36:49 +0800
Message-Id: <20190520053649.5906-3-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520053649.5906-1-tina.zhang@intel.com>
References: <20190520053649.5906-1-tina.zhang@intel.com>
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

SW4gc3RhY2ssIGludGVsX2d2dF9ndHRfZW50cnkgbmVlZHMgdG8gYmUgaW5pdGlhbGl6ZWQgYmVm
b3JlCmJlaW5nIHVzZWQsIGFzIHRoZSBmaWVsZHMgbWF5IGhhdmUgc29tZSBnYXJiYWdlIHZhbHVl
cy4KClcvbyB0aGlzIHBhdGNoLCBzZXRfZ2d0dF9lbnRyeSBwcmludHM6Ci0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KMjc0LjA0Njg0MDogc2V0X2dndHRfZW50cnk6IHZncHUx
OnNldCBnZ3R0IGVudHJ5IDB4OWJlZDgwMDBmZmZmZTkwMAoyNzQuMDQ2ODQ2OiBzZXRfZ2d0dF9l
bnRyeTogdmdwdTE6c2V0IGdndHQgZW50cnkgMHhlNTVkZjAwMQoyNzQuMDQ2ODUyOiBzZXRfZ2d0
dF9lbnRyeTogdmdwdTE6c2V0IGdndHQgZW50cnkgMHg5YmVkODAwMGZmZmZlOTAwCgoweDliZWQ4
MDAwIGlzIHRoZSBzdGFjayBncmFiYWdlLgoKVy8gdGhpcyBwYXRjaCwgc2V0X2dndHRfZW50cnkg
cHJpbnRzOgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KMjc0LjA0Njg0MDog
c2V0X2dndHRfZW50cnk6IHZncHUxOnNldCBnZ3R0IGVudHJ5IDB4ZmZmZmU5MDAKMjc0LjA0Njg0
Njogc2V0X2dndHRfZW50cnk6IHZncHUxOnNldCBnZ3R0IGVudHJ5IDB4ZTU1ZGYwMDEKMjc0LjA0
Njg1Mjogc2V0X2dndHRfZW50cnk6IHZncHUxOnNldCBnZ3R0IGVudHJ5IDB4ZmZmZmU5MDAKClNp
Z25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKaW5kZXgg
ZGNjMjA3ZjA0Yjc1Li5iY2I2NDkyODU3MDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTIx
OTMsNyArMjE5Myw3IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21taW9fd3JpdGUoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCiAJLyogdGhlIFZNIG1heSBjb25m
aWd1cmUgdGhlIHdob2xlIEdNIHNwYWNlIHdoZW4gYmFsbG9vbmluZyBpcyB1c2VkICovCiAJaWYg
KCF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIGdtYSkpCiAJCXJldHVybiAwOwotCisJZS52YWw2
NCA9IDA7CiAJZS50eXBlID0gR1RUX1RZUEVfR0dUVF9QVEU7CiAJbWVtY3B5KCh2b2lkICopJmUu
dmFsNjQgKyAob2ZmICYgKGluZm8tPmd0dF9lbnRyeV9zaXplIC0gMSkpLCBwX2RhdGEsCiAJCQli
eXRlcyk7CkBAIC0yMjQ2LDcgKzIyNDYsOCBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlv
X3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAogCiAJaWYg
KCFwYXJ0aWFsX3VwZGF0ZSAmJiAob3BzLT50ZXN0X3ByZXNlbnQoJmUpKSkgewogCQlnZm4gPSBv
cHMtPmdldF9wZm4oJmUpOwotCQltID0gZTsKKwkJbS52YWw2NCA9IGUudmFsNjQ7CisJCW0udHlw
ZSA9IGUudHlwZTsKIAogCQkvKiBvbmUgUFRFIHVwZGF0ZSBtYXkgYmUgaXNzdWVkIGluIG11bHRp
cGxlIHdyaXRlcyBhbmQgdGhlCiAJCSAqIGZpcnN0IHdyaXRlIG1heSBub3QgY29uc3RydWN0IGEg
dmFsaWQgZ2ZuCkBAIC0yMjY4LDYgKzIyNjksOCBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9t
bWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAogCQl9
IGVsc2UKIAkJCW9wcy0+c2V0X3BmbigmbSwgZG1hX2FkZHIgPj4gUEFHRV9TSElGVCk7CiAJfSBl
bHNlIHsKKwkJbS52YWw2NCA9IDA7CisJCW0udHlwZSA9IEdUVF9UWVBFX0dHVFRfUFRFOwogCQlv
cHMtPnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKIAkJb3BzLT5jbGVhcl9wcmVz
ZW50KCZtKTsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
