Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B093D3A9D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Oct 2019 10:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AAA6E069;
	Fri, 11 Oct 2019 08:17:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE56E069;
 Fri, 11 Oct 2019 08:17:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E63FC10DCCA2;
 Fri, 11 Oct 2019 08:17:05 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-241.pek2.redhat.com [10.72.12.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C32321001B08;
 Fri, 11 Oct 2019 08:15:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V3 0/7] mdev based hardware virtio offloading support
Date: Fri, 11 Oct 2019 16:15:50 +0800
Message-Id: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 11 Oct 2019 08:17:06 +0000 (UTC)
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
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
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
cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8yNi8xNQoKQ2hhbmdlcyBmcm9tIFYyOgoKLSBmYWls
IHdoZW4gY2xhc3NfaWQgaXMgbm90IHNwZWNpZmllZAotIGRyb3AgdGhlIHZyaW5naCBwYXRjaAot
IG1hdGNoIHRoZSBkb2MgdG8gdGhlIGNvZGUKLSB0d2VhayB0aGUgY29tbWl0IGxvZwotIG1vdmUg
ZGV2aWNlX29wcyBmcm9tIHBhcmVudCB0byBtZGV2IGRldmljZQotIHJlbW92ZSB0aGUgdW51c2Vk
IE1ERVZfSURfVkhPU1QKCkNoYW5nZXMgZnJvbSBWMToKCi0gbW92ZSB2aXJ0aW9fbWRldi5jIHRv
IGRyaXZlcnMvdmlydGlvCi0gc3RvcmUgY2xhc3NfaWQgaW4gbWRldl9kZXZpY2UgaW5zdGVhZCBv
ZiBtZGV2X3BhcmVudAotIHN0b3JlIGRldmljZV9vcHMgaW4gbWRldl9kZXZpY2UgaW5zdGVhZCBv
ZiBtZGV2X3BhcmVudAotIHJlb3JkZXIgdGhlIHBhdGNoLCB2cmluZ2ggZml4IGNvbWVzIGZpcnN0
Ci0gcmVhbGx5IHNpbGVudCBjb21waWxpbmcgd2FybmluZ3MKLSByZWFsbHkgc3dpdGNoIHRvIHVz
ZSB1MTYgZm9yIGNsYXNzX2lkCi0gdWV2ZW50IGFuZCBtb2Rwb3N0IHN1cHBvcnQgZm9yIG1kZXYg
Y2xhc3NfaWQKLSB2cmFpb3VzIHR3ZWFrcyBwZXIgY29tbWVudHMgZnJvbSBQYXJhdgoKQ2hhbmdl
cyBmcm9tIFJGQy1WMjoKCi0gc2lsZW50IGNvbXBpbGUgd2FybmluZ3Mgb24gc29tZSBzcGVjaWZp
YyBjb25maWd1cmF0aW9uCi0gdXNlIHUxNiBpbnN0ZWFkIHU4IGZvciBjbGFzcyBpZAotIHJlc2V2
ZSBNREVWX0lEX1ZIT1NUIGZvciBmdXR1cmUgdmhvc3QtbWRldiB3b3JrCi0gaW50cm9kdWNlICJ2
aXJ0aW8iIHR5cGUgZm9yIG12bmV0IGFuZCBtYWtlICJ2aG9zdCIgdHlwZSBmb3IgZnV0dXJlCiAg
d29yawotIGFkZCBlbnRyaWVzIGluIE1BSU5UQUlORVIKLSB0d2VhayBhbmQgdHlwb3MgZml4ZXMg
aW4gY29tbWl0IGxvZwoKQ2hhbmdlcyBmcm9tIFJGQy1WMToKCi0gcmVuYW1lIGRldmljZSBpZCB0
byBjbGFzcyBpZAotIGFkZCBkb2NzIGZvciBjbGFzcyBpZCBhbmQgZGV2aWNlIHNwZWNpZmljIG9w
cyAoZGV2aWNlX29wcykKLSBzcGxpdCBkZXZpY2Vfb3BzIGludG8gc2VwZXJhdGUgaGVhZGVycwot
IGRyb3AgdGhlIG1kZXZfc2V0X2RtYV9vcHMoKQotIHVzZSBkZXZpY2Vfb3BzIHRvIGltcGxlbWVu
dCB0aGUgdHJhbnNwb3J0IEFQSSwgdGhlbiBpdCdzIG5vdCBhIHBhcnQKICBvZiBVQVBJIGFueSBt
b3JlCi0gdXNlIEdGUF9BVE9NSUMgaW4gbXZuZXQgc2FtcGxlIGRldmljZSBhbmQgb3RoZXIgdHdl
YWtzCi0gc2V0X3ZyaW5nX2Jhc2UvZ2V0X3ZyaW5nX2Jhc2Ugc3VwcG9ydCBmb3IgbXZuZXQgZGV2
aWNlCgpKYXNvbiBXYW5nICg3KToKICBtZGV2OiBjbGFzcyBpZCBzdXBwb3J0CiAgbWRldjogYnVz
IHVldmVudCBzdXBwb3J0CiAgbW9kcG9zdDogYWRkIHN1cHBvcnQgZm9yIG1kZXYgY2xhc3MgaWQK
ICBtZGV2OiBpbnRyb2R1Y2UgZGV2aWNlIHNwZWNpZmljIG9wcwogIG1kZXY6IGludHJvZHVjZSB2
aXJ0aW8gZGV2aWNlIGFuZCBpdHMgZGV2aWNlIG9wcwogIHZpcnRpbzogaW50cm9kdWNlIGEgbWRl
diBiYXNlZCB0cmFuc3BvcnQKICBkb2NzOiBzYW1wbGUgZHJpdmVyIHRvIGRlbW9uc3RyYXRlIGhv
dyB0byBpbXBsZW1lbnQgdmlydGlvLW1kZXYKICAgIGZyYW1ld29yawoKIC4uLi9kcml2ZXItYXBp
L3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCAgICAgICB8ICAyNSArLQogTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICB8ICAxNyArLQogZHJpdmVycy9zMzkwL2Npby92
ZmlvX2Njd19vcHMuYyAgICAgICAgICAgICAgIHwgIDE3ICstCiBkcml2ZXJzL3MzOTAvY3J5cHRv
L3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgfCAgMTMgKy0KIGRyaXZlcnMvdmZpby9tZGV2L21k
ZXZfY29yZS5jICAgICAgICAgICAgICAgICB8ICAxOCArCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2
X2RyaXZlci5jICAgICAgICAgICAgICAgfCAgMjIgKwogZHJpdmVycy92ZmlvL21kZXYvbWRldl9w
cml2YXRlLmggICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRl
di5jICAgICAgICAgICAgICAgICB8ICA0NSArLQogZHJpdmVycy92aXJ0aW8vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvdmlydGlvL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jICAg
ICAgICAgICAgICAgICAgfCA0MTYgKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbWRldi5oICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0OSArLQogaW5jbHVkZS9saW51eC9tb2RfZGV2aWNl
dGFibGUuaCAgICAgICAgICAgICAgIHwgICA4ICsKIGluY2x1ZGUvbGludXgvdmZpb19tZGV2Lmgg
ICAgICAgICAgICAgICAgICAgICB8ICA1MiArKwogaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5o
ICAgICAgICAgICAgICAgICAgIHwgMTQ4ICsrKysKIHNhbXBsZXMvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBzYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDE5ICstCiBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgMjAgKy0KIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICAxNyArLQogc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYyAgICAgICAg
ICAgICAgICAgICAgIHwgNjkxICsrKysrKysrKysrKysrKysrKwogc2NyaXB0cy9tb2QvZGV2aWNl
dGFibGUtb2Zmc2V0cy5jICAgICAgICAgICAgIHwgICAzICsKIHNjcmlwdHMvbW9kL2ZpbGUyYWxp
YXMuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiAyNCBmaWxlcyBjaGFuZ2VkLCAxNTIz
IGluc2VydGlvbnMoKyksIDg3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvdmlydGlvL3ZpcnRpb19tZGV2LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4
L3ZmaW9fbWRldi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRl
di5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYwoKLS0gCjIu
MTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
