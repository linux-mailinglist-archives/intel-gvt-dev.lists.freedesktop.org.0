Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE81E816
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 May 2019 08:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB863894EA;
	Wed, 15 May 2019 06:02:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B59894EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 May 2019 06:02:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 23:02:36 -0700
X-ExtLoop1: 1
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.50])
 by fmsmga001.fm.intel.com with ESMTP; 14 May 2019 23:02:35 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: cancel dma map only for not present ggtt entry
Date: Wed, 15 May 2019 14:05:59 +0800
Message-Id: <20190515060559.7506-1-xiaolin.zhang@intel.com>
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
dCB3aXRoCmludGVsIGlvbW11IG9uLgoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlh
b2xpbi56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5j
IHwgMTcgKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCBjMmY3ZDIwZjYzNDYu
LjZkMDIxZDgzMGYzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtMjI0Myw3ICsyMjQzLDEy
IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUg
KnZncHUsIHVuc2lnbmVkIGludCBvZmYsCiAJCX0KIAl9CiAKLQlpZiAoIXBhcnRpYWxfdXBkYXRl
ICYmIChvcHMtPnRlc3RfcHJlc2VudCgmZSkpKSB7CisJaWYgKCFvcHMtPnRlc3RfcHJlc2VudCgm
ZSkpIHsKKwkJZ2d0dF9nZXRfaG9zdF9lbnRyeShnZ3R0X21tLCAmbSwgZ19ndHRfaW5kZXgpOwor
CQlnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZtKTsKKwkJb3BzLT5zZXRfcGZuKCZtLCBndnQt
Pmd0dC5zY3JhdGNoX21mbik7CisJCW9wcy0+Y2xlYXJfcHJlc2VudCgmbSk7CisJfSBlbHNlIGlm
ICghcGFydGlhbF91cGRhdGUgJiYgKG9wcy0+dGVzdF9wcmVzZW50KCZlKSkpIHsKIAkJZ2ZuID0g
b3BzLT5nZXRfcGZuKCZlKTsKIAkJbSA9IGU7CiAKQEAgLTIyNjYsMTkgKzIyNzEsMTEgQEAgc3Rh
dGljIGludCBlbXVsYXRlX2dndHRfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwg
dW5zaWduZWQgaW50IG9mZiwKIAkJCW9wcy0+c2V0X3BmbigmbSwgZ3Z0LT5ndHQuc2NyYXRjaF9t
Zm4pOwogCQl9IGVsc2UKIAkJCW9wcy0+c2V0X3BmbigmbSwgZG1hX2FkZHIgPj4gUEFHRV9TSElG
VCk7Ci0JfSBlbHNlIHsKLQkJb3BzLT5zZXRfcGZuKCZtLCBndnQtPmd0dC5zY3JhdGNoX21mbik7
Ci0JCW9wcy0+Y2xlYXJfcHJlc2VudCgmbSk7CiAJfQotCiBvdXQ6Ci0JZ2d0dF9zZXRfZ3Vlc3Rf
ZW50cnkoZ2d0dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKLQotCWdndHRfZ2V0X2hvc3RfZW50cnko
Z2d0dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKLQlnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZl
KTsKLQogCWdndHRfc2V0X2hvc3RfZW50cnkoZ2d0dF9tbSwgJm0sIGdfZ3R0X2luZGV4KTsKIAln
Z3R0X2ludmFsaWRhdGUoZ3Z0LT5kZXZfcHJpdik7CisJZ2d0dF9zZXRfZ3Vlc3RfZW50cnkoZ2d0
dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
