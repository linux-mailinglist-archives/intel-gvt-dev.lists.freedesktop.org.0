Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F22D2CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 May 2019 02:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E6189FFD;
	Wed, 29 May 2019 00:22:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DF989FFD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 May 2019 00:22:15 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 17:22:14 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2019 17:22:09 -0700
Date: Tue, 28 May 2019 20:16:25 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio/mdev: add migration_version attribute for
 mdev device
Message-ID: <20190529001625.GG27438@joy-OptiPlex-7040>
References: <20190527034155.31473-1-yan.y.zhao@intel.com>
 <20190527034342.31523-1-yan.y.zhao@intel.com>
 <20190528105332.7c5a2f82.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528105332.7c5a2f82.cohuck@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6NTM6MzJQTSArMDgwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBTdW4sIDI2IE1heSAyMDE5IDIzOjQzOjQyIC0wNDAwCj4gWWFuIFpoYW8gPHlh
bi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJp
YnV0ZSBpcyB1c2VkIHRvIGNoZWNrIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5Cj4gPiBiZXR3ZWVu
IHR3byBtZGV2IGRldmljZSBvZiB0aGUgc2FtZSBtZGV2IHR5cGUuCj4gCj4gcy9kZXZpY2UvZGV2
aWNlcy8KPgp5ZXMuLi4gc29ycnkgYW5kIHRoYW5rcyA6KQoKPiA+IFRoZSBrZXkgaXMgdGhhdCBp
dCdzIHJ3IGFuZCBpdHMgZGF0YSBpcyBvcGFxdWUgdG8gdXNlcnNwYWNlLgo+ID4gCj4gPiBVc2Vy
c3BhY2UgcmVhZHMgbWlncmF0aW9uX3ZlcnNpb24gb2YgbWRldiBkZXZpY2UgYXQgc291cmNlIHNp
ZGUgYW5kCj4gPiB3cml0ZXMgdGhlIHZhbHVlIHRvIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0
ZSBvZiBtZGV2IGRldmljZSBhdCB0YXJnZXQKPiA+IHNpZGUuIEl0IGp1ZGdlcyBtaWdyYXRpb24g
Y29tcGF0aWJpbGl0eSBhY2NvcmRpbmcgdG8gd2hldGhlciB0aGUgcmVhZAo+ID4gYW5kIHdyaXRl
IG9wZXJhdGlvbnMgc3VjY2VlZCBvciBmYWlsLgo+ID4gCj4gPiBBcyB0aGlzIGF0dHJpYnV0ZSBp
cyB1bmRlciBtZGV2X3R5cGUgbm9kZSwgdXNlcnNwYWNlIGlzIGFibGUgdG8ga25vdwo+ID4gd2hl
dGhlciB0d28gbWRldiBkZXZpY2VzIGFyZSBjb21wYXRpYmxlIGJlZm9yZSBhIG1kZXYgZGV2aWNl
IGlzIGNyZWF0ZWQuCj4gPiAKPiA+IHVzZXJzcGFjZSBuZWVkcyB0byBjaGVjayB3aGV0aGVyIHRo
ZSB0d28gbWRldiBkZXZpY2VzIGFyZSBvZiB0aGUgc2FtZQo+ID4gbWRldiB0eXBlIGJlZm9yZSBj
aGVja2luZyB0aGUgbWlncmF0aW9uX3ZlcnNpb24gYXR0cmlidXRlLiBJdCBhbHNvIG5lZWRzCj4g
PiB0byBjaGVjayBkZXZpY2UgY3JlYXRpb24gcGFyYW1ldGVycyBpZiBhZ2dyZWdhdGlvbiBpcyBz
dXBwb3J0ZWQgaW4KPiA+IGZ1dHVyZS4KPiA+IAo+ID4gICAgICAgICAgICAgIF9fICAgIHVzZXJz
cGFjZQo+ID4gICAgICAgICAgICAgICAvXCAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAg
IC8gICAgICAgICAgICAgICAgIFx3cml0ZQo+ID4gICAgICAgICAgICAgLyByZWFkICAgICAgICAg
ICAgICBcCj4gPiAgICBfX19fX19fXy9fX19fX19fX19fICAgICAgIF9fX1x8L19fX19fX19fX19f
X18KPiA+ICAgfCBtaWdyYXRpb25fdmVyc2lvbiB8ICAgICB8IG1pZ3JhdGlvbl92ZXJzaW9uIHwt
LT5jaGVjayBtaWdyYXRpb24KPiA+ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0gICBjb21wYXRpYmlsaXR5Cj4gPiAgICAgbWRldiBkZXZpY2UgQSAgICAg
ICAgICAgICAgIG1kZXYgZGV2aWNlIEIKPiA+IAo+ID4gQ2M6IEFsZXggV2lsbGlhbXNvbiA8YWxl
eC53aWxsaWFtc29uQHJlZGhhdC5jb20+Cj4gPiBDYzogRXJpayBTa3VsdGV0eSA8ZXNrdWx0ZXRA
cmVkaGF0LmNvbT4KPiA+IENjOiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJl
ZGhhdC5jb20+Cj4gPiBDYzogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cj4gPiBD
YzogIlRpYW4sIEtldmluIiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gPiBDYzogWmhlbnl1IFdh
bmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6ICJXYW5nLCBaaGkgQSIgPHpoaS5h
LndhbmdAaW50ZWwuY29tPgo+ID4gQ2M6IE5lbyBKaWEgPGNqaWFAbnZpZGlhLmNvbT4KPiA+IENj
OiBLaXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52aWRpYS5jb20+Cj4gPiBDYzogRGFuaWVsIFAu
IEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KPiA+IENjOiBDaHJpc3RvcGhlIGRlIERp
bmVjaGluIDxkaW5lY2hpbkByZWRoYXQuY29tPgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW4g
WmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+Cj4gPiAKPiA+IC0tLQo+ID4gdjM6Cj4gPiAxLiBy
ZW5hbWVkIHZlcnNpb24gdG8gbWlncmF0aW9uX3ZlcnNpb24KPiA+IChDaHJpc3RvcGhlIGRlIERp
bmVjaGluLCBDb3JuZWxpYSBIdWNrLCBBbGV4IFdpbGxpYW1zb24pCj4gPiAyLiBsZXQgZXJybm8g
dG8gYmUgZnJlZWx5IGRlZmluZWQgYnkgdmVuZG9yIGRyaXZlcgo+ID4gKEFsZXggV2lsbGlhbXNv
biwgRXJpayBTa3VsdGV0eSwgQ29ybmVsaWEgSHVjaywgRHIuIERhdmlkIEFsYW4gR2lsYmVydCkK
PiA+IDMuIGxldCBjaGVja2luZyBtZGV2X3R5cGUgYmUgcHJlcmVxdWlzaXRlIG9mIG1pZ3JhdGlv
biBjb21wYXRpYmlsaXR5Cj4gPiBjaGVjay4gKEFsZXggV2lsbGlhbXNvbikKPiA+IDQuIHJld29y
ZGVkIGV4YW1wbGUgdXNhZ2Ugc2VjdGlvbi4KPiA+IChtb3N0IG9mIHRoaXMgc2VjdGlvbiBjYW1l
IGZyb20gQWxleCBXaWxsaWFtc29uKQo+ID4gNS4gcmV3b3JkZWQgYXR0cmlidXRlIGludGVudGlv
biBzZWN0aW9uIChDb3JuZWxpYSBIdWNrKQo+ID4gCj4gPiB2MjoKPiA+IDEuIGFkZGVkIGRldGFp
bGVkIGludGVudCBhbmQgdXNhZ2UKPiA+IDIuIG1hZGUgZGVmaW5pdGlvbiBvZiB2ZXJzaW9uIHN0
cmluZyBjb21wbGV0ZWx5IHByaXZhdGUgdG8gdmVuZG9yIGRyaXZlcgo+ID4gICAgKEFsZXggV2ls
bGlhbXNvbikKPiA+IDMuIGFiYW5kb25lZCBjaGFuZ2VzIHRvIHNhbXBsZSBtZGV2IGRyaXZlcnMg
KEFsZXggV2lsbGlhbXNvbikKPiA+IDQuIG1hbmRhdG9yeSAtLT4gb3B0aW9uYWwgKENvcm5lbGlh
IEh1Y2spCj4gPiA1LiBhZGRlZCBkZXNjcmlwdGlvbiBmb3IgZXJybm8gKENvcm5lbGlhIEh1Y2sp
Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnR4dCB8IDEx
MyArKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExMyBpbnNl
cnRpb25zKCspCj4gPiAKPiAKPiBXaGlsZSBJIHByb2JhYmx5IHdvdWxkIGhhdmUgd3JpdHRlbiBh
IG1vcmUgY29tcGFjdCBkZXNjcmlwdGlvbiwgeW91cgo+IHZlcnNpb24gaXMgZmluZSB3aXRoIG1l
IGFzIHdlbGwuCj4gCj4gUmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQu
Y29tPgpUaGFuayB5b3UgQ29ybmVsaWEhCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKPiBpbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
