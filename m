Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38D18E65
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 May 2019 18:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381D89E2A;
	Thu,  9 May 2019 16:48:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D570789E2A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 16:48:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DCCA3B712;
 Thu,  9 May 2019 16:48:42 +0000 (UTC)
Received: from work-vm (ovpn-116-174.ams2.redhat.com [10.36.116.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95FF11710E;
 Thu,  9 May 2019 16:48:28 +0000 (UTC)
Date: Thu, 9 May 2019 17:48:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190509164825.GG2868@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509175404.512ae7aa.cohuck@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 09 May 2019 16:48:43 +0000 (UTC)
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

KiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gT24gVGh1LCA5IE1h
eSAyMDE5IDE2OjQ4OjU3ICswMTAwCj4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVy
dEByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+ICogQ29ybmVsaWEgSHVjayAoY29odWNrQHJlZGhh
dC5jb20pIHdyb3RlOgo+ID4gPiBPbiBUdWUsIDcgTWF5IDIwMTkgMTU6MTg6MjYgLTA2MDAKPiA+
ID4gQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gd3JvdGU6Cj4g
PiA+ICAgCj4gPiA+ID4gT24gU3VuLCAgNSBNYXkgMjAxOSAyMTo0OTowNCAtMDQwMAo+ID4gPiA+
IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6ICAKPiA+ID4gICAKPiA+ID4g
PiA+ICsgIEVycm5vOgo+ID4gPiA+ID4gKyAgSWYgdmVuZG9yIGRyaXZlciB3YW50cyB0byBjbGFp
bSBhIG1kZXYgZGV2aWNlIGluY29tcGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldgo+ID4gPiA+ID4g
KyAgZGV2aWNlcywgaXQgc2hvdWxkIG5vdCByZWdpc3RlciB2ZXJzaW9uIGF0dHJpYnV0ZSBmb3Ig
dGhpcyBtZGV2IGRldmljZS4gQnV0IGlmCj4gPiA+ID4gPiArICBhIHZlbmRvciBkcml2ZXIgaGFz
IGFscmVhZHkgcmVnaXN0ZXJlZCB2ZXJzaW9uIGF0dHJpYnV0ZSBhbmQgaXQgd2FudHMgdG8gY2xh
aW0KPiA+ID4gPiA+ICsgIGEgbWRldiBkZXZpY2UgaW5jb21wYXRpYmxlIHRvIGFsbCBvdGhlciBt
ZGV2IGRldmljZXMsIGl0IG5lZWRzIHRvIHJldHVybgo+ID4gPiA+ID4gKyAgLUVOT0RFViBvbiBh
Y2Nlc3MgdG8gdGhpcyBtZGV2IGRldmljZSdzIHZlcnNpb24gYXR0cmlidXRlLgo+ID4gPiA+ID4g
KyAgSWYgYSBtZGV2IGRldmljZSBpcyBvbmx5IGluY29tcGF0aWJsZSB0byBjZXJ0YWluIG1kZXYg
ZGV2aWNlcywgd3JpdGUgb2YKPiA+ID4gPiA+ICsgIGluY29tcGF0aWJsZSBtZGV2IGRldmljZXMn
cyB2ZXJzaW9uIHN0cmluZ3MgdG8gaXRzIHZlcnNpb24gYXR0cmlidXRlIHNob3VsZAo+ID4gPiA+
ID4gKyAgcmV0dXJuIC1FSU5WQUw7ICAgIAo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmsgaXQncyBi
ZXN0IG5vdCB0byBkZWZpbmUgdGhlIHNwZWNpZmljIGVycm5vIHJldHVybmVkIGZvciBhCj4gPiA+
ID4gc3BlY2lmaWMgc2l0dWF0aW9uLCBsZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1c2Vy
c3BhY2Ugc2ltcGx5Cj4gPiA+ID4gbmVlZHMgdG8ga25vdyB0aGF0IGFuIGVycm5vIG9uIHJlYWQg
aW5kaWNhdGVzIHRoZSBkZXZpY2UgZG9lcyBub3QKPiA+ID4gPiBzdXBwb3J0IG1pZ3JhdGlvbiB2
ZXJzaW9uIGNvbXBhcmlzb24gYW5kIHRoYXQgYW4gZXJybm8gb24gd3JpdGUKPiA+ID4gPiBpbmRp
Y2F0ZXMgdGhlIGRldmljZXMgYXJlIGluY29tcGF0aWJsZSBvciB0aGUgdGFyZ2V0IGRvZXNuJ3Qg
c3VwcG9ydAo+ID4gPiA+IG1pZ3JhdGlvbiB2ZXJzaW9ucy4gIAo+ID4gPiAKPiA+ID4gSSB0aGlu
ayBJIGhhdmUgdG8gZGlzYWdyZWUgaGVyZTogSXQncyBwcm9iYWJseSB2YWx1YWJsZSB0byBoYXZl
IGFuCj4gPiA+IGFncmVlZCBlcnJvciBmb3IgJ2Nhbm5vdCBtaWdyYXRlIGF0IGFsbCcgdnMgJ2Nh
bm5vdCBtaWdyYXRlIGJldHdlZW4KPiA+ID4gdGhvc2UgdHdvIHBhcnRpY3VsYXIgZGV2aWNlcycu
IFVzZXJzcGFjZSBtaWdodCB3YW50IHRvIGRvIGRpZmZlcmVudAo+ID4gPiB0aGluZ3MgKGUuZy4g
dHJ5aW5nIHdpdGggZGlmZmVyZW50IGRldmljZSBwYWlycykuICAKPiA+IAo+ID4gVHJ5aW5nIHRv
IHN0dWZmIHRoZXNlIHRoaW5ncyBkb3duIGFuIGVycm5vIHNlZW1zIGEgYmFkIGlkZWE7IHdlIGNh
bid0Cj4gPiBnZXQgbXVjaCBpbmZvcm1hdGlvbiB0aGF0IHdheS4KPiAKPiBTbywgd2hhdCB3b3Vs
ZCBiZSBhIHJlYXNvbmFibGUgYXBwcm9hY2g/IFVzZXJzcGFjZSBzaG91bGQgZmlyc3QgcmVhZAo+
IHRoZSB2ZXJzaW9uIGF0dHJpYnV0ZXMgb24gYm90aCBkZXZpY2VzICh0byBmaW5kIG91dCB3aGV0
aGVyIG1pZ3JhdGlvbgo+IGlzIHN1cHBvcnRlZCBhdCBhbGwpLCBhbmQgb25seSB0aGVuIGZpZ3Vy
ZSBvdXQgdmlhIHdyaXRpbmcgd2hldGhlciB0aGV5Cj4gYXJlIGNvbXBhdGlibGU/Cj4gCj4gKE9y
IGp1c3QgZ28gYWhlYWQgYW5kIHRyeSwgaWYgaXQgZG9lcyBub3QgY2FyZSBhYm91dCB0aGUgcmVh
c29uLikKCldlbGwsIEknbSBPSyB3aXRoIHNvbWV0aGluZyBsaWtlIHdyaXRpbmcgdG8gdGVzdCB3
aGV0aGVyIGl0J3MKY29tcGF0aWJsZSwgaXQncyBqdXN0IHdlIG5lZWQgYSBiZXR0ZXIgd2F5IG9m
IHNheWluZyAnbm8nLgpJJ20gbm90IHN1cmUgaWYgdGhhdCBpbnZvbHZlcyByZWFkaW5nIGJhY2sg
ZnJvbSBzb21ld2hlcmUgYWZ0ZXIKdGhlIHdyaXRlIG9yIHdoYXQuCgpEYXZlCgotLQpEci4gRGF2
aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0LmNvbSAvIE1hbmNoZXN0ZXIsIFVLCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
