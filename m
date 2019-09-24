Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E0BC68B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 13:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2ED89316;
	Tue, 24 Sep 2019 11:20:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6753989316;
 Tue, 24 Sep 2019 11:20:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FDC63084045;
 Tue, 24 Sep 2019 11:20:54 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A9DA5D9CA;
 Tue, 24 Sep 2019 11:20:29 +0000 (UTC)
Subject: Re: [PATCH 1/6] mdev: class id support
To: Parav Pandit <parav@mellanox.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "tiwei.bie@intel.com"
 <tiwei.bie@intel.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-2-jasowang@redhat.com>
 <AM0PR05MB486675D15C5C25F689BFB77AD1850@AM0PR05MB4866.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <78db810d-25be-4dd9-a7c0-16c5f0e9d708@redhat.com>
Date: Tue, 24 Sep 2019 19:20:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR05MB486675D15C5C25F689BFB77AD1850@AM0PR05MB4866.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 24 Sep 2019 11:20:55 +0000 (UTC)
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
Cc: "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNCDkuIrljYg0OjU4LCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4gSGkgSmFzb24s
Cj4KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4KPj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMTkgODow
MyBBTQo+PiBUbzoga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgtczM5MEB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LQo+PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0KPj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4+IGt3YW5raGVkZUBudmlkaWEuY29tOyBh
bGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207Cj4+IHRpd2VpLmJpZUBp
bnRlbC5jb20KPj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
OyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOwo+PiBjb2h1Y2tAcmVkaGF0LmNvbTsgbWF4aW1lLmNv
cXVlbGluQHJlZGhhdC5jb207Cj4+IGN1bm1pbmcubGlhbmdAaW50ZWwuY29tOyB6aGlob25nLndh
bmdAaW50ZWwuY29tOwo+PiByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsgeGlhby53LndhbmdAaW50
ZWwuY29tOwo+PiBoYW90aWFuLndhbmdAc2lmaXZlLmNvbTsgemhlbnl1d0BsaW51eC5pbnRlbC5j
b207IHpoaS5hLndhbmdAaW50ZWwuY29tOwo+PiBqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb207
IGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb207Cj4+IHJvZHJpZ28udml2aUBpbnRlbC5j
b207IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsKPj4gZmFybWFuQGxpbnV4Lmli
bS5jb207IHBhc2ljQGxpbnV4LmlibS5jb207IHNlYm90dEBsaW51eC5pYm0uY29tOwo+PiBvYmVy
cGFyQGxpbnV4LmlibS5jb207IGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb207IGdvckBsaW51eC5p
Ym0uY29tOwo+PiBib3JudHJhZWdlckBkZS5pYm0uY29tOyBha3Jvd2lha0BsaW51eC5pYm0uY29t
OyBmcmV1ZGVAbGludXguaWJtLmNvbTsKPj4gbGluZ3NoYW4uemh1QGludGVsLmNvbTsgSWRvIFNo
YW1heSA8aWRvc0BtZWxsYW5veC5jb20+Owo+PiBlcGVyZXptYUByZWRoYXQuY29tOyBsdWx1QHJl
ZGhhdC5jb207IFBhcmF2IFBhbmRpdAo+PiA8cGFyYXZAbWVsbGFub3guY29tPjsgSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gU3ViamVjdDogW1BBVENIIDEvNl0gbWRldjogY2xh
c3MgaWQgc3VwcG9ydAo+Pgo+PiBNZGV2IGJ1cyBvbmx5IHN1cHBvcnRzIHZmaW8gZHJpdmVyIHJp
Z2h0IG5vdywgc28gaXQgZG9lc24ndCBpbXBsZW1lbnQgbWF0Y2gKPj4gbWV0aG9kLiBCdXQgaW4g
dGhlIGZ1dHVyZSwgd2UgbWF5IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywgb25lIGV4YW1w
bGUgaXMKPj4gdmlydGlvLW1kZXZbMV0gZHJpdmVyLiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gYWRk
IGRldmljZSBjbGFzcyBpZCBzdXBwb3J0IGluIGJ1cwo+PiBtYXRjaCBtZXRob2QgdG8gcGFpciB0
aGUgbWRldiBkZXZpY2UgYW5kIG1kZXYgZHJpdmVyIGNvcnJlY3RseS4KPj4KPj4gU28gdGhpcyBw
YXRjaCBhZGRzIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBjbGFzc19pZCBmb3IgbWRldiBw
YXJlbnQgd2l0aAo+PiB0aGUgbWF0Y2ggbWV0aG9kIGZvciBtZGV2IGJ1cy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICBEb2N1
bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0IHwgIDcgKysrKyst
LQo+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgICAgICB8
ICAyICstCj4+ICBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPj4gIGRyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYyAgICAgICAg
ICAgICAgICAgfCAgMyArKy0KPj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAg
ICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKystLQo+PiAgZHJpdmVycy92ZmlvL21kZXYv
bWRldl9kcml2ZXIuYyAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+ICBk
cml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAgICAgICAgICAgICAgIHwgIDEgKwo+
PiAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgICAgICB8ICA2
ICsrKysrKwo+PiAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA3ICsrKysrKy0KPj4gIGluY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmggICAg
ICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwo+PiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hz
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4+ICBzYW1wbGVzL3ZmaW8tbWRldi9t
ZHB5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gIHNhbXBsZXMvdmZpby1t
ZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgMTMgZmlsZXMg
Y2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+
IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiBp
bmRleCAyNWViN2Q1YjgzNGIuLjBlMDUyMDcyZTFkOCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+IEBAIC0xMDIsMTIg
KzEwMiwxNCBAQCBzdHJ1Y3R1cmUgdG8gcmVwcmVzZW50IGEgbWVkaWF0ZWQgZGV2aWNlJ3MgZHJp
dmVyOjoKPj4gICAgICAgICogQHByb2JlOiBjYWxsZWQgd2hlbiBuZXcgZGV2aWNlIGNyZWF0ZWQK
Pj4gICAgICAgICogQHJlbW92ZTogY2FsbGVkIHdoZW4gZGV2aWNlIHJlbW92ZWQKPj4gICAgICAg
ICogQGRyaXZlcjogZGV2aWNlIGRyaXZlciBzdHJ1Y3R1cmUKPj4gKyAgICAgICogQGlkX3RhYmxl
OiB0aGUgaWRzIHNlcnZpY2VkIGJ5IHRoaXMgZHJpdmVyLgo+IE5vIGZ1bGwgc3RvcCBhdCB0aGUg
ZW5kLgoKCldpbGwgZml4IHRoaXMuCgoKPgo+PiAgICAgICAgKi8KPj4gICAgICAgc3RydWN0IG1k
ZXZfZHJpdmVyIHsKPj4gIAkgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4+ICAJICAgICBpbnQgICgq
cHJvYmUpICAoc3RydWN0IGRldmljZSAqZGV2KTsKPj4gIAkgICAgIHZvaWQgKCpyZW1vdmUpIChz
dHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgCSAgICAgc3RydWN0IGRldmljZV9kcml2ZXIgICAgZHJp
dmVyOwo+PiArCSAgICAgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgKmlkX3RhYmxlOwo+PiAg
ICAgICB9Owo+Pgo+PiAgQSBtZWRpYXRlZCBidXMgZHJpdmVyIGZvciBtZGV2IHNob3VsZCB1c2Ug
dGhpcyBzdHJ1Y3R1cmUgaW4gdGhlIGZ1bmN0aW9uIGNhbGxzCj4+IEBAIC0xMTYsNyArMTE4LDcg
QEAgdG8gcmVnaXN0ZXIgYW5kIHVucmVnaXN0ZXIgaXRzZWxmIHdpdGggdGhlIGNvcmUgZHJpdmVy
Ogo+PiAgKiBSZWdpc3Rlcjo6Cj4+Cj4+ICAgICAgZXh0ZXJuIGludCAgbWRldl9yZWdpc3Rlcl9k
cml2ZXIoc3RydWN0IG1kZXZfZHJpdmVyICpkcnYsCj4+IC0JCQkJICAgc3RydWN0IG1vZHVsZSAq
b3duZXIpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBt
b2R1bGUgKm93bmVyKTsKPj4KPiBVbnJlbGF0ZWQgY2hhbmdlIGluIHRoaXMgcGF0Y2guCgoKWWVz
LCB3aWxsIGZpeC4KCgo+Cj4+ICAqIFVucmVnaXN0ZXI6Ogo+Pgo+PiBAQCAtMTYzLDcgKzE2NSw4
IEBAIEEgZHJpdmVyIHNob3VsZCB1c2UgdGhlIG1kZXZfcGFyZW50X29wcyBzdHJ1Y3R1cmUgaW4K
Pj4gdGhlIGZ1bmN0aW9uIGNhbGwgdG8gIHJlZ2lzdGVyIGl0c2VsZiB3aXRoIHRoZSBtZGV2IGNv
cmUgZHJpdmVyOjoKPj4KPj4gIAlleHRlcm4gaW50ICBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYsCj4+IC0JICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKTsKPj4gKwkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzICpvcHMsCj4+ICsJICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggY2xhc3NfaWQpOwo+Pgo+IENvdmVyIGxl
dHRlciBmcm9tIENoYW5nZS1WMiBzYXlzIHRoYXQgaXQgY2xhc3NfaWQgY2hhbmdlZCBmcm9tICIg
dXNlIHUxNiBpbnN0ZWFkIHU4IGZvciBjbGFzcyBpZCIKPiBCdXQgaXQgaXMgc3RpbGwgdTggaGVy
ZT8KCgpSaWdodCwgbGV0IG1lIGZpeCBpdCBpbiB2Mi4KCgo+Cj4+ICBIb3dldmVyLCB0aGUgbWRl
dl9wYXJlbnRfb3BzIHN0cnVjdHVyZSBpcyBub3QgcmVxdWlyZWQgaW4gdGhlIGZ1bmN0aW9uIGNh
bGwKPj4gdGhhdCBhIGRyaXZlciBzaG91bGQgdXNlIHRvIHVucmVnaXN0ZXIgaXRzZWxmIHdpdGgg
dGhlIG1kZXYgY29yZSBkcml2ZXI6Ogo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2t2bWd0LmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+PiBp
bmRleCAyM2FhM2U1MGNiZjguLjE5ZDUxYTM1ZjAxOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2t2bWd0LmMKPj4gQEAgLTE2MjUsNyArMTYyNSw3IEBAIHN0YXRpYyBpbnQga3ZtZ3RfaG9zdF9p
bml0KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZAo+PiAqZ3Z0LCBjb25zdCB2b2lkICpvcHMpCj4+
ICAJCXJldHVybiAtRUZBVUxUOwo+PiAgCWludGVsX3ZncHVfb3BzLnN1cHBvcnRlZF90eXBlX2dy
b3VwcyA9IGt2bV92Z3B1X3R5cGVfZ3JvdXBzOwo+Pgo+PiAtCXJldHVybiBtZGV2X3JlZ2lzdGVy
X2RldmljZShkZXYsICZpbnRlbF92Z3B1X29wcyk7Cj4+ICsJcmV0dXJuIG1kZXZfcmVnaXN0ZXJf
dmZpb19kZXZpY2UoZGV2LCAmaW50ZWxfdmdwdV9vcHMpOwo+PiAgfQo+Pgo+PiAgc3RhdGljIHZv
aWQga3ZtZ3RfaG9zdF9leGl0KHN0cnVjdCBkZXZpY2UgKmRldikgZGlmZiAtLWdpdAo+PiBhL2Ry
aXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgYi9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3
X29wcy5jIGluZGV4Cj4+IGYwZDcxYWI3N2M1MC4uMjQ2ZmYwZjgwOTQ0IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jCj4+ICsrKyBiL2RyaXZlcnMvczM5MC9j
aW8vdmZpb19jY3dfb3BzLmMKPj4gQEAgLTU4OCw3ICs1ODgsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1kZXZfcGFyZW50X29wcwo+PiB2ZmlvX2Njd19tZGV2X29wcyA9IHsKPj4KPj4gIGludCB2
ZmlvX2Njd19tZGV2X3JlZyhzdHJ1Y3Qgc3ViY2hhbm5lbCAqc2NoKSAgewo+PiAtCXJldHVybiBt
ZGV2X3JlZ2lzdGVyX2RldmljZSgmc2NoLT5kZXYsICZ2ZmlvX2Njd19tZGV2X29wcyk7Cj4+ICsJ
cmV0dXJuIG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2UoJnNjaC0+ZGV2LCAmdmZpb19jY3dfbWRl
dl9vcHMpOwo+PiAgfQo+Pgo+PiAgdm9pZCB2ZmlvX2Njd19tZGV2X3VucmVnKHN0cnVjdCBzdWJj
aGFubmVsICpzY2gpIGRpZmYgLS1naXQKPj4gYS9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBf
b3BzLmMgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMKPj4gaW5kZXggNWMwZjUz
YzZkZGU3Li43NDg3ZmMzOWQyYzUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvczM5MC9jcnlwdG8v
dmZpb19hcF9vcHMuYwo+PiArKysgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMK
Pj4gQEAgLTEyOTUsNyArMTI5NSw4IEBAIGludCB2ZmlvX2FwX21kZXZfcmVnaXN0ZXIodm9pZCkg
IHsKPj4gIAlhdG9taWNfc2V0KCZtYXRyaXhfZGV2LT5hdmFpbGFibGVfaW5zdGFuY2VzLAo+PiBN
QVhfWkRFVl9FTlRSSUVTX0VYVCk7Cj4+Cj4+IC0JcmV0dXJuIG1kZXZfcmVnaXN0ZXJfZGV2aWNl
KCZtYXRyaXhfZGV2LT5kZXZpY2UsCj4+ICZ2ZmlvX2FwX21hdHJpeF9vcHMpOwo+PiArCXJldHVy
biBtZGV2X3JlZ2lzdGVyX3ZmaW9fZGV2aWNlKCZtYXRyaXhfZGV2LT5kZXZpY2UsCj4+ICsJCQkJ
CSAmdmZpb19hcF9tYXRyaXhfb3BzKTsKPj4gIH0KPj4KPj4gIHZvaWQgdmZpb19hcF9tZGV2X3Vu
cmVnaXN0ZXIodm9pZCkKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29y
ZS5jIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPj4gaW5kZXggYjU1OGQ0Y2ZkMDgy
Li5hMDJjMjU2YTM1MTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29y
ZS5jCj4+ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4+IEBAIC0xMzUsMTEg
KzEzNSwxNCBAQCBzdGF0aWMgaW50IG1kZXZfZGV2aWNlX3JlbW92ZV9jYihzdHJ1Y3QgZGV2aWNl
Cj4+ICpkZXYsIHZvaWQgKmRhdGEpCj4+ICAgKiBtZGV2X3JlZ2lzdGVyX2RldmljZSA6IFJlZ2lz
dGVyIGEgZGV2aWNlCj4+ICAgKiBAZGV2OiBkZXZpY2Ugc3RydWN0dXJlIHJlcHJlc2VudGluZyBw
YXJlbnQgZGV2aWNlLgo+PiAgICogQG9wczogUGFyZW50IGRldmljZSBvcGVyYXRpb24gc3RydWN0
dXJlIHRvIGJlIHJlZ2lzdGVyZWQuCj4+ICsgKiBAaWQ6IGRldmljZSBpZC4KPj4gICAqCj4gSXQg
ZGV2aWNlIGlkIGhlcmUsIGJ1dCBpbiBiZWxvdyBpdHMgY2xhc3NfaWQuIFBsZWFzZSBtYWtlIHRo
ZW0gdW5pZm9ybS4KCgpZZXMsIHdpbGwgZml4LgoKCj4+ICAgKiBBZGQgZGV2aWNlIHRvIGxpc3Qg
b2YgcmVnaXN0ZXJlZCBwYXJlbnQgZGV2aWNlcy4KPj4gICAqIFJldHVybnMgYSBuZWdhdGl2ZSB2
YWx1ZSBvbiBlcnJvciwgb3RoZXJ3aXNlIDAuCj4+ICAgKi8KPj4gLWludCBtZGV2X3JlZ2lzdGVy
X2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMK
Pj4gKm9wcykKPj4gK2ludCBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4+ICsJCQkgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzLAo+PiArCQkJIHU4IGNs
YXNzX2lkKQo+PiAgewo+IHUxNiBjbGFzc19pZD8KCgpZZXMgaXQgaXMuCgoKPgo+PiAgCWludCBy
ZXQ7Cj4+ICAJc3RydWN0IG1kZXZfcGFyZW50ICpwYXJlbnQ7Cj4+IEBAIC0xNzUsNiArMTc4LDcg
QEAgaW50IG1kZXZfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QKPj4g
c3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKQo+Pgo+PiAgCXBhcmVudC0+ZGV2ID0gZGV2Owo+
PiAgCXBhcmVudC0+b3BzID0gb3BzOwo+PiArCXBhcmVudC0+Y2xhc3NfaWQgPSBjbGFzc19pZDsK
Pj4KPj4gIAlpZiAoIW1kZXZfYnVzX2NvbXBhdF9jbGFzcykgewo+PiAgCQltZGV2X2J1c19jb21w
YXRfY2xhc3MgPQo+PiBjbGFzc19jb21wYXRfcmVnaXN0ZXIoIm1kZXZfYnVzIik7Cj4+IEBAIC0y
MDgsNyArMjEyLDEzIEBAIGludCBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIGNvbnN0Cj4+IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcykKPj4gIAkJcHV0X2Rldmlj
ZShkZXYpOwo+PiAgCXJldHVybiByZXQ7Cj4+ICB9Cj4+IC1FWFBPUlRfU1lNQk9MKG1kZXZfcmVn
aXN0ZXJfZGV2aWNlKTsKPj4gKwo+PiAraW50IG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2Uoc3Ry
dWN0IGRldmljZSAqZGV2LAo+PiArCQkJICAgICAgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29w
cyAqb3BzKSB7Cj4+ICsJcmV0dXJuIG1kZXZfcmVnaXN0ZXJfZGV2aWNlKGRldiwgb3BzLCBNREVW
X0lEX1ZGSU8pOyB9Cj4+ICtFWFBPUlRfU1lNQk9MKG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2Up
Owo+Pgo+PiAgLyoKPj4gICAqIG1kZXZfdW5yZWdpc3Rlcl9kZXZpY2UgOiBVbnJlZ2lzdGVyIGEg
cGFyZW50IGRldmljZSBkaWZmIC0tZ2l0Cj4+IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2
ZXIuYyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgaW5kZXgKPj4gMGQzMjIzYWVl
MjBiLi5iNzBiYmViYzlkZDMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZf
ZHJpdmVyLmMKPj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYwo+PiBAQCAt
NjksOCArNjksMjIgQEAgc3RhdGljIGludCBtZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+Cj4+ICtzdGF0aWMgaW50IG1kZXZfbWF0Y2goc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2KSB7Cj4+ICsJdW5zaWduZWQg
aW50IGk7Cj4+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdG9fbWRldl9kZXZpY2UoZGV2
KTsKPj4gKwlzdHJ1Y3QgbWRldl9kcml2ZXIgKm1kcnYgPSB0b19tZGV2X2RyaXZlcihkcnYpOwo+
PiArCWNvbnN0IHN0cnVjdCBtZGV2X2NsYXNzX2lkICppZHMgPSBtZHJ2LT5pZF90YWJsZTsKPj4g
Kwo+PiArCWZvciAoaSA9IDA7IGlkc1tpXS5pZDsgaSsrKQo+PiArCQlpZiAoaWRzW2ldLmlkID09
IG1kZXYtPnBhcmVudC0+Y2xhc3NfaWQpCj4+ICsJCQlyZXR1cm4gMTsKPj4gKwlyZXR1cm4gMDsK
Pj4gK30KPj4gKwo+PiAgc3RydWN0IGJ1c190eXBlIG1kZXZfYnVzX3R5cGUgPSB7Cj4+ICAJLm5h
bWUJCT0gIm1kZXYiLAo+PiArCS5tYXRjaAkJPSBtZGV2X21hdGNoLAo+PiAgCS5wcm9iZQkJPSBt
ZGV2X3Byb2JlLAo+PiAgCS5yZW1vdmUJCT0gbWRldl9yZW1vdmUsCj4+ICB9Owo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKPj4gYi9kcml2ZXJzL3ZmaW8v
bWRldi9tZGV2X3ByaXZhdGUuaAo+PiBpbmRleCA3ZDkyMjk1MGNhYWYuLmU1OGIwN2M4NjZiMSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKPj4gKysrIGIv
ZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKPj4gQEAgLTIyLDYgKzIyLDcgQEAgc3Ry
dWN0IG1kZXZfcGFyZW50IHsKPj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIHR5cGVfbGlzdDsKPj4gIAkv
KiBTeW5jaHJvbml6ZSBkZXZpY2UgY3JlYXRpb24vcmVtb3ZhbCB3aXRoIHBhcmVudCB1bnJlZ2lz
dHJhdGlvbiAqLwo+PiAgCXN0cnVjdCByd19zZW1hcGhvcmUgdW5yZWdfc2VtOwo+PiArCXU4IGNs
YXNzX2lkOwo+PiAgfTsKPj4KPj4gIHN0cnVjdCBtZGV2X2RldmljZSB7Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9f
bWRldi5jCj4+IGluZGV4IDMwOTY0YTRlMGEyOC4uZmQyYTRkOWEzZjI2IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+PiArKysgYi9kcml2ZXJzL3ZmaW8vbWRl
di92ZmlvX21kZXYuYwo+PiBAQCAtMTIwLDEwICsxMjAsMTYgQEAgc3RhdGljIHZvaWQgdmZpb19t
ZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICAJdmZpb19kZWxfZ3JvdXBfZGV2KGRl
dik7Cj4+ICB9Cj4+Cj4+ICtzdGF0aWMgc3RydWN0IG1kZXZfY2xhc3NfaWQgaWRfdGFibGVbXSA9
IHsKPj4gKwl7IE1ERVZfSURfVkZJTyB9LAo+PiArCXsgMCB9LAo+PiArfTsKPj4gKwo+PiAgc3Rh
dGljIHN0cnVjdCBtZGV2X2RyaXZlciB2ZmlvX21kZXZfZHJpdmVyID0gewo+PiAgCS5uYW1lCT0g
InZmaW9fbWRldiIsCj4+ICAJLnByb2JlCT0gdmZpb19tZGV2X3Byb2JlLAo+PiAgCS5yZW1vdmUJ
PSB2ZmlvX21kZXZfcmVtb3ZlLAo+PiArCS5pZF90YWJsZSA9IGlkX3RhYmxlLAo+PiAgfTsKPj4K
Pj4gIHN0YXRpYyBpbnQgX19pbml0IHZmaW9fbWRldl9pbml0KHZvaWQpCj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21kZXYuaCBiL2luY2x1ZGUvbGludXgvbWRldi5oIGluZGV4Cj4+IDBj
ZTMwY2E3OGRiMC4uM2ViYWUzMTBmNTk5IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21k
ZXYuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21kZXYuaAo+PiBAQCAtMTE4LDYgKzExOCw3IEBA
IHN0cnVjdCBtZGV2X3R5cGVfYXR0cmlidXRlIG1kZXZfdHlwZV9hdHRyXyMjX25hbWUKPj4gPQkJ
XAo+PiAgICogQHByb2JlOiBjYWxsZWQgd2hlbiBuZXcgZGV2aWNlIGNyZWF0ZWQKPj4gICAqIEBy
ZW1vdmU6IGNhbGxlZCB3aGVuIGRldmljZSByZW1vdmVkCj4+ICAgKiBAZHJpdmVyOiBkZXZpY2Ug
ZHJpdmVyIHN0cnVjdHVyZQo+PiArICogQGlkX3RhYmxlOiB0aGUgaWRzIHNlcnZpY2VkIGJ5IHRo
aXMgZHJpdmVyLgo+PiAgICoKPj4gICAqKi8KPj4gIHN0cnVjdCBtZGV2X2RyaXZlciB7Cj4+IEBA
IC0xMjUsNiArMTI2LDcgQEAgc3RydWN0IG1kZXZfZHJpdmVyIHsKPj4gIAlpbnQgICgqcHJvYmUp
KHN0cnVjdCBkZXZpY2UgKmRldik7Cj4+ICAJdm9pZCAoKnJlbW92ZSkoc3RydWN0IGRldmljZSAq
ZGV2KTsKPj4gIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBkcml2ZXI7Cj4+ICsJY29uc3Qgc3RydWN0
IG1kZXZfY2xhc3NfaWQgKmlkX3RhYmxlOwo+PiAgfTsKPj4KPj4gICNkZWZpbmUgdG9fbWRldl9k
cml2ZXIoZHJ2KQljb250YWluZXJfb2YoZHJ2LCBzdHJ1Y3QgbWRldl9kcml2ZXIsIGRyaXZlcikK
Pj4gQEAgLTEzNSw3ICsxMzcsOCBAQCBjb25zdCBndWlkX3QgKm1kZXZfdXVpZChzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYpOwo+Pgo+PiAgZXh0ZXJuIHN0cnVjdCBidXNfdHlwZSBtZGV2X2J1c190
eXBlOwo+Pgo+PiAtaW50IG1kZXZfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwg
Y29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcwo+PiAqb3BzKTsKPj4gK2ludCBtZGV2X3JlZ2lz
dGVyX3ZmaW9fZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gKwkJCSAgICAgIGNvbnN0IHN0
cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcyk7Cj4+ICB2b2lkIG1kZXZfdW5yZWdpc3Rlcl9kZXZp
Y2Uoc3RydWN0IGRldmljZSAqZGV2KTsKPj4KPj4gIGludCBtZGV2X3JlZ2lzdGVyX2RyaXZlcihz
dHJ1Y3QgbWRldl9kcml2ZXIgKmRydiwgc3RydWN0IG1vZHVsZSAqb3duZXIpOwo+PiBAQCAtMTQ1
LDQgKzE0OCw2IEBAIHN0cnVjdCBkZXZpY2UgKm1kZXZfcGFyZW50X2RldihzdHJ1Y3QgbWRldl9k
ZXZpY2UKPj4gKm1kZXYpOyAgc3RydWN0IGRldmljZSAqbWRldl9kZXYoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2KTsgIHN0cnVjdAo+PiBtZGV2X2RldmljZSAqbWRldl9mcm9tX2RldihzdHJ1Y3Qg
ZGV2aWNlICpkZXYpOwo+Pgo+PiArI2RlZmluZSBNREVWX0lEX1ZGSU8gMSAvKiBWRklPIGRldmlj
ZSAqLwo+PiArCj4gSW5zdGVhZCBvZiBkZWZpbmUsIHBsZWFzZSBwdXQgdGhlbSBhcyBlbnVtIAo+
Cj4gZW51bSBtZGV2X2NsYXNzL2RldmljZV9pZCB7Cj4gCU1ERVZfSURfVkZJTyA9IDEsCj4gCS8q
IE5ldyBlbnRyaWVzIG11c3QgYmUgYWRkZWQgaGVyZSAqLwo+IH07CgoKT2suCgoKPgo+PiAgI2Vu
ZGlmIC8qIE1ERVZfSCAqLwo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNl
dGFibGUuaCBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKPj4gaW5kZXggNTcxNGZk
MzVhODNjLi5mMzJjNmU0NGZiMWEgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbW9kX2Rl
dmljZXRhYmxlLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaAo+PiBA
QCAtODIxLDQgKzgyMSwxMiBAQCBzdHJ1Y3Qgd21pX2RldmljZV9pZCB7Cj4+ICAJY29uc3Qgdm9p
ZCAqY29udGV4dDsKPj4gIH07Cj4+Cj4+ICsvKioKPj4gKyAqIHN0cnVjdCBtZGV2X2NsYXNzX2lk
IC0gTURFViBkZXZpY2UgY2xhc3MgaWRlbnRpZmllcgo+PiArICogQGlkOiBVc2VkIHRvIGlkZW50
aWZ5IGEgc3BlY2lmaWMgY2xhc3Mgb2YgZGV2aWNlLCBlLmcgdmZpby1tZGV2IGRldmljZS4KPj4g
KyAqLwo+PiArc3RydWN0IG1kZXZfY2xhc3NfaWQgewo+PiArCV9fdTE2IGlkOwo+PiArfTsKPiBU
aGlzIGlzIHUxNiBhcyBJIGd1ZXNzIHlvdSB3YW50ZWQgYXMgb3Bwb3NlZCB0byB1OCBpbiBvdGhl
ciBwbGFjZXMgaW4gcGF0Y2guCgoKUmlnaHQuCgpUaGFua3MKCgo+PiArCj4+ICAjZW5kaWYgLyog
TElOVVhfTU9EX0RFVklDRVRBQkxFX0ggKi8KPj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1t
ZGV2L21ib2Nocy5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgaW5kZXgKPj4gYWM1Yzhj
MTdiMWZmLi43MWE0NDY5YmU4NWQgMTAwNjQ0Cj4+IC0tLSBhL3NhbXBsZXMvdmZpby1tZGV2L21i
b2Nocy5jCj4+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCj4+IEBAIC0xNDY4LDcg
KzE0NjgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYm9jaHNfZGV2X2luaXQodm9pZCkKPj4gIAlp
ZiAocmV0KQo+PiAgCQlnb3RvIGZhaWxlZDI7Cj4+Cj4+IC0JcmV0ID0gbWRldl9yZWdpc3Rlcl9k
ZXZpY2UoJm1ib2Noc19kZXYsICZtZGV2X2ZvcHMpOwo+PiArCXJldCA9IG1kZXZfcmVnaXN0ZXJf
dmZpb19kZXZpY2UoJm1ib2Noc19kZXYsICZtZGV2X2ZvcHMpOwo+PiAgCWlmIChyZXQpCj4+ICAJ
CWdvdG8gZmFpbGVkMzsKPj4KPj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L21kcHku
YyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYyBpbmRleAo+PiBjYzg2YmY2NTY2ZTQuLmQzMDI5
ZGQyN2Q5MSAxMDA2NDQKPj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jCj4+ICsrKyBi
L3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYwo+PiBAQCAtNzc1LDcgKzc3NSw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IG1kcHlfZGV2X2luaXQodm9pZCkKPj4gIAlpZiAocmV0KQo+PiAgCQlnb3RvIGZh
aWxlZDI7Cj4+Cj4+IC0JcmV0ID0gbWRldl9yZWdpc3Rlcl9kZXZpY2UoJm1kcHlfZGV2LCAmbWRl
dl9mb3BzKTsKPj4gKwlyZXQgPSBtZGV2X3JlZ2lzdGVyX3ZmaW9fZGV2aWNlKCZtZHB5X2Rldiwg
Jm1kZXZfZm9wcyk7Cj4+ICAJaWYgKHJldCkKPj4gIAkJZ290byBmYWlsZWQzOwo+Pgo+PiBkaWZm
IC0tZ2l0IGEvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXR0
eS5jIGluZGV4Cj4+IDkyZTc3MGEwNmVhMi4uNzQ0Yzg4YTZiMjJjIDEwMDY0NAo+PiAtLS0gYS9z
YW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMKPj4gKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5j
Cj4+IEBAIC0xNDY4LDcgKzE0NjgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBtdHR5X2Rldl9pbml0
KHZvaWQpCj4+ICAJaWYgKHJldCkKPj4gIAkJZ290byBmYWlsZWQyOwo+Pgo+PiAtCXJldCA9IG1k
ZXZfcmVnaXN0ZXJfZGV2aWNlKCZtdHR5X2Rldi5kZXYsICZtZGV2X2ZvcHMpOwo+PiArCXJldCA9
IG1kZXZfcmVnaXN0ZXJfdmZpb19kZXZpY2UoJm10dHlfZGV2LmRldiwgJm1kZXZfZm9wcyk7Cj4+
ICAJaWYgKHJldCkKPj4gIAkJZ290byBmYWlsZWQzOwo+Pgo+PiAtLQo+PiAyLjE5LjEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
