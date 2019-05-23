Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F191F273EF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 03:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C291289C5E;
	Thu, 23 May 2019 01:21:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66989C5E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 01:21:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 18:21:43 -0700
X-ExtLoop1: 1
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.54])
 by fmsmga007.fm.intel.com with ESMTP; 22 May 2019 18:21:42 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V3] drm/i915/gvt: save RING_HEAD into vreg when vgpu switched
 out
Date: Thu, 23 May 2019 09:21:41 +0800
Message-Id: <1558574501-8229-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

dG8gc2F2ZSBSSU5HX0hFQUQgaW50byB2Z3B1IHJlZyB3aGVuIHZncHUgc3dpdGNoZWQgb3V0IGFu
ZCByZXBvcnQKaXQncyB2YWx1ZSBiYWNrIHRvIGd1ZXN0LgoKdjM6IHNhdmUgUklORyBIRUFEL1RB
SUwgdmdwdSByZWcgaW4gc2F2ZV9yaW5nX2h3X3N0YXRlLiAoWmhlbnl1IFdhbmcpCnYyOiBzYXZl
IFJJTkdfVEFJTCBhcyB3ZWxsIGR1cmluZyB2Z3B1IG1taW8gc3dpdGNoIHRvIG1lZXQgcmluZ19p
c19pZGxlCmNvbmRpdGlvbi4gKEZyZWQgR2FvKQp2MTogYmFzZWQgb24gaW5wdXQgZnJvbSBXZWlu
YW4uIChXZWluYW4gTGkpCgpGaXhlczogNTE5YTAxOTQ5MWI4ICgiZHJtL2k5MTUvaGFuZ2NoZWNr
OiBSZXBsYWNlIGhhbmdjaGVjay5zZXFubyB3aXRoIFJJTkdfSEVBRCIpCgpTaWduZWQtb2ZmLWJ5
OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1
bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKaW5kZXggMzg4OTdk
Mi4uMzUzYjRkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwpAQCAtMjE4LDYg
KzIxOCwxMCBAQCBzdGF0aWMgdm9pZCBzYXZlX3JpbmdfaHdfc3RhdGUoc3RydWN0IGludGVsX3Zn
cHUgKnZncHUsIGludCByaW5nX2lkKQogCXZncHVfdnJlZyh2Z3B1LCBpOTE1X21taW9fcmVnX29m
ZnNldChyZWcpKSA9IEk5MTVfUkVBRF9GVyhyZWcpOwogCXJlZyA9IFJJTkdfQUNUSERfVURXKHJp
bmdfYmFzZSk7CiAJdmdwdV92cmVnKHZncHUsIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpID0g
STkxNV9SRUFEX0ZXKHJlZyk7CisJcmVnID0gUklOR19IRUFEKHJpbmdfYmFzZSk7CisJdmdwdV92
cmVnKHZncHUsIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpID0gSTkxNV9SRUFEX0ZXKHJlZyk7
CisJcmVnID0gUklOR19UQUlMKHJpbmdfYmFzZSk7CisJdmdwdV92cmVnKHZncHUsIGk5MTVfbW1p
b19yZWdfb2Zmc2V0KHJlZykpID0gSTkxNV9SRUFEX0ZXKHJlZyk7CiB9CiAKIHN0YXRpYyBpbnQg
c2hhZG93X2NvbnRleHRfc3RhdHVzX2NoYW5nZShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
