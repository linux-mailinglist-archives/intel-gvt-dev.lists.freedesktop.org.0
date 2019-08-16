Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40448F904
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Aug 2019 04:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBA46E462;
	Fri, 16 Aug 2019 02:35:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C366E462
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Aug 2019 02:35:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 19:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="194894840"
Received: from gvt.bj.intel.com ([10.238.158.180])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 19:35:47 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 2/6] vfio: Introduce vGPU display irq type
Date: Fri, 16 Aug 2019 10:35:24 +0800
Message-Id: <20190816023528.30210-3-tina.zhang@intel.com>
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
 alex.williamson@redhat.com, kraxel@redhat.com,
 Tina Zhang <tina.zhang@intel.com>, zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW50cm9kdWNlIHZHUFUgc3BlY2lmaWMgaXJxIHR5cGUgVkZJT19JUlFfVFlQRV9HRlgsIGFuZApW
RklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBhcyB0aGUgc3VidHlwZSBmb3IgdkdQVSBk
aXNwbGF5LgoKSW50cm9kdWNlIHZmaW9faXJxX2luZm9fY2FwX2Rpc3BsYXlfcGxhbmVfZXZlbnRz
IGNhcGFiaWxpdHkgdG8gbm90aWZ5CnVzZXIgc3BhY2Ugd2l0aCB0aGUgdkdQVSdzIHBsYW5lIHVw
ZGF0ZSBldmVudHMKCnYyOgotIEFkZCBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBk
ZXNjcmlwdGlvbi4gKEFsZXggJiBLZWNoZW4pCi0gSW50cm9kdWNlIHZmaW9faXJxX2luZm9fY2Fw
X2Rpc3BsYXlfcGxhbmVfZXZlbnRzLiAoR2VyZCAmIEFsZXgpCgpTaWduZWQtb2ZmLWJ5OiBUaW5h
IFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvdmZp
by5oIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvdmZpby5oCmluZGV4IGQ4M2M5ZjEzNmE1Yi4uMjFhYzY5ZjBlMWE5IDEwMDY0
NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmgKQEAgLTQ2NSw2ICs0NjUsMjcgQEAgc3RydWN0IHZmaW9faXJxX2luZm9fY2FwX3R5
cGUgewogCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovCiB9OwogCisjZGVmaW5l
IFZGSU9fSVJRX1RZUEVfR0ZYCQkJCSgxKQorLyoKKyAqIHZHUFUgdmVuZG9yIHN1Yi10eXBlCisg
KiB2R1BVIGRldmljZSBkaXNwbGF5IHJlbGF0ZWQgaW50ZXJydXB0cyBlLmcuIHZibGFuay9wYWdl
ZmxpcAorICovCisjZGVmaW5lIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRCQkoMSkK
KworLyoKKyAqIERpc3BsYXkgY2FwYWJpbGl0eSBvZiB1c2luZyBvbmUgZXZlbnRmZCB0byBub3Rp
ZnkgdXNlciBzcGFjZSB3aXRoIHRoZQorICogdkdQVSdzIHBsYW5lIHVwZGF0ZSBldmVudHMuCisg
KiBjdXJfZXZlbnRfdmFsOiBldmVudGZkIHZhbHVlIHN0YW5kcyBmb3IgY3Vyc29yIHBsYW5lIGNo
YW5nZSBldmVudC4KKyAqIHByaV9ldmVudF92YWw6IGV2ZW50ZmQgdmFsdWUgc3RhbmRzIGZvciBw
cmltYXJ5IHBsYW5lIGNoYW5nZSBldmVudC4KKyAqLworI2RlZmluZSBWRklPX0lSUV9JTkZPX0NB
UF9ESVNQTEFZCTQKKworc3RydWN0IHZmaW9faXJxX2luZm9fY2FwX2Rpc3BsYXlfcGxhbmVfZXZl
bnRzIHsKKwlzdHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaGVhZGVyOworCV9fdTY0IGN1cl9l
dmVudF92YWw7CisJX191NjQgcHJpX2V2ZW50X3ZhbDsKK307CisKIC8qKgogICogVkZJT19ERVZJ
Q0VfU0VUX0lSUVMgLSBfSU9XKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVjdCB2Zmlv
X2lycV9zZXQpCiAgKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
