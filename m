Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A413D263
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Jan 2020 04:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFA56E1E6;
	Thu, 16 Jan 2020 03:00:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB566E1E6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Jan 2020 03:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579143606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYDIddpraf1y7iH1YrZ3bXVk4InOC/gXpwyEqB+s6Kg=;
 b=IO231mF6hW35fStU+BMazWebu3yMedee2DQz/xpNv3+NRLQ6G4jVA9+l0nlHKAxWnQGHA5
 hM/KzC7QLcKBZUhy+dkbHDLEzQPh76h/G8OTj6wjJ/50O4fQk7AKljNbDr/a5n+yWWS7op
 Z0CyAv6qRXGwe/ms4ejhjb2gHDD4YCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-VmuSj52CP52FZ32jsTdlSA-1; Wed, 15 Jan 2020 22:00:05 -0500
X-MC-Unique: VmuSj52CP52FZ32jsTdlSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66E9F107ACC7;
 Thu, 16 Jan 2020 03:00:03 +0000 (UTC)
Received: from x1.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452F088898;
 Thu, 16 Jan 2020 03:00:00 +0000 (UTC)
Date: Wed, 15 Jan 2020 19:59:59 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Mika =?UTF-8?B?UGVudHRpbMOk?= <mika.penttila@nextfour.com>
Subject: Re: [PATCH v2 1/2] vfio: introduce vfio_dma_rw to read/write a
 range of IOVAs
Message-ID: <20200115195959.28f33078@x1.home>
In-Reply-To: <80cf3888-2e51-3fd7-a064-213e7ded188e@nextfour.com>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035303.12362-1-yan.y.zhao@intel.com>
 <20200115130638.6926dd08@w520.home>
 <80cf3888-2e51-3fd7-a064-213e7ded188e@nextfour.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAxNiBKYW4gMjAyMCAwMjozMDo1MiArMDAwMApNaWthIFBlbnR0aWzDpCA8bWlrYS5w
