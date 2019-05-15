Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82B1E9EE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 May 2019 10:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C34892B6;
	Wed, 15 May 2019 08:15:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBBE892B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 May 2019 08:15:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 01:15:58 -0700
X-ExtLoop1: 1
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.50])
 by orsmga006.jf.intel.com with ESMTP; 15 May 2019 01:15:57 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: cancel dma map only for not present ggtt
 entry
Date: Wed, 15 May 2019 16:19:21 +0800
Message-Id: <20190515081921.4394-1-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.15.1
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

b25seSBjYW5jZWwgZ2d0dCBlbnRyeSBkbWEgbWFwIGZvciBpbnZhbGlkIGdndHQgZW50cnksIGRv
bid0IGRvIGl0CmZvciBwYXJpdGlhbCB1cGRhdGUgb3Igb2xkIGdndHQgZW50cnkuCgp0aGlzIGNo
YW5nZSBjYW4gYWRkcmVzcyBETUEgImZhdWx0IHJlYXNvbiAyMyIgaXNzdWUgZm9yIHdpbiBndWVz
dCB3aXRoCmludGVsIGlvbW11IG9uLgoKdjI6IHVwZGF0ZSBoYW5kbGluZyBvZiBnZ3R0IHBhcnRp
YWwgdXBkYXRlIChaaGVueXUsIFlhbiwgSGVucnkpCgpTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpo
YW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMgfCAyMSArKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCBj
MmY3ZDIwZjYzNDYuLjQ4NTZiOWZlYzQxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtMjI0
MywxMCArMjI0MywyMSBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAogCQl9CiAJfQogCi0JaWYgKCFw
YXJ0aWFsX3VwZGF0ZSAmJiAob3BzLT50ZXN0X3ByZXNlbnQoJmUpKSkgeworCWlmICghb3BzLT50
ZXN0X3ByZXNlbnQoJmUpKSB7CisJCWdndHRfZ2V0X2hvc3RfZW50cnkoZ2d0dF9tbSwgJm0sIGdf
Z3R0X2luZGV4KTsKKwkJZ2d0dF9pbnZhbGlkYXRlX3B0ZSh2Z3B1LCAmbSk7CisJCW9wcy0+c2V0
X3BmbigmbSwgZ3Z0LT5ndHQuc2NyYXRjaF9tZm4pOworCQlvcHMtPmNsZWFyX3ByZXNlbnQoJm0p
OworCX0gZWxzZSB7CiAJCWdmbiA9IG9wcy0+Z2V0X3BmbigmZSk7CiAJCW0gPSBlOwogCisJCWlm
IChwYXJ0aWFsX3VwZGF0ZSkgeworCQkJb3BzLT5zZXRfcGZuKCZtLCBndnQtPmd0dC5zY3JhdGNo
X21mbik7CisJCQlvcHMtPmNsZWFyX3ByZXNlbnQoJm0pOworCQkJZ290byBvdXQ7CisJCX0KKwog
CQkvKiBvbmUgUFRFIHVwZGF0ZSBtYXkgYmUgaXNzdWVkIGluIG11bHRpcGxlIHdyaXRlcyBhbmQg
dGhlCiAJCSAqIGZpcnN0IHdyaXRlIG1heSBub3QgY29uc3RydWN0IGEgdmFsaWQgZ2ZuCiAJCSAq
LwpAQCAtMjI2NiwxNyArMjI3Nyw5IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21taW9fd3Jp
dGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCiAJCQlvcHMtPnNl
dF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKIAkJfSBlbHNlCiAJCQlvcHMtPnNldF9w
Zm4oJm0sIGRtYV9hZGRyID4+IFBBR0VfU0hJRlQpOwotCX0gZWxzZSB7Ci0JCW9wcy0+c2V0X3Bm
bigmbSwgZ3Z0LT5ndHQuc2NyYXRjaF9tZm4pOwotCQlvcHMtPmNsZWFyX3ByZXNlbnQoJm0pOwog
CX0KLQogb3V0OgogCWdndHRfc2V0X2d1ZXN0X2VudHJ5KGdndHRfbW0sICZlLCBnX2d0dF9pbmRl
eCk7Ci0KLQlnZ3R0X2dldF9ob3N0X2VudHJ5KGdndHRfbW0sICZlLCBnX2d0dF9pbmRleCk7Ci0J
Z2d0dF9pbnZhbGlkYXRlX3B0ZSh2Z3B1LCAmZSk7Ci0KIAlnZ3R0X3NldF9ob3N0X2VudHJ5KGdn
dHRfbW0sICZtLCBnX2d0dF9pbmRleCk7CiAJZ2d0dF9pbnZhbGlkYXRlKGd2dC0+ZGV2X3ByaXYp
OwogCXJldHVybiAwOwotLSAKMi4xNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
