Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D12DF4B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 May 2019 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212136E32B;
	Wed, 29 May 2019 14:09:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058C16E32B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 May 2019 14:08:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C629130044C9;
 Wed, 29 May 2019 14:08:47 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B9C560FAF;
 Wed, 29 May 2019 14:08:36 +0000 (UTC)
Date: Wed, 29 May 2019 08:08:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Boris Fiuczynski <fiuczy@linux.ibm.com>
Subject: Re: [libvirt] [PATCH v2 1/2] vfio/mdev: add version attribute for
 mdev device
Message-ID: <20190529080836.007b8755@x1.home>
In-Reply-To: <0c1f5f03-1895-b9a2-999f-f611dd295732@linux.ibm.com>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190508112740.GA24397@joy-OptiPlex-7040>
 <20190508152242.4b54a5e7@x1.home>
 <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
 <20190514093140.68cc6f7a@x1.home>
 <0c1f5f03-1895-b9a2-999f-f611dd295732@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 29 May 2019 14:08:58 +0000 (UTC)
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
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang, Zhi
 A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyOCBNYXkgMjAxOSAyMjo1NzoxNSArMDIwMApCb3JpcyBGaXVjenluc2tpIDxmaXVj
enlAbGludXguaWJtLmNvbT4gd3JvdGU6Cgo+IE9uIDUvMTQvMTkgNTozMSBQTSwgQWxleCBXaWxs
aWFtc29uIHdyb3RlOgo+ID4gT24gV2VkLCA4IE1heSAyMDE5IDE3OjI3OjQ3ICswMjAwCj4gPiBC
b3JpcyBGaXVjenluc2tpIDxmaXVjenlAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiAgIAo+ID4+
IE9uIDUvOC8xOSAxMToyMiBQTSwgQWxleCBXaWxsaWFtc29uIHdyb3RlOiAgCj4gPj4+Pj4gSSB0
aG91Z2h0IHRoZXJlIHdhcyBhIHJlcXVlc3QgdG8gbWFrZSB0aGlzIG1vcmUgc3BlY2lmaWMgdG8g
bWlncmF0aW9uCj4gPj4+Pj4gYnkgcmVuYW1pbmcgaXQgdG8gc29tZXRoaW5nIGxpa2UgbWlncmF0
aW9uX3ZlcnNpb24uICBBbHNvLCBhcyBhbgo+ID4+Pj4+ICAgICAgICAKPiA+Pj4+IHNvIHRoaXMg
YXR0cmlidXRlIG1heSBub3Qgb25seSBpbmNsdWRlIGEgbWRldiBkZXZpY2UncyBwYXJlbnQgZGV2
aWNlIGluZm8gYW5kCj4gPj4+PiBtZGV2IHR5cGUsIGJ1dCBhbHNvIGluY2x1ZGUgbnVtZXJpYyBz
b2Z0d2FyZSB2ZXJzaW9uIG9mIHZlbmRvciBzcGVjaWZpYwo+ID4+Pj4gbWlncmF0aW9uIGNvZGUs
IHJpZ2h0PyAgCj4gPj4+IEl0J3MgYSB2ZW5kb3IgZGVmaW5lZCBzdHJpbmcsIGl0IHNob3VsZCBi
ZSBjb25zaWRlcmVkIG9wYXF1ZSB0byB0aGUKPiA+Pj4gdXNlciwgdGhlIHZlbmRvciBjYW4gaW5j
bHVkZSB3aGF0ZXZlciB0aGV5IGZlZWwgaXMgcmVsZXZhbnQuCj4gPj4+ICAgICAgCj4gPj4gV291
bGQgYSB2ZW5kb3IgYWxzbyBiZSBhbGxvd2VkIHRvIHByb3ZpZGUgYSBzdHJpbmcgZXhwcmVzc2lu
ZyByZXF1aXJlZAo+ID4+IGZlYXR1cmVzIGFzIHdlbGwgYXMgY29udGFpbmluZyBiYWNrZW5kIHJl
c291cmNlIHJlcXVpcmVtZW50cyB3aGljaCBuZWVkCj4gPj4gdG8gYmUgY29tcGF0aWJsZSBmb3Ig
YSBzdWNjZXNzZnVsIG1pZ3JhdGlvbj8gU29tZWhvdyBhIGJpdCBsaWtlIGEgY3B1Cj4gPj4gbW9k
ZWwuLi4gbWF5YmUgZXZlbiBhcyBqc29uIG9yIHhtbC4uLgo+ID4+IEkgYW0gYXNraW5nIHRoaXMg
d2l0aCB2ZmlvLWFwIGluIG1pbmQuIEluIHRoYXQgY29udGV4dCBjaGVja2luZwo+ID4+IGNvbXBh
dGliaWxpdHkgb2YgdHdvIHZmaW8tYXAgbWRldiBkZXZpY2VzIGlzIG5vdCBhcyBzaW1wbGUgYXMg
Y2hlY2tpbmcKPiA+PiBpZiB2ZXJzaW9uIEEgaXMgc21hbGxlciBvciBlcXVhbCB0byB2ZXJzaW9u
IEIuICAKPiA+IAo+ID4gVHdvIHBpZWNlcyB0byB0aGlzLCB0aGUgZmlyc3QgaXMgdGhhdCB0aGUg
c3RyaW5nIGlzIG9wYXF1ZSBleGFjdGx5IHNvCj4gPiB0aGF0IHRoZSB2ZW5kb3IgZHJpdmVyIGNh
biBleHByZXNzIHdoYXRldmVyIHRoZXkgbmVlZCBpbiBpdC4gIFRoZSB1c2VyCj4gPiBzaG91bGQg
bmV2ZXIgaW5mZXIgdGhhdCB0d28gZGV2aWNlcyBhcmUgY29tcGF0aWJsZS4gIFRoZSBzZWNvbmQg
aXMgdGhhdCAgCj4gSSBhZ3JlZS4KPiAKPiA+IHRoaXMgaXMgbm90IGEgcmVzb3VyY2UgYXZhaWxh
YmlsaXR5IG9yIHJlc2VydmF0aW9uIGludGVyZmFjZS4gIFRoZSBmYWN0ICAKPiBJIGFsc28gYWdy
ZWUuIFRoZSBtaWdyYXRpb25fdmVyc2lvbiAodmVyc2lvbiBpbiB0aGlzIGNhc2UgaXMgbm90IHJl
YWxseSAKPiBhIGdvb2QgZml0KSBpcyBhIHN1bW1hcnkgb2YgcmVxdWlyZW1lbnRzIHRoZSBzb3Vy
Y2UgbWRldiBoYXMgd2hpY2ggYSAKPiB0YXJnZXQgbWRldiBuZWVkcyB0byBiZSBhYmxlIHRvIGZ1
bGZpbGwgaW4gb3JkZXIgdG8gYWxsb3cgbWlncmF0aW9uLgo+IFRoZSB0YXJnZXQgbWRldiBhbHJl
YWR5IGV4aXN0cyBhbmQgd2FzIGFscmVhZHkgY29uZmlndXJlZCBieSBvdGhlciBtZWFucyAKPiBu
b3QgaW52b2x2ZWQgaW4gdGhlIG1pZ3JhdGlvbiBjaGVjayBwcm9jZXNzLgoKSnVzdCBhIG5pdCBo
ZXJlIChJIGhvcGUpLCB0aGUgdGFyZ2V0IG1kZXYgZG9lcyBub3QgbmVjZXNzYXJpbHkgZXhpc3Qg
YXQKdGhlIHRpbWUgd2UncmUgdGVzdGluZyBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXRpYmlsaXR5
LiAgVGhlIGludGVudGlvbgppcyB0aGF0IHRoaXMgZmVhdHVyZSBjYW4gYmUgdXNlZCB0byBzZWxl
Y3QgYSB0YXJnZXQgaG9zdCBzeXN0ZW0gd2hpY2gKY2FuIHBvc3NpYmx5IGdlbmVyYXRlIGEgY29t
cGF0aWJsZSB0YXJnZXQgbWRldiBkZXZpY2UgYmVmb3JlIGNvbW1pdHRpbmcKdG8gY3JlYXRlIHRo
YXQgZGV2aWNlLiAgRm9yIGluc3RhbmNlIGEgbWFuYWdlbWVudCB0b29sIG1pZ2h0IHRlc3QgZm9y
Cm1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5IGFjcm9zcyBhIGRhdGEgY2VudGVyLCBuYXJyb3dpbmcg
dGhlIHNldCBvZgpwb3RlbnRpYWwgdGFyZ2V0IGhvc3RzLCB0aGVuIHByb2NlZWQgdG8gc2VsZWN0
IGEgYmVzdCBjaG9pY2UgYmFzZWQgb24KZmFjdG9ycyBpbmNsdWRpbmcgdGhlIGFiaWxpdHkgdG8g
YWN0dWFsbHkgaW5zdGFudGlhdGUgc3VjaCBhIGRldmljZSBvbgp0aGUgaG9zdC4KCj4gVXNpbmcg
dGhlIG1pZ3JhdGlvbnNfdmVyc2lvbiBhcyBzb21lIGtpbmQgb2YgY29uZmlndXJhdGlvbiB0cmFu
c3BvcnQgCj4gYW5kL29yIHJlc2VydmF0aW9uIG1lY2hhbmlzbSB3YXNuJ3QgbXkgaW50ZW50aW9u
IGFuZCBJTUhPIHdvdWxkIGJvdGggYmUgCj4gd3JvbmcuCgpTb3VuZHMgZ29vZC4gIFRoYW5rcywK
CkFsZXgKCj4gPiB0aGF0IGEgdGFyZ2V0IGRldmljZSB3b3VsZCBiZSBjb21wYXRpYmxlIGZvciBt
aWdyYXRpb24gc2hvdWxkIG5vdCB0YWtlCj4gPiBpbnRvIGFjY291bnQgd2hldGhlciB0aGUgdGFy
Z2V0IGhhcyB0aGUgcmVzb3VyY2VzIHRvIGFjdHVhbGx5IGNyZWF0ZQo+ID4gc3VjaCBhIGRldmlj
ZS4gIERvaW5nIHNvIHdvdWxkIGltcGx5IHNvbWUgc29ydCBvZiByZXNvdXJjZSByZXNlcnZhdGlv
bgo+ID4gc3VwcG9ydCB0aGF0IGRvZXMgbm90IGV4aXN0LiAgTWF0cml4IGRldmljZXMgYXJlIGNs
ZWFybHkgYSBiaXQKPiA+IGNvbXBsaWNhdGVkIGhlcmUgc2luY2UgbWF5YmUgdGhlIHNvdXJjZSBp
cyBleHByZXNzaW5nIGEgY29tcG9uZW50IG9mCj4gPiB0aGUgZGV2aWNlIHRoYXQgZG9lc24ndCBl
eGlzdCBvbiB0aGUgdGFyZ2V0LiAgSW4gc3VjaCBhICJyZXNvdXJjZSBub3QKPiA+IGF2YWlsYWJs
ZSBhdCBhbGwiIGNhc2UsIGl0IG1pZ2h0IGJlIGZhaXIgdG8gbmFrIHRoZSBjb21wYXRpYmlsaXR5
IHRlc3QsCj4gPiBidXQgYSAib2ssIGJ1dCByZXNvdXJjZSBub3QgY3VycmVudGx5IGF2YWlsYWJs
ZSIgY2FzZSBzaG91bGQgcGFzcywKPiA+IGltby4gIFRoYW5rcywKPiA+IAo+ID4gQWxleAo+ID4g
Cj4gPiAtLQo+ID4gbGlidmlyLWxpc3QgbWFpbGluZyBsaXN0Cj4gPiBsaWJ2aXItbGlzdEByZWRo
YXQuY29tCj4gPiBodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlidmly
LWxpc3QKPiA+ICAgCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
