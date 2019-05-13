Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECAE1B705
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 May 2019 15:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C149389D3E;
	Mon, 13 May 2019 13:28:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591F89D3E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 May 2019 13:28:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 285468830B;
 Mon, 13 May 2019 13:28:20 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D1EE10027DA;
 Mon, 13 May 2019 13:28:07 +0000 (UTC)
Date: Mon, 13 May 2019 15:28:04 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190513132804.GD11139@beluga.usersys.redhat.com>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510114838.7e16c3d6.cohuck@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 13 May 2019 13:28:20 +0000 (UTC)
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
 yi.l.liu@intel.com, ziye.yang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, libvir-list@redhat.com, arei.gonglei@huawei.com,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com,
 Yan Zhao <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, zhenyuw@linux.intel.com,
 dinechin@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTE6NDg6MzhBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBGcmksIDEwIE1heSAyMDE5IDEwOjM2OjA5ICswMTAwCj4gIkRyLiBEYXZpZCBB
bGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToKPgo+ID4gKiBDb3JuZWxp
YSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gPiA+IE9uIFRodSwgOSBNYXkgMjAx
OSAxNzo0ODoyNiArMDEwMAo+ID4gPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+ICogQ29ybmVsaWEgSHVjayAoY29odWNr
QHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCA5IE1heSAyMDE5IDE2OjQ4OjU3
ICswMTAwCj4gPiA+ID4gPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhh
dC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKiBDb3JuZWxpYSBIdWNrIChjb2h1
Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gVHVlLCA3IE1heSAyMDE5IDE1
OjE4OjI2IC0wNjAwCj4gPiA+ID4gPiA+ID4gQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1z
b25AcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9uIFN1
biwgIDUgTWF5IDIwMTkgMjE6NDk6MDQgLTA0MDAKPiA+ID4gPiA+ID4gPiA+IFlhbiBaaGFvIDx5
YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gKyAgRXJybm86Cj4gPiA+ID4gPiA+ID4gPiA+ICsgIElmIHZlbmRvciBkcml2ZXIgd2FudHMg
dG8gY2xhaW0gYSBtZGV2IGRldmljZSBpbmNvbXBhdGlibGUgdG8gYWxsIG90aGVyIG1kZXYKPiA+
ID4gPiA+ID4gPiA+ID4gKyAgZGV2aWNlcywgaXQgc2hvdWxkIG5vdCByZWdpc3RlciB2ZXJzaW9u
IGF0dHJpYnV0ZSBmb3IgdGhpcyBtZGV2IGRldmljZS4gQnV0IGlmCj4gPiA+ID4gPiA+ID4gPiA+
ICsgIGEgdmVuZG9yIGRyaXZlciBoYXMgYWxyZWFkeSByZWdpc3RlcmVkIHZlcnNpb24gYXR0cmli
dXRlIGFuZCBpdCB3YW50cyB0byBjbGFpbQo+ID4gPiA+ID4gPiA+ID4gPiArICBhIG1kZXYgZGV2
aWNlIGluY29tcGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldiBkZXZpY2VzLCBpdCBuZWVkcyB0byBy
ZXR1cm4KPiA+ID4gPiA+ID4gPiA+ID4gKyAgLUVOT0RFViBvbiBhY2Nlc3MgdG8gdGhpcyBtZGV2
IGRldmljZSdzIHZlcnNpb24gYXR0cmlidXRlLgo+ID4gPiA+ID4gPiA+ID4gPiArICBJZiBhIG1k
ZXYgZGV2aWNlIGlzIG9ubHkgaW5jb21wYXRpYmxlIHRvIGNlcnRhaW4gbWRldiBkZXZpY2VzLCB3
cml0ZSBvZgo+ID4gPiA+ID4gPiA+ID4gPiArICBpbmNvbXBhdGlibGUgbWRldiBkZXZpY2VzJ3Mg
dmVyc2lvbiBzdHJpbmdzIHRvIGl0cyB2ZXJzaW9uIGF0dHJpYnV0ZSBzaG91bGQKPiA+ID4gPiA+
ID4gPiA+ID4gKyAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gSSB0aGluayBpdCdzIGJlc3Qgbm90IHRvIGRlZmluZSB0aGUgc3BlY2lmaWMgZXJybm8gcmV0
dXJuZWQgZm9yIGEKPiA+ID4gPiA+ID4gPiA+IHNwZWNpZmljIHNpdHVhdGlvbiwgbGV0IHRoZSB2
ZW5kb3IgZHJpdmVyIGRlY2lkZSwgdXNlcnNwYWNlIHNpbXBseQo+ID4gPiA+ID4gPiA+ID4gbmVl
ZHMgdG8ga25vdyB0aGF0IGFuIGVycm5vIG9uIHJlYWQgaW5kaWNhdGVzIHRoZSBkZXZpY2UgZG9l
cyBub3QKPiA+ID4gPiA+ID4gPiA+IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNv
biBhbmQgdGhhdCBhbiBlcnJubyBvbiB3cml0ZQo+ID4gPiA+ID4gPiA+ID4gaW5kaWNhdGVzIHRo
ZSBkZXZpY2VzIGFyZSBpbmNvbXBhdGlibGUgb3IgdGhlIHRhcmdldCBkb2Vzbid0IHN1cHBvcnQK
PiA+ID4gPiA+ID4gPiA+IG1pZ3JhdGlvbiB2ZXJzaW9ucy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IEkgdGhpbmsgSSBoYXZlIHRvIGRpc2FncmVlIGhlcmU6IEl0J3MgcHJvYmFibHkgdmFs
dWFibGUgdG8gaGF2ZSBhbgo+ID4gPiA+ID4gPiA+IGFncmVlZCBlcnJvciBmb3IgJ2Nhbm5vdCBt
aWdyYXRlIGF0IGFsbCcgdnMgJ2Nhbm5vdCBtaWdyYXRlIGJldHdlZW4KPiA+ID4gPiA+ID4gPiB0
aG9zZSB0d28gcGFydGljdWxhciBkZXZpY2VzJy4gVXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gZG8g
ZGlmZmVyZW50Cj4gPiA+ID4gPiA+ID4gdGhpbmdzIChlLmcuIHRyeWluZyB3aXRoIGRpZmZlcmVu
dCBkZXZpY2UgcGFpcnMpLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUcnlpbmcgdG8gc3R1ZmYg
dGhlc2UgdGhpbmdzIGRvd24gYW4gZXJybm8gc2VlbXMgYSBiYWQgaWRlYTsgd2UgY2FuJ3QKPiA+
ID4gPiA+ID4gZ2V0IG11Y2ggaW5mb3JtYXRpb24gdGhhdCB3YXkuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gU28sIHdoYXQgd291bGQgYmUgYSByZWFzb25hYmxlIGFwcHJvYWNoPyBVc2Vyc3BhY2Ugc2hv
dWxkIGZpcnN0IHJlYWQKPiA+ID4gPiA+IHRoZSB2ZXJzaW9uIGF0dHJpYnV0ZXMgb24gYm90aCBk
ZXZpY2VzICh0byBmaW5kIG91dCB3aGV0aGVyIG1pZ3JhdGlvbgo+ID4gPiA+ID4gaXMgc3VwcG9y
dGVkIGF0IGFsbCksIGFuZCBvbmx5IHRoZW4gZmlndXJlIG91dCB2aWEgd3JpdGluZyB3aGV0aGVy
IHRoZXkKPiA+ID4gPiA+IGFyZSBjb21wYXRpYmxlPwo+ID4gPiA+ID4KPiA+ID4gPiA+IChPciBq
dXN0IGdvIGFoZWFkIGFuZCB0cnksIGlmIGl0IGRvZXMgbm90IGNhcmUgYWJvdXQgdGhlIHJlYXNv
bi4pCj4gPiA+ID4KPiA+ID4gPiBXZWxsLCBJJ20gT0sgd2l0aCBzb21ldGhpbmcgbGlrZSB3cml0
aW5nIHRvIHRlc3Qgd2hldGhlciBpdCdzCj4gPiA+ID4gY29tcGF0aWJsZSwgaXQncyBqdXN0IHdl
IG5lZWQgYSBiZXR0ZXIgd2F5IG9mIHNheWluZyAnbm8nLgo+ID4gPiA+IEknbSBub3Qgc3VyZSBp
ZiB0aGF0IGludm9sdmVzIHJlYWRpbmcgYmFjayBmcm9tIHNvbWV3aGVyZSBhZnRlcgo+ID4gPiA+
IHRoZSB3cml0ZSBvciB3aGF0Lgo+ID4gPgo+ID4gPiBIbSwgc28gSSBiYXNpY2FsbHkgc2VlIHR3
byB3YXlzIG9mIGRvaW5nIHRoYXQ6Cj4gPiA+IC0gc3RhbmRhcmRpemUgb24gc29tZSBlcnJvciBj
b2Rlcy4uLiBwcm9ibGVtOiBlcnJvciBjb2RlcyBjYW4gYmUgaGFyZAo+ID4gPiAgIHRvIGZpdCB0
byByZWFzb25zCj4gPiA+IC0gbWFrZSB0aGUgZXJyb3IgYXZhaWxhYmxlIGluIHNvbWUgYXR0cmli
dXRlIHRoYXQgY2FuIGJlIHJlYWQKPiA+ID4KPiA+ID4gSSdtIG5vdCBzdXJlIGhvdyB3ZSBjYW4g
c2VyaWFsaXplIHRoZSByZWFkYmFjayB3aXRoIHRoZSBsYXN0IHdyaXRlLAo+ID4gPiB0aG91Z2gg
KHRoaXMgbG9va3MgaW5oZXJlbnRseSByYWN5KS4KPiA+ID4KPiA+ID4gSG93IGltcG9ydGFudCBp
cyBkZXRhaWxlZCBlcnJvciByZXBvcnRpbmcgaGVyZT8KPiA+Cj4gPiBJIHRoaW5rIHdlIG5lZWQg
c29tZXRoaW5nLCBvdGhlcndpc2Ugd2UncmUganVzdCBnb2luZyB0byBnZXQgdmFndWUKPiA+IHVz
ZXIgcmVwb3J0cyBvZiAnYnV0IG15IFZNIGRvZXNuJ3QgbWlncmF0ZSc7IEknZCBsaWtlIHRoZSBl
cnJvciB0byBiZQo+ID4gZ29vZCBlbm91Z2ggdG8gcG9pbnQgbW9zdCB1c2VycyB0byBzb21ldGhp
bmcgdGhleSBjYW4gdW5kZXJzdGFuZAo+ID4gKGUuZy4gd3JvbmcgY2FyZCBmYW1pbHkvdG9vIG9s
ZCBhIGRyaXZlciBldGMpLgo+Cj4gT2ssIHRoYXQgc291bmRzIGxpa2UgYSByZWFzb25hYmxlIHBv
aW50LiBOb3QgdGhhdCBJIGhhdmUgYSBiZXR0ZXIgaWRlYQo+IGhvdyB0byBhY2hpZXZlIHRoYXQs
IHRob3VnaC4uLiB3ZSBjb3VsZCBhbHNvIGxvZyBhIG1vcmUgdmVyYm9zZSBlcnJvcgo+IG1lc3Nh
Z2UgdG8gdGhlIGtlcm5lbCBsb2csIGJ1dCB0aGF0J3Mgbm90IG5lY2Vzc2FyaWx5IHdoZXJlIGEg
dXNlciB3aWxsCj4gbG9vayBmaXJzdC4KCkluIGNhc2Ugb2YgbGlidmlydCBjaGVja2luZyB0aGUg
Y29tcGF0aWJpbGl0eSwgaXQgd29uJ3QgbWF0dGVyIGhvdyBnb29kIHRoZQplcnJvciBtZXNzYWdl
IGluIHRoZSBrZXJuZWwgbG9nIGlzIGFuZCByZWdhcmRsZXNzIG9mIGhvdyBtYW55IGVycm9yIHN0
YXRlcyB5b3UKd2FudCB0byBoYW5kbGUsIGxpYnZpcnQncyBvbmx5IGxpbWl0ZWQgdG8gZXJybm8g
aGVyZSwgc2luY2Ugd2UncmUgZ29pbmcgdG8gZG8KcGxhaW4gcmVhZC93cml0ZSwgc28gb3VyIGlu
dGVybmFsIGVycm9yIG1lc3NhZ2UgcmV0dXJuZWQgdG8gdGhlIHVzZXIgaXMgb25seQpnb2luZyB0
byBjb250YWluIHdoYXQgdGhlIGVycm5vIHNheXMgLSBva2F5LCBvZiBjb3Vyc2Ugd2UgY2FuIChh
bmQgd2UgRE8pCnByb3ZpZGUgbGlidmlydCBzcGVjaWZpYyBzdHJpbmcsIGZ1cnRoZXIgc3BlY2lm
eWluZyB0aGUgZXJyb3IgYnV0IGxpa2UgSQptZW50aW9uZWQsIGRlcGVuZGluZyBvbiBob3cgbWFu
eSBlcnJvciBjYXNlcyB3ZSB3YW50IHRvIGRpc3Rpbmd1aXNoIHRoaXMgbWF5IGJlCmhhcmQgZm9y
IGFueW9uZSB0byBmaWd1cmUgb3V0IHNvbGVseSBvbiB0aGUgZXJyb3IgY29kZSwgYXMgYXBwcyB3
aWxsIG1vc3QKcHJvYmFibHkgbm90IHBhcnNlIHRoZQpsb2dzLgoKUmVnYXJkcywKRXJpawo+Cj4g
SWRlYWxseSwgd2UnZCB3YW50IHRvIGhhdmUgdGhlIHVzZXIgc3BhY2UgcHJvZ3JhbSBzZXR0aW5n
IHVwIHRoaW5ncwo+IHF1ZXJ5aW5nIHRoZSBnZW5lcmFsIGNvbXBhdGliaWxpdHkgZm9yIG1pZ3Jh
dGlvbiAoc28gdGhhdCBpdCBiZWNvbWVzCj4gdGhlaXIgcHJvYmxlbSBvbiBob3cgdG8gYWxlcnQg
dGhlIHVzZXIgdG8gcHJvYmxlbXMgOiksIGJ1dCBJJ20gbm90IHN1cmUKPiBob3cgdG8gZWxpbWlu
YXRlIHRoZSByYWNlIGJldHdlZW4gYXNraW5nIHRoZSB2ZW5kb3IgZHJpdmVyIGZvcgo+IGNvbXBh
dGliaWxpdHkgYW5kIGdldHRpbmcgdGhlIHJlc3VsdCBvZiB0aGF0IG9wZXJhdGlvbi4KPgo+IFVu
bGVzcyB3ZSBpbnRyb2R1Y2UgYW4gaW50ZXJmYWNlIHRoYXQgY2FuIHJldHJpZXZlIF9hbGxfIHJl
c3VsdHMKPiB0b2dldGhlciB3aXRoIHRoZSB3cml0dGVuIHZhbHVlPyBPciBpcyB0aGF0IG5vdCBn
b2luZyB0byBiZSBtdWNoIG9mIGEKPiBwcm9ibGVtIGluIHByYWN0aWNlPwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