ZW50dGlsYUBuZXh0Zm91ci5jb20+IHdyb3RlOgoKPiBPbiAxNS4xLjIwMjAgMjIuMDYsIEFsZXgg
V2lsbGlhbXNvbiB3cm90ZToKPiA+IE9uIFR1ZSwgMTQgSmFuIDIwMjAgMjI6NTM6MDMgLTA1MDAK
PiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiAgCj4gPj4gdmZp
b19kbWFfcncgd2lsbCByZWFkL3dyaXRlIGEgcmFuZ2Ugb2YgdXNlciBzcGFjZSBtZW1vcnkgcG9p
bnRlZCB0byBieQo+ID4+IElPVkEgaW50by9mcm9tIGEga2VybmVsIGJ1ZmZlciB3aXRob3V0IHBp
bm5pbmcgdGhlIHVzZXIgc3BhY2UgbWVtb3J5Lgo+ID4+Cj4gPj4gVE9ETzogbWFyayB0aGUgSU9W
QXMgdG8gdXNlciBzcGFjZSBtZW1vcnkgZGlydHkgaWYgdGhleSBhcmUgd3JpdHRlbiBpbgo+ID4+
IHZmaW9fZG1hX3J3KCkuCj4gPj4KPiA+PiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29t
Pgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy92ZmlvL3ZmaW8uYyAgICAgICAgICAgICB8IDQ1ICsr
KysrKysrKysrKysrKysrKysKPiA+PiAgIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMg
fCA3NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgIGluY2x1ZGUvbGlu
dXgvdmZpby5oICAgICAgICAgICAgfCAgNSArKysKPiA+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTI2
IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpby5j
IGIvZHJpdmVycy92ZmlvL3ZmaW8uYwo+ID4+IGluZGV4IGM4NDgyNjI0Y2EzNC4uOGJkNTJiYzg0
MWNmIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvdmZpby92ZmlvLmMKPiA+PiArKysgYi9kcml2
ZXJzL3ZmaW8vdmZpby5jCj4gPj4gQEAgLTE5NjEsNiArMTk2MSw1MSBAQCBpbnQgdmZpb191bnBp
bl9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgKnVzZXJfcGZuLCBpbnQg
bnBhZ2UpCj4gPj4gICB9Cj4gPj4gICBFWFBPUlRfU1lNQk9MKHZmaW9fdW5waW5fcGFnZXMpOwo+
ID4+ICAgCj4gPj4gKy8qCj4gPj4gKyAqIFJlYWQvV3JpdGUgYSByYW5nZSBvZiBJT1ZBcyBwb2lu
dGluZyB0byB1c2VyIHNwYWNlIG1lbW9yeSBpbnRvL2Zyb20gYSBrZXJuZWwKPiA+PiArICogYnVm
ZmVyIHdpdGhvdXQgcGlubmluZyB0aGUgdXNlciBzcGFjZSBtZW1vcnkKPiA+PiArICogQGRldiBb
aW5dICA6IGRldmljZQo+ID4+ICsgKiBAaW92YSBbaW5dIDogYmFzZSBJT1ZBIG9mIGEgdXNlciBz
cGFjZSBidWZmZXIKPiA+PiArICogQGRhdGEgW2luXSA6IHBvaW50ZXIgdG8ga2VybmVsIGJ1ZmZl
cgo+ID4+ICsgKiBAbGVuIFtpbl0gIDoga2VybmVsIGJ1ZmZlciBsZW5ndGgKPiA+PiArICogQHdy
aXRlICAgICA6IGluZGljYXRlIHJlYWQgb3Igd3JpdGUKPiA+PiArICogUmV0dXJuIGVycm9yIGNv
ZGUgb24gZmFpbHVyZSBvciAwIG9uIHN1Y2Nlc3MuCj4gPj4gKyAqLwo+ID4+ICtpbnQgdmZpb19k
bWFfcncoc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGlvdmEsIHZvaWQgKmRhdGEsCj4g
Pj4gKwkJICAgc2l6ZV90IGxlbiwgYm9vbCB3cml0ZSkKPiA+PiArewo+ID4+ICsJc3RydWN0IHZm
aW9fY29udGFpbmVyICpjb250YWluZXI7Cj4gPj4gKwlzdHJ1Y3QgdmZpb19ncm91cCAqZ3JvdXA7
Cj4gPj4gKwlzdHJ1Y3QgdmZpb19pb21tdV9kcml2ZXIgKmRyaXZlcjsKPiA+PiArCWludCByZXQg
PSAwOyAgCj4gCj4gRG8geW91IGtub3cgdGhlIGlvdmEgZ2l2ZW4gdG8gdmZpb19kbWFfcncoKSBp
cyBpbmRlZWQgYSBncGEgYW5kIG5vdCBpb3ZhIAo+IGZyb20gYSBpb21tdSBtYXBwaW5nPyBTbyBp
c24ndCBpdCB5b3UgYWN0dWFsbHkgYXNzdW1lIGFsbCB0aGUgZ3Vlc3QgaXMgCj4gcGlubmVkLAo+
IGxpa2UgZnJvbSBkZXZpY2UgYXNzaWdubWVudD8KPiAKPiBPciB3aG8gYW5kIGhvdyBpcyB0aGUg
dmZpbyBtYXBwaW5nIGFkZGVkIGJlZm9yZSB0aGUgdmZpb19kbWFfcncoKSA/Cgp2ZmlvIG9ubHkg
a25vd3MgYWJvdXQgSU9WQXMsIG5vdCBHUEFzLiAgSXQncyBwb3NzaWJsZSB0aGF0IElPVkFzIGFy
ZQppZGVudGl0eSBtYXBwZWQgdG8gdGhlIEdQQSBzcGFjZSwgYnV0IGEgVk0gd2l0aCBhIHZJT01N
VSB3b3VsZCBxdWlja2x5CmJyZWFrIGFueSBzdWNoIGFzc3VtcHRpb24uICBQaW5uaW5nIGlzIGFs
c28gbm90IHJlcXVpcmVkLiAgVGhpcyBhY2Nlc3MKaXMgdmlhIHRoZSBDUFUsIG5vdCB0aGUgSS9P
IGRldmljZSwgc28gd2UgZG9uJ3QgcmVxdWlyZSB0aGUgbWVtb3J5IHRvCmJlIHBpbm5pbmcgYW5k
IGl0IHBvdGVudGlhbGx5IHdvbid0IGJlIGZvciBhIG5vbi1JT01NVSBiYWNrZWQgbWVkaWF0ZWQK
ZGV2aWNlLiAgVGhlIGludGVudGlvbiBoZXJlIGlzIHRoYXQgdmlhIHRoZSBtZWRpYXRpb24gb2Yg
YW4gbWRldgpkZXZpY2UsIGEgdmVuZG9yIGRyaXZlciB3b3VsZCBhbHJlYWR5IGtub3cgSU9WQSBy
YW5nZXMgZm9yIHRoZSBkZXZpY2UKdG8gYWNjZXNzIHZpYSB0aGUgZ3Vlc3QgZHJpdmVyIHByb2dy
YW1taW5nIG9mIHRoZSBkZXZpY2UuICBUaGFua3MsCgpBbGV4CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
