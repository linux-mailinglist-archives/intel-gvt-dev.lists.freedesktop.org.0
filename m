Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC51C419
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 09:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852F892E2;
	Tue, 14 May 2019 07:44:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80F8892E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 07:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CDB6630820EA;
 Tue, 14 May 2019 07:43:58 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA2675C206;
 Tue, 14 May 2019 07:43:46 +0000 (UTC)
Date: Tue, 14 May 2019 09:43:44 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514074344.GB2089@beluga.usersys.redhat.com>
References: <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
 <20190513132804.GD11139@beluga.usersys.redhat.com>
 <20190514061235.GC20407@joy-OptiPlex-7040>
 <20190514072039.GA2089@beluga.usersys.redhat.com>
 <20190514073219.GD20407@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514073219.GD20407@joy-OptiPlex-7040>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 14 May 2019 07:43:59 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6MzI6MTlBTSAtMDQwMCwgWWFuIFpoYW8gd3JvdGU6
Cj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6MjA6NDBQTSArMDgwMCwgRXJpayBTa3VsdGV0
eSB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDAyOjEyOjM1QU0gLTA0MDAsIFlh
biBaaGFvIHdyb3RlOgo+ID4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwOToyODowNFBNICsw
ODAwLCBFcmlrIFNrdWx0ZXR5IHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0
IDExOjQ4OjM4QU0gKzAyMDAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmks
IDEwIE1heSAyMDE5IDEwOjM2OjA5ICswMTAwCj4gPiA+ID4gPiAiRHIuIERhdmlkIEFsYW4gR2ls
YmVydCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
KiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4g
T24gVGh1LCA5IE1heSAyMDE5IDE3OjQ4OjI2ICswMTAwCj4gPiA+ID4gPiA+ID4gIkRyLiBEYXZp
ZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gKiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFRodSwgOSBNYXkgMjAxOSAxNjo0ODo1NyArMDEwMAo+
ID4gPiA+ID4gPiA+ID4gPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhh
dC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICogQ29y
bmVsaWEgSHVjayAoY29odWNrQHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gT24gVHVlLCA3IE1heSAyMDE5IDE1OjE4OjI2IC0wNjAwCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIFN1biwgIDUgTWF5
IDIwMTkgMjE6NDk6MDQgLTA0MDAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gWWFuIFpoYW8gPHlh
bi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgRXJybm86Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
SWYgdmVuZG9yIGRyaXZlciB3YW50cyB0byBjbGFpbSBhIG1kZXYgZGV2aWNlIGluY29tcGF0aWJs
ZSB0byBhbGwgb3RoZXIgbWRldgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGRldmljZXMs
IGl0IHNob3VsZCBub3QgcmVnaXN0ZXIgdmVyc2lvbiBhdHRyaWJ1dGUgZm9yIHRoaXMgbWRldiBk
ZXZpY2UuIEJ1dCBpZgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGEgdmVuZG9yIGRyaXZl
ciBoYXMgYWxyZWFkeSByZWdpc3RlcmVkIHZlcnNpb24gYXR0cmlidXRlIGFuZCBpdCB3YW50cyB0
byBjbGFpbQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGEgbWRldiBkZXZpY2UgaW5jb21w
YXRpYmxlIHRvIGFsbCBvdGhlciBtZGV2IGRldmljZXMsIGl0IG5lZWRzIHRvIHJldHVybgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIC1FTk9ERVYgb24gYWNjZXNzIHRvIHRoaXMgbWRldiBk
ZXZpY2UncyB2ZXJzaW9uIGF0dHJpYnV0ZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBJ
ZiBhIG1kZXYgZGV2aWNlIGlzIG9ubHkgaW5jb21wYXRpYmxlIHRvIGNlcnRhaW4gbWRldiBkZXZp
Y2VzLCB3cml0ZSBvZgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGluY29tcGF0aWJsZSBt
ZGV2IGRldmljZXMncyB2ZXJzaW9uIHN0cmluZ3MgdG8gaXRzIHZlcnNpb24gYXR0cmlidXRlIHNo
b3VsZAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJIHRoaW5rIGl0J3MgYmVz
dCBub3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBlcnJubyByZXR1cm5lZCBmb3IgYQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBzcGVjaWZpYyBzaXR1YXRpb24sIGxldCB0aGUgdmVuZG9yIGRyaXZl
ciBkZWNpZGUsIHVzZXJzcGFjZSBzaW1wbHkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gbmVlZHMg
dG8ga25vdyB0aGF0IGFuIGVycm5vIG9uIHJlYWQgaW5kaWNhdGVzIHRoZSBkZXZpY2UgZG9lcyBu
b3QKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21w
YXJpc29uIGFuZCB0aGF0IGFuIGVycm5vIG9uIHdyaXRlCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IGluZGljYXRlcyB0aGUgZGV2aWNlcyBhcmUgaW5jb21wYXRpYmxlIG9yIHRoZSB0YXJnZXQgZG9l
c24ndCBzdXBwb3J0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IG1pZ3JhdGlvbiB2ZXJzaW9ucy4K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJIHRoaW5rIEkgaGF2
ZSB0byBkaXNhZ3JlZSBoZXJlOiBJdCdzIHByb2JhYmx5IHZhbHVhYmxlIHRvIGhhdmUgYW4KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IGFncmVlZCBlcnJvciBmb3IgJ2Nhbm5vdCBtaWdyYXRlIGF0IGFs
bCcgdnMgJ2Nhbm5vdCBtaWdyYXRlIGJldHdlZW4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHRob3Nl
IHR3byBwYXJ0aWN1bGFyIGRldmljZXMnLiBVc2Vyc3BhY2UgbWlnaHQgd2FudCB0byBkbyBkaWZm
ZXJlbnQKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHRoaW5ncyAoZS5nLiB0cnlpbmcgd2l0aCBkaWZm
ZXJlbnQgZGV2aWNlIHBhaXJzKS4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
PiA+IFRyeWluZyB0byBzdHVmZiB0aGVzZSB0aGluZ3MgZG93biBhbiBlcnJubyBzZWVtcyBhIGJh
ZCBpZGVhOyB3ZSBjYW4ndAo+ID4gPiA+ID4gPiA+ID4gPiA+IGdldCBtdWNoIGluZm9ybWF0aW9u
IHRoYXQgd2F5Lgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBTbywgd2hhdCB3
b3VsZCBiZSBhIHJlYXNvbmFibGUgYXBwcm9hY2g/IFVzZXJzcGFjZSBzaG91bGQgZmlyc3QgcmVh
ZAo+ID4gPiA+ID4gPiA+ID4gPiB0aGUgdmVyc2lvbiBhdHRyaWJ1dGVzIG9uIGJvdGggZGV2aWNl
cyAodG8gZmluZCBvdXQgd2hldGhlciBtaWdyYXRpb24KPiA+ID4gPiA+ID4gPiA+ID4gaXMgc3Vw
cG9ydGVkIGF0IGFsbCksIGFuZCBvbmx5IHRoZW4gZmlndXJlIG91dCB2aWEgd3JpdGluZyB3aGV0
aGVyIHRoZXkKPiA+ID4gPiA+ID4gPiA+ID4gYXJlIGNvbXBhdGlibGU/Cj4gPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiA+IChPciBqdXN0IGdvIGFoZWFkIGFuZCB0cnksIGlmIGl0IGRv
ZXMgbm90IGNhcmUgYWJvdXQgdGhlIHJlYXNvbi4pCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gV2VsbCwgSSdtIE9LIHdpdGggc29tZXRoaW5nIGxpa2Ugd3JpdGluZyB0byB0ZXN0IHdo
ZXRoZXIgaXQncwo+ID4gPiA+ID4gPiA+ID4gY29tcGF0aWJsZSwgaXQncyBqdXN0IHdlIG5lZWQg
YSBiZXR0ZXIgd2F5IG9mIHNheWluZyAnbm8nLgo+ID4gPiA+ID4gPiA+ID4gSSdtIG5vdCBzdXJl
IGlmIHRoYXQgaW52b2x2ZXMgcmVhZGluZyBiYWNrIGZyb20gc29tZXdoZXJlIGFmdGVyCj4gPiA+
ID4gPiA+ID4gPiB0aGUgd3JpdGUgb3Igd2hhdC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IEhtLCBzbyBJIGJhc2ljYWxseSBzZWUgdHdvIHdheXMgb2YgZG9pbmcgdGhhdDoKPiA+ID4gPiA+
ID4gPiAtIHN0YW5kYXJkaXplIG9uIHNvbWUgZXJyb3IgY29kZXMuLi4gcHJvYmxlbTogZXJyb3Ig
Y29kZXMgY2FuIGJlIGhhcmQKPiA+ID4gPiA+ID4gPiAgIHRvIGZpdCB0byByZWFzb25zCj4gPiA+
ID4gPiA+ID4gLSBtYWtlIHRoZSBlcnJvciBhdmFpbGFibGUgaW4gc29tZSBhdHRyaWJ1dGUgdGhh
dCBjYW4gYmUgcmVhZAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSdtIG5vdCBzdXJlIGhv
dyB3ZSBjYW4gc2VyaWFsaXplIHRoZSByZWFkYmFjayB3aXRoIHRoZSBsYXN0IHdyaXRlLAo+ID4g
PiA+ID4gPiA+IHRob3VnaCAodGhpcyBsb29rcyBpbmhlcmVudGx5IHJhY3kpLgo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gSG93IGltcG9ydGFudCBpcyBkZXRhaWxlZCBlcnJvciByZXBvcnRp
bmcgaGVyZT8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB0aGluayB3ZSBuZWVkIHNvbWV0aGlu
Zywgb3RoZXJ3aXNlIHdlJ3JlIGp1c3QgZ29pbmcgdG8gZ2V0IHZhZ3VlCj4gPiA+ID4gPiA+IHVz
ZXIgcmVwb3J0cyBvZiAnYnV0IG15IFZNIGRvZXNuJ3QgbWlncmF0ZSc7IEknZCBsaWtlIHRoZSBl
cnJvciB0byBiZQo+ID4gPiA+ID4gPiBnb29kIGVub3VnaCB0byBwb2ludCBtb3N0IHVzZXJzIHRv
IHNvbWV0aGluZyB0aGV5IGNhbiB1bmRlcnN0YW5kCj4gPiA+ID4gPiA+IChlLmcuIHdyb25nIGNh
cmQgZmFtaWx5L3RvbyBvbGQgYSBkcml2ZXIgZXRjKS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPaywg
dGhhdCBzb3VuZHMgbGlrZSBhIHJlYXNvbmFibGUgcG9pbnQuIE5vdCB0aGF0IEkgaGF2ZSBhIGJl
dHRlciBpZGVhCj4gPiA+ID4gPiBob3cgdG8gYWNoaWV2ZSB0aGF0LCB0aG91Z2guLi4gd2UgY291
bGQgYWxzbyBsb2cgYSBtb3JlIHZlcmJvc2UgZXJyb3IKPiA+ID4gPiA+IG1lc3NhZ2UgdG8gdGhl
IGtlcm5lbCBsb2csIGJ1dCB0aGF0J3Mgbm90IG5lY2Vzc2FyaWx5IHdoZXJlIGEgdXNlciB3aWxs
Cj4gPiA+ID4gPiBsb29rIGZpcnN0Lgo+ID4gPiA+Cj4gPiA+ID4gSW4gY2FzZSBvZiBsaWJ2aXJ0
IGNoZWNraW5nIHRoZSBjb21wYXRpYmlsaXR5LCBpdCB3b24ndCBtYXR0ZXIgaG93IGdvb2QgdGhl
Cj4gPiA+ID4gZXJyb3IgbWVzc2FnZSBpbiB0aGUga2VybmVsIGxvZyBpcyBhbmQgcmVnYXJkbGVz
cyBvZiBob3cgbWFueSBlcnJvciBzdGF0ZXMgeW91Cj4gPiA+ID4gd2FudCB0byBoYW5kbGUsIGxp
YnZpcnQncyBvbmx5IGxpbWl0ZWQgdG8gZXJybm8gaGVyZSwgc2luY2Ugd2UncmUgZ29pbmcgdG8g
ZG8KPiA+ID4gPiBwbGFpbiByZWFkL3dyaXRlLCBzbyBvdXIgaW50ZXJuYWwgZXJyb3IgbWVzc2Fn
ZSByZXR1cm5lZCB0byB0aGUgdXNlciBpcyBvbmx5Cj4gPiA+ID4gZ29pbmcgdG8gY29udGFpbiB3
aGF0IHRoZSBlcnJubyBzYXlzIC0gb2theSwgb2YgY291cnNlIHdlIGNhbiAoYW5kIHdlIERPKQo+
ID4gPiA+IHByb3ZpZGUgbGlidmlydCBzcGVjaWZpYyBzdHJpbmcsIGZ1cnRoZXIgc3BlY2lmeWlu
ZyB0aGUgZXJyb3IgYnV0IGxpa2UgSQo+ID4gPiA+IG1lbnRpb25lZCwgZGVwZW5kaW5nIG9uIGhv
dyBtYW55IGVycm9yIGNhc2VzIHdlIHdhbnQgdG8gZGlzdGluZ3Vpc2ggdGhpcyBtYXkgYmUKPiA+
ID4gPiBoYXJkIGZvciBhbnlvbmUgdG8gZmlndXJlIG91dCBzb2xlbHkgb24gdGhlIGVycm9yIGNv
ZGUsIGFzIGFwcHMgd2lsbCBtb3N0Cj4gPiA+ID4gcHJvYmFibHkgbm90IHBhcnNlIHRoZQo+ID4g
PiA+IGxvZ3MuCj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IEVyaWsKPiA+ID4gaGkg
RXJpawo+ID4gPiBkbyB5b3UgbWVhbiB5b3UgYXJlIGFncmVlaW5nIG9uIGRlZmluaW5nIGNvbW1v
biBlcnJvcnMgYW5kIG9ubHkgcmV0dXJuaW5nIGVycm5vPwo+ID4KPiA+IEluIGEgc2Vuc2UsIHll
cy4gV2hpbGUgaXQgaXMgaGlnaGx5IGRlc2lyYWJsZSB0byBoYXZlIGxvZ3Mgd2l0aCBkZXNjcmlw
dGl2ZQo+ID4gbWVzc2FnZXMgd2hpY2ggd2lsbCBoZWxwIGluIHRyb3VibGVzaG9vdGluZyB0cmVt
ZW5kb3VzbHksIEkgd2FudGVkIHRvIHBvaW50IG91dAo+ID4gdGhhdCBzcGVuZGluZyB0aW1lIHdp
dGggZXJyb3IgbG9ncyBtYXkgbm90IGJlIHRoYXQgd29ydGh3aGlsZSBlc3BlY2lhbGx5IHNpbmNl
Cj4gPiBtb3N0IGFwcHMgKGxpa2UgbGlidmlydCkgd2lsbCBzb2xlbHkgcmVseSBvbiB1c2luZyBy
ZWFkKDMpL3dyaXRlKDMpIHRvIHN5c2ZzLgo+ID4gVGhhdCBtZWFucyB0aGF0IHdlJ3JlIGxpbWl0
ZWQgYnkgdGhlIGVycm5vcyBhdmFpbGFibGUsIHNvIGFwYXJ0IGZyb20KPiA+IHJlcG9ydGluZyB0
aGUgZ2VuZXJpYyBzeXN0ZW0gbWVzc2FnZSB3ZSBjYW4ndCBhbnkgbW9yZSBtYWdpYyBpbiB0ZXJt
cyBvZiB0aGUKPiA+IGVycm9yIG1lc3NhZ2VzLCBzbyB0aGUgZHJpdmVyIG5lZWRzIHRvIGFzc3Vy
ZSB0aGF0IGEgcHJvcGVyIG1lc3NhZ2UgaXMKPiA+IHByb3BhZ2F0ZWQgdG8gdGhlIGpvdXJuYWwg
YW5kIGF0IGJlc3QgbGlidmlydCBjYW4gZGlyZWN0IHRoZSB1c2VyIChjb25zdW1lcikgdG8KPiA+
IGxvb2sgdGhyb3VnaCB0aGUgc3lzdGVtIGxvZ3MgZm9yIG1vcmUgaW5mby4gSSBhbHNvIGFncmVl
IHdpdGggdGhlIHBvaW50Cj4gPiBtZW50aW9uZWQgYWJvdmUgdGhhdCBkZWZpbmluZyBhIHNwZWNp
ZmljIGVycm5vIGlzIElNTyBub3QgdGhlIHdheSB0byBnbywgYXMKPiA+IHRoZXNlIHdvdWxkIGJl
IGp1c3QgdG9vIHNwZWNpZmljIGZvciB0aGUgcmVhZCgzKS93cml0ZSgzKSB1c2UgY2FzZS4KPiA+
Cj4gPiBUaGF0IHNhaWQsIGZyb20gbGlidmlydCBQT1YgYXMgYSBjb25zdW1lciwgSSdkIGV4cGVj
dCB0aGVyZSB0byBiZSB0cnVseSBvbmx5IDIKPiA+IGVycm9ycyAoSSBiZWxpZXZlIEFsZXggaGFz
IG1lbnRpb25lZCBzb21ldGhpbmcgc2ltaWxhciBpbiBvbmUgb2YgaGlzIHJlc3BvbnNlcwo+ID4g
aW4gb25lIG9mIHRoZSB0aHJlYWRzKToKPiA+ICAgICBhKSByZWFkIGVycm9yIGluZGljYXRpbmcg
dGhhdCBhbiBtZGV2IHR5cGUgZG9lc24ndCBzdXBwb3J0IG1pZ3JhdGlvbgo+ID4gICAgICAgICAt
IEkgYXNzdW1lIGlmIG9uZSB0eXBlIGRvZXNuJ3Qgc3VwcG9ydCBtaWdyYXRpb24sIG5vbmUgb2Yg
dGhlIG90aGVyCj4gPiAgICAgICAgICAgdHlwZXMgZXhwb3NlZCBvbiB0aGUgcGFyZW50IGRldmlj
ZSBkbywgaXMgdGhhdCBhIGZhaXIgYXNzdW1wdGlvbj8KPiA+ICAgICBiKSB3cml0ZSBlcnJvciBp
bmRpY2F0aW5nIHRoYXQgdGhlIG1kZXYgdHlwZXMgYXJlIGluY29tcGF0aWJsZSBmb3IKPiA+ICAg
ICBtaWdyYXRpb24KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gRXJpawo+IFRoYW5rcyBmb3IgdGhpcyBl
eHBsYW5hdGlvbi4KPiBzbywgY2FuIHdlIGFycml2ZSBhdCBiZWxvdyBhZ3JlZW1lbnRzPwo+Cj4g
MS4gIm5vdCB0byBkZWZpbmUgdGhlIHNwZWNpZmljIGVycm5vIHJldHVybmVkIGZvciBhIHNwZWNp
ZmljIHNpdHVhdGlvbiwKPiBsZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1c2Vyc3BhY2Ug
c2ltcGx5IG5lZWRzIHRvIGtub3cgdGhhdCBhbiBlcnJubyBvbgo+IHJlYWQgaW5kaWNhdGVzIHRo
ZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29uIGFu
ZAo+IHRoYXQgYW4gZXJybm8gb24gd3JpdGUgaW5kaWNhdGVzIHRoZSBkZXZpY2VzIGFyZSBpbmNv
bXBhdGlibGUgb3IgdGhlIHRhcmdldAo+IGRvZXNuJ3Qgc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lv
bnMuICIKPiAyLiB2ZW5kb3IgZHJpdmVyIHNob3VsZCBsb2cgZGV0YWlsZWQgZXJyb3IgcmVhc29u
cyBpbiBrZXJuZWwgbG9nLgoKVGhhdCB3b3VsZCBiZSBteSB0YWtlIG9uIHRoaXMsIHllcywgYnV0
IEkgb3BlbiB0byBoZWFyIGFueSBvdGhlciBzdWdnZXN0aW9ucyBhbmQKaWRlYXMgSSBjb3VsZG4n
dCB0aGluayBvZiBhcyB3ZWxsLgoKRXJpawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
