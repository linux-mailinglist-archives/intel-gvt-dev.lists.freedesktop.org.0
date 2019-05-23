Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB027763
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 09:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45709897CD;
	Thu, 23 May 2019 07:48:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6519F897CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 07:48:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 00:48:26 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.22])
 ([10.239.160.22])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2019 00:48:25 -0700
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
From: Colin Xu <Colin.Xu@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix vGPU CSFE_CHICKEN1_REG mmio handler
Message-ID: <c5e5e6a0-34bb-af80-a88e-091b3eb45fc7@intel.com>
Date: Thu, 23 May 2019 15:48:24 +0800
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
Cc: colin.xu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RW50ZXIgZmFpbHNhZmUgaWYgdmdwdSB0cmllcyB0byBjaGFuZ2UgQ1NGRV9DSElDS0VOMV9SRUcg
c2V0dGluZwp3aGljaCBpcyBjb250cm9sbGVkIGJ5IGhvc3QuCgpTaWduZWQtb2ZmLWJ5OiBDb2xp
biBYdTxjb2xpbi54dUBpbnRlbC5jb20+Ci0tLQogIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9o
YW5kbGVycy5jIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KICAxIGZpbGUgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKaW5kZXggZWRiMTQxNjU4NWY1Li43NzMyY2FhMWE1NDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jCkBAIC0xNzg5LDYgKzE3ODksMjEgQEAgc3RhdGljIGludCByaW5nX3Jlc2V0
X2N0bF93cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKICAJcmV0dXJuIDA7CiAgfQogIAor
c3RhdGljIGludCBjc2ZlX2NoaWNrZW4xX21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZn
cHUsCisJCQkJICAgIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnBfZGF0YSwKKwkJCQkgICAg
dW5zaWduZWQgaW50IGJ5dGVzKQoreworCXUzMiBkYXRhID0gKih1MzIgKilwX2RhdGE7CisKKwko
Kih1MzIgKilwX2RhdGEpICY9IH5fTUFTS0VEX0JJVF9FTkFCTEUoMHgxOCk7CisJd3JpdGVfdnJl
Zyh2Z3B1LCBvZmZzZXQsIHBfZGF0YSwgYnl0ZXMpOworCisJaWYgKGRhdGEgJiBfTUFTS0VEX0JJ
VF9FTkFCTEUoMHgxMCkgfHwgZGF0YSAmIF9NQVNLRURfQklUX0VOQUJMRSgweDgpKQorCQllbnRl
cl9mYWlsc2FmZV9tb2RlKHZncHUsIEdWVF9GQUlMU0FGRV9VTlNVUFBPUlRFRF9HVUVTVCk7CisK
KwlyZXR1cm4gMDsKK30KKwogICNkZWZpbmUgTU1JT19GKHJlZywgcywgZiwgYW0sIHJtLCBkLCBy
LCB3KSBkbyB7IFwKICAJcmV0ID0gbmV3X21taW9faW5mbyhndnQsIGk5MTVfbW1pb19yZWdfb2Zm
c2V0KHJlZyksIFwKICAJCWYsIHMsIGFtLCBybSwgZCwgciwgdyk7IFwKQEAgLTMwNzUsNyArMzA5
MCwxMCBAQCBzdGF0aWMgaW50IGluaXRfc2tsX21taW9faW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpn
dnQpCiAgCU1NSU9fRChfTU1JTyhfUExBTkVfS0VZTVNLXzEoUElQRV9DKSksIERfU0tMX1BMVVMp
OwogIAogIAlNTUlPX0QoX01NSU8oMHg0NDUwMCksIERfU0tMX1BMVVMpOwotCU1NSU9fREZIKEdF
TjlfQ1NGRV9DSElDS0VOMV9SQ1MsIERfU0tMX1BMVVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVM
TCk7CisjZGVmaW5lIENTRkVfQ0hJQ0tFTjFfUkVHKGJhc2UpIF9NTUlPKChiYXNlKSArIDB4RDQp
CisJTU1JT19SSU5HX0RGSChDU0ZFX0NISUNLRU4xX1JFRywgRF9TS0xfUExVUywgRl9NT0RFX01B
U0sgfCBGX0NNRF9BQ0NFU1MsCisJCSAgICAgIE5VTEwsIGNzZmVfY2hpY2tlbjFfbW1pb193cml0
ZSk7CisjdW5kZWYgQ1NGRV9DSElDS0VOMV9SRUcKICAJTU1JT19ERkgoR0VOOF9IRENfQ0hJQ0tF
TjEsIERfU0tMX1BMVVMsIEZfTU9ERV9NQVNLIHwgRl9DTURfQUNDRVNTLAogIAkJIE5VTEwsIE5V
TEwpOwogIAlNTUlPX0RGSChHRU45X1dNX0NISUNLRU4zLCBEX1NLTF9QTFVTLCBGX01PREVfTUFT
SyB8IEZfQ01EX0FDQ0VTUywKLS0gMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
