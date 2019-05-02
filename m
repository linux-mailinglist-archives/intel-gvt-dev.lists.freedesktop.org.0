Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E303116CA
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 May 2019 12:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603B189229;
	Thu,  2 May 2019 10:00:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E48089229
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 May 2019 10:00:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 03:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,421,1549958400"; d="scan'208";a="342671727"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2019 03:00:51 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/i915/gvt: Check if cur_pt_type is valid
Date: Thu,  2 May 2019 12:59:21 +0300
Message-Id: <20190502095922.31917-2-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
References: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U3RhdGljIGNvZGUgYW5hbHl6ZXIgd2FybnMgdGhhdCBpbmRleCB2YWx1ZSBmb3Igc2NyYXRjaF9w
dCBtYXkgYmUgZXF1YWwKdG8gLTEuIEluZGV4IHZhbHVlIHR5cGUgaXMgaW50ZWxfZ3Z0X2d0dF90
eXBlX3QsIHNvIGl0IG1heSBiZSBhbnkgbnVtYmVyCmF0IHJhbmdlIC0xIHRvIDE3LiBDaGVjayBm
aXJzdCBpZiBjdXJfcHRfdHlwZSBhbmQgY3VyX3B0X3R5cGUrMSBpcyB2YWxpZAp2YWx1ZXMuCgp2
MjoKIC0gUHJpbnQgc29tZSBlcnJvciBtZXNzYWdlcyBpZiBwYWdlIHRhYmxlIHR5cGUgaXMgaW52
YWxpZC4gKENvbGluIFh1KQoKdjQ6CiAtIFByaW50IGN1cl9wdF90eXBlIGluIGVycm9yIG1lc3Nh
Z2UuIChDb2xpbiBYdSkKClRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpYWwgaXNzdWUgIzQyMiBy
ZXBvcnRlZCBieSBrbG9jd29yay4KClNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2ltYml0c2tpaSA8
YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KQ2M6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxp
bnV4LmludGVsLmNvbT4KQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNvbT4KQ2M6IENv
bGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5jIHwgMTEgKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IDA4Yzc0ZTY1ODM2Yi4u
N2U2MTM5NmE2NWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC05NDIsNyArOTQyLDE2IEBA
IHN0YXRpYyBpbnQgcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2VudHJ5KHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1LAogCiAJaWYgKGUtPnR5cGUgIT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9M
M19FTlRSWQogCQkmJiBlLT50eXBlICE9IEdUVF9UWVBFX1BQR1RUX1JPT1RfTDRfRU5UUlkpIHsK
LQkJY3VyX3B0X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUpICsgMTsKKwkJY3VyX3B0
X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUpOworCisJCWlmICghZ3R0X3R5cGVfaXNf
cHQoY3VyX3B0X3R5cGUpIHx8CisJCQkJIWd0dF90eXBlX2lzX3B0KGN1cl9wdF90eXBlICsgMSkp
IHsKKwkJCVdBUk4oMSwgIkludmFsaWQgcGFnZSB0YWJsZSB0eXBlLCBjdXJfcHRfdHlwZSBpczog
JWRcbiIsIGN1cl9wdF90eXBlKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisKKwkJY3VyX3B0
X3R5cGUgKz0gMTsKKwogCQlpZiAob3BzLT5nZXRfcGZuKGUpID09CiAJCQl2Z3B1LT5ndHQuc2Ny
YXRjaF9wdFtjdXJfcHRfdHlwZV0ucGFnZV9tZm4pCiAJCQlyZXR1cm4gMDsKLS0gCjIuMTcuMQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEs
IDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9t
aWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkg
Y29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lw
aWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
