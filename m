Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683D1C66C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 11:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55168926A;
	Tue, 14 May 2019 09:52:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881028926A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 09:52:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94115308620F;
 Tue, 14 May 2019 09:52:02 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 042155C207;
 Tue, 14 May 2019 09:51:37 +0000 (UTC)
Date: Tue, 14 May 2019 11:51:35 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514115135.078bbaf7.cohuck@redhat.com>
In-Reply-To: <20190514074736.GE20407@joy-OptiPlex-7040>
References: <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
 <20190513132804.GD11139@beluga.usersys.redhat.com>
 <20190514061235.GC20407@joy-OptiPlex-7040>
 <20190514072039.GA2089@beluga.usersys.redhat.com>
 <20190514073219.GD20407@joy-OptiPlex-7040>
 <20190514074344.GB2089@beluga.usersys.redhat.com>
 <20190514074736.GE20407@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 14 May 2019 09:52:03 +0000 (UTC)
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
 Erik Skultety <eskultet@redhat.com>, "Yang, Ziye" <ziye.yang@intel.com>,
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang, Zhi
 A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxNCBNYXkgMjAxOSAwMzo0NzozNiAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAwMzo0Mzo0NFBNICsw
ODAwLCBFcmlrIFNrdWx0ZXR5IHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6
MzI6MTlBTSAtMDQwMCwgWWFuIFpoYW8gd3JvdGU6ICAKPiA+ID4gT24gVHVlLCBNYXkgMTQsIDIw
MTkgYXQgMDM6MjA6NDBQTSArMDgwMCwgRXJpayBTa3VsdGV0eSB3cm90ZTogIAoKPiA+ID4gPiBU
aGF0IHNhaWQsIGZyb20gbGlidmlydCBQT1YgYXMgYSBjb25zdW1lciwgSSdkIGV4cGVjdCB0aGVy
ZSB0byBiZSB0cnVseSBvbmx5IDIKPiA+ID4gPiBlcnJvcnMgKEkgYmVsaWV2ZSBBbGV4IGhhcyBt
ZW50aW9uZWQgc29tZXRoaW5nIHNpbWlsYXIgaW4gb25lIG9mIGhpcyByZXNwb25zZXMKPiA+ID4g
PiBpbiBvbmUgb2YgdGhlIHRocmVhZHMpOgo+ID4gPiA+ICAgICBhKSByZWFkIGVycm9yIGluZGlj
YXRpbmcgdGhhdCBhbiBtZGV2IHR5cGUgZG9lc24ndCBzdXBwb3J0IG1pZ3JhdGlvbgo+ID4gPiA+
ICAgICAgICAgLSBJIGFzc3VtZSBpZiBvbmUgdHlwZSBkb2Vzbid0IHN1cHBvcnQgbWlncmF0aW9u
LCBub25lIG9mIHRoZSBvdGhlcgo+ID4gPiA+ICAgICAgICAgICB0eXBlcyBleHBvc2VkIG9uIHRo
ZSBwYXJlbnQgZGV2aWNlIGRvLCBpcyB0aGF0IGEgZmFpciBhc3N1bXB0aW9uPwoKUHJvYmFibHk7
IGJ1dCB0aGVyZSBtaWdodCBiZSBjYXNlcyB3aGVyZSB0aGUgbWlncmF0YWJpbGl0eSBkZXBlbmRz
IG5vdApvbiB0aGUgZGV2aWNlIHR5cGUsIGJ1dCBob3cgdGhlIHBhcnRpdGlvbmluZyBoYXMgYmVl
biBkb25lLi4uIG9yIGlzCnRoYXQgdG9vIGNvbnRyaXZlZD8KCj4gPiA+ID4gICAgIGIpIHdyaXRl
IGVycm9yIGluZGljYXRpbmcgdGhhdCB0aGUgbWRldiB0eXBlcyBhcmUgaW5jb21wYXRpYmxlIGZv
cgo+ID4gPiA+ICAgICBtaWdyYXRpb24KPiA+ID4gPgo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4g
RXJpayAgCj4gPiA+IFRoYW5rcyBmb3IgdGhpcyBleHBsYW5hdGlvbi4KPiA+ID4gc28sIGNhbiB3
ZSBhcnJpdmUgYXQgYmVsb3cgYWdyZWVtZW50cz8KPiA+ID4KPiA+ID4gMS4gIm5vdCB0byBkZWZp
bmUgdGhlIHNwZWNpZmljIGVycm5vIHJldHVybmVkIGZvciBhIHNwZWNpZmljIHNpdHVhdGlvbiwK
PiA+ID4gbGV0IHRoZSB2ZW5kb3IgZHJpdmVyIGRlY2lkZSwgdXNlcnNwYWNlIHNpbXBseSBuZWVk
cyB0byBrbm93IHRoYXQgYW4gZXJybm8gb24KPiA+ID4gcmVhZCBpbmRpY2F0ZXMgdGhlIGRldmlj
ZSBkb2VzIG5vdCBzdXBwb3J0IG1pZ3JhdGlvbiB2ZXJzaW9uIGNvbXBhcmlzb24gYW5kCj4gPiA+
IHRoYXQgYW4gZXJybm8gb24gd3JpdGUgaW5kaWNhdGVzIHRoZSBkZXZpY2VzIGFyZSBpbmNvbXBh
dGlibGUgb3IgdGhlIHRhcmdldAo+ID4gPiBkb2Vzbid0IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNp
b25zLiAiCj4gPiA+IDIuIHZlbmRvciBkcml2ZXIgc2hvdWxkIGxvZyBkZXRhaWxlZCBlcnJvciBy
ZWFzb25zIGluIGtlcm5lbCBsb2cuICAKPiA+IAo+ID4gVGhhdCB3b3VsZCBiZSBteSB0YWtlIG9u
IHRoaXMsIHllcywgYnV0IEkgb3BlbiB0byBoZWFyIGFueSBvdGhlciBzdWdnZXN0aW9ucyBhbmQK
PiA+IGlkZWFzIEkgY291bGRuJ3QgdGhpbmsgb2YgYXMgd2VsbC4KClNvLCByZWFkIHRvIGZpbmQg
b3V0IHdoZXRoZXIgbWlncmF0aW9uIGlzIHN1cHBvcnRlZCBhdCBhbGwsIHdyaXRlIHRvCmZpbmQg
b3V0IHdoZXRoZXIgaXQgaXMgc3VwcG9ydGVkIGZvciB0aGF0IGNvbmNyZXRlIHBhaXJpbmcgaXMK
cmVhc29uYWJsZSBmb3IgbGlidmlydD8KCj4gPiAKPiA+IEVyaWsgIAo+IGdvdCBpdC4gdGhhbmtz
IGEgbG90IQo+IAo+IGhpIENvcm5lbGlhIGFuZCBEYXZlLAo+IGRvIHlvdSBhbHNvIGFncmVlIG9u
Ogo+IDEuICJub3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBlcnJubyByZXR1cm5lZCBmb3IgYSBz
cGVjaWZpYyBzaXR1YXRpb24sCj4gbGV0IHRoZSB2ZW5kb3IgZHJpdmVyIGRlY2lkZSwgdXNlcnNw
YWNlIHNpbXBseSBuZWVkcyB0byBrbm93IHRoYXQgYW4gZXJybm8gb24KPiByZWFkIGluZGljYXRl
cyB0aGUgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNv
biBhbmQKPiB0aGF0IGFuIGVycm5vIG9uIHdyaXRlIGluZGljYXRlcyB0aGUgZGV2aWNlcyBhcmUg
aW5jb21wYXRpYmxlIG9yIHRoZSB0YXJnZXQKPiBkb2Vzbid0IHN1cHBvcnQgbWlncmF0aW9uIHZl
cnNpb25zLiAiCj4gMi4gdmVuZG9yIGRyaXZlciBzaG91bGQgbG9nIGRldGFpbGVkIGVycm9yIHJl
YXNvbnMgaW4ga2VybmVsIGxvZy4KClR3byBxdWVzdGlvbnM6Ci0gSG93IHJlYXNvbmFibGUgaXMg
aXQgdG8gcmVmZXIgdG8gdGhlIHN5c3RlbSBsb2cgaW4gb3JkZXIgdG8gZmluZCBvdXQKICB3aGF0
IGV4YWN0bHkgd2VudCB3cm9uZz8KLSBJZiBkZXRhaWxlZCBlcnJvciByZXBvcnRpbmcgaXMgYmFz
aWNhbGx5IGRvbmUgdG8gdGhlIHN5c2xvZywgZG8KICBkaWZmZXJlbnQgZXJyb3IgY29kZXMgc3Rp
bGwgcHJvdmlkZSB1c2VmdWwgaW5mb3JtYXRpb24/IE9yIHNob3VsZCB0aGUKICB2ZW5kb3IgZHJp
dmVyIGRlY2lkZSB3aGF0IGl0IHdhbnRzIHRvIGRvPwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
