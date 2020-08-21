Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589924D7B5
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Aug 2020 16:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2766EAD4;
	Fri, 21 Aug 2020 14:53:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8DB6EAD4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Aug 2020 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598021630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+G3KHb4rQe19R7RlyzME5Iwtog78d40PK1swrnN7NE=;
 b=YIPVxIORz7ZXjDZiZ/ZRHbZ/4MJWuVOSR4TK2CFh5j6lq7s4PS0pco8+zaI6fxl7g2S7V7
 xFYxxR+zgmkAeyOjqsSp2ZK6iirqosKg7k7BuJafyWjgPXmeFQ41H4YBZBhym5+AWtznbu
 hsdGoDIeGSWsSsdJrrklduo1W/Q2ynw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-5OzMXm_lMzmwxIZutT_EsQ-1; Fri, 21 Aug 2020 10:53:48 -0400
X-MC-Unique: 5OzMXm_lMzmwxIZutT_EsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB17801AFB;
 Fri, 21 Aug 2020 14:53:30 +0000 (UTC)
Received: from gondolin (ovpn-113-4.ams2.redhat.com [10.36.113.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 293B75DE50;
 Fri, 21 Aug 2020 14:52:58 +0000 (UTC)
Date: Fri, 21 Aug 2020 16:52:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [ovirt-devel] Re: device compatibility interface for live
 migration with assigned devices
Message-ID: <20200821165255.53e26628.cohuck@redhat.com>
In-Reply-To: <ea0e84c5-733a-2bdb-4c1e-95fd16698ed8@redhat.com>
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
 <20200820142740.6513884d.cohuck@redhat.com>
 <ea0e84c5-733a-2bdb-4c1e-95fd16698ed8@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

T24gRnJpLCAyMSBBdWcgMjAyMCAxMToxNDo0MSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMjAyMC84LzIwIOS4i+WNiDg6MjcsIENvcm5lbGlhIEh1
Y2sgd3JvdGU6Cj4gPiBPbiBXZWQsIDE5IEF1ZyAyMDIwIDE3OjI4OjM4ICswODAwCj4gPiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ICAKPiA+PiBPbiAyMDIwLzgv
MTkg5LiL5Y2INDoxMywgWWFuIFpoYW8gd3JvdGU6ICAKPiA+Pj4gT24gV2VkLCBBdWcgMTksIDIw
MjAgYXQgMDM6Mzk6NTBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZTogIAo+ID4+Pj4gT24gMjAy
MC84LzE5IOS4i+WNiDI6NTksIFlhbiBaaGFvIHdyb3RlOiAgCj4gPj4+Pj4gT24gV2VkLCBBdWcg
MTksIDIwMjAgYXQgMDI6NTc6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZTogIAo+ID4+Pj4+
PiBPbiAyMDIwLzgvMTkg5LiK5Y2IMTE6MzAsIFlhbiBaaGFvIHdyb3RlOiAgCj4gPj4+Pj4+PiBo
aSBBbGwsCj4gPj4+Pj4+PiBjb3VsZCB3ZSBkZWNpZGUgdGhhdCBzeXNmcyBpcyB0aGUgaW50ZXJm
YWNlIHRoYXQgZXZlcnkgVkZJTyB2ZW5kb3IgZHJpdmVyCj4gPj4+Pj4+PiBuZWVkcyB0byBwcm92
aWRlIGluIG9yZGVyIHRvIHN1cHBvcnQgdmZpbyBsaXZlIG1pZ3JhdGlvbiwgb3RoZXJ3aXNlIHRo
ZQo+ID4+Pj4+Pj4gdXNlcnNwYWNlIG1hbmFnZW1lbnQgdG9vbCB3b3VsZCBub3QgbGlzdCB0aGUg
ZGV2aWNlIGludG8gdGhlIGNvbXBhdGlibGUKPiA+Pj4+Pj4+IGxpc3Q/Cj4gPj4+Pj4+Pgo+ID4+
Pj4+Pj4gaWYgdGhhdCdzIHRydWUsIGxldCdzIG1vdmUgdG8gdGhlIHN0YW5kYXJkaXppbmcgb2Yg
dGhlIHN5c2ZzIGludGVyZmFjZS4KPiA+Pj4+Pj4+ICgxKSBjb250ZW50Cj4gPj4+Pj4+PiBjb21t
b24gcGFydDogKG11c3QpCj4gPj4+Pj4+PiAgICAgICAgLSBzb2Z0d2FyZV92ZXJzaW9uOiAoaW4g
bWFqb3IubWlub3IuYnVnZml4IHNjaGVtZSkgIAo+ID4+Pj4+PiBUaGlzIGNhbiBub3Qgd29yayBm
b3IgZGV2aWNlcyB3aG9zZSBmZWF0dXJlcyBjYW4gYmUgbmVnb3RpYXRlZC9hZHZlcnRpc2VkCj4g
Pj4+Pj4+IGluZGVwZW5kZW50bHkuIChFLmcgdmlydGlvIGRldmljZXMpICAKPiA+IEkgdGhvdWdo
dCB0aGUgJ3NvZnR3YXJlX3ZlcnNpb24nIHdhcyBzdXBwb3NlZCB0byBkZXNjcmliZSBraW5kIG9m
IGEKPiA+ICdwcm90b2NvbCB2ZXJzaW9uJyBmb3IgdGhlIGRhdGEgd2UgdHJhbnNtaXQ/IEkuZS4s
IHlvdSBhZGQgYSBuZXcgZmllbGQsCj4gPiB5b3UgYnVtcCB0aGUgdmVyc2lvbiBudW1iZXIuICAK
PiAKPiAKPiBPaywgYnV0IHNpbmNlIHdlIG1hbmRhdGUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBv
ZiB1QUJJLCBpcyB0aGlzIHJlYWxseSAKPiB3b3J0aCB0byBoYXZlIGEgdmVyc2lvbiBmb3Igc3lz
ZnM/IChTZWFyY2hpbmcgb24gc3lzZnMgc2hvd3Mgbm8gZXhhbXBsZXMgCj4gbGlrZSB0aGlzKQoK
SSB3YXMgbm90IHRoaW5raW5nIGFib3V0IHRoZSBzeXNmcyBpbnRlcmZhY2UsIGJ1dCByYXRoZXIg
YWJvdXQgdGhlIGRhdGEKdGhhdCBpcyBzZW50IG92ZXIgd2hpbGUgbWlncmF0aW5nLiBFLmcuIHdl
IGZpbmQgb3V0IHRoYXQgc2VuZGluZyBzb21lCmF1eGlsaWFyeSBkYXRhIGlzIGEgZ29vZCBpZGVh
IGFuZCBidW1wIHRvIHZlcnNpb24gMS4xLjA7IHZlcnNpb24gMS4wLjAKY2Fubm90IGRlYWwgd2l0
aCB0aGUgZXh0cmEgZGF0YSwgYnV0IHZlcnNpb24gMS4xLjAgY2FuIGRlYWwgd2l0aCB0aGUKb2xk
ZXIgZGF0YSBzdHJlYW0uCgooLi4uKQoKPiA+Pj4+Pj4+ICAgICAgICAtIGRldmljZV9hcGk6IHZm
aW8tcGNpIG9yIHZmaW8tY2N3IC4uLgo+ID4+Pj4+Pj4gICAgICAgIC0gdHlwZTogbWRldiB0eXBl
IGZvciBtZGV2IGRldmljZSBvcgo+ID4+Pj4+Pj4gICAgICAgICAgICAgICAgYSBzaWduYXR1cmUg
Zm9yIHBoeXNpY2FsIGRldmljZSB3aGljaCBpcyBhIGNvdW50ZXJwYXJ0IGZvcgo+ID4+Pj4+Pj4g
CSAgIG1kZXYgdHlwZS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBkZXZpY2UgYXBpIHNwZWNpZmljIHBh
cnQ6IChtdXN0KQo+ID4+Pj4+Pj4gICAgICAgLSBwY2kgaWQ6IHBjaSBpZCBvZiBtZGV2IHBhcmVu
dCBkZXZpY2Ugb3IgcGNpIGlkIG9mIHBoeXNpY2FsIHBjaQo+ID4+Pj4+Pj4gICAgICAgICBkZXZp
Y2UgKGRldmljZV9hcGkgaXMgdmZpby1wY2kpQVBJIGhlcmUuICAKPiA+Pj4+Pj4gU28gdGhpcyBh
c3N1bWVzIGEgUENJIGRldmljZSB3aGljaCBpcyBwcm9iYWJseSBub3QgdHJ1ZS4KPiA+Pj4+Pj4g
ICAgIAo+ID4+Pj4+IGZvciBkZXZpY2VfYXBpIG9mIHZmaW8tcGNpLCB3aHkgaXQncyBub3QgdHJ1
ZT8KPiA+Pj4+Pgo+ID4+Pj4+IGZvciB2ZmlvLWNjdywgaXQncyBzdWJjaGFubmVsX3R5cGUuICAK
PiA+Pj4+IE9rIGJ1dCBoYXZpbmcgdHdvIGRpZmZlcmVudCBhdHRyaWJ1dGVzIGZvciB0aGUgc2Ft
ZSBmaWxlIGlzIG5vdCBnb29kIGlkZWEuCj4gPj4+PiBIb3cgbWdtdCBrbm93IHRoZXJlIHdpbGwg
YmUgYSAzcmQgdHlwZT8gIAo+ID4+PiB0aGF0J3Mgd2h5IHNvbWUgYXR0cmlidXRlcyBuZWVkIHRv
IGJlIGNvbW1vbi4gZS5nLgo+ID4+PiBkZXZpY2VfYXBpOiBpdCdzIGNvbW1vbiBiZWNhdXNlIG1n
bXQgbmVlZCB0byBrbm93IGl0J3MgYSBwY2kgZGV2aWNlIG9yIGEKPiA+Pj4gICAgICAgICAgICAg
ICBjY3cgZGV2aWNlLiBhbmQgdGhlIGFwaSB0eXBlIGlzIGFscmVhZHkgZGVmaW5lZCB2ZmlvLmgu
Cj4gPj4+IAkgICAgKFRoZSBmaWVsZCBpcyBhZ3JlZWQgYnkgYW5kIGFjdHVhbGx5IHN1Z2dlc3Rl
ZCBieSBBbGV4IGluIHByZXZpb3VzIG1haWwpCj4gPj4+IHR5cGU6IG1kZXZfdHlwZSBmb3IgbWRl
di4gaWYgbWdtdCBkb2VzIG5vdCB1bmRlcnN0YW5kIGl0LCBpdCB3b3VsZCBub3QKPiA+Pj4gICAg
ICAgICBiZSBhYmxlIHRvIGNyZWF0ZSBvbmUgY29tcGF0aWJsZSBtZGV2IGRldmljZS4KPiA+Pj4g
c29mdHdhcmVfdmVyc2lvbjogbWdtdCBjYW4gY29tcGFyZSB0aGUgbWFqb3IgYW5kIG1pbm9yIGlm
IGl0IHVuZGVyc3RhbmRzCj4gPj4+ICAgICAgICAgdGhpcyBmaWVsZHMuICAKPiA+Pgo+ID4+IEkg
dGhpbmsgaXQgd291bGQgYmUgaGVscGZ1bCBpZiB5b3UgY2FuIGRlc2NyaWJlIGhvdyBtZ210IGlz
IGV4cGVjdGVkIHRvCj4gPj4gd29yayBzdGVwIGJ5IHN0ZXAgd2l0aCB0aGUgcHJvcG9zZWQgc3lz
ZnMgQVBJLiBUaGlzIGNhbiBoZWxwIHBlb3BsZSB0bwo+ID4+IHVuZGVyc3RhbmQuICAKPiA+IE15
IHByb3Bvc2FsIHdvdWxkIGJlOgo+ID4gLSBjaGVjayB0aGF0IGRldmljZV9hcGkgbWF0Y2hlcwo+
ID4gLSBjaGVjayBwb3NzaWJsZSBkZXZpY2VfYXBpIHNwZWNpZmljIGF0dHJpYnV0ZXMKPiA+IC0g
Y2hlY2sgdGhhdCB0eXBlIG1hdGNoZXMgW0kgZG9uJ3QgdGhpbmsgdGhlIGNvbWJpbmF0aW9uIG9m
IG1kZXYgdHlwZXMKPiA+ICAgIGFuZCBhbm90aGVyIGF0dHJpYnV0ZSB0byBkZXRlcm1pbmUgY29t
cGF0aWJpbGl0eSBpcyBhIGdvb2QgaWRlYTsgIAo+IAo+IAo+IEFueSByZWFzb24gZm9yIHRoaXM/
IEFjdHVhbGx5IGlmIHdlIG9ubHkgdXNlIG1kZXYgdHlwZSB0byBkZXRlY3QgdGhlIAo+IGNvbXBh
dGliaWxpdHksIGl0IHdvdWxkIGJlIG11Y2ggbW9yZSBlYXNpZXIuIE90aGVyd2lzZSwgd2UgYXJl
IGFjdHVhbGx5IAo+IHJlLWludmVudGluZyBtZGV2IHR5cGVzLgo+IAo+IEUuZyBjYW4gd2UgaGF2
ZSB0aGUgc2FtZSBtZGV2IHR5cGVzIHdpdGggZGlmZmVyZW50IGRldmljZV9hcGkgYW5kIG90aGVy
IAo+IGF0dHJpYnV0ZXM/CgpJbiB0aGUgZW5kLCB0aGUgbWRldiB0eXBlIGlzIHJlcHJlc2VudGVk
IGFzIGEgc3RyaW5nOyBidXQgSSdtIG5vdCBzdXJlCndlIGNhbiBleHBlY3QgdGhhdCB0d28gdHlw
ZXMgd2l0aCB0aGUgc2FtZSBuYW1lLCBidXQgYSBkaWZmZXJlbnQKZGV2aWNlX2FwaSBhcmUgcmVs
YXRlZCBpbiBhbnkgd2F5LgoKSWYgd2UgZS5nLiBjb21wYXJlIHZmaW8tcGNpIGFuZCB2ZmlvLWNj
dywgdGhleSBhcmUgZnVuZGFtZW50YWxseQpkaWZmZXJlbnQuCgpJIHdhcyBtb3N0bHkgY29uY2Vy
bmVkIGFib3V0IHRoZSBhZ2dyZWdhdGlvbiBwcm9wb3NhbCwgd2hlcmUgdHlwZSBBICsKYWdncmVn
YXRpb24gdmFsdWUgYiBtaWdodCBiZSBjb21wYXRpYmxlIHdpdGggdHlwZSBCICsgYWdncmVnYXRp
b24gdmFsdWUKYS4KCj4gCj4gCj4gPiAgICBhY3R1YWxseSwgdGhlIGN1cnJlbnQgcHJvcG9zYWwg
Y29uZnVzZXMgbWUgZXZlcnkgdGltZSBJIGxvb2sgYXQgaXRdCj4gPiAtIGNoZWNrIHRoYXQgc29m
dHdhcmVfdmVyc2lvbiBpcyBjb21wYXRpYmxlLCBhc3N1bWluZyBzZW1hbnRpYwo+ID4gICAgdmVy
c2lvbmluZwo+ID4gLSBjaGVjayBwb3NzaWJsZSB0eXBlLXNwZWNpZmljIGF0dHJpYnV0ZXMgIAo+
IAo+IAo+IEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHRvbyBjb21wbGljYXRlZC4gQW5kIEkgc3Vz
cGVjdCB0aGVyZSB3aWxsIGJlIAo+IHZlbmRvciBzcGVjaWZpYyBhdHRyaWJ1dGVzOgo+IAo+IC0g
Zm9yIGNvbXBhdGliaWxpdHkgY2hlY2s6IEkgdGhpbmsgd2Ugc2hvdWxkIGVpdGhlciBtb2RlbGlu
ZyBldmVyeXRoaW5nIAo+IHZpYSBtZGV2IHR5cGUgb3IgbWFraW5nIGl0IHRvdGFsbHkgdmVuZG9y
IHNwZWNpZmljLiBIYXZpbmcgc29tZXRoaW5nIGluIAo+IHRoZSBtaWRkbGUgd2lsbCBicmluZyBh
IGxvdCBvZiBidXJkZW4KCkZXSVcsIEknbSBmb3IgYSBzdHJpY3QgbWF0Y2ggb24gbWRldiB0eXBl
LCBhbmQgZmxleGliaWxpdHkgaW4gcGVyLXR5cGUKYXR0cmlidXRlcy4KCj4gLSBmb3IgcHJvdmlz
aW9uaW5nOiBpdCdzIHN0aWxsIG5vdCBjbGVhci4gQXMgc2hvd24gaW4gdGhpcyBwcm9wb3NhbCwg
Zm9yIAo+IE5WTUUgd2UgbWF5IG5lZWQgdG8gc2V0IHJlbW90ZV91cmwsIGJ1dCB1bmxlc3MgdGhl
cmUgd2lsbCBiZSBhIHN1YmNsYXNzIAo+IChOVk1FKSBpbiB0aGUgbWRldiAod2hpY2ggSSBndWVz
cyBub3QpLCB3ZSBjYW4ndCBwcmV2ZW50IHZlbmRvciBmcm9tIAo+IHVzaW5nIGFub3RoZXIgYXR0
cmlidXRlIG5hbWUsIGluIHRoaXMgY2FzZSwgdHJpY2tzIGxpa2UgYXR0cmlidXRlcyAKPiBpdGVy
YXRpb24gaW4gc29tZSBzdWIgZGlyZWN0b3J5IHdvbid0IHdvcmsuIFNvIGV2ZW4gaWYgd2UgaGFk
IHNvbWUgCj4gY29tbW9uIEFQSSBmb3IgY29tcGF0aWJpbGl0eSBjaGVjaywgdGhlIHByb3Zpc2lv
bmluZyBBUEkgaXMgc3RpbGwgdmVuZG9yIAo+IHNwZWNpZmljIC4uLgoKWWVzLCBJJ20gbm90IHN1
cmUgaG93IHRvIGRlYWwgd2l0aCB0aGUgInNhbWUgdGhpbmcgZm9yIGRpZmZlcmVudAp2ZW5kb3Jz
IiBwcm9ibGVtLiBXZSBjYW4gdHJ5IHRvIG1ha2Ugc3VyZSB0aGF0IGluLWtlcm5lbCBkcml2ZXJz
IHBsYXkKbmljZWx5LCBidXQgbm90IG11Y2ggbW9yZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
