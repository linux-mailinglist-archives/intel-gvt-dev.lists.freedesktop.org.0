Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E9249799
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380D989B49;
	Wed, 19 Aug 2020 07:40:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183D289B49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597822820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uC3DFGkVt6r3mSTVqrFKRNpwFY1Onb0LazyhOhPaXvo=;
 b=axDbRtqi9Zn0/1KL7pIHB0Iy5RKzPuY+cBsI0wcOBiTZa9yf7QtbJZJ/YMh2mroyPva8Mh
 m8RjchHD36P3aAP1yrGek5rzFs3hihSMDfcV6o93m6nSgHpxUpqtjOxVcSLbGfbl6TTc8F
 RJZwKhDF28AyboxUxJBHwXH7fCZt1e4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-Vn1j6-jPN3Km2E2YjnB73w-1; Wed, 19 Aug 2020 03:40:18 -0400
X-MC-Unique: Vn1j6-jPN3Km2E2YjnB73w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333631084C84;
 Wed, 19 Aug 2020 07:40:14 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C91B59;
 Wed, 19 Aug 2020 07:39:51 +0000 (UTC)
Subject: Re: [ovirt-devel] Re: device compatibility interface for live
 migration with assigned devices
To: Yan Zhao <yan.y.zhao@intel.com>
References: <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
 <e20812b7-994b-b7f9-2df4-a78c4d116c7f@redhat.com>
 <20200819065951.GB21172@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d6f9a51e-80b3-44c5-2656-614b327dc080@redhat.com>
Date: Wed, 19 Aug 2020 15:39:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819065951.GB21172@joy-OptiPlex-7040>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>,
 Alex Williamson <alex.williamson@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "sm ooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOSDkuIvljYgyOjU5LCBZYW4gWmhhbyB3cm90ZToKPiBPbiBXZWQsIEF1ZyAx
