Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464BCD6DE3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Oct 2019 05:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51EE6E5EC;
	Tue, 15 Oct 2019 03:37:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3206E16F;
 Tue, 15 Oct 2019 03:37:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F94118CB8F9;
 Tue, 15 Oct 2019 03:37:45 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F112C5C1D4;
 Tue, 15 Oct 2019 03:37:19 +0000 (UTC)
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191014174946.GC5359@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
Date: Tue, 15 Oct 2019 11:37:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191014174946.GC5359@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 15 Oct 2019 03:37:45 +0000 (UTC)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTUg5LiK5Y2IMTo0OSwgU3RlZmFuIEhham5vY3ppIHdyb3RlOgo+IE9uIEZy
aSwgT2N0IDExLCAyMDE5IGF0IDA0OjE1OjUwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IFRoZXJlIGFyZSBoYXJkd2FyZSB0aGF0IGNhbiBkbyB2aXJ0aW8gZGF0YXBhdGggb2ZmbG9hZGlu
ZyB3aGlsZSBoYXZpbmcKPj4gaXRzIG93biBjb250cm9sIHBhdGguIFRoaXMgcGF0aCB0cmllcyB0
byBpbXBsZW1lbnQgYSBtZGV2IGJhc2VkCj4+IHVuaWZpZWQgQVBJIHRvIHN1cHBvcnQgdXNpbmcg
a2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhvc2UKPj4gZGV2aWNlcy4gVGhpcyBpcyBk
b25lIGJ5IGludHJvZHVjaW5nIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8KPj4gKHZp
cnRpb19tZGV2KSBhbmQgcmVnaXN0ZXIgaXRzZWxmIGFzIGEgbmV3IGtpbmQgb2YgbWRldiBkcml2
ZXIuIFRoZW4KPj4gaXQgcHJvdmlkZXMgYSB1bmlmaWVkIHdheSBmb3Iga2VybmVsIHZpcnRpbyBk
cml2ZXIgdG8gdGFsayB3aXRoIG1kZXYKPj4gZGV2aWNlIGltcGxlbWVudGF0aW9uLgo+Pgo+PiBU
aG91Z2ggdGhlIHNlcmllcyBvbmx5IGNvbnRhaW5zIGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhl
IGdvYWwgaXMgdG8KPj4gbWFrZSB0aGUgdHJhbnNwb3J0IGdlbmVyaWMgZW5vdWdoIHRvIHN1cHBv
cnQgdXNlcnNwYWNlIGRyaXZlcnMuIFRoaXMKPj4gbWVhbnMgdmhvc3QtbWRldlsxXSBjb3VsZCBi
ZSBidWlsdCBvbiB0b3AgYXMgd2VsbCBieSByZXN1aW5nIHRoZQo+PiB0cmFuc3BvcnQuCj4+Cj4+
IEEgc2FtcGxlIGRyaXZlciBpcyBhbHNvIGltcGxlbWVudGVkIHdoaWNoIHNpbXVsYXRlIGEgdmly
aXRvLW5ldAo+PiBsb29wYmFjayBldGhlcm5ldCBkZXZpY2Ugb24gdG9wIG9mIHZyaW5naCArIHdv
cmtxdWV1ZS4gVGhpcyBjb3VsZCBiZQo+PiB1c2VkIGFzIGEgcmVmZXJlbmNlIGltcGxlbWVudGF0
aW9uIGZvciByZWFsIGhhcmR3YXJlIGRyaXZlci4KPj4KPj4gQ29uc2lkZXIgbWRldiBmcmFtZXdv
cmsgb25seSBzdXBwb3J0IFZGSU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+PiB0aGlz
IHNlcmllcyBhbHNvIGV4dGVuZCBpdCB0byBzdXBwb3J0IG90aGVyIHR5cGVzLiBUaGlzIGlzIGRv
bmUKPj4gdGhyb3VnaCBpbnRyb2R1Y2luZyBjbGFzcyBpZCB0byB0aGUgZGV2aWNlIGFuZCBwYWly
aW5nIGl0IHdpdGgKPj4gaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRo
aXMgc2VyaXMgYWxzbyBkZWNvdXBsZQo+PiBkZXZpY2Ugc3BlY2lmaWMgcGFyZW50cyBvcHMgb3V0
IG9mIHRoZSBjb21tb24gb25lcy4KPiBJIHdhcyBjdXJpb3VzIHNvIEkgdG9vayBhIHF1aWNrIGxv
b2sgYW5kIHBvc3RlZCBjb21tZW50cy4KPgo+IEkgZ3Vlc3MgdGhpcyBkcml2ZXIgcnVucyBpbnNp
ZGUgdGhlIGd1ZXN0IHNpbmNlIGl0IHJlZ2lzdGVycyB2aXJ0aW8KPiBkZXZpY2VzPwoKCkl0IGNv
dWxkIHJ1biBpbiBlaXRoZXIgZ3Vlc3Qgb3IgaG9zdC4gQnV0IHRoZSBtYWluIGZvY3VzIGlzIHRv
IHJ1biBpbiAKdGhlIGhvc3QgdGhlbiB3ZSBjYW4gdXNlIHZpcnRpbyBkcml2ZXJzIGluIGNvbnRh
aW5lcnMuCgoKPgo+IElmIHRoaXMgaXMgdXNlZCB3aXRoIHBoeXNpY2FsIFBDSSBkZXZpY2VzIHRo
YXQgc3VwcG9ydCBkYXRhcGF0aAo+IG9mZmxvYWRpbmcgdGhlbiBob3cgYXJlIHBoeXNpY2FsIGRl
dmljZXMgcHJlc2VudGVkIHRvIHRoZSBndWVzdCB3aXRob3V0Cj4gU1ItSU9WPwoKCldlIHdpbGwg
ZG8gY29udHJvbCBwYXRoIG1lZGl0YXRpb24gdGhyb3VnaCB2aG9zdC1tZGV2WzFdIGFuZCAKdmhv
c3QtdmZpb1syXS4gVGhlbiB3ZSB3aWxsIHByZXNlbnQgYSBmdWxsIHZpcnRpbyBjb21wYXRpYmxl
IGV0aGVybmV0IApkZXZpY2UgZm9yIGd1ZXN0LgoKU1ItSU9WIGlzIG5vdCBhIG11c3QsIGFueSBt
ZGV2IGRldmljZSB0aGF0IGltcGxlbWVudHMgdGhlIEFQSSBkZWZpbmVkIGluIApwYXRjaCA1IGNh
biBiZSB1c2VkIGJ5IHRoaXMgZnJhbWV3b3JrLgoKVGhhbmtzCgpbMV0gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMTkvOS8yNi8xNQoKWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY292
ZXIvOTg0NzYzLwoKCj4KPiBTdGVmYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
