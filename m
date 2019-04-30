Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D72FCE2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 17:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24197890DA;
	Tue, 30 Apr 2019 15:29:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DB8890DA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 15:29:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5F2C309264B;
 Tue, 30 Apr 2019 15:29:20 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04D0A10013D9;
 Tue, 30 Apr 2019 15:29:10 +0000 (UTC)
Date: Tue, 30 Apr 2019 17:29:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 1/2] vfio/mdev: add version field as mandatory attribute
 for mdev device
Message-ID: <20190430172908.2ae77fa9.cohuck@redhat.com>
In-Reply-To: <20190424081558.GE26247@joy-OptiPlex-7040>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190423115932.42619422.cohuck@redhat.com>
 <20190424031036.GB26247@joy-OptiPlex-7040>
 <20190424095624.0ce97328.cohuck@redhat.com>
 <20190424081558.GE26247@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Apr 2019 15:29:21 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBBcHIgMjAxOSAwNDoxNTo1OCAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAwMzo1NjoyNFBNICsw
ODAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+ID4gT24gVHVlLCAyMyBBcHIgMjAxOSAyMzoxMDoz
NyAtMDQwMAo+ID4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPiA+ICAg
Cj4gPiA+IE9uIFR1ZSwgQXByIDIzLCAyMDE5IGF0IDA1OjU5OjMyUE0gKzA4MDAsIENvcm5lbGlh
IEh1Y2sgd3JvdGU6ICAKPiA+ID4gPiBPbiBGcmksIDE5IEFwciAyMDE5IDA0OjM1OjA0IC0wNDAw
Cj4gPiA+ID4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKCj4gPiA+ID4g
PiBAQCAtMjI1LDYgKzIyOCw4IEBAIERpcmVjdG9yaWVzIGFuZCBmaWxlcyB1bmRlciB0aGUgc3lz
ZnMgZm9yIEVhY2ggUGh5c2ljYWwgRGV2aWNlCj4gPiA+ID4gPiAgICBbPHR5cGUtaWQ+XSwgZGV2
aWNlX2FwaSwgYW5kIGF2YWlsYWJsZV9pbnN0YW5jZXMgYXJlIG1hbmRhdG9yeSBhdHRyaWJ1dGVz
Cj4gPiA+ID4gPiAgICB0aGF0IHNob3VsZCBiZSBwcm92aWRlZCBieSB2ZW5kb3IgZHJpdmVyLgo+
ID4gPiA+ID4KPiA+ID4gPiA+ICsgIHZlcnNpb24gaXMgYSBtYW5kYXRvcnkgYXR0cmlidXRlIGlm
IGEgbWRldiBkZXZpY2Ugc3VwcG9ydHMgbGl2ZSBtaWdyYXRpb24uICAgIAo+ID4gPiA+IAo+ID4g
PiA+IFdoYXQgYWJvdXQgIkFuIG1kZXYgZGV2aWNlIHdpc2hpbmcgdG8gc3VwcG9ydCBsaXZlIG1p
Z3JhdGlvbiBtdXN0Cj4gPiA+ID4gcHJvdmlkZSB0aGUgdmVyc2lvbiBhdHRyaWJ1dGUuIj8gICAg
Cj4gPiA+IHllcywgSSBqdXN0IHdhbnQgdG8ga2VlcCBjb25zaXN0ZW50IHdpdGggdGhlIGxpbmUg
YWJvdmUgaXQgCj4gPiA+ICIgWzx0eXBlLWlkPl0sIGRldmljZV9hcGksIGFuZCBhdmFpbGFibGVf
aW5zdGFuY2VzIGFyZSBtYW5kYXRvcnkgYXR0cmlidXRlcwo+ID4gPiAgIHRoYXQgc2hvdWxkIGJl
IHByb3ZpZGVkIGJ5IHZlbmRvciBkcml2ZXIuIgo+ID4gPiB3aGF0IGFib3V0IGJlbG93IG9uZT8K
PiA+ID4gICAidmVyc2lvbiBpcyBhIG1hbmRhdG9yeSBhdHRyaWJ1dGUgaWYgYSBtZGV2IGRldmlj
ZSB3aXNoaW5nIHRvIHN1cHBvcnQgbGl2ZQo+ID4gPiAgIG1pZ3JhdGlvbi4iICAKPiA+IAo+ID4g
TXkgcG9pbnQgaXMgdGhhdCBhbiBhdHRyaWJ1dGUgaXMgbm90IG1hbmRhdG9yeSBpZiBpdCBjYW4g
YmUgbGVmdCBvdXQgOikKPiA+IChJJ20gbm90IGEgbmF0aXZlIHNwZWFrZXIsIHRob3VnaDsgbWF5
YmUgdGhpcyBtYWtlcyBwZXJmZWN0IHNlbnNlCj4gPiBhZnRlciBhbGw/KQo+ID4gCj4gPiBNYXli
ZSAidmVyc2lvbiBpcyBhIHJlcXVpcmVkIGF0dHJpYnV0ZSBpZiBsaXZlIG1pZ3JhdGlvbiBpcyBz
dXBwb3J0ZWQKPiA+IGZvciBhbiBtZGV2IGRldmljZSI/Cj4gPiAgIAo+IHlvdSBhcmUgcmlnaHQs
ICJtYW5kYXRvcnkiIG1heSBicmluZyBzb21lIGNvbmZ1c2lvbi4KPiBNYXliZQo+ICJ2ZW5kb3Ig
ZHJpdmVyIG11c3QgcHJvdmlkZSB2ZXJzaW9uIGF0dHJpYnV0ZSBmb3IgYW4gbWRldiBkZXZpY2Ug
d2lzaGluZyB0bwo+IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24uIiA/Cj4gYmFzZWQgb24geW91ciBm
aXJzdCB2ZXJzaW9uIDopCgoiVGhlIHZlbmRvciBkcml2ZXIgbXVzdCBwcm92aWRlIHRoZSB2ZXJz
aW9uIGF0dHJpYnV0ZSBmb3IgYW55IG1kZXYKZGV2aWNlIGl0IHdpc2hlcyB0byBzdXBwb3J0IGxp
dmUgbWlncmF0aW9uIGZvci4iID8KCj4gCj4gPiA+IAo+ID4gPiAgIAo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gICogWzx0eXBlLWlkPl0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICBUaGUgWzx0eXBlLWlk
Pl0gbmFtZSBpcyBjcmVhdGVkIGJ5IGFkZGluZyB0aGUgZGV2aWNlIGRyaXZlciBzdHJpbmcgYXMg
YSBwcmVmaXgKPiA+ID4gPiA+IEBAIC0yNDYsNiArMjUxLDM1IEBAIERpcmVjdG9yaWVzIGFuZCBm
aWxlcyB1bmRlciB0aGUgc3lzZnMgZm9yIEVhY2ggUGh5c2ljYWwgRGV2aWNlCj4gPiA+ID4gPiAg
ICBUaGlzIGF0dHJpYnV0ZSBzaG91bGQgc2hvdyB0aGUgbnVtYmVyIG9mIGRldmljZXMgb2YgdHlw
ZSA8dHlwZS1pZD4gdGhhdCBjYW4gYmUKPiA+ID4gPiA+ICAgIGNyZWF0ZWQuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gKyogdmVyc2lvbgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgVGhpcyBhdHRyaWJ1
dGUgaXMgcncuIEl0IGlzIHVzZWQgdG8gY2hlY2sgd2hldGhlciB0d28gZGV2aWNlcyBhcmUgY29t
cGF0aWJsZQo+ID4gPiA+ID4gKyAgZm9yIGxpdmUgbWlncmF0aW9uLiBJZiB0aGlzIGF0dHJpYnV0
ZSBpcyBtaXNzaW5nLCB0aGVuIHRoZSBjb3JyZXNwb25kaW5nIG1kZXYKPiA+ID4gPiA+ICsgIGRl
dmljZSBpcyByZWdhcmRlZCBhcyBub3Qgc3VwcG9ydGluZyBsaXZlIG1pZ3JhdGlvbi4KPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICsgIEl0IGNvbnNpc3RzIG9mIHR3byBwYXJ0czogY29tbW9uIHBhcnQg
YW5kIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0Lgo+ID4gPiA+ID4gKyAgY29tbW9uIHBhcnQ6IDMy
IGJpdC4gbG93ZXIgMTYgYml0cyBpcyB2ZW5kb3IgaWQgYW5kIGhpZ2hlciAxNiBiaXRzIGlkZW50
aWZpZXMKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkZXZpY2UgdHlwZS4gZS5nLiwgZm9yIHBj
aSBkZXZpY2UsIGl0IGlzCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgInBjaSB2ZW5kb3IgaWQi
IHwgKFZGSU9fREVWSUNFX0ZMQUdTX1BDSSA8PCAxNikuCj4gPiA+ID4gPiArICB2ZW5kb3IgcHJv
cHJpZXRhcnkgcGFydDogdGhpcyBwYXJ0IGlzIHZhcmllZCBpbiBsZW5ndGguIHZlbmRvciBkcml2
ZXIgY2FuCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgc3BlY2lmeSBhbnkgc3RyaW5nIHRvIGlk
ZW50aWZ5IGEgZGV2aWNlLgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgV2hlbiByZWFkaW5nIHRo
aXMgYXR0cmlidXRlLCBpdCBzaG91bGQgc2hvdyBkZXZpY2UgdmVyc2lvbiBzdHJpbmcgb2YgdGhl
IGRldmljZQo+ID4gPiA+ID4gKyAgb2YgdHlwZSA8dHlwZS1pZD4uIElmIGEgZGV2aWNlIGRvZXMg
bm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0IHNob3VsZAo+ID4gPiA+ID4gKyAgcmV0dXJu
IGVycm5vLgo+ID4gPiA+ID4gKyAgV2hlbiB3cml0aW5nIGEgc3RyaW5nIHRvIHRoaXMgYXR0cmli
dXRlLCBpdCByZXR1cm5zIGVycm5vIGZvciBpbmNvbXBhdGliaWxpdHkKPiA+ID4gPiA+ICsgIG9y
IHJldHVybnMgd3JpdHRlbiBzdHJpbmcgbGVuZ3RoIGluIGNvbXBhdGliaWxpdHkgY2FzZS4gSWYg
YSBkZXZpY2UgZG9lcyBub3QKPiA+ID4gPiA+ICsgIHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0
IGFsd2F5cyByZXR1cm5zIGVycm5vLiAgICAKPiA+ID4gPiAKPiA+ID4gPiBJJ20gbm90IHN1cmUg
d2hldGhlciBhIGRldmljZSB0aGF0IGRvZXMgbm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24KPiA+
ID4gPiBzaG91bGQgZXhwb3NlIHRoaXMgYXR0cmlidXRlIGluIHRoZSBmaXJzdCBwbGFjZS4gT3Ig
aXMgdGhhdCB0byBjb3Zlcgo+ID4gPiA+IGNhc2VzIHdoZXJlIGEgZHJpdmVyIHN1cHBvcnRzIGxp
dmUgbWlncmF0aW9uIG9ubHkgZm9yIHNvbWUgb2YgdGhlCj4gPiA+ID4gZGV2aWNlcyBpdCBzdXBw
b3J0cz8gICAgCj4gPiA+IHllcywgZHJpdmVyIHJldHVybmluZyBlcnJvciBjb2RlIGlzIHRvIGNv
dmVyIHRoZSBjYXNlcyB3aGVyZSBvbmx5IHBhcnQgb2YgZGV2aWNlcyBpdAo+ID4gPiBzdXBwb3J0
cyBjYW4gYmUgbWlncmF0ZWQuCj4gPiA+IAo+ID4gPiAgIAo+ID4gPiA+IEFsc28sIEknbSBub3Qg
c3VyZSBpZiBhIHN0cmluZyB0aGF0IGhhcyB0byBiZSBwYXJzZWQgaXMgYSBnb29kIGlkZWEuLi4K
PiA+ID4gPiBpcyB0aGlzICd2ZXJzaW9uJyBhdHRyaWJ1dGUgc3VwcG9zZWQgdG8gY29udmV5IHNv
bWUgaHVtYW4tcmVhZGFibGUKPiA+ID4gPiBpbmZvcm1hdGlvbiBhcyB3ZWxsPyBUaGUgcHJvY2Vk
dXJlIHlvdSBkZXNjcmliZSBmb3IgY29tcGF0aWJpbGl0eQo+ID4gPiA+IGNoZWNraW5nIGRvZXMg
dGhlIGNoZWNraW5nIHdpdGhpbiB0aGUgdmVuZG9yIGRyaXZlciB3aGljaCBJIHdvdWxkCj4gPiA+
ID4gZXhwZWN0IHRvIGhhdmUgYSB0YWJsZS9ydWxlcyBmb3IgdGhhdCBhbnl3YXkuICAgIAo+ID4g
PiByaWdodC4gaWYgYSB2ZW5kb3IgZHJpdmVyIGhhcyB0aGUgY29uZmlkZW5jZSB0byBtaWdyYXRl
IGJldHdlZW4gZGV2aWNlcyBvZgo+ID4gPiBkaWZmZW50IHBsYXRmb3JtIG9yIG1kZXYgdHlwZXMs
IGl0IGNhbiBtYWludGFpbiBhIGNvbXBhdGliaWxpdHkgdGFibGUgZm9yIHRoYXQKPiA+ID4gcHVy
cG9zZS4gVGhhdCdzIHRoZSByZWFzb24gd2h5IHdlIHdvdWxkIGxlYXZlIHRoZSBjb21wYXRpYmls
aXR5IGNoZWNrIHRvIHZlbmRvcgo+ID4gPiBkcml2ZXIuIHZlbmRvciBkcml2ZXIgY2FuIGZyZWVs
eSBjaG9vc2UgaXRzIG93biBjb21wbGljYXRlZCB3YXkgdG8gZGVjaWRlCj4gPiA+IHdoaWNoIGRl
dmljZSBpcyBtaWdyYXRhYmxlIHRvIHdoaWNoIGRldmljZS4gIAo+ID4gCj4gPiBJIHRoaW5rIHRo
ZXJlIGFyZSB0d28gc2NlbmFyaW9zIGhlcmU6Cj4gPiAtIE1pZ3JhdGluZyBiZXR3ZWVuIGRpZmZl
cmVudCBkZXZpY2UgdHlwZXMsIHdoaWNoIGlzIHVubGlrZWx5IHRvIHdvcmssCj4gPiAgIGV4Y2Vw
dCBpbiBzcGVjaWFsIGNhc2VzLgo+ID4gLSBNaWdyYXRpbmcgYmV0d2VlbiBkaWZmZXJlbnQgdmVy
c2lvbnMgb2YgdGhlIHNhbWUgZGV2aWNlIHR5cGUsIHdoaWNoCj4gPiAgIG1heSB3b3JrIGZvciBz
b21lIGRyaXZlcnMvZGV2aWNlcyAoYW5kIGF0IGxlYXN0IG1pZ3JhdGluZyB0byBhIG5ld2VyCj4g
PiAgIHZlcnNpb24gbG9va3MgcXVpdGUgcmVhc29uYWJsZSkuCj4gPiAKPiA+IEJ1dCBib3RoIHNo
b3VsZCBiZSBzb21ldGhpbmcgdGhhdCBpcyBkZWNpZGVkIGJ5IHRoZSBpbmRpdmlkdWFsIGRyaXZl
cjsKPiA+IEkgaG9wZSB3ZSBkb24ndCB3YW50IHRvIHN1cHBvcnQgbWlncmF0aW9uIGJldHdlZW4g
ZGlmZmVyZW50IGRyaXZlcnMgOi1PCj4gPiAKPiA+IENhbiB3ZSBtYWtlIHRoaXMgYSBkcml2ZXIt
ZGVmaW5lZCBmb3JtYXQ/Cj4gPiAgCj4geWVzLCB0aGlzIGlzIGluZGVlZCBkcml2ZXItZGVmaW5l
ZCBmb3JtYXQuCj4gQWN0dWFsbHkgd2UgZGVmaW5lIGl0IGludG8gdHdvIHBhcnRzOiBjb21tb24g
cGFydCBhbmQgdmVuZG9yIHByb3ByaWV0YXJ5IHBhcnQuCj4gY29tbW9uIHBhcnQ6IDMyIGJpdC4g
bG93ZXIgMTYgYml0cyBpcyB2ZW5kb3IgaWQgYW5kIGhpZ2hlciAxNiBiaXRzCj4gICAgICAgICAg
ICAgIGlkZW50aWZpZXMgZGV2aWNlIHR5cGUuIGUuZy4sIGZvciBwY2kgZGV2aWNlLCBpdCBpcwo+
ICAgICAgICAgICAgICAicGNpIHZlbmRvciBpZCIgfCAoVkZJT19ERVZJQ0VfRkxBR1NfUENJIDw8
IDE2KS4KPiB2ZW5kb3IgcHJvcHJpZXRhcnkgcGFydDogdGhpcyBwYXJ0IGlzIHZhcmllZCBpbiBs
ZW5ndGguIHZlbmRvciBkcml2ZXIgY2FuCj4gICAgICAgICAgICAgIHNwZWNpZnkgYW55IHN0cmlu
ZyB0byBpZGVudGlmeSBhIGRldmljZS4KPiAKPiB2ZW5kb3IgcHJvcHJpZXRhcnkgcGFydCBpcyBk
ZWZpbmVkIGJ5IHZlbmRvciBkcml2ZXIuIHZlbmRvciBkcml2ZXIgY2FuCj4gZGVmaW5lIGFueSBm
b3JtYXQgaXQgd2lzaGVzIHRvIHVzZS4gQWxzbyBpdCBpcyBpdHMgb3duIHJlc3BvbnNpYmlsaXR5
IHRvCj4gZW5zdXJlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgaWYgaXQgd2FudHMgdG8gdXBkYXRl
IGZvcm1hdCBkZWZpbml0aW9uIGluIHRoaXMKPiBwYXJ0Lgo+IAo+IFNvIHVzZXIgc3BhY2Ugb25s
eSBuZWVkcyB0byBnZXQgc291cmNlIHNpZGUncyB2ZXJzaW9uIHN0cmluZywgYW5kIGFza3MKPiB0
YXJnZXQgc2lkZSB3aGV0aGVyIHRoZSB0d28gYXJlIGNvbXBhdGlibGUuIFRoZSBkZWNpc2lvbiBt
YWtlciBpcyB0aGUKPiB2ZW5kb3IgZHJpdmVyOikKCklmIEkgZm9sbG93ZWQgdGhlIGRpc2N1c3Np
b24gY29ycmVjdGx5LCBJIHRoaW5rIHlvdSBwbGFuIHRvIGRyb3AgdGhpcwpmb3JtYXQsIGRvbid0
IHlvdT8gSSdkIGJlIGhhcHB5IGlmIGEgdmVuZG9yIGRyaXZlciBjYW4gdXNlIGEgc2ltcGxlCm51
bWJlciB3aXRob3V0IGFueSBwcmVmaXhlcyBpZiBpdCBzbyBjaG9vc2VzLgoKSSBhbHNvIGxpa2Ug
dGhlIGlkZWEgb2YgcmVuYW1pbmcgdGhpcyAibWlncmF0aW9uX3ZlcnNpb24iIHNvIHRoYXQgaXQg
aXMKY2xlYXIgd2UncmUgZGVhbGluZyB3aXRoIHZlcnNpb25pbmcgb2YgdGhlIG1pZ3JhdGlvbiBj
YXBhYmlsaXR5IChhbmQKbm90IGEgdmVyc2lvbiBvZiB0aGUgZGV2aWNlIG9yIHNvKS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
