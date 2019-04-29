Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E2DAAD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 05:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699BE89160;
	Mon, 29 Apr 2019 03:11:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAC989160;
 Mon, 29 Apr 2019 03:11:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 20:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146648277"
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.121])
 by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 20:11:50 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 8/8] drm/i915/gvt: GVTg support context submission pv
 optimization
Date: Mon, 29 Apr 2019 11:10:58 +0800
Message-Id: <1556507458-24684-9-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
References: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, chris@chris-wilson.co.uk, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW1wbGVtZW50ZWQgY29udGV4dCBzdWJtaXNzaW9uIHB2IG9wdGltaXphaXRvbiB3aXRoaW4gR1ZU
Zy4KCkdWVGcgdG8gcmVhZCBjb250ZXh0IHN1Ym1pc3Npb24gZGF0YSAoZWxzcF9kYXRhKSBmcm9t
IHRoZSBzaGFyZWRfcGFnZQpkaXJlY3RseSB3aXRob3V0IHRyYXAgY29zdCBhbmQgZWxpbWluYXRl
IGV4ZWNsaXN0IEhXIGJlaGF2aW9yIGVtdWxhdGlvbgp3aXRob3V0IGluamVjdGluZyBjb250ZXh0
IHN3aXRjaCBpbnRlcnJ1cHQgdG8gZ3Vlc3QgdW5kZXIgUFYKc3VibWlzaXNvbiBtZWNoYW5pc20u
Cgp2MDogUkZDCnYxOiByZWJhc2UKdjI6IHJlYmFzZQp2MzogcmVwb3J0IHB2IGNvbnRleHQgc3Vi
bWlzc2lvbiBjYXAgYW5kIGhhbmRsZSBWR1RfRzJWX0VMU1BfU1VCTUlUCmcydiBwdiBub3RpZmlj
YXRpb24uCnY0OiBlbGltaW5hdGUgZXhlY2xpc3QgSFcgZW11bGF0aW9uIGFuZCBkb24ndCBpbmpl
Y3QgY29udGV4dCBzd2l0Y2gKaW50ZXJydXB0IHRvIGd1ZXN0IHVuZGVyIFBWIHN1Ym1pc2lzb24g
bWVjaGFuaXNtLgp2NTogcmViYXNlCgpTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpoYW5nIDx4aWFv
bGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZXhlY2xp
c3QuYyB8ICA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAx
MiArKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgIHwgIDEg
KwogMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
ZXhlY2xpc3QuYwppbmRleCBmMjFiOGZiLi5lNTJiZmQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZXhlY2xpc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
ZXhlY2xpc3QuYwpAQCAtMzgyLDYgKzM4Miw5IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9leGVjbGlz
dF93b3JrbG9hZChzdHJ1Y3QgaW50ZWxfdmdwdV93b3JrbG9hZCAqd29ya2xvYWQpCiAJaW50IHJp
bmdfaWQgPSB3b3JrbG9hZC0+cmluZ19pZDsKIAlpbnQgcmV0OwogCisJaWYgKFZHUFVfUFZDQVAo
dmdwdSwgUFZfU1VCTUlTU0lPTikpCisJCXJldHVybiAwOworCiAJaWYgKCF3b3JrbG9hZC0+ZW11
bGF0ZV9zY2hlZHVsZV9pbikKIAkJcmV0dXJuIDA7CiAKQEAgLTQyOSw2ICs0MzIsOSBAQCBzdGF0
aWMgaW50IGNvbXBsZXRlX2V4ZWNsaXN0X3dvcmtsb2FkKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmts
b2FkICp3b3JrbG9hZCkKIAkJZ290byBvdXQ7CiAJfQogCisJaWYgKFZHUFVfUFZDQVAodmdwdSwg
UFZfU1VCTUlTU0lPTikpCisJCWdvdG8gb3V0OworCiAJcmV0ID0gZW11bGF0ZV9leGVjbGlzdF9j
dHhfc2NoZWR1bGVfb3V0KGV4ZWNsaXN0LCAmd29ya2xvYWQtPmN0eF9kZXNjKTsKIG91dDoKIAlp
bnRlbF92Z3B1X3VucGluX21tKHdvcmtsb2FkLT5zaGFkb3dfbW0pOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuYwppbmRleCA0NjQ4ZDE3Li4xZTVmMTA5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuYwpAQCAtMTcxMiw2ICsxNzEyLDE4IEBAIHN0YXRpYyBpbnQgZWxzcF9tbWlv
X3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCQly
ZXR1cm4gLUVJTlZBTDsKIAogCWV4ZWNsaXN0ID0gJnZncHUtPnN1Ym1pc3Npb24uZXhlY2xpc3Rb
cmluZ19pZF07CisJaWYgKFZHUFVfUFZDQVAodmdwdSwgUFZfU1VCTUlTU0lPTikgJiYgVkdUX0cy
Vl9QVl9TVUJNSVNTSU9OID09IGRhdGEpIHsKKwkJc3RydWN0IHB2X3N1Ym1pc3Npb24gcHZfZWxz
cFtJOTE1X05VTV9FTkdJTkVTXTsKKwkJdTMyIHB2X2Vsc3Bfb2ZmID0gb2Zmc2V0b2Yoc3RydWN0
IGd2dF9zaGFyZWRfcGFnZSwgcHZfZWxzcCk7CisKKwkJaWYgKGludGVsX2d2dF9yZWFkX3NoYXJl
ZF9wYWdlKHZncHUsIHB2X2Vsc3Bfb2ZmLCAmcHZfZWxzcCwKKwkJCUk5MTVfTlVNX0VOR0lORVMg
KiBzaXplb2Yoc3RydWN0IHB2X3N1Ym1pc3Npb24pKSkKKwkJCXJldHVybiByZXQ7CisKKwkJbWVt
Y3B5KCZleGVjbGlzdC0+ZWxzcF9kd29yZHMuZGF0YSwgcHZfZWxzcFtyaW5nX2lkXS5kZXNjcywK
KwkJCQk4ICogRVhFQ0xJU1RfTUFYX1BPUlRTKTsKKwkJcmV0dXJuIGludGVsX3ZncHVfc3VibWl0
X2V4ZWNsaXN0KHZncHUsIHJpbmdfaWQpOworCX0KIAogCWV4ZWNsaXN0LT5lbHNwX2R3b3Jkcy5k
YXRhWzMgLSBleGVjbGlzdC0+ZWxzcF9kd29yZHMuaW5kZXhdID0gZGF0YTsKIAlpZiAoZXhlY2xp
c3QtPmVsc3BfZHdvcmRzLmluZGV4ID09IDMpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC92Z3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCmluZGV4
IGRkODljMTIuLjQ3ZGQyOWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92
Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwpAQCAtNTEsNiArNTEs
NyBAQCB2b2lkIHBvcHVsYXRlX3B2aW5mb19wYWdlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQog
CiAJaWYgKCFpbnRlbF92dGRfYWN0aXZlKCkpCiAJCXZncHVfdnJlZ190KHZncHUsIHZndGlmX3Jl
Zyhwdl9jYXBzKSkgPSBQVl9QUEdUVF9VUERBVEU7CisJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZf
cmVnKHB2X2NhcHMpKSB8PSBQVl9TVUJNSVNTSU9OOwogCiAJdmdwdV92cmVnX3QodmdwdSwgdmd0
aWZfcmVnKGF2YWlsX3JzLm1hcHBhYmxlX2dtYWRyLmJhc2UpKSA9CiAJCXZncHVfYXBlcnR1cmVf
Z21hZHJfYmFzZSh2Z3B1KTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
