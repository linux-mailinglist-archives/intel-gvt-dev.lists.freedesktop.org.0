Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D424BB6C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 14:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1AA6E356;
	Thu, 20 Aug 2020 12:29:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1226D6E356
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597926548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+EKqHWsk01YkJj3wPmRDZ+g8oOUui84dZ5XwbpxkVc=;
 b=V2TetddHyhCksLj4KKd9FbNGpowigh/wlysfGDYwAPun/Ypy7EBtI/eOT6Pa4Rs5yhtgwI
 Tj0f/zVdlKrN/paAOG3+/aua22qgrr2nF7WBYpxump8xRoVV1XJwyKFVb67i8v2GMbfyVb
 1FuGWFoQK/ysJ1FR6VAGELFLOvsIZF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-D72bZbJcN-iK6OAgEc8XzQ-1; Thu, 20 Aug 2020 08:27:59 -0400
X-MC-Unique: D72bZbJcN-iK6OAgEc8XzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B651074643;
 Thu, 20 Aug 2020 12:27:57 +0000 (UTC)
Received: from gondolin (ovpn-112-251.ams2.redhat.com [10.36.112.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 383C974E2A;
 Thu, 20 Aug 2020 12:27:43 +0000 (UTC)
Date: Thu, 20 Aug 2020 14:27:40 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [ovirt-devel] Re: device compatibility interface for live
 migration with assigned devices
Message-ID: <20200820142740.6513884d.cohuck@redhat.com>
In-Reply-To: <c1d580dd-5c0c-21bc-19a6-f776617d4ec2@redhat.com>
References: <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
 <e20812b7-994b-b7f9-2df4-a78c4d116c7f@redhat.com>
 <20200819065951.GB21172@joy-OptiPlex-7040>
 <d6f9a51e-80b3-44c5-2656-614b327dc080@redhat.com>
 <20200819081338.GC21172@joy-OptiPlex-7040>
 <c1d580dd-5c0c-21bc-19a6-f776617d4ec2@redhat.com>
Organization: Red Hat GmbH
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, "eauger@redhat.com" <eauger@redhat.com>,
 "xin-ran.wang@intel.com" <xin-ran.wang@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "openstack-discuss@lists.openstack.org"
 <openstack-discuss@lists.openstack.org>,
 "shaohe.feng@intel.com" <shaohe.feng@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>,
 Alex Williamson <alex.williamson@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "sm ooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBBdWcgMjAyMCAxNzoyODozOCArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMjAyMC84LzE5IOS4i+WNiDQ6MTMsIFlhbiBaaGFvIHdy
b3RlOgo+ID4gT24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMDM6Mzk6NTBQTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZTogIAo+ID4+IE9uIDIwMjAvOC8xOSDkuIvljYgyOjU5LCBZYW4gWmhhbyB3cm90
ZTogIAo+ID4+PiBPbiBXZWQsIEF1ZyAxOSwgMjAyMCBhdCAwMjo1NzozNFBNICswODAwLCBKYXNv
biBXYW5nIHdyb3RlOiAgCj4gPj4+PiBPbiAyMDIwLzgvMTkg5LiK5Y2IMTE6MzAsIFlhbiBaaGFv
IHdyb3RlOiAgCj4gPj4+Pj4gaGkgQWxsLAo+ID4+Pj4+IGNvdWxkIHdlIGRlY2lkZSB0aGF0IHN5
c2ZzIGlzIHRoZSBpbnRlcmZhY2UgdGhhdCBldmVyeSBWRklPIHZlbmRvciBkcml2ZXIKPiA+Pj4+
PiBuZWVkcyB0byBwcm92aWRlIGluIG9yZGVyIHRvIHN1cHBvcnQgdmZpbyBsaXZlIG1pZ3JhdGlv
biwgb3RoZXJ3aXNlIHRoZQo+ID4+Pj4+IHVzZXJzcGFjZSBtYW5hZ2VtZW50IHRvb2wgd291bGQg
bm90IGxpc3QgdGhlIGRldmljZSBpbnRvIHRoZSBjb21wYXRpYmxlCj4gPj4+Pj4gbGlzdD8KPiA+
Pj4+Pgo+ID4+Pj4+IGlmIHRoYXQncyB0cnVlLCBsZXQncyBtb3ZlIHRvIHRoZSBzdGFuZGFyZGl6
aW5nIG9mIHRoZSBzeXNmcyBpbnRlcmZhY2UuCj4gPj4+Pj4gKDEpIGNvbnRlbnQKPiA+Pj4+PiBj
b21tb24gcGFydDogKG11c3QpCj4gPj4+Pj4gICAgICAgLSBzb2Z0d2FyZV92ZXJzaW9uOiAoaW4g
bWFqb3IubWlub3IuYnVnZml4IHNjaGVtZSkgIAo+ID4+Pj4gVGhpcyBjYW4gbm90IHdvcmsgZm9y
IGRldmljZXMgd2hvc2UgZmVhdHVyZXMgY2FuIGJlIG5lZ290aWF0ZWQvYWR2ZXJ0aXNlZAo+ID4+
Pj4gaW5kZXBlbmRlbnRseS4gKEUuZyB2aXJ0aW8gZGV2aWNlcykKCkkgdGhvdWdodCB0aGUgJ3Nv
ZnR3YXJlX3ZlcnNpb24nIHdhcyBzdXBwb3NlZCB0byBkZXNjcmliZSBraW5kIG9mIGEKJ3Byb3Rv
Y29sIHZlcnNpb24nIGZvciB0aGUgZGF0YSB3ZSB0cmFuc21pdD8gSS5lLiwgeW91IGFkZCBhIG5l
dyBmaWVsZCwKeW91IGJ1bXAgdGhlIHZlcnNpb24gbnVtYmVyLgoKPiA+Pj4+ICAKPiA+Pj4gc29y
cnksIEkgZG9uJ3QgdW5kZXJzdGFuZCBoZXJlLCB3aHkgdmlydGlvIGRldmljZXMgbmVlZCB0byB1
c2UgdmZpbyBpbnRlcmZhY2U/ICAKPiA+Pgo+ID4+IEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gdGhh
dCB2aXJ0aW8gZGV2aWNlcyBjYW4ndCBiZSB1c2VkIGJ5IFZGSU8uIERvIHlvdT8KPiA+Pgo+ID4+
IEFjdHVhbGx5LCB2aXJ0aW8gZGV2aWNlcyBoYXZlIGJlZW4gdXNlZCBieSBWRklPIGZvciBtYW55
IHllYXJzOgo+ID4+Cj4gPj4gLSBwYXNzdGhyb3VnaCBhIGhhcmR3YXJlIHZpcnRpbyBkZXZpY2Vz
IHRvIHVzZXJzcGFjZShWTSkgZHJpdmVycwo+ID4+IC0gdXNpbmcgdmlydGlvIFBNRCBpbnNpZGUg
Z3Vlc3QKPiA+PiAgCj4gPiBTbywgd2hhdCdzIGRpZmZlcmVudCBmb3IgaXQgdnMgcGFzc2luZyB0
aHJvdWdoIGEgcGh5c2ljYWwgaGFyZHdhcmUgdmlhIFZGSU8/ICAKPiAKPiAKPiBUaGUgZGlmZmVy
ZW5jZSBpcyBpbiB0aGUgZ3Vlc3QsIHRoZSBkZXZpY2UgY291bGQgYmUgZWl0aGVyIHJlYWwgaGFy
ZHdhcmUgCj4gb3IgZW11bGF0ZWQgb25lcy4KPiAKPiAKPiA+IGV2ZW4gdGhvdWdoIHRoZSBmZWF0
dXJlcyBhcmUgbmVnb3RpYXRlZCBkeW5hbWljYWxseSwgY291bGQgeW91IGV4cGxhaW4KPiA+IHdo
eSBpdCB3b3VsZCBjYXVzZSBzb2Z0d2FyZV92ZXJzaW9uIG5vdCB3b3JrPyAgCj4gCj4gCj4gVmly
dGlvIGRldmljZSAxIHN1cHBvcnRzIGZlYXR1cmUgQSwgQiwgQwo+IFZpcnRpbyBkZXZpY2UgMiBz
dXBwb3J0cyBmZWF0dXJlIEIsIEMsIEQKPiAKPiBTbyB5b3UgY2FuJ3QgbWlncmF0ZSBhIGd1ZXN0
IGZyb20gZGV2aWNlIDEgdG8gZGV2aWNlIDIuIEFuZCBpdCdzIAo+IGltcG9zc2libGUgdG8gbW9k
ZWwgdGhlIGZlYXR1cmVzIHdpdGggdmVyc2lvbnMuCgpXZSdyZSB0YWxraW5nIGFib3V0IHRoZSBm
ZWF0dXJlcyBvZmZlcmVkIGJ5IHRoZSBkZXZpY2UsIHJpZ2h0PyBXb3VsZCBpdApiZSBzdWZmaWNp
ZW50IHRvIG1hbmRhdGUgdGhhdCB0aGUgdGFyZ2V0IGRldmljZSBzdXBwb3J0cyB0aGUgc2FtZQpm
ZWF0dXJlcyBvciBhIHN1cGVyc2V0IG9mIHRoZSBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgdGhlIHNv
dXJjZSBkZXZpY2U/Cgo+IAo+IAo+ID4KPiA+ICAKPiA+Pj4gSSB0aGluayB0aGlzIHRocmVhZCBp
cyBkaXNjdXNzaW5nIGFib3V0IHZmaW8gcmVsYXRlZCBkZXZpY2VzLgo+ID4+PiAgCj4gPj4+Pj4g
ICAgICAgLSBkZXZpY2VfYXBpOiB2ZmlvLXBjaSBvciB2ZmlvLWNjdyAuLi4KPiA+Pj4+PiAgICAg
ICAtIHR5cGU6IG1kZXYgdHlwZSBmb3IgbWRldiBkZXZpY2Ugb3IKPiA+Pj4+PiAgICAgICAgICAg
ICAgIGEgc2lnbmF0dXJlIGZvciBwaHlzaWNhbCBkZXZpY2Ugd2hpY2ggaXMgYSBjb3VudGVycGFy
dCBmb3IKPiA+Pj4+PiAJICAgbWRldiB0eXBlLgo+ID4+Pj4+Cj4gPj4+Pj4gZGV2aWNlIGFwaSBz
cGVjaWZpYyBwYXJ0OiAobXVzdCkKPiA+Pj4+PiAgICAgIC0gcGNpIGlkOiBwY2kgaWQgb2YgbWRl
diBwYXJlbnQgZGV2aWNlIG9yIHBjaSBpZCBvZiBwaHlzaWNhbCBwY2kKPiA+Pj4+PiAgICAgICAg
ZGV2aWNlIChkZXZpY2VfYXBpIGlzIHZmaW8tcGNpKUFQSSBoZXJlLiAgCj4gPj4+PiBTbyB0aGlz
IGFzc3VtZXMgYSBQQ0kgZGV2aWNlIHdoaWNoIGlzIHByb2JhYmx5IG5vdCB0cnVlLgo+ID4+Pj4g
IAo+ID4+PiBmb3IgZGV2aWNlX2FwaSBvZiB2ZmlvLXBjaSwgd2h5IGl0J3Mgbm90IHRydWU/Cj4g
Pj4+Cj4gPj4+IGZvciB2ZmlvLWNjdywgaXQncyBzdWJjaGFubmVsX3R5cGUuICAKPiA+Pgo+ID4+
IE9rIGJ1dCBoYXZpbmcgdHdvIGRpZmZlcmVudCBhdHRyaWJ1dGVzIGZvciB0aGUgc2FtZSBmaWxl
IGlzIG5vdCBnb29kIGlkZWEuCj4gPj4gSG93IG1nbXQga25vdyB0aGVyZSB3aWxsIGJlIGEgM3Jk
IHR5cGU/ICAKPiA+IHRoYXQncyB3aHkgc29tZSBhdHRyaWJ1dGVzIG5lZWQgdG8gYmUgY29tbW9u
LiBlLmcuCj4gPiBkZXZpY2VfYXBpOiBpdCdzIGNvbW1vbiBiZWNhdXNlIG1nbXQgbmVlZCB0byBr
bm93IGl0J3MgYSBwY2kgZGV2aWNlIG9yIGEKPiA+ICAgICAgICAgICAgICBjY3cgZGV2aWNlLiBh
bmQgdGhlIGFwaSB0eXBlIGlzIGFscmVhZHkgZGVmaW5lZCB2ZmlvLmguCj4gPiAJICAgIChUaGUg
ZmllbGQgaXMgYWdyZWVkIGJ5IGFuZCBhY3R1YWxseSBzdWdnZXN0ZWQgYnkgQWxleCBpbiBwcmV2
aW91cyBtYWlsKQo+ID4gdHlwZTogbWRldl90eXBlIGZvciBtZGV2LiBpZiBtZ210IGRvZXMgbm90
IHVuZGVyc3RhbmQgaXQsIGl0IHdvdWxkIG5vdAo+ID4gICAgICAgIGJlIGFibGUgdG8gY3JlYXRl
IG9uZSBjb21wYXRpYmxlIG1kZXYgZGV2aWNlLgo+ID4gc29mdHdhcmVfdmVyc2lvbjogbWdtdCBj
YW4gY29tcGFyZSB0aGUgbWFqb3IgYW5kIG1pbm9yIGlmIGl0IHVuZGVyc3RhbmRzCj4gPiAgICAg
ICAgdGhpcyBmaWVsZHMuICAKPiAKPiAKPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwgaWYg
eW91IGNhbiBkZXNjcmliZSBob3cgbWdtdCBpcyBleHBlY3RlZCB0byAKPiB3b3JrIHN0ZXAgYnkg
c3RlcCB3aXRoIHRoZSBwcm9wb3NlZCBzeXNmcyBBUEkuIFRoaXMgY2FuIGhlbHAgcGVvcGxlIHRv
IAo+IHVuZGVyc3RhbmQuCgpNeSBwcm9wb3NhbCB3b3VsZCBiZToKLSBjaGVjayB0aGF0IGRldmlj
ZV9hcGkgbWF0Y2hlcwotIGNoZWNrIHBvc3NpYmxlIGRldmljZV9hcGkgc3BlY2lmaWMgYXR0cmli
dXRlcwotIGNoZWNrIHRoYXQgdHlwZSBtYXRjaGVzIFtJIGRvbid0IHRoaW5rIHRoZSBjb21iaW5h
dGlvbiBvZiBtZGV2IHR5cGVzCiAgYW5kIGFub3RoZXIgYXR0cmlidXRlIHRvIGRldGVybWluZSBj
b21wYXRpYmlsaXR5IGlzIGEgZ29vZCBpZGVhOwogIGFjdHVhbGx5LCB0aGUgY3VycmVudCBwcm9w
b3NhbCBjb25mdXNlcyBtZSBldmVyeSB0aW1lIEkgbG9vayBhdCBpdF0KLSBjaGVjayB0aGF0IHNv
ZnR3YXJlX3ZlcnNpb24gaXMgY29tcGF0aWJsZSwgYXNzdW1pbmcgc2VtYW50aWMKICB2ZXJzaW9u
aW5nCi0gY2hlY2sgcG9zc2libGUgdHlwZS1zcGVjaWZpYyBhdHRyaWJ1dGVzCgo+IAo+IFRoYW5r
cyBmb3IgdGhlIHBhdGllbmNlLiBTaW5jZSBzeXNmcyBpcyB1QUJJLCB3aGVuIGFjY2VwdGVkLCB3
ZSBuZWVkIAo+IHN1cHBvcnQgaXQgZm9yZXZlci4gVGhhdCdzIHdoeSB3ZSBuZWVkIHRvIGJlIGNh
cmVmdWwuCgpOb2QuCgooLi4uKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
