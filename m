Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AF1CBE8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 17:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA286892D2;
	Tue, 14 May 2019 15:31:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5035892D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 15:31:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBF47307D962;
 Tue, 14 May 2019 15:31:47 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2F695C542;
 Tue, 14 May 2019 15:31:40 +0000 (UTC)
Date: Tue, 14 May 2019 09:31:40 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Boris Fiuczynski <fiuczy@linux.ibm.com>
Subject: Re: [libvirt] [PATCH v2 1/2] vfio/mdev: add version attribute for
 mdev device
Message-ID: <20190514093140.68cc6f7a@x1.home>
In-Reply-To: <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190508112740.GA24397@joy-OptiPlex-7040>
 <20190508152242.4b54a5e7@x1.home>
 <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 14 May 2019 15:31:48 +0000 (UTC)
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
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang, Zhi
 A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCA4IE1heSAyMDE5IDE3OjI3OjQ3ICswMjAwCkJvcmlzIEZpdWN6eW5za2kgPGZpdWN6
eUBsaW51eC5pYm0uY29tPiB3cm90ZToKCj4gT24gNS84LzE5IDExOjIyIFBNLCBBbGV4IFdpbGxp
YW1zb24gd3JvdGU6Cj4gPj4+IEkgdGhvdWdodCB0aGVyZSB3YXMgYSByZXF1ZXN0IHRvIG1ha2Ug
dGhpcyBtb3JlIHNwZWNpZmljIHRvIG1pZ3JhdGlvbgo+ID4+PiBieSByZW5hbWluZyBpdCB0byBz
b21ldGhpbmcgbGlrZSBtaWdyYXRpb25fdmVyc2lvbi4gIEFsc28sIGFzIGFuCj4gPj4+ICAgICAK
PiA+PiBzbyB0aGlzIGF0dHJpYnV0ZSBtYXkgbm90IG9ubHkgaW5jbHVkZSBhIG1kZXYgZGV2aWNl
J3MgcGFyZW50IGRldmljZSBpbmZvIGFuZAo+ID4+IG1kZXYgdHlwZSwgYnV0IGFsc28gaW5jbHVk
ZSBudW1lcmljIHNvZnR3YXJlIHZlcnNpb24gb2YgdmVuZG9yIHNwZWNpZmljCj4gPj4gbWlncmF0
aW9uIGNvZGUsIHJpZ2h0PyAgCj4gPiBJdCdzIGEgdmVuZG9yIGRlZmluZWQgc3RyaW5nLCBpdCBz
aG91bGQgYmUgY29uc2lkZXJlZCBvcGFxdWUgdG8gdGhlCj4gPiB1c2VyLCB0aGUgdmVuZG9yIGNh
biBpbmNsdWRlIHdoYXRldmVyIHRoZXkgZmVlbCBpcyByZWxldmFudC4KPiA+ICAgCj4gV291bGQg
YSB2ZW5kb3IgYWxzbyBiZSBhbGxvd2VkIHRvIHByb3ZpZGUgYSBzdHJpbmcgZXhwcmVzc2luZyBy
ZXF1aXJlZCAKPiBmZWF0dXJlcyBhcyB3ZWxsIGFzIGNvbnRhaW5pbmcgYmFja2VuZCByZXNvdXJj
ZSByZXF1aXJlbWVudHMgd2hpY2ggbmVlZCAKPiB0byBiZSBjb21wYXRpYmxlIGZvciBhIHN1Y2Nl
c3NmdWwgbWlncmF0aW9uPyBTb21laG93IGEgYml0IGxpa2UgYSBjcHUgCj4gbW9kZWwuLi4gbWF5
YmUgZXZlbiBhcyBqc29uIG9yIHhtbC4uLgo+IEkgYW0gYXNraW5nIHRoaXMgd2l0aCB2ZmlvLWFw
IGluIG1pbmQuIEluIHRoYXQgY29udGV4dCBjaGVja2luZyAKPiBjb21wYXRpYmlsaXR5IG9mIHR3
byB2ZmlvLWFwIG1kZXYgZGV2aWNlcyBpcyBub3QgYXMgc2ltcGxlIGFzIGNoZWNraW5nIAo+IGlm
IHZlcnNpb24gQSBpcyBzbWFsbGVyIG9yIGVxdWFsIHRvIHZlcnNpb24gQi4KClR3byBwaWVjZXMg
dG8gdGhpcywgdGhlIGZpcnN0IGlzIHRoYXQgdGhlIHN0cmluZyBpcyBvcGFxdWUgZXhhY3RseSBz
bwp0aGF0IHRoZSB2ZW5kb3IgZHJpdmVyIGNhbiBleHByZXNzIHdoYXRldmVyIHRoZXkgbmVlZCBp
biBpdC4gIFRoZSB1c2VyCnNob3VsZCBuZXZlciBpbmZlciB0aGF0IHR3byBkZXZpY2VzIGFyZSBj
b21wYXRpYmxlLiAgVGhlIHNlY29uZCBpcyB0aGF0CnRoaXMgaXMgbm90IGEgcmVzb3VyY2UgYXZh
aWxhYmlsaXR5IG9yIHJlc2VydmF0aW9uIGludGVyZmFjZS4gIFRoZSBmYWN0CnRoYXQgYSB0YXJn
ZXQgZGV2aWNlIHdvdWxkIGJlIGNvbXBhdGlibGUgZm9yIG1pZ3JhdGlvbiBzaG91bGQgbm90IHRh
a2UKaW50byBhY2NvdW50IHdoZXRoZXIgdGhlIHRhcmdldCBoYXMgdGhlIHJlc291cmNlcyB0byBh
Y3R1YWxseSBjcmVhdGUKc3VjaCBhIGRldmljZS4gIERvaW5nIHNvIHdvdWxkIGltcGx5IHNvbWUg
c29ydCBvZiByZXNvdXJjZSByZXNlcnZhdGlvbgpzdXBwb3J0IHRoYXQgZG9lcyBub3QgZXhpc3Qu
ICBNYXRyaXggZGV2aWNlcyBhcmUgY2xlYXJseSBhIGJpdApjb21wbGljYXRlZCBoZXJlIHNpbmNl
IG1heWJlIHRoZSBzb3VyY2UgaXMgZXhwcmVzc2luZyBhIGNvbXBvbmVudCBvZgp0aGUgZGV2aWNl
IHRoYXQgZG9lc24ndCBleGlzdCBvbiB0aGUgdGFyZ2V0LiAgSW4gc3VjaCBhICJyZXNvdXJjZSBu
b3QKYXZhaWxhYmxlIGF0IGFsbCIgY2FzZSwgaXQgbWlnaHQgYmUgZmFpciB0byBuYWsgdGhlIGNv
bXBhdGliaWxpdHkgdGVzdCwKYnV0IGEgIm9rLCBidXQgcmVzb3VyY2Ugbm90IGN1cnJlbnRseSBh
dmFpbGFibGUiIGNhc2Ugc2hvdWxkIHBhc3MsCmltby4gIFRoYW5rcywKCkFsZXgKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
