Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B3963A2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Aug 2019 17:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E266C6E40E;
	Tue, 20 Aug 2019 15:03:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DEC6E40E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Aug 2019 15:03:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8662C047B6E;
 Tue, 20 Aug 2019 15:03:30 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F05118220;
 Tue, 20 Aug 2019 15:03:27 +0000 (UTC)
Date: Tue, 20 Aug 2019 09:03:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: Re: [PATCH v5 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190820090327.27cfb414@x1.home>
In-Reply-To: <20190820072030.kgjjiysxgs3yj25j@sirius.home.kraxel.org>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <20190816023528.30210-3-tina.zhang@intel.com>
 <20190816145148.307408dc@x1.home>
 <237F54289DF84E4997F34151298ABEBC876F9AD3@SHSMSX101.ccr.corp.intel.com>
 <20190820072030.kgjjiysxgs3yj25j@sirius.home.kraxel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 20 Aug 2019 15:03:30 +0000 (UTC)
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, "Zhang, Tina" <tina.zhang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwOToyMDozMCArMDIwMAoia3JheGVsQHJlZGhhdC5jb20iIDxr
cmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+ID4gPiA+ICsjZGVmaW5lIFZGSU9fSVJRX1RZUEVf
R0ZYCQkJCSgxKQo+ID4gPiA+ICsvKgo+ID4gPiA+ICsgKiB2R1BVIHZlbmRvciBzdWItdHlwZQo+
ID4gPiA+ICsgKiB2R1BVIGRldmljZSBkaXNwbGF5IHJlbGF0ZWQgaW50ZXJydXB0cyBlLmcuIHZi
bGFuay9wYWdlZmxpcCAgKi8KPiA+ID4gPiArI2RlZmluZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9E
SVNQTEFZX0lSUQkJKDEpICAKPiA+ID4gCj4gPiA+IElmIHRoaXMgaXMgYSBHRlgvRElTUExBWSBJ
UlEsIHdoeSBhcmUgd2UgdGFsa2luZyBhYm91dCBhICJ2R1BVIiBpbiB0aGUKPiA+ID4gZGVzY3Jp
cHRpb24/ICBJdCdzIG5vdCBzcGVjaWZpYyB0byBhIHZHUFUgaW1wbGVtZW50YXRpb24sIHJpZ2h0
PyAgSXMgdGhpcwo+ID4gPiByZWxhdGVkIHRvIGEgcGh5c2ljYWwgZGlzcGxheSBvciBhIHZpcnR1
YWwgZGlzcGxheT8gIElmIGl0J3MgcmVsYXRlZCB0byB0aGUgR0ZYCj4gPiA+IFBMQU5FIGlvY3Rs
cywgaXQgc2hvdWxkIHN0YXRlIHRoYXQuICBJdCdzIG5vdCB3ZWxsIHNwZWNpZmllZCB3aGF0IHRo
aXMgaW50ZXJydXB0Cj4gPiA+IHNpZ25hbHMuICBJcyBpdCB2Ymxhbms/ICBJcyBpdCBwYWdlZmxp
cD8KPiA+ID4gSXMgaXQgYm90aD8gIE5laXRoZXI/ICBTb21ldGhpbmcgZWxzZT8gIAo+ID4gCj4g
PiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiBjYXVzZWQgaGVyZS4gCj4gPiAKPiA+IFRoZSBvcmln
aW5hbCBpZGVhIGhlcmUgd2FzIHRvIHVzZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lS
USB0bwo+ID4gbm90aWZ5IHVzZXIgc3BhY2Ugd2l0aCB0aGUgZGlzcGxheSByZWZyZXNoIGV2ZW50
LiBUaGUgZGlzcGxheSByZWZyZXNoCj4gPiBldmVudCBpcyBnZW5lcmFsLiBXaGVuIG5vdGlmaWVk
LCB1c2VyIHNwYWNlIGNhbiB1c2UKPiA+IFZGSU9fREVWSUNFX1FVRVJZX0dGWF9QTEFORSBhbmQg
VkZJT19ERVZJQ0VfR0VUX0dGWF9ETUFCVUYgdG8gZ2V0IHRoZQo+ID4gdXBkYXRlZCBmcmFtZWJ1
ZmZlciwgaW5zdGVhZCBvZiBwb2xsaW5nIHRoZW0gYWxsIHRoZSB0aW1lLgo+ID4gCj4gPiBJbiBv
cmRlciB0byBnaXZlIHVzZXIgc3BhY2UgbW9yZSBjaG9pY2UgdG8gZG8gdGhlIG9wdGltaXphdGlv
biwKPiA+IHZmaW9faXJxX2luZm9fY2FwX2Rpc3BsYXlfcGxhbmVfZXZlbnRzIGlzIHByb3Bvc2Vk
IHRvIHRlbGwgdXNlciBzcGFjZQo+ID4gdGhlIGRpZmZlcmVudCBwbGFuZSByZWZyZXNoIGV2ZW50
IHZhbHVlcy4gU28gd2hlbiBub3RpZmllZCBieQo+ID4gVkZJT19JUlFfU1VCVFlQRV9HRlhfRElT
UExBWV9JUlEsIHVzZXIgc3BhY2UgY2FuIGdldCB0aGUgdmFsdWUgb2YgdGhlCj4gPiBldmVudGZk
IGNvdW50ZXIgYW5kIHVuZGVyc3RhbmQgd2hpY2ggcGxhbmUgdGhlIGV2ZW50IHJlZnJlc2ggZXZl
bnQKPiA+IGNvbWVzIGZyb20gYW5kIGNob29zZSB0byBnZXQgdGhlIGZyYW1lYnVmZmVyIG9uIHRo
YXQgcGxhbmUgaW5zdGVhZCBvZgo+ID4gYWxsIHRoZSBwbGFuZXMuCj4gPiAKPiA+IFNvLCBmcm9t
IHRoZSBWRklPIHVzZXIgcG9pbnQgb2YgdmlldywgdGhlcmUgaXMgb25seSB0aGUgZGlzcGxheQo+
ID4gcmVmcmVzaCBldmVudCAoaS5lLiBubyBvdGhlciBldmVudHMgbGlrZSB2YmxhbmssIHBhZ2Vm
bGlwIC4uLikuIEZvcgo+ID4gR1RWLWcsIHRoaXMgZGlzcGxheSByZWZyZXNoIGV2ZW50IGlzIGlt
cGxlbWVudGVkIGJ5IGJvdGggdmJsYW5rIGFuZAo+ID4gcGFnZWZsaXAsIHdoaWNoIGlzIG9ubHkg
dGhlIGltcGxlbWVudGF0aW9uIHRoaW5nIGFuZCBjYW4gYmUKPiA+IHRyYW5zcGFyZW50IHRvIHRo
ZSB1c2VyIHNwYWNlLiBBZ2FpbiBzb3JyeSBhYm91dCB0aGUgY29uZnVzaW9uIGNhc2VkCj4gPiBo
ZXJlLCBJJ2xsIGNvcnJlY3QgdGhlIGNvbW1lbnRzIGluIHRoZSBuZXh0IHZlcnNpb24uICAKPiAK
PiBBbGwgdGhpcyBzaG91bGQgYmUgZXhwbGFpbmVkIGluIGEgY29tbWVudCBmb3IgdGhlIElSUSBp
biB0aGUgaGVhZGVyIGZpbGUuCgpZZXMsIFRpbmEncyB1cGRhdGUgYW5kIHlvdXIgY2xhcmlmaWNh
dGlvbiBhbGwgbWFrZSBzZW5zZSB0byBtZSwgYnV0IGl0Cm5lZWRzIHRvIGJlIHNwZWNpZmllZCBp
biB0aGUgaGVhZGVyIGhvdyB0aGlzIGlzIHN1cHBvc2VkIHRvIHdvcmssIHdoYXQKZXZlbnRzIGdl
dCBzaWduYWxlZCBhbmQgd2hhdCB0aGUgdXNlciBpcyBpbnRlbmRlZCB0byBkbyBpbiByZXNwb25z
ZSB0bwp0aGF0IHNpZ25hbC4gIFRoZSBpbmZvcm1hdGlvbiBpcyBhbGwgaGVyZSwgaXQganVzdCBu
ZWVkcyB0byBiZSBpbmNsdWRlZAppbiB0aGUgdWFwaSBkZWZpbml0aW9uLiAgVGhhbmtzLAoKQWxl
eAoKPiBLZXkgcG9pbnQgZm9yIHRoZSBBUEkgaXMgdGhhdCAoYSkgdGhpcyBpcyBhICJ0aGUgZGlz
cGxheSBzaG91bGQgYmUKPiB1cGRhdGVkIiBldmVudCBhbmQgKGIpIHRoaXMgY292ZXJzIGFsbCBk
aXNwbGF5IHVwZGF0ZXMsIGkuZS4gdXNlciBzcGFjZQo+IGNhbiBzdG9wIHRoZSBkaXNwbGF5IHVw
ZGF0ZSB0aW1lciBhbmQgZnVsbHkgZGVwZW5kIG9uIGdldHRpbmcKPiBub3RpZmljYXRpb25zIGlm
IGFuIHVwZGF0ZSBpcyBuZWVkZWQuCj4gCj4gVGhhdCBHVFYtZyB3YXRjaGVzIGd1ZXN0IHBhZ2Vm
bGlwcyBpcyBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwuICBTaG91bGQKPiBudmlkaWEgc3VwcG9y
dCB0aGlzIHRoZXkgd2lsbCBwcm9iYWJseSBkbyBzb21ldGhpbmcgY29tcGxldGVseQo+IGRpZmZl
cmVudC4gIEFzIGZhciBJIGtub3cgdGhleSByZW5kZXIgdGhlIGd1ZXN0IGRpc3BsYXkgdG8gc29t
ZQo+IGZyYW1lYnVmZmVyIGF0IHNvbWV0aGluZyBsaWtlIDEwZnBzLCBzbyBpdCB3b3VsZCBtYWtl
IHNlbnNlIGZvciB0aGVtIHRvCj4gc2VuZCBhbiBldmVudCBlYWNoIHRpbWUgdGhleSByZWZyZXNo
ZWQgdGhlIGZyYW1lYnVmZmVyLgo+IAo+IEFsc28gbm90ZSB0aGUgcmVsYXRpb25zaGlwcyAoY3Vy
X2V2ZW50X3ZhbCBpcyBmb3IgRFJNX1BMQU5FX1RZUEVfQ1VSU09SCj4gdXBkYXRlcyBhbmQgcHJp
X2V2ZW50X3ZhbCBmb3IgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
