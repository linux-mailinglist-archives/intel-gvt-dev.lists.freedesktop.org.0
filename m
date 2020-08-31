Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B920A2571FE
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Aug 2020 05:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E96A89E0E;
	Mon, 31 Aug 2020 03:08:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B2E89E0E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Aug 2020 03:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598843302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJUSyFAGtxYcMUIAK2A6tJE9bI47AKIWnz2EW0Z359s=;
 b=d8ofkARpHbuXY1Z4Co/uMXaAGwSWIadvo0Ac6Cq2rVzXXWAA8L2wbCBIbIFdDmJQIwHq25
 HgF01+3KpHzmkpIfbDFddBtRUksIB0hqLancD0ef6nuwWqrl51dA5YI0as4JONzB91fuo8
 PJW6+E2IyZE4h02q4J6mKOHIs99A8r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-luowdu28NMKyKl9wbnOv4A-1; Sun, 30 Aug 2020 23:08:17 -0400
X-MC-Unique: luowdu28NMKyKl9wbnOv4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB802807331;
 Mon, 31 Aug 2020 03:08:13 +0000 (UTC)
Received: from [10.72.13.227] (ovpn-13-227.pek2.redhat.com [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31D353A40;
 Mon, 31 Aug 2020 03:07:54 +0000 (UTC)
Subject: Re: [ovirt-devel] Re: device compatibility interface for live
 migration with assigned devices
To: Cornelia Huck <cohuck@redhat.com>
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
 <20200821165255.53e26628.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b9739032-9bc0-ec48-a4c7-36c055b91702@redhat.com>
Date: Mon, 31 Aug 2020 11:07:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821165255.53e26628.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8yMSDkuIvljYgxMDo1MiwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmks
IDIxIEF1ZyAyMDIwIDExOjE0OjQxICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gT24gMjAyMC84LzIwIOS4i+WNiDg6MjcsIENvcm5lbGlhIEh1Y2sg
d3JvdGU6Cj4+PiBPbiBXZWQsIDE5IEF1ZyAyMDIwIDE3OjI4OjM4ICswODAwCj4+PiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPj4+ICAgCj4+Pj4gT24gMjAyMC84LzE5
IOS4i+WNiDQ6MTMsIFlhbiBaaGFvIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEF1ZyAxOSwgMjAyMCBh
dCAwMzozOTo1MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4gT24gMjAyMC84LzE5
IOS4i+WNiDI6NTksIFlhbiBaaGFvIHdyb3RlOgo+Pj4+Pj4+IE9uIFdlZCwgQXVnIDE5LCAyMDIw
IGF0IDAyOjU3OjM0UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDIwMjAv
OC8xOSDkuIrljYgxMTozMCwgWWFuIFpoYW8gd3JvdGU6Cj4+Pj4+Pj4+PiBoaSBBbGwsCj4+Pj4+
Pj4+PiBjb3VsZCB3ZSBkZWNpZGUgdGhhdCBzeXNmcyBpcyB0aGUgaW50ZXJmYWNlIHRoYXQgZXZl
cnkgVkZJTyB2ZW5kb3IgZHJpdmVyCj4+Pj4+Pj4+PiBuZWVkcyB0byBwcm92aWRlIGluIG9yZGVy
IHRvIHN1cHBvcnQgdmZpbyBsaXZlIG1pZ3JhdGlvbiwgb3RoZXJ3aXNlIHRoZQo+Pj4+Pj4+Pj4g
dXNlcnNwYWNlIG1hbmFnZW1lbnQgdG9vbCB3b3VsZCBub3QgbGlzdCB0aGUgZGV2aWNlIGludG8g
dGhlIGNvbXBhdGlibGUKPj4+Pj4+Pj4+IGxpc3Q/Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaWYgdGhh
dCdzIHRydWUsIGxldCdzIG1vdmUgdG8gdGhlIHN0YW5kYXJkaXppbmcgb2YgdGhlIHN5c2ZzIGlu
dGVyZmFjZS4KPj4+Pj4+Pj4+ICgxKSBjb250ZW50Cj4+Pj4+Pj4+PiBjb21tb24gcGFydDogKG11
c3QpCj4+Pj4+Pj4+PiAgICAgICAgIC0gc29mdHdhcmVfdmVyc2lvbjogKGluIG1ham9yLm1pbm9y
LmJ1Z2ZpeCBzY2hlbWUpCj4+Pj4+Pj4+IFRoaXMgY2FuIG5vdCB3b3JrIGZvciBkZXZpY2VzIHdo
b3NlIGZlYXR1cmVzIGNhbiBiZSBuZWdvdGlhdGVkL2FkdmVydGlzZWQKPj4+Pj4+Pj4gaW5kZXBl
bmRlbnRseS4gKEUuZyB2aXJ0aW8gZGV2aWNlcykKPj4+IEkgdGhvdWdodCB0aGUgJ3NvZnR3YXJl
X3ZlcnNpb24nIHdhcyBzdXBwb3NlZCB0byBkZXNjcmliZSBraW5kIG9mIGEKPj4+ICdwcm90b2Nv
bCB2ZXJzaW9uJyBmb3IgdGhlIGRhdGEgd2UgdHJhbnNtaXQ/IEkuZS4sIHlvdSBhZGQgYSBuZXcg
ZmllbGQsCj4+PiB5b3UgYnVtcCB0aGUgdmVyc2lvbiBudW1iZXIuCj4+Cj4+IE9rLCBidXQgc2lu
Y2Ugd2UgbWFuZGF0ZSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IG9mIHVBQkksIGlzIHRoaXMgcmVh
bGx5Cj4+IHdvcnRoIHRvIGhhdmUgYSB2ZXJzaW9uIGZvciBzeXNmcz8gKFNlYXJjaGluZyBvbiBz
eXNmcyBzaG93cyBubyBleGFtcGxlcwo+PiBsaWtlIHRoaXMpCj4gSSB3YXMgbm90IHRoaW5raW5n
IGFib3V0IHRoZSBzeXNmcyBpbnRlcmZhY2UsIGJ1dCByYXRoZXIgYWJvdXQgdGhlIGRhdGEKPiB0
aGF0IGlzIHNlbnQgb3ZlciB3aGlsZSBtaWdyYXRpbmcuIEUuZy4gd2UgZmluZCBvdXQgdGhhdCBz
ZW5kaW5nIHNvbWUKPiBhdXhpbGlhcnkgZGF0YSBpcyBhIGdvb2QgaWRlYSBhbmQgYnVtcCB0byB2
ZXJzaW9uIDEuMS4wOyB2ZXJzaW9uIDEuMC4wCj4gY2Fubm90IGRlYWwgd2l0aCB0aGUgZXh0cmEg
ZGF0YSwgYnV0IHZlcnNpb24gMS4xLjAgY2FuIGRlYWwgd2l0aCB0aGUKPiBvbGRlciBkYXRhIHN0
cmVhbS4KPgo+ICguLi4pCgoKV2VsbCwgSSB0aGluayB3aGF0IGRhdGEgdG8gdHJhbnNtaXQgZHVy
aW5nIG1pZ3JhdGlvbiBpcyB0aGUgZHV0eSBvZiBxZW11IApub3Qga2VybmVsLiBBbmQgSSBzdXNw
ZWN0IHRoZSBpZGVhIG9mIHJlYWRpbmcgb3BhcXVlIGRhdGEgKHdpdGggdmVyc2lvbikgCmZyb20g
a2VybmVsIGFuZCB0cmFuc21pdCB0aGVtIHRvIGRlc3QgaXMgdGhlIGJlc3QgYXBwcm9hY2guCgoK
Pgo+Pj4+Pj4+Pj4gICAgICAgICAtIGRldmljZV9hcGk6IHZmaW8tcGNpIG9yIHZmaW8tY2N3IC4u
Lgo+Pj4+Pj4+Pj4gICAgICAgICAtIHR5cGU6IG1kZXYgdHlwZSBmb3IgbWRldiBkZXZpY2Ugb3IK
Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICBhIHNpZ25hdHVyZSBmb3IgcGh5c2ljYWwgZGV2aWNl
IHdoaWNoIGlzIGEgY291bnRlcnBhcnQgZm9yCj4+Pj4+Pj4+PiAJICAgbWRldiB0eXBlLgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+IGRldmljZSBhcGkgc3BlY2lmaWMgcGFydDogKG11c3QpCj4+Pj4+Pj4+
PiAgICAgICAgLSBwY2kgaWQ6IHBjaSBpZCBvZiBtZGV2IHBhcmVudCBkZXZpY2Ugb3IgcGNpIGlk
IG9mIHBoeXNpY2FsIHBjaQo+Pj4+Pj4+Pj4gICAgICAgICAgZGV2aWNlIChkZXZpY2VfYXBpIGlz
IHZmaW8tcGNpKUFQSSBoZXJlLgo+Pj4+Pj4+PiBTbyB0aGlzIGFzc3VtZXMgYSBQQ0kgZGV2aWNl
IHdoaWNoIGlzIHByb2JhYmx5IG5vdCB0cnVlLgo+Pj4+Pj4+PiAgICAgIAo+Pj4+Pj4+IGZvciBk
ZXZpY2VfYXBpIG9mIHZmaW8tcGNpLCB3aHkgaXQncyBub3QgdHJ1ZT8KPj4+Pj4+Pgo+Pj4+Pj4+
IGZvciB2ZmlvLWNjdywgaXQncyBzdWJjaGFubmVsX3R5cGUuCj4+Pj4+PiBPayBidXQgaGF2aW5n
IHR3byBkaWZmZXJlbnQgYXR0cmlidXRlcyBmb3IgdGhlIHNhbWUgZmlsZSBpcyBub3QgZ29vZCBp
ZGVhLgo+Pj4+Pj4gSG93IG1nbXQga25vdyB0aGVyZSB3aWxsIGJlIGEgM3JkIHR5cGU/Cj4+Pj4+
IHRoYXQncyB3aHkgc29tZSBhdHRyaWJ1dGVzIG5lZWQgdG8gYmUgY29tbW9uLiBlLmcuCj4+Pj4+
IGRldmljZV9hcGk6IGl0J3MgY29tbW9uIGJlY2F1c2UgbWdtdCBuZWVkIHRvIGtub3cgaXQncyBh
IHBjaSBkZXZpY2Ugb3IgYQo+Pj4+PiAgICAgICAgICAgICAgICBjY3cgZGV2aWNlLiBhbmQgdGhl
IGFwaSB0eXBlIGlzIGFscmVhZHkgZGVmaW5lZCB2ZmlvLmguCj4+Pj4+IAkgICAgKFRoZSBmaWVs
ZCBpcyBhZ3JlZWQgYnkgYW5kIGFjdHVhbGx5IHN1Z2dlc3RlZCBieSBBbGV4IGluIHByZXZpb3Vz
IG1haWwpCj4+Pj4+IHR5cGU6IG1kZXZfdHlwZSBmb3IgbWRldi4gaWYgbWdtdCBkb2VzIG5vdCB1
bmRlcnN0YW5kIGl0LCBpdCB3b3VsZCBub3QKPj4+Pj4gICAgICAgICAgYmUgYWJsZSB0byBjcmVh
dGUgb25lIGNvbXBhdGlibGUgbWRldiBkZXZpY2UuCj4+Pj4+IHNvZnR3YXJlX3ZlcnNpb246IG1n
bXQgY2FuIGNvbXBhcmUgdGhlIG1ham9yIGFuZCBtaW5vciBpZiBpdCB1bmRlcnN0YW5kcwo+Pj4+
PiAgICAgICAgICB0aGlzIGZpZWxkcy4KPj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwg
aWYgeW91IGNhbiBkZXNjcmliZSBob3cgbWdtdCBpcyBleHBlY3RlZCB0bwo+Pj4+IHdvcmsgc3Rl
cCBieSBzdGVwIHdpdGggdGhlIHByb3Bvc2VkIHN5c2ZzIEFQSS4gVGhpcyBjYW4gaGVscCBwZW9w
bGUgdG8KPj4+PiB1bmRlcnN0YW5kLgo+Pj4gTXkgcHJvcG9zYWwgd291bGQgYmU6Cj4+PiAtIGNo
ZWNrIHRoYXQgZGV2aWNlX2FwaSBtYXRjaGVzCj4+PiAtIGNoZWNrIHBvc3NpYmxlIGRldmljZV9h
cGkgc3BlY2lmaWMgYXR0cmlidXRlcwo+Pj4gLSBjaGVjayB0aGF0IHR5cGUgbWF0Y2hlcyBbSSBk
b24ndCB0aGluayB0aGUgY29tYmluYXRpb24gb2YgbWRldiB0eXBlcwo+Pj4gICAgIGFuZCBhbm90
aGVyIGF0dHJpYnV0ZSB0byBkZXRlcm1pbmUgY29tcGF0aWJpbGl0eSBpcyBhIGdvb2QgaWRlYTsK
Pj4KPj4gQW55IHJlYXNvbiBmb3IgdGhpcz8gQWN0dWFsbHkgaWYgd2Ugb25seSB1c2UgbWRldiB0
eXBlIHRvIGRldGVjdCB0aGUKPj4gY29tcGF0aWJpbGl0eSwgaXQgd291bGQgYmUgbXVjaCBtb3Jl
IGVhc2llci4gT3RoZXJ3aXNlLCB3ZSBhcmUgYWN0dWFsbHkKPj4gcmUtaW52ZW50aW5nIG1kZXYg
dHlwZXMuCj4+Cj4+IEUuZyBjYW4gd2UgaGF2ZSB0aGUgc2FtZSBtZGV2IHR5cGVzIHdpdGggZGlm
ZmVyZW50IGRldmljZV9hcGkgYW5kIG90aGVyCj4+IGF0dHJpYnV0ZXM/Cj4gSW4gdGhlIGVuZCwg
dGhlIG1kZXYgdHlwZSBpcyByZXByZXNlbnRlZCBhcyBhIHN0cmluZzsgYnV0IEknbSBub3Qgc3Vy
ZQo+IHdlIGNhbiBleHBlY3QgdGhhdCB0d28gdHlwZXMgd2l0aCB0aGUgc2FtZSBuYW1lLCBidXQg
YSBkaWZmZXJlbnQKPiBkZXZpY2VfYXBpIGFyZSByZWxhdGVkIGluIGFueSB3YXkuCj4KPiBJZiB3
ZSBlLmcuIGNvbXBhcmUgdmZpby1wY2kgYW5kIHZmaW8tY2N3LCB0aGV5IGFyZSBmdW5kYW1lbnRh
bGx5Cj4gZGlmZmVyZW50Lgo+Cj4gSSB3YXMgbW9zdGx5IGNvbmNlcm5lZCBhYm91dCB0aGUgYWdn
cmVnYXRpb24gcHJvcG9zYWwsIHdoZXJlIHR5cGUgQSArCj4gYWdncmVnYXRpb24gdmFsdWUgYiBt
aWdodCBiZSBjb21wYXRpYmxlIHdpdGggdHlwZSBCICsgYWdncmVnYXRpb24gdmFsdWUKPiBhLgoK
ClllcywgdGhhdCBsb29rcyBwcmV0dHkgY29tcGxpY2F0ZWQuCgoKPgo+Pgo+Pj4gICAgIGFjdHVh
bGx5LCB0aGUgY3VycmVudCBwcm9wb3NhbCBjb25mdXNlcyBtZSBldmVyeSB0aW1lIEkgbG9vayBh
dCBpdF0KPj4+IC0gY2hlY2sgdGhhdCBzb2Z0d2FyZV92ZXJzaW9uIGlzIGNvbXBhdGlibGUsIGFz
c3VtaW5nIHNlbWFudGljCj4+PiAgICAgdmVyc2lvbmluZwo+Pj4gLSBjaGVjayBwb3NzaWJsZSB0
eXBlLXNwZWNpZmljIGF0dHJpYnV0ZXMKPj4KPj4gSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgdG9v
IGNvbXBsaWNhdGVkLiBBbmQgSSBzdXNwZWN0IHRoZXJlIHdpbGwgYmUKPj4gdmVuZG9yIHNwZWNp
ZmljIGF0dHJpYnV0ZXM6Cj4+Cj4+IC0gZm9yIGNvbXBhdGliaWxpdHkgY2hlY2s6IEkgdGhpbmsg
d2Ugc2hvdWxkIGVpdGhlciBtb2RlbGluZyBldmVyeXRoaW5nCj4+IHZpYSBtZGV2IHR5cGUgb3Ig
bWFraW5nIGl0IHRvdGFsbHkgdmVuZG9yIHNwZWNpZmljLiBIYXZpbmcgc29tZXRoaW5nIGluCj4+
IHRoZSBtaWRkbGUgd2lsbCBicmluZyBhIGxvdCBvZiBidXJkZW4KPiBGV0lXLCBJJ20gZm9yIGEg
c3RyaWN0IG1hdGNoIG9uIG1kZXYgdHlwZSwgYW5kIGZsZXhpYmlsaXR5IGluIHBlci10eXBlCj4g
YXR0cmlidXRlcy4KCgpJJ20gbm90IHN1cmUgd2hldGhlciB0aGUgYWJvdmUgZmxleGliaWxpdHkg
Y2FuIHdvcmsgYmV0dGVyIHRoYW4gZW5jb2RpbmcgCnRoZW0gdG8gbWRldiB0eXBlLiBJZiB3ZSBy
ZWFsbHkgd2FudCB1bHRyYSBmbGV4aWJpbGl0eSwgd2UgbmVlZCBtYWtpbmcgCnRoZSBjb21wYXRp
YmlsaXR5IGNoZWNrIHRvdGFsbHkgdmVuZG9yIHNwZWNpZmljLgoKCj4KPj4gLSBmb3IgcHJvdmlz
aW9uaW5nOiBpdCdzIHN0aWxsIG5vdCBjbGVhci4gQXMgc2hvd24gaW4gdGhpcyBwcm9wb3NhbCwg
Zm9yCj4+IE5WTUUgd2UgbWF5IG5lZWQgdG8gc2V0IHJlbW90ZV91cmwsIGJ1dCB1bmxlc3MgdGhl
cmUgd2lsbCBiZSBhIHN1YmNsYXNzCj4+IChOVk1FKSBpbiB0aGUgbWRldiAod2hpY2ggSSBndWVz
cyBub3QpLCB3ZSBjYW4ndCBwcmV2ZW50IHZlbmRvciBmcm9tCj4+IHVzaW5nIGFub3RoZXIgYXR0
cmlidXRlIG5hbWUsIGluIHRoaXMgY2FzZSwgdHJpY2tzIGxpa2UgYXR0cmlidXRlcwo+PiBpdGVy
YXRpb24gaW4gc29tZSBzdWIgZGlyZWN0b3J5IHdvbid0IHdvcmsuIFNvIGV2ZW4gaWYgd2UgaGFk
IHNvbWUKPj4gY29tbW9uIEFQSSBmb3IgY29tcGF0aWJpbGl0eSBjaGVjaywgdGhlIHByb3Zpc2lv
bmluZyBBUEkgaXMgc3RpbGwgdmVuZG9yCj4+IHNwZWNpZmljIC4uLgo+IFllcywgSSdtIG5vdCBz
dXJlIGhvdyB0byBkZWFsIHdpdGggdGhlICJzYW1lIHRoaW5nIGZvciBkaWZmZXJlbnQKPiB2ZW5k
b3JzIiBwcm9ibGVtLiBXZSBjYW4gdHJ5IHRvIG1ha2Ugc3VyZSB0aGF0IGluLWtlcm5lbCBkcml2
ZXJzIHBsYXkKPiBuaWNlbHksIGJ1dCBub3QgbXVjaCBtb3JlLgoKClRoZW4gaXQncyBhY3R1YWxs
eSBhIHN1YmNsYXNzIG9mIG1kZXYgSSBndWVzcyBpbiB0aGUgZnV0dXJlLgoKVGhhbmtzCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
