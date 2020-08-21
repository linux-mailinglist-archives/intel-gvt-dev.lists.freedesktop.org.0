Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91F024CB35
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Aug 2020 05:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1896EA88;
	Fri, 21 Aug 2020 03:16:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D886EA88
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Aug 2020 03:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597979793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfQKLX4LdG6hGr+rFiwuG1CAQOaTZt5wRoJTG69ORcc=;
 b=Uj5Vsl4WPOw9ic4pfY1y5Akh9HEZdL58nCESPogopwNNYA9zuZi+i7nT6OXIj/2EdDD+pJ
 Hg3jMwzO+SqvBxj9TtqRCh22oq2RADxih+BY+iANkjGWimDeAB5BMfNslBwBB7i0Zwc0fA
 vyIaepkQ8F9imyrXPWdz6eL5W7sBuEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-bp_koaGWNuycNf8mEvoJrg-1; Thu, 20 Aug 2020 23:15:21 -0400
X-MC-Unique: bp_koaGWNuycNf8mEvoJrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFCF9107464D;
 Fri, 21 Aug 2020 03:15:18 +0000 (UTC)
Received: from [10.72.13.182] (ovpn-13-182.pek2.redhat.com [10.72.13.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FFE77BE98;
 Fri, 21 Aug 2020 03:14:43 +0000 (UTC)
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ea0e84c5-733a-2bdb-4c1e-95fd16698ed8@redhat.com>
Date: Fri, 21 Aug 2020 11:14:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820142740.6513884d.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvOC8yMCDkuIvljYg4OjI3LCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IE9uIFdlZCwg
MTkgQXVnIDIwMjAgMTc6Mjg6MzggKzA4MDAKPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKPgo+PiBPbiAyMDIwLzgvMTkg5LiL5Y2INDoxMywgWWFuIFpoYW8gd3JvdGU6
Cj4+PiBPbiBXZWQsIEF1ZyAxOSwgMjAyMCBhdCAwMzozOTo1MFBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+Pj4+IE9uIDIwMjAvOC8xOSDkuIvljYgyOjU5LCBZYW4gWmhhbyB3cm90ZToKPj4+
Pj4gT24gV2VkLCBBdWcgMTksIDIwMjAgYXQgMDI6NTc6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPj4+Pj4+IE9uIDIwMjAvOC8xOSDkuIrljYgxMTozMCwgWWFuIFpoYW8gd3JvdGU6Cj4+
Pj4+Pj4gaGkgQWxsLAo+Pj4+Pj4+IGNvdWxkIHdlIGRlY2lkZSB0aGF0IHN5c2ZzIGlzIHRoZSBp
bnRlcmZhY2UgdGhhdCBldmVyeSBWRklPIHZlbmRvciBkcml2ZXIKPj4+Pj4+PiBuZWVkcyB0byBw
cm92aWRlIGluIG9yZGVyIHRvIHN1cHBvcnQgdmZpbyBsaXZlIG1pZ3JhdGlvbiwgb3RoZXJ3aXNl
IHRoZQo+Pj4+Pj4+IHVzZXJzcGFjZSBtYW5hZ2VtZW50IHRvb2wgd291bGQgbm90IGxpc3QgdGhl
IGRldmljZSBpbnRvIHRoZSBjb21wYXRpYmxlCj4+Pj4+Pj4gbGlzdD8KPj4+Pj4+Pgo+Pj4+Pj4+
IGlmIHRoYXQncyB0cnVlLCBsZXQncyBtb3ZlIHRvIHRoZSBzdGFuZGFyZGl6aW5nIG9mIHRoZSBz
eXNmcyBpbnRlcmZhY2UuCj4+Pj4+Pj4gKDEpIGNvbnRlbnQKPj4+Pj4+PiBjb21tb24gcGFydDog
KG11c3QpCj4+Pj4+Pj4gICAgICAgIC0gc29mdHdhcmVfdmVyc2lvbjogKGluIG1ham9yLm1pbm9y
LmJ1Z2ZpeCBzY2hlbWUpCj4+Pj4+PiBUaGlzIGNhbiBub3Qgd29yayBmb3IgZGV2aWNlcyB3aG9z
ZSBmZWF0dXJlcyBjYW4gYmUgbmVnb3RpYXRlZC9hZHZlcnRpc2VkCj4+Pj4+PiBpbmRlcGVuZGVu
dGx5LiAoRS5nIHZpcnRpbyBkZXZpY2VzKQo+IEkgdGhvdWdodCB0aGUgJ3NvZnR3YXJlX3ZlcnNp
b24nIHdhcyBzdXBwb3NlZCB0byBkZXNjcmliZSBraW5kIG9mIGEKPiAncHJvdG9jb2wgdmVyc2lv
bicgZm9yIHRoZSBkYXRhIHdlIHRyYW5zbWl0PyBJLmUuLCB5b3UgYWRkIGEgbmV3IGZpZWxkLAo+
IHlvdSBidW1wIHRoZSB2ZXJzaW9uIG51bWJlci4KCgpPaywgYnV0IHNpbmNlIHdlIG1hbmRhdGUg
YmFja3dhcmQgY29tcGF0aWJpbGl0eSBvZiB1QUJJLCBpcyB0aGlzIHJlYWxseSAKd29ydGggdG8g
aGF2ZSBhIHZlcnNpb24gZm9yIHN5c2ZzPyAoU2VhcmNoaW5nIG9uIHN5c2ZzIHNob3dzIG5vIGV4
YW1wbGVzIApsaWtlIHRoaXMpCgoKPgo+Pj4+Pj4gICAKPj4+Pj4gc29ycnksIEkgZG9uJ3QgdW5k
ZXJzdGFuZCBoZXJlLCB3aHkgdmlydGlvIGRldmljZXMgbmVlZCB0byB1c2UgdmZpbyBpbnRlcmZh
Y2U/Cj4+Pj4gSSBkb24ndCBzZWUgYW55IHJlYXNvbiB0aGF0IHZpcnRpbyBkZXZpY2VzIGNhbid0
IGJlIHVzZWQgYnkgVkZJTy4gRG8geW91Pwo+Pj4+Cj4+Pj4gQWN0dWFsbHksIHZpcnRpbyBkZXZp
Y2VzIGhhdmUgYmVlbiB1c2VkIGJ5IFZGSU8gZm9yIG1hbnkgeWVhcnM6Cj4+Pj4KPj4+PiAtIHBh
c3N0aHJvdWdoIGEgaGFyZHdhcmUgdmlydGlvIGRldmljZXMgdG8gdXNlcnNwYWNlKFZNKSBkcml2
ZXJzCj4+Pj4gLSB1c2luZyB2aXJ0aW8gUE1EIGluc2lkZSBndWVzdAo+Pj4+ICAgCj4+PiBTbywg
d2hhdCdzIGRpZmZlcmVudCBmb3IgaXQgdnMgcGFzc2luZyB0aHJvdWdoIGEgcGh5c2ljYWwgaGFy
ZHdhcmUgdmlhIFZGSU8/Cj4+Cj4+IFRoZSBkaWZmZXJlbmNlIGlzIGluIHRoZSBndWVzdCwgdGhl
IGRldmljZSBjb3VsZCBiZSBlaXRoZXIgcmVhbCBoYXJkd2FyZQo+PiBvciBlbXVsYXRlZCBvbmVz
Lgo+Pgo+Pgo+Pj4gZXZlbiB0aG91Z2ggdGhlIGZlYXR1cmVzIGFyZSBuZWdvdGlhdGVkIGR5bmFt
aWNhbGx5LCBjb3VsZCB5b3UgZXhwbGFpbgo+Pj4gd2h5IGl0IHdvdWxkIGNhdXNlIHNvZnR3YXJl
X3ZlcnNpb24gbm90IHdvcms/Cj4+Cj4+IFZpcnRpbyBkZXZpY2UgMSBzdXBwb3J0cyBmZWF0dXJl
IEEsIEIsIEMKPj4gVmlydGlvIGRldmljZSAyIHN1cHBvcnRzIGZlYXR1cmUgQiwgQywgRAo+Pgo+
PiBTbyB5b3UgY2FuJ3QgbWlncmF0ZSBhIGd1ZXN0IGZyb20gZGV2aWNlIDEgdG8gZGV2aWNlIDIu
IEFuZCBpdCdzCj4+IGltcG9zc2libGUgdG8gbW9kZWwgdGhlIGZlYXR1cmVzIHdpdGggdmVyc2lv
bnMuCj4gV2UncmUgdGFsa2luZyBhYm91dCB0aGUgZmVhdHVyZXMgb2ZmZXJlZCBieSB0aGUgZGV2
aWNlLCByaWdodD8gV291bGQgaXQKPiBiZSBzdWZmaWNpZW50IHRvIG1hbmRhdGUgdGhhdCB0aGUg
dGFyZ2V0IGRldmljZSBzdXBwb3J0cyB0aGUgc2FtZQo+IGZlYXR1cmVzIG9yIGEgc3VwZXJzZXQg
b2YgdGhlIGZlYXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgc291cmNlIGRldmljZT8KCgpZZXMuCgoK
Pgo+Pgo+Pj4gICAKPj4+Pj4gSSB0aGluayB0aGlzIHRocmVhZCBpcyBkaXNjdXNzaW5nIGFib3V0
IHZmaW8gcmVsYXRlZCBkZXZpY2VzLgo+Pj4+PiAgIAo+Pj4+Pj4+ICAgICAgICAtIGRldmljZV9h
cGk6IHZmaW8tcGNpIG9yIHZmaW8tY2N3IC4uLgo+Pj4+Pj4+ICAgICAgICAtIHR5cGU6IG1kZXYg
dHlwZSBmb3IgbWRldiBkZXZpY2Ugb3IKPj4+Pj4+PiAgICAgICAgICAgICAgICBhIHNpZ25hdHVy
ZSBmb3IgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIGEgY291bnRlcnBhcnQgZm9yCj4+Pj4+Pj4g
CSAgIG1kZXYgdHlwZS4KPj4+Pj4+Pgo+Pj4+Pj4+IGRldmljZSBhcGkgc3BlY2lmaWMgcGFydDog
KG11c3QpCj4+Pj4+Pj4gICAgICAgLSBwY2kgaWQ6IHBjaSBpZCBvZiBtZGV2IHBhcmVudCBkZXZp
Y2Ugb3IgcGNpIGlkIG9mIHBoeXNpY2FsIHBjaQo+Pj4+Pj4+ICAgICAgICAgZGV2aWNlIChkZXZp
Y2VfYXBpIGlzIHZmaW8tcGNpKUFQSSBoZXJlLgo+Pj4+Pj4gU28gdGhpcyBhc3N1bWVzIGEgUENJ
IGRldmljZSB3aGljaCBpcyBwcm9iYWJseSBub3QgdHJ1ZS4KPj4+Pj4+ICAgCj4+Pj4+IGZvciBk
ZXZpY2VfYXBpIG9mIHZmaW8tcGNpLCB3aHkgaXQncyBub3QgdHJ1ZT8KPj4+Pj4KPj4+Pj4gZm9y
IHZmaW8tY2N3LCBpdCdzIHN1YmNoYW5uZWxfdHlwZS4KPj4+PiBPayBidXQgaGF2aW5nIHR3byBk
aWZmZXJlbnQgYXR0cmlidXRlcyBmb3IgdGhlIHNhbWUgZmlsZSBpcyBub3QgZ29vZCBpZGVhLgo+
Pj4+IEhvdyBtZ210IGtub3cgdGhlcmUgd2lsbCBiZSBhIDNyZCB0eXBlPwo+Pj4gdGhhdCdzIHdo
eSBzb21lIGF0dHJpYnV0ZXMgbmVlZCB0byBiZSBjb21tb24uIGUuZy4KPj4+IGRldmljZV9hcGk6
IGl0J3MgY29tbW9uIGJlY2F1c2UgbWdtdCBuZWVkIHRvIGtub3cgaXQncyBhIHBjaSBkZXZpY2Ug
b3IgYQo+Pj4gICAgICAgICAgICAgICBjY3cgZGV2aWNlLiBhbmQgdGhlIGFwaSB0eXBlIGlzIGFs
cmVhZHkgZGVmaW5lZCB2ZmlvLmguCj4+PiAJICAgIChUaGUgZmllbGQgaXMgYWdyZWVkIGJ5IGFu
ZCBhY3R1YWxseSBzdWdnZXN0ZWQgYnkgQWxleCBpbiBwcmV2aW91cyBtYWlsKQo+Pj4gdHlwZTog
bWRldl90eXBlIGZvciBtZGV2LiBpZiBtZ210IGRvZXMgbm90IHVuZGVyc3RhbmQgaXQsIGl0IHdv
dWxkIG5vdAo+Pj4gICAgICAgICBiZSBhYmxlIHRvIGNyZWF0ZSBvbmUgY29tcGF0aWJsZSBtZGV2
IGRldmljZS4KPj4+IHNvZnR3YXJlX3ZlcnNpb246IG1nbXQgY2FuIGNvbXBhcmUgdGhlIG1ham9y
IGFuZCBtaW5vciBpZiBpdCB1bmRlcnN0YW5kcwo+Pj4gICAgICAgICB0aGlzIGZpZWxkcy4KPj4K
Pj4gSSB0aGluayBpdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjYW4gZGVzY3JpYmUgaG93IG1n
bXQgaXMgZXhwZWN0ZWQgdG8KPj4gd29yayBzdGVwIGJ5IHN0ZXAgd2l0aCB0aGUgcHJvcG9zZWQg
c3lzZnMgQVBJLiBUaGlzIGNhbiBoZWxwIHBlb3BsZSB0bwo+PiB1bmRlcnN0YW5kLgo+IE15IHBy
b3Bvc2FsIHdvdWxkIGJlOgo+IC0gY2hlY2sgdGhhdCBkZXZpY2VfYXBpIG1hdGNoZXMKPiAtIGNo
ZWNrIHBvc3NpYmxlIGRldmljZV9hcGkgc3BlY2lmaWMgYXR0cmlidXRlcwo+IC0gY2hlY2sgdGhh
dCB0eXBlIG1hdGNoZXMgW0kgZG9uJ3QgdGhpbmsgdGhlIGNvbWJpbmF0aW9uIG9mIG1kZXYgdHlw
ZXMKPiAgICBhbmQgYW5vdGhlciBhdHRyaWJ1dGUgdG8gZGV0ZXJtaW5lIGNvbXBhdGliaWxpdHkg
aXMgYSBnb29kIGlkZWE7CgoKQW55IHJlYXNvbiBmb3IgdGhpcz8gQWN0dWFsbHkgaWYgd2Ugb25s
eSB1c2UgbWRldiB0eXBlIHRvIGRldGVjdCB0aGUgCmNvbXBhdGliaWxpdHksIGl0IHdvdWxkIGJl
IG11Y2ggbW9yZSBlYXNpZXIuIE90aGVyd2lzZSwgd2UgYXJlIGFjdHVhbGx5IApyZS1pbnZlbnRp
bmcgbWRldiB0eXBlcy4KCkUuZyBjYW4gd2UgaGF2ZSB0aGUgc2FtZSBtZGV2IHR5cGVzIHdpdGgg
ZGlmZmVyZW50IGRldmljZV9hcGkgYW5kIG90aGVyIAphdHRyaWJ1dGVzPwoKCj4gICAgYWN0dWFs
bHksIHRoZSBjdXJyZW50IHByb3Bvc2FsIGNvbmZ1c2VzIG1lIGV2ZXJ5IHRpbWUgSSBsb29rIGF0
IGl0XQo+IC0gY2hlY2sgdGhhdCBzb2Z0d2FyZV92ZXJzaW9uIGlzIGNvbXBhdGlibGUsIGFzc3Vt
aW5nIHNlbWFudGljCj4gICAgdmVyc2lvbmluZwo+IC0gY2hlY2sgcG9zc2libGUgdHlwZS1zcGVj
aWZpYyBhdHRyaWJ1dGVzCgoKSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgdG9vIGNvbXBsaWNhdGVk
LiBBbmQgSSBzdXNwZWN0IHRoZXJlIHdpbGwgYmUgCnZlbmRvciBzcGVjaWZpYyBhdHRyaWJ1dGVz
OgoKLSBmb3IgY29tcGF0aWJpbGl0eSBjaGVjazogSSB0aGluayB3ZSBzaG91bGQgZWl0aGVyIG1v
ZGVsaW5nIGV2ZXJ5dGhpbmcgCnZpYSBtZGV2IHR5cGUgb3IgbWFraW5nIGl0IHRvdGFsbHkgdmVu
ZG9yIHNwZWNpZmljLiBIYXZpbmcgc29tZXRoaW5nIGluIAp0aGUgbWlkZGxlIHdpbGwgYnJpbmcg
YSBsb3Qgb2YgYnVyZGVuCi0gZm9yIHByb3Zpc2lvbmluZzogaXQncyBzdGlsbCBub3QgY2xlYXIu
IEFzIHNob3duIGluIHRoaXMgcHJvcG9zYWwsIGZvciAKTlZNRSB3ZSBtYXkgbmVlZCB0byBzZXQg
cmVtb3RlX3VybCwgYnV0IHVubGVzcyB0aGVyZSB3aWxsIGJlIGEgc3ViY2xhc3MgCihOVk1FKSBp
biB0aGUgbWRldiAod2hpY2ggSSBndWVzcyBub3QpLCB3ZSBjYW4ndCBwcmV2ZW50IHZlbmRvciBm
cm9tIAp1c2luZyBhbm90aGVyIGF0dHJpYnV0ZSBuYW1lLCBpbiB0aGlzIGNhc2UsIHRyaWNrcyBs
aWtlIGF0dHJpYnV0ZXMgCml0ZXJhdGlvbiBpbiBzb21lIHN1YiBkaXJlY3Rvcnkgd29uJ3Qgd29y
ay4gU28gZXZlbiBpZiB3ZSBoYWQgc29tZSAKY29tbW9uIEFQSSBmb3IgY29tcGF0aWJpbGl0eSBj
aGVjaywgdGhlIHByb3Zpc2lvbmluZyBBUEkgaXMgc3RpbGwgdmVuZG9yIApzcGVjaWZpYyAuLi4K
ClRoYW5rcwoKCgo+Cj4+IFRoYW5rcyBmb3IgdGhlIHBhdGllbmNlLiBTaW5jZSBzeXNmcyBpcyB1
QUJJLCB3aGVuIGFjY2VwdGVkLCB3ZSBuZWVkCj4+IHN1cHBvcnQgaXQgZm9yZXZlci4gVGhhdCdz
IHdoeSB3ZSBuZWVkIHRvIGJlIGNhcmVmdWwuCj4gTm9kLgo+Cj4gKC4uLikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
