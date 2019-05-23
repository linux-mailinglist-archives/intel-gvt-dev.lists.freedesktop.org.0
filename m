Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAD2775D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 09:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89772897CD;
	Thu, 23 May 2019 07:46:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9C3897CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 07:46:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 00:46:38 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.22])
 ([10.239.160.22])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2019 00:46:37 -0700
To: intel-gvt-dev@lists.freedesktop.org, colin.xu@intel.com
From: Colin Xu <Colin.Xu@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix GFX_MODE handling
Message-ID: <c4c97c60-ad1c-9669-aea7-d2a60b672848@intel.com>
Date: Thu, 23 May 2019 15:46:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RW50ZXIgZmFpbHNhZmUgaWYgdmdwdSB0cmllcyB0byBjaGFuZ2UgR0ZYX01PREUgY29udHJvbGxl
ZCBieSBob3N0LgoKU2lnbmVkLW9mZi1ieTogQ29saW4gWHU8Y29saW4ueHVAaW50ZWwuY29tPgot
LS0KICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDE0ICsrKysrKysrKysr
KysrCiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jCmluZGV4IGI0ZmM3Zjk1Y2JlMS4uZWRiMTQxNjU4NWY1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvaGFuZGxlcnMuYwpAQCAtMTY5Miw4ICsxNjkyLDIyIEBAIHN0YXRpYyBpbnQg
cmluZ19tb2RlX21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGlu
dCBvZmZzZXQsCiAgCWJvb2wgZW5hYmxlX2V4ZWNsaXN0OwogIAlpbnQgcmV0OwogIAorCSgqKHUz
MiAqKXBfZGF0YSkgJj0gfl9NQVNLRURfQklUX0VOQUJMRSgxKTsKKwlpZiAoSVNfQ09GRkVFTEFL
RSh2Z3B1LT5ndnQtPmRldl9wcml2KSkKKwkJKCoodTMyICopcF9kYXRhKSAmPSB+X01BU0tFRF9C
SVRfRU5BQkxFKDIpOwogIAl3cml0ZV92cmVnKHZncHUsIG9mZnNldCwgcF9kYXRhLCBieXRlcyk7
CiAgCisJaWYgKGRhdGEgJiBfTUFTS0VEX0JJVF9FTkFCTEUoMSkpIHsKKwkJZW50ZXJfZmFpbHNh
ZmVfbW9kZSh2Z3B1LCBHVlRfRkFJTFNBRkVfVU5TVVBQT1JURURfR1VFU1QpOworCQlyZXR1cm4g
MDsKKwl9CisKKwlpZiAoSVNfQ09GRkVFTEFLRSh2Z3B1LT5ndnQtPmRldl9wcml2KSAmJgorCSAg
ICBkYXRhICYgX01BU0tFRF9CSVRfRU5BQkxFKDIpKSB7CisJCWVudGVyX2ZhaWxzYWZlX21vZGUo
dmdwdSwgR1ZUX0ZBSUxTQUZFX1VOU1VQUE9SVEVEX0dVRVNUKTsKKwkJcmV0dXJuIDA7CisJfQor
CiAgCS8qIHdoZW4gUFBHVFQgbW9kZSBlbmFibGVkLCB3ZSB3aWxsIGNoZWNrIGlmIGd1ZXN0IGhh
cyBjYWxsZWQKICAJICogcHZpbmZvLCBpZiBub3QsIHdlIHdpbGwgdHJlYXQgdGhpcyBndWVzdCBh
cyBub24tZ3Z0Zy1hd2FyZQogIAkgKiBndWVzdCwgYW5kIHN0b3AgZW11bGF0aW5nIGl0cyBjZmcg
c3BhY2UsIG1taW8sIGd0dCwgZXRjLgoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
