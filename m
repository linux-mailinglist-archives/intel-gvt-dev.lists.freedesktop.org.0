Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB4B3439A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF7D896E7;
	Tue,  4 Jun 2019 10:01:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E929F896E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:01:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:01:16 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga005.jf.intel.com with ESMTP; 04 Jun 2019 03:01:14 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/3] vfio: Use capability chains to handle device
 specific irq
Date: Tue,  4 Jun 2019 17:55:32 +0800
Message-Id: <20190604095534.10337-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604095534.10337-1-tina.zhang@intel.com>
References: <20190604095534.10337-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, hang.yuan@intel.com, zhi.a.wang@intel.com,
 kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q2FwcyB0aGUgbnVtYmVyIG9mIGlycXMgd2l0aCBmaXhlZCBpbmRleGVzIGFuZCB1c2VzIGNhcGFi
aWxpdHkgY2hhaW5zCnRvIGNoYWluIGRldmljZSBzcGVjaWZpYyBpcnFzLgoKVkZJTyB2R1BVIGxl
dmVyYWdlcyB0aGlzIG1lY2hhbmlzbSB0byB0cmlnZ2VyIHByaW1hcnkgcGxhbmUgYW5kIGN1cnNv
cgpwbGFuZSBwYWdlIGZsaXAgZXZlbnQgdG8gdGhlIHVzZXIgc3BhY2UuCgpTaWduZWQtb2ZmLWJ5
OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvbGlu
dXgvdmZpby5oIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2xpbnV4L3ZmaW8uaCBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKaW5kZXggMDJiYjdhZDZl
OTg2Li45YjVlMjU5MzdjN2QgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgK
KysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaApAQCAtNDQ0LDExICs0NDQsMzEgQEAgc3Ry
dWN0IHZmaW9faXJxX2luZm8gewogI2RlZmluZSBWRklPX0lSUV9JTkZPX01BU0tBQkxFCQkoMSA8
PCAxKQogI2RlZmluZSBWRklPX0lSUV9JTkZPX0FVVE9NQVNLRUQJKDEgPDwgMikKICNkZWZpbmUg
VkZJT19JUlFfSU5GT19OT1JFU0laRQkJKDEgPDwgMykKKyNkZWZpbmUgVkZJT19JUlFfSU5GT19G
TEFHX0NBUFMJCSgxIDw8IDQpIC8qIEluZm8gc3VwcG9ydHMgY2FwcyAqLwogCV9fdTMyCWluZGV4
OwkJLyogSVJRIGluZGV4ICovCisJX191MzIJY2FwX29mZnNldDsJLyogT2Zmc2V0IHdpdGhpbiBp
bmZvIHN0cnVjdCBvZiBmaXJzdCBjYXAgKi8KIAlfX3UzMgljb3VudDsJCS8qIE51bWJlciBvZiBJ
UlFzIHdpdGhpbiB0aGlzIGluZGV4ICovCiB9OwogI2RlZmluZSBWRklPX0RFVklDRV9HRVRfSVJR
X0lORk8JX0lPKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgOSkKIAorLyoKKyAqIFRoZSBpcnEgdHlw
ZSBjYXBhYmlsaXR5IGFsbG93cyBpcnFzIHVuaXF1ZSB0byBhIHNwZWNpZmljIGRldmljZSBvcgor
ICogY2xhc3Mgb2YgZGV2aWNlcyB0byBiZSBleHBvc2VkLgorICoKKyAqIFRoZSBzdHJ1Y3R1cmVz
IGJlbG93IGRlZmluZSB2ZXJzaW9uIDEgb2YgdGhpcyBjYXBhYmlsaXR5LgorICovCisjZGVmaW5l
IFZGSU9fSVJRX0lORk9fQ0FQX1RZUEUgICAgICAzCisKK3N0cnVjdCB2ZmlvX2lycV9pbmZvX2Nh
cF90eXBlIHsKKwlzdHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaGVhZGVyOworCV9fdTMyIHR5
cGU7ICAgICAvKiBnbG9iYWwgcGVyIGJ1cyBkcml2ZXIgKi8KKwlfX3UzMiBzdWJ0eXBlOyAgLyog
dHlwZSBzcGVjaWZpYyAqLworfTsKKworI2RlZmluZSBWRklPX0lSUV9UWVBFX0dGWAkJCQkoMSkK
KyNkZWZpbmUgVkZJT19JUlFfU1VCVFlQRV9HRlhfUFJJX1BMQU5FX0ZMSVAJCSgxKQorI2RlZmlu
ZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9DVVJfUExBTkVfRkxJUAkJKDIpCisKIC8qKgogICogVkZJ
T19ERVZJQ0VfU0VUX0lSUVMgLSBfSU9XKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVj
dCB2ZmlvX2lycV9zZXQpCiAgKgpAQCAtNTUwLDcgKzU3MCw4IEBAIGVudW0gewogCVZGSU9fUENJ
X01TSVhfSVJRX0lOREVYLAogCVZGSU9fUENJX0VSUl9JUlFfSU5ERVgsCiAJVkZJT19QQ0lfUkVR
X0lSUV9JTkRFWCwKLQlWRklPX1BDSV9OVU1fSVJRUworCVZGSU9fUENJX05VTV9JUlFTID0gNQkv
KiBGaXhlZCB1c2VyIEFCSSwgSVJRIGluZGV4ZXMgPj01IHVzZSAgICovCisJCQkJLyogZGV2aWNl
IHNwZWNpZmljIGNhcCB0byBkZWZpbmUgY29udGVudCAqLwogfTsKIAogLyoKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
