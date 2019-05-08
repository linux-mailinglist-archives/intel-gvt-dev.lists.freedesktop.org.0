Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61116EE4
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 May 2019 04:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA9E6E858;
	Wed,  8 May 2019 02:20:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DD76E858
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  8 May 2019 02:20:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 19:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,444,1549958400"; d="scan'208";a="169466482"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 07 May 2019 19:20:38 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/i915/gvt: Tiled Resources mmios are in-context
 mmios for gen9+
Date: Tue,  7 May 2019 22:15:00 -0400
Message-Id: <20190508021500.17272-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508021404.17218-1-yan.y.zhao@intel.com>
References: <20190508021404.17218-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VFJWQVRUTDNQVFJEVygweDRkZTAtMHg0ZGU0KSwgVFJOVUxMREVUQ1QoMHg0ZGU4KSwgVFJJTlZU
SUxFREVUQ1QoMHg0ZGVjKSwKVFJUVEUoMHg0ZGYwKSwgVFJWQURSKDB4NGRmNCkgYXJlIGluLWNv
bnRleHQgbW1pb3MgZm9yIGdlbjkrCgp2MzogYWRkIGZpeGVzIHRhZyAoemhlbnl1KQoKRml4ZXM6
IDE3ODY1NzEzOTMwNyAoImRybS9pOTE1L2d2dDogdkdQVSBjb250ZXh0IHN3aXRjaCIpClNpZ25l
ZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L21taW9fY29udGV4dC5jCmluZGV4IGZlODdmYjg3Nzc2Yy4uNDZhNmI0NjE2NThkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCkBAIC0xMDgsMTIgKzEwOCwx
MiBAQCBzdGF0aWMgc3RydWN0IGVuZ2luZV9tbWlvIGdlbjlfZW5naW5lX21taW9fbGlzdFtdIF9f
Y2FjaGVsaW5lX2FsaWduZWQgPSB7CiAJe1JDUzAsIEdFTjlfSEFMRl9TTElDRV9DSElDS0VONSwg
MHhmZmZmLCB0cnVlfSwgLyogMHhlMTg4ICovCiAJe1JDUzAsIEdFTjlfSEFMRl9TTElDRV9DSElD
S0VONywgMHhmZmZmLCB0cnVlfSwgLyogMHhlMTk0ICovCiAJe1JDUzAsIEdFTjhfUk9XX0NISUNL
RU4sIDB4ZmZmZiwgdHJ1ZX0sIC8qIDB4ZTRmMCAqLwotCXtSQ1MwLCBUUlZBVFRMM1BUUkRXKDAp
LCAwLCBmYWxzZX0sIC8qIDB4NGRlMCAqLwotCXtSQ1MwLCBUUlZBVFRMM1BUUkRXKDEpLCAwLCBm
YWxzZX0sIC8qIDB4NGRlNCAqLwotCXtSQ1MwLCBUUk5VTExERVRDVCwgMCwgZmFsc2V9LCAvKiAw
eDRkZTggKi8KLQl7UkNTMCwgVFJJTlZUSUxFREVUQ1QsIDAsIGZhbHNlfSwgLyogMHg0ZGVjICov
Ci0Je1JDUzAsIFRSVkFEUiwgMCwgZmFsc2V9LCAvKiAweDRkZjAgKi8KLQl7UkNTMCwgVFJUVEUs
IDAsIGZhbHNlfSwgLyogMHg0ZGY0ICovCisJe1JDUzAsIFRSVkFUVEwzUFRSRFcoMCksIDAsIHRy
dWV9LCAvKiAweDRkZTAgKi8KKwl7UkNTMCwgVFJWQVRUTDNQVFJEVygxKSwgMCwgdHJ1ZX0sIC8q
IDB4NGRlNCAqLworCXtSQ1MwLCBUUk5VTExERVRDVCwgMCwgdHJ1ZX0sIC8qIDB4NGRlOCAqLwor
CXtSQ1MwLCBUUklOVlRJTEVERVRDVCwgMCwgdHJ1ZX0sIC8qIDB4NGRlYyAqLworCXtSQ1MwLCBU
UlZBRFIsIDAsIHRydWV9LCAvKiAweDRkZjAgKi8KKwl7UkNTMCwgVFJUVEUsIDAsIHRydWV9LCAv
KiAweDRkZjQgKi8KIAogCXtCQ1MwLCBSSU5HX0dGWF9NT0RFKEJMVF9SSU5HX0JBU0UpLCAweGZm
ZmYsIGZhbHNlfSwgLyogMHgyMjI5YyAqLwogCXtCQ1MwLCBSSU5HX01JX01PREUoQkxUX1JJTkdf
QkFTRSksIDB4ZmZmZiwgZmFsc2V9LCAvKiAweDIyMDljICovCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
