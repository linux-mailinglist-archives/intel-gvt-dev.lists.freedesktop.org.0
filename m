Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978D27236
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 00:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBD189C88;
	Wed, 22 May 2019 22:24:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB2089C88
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2019 22:24:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 15:24:03 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga002.jf.intel.com with ESMTP; 22 May 2019 15:24:02 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v2] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Date: Thu, 23 May 2019 06:18:36 +0800
Message-Id: <20190522221836.3777-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U3RhY2sgc3RydWN0IGludGVsX2d2dF9ndHRfZW50cnkgdmFsdWUgbmVlZHMgdG8gYmUgaW5pdGlh
bGl6ZWQgYmVmb3JlCmJlaW5nIHVzZWQsIGFzIHRoZSBmaWVsZHMgbWF5IGNvbnRhaW4gZ2FyYmFn
ZSB2YWx1ZXMuCgpXL28gdGhpcyBwYXRjaCwgc2V0X2dndHRfZW50cnkgcHJpbnRzOgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCjI3NC4wNDY4NDA6IHNldF9nZ3R0X2VudHJ5
OiB2Z3B1MTpzZXQgZ2d0dCBlbnRyeSAweDliZWQ4MDAwZmZmZmU5MDAKMjc0LjA0Njg0Njogc2V0
X2dndHRfZW50cnk6IHZncHUxOnNldCBnZ3R0IGVudHJ5IDB4ZTU1ZGYwMDEKMjc0LjA0Njg1Mjog
c2V0X2dndHRfZW50cnk6IHZncHUxOnNldCBnZ3R0IGVudHJ5IDB4OWJlZDgwMDBmZmZmZTkwMAoK
MHg5YmVkODAwMCBpcyB0aGUgc3RhY2sgZ3JhYmFnZS4KClcvIHRoaXMgcGF0Y2gsIHNldF9nZ3R0
X2VudHJ5IHByaW50czoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCjI3NC4w
NDY4NDA6IHNldF9nZ3R0X2VudHJ5OiB2Z3B1MTpzZXQgZ2d0dCBlbnRyeSAweGZmZmZlOTAwCjI3
NC4wNDY4NDY6IHNldF9nZ3R0X2VudHJ5OiB2Z3B1MTpzZXQgZ2d0dCBlbnRyeSAweGU1NWRmMDAx
CjI3NC4wNDY4NTI6IHNldF9nZ3R0X2VudHJ5OiB2Z3B1MTpzZXQgZ2d0dCBlbnRyeSAweGZmZmZl
OTAwCgp2MjoKLSBJbml0aWFsaXplIGR1cmluZyBkZWNsYXJhdGlvbi4gKFpoZW55dSkKCkZpeGVz
OiA3NTk4ZTg3MDBlOWEoZHJtL2k5MTUvZ3Z0OiBNaXNzZWQgdG8gY2FuY2VsIGRtYSBtYXAgZm9y
IGdndHQgZW50cmllcykKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NC4yMCsKQ2M6IFpo
ZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGluYSBa
aGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IDE1MjE2YzViNDBhYS4uZWJjMWU1
MjI4YmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC0yMTc5LDcgKzIxNzksOCBAQCBzdGF0
aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1
bnNpZ25lZCBpbnQgb2ZmLAogCXN0cnVjdCBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMgKm9wcyA9IGd2
dC0+Z3R0LnB0ZV9vcHM7CiAJdW5zaWduZWQgbG9uZyBnX2d0dF9pbmRleCA9IG9mZiA+PiBpbmZv
LT5ndHRfZW50cnlfc2l6ZV9zaGlmdDsKIAl1bnNpZ25lZCBsb25nIGdtYSwgZ2ZuOwotCXN0cnVj
dCBpbnRlbF9ndnRfZ3R0X2VudHJ5IGUsIG07CisJc3RydWN0IGludGVsX2d2dF9ndHRfZW50cnkg
ZSA9IHsudmFsNjQgPSAwLCAudHlwZSA9IEdUVF9UWVBFX0dHVFRfUFRFfTsKKwlzdHJ1Y3QgaW50
ZWxfZ3Z0X2d0dF9lbnRyeSBtID0gey52YWw2NCA9IDAsIC50eXBlID0gR1RUX1RZUEVfR0dUVF9Q
VEV9OwogCWRtYV9hZGRyX3QgZG1hX2FkZHI7CiAJaW50IHJldDsKIAlzdHJ1Y3QgaW50ZWxfZ3Z0
X3BhcnRpYWxfcHRlICpwYXJ0aWFsX3B0ZSwgKnBvcywgKm47CkBAIC0yMjQ2LDcgKzIyNDcsOCBA
QCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAogCiAJaWYgKCFwYXJ0aWFsX3VwZGF0ZSAmJiAob3BzLT50
ZXN0X3ByZXNlbnQoJmUpKSkgewogCQlnZm4gPSBvcHMtPmdldF9wZm4oJmUpOwotCQltID0gZTsK
KwkJbS52YWw2NCA9IGUudmFsNjQ7CisJCW0udHlwZSA9IGUudHlwZTsKIAogCQkvKiBvbmUgUFRF
IHVwZGF0ZSBtYXkgYmUgaXNzdWVkIGluIG11bHRpcGxlIHdyaXRlcyBhbmQgdGhlCiAJCSAqIGZp
cnN0IHdyaXRlIG1heSBub3QgY29uc3RydWN0IGEgdmFsaWQgZ2ZuCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
