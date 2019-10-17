Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19BDB4E5
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Oct 2019 19:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CEB6E47E;
	Thu, 17 Oct 2019 17:53:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF916E046;
 Thu, 17 Oct 2019 17:53:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20DFA8AC6FB;
 Thu, 17 Oct 2019 17:53:22 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A39035C1D6;
 Thu, 17 Oct 2019 17:53:10 +0000 (UTC)
Date: Thu, 17 Oct 2019 11:53:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V4 3/6] mdev: introduce device specific ops
Message-ID: <20191017115310.0481cc52@x1.home>
In-Reply-To: <20191017170755.15506ada.cohuck@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-4-jasowang@redhat.com>
 <20191017170755.15506ada.cohuck@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 17 Oct 2019 17:53:22 +0000 (UTC)
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

T24gVGh1LCAxNyBPY3QgMjAxOSAxNzowNzo1NSArMDIwMApDb3JuZWxpYSBIdWNrIDxjb2h1Y2tA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IE9uIFRodSwgMTcgT2N0IDIwMTkgMTg6NDg6MzMgKzA4MDAK
PiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+IEN1cnJlbnRs
eSwgZXhjZXB0IGZvciB0aGUgY3JlYXRlIGFuZCByZW1vdmUsIHRoZSByZXN0IG9mCj4gPiBtZGV2
X3BhcmVudF9vcHMgaXMgZGVzaWduZWQgZm9yIHZmaW8tbWRldiBkcml2ZXIgb25seSBhbmQgbWF5
IG5vdCBoZWxwCj4gPiBmb3Iga2VybmVsIG1kZXYgZHJpdmVyLiBXaXRoIHRoZSBoZWxwIG9mIGNs
YXNzIGlkLCB0aGlzIHBhdGNoCj4gPiBpbnRyb2R1Y2VzIGRldmljZSBzcGVjaWZpYyBjYWxsYmFj
a3MgaW5zaWRlIG1kZXZfZGV2aWNlCj4gPiBzdHJ1Y3R1cmUuIFRoaXMgYWxsb3dzIGRpZmZlcmVu
dCBzZXQgb2YgY2FsbGJhY2sgdG8gYmUgdXNlZCBieQo+ID4gdmZpby1tZGV2IGFuZCB2aXJ0aW8t
bWRldi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJz
dCAgICAgICB8IDI1ICsrKysrLS0tLQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3Zt
Z3QuYyAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4gPiAgZHJpdmVycy9zMzkwL2Npby92Zmlv
X2Njd19vcHMuYyAgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+ID4gIGRyaXZlcnMvczM5MC9j
cnlwdG8vdmZpb19hcF9vcHMuYyAgICAgICAgICAgICB8IDE0ICsrKy0tCj4gPiAgZHJpdmVycy92
ZmlvL21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwgMTggKysrKystLQo+ID4gIGRy
aXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICB8ICAxICsKPiA+ICBk
cml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgfCAzNyArKysrKyst
LS0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNDUgKysrKy0tLS0tLS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvdmZpb19tZGV2LmggICAg
ICAgICAgICAgICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiA+ICBzYW1wbGVzL3Zm
aW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrLS0tCj4gPiAgc2Ft
cGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKy0tLQo+
ID4gIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsr
KystLS0KPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxODQgaW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0
aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZmaW9fbWRldi5o
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRp
YXRlZC1kZXZpY2UucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQt
ZGV2aWNlLnJzdAo+ID4gaW5kZXggZjlhNzhkNzVhNjdhLi4wY2NhODRkMTk2MDMgMTAwNjQ0Cj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2Uu
cnN0Cj4gPiBAQCAtMTUyLDExICsxNTIsMjIgQEAgY2FsbGJhY2tzIHBlciBtZGV2IHBhcmVudCBk
ZXZpY2UsIHBlciBtZGV2IHR5cGUsIG9yIGFueSBvdGhlciBjYXRlZ29yaXphdGlvbi4KPiA+ICBW
ZW5kb3IgZHJpdmVycyBhcmUgZXhwZWN0ZWQgdG8gYmUgZnVsbHkgYXN5bmNocm9ub3VzIGluIHRo
aXMgcmVzcGVjdCBvcgo+ID4gIHByb3ZpZGUgdGhlaXIgb3duIGludGVybmFsIHJlc291cmNlIHBy
b3RlY3Rpb24uKQo+ID4gIAo+ID4gLVRoZSBjYWxsYmFja3MgaW4gdGhlIG1kZXZfcGFyZW50X29w
cyBzdHJ1Y3R1cmUgYXJlIGFzIGZvbGxvd3M6Cj4gPiAtCj4gPiAtKiBvcGVuOiBvcGVuIGNhbGxi
YWNrIG9mIG1lZGlhdGVkIGRldmljZQo+ID4gLSogY2xvc2U6IGNsb3NlIGNhbGxiYWNrIG9mIG1l
ZGlhdGVkIGRldmljZQo+ID4gLSogaW9jdGw6IGlvY3RsIGNhbGxiYWNrIG9mIG1lZGlhdGVkIGRl
dmljZQo+ID4gK0FzIG11bHRpcGxlIHR5cGVzIG9mIG1lZGlhdGVkIGRldmljZXMgbWF5IGJlIHN1
cHBvcnRlZCwgdGhlIGRldmljZQo+ID4gK211c3Qgc2V0IHVwIHRoZSBjbGFzcyBpZCBhbmQgdGhl
IGRldmljZSBzcGVjaWZpYyBjYWxsYmFja3MgaW4gY3JlYXRlKCkgIAo+IAo+IHMvaW4gY3JlYXRl
KCkvaW4gdGhlIGNyZWF0ZSgpLwo+IAo+ID4gK2NhbGxiYWNrLiBFLmcgZm9yIHZmaW8tbWRldiBk
ZXZpY2UgaXQgbmVlZHMgdG8gYmUgZG9uZSB0aHJvdWdoOiAgCj4gCj4gIkVhY2ggY2xhc3MgcHJv
dmlkZXMgYSBoZWxwZXIgZnVuY3Rpb24gdG8gZG8gc287IGUuZy4gZm9yIHZmaW8tbWRldgo+IGRl
dmljZXMsIHRoZSBmdW5jdGlvbiB0byBiZSBjYWxsZWQgaXM6Igo+IAo+ID8KPiAKPiA+ICsKPiA+
ICsgICAgaW50IG1kZXZfc2V0X3ZmaW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2ZmlvX21kZXZfb3BzICp2
ZmlvX29wcyk7Cj4gPiArCj4gPiArVGhlIGNsYXNzIGlkIChzZXQgdG8gTURFVl9DTEFTU19JRF9W
RklPKSBpcyB1c2VkIHRvIG1hdGNoIGEgZGV2aWNlICAKPiAKPiAiKHNldCBieSB0aGlzIGhlbHBl
ciBmdW5jdGlvbiB0byBNREVWX0NMQVNTX0lEX1ZGSU8pIiA/Cj4gCj4gPiArd2l0aCBhbiBtZGV2
IGRyaXZlciB2aWEgaXRzIGlkIHRhYmxlLiBUaGUgZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcwo+
ID4gKyhzcGVjaWZpZWQgaW4gKm9wcykgYXJlIG9idGFpbmFibGUgdmlhIG1kZXZfZ2V0X2Rldl9v
cHMoKSAoZm9yIHVzZSBieSAgCj4gCj4gIihzcGVjaWZpZWQgaW4gKnZmaW9fb3BzIGJ5IHRoZSBj
YWxsZXIpIiA/Cj4gCj4gPiArdGhlIG1kZXYgYnVzIGRyaXZlcikuIEEgdmZpby1tZGV2IGRldmlj
ZSAoY2xhc3MgaWQgTURFVl9DTEFTU19JRF9WRklPKQo+ID4gK3VzZXMgdGhlIGZvbGxvd2luZyBk
ZXZpY2Utc3BlY2lmaWMgb3BzOgo+ID4gKwo+ID4gKyogb3Blbjogb3BlbiBjYWxsYmFjayBvZiB2
ZmlvIG1lZGlhdGVkIGRldmljZQo+ID4gKyogY2xvc2U6IGNsb3NlIGNhbGxiYWNrIG9mIHZmaW8g
bWVkaWF0ZWQgZGV2aWNlCj4gPiArKiBpb2N0bDogaW9jdGwgY2FsbGJhY2sgb2YgdmZpbyBtZWRp
YXRlZCBkZXZpY2UKPiA+ICAqIHJlYWQgOiByZWFkIGVtdWxhdGlvbiBjYWxsYmFjawo+ID4gICog
d3JpdGU6IHdyaXRlIGVtdWxhdGlvbiBjYWxsYmFjawo+ID4gICogbW1hcDogbW1hcCBlbXVsYXRp
b24gY2FsbGJhY2sKPiA+IEBAIC0xNjcsMTAgKzE3OCw2IEBAIHJlZ2lzdGVyIGl0c2VsZiB3aXRo
IHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoKPiA+ICAJZXh0ZXJuIGludCAgbWRldl9yZWdpc3Rlcl9k
ZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LAo+ID4gIAkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzICpvcHMpOwo+ID4gIAo+ID4gLUl0
IGlzIGFsc28gcmVxdWlyZWQgdG8gc3BlY2lmeSB0aGUgY2xhc3NfaWQgaW4gY3JlYXRlKCkgY2Fs
bGJhY2sgdGhyb3VnaDo6Cj4gPiAtCj4gPiAtCWludCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYsIHUxNiBpZCk7Cj4gPiAtICAKPiAKPiBJJ20gd29uZGVyaW5nIGlmIHRo
aXMgcGF0Y2ggc2V0IHNob3VsZCBzdGFydCBvdXQgd2l0aCBpbnRyb2R1Y2luZwo+IGhlbHBlciBm
dW5jdGlvbnMgYWxyZWFkeSAoaS5lLiBkb24ndCBpbnRyb2R1Y2UgbWRldl9zZXRfY2xhc3MoKSwg
YnV0Cj4gc3RhcnQgb3V0IHdpdGggbWRldl9zZXRfY2xhc3NfdmZpbygpIHdoaWNoIHdpbGwgZ2Fp
biB0aGUgKnZmaW9fb3BzCj4gYXJndW1lbnQgaW4gdGhpcyBwYXRjaC4pCgpZZXMsIGl0IHdvdWxk
IGJlIGNsZWFuZXIsIGJ1dCBpcyBpdCByZWFsbHkgd29ydGggdGhlIGNodXJuPyAgQ29ycmVjdCBt
ZQppZiBJJ20gd3JvbmcsIGJ1dCBJIHRoaW5rIHdlIGdldCB0byB0aGUgc2FtZSBwb2ludCBhZnRl
ciB0aGlzIHBhdGNoIGFuZAphc2lkZSBmcm9tIHRoZSBmdW5jdGlvbiBuYW1lIGl0c2VsZiwgdGhl
IGRpZmZlcmVuY2UgaXMgcmVhbGx5IGp1c3QgdGhhdAp0aGUgY2xhc3NfaWQgaXMgYnJpZWZseSBl
eHBvc2VkIHRvIHRoZSBwYXJlbnQgZHJpdmVyLCByaWdodD8gIFRoYW5rcywKCkFsZXgKIAo+ID4g
IEhvd2V2ZXIsIHRoZSBtZGV2X3BhcmVudF9vcHMgc3RydWN0dXJlIGlzIG5vdCByZXF1aXJlZCBp
biB0aGUgZnVuY3Rpb24gY2FsbAo+ID4gIHRoYXQgYSBkcml2ZXIgc2hvdWxkIHVzZSB0byB1bnJl
Z2lzdGVyIGl0c2VsZiB3aXRoIHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoKPiA+ICAgIAo+IAo+ICgu
Li4pCj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgYi9k
cml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+ID4gaW5kZXggM2E5YzUyZDcxYjRlLi5kMGYz
MTEzYzgwNzEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+
ID4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPiA+IEBAIC00NSwxNSArNDUs
MjMgQEAgdm9pZCBtZGV2X3NldF9kcnZkYXRhKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdm9p
ZCAqZGF0YSkKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTChtZGV2X3NldF9kcnZkYXRhKTsKPiA+
ICAKPiA+IC0vKiBTcGVjaWZ5IHRoZSBjbGFzcyBmb3IgdGhlIG1kZXYgZGV2aWNlLCB0aGlzIG11
c3QgYmUgY2FsbGVkIGR1cmluZwo+ID4gLSAqIGNyZWF0ZSgpIGNhbGxiYWNrLgo+ID4gKy8qIFNw
ZWNpZnkgdGhlIFZGSU8gZGV2aWNlIG9wcyBmb3IgdGhlIG1kZXYgZGV2aWNlLCB0aGlzCj4gPiAr
ICogbXVzdCBiZSBjYWxsZWQgZHVyaW5nIGNyZWF0ZSgpIGNhbGxiYWNrIGZvciBWRklPIG1kZXYg
ZGV2aWNlLgo+ID4gICAqLyAgCj4gCj4gLyoKPiAgKiBTcGVjaWZ5IHRoZSBtZGV2IGRldmljZSB0
byBiZSBhIFZGSU8gbWRldiBkZXZpY2UsIGFuZCBzZXQgdGhlCj4gICogVkZJTyBkZXZpY2VzIG9w
cyBmb3IgaXQuIFRoaXMgbXVzdCBiZSBjYWxsZWQgZnJvbSB0aGUgY3JlYXRlKCkKPiAgKiBjYWxs
YmFjayBmb3IgVkZJTyBtZGV2IGRldmljZXMuCj4gICovCj4gCj4gPwo+IAo+ID4gLXZvaWQgbWRl
dl9zZXRfY2xhc3Moc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWQpCj4gPiArdm9pZCBt
ZGV2X3NldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gPiArCQkgICAgICAg
Y29uc3Qgc3RydWN0IHZmaW9fbWRldl9kZXZpY2Vfb3BzICp2ZmlvX29wcykKPiA+ICB7Cj4gPiAg
CVdBUk5fT04obWRldi0+Y2xhc3NfaWQpOwo+ID4gLQltZGV2LT5jbGFzc19pZCA9IGlkOwo+ID4g
KwltZGV2LT5jbGFzc19pZCA9IE1ERVZfQ0xBU1NfSURfVkZJTzsKPiA+ICsJbWRldi0+ZGV2aWNl
X29wcyA9IHZmaW9fb3BzOwo+ID4gIH0KPiA+IC1FWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2NsYXNz
KTsKPiA+ICtFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X3ZmaW9fb3BzKTsKPiA+ICsKPiA+ICtjb25z
dCB2b2lkICptZGV2X2dldF9kZXZfb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikKPiA+ICt7
Cj4gPiArCXJldHVybiBtZGV2LT5kZXZpY2Vfb3BzOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9M
KG1kZXZfZ2V0X2Rldl9vcHMpOwo+ID4gIAo+ID4gIHN0cnVjdCBkZXZpY2UgKm1kZXZfZGV2KHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldikKPiA+ICB7ICAKPiAKPiAoLi4uKQo+IAo+IFRoZSBjb2Rl
IGNoYW5nZSBsb29rcyBnb29kIHRvIG1lOyBJJ20ganVzdCB3b25kZXJpbmcgaWYgd2Ugc2hvdWxk
Cj4gaW50cm9kdWNlIG1kZXZfc2V0X2NsYXNzKCkgYXQgYWxsIChzZWUgYWJvdmUpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
