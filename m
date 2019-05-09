Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E6185AA
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 May 2019 09:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2700D8997E;
	Thu,  9 May 2019 07:01:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9B89916
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 07:01:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 00:01:10 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga001.fm.intel.com with ESMTP; 09 May 2019 00:01:05 -0700
Date: Thu, 9 May 2019 02:55:27 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Boris Fiuczynski <fiuczy@linux.ibm.com>
Subject: Re: [libvirt] [PATCH v2 1/2] vfio/mdev: add version attribute for
 mdev device
Message-ID: <20190509065527.GG24397@joy-OptiPlex-7040>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190508112740.GA24397@joy-OptiPlex-7040>
 <20190508152242.4b54a5e7@x1.home>
 <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
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
 Halil Pasic <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMTE6Mjc6NDdQTSArMDgwMCwgQm9yaXMgRml1Y3p5bnNr
aSB3cm90ZToKPiBPbiA1LzgvMTkgMTE6MjIgUE0sIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+
Pj4gSSB0aG91Z2h0IHRoZXJlIHdhcyBhIHJlcXVlc3QgdG8gbWFrZSB0aGlzIG1vcmUgc3BlY2lm
aWMgdG8gbWlncmF0aW9uCj4gPj4+IGJ5IHJlbmFtaW5nIGl0IHRvIHNvbWV0aGluZyBsaWtlIG1p
Z3JhdGlvbl92ZXJzaW9uLiAgQWxzbywgYXMgYW4KPiA+Pj4gICAKPiA+PiBzbyB0aGlzIGF0dHJp
YnV0ZSBtYXkgbm90IG9ubHkgaW5jbHVkZSBhIG1kZXYgZGV2aWNlJ3MgcGFyZW50IGRldmljZSBp
bmZvIGFuZAo+ID4+IG1kZXYgdHlwZSwgYnV0IGFsc28gaW5jbHVkZSBudW1lcmljIHNvZnR3YXJl
IHZlcnNpb24gb2YgdmVuZG9yIHNwZWNpZmljCj4gPj4gbWlncmF0aW9uIGNvZGUsIHJpZ2h0Pwo+
ID4gSXQncyBhIHZlbmRvciBkZWZpbmVkIHN0cmluZywgaXQgc2hvdWxkIGJlIGNvbnNpZGVyZWQg
b3BhcXVlIHRvIHRoZQo+ID4gdXNlciwgdGhlIHZlbmRvciBjYW4gaW5jbHVkZSB3aGF0ZXZlciB0
aGV5IGZlZWwgaXMgcmVsZXZhbnQuCj4gPiAKPiBXb3VsZCBhIHZlbmRvciBhbHNvIGJlIGFsbG93
ZWQgdG8gcHJvdmlkZSBhIHN0cmluZyBleHByZXNzaW5nIHJlcXVpcmVkIAo+IGZlYXR1cmVzIGFz
IHdlbGwgYXMgY29udGFpbmluZyBiYWNrZW5kIHJlc291cmNlIHJlcXVpcmVtZW50cyB3aGljaCBu
ZWVkIAo+IHRvIGJlIGNvbXBhdGlibGUgZm9yIGEgc3VjY2Vzc2Z1bCBtaWdyYXRpb24/IFNvbWVo
b3cgYSBiaXQgbGlrZSBhIGNwdSAKPiBtb2RlbC4uLiBtYXliZSBldmVuIGFzIGpzb24gb3IgeG1s
Li4uCj4gSSBhbSBhc2tpbmcgdGhpcyB3aXRoIHZmaW8tYXAgaW4gbWluZC4gSW4gdGhhdCBjb250
ZXh0IGNoZWNraW5nIAo+IGNvbXBhdGliaWxpdHkgb2YgdHdvIHZmaW8tYXAgbWRldiBkZXZpY2Vz
IGlzIG5vdCBhcyBzaW1wbGUgYXMgY2hlY2tpbmcgCj4gaWYgdmVyc2lvbiBBIGlzIHNtYWxsZXIg
b3IgZXF1YWwgdG8gdmVyc2lvbiBCLgo+CkkgdGhpbmsgc28uIHZlbmRvciBkcml2ZXIgaXMgYWxs
b3dlZCB0byBwdXQgd2hhdGV2ZXIgY29udGVudCBpbnRvIHRoZQptaWdyYXRpb25fdmVyc2lvbiBz
dHJpbmcgYXMgbG9uZyBhcyBpdCB0aGlua3MgaXQncyBuZWNlc3NhcnkuIAp2ZW5kb3IgZHJpdmVy
IG9ubHkgbmVlZHMgZW5zdXJlIGluIHRoZSB0YXJnZXQgbWRldiBkZXZpY2UsIHRoZSB3cml0ZSgy
KQpvcGVyYXRpb24gb24gaXRzIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0ZSB3b3VsZCBjb3Jy
ZWN0bHkgZmFpbCBvciBzdWNjZWVlZApiYXNlZCBvbiB0aGUgaW5wdXQgc3RyaW5nLgoKVGhhbmtz
Cllhbgo+IC0tIAo+IE1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4vS2luZCByZWdhcmRzCj4gICAg
IEJvcmlzIEZpdWN6eW5za2kKPiAKPiBJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9w
bWVudCBHbWJICj4gVm9yc2l0emVuZGVyIGRlcyBBdWZzaWNodHNyYXRzOiBNYXR0aGlhcyBIYXJ0
bWFubgo+IEdlc2Now6RmdHNmw7xocnVuZzogRGlyayBXaXR0a29wcAo+IFNpdHogZGVyIEdlc2Vs
bHNjaGFmdDogQsO2Ymxpbmdlbgo+IFJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQgU3R1dHRn
YXJ0LCBIUkIgMjQzMjk0Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg==
