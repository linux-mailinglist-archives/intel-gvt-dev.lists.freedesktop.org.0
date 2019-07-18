Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5896CA67
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 09:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32976E338;
	Thu, 18 Jul 2019 07:57:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23C36E338
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 07:57:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 00:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="158713064"
Received: from gvt-optiplex-7060.bj.intel.com ([10.238.158.89])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2019 00:57:27 -0700
From: Kechen Lu <kechen.lu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/6] vfio: Define device specific irq type capability
Date: Thu, 18 Jul 2019 23:56:35 +0800
Message-Id: <20190718155640.25928-2-kechen.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718155640.25928-1-kechen.lu@intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
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
 Tina Zhang <tina.zhang@intel.com>, Eric Auger <eric.auger@redhat.com>,
 alex.williamson@redhat.com, zhiyuan.lv@intel.com, hang.yuan@intel.com,
 zhi.a.wang@intel.com, kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+CgpDYXAgdGhlIG51bWJlciBv
ZiBpcnFzIHdpdGggZml4ZWQgaW5kZXhlcyBhbmQgdXNlIGNhcGFiaWxpdHkgY2hhaW5zCnRvIGNo
YWluIGRldmljZSBzcGVjaWZpYyBpcnFzLgoKU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGlu
YS56aGFuZ0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJA
cmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMTkgKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3ZmaW8uaAppbmRleCA4ZjEwNzQ4ZGFjNzkuLmJlNmFkYWI0Zjc1OSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmZp
by5oCkBAIC00NDgsMTEgKzQ0OCwyNyBAQCBzdHJ1Y3QgdmZpb19pcnFfaW5mbyB7CiAjZGVmaW5l
IFZGSU9fSVJRX0lORk9fTUFTS0FCTEUJCSgxIDw8IDEpCiAjZGVmaW5lIFZGSU9fSVJRX0lORk9f
QVVUT01BU0tFRAkoMSA8PCAyKQogI2RlZmluZSBWRklPX0lSUV9JTkZPX05PUkVTSVpFCQkoMSA8
PCAzKQorI2RlZmluZSBWRklPX0lSUV9JTkZPX0ZMQUdfQ0FQUwkJKDEgPDwgNCkgLyogSW5mbyBz
dXBwb3J0cyBjYXBzICovCiAJX191MzIJaW5kZXg7CQkvKiBJUlEgaW5kZXggKi8KIAlfX3UzMglj
b3VudDsJCS8qIE51bWJlciBvZiBJUlFzIHdpdGhpbiB0aGlzIGluZGV4ICovCisJX191MzIJY2Fw
X29mZnNldDsJLyogT2Zmc2V0IHdpdGhpbiBpbmZvIHN0cnVjdCBvZiBmaXJzdCBjYXAgKi8KIH07
CiAjZGVmaW5lIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTwlfSU8oVkZJT19UWVBFLCBWRklPX0JB
U0UgKyA5KQogCisvKgorICogVGhlIGlycSB0eXBlIGNhcGFiaWxpdHkgYWxsb3dzIGlycXMgdW5p
cXVlIHRvIGEgc3BlY2lmaWMgZGV2aWNlIG9yCisgKiBjbGFzcyBvZiBkZXZpY2VzIHRvIGJlIGV4
cG9zZWQuCisgKgorICogVGhlIHN0cnVjdHVyZXMgYmVsb3cgZGVmaW5lIHZlcnNpb24gMSBvZiB0
aGlzIGNhcGFiaWxpdHkuCisgKi8KKyNkZWZpbmUgVkZJT19JUlFfSU5GT19DQVBfVFlQRSAgICAg
IDMKKworc3RydWN0IHZmaW9faXJxX2luZm9fY2FwX3R5cGUgeworCXN0cnVjdCB2ZmlvX2luZm9f
Y2FwX2hlYWRlciBoZWFkZXI7CisJX191MzIgdHlwZTsgICAgIC8qIGdsb2JhbCBwZXIgYnVzIGRy
aXZlciAqLworCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovCit9OworCiAvKioK
ICAqIFZGSU9fREVWSUNFX1NFVF9JUlFTIC0gX0lPVyhWRklPX1RZUEUsIFZGSU9fQkFTRSArIDEw
LCBzdHJ1Y3QgdmZpb19pcnFfc2V0KQogICoKQEAgLTU1NCw3ICs1NzAsOCBAQCBlbnVtIHsKIAlW
RklPX1BDSV9NU0lYX0lSUV9JTkRFWCwKIAlWRklPX1BDSV9FUlJfSVJRX0lOREVYLAogCVZGSU9f
UENJX1JFUV9JUlFfSU5ERVgsCi0JVkZJT19QQ0lfTlVNX0lSUVMKKwlWRklPX1BDSV9OVU1fSVJR
UyA9IDUJLyogRml4ZWQgdXNlciBBQkksIElSUSBpbmRleGVzID49NSB1c2UgICAqLworCQkJCS8q
IGRldmljZSBzcGVjaWZpYyBjYXAgdG8gZGVmaW5lIGNvbnRlbnQgKi8KIH07CiAKIC8qCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
