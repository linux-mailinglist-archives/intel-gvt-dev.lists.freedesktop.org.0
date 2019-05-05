Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2913E8C
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  5 May 2019 11:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9885892BC;
	Sun,  5 May 2019 09:03:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20D892BC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  5 May 2019 09:03:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 May 2019 02:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,433,1549958400"; d="scan'208";a="321617294"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by orsmga005.jf.intel.com with ESMTP; 05 May 2019 02:03:45 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio list
Date: Sun,  5 May 2019 17:03:58 +0800
Message-Id: <20190505090358.16164-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Colin Xu <colin.xu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KCkRlcGVuZHMgb24gR0VOIGZhbWls
eSBhbmQgSTkxNV9QQVJBTV9IQVNfQ09OVEVYVF9JU09MQVRJT04sIE1lc2EgZHJpdmVyCndpbGwg
ZGVjaWRlIHdoZXRoZXIgY29uc3RhbnQgYnVmZmVyIDAgYWRkcmVzcyBpcyByZWxhdGl2ZSBvciBh
YnNvbHV0ZSwKYW5kIGxvYWQgR1BVIGluaXRpYWwgc3RhdGUgYnkgbHJpIHRvIGNvbnRleHQgbW1p
byBJTlNUUE0gKEdFTjgpCm9yIDB4MjBEOCAoPj1HRU45KS4KTWVzYSBDb21taXQgZmE4YTc2NGI2
MgooImk5NjU6IFVzZSBhYnNvbHV0ZSBhZGRyZXNzaW5nIGZvciBjb25zdGFudCBidWZmZXIgMCBv
biBLZXJuZWwgNC4xNisuIikKCklOU1RQTSBpcyBhbHJlYWR5IGFkZGVkIHRvIGdlbjhfZW5naW5l
X21taW9fbGlzdCwgYnV0IDB4MjBEOCBpcyBtaXNzZWQKaW4gZ2VuOV9lbmdpbmVfbW1pb19saXN0
LiBGcm9tIEdWVCBwb2ludCBvZiB2aWV3LCBkaWZmZXJlbnQgZ3Vlc3QgY291bGQKaGF2ZSBkaWZm
ZXJlbnQgY29udGV4dCBzbyBzaG91bGQgc3dpdGNoIHRob3NlIG1taW8gYWNjb3JkaW5nbHkuCgp2
MjogVXBkYXRlIGZpeGVzIGNvbW1pdCBJRC4KCkZpeGVzOiAxNzg2NTcxMzkzMDcgKCJkcm0vaTkx
NS9ndnQ6IHZHUFUgY29udGV4dCBzd2l0Y2giKQpSZXZpZXdlZC1ieTogWmhlbnl1IFdhbmcgPHpo
ZW55dXdAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVA
aW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRl
bC5jb20+CihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDFlOGIxNWExOTg4ZWQzYzc0Mjk0MDIw
MTdkNTg5NDIyNjI4Y2RmNDcpCi0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29u
dGV4dC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKaW5kZXggZTdlMTRjODQyYmU0Li5lZGY2ZDY0NmVi
MjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKQEAgLTEzMiw2ICsx
MzIsNyBAQCBzdGF0aWMgc3RydWN0IGVuZ2luZV9tbWlvIGdlbjlfZW5naW5lX21taW9fbGlzdFtd
IF9fY2FjaGVsaW5lX2FsaWduZWQgPSB7CiAKIAl7UkNTMCwgR0VOOV9HQU1UX0VDT19SRUdfUldf
SUEsIDB4MCwgZmFsc2V9LCAvKiAweDRhYjAgKi8KIAl7UkNTMCwgR0VOOV9DU0ZFX0NISUNLRU4x
X1JDUywgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjBkNCAqLworCXtSQ1MwLCBfTU1JTygweDIwRDgp
LCAweGZmZmYsIHRydWV9LCAvKiAweDIwZDggKi8KIAogCXtSQ1MwLCBHRU44X0dBUkJDTlRMLCAw
eDAsIGZhbHNlfSwgLyogMHhiMDA0ICovCiAJe1JDUzAsIEdFTjdfRkZfVEhSRUFEX01PREUsIDB4
MCwgZmFsc2V9LCAvKiAweDIwYTAgKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
