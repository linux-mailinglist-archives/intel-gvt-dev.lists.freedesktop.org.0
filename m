Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E64324A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Jun 2019 05:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6989265;
	Thu, 13 Jun 2019 03:15:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A1C89265
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jun 2019 03:14:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 20:14:59 -0700
X-ExtLoop1: 1
Received: from vgt-optiplex-9020.sh.intel.com ([10.239.160.51])
 by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2019 20:14:58 -0700
From: Weinan Li <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: always return zero if read pvinfo failed
Date: Thu, 13 Jun 2019 11:05:17 +0800
Message-Id: <20190613030517.30539-1-weinan.z.li@intel.com>
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
Cc: Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlcmUgaXMgcHZpbmZvIHJlYWRpbmcgY29tZSBmcm9tIHZncHUgbWlnaHQgYmUgZmFpbGVkLCBs
aWtlIHJlYWRpbmcKZnJvbSBvbmUgdW5rbm93biBhZGRyZXNzLCBub3cgR1ZULWcgcmV0dXJucyB0
aGUgdnJlZyB3aGljaCBpcyBvbmUKdW5jZXJ0YWluIHZhbHVlLiBUbyBhdm9pZCBtaXN1bmRlcnN0
YW5kaW5nLCBHVlQtZyB3aWxsIGFsd2F5cyByZXR1cm4KemVybyBpZiByZWFkaW5nIGZhaWxlZCBv
Y2N1cnJlZC4KClNpZ25lZC1vZmYtYnk6IFdlaW5hbiBMaSA8d2VpbmFuLnoubGlAaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNyArKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2hhbmRsZXJzLmMKaW5kZXggYTZhZGU2NjM0OWJkLi5lYWI2NTdkNjUyNzYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCkBAIC0xMTk5LDkgKzExOTksMTIgQEAgc3Rh
dGljIGludCBwdmluZm9fbW1pb19yZWFkKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25l
ZCBpbnQgb2Zmc2V0LAogCQlpbnZhbGlkX3JlYWQgPSB0cnVlOwogCQlicmVhazsKIAl9Ci0JaWYg
KGludmFsaWRfcmVhZCkKLQkJZ3Z0X3ZncHVfZXJyKCJpbnZhbGlkIHB2aW5mbyByZWFkOiBbJXg6
JXhdID0gJXhcbiIsCisJaWYgKGludmFsaWRfcmVhZCkgeworCQlndnRfdmdwdV9lcnIoImludmFs
aWQgcHZpbmZvIHJlYWQ6IFsweCV4OjB4JXhdID0gMHgwIGluc3RlYWQgb2YgMHgleFxuIiwKIAkJ
CQlvZmZzZXQsIGJ5dGVzLCAqKHUzMiAqKXBfZGF0YSk7CisJCW1lbXNldChwX2RhdGEsIDAsIGJ5
dGVzKTsKKwl9CisKIAl2Z3B1LT5wdl9ub3RpZmllZCA9IHRydWU7CiAJcmV0dXJuIDA7CiB9Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
