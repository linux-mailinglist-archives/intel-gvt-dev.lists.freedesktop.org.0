Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E621219AC0
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 May 2019 11:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61BF89A67;
	Fri, 10 May 2019 09:36:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD3789A67
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 May 2019 09:36:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5BCE308FC20;
 Fri, 10 May 2019 09:36:24 +0000 (UTC)
Received: from work-vm (ovpn-117-163.ams2.redhat.com [10.36.117.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 806C858B1;
 Fri, 10 May 2019 09:36:11 +0000 (UTC)
Date: Fri, 10 May 2019 10:36:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190510093608.GD2854@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
 <20190509154857.GF2868@work-vm>
 <20190509175404.512ae7aa.cohuck@redhat.com>
 <20190509164825.GG2868@work-vm>
 <20190510110838.2df4c4d0.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510110838.2df4c4d0.cohuck@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 10 May 2019 09:36:25 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com,
 dinechin@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

KiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gT24gVGh1LCA5IE1h
eSAyMDE5IDE3OjQ4OjI2ICswMTAwCj4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVy
dEByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+ICogQ29ybmVsaWEgSHVjayAoY29odWNrQHJlZGhh
dC5jb20pIHdyb3RlOgo+ID4gPiBPbiBUaHUsIDkgTWF5IDIwMTkgMTY6NDg6NTcgKzAxMDAKPiA+
ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gICAKPiA+ID4gPiAqIENvcm5lbGlhIEh1Y2sgKGNvaHVja0ByZWRoYXQuY29tKSB3cm90
ZTogIAo+ID4gPiA+ID4gT24gVHVlLCA3IE1heSAyMDE5IDE1OjE4OjI2IC0wNjAwCj4gPiA+ID4g
PiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToKPiA+
ID4gPiA+ICAgICAKPiA+ID4gPiA+ID4gT24gU3VuLCAgNSBNYXkgMjAxOSAyMTo0OTowNCAtMDQw
MAo+ID4gPiA+ID4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOiAgICAK
PiA+ID4gPiA+ICAgICAKPiA+ID4gPiA+ID4gPiArICBFcnJubzoKPiA+ID4gPiA+ID4gPiArICBJ
ZiB2ZW5kb3IgZHJpdmVyIHdhbnRzIHRvIGNsYWltIGEgbWRldiBkZXZpY2UgaW5jb21wYXRpYmxl
IHRvIGFsbCBvdGhlciBtZGV2Cj4gPiA+ID4gPiA+ID4gKyAgZGV2aWNlcywgaXQgc2hvdWxkIG5v
dCByZWdpc3RlciB2ZXJzaW9uIGF0dHJpYnV0ZSBmb3IgdGhpcyBtZGV2IGRldmljZS4gQnV0IGlm
Cj4gPiA+ID4gPiA+ID4gKyAgYSB2ZW5kb3IgZHJpdmVyIGhhcyBhbHJlYWR5IHJlZ2lzdGVyZWQg
dmVyc2lvbiBhdHRyaWJ1dGUgYW5kIGl0IHdhbnRzIHRvIGNsYWltCj4gPiA+ID4gPiA+ID4gKyAg
YSBtZGV2IGRldmljZSBpbmNvbXBhdGlibGUgdG8gYWxsIG90aGVyIG1kZXYgZGV2aWNlcywgaXQg
bmVlZHMgdG8gcmV0dXJuCj4gPiA+ID4gPiA+ID4gKyAgLUVOT0RFViBvbiBhY2Nlc3MgdG8gdGhp
cyBtZGV2IGRldmljZSdzIHZlcnNpb24gYXR0cmlidXRlLgo+ID4gPiA+ID4gPiA+ICsgIElmIGEg
bWRldiBkZXZpY2UgaXMgb25seSBpbmNvbXBhdGlibGUgdG8gY2VydGFpbiBtZGV2IGRldmljZXMs
IHdyaXRlIG9mCj4gPiA+ID4gPiA+ID4gKyAgaW5jb21wYXRpYmxlIG1kZXYgZGV2aWNlcydzIHZl
cnNpb24gc3RyaW5ncyB0byBpdHMgdmVyc2lvbiBhdHRyaWJ1dGUgc2hvdWxkCj4gPiA+ID4gPiA+
ID4gKyAgcmV0dXJuIC1FSU5WQUw7ICAgICAgCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIHRo
aW5rIGl0J3MgYmVzdCBub3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBlcnJubyByZXR1cm5lZCBm
b3IgYQo+ID4gPiA+ID4gPiBzcGVjaWZpYyBzaXR1YXRpb24sIGxldCB0aGUgdmVuZG9yIGRyaXZl
ciBkZWNpZGUsIHVzZXJzcGFjZSBzaW1wbHkKPiA+ID4gPiA+ID4gbmVlZHMgdG8ga25vdyB0aGF0
IGFuIGVycm5vIG9uIHJlYWQgaW5kaWNhdGVzIHRoZSBkZXZpY2UgZG9lcyBub3QKPiA+ID4gPiA+
ID4gc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29uIGFuZCB0aGF0IGFuIGVycm5v
IG9uIHdyaXRlCj4gPiA+ID4gPiA+IGluZGljYXRlcyB0aGUgZGV2aWNlcyBhcmUgaW5jb21wYXRp
YmxlIG9yIHRoZSB0YXJnZXQgZG9lc24ndCBzdXBwb3J0Cj4gPiA+ID4gPiA+IG1pZ3JhdGlvbiB2
ZXJzaW9ucy4gICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgdGhpbmsgSSBoYXZlIHRvIGRpc2Fn
cmVlIGhlcmU6IEl0J3MgcHJvYmFibHkgdmFsdWFibGUgdG8gaGF2ZSBhbgo+ID4gPiA+ID4gYWdy
ZWVkIGVycm9yIGZvciAnY2Fubm90IG1pZ3JhdGUgYXQgYWxsJyB2cyAnY2Fubm90IG1pZ3JhdGUg
YmV0d2Vlbgo+ID4gPiA+ID4gdGhvc2UgdHdvIHBhcnRpY3VsYXIgZGV2aWNlcycuIFVzZXJzcGFj
ZSBtaWdodCB3YW50IHRvIGRvIGRpZmZlcmVudAo+ID4gPiA+ID4gdGhpbmdzIChlLmcuIHRyeWlu
ZyB3aXRoIGRpZmZlcmVudCBkZXZpY2UgcGFpcnMpLiAgICAKPiA+ID4gPiAKPiA+ID4gPiBUcnlp
bmcgdG8gc3R1ZmYgdGhlc2UgdGhpbmdzIGRvd24gYW4gZXJybm8gc2VlbXMgYSBiYWQgaWRlYTsg
d2UgY2FuJ3QKPiA+ID4gPiBnZXQgbXVjaCBpbmZvcm1hdGlvbiB0aGF0IHdheS4gIAo+ID4gPiAK
PiA+ID4gU28sIHdoYXQgd291bGQgYmUgYSByZWFzb25hYmxlIGFwcHJvYWNoPyBVc2Vyc3BhY2Ug
c2hvdWxkIGZpcnN0IHJlYWQKPiA+ID4gdGhlIHZlcnNpb24gYXR0cmlidXRlcyBvbiBib3RoIGRl
dmljZXMgKHRvIGZpbmQgb3V0IHdoZXRoZXIgbWlncmF0aW9uCj4gPiA+IGlzIHN1cHBvcnRlZCBh
dCBhbGwpLCBhbmQgb25seSB0aGVuIGZpZ3VyZSBvdXQgdmlhIHdyaXRpbmcgd2hldGhlciB0aGV5
Cj4gPiA+IGFyZSBjb21wYXRpYmxlPwo+ID4gPiAKPiA+ID4gKE9yIGp1c3QgZ28gYWhlYWQgYW5k
IHRyeSwgaWYgaXQgZG9lcyBub3QgY2FyZSBhYm91dCB0aGUgcmVhc29uLikgIAo+ID4gCj4gPiBX
ZWxsLCBJJ20gT0sgd2l0aCBzb21ldGhpbmcgbGlrZSB3cml0aW5nIHRvIHRlc3Qgd2hldGhlciBp
dCdzCj4gPiBjb21wYXRpYmxlLCBpdCdzIGp1c3Qgd2UgbmVlZCBhIGJldHRlciB3YXkgb2Ygc2F5
aW5nICdubycuCj4gPiBJJ20gbm90IHN1cmUgaWYgdGhhdCBpbnZvbHZlcyByZWFkaW5nIGJhY2sg
ZnJvbSBzb21ld2hlcmUgYWZ0ZXIKPiA+IHRoZSB3cml0ZSBvciB3aGF0Lgo+IAo+IEhtLCBzbyBJ
IGJhc2ljYWxseSBzZWUgdHdvIHdheXMgb2YgZG9pbmcgdGhhdDoKPiAtIHN0YW5kYXJkaXplIG9u
IHNvbWUgZXJyb3IgY29kZXMuLi4gcHJvYmxlbTogZXJyb3IgY29kZXMgY2FuIGJlIGhhcmQKPiAg
IHRvIGZpdCB0byByZWFzb25zCj4gLSBtYWtlIHRoZSBlcnJvciBhdmFpbGFibGUgaW4gc29tZSBh
dHRyaWJ1dGUgdGhhdCBjYW4gYmUgcmVhZAo+IAo+IEknbSBub3Qgc3VyZSBob3cgd2UgY2FuIHNl
cmlhbGl6ZSB0aGUgcmVhZGJhY2sgd2l0aCB0aGUgbGFzdCB3cml0ZSwKPiB0aG91Z2ggKHRoaXMg
bG9va3MgaW5oZXJlbnRseSByYWN5KS4KPiAKPiBIb3cgaW1wb3J0YW50IGlzIGRldGFpbGVkIGVy
cm9yIHJlcG9ydGluZyBoZXJlPwoKSSB0aGluayB3ZSBuZWVkIHNvbWV0aGluZywgb3RoZXJ3aXNl
IHdlJ3JlIGp1c3QgZ29pbmcgdG8gZ2V0IHZhZ3VlCnVzZXIgcmVwb3J0cyBvZiAnYnV0IG15IFZN
IGRvZXNuJ3QgbWlncmF0ZSc7IEknZCBsaWtlIHRoZSBlcnJvciB0byBiZQpnb29kIGVub3VnaCB0
byBwb2ludCBtb3N0IHVzZXJzIHRvIHNvbWV0aGluZyB0aGV5IGNhbiB1bmRlcnN0YW5kCihlLmcu
IHdyb25nIGNhcmQgZmFtaWx5L3RvbyBvbGQgYSBkcml2ZXIgZXRjKS4KCkRhdmUKCi0tCkRyLiBE
YXZpZCBBbGFuIEdpbGJlcnQgLyBkZ2lsYmVydEByZWRoYXQuY29tIC8gTWFuY2hlc3RlciwgVUsK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
