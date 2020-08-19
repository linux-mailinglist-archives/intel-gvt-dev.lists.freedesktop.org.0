Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11BB2492EF
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 04:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C5D6E19A;
	Wed, 19 Aug 2020 02:38:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA456E19A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 02:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597804719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ahF9kHkk+KzE1v5hPws7TWhx97Oq/uytmMOo+VABGc=;
 b=UpAWR6V1UY+u0ql8d0GDedzqVNHhFOekMBnYdGTF9Q/mNLjKA7yCp0ZxPOXJzWm3/LlKNu
 xAN1dRSiuNQEooSoA5LvoYzp+ilXL7dJm+3GMVu7WlYJBFIRrvLG1OqHFcgZk4JgOgkkJ1
 uP2mRBK/vwg8R28ZeJClqUHQbO0HdCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-tVAsAyPbNA6-594zY0pgiQ-1; Tue, 18 Aug 2020 22:38:36 -0400
X-MC-Unique: tVAsAyPbNA6-594zY0pgiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC671DDF4;
 Wed, 19 Aug 2020 02:38:34 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36A017DFDD;
 Wed, 19 Aug 2020 02:38:14 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5aea4ae6-e8c8-1120-453d-20a78cee6b20@redhat.com>
Date: Wed, 19 Aug 2020 10:38:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818091628.GC20215@redhat.com>
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 eskultet@redhat.com, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOCDkuIvljYg1OjE2LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+IFlv
dXIgbWFpbCBjYW1lIHRocm91Z2ggYXMgSFRNTC1vbmx5IHNvIGFsbCB0aGUgcXVvdGluZyBhbmQg
YXR0cmlidXRpb24KPiBpcyBtYW5nbGVkIC8gbG9zdCBub3cgOi0oCgoKTXkgYmFkLCBzb3JyeS4K
Cgo+Cj4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMDU6MDE6NTFQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4gICAgIE9uIDIwMjAvOC8xOCDkuIvljYg0OjU1LCBEYW5pZWwgUC4gQmVycmFu
Z8OpIHdyb3RlOgo+Pgo+PiAgIE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0IDExOjI0OjMwQU0gKzA4
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Cj4+ICAgT24gMjAyMC84LzE0IOS4i+WNiDE6MTYsIFlh
biBaaGFvIHdyb3RlOgo+Pgo+PiAgIE9uIFRodSwgQXVnIDEzLCAyMDIwIGF0IDEyOjI0OjUwUE0g
KzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Cj4+ICAgT24gMjAyMC84LzEwIOS4i+WNiDM6NDYs
IFlhbiBaaGFvIHdyb3RlOgo+PiAgIHdlIGFjdHVhbGx5IGNhbiBhbHNvIHJldHJpZXZlIHRoZSBz
YW1lIGluZm9ybWF0aW9uIHRocm91Z2ggc3lzZnMsIC5lLmcKPj4KPj4gICB8LSBbcGF0aCB0byBk
ZXZpY2VdCj4+ICAgICAgfC0tLSBtaWdyYXRpb24KPj4gICAgICB8ICAgICB8LS0tIHNlbGYKPj4g
ICAgICB8ICAgICB8ICAgfC0tLWRldmljZV9hcGkKPj4gICAgICB8ICAgIHwgICB8LS0tbWRldl90
eXBlCj4+ICAgICAgfCAgICB8ICAgfC0tLXNvZnR3YXJlX3ZlcnNpb24KPj4gICAgICB8ICAgIHwg
ICB8LS0tZGV2aWNlX2lkCj4+ICAgICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPj4gICAgICB8
ICAgICB8LS0tIGNvbXBhdGlibGUKPj4gICAgICB8ICAgICB8ICAgfC0tLWRldmljZV9hcGkKPj4g
ICAgICB8ICAgIHwgICB8LS0tbWRldl90eXBlCj4+ICAgICAgfCAgICB8ICAgfC0tLXNvZnR3YXJl
X3ZlcnNpb24KPj4gICAgICB8ICAgIHwgICB8LS0tZGV2aWNlX2lkCj4+ICAgICAgfCAgICB8ICAg
fC0tLWFnZ3JlZ2F0b3IKPj4KPj4KPj4gICBZZXMgYnV0Ogo+Pgo+PiAgIC0gWW91IG5lZWQgb25l
IGZpbGUgcGVyIGF0dHJpYnV0ZSAob25lIHN5c2NhbGwgZm9yIG9uZSBhdHRyaWJ1dGUpCj4+ICAg
LSBBdHRyaWJ1dGUgaXMgY291cGxlZCB3aXRoIGtvYmplY3QKPj4KPj4gICBBbGwgb2YgYWJvdmUg
c2VlbXMgdW5uZWNlc3NhcnkuCj4+Cj4+ICAgQW5vdGhlciBwb2ludCwgYXMgd2UgZGlzY3Vzc2Vk
IGluIGFub3RoZXIgdGhyZWFkLCBpdCdzIHJlYWxseSBoYXJkIHRvIG1ha2UKPj4gICBzdXJlIHRo
ZSBhYm92ZSBBUEkgd29yayBmb3IgYWxsIHR5cGVzIG9mIGRldmljZXMgYW5kIGZyYW1ld29ya3Mu
IFNvIGhhdmluZyBhCj4+ICAgdmVuZG9yIHNwZWNpZmljIEFQSSBsb29rcyBtdWNoIGJldHRlci4K
Pj4KPj4gICBGcm9tIHRoZSBQT1Ygb2YgdXNlcnNwYWNlIG1nbXQgYXBwcyBkb2luZyBkZXZpY2Ug
Y29tcGF0IGNoZWNraW5nIC8gbWlncmF0aW9uLAo+PiAgIHdlIGNlcnRhaW5seSBkbyBOT1Qgd2Fu
dCB0byB1c2UgZGlmZmVyZW50IHZlbmRvciBzcGVjaWZpYyBBUElzLiBXZSB3YW50IHRvCj4+ICAg
aGF2ZSBhbiBBUEkgdGhhdCBjYW4gYmUgdXNlZCAvIGNvbnRyb2xsZWQgaW4gYSBzdGFuZGFyZCBt
YW5uZXIgYWNyb3NzIHZlbmRvcnMuCj4+Cj4+ICAgICBZZXMsIGJ1dCBpdCBjb3VsZCBiZSBoYXJk
LiBFLmcgdkRQQSB3aWxsIGNob3NlIHRvIHVzZSBkZXZsaW5rICh0aGVyZSdzIGEKPj4gICAgIGxv
bmcgZGViYXRlIG9uIHN5c2ZzIHZzIGRldmxpbmspLiBTbyBpZiB3ZSBnbyB3aXRoIHN5c2ZzLCBh
dCBsZWFzdCB0d28KPj4gICAgIEFQSXMgbmVlZHMgdG8gYmUgc3VwcG9ydGVkIC4uLgo+IE5CLCBJ
IHdhcyBub3QgcXVlc3Rpb25pbmcgZGV2bGluayB2cyBzeXNmcyBkaXJlY3RseS4gSWYgZGV2bGlu
ayBpcyByZWxhdGVkCj4gdG8gbmV0bGluaywgSSBjYW4ndCBzYXkgSSdtIGVudGh1c2lhc3RpYyBh
cyBJTUtFIHN5c2ZzIGlzIGVhc2llciB0byBkZWFsCj4gd2l0aC4gSSBkb24ndCBrbm93IGVub3Vn
aCBhYm91dCBkZXZsaW5rIHRvIGhhdmUgbXVjaCBvZiBhbiBvcGluaW9uIHRob3VnaC4KPiBUaGUg
a2V5IHBvaW50IHdhcyB0aGF0IEkgZG9uJ3Qgd2FudCB0aGUgdXNlcnNwYWNlIEFQSXMgd2UgbmVl
ZCB0byBkZWFsIHdpdGgKPiB0byBiZSB2ZW5kb3Igc3BlY2lmaWMuCj4KPiBXaGF0IEkgY2FyZSBh
Ym91dCBpcyB0aGF0IHdlIGhhdmUgYSAqc3RhbmRhcmQqIHVzZXJzcGFjZSBBUEkgZm9yIHBlcmZv
cm1pbmcKPiBkZXZpY2UgY29tcGF0aWJpbGl0eSBjaGVja2luZyAvIHN0YXRlIG1pZ3JhdGlvbiwg
Zm9yIHVzZSBieSBRRU1VL2xpYnZpcnQvCj4gT3BlblN0YWNrLCBzdWNoIHRoYXQgd2UgY2FuIHdy
aXRlIGNvZGUgd2l0aG91dCBjb3VudGxlc3MgdmVuZG9yIHNwZWNpZmljCj4gY29kZSBwYXRocy4K
Pgo+IElmIHRoZXJlIGlzIHZlbmRvciBzcGVjaWZpYyBzdHVmZiBvbiB0aGUgc2lkZSwgdGhhdCdz
IGZpbmUgYXMgd2UgY2FuIGlnbm9yZQo+IHRoYXQsIGJ1dCB0aGUgY29yZSBmdW5jdGlvbmFsaXR5
IGZvciBkZXZpY2UgY29tcGF0IC8gbWlncmF0aW9uIG5lZWRzIHRvIGJlCj4gc3RhbmRhcmRpemVk
LgoKCk9rLCBJIGFncmVlIHdpdGggeW91LgoKVGhhbmtzCgoKPgo+IFJlZ2FyZHMsCj4gRGFuaWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXYK
