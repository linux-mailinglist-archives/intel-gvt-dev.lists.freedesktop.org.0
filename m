Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4719AE9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 May 2019 11:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904CF8991E;
	Fri, 10 May 2019 09:48:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100C98991E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 May 2019 09:48:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B8AC85376;
 Fri, 10 May 2019 09:48:53 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 766EF600C7;
 Fri, 10 May 2019 09:48:40 +0000 (UTC)
Date: Fri, 10 May 2019 11:48:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190510114838.7e16c3d6.cohuck@redhat.com>
In-Reply-To: <20190510093608.GD2854@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 10 May 2019 09:48:53 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com,
 dinechin@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAxMCBNYXkgMjAxOSAxMDozNjowOSArMDEwMAoiRHIuIERhdmlkIEFsYW4gR2lsYmVy
dCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiAqIENvcm5lbGlhIEh1Y2sgKGNvaHVj
a0ByZWRoYXQuY29tKSB3cm90ZToKPiA+IE9uIFRodSwgOSBNYXkgMjAxOSAxNzo0ODoyNiArMDEw
MAo+ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90
ZToKPiA+ICAgCj4gPiA+ICogQ29ybmVsaWEgSHVjayAoY29odWNrQHJlZGhhdC5jb20pIHdyb3Rl
OiAgCj4gPiA+ID4gT24gVGh1LCA5IE1heSAyMDE5IDE2OjQ4OjU3ICswMTAwCj4gPiA+ID4gIkRy
LiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4g
PiAgICAgCj4gPiA+ID4gPiAqIENvcm5lbGlhIEh1Y2sgKGNvaHVja0ByZWRoYXQuY29tKSB3cm90
ZTogICAgCj4gPiA+ID4gPiA+IE9uIFR1ZSwgNyBNYXkgMjAxOSAxNToxODoyNiAtMDYwMAo+ID4g
PiA+ID4gPiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90
ZToKPiA+ID4gPiA+ID4gICAgICAgCj4gPiA+ID4gPiA+ID4gT24gU3VuLCAgNSBNYXkgMjAxOSAy
MTo0OTowNCAtMDQwMAo+ID4gPiA+ID4gPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNv
bT4gd3JvdGU6ICAgICAgCj4gPiA+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gKyAgRXJy
bm86Cj4gPiA+ID4gPiA+ID4gPiArICBJZiB2ZW5kb3IgZHJpdmVyIHdhbnRzIHRvIGNsYWltIGEg
bWRldiBkZXZpY2UgaW5jb21wYXRpYmxlIHRvIGFsbCBvdGhlciBtZGV2Cj4gPiA+ID4gPiA+ID4g
PiArICBkZXZpY2VzLCBpdCBzaG91bGQgbm90IHJlZ2lzdGVyIHZlcnNpb24gYXR0cmlidXRlIGZv
ciB0aGlzIG1kZXYgZGV2aWNlLiBCdXQgaWYKPiA+ID4gPiA+ID4gPiA+ICsgIGEgdmVuZG9yIGRy
aXZlciBoYXMgYWxyZWFkeSByZWdpc3RlcmVkIHZlcnNpb24gYXR0cmlidXRlIGFuZCBpdCB3YW50
cyB0byBjbGFpbQo+ID4gPiA+ID4gPiA+ID4gKyAgYSBtZGV2IGRldmljZSBpbmNvbXBhdGlibGUg
dG8gYWxsIG90aGVyIG1kZXYgZGV2aWNlcywgaXQgbmVlZHMgdG8gcmV0dXJuCj4gPiA+ID4gPiA+
ID4gPiArICAtRU5PREVWIG9uIGFjY2VzcyB0byB0aGlzIG1kZXYgZGV2aWNlJ3MgdmVyc2lvbiBh
dHRyaWJ1dGUuCj4gPiA+ID4gPiA+ID4gPiArICBJZiBhIG1kZXYgZGV2aWNlIGlzIG9ubHkgaW5j
b21wYXRpYmxlIHRvIGNlcnRhaW4gbWRldiBkZXZpY2VzLCB3cml0ZSBvZgo+ID4gPiA+ID4gPiA+
ID4gKyAgaW5jb21wYXRpYmxlIG1kZXYgZGV2aWNlcydzIHZlcnNpb24gc3RyaW5ncyB0byBpdHMg
dmVyc2lvbiBhdHRyaWJ1dGUgc2hvdWxkCj4gPiA+ID4gPiA+ID4gPiArICByZXR1cm4gLUVJTlZB
TDsgICAgICAgIAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgaXQncyBiZXN0
IG5vdCB0byBkZWZpbmUgdGhlIHNwZWNpZmljIGVycm5vIHJldHVybmVkIGZvciBhCj4gPiA+ID4g
PiA+ID4gc3BlY2lmaWMgc2l0dWF0aW9uLCBsZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1
c2Vyc3BhY2Ugc2ltcGx5Cj4gPiA+ID4gPiA+ID4gbmVlZHMgdG8ga25vdyB0aGF0IGFuIGVycm5v
IG9uIHJlYWQgaW5kaWNhdGVzIHRoZSBkZXZpY2UgZG9lcyBub3QKPiA+ID4gPiA+ID4gPiBzdXBw
b3J0IG1pZ3JhdGlvbiB2ZXJzaW9uIGNvbXBhcmlzb24gYW5kIHRoYXQgYW4gZXJybm8gb24gd3Jp
dGUKPiA+ID4gPiA+ID4gPiBpbmRpY2F0ZXMgdGhlIGRldmljZXMgYXJlIGluY29tcGF0aWJsZSBv
ciB0aGUgdGFyZ2V0IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiA+ID4gPiA+IG1pZ3JhdGlvbiB2ZXJz
aW9ucy4gICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkgdGhpbmsgSSBoYXZlIHRvIGRp
c2FncmVlIGhlcmU6IEl0J3MgcHJvYmFibHkgdmFsdWFibGUgdG8gaGF2ZSBhbgo+ID4gPiA+ID4g
PiBhZ3JlZWQgZXJyb3IgZm9yICdjYW5ub3QgbWlncmF0ZSBhdCBhbGwnIHZzICdjYW5ub3QgbWln
cmF0ZSBiZXR3ZWVuCj4gPiA+ID4gPiA+IHRob3NlIHR3byBwYXJ0aWN1bGFyIGRldmljZXMnLiBV
c2Vyc3BhY2UgbWlnaHQgd2FudCB0byBkbyBkaWZmZXJlbnQKPiA+ID4gPiA+ID4gdGhpbmdzIChl
LmcuIHRyeWluZyB3aXRoIGRpZmZlcmVudCBkZXZpY2UgcGFpcnMpLiAgICAgIAo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBUcnlpbmcgdG8gc3R1ZmYgdGhlc2UgdGhpbmdzIGRvd24gYW4gZXJybm8gc2Vl
bXMgYSBiYWQgaWRlYTsgd2UgY2FuJ3QKPiA+ID4gPiA+IGdldCBtdWNoIGluZm9ybWF0aW9uIHRo
YXQgd2F5LiAgICAKPiA+ID4gPiAKPiA+ID4gPiBTbywgd2hhdCB3b3VsZCBiZSBhIHJlYXNvbmFi
bGUgYXBwcm9hY2g/IFVzZXJzcGFjZSBzaG91bGQgZmlyc3QgcmVhZAo+ID4gPiA+IHRoZSB2ZXJz
aW9uIGF0dHJpYnV0ZXMgb24gYm90aCBkZXZpY2VzICh0byBmaW5kIG91dCB3aGV0aGVyIG1pZ3Jh
dGlvbgo+ID4gPiA+IGlzIHN1cHBvcnRlZCBhdCBhbGwpLCBhbmQgb25seSB0aGVuIGZpZ3VyZSBv
dXQgdmlhIHdyaXRpbmcgd2hldGhlciB0aGV5Cj4gPiA+ID4gYXJlIGNvbXBhdGlibGU/Cj4gPiA+
ID4gCj4gPiA+ID4gKE9yIGp1c3QgZ28gYWhlYWQgYW5kIHRyeSwgaWYgaXQgZG9lcyBub3QgY2Fy
ZSBhYm91dCB0aGUgcmVhc29uLikgICAgCj4gPiA+IAo+ID4gPiBXZWxsLCBJJ20gT0sgd2l0aCBz
b21ldGhpbmcgbGlrZSB3cml0aW5nIHRvIHRlc3Qgd2hldGhlciBpdCdzCj4gPiA+IGNvbXBhdGli
bGUsIGl0J3MganVzdCB3ZSBuZWVkIGEgYmV0dGVyIHdheSBvZiBzYXlpbmcgJ25vJy4KPiA+ID4g
SSdtIG5vdCBzdXJlIGlmIHRoYXQgaW52b2x2ZXMgcmVhZGluZyBiYWNrIGZyb20gc29tZXdoZXJl
IGFmdGVyCj4gPiA+IHRoZSB3cml0ZSBvciB3aGF0LiAgCj4gPiAKPiA+IEhtLCBzbyBJIGJhc2lj
YWxseSBzZWUgdHdvIHdheXMgb2YgZG9pbmcgdGhhdDoKPiA+IC0gc3RhbmRhcmRpemUgb24gc29t
ZSBlcnJvciBjb2Rlcy4uLiBwcm9ibGVtOiBlcnJvciBjb2RlcyBjYW4gYmUgaGFyZAo+ID4gICB0
byBmaXQgdG8gcmVhc29ucwo+ID4gLSBtYWtlIHRoZSBlcnJvciBhdmFpbGFibGUgaW4gc29tZSBh
dHRyaWJ1dGUgdGhhdCBjYW4gYmUgcmVhZAo+ID4gCj4gPiBJJ20gbm90IHN1cmUgaG93IHdlIGNh
biBzZXJpYWxpemUgdGhlIHJlYWRiYWNrIHdpdGggdGhlIGxhc3Qgd3JpdGUsCj4gPiB0aG91Z2gg
KHRoaXMgbG9va3MgaW5oZXJlbnRseSByYWN5KS4KPiA+IAo+ID4gSG93IGltcG9ydGFudCBpcyBk
ZXRhaWxlZCBlcnJvciByZXBvcnRpbmcgaGVyZT8gIAo+IAo+IEkgdGhpbmsgd2UgbmVlZCBzb21l
dGhpbmcsIG90aGVyd2lzZSB3ZSdyZSBqdXN0IGdvaW5nIHRvIGdldCB2YWd1ZQo+IHVzZXIgcmVw
b3J0cyBvZiAnYnV0IG15IFZNIGRvZXNuJ3QgbWlncmF0ZSc7IEknZCBsaWtlIHRoZSBlcnJvciB0
byBiZQo+IGdvb2QgZW5vdWdoIHRvIHBvaW50IG1vc3QgdXNlcnMgdG8gc29tZXRoaW5nIHRoZXkg
Y2FuIHVuZGVyc3RhbmQKPiAoZS5nLiB3cm9uZyBjYXJkIGZhbWlseS90b28gb2xkIGEgZHJpdmVy
IGV0YykuCgpPaywgdGhhdCBzb3VuZHMgbGlrZSBhIHJlYXNvbmFibGUgcG9pbnQuIE5vdCB0aGF0
IEkgaGF2ZSBhIGJldHRlciBpZGVhCmhvdyB0byBhY2hpZXZlIHRoYXQsIHRob3VnaC4uLiB3ZSBj
b3VsZCBhbHNvIGxvZyBhIG1vcmUgdmVyYm9zZSBlcnJvcgptZXNzYWdlIHRvIHRoZSBrZXJuZWwg
bG9nLCBidXQgdGhhdCdzIG5vdCBuZWNlc3NhcmlseSB3aGVyZSBhIHVzZXIgd2lsbApsb29rIGZp
cnN0LgoKSWRlYWxseSwgd2UnZCB3YW50IHRvIGhhdmUgdGhlIHVzZXIgc3BhY2UgcHJvZ3JhbSBz
ZXR0aW5nIHVwIHRoaW5ncwpxdWVyeWluZyB0aGUgZ2VuZXJhbCBjb21wYXRpYmlsaXR5IGZvciBt
aWdyYXRpb24gKHNvIHRoYXQgaXQgYmVjb21lcwp0aGVpciBwcm9ibGVtIG9uIGhvdyB0byBhbGVy
dCB0aGUgdXNlciB0byBwcm9ibGVtcyA6KSwgYnV0IEknbSBub3Qgc3VyZQpob3cgdG8gZWxpbWlu
YXRlIHRoZSByYWNlIGJldHdlZW4gYXNraW5nIHRoZSB2ZW5kb3IgZHJpdmVyIGZvcgpjb21wYXRp
YmlsaXR5IGFuZCBnZXR0aW5nIHRoZSByZXN1bHQgb2YgdGhhdCBvcGVyYXRpb24uCgpVbmxlc3Mg
d2UgaW50cm9kdWNlIGFuIGludGVyZmFjZSB0aGF0IGNhbiByZXRyaWV2ZSBfYWxsXyByZXN1bHRz
CnRvZ2V0aGVyIHdpdGggdGhlIHdyaXR0ZW4gdmFsdWU/IE9yIGlzIHRoYXQgbm90IGdvaW5nIHRv
IGJlIG11Y2ggb2YgYQpwcm9ibGVtIGluIHByYWN0aWNlPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
