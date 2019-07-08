Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C92618E6
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Jul 2019 03:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92DF899D5;
	Mon,  8 Jul 2019 01:35:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC908899BC;
 Mon,  8 Jul 2019 01:35:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jul 2019 18:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,464,1557212400"; d="scan'208";a="173131253"
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.53])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2019 18:35:36 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 2/9] drm/i915: vgpu shared memory setup for pv optimization
Date: Mon,  8 Jul 2019 09:35:15 +0800
Message-Id: <1562549722-27046-3-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562549722-27046-1-git-send-email-xiaolin.zhang@intel.com>
References: <1562549722-27046-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VG8gZW5hYmxlIHZncHUgcHYgZmVhdHVyZXMsIHdlIG5lZWQgdG8gc2V0dXAgYSBzaGFyZWQgbWVt
b3J5IHBhZ2UKd2hpY2ggd2lsbCBiZSB1c2VkIGZvciBkYXRhIGV4Y2hhbmdlIGRpcmVjdGx5IGFj
Y2Vzc2VkIGJldHdlZW4gYm90aApndWVzdCBhbmQgYmFja2VuZCBpOTE1IGRyaXZlciB0byBhdm9p
ZCBlbXVsYXRpb24gdHJhcCBjb3N0LgoKZ3Vlc3QgaTkxNSB3aWxsIGFsbG9jYXRlIHRoaXMgcGFn
ZSBtZW1vcnkgYW5kIHRoZW4gcGFzcyBpdCdzIHBoeXNpY2FsCmFkZHJlc3MgdG8gYmFja2VuZCBp
OTE1IGRyaXZlciB0aHJvdWdoIFBWSU5GTyByZWdpc3RlciBzbyB0aGF0IGJhY2tlbmQgaTkxNQpk
cml2ZXIgY2FuIGFjY2VzcyB0aGlzIHNoYXJlZCBwYWdlIG1lb3J5IHdpdGhvdXQgYW55IHRyYXAg
Y29zdCB3aXRoIHRoZQpoZWxwIGZvcm0gaHlwZXJ2aXNlcidzIHJlYWQgZ3Vlc3QgZ3BhIGZ1bmN0
aW9uYWxpdHkuCgpndWVzdCBpOTE1IHdpbGwgc2VuZCBWR1RfRzJWX1NIQVJFRF9QQUdFX1NFVFVQ
IG5vdGlmaWNhdGlvbiB0byBob3N0IEdWVApvbmNlIHNoYXJlZCBtZW1vcnkgc2V0dXAgZmluaXNo
ZWQuCgp0aGUgbGF5b3V0IG9mIHRoZSBzaGFyZWRfcGFnZSBhbHNvIGRlZmluZWQgYXMgd2VsbCBp
biB0aGlzIHBhdGNoIHdoaWNoCmlzIHVzZWQgZm9yIHB2IGZlYXR1cmVzIGltcGxlbWVudGF0aW9u
LgoKdjA6IFJGQy4KdjE6IGFkZHJlc3NlZCBSRkMgY29tbWVudCB0byBtb3ZlIGJvdGggc2hhcmVk
X3BhZ2VfbG9jayBhbmQgc2hhcmVkX3BhZ2UKdG8gaTkxNV92aXJ0dWFsX2dwdSBzdHJ1Y3R1cmUu
CnYyOiBwYWNrZWQgaTkxNV92aXJ0dWFsX2dwdSBzdHJ1Y3R1cmUuCnYzOiBhZGRlZCBTSEFSRURf
UEFHRV9TRVRVUCBnMnYgbm90aWZpY2F0aW9uIGZvciBwdiBzaGFyZWRfcGFnZSBzZXR1cAp2NDog
YWRkZWQgaW50ZWxfdmdwdV9zZXR1cF9zaGFyZWRfcGFnZSgpIGluIGk5MTVfdmdwdV9wdi5jLgp2
NTogcGVyIGVuZ2luZSBkZXNjIGRhdGEgaW4gc2hhcmVkIG1lbW9yeS4KdjY6IGFkZGVkIHZlcnNp
b24gc3VwcG9ydCBpbiBzaGFyZWQgbWVtb3J5IChaaGVueXUpLgp2NzogcmViYXNlZC4KClNpZ25l
ZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9wdmluZm8uaCB8ICA1ICsrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92
Z3B1LmMgICB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuaCAgIHwgMTcgKysrKysrKysKIDQgZmlsZXMgY2hh
bmdlZCwgMTA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZHJ2LmgKaW5kZXggNmQ3OTg2Ny4uMjc5NTRiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCkBA
IC0xMDc4LDcgKzEwNzgsOSBAQCBzdHJ1Y3QgaTkxNV92aXJ0dWFsX2dwdSB7CiAJYm9vbCBhY3Rp
dmU7CiAJdTMyIGNhcHM7CiAJdTMyIHB2X2NhcHM7Ci19OworCisJc3RydWN0IGk5MTVfdmlydHVh
bF9ncHVfcHYgKnB2OworfSBfX3BhY2tlZDsKIAogLyogdXNlZCBpbiBjb21wdXRpbmcgdGhlIG5l
dyB3YXRlcm1hcmtzIHN0YXRlICovCiBzdHJ1Y3QgaW50ZWxfd21fY29uZmlnIHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcHZpbmZvLmggYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3B2aW5mby5oCmluZGV4IGFkMzk4YjQuLjNjNjM2MDMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcHZpbmZvLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9wdmluZm8uaApAQCAtNDgsNiArNDgsNyBAQCBlbnVtIHZndF9nMnZfdHlwZSB7CiAJ
VkdUX0cyVl9QUEdUVF9MNF9QQUdFX1RBQkxFX0RFU1RST1ksCiAJVkdUX0cyVl9FWEVDTElTVF9D
T05URVhUX0NSRUFURSwKIAlWR1RfRzJWX0VYRUNMSVNUX0NPTlRFWFRfREVTVFJPWSwKKwlWR1Rf
RzJWX1NIQVJFRF9QQUdFX1NFVFVQLAogCVZHVF9HMlZfTUFYLAogfTsKIApAQCAtMTEyLDcgKzEx
Myw5IEBAIHN0cnVjdCB2Z3RfaWYgewogCiAJdTMyIHB2X2NhcHM7CiAKLQl1MzIgIHJzdjdbMHgy
MDAgLSAyNV07ICAgIC8qIHBhZCB0byBvbmUgcGFnZSAqLworCXU2NCBzaGFyZWRfcGFnZV9ncGE7
CisKKwl1MzIgIHJzdjdbMHgyMDAgLSAyN107ICAgIC8qIHBhZCB0byBvbmUgcGFnZSAqLwogfSBf
X3BhY2tlZDsKIAogI2RlZmluZSB2Z3RpZl9vZmZzZXQoeCkgKG9mZnNldG9mKHN0cnVjdCB2Z3Rf
aWYsIHgpKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYwppbmRleCA5YjM3ZGQxLi45NDAxNzFhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYwpAQCAtMTQ1LDYgKzE0NSw3IEBAIHN0YXRpYyB2b2lk
IHZndF9kZWJhbGxvb25fc3BhY2Uoc3RydWN0IGk5MTVfZ2d0dCAqZ2d0dCwKICAqLwogdm9pZCBp
bnRlbF92Z3RfZGViYWxsb29uKHN0cnVjdCBpOTE1X2dndHQgKmdndHQpCiB7CisJc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBnZ3R0LT52bS5pOTE1OwogCWludCBpOwogCiAJaWYgKCFp
bnRlbF92Z3B1X2FjdGl2ZShnZ3R0LT52bS5pOTE1KSkKQEAgLTE1NCw2ICsxNTUsOSBAQCB2b2lk
IGludGVsX3ZndF9kZWJhbGxvb24oc3RydWN0IGk5MTVfZ2d0dCAqZ2d0dCkKIAogCWZvciAoaSA9
IDA7IGkgPCA0OyBpKyspCiAJCXZndF9kZWJhbGxvb25fc3BhY2UoZ2d0dCwgJmJsX2luZm8uc3Bh
Y2VbaV0pOworCisJaWYgKGk5MTUtPnZncHUucHYpCisJCWZyZWVfcGFnZSgodW5zaWduZWQgbG9u
ZylpOTE1LT52Z3B1LnB2LT5zaGFyZWRfcGFnZSk7CiB9CiAKIHN0YXRpYyBpbnQgdmd0X2JhbGxv
b25fc3BhY2Uoc3RydWN0IGk5MTVfZ2d0dCAqZ2d0dCwKQEAgLTMwOSw2ICszMTMsODEgQEAgaW50
IGludGVsX3ZndF9iYWxsb29uKHN0cnVjdCBpOTE1X2dndHQgKmdndHQpCiAgKiBpOTE1IHZncHUg
UFYgc3VwcG9ydCBmb3IgTGludXgKICAqLwogCisvKgorICogc2hhcmVkX3BhZ2Ugc2V0dXAgZm9y
IFZHUFUgUFYgZmVhdHVyZXMKKyAqLworc3RhdGljIGludCBpbnRlbF92Z3B1X3NldHVwX3NoYXJl
ZF9wYWdlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKKwkJdm9pZCBfX2lvbWVt
ICpzaGFyZWRfYXJlYSkKK3sKKwl2b2lkIF9faW9tZW0gKmFkZHI7CisJc3RydWN0IGk5MTVfdmly
dHVhbF9ncHVfcHYgKnB2OworCXN0cnVjdCBndnRfc2hhcmVkX3BhZ2UgKmJhc2U7CisJdTY0IGdw
YTsKKwl1MTYgdmVyX21haiwgdmVyX21pbjsKKworCS8qIFdlIGFsbG9jYXRlIDEgcGFnZSBzaGFy
ZWQgYmV0d2VlbiBndWVzdCBhbmQgR1ZUIGZvciBkYXRhIGV4Y2hhbmdlLgorCSAqICAgICAgIF9f
X19fX19fX19fLi4uLi4uLi4uLi4uLi4uLi4uLi4uCisJICogICAgICB8aGVhZCAgICAgICB8ICAg
ICAgICAgICAgICAgICAgIHwKKwkgKiAgICAgIHxfX19fX19fX19fX3wuLi4uLi4uLi4uLi4uLi4u
Li4gUEFHRS84CisJICogICAgICB8UFYgRUxTUCAgICAgICAgICAgICAgICAgICAgICAgIHwKKwkg
KiAgICAgIDpfX19fX19fX19fXy4uLi4uLi4uLi4uLi4uLi4uLi4uUEFHRS80CisJICogICAgICB8
ZGVzYyAoU0VORCkgICAgICAgICAgICAgICAgICAgIHwKKwkgKiAgICAgIHwJCQkJfAorCSAqICAg
ICAgOl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19QQUdFLzIKKwkgKiAgICAgIHxjbWRz
IChTRU5EKSAgICAgICAgICAgICAgICAgICAgfAorCSAqICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8CisJICogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwKKwkgKiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAorCSAqICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CisJICogICAgICB8X19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX3wKKwkgKgorCSAqIDAgb2Zmc2V0OiBQViB2ZXJzaW9uIGFyZWEK
KwkgKiBQQUdFLzggb2Zmc2V0OiBwZXIgZW5naW5lIHdvcmtsb2FkIHN1Ym1pc3Npb24gZGF0YSBh
cmVhCisJICogUEFHRS80IG9mZnNldDogUFYgY29tbWFuZCBidWZmZXIgY29tbWFuZCBkZXNjcmlw
dG9yIGFyZWEKKwkgKiBQQUdFLzIgb2Zmc2V0OiBQViBjb21tYW5kIGJ1ZmZlciBjb21tYW5kIGRh
dGEgYXJlYQorCSAqLworCisJYmFzZSA9ICAoc3RydWN0IGd2dF9zaGFyZWRfcGFnZSAqKWdldF96
ZXJvZWRfcGFnZShHRlBfS0VSTkVMKTsKKwlpZiAoIWJhc2UpIHsKKwkJRFJNX0lORk8oIm91dCBv
ZiBtZW1vcnkgZm9yIHNoYXJlZCBwYWdlIG1lbW9yeVxuIik7CisJCXJldHVybiAtRU5PTUVNOwor
CX0KKworCS8qIHBhc3MgZ3Vlc3QgbWVtb3J5IHBhIGFkZHJlc3MgdG8gR1ZUIGFuZCB0aGVuIHJl
YWQgYmFjayB0byB2ZXJpZnkgKi8KKwlncGEgPSBfX3BhKGJhc2UpOworCWFkZHIgPSBzaGFyZWRf
YXJlYSArIHZndGlmX29mZnNldChzaGFyZWRfcGFnZV9ncGEpOworCXdyaXRlcShncGEsIGFkZHIp
OworCWlmIChncGEgIT0gcmVhZHEoYWRkcikpIHsKKwkJRFJNX0lORk8oInZncHU6IHBhc3NlZCBz
aGFyZWRfcGFnZV9ncGEgZmFpbGVkXG4iKTsKKwkJZnJlZV9wYWdlKCh1bnNpZ25lZCBsb25nKWJh
c2UpOworCQlyZXR1cm4gLUVJTzsKKwl9CisKKwlhZGRyID0gc2hhcmVkX2FyZWEgKyB2Z3RpZl9v
ZmZzZXQoZzJ2X25vdGlmeSk7CisJd3JpdGVxKFZHVF9HMlZfU0hBUkVEX1BBR0VfU0VUVVAsIGFk
ZHIpOworCisJdmVyX21haiA9IGJhc2UtPnZlcl9tYWpvcjsKKwl2ZXJfbWluID0gYmFzZS0+dmVy
X21pbm9yOworCURSTV9JTkZPKCJ2Z3B1IFBWIHZlciBtYWpvciAlZCBhbmQgbWlub3IgJWRcbiIs
IHZlcl9tYWosIHZlcl9taW4pOworCWlmICh2ZXJfbWFqICE9IFBWX01BSk9SIHx8IHZlcl9taW4g
IT0gUFZfTUlOT1IpIHsKKwkJRFJNX0lORk8oInZncHU6IFBWIHZlcnNpb24gaW5jb21wYXRpYmxl
XG4iKTsKKwkJZnJlZV9wYWdlKCh1bnNpZ25lZCBsb25nKWJhc2UpOworCQlyZXR1cm4gLUVJTzsK
Kwl9CisKKwlwdiA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBpOTE1X3ZpcnR1YWxfZ3B1X3B2KSwg
R0ZQX0tFUk5FTCk7CisJaWYgKCFwdikgeworCQlmcmVlX3BhZ2UoKHVuc2lnbmVkIGxvbmcpYmFz
ZSk7CisJCXJldHVybiAtRU5PTUVNOworCX0KKworCWRldl9wcml2LT52Z3B1LnB2ID0gcHY7CisJ
cHYtPnNoYXJlZF9wYWdlID0gYmFzZTsKKwlwdi0+ZW5hYmxlZCA9IHRydWU7CisKKwlyZXR1cm4g
MDsKK30KKwogLyoqCiAgKiBpbnRlbF92Z3B1X2NoZWNrX3B2X2NhcHMgLSBkZXRlY3QgdmlydHVh
bCBHUFUgUFYgY2FwYWJpbGl0aWVzCiAgKiBAZGV2X3ByaXY6IGk5MTUgZGV2aWNlIHByaXZhdGUK
QEAgLTMzNyw1ICs0MTYsMTEgQEAgYm9vbCBpbnRlbF92Z3B1X2NoZWNrX3B2X2NhcHMoc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAogCWlmICghcHZjYXBzKQogCQlyZXR1cm4gZmFs
c2U7CiAKKwlpZiAoaW50ZWxfdmdwdV9zZXR1cF9zaGFyZWRfcGFnZShkZXZfcHJpdiwgc2hhcmVk
X2FyZWEpKSB7CisJCWRldl9wcml2LT52Z3B1LnB2X2NhcHMgPSAwOworCQl3cml0ZWwoMCwgc2hh
cmVkX2FyZWEgKyB2Z3RpZl9vZmZzZXQocHZfY2FwcykpOworCQlyZXR1cm4gZmFsc2U7CisJfQor
CiAJcmV0dXJuIHRydWU7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X3ZncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oCmluZGV4IGJiZTU2YjUu
LjliNmE4ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oCkBAIC0yNyw2ICsyNywyMyBAQAog
I2luY2x1ZGUgImk5MTVfZHJ2LmgiCiAjaW5jbHVkZSAiaTkxNV9wdmluZm8uaCIKIAorI2RlZmlu
ZSBQVl9NQUpPUgkJMQorI2RlZmluZSBQVl9NSU5PUgkJMAorCisvKgorICogQSBzaGFyZWQgcGFn
ZSg0S0IpIGJldHdlZW4gZ3Z0IGFuZCBWTSwgY291bGQgYmUgYWxsb2NhdGVkIGJ5IGd1ZXN0IGRy
aXZlcgorICogb3IgYSBmaXhlZCBsb2NhdGlvbiBpbiBQQ0kgYmFyIDAgcmVnaW9uCisgKi8KK3N0
cnVjdCBndnRfc2hhcmVkX3BhZ2UgeworCXUxNiB2ZXJfbWFqb3I7CisJdTE2IHZlcl9taW5vcjsK
K307CisKK3N0cnVjdCBpOTE1X3ZpcnR1YWxfZ3B1X3B2IHsKKwlzdHJ1Y3QgZ3Z0X3NoYXJlZF9w
YWdlICpzaGFyZWRfcGFnZTsKKwlib29sIGVuYWJsZWQ7Cit9OworCiB2b2lkIGk5MTVfZGV0ZWN0
X3ZncHUoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsKIAogYm9vbCBpbnRlbF92
Z3B1X2hhc19mdWxsX3BwZ3R0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdik7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1ndnQtZGV2
