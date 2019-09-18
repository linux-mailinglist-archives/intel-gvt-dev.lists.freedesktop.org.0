Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D9B5BB8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Sep 2019 08:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA826EE01;
	Wed, 18 Sep 2019 06:16:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFA86EDFA;
 Wed, 18 Sep 2019 06:16:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8CB7846288;
 Wed, 18 Sep 2019 06:16:16 +0000 (UTC)
Received: from [10.72.12.111] (ovpn-12-111.pek2.redhat.com [10.72.12.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E971719C6A;
 Wed, 18 Sep 2019 06:15:55 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] mdev: introduce device specific ops
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
 <20190912094012.29653-3-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D579F71@SHSMSX104.ccr.corp.intel.com>
 <6bb2c43c-25bb-16f9-1fa0-08cb08e42b94@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57B49A@SHSMSX104.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e3950e19-b815-1549-72b0-12b628fa2bc1@redhat.com>
Date: Wed, 18 Sep 2019 14:15:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D57B49A@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 18 Sep 2019 06:16:17 +0000 (UTC)
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
Cc: "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "mst@redhat.com" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Wang, Zhihong" <zhihong.wang@intel.com>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8xOCDkuIrljYgxMDo1NywgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEph
c29uIFdhbmcgW21haWx0bzpqYXNvd2FuZ0ByZWRoYXQuY29tXQo+PiBTZW50OiBUdWVzZGF5LCBT
ZXB0ZW1iZXIgMTcsIDIwMTkgNjoxNyBQTQo+Pgo+PiBPbiAyMDE5LzkvMTcg5LiL5Y2INDowOSwg
VGlhbiwgS2V2aW4gd3JvdGU6Cj4+Pj4gRnJvbTogSmFzb24gV2FuZwo+Pj4+IFNlbnQ6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgMTIsIDIwMTkgNTo0MCBQTQo+Pj4+Cj4+Pj4gQ3VycmVudGx5LCBleGNl
cHQgZm9yIHRoZSBjcmF0ZSBhbmQgcmVtb3ZlLiBUaGUgcmVzdCBmaWVsZHMgb2YKPj4+PiBtZGV2
X3BhcmVudF9vcHMgaXMganVzdCBkZXNpZ25lZCBmb3IgdmZpby1tZGV2IGRyaXZlciBhbmQgbWF5
IG5vdAo+PiBoZWxwCj4+Pj4gZm9yIGtlcm5lbCBtZGV2IGRyaXZlci4gU28gZm9sbG93IHRoZSBk
ZXZpY2UgaWQgc3VwcG9ydCBieSBwcmV2aW91cwo+Pj4+IHBhdGNoLCB0aGlzIHBhdGNoIGludHJv
ZHVjZXMgZGV2aWNlIHNwZWNpZmljIG9wcyB3aGljaCBwb2ludHMgdG8KPj4+PiBkZXZpY2Ugc3Bl
Y2lmaWMgb3BzIChlLmcgdmZpbyBvcHMpLiBUaGlzIGFsbG93cyB0aGUgZnV0dXJlIGRyaXZlcnMK
Pj4+PiBsaWtlIHZpcnRpby1tZGV2IHRvIGltcGxlbWVudCBpdHMgb3duIGRldmljZSBzcGVjaWZp
YyBvcHMuCj4+PiBDYW4geW91IGdpdmUgYW4gZXhhbXBsZSBhYm91dCB3aGF0IG9wcyBtaWdodCBi
ZSByZXF1aXJlZCB0byBzdXBwb3J0Cj4+PiBrZXJuZWwgbWRldiBkcml2ZXI/IEkga25vdyB5b3Ug
cG9zdGVkIGEgbGluayBlYXJsaWVyLCBidXQgcHV0dGluZyBhIHNtYWxsCj4+PiBleGFtcGxlIGhl
cmUgY2FuIHNhdmUgdGltZSBhbmQgYXZvaWQgaW5jb25zaXN0ZW50IHVuZGVyc3RhbmRpbmcuIFRo
ZW4KPj4+IGl0IHdpbGwgaGVscCB3aGV0aGVyIHRoZSBwcm9wb3NlZCBzcGxpdCBtYWtlcyBzZW5z
ZSBvciB0aGVyZSBpcyBhCj4+PiBwb3NzaWJpbGl0eSBvZiByZWRlZmluaW5nIHRoZSBjYWxsYmFj
a3MgdG8gbWVldCB0aGUgYm90aCByZXF1aXJlbWVudHMuCj4+PiBpbW8gdGhvc2UgY2FsbGJhY2tz
IGZ1bGZpbGwgc29tZSBiYXNpYyByZXF1aXJlbWVudHMgd2hlbiBtZWRpYXRpbmcKPj4+IGEgZGV2
aWNlLi4uCj4+IEkgcHV0IGl0IGluIHRoZSBjb3ZlciBsZXR0ZXIuCj4+Cj4+IFRoZSBsaW5rIGlz
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xMC8xMzUgIHdoaWNoIGFidXNlcyB0aGUgY3Vy
cmVudAo+PiBWRklPIGJhc2VkIG1kZXYgcGFyZW50IG9wcy4KPj4KPj4gVGhhbmtzCj4gU28gdGhl
IG1haW4gcHJvYmxlbSBpcyB0aGUgaGFuZGxpbmcgb2YgdXNlcnNwYWNlIHBvaW50ZXJzIHZzLgo+
IGtlcm5lbCBzcGFjZSBwb2ludGVycy4gWW91IHN0aWxsIGltcGxlbWVudCByZWFkL3dyaXRlL2lv
Y3RsCj4gY2FsbGJhY2tzIHdoaWNoIGlzIGEgc3Vic2V0IG9mIGN1cnJlbnQgcGFyZW50X29wcyBk
ZWZpbml0aW9uLgo+IEluIHRoYXQgcmVnYXJkIGlzIGl0IGJldHRlciB0byBpbnRyb2R1Y2Ugc29t
ZSBoZWxwZXIgdG8gaGFuZGxlCj4gdGhlIHBvaW50ZXIgZGlmZmVyZW5jZSBpbiBtZGV2IGNvcmUs
IHdoaWxlIHN0aWxsIGtlZXBpbmcgdGhlCj4gc2FtZSBzZXQgb2YgcGFyZW50IG9wcyAoaW4gd2hh
dGV2ZXIgZm9ybSBzdWl0YWJsZSBmb3IgYm90aCk/CgoKUG9pbnRlcnMgaXMgb25lIG9mIHRoZSBp
c3N1ZXMuIEFuZCByZWFkL3dyaXRlL2lvY3RsIGlzIGRlc2lnbmVkIGZvciAKdXNlcnNwYWNlIEFQ
SSBub3Qga2VybmVsLiBUZWNobmljYWxseSwgd2UgY2FuIHVzZSB0aGVtIGZvciBrZXJuZWwgYnV0
IGl0IAp3b3VsZCBub3QgYmUgYXMgc2ltcGxlIGFuZCBzdHJhaWdodGZvcndhcmQgYSBzZXQgb2Yg
ZGV2aWNlIHNwZWNpZmljIApjYWxsYmFja3MgZnVuY3Rpb25zLiBUaGUgbGluayBhYm92ZSBpcyBq
dXN0IGFuIGV4YW1wbGUsIGUuZyB3ZSBjYW4gCnNpbXBseSBwYXNzIHRoZSB2cmluZyBhZGRyZXNz
IHRocm91Z2ggYSBkZWRpY2F0ZWQgQVBJIGluc3RlYWQgb2YgCm1hbmRhdG9yeSBhbiBvZmZzZXQg
b2YgYSBmaWxlLgoKVGhhbmtzCgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
