Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97721FFCC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jul 2020 23:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ADE6E9D0;
	Tue, 14 Jul 2020 21:15:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B77E6E9D0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jul 2020 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594761341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2yUeCVBNsfxz7e6hyfh6Da3oh4d7VUvdlsBl1XdrAE=;
 b=RGSkQqDmz2TJCII72I9CfbGYZJp02spWWo4HCBJMOPw42UszpIKMc1WEtEpUsBc4VO7GSs
 +0hNZuc3ASsCclwoLvg5DeU/qn9OPQA92w9HUhnc7l4fLqpkD5ydkIcYuMwQe4vTW9xAo5
 xJx/ujrhrm4KOIiN/oOORJUfk/MWNUA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-URhX2teEPMKw1JoMHRGqCA-1; Tue, 14 Jul 2020 17:15:37 -0400
X-MC-Unique: URhX2teEPMKw1JoMHRGqCA-1
Received: by mail-wm1-f70.google.com with SMTP id v6so35779wmg.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jul 2020 14:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2yUeCVBNsfxz7e6hyfh6Da3oh4d7VUvdlsBl1XdrAE=;
 b=GaG/j6DKlR1+Ztu8O6SDMqYvZ8ZHFdJsrDEpS6qK1WqhdoxJXnDjikTT34fZSLemp3
 /QfFWZnsYxsTj/3Ro/SMBvOPKX1kePHQdwBgRq7Q8oWwbxKgfTAThcD0TxO00KDSgpi2
 ycqrewa5sY7FhPp6WPTttYvawjISPvBU8JFpUPv8mhQLmK6CQzvUH3l+D7bVzrBZber2
 t9NUM3qhK3QH9iu7UzHownQMMoUyyCQEjV7aTwCksWhdGadT8f4DF0GdL08QoJf2A9Zh
 VureCeUsb9V944gKTFgmE5zs8RK4YPWBOBgFvTLzL1JrF/bdIdNYldQuAAVz/57RQJNT
 HyNw==
X-Gm-Message-State: AOAM530/PEPigvlYnz7CCCWX6w0BzhkaxETkSpETe0Hcxnxquq+Pscv2
 xLfnvwHVo8iQLU5yqgV+EEt8AVu/KmpWhstFScMAq2wpLwA4W2syCK1nXwPEyagrOhEY2vm7xDC
 ubrNhH0cN4ER4zw3jqZhj6VxaXgYvyplNzQ==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr5612105wmj.107.1594761336002; 
 Tue, 14 Jul 2020 14:15:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmmveBRhbrDsLjXFLsE9r4jBFfkufRjmQ42Q0iOcp97kp81seqQ1oTs2zclhWmQWnZ96pqPA==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr5612060wmj.107.1594761335391; 
 Tue, 14 Jul 2020 14:15:35 -0700 (PDT)
Received: from pop-os ([51.37.88.107])
 by smtp.gmail.com with ESMTPSA id z8sm42307wmg.39.2020.07.14.14.15.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 14:15:34 -0700 (PDT)
Message-ID: <8ef6f52dd7e03d19c7d862350f2d1ecf070f1d63.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Date: Tue, 14 Jul 2020 22:15:33 +0100
In-Reply-To: <eb705c72cdc8b6b8959b6ebaeeac6069a718d524.camel@redhat.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <febb463fc7494aa20b6f57fef469cce7279d2c9a.camel@redhat.com>
 <20200714110148.0471c03c@x1.home>
 <eb705c72cdc8b6b8959b6ebaeeac6069a718d524.camel@redhat.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, hejie.xu@intel.com,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org,
 Shaohe Feng <shaohe.feng@intel.com>, kevin.tian@intel.com,
 Yan Zhao <yan.y.zhao@intel.com>, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, qemu-devel@nongnu.org,
 bao.yumeng@zte.com.cn, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 Daniel Berrange <berrange@redhat.com>, cohuck@redhat.com, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

