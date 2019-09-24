Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FABC1DD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 08:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091E56E0EB;
	Tue, 24 Sep 2019 06:43:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A066E0EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Sep 2019 06:43:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 23:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="203306303"
Received: from gvt.bj.intel.com ([10.238.158.180])
 by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 23:43:05 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] vfio: Define device specific irq type capability
Date: Tue, 24 Sep 2019 14:41:38 +0800
Message-Id: <20190924064143.9282-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190924064143.9282-1-tina.zhang@intel.com>
References: <20190924064143.9282-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, Eric Auger <eric.auger@redhat.com>,
 alex.williamson@redhat.com, zhiyuan.lv@intel.com, hang.yuan@intel.com,
 zhi.a.wang@intel.com, kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q2FwIHRoZSBudW1iZXIgb2YgaXJxcyB3aXRoIGZpeGVkIGluZGV4ZXMgYW5kIHVzZSBjYXBhYmls
aXR5IGNoYWlucwp0byBjaGFpbiBkZXZpY2Ugc3BlY2lmaWMgaXJxcy4KCnYyOgotIElycSBjYXBh
YmlsaXR5IGluZGV4IHN0YXJ0cyBmcm9tIDEuCgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0
aW5hLnpoYW5nQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRXJpYyBBdWdlciA8ZXJpYy5hdWdl
ckByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggfCAxOSArKysrKysr
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3Vh
cGkvbGludXgvdmZpby5oCmluZGV4IDllODQzYTE0N2VhZC4uYWE2ODUwZjFkYWVmIDEwMDY0NAot
LS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92
ZmlvLmgKQEAgLTQ1NSwxMSArNDU1LDI3IEBAIHN0cnVjdCB2ZmlvX2lycV9pbmZvIHsKICNkZWZp
bmUgVkZJT19JUlFfSU5GT19NQVNLQUJMRQkJKDEgPDwgMSkKICNkZWZpbmUgVkZJT19JUlFfSU5G
T19BVVRPTUFTS0VECSgxIDw8IDIpCiAjZGVmaW5lIFZGSU9fSVJRX0lORk9fTk9SRVNJWkUJCSgx
IDw8IDMpCisjZGVmaW5lIFZGSU9fSVJRX0lORk9fRkxBR19DQVBTCQkoMSA8PCA0KSAvKiBJbmZv
IHN1cHBvcnRzIGNhcHMgKi8KIAlfX3UzMglpbmRleDsJCS8qIElSUSBpbmRleCAqLwogCV9fdTMy
CWNvdW50OwkJLyogTnVtYmVyIG9mIElSUXMgd2l0aGluIHRoaXMgaW5kZXggKi8KKwlfX3UzMglj
YXBfb2Zmc2V0OwkvKiBPZmZzZXQgd2l0aGluIGluZm8gc3RydWN0IG9mIGZpcnN0IGNhcCAqLwog
fTsKICNkZWZpbmUgVkZJT19ERVZJQ0VfR0VUX0lSUV9JTkZPCV9JTyhWRklPX1RZUEUsIFZGSU9f
QkFTRSArIDkpCiAKKy8qCisgKiBUaGUgaXJxIHR5cGUgY2FwYWJpbGl0eSBhbGxvd3MgaXJxcyB1
bmlxdWUgdG8gYSBzcGVjaWZpYyBkZXZpY2Ugb3IKKyAqIGNsYXNzIG9mIGRldmljZXMgdG8gYmUg
ZXhwb3NlZC4KKyAqCisgKiBUaGUgc3RydWN0dXJlcyBiZWxvdyBkZWZpbmUgdmVyc2lvbiAxIG9m
IHRoaXMgY2FwYWJpbGl0eS4KKyAqLworI2RlZmluZSBWRklPX0lSUV9JTkZPX0NBUF9UWVBFICAg
ICAgMQorCitzdHJ1Y3QgdmZpb19pcnFfaW5mb19jYXBfdHlwZSB7CisJc3RydWN0IHZmaW9faW5m
b19jYXBfaGVhZGVyIGhlYWRlcjsKKwlfX3UzMiB0eXBlOyAgICAgLyogZ2xvYmFsIHBlciBidXMg
ZHJpdmVyICovCisJX191MzIgc3VidHlwZTsgIC8qIHR5cGUgc3BlY2lmaWMgKi8KK307CisKIC8q
KgogICogVkZJT19ERVZJQ0VfU0VUX0lSUVMgLSBfSU9XKFZGSU9fVFlQRSwgVkZJT19CQVNFICsg
MTAsIHN0cnVjdCB2ZmlvX2lycV9zZXQpCiAgKgpAQCAtNTYxLDcgKzU3Nyw4IEBAIGVudW0gewog
CVZGSU9fUENJX01TSVhfSVJRX0lOREVYLAogCVZGSU9fUENJX0VSUl9JUlFfSU5ERVgsCiAJVkZJ
T19QQ0lfUkVRX0lSUV9JTkRFWCwKLQlWRklPX1BDSV9OVU1fSVJRUworCVZGSU9fUENJX05VTV9J
UlFTID0gNQkvKiBGaXhlZCB1c2VyIEFCSSwgSVJRIGluZGV4ZXMgPj01IHVzZSAgICovCisJCQkJ
LyogZGV2aWNlIHNwZWNpZmljIGNhcCB0byBkZWZpbmUgY29udGVudCAqLwogfTsKIAogLyoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1ndnQtZGV2
