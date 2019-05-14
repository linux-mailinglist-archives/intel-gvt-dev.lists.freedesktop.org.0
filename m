Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15F1C764
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 13:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46A48925E;
	Tue, 14 May 2019 11:02:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410A389269
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 11:02:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FF6489C3E;
 Tue, 14 May 2019 11:02:02 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E57D61995;
 Tue, 14 May 2019 11:01:48 +0000 (UTC)
Date: Tue, 14 May 2019 12:01:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514110143.GD2753@work-vm>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514115135.078bbaf7.cohuck@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 14 May 2019 11:02:02 +0000 (UTC)
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
 "Tian, Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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

KiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gT24gVHVlLCAxNCBN
YXkgMjAxOSAwMzo0NzozNiAtMDQwMAo+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4g
d3JvdGU6Cj4gCj4gPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAwMzo0Mzo0NFBNICswODAwLCBF
cmlrIFNrdWx0ZXR5IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAwMzozMjox
OUFNIC0wNDAwLCBZYW4gWmhhbyB3cm90ZTogIAo+ID4gPiA+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5
IGF0IDAzOjIwOjQwUE0gKzA4MDAsIEVyaWsgU2t1bHRldHkgd3JvdGU6ICAKPiAKPiA+ID4gPiA+
IFRoYXQgc2FpZCwgZnJvbSBsaWJ2aXJ0IFBPViBhcyBhIGNvbnN1bWVyLCBJJ2QgZXhwZWN0IHRo
ZXJlIHRvIGJlIHRydWx5IG9ubHkgMgo+ID4gPiA+ID4gZXJyb3JzIChJIGJlbGlldmUgQWxleCBo
YXMgbWVudGlvbmVkIHNvbWV0aGluZyBzaW1pbGFyIGluIG9uZSBvZiBoaXMgcmVzcG9uc2VzCj4g
PiA+ID4gPiBpbiBvbmUgb2YgdGhlIHRocmVhZHMpOgo+ID4gPiA+ID4gICAgIGEpIHJlYWQgZXJy
b3IgaW5kaWNhdGluZyB0aGF0IGFuIG1kZXYgdHlwZSBkb2Vzbid0IHN1cHBvcnQgbWlncmF0aW9u
Cj4gPiA+ID4gPiAgICAgICAgIC0gSSBhc3N1bWUgaWYgb25lIHR5cGUgZG9lc24ndCBzdXBwb3J0
IG1pZ3JhdGlvbiwgbm9uZSBvZiB0aGUgb3RoZXIKPiA+ID4gPiA+ICAgICAgICAgICB0eXBlcyBl
eHBvc2VkIG9uIHRoZSBwYXJlbnQgZGV2aWNlIGRvLCBpcyB0aGF0IGEgZmFpciBhc3N1bXB0aW9u
Pwo+IAo+IFByb2JhYmx5OyBidXQgdGhlcmUgbWlnaHQgYmUgY2FzZXMgd2hlcmUgdGhlIG1pZ3Jh
dGFiaWxpdHkgZGVwZW5kcyBub3QKPiBvbiB0aGUgZGV2aWNlIHR5cGUsIGJ1dCBob3cgdGhlIHBh
cnRpdGlvbmluZyBoYXMgYmVlbiBkb25lLi4uIG9yIGlzCj4gdGhhdCB0b28gY29udHJpdmVkPwo+
IAo+ID4gPiA+ID4gICAgIGIpIHdyaXRlIGVycm9yIGluZGljYXRpbmcgdGhhdCB0aGUgbWRldiB0
eXBlcyBhcmUgaW5jb21wYXRpYmxlIGZvcgo+ID4gPiA+ID4gICAgIG1pZ3JhdGlvbgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gPiBFcmlrICAKPiA+ID4gPiBUaGFua3MgZm9y
IHRoaXMgZXhwbGFuYXRpb24uCj4gPiA+ID4gc28sIGNhbiB3ZSBhcnJpdmUgYXQgYmVsb3cgYWdy
ZWVtZW50cz8KPiA+ID4gPgo+ID4gPiA+IDEuICJub3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBl
cnJubyByZXR1cm5lZCBmb3IgYSBzcGVjaWZpYyBzaXR1YXRpb24sCj4gPiA+ID4gbGV0IHRoZSB2
ZW5kb3IgZHJpdmVyIGRlY2lkZSwgdXNlcnNwYWNlIHNpbXBseSBuZWVkcyB0byBrbm93IHRoYXQg
YW4gZXJybm8gb24KPiA+ID4gPiByZWFkIGluZGljYXRlcyB0aGUgZGV2aWNlIGRvZXMgbm90IHN1
cHBvcnQgbWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNvbiBhbmQKPiA+ID4gPiB0aGF0IGFuIGVy
cm5vIG9uIHdyaXRlIGluZGljYXRlcyB0aGUgZGV2aWNlcyBhcmUgaW5jb21wYXRpYmxlIG9yIHRo
ZSB0YXJnZXQKPiA+ID4gPiBkb2Vzbid0IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNpb25zLiAiCj4g
PiA+ID4gMi4gdmVuZG9yIGRyaXZlciBzaG91bGQgbG9nIGRldGFpbGVkIGVycm9yIHJlYXNvbnMg
aW4ga2VybmVsIGxvZy4gIAo+ID4gPiAKPiA+ID4gVGhhdCB3b3VsZCBiZSBteSB0YWtlIG9uIHRo
aXMsIHllcywgYnV0IEkgb3BlbiB0byBoZWFyIGFueSBvdGhlciBzdWdnZXN0aW9ucyBhbmQKPiA+
ID4gaWRlYXMgSSBjb3VsZG4ndCB0aGluayBvZiBhcyB3ZWxsLgo+IAo+IFNvLCByZWFkIHRvIGZp
bmQgb3V0IHdoZXRoZXIgbWlncmF0aW9uIGlzIHN1cHBvcnRlZCBhdCBhbGwsIHdyaXRlIHRvCj4g
ZmluZCBvdXQgd2hldGhlciBpdCBpcyBzdXBwb3J0ZWQgZm9yIHRoYXQgY29uY3JldGUgcGFpcmlu
ZyBpcwo+IHJlYXNvbmFibGUgZm9yIGxpYnZpcnQ/Cj4gCj4gPiA+IAo+ID4gPiBFcmlrICAKPiA+
IGdvdCBpdC4gdGhhbmtzIGEgbG90IQo+ID4gCj4gPiBoaSBDb3JuZWxpYSBhbmQgRGF2ZSwKPiA+
IGRvIHlvdSBhbHNvIGFncmVlIG9uOgo+ID4gMS4gIm5vdCB0byBkZWZpbmUgdGhlIHNwZWNpZmlj
IGVycm5vIHJldHVybmVkIGZvciBhIHNwZWNpZmljIHNpdHVhdGlvbiwKPiA+IGxldCB0aGUgdmVu
ZG9yIGRyaXZlciBkZWNpZGUsIHVzZXJzcGFjZSBzaW1wbHkgbmVlZHMgdG8ga25vdyB0aGF0IGFu
IGVycm5vIG9uCj4gPiByZWFkIGluZGljYXRlcyB0aGUgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQg
bWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNvbiBhbmQKPiA+IHRoYXQgYW4gZXJybm8gb24gd3Jp
dGUgaW5kaWNhdGVzIHRoZSBkZXZpY2VzIGFyZSBpbmNvbXBhdGlibGUgb3IgdGhlIHRhcmdldAo+
ID4gZG9lc24ndCBzdXBwb3J0IG1pZ3JhdGlvbiB2ZXJzaW9ucy4gIgo+ID4gMi4gdmVuZG9yIGRy
aXZlciBzaG91bGQgbG9nIGRldGFpbGVkIGVycm9yIHJlYXNvbnMgaW4ga2VybmVsIGxvZy4KPiAK
PiBUd28gcXVlc3Rpb25zOgo+IC0gSG93IHJlYXNvbmFibGUgaXMgaXQgdG8gcmVmZXIgdG8gdGhl
IHN5c3RlbSBsb2cgaW4gb3JkZXIgdG8gZmluZCBvdXQKPiAgIHdoYXQgZXhhY3RseSB3ZW50IHdy
b25nPwo+IC0gSWYgZGV0YWlsZWQgZXJyb3IgcmVwb3J0aW5nIGlzIGJhc2ljYWxseSBkb25lIHRv
IHRoZSBzeXNsb2csIGRvCj4gICBkaWZmZXJlbnQgZXJyb3IgY29kZXMgc3RpbGwgcHJvdmlkZSB1
c2VmdWwgaW5mb3JtYXRpb24/IE9yIHNob3VsZCB0aGUKPiAgIHZlbmRvciBkcml2ZXIgZGVjaWRl
IHdoYXQgaXQgd2FudHMgdG8gZG8/CgpJIGRvbid0IHNlZSBlcnJvciBjb2RlcyBhcyBiZWluZyB0
aGF0IGhlbHBmdWw7IGlmIHdlIGNhbid0IGFjdHVhbGx5IGdldAphbiBlcnJvciBtZXNzYWdlIGJh
Y2sgdXAgdGhlIHN0YWNrICh3aGljaCB3YXMgbXkgcHJlZmVyZW5jZSksIHRoZW4gSSBndWVzcwpz
eXNsb2cgaXMgYXMgZ29vZCBhcyBpdCB3aWxsIGdldC4KCkRhdmUKCi0tCkRyLiBEYXZpZCBBbGFu
IEdpbGJlcnQgLyBkZ2lsYmVydEByZWRoYXQuY29tIC8gTWFuY2hlc3RlciwgVUsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
