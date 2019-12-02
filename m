Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8DB10E639
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Dec 2019 08:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A6389F6D;
	Mon,  2 Dec 2019 07:01:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6389F6D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Dec 2019 07:01:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 23:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="208029733"
Received: from debian-nuc.sh.intel.com ([10.239.160.63])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2019 23:01:18 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gvt: use vgpu lock for active state setting
Date: Mon,  2 Dec 2019 15:01:08 +0800
Message-Id: <20191202070109.73924-2-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191202070109.73924-1-zhenyuw@linux.intel.com>
References: <20191202070109.73924-1-zhenyuw@linux.intel.com>
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

TmVlZCB0byBhbGlnbiB3aXRoIGRlYWN0aXZhdGUsIHNob3VsZCBvbmx5IHVzZSB2Z3B1J3MgbG9j
ayBmb3IKYWN0aXZlIHN0YXRlIHNldHRpbmcgaW5zdGVhZCBvZiBndnQgbG9jay4KCkZpeGVzOiBm
MjVhNDlhYjhhYjkgKCJkcm0vaTkxNS9ndnQ6IFVzZSB2Z3B1X2xvY2sgdG8gcHJvdGVjdCBwZXIg
dmdwdSBhY2Nlc3MiKQpDYzogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3ZncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKaW5kZXggZDVh
NmU0ZTNkMGZkLi44NWJkOWJmNGY2ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC92Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwpAQCAtMjEy
LDkgKzIxMiw5IEBAIHN0YXRpYyB2b2lkIGludGVsX2d2dF91cGRhdGVfdmdwdV90eXBlcyhzdHJ1
Y3QgaW50ZWxfZ3Z0ICpndnQpCiAgKi8KIHZvaWQgaW50ZWxfZ3Z0X2FjdGl2YXRlX3ZncHUoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUpCiB7Ci0JbXV0ZXhfbG9jaygmdmdwdS0+Z3Z0LT5sb2NrKTsK
KwltdXRleF9sb2NrKCZ2Z3B1LT52Z3B1X2xvY2spOwogCXZncHUtPmFjdGl2ZSA9IHRydWU7Ci0J
bXV0ZXhfdW5sb2NrKCZ2Z3B1LT5ndnQtPmxvY2spOworCW11dGV4X3VubG9jaygmdmdwdS0+dmdw
dV9sb2NrKTsKIH0KIAogLyoqCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
