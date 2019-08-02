Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BAC7FC5D
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Aug 2019 16:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B3F6EE86;
	Fri,  2 Aug 2019 14:39:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34A76EE85
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  2 Aug 2019 14:39:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CC62183F3B;
 Fri,  2 Aug 2019 14:39:02 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCA311001925;
 Fri,  2 Aug 2019 14:38:59 +0000 (UTC)
Date: Fri, 2 Aug 2019 08:38:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: Re: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190802083859.0fb0f05e@x1.home>
In-Reply-To: <20190802133531.4zwsjltvjisq4sfz@sirius.home.kraxel.org>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
 <20190719102516.60af527f@x1.home>
 <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
 <20190722134124.16c55c2f@x1.home>
 <237F54289DF84E4997F34151298ABEBC876BC9AD@SHSMSX101.ccr.corp.intel.com>
 <20190722191830.425d1593@x1.home>
 <20190802133531.4zwsjltvjisq4sfz@sirius.home.kraxel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 02 Aug 2019 14:39:03 +0000 (UTC)
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Lu,
 Kechen" <kechen.lu@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyIEF1ZyAyMDE5IDE1OjM1OjMxICswMjAwCiJrcmF4ZWxAcmVkaGF0LmNvbSIgPGty
YXhlbEByZWRoYXQuY29tPiB3cm90ZToKCj4gICBIaSwKPiAKPiA+ID4gPiBDb3VsZG4ndCB5b3Ug
ZXhwb3NlIHRoaXMgYXMgYW5vdGhlciBjYXBhYmlsaXR5IHdpdGhpbiB0aGUgSVJRX0lORk8gcmV0
dXJuCj4gPiA+ID4gZGF0YT8gIElmIHlvdSB3ZXJlIHRvIGRlZmluZSBpdCBhcyBhIG1hY3JvLCBJ
IGFzc3VtZSB0aGF0IG1lYW5zIGl0IHdvdWxkIGJlCj4gPiA+ID4gaGFyZCBjb2RlZCwgaW4gd2hp
Y2ggY2FzZSB0aGlzIHByb2JhYmx5IGJlY29tZXMgYW4gSW50ZWwgc3BlY2lmaWMgSVJRLCByYXRo
ZXIKPiA+ID4gPiB0aGFuIHdoYXQgYXBwZWFycyB0byBiZSBmcmFtZWQgYXMgYSBnZW5lcmljIGdy
YXBoaWNzIElSUSBleHRlbnNpb24uICBBIG5ldwo+ID4gPiA+IGNhcGFiaWxpdHkgY291bGQgaW5z
dGVhZCBhbGxvdyB0aGUgdmVuZG9yIHRvIHNwZWNpZnkgdGhlaXIgb3duIHZhbHVlLCB3aGVyZQo+
ID4gPiA+IHdlIGNvdWxkIGRlZmluZSBob3cgdXNlcnNwYWNlIHNob3VsZCBpbnRlcnByZXQgYW5k
IG1ha2UgdXNlIG9mIHRoaXMgdmFsdWUuCj4gPiA+ID4gVGhhbmtzLCAgICAKPiA+ID4gR29vZCBz
dWdnZXN0aW9uLiBDdXJyZW50bHksIHZmaW9faXJxX2luZm8gaXMgdXNlZCB0byBzYXZlIG9uZSBp
cnEKPiA+ID4gaW5mby4gV2hhdCB3ZSBuZWVkIGhlcmUgaXMgdG8gdXNlIGl0IHRvIHNhdmUgc2V2
ZXJhbCBldmVudHMgaW5mby4KPiA+ID4gTWF5YmUgd2UgY291bGQgZmlndXJlIG91dCBhIGdlbmVy
YWwgbGF5b3V0IG9mIHRoaXMgY2FwYWJpbGl0eSBzbyB0aGF0Cj4gPiA+IGl0IGNhbiBiZSBsZXZl
cmFnZWQgYnkgb3RoZXJzLCBub3Qgb25seSBmb3IgZGlzcGxheSBpcnEvZXZlbnRzLiAgCj4gPiAK
PiA+IFlvdSBjb3VsZCBhbHNvIGV4cG9zZSBhIGRldmljZSBzcGVjaWZpYyBJUlEgd2l0aCBjb3Vu
dCA+IDEgKGllLiBzaW1pbGFyCj4gPiB0byBNU0kvWCkgYW5kIGF2b2lkIG11bmdpbmcgdGhlIGV2
ZW50ZmQgdmFsdWUsIHdoaWNoIGlzIG5vdCBzb21ldGhpbmcKPiA+IHdlIGRvIGVsc2V3aGVyZSwg
YXQgbGVhc3QgaW4gdmZpby4gIFRoYW5rcywgIAo+IAo+IFdlbGwsIHRoZSBiYXNpYyBpZGVhIGlz
IHRvIHVzZSB0aGUgZXZlbnRmZCB2YWx1ZSB0byBzaWduYWwgdGhlIGtpbmQgb2YKPiBjaGFuZ2Vz
IHdoaWNoIGRpZCBoYXBwZW4sIHNpbWxpYXIgdG8gSVJRIHN0YXR1cyByZWdpc3RlciBiaXRzLgo+
IAo+IFNvLCB3aGVuIHRoZSBndWVzdCBjaGFuZ2VzIHRoZSBwcmltYXJ5IHBsYW5lLCB0aGUgbWRl
diBkcml2ZXIgbm90ZXMKPiB0aGlzLiAgU2FtZSB3aXRoIHRoZSBjdXJzb3IgcGxhbmUuICBPbiB2
YmxhbmsgKHdoZW4gdGhlIGd1ZXN0cyB1cGRhdGUKPiBpcyBhY3R1YWxseSBhcHBsaWVkKSB0aGUg
bWRldiBkcml2ZXIgd2FrZXMgdGhlIGV2ZW50ZmQgYW5kIHVzZXMgZXZlbnRmZAo+IHZhbHVlIHRv
IHNpZ25hbCB3aGVuZXZlciBwcmltYXJ5IHBsYW5lIG9yIGN1cnNvciBwbGFuZSBvciBib3RoIGRp
ZAo+IGNoYW5nZS4KPiAKPiBUaGVuIHVzZXJzcGFjZSBrbm93cyB3aGljaCBwbGFuZXMgbmVlZCBh
biB1cGRhdGUgd2l0aG91dCBhbiBleHRyYQo+IFZGSU9fREVWSUNFX1FVRVJZX0dGWF9QTEFORSBy
b3VuZHRyaXAgdG8gdGhlIGtlcm5lbC4KPiAKPiBBbHRlcm5hdGl2ZWx5IHdlIGNvdWxkIGhhdmUg
b25lIGV2ZW50ZmQgZm9yIGVhY2ggY2hhbmdlIHR5cGUuICBCdXQgZ2l2ZW4KPiB0aGF0IHRoZXNl
IGNoYW5nZXMgYXJlIHR5cGljYWxseSBhcHBsaWVkIGF0IHRoZSBzYW1lIHRpbWUgKHZibGFuaykg
d2UKPiB3b3VsZCBoYXZlIG11bHRpcGxlIGV2ZW50ZmRzIGJlaW5nIHNpZ25hbGVkIGF0IHRoZSBz
YW1lIHRpbWUuICBXaGljaAo+IGRvZXNuJ3QgbG9vayBpZGVhbCB0byBtZSAuLi4KCkdvb2QgcG9p
bnQsIGxvb2tpbmcgYXQgdGhlIGJpdHMgaW4gdGhlIGV2ZW50ZmQgdmFsdWUgc2VlbXMgYmV0dGVy
IHRoYW4KYSBmbG9vZCBvZiBjb25jdXJyZW50IGludGVycnVwdHMuICBUaGFua3MsCgpBbGV4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
