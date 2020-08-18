Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A25248202
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 11:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54969899DB;
	Tue, 18 Aug 2020 09:37:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277FE899DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597743434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJjNy/iBoF2FonoLrwK5UsgI5KqHfrDJbMHahAh/X50=;
 b=c+6/TNjz/Klq4DbWfw/2D3i8DEUK4WRTDF5Ctrm0UDEWS6JePf95tntbNeaCv/HXTgI1Az
 FnNubvtlJcS5xFQXsd02st2uZKtu33UlJu45VB7ssKD0O9gf8KeDkgBR3IJCTVDZdxP4WQ
 6rKb01ZyjjjuGf0/LrFymYFJGlwJdfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-buTrGnQ6PEC5eD5s6IyfoQ-1; Tue, 18 Aug 2020 05:37:12 -0400
X-MC-Unique: buTrGnQ6PEC5eD5s6IyfoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEEE2801ADD;
 Tue, 18 Aug 2020 09:37:09 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC6EE7D939;
 Tue, 18 Aug 2020 09:36:54 +0000 (UTC)
Date: Tue, 18 Aug 2020 11:36:52 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200818113652.5d81a392.cohuck@redhat.com>
In-Reply-To: <20200818091628.GC20215@redhat.com>
References: <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBBdWcgMjAyMCAxMDoxNjoyOCArMDEwMApEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMDU6
MDE6NTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ICAgIE9uIDIwMjAvOC8xOCDkuIvl
jYg0OjU1LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+ID4gCj4gPiAgT24gVHVlLCBBdWcg
MTgsIDIwMjAgYXQgMTE6MjQ6MzBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+IAo+ID4g
IE9uIDIwMjAvOC8xNCDkuIvljYgxOjE2LCBZYW4gWmhhbyB3cm90ZToKPiA+IAo+ID4gIE9uIFRo
dSwgQXVnIDEzLCAyMDIwIGF0IDEyOjI0OjUwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4g
PiAKPiA+ICBPbiAyMDIwLzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8gd3JvdGU6ICAKPiAKPiA+
ICB3ZSBhY3R1YWxseSBjYW4gYWxzbyByZXRyaWV2ZSB0aGUgc2FtZSBpbmZvcm1hdGlvbiB0aHJv
dWdoIHN5c2ZzLCAuZS5nCj4gPiAKPiA+ICB8LSBbcGF0aCB0byBkZXZpY2VdCj4gPiAgICAgfC0t
LSBtaWdyYXRpb24KPiA+ICAgICB8ICAgICB8LS0tIHNlbGYKPiA+ICAgICB8ICAgICB8ICAgfC0t
LWRldmljZV9hcGkKPiA+ICAgICB8ICAgIHwgICB8LS0tbWRldl90eXBlCj4gPiAgICAgfCAgICB8
ICAgfC0tLXNvZnR3YXJlX3ZlcnNpb24KPiA+ICAgICB8ICAgIHwgICB8LS0tZGV2aWNlX2lkCj4g
PiAgICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPiA+ICAgICB8ICAgICB8LS0tIGNvbXBhdGli
bGUKPiA+ICAgICB8ICAgICB8ICAgfC0tLWRldmljZV9hcGkKPiA+ICAgICB8ICAgIHwgICB8LS0t
bWRldl90eXBlCj4gPiAgICAgfCAgICB8ICAgfC0tLXNvZnR3YXJlX3ZlcnNpb24KPiA+ICAgICB8
ICAgIHwgICB8LS0tZGV2aWNlX2lkCj4gPiAgICAgfCAgICB8ICAgfC0tLWFnZ3JlZ2F0b3IKPiA+
IAo+ID4gCj4gPiAgWWVzIGJ1dDoKPiA+IAo+ID4gIC0gWW91IG5lZWQgb25lIGZpbGUgcGVyIGF0
dHJpYnV0ZSAob25lIHN5c2NhbGwgZm9yIG9uZSBhdHRyaWJ1dGUpCj4gPiAgLSBBdHRyaWJ1dGUg
aXMgY291cGxlZCB3aXRoIGtvYmplY3QKCklzIHRoYXQgcmVhbGx5IHRoYXQgYmFkPyBZb3UgaGF2
ZSB0aGUgZGV2aWNlIHdpdGggYW4gZW1iZWRkZWQga29iamVjdAphbnl3YXksIGFuZCB5b3UgY2Fu
IGp1c3QgcHV0IHRoaW5ncyBpbnRvIGFuIGF0dHJpYnV0ZSBncm91cD8KCltBbHNvLCBJIHRoaW5r
IHRoYXQgc2VsZi9jb21wYXRpYmxlIHNwbGl0IGluIHRoZSBleGFtcGxlIG1ha2VzIHRoaW5ncwpu
ZWVkbGVzc2x5IGNvbXBsZXguIFNob3VsZG4ndCBzZW1hbnRpYyB2ZXJzaW9uaW5nIGFuZCBtYXRj
aGluZyBhbHJlYWR5CmNvdmVyIG5lYXJseSBldmVyeXRoaW5nPyBJIHdvdWxkIGV4cGVjdCB2ZXJ5
IGZldyBjYXNlcyB0aGF0IGFyZSBtb3JlCmNvbXBsZXggdGhhbiB0aGF0LiBNYXliZSB0aGUgYWdn
cmVnYXRpb24gc3R1ZmYsIGJ1dCBJIGRvbid0IHRoaW5rIHdlCm5lZWQgdGhhdCBzZWxmL2NvbXBh
dGlibGUgc3BsaXQgZm9yIHRoYXQsIGVpdGhlci5dCgo+ID4gCj4gPiAgQWxsIG9mIGFib3ZlIHNl
ZW1zIHVubmVjZXNzYXJ5Lgo+ID4gCj4gPiAgQW5vdGhlciBwb2ludCwgYXMgd2UgZGlzY3Vzc2Vk
IGluIGFub3RoZXIgdGhyZWFkLCBpdCdzIHJlYWxseSBoYXJkIHRvIG1ha2UKPiA+ICBzdXJlIHRo
ZSBhYm92ZSBBUEkgd29yayBmb3IgYWxsIHR5cGVzIG9mIGRldmljZXMgYW5kIGZyYW1ld29ya3Mu
IFNvIGhhdmluZyBhCj4gPiAgdmVuZG9yIHNwZWNpZmljIEFQSSBsb29rcyBtdWNoIGJldHRlci4K
PiA+IAo+ID4gIEZyb20gdGhlIFBPViBvZiB1c2Vyc3BhY2UgbWdtdCBhcHBzIGRvaW5nIGRldmlj
ZSBjb21wYXQgY2hlY2tpbmcgLyBtaWdyYXRpb24sCj4gPiAgd2UgY2VydGFpbmx5IGRvIE5PVCB3
YW50IHRvIHVzZSBkaWZmZXJlbnQgdmVuZG9yIHNwZWNpZmljIEFQSXMuIFdlIHdhbnQgdG8KPiA+
ICBoYXZlIGFuIEFQSSB0aGF0IGNhbiBiZSB1c2VkIC8gY29udHJvbGxlZCBpbiBhIHN0YW5kYXJk
IG1hbm5lciBhY3Jvc3MgdmVuZG9ycy4KPiA+IAo+ID4gICAgWWVzLCBidXQgaXQgY291bGQgYmUg
aGFyZC4gRS5nIHZEUEEgd2lsbCBjaG9zZSB0byB1c2UgZGV2bGluayAodGhlcmUncyBhCj4gPiAg
ICBsb25nIGRlYmF0ZSBvbiBzeXNmcyB2cyBkZXZsaW5rKS4gU28gaWYgd2UgZ28gd2l0aCBzeXNm
cywgYXQgbGVhc3QgdHdvCj4gPiAgICBBUElzIG5lZWRzIHRvIGJlIHN1cHBvcnRlZCAuLi4gIAo+
IAo+IE5CLCBJIHdhcyBub3QgcXVlc3Rpb25pbmcgZGV2bGluayB2cyBzeXNmcyBkaXJlY3RseS4g
SWYgZGV2bGluayBpcyByZWxhdGVkCj4gdG8gbmV0bGluaywgSSBjYW4ndCBzYXkgSSdtIGVudGh1
c2lhc3RpYyBhcyBJTUtFIHN5c2ZzIGlzIGVhc2llciB0byBkZWFsCj4gd2l0aC4gSSBkb24ndCBr
bm93IGVub3VnaCBhYm91dCBkZXZsaW5rIHRvIGhhdmUgbXVjaCBvZiBhbiBvcGluaW9uIHRob3Vn
aC4KPiBUaGUga2V5IHBvaW50IHdhcyB0aGF0IEkgZG9uJ3Qgd2FudCB0aGUgdXNlcnNwYWNlIEFQ
SXMgd2UgbmVlZCB0byBkZWFsIHdpdGgKPiB0byBiZSB2ZW5kb3Igc3BlY2lmaWMuCgpGcm9tIHdo
YXQgSSd2ZSBzZWVuIG9mIGRldmxpbmssIGl0IHNlZW1zIHF1aXRlIG5pY2U7IGJ1dCBJIHVuZGVy
c3RhbmQKd2h5IHN5c2ZzIG1pZ2h0IGJlIGVhc2llciB0byBkZWFsIHdpdGggKGVzcGVjaWFsbHkg
YXMgdGhlcmUncyBsaWtlbHkKYWxyZWFkeSBhIGxvdCBvZiBjb2RlIHVzaW5nIGl0LikKCkkgdW5k
ZXJzdGFuZCB0aGF0IHNvbWUgdXNlcnMgd291bGQgbGlrZSBkZXZsaW5rIGJlY2F1c2UgaXQgaXMg
YWxyZWFkeQp3aWRlbHkgdXNlZCBmb3IgbmV0d29yayBkcml2ZXJzIChhbmQgc29tZSBvdGhlcnMp
LCBidXQgSSBkb24ndCB0aGluawp0aGUgbWFqb3JpdHkgb2YgZGV2aWNlcyB1c2VkIHdpdGggdmZp
byBhcmUgbmV0d29yayAoYWx0aG91Z2ggY2VydGFpbmx5CmEgbG90IG9mIHRoZW0gYXJlLikKCj4g
Cj4gV2hhdCBJIGNhcmUgYWJvdXQgaXMgdGhhdCB3ZSBoYXZlIGEgKnN0YW5kYXJkKiB1c2Vyc3Bh
Y2UgQVBJIGZvciBwZXJmb3JtaW5nCj4gZGV2aWNlIGNvbXBhdGliaWxpdHkgY2hlY2tpbmcgLyBz
dGF0ZSBtaWdyYXRpb24sIGZvciB1c2UgYnkgUUVNVS9saWJ2aXJ0Lwo+IE9wZW5TdGFjaywgc3Vj
aCB0aGF0IHdlIGNhbiB3cml0ZSBjb2RlIHdpdGhvdXQgY291bnRsZXNzIHZlbmRvciBzcGVjaWZp
Ywo+IGNvZGUgcGF0aHMuCj4gCj4gSWYgdGhlcmUgaXMgdmVuZG9yIHNwZWNpZmljIHN0dWZmIG9u
IHRoZSBzaWRlLCB0aGF0J3MgZmluZSBhcyB3ZSBjYW4gaWdub3JlCj4gdGhhdCwgYnV0IHRoZSBj
b3JlIGZ1bmN0aW9uYWxpdHkgZm9yIGRldmljZSBjb21wYXQgLyBtaWdyYXRpb24gbmVlZHMgdG8g
YmUKPiBzdGFuZGFyZGl6ZWQuCgpUbyBzdW1tYXJpemU6Ci0gY2hvb3NlIG9uZSBvZiBzeXNmcyBv
ciBkZXZsaW5rCi0gaGF2ZSBhIGNvbW1vbiBpbnRlcmZhY2UsIHdpdGggYSBzdGFuZGFyZGl6ZWQg
d2F5IHRvIGFkZAogIHZlbmRvci1zcGVjaWZpYyBhdHRyaWJ1dGVzCj8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