OSwgMjAyMCBhdCAwMjo1NzozNFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDIw
LzgvMTkg5LiK5Y2IMTE6MzAsIFlhbiBaaGFvIHdyb3RlOgo+Pj4gaGkgQWxsLAo+Pj4gY291bGQg
d2UgZGVjaWRlIHRoYXQgc3lzZnMgaXMgdGhlIGludGVyZmFjZSB0aGF0IGV2ZXJ5IFZGSU8gdmVu
ZG9yIGRyaXZlcgo+Pj4gbmVlZHMgdG8gcHJvdmlkZSBpbiBvcmRlciB0byBzdXBwb3J0IHZmaW8g
bGl2ZSBtaWdyYXRpb24sIG90aGVyd2lzZSB0aGUKPj4+IHVzZXJzcGFjZSBtYW5hZ2VtZW50IHRv
b2wgd291bGQgbm90IGxpc3QgdGhlIGRldmljZSBpbnRvIHRoZSBjb21wYXRpYmxlCj4+PiBsaXN0
Pwo+Pj4KPj4+IGlmIHRoYXQncyB0cnVlLCBsZXQncyBtb3ZlIHRvIHRoZSBzdGFuZGFyZGl6aW5n
IG9mIHRoZSBzeXNmcyBpbnRlcmZhY2UuCj4+PiAoMSkgY29udGVudAo+Pj4gY29tbW9uIHBhcnQ6
IChtdXN0KQo+Pj4gICAgICAtIHNvZnR3YXJlX3ZlcnNpb246IChpbiBtYWpvci5taW5vci5idWdm
aXggc2NoZW1lKQo+Pgo+PiBUaGlzIGNhbiBub3Qgd29yayBmb3IgZGV2aWNlcyB3aG9zZSBmZWF0
dXJlcyBjYW4gYmUgbmVnb3RpYXRlZC9hZHZlcnRpc2VkCj4+IGluZGVwZW5kZW50bHkuIChFLmcg
dmlydGlvIGRldmljZXMpCj4+Cj4gc29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCBoZXJlLCB3aHkg
dmlydGlvIGRldmljZXMgbmVlZCB0byB1c2UgdmZpbyBpbnRlcmZhY2U/CgoKSSBkb24ndCBzZWUg
YW55IHJlYXNvbiB0aGF0IHZpcnRpbyBkZXZpY2VzIGNhbid0IGJlIHVzZWQgYnkgVkZJTy4gRG8g
eW91PwoKQWN0dWFsbHksIHZpcnRpbyBkZXZpY2VzIGhhdmUgYmVlbiB1c2VkIGJ5IFZGSU8gZm9y
IG1hbnkgeWVhcnM6CgotIHBhc3N0aHJvdWdoIGEgaGFyZHdhcmUgdmlydGlvIGRldmljZXMgdG8g
dXNlcnNwYWNlKFZNKSBkcml2ZXJzCi0gdXNpbmcgdmlydGlvIFBNRCBpbnNpZGUgZ3Vlc3QKCgo+
IEkgdGhpbmsgdGhpcyB0aHJlYWQgaXMgZGlzY3Vzc2luZyBhYm91dCB2ZmlvIHJlbGF0ZWQgZGV2
aWNlcy4KPgo+Pj4gICAgICAtIGRldmljZV9hcGk6IHZmaW8tcGNpIG9yIHZmaW8tY2N3IC4uLgo+
Pj4gICAgICAtIHR5cGU6IG1kZXYgdHlwZSBmb3IgbWRldiBkZXZpY2Ugb3IKPj4+ICAgICAgICAg
ICAgICBhIHNpZ25hdHVyZSBmb3IgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIGEgY291bnRlcnBh
cnQgZm9yCj4+PiAJICAgbWRldiB0eXBlLgo+Pj4KPj4+IGRldmljZSBhcGkgc3BlY2lmaWMgcGFy
dDogKG11c3QpCj4+PiAgICAgLSBwY2kgaWQ6IHBjaSBpZCBvZiBtZGV2IHBhcmVudCBkZXZpY2Ug
b3IgcGNpIGlkIG9mIHBoeXNpY2FsIHBjaQo+Pj4gICAgICAgZGV2aWNlIChkZXZpY2VfYXBpIGlz
IHZmaW8tcGNpKUFQSSBoZXJlLgo+Pgo+PiBTbyB0aGlzIGFzc3VtZXMgYSBQQ0kgZGV2aWNlIHdo
aWNoIGlzIHByb2JhYmx5IG5vdCB0cnVlLgo+Pgo+IGZvciBkZXZpY2VfYXBpIG9mIHZmaW8tcGNp
LCB3aHkgaXQncyBub3QgdHJ1ZT8KPgo+IGZvciB2ZmlvLWNjdywgaXQncyBzdWJjaGFubmVsX3R5
cGUuCgoKT2sgYnV0IGhhdmluZyB0d28gZGlmZmVyZW50IGF0dHJpYnV0ZXMgZm9yIHRoZSBzYW1l
IGZpbGUgaXMgbm90IGdvb2QgCmlkZWEuIEhvdyBtZ210IGtub3cgdGhlcmUgd2lsbCBiZSBhIDNy
ZCB0eXBlPwoKCj4KPj4+ICAgICAtIHN1YmNoYW5uZWxfdHlwZSAoZGV2aWNlX2FwaSBpcyB2Zmlv
LWNjdykKPj4+IHZlbmRvciBkcml2ZXIgc3BlY2lmaWMgcGFydDogKG9wdGlvbmFsKQo+Pj4gICAg
IC0gYWdncmVnYXRvcgo+Pj4gICAgIC0gY2hwaWRfdHlwZQo+Pj4gICAgIC0gcmVtb3RlX3VybAo+
Pgo+PiBGb3IgInJlbW90ZV91cmwiLCBqdXN0IHdvbmRlciBpZiBpdCdzIGJldHRlciB0byBpbnRl
Z3JhdGUgb3IgcmV1c2UgdGhlCj4+IGV4aXN0aW5nIE5WTUUgbWFuYWdlbWVudCBpbnRlcmZhY2Ug
aW5zdGVhZCBvZiBkdXBsaWNhdGluZyBpdCBoZXJlLiBPdGhlcndpc2UKPj4gaXQgY291bGQgYmUg
YSBidXJkZW4gZm9yIG1nbXQgdG8gbGVhcm4uIEUuZyB2ZW5kb3IgQSBtYXkgdXNlICJyZW1vdGVf
dXJsIgo+PiBidXQgdmVuZG9yIEIgbWF5IHVzZSBhIGRpZmZlcmVudCBhdHRyaWJ1dGUuCj4+Cj4g
aXQncyB2ZW5kb3IgZHJpdmVyIHNwZWNpZmljLgo+IHZlbmRvciBzcGVjaWZpYyBhdHRyaWJ1dGVz
IGFyZSBpbmV2aXRhYmxlLCBhbmQgdGhhdCdzIHdoeSB3ZSBhcmUKPiBkaXNjdXNzaW5nIGhlcmUg
b2YgYSB3YXkgdG8gc3RhbmRhcmRpemluZyBvZiBpdC4KCgpXZWxsLCB0aGVuIHlvdSB3aWxsIGVu
ZCB1cCB3aXRoIGEgdmVyeSBsb25nIGxpc3QgdG8gZGlzY3Vzcy4gRS5nIGZvciAKbmV0d29ya2lu
ZyBkZXZpY2VzLCB5b3Ugd2lsbCBoYXZlICJtYWMiLCAidih4KWxhbiIgYW5kIGEgbG90IG9mIG90
aGVyLgoKTm90ZSB0aGF0ICJyZW1vdGVfdXJsIiBpcyBub3QgdmVuZG9yIHNwZWNpZmljIGJ1dCBO
Vk1FIChjbGFzcy9zdWJzeXN0ZW0pIApzcGVjaWZpYy4KClRoZSBwb2ludCBpcyB0aGF0IGlmIHZl
bmRvci9jbGFzcyBzcGVjaWZpYyBwYXJ0IGlzIHVuYXZvaWRhYmxlLCB3aHkgbm90IAptYWtpbmcg
YWxsIG9mIHRoZSBhdHRyaWJ1dGVzIHZlbmRvciBzcGVjaWZpYz8KCgo+IG91ciBnb2FsIGlzIHRo
YXQgbWdtdCBjYW4gdXNlIGl0IHdpdGhvdXQgdW5kZXJzdGFuZGluZyB0aGUgbWVhbmluZyBvZiB2
ZW5kb3IKPiBzcGVjaWZpYyBhdHRyaWJ1dGVzLgoKCkknbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSBj
b3JyZWN0IGRlc2lnbiBvZiB1QVBJLiBJcyB0aGVyZSBzb21ldGhpbmcgCnNpbWlsYXIgaW4gdGhl
IGV4aXN0aW5nIHVBUElzPwoKQW5kIGl0IG1pZ2h0IGJlIGhhcmQgdG8gd29yayBmb3IgdmlydGlv
IGRldmljZXMuCgoKPgo+Pj4gTk9URTogdmVuZG9ycyBhcmUgZnJlZSB0byBhZGQgYXR0cmlidXRl
cyBpbiB0aGlzIHBhcnQgd2l0aCBhCj4+PiByZXN0cmljdGlvbiB0aGF0IHRoaXMgYXR0cmlidXRl
IGlzIGFibGUgdG8gYmUgY29uZmlndXJlZCB3aXRoIHRoZSBzYW1lCj4+PiBuYW1lIGluIHN5c2Zz
IHRvby4gZS5nLgo+Pgo+PiBTeXNmcyB3b3JrcyB3ZWxsIGZvciBjb21tb24gYXR0cmlidXRlcyBi
ZWxvbmdzIHRvIGEgY2xhc3MsIGJ1dCBJJ20gbm90IHN1cmUKPj4gaXQgY2FuIHdvcmsgd2VsbCBm
b3IgZGV2aWNlL3ZlbmRvciBzcGVjaWZpYyBhdHRyaWJ1dGVzLiBEb2VzIHRoaXMgbWVhbiBtZ210
Cj4+IG5lZWQgdG8gaXRlcmF0ZSBhbGwgdGhlIGF0dHJpYnV0ZXMgaW4gYm90aCBzcmMgYW5kIGRz
dD8KPj4KPiBuby4ganVzdCBhdHRyaWJ1dGVzIHVuZGVyIG1pZ3JhdGlvbiBkaXJlY3RvcnkuCj4K
Pj4+IGZvciBhZ2dyZWdhdG9yLCB0aGVyZSBtdXN0IGJlIGEgc3lzZnMgYXR0cmlidXRlIGluIGRl
dmljZSBub2RlCj4+PiAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjAyLjAvODgyY2M0
ZGEtZGVkZS0xMWU3LTkxODAtMDc4YTYyMDYzYWIxL2ludGVsX3ZncHUvYWdncmVnYXRvciwKPj4+
IHNvIHRoYXQgdGhlIHVzZXJzcGFjZSB0b29sIGlzIGFibGUgdG8gY29uZmlndXJlIHRoZSB0YXJn
ZXQgZGV2aWNlCj4+PiBhY2NvcmRpbmcgdG8gc291cmNlIGRldmljZSdzIGFnZ3JlZ2F0b3IgYXR0
cmlidXRlLgo+Pj4KPj4+Cj4+PiAoMikgd2hlcmUgYW5kIHN0cnVjdHVyZQo+Pj4gcHJvcG9zYWwg
MToKPj4+IHwtIFtwYXRoIHRvIGRldmljZV0KPj4+ICAgICB8LS0tIG1pZ3JhdGlvbgo+Pj4gICAg
IHwgICAgIHwtLS0gc2VsZgo+Pj4gICAgIHwgICAgIHwgICAgfC1zb2Z0d2FyZV92ZXJzaW9uCj4+
PiAgICAgfCAgICAgfCAgICB8LWRldmljZV9hcGkKPj4+ICAgICB8ICAgICB8ICAgIHwtdHlwZQo+
Pj4gICAgIHwgICAgIHwgICAgfC1bcGNpX2lkIG9yIHN1YmNoYW5uZWxfdHlwZV0KPj4+ICAgICB8
ICAgICB8ICAgIHwtPGFnZ3JlZ2F0b3Igb3IgY2hwaWRfdHlwZT4KPj4+ICAgICB8ICAgICB8LS0t
IGNvbXBhdGlibGUKPj4+ICAgICB8ICAgICB8ICAgIHwtc29mdHdhcmVfdmVyc2lvbgo+Pj4gICAg
IHwgICAgIHwgICAgfC1kZXZpY2VfYXBpCj4+PiAgICAgfCAgICAgfCAgICB8LXR5cGUKPj4+ICAg
ICB8ICAgICB8ICAgIHwtW3BjaV9pZCBvciBzdWJjaGFubmVsX3R5cGVdCj4+PiAgICAgfCAgICAg
fCAgICB8LTxhZ2dyZWdhdG9yIG9yIGNocGlkX3R5cGU+Cj4+PiBtdWx0aXBsZSBjb21wYXRpYmxl
IGlzIGFsbG93ZWQuCj4+PiBhdHRyaWJ1dGVzIHNob3VsZCBiZSBBU0NJSSB0ZXh0IGZpbGVzLCBw
cmVmZXJhYmx5IHdpdGggb25seSBvbmUgdmFsdWUKPj4+IHBlciBmaWxlLgo+Pj4KPj4+Cj4+PiBw
cm9wb3NhbCAyOiB1c2UgYmluX2F0dHJpYnV0ZS4KPj4+IHwtIFtwYXRoIHRvIGRldmljZV0KPj4+
ICAgICB8LS0tIG1pZ3JhdGlvbgo+Pj4gICAgIHwgICAgIHwtLS0gc2VsZgo+Pj4gICAgIHwgICAg
IHwtLS0gY29tcGF0aWJsZQo+Pj4KPj4+IHNvIHdlIGNhbiBjb250aW51ZSB1c2UgbXVsdGlsaW5l
IGZvcm1hdC4gZS5nLgo+Pj4gY2F0IGNvbXBhdGlibGUKPj4+ICAgICBzb2Z0d2FyZV92ZXJzaW9u
PTAuMS4wCj4+PiAgICAgZGV2aWNlX2FwaT12ZmlvX3BjaQo+Pj4gICAgIHR5cGU9aTkxNS1HVlRn
X1Y1X3t2YWwxOmludDoxLDIsNCw4fQo+Pj4gICAgIHBjaV9pZD04MDg2NTk2Mwo+Pj4gICAgIGFn
Z3JlZ2F0b3I9e3ZhbDF9LzIKPj4KPj4gU28gYmFzaWNhbGx5IHR3byBxdWVzdGlvbnM6Cj4+Cj4+
IC0gaG93IGhhcmQgdG8gc3RhbmRhcmRpemUgc3lzZnMgQVBJIGZvciBkZWFsaW5nIHdpdGggY29t
cGF0aWJpbGl0eSBjaGVjayAodG8KPj4gbWFrZSBpdCB3b3JrIGZvciBtb3N0IHR5cGVzIG9mIGRl
dmljZXMpCj4gc29ycnksIEkganVzdCBrbm93IHdlIGFyZSBpbiB0aGUgcHJvY2VzcyBvZiBzdGFu
ZGFyZGl6aW5nIG9mIGl0IDopCgoKSXQncyBub3QgZWFzeS4gQXMgSSBzYWlkLCB0aGUgY3VycmVu
dCBkZXNpZ24gY2FuJ3Qgd29yayBmb3IgdmlydGlvIApkZXZpY2VzIGFuZCBpdCdzIG5vdCBoYXJk
IHRvIGZpbmQgb3RoZXIgZXhhbXBsZXMuIEkgcmVtZW1iZXIgc29tZSBJbnRlbCAKZGV2aWNlcyBo
YXZlIGJpdG1hc2sgYmFzZWQgY2FwYWJpbGl0eSByZWdpc3RlcnMuCgoKPgo+PiAtIGhvdyBoYXJk
IGZvciB0aGUgbWdtdCB0byBsZWFybiB3aXRoIGEgdmVuZG9yIHNwZWNpZmljIGF0dHJpYnV0ZXMg
KHZzCj4+IGV4aXN0aW5nIG1hbmFnZW1lbnQgQVBJKQo+IHdoYXQgaXMgZXhpc3RpbmcgbWFuYWdl
bWVudCBBUEk/CgoKSXQgZGVwZW5kcyBvbiB0aGUgdHlwZSBvZiBkZXZpY2VzLiBFLmcgZm9yIE5W
TUUsIHdlJ3ZlIGFscmVhZHkgaGFkIG9uZSAKKC9zeXMva2VybmVsL2NvbmZpZy9udm1lKT8KClRo
YW5rcwoKCj4KPiBUaGFua3MKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
