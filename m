Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A6249314
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 04:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2051189B49;
	Wed, 19 Aug 2020 02:54:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152889B49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 02:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597805672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyfXHDOh3tadbBcQyUmurCPsA+lHPesiQMeXAJCp/nc=;
 b=dcpQHrdjp17Mw2qkMauO5Q20k1w9svhtM7bKfvmSfkbXPpdv/JnC1cbJ8i7l/X+f4Kouux
 IT8s+z7g2+S5F0hA1rI5/Yh3iEoqpwoEUFHLLT/AiICOd/mjC9G/T6Y3x4skwYxlllUFSU
 g6Vbe66q1f1qQgn+9b9mmij7uSY1qIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-Ay-EfPfqMQ6MMOO5kbt_wg-1; Tue, 18 Aug 2020 22:54:29 -0400
X-MC-Unique: Ay-EfPfqMQ6MMOO5kbt_wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7656381F030;
 Wed, 19 Aug 2020 02:54:26 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D15481B47B;
 Wed, 19 Aug 2020 02:54:08 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040> <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e862b946-6688-0a75-47ae-9ca16a759c38@redhat.com>
Date: Wed, 19 Aug 2020 10:54:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818113652.5d81a392.cohuck@redhat.com>
Content-Language: en-US
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOCDkuIvljYg1OjM2LCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+IE9uIFR1ZSwg
MTggQXVnIDIwMjAgMTA6MTY6MjggKzAxMDAKPiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5n
ZUByZWRoYXQuY29tPiB3cm90ZToKPgo+PiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAwNTowMTo1
MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4gICAgIE9uIDIwMjAvOC8xOCDkuIvljYg0
OjU1LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+Pj4KPj4+ICAgT24gVHVlLCBBdWcgMTgs
IDIwMjAgYXQgMTE6MjQ6MzBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Cj4+PiAgIE9u
IDIwMjAvOC8xNCDkuIvljYgxOjE2LCBZYW4gWmhhbyB3cm90ZToKPj4+Cj4+PiAgIE9uIFRodSwg
QXVnIDEzLCAyMDIwIGF0IDEyOjI0OjUwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pgo+
Pj4gICBPbiAyMDIwLzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8gd3JvdGU6Cj4+PiAgIHdlIGFj
dHVhbGx5IGNhbiBhbHNvIHJldHJpZXZlIHRoZSBzYW1lIGluZm9ybWF0aW9uIHRocm91Z2ggc3lz
ZnMsIC5lLmcKPj4+Cj4+PiAgIHwtIFtwYXRoIHRvIGRldmljZV0KPj4+ICAgICAgfC0tLSBtaWdy
YXRpb24KPj4+ICAgICAgfCAgICAgfC0tLSBzZWxmCj4+PiAgICAgIHwgICAgIHwgICB8LS0tZGV2
aWNlX2FwaQo+Pj4gICAgICB8ICAgIHwgICB8LS0tbWRldl90eXBlCj4+PiAgICAgIHwgICAgfCAg
IHwtLS1zb2Z0d2FyZV92ZXJzaW9uCj4+PiAgICAgIHwgICAgfCAgIHwtLS1kZXZpY2VfaWQKPj4+
ICAgICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPj4+ICAgICAgfCAgICAgfC0tLSBjb21wYXRp
YmxlCj4+PiAgICAgIHwgICAgIHwgICB8LS0tZGV2aWNlX2FwaQo+Pj4gICAgICB8ICAgIHwgICB8
LS0tbWRldl90eXBlCj4+PiAgICAgIHwgICAgfCAgIHwtLS1zb2Z0d2FyZV92ZXJzaW9uCj4+PiAg
ICAgIHwgICAgfCAgIHwtLS1kZXZpY2VfaWQKPj4+ICAgICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0
b3IKPj4+Cj4+Pgo+Pj4gICBZZXMgYnV0Ogo+Pj4KPj4+ICAgLSBZb3UgbmVlZCBvbmUgZmlsZSBw
ZXIgYXR0cmlidXRlIChvbmUgc3lzY2FsbCBmb3Igb25lIGF0dHJpYnV0ZSkKPj4+ICAgLSBBdHRy
aWJ1dGUgaXMgY291cGxlZCB3aXRoIGtvYmplY3QKPiBJcyB0aGF0IHJlYWxseSB0aGF0IGJhZD8g
WW91IGhhdmUgdGhlIGRldmljZSB3aXRoIGFuIGVtYmVkZGVkIGtvYmplY3QKPiBhbnl3YXksIGFu
ZCB5b3UgY2FuIGp1c3QgcHV0IHRoaW5ncyBpbnRvIGFuIGF0dHJpYnV0ZSBncm91cD8KCgpZZXMs
IGJ1dCBhbGwgb2YgdGhpcyBjb3VsZCBiZSBkb25lIHZpYSBkZXZsaW5rKG5ldGxpbmspIGFzIHdl
bGwgd2l0aCBsb3cgCm92ZXJoZWFkLgoKCj4KPiBbQWxzbywgSSB0aGluayB0aGF0IHNlbGYvY29t
cGF0aWJsZSBzcGxpdCBpbiB0aGUgZXhhbXBsZSBtYWtlcyB0aGluZ3MKPiBuZWVkbGVzc2x5IGNv
bXBsZXguIFNob3VsZG4ndCBzZW1hbnRpYyB2ZXJzaW9uaW5nIGFuZCBtYXRjaGluZyBhbHJlYWR5
Cj4gY292ZXIgbmVhcmx5IGV2ZXJ5dGhpbmc/CgoKVGhhdCdzIG15IHF1ZXN0aW9uIGFzIHdlbGwu
IEUuZyBmb3IgdmlydGlvLCB2ZXJzaW9uaW5nIG1heSBub3QgZXZlbiAKd29yaywgc29tZSBvZiBm
ZWF0dXJlcyBhcmUgbmVnb3RpYXRlZCBpbmRlcGVuZGVudGx5OgoKU291cmNlIGZlYXR1cmVzOiBB
LCBCLCBDCkRlc3QgZmVhdHVyZXM6IEEsIEIsIEMsIEUKCldlIGp1c3QgbmVlZCB0byBtYWtlIHN1
cmUgdGhlIGRlc3QgZmVhdHVyZXMgaXMgYSBzdXBlcnNldCBvZiBzb3VyY2UgdGhlbiAKYWxsIHNl
dC4KCgo+ICAgSSB3b3VsZCBleHBlY3QgdmVyeSBmZXcgY2FzZXMgdGhhdCBhcmUgbW9yZQo+IGNv
bXBsZXggdGhhbiB0aGF0LiBNYXliZSB0aGUgYWdncmVnYXRpb24gc3R1ZmYsIGJ1dCBJIGRvbid0
IHRoaW5rIHdlCj4gbmVlZCB0aGF0IHNlbGYvY29tcGF0aWJsZSBzcGxpdCBmb3IgdGhhdCwgZWl0
aGVyLl0KPgo+Pj4gICBBbGwgb2YgYWJvdmUgc2VlbXMgdW5uZWNlc3NhcnkuCj4+Pgo+Pj4gICBB
bm90aGVyIHBvaW50LCBhcyB3ZSBkaXNjdXNzZWQgaW4gYW5vdGhlciB0aHJlYWQsIGl0J3MgcmVh
bGx5IGhhcmQgdG8gbWFrZQo+Pj4gICBzdXJlIHRoZSBhYm92ZSBBUEkgd29yayBmb3IgYWxsIHR5
cGVzIG9mIGRldmljZXMgYW5kIGZyYW1ld29ya3MuIFNvIGhhdmluZyBhCj4+PiAgIHZlbmRvciBz
cGVjaWZpYyBBUEkgbG9va3MgbXVjaCBiZXR0ZXIuCj4+Pgo+Pj4gICBGcm9tIHRoZSBQT1Ygb2Yg
dXNlcnNwYWNlIG1nbXQgYXBwcyBkb2luZyBkZXZpY2UgY29tcGF0IGNoZWNraW5nIC8gbWlncmF0
aW9uLAo+Pj4gICB3ZSBjZXJ0YWlubHkgZG8gTk9UIHdhbnQgdG8gdXNlIGRpZmZlcmVudCB2ZW5k
b3Igc3BlY2lmaWMgQVBJcy4gV2Ugd2FudCB0bwo+Pj4gICBoYXZlIGFuIEFQSSB0aGF0IGNhbiBi
ZSB1c2VkIC8gY29udHJvbGxlZCBpbiBhIHN0YW5kYXJkIG1hbm5lciBhY3Jvc3MgdmVuZG9ycy4K
Pj4+Cj4+PiAgICAgWWVzLCBidXQgaXQgY291bGQgYmUgaGFyZC4gRS5nIHZEUEEgd2lsbCBjaG9z
ZSB0byB1c2UgZGV2bGluayAodGhlcmUncyBhCj4+PiAgICAgbG9uZyBkZWJhdGUgb24gc3lzZnMg
dnMgZGV2bGluaykuIFNvIGlmIHdlIGdvIHdpdGggc3lzZnMsIGF0IGxlYXN0IHR3bwo+Pj4gICAg
IEFQSXMgbmVlZHMgdG8gYmUgc3VwcG9ydGVkIC4uLgo+PiBOQiwgSSB3YXMgbm90IHF1ZXN0aW9u
aW5nIGRldmxpbmsgdnMgc3lzZnMgZGlyZWN0bHkuIElmIGRldmxpbmsgaXMgcmVsYXRlZAo+PiB0
byBuZXRsaW5rLCBJIGNhbid0IHNheSBJJ20gZW50aHVzaWFzdGljIGFzIElNS0Ugc3lzZnMgaXMg
ZWFzaWVyIHRvIGRlYWwKPj4gd2l0aC4gSSBkb24ndCBrbm93IGVub3VnaCBhYm91dCBkZXZsaW5r
IHRvIGhhdmUgbXVjaCBvZiBhbiBvcGluaW9uIHRob3VnaC4KPj4gVGhlIGtleSBwb2ludCB3YXMg
dGhhdCBJIGRvbid0IHdhbnQgdGhlIHVzZXJzcGFjZSBBUElzIHdlIG5lZWQgdG8gZGVhbCB3aXRo
Cj4+IHRvIGJlIHZlbmRvciBzcGVjaWZpYy4KPiAgRnJvbSB3aGF0IEkndmUgc2VlbiBvZiBkZXZs
aW5rLCBpdCBzZWVtcyBxdWl0ZSBuaWNlOyBidXQgSSB1bmRlcnN0YW5kCj4gd2h5IHN5c2ZzIG1p
Z2h0IGJlIGVhc2llciB0byBkZWFsIHdpdGggKGVzcGVjaWFsbHkgYXMgdGhlcmUncyBsaWtlbHkK
PiBhbHJlYWR5IGEgbG90IG9mIGNvZGUgdXNpbmcgaXQuKQo+Cj4gSSB1bmRlcnN0YW5kIHRoYXQg
c29tZSB1c2VycyB3b3VsZCBsaWtlIGRldmxpbmsgYmVjYXVzZSBpdCBpcyBhbHJlYWR5Cj4gd2lk
ZWx5IHVzZWQgZm9yIG5ldHdvcmsgZHJpdmVycyAoYW5kIHNvbWUgb3RoZXJzKSwgYnV0IEkgZG9u
J3QgdGhpbmsKPiB0aGUgbWFqb3JpdHkgb2YgZGV2aWNlcyB1c2VkIHdpdGggdmZpbyBhcmUgbmV0
d29yayAoYWx0aG91Z2ggY2VydGFpbmx5Cj4gYSBsb3Qgb2YgdGhlbSBhcmUuKQoKCk5vdGUgdGhh
dCB0aG91Z2ggZGV2bGluayBjb3VsZCBiZSBwb3B1bGFyIG9ubHkgaW4gbmV0d29yayBkZXZpY2Vz
LCAKbmV0bGluayBpcyB3aWRlbHkgdXNlZCBieSBhIGxvdCBvZiBzdWJzeXN0ZXNtIChlLmcgU0NT
SSkuCgpUaGFua3MKCgo+Cj4+IFdoYXQgSSBjYXJlIGFib3V0IGlzIHRoYXQgd2UgaGF2ZSBhICpz
dGFuZGFyZCogdXNlcnNwYWNlIEFQSSBmb3IgcGVyZm9ybWluZwo+PiBkZXZpY2UgY29tcGF0aWJp
bGl0eSBjaGVja2luZyAvIHN0YXRlIG1pZ3JhdGlvbiwgZm9yIHVzZSBieSBRRU1VL2xpYnZpcnQv
Cj4+IE9wZW5TdGFjaywgc3VjaCB0aGF0IHdlIGNhbiB3cml0ZSBjb2RlIHdpdGhvdXQgY291bnRs
ZXNzIHZlbmRvciBzcGVjaWZpYwo+PiBjb2RlIHBhdGhzLgo+Pgo+PiBJZiB0aGVyZSBpcyB2ZW5k
b3Igc3BlY2lmaWMgc3R1ZmYgb24gdGhlIHNpZGUsIHRoYXQncyBmaW5lIGFzIHdlIGNhbiBpZ25v
cmUKPj4gdGhhdCwgYnV0IHRoZSBjb3JlIGZ1bmN0aW9uYWxpdHkgZm9yIGRldmljZSBjb21wYXQg
LyBtaWdyYXRpb24gbmVlZHMgdG8gYmUKPj4gc3RhbmRhcmRpemVkLgo+IFRvIHN1bW1hcml6ZToK
PiAtIGNob29zZSBvbmUgb2Ygc3lzZnMgb3IgZGV2bGluawo+IC0gaGF2ZSBhIGNvbW1vbiBpbnRl
cmZhY2UsIHdpdGggYSBzdGFuZGFyZGl6ZWQgd2F5IHRvIGFkZAo+ICAgIHZlbmRvci1zcGVjaWZp
YyBhdHRyaWJ1dGVzCj4gPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2Cg==
