Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED023C753
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Aug 2020 10:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05F89D83;
	Wed,  5 Aug 2020 08:03:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6911589D83
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Aug 2020 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596614602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CCEkWMFbF7tYjFwcBIEHhXPvQ+zBKlX6/BkIraOSPo=;
 b=UQLxfsaYocDCsXEsxtf0Lht6vn7LWnuwCbJJMYqngVfdG6bSeId1zOzpw7UDWkkdxElzVM
 90aeS91hfpIOu4qKH6/FsnPpgvgl2joo84ntQf6TMmFS573XruQhvyqb8+z+1IGBrmRawv
 fRbaKroGwalZ+DSAINK6cjRNoRmaH8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-KK6wDpefN0ixs5uGatIvSg-1; Wed, 05 Aug 2020 04:03:17 -0400
X-MC-Unique: KK6wDpefN0ixs5uGatIvSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D30B79EC6;
 Wed,  5 Aug 2020 08:03:15 +0000 (UTC)
Received: from [10.72.12.225] (ovpn-12-225.pek2.redhat.com [10.72.12.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D519760C47;
 Wed,  5 Aug 2020 08:02:50 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Jiri Pirko <jiri@mellanox.com>
References: <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home> <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040> <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
Date: Wed, 5 Aug 2020 16:02:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805075647.GB2177@nanopsycho>
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
Cc: Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, eskultet@redhat.com,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com,
 corbet@lwn.net, dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC81IOS4i+WNiDM6NTYsIEppcmkgUGlya28gd3JvdGU6Cj4gV2VkLCBBdWcgMDUs
IDIwMjAgYXQgMDQ6NDE6NTRBTSBDRVNULCBqYXNvd2FuZ0ByZWRoYXQuY29tIHdyb3RlOgo+PiBP
biAyMDIwLzgvNSDkuIrljYgxMDoxNiwgWWFuIFpoYW8gd3JvdGU6Cj4+PiBPbiBXZWQsIEF1ZyAw
NSwgMjAyMCBhdCAxMDoyMjoxNUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIDIw
MjAvOC81IOS4iuWNiDEyOjM1LCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+Pj4+PiBbc29ycnkgYWJv
dXQgbm90IGNoaW1pbmcgaW4gZWFybGllcl0KPj4+Pj4KPj4+Pj4gT24gV2VkLCAyOSBKdWwgMjAy
MCAxNjowNTowMyArMDgwMAo+Pj4+PiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdy
b3RlOgo+Pj4+Pgo+Pj4+Pj4gT24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMDQ6MjM6MjFQTSAtMDYw
MCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+Pj4+PiAoLi4uKQo+Pj4+Pgo+Pj4+Pj4+IEJhc2Vk
IG9uIHRoZSBmZWVkYmFjayB3ZSd2ZSByZWNlaXZlZCwgdGhlIHByZXZpb3VzbHkgcHJvcG9zZWQg
aW50ZXJmYWNlCj4+Pj4+Pj4gaXMgbm90IHZpYWJsZS4gIEkgdGhpbmsgdGhlcmUncyBhZ3JlZW1l
bnQgdGhhdCB0aGUgdXNlciBuZWVkcyB0byBiZQo+Pj4+Pj4+IGFibGUgdG8gcGFyc2UgYW5kIGlu
dGVycHJldCB0aGUgdmVyc2lvbiBpbmZvcm1hdGlvbi4gIFVzaW5nIGpzb24gc2VlbXMKPj4+Pj4+
PiB2aWFibGUsIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyB0aGUgYmVzdCBvcHRpb24uICBJcyB0
aGVyZSBhbnkKPj4+Pj4+PiBwcmVjZWRlbnQgb2YgbWFya3VwIHN0cmluZ3MgcmV0dXJuZWQgdmlh
IHN5c2ZzIHdlIGNvdWxkIGZvbGxvdz8KPj4+Pj4gSSBkb24ndCB0aGluayBlbmNvZGluZyBjb21w
bGV4IGluZm9ybWF0aW9uIGluIGEgc3lzZnMgZmlsZSBpcyBhIHZpYWJsZQo+Pj4+PiBhcHByb2Fj
aC4gUXVvdGluZyBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3N5c2ZzLnJzdDoKPj4+Pj4KPj4+
Pj4gIkF0dHJpYnV0ZXMgc2hvdWxkIGJlIEFTQ0lJIHRleHQgZmlsZXMsIHByZWZlcmFibHkgd2l0
aCBvbmx5IG9uZSB2YWx1ZQo+Pj4+PiBwZXIgZmlsZS4gSXQgaXMgbm90ZWQgdGhhdCBpdCBtYXkg
bm90IGJlIGVmZmljaWVudCB0byBjb250YWluIG9ubHkgb25lCj4+Pj4+IHZhbHVlIHBlciBmaWxl
LCBzbyBpdCBpcyBzb2NpYWxseSBhY2NlcHRhYmxlIHRvIGV4cHJlc3MgYW4gYXJyYXkgb2YKPj4+
Pj4gdmFsdWVzIG9mIHRoZSBzYW1lIHR5cGUuCj4+Pj4+IE1peGluZyB0eXBlcywgZXhwcmVzc2lu
ZyBtdWx0aXBsZSBsaW5lcyBvZiBkYXRhLCBhbmQgZG9pbmcgZmFuY3kKPj4+Pj4gZm9ybWF0dGlu
ZyBvZiBkYXRhIGlzIGhlYXZpbHkgZnJvd25lZCB1cG9uLiIKPj4+Pj4KPj4+Pj4gRXZlbiB0aG91
Z2ggdGhpcyBpcyBhbiBvbGRlciBmaWxlLCBJIHRoaW5rIHRoZXNlIHJlc3RyaWN0aW9ucyBzdGls
bAo+Pj4+PiBhcHBseS4KPj4+PiArMSwgdGhhdCdzIGFub3RoZXIgcmVhc29uIHdoeSBkZXZsaW5r
KG5ldGxpbmspIGlzIGJldHRlci4KPj4+Pgo+Pj4gaGkgSmFzb24sCj4+PiBkbyB5b3UgaGF2ZSBh
bnkgbWF0ZXJpYWxzIG9yIHNhbXBsZSBjb2RlIGFib3V0IGRldmxpbmssIHNvIHdlIGNhbiBoYXZl
IGEgZ29vZAo+Pj4gc3R1ZHkgb2YgaXQ/Cj4+PiBJIGZvdW5kIHNvbWUga2VybmVsIGRvY3MgYWJv
dXQgaXQgYnV0IG15IHByZWxpbWluYXJ5IHN0dWR5IGRpZG4ndCBzaG93IG1lIHRoZQo+Pj4gYWR2
YW50YWdlIG9mIGRldmxpbmsuCj4+Cj4+IENDIEppcmkgYW5kIFBhcmF2IGZvciBhIGJldHRlciBh
bnN3ZXIgZm9yIHRoaXMuCj4+Cj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgZm9sbG93
aW5nIGFkdmFudGFnZXMgYXJlIG9idmlvdXMgKGFzIEkgcmVwbGllZAo+PiBpbiBhbm90aGVyIHRo
cmVhZCk6Cj4+Cj4+IC0gZXhpc3RpbmcgdXNlcnMgKE5JQywgY3J5cHRvLCBTQ1NJLCBpYiksIG1h
dHVyZSBhbmQgc3RhYmxlCj4+IC0gbXVjaCBiZXR0ZXIgZXJyb3IgcmVwb3J0aW5nIChleHRfYWNr
IG90aGVyIHRoYW4gc3RyaW5nIG9yIGVycm5vKQo+PiAtIG5hbWVzcGFjZSBhd2FyZQo+PiAtIGRv
IG5vdCBjb3VwbGUgd2l0aCBrb2JqZWN0Cj4gSmFzb24sIHdoYXQgaXMgeW91ciB1c2UgY2FzZT8K
CgpJIHRoaW5rIHRoZSB1c2UgY2FzZSBpcyB0byByZXBvcnQgZGV2aWNlIGNvbXBhdGliaWxpdHkg
Zm9yIGxpdmUgCm1pZ3JhdGlvbi4gWWFuIHByb3Bvc2VkIGEgc2ltcGxlIHN5c2ZzIGJhc2VkIG1p
Z3JhdGlvbiB2ZXJzaW9uIGZpcnN0LCAKYnV0IGl0IGxvb2tzIG5vdCBzdWZmaWNpZW50IGFuZCBz
b21ldGhpbmcgYmFzZWQgb24gSlNPTiBpcyBkaXNjdXNzZWQuCgpZYW4sIGNhbiB5b3UgaGVscCB0
byBzdW1tYXJpemUgdGhlIGRpc2N1c3Npb24gc28gZmFyIGZvciBKaXJpIGFzIGEgCnJlZmVyZW5j
ZT8KClRoYW5rcwoKCj4KPgo+Cj4+IFRoYW5rcwo+Pgo+Pgo+Pj4gVGhhbmtzCj4+PiBZYW4KPj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXYK
