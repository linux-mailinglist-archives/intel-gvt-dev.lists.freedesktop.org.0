Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D21C7D0
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 13:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78E5892B6;
	Tue, 14 May 2019 11:30:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D0F892B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 11:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C265A3082E5A;
 Tue, 14 May 2019 11:30:22 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04D9760BCF;
 Tue, 14 May 2019 11:30:09 +0000 (UTC)
Date: Tue, 14 May 2019 13:30:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514133007.5e1c6c2e.cohuck@redhat.com>
In-Reply-To: <20190514110143.GD2753@work-vm>
References: <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
 <20190513132804.GD11139@beluga.usersys.redhat.com>
 <20190514061235.GC20407@joy-OptiPlex-7040>
 <20190514072039.GA2089@beluga.usersys.redhat.com>
 <20190514073219.GD20407@joy-OptiPlex-7040>
 <20190514074344.GB2089@beluga.usersys.redhat.com>
 <20190514074736.GE20407@joy-OptiPlex-7040>
 <20190514115135.078bbaf7.cohuck@redhat.com>
 <20190514110143.GD2753@work-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 14 May 2019 11:30:23 +0000 (UTC)
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
 L" <yi.l.liu@intel.com>, Erik Skultety <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang, Zhi
 A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxNCBNYXkgMjAxOSAxMjowMTo0NSArMDEwMAoiRHIuIERhdmlkIEFsYW4gR2lsYmVy
dCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiAqIENvcm5lbGlhIEh1Y2sgKGNvaHVj
a0ByZWRoYXQuY29tKSB3cm90ZToKPiA+IE9uIFR1ZSwgMTQgTWF5IDIwMTkgMDM6NDc6MzYgLTA0
MDAKPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cgo+ID4gPiBoaSBD
b3JuZWxpYSBhbmQgRGF2ZSwKPiA+ID4gZG8geW91IGFsc28gYWdyZWUgb246Cj4gPiA+IDEuICJu
b3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBlcnJubyByZXR1cm5lZCBmb3IgYSBzcGVjaWZpYyBz
aXR1YXRpb24sCj4gPiA+IGxldCB0aGUgdmVuZG9yIGRyaXZlciBkZWNpZGUsIHVzZXJzcGFjZSBz
aW1wbHkgbmVlZHMgdG8ga25vdyB0aGF0IGFuIGVycm5vIG9uCj4gPiA+IHJlYWQgaW5kaWNhdGVz
IHRoZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29u
IGFuZAo+ID4gPiB0aGF0IGFuIGVycm5vIG9uIHdyaXRlIGluZGljYXRlcyB0aGUgZGV2aWNlcyBh
cmUgaW5jb21wYXRpYmxlIG9yIHRoZSB0YXJnZXQKPiA+ID4gZG9lc24ndCBzdXBwb3J0IG1pZ3Jh
dGlvbiB2ZXJzaW9ucy4gIgo+ID4gPiAyLiB2ZW5kb3IgZHJpdmVyIHNob3VsZCBsb2cgZGV0YWls
ZWQgZXJyb3IgcmVhc29ucyBpbiBrZXJuZWwgbG9nLiAgCj4gPiAKPiA+IFR3byBxdWVzdGlvbnM6
Cj4gPiAtIEhvdyByZWFzb25hYmxlIGlzIGl0IHRvIHJlZmVyIHRvIHRoZSBzeXN0ZW0gbG9nIGlu
IG9yZGVyIHRvIGZpbmQgb3V0Cj4gPiAgIHdoYXQgZXhhY3RseSB3ZW50IHdyb25nPwo+ID4gLSBJ
ZiBkZXRhaWxlZCBlcnJvciByZXBvcnRpbmcgaXMgYmFzaWNhbGx5IGRvbmUgdG8gdGhlIHN5c2xv
ZywgZG8KPiA+ICAgZGlmZmVyZW50IGVycm9yIGNvZGVzIHN0aWxsIHByb3ZpZGUgdXNlZnVsIGlu
Zm9ybWF0aW9uPyBPciBzaG91bGQgdGhlCj4gPiAgIHZlbmRvciBkcml2ZXIgZGVjaWRlIHdoYXQg
aXQgd2FudHMgdG8gZG8/ICAKPiAKPiBJIGRvbid0IHNlZSBlcnJvciBjb2RlcyBhcyBiZWluZyB0
aGF0IGhlbHBmdWw7IGlmIHdlIGNhbid0IGFjdHVhbGx5IGdldAo+IGFuIGVycm9yIG1lc3NhZ2Ug
YmFjayB1cCB0aGUgc3RhY2sgKHdoaWNoIHdhcyBteSBwcmVmZXJlbmNlKSwgdGhlbiBJIGd1ZXNz
Cj4gc3lzbG9nIGlzIGFzIGdvb2QgYXMgaXQgd2lsbCBnZXQuCgpPaywgc28gbGV0dGluZyB0aGUg
dmVuZG9yIGRyaXZlciBzaW1wbHkgcmV0dXJuIGFuKHkpIGVycm9yIGFuZCBwb3NzaWJseQpkdW1w
aW5nIGFuIGVycm9yIG1lc3NhZ2UgaW50byB0aGUgc3lzbG9nIHNlZW1zIHRvIGJlIHRoZSBtb3N0
CnJlYXNvbmFibGUgYXBwcm9hY2guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
