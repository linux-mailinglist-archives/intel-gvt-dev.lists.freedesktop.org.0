Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA681C396
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 09:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2971B8929D;
	Tue, 14 May 2019 07:03:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FD98929D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 07:03:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84137307D941;
 Tue, 14 May 2019 07:03:42 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F266160C4D;
 Tue, 14 May 2019 07:03:28 +0000 (UTC)
Date: Tue, 14 May 2019 09:03:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514090326.2f4288ae.cohuck@redhat.com>
In-Reply-To: <20190514061235.GC20407@joy-OptiPlex-7040>
References: <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
 <20190513132804.GD11139@beluga.usersys.redhat.com>
 <20190514061235.GC20407@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 14 May 2019 07:03:43 +0000 (UTC)
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
 "dinechin@redhat.com" <dinechin@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxNCBNYXkgMjAxOSAwMjoxMjozNSAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwOToyODowNFBNICsw
ODAwLCBFcmlrIFNrdWx0ZXR5IHdyb3RlOgoKPiA+IEluIGNhc2Ugb2YgbGlidmlydCBjaGVja2lu
ZyB0aGUgY29tcGF0aWJpbGl0eSwgaXQgd29uJ3QgbWF0dGVyIGhvdyBnb29kIHRoZQo+ID4gZXJy
b3IgbWVzc2FnZSBpbiB0aGUga2VybmVsIGxvZyBpcyBhbmQgcmVnYXJkbGVzcyBvZiBob3cgbWFu
eSBlcnJvciBzdGF0ZXMgeW91Cj4gPiB3YW50IHRvIGhhbmRsZSwgbGlidmlydCdzIG9ubHkgbGlt
aXRlZCB0byBlcnJubyBoZXJlLCBzaW5jZSB3ZSdyZSBnb2luZyB0byBkbwo+ID4gcGxhaW4gcmVh
ZC93cml0ZSwgc28gb3VyIGludGVybmFsIGVycm9yIG1lc3NhZ2UgcmV0dXJuZWQgdG8gdGhlIHVz
ZXIgaXMgb25seQo+ID4gZ29pbmcgdG8gY29udGFpbiB3aGF0IHRoZSBlcnJubyBzYXlzIC0gb2th
eSwgb2YgY291cnNlIHdlIGNhbiAoYW5kIHdlIERPKQo+ID4gcHJvdmlkZSBsaWJ2aXJ0IHNwZWNp
ZmljIHN0cmluZywgZnVydGhlciBzcGVjaWZ5aW5nIHRoZSBlcnJvciBidXQgbGlrZSBJCj4gPiBt
ZW50aW9uZWQsIGRlcGVuZGluZyBvbiBob3cgbWFueSBlcnJvciBjYXNlcyB3ZSB3YW50IHRvIGRp
c3Rpbmd1aXNoIHRoaXMgbWF5IGJlCj4gPiBoYXJkIGZvciBhbnlvbmUgdG8gZmlndXJlIG91dCBz
b2xlbHkgb24gdGhlIGVycm9yIGNvZGUsIGFzIGFwcHMgd2lsbCBtb3N0Cj4gPiBwcm9iYWJseSBu
b3QgcGFyc2UgdGhlCj4gPiBsb2dzLgo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gRXJpayAgCj4gaGkg
RXJpawo+IGRvIHlvdSBtZWFuIHlvdSBhcmUgYWdyZWVpbmcgb24gZGVmaW5pbmcgY29tbW9uIGVy
cm9ycyBhbmQgb25seSByZXR1cm5pbmcgZXJybm8/Cj4gCj4gZS5nLgo+ICNkZWZpbmUgRU5PTUlH
UkFUSU9OICAgICAgICAgMTQwICAvKiBkZXZpY2Ugbm90IHN1cHBvcnRpbmcgbWlncmF0aW9uICov
Cj4gI2RlZmluZSBFVU5BVENIICAgICAgICAgICAgICA0OSAgLyogc29mdHdhcmUgdmVyc2lvbiBu
b3QgbWF0Y2ggKi8KPiAjZGVmaW5lIEVIV05NICAgICAgICAgICAgICAgIDE0MiAgLyogaGFyZHdh
cmUgbm90IG1hdGNoaW5nKi8KCkRlZmluaW5nIGN1c3RvbSBlcnJvciBjb2RlcyBpcyBwcm9iYWJs
eSBub3Qgc3VjaCBhIGdvb2QgaWRlYS4uLiBjYW4gd2UKbWF0Y2ggdG8gY29tbW9uIGVycm9yIGNv
ZGVzIGluc3RlYWQ/IERvIHdlIGhhdmUgYSBnb29kIGlkZWEgYWJvdXQKY29tbW9uIGVycm9yIGNh
dGVnb3JpZXMsIGFueXdheT8KCihCdHc6IGRvZXMgbGlidmlydCBkbyBhIGdlbmVyaWMgZXJyb3It
dG8tZGVzY3JpcHRpb24gdHJhbnNsYXRpb24sIG9yCmRvZXMgaXQgbWF0Y2ggdG8gdGhlIGNvbnRl
eHQ/IEkuZS4sIGNhbiBsaWJ2aXJ0IHRyYW5zbGF0ZSB3ZWxsLWRlZmluZWQKZXJyb3IgY29kZXMg
dG8gYSB1c2VmdWwgbWVzc2FnZSBmb3IgYSBzcGVjaWZpYyBjYXNlPykKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
