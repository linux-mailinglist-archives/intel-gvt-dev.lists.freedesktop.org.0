Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C6BC57A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 12:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AE06E9E5;
	Tue, 24 Sep 2019 10:12:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9356E9E1;
 Tue, 24 Sep 2019 10:12:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1163330860BD;
 Tue, 24 Sep 2019 10:12:01 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7AF219C58;
 Tue, 24 Sep 2019 10:11:39 +0000 (UTC)
Subject: Re: [PATCH 1/6] mdev: class id support
To: Alex Williamson <alex.williamson@redhat.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-2-jasowang@redhat.com>
 <20190923100529.54568ad8@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e565c496-7ce8-5889-57c7-7356458c50d5@redhat.com>
Date: Tue, 24 Sep 2019 18:11:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923100529.54568ad8@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 24 Sep 2019 10:12:01 +0000 (UTC)
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

Ck9uIDIwMTkvOS8yNCDkuIrljYgxMjowNSwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIE1v
biwgMjMgU2VwIDIwMTkgMjE6MDM6MjYgKzA4MDAKPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPgo+PiBNZGV2IGJ1cyBvbmx5IHN1cHBvcnRzIHZmaW8gZHJpdmVyIHJp
Z2h0IG5vdywgc28gaXQgZG9lc24ndCBpbXBsZW1lbnQKPj4gbWF0Y2ggbWV0aG9kLiBCdXQgaW4g
dGhlIGZ1dHVyZSwgd2UgbWF5IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywKPj4gb25lIGV4
YW1wbGUgaXMgdmlydGlvLW1kZXZbMV0gZHJpdmVyLiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gYWRk
IGRldmljZQo+PiBjbGFzcyBpZCBzdXBwb3J0IGluIGJ1cyBtYXRjaCBtZXRob2QgdG8gcGFpciB0
aGUgbWRldiBkZXZpY2UgYW5kIG1kZXYKPj4gZHJpdmVyIGNvcnJlY3RseS4KPj4KPj4gU28gdGhp
cyBwYXRjaCBhZGRzIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBjbGFzc19pZCBmb3IgbWRl
dgo+PiBwYXJlbnQgd2l0aCB0aGUgbWF0Y2ggbWV0aG9kIGZvciBtZGV2IGJ1cy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0IHwgIDcgKysr
KystLQo+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4+ICBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPj4gIGRyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYyAgICAg
ICAgICAgICAgICAgfCAgMyArKy0KPj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAg
ICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKystLQo+PiAgZHJpdmVycy92ZmlvL21k
ZXYvbWRldl9kcml2ZXIuYyAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+
ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAgICAgIHwgIDEg
Kwo+PiAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgICAgICB8
ICA2ICsrKysrKwo+PiAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA3ICsrKysrKy0KPj4gIGluY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgg
ICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwo+PiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJv
Y2hzLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4+ICBzYW1wbGVzL3ZmaW8tbWRl
di9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gIHNhbXBsZXMvdmZp
by1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgMTMgZmls
ZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0
IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiBp
bmRleCAyNWViN2Q1YjgzNGIuLjBlMDUyMDcyZTFkOCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+IEBAIC0xMDIsMTIg
KzEwMiwxNCBAQCBzdHJ1Y3R1cmUgdG8gcmVwcmVzZW50IGEgbWVkaWF0ZWQgZGV2aWNlJ3MgZHJp
dmVyOjoKPj4gICAgICAgICogQHByb2JlOiBjYWxsZWQgd2hlbiBuZXcgZGV2aWNlIGNyZWF0ZWQK
Pj4gICAgICAgICogQHJlbW92ZTogY2FsbGVkIHdoZW4gZGV2aWNlIHJlbW92ZWQKPj4gICAgICAg
ICogQGRyaXZlcjogZGV2aWNlIGRyaXZlciBzdHJ1Y3R1cmUKPj4gKyAgICAgICogQGlkX3RhYmxl
OiB0aGUgaWRzIHNlcnZpY2VkIGJ5IHRoaXMgZHJpdmVyLgo+PiAgICAgICAgKi8KPj4gICAgICAg
c3RydWN0IG1kZXZfZHJpdmVyIHsKPj4gIAkgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4+ICAJICAg
ICBpbnQgICgqcHJvYmUpICAoc3RydWN0IGRldmljZSAqZGV2KTsKPj4gIAkgICAgIHZvaWQgKCpy
ZW1vdmUpIChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgCSAgICAgc3RydWN0IGRldmljZV9kcml2
ZXIgICAgZHJpdmVyOwo+PiArCSAgICAgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgKmlkX3Rh
YmxlOwo+PiAgICAgICB9Owo+PiAgCj4+ICBBIG1lZGlhdGVkIGJ1cyBkcml2ZXIgZm9yIG1kZXYg
c2hvdWxkIHVzZSB0aGlzIHN0cnVjdHVyZSBpbiB0aGUgZnVuY3Rpb24gY2FsbHMKPj4gQEAgLTEx
Niw3ICsxMTgsNyBAQCB0byByZWdpc3RlciBhbmQgdW5yZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUg
Y29yZSBkcml2ZXI6Cj4+ICAqIFJlZ2lzdGVyOjoKPj4gIAo+PiAgICAgIGV4dGVybiBpbnQgIG1k
ZXZfcmVnaXN0ZXJfZHJpdmVyKHN0cnVjdCBtZGV2X2RyaXZlciAqZHJ2LAo+PiAtCQkJCSAgIHN0
cnVjdCBtb2R1bGUgKm93bmVyKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgbW9kdWxlICpvd25lcik7Cj4+ICAKPj4gICogVW5yZWdpc3Rlcjo6Cj4+ICAK
Pj4gQEAgLTE2Myw3ICsxNjUsOCBAQCBBIGRyaXZlciBzaG91bGQgdXNlIHRoZSBtZGV2X3BhcmVu
dF9vcHMgc3RydWN0dXJlIGluIHRoZSBmdW5jdGlvbiBjYWxsIHRvCj4+ICByZWdpc3RlciBpdHNl
bGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6Cj4+ICAKPj4gIAlleHRlcm4gaW50ICBtZGV2
X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+IC0JICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKTsKPj4g
KwkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbWRldl9wYXJl
bnRfb3BzICpvcHMsCj4+ICsJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggY2xh
c3NfaWQpOwo+PiAgCj4+ICBIb3dldmVyLCB0aGUgbWRldl9wYXJlbnRfb3BzIHN0cnVjdHVyZSBp
cyBub3QgcmVxdWlyZWQgaW4gdGhlIGZ1bmN0aW9uIGNhbGwKPj4gIHRoYXQgYSBkcml2ZXIgc2hv
dWxkIHVzZSB0byB1bnJlZ2lzdGVyIGl0c2VsZiB3aXRoIHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoK
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4gaW5kZXggMjNhYTNlNTBjYmY4Li4xOWQ1MWEz
NWYwMTkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+IEBAIC0xNjI1LDcgKzE2
MjUsNyBAQCBzdGF0aWMgaW50IGt2bWd0X2hvc3RfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZv
aWQgKmd2dCwgY29uc3Qgdm9pZCAqb3BzKQo+PiAgCQlyZXR1cm4gLUVGQVVMVDsKPj4gIAlpbnRl
bF92Z3B1X29wcy5zdXBwb3J0ZWRfdHlwZV9ncm91cHMgPSBrdm1fdmdwdV90eXBlX2dyb3VwczsK
Pj4gIAo+PiAtCXJldHVybiBtZGV2X3JlZ2lzdGVyX2RldmljZShkZXYsICZpbnRlbF92Z3B1X29w
cyk7Cj4+ICsJcmV0dXJuIG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2UoZGV2LCAmaW50ZWxfdmdw
dV9vcHMpOwo+PiAgfQo+PiAgCj4+ICBzdGF0aWMgdm9pZCBrdm1ndF9ob3N0X2V4aXQoc3RydWN0
IGRldmljZSAqZGV2KQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19v
cHMuYyBiL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMKPj4gaW5kZXggZjBkNzFhYjc3
YzUwLi4yNDZmZjBmODA5NDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvczM5MC9jaW8vdmZpb19j
Y3dfb3BzLmMKPj4gKysrIGIvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYwo+PiBAQCAt
NTg4LDcgKzU4OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzIHZmaW9f
Y2N3X21kZXZfb3BzID0gewo+PiAgCj4+ICBpbnQgdmZpb19jY3dfbWRldl9yZWcoc3RydWN0IHN1
YmNoYW5uZWwgKnNjaCkKPj4gIHsKPj4gLQlyZXR1cm4gbWRldl9yZWdpc3Rlcl9kZXZpY2UoJnNj
aC0+ZGV2LCAmdmZpb19jY3dfbWRldl9vcHMpOwo+PiArCXJldHVybiBtZGV2X3JlZ2lzdGVyX3Zm
aW9fZGV2aWNlKCZzY2gtPmRldiwgJnZmaW9fY2N3X21kZXZfb3BzKTsKPj4gIH0KPj4gIAo+PiAg
dm9pZCB2ZmlvX2Njd19tZGV2X3VucmVnKHN0cnVjdCBzdWJjaGFubmVsICpzY2gpCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMgYi9kcml2ZXJzL3MzOTAv
Y3J5cHRvL3ZmaW9fYXBfb3BzLmMKPj4gaW5kZXggNWMwZjUzYzZkZGU3Li43NDg3ZmMzOWQyYzUg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYwo+PiArKysg
Yi9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMKPj4gQEAgLTEyOTUsNyArMTI5NSw4
IEBAIGludCB2ZmlvX2FwX21kZXZfcmVnaXN0ZXIodm9pZCkKPj4gIHsKPj4gIAlhdG9taWNfc2V0
KCZtYXRyaXhfZGV2LT5hdmFpbGFibGVfaW5zdGFuY2VzLCBNQVhfWkRFVl9FTlRSSUVTX0VYVCk7
Cj4+ICAKPj4gLQlyZXR1cm4gbWRldl9yZWdpc3Rlcl9kZXZpY2UoJm1hdHJpeF9kZXYtPmRldmlj
ZSwgJnZmaW9fYXBfbWF0cml4X29wcyk7Cj4+ICsJcmV0dXJuIG1kZXZfcmVnaXN0ZXJfdmZpb19k
ZXZpY2UoJm1hdHJpeF9kZXYtPmRldmljZSwKPj4gKwkJCQkJICZ2ZmlvX2FwX21hdHJpeF9vcHMp
Owo+PiAgfQo+PiAgCj4+ICB2b2lkIHZmaW9fYXBfbWRldl91bnJlZ2lzdGVyKHZvaWQpCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyBiL2RyaXZlcnMvdmZpby9t
ZGV2L21kZXZfY29yZS5jCj4+IGluZGV4IGI1NThkNGNmZDA4Mi4uYTAyYzI1NmEzNTE0IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiArKysgYi9kcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiBAQCAtMTM1LDExICsxMzUsMTQgQEAgc3RhdGljIGlu
dCBtZGV2X2RldmljZV9yZW1vdmVfY2Ioc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+
PiAgICogbWRldl9yZWdpc3Rlcl9kZXZpY2UgOiBSZWdpc3RlciBhIGRldmljZQo+PiAgICogQGRl
djogZGV2aWNlIHN0cnVjdHVyZSByZXByZXNlbnRpbmcgcGFyZW50IGRldmljZS4KPj4gICAqIEBv
cHM6IFBhcmVudCBkZXZpY2Ugb3BlcmF0aW9uIHN0cnVjdHVyZSB0byBiZSByZWdpc3RlcmVkLgo+
PiArICogQGlkOiBkZXZpY2UgaWQuCj4+ICAgKgo+PiAgICogQWRkIGRldmljZSB0byBsaXN0IG9m
IHJlZ2lzdGVyZWQgcGFyZW50IGRldmljZXMuCj4+ICAgKiBSZXR1cm5zIGEgbmVnYXRpdmUgdmFs
dWUgb24gZXJyb3IsIG90aGVyd2lzZSAwLgo+PiAgICovCj4+IC1pbnQgbWRldl9yZWdpc3Rlcl9k
ZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzICpv
cHMpCj4+ICtpbnQgbWRldl9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LAo+PiAr
CQkJIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcywKPj4gKwkJCSB1OCBjbGFzc19p
ZCkKPj4gIHsKPj4gIAlpbnQgcmV0Owo+PiAgCXN0cnVjdCBtZGV2X3BhcmVudCAqcGFyZW50Owo+
PiBAQCAtMTc1LDYgKzE3OCw3IEBAIGludCBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcykKPj4gIAo+PiAgCXBh
cmVudC0+ZGV2ID0gZGV2Owo+PiAgCXBhcmVudC0+b3BzID0gb3BzOwo+PiArCXBhcmVudC0+Y2xh
c3NfaWQgPSBjbGFzc19pZDsKPj4gIAo+IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byB0aWUgdGhl
IGNsYXNzX2lkIHRvIHRoZSBwYXJlbnQuICBtZGV2IHBhcmVudAo+IGRldmljZXMgY2FuIGNyZWF0
ZSB2YXJpb3VzIHR5cGVzIG9mIGRldmljZXMsIHNvbWUgbWlnaHQgYmUgdmlydGlvLCBzb21lCj4g
bWlnaHQgYmUgdmZpby4gIEkgdGhpbmsgdGhlIGNvdmVyIGxldHRlciBldmVuIHN1Z2dlc3RzIHRo
YXQncyBhCj4gZGlyZWN0aW9uIHRoZXNlIHZpcnRpbyBkZXZpY2VzIG1pZ2h0IGJlIGhlYWRlZC4g
IEl0IHNlZW1zIHRoZSBjbGFzcwo+IHNob3VsZCBiZSBvbiB0aGUgcmVzdWx0aW5nIGRldmljZSBp
dHNlbGYuICBUaGF0IGFsc28gc3VnZ2VzdHMgdGhhdCBhdAo+IHRoZSBwYXJlbnQgd2UgY2Fubm90
IGhhdmUgYSBzaW5nbGUgZGV2aWNlX29wcywgdGhlIG9wcyB1c2VkIHdpbGwgZGVwZW5kCj4gb24g
dGhlIHR5cGUgb2YgZGV2aWNlIGNyZWF0ZWQuICBQZXJoYXBzIHRoYXQgbWVhbnMgd2UgbmVlZCB2
ZmlvX29wcwo+IGFsb25nc2lkZSB2aXJ0aW9fb3BzLCByYXRoZXIgdGhhbiBhIGNvbW1vbiBkZXZp
Y2Vfb3BzLiAgVGhhbmtzLAo+Cj4gQWxleAo+CgpZZXMsIHdpbGwgZG8gaXQgaW4gVjIuCgpUaGFu
a3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
