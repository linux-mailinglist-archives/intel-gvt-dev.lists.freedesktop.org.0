Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B067E305E4
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 May 2019 02:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4636E6E182;
	Fri, 31 May 2019 00:50:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AFA6E181
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 May 2019 00:50:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 17:50:46 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga001.jf.intel.com with ESMTP; 30 May 2019 17:50:40 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 0/2] introduction of migration_version attribute for VFIO
 live migration
Date: Thu, 30 May 2019 20:44:38 -0400
Message-Id: <20190531004438.24528-1-yan.y.zhao@intel.com>
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
YXRpb24gY29tcGF0aWJpbGl0eSBpbiB2ZW5kb3IgZHJpdmVyLgoKdjQ6CjEuIGZpeGVkIGluZGVu
dGF0aW9uL3NwZWxsIGVycm9ycywgcmV3b3JkZWQgc2V2ZXJhbCBlcnJvciBtZXNzYWdlcwoyLiBh
ZGRlZCBhIG1pc3NpbmcgbWVtb3J5IGZyZWUgZm9yIGVycm9yIGhhbmRsaW5nIGluIHBhdGNoIDIK
CnYzOgoxLiByZW5hbWVkIHZlcnNpb24gdG8gbWlncmF0aW9uX3ZlcnNpb24KMi4gbGV0IGVycm5v
IHRvIGJlIGZyZWVseSBkZWZpbmVkIGJ5IHZlbmRvciBkcml2ZXIKMy4gbGV0IGNoZWNraW5nIG1k
ZXZfdHlwZSBiZSBwcmVyZXF1aXNpdGUgb2YgbWlncmF0aW9uIGNvbXBhdGliaWxpdHkgY2hlY2sK
NC4gcmV3b3JkZWQgbW9zdCBwYXJ0IG9mIHBhdGNoIDEKNS4gcHJpbnQgZGV0YWlsZWQgZXJyb3Ig
bG9nIGluIHBhdGNoIDIgYW5kIGdlbmVyYXRlIG1pZ3JhdGlvbl92ZXJzaW9uCnN0cmluZyBhdCBp
bml0IHRpbWUKCnYyOgoxLiByZW5hbWVkIHBhdGNoZWQgMQoyLiBtYWRlIGRlZmluaXRpb24gb2Yg
ZGV2aWNlIHZlcnNpb24gc3RyaW5nIGNvbXBsZXRlbHkgcHJpdmF0ZSB0byB2ZW5kb3IKZHJpdmVy
CjMuIHJldmVydGVkIGNoYW5nZXMgdG8gc2FtcGxlIG1kZXYgZHJpdmVycwo0LiBkZXNjcmliZWQg
aW50ZW50IGFuZCB1c2FnZSBvZiB2ZXJzaW9uIGF0dHJpYnV0ZSBtb3JlIGNsZWFybHkuCgoKWWFu
IFpoYW8gKDIpOgogIHZmaW8vbWRldjogYWRkIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0ZSBm
b3IgbWRldiBkZXZpY2UKICBkcm0vaTkxNS9ndnQ6IGV4cG9ydCBtaWdyYXRpb25fdmVyc2lvbiB0
byBtZGV2IHN5c2ZzIGZvciBJbnRlbCB2R1BVCgogRG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVk
LWRldmljZS50eHQgICAgICAgfCAxMTMgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L01ha2VmaWxlICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndnQuYyAgICAgICAgICAgICAgIHwgIDM5ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3Z0LmggICAgICAgICAgICAgICB8ICAgNSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvbWlncmF0aW9uX3ZlcnNpb24uYyB8IDE2OCArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jICAgICAgICAgICAgICB8ICAxMyArLQogNiBmaWxlcyBj
aGFuZ2VkLCAzMzcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbWlncmF0aW9uX3ZlcnNpb24uYwoKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
