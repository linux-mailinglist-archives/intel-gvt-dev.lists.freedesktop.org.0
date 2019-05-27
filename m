Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A452AE41
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 07:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3760A89745;
	Mon, 27 May 2019 05:42:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBA189791
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 05:42:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 22:42:24 -0700
X-ExtLoop1: 1
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 22:42:23 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/gvt: Don't use ggtt_validdate_range() with size=0
Date: Mon, 27 May 2019 13:45:52 +0800
Message-Id: <1558935953-3944-3-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
References: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VXNlIHZncHVfZ21hZHJfaXNfdmFsaWQoKSBkaXJlY3RseSBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1i
eTogWGlvbmcgWmhhbmcgPHhpb25nLnkuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2Rl
Y29kZXIuYwppbmRleCA2NWU4NDczLi44YmIyOTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9m
Yl9kZWNvZGVyLmMKQEAgLTI0NSw3ICsyNDUsNyBAQCBpbnQgaW50ZWxfdmdwdV9kZWNvZGVfcHJp
bWFyeV9wbGFuZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKIAlwbGFuZS0+aHdfZm9ybWF0ID0g
Zm10OwogCiAJcGxhbmUtPmJhc2UgPSB2Z3B1X3ZyZWdfdCh2Z3B1LCBEU1BTVVJGKHBpcGUpKSAm
IEk5MTVfR1RUX1BBR0VfTUFTSzsKLQlpZiAoIWludGVsX2d2dF9nZ3R0X3ZhbGlkYXRlX3Jhbmdl
KHZncHUsIHBsYW5lLT5iYXNlLCAwKSkKKwlpZiAoIXZncHVfZ21hZHJfaXNfdmFsaWQodmdwdSwg
cGxhbmUtPmJhc2UpKQogCQlyZXR1cm4gIC1FSU5WQUw7CiAKIAlwbGFuZS0+YmFzZV9ncGEgPSBp
bnRlbF92Z3B1X2dtYV90b19ncGEodmdwdS0+Z3R0LmdndHRfbW0sIHBsYW5lLT5iYXNlKTsKQEAg
LTM2OCw3ICszNjgsNyBAQCBpbnQgaW50ZWxfdmdwdV9kZWNvZGVfY3Vyc29yX3BsYW5lKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1LAogCQkJYWxwaGFfcGxhbmUsIGFscGhhX2ZvcmNlKTsKIAogCXBs
YW5lLT5iYXNlID0gdmdwdV92cmVnX3QodmdwdSwgQ1VSQkFTRShwaXBlKSkgJiBJOTE1X0dUVF9Q
QUdFX01BU0s7Ci0JaWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9yYW5nZSh2Z3B1LCBwbGFu
ZS0+YmFzZSwgMCkpCisJaWYgKCF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIHBsYW5lLT5iYXNl
KSkKIAkJcmV0dXJuICAtRUlOVkFMOwogCiAJcGxhbmUtPmJhc2VfZ3BhID0gaW50ZWxfdmdwdV9n
bWFfdG9fZ3BhKHZncHUtPmd0dC5nZ3R0X21tLCBwbGFuZS0+YmFzZSk7CkBAIC00NzIsNyArNDcy
LDcgQEAgaW50IGludGVsX3ZncHVfZGVjb2RlX3Nwcml0ZV9wbGFuZShzdHJ1Y3QgaW50ZWxfdmdw
dSAqdmdwdSwKIAlwbGFuZS0+ZHJtX2Zvcm1hdCA9IGRybV9mb3JtYXQ7CiAKIAlwbGFuZS0+YmFz
ZSA9IHZncHVfdnJlZ190KHZncHUsIFNQUlNVUkYocGlwZSkpICYgSTkxNV9HVFRfUEFHRV9NQVNL
OwotCWlmICghaW50ZWxfZ3Z0X2dndHRfdmFsaWRhdGVfcmFuZ2UodmdwdSwgcGxhbmUtPmJhc2Us
IDApKQorCWlmICghdmdwdV9nbWFkcl9pc192YWxpZCh2Z3B1LCBwbGFuZS0+YmFzZSkpCiAJCXJl
dHVybiAgLUVJTlZBTDsKIAogCXBsYW5lLT5iYXNlX2dwYSA9IGludGVsX3ZncHVfZ21hX3RvX2dw
YSh2Z3B1LT5ndHQuZ2d0dF9tbSwgcGxhbmUtPmJhc2UpOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
