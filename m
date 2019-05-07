Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2515FC5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 May 2019 10:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4759389E33;
	Tue,  7 May 2019 08:51:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D45089E33
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  7 May 2019 08:51:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E04966993;
 Tue,  7 May 2019 08:51:41 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB47C171C5;
 Tue,  7 May 2019 08:51:28 +0000 (UTC)
Date: Tue, 7 May 2019 10:51:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 1/2] vfio/mdev: add version field as mandatory attribute
 for mdev device
Message-ID: <20190507105126.4be3a6da.cohuck@redhat.com>
In-Reply-To: <20190507053913.GA14284@joy-OptiPlex-7040>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190423115932.42619422.cohuck@redhat.com>
 <20190424031036.GB26247@joy-OptiPlex-7040>
 <20190424095624.0ce97328.cohuck@redhat.com>
 <20190424081558.GE26247@joy-OptiPlex-7040>
 <20190430172908.2ae77fa9.cohuck@redhat.com>
 <20190507053913.GA14284@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 07 May 2019 08:51:41 +0000 (UTC)
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
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCA3IE1heSAyMDE5IDAxOjM5OjEzIC0wNDAwCllhbiBaaGFvIDx5YW4ueS56aGFvQGlu
dGVsLmNvbT4gd3JvdGU6Cgo+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDExOjI5OjA4UE0gKzA4
MDAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cgo+ID4gSWYgSSBmb2xsb3dlZCB0aGUgZGlzY3Vzc2lv
biBjb3JyZWN0bHksIEkgdGhpbmsgeW91IHBsYW4gdG8gZHJvcCB0aGlzCj4gPiBmb3JtYXQsIGRv
bid0IHlvdT8gSSdkIGJlIGhhcHB5IGlmIGEgdmVuZG9yIGRyaXZlciBjYW4gdXNlIGEgc2ltcGxl
Cj4gPiBudW1iZXIgd2l0aG91dCBhbnkgcHJlZml4ZXMgaWYgaXQgc28gY2hvb3Nlcy4KPiA+IAo+
ID4gSSBhbHNvIGxpa2UgdGhlIGlkZWEgb2YgcmVuYW1pbmcgdGhpcyAibWlncmF0aW9uX3ZlcnNp
b24iIHNvIHRoYXQgaXQgaXMKPiA+IGNsZWFyIHdlJ3JlIGRlYWxpbmcgd2l0aCB2ZXJzaW9uaW5n
IG9mIHRoZSBtaWdyYXRpb24gY2FwYWJpbGl0eSAoYW5kCj4gPiBub3QgYSB2ZXJzaW9uIG9mIHRo
ZSBkZXZpY2Ugb3Igc28pLiAgCj4gaGkgQ29ybmVsaWEsCj4gc29ycnkgSSBqdXN0IHNhdyB0aGlz
IG1haWwgYWZ0ZXIgc2VuZGluZyB2MiBvZiB0aGlzIHBhdGNoIHNldC4uLgo+IHllcywgSSBkcm9w
cGVkIHRoZSBjb21tb24gcGFydCBhbmQgdmVuZG9yIGRyaXZlciBub3cgY2FuIGRlZmluZSB3aGF0
ZXZlciBpdAo+IHdpc2hlcyB0byBpZGVudGlmeSBhIGRldmljZSB2ZXJzaW9uLgoKT2ssIEknbGwg
bG9vayBhdCB2Mi4KCj4gSG93ZXZlciwgSSBkb24ndCBhZ3JlZSB0byByZW5hbWUgaXQgdG8gIm1p
Z3JhdGlvbl92ZXJzaW9uIiwgYXMgaXQgc3RpbGwgbWF5Cj4gYnJpbmcgc29tZSBraW5kIG9mIGNv
bmZ1c2luZyB3aXRoIHRoZSBtaWdyYXRpb24gdmVyc2lvbiBhIHZlbmRvciBkcml2ZXIgaXMKPiB1
c2luZywgZS5nLiB2ZW5kb3IgZHJpdmVyIGNoYW5nZXMgbWlncmF0aW9uIGNvZGUgYW5kIGluY3Jl
YXNlcyB0aGF0IG1pZ3JhdGlvbgo+IHZlcnNpb24uCj4gSW4gZmFjdCwgd2hhdCBpbmZvIHdlIHdh
bnQgdG8gZ2V0IGZyb20gdGhpcyBhdHRyaWJ1dGUgaXMgd2hldGhlciB0aGlzIG1kZXYKPiBkZXZp
Y2UgaXMgY29tcGF0aWJsZSB3aXRoIGFub3RoZXIgbWRldiBkZXZpY2UsIHdoaWNoIGlzIHRpZWQg
dG8gZGV2aWNlLCBhbmQgbm90Cj4gbmVjZXNzYXJpbHkgYm91bmQgdG8gbWlncmF0aW9uLgo+IAo+
IGRvIHlvdSB0aGluayBzbz8KCkknbSBub3QgMTAwJSBjb252aW5jZWQ7IGJ1dCB3ZSBjYW4gY29u
dGludWUgdGhlIGRpc2N1c3Npb24gb24gdjIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
