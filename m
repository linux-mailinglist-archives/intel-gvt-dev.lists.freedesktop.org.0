Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41CA8F903
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Aug 2019 04:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB846E2E0;
	Fri, 16 Aug 2019 02:35:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E95E6E1B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Aug 2019 02:35:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 19:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="194894834"
Received: from gvt.bj.intel.com ([10.238.158.180])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 19:35:45 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 1/6] vfio: Define device specific irq type capability
Date: Fri, 16 Aug 2019 10:35:23 +0800
Message-Id: <20190816023528.30210-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816023528.30210-1-tina.zhang@intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 Eric Auger <eric.auger@redhat.com>, alex.williamson@redhat.com,
 kraxel@redhat.com, Tina Zhang <tina.zhang@intel.com>, zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q2FwIHRoZSBudW1iZXIgb2YgaXJxcyB3aXRoIGZpeGVkIGluZGV4ZXMgYW5kIHVzZSBjYXBhYmls
aXR5IGNoYWlucwp0byBjaGFpbiBkZXZpY2Ugc3BlY2lmaWMgaXJxcy4KClNpZ25lZC1vZmYtYnk6
IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBFcmljIEF1
Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8u
aCB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8u
aCBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKaW5kZXggMDJiYjdhZDZlOTg2Li5kODNjOWYx
MzZhNWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKKysrIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L3ZmaW8uaApAQCAtNDQ0LDExICs0NDQsMjcgQEAgc3RydWN0IHZmaW9faXJx
X2luZm8gewogI2RlZmluZSBWRklPX0lSUV9JTkZPX01BU0tBQkxFCQkoMSA8PCAxKQogI2RlZmlu
ZSBWRklPX0lSUV9JTkZPX0FVVE9NQVNLRUQJKDEgPDwgMikKICNkZWZpbmUgVkZJT19JUlFfSU5G
T19OT1JFU0laRQkJKDEgPDwgMykKKyNkZWZpbmUgVkZJT19JUlFfSU5GT19GTEFHX0NBUFMJCSgx
IDw8IDQpIC8qIEluZm8gc3VwcG9ydHMgY2FwcyAqLwogCV9fdTMyCWluZGV4OwkJLyogSVJRIGlu
ZGV4ICovCiAJX191MzIJY291bnQ7CQkvKiBOdW1iZXIgb2YgSVJRcyB3aXRoaW4gdGhpcyBpbmRl
eCAqLworCV9fdTMyCWNhcF9vZmZzZXQ7CS8qIE9mZnNldCB3aXRoaW4gaW5mbyBzdHJ1Y3Qgb2Yg
Zmlyc3QgY2FwICovCiB9OwogI2RlZmluZSBWRklPX0RFVklDRV9HRVRfSVJRX0lORk8JX0lPKFZG
SU9fVFlQRSwgVkZJT19CQVNFICsgOSkKIAorLyoKKyAqIFRoZSBpcnEgdHlwZSBjYXBhYmlsaXR5
IGFsbG93cyBpcnFzIHVuaXF1ZSB0byBhIHNwZWNpZmljIGRldmljZSBvcgorICogY2xhc3Mgb2Yg
ZGV2aWNlcyB0byBiZSBleHBvc2VkLgorICoKKyAqIFRoZSBzdHJ1Y3R1cmVzIGJlbG93IGRlZmlu
ZSB2ZXJzaW9uIDEgb2YgdGhpcyBjYXBhYmlsaXR5LgorICovCisjZGVmaW5lIFZGSU9fSVJRX0lO
Rk9fQ0FQX1RZUEUgICAgICAzCisKK3N0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsKKwlz
dHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaGVhZGVyOworCV9fdTMyIHR5cGU7ICAgICAvKiBn
bG9iYWwgcGVyIGJ1cyBkcml2ZXIgKi8KKwlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVjaWZp
YyAqLworfTsKKwogLyoqCiAgKiBWRklPX0RFVklDRV9TRVRfSVJRUyAtIF9JT1coVkZJT19UWVBF
LCBWRklPX0JBU0UgKyAxMCwgc3RydWN0IHZmaW9faXJxX3NldCkKICAqCkBAIC01NTAsNyArNTY2
LDggQEAgZW51bSB7CiAJVkZJT19QQ0lfTVNJWF9JUlFfSU5ERVgsCiAJVkZJT19QQ0lfRVJSX0lS
UV9JTkRFWCwKIAlWRklPX1BDSV9SRVFfSVJRX0lOREVYLAotCVZGSU9fUENJX05VTV9JUlFTCisJ
VkZJT19QQ0lfTlVNX0lSUVMgPSA1CS8qIEZpeGVkIHVzZXIgQUJJLCBJUlEgaW5kZXhlcyA+PTUg
dXNlICAgKi8KKwkJCQkvKiBkZXZpY2Ugc3BlY2lmaWMgY2FwIHRvIGRlZmluZSBjb250ZW50ICov
CiB9OwogCiAvKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
