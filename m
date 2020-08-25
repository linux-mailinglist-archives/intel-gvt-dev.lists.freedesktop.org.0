Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996E251AFE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 25 Aug 2020 16:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315516E37F;
	Tue, 25 Aug 2020 14:39:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32D36E37F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 25 Aug 2020 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598366385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPdYh1VB2wpc3IYjObXT6GDVs2MbdPO5hiSctsLyL8M=;
 b=YPJbnrV7tRXKYLfKTwTf6Jz+G6dlA9P6Bpi/QHEQljflIj/VIWfmehqMLl4VLWCMx2ZAXi
 2nPNKOCkC8lTz7EIDo/0ZwQZra60wZSCU96JjFSwvsfbXrZgTa6qF+aoADkMnI8ilQWQI6
 2z3znplRxtQQi+XKuab7YBBVZRKGdrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-8x5CwBgFP1eJWXLuDrlbMA-1; Tue, 25 Aug 2020 10:39:43 -0400
X-MC-Unique: 8x5CwBgFP1eJWXLuDrlbMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6907A1007467;
 Tue, 25 Aug 2020 14:39:41 +0000 (UTC)
Received: from gondolin (ovpn-112-248.ams2.redhat.com [10.36.112.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF2DB1014161;
 Tue, 25 Aug 2020 14:39:27 +0000 (UTC)
Date: Tue, 25 Aug 2020 16:39:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200825163925.1c19b0f0.cohuck@redhat.com>
In-Reply-To: <20200820031621.GA24997@joy-OptiPlex-7040>
References: <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBBdWcgMjAyMCAxMToxNjoyMSArMDgwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIEF1ZyAxOSwgMjAyMCBhdCAwOToyMjozNFBNIC0w
NjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBPbiBUaHUsIDIwIEF1ZyAyMDIwIDA4OjM5
OjIyICswODAwCj4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4g
ICAKPiA+ID4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MzY6NTJBTSArMDIwMCwgQ29ybmVs
aWEgSHVjayB3cm90ZTogIAo+ID4gPiA+IE9uIFR1ZSwgMTggQXVnIDIwMjAgMTA6MTY6MjggKzAx
MDAKPiA+ID4gPiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPiB3cm90
ZToKPiA+ID4gPiAgICAgCj4gPiA+ID4gPiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAwNTowMTo1
MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOiAgICAKPiA+ID4gPiA+ID4gICAgT24gMjAyMC84
LzE4IOS4i+WNiDQ6NTUsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiAgT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MjQ6MzBBTSArMDgwMCwgSmFz
b24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICBPbiAyMDIwLzgvMTQg5LiL
5Y2IMToxNiwgWWFuIFpoYW8gd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAgT24gVGh1
LCBBdWcgMTMsIDIwMjAgYXQgMTI6MjQ6NTBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICBPbiAyMDIwLzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8g
d3JvdGU6ICAgICAgCj4gPiA+ID4gPiAgICAgCj4gPiA+ID4gPiA+ICB3ZSBhY3R1YWxseSBjYW4g
YWxzbyByZXRyaWV2ZSB0aGUgc2FtZSBpbmZvcm1hdGlvbiB0aHJvdWdoIHN5c2ZzLCAuZS5nCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAgfC0gW3BhdGggdG8gZGV2aWNlXQo+ID4gPiA+ID4gPiAg
ICAgfC0tLSBtaWdyYXRpb24KPiA+ID4gPiA+ID4gICAgIHwgICAgIHwtLS0gc2VsZgo+ID4gPiA+
ID4gPiAgICAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBpCj4gPiA+ID4gPiA+ICAgICB8ICAgIHwg
ICB8LS0tbWRldl90eXBlCj4gPiA+ID4gPiA+ICAgICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVy
c2lvbgo+ID4gPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLWRldmljZV9pZAo+ID4gPiA+ID4gPiAg
ICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPiA+ID4gPiA+ID4gICAgIHwgICAgIHwtLS0gY29t
cGF0aWJsZQo+ID4gPiA+ID4gPiAgICAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBpCj4gPiA+ID4g
PiA+ICAgICB8ICAgIHwgICB8LS0tbWRldl90eXBlCj4gPiA+ID4gPiA+ICAgICB8ICAgIHwgICB8
LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLWRldmljZV9p
ZAo+ID4gPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAgWWVzIGJ1dDoKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ICAtIFlvdSBuZWVkIG9uZSBmaWxlIHBlciBhdHRyaWJ1dGUgKG9uZSBzeXNjYWxsIGZvciBvbmUg
YXR0cmlidXRlKQo+ID4gPiA+ID4gPiAgLSBBdHRyaWJ1dGUgaXMgY291cGxlZCB3aXRoIGtvYmpl
Y3QgICAgCj4gPiA+ID4gCj4gPiA+ID4gSXMgdGhhdCByZWFsbHkgdGhhdCBiYWQ/IFlvdSBoYXZl
IHRoZSBkZXZpY2Ugd2l0aCBhbiBlbWJlZGRlZCBrb2JqZWN0Cj4gPiA+ID4gYW55d2F5LCBhbmQg
eW91IGNhbiBqdXN0IHB1dCB0aGluZ3MgaW50byBhbiBhdHRyaWJ1dGUgZ3JvdXA/Cj4gPiA+ID4g
Cj4gPiA+ID4gW0Fsc28sIEkgdGhpbmsgdGhhdCBzZWxmL2NvbXBhdGlibGUgc3BsaXQgaW4gdGhl
IGV4YW1wbGUgbWFrZXMgdGhpbmdzCj4gPiA+ID4gbmVlZGxlc3NseSBjb21wbGV4LiBTaG91bGRu
J3Qgc2VtYW50aWMgdmVyc2lvbmluZyBhbmQgbWF0Y2hpbmcgYWxyZWFkeQo+ID4gPiA+IGNvdmVy
IG5lYXJseSBldmVyeXRoaW5nPyBJIHdvdWxkIGV4cGVjdCB2ZXJ5IGZldyBjYXNlcyB0aGF0IGFy
ZSBtb3JlCj4gPiA+ID4gY29tcGxleCB0aGFuIHRoYXQuIE1heWJlIHRoZSBhZ2dyZWdhdGlvbiBz
dHVmZiwgYnV0IEkgZG9uJ3QgdGhpbmsgd2UKPiA+ID4gPiBuZWVkIHRoYXQgc2VsZi9jb21wYXRp
YmxlIHNwbGl0IGZvciB0aGF0LCBlaXRoZXIuXSAgICAKPiA+ID4gSGkgQ29ybmVsaWEsCj4gPiA+
IAo+ID4gPiBUaGUgcmVhc29uIEkgd2FudCB0byBkZWNsYXJlIGNvbXBhdGlibGUgbGlzdCBvZiBh
dHRyaWJ1dGVzIGlzIHRoYXQKPiA+ID4gc29tZXRpbWVzIGl0J3Mgbm90IGEgc2ltcGxlIDE6MSBt
YXRjaGluZyBvZiBzb3VyY2UgYXR0cmlidXRlcyBhbmQgdGFyZ2V0IGF0dHJpYnV0ZXMKPiA+ID4g
YXMgSSBkZW1vbnN0cmF0ZWQgYmVsb3csCj4gPiA+IHNvdXJjZSBtZGV2IG9mIChtZGV2X3R5cGUg
aTkxNS1HVlRnX1Y1XzIgKyBhZ2dyZWdhdG9yIDEpIGlzIGNvbXBhdGlibGUgdG8KPiA+ID4gdGFy
Z2V0IG1kZXYgb2YgKG1kZXZfdHlwZSBpOTE1LUdWVGdfVjVfNCArIGFnZ3JlZ2F0b3IgMiksCj4g
PiA+ICAgICAgICAgICAgICAgIChtZGV2X3R5cGUgaTkxNS1HVlRnX1Y1XzggKyBhZ2dyZWdhdG9y
IDQpCj4gPiA+IAo+ID4gPiBhbmQgYWdncmFnYXRvciBtYXkgYmUganVzdCBvbmUgb2Ygc3VjaCBl
eGFtcGxlcyB0aGF0IDE6MSBtYXRjaGluZyBkb2VzIG5vdAo+ID4gPiBmaXQuICAKPiA+IAo+ID4g
SWYgeW91J3JlIHN1Z2dlc3RpbmcgdGhhdCB3ZSBuZWVkIGEgbmV3ICdjb21wYXRpYmxlJyBzZXQg
Zm9yIGV2ZXJ5Cj4gPiBhZ2dyZWdhdGlvbiwgaGF2ZW4ndCB3ZSBsb3N0IHRoZSBwdXJwb3NlIG9m
IGFnZ3JlZ2F0aW9uPyAgRm9yIGV4YW1wbGUsCj4gPiByYXRoZXIgdGhhbiBoYXZpbmcgTiBtZGV2
IHR5cGVzIHRvIHJlcHJlc2VudCBhbGwgdGhlIHBvc3NpYmxlCj4gPiBhZ2dyZWdhdGlvbiB2YWx1
ZXMsIHdlIGhhdmUgYSBzaW5nbGUgbWRldiB0eXBlIHdpdGggTiBjb21wYXRpYmxlCj4gPiBtaWdy
YXRpb24gZW50cmllcywgb25lIGZvciBlYWNoIHBvc3NpYmxlIGFnZ3JlZ2F0aW9uIHZhbHVlLiAg
QlRXLCBob3cgZG8KPiA+IHdlIGhhdmUgbXVsdGlwbGUgY29tcGF0aWJsZSBkaXJlY3Rvcmllcz8g
IGNvbXBhdGlibGUwMDAxLAo+ID4gY29tcGF0aWJsZTAwMDI/IFRoYW5rcywKPiA+ICAgCj4gZG8g
eW91IHRoaW5rIHRoZSBiaW5fYXR0cmlidXRlIEkgcHJvcG9zZWQgeWVzdGVyZGF5IGdvb2Q/Cj4g
VGhlbiB3ZSBjYW4gaGF2ZSBhIHNpbmdsZSBjb21wYXRpYmxlIHdpdGggYSB2YXJpYWJsZSBpbiB0
aGUgbWRldl90eXBlIGFuZAo+IGFnZ3JlZ2F0b3IuCj4gCj4gICAgbWRldl90eXBlPWk5MTUtR1ZU
Z19WNV97dmFsMTppbnQ6Miw0LDh9Cj4gICAgYWdncmVnYXRvcj17dmFsMX0vMgoKSSdtIG5vdCBy
ZWFsbHkgYSBmYW4gb2YgYmluYXJ5IGF0dHJpYnV0ZXMgb3RoZXIgdGhhbiBpbiBjYXNlcyB3aGVy
ZSB3ZQpoYXZlIHNvbWUga2luZCBvZiBiaW5hcnkgZm9ybWF0IHRvIGJlZ2luIHdpdGguCgpJSVVD
LCB3ZSBiYXNpY2FsbHkgaGF2ZToKLSBkaWZmZXJlbnQgcGFydGl0aW9uaW5nIChleHByZXNzZWQg
aW4gdGhlIG1kZXZfdHlwZSkKLSBkaWZmZXJlbnQgbnVtYmVyIG9mIHBhcnRpdGlvbnMgKGV4cHJl
c3NlZCB2aWEgdGhlIGFnZ3JlZ2F0b3IpCi0gZGV2aWNlcyBiZWluZyBjb21wYXRpYmxlIGlmIHRo
ZSBwYXJ0aXRpb25pbmc6YWdncmVnYXRvciByYXRpbyBpcyB0aGUKICBzYW1lCgooVGhlIG11bHRp
cGxlIG1kZXZfdHlwZSB2YXJpYW50cyBzZWVtIHRvIGNvbWUgZnJvbSBhdm9pZGluZyBleHRyYQpj
cmVhdGlvbiBwYXJhbWV0ZXJzLCBJSVJDPykKCldvdWxkIGl0IGJlIGVub3VnaCB0byBleHBvcnQK
YmFzZV90eXBlPWk5MTUtR1ZUZ19WNQphZ2dyZWdhdGlvbl9yYXRpbz08aW50ZWdlcj4KCnRvIGV4
cHJlc3MgdGhlIHZhcmlvdXMgY29tYmluYXRpb25zIHRoYXQgYXJlIGNvbXBhdGlibGUgd2l0aG91
dCB0aGUKbmVlZCBmb3IgbXVsdGlwbGUgc2V0cyBvZiBhdHRyaWJ1dGVzPwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
