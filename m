Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DC70E90
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 03:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A58989F63;
	Tue, 23 Jul 2019 01:18:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E589F63
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Jul 2019 01:18:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61796308A968;
 Tue, 23 Jul 2019 01:18:33 +0000 (UTC)
Received: from x1.home (ovpn-116-35.phx2.redhat.com [10.3.116.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F838600C8;
 Tue, 23 Jul 2019 01:18:30 +0000 (UTC)
Date: Mon, 22 Jul 2019 19:18:30 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190722191830.425d1593@x1.home>
In-Reply-To: <237F54289DF84E4997F34151298ABEBC876BC9AD@SHSMSX101.ccr.corp.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
 <20190719102516.60af527f@x1.home>
 <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
 <20190722134124.16c55c2f@x1.home>
 <237F54289DF84E4997F34151298ABEBC876BC9AD@SHSMSX101.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 23 Jul 2019 01:18:33 +0000 (UTC)
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
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>, "Lu,
 Kechen" <kechen.lu@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBKdWwgMjAxOSAwMTowODoxOSArMDAwMAoiWmhhbmcsIFRpbmEiIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4gd3JvdGU6Cgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
IEZyb206IEFsZXggV2lsbGlhbXNvbiBbbWFpbHRvOmFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29t
XQo+ID4gU2VudDogVHVlc2RheSwgSnVseSAyMywgMjAxOSAzOjQxIEFNCj4gPiBUbzogTHUsIEtl
Y2hlbiA8a2VjaGVuLmx1QGludGVsLmNvbT4KPiA+IENjOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gPiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBaaGFuZywgVGluYSA8dGluYS56aGFuZ0BpbnRlbC5jb20+Owo+ID4ga3Jh
eGVsQHJlZGhhdC5jb207IHpoZW55dXdAbGludXguaW50ZWwuY29tOyBMdiwgWmhpeXVhbgo+ID4g
PHpoaXl1YW4ubHZAaW50ZWwuY29tPjsgV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29t
PjsgVGlhbiwgS2V2aW4KPiA+IDxrZXZpbi50aWFuQGludGVsLmNvbT47IFl1YW4sIEhhbmcgPGhh
bmcueXVhbkBpbnRlbC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2NCAyLzZdIHZm
aW86IEludHJvZHVjZSB2R1BVIGRpc3BsYXkgaXJxIHR5cGUKPiA+IAo+ID4gT24gTW9uLCAyMiBK
dWwgMjAxOSAwNToyODozNSArMDAwMAo+ID4gIkx1LCBLZWNoZW4iIDxrZWNoZW4ubHVAaW50ZWwu
Y29tPiB3cm90ZToKPiA+ICAgCj4gPiA+IEhpLAo+ID4gPiAgCj4gPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+ID4gPiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gW21haWx0bzphbGV4
LndpbGxpYW1zb25AcmVkaGF0LmNvbV0KPiA+ID4gPiBTZW50OiBTYXR1cmRheSwgSnVseSAyMCwg
MjAxOSAxMjoyNSBBTQo+ID4gPiA+IFRvOiBMdSwgS2VjaGVuIDxrZWNoZW4ubHVAaW50ZWwuY29t
Pgo+ID4gPiA+IENjOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsga3ZtQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtCj4gPiA+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgWmhh
bmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29tPjsKPiA+ID4gPiBrcmF4ZWxAcmVkaGF0LmNv
bTsgemhlbnl1d0BsaW51eC5pbnRlbC5jb207IEx2LCBaaGl5dWFuCj4gPiA+ID4gPHpoaXl1YW4u
bHZAaW50ZWwuY29tPjsgV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29tPjsgVGlhbiwK
PiA+ID4gPiBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBZdWFuLCBIYW5nIDxoYW5nLnl1
YW5AaW50ZWwuY29tPgo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHY0IDIvNl0gdmZp
bzogSW50cm9kdWNlIHZHUFUgZGlzcGxheSBpcnEKPiA+ID4gPiB0eXBlCj4gPiA+ID4KPiA+ID4g
PiBPbiBUaHUsIDE4IEp1bCAyMDE5IDIzOjU2OjM2ICswODAwCj4gPiA+ID4gS2VjaGVuIEx1IDxr
ZWNoZW4ubHVAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiAgCj4gPiA+ID4gPiBGcm9tOiBUaW5h
IFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbnRyb2R1
Y2UgdkdQVSBzcGVjaWZpYyBpcnEgdHlwZSBWRklPX0lSUV9UWVBFX0dGWCwgYW5kCj4gPiA+ID4g
PiBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBhcyB0aGUgc3VidHlwZSBmb3IgdkdQ
VSBkaXNwbGF5Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8
dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBpbmNsdWRlL3Vh
cGkvbGludXgvdmZpby5oIHwgMyArKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9s
aW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiA+ID4gPiBpbmRleCBi
ZTZhZGFiNGY3NTkuLmRmMjhiMTdhNmUyZSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC92ZmlvLmgKPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92Zmlv
LmgKPiA+ID4gPiA+IEBAIC00NjksNiArNDY5LDkgQEAgc3RydWN0IHZmaW9faXJxX2luZm9fY2Fw
X3R5cGUgewo+ID4gPiA+ID4gIAlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVjaWZpYyAqLyAg
fTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiArI2RlZmluZSBWRklPX0lSUV9UWVBFX0dGWAkJCQkoMSkK
PiA+ID4gPiA+ICsjZGVmaW5lIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRCQkoMSkK
PiA+ID4gPiA+ICsgIAo+ID4gPiA+Cj4gPiA+ID4gUGxlYXNlIGluY2x1ZGUgYSBkZXNjcmlwdGlv
biBkZWZpbmluZyBleGFjdGx5IHdoYXQgdGhpcyBJUlEgaXMgaW50ZW5kZWQgdG8gIAo+ID4gc2ln
bmFsLiAgCj4gPiA+ID4gRm9yIGluc3RhbmNlLCBpZiBhbm90aGVyIHZHUFUgdmVuZG9yIHdhbnRl
ZCB0byBpbXBsZW1lbnQgdGhpcyBpbgo+ID4gPiA+IHRoZWlyIGRyaXZlciBhbmQgZGlkbid0IGhh
dmUgdGhlIFFFTVUgY29kZSBmb3IgcmVmZXJlbmNlIHRvIHdoYXQgaXQKPiA+ID4gPiBkb2VzIHdp
dGggdGhlIElSUSwgd2hhdCB3b3VsZCB0aGV5IG5lZWQgdG8ga25vdz8gIFRoYW5rcywKPiA+ID4g
Pgo+ID4gPiA+IEFsZXgKPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IFllcywgdGhhdCBtYWtlcyBtb3Jl
IHNlbnNlLiBJJ2xsIGFkZCB0aGUgZGVzY3JpcHRpb24gZm9yIGl0IGF0IG5leHQgdmVyc2lvbiAg
Cj4gPiBwYXRjaC4gIAo+ID4gPgo+ID4gPiBCVFcsIG1heSBJIGhhdmUgb25lIG1vcmUgcXVlc3Rp
b24/IEluIHRoZSBjdXJyZW50IGRlc2lnbiBpZGVhcywgd2UKPiA+ID4gcGFydGl0aW9uZWQgdGhl
IHZHUFUgZGlzcGxheSBldmVudGZkIGNvdW50ZWQgOC1ieXRlIHZhbHVlIGludG8gYXQgbW9zdAo+
ID4gPiA4IGV2ZW50cyB0byBkZWxpdmVyIG11bHRpcGxlIGRpc3BsYXkgZXZlbnRzLCBzbyB3ZSBu
ZWVkIGRpZmZlcmVudAo+ID4gPiBpbmNyZWFzZW1lbnQgY291bnRlciB2YWx1ZSB0byBkaWZmZXJl
bnRpYXRlIHRoZSBldmVudHMuIEFzIHRoaXMgaXMgdGhlCj4gPiA+IGV4cG9zZWQgdGhpbmcgdGhl
IFFFTVUgaGFzIHRvIGtub3csIHdlIHBsYW4gYWRkcyBhIG1hY3JvIGhlcmUKPiA+ID4gVkZJT19J
UlFfU1VCVFlQRV9HRlhfRElTUExBWV9FVkVOVEZEX0JBU0VfU0hJRlQgdG8gbWFrZSBzdXJlICAK
PiA+IHRoZSAgCj4gPiA+IHBhcnRpdGlvbnMgc2hpZnQgaW4gMSBieXRlLCBkb2VzIGl0IG1ha2Ug
c2Vuc2UgcHV0dGluZyBoZXJlPyBMb29raW5nIGZvcndhcmQgIAo+ID4gdG8geW91ciBhbmQgR2Vy
ZCdzIGNvbW1lbnRzLiBUaGFua3MhCj4gPiAKPiA+IENvdWxkbid0IHlvdSBleHBvc2UgdGhpcyBh
cyBhbm90aGVyIGNhcGFiaWxpdHkgd2l0aGluIHRoZSBJUlFfSU5GTyByZXR1cm4KPiA+IGRhdGE/
ICBJZiB5b3Ugd2VyZSB0byBkZWZpbmUgaXQgYXMgYSBtYWNybywgSSBhc3N1bWUgdGhhdCBtZWFu
cyBpdCB3b3VsZCBiZQo+ID4gaGFyZCBjb2RlZCwgaW4gd2hpY2ggY2FzZSB0aGlzIHByb2JhYmx5
IGJlY29tZXMgYW4gSW50ZWwgc3BlY2lmaWMgSVJRLCByYXRoZXIKPiA+IHRoYW4gd2hhdCBhcHBl
YXJzIHRvIGJlIGZyYW1lZCBhcyBhIGdlbmVyaWMgZ3JhcGhpY3MgSVJRIGV4dGVuc2lvbi4gIEEg
bmV3Cj4gPiBjYXBhYmlsaXR5IGNvdWxkIGluc3RlYWQgYWxsb3cgdGhlIHZlbmRvciB0byBzcGVj
aWZ5IHRoZWlyIG93biB2YWx1ZSwgd2hlcmUKPiA+IHdlIGNvdWxkIGRlZmluZSBob3cgdXNlcnNw
YWNlIHNob3VsZCBpbnRlcnByZXQgYW5kIG1ha2UgdXNlIG9mIHRoaXMgdmFsdWUuCj4gPiBUaGFu
a3MsICAKPiBHb29kIHN1Z2dlc3Rpb24uIEN1cnJlbnRseSwgdmZpb19pcnFfaW5mbyBpcyB1c2Vk
IHRvIHNhdmUgb25lIGlycQo+IGluZm8uIFdoYXQgd2UgbmVlZCBoZXJlIGlzIHRvIHVzZSBpdCB0
byBzYXZlIHNldmVyYWwgZXZlbnRzIGluZm8uCj4gTWF5YmUgd2UgY291bGQgZmlndXJlIG91dCBh
IGdlbmVyYWwgbGF5b3V0IG9mIHRoaXMgY2FwYWJpbGl0eSBzbyB0aGF0Cj4gaXQgY2FuIGJlIGxl
dmVyYWdlZCBieSBvdGhlcnMsIG5vdCBvbmx5IGZvciBkaXNwbGF5IGlycS9ldmVudHMuCgpZb3Ug
Y291bGQgYWxzbyBleHBvc2UgYSBkZXZpY2Ugc3BlY2lmaWMgSVJRIHdpdGggY291bnQgPiAxIChp
ZS4gc2ltaWxhcgp0byBNU0kvWCkgYW5kIGF2b2lkIG11bmdpbmcgdGhlIGV2ZW50ZmQgdmFsdWUs
IHdoaWNoIGlzIG5vdCBzb21ldGhpbmcKd2UgZG8gZWxzZXdoZXJlLCBhdCBsZWFzdCBpbiB2Zmlv
LiAgVGhhbmtzLAoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
