Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535524AD40
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 05:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CE16E891;
	Thu, 20 Aug 2020 03:22:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EBD6E891
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 03:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597893770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLd/qISkb4SgY+sj5n1JVIOSU5FSzdkPJ0PTVDiEVxM=;
 b=H0CtUhhPqaDR8dBNokbOMRfU30P39AsIYUpdraeA2h/vE1OalCXngHfukQXExY+/B3id4F
 QVtvaf7cPB7ZO9ZiPXlCtSJtb1nPFm/nUxcAdOdcaW0EFewX+HqF4X694cRcULvZ/HLblV
 GpBHo8fDw9n26rgA2GbTKqgjO5owkcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-GzGRLPngP9iBA0IYQ712nw-1; Wed, 19 Aug 2020 23:22:45 -0400
X-MC-Unique: GzGRLPngP9iBA0IYQ712nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0036085C705;
 Thu, 20 Aug 2020 03:22:43 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32A215C88B;
 Thu, 20 Aug 2020 03:22:35 +0000 (UTC)
Date: Wed, 19 Aug 2020 21:22:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200819212234.223667b3@x1.home>
In-Reply-To: <20200820003922.GE21172@joy-OptiPlex-7040>
References: <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 hejie.xu@intel.com, bao.yumeng@zte.com.cn, Jiri Pirko <jiri@mellanox.com>,
 eskultet@redhat.com, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBBdWcgMjAyMCAwODozOToyMiArMDgwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAxMTozNjo1MkFNICsw
MjAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+ID4gT24gVHVlLCAxOCBBdWcgMjAyMCAxMDoxNjoy
OCArMDEwMAo+ID4gRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPiAgIAo+ID4gPiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAwNTowMTo1MVBNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOiAgCj4gPiA+ID4gICAgT24gMjAyMC84LzE4IOS4i+WNiDQ6NTUs
IERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gIE9uIFR1ZSwgQXVn
IDE4LCAyMDIwIGF0IDExOjI0OjMwQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4g
Cj4gPiA+ID4gIE9uIDIwMjAvOC8xNCDkuIvljYgxOjE2LCBZYW4gWmhhbyB3cm90ZToKPiA+ID4g
PiAKPiA+ID4gPiAgT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTI6MjQ6NTBQTSArMDgwMCwgSmFz
b24gV2FuZyB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiAgT24gMjAyMC84LzEwIOS4i+WNiDM6NDYs
IFlhbiBaaGFvIHdyb3RlOiAgICAKPiA+ID4gICAKPiA+ID4gPiAgd2UgYWN0dWFsbHkgY2FuIGFs
c28gcmV0cmlldmUgdGhlIHNhbWUgaW5mb3JtYXRpb24gdGhyb3VnaCBzeXNmcywgLmUuZwo+ID4g
PiA+IAo+ID4gPiA+ICB8LSBbcGF0aCB0byBkZXZpY2VdCj4gPiA+ID4gICAgIHwtLS0gbWlncmF0
aW9uCj4gPiA+ID4gICAgIHwgICAgIHwtLS0gc2VsZgo+ID4gPiA+ICAgICB8ICAgICB8ICAgfC0t
LWRldmljZV9hcGkKPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLW1kZXZfdHlwZQo+ID4gPiA+ICAg
ICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+ICAgICB8ICAgIHwgICB8LS0t
ZGV2aWNlX2lkCj4gPiA+ID4gICAgIHwgICAgfCAgIHwtLS1hZ2dyZWdhdG9yCj4gPiA+ID4gICAg
IHwgICAgIHwtLS0gY29tcGF0aWJsZQo+ID4gPiA+ICAgICB8ICAgICB8ICAgfC0tLWRldmljZV9h
cGkKPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLW1kZXZfdHlwZQo+ID4gPiA+ICAgICB8ICAgIHwg
ICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+ICAgICB8ICAgIHwgICB8LS0tZGV2aWNlX2lk
Cj4gPiA+ID4gICAgIHwgICAgfCAgIHwtLS1hZ2dyZWdhdG9yCj4gPiA+ID4gCj4gPiA+ID4gCj4g
PiA+ID4gIFllcyBidXQ6Cj4gPiA+ID4gCj4gPiA+ID4gIC0gWW91IG5lZWQgb25lIGZpbGUgcGVy
IGF0dHJpYnV0ZSAob25lIHN5c2NhbGwgZm9yIG9uZSBhdHRyaWJ1dGUpCj4gPiA+ID4gIC0gQXR0
cmlidXRlIGlzIGNvdXBsZWQgd2l0aCBrb2JqZWN0ICAKPiA+IAo+ID4gSXMgdGhhdCByZWFsbHkg
dGhhdCBiYWQ/IFlvdSBoYXZlIHRoZSBkZXZpY2Ugd2l0aCBhbiBlbWJlZGRlZCBrb2JqZWN0Cj4g
PiBhbnl3YXksIGFuZCB5b3UgY2FuIGp1c3QgcHV0IHRoaW5ncyBpbnRvIGFuIGF0dHJpYnV0ZSBn
cm91cD8KPiA+IAo+ID4gW0Fsc28sIEkgdGhpbmsgdGhhdCBzZWxmL2NvbXBhdGlibGUgc3BsaXQg
aW4gdGhlIGV4YW1wbGUgbWFrZXMgdGhpbmdzCj4gPiBuZWVkbGVzc2x5IGNvbXBsZXguIFNob3Vs
ZG4ndCBzZW1hbnRpYyB2ZXJzaW9uaW5nIGFuZCBtYXRjaGluZyBhbHJlYWR5Cj4gPiBjb3ZlciBu
ZWFybHkgZXZlcnl0aGluZz8gSSB3b3VsZCBleHBlY3QgdmVyeSBmZXcgY2FzZXMgdGhhdCBhcmUg
bW9yZQo+ID4gY29tcGxleCB0aGFuIHRoYXQuIE1heWJlIHRoZSBhZ2dyZWdhdGlvbiBzdHVmZiwg
YnV0IEkgZG9uJ3QgdGhpbmsgd2UKPiA+IG5lZWQgdGhhdCBzZWxmL2NvbXBhdGlibGUgc3BsaXQg
Zm9yIHRoYXQsIGVpdGhlci5dICAKPiBIaSBDb3JuZWxpYSwKPiAKPiBUaGUgcmVhc29uIEkgd2Fu
dCB0byBkZWNsYXJlIGNvbXBhdGlibGUgbGlzdCBvZiBhdHRyaWJ1dGVzIGlzIHRoYXQKPiBzb21l
dGltZXMgaXQncyBub3QgYSBzaW1wbGUgMToxIG1hdGNoaW5nIG9mIHNvdXJjZSBhdHRyaWJ1dGVz
IGFuZCB0YXJnZXQgYXR0cmlidXRlcwo+IGFzIEkgZGVtb25zdHJhdGVkIGJlbG93LAo+IHNvdXJj
ZSBtZGV2IG9mIChtZGV2X3R5cGUgaTkxNS1HVlRnX1Y1XzIgKyBhZ2dyZWdhdG9yIDEpIGlzIGNv
bXBhdGlibGUgdG8KPiB0YXJnZXQgbWRldiBvZiAobWRldl90eXBlIGk5MTUtR1ZUZ19WNV80ICsg
YWdncmVnYXRvciAyKSwKPiAgICAgICAgICAgICAgICAobWRldl90eXBlIGk5MTUtR1ZUZ19WNV84
ICsgYWdncmVnYXRvciA0KQo+IAo+IGFuZCBhZ2dyYWdhdG9yIG1heSBiZSBqdXN0IG9uZSBvZiBz
dWNoIGV4YW1wbGVzIHRoYXQgMToxIG1hdGNoaW5nIGRvZXMgbm90Cj4gZml0LgoKSWYgeW91J3Jl
IHN1Z2dlc3RpbmcgdGhhdCB3ZSBuZWVkIGEgbmV3ICdjb21wYXRpYmxlJyBzZXQgZm9yIGV2ZXJ5
CmFnZ3JlZ2F0aW9uLCBoYXZlbid0IHdlIGxvc3QgdGhlIHB1cnBvc2Ugb2YgYWdncmVnYXRpb24/
ICBGb3IgZXhhbXBsZSwKcmF0aGVyIHRoYW4gaGF2aW5nIE4gbWRldiB0eXBlcyB0byByZXByZXNl
bnQgYWxsIHRoZSBwb3NzaWJsZQphZ2dyZWdhdGlvbiB2YWx1ZXMsIHdlIGhhdmUgYSBzaW5nbGUg
bWRldiB0eXBlIHdpdGggTiBjb21wYXRpYmxlCm1pZ3JhdGlvbiBlbnRyaWVzLCBvbmUgZm9yIGVh
Y2ggcG9zc2libGUgYWdncmVnYXRpb24gdmFsdWUuICBCVFcsIGhvdyBkbwp3ZSBoYXZlIG11bHRp
cGxlIGNvbXBhdGlibGUgZGlyZWN0b3JpZXM/ICBjb21wYXRpYmxlMDAwMSwKY29tcGF0aWJsZTAw
MDI/IFRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldgo=
