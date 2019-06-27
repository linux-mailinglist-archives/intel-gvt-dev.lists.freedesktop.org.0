Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DD57A6D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 06:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3AB6E595;
	Thu, 27 Jun 2019 04:07:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83BD6E595
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 04:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B8162F8BE2;
 Thu, 27 Jun 2019 04:07:43 +0000 (UTC)
Received: from x1.home (ovpn-117-35.phx2.redhat.com [10.3.117.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED4311001281;
 Thu, 27 Jun 2019 04:07:39 +0000 (UTC)
Date: Wed, 26 Jun 2019 22:07:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Message-ID: <20190626220739.578c518b@x1.home>
In-Reply-To: <20190627033802.1663-2-tina.zhang@intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-2-tina.zhang@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 27 Jun 2019 04:07:43 +0000 (UTC)
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, hang.yuan@intel.com, zhiyuan.lv@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyNyBKdW4gMjAxOSAxMTozNzo1OSArMDgwMApUaW5hIFpoYW5nIDx0aW5hLnpoYW5n
QGludGVsLmNvbT4gd3JvdGU6Cgo+IENhcCB0aGUgbnVtYmVyIG9mIGlycXMgd2l0aCBmaXhlZCBp
bmRleGVzIGFuZCB1c2UgY2FwYWJpbGl0eSBjaGFpbnMKPiB0byBjaGFpbiBkZXZpY2Ugc3BlY2lm
aWMgaXJxcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVs
LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCB8IDE5ICsrKysrKysrKysr
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCBiL2luY2x1ZGUv
dWFwaS9saW51eC92ZmlvLmgKPiBpbmRleCAwMmJiN2FkNmU5ODYuLjYwMDc4NGFjYzRhYyAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gKysrIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3ZmaW8uaAo+IEBAIC00NDQsMTEgKzQ0NCwyNyBAQCBzdHJ1Y3QgdmZpb19pcnFfaW5m
byB7Cj4gICNkZWZpbmUgVkZJT19JUlFfSU5GT19NQVNLQUJMRQkJKDEgPDwgMSkKPiAgI2RlZmlu
ZSBWRklPX0lSUV9JTkZPX0FVVE9NQVNLRUQJKDEgPDwgMikKPiAgI2RlZmluZSBWRklPX0lSUV9J
TkZPX05PUkVTSVpFCQkoMSA8PCAzKQo+ICsjZGVmaW5lIFZGSU9fSVJRX0lORk9fRkxBR19DQVBT
CQkoMSA8PCA0KSAvKiBJbmZvIHN1cHBvcnRzIGNhcHMgKi8KPiAgCV9fdTMyCWluZGV4OwkJLyog
SVJRIGluZGV4ICovCj4gKwlfX3UzMgljYXBfb2Zmc2V0OwkvKiBPZmZzZXQgd2l0aGluIGluZm8g
c3RydWN0IG9mIGZpcnN0IGNhcCAqLwo+ICAJX191MzIJY291bnQ7CQkvKiBOdW1iZXIgb2YgSVJR
cyB3aXRoaW4gdGhpcyBpbmRleCAqLwo+ICB9OwoKClRoaXMgY2Fubm90IGJlIGluc2VydGVkIGlu
dG8gdGhlIG1pZGRsZSBvZiB0aGUgc3RydWN0dXJlLCBpdCBicmVha3MKY29tcGF0aWJpbGl0eSB3
aXRoIGFsbCBleGlzdGluZyB1c2Vyc3BhY2UgYmluYXJpZXMuICBJIG11c3QgYmUgYWRkZWQgdG8K
dGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlLgoKPiAgI2RlZmluZSBWRklPX0RFVklDRV9HRVRfSVJR
X0lORk8JX0lPKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgOSkKPiAgCj4gKy8qCj4gKyAqIFRoZSBp
cnEgdHlwZSBjYXBhYmlsaXR5IGFsbG93cyBpcnFzIHVuaXF1ZSB0byBhIHNwZWNpZmljIGRldmlj
ZSBvcgo+ICsgKiBjbGFzcyBvZiBkZXZpY2VzIHRvIGJlIGV4cG9zZWQuCj4gKyAqCj4gKyAqIFRo
ZSBzdHJ1Y3R1cmVzIGJlbG93IGRlZmluZSB2ZXJzaW9uIDEgb2YgdGhpcyBjYXBhYmlsaXR5Lgo+
ICsgKi8KPiArI2RlZmluZSBWRklPX0lSUV9JTkZPX0NBUF9UWVBFICAgICAgMwo+ICsKPiArc3Ry
dWN0IHZmaW9faXJxX2luZm9fY2FwX3R5cGUgewo+ICsJc3RydWN0IHZmaW9faW5mb19jYXBfaGVh
ZGVyIGhlYWRlcjsKPiArCV9fdTMyIHR5cGU7ICAgICAvKiBnbG9iYWwgcGVyIGJ1cyBkcml2ZXIg
Ki8KPiArCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovCj4gK307Cj4gKwo+ICAv
KioKPiAgICogVkZJT19ERVZJQ0VfU0VUX0lSUVMgLSBfSU9XKFZGSU9fVFlQRSwgVkZJT19CQVNF
ICsgMTAsIHN0cnVjdCB2ZmlvX2lycV9zZXQpCj4gICAqCj4gQEAgLTU1MCw3ICs1NjYsOCBAQCBl
bnVtIHsKPiAgCVZGSU9fUENJX01TSVhfSVJRX0lOREVYLAo+ICAJVkZJT19QQ0lfRVJSX0lSUV9J
TkRFWCwKPiAgCVZGSU9fUENJX1JFUV9JUlFfSU5ERVgsCj4gLQlWRklPX1BDSV9OVU1fSVJRUwo+
ICsJVkZJT19QQ0lfTlVNX0lSUVMgPSA1CS8qIEZpeGVkIHVzZXIgQUJJLCBJUlEgaW5kZXhlcyA+
PTUgdXNlICAgKi8KPiArCQkJCS8qIGRldmljZSBzcGVjaWZpYyBjYXAgdG8gZGVmaW5lIGNvbnRl
bnQgKi8KPiAgfTsKPiAgCj4gIC8qCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
