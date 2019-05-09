Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D418D12
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 May 2019 17:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06F2892E5;
	Thu,  9 May 2019 15:39:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C431789DC9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 15:38:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ACEFF307D9CE;
 Thu,  9 May 2019 15:38:56 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8403279B9;
 Thu,  9 May 2019 15:38:41 +0000 (UTC)
Date: Thu, 9 May 2019 17:38:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190509173839.2b9b2b46.cohuck@redhat.com>
In-Reply-To: <20190507151826.502be009@x1.home>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 09 May 2019 15:38:59 +0000 (UTC)
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
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, dinechin@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCA3IE1heSAyMDE5IDE1OjE4OjI2IC0wNjAwCkFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOgoKPiBPbiBTdW4sICA1IE1heSAyMDE5IDIxOjQ5
OjA0IC0wNDAwCj4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKCj4gPiAr
ICBFcnJubzoKPiA+ICsgIElmIHZlbmRvciBkcml2ZXIgd2FudHMgdG8gY2xhaW0gYSBtZGV2IGRl
dmljZSBpbmNvbXBhdGlibGUgdG8gYWxsIG90aGVyIG1kZXYKPiA+ICsgIGRldmljZXMsIGl0IHNo
b3VsZCBub3QgcmVnaXN0ZXIgdmVyc2lvbiBhdHRyaWJ1dGUgZm9yIHRoaXMgbWRldiBkZXZpY2Uu
IEJ1dCBpZgo+ID4gKyAgYSB2ZW5kb3IgZHJpdmVyIGhhcyBhbHJlYWR5IHJlZ2lzdGVyZWQgdmVy
c2lvbiBhdHRyaWJ1dGUgYW5kIGl0IHdhbnRzIHRvIGNsYWltCj4gPiArICBhIG1kZXYgZGV2aWNl
IGluY29tcGF0aWJsZSB0byBhbGwgb3RoZXIgbWRldiBkZXZpY2VzLCBpdCBuZWVkcyB0byByZXR1
cm4KPiA+ICsgIC1FTk9ERVYgb24gYWNjZXNzIHRvIHRoaXMgbWRldiBkZXZpY2UncyB2ZXJzaW9u
IGF0dHJpYnV0ZS4KPiA+ICsgIElmIGEgbWRldiBkZXZpY2UgaXMgb25seSBpbmNvbXBhdGlibGUg
dG8gY2VydGFpbiBtZGV2IGRldmljZXMsIHdyaXRlIG9mCj4gPiArICBpbmNvbXBhdGlibGUgbWRl
diBkZXZpY2VzJ3MgdmVyc2lvbiBzdHJpbmdzIHRvIGl0cyB2ZXJzaW9uIGF0dHJpYnV0ZSBzaG91
bGQKPiA+ICsgIHJldHVybiAtRUlOVkFMOyAgCj4gCj4gSSB0aGluayBpdCdzIGJlc3Qgbm90IHRv
IGRlZmluZSB0aGUgc3BlY2lmaWMgZXJybm8gcmV0dXJuZWQgZm9yIGEKPiBzcGVjaWZpYyBzaXR1
YXRpb24sIGxldCB0aGUgdmVuZG9yIGRyaXZlciBkZWNpZGUsIHVzZXJzcGFjZSBzaW1wbHkKPiBu
ZWVkcyB0byBrbm93IHRoYXQgYW4gZXJybm8gb24gcmVhZCBpbmRpY2F0ZXMgdGhlIGRldmljZSBk
b2VzIG5vdAo+IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNpb24gY29tcGFyaXNvbiBhbmQgdGhhdCBh
biBlcnJubyBvbiB3cml0ZQo+IGluZGljYXRlcyB0aGUgZGV2aWNlcyBhcmUgaW5jb21wYXRpYmxl
IG9yIHRoZSB0YXJnZXQgZG9lc24ndCBzdXBwb3J0Cj4gbWlncmF0aW9uIHZlcnNpb25zLgoKSSB0
aGluayBJIGhhdmUgdG8gZGlzYWdyZWUgaGVyZTogSXQncyBwcm9iYWJseSB2YWx1YWJsZSB0byBo
YXZlIGFuCmFncmVlZCBlcnJvciBmb3IgJ2Nhbm5vdCBtaWdyYXRlIGF0IGFsbCcgdnMgJ2Nhbm5v
dCBtaWdyYXRlIGJldHdlZW4KdGhvc2UgdHdvIHBhcnRpY3VsYXIgZGV2aWNlcycuIFVzZXJzcGFj
ZSBtaWdodCB3YW50IHRvIGRvIGRpZmZlcmVudAp0aGluZ3MgKGUuZy4gdHJ5aW5nIHdpdGggZGlm
ZmVyZW50IGRldmljZSBwYWlycykuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
