Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524AA4F0C
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Sep 2019 08:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD889B57;
	Mon,  2 Sep 2019 06:09:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFF789B57
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Sep 2019 06:09:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Sep 2019 23:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; d="scan'208";a="333477622"
Received: from vgt-optiplex-9020.sh.intel.com ([10.239.160.51])
 by orsmga004.jf.intel.com with ESMTP; 01 Sep 2019 23:09:07 -0700
From: Weinan Li <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: update RING_START reg of vGPU when the context
 is submitted to i915
Date: Mon,  2 Sep 2019 13:57:59 +0800
Message-Id: <20190902055759.30367-1-weinan.z.li@intel.com>
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

VGhlIGd1ZXN0IG1heSB1c2UgdGhpcyByZWdpc3RlciB0byBpZGVudGlmeSB0aGUgcnVubmluZyBz
dGF0ZSBvZiBvbmUKY29udGV4dC4gRW11bGF0ZSBpdCBhcyB0aGUgdmFsdWUgaW4gY29udGV4dCBp
bWFnZSBhcyBpZiB0aGUgY29udGV4dCBydW5zCm9uIHRoZSBHUFUgaGFyZHdhcmUuCgpTaWduZWQt
b2ZmLWJ5OiBXZWluYW4gTGkgPHdlaW5hbi56LmxpQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVy
LmMKaW5kZXggMTY2Yjk5OGIwOWIzLi42Yzc5ZDE2YjM4MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvc2NoZWR1bGVyLmMKQEAgLTU2OCw2ICs1NjgsMTYgQEAgc3RhdGljIGludCBwcmVwYXJlX3No
YWRvd193YV9jdHgoc3RydWN0IGludGVsX3NoYWRvd193YV9jdHggKndhX2N0eCkKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIHZvaWQgdXBkYXRlX3ZyZWdfaW5fY3R4KHN0cnVjdCBpbnRlbF92Z3B1
X3dvcmtsb2FkICp3b3JrbG9hZCkKK3sKKwlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHdvcmts
b2FkLT52Z3B1OworCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHZncHUtPmd2
dC0+ZGV2X3ByaXY7CisJdTMyIHJpbmdfYmFzZTsKKworCXJpbmdfYmFzZSA9IGRldl9wcml2LT5l
bmdpbmVbd29ya2xvYWQtPnJpbmdfaWRdLT5tbWlvX2Jhc2U7CisJdmdwdV92cmVnX3QodmdwdSwg
UklOR19TVEFSVChyaW5nX2Jhc2UpKSA9IHdvcmtsb2FkLT5yYl9zdGFydDsKK30KKwogc3RhdGlj
IHZvaWQgcmVsZWFzZV9zaGFkb3dfYmF0Y2hfYnVmZmVyKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmts
b2FkICp3b3JrbG9hZCkKIHsKIAlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHdvcmtsb2FkLT52
Z3B1OwpAQCAtMTAxNiw2ICsxMDI2LDEzIEBAIHN0YXRpYyBpbnQgd29ya2xvYWRfdGhyZWFkKHZv
aWQgKnByaXYpCiAJCWlmIChuZWVkX2ZvcmNlX3dha2UpCiAJCQlpbnRlbF91bmNvcmVfZm9yY2V3
YWtlX2dldCgmZ3Z0LT5kZXZfcHJpdi0+dW5jb3JlLAogCQkJCQlGT1JDRVdBS0VfQUxMKTsKKwkJ
LyoKKwkJICogVXBkYXRlIHRoZSB2UmVnIG9mIHRoZSB2R1BVIHdoaWNoIHN1Ym1pdHRlZCB0aGlz
CisJCSAqIHdvcmtsb2FkLiBUaGUgdkdQVSBtYXkgdXNlIHRoZXNlIHJlZ2lzdGVycyBmb3IgY2hl
Y2tpbmcKKwkJICogdGhlIGNvbnRleHQgc3RhdGUuIFRoZSB2YWx1ZSBjb21lcyBmcm9tIEdQVSBj
b21tYW5kcworCQkgKiBpbiB0aGlzIHdvcmtsb2FkLgorCQkgKi8KKwkJdXBkYXRlX3ZyZWdfaW5f
Y3R4KHdvcmtsb2FkKTsKIAogCQlyZXQgPSBkaXNwYXRjaF93b3JrbG9hZCh3b3JrbG9hZCk7CiAK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
