Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C723C3B5
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Aug 2020 04:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079E6E49B;
	Wed,  5 Aug 2020 02:50:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D656E49B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Aug 2020 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596595802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j55K/Dwi4G9px2pH7AKtokjX8kCpdSz/LKIcvwedD1k=;
 b=afWARa0NvLkRh0JvEp1x0dRzArwgCYrO1/UtV1rE+66eh7BLLyMZn3FVmSCq+clMkiqB0z
 EbpVbL99OoAAvFE2igyE1dnAfMQr7sgcBC/O9vNsZND0yGg2DXY/WytWpH1Cui/p4SZ+M3
 QiTwxiOZ41/Y68wXa4zRCx/46tXz51c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-0uvxif-TMCaNGmd8p_0tTQ-1; Tue, 04 Aug 2020 22:42:25 -0400
X-MC-Unique: 0uvxif-TMCaNGmd8p_0tTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97D3A101C8A0;
 Wed,  5 Aug 2020 02:42:22 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 285AA28559;
 Wed,  5 Aug 2020 02:41:55 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Yan Zhao <yan.y.zhao@intel.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040> <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040> <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
Date: Wed, 5 Aug 2020 10:41:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805021654.GB30485@joy-OptiPlex-7040>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com, corbet@lwn.net,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC81IOS4iuWNiDEwOjE2LCBZYW4gWmhhbyB3cm90ZToKPiBPbiBXZWQsIEF1ZyAw
NSwgMjAyMCBhdCAxMDoyMjoxNUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDIw
LzgvNSDkuIrljYgxMjozNSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPj4+IFtzb3JyeSBhYm91dCBu
b3QgY2hpbWluZyBpbiBlYXJsaWVyXQo+Pj4KPj4+IE9uIFdlZCwgMjkgSnVsIDIwMjAgMTY6MDU6
MDMgKzA4MDAKPj4+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4+IE9uIE1vbiwgSnVsIDI3LCAyMDIwIGF0IDA0OjIzOjIxUE0gLTA2MDAsIEFsZXggV2lsbGlh
bXNvbiB3cm90ZToKPj4+ICguLi4pCj4+Pgo+Pj4+PiBCYXNlZCBvbiB0aGUgZmVlZGJhY2sgd2Un
dmUgcmVjZWl2ZWQsIHRoZSBwcmV2aW91c2x5IHByb3Bvc2VkIGludGVyZmFjZQo+Pj4+PiBpcyBu
b3QgdmlhYmxlLiAgSSB0aGluayB0aGVyZSdzIGFncmVlbWVudCB0aGF0IHRoZSB1c2VyIG5lZWRz
IHRvIGJlCj4+Pj4+IGFibGUgdG8gcGFyc2UgYW5kIGludGVycHJldCB0aGUgdmVyc2lvbiBpbmZv
cm1hdGlvbi4gIFVzaW5nIGpzb24gc2VlbXMKPj4+Pj4gdmlhYmxlLCBidXQgSSBkb24ndCBrbm93
IGlmIGl0J3MgdGhlIGJlc3Qgb3B0aW9uLiAgSXMgdGhlcmUgYW55Cj4+Pj4+IHByZWNlZGVudCBv
ZiBtYXJrdXAgc3RyaW5ncyByZXR1cm5lZCB2aWEgc3lzZnMgd2UgY291bGQgZm9sbG93Pwo+Pj4g
SSBkb24ndCB0aGluayBlbmNvZGluZyBjb21wbGV4IGluZm9ybWF0aW9uIGluIGEgc3lzZnMgZmls
ZSBpcyBhIHZpYWJsZQo+Pj4gYXBwcm9hY2guIFF1b3RpbmcgRG9jdW1lbnRhdGlvbi9maWxlc3lz
dGVtcy9zeXNmcy5yc3Q6Cj4+Pgo+Pj4gIkF0dHJpYnV0ZXMgc2hvdWxkIGJlIEFTQ0lJIHRleHQg
ZmlsZXMsIHByZWZlcmFibHkgd2l0aCBvbmx5IG9uZSB2YWx1ZQo+Pj4gcGVyIGZpbGUuIEl0IGlz
IG5vdGVkIHRoYXQgaXQgbWF5IG5vdCBiZSBlZmZpY2llbnQgdG8gY29udGFpbiBvbmx5IG9uZQo+
Pj4gdmFsdWUgcGVyIGZpbGUsIHNvIGl0IGlzIHNvY2lhbGx5IGFjY2VwdGFibGUgdG8gZXhwcmVz
cyBhbiBhcnJheSBvZgo+Pj4gdmFsdWVzIG9mIHRoZSBzYW1lIHR5cGUuCj4+PiBNaXhpbmcgdHlw
ZXMsIGV4cHJlc3NpbmcgbXVsdGlwbGUgbGluZXMgb2YgZGF0YSwgYW5kIGRvaW5nIGZhbmN5Cj4+
PiBmb3JtYXR0aW5nIG9mIGRhdGEgaXMgaGVhdmlseSBmcm93bmVkIHVwb24uIgo+Pj4KPj4+IEV2
ZW4gdGhvdWdoIHRoaXMgaXMgYW4gb2xkZXIgZmlsZSwgSSB0aGluayB0aGVzZSByZXN0cmljdGlv
bnMgc3RpbGwKPj4+IGFwcGx5Lgo+Pgo+PiArMSwgdGhhdCdzIGFub3RoZXIgcmVhc29uIHdoeSBk
ZXZsaW5rKG5ldGxpbmspIGlzIGJldHRlci4KPj4KPiBoaSBKYXNvbiwKPiBkbyB5b3UgaGF2ZSBh
bnkgbWF0ZXJpYWxzIG9yIHNhbXBsZSBjb2RlIGFib3V0IGRldmxpbmssIHNvIHdlIGNhbiBoYXZl
IGEgZ29vZAo+IHN0dWR5IG9mIGl0Pwo+IEkgZm91bmQgc29tZSBrZXJuZWwgZG9jcyBhYm91dCBp
dCBidXQgbXkgcHJlbGltaW5hcnkgc3R1ZHkgZGlkbid0IHNob3cgbWUgdGhlCj4gYWR2YW50YWdl
IG9mIGRldmxpbmsuCgoKQ0MgSmlyaSBhbmQgUGFyYXYgZm9yIGEgYmV0dGVyIGFuc3dlciBmb3Ig
dGhpcy4KCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgZm9sbG93aW5nIGFkdmFudGFnZXMg
YXJlIG9idmlvdXMgKGFzIEkgCnJlcGxpZWQgaW4gYW5vdGhlciB0aHJlYWQpOgoKLSBleGlzdGlu
ZyB1c2VycyAoTklDLCBjcnlwdG8sIFNDU0ksIGliKSwgbWF0dXJlIGFuZCBzdGFibGUKLSBtdWNo
IGJldHRlciBlcnJvciByZXBvcnRpbmcgKGV4dF9hY2sgb3RoZXIgdGhhbiBzdHJpbmcgb3IgZXJy
bm8pCi0gbmFtZXNwYWNlIGF3YXJlCi0gZG8gbm90IGNvdXBsZSB3aXRoIGtvYmplY3QKClRoYW5r
cwoKCj4KPiBUaGFua3MKPiBZYW4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
