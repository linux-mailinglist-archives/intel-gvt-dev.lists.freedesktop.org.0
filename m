Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71393709DE
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Jul 2019 21:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A2289E11;
	Mon, 22 Jul 2019 19:41:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2914B89E11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Jul 2019 19:41:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6AE96308424C;
 Mon, 22 Jul 2019 19:41:28 +0000 (UTC)
Received: from x1.home (ovpn-116-35.phx2.redhat.com [10.3.116.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 522D0600C4;
 Mon, 22 Jul 2019 19:41:25 +0000 (UTC)
Date: Mon, 22 Jul 2019 13:41:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Lu, Kechen" <kechen.lu@intel.com>
Subject: Re: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190722134124.16c55c2f@x1.home>
In-Reply-To: <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
 <20190719102516.60af527f@x1.home>
 <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 22 Jul 2019 19:41:28 +0000 (UTC)
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
 Tina" <tina.zhang@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>, "Yuan, 
 Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyMiBKdWwgMjAxOSAwNToyODozNSArMDAwMAoiTHUsIEtlY2hlbiIgPGtlY2hlbi5s
dUBpbnRlbC5jb20+IHdyb3RlOgoKPiBIaSwgCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIFttYWlsdG86YWxleC53aWxsaWFtc29uQHJl
ZGhhdC5jb21dCj4gPiBTZW50OiBTYXR1cmRheSwgSnVseSAyMCwgMjAxOSAxMjoyNSBBTQo+ID4g
VG86IEx1LCBLZWNoZW4gPGtlY2hlbi5sdUBpbnRlbC5jb20+Cj4gPiBDYzogaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+ID4g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29t
PjsKPiA+IGtyYXhlbEByZWRoYXQuY29tOyB6aGVueXV3QGxpbnV4LmludGVsLmNvbTsgTHYsIFpo
aXl1YW4KPiA+IDx6aGl5dWFuLmx2QGludGVsLmNvbT47IFdhbmcsIFpoaSBBIDx6aGkuYS53YW5n
QGludGVsLmNvbT47IFRpYW4sIEtldmluCj4gPiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBZdWFu
LCBIYW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPgo+ID4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0gg
djQgMi82XSB2ZmlvOiBJbnRyb2R1Y2UgdkdQVSBkaXNwbGF5IGlycSB0eXBlCj4gPiAKPiA+IE9u
IFRodSwgMTggSnVsIDIwMTkgMjM6NTY6MzYgKzA4MDAKPiA+IEtlY2hlbiBMdSA8a2VjaGVuLmx1
QGludGVsLmNvbT4gd3JvdGU6Cj4gPiAgIAo+ID4gPiBGcm9tOiBUaW5hIFpoYW5nIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4KPiA+ID4KPiA+ID4gSW50cm9kdWNlIHZHUFUgc3BlY2lmaWMgaXJxIHR5
cGUgVkZJT19JUlFfVFlQRV9HRlgsIGFuZAo+ID4gPiBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQ
TEFZX0lSUSBhcyB0aGUgc3VidHlwZSBmb3IgdkdQVSBkaXNwbGF5Cj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggfCAzICsrKwo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2xpbnV4L3ZmaW8uaCBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+ID4gaW5kZXggYmU2
YWRhYjRmNzU5Li5kZjI4YjE3YTZlMmUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9s
aW51eC92ZmlvLmgKPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+ID4gPiBA
QCAtNDY5LDYgKzQ2OSw5IEBAIHN0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsKPiA+ID4g
IAlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVjaWZpYyAqLwo+ID4gPiAgfTsKPiA+ID4KPiA+
ID4gKyNkZWZpbmUgVkZJT19JUlFfVFlQRV9HRlgJCQkJKDEpCj4gPiA+ICsjZGVmaW5lIFZGSU9f
SVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRCQkoMSkKPiA+ID4gKyAgCj4gPiAKPiA+IFBsZWFz
ZSBpbmNsdWRlIGEgZGVzY3JpcHRpb24gZGVmaW5pbmcgZXhhY3RseSB3aGF0IHRoaXMgSVJRIGlz
IGludGVuZGVkIHRvIHNpZ25hbC4KPiA+IEZvciBpbnN0YW5jZSwgaWYgYW5vdGhlciB2R1BVIHZl
bmRvciB3YW50ZWQgdG8gaW1wbGVtZW50IHRoaXMgaW4gdGhlaXIgZHJpdmVyCj4gPiBhbmQgZGlk
bid0IGhhdmUgdGhlIFFFTVUgY29kZSBmb3IgcmVmZXJlbmNlIHRvIHdoYXQgaXQgZG9lcyB3aXRo
IHRoZSBJUlEsIHdoYXQKPiA+IHdvdWxkIHRoZXkgbmVlZCB0byBrbm93PyAgVGhhbmtzLAo+ID4g
Cj4gPiBBbGV4Cj4gPiAgIAo+IAo+IFllcywgdGhhdCBtYWtlcyBtb3JlIHNlbnNlLiBJJ2xsIGFk
ZCB0aGUgZGVzY3JpcHRpb24gZm9yIGl0IGF0IG5leHQgdmVyc2lvbiBwYXRjaC4KPiAKPiBCVFcs
IG1heSBJIGhhdmUgb25lIG1vcmUgcXVlc3Rpb24/IEluIHRoZSBjdXJyZW50IGRlc2lnbiBpZGVh
cywgd2UgcGFydGl0aW9uZWQgCj4gdGhlIHZHUFUgZGlzcGxheSBldmVudGZkIGNvdW50ZWQgOC1i
eXRlIHZhbHVlIGludG8gYXQgbW9zdCA4IGV2ZW50cyB0byBkZWxpdmVyIAo+IG11bHRpcGxlIGRp
c3BsYXkgZXZlbnRzLCBzbyB3ZSBuZWVkIGRpZmZlcmVudCBpbmNyZWFzZW1lbnQgY291bnRlciB2
YWx1ZSB0byAKPiBkaWZmZXJlbnRpYXRlIHRoZSBldmVudHMuIEFzIHRoaXMgaXMgdGhlIGV4cG9z
ZWQgdGhpbmcgdGhlIFFFTVUgaGFzIHRvIGtub3csIHdlCj4gcGxhbiBhZGRzIGEgbWFjcm8gaGVy
ZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0VWRU5URkRfQkFTRV9TSElGVCB0bwo+IG1h
a2Ugc3VyZSB0aGUgcGFydGl0aW9ucyBzaGlmdCBpbiAxIGJ5dGUsIGRvZXMgaXQgbWFrZSBzZW5z
ZSBwdXR0aW5nIGhlcmU/IExvb2tpbmcgIAo+IGZvcndhcmQgdG8geW91ciBhbmQgR2VyZCdzIGNv
bW1lbnRzLiBUaGFua3MhCgpDb3VsZG4ndCB5b3UgZXhwb3NlIHRoaXMgYXMgYW5vdGhlciBjYXBh
YmlsaXR5IHdpdGhpbiB0aGUgSVJRX0lORk8KcmV0dXJuIGRhdGE/ICBJZiB5b3Ugd2VyZSB0byBk
ZWZpbmUgaXQgYXMgYSBtYWNybywgSSBhc3N1bWUgdGhhdCBtZWFucwppdCB3b3VsZCBiZSBoYXJk
IGNvZGVkLCBpbiB3aGljaCBjYXNlIHRoaXMgcHJvYmFibHkgYmVjb21lcyBhbiBJbnRlbApzcGVj
aWZpYyBJUlEsIHJhdGhlciB0aGFuIHdoYXQgYXBwZWFycyB0byBiZSBmcmFtZWQgYXMgYSBnZW5l
cmljCmdyYXBoaWNzIElSUSBleHRlbnNpb24uICBBIG5ldyBjYXBhYmlsaXR5IGNvdWxkIGluc3Rl
YWQgYWxsb3cgdGhlCnZlbmRvciB0byBzcGVjaWZ5IHRoZWlyIG93biB2YWx1ZSwgd2hlcmUgd2Ug
Y291bGQgZGVmaW5lIGhvdyB1c2Vyc3BhY2UKc2hvdWxkIGludGVycHJldCBhbmQgbWFrZSB1c2Ug
b2YgdGhpcyB2YWx1ZS4gIFRoYW5rcywKCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
