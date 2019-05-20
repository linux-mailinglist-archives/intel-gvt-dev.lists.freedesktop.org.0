Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C919322B42
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 07:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A59891AF;
	Mon, 20 May 2019 05:42:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F8D891AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 05:42:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 22:42:17 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga006.jf.intel.com with ESMTP; 19 May 2019 22:42:15 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH 1/2] drm/i915/gvt: Add set_ggtt_entry tracing event
Date: Mon, 20 May 2019 13:36:48 +0800
Message-Id: <20190520053649.5906-2-tina.zhang@intel.com>
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

QWRkIHNldF9nZ3R0X2VudHJ5IHRyYWNpbmcgZXZlbnQuCgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpo
YW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZS5oIHwgMTkgKysr
KysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jCmluZGV4IGMyZjdkMjBmNjM0Ni4uZGNjMjA3ZjA0Yjc1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jCkBAIC02MjksNiArNjI5LDcgQEAgc3RhdGljIHZvaWQgZ2d0dF9zZXRf
aG9zdF9lbnRyeShzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqbW0sCiAJc3RydWN0IGludGVsX2d2dF9n
dHRfcHRlX29wcyAqcHRlX29wcyA9IG1tLT52Z3B1LT5ndnQtPmd0dC5wdGVfb3BzOwogCiAJR0VN
X0JVR19PTihtbS0+dHlwZSAhPSBJTlRFTF9HVlRfTU1fR0dUVCk7CisJdHJhY2Vfc2V0X2dndHRf
ZW50cnkobW0tPnZncHUtPmlkLCBlbnRyeS0+dmFsNjQpOwogCiAJcHRlX29wcy0+c2V0X2VudHJ5
KE5VTEwsIGVudHJ5LCBpbmRleCwgZmFsc2UsIDAsIG1tLT52Z3B1KTsKIH0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L3RyYWNlLmgKaW5kZXggNmQ3ODc3NTBkMjc5Li42OWMzNzQ4NjgxNDYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC90cmFjZS5oCkBAIC0zNzMsNiArMzczLDI1IEBAIFRSQUNFX0VWRU5UKHJlbmRlcl9t
bWlvLAogCQkgIF9fZW50cnktPm9sZF92YWwsIF9fZW50cnktPm5ld192YWwpCiApOwogCitUUkFD
RV9FVkVOVChzZXRfZ2d0dF9lbnRyeSwKKwlUUF9QUk9UTyhpbnQgaWQsIHVuc2lnbmVkIGxvbmcg
YWRkcmVzcyksCisKKwlUUF9BUkdTKGlkLCBhZGRyZXNzKSwKKworCVRQX1NUUlVDVF9fZW50cnko
CisJCV9fZmllbGQoaW50LCBpZCkKKwkJX19maWVsZCh1bnNpZ25lZCBsb25nLCBhZGRyZXNzKQor
CSksCisKKwlUUF9mYXN0X2Fzc2lnbigKKwkJX19lbnRyeS0+aWQgPSBpZDsKKwkJX19lbnRyeS0+
YWRkcmVzcyA9IGFkZHJlc3M7CisJKSwKKworCVRQX3ByaW50aygidmdwdSVkOnNldCBnZ3R0IGVu
dHJ5IDB4JWx4IFxuIiwKKwkJICBfX2VudHJ5LT5pZCwgX19lbnRyeS0+YWRkcmVzcykKKyk7CisK
ICNlbmRpZiAvKiBfR1ZUX1RSQUNFX0hfICovCiAKIC8qIFRoaXMgcGFydCBtdXN0IGJlIG91dCBv
ZiBwcm90ZWN0aW9uICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
