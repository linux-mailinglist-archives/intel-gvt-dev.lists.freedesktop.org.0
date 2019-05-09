Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0C18D55
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 May 2019 17:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BED891E7;
	Thu,  9 May 2019 15:49:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034B0891E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 15:49:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CFA953079B73;
 Thu,  9 May 2019 15:49:14 +0000 (UTC)
Received: from work-vm (ovpn-116-174.ams2.redhat.com [10.36.116.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 347CF5B681;
 Thu,  9 May 2019 15:49:00 +0000 (UTC)
Date: Thu, 9 May 2019 16:48:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190509154857.GF2868@work-vm>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
 <20190509173839.2b9b2b46.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509173839.2b9b2b46.cohuck@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 09 May 2019 15:49:15 +0000 (UTC)
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

KiBDb3JuZWxpYSBIdWNrIChjb2h1Y2tAcmVkaGF0LmNvbSkgd3JvdGU6Cj4gT24gVHVlLCA3IE1h
eSAyMDE5IDE1OjE4OjI2IC0wNjAwCj4gQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25A
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBTdW4sICA1IE1heSAyMDE5IDIxOjQ5OjA0IC0w
NDAwCj4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gPiAr
ICBFcnJubzoKPiA+ID4gKyAgSWYgdmVuZG9yIGRyaXZlciB3YW50cyB0byBjbGFpbSBhIG1kZXYg
ZGV2aWNlIGluY29tcGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldgo+ID4gPiArICBkZXZpY2VzLCBp
dCBzaG91bGQgbm90IHJlZ2lzdGVyIHZlcnNpb24gYXR0cmlidXRlIGZvciB0aGlzIG1kZXYgZGV2
aWNlLiBCdXQgaWYKPiA+ID4gKyAgYSB2ZW5kb3IgZHJpdmVyIGhhcyBhbHJlYWR5IHJlZ2lzdGVy
ZWQgdmVyc2lvbiBhdHRyaWJ1dGUgYW5kIGl0IHdhbnRzIHRvIGNsYWltCj4gPiA+ICsgIGEgbWRl
diBkZXZpY2UgaW5jb21wYXRpYmxlIHRvIGFsbCBvdGhlciBtZGV2IGRldmljZXMsIGl0IG5lZWRz
IHRvIHJldHVybgo+ID4gPiArICAtRU5PREVWIG9uIGFjY2VzcyB0byB0aGlzIG1kZXYgZGV2aWNl
J3MgdmVyc2lvbiBhdHRyaWJ1dGUuCj4gPiA+ICsgIElmIGEgbWRldiBkZXZpY2UgaXMgb25seSBp
bmNvbXBhdGlibGUgdG8gY2VydGFpbiBtZGV2IGRldmljZXMsIHdyaXRlIG9mCj4gPiA+ICsgIGlu
Y29tcGF0aWJsZSBtZGV2IGRldmljZXMncyB2ZXJzaW9uIHN0cmluZ3MgdG8gaXRzIHZlcnNpb24g
YXR0cmlidXRlIHNob3VsZAo+ID4gPiArICByZXR1cm4gLUVJTlZBTDsgIAo+ID4gCj4gPiBJIHRo
aW5rIGl0J3MgYmVzdCBub3QgdG8gZGVmaW5lIHRoZSBzcGVjaWZpYyBlcnJubyByZXR1cm5lZCBm
b3IgYQo+ID4gc3BlY2lmaWMgc2l0dWF0aW9uLCBsZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRl
LCB1c2Vyc3BhY2Ugc2ltcGx5Cj4gPiBuZWVkcyB0byBrbm93IHRoYXQgYW4gZXJybm8gb24gcmVh
ZCBpbmRpY2F0ZXMgdGhlIGRldmljZSBkb2VzIG5vdAo+ID4gc3VwcG9ydCBtaWdyYXRpb24gdmVy
c2lvbiBjb21wYXJpc29uIGFuZCB0aGF0IGFuIGVycm5vIG9uIHdyaXRlCj4gPiBpbmRpY2F0ZXMg
dGhlIGRldmljZXMgYXJlIGluY29tcGF0aWJsZSBvciB0aGUgdGFyZ2V0IGRvZXNuJ3Qgc3VwcG9y
dAo+ID4gbWlncmF0aW9uIHZlcnNpb25zLgo+IAo+IEkgdGhpbmsgSSBoYXZlIHRvIGRpc2FncmVl
IGhlcmU6IEl0J3MgcHJvYmFibHkgdmFsdWFibGUgdG8gaGF2ZSBhbgo+IGFncmVlZCBlcnJvciBm
b3IgJ2Nhbm5vdCBtaWdyYXRlIGF0IGFsbCcgdnMgJ2Nhbm5vdCBtaWdyYXRlIGJldHdlZW4KPiB0
aG9zZSB0d28gcGFydGljdWxhciBkZXZpY2VzJy4gVXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gZG8g
ZGlmZmVyZW50Cj4gdGhpbmdzIChlLmcuIHRyeWluZyB3aXRoIGRpZmZlcmVudCBkZXZpY2UgcGFp
cnMpLgoKVHJ5aW5nIHRvIHN0dWZmIHRoZXNlIHRoaW5ncyBkb3duIGFuIGVycm5vIHNlZW1zIGEg
YmFkIGlkZWE7IHdlIGNhbid0CmdldCBtdWNoIGluZm9ybWF0aW9uIHRoYXQgd2F5LgoKRGF2ZQoK
LS0KRHIuIERhdmlkIEFsYW4gR2lsYmVydCAvIGRnaWxiZXJ0QHJlZGhhdC5jb20gLyBNYW5jaGVz
dGVyLCBVSwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
