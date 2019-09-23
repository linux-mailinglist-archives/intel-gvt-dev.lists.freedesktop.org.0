Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A7BB4B3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Sep 2019 15:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8C6E8EA;
	Mon, 23 Sep 2019 13:03:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ACB6E8D8;
 Mon, 23 Sep 2019 13:03:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91A0310DCC84;
 Mon, 23 Sep 2019 13:03:56 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-93.pek2.redhat.com [10.72.12.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B17CD10013D9;
 Mon, 23 Sep 2019 13:03:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH 0/6] mdev based hardware virtio offloading support
Date: Mon, 23 Sep 2019 21:03:25 +0800
Message-Id: <20190923130331.29324-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 23 Sep 2019 13:03:57 +0000 (UTC)
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
Cc: sebott@linux.ibm.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, jani.nikula@linux.intel.com,
 parav@mellanox.com, zhihong.wang@intel.com, akrowiak@linux.ibm.com,
 netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgYWxsOgoKVGhlcmUgYXJlIGhhcmR3YXJlIHRoYXQgY2FuIGRvIHZpcnRpbyBkYXRhcGF0aCBv
ZmZsb2FkaW5nIHdoaWxlIGhhdmluZwppdHMgb3duIGNvbnRyb2wgcGF0aC4gVGhpcyBwYXRoIHRy
aWVzIHRvIGltcGxlbWVudCBhIG1kZXYgYmFzZWQKdW5pZmllZCBBUEkgdG8gc3VwcG9ydCB1c2lu
ZyBrZXJuZWwgdmlydGlvIGRyaXZlciB0byBkcml2ZSB0aG9zZQpkZXZpY2VzLiBUaGlzIGlzIGRv
bmUgYnkgaW50cm9kdWNpbmcgYSBuZXcgbWRldiB0cmFuc3BvcnQgZm9yIHZpcnRpbwoodmlydGlv
X21kZXYpIGFuZCByZWdpc3RlciBpdHNlbGYgYXMgYSBuZXcga2luZCBvZiBtZGV2IGRyaXZlci4g
VGhlbgppdCBwcm92aWRlcyBhIHVuaWZpZWQgd2F5IGZvciBrZXJuZWwgdmlydGlvIGRyaXZlciB0
byB0YWxrIHdpdGggbWRldgpkZXZpY2UgaW1wbGVtZW50YXRpb24uCgpUaG91Z2ggdGhlIHNlcmll
cyBvbmx5IGNvbnRhaW5zIGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMgdG8KbWFr
ZSB0aGUgdHJhbnNwb3J0IGdlbmVyaWMgZW5vdWdoIHRvIHN1cHBvcnQgdXNlcnNwYWNlIGRyaXZl
cnMuIFRoaXMKbWVhbnMgdmhvc3QtbWRldlsxXSBjb3VsZCBiZSBidWlsdCBvbiB0b3AgYXMgd2Vs
bCBieSByZXN1aW5nIHRoZQp0cmFuc3BvcnQuCgpBIHNhbXBsZSBkcml2ZXIgaXMgYWxzbyBpbXBs
ZW1lbnRlZCB3aGljaCBzaW11bGF0ZSBhIHZpcml0by1uZXQKbG9vcGJhY2sgZXRoZXJuZXQgZGV2
aWNlIG9uIHRvcCBvZiB2cmluZ2ggKyB3b3JrcXVldWUuIFRoaXMgY291bGQgYmUKdXNlZCBhcyBh
IHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBmb3IgcmVhbCBoYXJkd2FyZSBkcml2ZXIuCgpDb25z
aWRlciBtZGV2IGZyYW1ld29yayBvbmx5IHN1cHBvcnQgVkZJTyBkZXZpY2UgYW5kIGRyaXZlciBy
aWdodCBub3csCnRoaXMgc2VyaWVzIGFsc28gZXh0ZW5kIGl0IHRvIHN1cHBvcnQgb3RoZXIgdHlw
ZXMuIFRoaXMgaXMgZG9uZQp0aHJvdWdoIGludHJvZHVjaW5nIGNsYXNzIGlkIHRvIHRoZSBkZXZp
Y2UgYW5kIHBhaXJpbmcgaXQgd2l0aAppZF90YWxiZSBjbGFpbWVkIGJ5IHRoZSBkcml2ZXIuIE9u
IHRvcCwgdGhpcyBzZXJpcyBhbHNvIGRlY291cGxlCmRldmljZSBzcGVjaWZpYyBwYXJlbnRzIG9w
cyBvdXQgb2YgdGhlIGNvbW1vbiBvbmVzLgoKUGt0Z2VuIHRlc3Qgd2FzIGRvbmUgd2l0aCB2aXJp
dG8tbmV0ICsgbXZuZXQgbG9vcCBiYWNrIGRldmljZS4KClBsZWFzZSByZXZpZXcuCgpbMV0gaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xNi84NjkKCkNoYW5nZXMgZnJvbSBSRkMtVjI6Ci0g
c2lsZW50IGNvbXBpbGUgd2FybmluZ3Mgb24gc29tZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uCi0g
dXNlIHUxNiBpbnN0ZWFkIHU4IGZvciBjbGFzcyBpZAotIHJlc2V2ZSBNREVWX0lEX1ZIT1NUIGZv
ciBmdXR1cmUgdmhvc3QtbWRldiB3b3JrCi0gaW50cm9kdWNlICJ2aXJ0aW8iIHR5cGUgZm9yIG12
bmV0IGFuZCBtYWtlICJ2aG9zdCIgdHlwZSBmb3IgZnV0dXJlCiAgd29yawotIGFkZCBlbnRyaWVz
IGluIE1BSU5UQUlORVIKLSB0d2VhayBhbmQgdHlwb3MgZml4ZXMgaW4gY29tbWl0IGxvZwoKQ2hh
bmdlcyBmcm9tIFJGQy1WMToKCi0gcmVuYW1lIGRldmljZSBpZCB0byBjbGFzcyBpZAotIGFkZCBk
b2NzIGZvciBjbGFzcyBpZCBhbmQgZGV2aWNlIHNwZWNpZmljIG9wcyAoZGV2aWNlX29wcykKLSBz
cGxpdCBkZXZpY2Vfb3BzIGludG8gc2VwZXJhdGUgaGVhZGVycwotIGRyb3AgdGhlIG1kZXZfc2V0
X2RtYV9vcHMoKQotIHVzZSBkZXZpY2Vfb3BzIHRvIGltcGxlbWVudCB0aGUgdHJhbnNwb3J0IEFQ
SSwgdGhlbiBpdCdzIG5vdCBhIHBhcnQKICBvZiBVQVBJIGFueSBtb3JlCi0gdXNlIEdGUF9BVE9N
SUMgaW4gbXZuZXQgc2FtcGxlIGRldmljZSBhbmQgb3RoZXIgdHdlYWtzCi0gc2V0X3ZyaW5nX2Jh
c2UvZ2V0X3ZyaW5nX2Jhc2Ugc3VwcG9ydCBmb3IgbXZuZXQgZGV2aWNlCgpKYXNvbiBXYW5nICg2
KToKICBtZGV2OiBjbGFzcyBpZCBzdXBwb3J0CiAgbWRldjogaW50cm9kdWNlIGRldmljZSBzcGVj
aWZpYyBvcHMKICBtZGV2OiBpbnRyb2R1Y2UgdmlydGlvIGRldmljZSBhbmQgaXRzIGRldmljZSBv
cHMKICB2aXJ0aW86IGludHJvZHVjZSBhIG1kZXYgYmFzZWQgdHJhbnNwb3J0CiAgdnJpbmdoOiBm
aXggY29weSBkaXJlY3Rpb24gb2YgdnJpbmdoX2lvdl9wdXNoX2tlcm4oKQogIGRvY3M6IHNhbXBs
ZSBkcml2ZXIgdG8gZGVtb25zdHJhdGUgaG93IHRvIGltcGxlbWVudCB2aXJ0aW8tbWRldgogICAg
ZnJhbWV3b3JrCgogLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAg
IHwgIDExICstCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgIHwg
IDE3ICstCiBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAgICAgfCAg
MTcgKy0KIGRyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYyAgICAgICAgICAgICB8ICAx
NCArLQogZHJpdmVycy92ZmlvL21kZXYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgICA3
ICsKIGRyaXZlcnMvdmZpby9tZGV2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
CiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyAgICAgICAgICAgICAgICAgfCAgMjEgKy0K
IGRyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgICAgICAgICAgICAgICB8ICAxNCArCiBk
cml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAgfCAgIDEgKwogZHJp
dmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgIHwgIDM3ICstCiBkcml2
ZXJzL3ZmaW8vbWRldi92aXJ0aW9fbWRldi5jICAgICAgICAgICAgICAgfCA0MTYgKysrKysrKysr
KysKIGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCAr
LQogaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ3ICst
CiBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgICAgICAgICAgICAgfCAgIDggKwog
aW5jbHVkZS9saW51eC92ZmlvX21kZXYuaCAgICAgICAgICAgICAgICAgICAgIHwgIDUzICsrCiBp
bmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmggICAgICAgICAgICAgICAgICAgfCAxNDQgKysrKwog
c2FtcGxlcy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIHNh
bXBsZXMvdmZpby1tZGV2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBzYW1w
bGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgfCAgMTkgKy0KIHNhbXBs
ZXMvdmZpby1tZGV2L21kcHkuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxOSArLQogc2FtcGxl
cy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDE3ICstCiBzYW1wbGVz
L3ZmaW8tbWRldi9tdm5ldC5jICAgICAgICAgICAgICAgICAgICAgfCA2ODggKysrKysrKysrKysr
KysrKysrCiAyMyBmaWxlcyBjaGFuZ2VkLCAxNDgxIGluc2VydGlvbnMoKyksIDg5IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmZpby9tZGV2L3ZpcnRpb19tZGV2LmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZmaW9fbWRldi5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQg
c2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYwoKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
