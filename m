Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FB24810A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 10:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3889B65;
	Tue, 18 Aug 2020 08:57:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D09189B7D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597741039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPZgXjQb52VhFVEetq2acOCAcagkGxS79k5We/M/mtA=;
 b=gJQ8xE4KOnLKyb4kcVwkczEkeA8cJH0vCQbwbtxt9ugVQum8DJagYsv9n5tGh/O9okt6gL
 LjHklhukmfuZPKzTCJZ2hIAk/3yE0qHlicjKrK001R5/NT/QNJM0v7Gw2z6Gd4U2sZS2HI
 mTlb7goyaC1T85WmSm3TnqjEzObmvlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-hyHtzCccOgKC8v6NfJ3lGw-1; Tue, 18 Aug 2020 04:55:48 -0400
X-MC-Unique: hyHtzCccOgKC8v6NfJ3lGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5AA81F012;
 Tue, 18 Aug 2020 08:55:46 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68EC654596;
 Tue, 18 Aug 2020 08:55:30 +0000 (UTC)
Date: Tue, 18 Aug 2020 09:55:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200818085527.GB20215@redhat.com>
References: <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 eskultet@redhat.com, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MjQ6MzBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzgvMTQg5LiL5Y2IMToxNiwgWWFuIFpoYW8gd3JvdGU6Cj4gPiBPbiBU
aHUsIEF1ZyAxMywgMjAyMCBhdCAxMjoyNDo1MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
ID4gPiBPbiAyMDIwLzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8gd3JvdGU6Cj4gPiA+ID4gPiBk
cml2ZXIgaXMgaXQgaGFuZGxlZCBieT8KPiA+ID4gPiBJdCBsb29rcyB0aGF0IHRoZSBkZXZsaW5r
IGlzIGZvciBuZXR3b3JrIGRldmljZSBzcGVjaWZpYywgYW5kIGluCj4gPiA+ID4gZGV2bGluay5o
LCBpdCBzYXlzCj4gPiA+ID4gaW5jbHVkZS91YXBpL2xpbnV4L2RldmxpbmsuaCAtIE5ldHdvcmsg
cGh5c2ljYWwgZGV2aWNlIE5ldGxpbmsKPiA+ID4gPiBpbnRlcmZhY2UsCj4gPiA+IAo+ID4gPiBB
Y3R1YWxseSBub3QsIEkgdGhpbmsgdGhlcmUgdXNlZCB0byBoYXZlIHNvbWUgZGlzY3Vzc2lvbiBs
YXN0IHllYXIgYW5kIHRoZQo+ID4gPiBjb25jbHVzaW9uIGlzIHRvIHJlbW92ZSB0aGlzIGNvbW1l
bnQuCj4gPiA+IAo+ID4gPiBJdCBzdXBwb3J0cyBJQiBhbmQgcHJvYmFibHkgdkRQQSBpbiB0aGUg
ZnV0dXJlLgo+ID4gPiAKPiA+IGhtbS4uLiBzb3JyeSwgSSBkaWRuJ3QgZmluZCB0aGUgcmVmZXJy
ZWQgZGlzY3Vzc2lvbi4gb25seSBiZWxvdyBkaXNjdXNzaW9uCj4gPiByZWdhcmRpbmcgdG8gd2h5
IHRvIGFkZCBkZXZsaW5rLgo+ID4gCj4gPiBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL25l
dGRldkB2Z2VyLmtlcm5lbC5vcmcvbXNnOTU4MDEuaHRtbAo+ID4gCT5UaGlzIGRvZXNuJ3Qgc2Vl
bSB0byBiZSB0b28gbXVjaCByZWxhdGVkIHRvIG5ldHdvcmtpbmc/IFdoeSBjYW4ndCBzb21ldGhp
bmcKPiA+IAk+bGlrZSB0aGlzIGJlIGluIHN5c2ZzPwo+ID4gCQo+ID4gCUl0IGlzIHJlbGF0ZWQg
dG8gbmV0d29ya2luZyBxdWl0ZSBiaXQuIFRoZXJlIGhhcyBiZWVuIGNvdXBsZSBvZgo+ID4gCWl0
ZXJhdGlvbiBvZiB0aGlzLCBpbmNsdWRpbmcgc3lzZnMgYW5kIGNvbmZpZ2ZzIGltcGxlbWVudGF0
aW9ucy4gVGhlcmUKPiA+IAloYXMgYmVlbiBhIGNvbnNlbnN1cyByZWFjaGVkIHRoYXQgdGhpcyBz
aG91bGQgYmUgZG9uZSBieSBuZXRsaW5rLiBJCj4gPiAJYmVsaWV2ZSBuZXRsaW5rIGlzIHJlYWxs
eSB0aGUgYmVzdCBmb3IgdGhpcyBwdXJwb3NlLiBTeXNmcyBpcyBub3QgYSBnb29kCj4gPiAJaWRl
YQo+IAo+IAo+IFNlZSB0aGUgZGlzY3Vzc2lvbiBoZXJlOgo+IAo+IGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9uZXRkZXYvcGF0Y2gvMjAxOTExMTUyMjMzNTUuMTI3NzEzOS0x
LWplZmZyZXkudC5raXJzaGVyQGludGVsLmNvbS8KPiAKPiAKPiA+IAo+ID4gaHR0cHM6Ly93d3cu
bWFpbC1hcmNoaXZlLmNvbS9uZXRkZXZAdmdlci5rZXJuZWwub3JnL21zZzk2MTAyLmh0bWwKPiA+
IAk+dGhlcmUgaXMgYWxyZWFkeSBhIHdheSB0byBjaGFuZ2UgZXRoL2liIHZpYQo+ID4gCT5lY2hv
ICdldGgnID4gL3N5cy9idXMvcGNpL2RyaXZlcnMvbWx4NF9jb3JlLzAwMDA6MDI6MDAuMC9tbHg0
X3BvcnQxCj4gPiAJPgo+ID4gCT5zb3VuZHMgbGlrZSB0aGlzIGlzIGFub3RoZXIgd2F5IHRvIGFj
aGlldmUgdGhlIHNhbWU/Cj4gPiAJCj4gPiAJSXQgaXMuIEhvd2V2ZXIgdGhlIGN1cnJlbnQgd2F5
IGlzIGRyaXZlci1zcGVjaWZpYywgbm90IGNvcnJlY3QuCj4gPiAJRm9yIG1seDUsIHdlIG5lZWQg
dGhlIHNhbWUsIGl0IGNhbm5vdCBiZSBkb25lIGluIHRoaXMgd2F5LiBEbyBkZXZsaW5rIGlzCj4g
PiAJdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLgo+ID4gCj4gPiBodHRwczovL2x3bi5uZXQvQXJ0aWNs
ZXMvNjc0ODY3Lwo+ID4gCVRoZXJlIGEgaXMgbmVlZCBmb3Igc29tZSB1c2Vyc3BhY2UgQVBJIHRo
YXQgd291bGQgYWxsb3cgdG8gZXhwb3NlIHRoaW5ncwo+ID4gCXRoYXQgYXJlIG5vdCBkaXJlY3Rs
eSByZWxhdGVkIHRvIGFueSBkZXZpY2UgY2xhc3MgbGlrZSBuZXRfZGV2aWNlIG9mCj4gPiAJaWJf
ZGV2aWNlLCBidXQgcmF0aGVyIGNoaXAtd2lkZS9zd2l0Y2gtQVNJQy13aWRlIHN0dWZmLgo+ID4g
Cj4gPiAJVXNlIGNhc2VzOgo+ID4gCTEpIGdldC9zZXQgb2YgcG9ydCB0eXBlIChFdGhlcm5ldC9J
bmZpbmlCYW5kKQo+ID4gCTIpIG1vbml0b3Jpbmcgb2YgaGFyZHdhcmUgbWVzc2FnZXMgdG8gYW5k
IGZyb20gY2hpcAo+ID4gCTMpIHNldHRpbmcgdXAgcG9ydCBzcGxpdHRlcnMgLSBzcGxpdCBwb3J0
IGludG8gbXVsdGlwbGUgb25lcyBhbmQgc3F1YXNoIGFnYWluLAo+ID4gCSAgIGVuYWJsZXMgdXNh
Z2Ugb2Ygc3BsaXR0ZXIgY2FibGUKPiA+IAk0KSBzZXR0aW5nIHVwIHNoYXJlZCBidWZmZXJzIC0g
c2hhcmVkIGFtb25nIG11bHRpcGxlIHBvcnRzIHdpdGhpbiBvbmUgY2hpcAo+ID4gCj4gPiAKPiA+
IAo+ID4gd2UgYWN0dWFsbHkgY2FuIGFsc28gcmV0cmlldmUgdGhlIHNhbWUgaW5mb3JtYXRpb24g
dGhyb3VnaCBzeXNmcywgLmUuZwo+ID4gCj4gPiB8LSBbcGF0aCB0byBkZXZpY2VdCj4gPiAgICB8
LS0tIG1pZ3JhdGlvbgo+ID4gICAgfCAgICAgfC0tLSBzZWxmCj4gPiAgICB8ICAgICB8ICAgfC0t
LWRldmljZV9hcGkKPiA+ICAgIHwJfCAgIHwtLS1tZGV2X3R5cGUKPiA+ICAgIHwJfCAgIHwtLS1z
b2Z0d2FyZV92ZXJzaW9uCj4gPiAgICB8CXwgICB8LS0tZGV2aWNlX2lkCj4gPiAgICB8CXwgICB8
LS0tYWdncmVnYXRvcgo+ID4gICAgfCAgICAgfC0tLSBjb21wYXRpYmxlCj4gPiAgICB8ICAgICB8
ICAgfC0tLWRldmljZV9hcGkKPiA+ICAgIHwJfCAgIHwtLS1tZGV2X3R5cGUKPiA+ICAgIHwJfCAg
IHwtLS1zb2Z0d2FyZV92ZXJzaW9uCj4gPiAgICB8CXwgICB8LS0tZGV2aWNlX2lkCj4gPiAgICB8
CXwgICB8LS0tYWdncmVnYXRvcgo+ID4gCj4gCj4gWWVzIGJ1dDoKPiAKPiAtIFlvdSBuZWVkIG9u
ZSBmaWxlIHBlciBhdHRyaWJ1dGUgKG9uZSBzeXNjYWxsIGZvciBvbmUgYXR0cmlidXRlKQo+IC0g
QXR0cmlidXRlIGlzIGNvdXBsZWQgd2l0aCBrb2JqZWN0Cj4gCj4gQWxsIG9mIGFib3ZlIHNlZW1z
IHVubmVjZXNzYXJ5Lgo+IAo+IEFub3RoZXIgcG9pbnQsIGFzIHdlIGRpc2N1c3NlZCBpbiBhbm90
aGVyIHRocmVhZCwgaXQncyByZWFsbHkgaGFyZCB0byBtYWtlCj4gc3VyZSB0aGUgYWJvdmUgQVBJ
IHdvcmsgZm9yIGFsbCB0eXBlcyBvZiBkZXZpY2VzIGFuZCBmcmFtZXdvcmtzLiBTbyBoYXZpbmcg
YQo+IHZlbmRvciBzcGVjaWZpYyBBUEkgbG9va3MgbXVjaCBiZXR0ZXIuCgpGcm9tIHRoZSBQT1Yg
b2YgdXNlcnNwYWNlIG1nbXQgYXBwcyBkb2luZyBkZXZpY2UgY29tcGF0IGNoZWNraW5nIC8gbWln
cmF0aW9uLAp3ZSBjZXJ0YWlubHkgZG8gTk9UIHdhbnQgdG8gdXNlIGRpZmZlcmVudCB2ZW5kb3Ig
c3BlY2lmaWMgQVBJcy4gV2Ugd2FudCB0bwpoYXZlIGFuIEFQSSB0aGF0IGNhbiBiZSB1c2VkIC8g
Y29udHJvbGxlZCBpbiBhIHN0YW5kYXJkIG1hbm5lciBhY3Jvc3MgdmVuZG9ycy4KCgoKUmVnYXJk
cywKRGFuaWVsCi0tIAp8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczov
L3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9saWJ2aXJ0Lm9y
ZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8
Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0
YWdyYW0uY29tL2RiZXJyYW5nZSA6fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
