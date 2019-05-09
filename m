Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74B18D64
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 May 2019 17:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BEA89BB0;
	Thu,  9 May 2019 15:54:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D6189BB0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 15:54:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 22D1599C1D;
 Thu,  9 May 2019 15:54:28 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B360F1001E65;
 Thu,  9 May 2019 15:54:06 +0000 (UTC)
Date: Thu, 9 May 2019 17:54:04 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190509175404.512ae7aa.cohuck@redhat.com>
In-Reply-To: <20190509154857.GF2868@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 09 May 2019 15:54:33 +0000 (UTC)
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

T24gVGh1LCA5IE1heSAyMDE5IDE2OjQ4OjU3ICswMTAwCiJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+ICogQ29ybmVsaWEgSHVjayAoY29odWNr
QHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gT24gVHVlLCA3IE1heSAyMDE5IDE1OjE4OjI2IC0wNjAw
Cj4gPiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToK
PiA+ICAgCj4gPiA+IE9uIFN1biwgIDUgTWF5IDIwMTkgMjE6NDk6MDQgLTA0MDAKPiA+ID4gWWFu
IFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZTogIAo+ID4gICAKPiA+ID4gPiArICBF
cnJubzoKPiA+ID4gPiArICBJZiB2ZW5kb3IgZHJpdmVyIHdhbnRzIHRvIGNsYWltIGEgbWRldiBk
ZXZpY2UgaW5jb21wYXRpYmxlIHRvIGFsbCBvdGhlciBtZGV2Cj4gPiA+ID4gKyAgZGV2aWNlcywg
aXQgc2hvdWxkIG5vdCByZWdpc3RlciB2ZXJzaW9uIGF0dHJpYnV0ZSBmb3IgdGhpcyBtZGV2IGRl
dmljZS4gQnV0IGlmCj4gPiA+ID4gKyAgYSB2ZW5kb3IgZHJpdmVyIGhhcyBhbHJlYWR5IHJlZ2lz
dGVyZWQgdmVyc2lvbiBhdHRyaWJ1dGUgYW5kIGl0IHdhbnRzIHRvIGNsYWltCj4gPiA+ID4gKyAg
YSBtZGV2IGRldmljZSBpbmNvbXBhdGlibGUgdG8gYWxsIG90aGVyIG1kZXYgZGV2aWNlcywgaXQg
bmVlZHMgdG8gcmV0dXJuCj4gPiA+ID4gKyAgLUVOT0RFViBvbiBhY2Nlc3MgdG8gdGhpcyBtZGV2
IGRldmljZSdzIHZlcnNpb24gYXR0cmlidXRlLgo+ID4gPiA+ICsgIElmIGEgbWRldiBkZXZpY2Ug
aXMgb25seSBpbmNvbXBhdGlibGUgdG8gY2VydGFpbiBtZGV2IGRldmljZXMsIHdyaXRlIG9mCj4g
PiA+ID4gKyAgaW5jb21wYXRpYmxlIG1kZXYgZGV2aWNlcydzIHZlcnNpb24gc3RyaW5ncyB0byBp
dHMgdmVyc2lvbiBhdHRyaWJ1dGUgc2hvdWxkCj4gPiA+ID4gKyAgcmV0dXJuIC1FSU5WQUw7ICAg
IAo+ID4gPiAKPiA+ID4gSSB0aGluayBpdCdzIGJlc3Qgbm90IHRvIGRlZmluZSB0aGUgc3BlY2lm
aWMgZXJybm8gcmV0dXJuZWQgZm9yIGEKPiA+ID4gc3BlY2lmaWMgc2l0dWF0aW9uLCBsZXQgdGhl
IHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1c2Vyc3BhY2Ugc2ltcGx5Cj4gPiA+IG5lZWRzIHRvIGtu
b3cgdGhhdCBhbiBlcnJubyBvbiByZWFkIGluZGljYXRlcyB0aGUgZGV2aWNlIGRvZXMgbm90Cj4g
PiA+IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNvbiBhbmQgdGhhdCBhbiBlcnJu
byBvbiB3cml0ZQo+ID4gPiBpbmRpY2F0ZXMgdGhlIGRldmljZXMgYXJlIGluY29tcGF0aWJsZSBv
ciB0aGUgdGFyZ2V0IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiBtaWdyYXRpb24gdmVyc2lvbnMuICAK
PiA+IAo+ID4gSSB0aGluayBJIGhhdmUgdG8gZGlzYWdyZWUgaGVyZTogSXQncyBwcm9iYWJseSB2
YWx1YWJsZSB0byBoYXZlIGFuCj4gPiBhZ3JlZWQgZXJyb3IgZm9yICdjYW5ub3QgbWlncmF0ZSBh
dCBhbGwnIHZzICdjYW5ub3QgbWlncmF0ZSBiZXR3ZWVuCj4gPiB0aG9zZSB0d28gcGFydGljdWxh
ciBkZXZpY2VzJy4gVXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gZG8gZGlmZmVyZW50Cj4gPiB0aGlu
Z3MgKGUuZy4gdHJ5aW5nIHdpdGggZGlmZmVyZW50IGRldmljZSBwYWlycykuICAKPiAKPiBUcnlp
bmcgdG8gc3R1ZmYgdGhlc2UgdGhpbmdzIGRvd24gYW4gZXJybm8gc2VlbXMgYSBiYWQgaWRlYTsg
d2UgY2FuJ3QKPiBnZXQgbXVjaCBpbmZvcm1hdGlvbiB0aGF0IHdheS4KClNvLCB3aGF0IHdvdWxk
IGJlIGEgcmVhc29uYWJsZSBhcHByb2FjaD8gVXNlcnNwYWNlIHNob3VsZCBmaXJzdCByZWFkCnRo
ZSB2ZXJzaW9uIGF0dHJpYnV0ZXMgb24gYm90aCBkZXZpY2VzICh0byBmaW5kIG91dCB3aGV0aGVy
IG1pZ3JhdGlvbgppcyBzdXBwb3J0ZWQgYXQgYWxsKSwgYW5kIG9ubHkgdGhlbiBmaWd1cmUgb3V0
IHZpYSB3cml0aW5nIHdoZXRoZXIgdGhleQphcmUgY29tcGF0aWJsZT8KCihPciBqdXN0IGdvIGFo
ZWFkIGFuZCB0cnksIGlmIGl0IGRvZXMgbm90IGNhcmUgYWJvdXQgdGhlIHJlYXNvbi4pCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
