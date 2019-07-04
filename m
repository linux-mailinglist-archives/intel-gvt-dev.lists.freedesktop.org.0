Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5525EFF3
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Jul 2019 02:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6DC89701;
	Thu,  4 Jul 2019 00:09:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D1B89701
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Jul 2019 00:09:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 17:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; d="scan'208";a="247791150"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.21])
 by orsmga001.jf.intel.com with ESMTP; 03 Jul 2019 17:09:31 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Do not check shadowed when adding ppgtt to GVT
 GEM context
Date: Thu,  4 Jul 2019 08:09:29 +0800
Message-Id: <20190704000929.3359-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.22.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2luZG93cyBndWVzdCBjYW4ndCBydW4gYWZ0ZXIgZm9yY2UtVERSIHdpdGggaG9zdCBsb2c6Ci4u
LgpndnQ6IHZncHUgMTogd29ya2xvYWQgc2hhZG93IHBwZ3R0IGlzbid0IHJlYWR5Cmd2dDogdmdw
dSAxOiBmYWlsIHRvIGRpc3BhdGNoIHdvcmtsb2FkLCBza2lwCi4uLgoKVGhlIGVycm9yIGlzIHJh
aXNlZCBieSBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdygpLCB3aGVuIGl0IGNoZWNrcwph
bmQgZm91bmQgdGhlIHNoYWRvd19tbSBpc24ndCBtYXJrZWQgYXMgc2hhZG93ZWQuCgpJbiB3b3Jr
IHRocmVhZCBiZWZvcmUgZWFjaCBzdWJtaXNzaW9uLCBhIHNoYWRvd19tbSBpcyBzZXQgdG8gc2hh
ZG93ZWQgaW46CnNoYWRvd19wcGd0dF9tbSgpCjwtaW50ZWxfdmdwdV9waW5fbW0oKQo8LXByZXBh
cmVfd29ya2xvYWQoKQo8LWRpc3BhdGNoX3dvcmtsb2FkKCkKPC13b3JrbG9hZF90aHJlYWQoKQpI
b3dldmVyIGNoZWNraW5nIHdoZXRoZXIgb3Igbm90IHNoYWRvd19tbSBpcyBzaGFkb3dlZCBpcyBw
cmlvciB0byBpdDoKc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKQo8LWRpc3BhdGNoX3dv
cmtsb2FkKCkKPC13b3JrbG9hZF90aHJlYWQoKQoKSW4gbm9ybWFsIGNhc2UsIGNyZWF0ZSB3b3Jr
bG9hZCB3aWxsIGNoZWNrIHRoZSBleGlzdGVuY2Ugb2Ygc2hhZG93X21tLAppZiBub3QgaXQgd2ls
bCBjcmVhdGUgYSBuZXcgb25lIGFuZCBtYXJrZWQgYXMgc2hhZG93ZWQuIElmIGFscmVhZHkgZXhp
c3QKaXQgd2lsbCByZXVzZSB0aGUgb2xkIG9uZS4gU2luY2Ugc2hhZG93X21tIGlzIHJldXNlZCwg
Y2hlY2tpbmcgb2Ygc2hhZG93ZWQKaW4gc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKSBh
Y3R1YWxseSBhbHdheXMgc2VlIHRoZSBzdGF0ZSBzZXQgaW4KY3JlYXRpb24sIGJ1dCBub3QgdGhl
IHN0YXRlIHNldCBpbiBpbnRlbF92Z3B1X3Bpbl9tbSgpLgoKV2hlbiBmb3JjZS1URFIsIGFsbCBl
bmdpbmVzIGFyZSByZXNldCwgc2luY2UgaXQncyBub3QgZG1sciBsZXZlbCwgYWxsCnBwZ3R0X21t
IGFyZSBpbnZhbGlkYXRlZCBidXQgbm90IGRlc3Ryb3llZC4gSW52YWxpZGF0aW9uIHdpbGwgbWFy
ayBhbGwKcmV1c2VkIHNoYWRvd19tbSBhcyBub3Qgc2hhZG93ZWQgYnV0IHN0aWxsIGtlZXBzIGlu
IHBwZ3R0X21tX2xpc3RfaGVhZC4KSWYgd29ya2xvYWQgc3VibWlzc2lvbiBwaGFzZSB0aG9zZSBz
aGFkb3dfbW0gYXJlIHJldXNlZCB3aXRoIHNoYWRvd2VkCm5vdCBzZXQsIHRoZW4gc2V0X2NvbnRl
eHRfcHBndHRfZnJvbV9zaGFkb3coKSB3aWxsIHJlcG9ydCBlcnJvci4KCk5vIG5lZWQgdG8gY2hl
Y2sgc2hhZG93ZWQgc3RhdGUgaW4gc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKS4KCkZp
eGVzOiA0ZjE1NjY1Y2NiYmEgKGRybS9pOTE1OiBBZGQgcHBndHQgdG8gR1ZUIEdFTSBjb250ZXh0
KQoKU2lnbmVkLW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1
bGVyLmMKaW5kZXggMTk2YjQxNTVhMzA5Li5hNWRiNTc5MjY5NjIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMKQEAgLTM3MSw3ICszNzEsNyBAQCBzdGF0aWMgaW50IHNldF9jb250
ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9h
ZCwKIAlzdHJ1Y3QgaTkxNV9wcGd0dCAqcHBndHQgPSBpOTE1X3ZtX3RvX3BwZ3R0KGN0eC0+dm0p
OwogCWludCBpID0gMDsKIAotCWlmIChtbS0+dHlwZSAhPSBJTlRFTF9HVlRfTU1fUFBHVFQgfHwg
IW1tLT5wcGd0dF9tbS5zaGFkb3dlZCkKKwlpZiAobW0tPnR5cGUgIT0gSU5URUxfR1ZUX01NX1BQ
R1RUKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWlmIChtbS0+cHBndHRfbW0ucm9vdF9lbnRyeV90
eXBlID09IEdUVF9UWVBFX1BQR1RUX1JPT1RfTDRfRU5UUlkpIHsKLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
