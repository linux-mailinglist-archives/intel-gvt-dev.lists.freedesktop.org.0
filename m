Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0DEDBE98
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 18 Oct 2019 09:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCD46EAD9;
	Fri, 18 Oct 2019 07:44:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9072E6EAD9;
 Fri, 18 Oct 2019 07:44:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB379793F4;
 Fri, 18 Oct 2019 07:44:25 +0000 (UTC)
Received: from gondolin (dhcp-192-202.str.redhat.com [10.33.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 024D160600;
 Fri, 18 Oct 2019 07:44:09 +0000 (UTC)
Date: Fri, 18 Oct 2019 09:44:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V4 3/6] mdev: introduce device specific ops
Message-ID: <20191018094407.1a91e843.cohuck@redhat.com>
In-Reply-To: <20191017115310.0481cc52@x1.home>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-4-jasowang@redhat.com>
 <20191017170755.15506ada.cohuck@redhat.com>
 <20191017115310.0481cc52@x1.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 18 Oct 2019 07:44:26 +0000 (UTC)
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, cunming.liang@intel.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAxNyBPY3QgMjAxOSAxMTo1MzoxMCAtMDYwMApBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gVGh1LCAxNyBPY3QgMjAxOSAxNzow
Nzo1NSArMDIwMAo+IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPiB3cm90ZToKPiAK
PiA+IE9uIFRodSwgMTcgT2N0IDIwMTkgMTg6NDg6MzMgKzA4MDAKPiA+IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gQ3VycmVudGx5LCBleGNlcHQg
Zm9yIHRoZSBjcmVhdGUgYW5kIHJlbW92ZSwgdGhlIHJlc3Qgb2YKPiA+ID4gbWRldl9wYXJlbnRf
b3BzIGlzIGRlc2lnbmVkIGZvciB2ZmlvLW1kZXYgZHJpdmVyIG9ubHkgYW5kIG1heSBub3QgaGVs
cAo+ID4gPiBmb3Iga2VybmVsIG1kZXYgZHJpdmVyLiBXaXRoIHRoZSBoZWxwIG9mIGNsYXNzIGlk
LCB0aGlzIHBhdGNoCj4gPiA+IGludHJvZHVjZXMgZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBp
bnNpZGUgbWRldl9kZXZpY2UKPiA+ID4gc3RydWN0dXJlLiBUaGlzIGFsbG93cyBkaWZmZXJlbnQg
c2V0IG9mIGNhbGxiYWNrIHRvIGJlIHVzZWQgYnkKPiA+ID4gdmZpby1tZGV2IGFuZCB2aXJ0aW8t
bWRldi4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1k
ZXZpY2UucnN0ICAgICAgIHwgMjUgKysrKystLS0tCj4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4gPiA+ICBkcml2ZXJz
L3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4gPiA+
ICBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgfCAxNCArKyst
LQo+ID4gPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwg
MTggKysrKystLQo+ID4gPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggICAgICAg
ICAgICAgIHwgIDEgKwo+ID4gPiAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAg
ICAgICAgICAgIHwgMzcgKysrKysrLS0tLS0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZGV2Lmgg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDUgKysrKy0tLS0tLS0tLS0tLQo+ID4gPiAgaW5j
bHVkZS9saW51eC92ZmlvX21kZXYuaCAgICAgICAgICAgICAgICAgICAgIHwgNTIgKysrKysrKysr
KysrKysrKysrKwo+ID4gPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAgICAg
ICAgICAgIHwgMjAgKysrKy0tLQo+ID4gPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAg
ICAgICAgICAgICAgICAgIHwgMjAgKysrKy0tLQo+ID4gPiAgc2FtcGxlcy92ZmlvLW1kZXYvbXR0
eS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+ID4gPiAgMTMgZmlsZXMgY2hh
bmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkKPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZmaW9fbWRldi5oCj4gPiA+IAo+ID4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCBi
L0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKPiA+ID4g
aW5kZXggZjlhNzhkNzVhNjdhLi4wY2NhODRkMTk2MDMgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+ID4gPiBA
QCAtMTUyLDExICsxNTIsMjIgQEAgY2FsbGJhY2tzIHBlciBtZGV2IHBhcmVudCBkZXZpY2UsIHBl
ciBtZGV2IHR5cGUsIG9yIGFueSBvdGhlciBjYXRlZ29yaXphdGlvbi4KPiA+ID4gIFZlbmRvciBk
cml2ZXJzIGFyZSBleHBlY3RlZCB0byBiZSBmdWxseSBhc3luY2hyb25vdXMgaW4gdGhpcyByZXNw
ZWN0IG9yCj4gPiA+ICBwcm92aWRlIHRoZWlyIG93biBpbnRlcm5hbCByZXNvdXJjZSBwcm90ZWN0
aW9uLikKPiA+ID4gIAo+ID4gPiAtVGhlIGNhbGxiYWNrcyBpbiB0aGUgbWRldl9wYXJlbnRfb3Bz
IHN0cnVjdHVyZSBhcmUgYXMgZm9sbG93czoKPiA+ID4gLQo+ID4gPiAtKiBvcGVuOiBvcGVuIGNh
bGxiYWNrIG9mIG1lZGlhdGVkIGRldmljZQo+ID4gPiAtKiBjbG9zZTogY2xvc2UgY2FsbGJhY2sg
b2YgbWVkaWF0ZWQgZGV2aWNlCj4gPiA+IC0qIGlvY3RsOiBpb2N0bCBjYWxsYmFjayBvZiBtZWRp
YXRlZCBkZXZpY2UKPiA+ID4gK0FzIG11bHRpcGxlIHR5cGVzIG9mIG1lZGlhdGVkIGRldmljZXMg
bWF5IGJlIHN1cHBvcnRlZCwgdGhlIGRldmljZQo+ID4gPiArbXVzdCBzZXQgdXAgdGhlIGNsYXNz
IGlkIGFuZCB0aGUgZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBpbiBjcmVhdGUoKSAgICAKPiA+
IAo+ID4gcy9pbiBjcmVhdGUoKS9pbiB0aGUgY3JlYXRlKCkvCj4gPiAgIAo+ID4gPiArY2FsbGJh
Y2suIEUuZyBmb3IgdmZpby1tZGV2IGRldmljZSBpdCBuZWVkcyB0byBiZSBkb25lIHRocm91Z2g6
ICAgIAo+ID4gCj4gPiAiRWFjaCBjbGFzcyBwcm92aWRlcyBhIGhlbHBlciBmdW5jdGlvbiB0byBk
byBzbzsgZS5nLiBmb3IgdmZpby1tZGV2Cj4gPiBkZXZpY2VzLCB0aGUgZnVuY3Rpb24gdG8gYmUg
Y2FsbGVkIGlzOiIKPiA+IAo+ID4gPwo+ID4gICAKPiA+ID4gKwo+ID4gPiArICAgIGludCBtZGV2
X3NldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2ZmlvX21kZXZfb3BzICp2ZmlvX29wcyk7Cj4g
PiA+ICsKPiA+ID4gK1RoZSBjbGFzcyBpZCAoc2V0IHRvIE1ERVZfQ0xBU1NfSURfVkZJTykgaXMg
dXNlZCB0byBtYXRjaCBhIGRldmljZSAgICAKPiA+IAo+ID4gIihzZXQgYnkgdGhpcyBoZWxwZXIg
ZnVuY3Rpb24gdG8gTURFVl9DTEFTU19JRF9WRklPKSIgPwo+ID4gICAKPiA+ID4gK3dpdGggYW4g
bWRldiBkcml2ZXIgdmlhIGl0cyBpZCB0YWJsZS4gVGhlIGRldmljZSBzcGVjaWZpYyBjYWxsYmFj
a3MKPiA+ID4gKyhzcGVjaWZpZWQgaW4gKm9wcykgYXJlIG9idGFpbmFibGUgdmlhIG1kZXZfZ2V0
X2Rldl9vcHMoKSAoZm9yIHVzZSBieSAgICAKPiA+IAo+ID4gIihzcGVjaWZpZWQgaW4gKnZmaW9f
b3BzIGJ5IHRoZSBjYWxsZXIpIiA/Cj4gPiAgIAo+ID4gPiArdGhlIG1kZXYgYnVzIGRyaXZlciku
IEEgdmZpby1tZGV2IGRldmljZSAoY2xhc3MgaWQgTURFVl9DTEFTU19JRF9WRklPKQo+ID4gPiAr
dXNlcyB0aGUgZm9sbG93aW5nIGRldmljZS1zcGVjaWZpYyBvcHM6Cj4gPiA+ICsKPiA+ID4gKyog
b3Blbjogb3BlbiBjYWxsYmFjayBvZiB2ZmlvIG1lZGlhdGVkIGRldmljZQo+ID4gPiArKiBjbG9z
ZTogY2xvc2UgY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPiA+ID4gKyogaW9jdGw6
IGlvY3RsIGNhbGxiYWNrIG9mIHZmaW8gbWVkaWF0ZWQgZGV2aWNlCj4gPiA+ICAqIHJlYWQgOiBy
ZWFkIGVtdWxhdGlvbiBjYWxsYmFjawo+ID4gPiAgKiB3cml0ZTogd3JpdGUgZW11bGF0aW9uIGNh
bGxiYWNrCj4gPiA+ICAqIG1tYXA6IG1tYXAgZW11bGF0aW9uIGNhbGxiYWNrCj4gPiA+IEBAIC0x
NjcsMTAgKzE3OCw2IEBAIHJlZ2lzdGVyIGl0c2VsZiB3aXRoIHRoZSBtZGV2IGNvcmUgZHJpdmVy
OjoKPiA+ID4gIAlleHRlcm4gaW50ICBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPiA+ICAJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKTsKPiA+ID4gIAo+ID4gPiAtSXQgaXMgYWxzbyByZXF1
aXJlZCB0byBzcGVjaWZ5IHRoZSBjbGFzc19pZCBpbiBjcmVhdGUoKSBjYWxsYmFjayB0aHJvdWdo
OjoKPiA+ID4gLQo+ID4gPiAtCWludCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsIHUxNiBpZCk7Cj4gPiA+IC0gICAgCj4gPiAKPiA+IEknbSB3b25kZXJpbmcgaWYgdGhp
cyBwYXRjaCBzZXQgc2hvdWxkIHN0YXJ0IG91dCB3aXRoIGludHJvZHVjaW5nCj4gPiBoZWxwZXIg
ZnVuY3Rpb25zIGFscmVhZHkgKGkuZS4gZG9uJ3QgaW50cm9kdWNlIG1kZXZfc2V0X2NsYXNzKCks
IGJ1dAo+ID4gc3RhcnQgb3V0IHdpdGggbWRldl9zZXRfY2xhc3NfdmZpbygpIHdoaWNoIHdpbGwg
Z2FpbiB0aGUgKnZmaW9fb3BzCj4gPiBhcmd1bWVudCBpbiB0aGlzIHBhdGNoLikgIAo+IAo+IFll
cywgaXQgd291bGQgYmUgY2xlYW5lciwgYnV0IGlzIGl0IHJlYWxseSB3b3J0aCB0aGUgY2h1cm4/
ICBDb3JyZWN0IG1lCj4gaWYgSSdtIHdyb25nLCBidXQgSSB0aGluayB3ZSBnZXQgdG8gdGhlIHNh
bWUgcG9pbnQgYWZ0ZXIgdGhpcyBwYXRjaCBhbmQKPiBhc2lkZSBmcm9tIHRoZSBmdW5jdGlvbiBu
YW1lIGl0c2VsZiwgdGhlIGRpZmZlcmVuY2UgaXMgcmVhbGx5IGp1c3QgdGhhdAo+IHRoZSBjbGFz
c19pZCBpcyBicmllZmx5IGV4cG9zZWQgdG8gdGhlIHBhcmVudCBkcml2ZXIsIHJpZ2h0PyAgVGhh
bmtzLAoKWWVzLCBpdCBkb2VzIG5vdCByZWFsbHkgbWF0dGVyIG11Y2guIElmIHRoZXJlJ3Mgbm8g
b3RoZXIgcmVhc29uIHRvCnJld29yayB0aGluZ3MsIEknZCBqdXN0IGtlZXAgdGhpcyBhcyBpdCBp
cyBub3cuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
