Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E457A20
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 05:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E06E595;
	Thu, 27 Jun 2019 03:44:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462186E594
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 03:44:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 20:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="360560962"
Received: from gvt.bj.intel.com ([10.238.158.187])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2019 20:44:01 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 1/4] vfio: Define device specific irq type capability
Date: Thu, 27 Jun 2019 11:37:59 +0800
Message-Id: <20190627033802.1663-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627033802.1663-1-tina.zhang@intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
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

Q2FwIHRoZSBudW1iZXIgb2YgaXJxcyB3aXRoIGZpeGVkIGluZGV4ZXMgYW5kIHVzZSBjYXBhYmls
aXR5IGNoYWlucwp0byBjaGFpbiBkZXZpY2Ugc3BlY2lmaWMgaXJxcy4KClNpZ25lZC1vZmYtYnk6
IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmggfCAxOSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCmluZGV4IDAyYmI3YWQ2ZTk4Ni4u
NjAwNzg0YWNjNGFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCisrKyBi
L2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKQEAgLTQ0NCwxMSArNDQ0LDI3IEBAIHN0cnVjdCB2
ZmlvX2lycV9pbmZvIHsKICNkZWZpbmUgVkZJT19JUlFfSU5GT19NQVNLQUJMRQkJKDEgPDwgMSkK
ICNkZWZpbmUgVkZJT19JUlFfSU5GT19BVVRPTUFTS0VECSgxIDw8IDIpCiAjZGVmaW5lIFZGSU9f
SVJRX0lORk9fTk9SRVNJWkUJCSgxIDw8IDMpCisjZGVmaW5lIFZGSU9fSVJRX0lORk9fRkxBR19D
QVBTCQkoMSA8PCA0KSAvKiBJbmZvIHN1cHBvcnRzIGNhcHMgKi8KIAlfX3UzMglpbmRleDsJCS8q
IElSUSBpbmRleCAqLworCV9fdTMyCWNhcF9vZmZzZXQ7CS8qIE9mZnNldCB3aXRoaW4gaW5mbyBz
dHJ1Y3Qgb2YgZmlyc3QgY2FwICovCiAJX191MzIJY291bnQ7CQkvKiBOdW1iZXIgb2YgSVJRcyB3
aXRoaW4gdGhpcyBpbmRleCAqLwogfTsKICNkZWZpbmUgVkZJT19ERVZJQ0VfR0VUX0lSUV9JTkZP
CV9JTyhWRklPX1RZUEUsIFZGSU9fQkFTRSArIDkpCiAKKy8qCisgKiBUaGUgaXJxIHR5cGUgY2Fw
YWJpbGl0eSBhbGxvd3MgaXJxcyB1bmlxdWUgdG8gYSBzcGVjaWZpYyBkZXZpY2Ugb3IKKyAqIGNs
YXNzIG9mIGRldmljZXMgdG8gYmUgZXhwb3NlZC4KKyAqCisgKiBUaGUgc3RydWN0dXJlcyBiZWxv
dyBkZWZpbmUgdmVyc2lvbiAxIG9mIHRoaXMgY2FwYWJpbGl0eS4KKyAqLworI2RlZmluZSBWRklP
X0lSUV9JTkZPX0NBUF9UWVBFICAgICAgMworCitzdHJ1Y3QgdmZpb19pcnFfaW5mb19jYXBfdHlw
ZSB7CisJc3RydWN0IHZmaW9faW5mb19jYXBfaGVhZGVyIGhlYWRlcjsKKwlfX3UzMiB0eXBlOyAg
ICAgLyogZ2xvYmFsIHBlciBidXMgZHJpdmVyICovCisJX191MzIgc3VidHlwZTsgIC8qIHR5cGUg
c3BlY2lmaWMgKi8KK307CisKIC8qKgogICogVkZJT19ERVZJQ0VfU0VUX0lSUVMgLSBfSU9XKFZG
SU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVjdCB2ZmlvX2lycV9zZXQpCiAgKgpAQCAtNTUw
LDcgKzU2Niw4IEBAIGVudW0gewogCVZGSU9fUENJX01TSVhfSVJRX0lOREVYLAogCVZGSU9fUENJ
X0VSUl9JUlFfSU5ERVgsCiAJVkZJT19QQ0lfUkVRX0lSUV9JTkRFWCwKLQlWRklPX1BDSV9OVU1f
SVJRUworCVZGSU9fUENJX05VTV9JUlFTID0gNQkvKiBGaXhlZCB1c2VyIEFCSSwgSVJRIGluZGV4
ZXMgPj01IHVzZSAgICovCisJCQkJLyogZGV2aWNlIHNwZWNpZmljIGNhcCB0byBkZWZpbmUgY29u
dGVudCAqLwogfTsKIAogLyoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