cmVzZW5kaW5nIHdpdGggZnVsbCBjYyBsaXN0IHNpbmNlIGkgaGFkIHRoaXMgdHlwZWQgdXAKaSB3
b3VsZCBibGFtZSBteSBlbWFpbCBwcm92aWVyIGJ1dCBteSBlbWFpbCBjbGllbnQgZG9lcyBub3Qg
c2VhbSB0byBsaWtlIGxvbmcgY2MgbGlzdHMuCndlIHByb2JhYmx5IHdhbnQgdG8gY29udGludWUg
b24gIGFsZXgncyB0aHJlYWQgdG8gbm90IHNwbGl0IHRoZSBkaXNzY3VzaW9uLgpidXQgaSBoYXZl
IHJlc3BvbmVkIGlubGluZSB3aXRoIHNvbWUgZXhhbXBsZSBvZiAgaG93IG9wZW5zdGFjayBzY2hk
dWxlcyBhbmQgd2hhdCBpIG1lbnQgYnkgZGlmZmVyZW50IG1kZXZfdHlwZXMKCgpPbiBUdWUsIDIw
MjAtMDctMTQgYXQgMjA6MjkgKzAxMDAsIFNlYW4gTW9vbmV5IHdyb3RlOgo+IE9uIFR1ZSwgMjAy
MC0wNy0xNCBhdCAxMTowMSAtMDYwMCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+ID4gT24gVHVl
LCAxNCBKdWwgMjAyMCAxMzozMzoyNCArMDEwMAo+ID4gU2VhbiBNb29uZXkgPHNtb29uZXlAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gT24gVHVlLCAyMDIwLTA3LTE0IGF0IDExOjIxICsw
MTAwLCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgSnVsIDE0LCAy
MDIwIGF0IDA3OjI5OjU3QU0gKzA4MDAsIFlhbiBaaGFvIHdyb3RlOiAgCj4gPiA+ID4gPiBoaSBm
b2xrcywKPiA+ID4gPiA+IHdlIGFyZSBkZWZpbmluZyBhIGRldmljZSBtaWdyYXRpb24gY29tcGF0
aWJpbGl0eSBpbnRlcmZhY2UgdGhhdCBoZWxwcyB1cHBlcgo+ID4gPiA+ID4gbGF5ZXIgc3RhY2sg
bGlrZSBvcGVuc3RhY2svb3ZpcnQvbGlidmlydCB0byBjaGVjayBpZiB0d28gZGV2aWNlcyBhcmUK
PiA+ID4gPiA+IGxpdmUgbWlncmF0aW9uIGNvbXBhdGlibGUuCj4gPiA+ID4gPiBUaGUgImRldmlj
ZXMiIGhlcmUgY291bGQgYmUgTURFVnMsIHBoeXNpY2FsIGRldmljZXMsIG9yIGh5YnJpZCBvZiB0
aGUgdHdvLgo+ID4gPiA+ID4gZS5nLiB3ZSBjb3VsZCB1c2UgaXQgdG8gY2hlY2sgd2hldGhlcgo+
ID4gPiA+ID4gLSBhIHNyYyBNREVWIGNhbiBtaWdyYXRlIHRvIGEgdGFyZ2V0IE1ERVYsICAKPiA+
ID4gCj4gPiA+IG1kZXYgbGl2ZSBtaWdyYXRpb24gaXMgY29tcGxldGVseSBwb3NzaWJsZSB0byBk
byBidXQgaSBhZ3JlZSB3aXRoIERhbiBiYXJyYW5nZSdzIGNvbW1lbnRzCj4gPiA+IGZyb20gdGhl
IHBvaW50IG9mIHZpZXcgb2Ygb3BlbnN0YWNrIGludGVncmF0aW9uIGkgZG9udCBzZWUgY2FsbGlu
ZyBvdXQgdG8gYSB2ZW5kZXIgc2VwZWNpZmljCj4gPiA+IHRvb2wgdG8gYmUgYW4gYWNjcGV0YWJs
ZQo+ID4gCj4gPiBBcyBJIHJlcGxpZWQgdG8gRGFuLCBJJ20gaG9waW5nIFlhbiB3YXMgcmVmZXJy
aW5nIG1vcmUgdG8gdmVuZG9yCj4gPiBzcGVjaWZpYyBrbm93bGVkZ2UgcmF0aGVyIHRoYW4gYWN0
dWFsIHRvb2xzLgo+ID4gCj4gPiA+IHNvbHV0aW9ucyBmb3IgZGV2aWNlIGNvbXBhdGlhYmxpdHkg
Y2hlY2tpbmcuIHRoZSBzeXMgZmlsZXN5c3RlbQo+ID4gPiB0aGF0IGRlc2NyaWJzIHRoZSBtZGV2
cyB0aGF0IGNhbiBiZSBjcmVhdGVkIHNob3VkbCBhbHNvCj4gPiA+IGNvbnRhaW4gdGhlIHJlbGV2
ZW50IGluZm9tYXRpb24gc3VjaAo+ID4gPiB0YWh0IG5vdmEgY291bGQgaW50ZWdyYXRlIGl0IHZp
YSBsaWJ2aXJ0IHhtbCByZXByZXNlbnRhdGlvbiBvciBkaXJlY3RseSByZXRyaXZlIHRoZQo+ID4g
PiBpbmZvIGZyb20KPiA+ID4gc3lzZnMuCj4gPiA+ID4gPiAtIGEgc3JjIFZGIGluIFNSSU9WIGNh
biBtaWdyYXRlIHRvIGEgdGFyZ2V0IFZGIGluIFNSSU9WLCAgCj4gPiA+IAo+ID4gPiBzbyB2ZiB0
byB2ZiBtaWdyYXRpb24gaXMgbm90IHBvc3NpYmxlIGluIHRoZSBnZW5lcmFsIGNhc2UgYXMgdGhl
cmUgaXMgbm8gc3RhbmRhcmlzZWQKPiA+ID4gd2F5IHRvIHRyYW5zZmVyIHRlaCBkZXZpY2Ugc3Rh
dGUgYXMgcGFydCBvZiB0aGUgc2lvcnYgc3BlY3MgcHJvZHVjZWQgYnkgdGhlIHBjaS1zaWcKPiA+
ID4gYXMgc3VjaCB0aGVyZSBpcyBub3QgdmVuZGVyIG5ldXRyYWwgd2F5IHRvIHN1cHBvcnQgc3Jp
b3YgbGl2ZSBtaWdyYXRpb24uIAo+ID4gCj4gPiBXZSdyZSBub3QgdGFsa2luZyBhYm91dCBhIGdl
bmVyYWwgY2FzZSwgd2UncmUgdGFsa2luZyBhYm91dCBwaHlzaWNhbAo+ID4gZGV2aWNlcyB3aGlj
aCBoYXZlIHZmaW8gd3JhcHBlcnMgb3IgaG9va3Mgd2l0aCBkZXZpY2Ugc3BlY2lmaWMKPiA+IGtu
b3dsZWRnZSBpbiBvcmRlciB0byBzdXBwb3J0IHRoZSB2ZmlvIG1pZ3JhdGlvbiBpbnRlcmZhY2Uu
ICBUaGUgcG9pbnQKPiA+IGlzIHRoYXQgYSBkaXNjdXNzaW9uIGFyb3VuZCB2ZmlvIGRldmljZSBt
aWdyYXRpb24gY2Fubm90IGJlIGxpbWl0ZWQgdG8KPiA+IG1kZXYgZGV2aWNlcy4KPiAKPiBvayB1
cHN0cmVhbSBpbiAgb3BlbnN0YWNrIGF0IGxlYXN0IHdlIGRvIG5vdCBwbGFuIHRvIHN1cHBvcnQg
Z2VuZXJpYyBsaXZlbWlncmF0aW9uCj4gZm9yIHBhc3N0aG91Z2ggZGV2aXZjZXMuIHdlIGNoZWF0
IHdpdGggbmV0d29yayBpbnRlcmZhY2VzIHNpbmNlIGluIGdlbmVyYWx5IG9wZXJhdGluZwo+IHN5
c3RlbXMgaGFuZGVsIGhvdHBsdWcgb2YgYSBuaWMgc29tZXdoYXQgc2FmZWx5IHNvIHdlaHJlIG5v
IGFic3RyYWN0aW9uIGxheWVyIGxpa2UKPiBhbiBtZGV2IGlzIHByZXNlbnQgb3IgYSBtYWN2dGFw
IGRldmljZSB3ZSBob3QgdW5wbHVnIHRoZSBuaWMgYmVmb3JlIHRoZSBtaWdyYXRpb24KPiBhbmQg
YXR0YWNoIGEgbmV3IG9uZSBhZnRlci4gIGZvciBncHVzIG9yIGNyeXB0byBjYXJkcyB0aGlzIGxp
a2VseSB3b3VsZCBub3QgYmUgdmlhYmxlCj4gc2luY2UgeW91IGNhbiBib25kIGdlbmVyaWMgaGFy
ZHdhcmUgZGV2aWNlcyB0byBoaWRlIHRoZSByZW1vdmFsIGFuZCByZWFkZHRpb24gb2YgYSBnZW5l
cmljCj4gcGNpIGRldmljZS4gd2Ugd2VyZSBob3BpbmcgdGhhdCB0aGVyZSB3b3VsZCBiZSBhIGNv
bnZlcmdlbmNhIGFyb3VuZCBNREVWcyBhcyBhIHdheSB0byBwcm92aWRlCj4gdGhhdCBhYnN0cmFj
dGlvbiBnb2luZyBmb3J3YXJkIGZvciBnZW5lcmljIGRldmljZSBvciBzb21lIG90aGVyIG5ldyBt
ZWNoYW5pc3VtIGluIHRoZSBmdXR1cmUuCj4gPiAKPiA+ID4gPiA+IC0gYSBzcmMgTURFViBjYW4g
bWlncmF0aW9uIHRvIGEgdGFyZ2V0IFZGIGluIFNSSU9WLiAgCj4gPiA+IAo+ID4gPiB0aGF0IGFs
c28gbWFrZXMgdGhpcyB1bnZpYWJsZQo+ID4gPiA+ID4gICAoZS5nLiBTSU9WL1NSSU9WIGJhY2t3
YXJkIGNvbXBhdGliaWxpdHkgY2FzZSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIHVwcGVyIGxh
eWVyIHN0YWNrIGNvdWxkIHVzZSB0aGlzIGludGVyZmFjZSBhcyB0aGUgbGFzdCBzdGVwIHRvIGNo
ZWNrCj4gPiA+ID4gPiBpZiBvbmUgZGV2aWNlIGlzIGFibGUgdG8gbWlncmF0ZSB0byBhbm90aGVy
IGRldmljZSBiZWZvcmUgdHJpZ2dlcmluZyBhIHJlYWwKPiA+ID4gPiA+IGxpdmUgbWlncmF0aW9u
IHByb2NlZHVyZS4gIAo+ID4gPiAKPiA+ID4gd2VsbCBhY3R1bGx5IHRoYXQgaXMgYWxyZWFkeSB0
b28gbGF0ZSByZWFsbHkuIGlkZWFsbHkgd2Ugd291bGQgd2FudCB0byBkbyB0aGlzIGNvbXBhaWFi
bGl0eQo+ID4gPiBjaGVjayBtdWNoIHNvb25lZXIgdG8gYXZvaWQgdGhlIG1pZ3JhdGlvbiBmYWls
aW5nLiBpbiBhbiBvcGVuc3RhY2sgZW52aW9ubWVudCAgYXQgbGVhc3QKPiA+ID4gYnkgdGhlIHRp
bWUgd2UgaW52b2tlIGxpYnZpcnQgKGFzc3VtaW5nIHlvdXIgdXNpbmcgdGhlIGxpYnZpcnQgZHJp
dmVyKSB0byBkbyB0aGUgbWlncmF0aW9uIHdlIGhhdmUgYWxyZWFlZHkKPiA+ID4gZmluaXNoZWQg
c2NoZHVsaW5nIHRoZSBpbnN0YW5jZSB0byB0aGUgbmV3IGhvc3QuIGlmIGlmIHdlIGRvIHRoZSBj
b21wYXRpYWJsaXR5IGNoZWNrIGF0IHRoaXMgcG9pbnQKPiA+ID4gYW5kIGl0IGZhaWxzIHRoZW4g
dGhlIGxpdmUgbWlncmF0aW9uIGlzIGFib3J0ZWQgYW5kIHdpbGwgbm90IGJlIHJldGlyZWQuIFRo
ZXNlIHR5cGVzIG9mIGxhdGUgY2hlY2sgbGVhZCB0byBhCj4gPiA+IHBvb3IgdXNlciBleHBlcmlu
Y2UgYXMgdW5sZXNzIHlvdSBjaGVjayB0aGUgbWlncmF0aW9uIGRldGlhbCBpdCBiYXNpY2FsbHkg
bG9va3MgbGlrZSB0aGUgbWlncmF0aW9uIHdhcyBpZ25vcmVkCj4gPiA+IGFzIGl0IHN0YXJ0IHRv
IG1pZ3JhdGUgYW5kIHRoZW4gY29udGludWdlIHJ1bm5pbmcgb24gdGhlIG9yZ2luaW5hbCBob3N0
Lgo+ID4gPiAKPiA+ID4gd2hlbiB1c2luZyBnZW5lcmljIHBjaSBwYXNzaG90dWhnIHdpdGggb3Bl
bnN0YWNrLCB0aGUgcGNpIGFsaWFzIGlzIGludGVuZGVkIHRvIHJlZmVyZW5jZSBhIHNpbmdsZSB2
ZW5kb3IKPiA+ID4gaWQvcHJvZHVjdAo+ID4gPiBpZCBzbyB5b3Ugd2lsbCBoYXZlIDErIGFsaWFz
IGZvciBlYWNoIHR5cGUgb2YgZGV2aWNlLiB0aGF0IGFsbG93cyBvcGVuc3RhY2sgdG8gc2NoZWR1
bGUgYmFzZWQgb24gdGhlIGF2YWlsYWJpbGl0eQo+ID4gPiBvZgo+ID4gPiBhCj4gPiA+IGNvbXBh
dGliYWxlIGRldmljZSBiZWNhdXNlIHdlIHRyYWNrIGludmVudG9yaWVzIG9mIHBjaSBkZXZpY2Vz
IGFuZCBjYW4gcXVlcnkgdGhhdCB3aGVuIHNlbGVjdGluZyBhIGhvc3QuCj4gPiA+IAo+ID4gPiBp
ZiB3ZSB3ZXJlIHRvIHN1cHBvcnQgbWRldiBsaXZlIG1pZ3JhdGlvbiBpbiB0aGUgZnV0dXJlIHdl
IHdvdWxkIHdhbnQgdG8gdGFrZSB0aGUgc2FtZSBkZWNsYXJhdGl2ZSBhcHByb2NoLgo+ID4gPiAx
IGludGVyb3NwZWMgdGhlIGNhcGFiaWxpdHkgb2YgdGhlIGRlaXZjZSB3ZSBtYW5hZ2UKPiA+ID4g
MiBjcmVhdGUgaW52ZW50b3JpZXMgb2YgdGhlIGFsbG9jYXRhYmxlIGRldmljZXMgYW5kIHRoZXJl
IGNhcGFiaWxpdGllcwo+ID4gPiAzIHNjaGR1bGUgdGhlIGluc3RhbmNlIHRvIGEgaG9zdCBiYXNl
ZCBvbiB0aGUgZGV2aWNlLXR5cGUvY2FwYWJpbGl0aWVzIGFuZCBjbGFpbSBpdCBhdG9taWNseSB0
byBwcmV2ZW50IHJhY2VjZXMKPiA+ID4gNCBoYXZlIHRoZSBsb3dlciBsZXZlbCBoeXBlcnZpb3Jz
IGRvIGFkZHRpb25hbCB2YWxpZGF0aW9uIGlmIG5lZWQgcHJlbGl2ZSBtaWdyYXRpb24uCj4gPiA+
IAo+ID4gPiB0aGlzIHByb3Bvc2FsIHNlYW1zIHRvIGJlIHRhcmdldGluZyBleHRlbmRpbmcgc3Rl
cCA0IHdoZXJlIGFzIGlkZWFsbHkgd2Ugc2hvdWxkIGZvY3VzZSBvbiBwcm92aWRpbmcgdGhlIGlu
Zm8gdGhhdAo+ID4gPiB3b3VsZAo+ID4gPiBiZSByZWxldmFudCBpbiBzZXQgMSBwcmVmZXJhYmx5
IGluIGEgdmVuZG9yIG5ldXRyYWwgd2F5IHZhaSBhIGtlcm5lbCBpbnRlcmZhY2UgbGlrZSAvc3lz
Lgo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgaXMgcmVhZGluZyBhIHdob2xlIGxvdCBpbnRvIHRoZSBw
aHJhc2UgImxhc3Qgc3RlcCIuICBXZQo+ID4gd2FudCB0byBtYWtlIHRoZSBpbmZvcm1hdGlvbiBh
dmFpbGFibGUgZm9yIGEgbWFuYWdlbWVudCBlbmdpbmUgdG8KPiA+IGNvbnN1bWUgYXMgbmVlZGVk
IHRvIG1ha2UgaW5mb3JtZWQgZGVjaXNpb25zIHJlZ2FyZGluZyBsaWtlbHkKPiA+IGNvbXBhdGli
bGUgdGFyZ2V0IGRldmljZXMuCj4gCj4gd2VsbCBvcGVuc3RhY2sgYXMgYSBtYW5hZ2VtZW50IGVu
Z2luIGhhcyAzIHN0YWdlcyBmb3Igc2NoZHVsZSBhbmQgYXNpZ25tZW50LC4KPiBpbiByZXNwb2Nu
ZSB0byBhIGxpdmUgbWlncmF0aW9uIHJlcXVlc3QgdGhlIGFwaSBkb2VzIG1pbmltYWwgdmFsYWlk
YXRpb24gdGhlbiBoYW5kIHRoZSB0YXNrIG9mZiB0byB0aGUgY29uZHVjdG9yCj4gc2VydmljZQo+
IG90IG9yY2hlc3RyYXRlLiB0aGUgY29uZHVjdG9yIGludm9rZXMgYW4gcnBjIHRvIHRoZSBzY2hk
dWxlciBzZXJ2aWNlIHdoaWNoIG1ha2VzIGEgcmVzdCBjYWxsIHRvIHRoZSBwbGFtY2VudCBzZXJ2
aWNlLgo+IHRoZSBwbGFjbWVudCBjZXJ2aWNlIGdlbmVyYXRlIGEgc2V0IG9mIGFsbG9jYXRpb24g
Y2FuZGlhdGUgZm9yIGhvc3QgYmFzZWQgb24gcXVuYXRhaXZlIGFuZCBxdWxhaXRpdmx5Cj4gcXVl
cmllcyBhZ2FpbnMgYW4gYWJzdHJhY3QgcmVzb3VjZSBwcm92aWRlciB0cmVlIG1vZGVsIG9mIHRo
ZSBob3N0cy4KPiBjdXJyZW50bHkgZGV2aWNlIHBhc3Rob3VnaCBpcyBub3QgbW9kZWxlZCBpbiBw
bGFjbWVudCBzbyBwbGFtY25ldCBpcyBiYXNpY2FseSByZXR1cm5pbmcgYSBzZXQgb2YgaG9zdCB0
aGF0IGhhdmUgZW5vdWdoCj4gY3B1IHJhbSBhbmQgZGlzayBmb3IgdGhlIGluc3RhbmNlLiBpbiB0
aGUgc3BhY2lhbCBvZiAgdkdQVSB0aGV5IHRlY2huaWNhbGx5IGFyZSBtb2RlbGxlZCBpbiBwbGFj
ZW1lbnQgYnV0IG5vdCBpbiBhIHdheQo+IHRoYXQgd291bGQgZ3VyYXJlbnRlZSBjb21wYXRpYWJs
aXR5IGZvciBtaWdyYXRpb24uIGEgZ2VuZXJpYyBwY2kgZGV2aWNlIHJlcXVlc3QgaXMgaGFuZWxl
ZCBpbiB0aGUgc2Vjb25kIHBoYXNlIG9mCj4gc2NoZHVsaW5nIGNhbGxlZCBmaWx0ZXJpbmcgYW5k
IHdlaWdoaW5nLiBpbiB0aGlzIHBhaHNlIHRoZSBub3ZhIHNjaHVsZWVyIGFwcGx5IGEgc2VyaWVz
ICBvZiBmaWx0ZXIgdG8gdGhlIGxpc3Qgb2YgaG9zdAo+IHJldHVybmVkIGJ5IHBsYW1jbmV0IHRv
IGFzc2VydCB0aGluZ3MgbGlrZSBhbml0IGFmaW50aXksIHRlbmFudCBpc29sYXRpb24gb3IgaW4g
dGhlIGNhc2Ugb2YgdGhpcyBjb252ZXJhdGlvbiBudWFtCj4gYWZmaW50aXkgYW5kIHBjaSBkZXZp
Y2UgYXZhaWFibGl0eS4gd2hlbiB3ZSBoYXZlIGZpbHRlcmVkIHRoZSBwb3NpYmxlIHNldCBvZiBo
b3N0IGRvd24gdG8gWCBudW1iZXIgd2Ugd2VpZ2ggdGhlCj4gbGlzdGluZwo+IHRvIHNlbGVjdCBh
biBvcHRpbWFsIGhvc3QgYW5kIHNldCBvZiBhbHRlcm5pdGl2ZSBob3N0cy4gd2UgdGhlbiBlbnRl
ciB0aGUgY29kZSB0aGF0IHRoaXMgbWFpbCBzdWdnZXN0IG1vZGZpeWluZyB3aGljaAo+IGRvZXMg
YW4gcnBjIGNhbGwgdG8gdGhlIGRlc3RpYXRpb24gaG9zdCBmb3JtIHRlaCBjb25kdWN0b3IgdG8g
aGF2ZSBpdCBhc3NlcnQgY29tcGF0aWFibGl0eSB3aGljaCBpbnRlcm5hbHkgY2FsbHMgYmFjawo+
IHRvCj4gdGhlIHNvdXJjIGhvc3QuCj4gCj4gc28gbXkgcG9pbnQgaXMgd2UgaGF2ZSBkb25lIGEg
bG90IG9mIHdvcmsgIGJ5IHRoZSB0aW1lIHdlIGNhbGwgY2hlY2tfY2FuX2xpdmVfbWlncmF0ZV9k
ZXN0aW5hdGlvbiBhbmQgZmFpbGluZwo+IGF0IHRoaXMgcG9pbnQgaXMgY29uc2lkZXJkIHF1aXRl
IGEgbGF0ZSBmYWlsdXJlIGJ1dCBpdHMgc3RpbGwgYmV0dGVyIHRoZW4gZmFpbGluZyB3aGVuIHFl
bXUgYWN0dWxseSB0cmllcyB0byBtaWdyYXRlLgo+IGluIGdlbmVyYWwgd2Ugd291bGQgcHJlZmVy
IHRvIG1vdmUgY29tcGF0aWFibGl0eSBjaGVjayBhcyBlYXJseSBpbiB0aGF0IHdvcmtmbG93IGFz
IHBvc3NpYmxlIGJ1dCB0byBiZSBmYWlyIHdlIGRvbnQKPiBhY3R1bGx5IGNoZWNrIGNwdSBtb2Rl
bCBjb21wYXRpYWJsaXR5IHVudGlsIGNoZWNrX2Nhbl9saXZlX21pZ3JhdGVfZGVzdGluYXRpb24u
Cj4gCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3RhY2svbm92YS9ibG9iLzg5ODgzMTZiOGMxMzJj
OTY2MmRlYTZjZjAzNDU5NzVlODdjZTczNDQvbm92YS92aXJ0L2xpYnZpcnQvZHJpdmVyLnB5I0w4
MzI1LUw4MzMxCj4gCj4gaWYgd2UgbmVlZGVkIHRvbyB3ZSBjb3VsZCByZWFkIHRoZSB2ZXJzaW9u
IHN0cmluZyBvbiB0aGUgc291cmNlIGFuZCB3cml0ZSB0aGUgdmVyc2lvbiBzdHJpbmcgb24gdGhl
IGRlc3QgYXQgdGhpcwo+IHBvaW50Lgo+IGRvaW5nIHNvIGhvd2V2ZXIgd291bGQgYmUgY29uc2lk
ZXJkLCBpbmVsZWdhbnQsIHdlIGhhdmUgZm91bmQgdGhpcyBkb2VzIG5vdCBzY2FsZSBhcyB0aGUg
Zmlyc3QgY29wbXBhdGFiaWx0eSBjaGVjay4KPiBmb3IgY3B1IGZvciBleGFtcGxlIHRoZXJlIGFy
ZSB3YXkgdG8gZmlsdGVyIGhvc3RzIGJ5IGdyb3VwcyBzZXRzIGZvIGhvc3Qgd2l0aCB0aGUgc2Ft
ZSBjcHUgb3IgZmlsdGVyaW5nIG9uIGNwdSBmZWF0dXJlCj4gZmxhZ3MgdGhhdCBoYXBwZW4gaW4g
dGhlIHBsYWNtZW50IG9yIGZpbHRlciBzdGFnZSBib3RoIG9mIHdoaWNoIGFyZSB2ZXJ5IGVhcmx5
IGFuZCBjaGVhcCB0byBkbyBhdCBydW50aW1lLgo+IAo+IHRoZSAicmVhZCBmb3IgdmVyc2lvbiwg
d3JpdGUgZm9yIGNvbXBhdGliaWxpdHkiIHdvcmtmbG93IGNvdWxkIGJlIHVzZWQgYXMgYSBmaW5h
bCBzYWZlIGNoZWNrIGlmIHJlcXVpcmVkIGJ1dAo+IHByb2JpbmcgZm9yIGNvbXBhdGliaWxpdHkg
dmlhIHdyaXRlcyBpcyBiYXNpY2FseSBjb25zaWRlcmVkIGFuIGFudGkgcGF0dGVyZW4gaW4gb3Bl
bnN0YWNrLiB3ZSB0cnkgdG8gYWx3YXlzCj4gYXNzZXJ0IGNvbXBhdGliaWxpdHkgYnkgcmVhZGlu
ZyBhdmFpYWJsZSBpbmZvIGFuZCBhc3NlcnRpbmcgcmVxdWlyZW1lbnQgb3ZlciBpdCBub3QgdGVz
dGluZyB0byBzZWUgaWYgaXQgd29ya3MuCj4gCj4gdGhpcyBoYXMgY29tZSB1cCBpbiB0aGUgcGFz
dCBpbiB0aGUgY29udGV4dCBvZiB2aXJ0aW8gZmVhdHVyZSBmbGFnIHdoZXJlIHRoZSBpZGVhIG9m
IHNwYXduaW5nIGFuIGluc3RyYW5jZSBvciB0cnlpbmcKPiB0byBhZGQgYSB2aXJ0aW8gcG9ydCB0
byBvdnMgZHBkayB0aGF0IHJlcWVzdGVkIGEgc3BlY2lmaWMgZmVhdHVyZSBmbGFnIHdhcyByZWpl
Y3RlZCBhcyB1bmFjY2VwdGFibGUgZnJvbSBhIHBlcmZvcm1hbmNlCj4gYW5kIHNlY3VyaXR5IHBv
aW50IG9mIHZpZXcuCj4gCj4gPiAgCj4gPiA+ID4gPiB3ZSBhcmUgbm90IHN1cmUgaWYgdGhpcyBp
bnRlcmZhY2UgaXMgb2YgdmFsdWUgb3IgaGVscCB0byB5b3UuIHBsZWFzZSBkb24ndAo+ID4gPiA+
ID4gaGVzaXRhdGUgdG8gZHJvcCB5b3VyIHZhbHVhYmxlIGNvbW1lbnRzLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiAKPiA+ID4gPiA+ICgxKSBpbnRlcmZhY2UgZGVmaW5pdGlvbgo+ID4gPiA+ID4gVGhl
IGludGVyZmFjZSBpcyBkZWZpbmVkIGluIGJlbG93IHdheToKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
ICAgICAgICAgICAgIF9fICAgIHVzZXJzcGFjZQo+ID4gPiA+ID4gICAgICAgICAgICAgICAvXCAg
ICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgICAgICAgIC8gICAgICAgICAgICAgICAgIFx3
cml0ZQo+ID4gPiA+ID4gICAgICAgICAgICAgLyByZWFkICAgICAgICAgICAgICBcCj4gPiA+ID4g
PiAgICBfX19fX19fXy9fX19fX19fX19fICAgICAgIF9fX1x8L19fX19fX19fX19fX18KPiA+ID4g
PiA+ICAgfCBtaWdyYXRpb25fdmVyc2lvbiB8ICAgICB8IG1pZ3JhdGlvbl92ZXJzaW9uIHwtLT5j
aGVjayBtaWdyYXRpb24KPiA+ID4gPiA+ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0gICBjb21wYXRpYmlsaXR5Cj4gPiA+ID4gPiAgICAgIGRldmljZSBB
ICAgICAgICAgICAgICAgICAgICBkZXZpY2UgQgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IGEgZGV2aWNlIGF0dHJpYnV0ZSBuYW1lZCBtaWdyYXRpb25fdmVyc2lvbiBpcyBkZWZpbmVk
IHVuZGVyIGVhY2ggZGV2aWNlJ3MKPiA+ID4gPiA+IHN5c2ZzIG5vZGUuIGUuZy4gKC9zeXMvYnVz
L3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wLyRtZGV2X1VVSUQvbWlncmF0aW9uX3ZlcnNpb24p
LiAgCj4gPiA+IAo+ID4gPiB0aGlzIG1pZ2h0IGJlIHVzZWZ1bCBhcyB3ZSBjb3VsZCB0YWcgdGhl
IGludmVudG9yeSB3aXRoIHRoZSBtaWdyYXRpb24gdmVyc2lvbiBhbmQgb25seSBtaWdodCB0bwo+
ID4gPiBkZXZpY2VzIHdpdGggIHRoZSBzYW1lIHZlcnNpb24KPiA+IAo+ID4gSXMgY3Jvc3MgdmVy
c2lvbiBjb21wYXRpYmlsaXR5IHNvbWV0aGluZyB0aGF0IHlvdSdkIGNvbnNpZGVyIHVzaW5nPwo+
IAo+IHllcyBidXQgaXQgd291bGQgZGVwZW5kIG9uIHdoYXQgY3Jvc3MgdmVyc2lvbiBhY3R1bGx5
IG1lbnQuCj4gCj4gdGhlIHZlcnNpb24gb2YgYW4gbWRldiBpcyBub3Qgc29tZXRoaW5nIHdlIHdv
dWxkIHdhbnQgdG8gYmUgZXhwb3NlZCB0byBlbmR1c2Vycy4KPiBpdCB3b3VsZCBiZSBhIHNlY3Vy
aXR5IHJpc2sgdG8gZG8gc28gYXMgdGhlIHZlcnNpb24gc3Rpbmcgd291bGQgcG90ZW50YWlseSBh
bGxvdyB0aGUgdW50cnVzZWQgdXNlcgo+IHRvIGRpc2NvdmVyIGlmIGEgZGV2aWNlIGhhcyBhbiB1
bnBhdGNoIHZ1bG5lcmFibGl0eS4gYXMgYSByZXN1bHQgaW4gdGhlIGNvbnRleHQgb2YgbGl2ZSBt
aWdyYXRpb24KPiB3ZSBjYW4gb25seSBzdXBwb3J0IGNyb3NzIHZlcmlvbiBjb21wYXRpYWJpbHl0
IGlmIHRoZSBkZXZpY2UgaW4gdGhlIGd1ZXN0ICBkb2VzIG5vdCBhbHRlciBhcwo+IHBhcnQgb2Yg
dGhlIG1pZ3JhdGlvbiBhbmQgdGhlIGJlaGF2aW9yIGRvZXMgbm90IGNoYW5nZS4KPiAKPiBnb2lu
ZyBmb3JtIHZlcnNpb24gMS4wIHdpdGggZmVhdHVyZSBYIHRvIHZlcmlvbnMgMS4xIHdpdGggZmVh
dHVyZSBYIGFuZCBZIGJ1dCBvbmx5IFggZW5hYmxlZCB3b3VsZAo+IGJlIGZpbmUuIGdvaW5nIGdv
cm0gMS4wIHRvIDIuMCB3aGVyZSB0aHJlIGlzIG9ubHkgZmVhdHVyZSBZIHdvdWxkIG5vdCBiZSBv
ay4KPiBiZWluZyBhYnN0cmFjdCBtYWtlcyBpdCBhIGxpdHRsZSBoYXJkZXIgdG8gcmVhZGFib3V0
IGJ1dCBpIGd1ZXNzIGkgd291bGQgc3VtZXJpc2VpIGlmIGl0cwo+IHRyYW5zcGFyZW50IHRvIHRo
ZSBndWVzdCBmb3IgdGhlIGxpZmV0aW1lIG9mIHRoZSBxZW11IHByb2Nlc3MgdGhlbiBpdHMgb2sg
Zm9yIHRoZSBiYWNraW5nIHZlcnNpb24gdG8gY2hhbmdlLgo+IGlmIGEgdm0gaXMgcmVib290ZWQg
aXRzIGFsc28gb2sgZm8gdGhlIHZtIHRvIHBpY2sgdXAgZmVhdHVyZSBZIGZvcm0gdGhlIDEuMSBk
ZXZpY2UgYWx0aG91Z2ggYXQgdGhhdCBwb2ludAo+IGl0IGNvdWxkIG5vdCBiZSBtaWdyYXRlZCBi
YWNrIHRvIHRoZSAxLjAgaG9zdCBhcyBpdCBub3cgaGFzIGZlYXR1cmUgWCBhbmQgWSBhbmQgMS4w
IG9ubHkgaGFzIFggc28gdGhhdCB3b3VkbCBiZQo+IGFuIG9ic2VyYWJsZSBjaGFuZ2UgaWYgaXQg
d2FzIGRyb3AgYXMgYSByZXVsdCBvZiB0aGUgbGl2ZSBtaWdyYXRpb24uCj4gPiAKPiA+ID4gPiA+
IHVzZXJzcGFjZSB0b29scyByZWFkIHRoZSBtaWdyYXRpb25fdmVyc2lvbiBhcyBhIHN0cmluZyBm
cm9tIHRoZSBzb3VyY2UgZGV2aWNlLAo+ID4gPiA+ID4gYW5kIHdyaXRlIGl0IHRvIHRoZSBtaWdy
YXRpb25fdmVyc2lvbiBzeXNmcyBhdHRyaWJ1dGUgaW4gdGhlIHRhcmdldCBkZXZpY2UuICAKPiA+
ID4gCj4gPiA+IHRoaXMgd291bGQgbm90IGJlIHVzZWZ1bCBhcyB0aGUgc2NoZHVsZXIgY2Fubm90
IGRpcmVjdGxseSBjb25uZWN0IHRvIHRoZSBjb21wdXRlIGhvc3QKPiA+ID4gYW5kIGV2ZW4gaWYg
aXQgY291bGQgaXQgd291bGQgYmUgZXh0cmVhbWx5IHNsb3cgdG8gZG8gdGhpcyBmb3IgMTAwMHMg
b2YgaG9zdHMgYW5kIHBvdGVudGFsbHkKPiA+ID4gbXVsdGlwbGUgZGV2aWNlcyBwZXIgaG9zdC4K
PiA+IAo+ID4gU2VlbXMgc2ltaWxhciB0byBEYW4ncyByZXF1aXJlbWVudCwgbG9va3MgbGlrZSB0
aGUgJ3JlYWQgZm9yIHZlcnNpb24sCj4gPiB3cml0ZSBmb3IgY29tcGF0aWJpbGl0eScgdGVzdCBp
ZGVhIGlzbid0IHJlYWxseSB2aWFibGUuCj4gCj4gaXRzIGluZWZmaWVjbnQgYW5kIHdlIGhhdmUg
cmVqZWN0IGFkZGluZyBzdWNoIHRlc3QgaW4gdGhlIGNhc2Ugb2YgdmlydGlvLWZlYXR1cmUgZmxh
ZyBjb21wYXRpYWJpbHR5Cj4gaW4gdGhlIHBhc3QsIHNvIGl0cyBtb3JlIGFuIG9wdGlvbiBvZiBs
YXN0IHJlc291cnQgaWYgd2UgaGF2ZSBubyBvdGhlciB3YXkgdG8gc3VwcG9ydCBjb21wYXRpYWJs
aXR5Cj4gY2hlY2tpbmcuCj4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIHVzZXJzcGFjZSBz
aG91bGQgdHJlYXQgQU5ZIG9mIGJlbG93IGNvbmRpdGlvbnMgYXMgdHdvIGRldmljZXMgbm90IGNv
bXBhdGlibGU6Cj4gPiA+ID4gPiAtIGFueSBvbmUgb2YgdGhlIHR3byBkZXZpY2VzIGRvZXMgbm90
IGhhdmUgYSBtaWdyYXRpb25fdmVyc2lvbiBhdHRyaWJ1dGUKPiA+ID4gPiA+IC0gZXJyb3Igd2hl
biByZWFkaW5nIGZyb20gbWlncmF0aW9uX3ZlcnNpb24gYXR0cmlidXRlIG9mIG9uZSBkZXZpY2UK
PiA+ID4gPiA+IC0gZXJyb3Igd2hlbiB3cml0aW5nIG1pZ3JhdGlvbl92ZXJzaW9uIHN0cmluZyBv
ZiBvbmUgZGV2aWNlIHRvCj4gPiA+ID4gPiAgIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0ZSBv
ZiB0aGUgb3RoZXIgZGV2aWNlCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBzdHJpbmcgcmVhZCBm
cm9tIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0ZSBpcyBkZWZpbmVkIGJ5IGRldmljZSB2ZW5k
b3IKPiA+ID4gPiA+IGRyaXZlciBhbmQgaXMgY29tcGxldGVseSBvcGFxdWUgdG8gdGhlIHVzZXJz
cGFjZS4gIAo+ID4gPiAKPiA+ID4gb3BhcXVlIHZlbmRvciBzcGVjaWZpYyBzdGluZ3MgdGhhdCBo
aWdoZXIgbGV2ZWwgb3JjaGVzdHJvcyBoYXZlIHRvIHBhc3MgZm9ybSBob3N0Cj4gPiA+IHRvIGhv
c3QgYW5kIGNhbnQgcmVhc29uIGFib3V0IGFyZSBldmlsLCB3aGVuIGFsbG93ZWQgdGhleSBwcm9s
aWZyb2F0ZSBhbmQKPiA+ID4gbWFrZXMgYW55IGlkZWEgb2YgYSB2ZW5kb3IgbnV0cmFsIGFic3Ry
YWN0aW9uIGFuZCBpbnRlcm9wZXJhYmxpdHkgYmV0d2VlbiBzeXN0ZW1zCj4gPiA+IGltcG9zc2li
bGUgdG8gcmVhc29uIGFib3V0LiB0aGF0IHNhaWQgdGhlcmUgaXMgYSB3YXkgdG8gbWFrZSBpdCBv
cGF1ZSBidXQgc3RpbGwgdXNlZnVsCj4gPiA+IHRvIHVzZXJzcGFjZS4gc2VlIGJlbG93Cj4gPiA+
ID4gPiBmb3IgYSBJbnRlbCB2R1BVLCBzdHJpbmcgZm9ybWF0IGNhbiBiZSBkZWZpbmVkIGxpa2UK
PiA+ID4gPiA+ICJwYXJlbnQgZGV2aWNlIFBDSSBJRCIgKyAidmVyc2lvbiBvZiBndnQgZHJpdmVy
IiArICJtZGV2IHR5cGUiICsgImFnZ3JlZ2F0b3IgY291bnQiLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBmb3IgYW4gTlZNZSBWRiBjb25uZWN0aW5nIHRvIGEgcmVtb3RlIHN0b3JhZ2UuIGl0IGNvdWxk
IGJlCj4gPiA+ID4gPiAiUENJIElEIiArICJkcml2ZXIgdmVyc2lvbiIgKyAiY29uZmlndXJlZCBy
ZW1vdGUgc3RvcmFnZSBVUkwiCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGZvciBhIFFBVCBWRiwgaXQg
bWF5IGJlCj4gPiA+ID4gPiAiUENJIElEIiArICJkcml2ZXIgdmVyc2lvbiIgKyAic3VwcG9ydGVk
IGVuY3J5cHRpb24gc2V0Ii4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gKHRvIGF2b2lkIG5hbWVzcGFj
ZSBjb25mbGljdGlvbiBmcm9tIGVhY2ggdmVuZG9yLCB3ZSBtYXkgcHJlZml4IGEgZHJpdmVyIG5h
bWUgdG8KPiA+ID4gPiA+IGVhY2ggbWlncmF0aW9uX3ZlcnNpb24gc3RyaW5nLiBlLmcuIGk5MTUt
djEtODA4Ni01OTFkLWk5MTUtR1ZUZ19WNV84LTEpICAKPiA+ID4gCj4gPiA+IGhvbmVzdGx5IGkg
d291bGQgbXVjaCBwcmVmZXIgaWYgdGhlIHZlcnNpb24gc3RyaW5nIHdhcyBqdXN0IGEgc2VtdmVy
IHN0cmluZy4KPiA+ID4gZS5nLiB7bWFqb3J9LnttaW5vcn0ue2J1Z2ZpeH0gCj4gPiA+IAo+ID4g
PiBpZiB5b3UgZG8gYSBkcml2ZXIvZnJpbXdhcmUgdXBkYXRlIGFuZCBicmVhayBjb21wYXRpYWJs
aXR5IHdpdGggYW4gb2xkZXIgdmVyc2lvbiBidW1wIHRoZQo+ID4gPiBtYWpvciB2ZXJzaW9uLgo+
ID4gPiAKPiA+ID4gaWYgeW91IGFkZCBvcHRpb25hbCBhIGZlYXR1cmUgdGhhdCBkb2VzIG5vdCBi
cmVhayBiYWNrd2FyZHMgY29tcGF0aWFibGl0eSBpZiB5b3UgbWlncmF0ZQo+ID4gPiBhbiBvbGRl
ciBpbnN0YW5jZSB0byB0aGUgbmV3IGhvc3QgdGhlbiBqdXN0IGJ1bXAgdGhlIG1pbm9yL2ZlYXR1
cmUgbnVtYmVyLgo+ID4gPiAKPiA+ID4gaWYgeW91IGhhdmUgYSBmaXggZm9yIGEgYnVnIHRoYXQg
ZG9lcyBub3QgY2hhbmdlIHRoZSBmZWF0dXJlIHNldCBvciBjb21wYXRpYmxpdHkgYmFja3dhcmRz
IG9yCj4gPiA+IGZvcndhcmRzIHRoZW4gYnVtcCB0aGUgYnVnZml4IG51bWJlcgo+ID4gPiAKPiA+
ID4gdGhlbiB0aGUgY2hlY2sgaXMgYXMgc2ltcGxlIGFzIAo+ID4gPiAxLikgaXMgdGhlIG1kZXYg
dHlwZSB0aGUgc2FtZQo+ID4gPiAyLikgaXMgdGhlIG1ham9yIHZlcmlvbiB0aGUgc2FtZQo+ID4g
PiAzLikgYW0gaSBnb2luZyBmb3JtIHRoZSBzYW1lIHZlcnNpb24gdG8gc2FtZSB2ZXJzaW9uIG9y
IHNhbWUgdmVyc2lvbiB0byBuZXdlciB2ZXJzaW9uCj4gPiA+IAo+ID4gPiBpZiBhbGwgMyBhcmUg
dHJ1ZSB3ZSBjYW4gbWlncmF0ZS4KPiA+ID4gZS5nLiAKPiA+ID4gMi4wLjEgLT4gMi4xLjEgKG9r
IHNhbWUgbWFqb3IgdmVyc2lvbiBhbmQgbWlncmF0aW5nIGZyb20gb2xkZXIgZmVhdHVyZSByZWxl
YXNlIHRvIG5ld2VyIGZlYXR1cmUgcmVsZWFzZSkKPiA+ID4gMi4xLjEgLT4gMi4wLjEgKG5vdCBv
ayBzYW1lIG1ham9yIHZlcnNpb24gYW5kIG1pZ3JhdGluZyBmcm9tIG5ldyBmZWF0dXJlIHJlbGVh
c2UgdG8gb2xkIGZlYXR1cmUgcmVsZWFzZSBtYXkgYmUKPiA+ID4gaW5jb21wYXRhYmxlKQo+ID4g
PiAyLjAuMCAtPiAzLjAuMCAobm90IG9rIGNoYW5pbmcgbWFqb3IgdmVyc2lvbikKPiA+ID4gMi4w
LjEgLT4gMi4wLjAgKG9rIHNhbWUgbWFqb3IgYW5kIG1pbm9yIHZlcnNpb24sIGFsbCBidWdmaXhz
IGluIHRoZSBzYW1lIG1pbm9yIHJlbGVhc2Ugc2hvdWxkIGJlIGNvbXBhdGlibHkpCj4gPiAKPiA+
IFdoYXQncyB0aGUgdmFsdWUgb2YgdGhlIGJ1Z2ZpeCBmaWVsZCBpbiB0aGlzIHNjaGVtZT8KPiAK
PiBpdHMgbm90IHJlcXVpcmUgYnV0IHJlYWxseSBpdHMgZm9yIGEgbm9uIHZpc2FibGUgY2hhZ25l
IGZvcm0gYSBmZWF0dXJlIHN0YW5kcG9pbnQuCj4gYSByYXRoZXIgY29udHJpdmVkIGV4YW1wbGUg
YnV0IGlmIGl0IHdhcyBxdWFkcmF0aWMgdG8gaW5pdGFsIGEgc2V0IG9mIHF1ZXVlcyBvciBkZXZp
Y2UgYnVmZmVyZXMKPiBpbiAxLjAuMCBhbmQgeW91IG1hZGUgaXQgbGluaWFyIGluIDEuMC4xIHRo
YXQgaXMgYSBwZXJmb3JtYWNlIGltcHJvdm1lbnQgaW4gdGhlIGRldmljZSBpbnRpYWxpc2F0aW9u
IHRpbWUKPiB3aGljaCBpcyBncmVhdCBidXQgaXQgd291bGQgbm90IGFmZmVjdCB0aGUgZmVhdHVy
ZSBzZXQgb3IgY29tcGF0aWFibGl0eSBpbiBhbnkgd2F5LiB5b3UgY291bGQgY2FsbCBpdAo+IGEg
ZmVhdHVyZSBidXQgaXRzIHJlYWxseSBqdXN0IGFuIGludGVybmFsIGNoYW5nZSBidXQgeW91IG1p
Z2h0IHdhbnQgdG8gc3RpbGwgYnVtcCB0aGUgdmVyc2lvbiBudW1iZXIuCj4gPiAKPiA+IFRoZSBz
aW1wbGljaXR5IGlzIGdvb2QsIGJ1dCBpcyBpdCB0b28gc2ltcGxlLiAgSXQncyBub3QgaW1tZWRp
YXRlbHkKPiA+IGNsZWFyIHRvIG1lIHdoZXRoZXIgYWxsIGZlYXR1cmVzIGNhbiBiZSBoaWRkZW4g
YmVoaW5kIGEgbWlub3IgdmVyc2lvbi4KPiA+IEZvciBpbnN0YW5jZSwgaWYgd2UgaGF2ZSBhbiBt
ZGV2IGRldmljZSB0aGF0IHN1cHBvcnRzIHRoaXMgbm90aW9uIG9mCj4gPiBhZ2dyZWdhdGlvbiwg
d2hpY2ggaXMgcHJvcG9zZWQgYXMgYSBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbSB0aGF0Cj4gPiBw
aHlzaWNhbCBoYXJkd2FyZSBtaWdodCBzdXBwb3J0IGxvdHMgYW5kIGxvdHMgb2YgYXNzaWduYWJs
ZSBpbnRlcmZhY2VzCj4gPiB3aGljaCBjYW4gYmUgY29tYmluZWQgaW50byBhcmJpdHJhcnkgc2V0
cyBmb3IgbWRldiBkZXZpY2VzLCBtYWtpbmcgaXQKPiA+IGltcHJhY3RpY2FsIHRvIGV4cG9zZSBh
biBtZGV2IHR5cGUgZm9yIGV2ZXJ5IHBvc3NpYmxlIGVudW1lcmF0aW9uIG9mCj4gPiBhc3NpZ25h
YmxlIGludGVyZmFjZXMgd2l0aGluIGEgZGV2aWNlLgo+IAo+IHNvIHRoaXMgaXMgYSBtb2RlbGlu
ZyBwcm9ibGVtIGFuZCBsaWtlbHkgYSBsaW1pdGF0aW9uIG9mIHRoZSBjdXJyZW50IHdheSBhbiBt
ZGV2X3R5cGUgaXMgZXhwb3NlZC4KPiBzdGVhbGluZyBzb21lIGxpbnV4IGRvYyBlYW1wbGVzCj4g
Cj4gCj4gICB8LSBbcGFyZW50IHBoeXNpY2FsIGRldmljZV0KPiAgIHwtLS0gVmVuZG9yLXNwZWNp
ZmljLWF0dHJpYnV0ZXMgW29wdGlvbmFsXQo+ICAgfC0tLSBbbWRldl9zdXBwb3J0ZWRfdHlwZXNd
Cj4gICB8ICAgICB8LS0tIFs8dHlwZS1pZD5dCj4gICB8ICAgICB8ICAgfC0tLSBjcmVhdGUKPiAg
IHwgICAgIHwgICB8LS0tIG5hbWUKPiAgIHwgICAgIHwgICB8LS0tIGF2YWlsYWJsZV9pbnN0YW5j
ZXMKPiAgIHwgICAgIHwgICB8LS0tIGRldmljZV9hcGkKPiAgIHwgICAgIHwgICB8LS0tIGRlc2Ny
aXB0aW9uCj4gCj4geW91IGNvdWxkIGFkcmVzcyB0aGlzIGluIDEgb2YgYXQgbGVhc3QgMyB3YXlz
Lgo+IDEuKSBtZGV2IHR5cGUgZm9yIGVhY2ggZW5tYXJ0aW9uIHdoaWNoIGlzIGZpbmUgZm9yIDEt
MiB2YXJpYWJsZXkgb3RoZXJzaXplIGl0cyBhIGNvbWJpbml0cm9pYWwgZXhwbG90aW9ucy4KPiAy
LikgcmVwb3J0IGVhY2ggb2YgdGhlIGNvbnNvbWFibGUgc3ViIGNvbXBvbmV0bnMgYXMgYW4gbWRl
diB0eXBlIGFuZCBjcmVhdGUgbXVwbHRpcGVsIG1kZXZzIGFuZCBhc3NpZ24gdGhlbSB0byB0aGUg
dm0uCj4gMy4pIHByb3ZpZGVyIGFuIGFwaSB0byBkeW5hbWljYWxseSBjb21wb3NlIG1kZXZzIHR5
cGVzIHdoaWNoIHN0YXRpY2FseSBwYXJ0aW9uIHRoZSByZXFvdWVzZSBhbmQgY2FuIHRoZW4gYmUg
Y29uc29tZWQKPiBwZXJmZXJhYmx5IGVtYmVkaW5nIHRoZSByZXNvdWNlIGluZm9tYXRpb24gaW4g
dGhlIGRlc2NyaXB0aW9uIGZpbGVkIGluIGEgaHVtYS9tYWNoaW5jZSByZWFkYWJsZSBmb3JtLgo+
IAo+IDIgYW5kIDMgd291ZGwgd29yayB3ZWxsIHdpdGggb3BlbnN0YWNrIGhvd2V2ZXIgdGhleSBi
b3RoIGhhdmUgdGhlcmUgY2hhbGxhbmdlcwo+IDEgZG9lc250IHJlYWxseSB3b3JrIGZvciBhbnlv
bmUgb3V0IHNpZGUgb2YgYSBkZW1vLgo+ID4gICBXZSB0aGVyZWZvcmUgZXhwb3NlIGEgYmFzZSB0
eXBlCj4gPiB3aGVyZSB0aGUgYWdncmVnYXRpb24gaXMgYnVpbHQgbGF0ZXIuICBUaGlzIGVzc2Vu
dGlhbGx5IHB1dHMgdXMgaW4gYQo+ID4gc2NlbmFyaW8gd2hlcmUgZXZlbiB3aXRoaW4gYW4gbWRl
diB0eXBlIHJ1bm5pbmcgb24gdGhlIHNhbWUgZHJpdmVyLAo+ID4gdGhlcmUgYXJlIGRldmljZXMg
dGhhdCBhcmUgbm90IGRpcmVjdGx5IGNvbXBhdGlibGUgd2l0aCBlYWNoIG90aGVyLgo+ID4gIAo+
ID4gPiB3ZSBkb250IG5lZWQgdmVuZG9yIHRvIHJlbmNvZGUgdGhlIGRyaXZlciBuYW1lIG9yIHZl
bmRvciBpZCBhbmQgcHJvZHVjdCBpZCBpbiB0aGUgc3RyaW5nLiB0aGF0IGluZm8gaXMgYWxyZWF5
Cj4gPiA+IGF2YWlsYWJsZSBib3RoIHRvIHRoZSBkZXZpY2UgZHJpdmVyIGFuZCB0byB1c2Vyc3Bh
Y2UgdmlhIC9zeXMgYWxyZWFkeSB3ZSBqdXN0IG5lZWQgdG8ga25vdyBpZiB2ZXJzaW9uIG9mCj4g
PiA+IHRoZSBzYW1lIG1kZXYgYXJlIGNvbXBhdGlhYmxlIHNvIGEgc2ltcGxlIHNlbXZlciB2ZXJz
aW9uIHN0cmluZyB3aGljaCBpcyB3ZWxsIGtub3cgaW4gdGhlIHNvZnR3YXJlIHdvcmxkCj4gPiA+
IGF0IGxlYXN0IGlzIGEgY2xlYW4gYWJzdHJhdGlvbiB3ZSBjYW4gcmV1c2UuCj4gPiAKPiA+IFRo
aXMgcHJlc3VtZXMgdGhlcmUncyBubyBjcm9zcyBkZXZpY2UgbWlncmF0aW9uLgo+IAo+IG5vIGJ1
dCBpdCBkb2VzIGFzc3VtZSBubyBjcm9zcyBtZGV2X3R5cGUgbWlncmF0aW9uLgo+IGl0IGFzc3Vl
bXMgdGhhdCBudmlkYV9tZGV2X3R5cGVfeCBvbiBob3N0IDEgaXMgdGhlIHNhbWUgYXMgbnZpZGFf
bWRldl90eXBlX3ggb24gaG9zdCAyLgo+IGlmIHRoZSBwYXJlbnQgZGV2aWNlIGRpZmZlcmVzZSBi
dXQgc3VwcG9ydCB0aGUgc2FtZSBtZGV2IHR5cGUgIHdlIGFyZSBhc3NlcnRpbmcgdGhhdCB0aGV5
Cj4gc2hvdWxkIGJlIGNvbXBhdGlhYmxlIG9yIGEgZGlmZmVybnQgbWRldl90eXBlIG5hbWUgc2hv
dWxkIGJlIHVzZWQgb24gZWFjaCBkZXZpY2UuCj4gCj4gc28gd2UgYXJlIHByZXN1bWluZyB0aGUg
bWRldiB0eXBlIGNhbnQgY2hhbmdlIGFzIHBhcnQgb2YgYSBsaXZlIG1pZ3JhdGlvbiBhbmQgaWYg
dGhlIHR5cGUKPiB3YXMgdG8gY2hhbmdlIGl0IHdvdWxkIG5vIGxvbmdlciBiZSBhIGxpdmUgbWln
cmF0aW9uIG9wZXJhdGlvbiBpdCB3b3VsZCBiZSBzb21ldGhpbmcgZWxzZS4KPiB0aGF0IGlzIGJh
c2VkIG9uIHRoZSBwcmVtaXMgdGhhdCBjaGFuZ2luZyB0aGUgbWRldiB0eXBlIHdvdWxkIGNoYW5n
ZSB0aGUgY2FwYWJpbGl0aWVzIG9mIHRoZSBtZGV2Cj4gCj4gPiAgIEFuIG1kZXYgdHlwZSBjYW4g
b25seQo+ID4gYmUgbWlncmF0ZWQgdG8gdGhlIHNhbWUgbWRldiB0eXBlLCBhbGwgb2YgdGhlIGRl
dmljZXMgd2l0aGluIHRoYXQgdHlwZQo+ID4gaGF2ZSBzb21lIGJhc2VkIGNvbXBhdGliaWxpdHks
IGEgcGhzeWljYWwgZGV2aWNlIGNhbiBvbmx5IGJlIG1pZ3JhdGVkIHRvCj4gPiB0aGUgc2FtZSBw
aHlzaWNhbCBkZXZpY2UuICBJbiB0aGUgbGF0dGVyIGNhc2Ugd2hhdCBkZWZpbmVzIHRoZSB0eXBl
Pwo+IAo+IHRoZSB0eXBlLWlkIGluIC9zeXNmcwo+IAo+ICAgICAvc3lzL2RldmljZXMvdmlydHVh
bC9tdHR5L210dHkvCj4gICAgICAgICB8LS0gbWRldl9zdXBwb3J0ZWRfdHlwZXMKPiAgICAgICAg
IHwgICB8LS0gbXR0eS0xIDwtLS0tIHRoaXMgaXMgYW4gbWRldiB0eXBlCj4gICAgICAgICB8ICAg
fCAgIHwtLSBhdmFpbGFibGVfaW5zdGFuY2VzCj4gICAgICAgICB8ICAgfCAgIHwtLSBjcmVhdGUK
PiAgICAgICAgIHwgICB8ICAgfC0tIGRldmljZV9hcGkKPiAgICAgICAgIHwgICB8ICAgfC0tIGRl
dmljZXMKPiAgICAgICAgIHwgICB8ICAgYC0tIG5hbWUKPiAgICAgICAgIHwgICBgLS0gbXR0eS0y
IDwtLS0tIGFzIGlzIHRoaXMKPiAgICAgICAgIHwgICAgICAgfC0tIGF2YWlsYWJsZV9pbnN0YW5j
ZXMKPiAgICAgICAgIHwgICAgICAgfC0tIGNyZWF0ZQo+ICAgICAgICAgfCAgICAgICB8LS0gZGV2
aWNlX2FwaQo+ICAgICAgICAgfCAgICAgICB8LS0gZGV2aWNlcwo+ICAgICAgICAgfCAgICAgICBg
LS0gbmFtZQo+IAo+ICAgfC0gW3BhcmVudCBwaHkgZGV2aWNlXQo+ICAgfC0tLSBbJE1ERVZfVVVJ
RF0KPiAgICAgICAgICB8LS0tIHJlbW92ZQo+ICAgICAgICAgIHwtLS0gbWRldl90eXBlIHtsaW5r
IHRvIGl0cyB0eXBlfSA8LS0gaGVyZQo+ICAgICAgICAgIHwtLS0gdmVuZG9yLXNwZWNpZmljLWF0
dHJpYnV0ZXMgW29wdGlvbmFsXQo+IAo+ID4gICBJZgo+ID4gaXQncyBhIFBDSSBkZXZpY2UsIGlz
IGl0IG9ubHkgdmVuZG9yOmRldmljZSBJRHM/Cj4gCj4gbm8gdGhlIG1kZXYgdHlwZSBpcyBub3Qg
ZGVmaW5lZCBieSB0aGUgdmVuZG9yOmRldmljZSBpZCBvZiB0aGUgcGFyZW50IGRldmljZQo+IGFs
dGhvdWdoIHRoZSBjYXBhYmxpdHllcyBvZiB0aGF0IGRldmljZSB3aWxsIGRldGVybWluIHdoYXQg
bWRldiB0eXBlcyBpZiBhbnkgaXQgc3VwcHJvdHMuCj4gPiAgIFdoYXQgYWJvdXQgcmV2aXNpb24/
Cj4gPiBXaGF0IGFib3V0IHN1YnN5c3RlbSBJRHM/Cj4gCj4gYXQgbGVhc3QgZm9yIG52aWRpYSBn
cHVzIGkgZG9udCB0aGluayBpZiB5b3UgYnkgYW4gZXZnYSBicmFuZGVkIHYxMDAgdnMgYW4gcG55
IGJyYW5kZWQgb25lIHRoZSBjYXBhYmlsaXR5Cj4gd291bGQgY2hhbmdlIGJ1dCBpIGRvIGtub3cg
dGhhdCBjZXJ0ZW5seSB0aGUgY2FwYWJsaXRpZXMgb2YgYSBkZWxsIGJyYW5kaW5nIGludGVsIG5p
YyBhbmQgYW4gaW50ZWwgYnJhbmRlZAo+IG9uZSBjYW4uIGUuZy4gaSBoYXZlIHNlZW4gb2VtIHNr
dSBuaWNzIHdpdGhvdXQgc3Jpb3YgZXZlbnRob2d1aCB0aGUgc2FtZSBuaWMgZm9ybSBpbnRlbCBz
dXBwb3J0cyBpdC4KPiBzcmlvdiB3YXMgZGVsaWJlcmF0bHkgZGlzYWJsZWQgaW4gdGhlIGRlbGwg
ZmlybXdhcmUgZXZlbiB0aG91Z2ggaXQgc2hhcmUgZGh0ZSBzYW1lIHZlbmRvciBhbmQgcHJvZGN1
dCBpZCBidXQgZGlmZmVybnQKPiBzdWJzeXN0ZW0gaWQuCj4gCj4gaWYgdGhlIG9kbSBtYWRlIGFu
IGluY29tYXRpcGFibGUgY2hhbmdlIGxpa2UgdGhhdCB3aGljaCBhZmZlY3QgYW4gbWRldiB0eXBl
IGluIHNvbWUgd2F5IGkgZ3Vlc3MgaSB3b3VsZCBleHBlY3QgdGhlbSB0bwo+IGNoYW5nZSB0aGUg
bmFtZSBvciB0aGUgZGVzY3JpcHRpb24gZmlsZWQgY29udGVudCB0byBzaWduYWwgdGhhdC4KPiAK
PiA+ICAgV2hhdCBhYm91dCBwb3NzaWJseSBhbiBvbmJvYXJkIFJPTSBvcgo+ID4gaW50ZXJuYWwg
ZmlybXdhcmU/Cj4gCj4gaSB3b3VsZCBleHBlY3QgdGhhdCB1cGRhdGluZyB0aGUgZmlybXdhcmUv
cm9tIGNvdWxkIHJlc3VsdCBpbiBjaGFuZ2luZyBhIHZlcnNpb24gc3RyaW5nLiB0aGF0IGlzIGhv
dyBpIHdhcyBpbWFnaW5pbmcKPiBpdCB3b3VsZCBjaGFuZ2UuIAo+ID4gICBUaGUgaW5mb3JtYXRp
b24gbWF5IGJlIGF2YWlsYWJsZSwgYnV0IHdoaWNoIHRoaW5ncwo+ID4gYXJlIHJlbGV2YW50IHRv
IG1pZ3JhdGlvbj8KPiAKPiB0aGF0IGkgZG9udCBrbm93IGFuIGkgcmVhbGx5IHdvdWxkIG5vdCBs
aWtlIHRvIGVuY29kZSB0aGF0IGtub2xhZ2UgaW4gdGhlIHZlbmRvciBzcGVjaWZpYyB3YXkgaW4g
aGlnaGVyIGxldmVsCj4gdG9vbHMgbGlrZSBvcGVuc3RhY2sgb3IgZXZlbiBsaWJ2aXJ0LiBkZWNs
YXJhdGl2ZSB2ZXJzaW9uIHN0aW5nIGNvbXBhcmlzb25zIG9yIGV2ZW4gc2ltaWxlIGZlYXR1cmUg
ZmxhZyAKPiBjaGVjayB3aGVyZSBhbiBhYnN0cmFjdCBodXJpc3RpYyB0aGF0IGNhbiBiZSBhcHBs
aWVkIGFjcm9zcyB2ZW5kb3JzIHdvdWxkIGJlIGZpbmUuIGJ1dCB5ZXMgaSBkb250IGtub3cKPiB3
aGF0IGluZm8gd291bGQgYmUgbmVlZGVkIGluIHRoaXMgY2FzZS4KPiA+ICAgV2UgYWxyZWFkeSBz
ZWUgZGVzaXJlcyB0byBhbGxvdyBtaWdyYXRpb24KPiA+IGJldHdlZW4gcGh5c2ljYWwgYW5kIG1k
ZXYsCj4gCj4gbWlncmF0aW9uIGJldHdlZW4gYSBwaHNpY2FsIGRldmljZSBhbmQgYW4gbWRldiB3
b3VsZCBub3QgZ2VuZXJhbGx5IGJlIGNvbnNpZGVyZWQgYSBsaXZlIG1pZ3JhdGlvbiBpbiBvcGVu
c3RhY2suCj4gdGhhdCB3b3VsZCBiZSBhIGRpZmZlcmVudCBvcGVyYXRpb24gYXMgaXQgd291bGQg
YmUgdXNlciB2aXNpYmxlIHdpdGhpbmcgdGhlIGd1ZXN0IHZtLgo+ID4gIGJ1dCBhbHNvIHRvIGV4
cG9zZSBtZGV2IHR5cGVzIHRoYXQgbWlnaHQgYmUKPiA+IGNvbXBvc2FibGUgdG8gYmUgY29tcGF0
aWJsZSB3aXRoIG90aGVyIHR5cGVzLiAgVGhhbmtzLAo+IAo+IGkgdGhpbmsgY29tcG9zYWJsZSBt
ZGV2IHR5cGVzIGFyZSByZWFsbHkgY2hhbGxhbmdpbmcgd2l0aG91dCBzb21lIGtpbmQgb2YgZmVh
dHVyZSBmbGFnIGNvbmNlcHQKPiBsaWtlIGNwdSBmbGFncyBvciBldGh0b29sIG5pYyBjYXBhYmxp
dGllcyB0aGF0IGFyZSBib3RoIGh1bWFuIHJlYWRhYmxlIGFuZCBlYXNpbHkgcGFyc2FibGUuCj4g
Cj4gd2UgaGF2ZSB0aGUgY2FwYWJpbGl0eSB0byBzY2hlZHVsZSBvbiBjcHUgZmxhZ3Mgb3IgZ3B1
IGN1ZGEgbGV2ZWwgdXNpbmcgYSB0cmFpdHMgYWJzdHJhY3Rpb24KPiBzbyBpbnN0ZWFkIG9mIHNh
eWluZyBpIHdhbnQgYW4gdm0gb24gYSBob3N0IHdpdGggYW4gaW50ZWwgMjY5NXYzIHRvIGVuc3Vy
ZSBpdCBoYXMgQVZYCj4geW91IHNheSBpIHdhbnQgYW4gdm0gdGhhdCBpcyBjYXBhYmxlIG9mIHVz
aW5nIEFWWAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3RhY2svb3MtdHJhaXRzL2Jsb2IvbWFz
dGVyL29zX3RyYWl0cy9ody9jcHUveDg2L19faW5pdF9fLnB5I0wxOAo+IAo+IHdlIGFsc28gaGF2
ZSB0cmFpdCBmb3IgY3VkYSBsZXZlbCBzbyBpbnN0ZWFkIG9mIGFza2luZyBmb3IgYSBzcGVjaWZj
IG1kZXYgdHlwZSBvciBudmlkYQo+IGdwdSB0aGUgaWRlYSB3YXMgeW91IHdvdWRsIGRlc2NyaWJl
IHdoYXQgZmVhdHVyZSBjdWRhIGluIHRoaXMgZXhtcGxlIHlvdSBuZWVkCj4gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5zdGFjay9vcy10cmFpdHMvYmxvYi9tYXN0ZXIvb3NfdHJhaXRzL2h3L2dwdS9j
dWRhLnB5I0wxNi1MNDUKPiAKPiBUaGF0IGlzIHdoYXQgd2UgY2FsbCBxdWFsaXRhdGl2ZSBzY2h1
ZGxlaW5nIGFuZCBpcyB3aHkgd2UgY3JlYXRlIHRlaCBwbGFjZW1lbnQgc2VydmljZS4KPiB3aXRo
IG91dCBnb2luZyBpbiB0byB0aGUgd2VlZHMgd2UgdHJ5IHRvIGRlY291cGxlIHF1YW50YWl0aXZl
IHJlcXVlc3Qgc3VjaCBhcyA0IGNwdXMgYW5kIDFHIG9mIHJhbQo+IGZvcm0gdGhlIHF1bmF0aXZl
IGkgbmVlZCBBVlggc3VwcHJvdAo+IAo+IGUuZy4gcmVzb3VjZXM6VkNQVT00LHJlc291Y2VzOk1F
TU9SWV9NQj0xMDI0IHRyaWF0czpyZXF1aXJlZD1IV19DUFVfWDg2X0FWWAo+IAo+IGRlY2xhcmF0
aXZlIHF1YW50aXRpdmUgYW5kIGNhcGFibGl0ZXMgcmVwb3J0aW5nIG9mIHJlc291Y2VzIGZpdHMg
ZWFzaWx5IGludG8gdGhhdCBtb2RlbC4KPiBkeW5hbWljIHF1YW50aXRpZXMgdGhhdCBjaGFuZ2Ug
YXMgb3RoZXIgbWRldiBhcmUgYWxsb2NhdGVkIGZyb20gdGhlIHBhcmVudCBkZXZpY2Ugb3IgYXMK
PiBuZXcgbWRldnMgdHlwZXMgYXJlIGNvbXBvc2VkIG9uIHRoZSBmbHkgYXJlIHZlcnkgY2hhbGxl
bmdpbmcuCj4gCj4gPiAKPiA+IEFsZXgKPiA+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
