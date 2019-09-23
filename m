Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A52BB906
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Sep 2019 18:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852186E963;
	Mon, 23 Sep 2019 16:05:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA516E963;
 Mon, 23 Sep 2019 16:05:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A300BA26698;
 Mon, 23 Sep 2019 16:05:36 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81C3660852;
 Mon, 23 Sep 2019 16:05:29 +0000 (UTC)
Date: Mon, 23 Sep 2019 10:05:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/6] mdev: class id support
Message-ID: <20190923100529.54568ad8@x1.home>
In-Reply-To: <20190923130331.29324-2-jasowang@redhat.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-2-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 23 Sep 2019 16:05:37 +0000 (UTC)
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
Cc: kvm@vger.kernel.org, mst@redhat.com, airlied@linux.ie,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyMyBTZXAgMjAxOSAyMTowMzoyNiArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gTWRldiBidXMgb25seSBzdXBwb3J0cyB2ZmlvIGRyaXZlciBy
aWdodCBub3csIHNvIGl0IGRvZXNuJ3QgaW1wbGVtZW50Cj4gbWF0Y2ggbWV0aG9kLiBCdXQgaW4g
dGhlIGZ1dHVyZSwgd2UgbWF5IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywKPiBvbmUgZXhh
bXBsZSBpcyB2aXJ0aW8tbWRldlsxXSBkcml2ZXIuIFRoaXMgbWVhbnMgd2UgbmVlZCB0byBhZGQg
ZGV2aWNlCj4gY2xhc3MgaWQgc3VwcG9ydCBpbiBidXMgbWF0Y2ggbWV0aG9kIHRvIHBhaXIgdGhl
IG1kZXYgZGV2aWNlIGFuZCBtZGV2Cj4gZHJpdmVyIGNvcnJlY3RseS4KPiAKPiBTbyB0aGlzIHBh
dGNoIGFkZHMgaWRfdGFibGUgdG8gbWRldl9kcml2ZXIgYW5kIGNsYXNzX2lkIGZvciBtZGV2Cj4g
cGFyZW50IHdpdGggdGhlIG1hdGNoIG1ldGhvZCBmb3IgbWRldiBidXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCB8ICA3ICsrKysrLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgICAg
IHwgIDMgKystCj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAg
ICAgICAgfCAxNCArKysrKysrKysrKystLQo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZl
ci5jICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgZHJpdmVycy92Zmlv
L21kZXYvbWRldl9wcml2YXRlLmggICAgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy92
ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysrKwo+ICBp
bmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysr
KysrLQo+ICBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgICAgICAgICAgICAgICAg
IHwgIDggKysrKysrKysKPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIHNhbXBsZXMvdmZpby1tZGV2L21kcHkuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMiArLQo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZl
ci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4gaW5kZXggMjVlYjdkNWI4MzRiLi4wZTA1
MjA3MmUxZDggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVk
aWF0ZWQtZGV2aWNlLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1l
ZGlhdGVkLWRldmljZS5yc3QKPiBAQCAtMTAyLDEyICsxMDIsMTQgQEAgc3RydWN0dXJlIHRvIHJl
cHJlc2VudCBhIG1lZGlhdGVkIGRldmljZSdzIGRyaXZlcjo6Cj4gICAgICAgICogQHByb2JlOiBj
YWxsZWQgd2hlbiBuZXcgZGV2aWNlIGNyZWF0ZWQKPiAgICAgICAgKiBAcmVtb3ZlOiBjYWxsZWQg
d2hlbiBkZXZpY2UgcmVtb3ZlZAo+ICAgICAgICAqIEBkcml2ZXI6IGRldmljZSBkcml2ZXIgc3Ry
dWN0dXJlCj4gKyAgICAgICogQGlkX3RhYmxlOiB0aGUgaWRzIHNlcnZpY2VkIGJ5IHRoaXMgZHJp
dmVyLgo+ICAgICAgICAqLwo+ICAgICAgIHN0cnVjdCBtZGV2X2RyaXZlciB7Cj4gIAkgICAgIGNv
bnN0IGNoYXIgKm5hbWU7Cj4gIAkgICAgIGludCAgKCpwcm9iZSkgIChzdHJ1Y3QgZGV2aWNlICpk
ZXYpOwo+ICAJICAgICB2b2lkICgqcmVtb3ZlKSAoc3RydWN0IGRldmljZSAqZGV2KTsKPiAgCSAg
ICAgc3RydWN0IGRldmljZV9kcml2ZXIgICAgZHJpdmVyOwo+ICsJICAgICBjb25zdCBzdHJ1Y3Qg
bWRldl9jbGFzc19pZCAqaWRfdGFibGU7Cj4gICAgICAgfTsKPiAgCj4gIEEgbWVkaWF0ZWQgYnVz
IGRyaXZlciBmb3IgbWRldiBzaG91bGQgdXNlIHRoaXMgc3RydWN0dXJlIGluIHRoZSBmdW5jdGlv
biBjYWxscwo+IEBAIC0xMTYsNyArMTE4LDcgQEAgdG8gcmVnaXN0ZXIgYW5kIHVucmVnaXN0ZXIg
aXRzZWxmIHdpdGggdGhlIGNvcmUgZHJpdmVyOgo+ICAqIFJlZ2lzdGVyOjoKPiAgCj4gICAgICBl
eHRlcm4gaW50ICBtZGV2X3JlZ2lzdGVyX2RyaXZlcihzdHJ1Y3QgbWRldl9kcml2ZXIgKmRydiwK
PiAtCQkJCSAgIHN0cnVjdCBtb2R1bGUgKm93bmVyKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBtb2R1bGUgKm93bmVyKTsKPiAgCj4gICogVW5yZWdpc3Rl
cjo6Cj4gIAo+IEBAIC0xNjMsNyArMTY1LDggQEAgQSBkcml2ZXIgc2hvdWxkIHVzZSB0aGUgbWRl
dl9wYXJlbnRfb3BzIHN0cnVjdHVyZSBpbiB0aGUgZnVuY3Rpb24gY2FsbCB0bwo+ICByZWdpc3Rl
ciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6Cj4gIAo+ICAJZXh0ZXJuIGludCAg
bWRldl9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LAo+IC0JICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKTsK
PiArCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtZGV2X3Bh
cmVudF9vcHMgKm9wcywKPiArCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU4IGNs
YXNzX2lkKTsKPiAgCj4gIEhvd2V2ZXIsIHRoZSBtZGV2X3BhcmVudF9vcHMgc3RydWN0dXJlIGlz
IG5vdCByZXF1aXJlZCBpbiB0aGUgZnVuY3Rpb24gY2FsbAo+ICB0aGF0IGEgZHJpdmVyIHNob3Vs
ZCB1c2UgdG8gdW5yZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPiBpbmRleCAyM2FhM2U1MGNiZjguLjE5ZDUxYTM1ZjAx
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gQEAgLTE2MjUsNyArMTYyNSw3IEBA
IHN0YXRpYyBpbnQga3ZtZ3RfaG9zdF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZ3Z0
LCBjb25zdCB2b2lkICpvcHMpCj4gIAkJcmV0dXJuIC1FRkFVTFQ7Cj4gIAlpbnRlbF92Z3B1X29w
cy5zdXBwb3J0ZWRfdHlwZV9ncm91cHMgPSBrdm1fdmdwdV90eXBlX2dyb3VwczsKPiAgCj4gLQly
ZXR1cm4gbWRldl9yZWdpc3Rlcl9kZXZpY2UoZGV2LCAmaW50ZWxfdmdwdV9vcHMpOwo+ICsJcmV0
dXJuIG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2UoZGV2LCAmaW50ZWxfdmdwdV9vcHMpOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgdm9pZCBrdm1ndF9ob3N0X2V4aXQoc3RydWN0IGRldmljZSAqZGV2KQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jIGIvZHJpdmVycy9z
MzkwL2Npby92ZmlvX2Njd19vcHMuYwo+IGluZGV4IGYwZDcxYWI3N2M1MC4uMjQ2ZmYwZjgwOTQ0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMKPiArKysgYi9k
cml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jCj4gQEAgLTU4OCw3ICs1ODgsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyB2ZmlvX2Njd19tZGV2X29wcyA9IHsKPiAg
Cj4gIGludCB2ZmlvX2Njd19tZGV2X3JlZyhzdHJ1Y3Qgc3ViY2hhbm5lbCAqc2NoKQo+ICB7Cj4g
LQlyZXR1cm4gbWRldl9yZWdpc3Rlcl9kZXZpY2UoJnNjaC0+ZGV2LCAmdmZpb19jY3dfbWRldl9v
cHMpOwo+ICsJcmV0dXJuIG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2UoJnNjaC0+ZGV2LCAmdmZp
b19jY3dfbWRldl9vcHMpOwo+ICB9Cj4gIAo+ICB2b2lkIHZmaW9fY2N3X21kZXZfdW5yZWcoc3Ry
dWN0IHN1YmNoYW5uZWwgKnNjaCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2NyeXB0by92
ZmlvX2FwX29wcy5jIGIvZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jCj4gaW5kZXgg
NWMwZjUzYzZkZGU3Li43NDg3ZmMzOWQyYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zMzkwL2Ny
eXB0by92ZmlvX2FwX29wcy5jCj4gKysrIGIvZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29w
cy5jCj4gQEAgLTEyOTUsNyArMTI5NSw4IEBAIGludCB2ZmlvX2FwX21kZXZfcmVnaXN0ZXIodm9p
ZCkKPiAgewo+ICAJYXRvbWljX3NldCgmbWF0cml4X2Rldi0+YXZhaWxhYmxlX2luc3RhbmNlcywg
TUFYX1pERVZfRU5UUklFU19FWFQpOwo+ICAKPiAtCXJldHVybiBtZGV2X3JlZ2lzdGVyX2Rldmlj
ZSgmbWF0cml4X2Rldi0+ZGV2aWNlLCAmdmZpb19hcF9tYXRyaXhfb3BzKTsKPiArCXJldHVybiBt
ZGV2X3JlZ2lzdGVyX3ZmaW9fZGV2aWNlKCZtYXRyaXhfZGV2LT5kZXZpY2UsCj4gKwkJCQkJICZ2
ZmlvX2FwX21hdHJpeF9vcHMpOwo+ICB9Cj4gIAo+ICB2b2lkIHZmaW9fYXBfbWRldl91bnJlZ2lz
dGVyKHZvaWQpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jIGIv
ZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPiBpbmRleCBiNTU4ZDRjZmQwODIuLmEwMmMy
NTZhMzUxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+ICsr
KyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4gQEAgLTEzNSwxMSArMTM1LDE0IEBA
IHN0YXRpYyBpbnQgbWRldl9kZXZpY2VfcmVtb3ZlX2NiKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSkKPiAgICogbWRldl9yZWdpc3Rlcl9kZXZpY2UgOiBSZWdpc3RlciBhIGRldmljZQo+
ICAgKiBAZGV2OiBkZXZpY2Ugc3RydWN0dXJlIHJlcHJlc2VudGluZyBwYXJlbnQgZGV2aWNlLgo+
ICAgKiBAb3BzOiBQYXJlbnQgZGV2aWNlIG9wZXJhdGlvbiBzdHJ1Y3R1cmUgdG8gYmUgcmVnaXN0
ZXJlZC4KPiArICogQGlkOiBkZXZpY2UgaWQuCj4gICAqCj4gICAqIEFkZCBkZXZpY2UgdG8gbGlz
dCBvZiByZWdpc3RlcmVkIHBhcmVudCBkZXZpY2VzLgo+ICAgKiBSZXR1cm5zIGEgbmVnYXRpdmUg
dmFsdWUgb24gZXJyb3IsIG90aGVyd2lzZSAwLgo+ICAgKi8KPiAtaW50IG1kZXZfcmVnaXN0ZXJf
ZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAq
b3BzKQo+ICtpbnQgbWRldl9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LAo+ICsJ
CQkgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzLAo+ICsJCQkgdTggY2xhc3NfaWQp
Cj4gIHsKPiAgCWludCByZXQ7Cj4gIAlzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudDsKPiBAQCAt
MTc1LDYgKzE3OCw3IEBAIGludCBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcykKPiAgCj4gIAlwYXJlbnQtPmRl
diA9IGRldjsKPiAgCXBhcmVudC0+b3BzID0gb3BzOwo+ICsJcGFyZW50LT5jbGFzc19pZCA9IGNs
YXNzX2lkOwo+ICAKCkkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byB0aWUgdGhlIGNsYXNzX2lkIHRv
IHRoZSBwYXJlbnQuICBtZGV2IHBhcmVudApkZXZpY2VzIGNhbiBjcmVhdGUgdmFyaW91cyB0eXBl
cyBvZiBkZXZpY2VzLCBzb21lIG1pZ2h0IGJlIHZpcnRpbywgc29tZQptaWdodCBiZSB2ZmlvLiAg
SSB0aGluayB0aGUgY292ZXIgbGV0dGVyIGV2ZW4gc3VnZ2VzdHMgdGhhdCdzIGEKZGlyZWN0aW9u
IHRoZXNlIHZpcnRpbyBkZXZpY2VzIG1pZ2h0IGJlIGhlYWRlZC4gIEl0IHNlZW1zIHRoZSBjbGFz
cwpzaG91bGQgYmUgb24gdGhlIHJlc3VsdGluZyBkZXZpY2UgaXRzZWxmLiAgVGhhdCBhbHNvIHN1
Z2dlc3RzIHRoYXQgYXQKdGhlIHBhcmVudCB3ZSBjYW5ub3QgaGF2ZSBhIHNpbmdsZSBkZXZpY2Vf
b3BzLCB0aGUgb3BzIHVzZWQgd2lsbCBkZXBlbmQKb24gdGhlIHR5cGUgb2YgZGV2aWNlIGNyZWF0
ZWQuICBQZXJoYXBzIHRoYXQgbWVhbnMgd2UgbmVlZCB2ZmlvX29wcwphbG9uZ3NpZGUgdmlydGlv
X29wcywgcmF0aGVyIHRoYW4gYSBjb21tb24gZGV2aWNlX29wcy4gIFRoYW5rcywKCkFsZXgKCgo+
ICAJaWYgKCFtZGV2X2J1c19jb21wYXRfY2xhc3MpIHsKPiAgCQltZGV2X2J1c19jb21wYXRfY2xh
c3MgPSBjbGFzc19jb21wYXRfcmVnaXN0ZXIoIm1kZXZfYnVzIik7Cj4gQEAgLTIwOCw3ICsyMTIs
MTMgQEAgaW50IG1kZXZfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qg
c3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKQo+ICAJCXB1dF9kZXZpY2UoZGV2KTsKPiAgCXJl
dHVybiByZXQ7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTChtZGV2X3JlZ2lzdGVyX2RldmljZSk7Cj4g
Kwo+ICtpbnQgbWRldl9yZWdpc3Rlcl92ZmlvX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4g
KwkJCSAgICAgIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcykKPiArewo+ICsJcmV0
dXJuIG1kZXZfcmVnaXN0ZXJfZGV2aWNlKGRldiwgb3BzLCBNREVWX0lEX1ZGSU8pOwo+ICt9Cj4g
K0VYUE9SVF9TWU1CT0wobWRldl9yZWdpc3Rlcl92ZmlvX2RldmljZSk7Cj4gIAo+ICAvKgo+ICAg
KiBtZGV2X3VucmVnaXN0ZXJfZGV2aWNlIDogVW5yZWdpc3RlciBhIHBhcmVudCBkZXZpY2UKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyBiL2RyaXZlcnMvdmZp
by9tZGV2L21kZXZfZHJpdmVyLmMKPiBpbmRleCAwZDMyMjNhZWUyMGIuLmI3MGJiZWJjOWRkMyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jCj4gKysrIGIvZHJp
dmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYwo+IEBAIC02OSw4ICs2OSwyMiBAQCBzdGF0aWMg
aW50IG1kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCXJldHVybiAwOwo+ICB9Cj4g
IAo+ICtzdGF0aWMgaW50IG1kZXZfbWF0Y2goc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2
aWNlX2RyaXZlciAqZHJ2KQo+ICt7Cj4gKwl1bnNpZ25lZCBpbnQgaTsKPiArCXN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiA9IHRvX21kZXZfZGV2aWNlKGRldik7Cj4gKwlzdHJ1Y3QgbWRldl9kcml2
ZXIgKm1kcnYgPSB0b19tZGV2X2RyaXZlcihkcnYpOwo+ICsJY29uc3Qgc3RydWN0IG1kZXZfY2xh
c3NfaWQgKmlkcyA9IG1kcnYtPmlkX3RhYmxlOwo+ICsKPiArCWZvciAoaSA9IDA7IGlkc1tpXS5p
ZDsgaSsrKQo+ICsJCWlmIChpZHNbaV0uaWQgPT0gbWRldi0+cGFyZW50LT5jbGFzc19pZCkKPiAr
CQkJcmV0dXJuIDE7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RydWN0IGJ1c190eXBlIG1k
ZXZfYnVzX3R5cGUgPSB7Cj4gIAkubmFtZQkJPSAibWRldiIsCj4gKwkubWF0Y2gJCT0gbWRldl9t
YXRjaCwKPiAgCS5wcm9iZQkJPSBtZGV2X3Byb2JlLAo+ICAJLnJlbW92ZQkJPSBtZGV2X3JlbW92
ZSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgg
Yi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaAo+IGluZGV4IDdkOTIyOTUwY2FhZi4u
ZTU4YjA3Yzg2NmIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0
ZS5oCj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKPiBAQCAtMjIsNiAr
MjIsNyBAQCBzdHJ1Y3QgbWRldl9wYXJlbnQgewo+ICAJc3RydWN0IGxpc3RfaGVhZCB0eXBlX2xp
c3Q7Cj4gIAkvKiBTeW5jaHJvbml6ZSBkZXZpY2UgY3JlYXRpb24vcmVtb3ZhbCB3aXRoIHBhcmVu
dCB1bnJlZ2lzdHJhdGlvbiAqLwo+ICAJc3RydWN0IHJ3X3NlbWFwaG9yZSB1bnJlZ19zZW07Cj4g
Kwl1OCBjbGFzc19pZDsKPiAgfTsKPiAgCj4gIHN0cnVjdCBtZGV2X2RldmljZSB7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jIGIvZHJpdmVycy92ZmlvL21kZXYv
dmZpb19tZGV2LmMKPiBpbmRleCAzMDk2NGE0ZTBhMjguLmZkMmE0ZDlhM2YyNiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+ICsrKyBiL2RyaXZlcnMvdmZpby9t
ZGV2L3ZmaW9fbWRldi5jCj4gQEAgLTEyMCwxMCArMTIwLDE2IEBAIHN0YXRpYyB2b2lkIHZmaW9f
bWRldl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJdmZpb19kZWxfZ3JvdXBfZGV2KGRl
dik7Cj4gIH0KPiAgCj4gK3N0YXRpYyBzdHJ1Y3QgbWRldl9jbGFzc19pZCBpZF90YWJsZVtdID0g
ewo+ICsJeyBNREVWX0lEX1ZGSU8gfSwKPiArCXsgMCB9LAo+ICt9Owo+ICsKPiAgc3RhdGljIHN0
cnVjdCBtZGV2X2RyaXZlciB2ZmlvX21kZXZfZHJpdmVyID0gewo+ICAJLm5hbWUJPSAidmZpb19t
ZGV2IiwKPiAgCS5wcm9iZQk9IHZmaW9fbWRldl9wcm9iZSwKPiAgCS5yZW1vdmUJPSB2ZmlvX21k
ZXZfcmVtb3ZlLAo+ICsJLmlkX3RhYmxlID0gaWRfdGFibGUsCj4gIH07Cj4gIAo+ICBzdGF0aWMg
aW50IF9faW5pdCB2ZmlvX21kZXZfaW5pdCh2b2lkKQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21kZXYuaCBiL2luY2x1ZGUvbGludXgvbWRldi5oCj4gaW5kZXggMGNlMzBjYTc4ZGIwLi4z
ZWJhZTMxMGY1OTkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tZGV2LmgKPiArKysgYi9p
bmNsdWRlL2xpbnV4L21kZXYuaAo+IEBAIC0xMTgsNiArMTE4LDcgQEAgc3RydWN0IG1kZXZfdHlw
ZV9hdHRyaWJ1dGUgbWRldl90eXBlX2F0dHJfIyNfbmFtZSA9CQlcCj4gICAqIEBwcm9iZTogY2Fs
bGVkIHdoZW4gbmV3IGRldmljZSBjcmVhdGVkCj4gICAqIEByZW1vdmU6IGNhbGxlZCB3aGVuIGRl
dmljZSByZW1vdmVkCj4gICAqIEBkcml2ZXI6IGRldmljZSBkcml2ZXIgc3RydWN0dXJlCj4gKyAq
IEBpZF90YWJsZTogdGhlIGlkcyBzZXJ2aWNlZCBieSB0aGlzIGRyaXZlci4KPiAgICoKPiAgICoq
Lwo+ICBzdHJ1Y3QgbWRldl9kcml2ZXIgewo+IEBAIC0xMjUsNiArMTI2LDcgQEAgc3RydWN0IG1k
ZXZfZHJpdmVyIHsKPiAgCWludCAgKCpwcm9iZSkoc3RydWN0IGRldmljZSAqZGV2KTsKPiAgCXZv
aWQgKCpyZW1vdmUpKHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gIAlzdHJ1Y3QgZGV2aWNlX2RyaXZl
ciBkcml2ZXI7Cj4gKwljb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCAqaWRfdGFibGU7Cj4gIH07
Cj4gIAo+ICAjZGVmaW5lIHRvX21kZXZfZHJpdmVyKGRydikJY29udGFpbmVyX29mKGRydiwgc3Ry
dWN0IG1kZXZfZHJpdmVyLCBkcml2ZXIpCj4gQEAgLTEzNSw3ICsxMzcsOCBAQCBjb25zdCBndWlk
X3QgKm1kZXZfdXVpZChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ICAKPiAgZXh0ZXJuIHN0
cnVjdCBidXNfdHlwZSBtZGV2X2J1c190eXBlOwo+ICAKPiAtaW50IG1kZXZfcmVnaXN0ZXJfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3Bz
KTsKPiAraW50IG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LAo+
ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzICpvcHMpOwo+ICB2b2lkIG1k
ZXZfdW5yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KTsKPiAgCj4gIGludCBtZGV2
X3JlZ2lzdGVyX2RyaXZlcihzdHJ1Y3QgbWRldl9kcml2ZXIgKmRydiwgc3RydWN0IG1vZHVsZSAq
b3duZXIpOwo+IEBAIC0xNDUsNCArMTQ4LDYgQEAgc3RydWN0IGRldmljZSAqbWRldl9wYXJlbnRf
ZGV2KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gIHN0cnVjdCBkZXZpY2UgKm1kZXZfZGV2
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gIHN0cnVjdCBtZGV2X2RldmljZSAqbWRldl9m
cm9tX2RldihzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICAKPiArI2RlZmluZSBNREVWX0lEX1ZGSU8g
MSAvKiBWRklPIGRldmljZSAqLwo+ICsKPiAgI2VuZGlmIC8qIE1ERVZfSCAqLwo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9tb2Rf
ZGV2aWNldGFibGUuaAo+IGluZGV4IDU3MTRmZDM1YTgzYy4uZjMyYzZlNDRmYjFhIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L21vZF9kZXZpY2V0YWJsZS5oCj4gQEAgLTgyMSw0ICs4MjEsMTIgQEAgc3RydWN0IHdtaV9k
ZXZpY2VfaWQgewo+ICAJY29uc3Qgdm9pZCAqY29udGV4dDsKPiAgfTsKPiAgCj4gKy8qKgo+ICsg
KiBzdHJ1Y3QgbWRldl9jbGFzc19pZCAtIE1ERVYgZGV2aWNlIGNsYXNzIGlkZW50aWZpZXIKPiAr
ICogQGlkOiBVc2VkIHRvIGlkZW50aWZ5IGEgc3BlY2lmaWMgY2xhc3Mgb2YgZGV2aWNlLCBlLmcg
dmZpby1tZGV2IGRldmljZS4KPiArICovCj4gK3N0cnVjdCBtZGV2X2NsYXNzX2lkIHsKPiArCV9f
dTE2IGlkOwo+ICt9Owo+ICsKPiAgI2VuZGlmIC8qIExJTlVYX01PRF9ERVZJQ0VUQUJMRV9IICov
Cj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jIGIvc2FtcGxlcy92Zmlv
LW1kZXYvbWJvY2hzLmMKPiBpbmRleCBhYzVjOGMxN2IxZmYuLjcxYTQ0NjliZTg1ZCAxMDA2NDQK
PiAtLS0gYS9zYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYwo+ICsrKyBiL3NhbXBsZXMvdmZpby1t
ZGV2L21ib2Nocy5jCj4gQEAgLTE0NjgsNyArMTQ2OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG1i
b2Noc19kZXZfaW5pdCh2b2lkKQo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGZhaWxlZDI7Cj4gIAo+
IC0JcmV0ID0gbWRldl9yZWdpc3Rlcl9kZXZpY2UoJm1ib2Noc19kZXYsICZtZGV2X2ZvcHMpOwo+
ICsJcmV0ID0gbWRldl9yZWdpc3Rlcl92ZmlvX2RldmljZSgmbWJvY2hzX2RldiwgJm1kZXZfZm9w
cyk7Cj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gZmFpbGVkMzsKPiAgCj4gZGlmZiAtLWdpdCBhL3Nh
bXBsZXMvdmZpby1tZGV2L21kcHkuYyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYwo+IGluZGV4
IGNjODZiZjY1NjZlNC4uZDMwMjlkZDI3ZDkxIDEwMDY0NAo+IC0tLSBhL3NhbXBsZXMvdmZpby1t
ZGV2L21kcHkuYwo+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYwo+IEBAIC03NzUsNyAr
Nzc1LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWRweV9kZXZfaW5pdCh2b2lkKQo+ICAJaWYgKHJl
dCkKPiAgCQlnb3RvIGZhaWxlZDI7Cj4gIAo+IC0JcmV0ID0gbWRldl9yZWdpc3Rlcl9kZXZpY2Uo
Jm1kcHlfZGV2LCAmbWRldl9mb3BzKTsKPiArCXJldCA9IG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZp
Y2UoJm1kcHlfZGV2LCAmbWRldl9mb3BzKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBmYWlsZWQz
Owo+ICAKPiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jIGIvc2FtcGxlcy92
ZmlvLW1kZXYvbXR0eS5jCj4gaW5kZXggOTJlNzcwYTA2ZWEyLi43NDRjODhhNmIyMmMgMTAwNjQ0
Cj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jCj4gKysrIGIvc2FtcGxlcy92ZmlvLW1k
ZXYvbXR0eS5jCj4gQEAgLTE0NjgsNyArMTQ2OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG10dHlf
ZGV2X2luaXQodm9pZCkKPiAgCWlmIChyZXQpCj4gIAkJZ290byBmYWlsZWQyOwo+ICAKPiAtCXJl
dCA9IG1kZXZfcmVnaXN0ZXJfZGV2aWNlKCZtdHR5X2Rldi5kZXYsICZtZGV2X2ZvcHMpOwo+ICsJ
cmV0ID0gbWRldl9yZWdpc3Rlcl92ZmlvX2RldmljZSgmbXR0eV9kZXYuZGV2LCAmbWRldl9mb3Bz
KTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBmYWlsZWQzOwo+ICAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
