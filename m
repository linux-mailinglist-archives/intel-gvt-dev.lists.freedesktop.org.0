Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A836FBD3A5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 22:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6173B6EAFA;
	Tue, 24 Sep 2019 20:35:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647386EAFA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Sep 2019 20:35:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91AC118C8914;
 Tue, 24 Sep 2019 20:35:12 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E70B5D9CA;
 Tue, 24 Sep 2019 20:35:09 +0000 (UTC)
Date: Tue, 24 Sep 2019 14:35:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v6 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190924143509.181affe2@x1.home>
In-Reply-To: <20190924064143.9282-3-tina.zhang@intel.com>
References: <20190924064143.9282-1-tina.zhang@intel.com>
 <20190924064143.9282-3-tina.zhang@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 24 Sep 2019 20:35:12 +0000 (UTC)
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBTZXAgMjAxOSAxNDo0MTozOSArMDgwMApUaW5hIFpoYW5nIDx0aW5hLnpoYW5n
QGludGVsLmNvbT4gd3JvdGU6Cgo+IEludHJvZHVjZSB2R1BVIHNwZWNpZmljIGlycSB0eXBlIFZG
SU9fSVJRX1RZUEVfR0ZYLCBhbmQKPiBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBh
cyB0aGUgc3VidHlwZSBmb3IgdkdQVSBkaXNwbGF5Lgo+IAo+IEludHJvZHVjZSB2ZmlvX2lycV9p
bmZvX2NhcF9kaXNwbGF5X3BsYW5lX2V2ZW50cyBjYXBhYmlsaXR5IHRvIG5vdGlmeQo+IHVzZXIg
c3BhY2Ugd2l0aCB0aGUgdkdQVSdzIHBsYW5lIHVwZGF0ZSBldmVudHMKPiAKPiB2MzoKPiAtIEFk
ZCBtb3JlIGRlc2NyaXB0aW9uIHRvIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRIGFu
ZAo+ICAgVkZJT19JUlFfSU5GT19DQVBfRElTUExBWS4gKEFsZXggJiBHZXJkKQo+IAo+IHYyOgo+
IC0gQWRkIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRIGRlc2NyaXB0aW9uLiAoQWxl
eCAmIEtlY2hlbikKPiAtIEludHJvZHVjZSB2ZmlvX2lycV9pbmZvX2NhcF9kaXNwbGF5X3BsYW5l
X2V2ZW50cy4gKEdlcmQgJiBBbGV4KQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRp
bmEuemhhbmdAaW50ZWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwg
MzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDM4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4
L3ZmaW8uaCBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiBpbmRleCBhYTY4NTBmMWRhZWYu
LjI5NDZhMDI4YjBjMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4g
KysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+IEBAIC00NzYsNiArNDc2LDQ0IEBAIHN0
cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsKPiAgCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBl
IHNwZWNpZmljICovCj4gIH07Cj4gIAo+ICsvKiB2R1BVIElSUSBUWVBFICovCj4gKyNkZWZpbmUg
VkZJT19JUlFfVFlQRV9HRlgJCQkoMSkKPiArCj4gKy8qIHN1Yi10eXBlcyBmb3IgVkZJT19JUlFf
VFlQRV9HRlggKi8KPiArLyoKPiArICogdkdQVSBkZXZpY2UgZGlzcGxheSByZWZyZXNoIGludGVy
cnVwdCByZXF1ZXN0LiBUaGlzIGlycSBhc2tpbmcgZm9yCj4gKyAqIGEgdXNlciBzcGFjZSBkaXNw
bGF5IHJlZnJlc2gsIGNvdmVycyBhbGwgZGlzcGxheSB1cGRhdGVzIGV2ZW50cywKPiArICogaS5l
LiB1c2VyIHNwYWNlIGNhbiBzdG9wIHRoZSBkaXNwbGF5IHVwZGF0ZSB0aW1lciBhbmQgZnVsbHkg
ZGVwZW5kCj4gKyAqIG9uIGdldHRpbmcgdGhlIG5vdGlmaWNhdGlvbiBpZiBhbiB1cGRhdGUgaXMg
bmVlZGVkLgo+ICsgKi8KPiArI2RlZmluZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lS
UQkoMSkKPiArCj4gKy8qCj4gKyAqIERpc3BsYXkgY2FwYWJpbGl0eSBvZiByZXBvcnRpbmcgZGlz
cGxheSByZWZyZXNoIGludGVycnVwdCBldmVudHMuCgpQZXJoYXBzLCAiQ2FwYWJpbGl0eSBmb3Ig
aW50ZXJwcmV0aW5nIEdGWF9ESVNQTEFZX0lSUSBldmVudGZkIHZhbHVlIgoKPiArICogVGhpcyBn
aXZlcyB1c2VyIHNwYWNlIHRoZSBjYXBhYmlsaXR5IHRvIGlkZW50aWZ5IGRpZmZlcmVudCBkaXNw
bGF5Cj4gKyAqIHVwZGF0ZXMgZXZlbnRzIG9mIHRoZSBkaXNwbGF5IHJlZnJlc2ggaW50ZXJydXB0
IHJlcXVlc3QuCj4gKyAqCj4gKyAqIFdoZW4gbm90aWZpZWQgYnkgVkZJT19JUlFfU1VCVFlQRV9H
RlhfRElTUExBWV9JUlEsIHVzZXIgc3BhY2UgY2FuCj4gKyAqIHVzZSB0aGUgZXZlbnRmZCBjb3Vu
dGVyIHZhbHVlIHRvIGlkZW50aWZ5IHdoaWNoIHBsYW5lIGhhcyBiZWVuCj4gKyAqIHVwZGF0ZWQu
Cj4gKyAqCj4gKyAqIE5vdGUgdGhhdCB0aGVyZSBtaWdodCBiZSBzb21lIGNhc2VzIGxpa2UgY291
bnRlcl92YWx1ZSA+Cj4gKyAqIChjdXJfZXZlbnRfdmFsICsgcHJpX2V2ZW50X3ZhbCksIGlmIG5v
dGlmaWNhdGlvbnMgaGF2ZW4ndCBiZWVuCj4gKyAqIGhhbmRsZWQgb24gdGltZSBpbiB1c2VyIG1v
ZGUuIFRoZXNlIGNhc2VzIGNhbiBiZSBoYW5kbGVkIGFzIGFsbAo+ICsgKiBwbGFuZSB1cGRhdGVk
IGNhc2Ugb3Igc2lnbmxlIHBsYW5lIHVwZGF0ZWQgY2FzZSBkZXBlbmRpbmcgb24gdGhlCj4gKyAq
IHZhbHVlLgoKU2VlbXMgbGlrZSBpbiB0aGUgR1ZULWcgaW1wbGVtZW50YXRpb24gc3VjaCBhIHZh
bHVlIGlzIG5vdCBwb3NzaWJsZS4KSW4gZmFjdCwgd2hlbiB0aGlzIGNhcGFiaWxpdHkgaXMgcHJv
dmlkZWQsIGRvZXNuJ3QgdXNlcnNwYWNlIGludGVycHJldAp0aGUgZXZlbnRmZCB2YWx1ZSBtb3Jl
IGFzIGEgYml0bWFzayBvZiBldmVudHMgcmF0aGVyIHRoYW4gYSBjb3VudGVyPwpJZiBzbywgKGN1
cl9ldmVudF92YWwgKyBwcmlfZXZlbnRfdmFsKSBtYXkgYmUgbWF0aGVtYXRpY2FsbHkgYWNjdXJh
dGUsCmJ1dCBtYXliZSBvYmZ1c2NhdGVzIHRoZSBsb2dpY2FsIGludGVycHJldGF0aW9uLi4uIG9y
IG1heWJlIHRoYXQncyBqdXN0Cm1lLgoKPiArICoKPiArICogY3VyX2V2ZW50X3ZhbDogZXZlbnRm
ZCBjb3VudGVyIHZhbHVlIGZvciBjdXJzb3IgcGxhbmUgY2hhbmdlIGV2ZW50Lgo+ICsgKiBwcmlf
ZXZlbnRfdmFsOiBldmVudGZkIGNvdW50ZXIgdmFsdWUgZm9yIHByaW1hcnkgcGxhbmUgY2hhbmdl
IGV2ZW50LgoKSSB0aGluayB0aGVyZSBzaG91bGQgYmUgYSBub3RlIHRoYXQgdGhpcyBjYXBhYmls
aXR5IGlzIG9wdGlvbmFsIGFuZApsYWNraW5nIHRoaXMgZmVhdHVyZSwgdXNlcnNwYWNlIHNob3Vs
ZCByZWZyZXNoIGFsbCBkaXNwbGF5IGV2ZW50cyBvbgpub3RpZmljYXRpb24uCgo+ICsgKi8KPiAr
I2RlZmluZSBWRklPX0lSUV9JTkZPX0NBUF9ESVNQTEFZCTIKPiArCj4gK3N0cnVjdCB2ZmlvX2ly
cV9pbmZvX2NhcF9kaXNwbGF5X3BsYW5lX2V2ZW50cyB7Cj4gKwlzdHJ1Y3QgdmZpb19pbmZvX2Nh
cF9oZWFkZXIgaGVhZGVyOwo+ICsJX191NjQgY3VyX2V2ZW50X3ZhbDsKPiArCV9fdTY0IHByaV9l
dmVudF92YWw7CgpBSVVJLCB0aGUgR1ZULWcgaW1wbGVtZW50YXRpb24gc2V0cyBhIHNpbmdsZSBi
aXQgYW5kIHVzZXJzcGFjZSBleHBlY3RzCm9uZSBvciBib3RoIG9mIHRob3NlIGJpdHMgdG8gYmUg
c2V0IG9uIG5vdGlmaWNhdGlvbi4gIFNob3VsZCB3ZQpzaW1wbGlmeSB0aGlzIGEgYml0IGFuZCBq
dXN0IGRlZmluZSB0aGVzZSBhcyBjdXJfZXZlbnRfYml0LApwcmlfZXZlbnRfYml0IGFuZCB1c2Ug
YSBfX3U4IGZvciBlYWNoIHRvIGRlZmluZSB0aGUgYml0IHBvc2l0aW9uPwpUaGFua3MsCgpBbGV4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
