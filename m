Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5F2AD5F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 05:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE85896D8;
	Mon, 27 May 2019 03:48:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803D2896D8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 03:48:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 20:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,517,1549958400"; d="scan'208";a="178707617"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 26 May 2019 20:48:03 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/2] introduction of migration_version attribute for VFIO
 live migration
Date: Sun, 26 May 2019 23:41:55 -0400
Message-Id: <20190527034155.31473-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com,
 Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 dinechin@redhat.com, alex.williamson@redhat.com, changpeng.liu@intel.com,
 berrange@redhat.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 zhi.a.wang@intel.com, jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIGEgbWlncmF0aW9uX3ZlcnNpb24gYXR0cmlidXRlIHVu
ZGVyIHN5c2ZzIG9mIFZGSU8KTWVkaWF0ZWQgZGV2aWNlcy4KClRoaXMgbWlncmF0aW9uX3ZlcnNp
b24gYXR0cmlidXRlIGlzIHVzZWQgdG8gY2hlY2sgbWlncmF0aW9uIGNvbXBhdGliaWxpdHkKYmV0
d2VlbiB0d28gbWRldiBkZXZpY2VzIG9mIHRoZSBzYW1lIG1kZXYgdHlwZS4KClBhdGNoIDEgZGVm
aW5lcyBtaWdyYXRpb25fdmVyc2lvbiBhdHRyaWJ1dGUgaW4KRG9jdW1lbnRhdGlvbi92ZmlvLW1l
ZGlhdGVkLWRldmljZS50eHQKClBhdGNoIDIgdXNlcyBHVlQgYXMgYW4gZXhhbXBsZSB0byBzaG93
IGhvdyB0byBleHBvc2UgbWlncmF0aW9uX3ZlcnNpb24KYXR0cmlidXRlIGFuZCBjaGVjayBtaWdy
YXRpb24gY29tcGF0aWJpbGl0eSBpbiB2ZW5kb3IgZHJpdmVyLgoKCnYzOgoxLiByZW5hbWVkIHZl
cnNpb24gdG8gbWlncmF0aW9uX3ZlcnNpb24KMi4gbGV0IGVycm5vIHRvIGJlIGZyZWVseSBkZWZp
bmVkIGJ5IHZlbmRvciBkcml2ZXIKMy4gbGV0IGNoZWNraW5nIG1kZXZfdHlwZSBiZSBwcmVyZXF1
aXNpdGUgb2YgbWlncmF0aW9uIGNvbXBhdGliaWxpdHkgY2hlY2sKNC4gcmV3b3JkZWQgbW9zdCBw
YXJ0IG9mIHBhdGNoIDEKNS4gcHJpbnQgZGV0YWlsZWQgZXJyb3IgbG9nIGluIHBhdGNoIDIgYW5k
IGdlbmVyYXRlIG1pZ3JhdGlvbl92ZXJzaW9uCnN0cmluZyBhdCBpbml0IHRpbWUKCnYyOgoxLiBy
ZW5hbWVkIHBhdGNoZWQgMQoyLiBtYWRlIGRlZmluaXRpb24gb2YgZGV2aWNlIHZlcnNpb24gc3Ry
aW5nIGNvbXBsZXRlbHkgcHJpdmF0ZSB0byB2ZW5kb3IKZHJpdmVyCjMuIHJldmVydGVkIGNoYW5n
ZXMgdG8gc2FtcGxlIG1kZXYgZHJpdmVycwo0LiBkZXNjcmliZWQgaW50ZW50IGFuZCB1c2FnZSBv
ZiB2ZXJzaW9uIGF0dHJpYnV0ZSBtb3JlIGNsZWFybHkuCgoKWWFuIFpoYW8gKDIpOgogIHZmaW8v
bWRldjogYWRkIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0ZSBmb3IgbWRldiBkZXZpY2UKICBk
cm0vaTkxNS9ndnQ6IGV4cG9ydCBtaWdyYXRpb25fdmVyc2lvbiB0byBtZGV2IHN5c2ZzIGZvciBJ
bnRlbCB2R1BVCgogRG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmljZS50eHQgICAgICAg
fCAxMTMgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlICAg
ICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICAg
ICAgICAgIHwgIDM5ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAg
ICAgICAgICB8ICAgNSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbWlncmF0aW9uX3ZlcnNp
b24uYyB8IDE2NyArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jICAgICAgICAgICAgICB8ICAxMyArLQogNiBmaWxlcyBjaGFuZ2VkLCAzMzYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbWlncmF0aW9uX3ZlcnNpb24uYwoKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
