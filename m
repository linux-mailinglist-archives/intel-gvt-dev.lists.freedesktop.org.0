Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF861C32A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 08:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F5C8926A;
	Tue, 14 May 2019 06:18:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342AE8926A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 06:18:20 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 23:18:19 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 13 May 2019 23:18:14 -0700
Date: Tue, 14 May 2019 02:12:35 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Erik Skultety <eskultet@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514061235.GC20407@joy-OptiPlex-7040>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513132804.GD11139@beluga.usersys.redhat.com>
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDk6Mjg6MDRQTSArMDgwMCwgRXJpayBTa3VsdGV0eSB3
cm90ZToKPiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAxMTo0ODozOEFNICswMjAwLCBDb3JuZWxp
YSBIdWNrIHdyb3RlOgo+ID4gT24gRnJpLCAxMCBNYXkgMjAxOSAxMDozNjowOSArMDEwMAo+ID4g
IkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToKPiA+
Cj4gPiA+ICogQ29ybmVsaWEgSHVjayAoY29odWNrQHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gPiA+
IE9uIFRodSwgOSBNYXkgMjAxOSAxNzo0ODoyNiArMDEwMAo+ID4gPiA+ICJEci4gRGF2aWQgQWxh
biBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+
ICogQ29ybmVsaWEgSHVjayAoY29odWNrQHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gPiA+ID4gPiBP
biBUaHUsIDkgTWF5IDIwMTkgMTY6NDg6NTcgKzAxMDAKPiA+ID4gPiA+ID4gIkRyLiBEYXZpZCBB
bGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiAqIENvcm5lbGlhIEh1Y2sgKGNvaHVja0ByZWRoYXQuY29tKSB3cm90ZToKPiA+
ID4gPiA+ID4gPiA+IE9uIFR1ZSwgNyBNYXkgMjAxOSAxNToxODoyNiAtMDYwMAo+ID4gPiA+ID4g
PiA+ID4gQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBTdW4sICA1IE1heSAyMDE5IDIx
OjQ5OjA0IC0wNDAwCj4gPiA+ID4gPiA+ID4gPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVs
LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIEVycm5v
Ogo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIElmIHZlbmRvciBkcml2ZXIgd2FudHMgdG8gY2xhaW0g
YSBtZGV2IGRldmljZSBpbmNvbXBhdGlibGUgdG8gYWxsIG90aGVyIG1kZXYKPiA+ID4gPiA+ID4g
PiA+ID4gPiArICBkZXZpY2VzLCBpdCBzaG91bGQgbm90IHJlZ2lzdGVyIHZlcnNpb24gYXR0cmli
dXRlIGZvciB0aGlzIG1kZXYgZGV2aWNlLiBCdXQgaWYKPiA+ID4gPiA+ID4gPiA+ID4gPiArICBh
IHZlbmRvciBkcml2ZXIgaGFzIGFscmVhZHkgcmVnaXN0ZXJlZCB2ZXJzaW9uIGF0dHJpYnV0ZSBh
bmQgaXQgd2FudHMgdG8gY2xhaW0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICBhIG1kZXYgZGV2aWNl
IGluY29tcGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldiBkZXZpY2VzLCBpdCBuZWVkcyB0byByZXR1
cm4KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAtRU5PREVWIG9uIGFjY2VzcyB0byB0aGlzIG1kZXYg
ZGV2aWNlJ3MgdmVyc2lvbiBhdHRyaWJ1dGUuCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgSWYgYSBt
ZGV2IGRldmljZSBpcyBvbmx5IGluY29tcGF0aWJsZSB0byBjZXJ0YWluIG1kZXYgZGV2aWNlcywg
d3JpdGUgb2YKPiA+ID4gPiA+ID4gPiA+ID4gPiArICBpbmNvbXBhdGlibGUgbWRldiBkZXZpY2Vz
J3MgdmVyc2lvbiBzdHJpbmdzIHRvIGl0cyB2ZXJzaW9uIGF0dHJpYnV0ZSBzaG91bGQKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiA+ID4gSSB0aGluayBpdCdzIGJlc3Qgbm90IHRvIGRlZmluZSB0aGUgc3BlY2lmaWMg
ZXJybm8gcmV0dXJuZWQgZm9yIGEKPiA+ID4gPiA+ID4gPiA+ID4gc3BlY2lmaWMgc2l0dWF0aW9u
LCBsZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1c2Vyc3BhY2Ugc2ltcGx5Cj4gPiA+ID4g
PiA+ID4gPiA+IG5lZWRzIHRvIGtub3cgdGhhdCBhbiBlcnJubyBvbiByZWFkIGluZGljYXRlcyB0
aGUgZGV2aWNlIGRvZXMgbm90Cj4gPiA+ID4gPiA+ID4gPiA+IHN1cHBvcnQgbWlncmF0aW9uIHZl
cnNpb24gY29tcGFyaXNvbiBhbmQgdGhhdCBhbiBlcnJubyBvbiB3cml0ZQo+ID4gPiA+ID4gPiA+
ID4gPiBpbmRpY2F0ZXMgdGhlIGRldmljZXMgYXJlIGluY29tcGF0aWJsZSBvciB0aGUgdGFyZ2V0
IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiA+ID4gPiA+ID4gPiBtaWdyYXRpb24gdmVyc2lvbnMuCj4g
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSSB0aGluayBJIGhhdmUgdG8gZGlzYWdyZWUg
aGVyZTogSXQncyBwcm9iYWJseSB2YWx1YWJsZSB0byBoYXZlIGFuCj4gPiA+ID4gPiA+ID4gPiBh
Z3JlZWQgZXJyb3IgZm9yICdjYW5ub3QgbWlncmF0ZSBhdCBhbGwnIHZzICdjYW5ub3QgbWlncmF0
ZSBiZXR3ZWVuCj4gPiA+ID4gPiA+ID4gPiB0aG9zZSB0d28gcGFydGljdWxhciBkZXZpY2VzJy4g
VXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gZG8gZGlmZmVyZW50Cj4gPiA+ID4gPiA+ID4gPiB0aGlu
Z3MgKGUuZy4gdHJ5aW5nIHdpdGggZGlmZmVyZW50IGRldmljZSBwYWlycykuCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBUcnlpbmcgdG8gc3R1ZmYgdGhlc2UgdGhpbmdzIGRvd24gYW4gZXJy
bm8gc2VlbXMgYSBiYWQgaWRlYTsgd2UgY2FuJ3QKPiA+ID4gPiA+ID4gPiBnZXQgbXVjaCBpbmZv
cm1hdGlvbiB0aGF0IHdheS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU28sIHdoYXQgd291bGQg
YmUgYSByZWFzb25hYmxlIGFwcHJvYWNoPyBVc2Vyc3BhY2Ugc2hvdWxkIGZpcnN0IHJlYWQKPiA+
ID4gPiA+ID4gdGhlIHZlcnNpb24gYXR0cmlidXRlcyBvbiBib3RoIGRldmljZXMgKHRvIGZpbmQg
b3V0IHdoZXRoZXIgbWlncmF0aW9uCj4gPiA+ID4gPiA+IGlzIHN1cHBvcnRlZCBhdCBhbGwpLCBh
bmQgb25seSB0aGVuIGZpZ3VyZSBvdXQgdmlhIHdyaXRpbmcgd2hldGhlciB0aGV5Cj4gPiA+ID4g
PiA+IGFyZSBjb21wYXRpYmxlPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAoT3IganVzdCBnbyBh
aGVhZCBhbmQgdHJ5LCBpZiBpdCBkb2VzIG5vdCBjYXJlIGFib3V0IHRoZSByZWFzb24uKQo+ID4g
PiA+ID4KPiA+ID4gPiA+IFdlbGwsIEknbSBPSyB3aXRoIHNvbWV0aGluZyBsaWtlIHdyaXRpbmcg
dG8gdGVzdCB3aGV0aGVyIGl0J3MKPiA+ID4gPiA+IGNvbXBhdGlibGUsIGl0J3MganVzdCB3ZSBu
ZWVkIGEgYmV0dGVyIHdheSBvZiBzYXlpbmcgJ25vJy4KPiA+ID4gPiA+IEknbSBub3Qgc3VyZSBp
ZiB0aGF0IGludm9sdmVzIHJlYWRpbmcgYmFjayBmcm9tIHNvbWV3aGVyZSBhZnRlcgo+ID4gPiA+
ID4gdGhlIHdyaXRlIG9yIHdoYXQuCj4gPiA+ID4KPiA+ID4gPiBIbSwgc28gSSBiYXNpY2FsbHkg
c2VlIHR3byB3YXlzIG9mIGRvaW5nIHRoYXQ6Cj4gPiA+ID4gLSBzdGFuZGFyZGl6ZSBvbiBzb21l
IGVycm9yIGNvZGVzLi4uIHByb2JsZW06IGVycm9yIGNvZGVzIGNhbiBiZSBoYXJkCj4gPiA+ID4g
ICB0byBmaXQgdG8gcmVhc29ucwo+ID4gPiA+IC0gbWFrZSB0aGUgZXJyb3IgYXZhaWxhYmxlIGlu
IHNvbWUgYXR0cmlidXRlIHRoYXQgY2FuIGJlIHJlYWQKPiA+ID4gPgo+ID4gPiA+IEknbSBub3Qg
c3VyZSBob3cgd2UgY2FuIHNlcmlhbGl6ZSB0aGUgcmVhZGJhY2sgd2l0aCB0aGUgbGFzdCB3cml0
ZSwKPiA+ID4gPiB0aG91Z2ggKHRoaXMgbG9va3MgaW5oZXJlbnRseSByYWN5KS4KPiA+ID4gPgo+
ID4gPiA+IEhvdyBpbXBvcnRhbnQgaXMgZGV0YWlsZWQgZXJyb3IgcmVwb3J0aW5nIGhlcmU/Cj4g
PiA+Cj4gPiA+IEkgdGhpbmsgd2UgbmVlZCBzb21ldGhpbmcsIG90aGVyd2lzZSB3ZSdyZSBqdXN0
IGdvaW5nIHRvIGdldCB2YWd1ZQo+ID4gPiB1c2VyIHJlcG9ydHMgb2YgJ2J1dCBteSBWTSBkb2Vz
bid0IG1pZ3JhdGUnOyBJJ2QgbGlrZSB0aGUgZXJyb3IgdG8gYmUKPiA+ID4gZ29vZCBlbm91Z2gg
dG8gcG9pbnQgbW9zdCB1c2VycyB0byBzb21ldGhpbmcgdGhleSBjYW4gdW5kZXJzdGFuZAo+ID4g
PiAoZS5nLiB3cm9uZyBjYXJkIGZhbWlseS90b28gb2xkIGEgZHJpdmVyIGV0YykuCj4gPgo+ID4g
T2ssIHRoYXQgc291bmRzIGxpa2UgYSByZWFzb25hYmxlIHBvaW50LiBOb3QgdGhhdCBJIGhhdmUg
YSBiZXR0ZXIgaWRlYQo+ID4gaG93IHRvIGFjaGlldmUgdGhhdCwgdGhvdWdoLi4uIHdlIGNvdWxk
IGFsc28gbG9nIGEgbW9yZSB2ZXJib3NlIGVycm9yCj4gPiBtZXNzYWdlIHRvIHRoZSBrZXJuZWwg
bG9nLCBidXQgdGhhdCdzIG5vdCBuZWNlc3NhcmlseSB3aGVyZSBhIHVzZXIgd2lsbAo+ID4gbG9v
ayBmaXJzdC4KPiAKPiBJbiBjYXNlIG9mIGxpYnZpcnQgY2hlY2tpbmcgdGhlIGNvbXBhdGliaWxp
dHksIGl0IHdvbid0IG1hdHRlciBob3cgZ29vZCB0aGUKPiBlcnJvciBtZXNzYWdlIGluIHRoZSBr
ZXJuZWwgbG9nIGlzIGFuZCByZWdhcmRsZXNzIG9mIGhvdyBtYW55IGVycm9yIHN0YXRlcyB5b3UK
PiB3YW50IHRvIGhhbmRsZSwgbGlidmlydCdzIG9ubHkgbGltaXRlZCB0byBlcnJubyBoZXJlLCBz
aW5jZSB3ZSdyZSBnb2luZyB0byBkbwo+IHBsYWluIHJlYWQvd3JpdGUsIHNvIG91ciBpbnRlcm5h
bCBlcnJvciBtZXNzYWdlIHJldHVybmVkIHRvIHRoZSB1c2VyIGlzIG9ubHkKPiBnb2luZyB0byBj
b250YWluIHdoYXQgdGhlIGVycm5vIHNheXMgLSBva2F5LCBvZiBjb3Vyc2Ugd2UgY2FuIChhbmQg
d2UgRE8pCj4gcHJvdmlkZSBsaWJ2aXJ0IHNwZWNpZmljIHN0cmluZywgZnVydGhlciBzcGVjaWZ5
aW5nIHRoZSBlcnJvciBidXQgbGlrZSBJCj4gbWVudGlvbmVkLCBkZXBlbmRpbmcgb24gaG93IG1h
bnkgZXJyb3IgY2FzZXMgd2Ugd2FudCB0byBkaXN0aW5ndWlzaCB0aGlzIG1heSBiZQo+IGhhcmQg
Zm9yIGFueW9uZSB0byBmaWd1cmUgb3V0IHNvbGVseSBvbiB0aGUgZXJyb3IgY29kZSwgYXMgYXBw
cyB3aWxsIG1vc3QKPiBwcm9iYWJseSBub3QgcGFyc2UgdGhlCj4gbG9ncy4KPiAKPiBSZWdhcmRz
LAo+IEVyaWsKaGkgRXJpawpkbyB5b3UgbWVhbiB5b3UgYXJlIGFncmVlaW5nIG9uIGRlZmluaW5n
IGNvbW1vbiBlcnJvcnMgYW5kIG9ubHkgcmV0dXJuaW5nIGVycm5vPwoKZS5nLgojZGVmaW5lIEVO
T01JR1JBVElPTiAgICAgICAgIDE0MCAgLyogZGV2aWNlIG5vdCBzdXBwb3J0aW5nIG1pZ3JhdGlv
biAqLwojZGVmaW5lIEVVTkFUQ0ggICAgICAgICAgICAgIDQ5ICAvKiBzb2Z0d2FyZSB2ZXJzaW9u
IG5vdCBtYXRjaCAqLwojZGVmaW5lIEVIV05NICAgICAgICAgICAgICAgIDE0MiAgLyogaGFyZHdh
cmUgbm90IG1hdGNoaW5nKi8KClRoYW5rcwpZYW4KPiA+Cj4gPiBJZGVhbGx5LCB3ZSdkIHdhbnQg
dG8gaGF2ZSB0aGUgdXNlciBzcGFjZSBwcm9ncmFtIHNldHRpbmcgdXAgdGhpbmdzCj4gPiBxdWVy
eWluZyB0aGUgZ2VuZXJhbCBjb21wYXRpYmlsaXR5IGZvciBtaWdyYXRpb24gKHNvIHRoYXQgaXQg
YmVjb21lcwo+ID4gdGhlaXIgcHJvYmxlbSBvbiBob3cgdG8gYWxlcnQgdGhlIHVzZXIgdG8gcHJv
YmxlbXMgOiksIGJ1dCBJJ20gbm90IHN1cmUKPiA+IGhvdyB0byBlbGltaW5hdGUgdGhlIHJhY2Ug
YmV0d2VlbiBhc2tpbmcgdGhlIHZlbmRvciBkcml2ZXIgZm9yCj4gPiBjb21wYXRpYmlsaXR5IGFu
ZCBnZXR0aW5nIHRoZSByZXN1bHQgb2YgdGhhdCBvcGVyYXRpb24uCj4gPgo+ID4gVW5sZXNzIHdl
IGludHJvZHVjZSBhbiBpbnRlcmZhY2UgdGhhdCBjYW4gcmV0cmlldmUgX2FsbF8gcmVzdWx0cwo+
ID4gdG9nZXRoZXIgd2l0aCB0aGUgd3JpdHRlbiB2YWx1ZT8gT3IgaXMgdGhhdCBub3QgZ29pbmcg
dG8gYmUgbXVjaCBvZiBhCj4gPiBwcm9ibGVtIGluIHByYWN0aWNlPwo+IAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
