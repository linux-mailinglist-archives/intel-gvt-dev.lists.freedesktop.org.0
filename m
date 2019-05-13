Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF71AEB3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 May 2019 03:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B6C893A7;
	Mon, 13 May 2019 01:22:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E15893A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 May 2019 01:22:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 May 2019 18:22:09 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2019 18:22:05 -0700
Date: Sun, 12 May 2019 21:16:26 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190513011626.GI24397@joy-OptiPlex-7040>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510114838.7e16c3d6.cohuck@redhat.com>
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

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDU6NDg6MzhQTSArMDgwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBGcmksIDEwIE1heSAyMDE5IDEwOjM2OjA5ICswMTAwCj4gIkRyLiBEYXZpZCBB
bGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+ICogQ29ybmVs
aWEgSHVjayAoY29odWNrQHJlZGhhdC5jb20pIHdyb3RlOgo+ID4gPiBPbiBUaHUsIDkgTWF5IDIw
MTkgMTc6NDg6MjYgKzAxMDAKPiA+ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVy
dEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gICAKPiA+ID4gPiAqIENvcm5lbGlhIEh1Y2sgKGNv
aHVja0ByZWRoYXQuY29tKSB3cm90ZTogIAo+ID4gPiA+ID4gT24gVGh1LCA5IE1heSAyMDE5IDE2
OjQ4OjU3ICswMTAwCj4gPiA+ID4gPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gICAgIAo+ID4gPiA+ID4gPiAqIENvcm5lbGlh
IEh1Y2sgKGNvaHVja0ByZWRoYXQuY29tKSB3cm90ZTogICAgCj4gPiA+ID4gPiA+ID4gT24gVHVl
LCA3IE1heSAyMDE5IDE1OjE4OjI2IC0wNjAwCj4gPiA+ID4gPiA+ID4gQWxleCBXaWxsaWFtc29u
IDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gICAgICAg
Cj4gPiA+ID4gPiA+ID4gPiBPbiBTdW4sICA1IE1heSAyMDE5IDIxOjQ5OjA0IC0wNDAwCj4gPiA+
ID4gPiA+ID4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOiAgICAgIAo+
ID4gPiA+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gPiArICBFcnJubzoKPiA+ID4gPiA+
ID4gPiA+ID4gKyAgSWYgdmVuZG9yIGRyaXZlciB3YW50cyB0byBjbGFpbSBhIG1kZXYgZGV2aWNl
IGluY29tcGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldgo+ID4gPiA+ID4gPiA+ID4gPiArICBkZXZp
Y2VzLCBpdCBzaG91bGQgbm90IHJlZ2lzdGVyIHZlcnNpb24gYXR0cmlidXRlIGZvciB0aGlzIG1k
ZXYgZGV2aWNlLiBCdXQgaWYKPiA+ID4gPiA+ID4gPiA+ID4gKyAgYSB2ZW5kb3IgZHJpdmVyIGhh
cyBhbHJlYWR5IHJlZ2lzdGVyZWQgdmVyc2lvbiBhdHRyaWJ1dGUgYW5kIGl0IHdhbnRzIHRvIGNs
YWltCj4gPiA+ID4gPiA+ID4gPiA+ICsgIGEgbWRldiBkZXZpY2UgaW5jb21wYXRpYmxlIHRvIGFs
bCBvdGhlciBtZGV2IGRldmljZXMsIGl0IG5lZWRzIHRvIHJldHVybgo+ID4gPiA+ID4gPiA+ID4g
PiArICAtRU5PREVWIG9uIGFjY2VzcyB0byB0aGlzIG1kZXYgZGV2aWNlJ3MgdmVyc2lvbiBhdHRy
aWJ1dGUuCj4gPiA+ID4gPiA+ID4gPiA+ICsgIElmIGEgbWRldiBkZXZpY2UgaXMgb25seSBpbmNv
bXBhdGlibGUgdG8gY2VydGFpbiBtZGV2IGRldmljZXMsIHdyaXRlIG9mCj4gPiA+ID4gPiA+ID4g
PiA+ICsgIGluY29tcGF0aWJsZSBtZGV2IGRldmljZXMncyB2ZXJzaW9uIHN0cmluZ3MgdG8gaXRz
IHZlcnNpb24gYXR0cmlidXRlIHNob3VsZAo+ID4gPiA+ID4gPiA+ID4gPiArICByZXR1cm4gLUVJ
TlZBTDsgICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBJIHRoaW5rIGl0
J3MgYmVzdCBub3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBlcnJubyByZXR1cm5lZCBmb3IgYQo+
ID4gPiA+ID4gPiA+ID4gc3BlY2lmaWMgc2l0dWF0aW9uLCBsZXQgdGhlIHZlbmRvciBkcml2ZXIg
ZGVjaWRlLCB1c2Vyc3BhY2Ugc2ltcGx5Cj4gPiA+ID4gPiA+ID4gPiBuZWVkcyB0byBrbm93IHRo
YXQgYW4gZXJybm8gb24gcmVhZCBpbmRpY2F0ZXMgdGhlIGRldmljZSBkb2VzIG5vdAo+ID4gPiA+
ID4gPiA+ID4gc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29uIGFuZCB0aGF0IGFu
IGVycm5vIG9uIHdyaXRlCj4gPiA+ID4gPiA+ID4gPiBpbmRpY2F0ZXMgdGhlIGRldmljZXMgYXJl
IGluY29tcGF0aWJsZSBvciB0aGUgdGFyZ2V0IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gPiA+ID4gPiA+
ID4gbWlncmF0aW9uIHZlcnNpb25zLiAgICAgIAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
IEkgdGhpbmsgSSBoYXZlIHRvIGRpc2FncmVlIGhlcmU6IEl0J3MgcHJvYmFibHkgdmFsdWFibGUg
dG8gaGF2ZSBhbgo+ID4gPiA+ID4gPiA+IGFncmVlZCBlcnJvciBmb3IgJ2Nhbm5vdCBtaWdyYXRl
IGF0IGFsbCcgdnMgJ2Nhbm5vdCBtaWdyYXRlIGJldHdlZW4KPiA+ID4gPiA+ID4gPiB0aG9zZSB0
d28gcGFydGljdWxhciBkZXZpY2VzJy4gVXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gZG8gZGlmZmVy
ZW50Cj4gPiA+ID4gPiA+ID4gdGhpbmdzIChlLmcuIHRyeWluZyB3aXRoIGRpZmZlcmVudCBkZXZp
Y2UgcGFpcnMpLiAgICAgIAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVHJ5aW5nIHRvIHN0dWZm
IHRoZXNlIHRoaW5ncyBkb3duIGFuIGVycm5vIHNlZW1zIGEgYmFkIGlkZWE7IHdlIGNhbid0Cj4g
PiA+ID4gPiA+IGdldCBtdWNoIGluZm9ybWF0aW9uIHRoYXQgd2F5LiAgICAKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gU28sIHdoYXQgd291bGQgYmUgYSByZWFzb25hYmxlIGFwcHJvYWNoPyBVc2Vyc3Bh
Y2Ugc2hvdWxkIGZpcnN0IHJlYWQKPiA+ID4gPiA+IHRoZSB2ZXJzaW9uIGF0dHJpYnV0ZXMgb24g
Ym90aCBkZXZpY2VzICh0byBmaW5kIG91dCB3aGV0aGVyIG1pZ3JhdGlvbgo+ID4gPiA+ID4gaXMg
c3VwcG9ydGVkIGF0IGFsbCksIGFuZCBvbmx5IHRoZW4gZmlndXJlIG91dCB2aWEgd3JpdGluZyB3
aGV0aGVyIHRoZXkKPiA+ID4gPiA+IGFyZSBjb21wYXRpYmxlPwo+ID4gPiA+ID4gCj4gPiA+ID4g
PiAoT3IganVzdCBnbyBhaGVhZCBhbmQgdHJ5LCBpZiBpdCBkb2VzIG5vdCBjYXJlIGFib3V0IHRo
ZSByZWFzb24uKSAgICAKPiA+ID4gPiAKPiA+ID4gPiBXZWxsLCBJJ20gT0sgd2l0aCBzb21ldGhp
bmcgbGlrZSB3cml0aW5nIHRvIHRlc3Qgd2hldGhlciBpdCdzCj4gPiA+ID4gY29tcGF0aWJsZSwg
aXQncyBqdXN0IHdlIG5lZWQgYSBiZXR0ZXIgd2F5IG9mIHNheWluZyAnbm8nLgo+ID4gPiA+IEkn
bSBub3Qgc3VyZSBpZiB0aGF0IGludm9sdmVzIHJlYWRpbmcgYmFjayBmcm9tIHNvbWV3aGVyZSBh
ZnRlcgo+ID4gPiA+IHRoZSB3cml0ZSBvciB3aGF0LiAgCj4gPiA+IAo+ID4gPiBIbSwgc28gSSBi
YXNpY2FsbHkgc2VlIHR3byB3YXlzIG9mIGRvaW5nIHRoYXQ6Cj4gPiA+IC0gc3RhbmRhcmRpemUg
b24gc29tZSBlcnJvciBjb2Rlcy4uLiBwcm9ibGVtOiBlcnJvciBjb2RlcyBjYW4gYmUgaGFyZAo+
ID4gPiAgIHRvIGZpdCB0byByZWFzb25zCj4gPiA+IC0gbWFrZSB0aGUgZXJyb3IgYXZhaWxhYmxl
IGluIHNvbWUgYXR0cmlidXRlIHRoYXQgY2FuIGJlIHJlYWQKPiA+ID4gCj4gPiA+IEknbSBub3Qg
c3VyZSBob3cgd2UgY2FuIHNlcmlhbGl6ZSB0aGUgcmVhZGJhY2sgd2l0aCB0aGUgbGFzdCB3cml0
ZSwKPiA+ID4gdGhvdWdoICh0aGlzIGxvb2tzIGluaGVyZW50bHkgcmFjeSkuCj4gPiA+IAo+ID4g
PiBIb3cgaW1wb3J0YW50IGlzIGRldGFpbGVkIGVycm9yIHJlcG9ydGluZyBoZXJlPyAgCj4gPiAK
PiA+IEkgdGhpbmsgd2UgbmVlZCBzb21ldGhpbmcsIG90aGVyd2lzZSB3ZSdyZSBqdXN0IGdvaW5n
IHRvIGdldCB2YWd1ZQo+ID4gdXNlciByZXBvcnRzIG9mICdidXQgbXkgVk0gZG9lc24ndCBtaWdy
YXRlJzsgSSdkIGxpa2UgdGhlIGVycm9yIHRvIGJlCj4gPiBnb29kIGVub3VnaCB0byBwb2ludCBt
b3N0IHVzZXJzIHRvIHNvbWV0aGluZyB0aGV5IGNhbiB1bmRlcnN0YW5kCj4gPiAoZS5nLiB3cm9u
ZyBjYXJkIGZhbWlseS90b28gb2xkIGEgZHJpdmVyIGV0YykuCj4gCj4gT2ssIHRoYXQgc291bmRz
IGxpa2UgYSByZWFzb25hYmxlIHBvaW50LiBOb3QgdGhhdCBJIGhhdmUgYSBiZXR0ZXIgaWRlYQo+
IGhvdyB0byBhY2hpZXZlIHRoYXQsIHRob3VnaC4uLiB3ZSBjb3VsZCBhbHNvIGxvZyBhIG1vcmUg
dmVyYm9zZSBlcnJvcgo+IG1lc3NhZ2UgdG8gdGhlIGtlcm5lbCBsb2csIGJ1dCB0aGF0J3Mgbm90
IG5lY2Vzc2FyaWx5IHdoZXJlIGEgdXNlciB3aWxsCj4gbG9vayBmaXJzdC4KPiAKPiBJZGVhbGx5
LCB3ZSdkIHdhbnQgdG8gaGF2ZSB0aGUgdXNlciBzcGFjZSBwcm9ncmFtIHNldHRpbmcgdXAgdGhp
bmdzCj4gcXVlcnlpbmcgdGhlIGdlbmVyYWwgY29tcGF0aWJpbGl0eSBmb3IgbWlncmF0aW9uIChz
byB0aGF0IGl0IGJlY29tZXMKPiB0aGVpciBwcm9ibGVtIG9uIGhvdyB0byBhbGVydCB0aGUgdXNl
ciB0byBwcm9ibGVtcyA6KSwgYnV0IEknbSBub3Qgc3VyZQo+IGhvdyB0byBlbGltaW5hdGUgdGhl
IHJhY2UgYmV0d2VlbiBhc2tpbmcgdGhlIHZlbmRvciBkcml2ZXIgZm9yCj4gY29tcGF0aWJpbGl0
eSBhbmQgZ2V0dGluZyB0aGUgcmVzdWx0IG9mIHRoYXQgb3BlcmF0aW9uLgo+IAo+IFVubGVzcyB3
ZSBpbnRyb2R1Y2UgYW4gaW50ZXJmYWNlIHRoYXQgY2FuIHJldHJpZXZlIF9hbGxfIHJlc3VsdHMK
PiB0b2dldGhlciB3aXRoIHRoZSB3cml0dGVuIHZhbHVlPyBPciBpcyB0aGF0IG5vdCBnb2luZyB0
byBiZSBtdWNoIG9mIGEKPiBwcm9ibGVtIGluIHByYWN0aWNlPwp3aGF0IGFib3V0IGRlZmluaW5n
IGEgbWlncmF0aW9uX2Vycm9ycyBhdHRyaWJ1dGUsIHN0b3JpbmcgcmVjZW50IDEwIGVycm9yCnJl
Y29yZHMgd2l0aCBmb3JtYXQgbGlrZToKICAgIGlucHV0IHN0cmluZzogZXJyb3IKYXMgaWRlbnRp
Y2FsIGlucHV0IHN0cmluZ3MgYWx3YXlzIGhhdmUgdGhlIHNhbWUgZXJyb3Igc3RyaW5nLCB0aGUg
MTAgZXJyb3IKcmVjb3JkcyBtYXkgbWVldCAxMCsgcmVhc29uIHF1ZXJ5aW5nIG9wZXJhdGlvbnMu
IEFuZCBpbiBwcmFjdGljZSwgSSB0aGluayB0aGVyZQp3b3VsZG4ndCBiZSAxMCBzaW11bHRhbmVv
dXMgbWlncmF0aW9uIHJlcXVlc3RzPwoKb3IgY291bGQgd2UganVzdCBkZWZpbmUgc29tZSBjb21t
b24gZXJybm8/IGxpa2UgCiNkZWZpbmUgRU5PTUlHUkFUSU9OICAgICAgICAgMTQwICAvKiBkZXZp
Y2Ugbm90IHN1cHBvcnRpbmcgbWlncmF0aW9uICovCiNkZWZpbmUgRVVOQVRDSCAgICAgICAgICAg
ICAgNDkgIC8qIHNvZnR3YXJlIHZlcnNpb24gbm90IG1hdGNoICovCiNkZWZpbmUgRUhXTk0gICAg
ICAgICAgICAgICAgMTQyICAvKiBoYXJkd2FyZSBub3QgbWF0Y2hpbmcqLwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
