Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB819A3C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 May 2019 11:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282A78957B;
	Fri, 10 May 2019 09:08:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0948957B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 May 2019 09:08:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 23BC3C058CAF;
 Fri, 10 May 2019 09:08:55 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C3A35D962;
 Fri, 10 May 2019 09:08:40 +0000 (UTC)
Date: Fri, 10 May 2019 11:08:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190510110838.2df4c4d0.cohuck@redhat.com>
In-Reply-To: <20190509164825.GG2868@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 10 May 2019 09:08:55 +0000 (UTC)
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

T24gVGh1LCA5IE1heSAyMDE5IDE3OjQ4OjI2ICswMTAwCiJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+ICogQ29ybmVsaWEgSHVjayAoY29odWNr
QHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gT24gVGh1LCA5IE1heSAyMDE5IDE2OjQ4OjU3ICswMTAw
Cj4gPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+IHdyb3Rl
Ogo+ID4gICAKPiA+ID4gKiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6
ICAKPiA+ID4gPiBPbiBUdWUsIDcgTWF5IDIwMTkgMTU6MTg6MjYgLTA2MDAKPiA+ID4gPiBBbGV4
IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiAg
ICAgCj4gPiA+ID4gPiBPbiBTdW4sICA1IE1heSAyMDE5IDIxOjQ5OjA0IC0wNDAwCj4gPiA+ID4g
PiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOiAgICAKPiA+ID4gPiAgICAg
Cj4gPiA+ID4gPiA+ICsgIEVycm5vOgo+ID4gPiA+ID4gPiArICBJZiB2ZW5kb3IgZHJpdmVyIHdh
bnRzIHRvIGNsYWltIGEgbWRldiBkZXZpY2UgaW5jb21wYXRpYmxlIHRvIGFsbCBvdGhlciBtZGV2
Cj4gPiA+ID4gPiA+ICsgIGRldmljZXMsIGl0IHNob3VsZCBub3QgcmVnaXN0ZXIgdmVyc2lvbiBh
dHRyaWJ1dGUgZm9yIHRoaXMgbWRldiBkZXZpY2UuIEJ1dCBpZgo+ID4gPiA+ID4gPiArICBhIHZl
bmRvciBkcml2ZXIgaGFzIGFscmVhZHkgcmVnaXN0ZXJlZCB2ZXJzaW9uIGF0dHJpYnV0ZSBhbmQg
aXQgd2FudHMgdG8gY2xhaW0KPiA+ID4gPiA+ID4gKyAgYSBtZGV2IGRldmljZSBpbmNvbXBhdGli
bGUgdG8gYWxsIG90aGVyIG1kZXYgZGV2aWNlcywgaXQgbmVlZHMgdG8gcmV0dXJuCj4gPiA+ID4g
PiA+ICsgIC1FTk9ERVYgb24gYWNjZXNzIHRvIHRoaXMgbWRldiBkZXZpY2UncyB2ZXJzaW9uIGF0
dHJpYnV0ZS4KPiA+ID4gPiA+ID4gKyAgSWYgYSBtZGV2IGRldmljZSBpcyBvbmx5IGluY29tcGF0
aWJsZSB0byBjZXJ0YWluIG1kZXYgZGV2aWNlcywgd3JpdGUgb2YKPiA+ID4gPiA+ID4gKyAgaW5j
b21wYXRpYmxlIG1kZXYgZGV2aWNlcydzIHZlcnNpb24gc3RyaW5ncyB0byBpdHMgdmVyc2lvbiBh
dHRyaWJ1dGUgc2hvdWxkCj4gPiA+ID4gPiA+ICsgIHJldHVybiAtRUlOVkFMOyAgICAgIAo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBJIHRoaW5rIGl0J3MgYmVzdCBub3QgdG8gZGVmaW5lIHRoZSBzcGVj
aWZpYyBlcnJubyByZXR1cm5lZCBmb3IgYQo+ID4gPiA+ID4gc3BlY2lmaWMgc2l0dWF0aW9uLCBs
ZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1c2Vyc3BhY2Ugc2ltcGx5Cj4gPiA+ID4gPiBu
ZWVkcyB0byBrbm93IHRoYXQgYW4gZXJybm8gb24gcmVhZCBpbmRpY2F0ZXMgdGhlIGRldmljZSBk
b2VzIG5vdAo+ID4gPiA+ID4gc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29uIGFu
ZCB0aGF0IGFuIGVycm5vIG9uIHdyaXRlCj4gPiA+ID4gPiBpbmRpY2F0ZXMgdGhlIGRldmljZXMg
YXJlIGluY29tcGF0aWJsZSBvciB0aGUgdGFyZ2V0IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiA+ID4g
bWlncmF0aW9uIHZlcnNpb25zLiAgICAKPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIEkgaGF2ZSB0
byBkaXNhZ3JlZSBoZXJlOiBJdCdzIHByb2JhYmx5IHZhbHVhYmxlIHRvIGhhdmUgYW4KPiA+ID4g
PiBhZ3JlZWQgZXJyb3IgZm9yICdjYW5ub3QgbWlncmF0ZSBhdCBhbGwnIHZzICdjYW5ub3QgbWln
cmF0ZSBiZXR3ZWVuCj4gPiA+ID4gdGhvc2UgdHdvIHBhcnRpY3VsYXIgZGV2aWNlcycuIFVzZXJz
cGFjZSBtaWdodCB3YW50IHRvIGRvIGRpZmZlcmVudAo+ID4gPiA+IHRoaW5ncyAoZS5nLiB0cnlp
bmcgd2l0aCBkaWZmZXJlbnQgZGV2aWNlIHBhaXJzKS4gICAgCj4gPiA+IAo+ID4gPiBUcnlpbmcg
dG8gc3R1ZmYgdGhlc2UgdGhpbmdzIGRvd24gYW4gZXJybm8gc2VlbXMgYSBiYWQgaWRlYTsgd2Ug
Y2FuJ3QKPiA+ID4gZ2V0IG11Y2ggaW5mb3JtYXRpb24gdGhhdCB3YXkuICAKPiA+IAo+ID4gU28s
IHdoYXQgd291bGQgYmUgYSByZWFzb25hYmxlIGFwcHJvYWNoPyBVc2Vyc3BhY2Ugc2hvdWxkIGZp
cnN0IHJlYWQKPiA+IHRoZSB2ZXJzaW9uIGF0dHJpYnV0ZXMgb24gYm90aCBkZXZpY2VzICh0byBm
aW5kIG91dCB3aGV0aGVyIG1pZ3JhdGlvbgo+ID4gaXMgc3VwcG9ydGVkIGF0IGFsbCksIGFuZCBv
bmx5IHRoZW4gZmlndXJlIG91dCB2aWEgd3JpdGluZyB3aGV0aGVyIHRoZXkKPiA+IGFyZSBjb21w
YXRpYmxlPwo+ID4gCj4gPiAoT3IganVzdCBnbyBhaGVhZCBhbmQgdHJ5LCBpZiBpdCBkb2VzIG5v
dCBjYXJlIGFib3V0IHRoZSByZWFzb24uKSAgCj4gCj4gV2VsbCwgSSdtIE9LIHdpdGggc29tZXRo
aW5nIGxpa2Ugd3JpdGluZyB0byB0ZXN0IHdoZXRoZXIgaXQncwo+IGNvbXBhdGlibGUsIGl0J3Mg
anVzdCB3ZSBuZWVkIGEgYmV0dGVyIHdheSBvZiBzYXlpbmcgJ25vJy4KPiBJJ20gbm90IHN1cmUg
aWYgdGhhdCBpbnZvbHZlcyByZWFkaW5nIGJhY2sgZnJvbSBzb21ld2hlcmUgYWZ0ZXIKPiB0aGUg
d3JpdGUgb3Igd2hhdC4KCkhtLCBzbyBJIGJhc2ljYWxseSBzZWUgdHdvIHdheXMgb2YgZG9pbmcg
dGhhdDoKLSBzdGFuZGFyZGl6ZSBvbiBzb21lIGVycm9yIGNvZGVzLi4uIHByb2JsZW06IGVycm9y
IGNvZGVzIGNhbiBiZSBoYXJkCiAgdG8gZml0IHRvIHJlYXNvbnMKLSBtYWtlIHRoZSBlcnJvciBh
dmFpbGFibGUgaW4gc29tZSBhdHRyaWJ1dGUgdGhhdCBjYW4gYmUgcmVhZAoKSSdtIG5vdCBzdXJl
IGhvdyB3ZSBjYW4gc2VyaWFsaXplIHRoZSByZWFkYmFjayB3aXRoIHRoZSBsYXN0IHdyaXRlLAp0
aG91Z2ggKHRoaXMgbG9va3MgaW5oZXJlbnRseSByYWN5KS4KCkhvdyBpbXBvcnRhbnQgaXMgZGV0
YWlsZWQgZXJyb3IgcmVwb3J0aW5nIGhlcmU/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
