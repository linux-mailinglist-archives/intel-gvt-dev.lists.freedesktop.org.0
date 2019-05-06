Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B649114372
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 May 2019 03:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C648920C;
	Mon,  6 May 2019 01:52:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F48920C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 May 2019 01:52:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 May 2019 18:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,435,1549958400"; d="scan'208";a="140310192"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga008.jf.intel.com with ESMTP; 05 May 2019 18:52:35 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/2] introduction of version attribute for VFIO live
 migration
Date: Sun,  5 May 2019 21:45:14 -0400
Message-Id: <20190506014514.3555-1-yan.y.zhao@intel.com>
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, dinechin@redhat.com, alex.williamson@redhat.com,
 changpeng.liu@intel.com, berrange@redhat.com, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIGEgdmVyc2lvbiBhdHRyaWJ1dGUgdW5kZXIgc3lzZnMg
b2YgVkZJTyBNZWRpYXRlZApkZXZpY2VzLgoKVGhpcyB2ZXJzaW9uIGF0dHJpYnV0ZSBpcyB1c2Vk
IHRvIGNoZWNrIHdoZXRoZXIgdHdvIG1kZXYgZGV2aWNlcyBhcmUKY29tcGF0aWJsZS4KdXNlciBz
cGFjZSBzb2Z0d2FyZSBjYW4gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcyB2ZXJzaW9uIGF0dHJpYnV0
ZSB0bwpkZXRlcm1pbmUgd2hldGhlciB0byBsYXVuY2ggbGl2ZSBtaWdyYXRpb24gYmV0d2VlbiB0
d28gbWRldiBkZXZpY2VzLgoKUGF0Y2ggMSBkZWZpbmVzIHZlcnNpb24gYXR0cmlidXRlIGluIERv
Y3VtZW50YXRpb24vdmZpby1tZWRpYXRlZC1kZXZpY2UudHh0CgpQYXRjaCAyIHVzZXMgR1ZUIGFz
IGFuIGV4YW1wbGUgdG8gc2hvdyBob3cgdG8gZXhwb3NlIHZlcnNpb24gYXR0cmlidXRlIGFuZApj
aGVjayBkZXZpY2UgY29tcGF0aWJpbGl0eSBpbiB2ZW5kb3IgZHJpdmVyLgoKCnYyOgoxLiByZW5h
bWVkIHBhdGNoZWQgMQoyLiBtYWRlIGRlZmluaXRpb24gb2YgZGV2aWNlIHZlcnNpb24gc3RyaW5n
IGNvbXBsZXRlbHkgcHJpdmF0ZSB0byB2ZW5kb3IKICAgZHJpdmVyCjMuIGFiYW5kb25lZCBjaGFu
Z2VzIHRvIHNhbXBsZSBtZGV2IGRyaXZlcnMKNC4gZGVzY3JpYmVkIGludGVudCBhbmQgdXNhZ2Ug
b2YgdmVyc2lvbiBhdHRyaWJ1dGUgbW9yZSBjbGVhcmx5LgoKWWFuIFpoYW8gKDIpOgogIHZmaW8v
bWRldjogYWRkIHZlcnNpb24gYXR0cmlidXRlIGZvciBtZGV2IGRldmljZQogIGRybS9pOTE1L2d2
dDogZXhwb3J0IG1kZXYgZGV2aWNlIHZlcnNpb24gdG8gc3lzZnMgZm9yIEludGVsIHZHUFUKCiBE
b2N1bWVudGF0aW9uL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnR4dCAgICB8IDEzNSArKysrKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvTWFrZWZpbGUgICAgICAgICB8
ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RldmljZV92ZXJzaW9uLmMgfCAgODQg
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICAgICAg
IHwgIDUxICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgICAg
ICB8ICAgNiArCiA1IGZpbGVzIGNoYW5nZWQsIDI3NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RldmljZV92
ZXJzaW9uLmMKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
