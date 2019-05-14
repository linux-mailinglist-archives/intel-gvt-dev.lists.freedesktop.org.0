Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5491C3BF
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 09:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E56389128;
	Tue, 14 May 2019 07:20:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4929C89128
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 07:20:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3891499C4B;
 Tue, 14 May 2019 07:20:57 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8AF5D6A6;
 Tue, 14 May 2019 07:20:42 +0000 (UTC)
Date: Tue, 14 May 2019 09:20:40 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514072039.GA2089@beluga.usersys.redhat.com>
References: <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
 <20190513132804.GD11139@beluga.usersys.redhat.com>
 <20190514061235.GC20407@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514061235.GC20407@joy-OptiPlex-7040>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 14 May 2019 07:20:57 +0000 (UTC)
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
 "dinechin@redhat.com" <dinechin@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDI6MTI6MzVBTSAtMDQwMCwgWWFuIFpoYW8gd3JvdGU6
Cj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDk6Mjg6MDRQTSArMDgwMCwgRXJpayBTa3VsdGV0
eSB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDExOjQ4OjM4QU0gKzAyMDAsIENv
cm5lbGlhIEh1Y2sgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgMTAgTWF5IDIwMTkgMTA6MzY6MDkgKzAx
MDAKPiA+ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gPiAqIENvcm5lbGlhIEh1Y2sgKGNvaHVja0ByZWRoYXQuY29tKSB3
cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgOSBNYXkgMjAxOSAxNzo0ODoyNiArMDEwMAo+ID4gPiA+
ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICogQ29ybmVsaWEgSHVjayAoY29odWNrQHJlZGhhdC5jb20p
IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIFRodSwgOSBNYXkgMjAxOSAxNjo0ODo1NyArMDEwMAo+
ID4gPiA+ID4gPiA+ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ICogQ29ybmVsaWEgSHVjayAo
Y29odWNrQHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBUdWUsIDcgTWF5
IDIwMTkgMTU6MTg6MjYgLTA2MDAKPiA+ID4gPiA+ID4gPiA+ID4gQWxleCBXaWxsaWFtc29uIDxh
bGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gT24gU3VuLCAgNSBNYXkgMjAxOSAyMTo0OTowNCAtMDQwMAo+ID4gPiA+
ID4gPiA+ID4gPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBFcnJubzoKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgIElmIHZlbmRvciBkcml2ZXIgd2FudHMgdG8gY2xhaW0gYSBtZGV2IGRldmlj
ZSBpbmNvbXBhdGlibGUgdG8gYWxsIG90aGVyIG1kZXYKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
IGRldmljZXMsIGl0IHNob3VsZCBub3QgcmVnaXN0ZXIgdmVyc2lvbiBhdHRyaWJ1dGUgZm9yIHRo
aXMgbWRldiBkZXZpY2UuIEJ1dCBpZgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgYSB2ZW5kb3Ig
ZHJpdmVyIGhhcyBhbHJlYWR5IHJlZ2lzdGVyZWQgdmVyc2lvbiBhdHRyaWJ1dGUgYW5kIGl0IHdh
bnRzIHRvIGNsYWltCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBhIG1kZXYgZGV2aWNlIGluY29t
cGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldiBkZXZpY2VzLCBpdCBuZWVkcyB0byByZXR1cm4KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ICsgIC1FTk9ERVYgb24gYWNjZXNzIHRvIHRoaXMgbWRldiBkZXZp
Y2UncyB2ZXJzaW9uIGF0dHJpYnV0ZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIElmIGEgbWRl
diBkZXZpY2UgaXMgb25seSBpbmNvbXBhdGlibGUgdG8gY2VydGFpbiBtZGV2IGRldmljZXMsIHdy
aXRlIG9mCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBpbmNvbXBhdGlibGUgbWRldiBkZXZpY2Vz
J3MgdmVyc2lvbiBzdHJpbmdzIHRvIGl0cyB2ZXJzaW9uIGF0dHJpYnV0ZSBzaG91bGQKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gSSB0aGluayBpdCdzIGJlc3Qgbm90IHRvIGRlZmluZSB0aGUgc3Bl
Y2lmaWMgZXJybm8gcmV0dXJuZWQgZm9yIGEKPiA+ID4gPiA+ID4gPiA+ID4gPiBzcGVjaWZpYyBz
aXR1YXRpb24sIGxldCB0aGUgdmVuZG9yIGRyaXZlciBkZWNpZGUsIHVzZXJzcGFjZSBzaW1wbHkK
PiA+ID4gPiA+ID4gPiA+ID4gPiBuZWVkcyB0byBrbm93IHRoYXQgYW4gZXJybm8gb24gcmVhZCBp
bmRpY2F0ZXMgdGhlIGRldmljZSBkb2VzIG5vdAo+ID4gPiA+ID4gPiA+ID4gPiA+IHN1cHBvcnQg
bWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNvbiBhbmQgdGhhdCBhbiBlcnJubyBvbiB3cml0ZQo+
ID4gPiA+ID4gPiA+ID4gPiA+IGluZGljYXRlcyB0aGUgZGV2aWNlcyBhcmUgaW5jb21wYXRpYmxl
IG9yIHRoZSB0YXJnZXQgZG9lc24ndCBzdXBwb3J0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gbWlncmF0
aW9uIHZlcnNpb25zLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBJIHRoaW5r
IEkgaGF2ZSB0byBkaXNhZ3JlZSBoZXJlOiBJdCdzIHByb2JhYmx5IHZhbHVhYmxlIHRvIGhhdmUg
YW4KPiA+ID4gPiA+ID4gPiA+ID4gYWdyZWVkIGVycm9yIGZvciAnY2Fubm90IG1pZ3JhdGUgYXQg
YWxsJyB2cyAnY2Fubm90IG1pZ3JhdGUgYmV0d2Vlbgo+ID4gPiA+ID4gPiA+ID4gPiB0aG9zZSB0
d28gcGFydGljdWxhciBkZXZpY2VzJy4gVXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gZG8gZGlmZmVy
ZW50Cj4gPiA+ID4gPiA+ID4gPiA+IHRoaW5ncyAoZS5nLiB0cnlpbmcgd2l0aCBkaWZmZXJlbnQg
ZGV2aWNlIHBhaXJzKS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUcnlpbmcgdG8g
c3R1ZmYgdGhlc2UgdGhpbmdzIGRvd24gYW4gZXJybm8gc2VlbXMgYSBiYWQgaWRlYTsgd2UgY2Fu
J3QKPiA+ID4gPiA+ID4gPiA+IGdldCBtdWNoIGluZm9ybWF0aW9uIHRoYXQgd2F5Lgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU28sIHdoYXQgd291bGQgYmUgYSByZWFzb25hYmxlIGFwcHJv
YWNoPyBVc2Vyc3BhY2Ugc2hvdWxkIGZpcnN0IHJlYWQKPiA+ID4gPiA+ID4gPiB0aGUgdmVyc2lv
biBhdHRyaWJ1dGVzIG9uIGJvdGggZGV2aWNlcyAodG8gZmluZCBvdXQgd2hldGhlciBtaWdyYXRp
b24KPiA+ID4gPiA+ID4gPiBpcyBzdXBwb3J0ZWQgYXQgYWxsKSwgYW5kIG9ubHkgdGhlbiBmaWd1
cmUgb3V0IHZpYSB3cml0aW5nIHdoZXRoZXIgdGhleQo+ID4gPiA+ID4gPiA+IGFyZSBjb21wYXRp
YmxlPwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gKE9yIGp1c3QgZ28gYWhlYWQgYW5kIHRy
eSwgaWYgaXQgZG9lcyBub3QgY2FyZSBhYm91dCB0aGUgcmVhc29uLikKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gV2VsbCwgSSdtIE9LIHdpdGggc29tZXRoaW5nIGxpa2Ugd3JpdGluZyB0byB0ZXN0
IHdoZXRoZXIgaXQncwo+ID4gPiA+ID4gPiBjb21wYXRpYmxlLCBpdCdzIGp1c3Qgd2UgbmVlZCBh
IGJldHRlciB3YXkgb2Ygc2F5aW5nICdubycuCj4gPiA+ID4gPiA+IEknbSBub3Qgc3VyZSBpZiB0
aGF0IGludm9sdmVzIHJlYWRpbmcgYmFjayBmcm9tIHNvbWV3aGVyZSBhZnRlcgo+ID4gPiA+ID4g
PiB0aGUgd3JpdGUgb3Igd2hhdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIbSwgc28gSSBiYXNpY2Fs
bHkgc2VlIHR3byB3YXlzIG9mIGRvaW5nIHRoYXQ6Cj4gPiA+ID4gPiAtIHN0YW5kYXJkaXplIG9u
IHNvbWUgZXJyb3IgY29kZXMuLi4gcHJvYmxlbTogZXJyb3IgY29kZXMgY2FuIGJlIGhhcmQKPiA+
ID4gPiA+ICAgdG8gZml0IHRvIHJlYXNvbnMKPiA+ID4gPiA+IC0gbWFrZSB0aGUgZXJyb3IgYXZh
aWxhYmxlIGluIHNvbWUgYXR0cmlidXRlIHRoYXQgY2FuIGJlIHJlYWQKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJJ20gbm90IHN1cmUgaG93IHdlIGNhbiBzZXJpYWxpemUgdGhlIHJlYWRiYWNrIHdpdGgg
dGhlIGxhc3Qgd3JpdGUsCj4gPiA+ID4gPiB0aG91Z2ggKHRoaXMgbG9va3MgaW5oZXJlbnRseSBy
YWN5KS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIb3cgaW1wb3J0YW50IGlzIGRldGFpbGVkIGVycm9y
IHJlcG9ydGluZyBoZXJlPwo+ID4gPiA+Cj4gPiA+ID4gSSB0aGluayB3ZSBuZWVkIHNvbWV0aGlu
Zywgb3RoZXJ3aXNlIHdlJ3JlIGp1c3QgZ29pbmcgdG8gZ2V0IHZhZ3VlCj4gPiA+ID4gdXNlciBy
ZXBvcnRzIG9mICdidXQgbXkgVk0gZG9lc24ndCBtaWdyYXRlJzsgSSdkIGxpa2UgdGhlIGVycm9y
IHRvIGJlCj4gPiA+ID4gZ29vZCBlbm91Z2ggdG8gcG9pbnQgbW9zdCB1c2VycyB0byBzb21ldGhp
bmcgdGhleSBjYW4gdW5kZXJzdGFuZAo+ID4gPiA+IChlLmcuIHdyb25nIGNhcmQgZmFtaWx5L3Rv
byBvbGQgYSBkcml2ZXIgZXRjKS4KPiA+ID4KPiA+ID4gT2ssIHRoYXQgc291bmRzIGxpa2UgYSBy
ZWFzb25hYmxlIHBvaW50LiBOb3QgdGhhdCBJIGhhdmUgYSBiZXR0ZXIgaWRlYQo+ID4gPiBob3cg
dG8gYWNoaWV2ZSB0aGF0LCB0aG91Z2guLi4gd2UgY291bGQgYWxzbyBsb2cgYSBtb3JlIHZlcmJv
c2UgZXJyb3IKPiA+ID4gbWVzc2FnZSB0byB0aGUga2VybmVsIGxvZywgYnV0IHRoYXQncyBub3Qg
bmVjZXNzYXJpbHkgd2hlcmUgYSB1c2VyIHdpbGwKPiA+ID4gbG9vayBmaXJzdC4KPiA+Cj4gPiBJ
biBjYXNlIG9mIGxpYnZpcnQgY2hlY2tpbmcgdGhlIGNvbXBhdGliaWxpdHksIGl0IHdvbid0IG1h
dHRlciBob3cgZ29vZCB0aGUKPiA+IGVycm9yIG1lc3NhZ2UgaW4gdGhlIGtlcm5lbCBsb2cgaXMg
YW5kIHJlZ2FyZGxlc3Mgb2YgaG93IG1hbnkgZXJyb3Igc3RhdGVzIHlvdQo+ID4gd2FudCB0byBo
YW5kbGUsIGxpYnZpcnQncyBvbmx5IGxpbWl0ZWQgdG8gZXJybm8gaGVyZSwgc2luY2Ugd2UncmUg
Z29pbmcgdG8gZG8KPiA+IHBsYWluIHJlYWQvd3JpdGUsIHNvIG91ciBpbnRlcm5hbCBlcnJvciBt
ZXNzYWdlIHJldHVybmVkIHRvIHRoZSB1c2VyIGlzIG9ubHkKPiA+IGdvaW5nIHRvIGNvbnRhaW4g
d2hhdCB0aGUgZXJybm8gc2F5cyAtIG9rYXksIG9mIGNvdXJzZSB3ZSBjYW4gKGFuZCB3ZSBETykK
PiA+IHByb3ZpZGUgbGlidmlydCBzcGVjaWZpYyBzdHJpbmcsIGZ1cnRoZXIgc3BlY2lmeWluZyB0
aGUgZXJyb3IgYnV0IGxpa2UgSQo+ID4gbWVudGlvbmVkLCBkZXBlbmRpbmcgb24gaG93IG1hbnkg
ZXJyb3IgY2FzZXMgd2Ugd2FudCB0byBkaXN0aW5ndWlzaCB0aGlzIG1heSBiZQo+ID4gaGFyZCBm
b3IgYW55b25lIHRvIGZpZ3VyZSBvdXQgc29sZWx5IG9uIHRoZSBlcnJvciBjb2RlLCBhcyBhcHBz
IHdpbGwgbW9zdAo+ID4gcHJvYmFibHkgbm90IHBhcnNlIHRoZQo+ID4gbG9ncy4KPiA+Cj4gPiBS
ZWdhcmRzLAo+ID4gRXJpawo+IGhpIEVyaWsKPiBkbyB5b3UgbWVhbiB5b3UgYXJlIGFncmVlaW5n
IG9uIGRlZmluaW5nIGNvbW1vbiBlcnJvcnMgYW5kIG9ubHkgcmV0dXJuaW5nIGVycm5vPwoKSW4g
YSBzZW5zZSwgeWVzLiBXaGlsZSBpdCBpcyBoaWdobHkgZGVzaXJhYmxlIHRvIGhhdmUgbG9ncyB3
aXRoIGRlc2NyaXB0aXZlCm1lc3NhZ2VzIHdoaWNoIHdpbGwgaGVscCBpbiB0cm91Ymxlc2hvb3Rp
bmcgdHJlbWVuZG91c2x5LCBJIHdhbnRlZCB0byBwb2ludCBvdXQKdGhhdCBzcGVuZGluZyB0aW1l
IHdpdGggZXJyb3IgbG9ncyBtYXkgbm90IGJlIHRoYXQgd29ydGh3aGlsZSBlc3BlY2lhbGx5IHNp
bmNlCm1vc3QgYXBwcyAobGlrZSBsaWJ2aXJ0KSB3aWxsIHNvbGVseSByZWx5IG9uIHVzaW5nIHJl
YWQoMykvd3JpdGUoMykgdG8gc3lzZnMuClRoYXQgbWVhbnMgdGhhdCB3ZSdyZSBsaW1pdGVkIGJ5
IHRoZSBlcnJub3MgYXZhaWxhYmxlLCBzbyBhcGFydCBmcm9tCnJlcG9ydGluZyB0aGUgZ2VuZXJp
YyBzeXN0ZW0gbWVzc2FnZSB3ZSBjYW4ndCBhbnkgbW9yZSBtYWdpYyBpbiB0ZXJtcyBvZiB0aGUK
ZXJyb3IgbWVzc2FnZXMsIHNvIHRoZSBkcml2ZXIgbmVlZHMgdG8gYXNzdXJlIHRoYXQgYSBwcm9w
ZXIgbWVzc2FnZSBpcwpwcm9wYWdhdGVkIHRvIHRoZSBqb3VybmFsIGFuZCBhdCBiZXN0IGxpYnZp
cnQgY2FuIGRpcmVjdCB0aGUgdXNlciAoY29uc3VtZXIpIHRvCmxvb2sgdGhyb3VnaCB0aGUgc3lz
dGVtIGxvZ3MgZm9yIG1vcmUgaW5mby4gSSBhbHNvIGFncmVlIHdpdGggdGhlIHBvaW50Cm1lbnRp
b25lZCBhYm92ZSB0aGF0IGRlZmluaW5nIGEgc3BlY2lmaWMgZXJybm8gaXMgSU1PIG5vdCB0aGUg
d2F5IHRvIGdvLCBhcwp0aGVzZSB3b3VsZCBiZSBqdXN0IHRvbyBzcGVjaWZpYyBmb3IgdGhlIHJl
YWQoMykvd3JpdGUoMykgdXNlIGNhc2UuCgpUaGF0IHNhaWQsIGZyb20gbGlidmlydCBQT1YgYXMg
YSBjb25zdW1lciwgSSdkIGV4cGVjdCB0aGVyZSB0byBiZSB0cnVseSBvbmx5IDIKZXJyb3JzIChJ
IGJlbGlldmUgQWxleCBoYXMgbWVudGlvbmVkIHNvbWV0aGluZyBzaW1pbGFyIGluIG9uZSBvZiBo
aXMgcmVzcG9uc2VzCmluIG9uZSBvZiB0aGUgdGhyZWFkcyk6CiAgICBhKSByZWFkIGVycm9yIGlu
ZGljYXRpbmcgdGhhdCBhbiBtZGV2IHR5cGUgZG9lc24ndCBzdXBwb3J0IG1pZ3JhdGlvbgogICAg
ICAgIC0gSSBhc3N1bWUgaWYgb25lIHR5cGUgZG9lc24ndCBzdXBwb3J0IG1pZ3JhdGlvbiwgbm9u
ZSBvZiB0aGUgb3RoZXIKICAgICAgICAgIHR5cGVzIGV4cG9zZWQgb24gdGhlIHBhcmVudCBkZXZp
Y2UgZG8sIGlzIHRoYXQgYSBmYWlyIGFzc3VtcHRpb24/CiAgICBiKSB3cml0ZSBlcnJvciBpbmRp
Y2F0aW5nIHRoYXQgdGhlIG1kZXYgdHlwZXMgYXJlIGluY29tcGF0aWJsZSBmb3IKICAgIG1pZ3Jh
dGlvbgoKUmVnYXJkcywKRXJpawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
