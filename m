Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18453AFD1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2019 09:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98C89122;
	Mon, 10 Jun 2019 07:44:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A56F8911F;
 Mon, 10 Jun 2019 07:44:57 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16848569-1500050 for multiple; Mon, 10 Jun 2019 08:44:43 +0100
MIME-Version: 1.0
To: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <073732E20AE4C540AE91DBC3F07D44608767613C@SHSMSX107.ccr.corp.intel.com>
References: <1559541769-25279-1-git-send-email-xiaolin.zhang@intel.com>
 <1559541769-25279-4-git-send-email-xiaolin.zhang@intel.com>
 <155963882020.4471.1671907244294890584@skylake-alporthouse-com>
 <073732E20AE4C540AE91DBC3F07D44608767613C@SHSMSX107.ccr.corp.intel.com>
Message-ID: <156015268201.2149.9122895262702363636@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v6 3/8] drm/i915: vgpu ppgtt update pv optimization
Date: Mon, 10 Jun 2019 08:44:42 +0100
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "He, Min" <min.he@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGFuZywgWGlhb2xpbiAoMjAxOS0wNi0xMCAwMjozMjoxOCkKPiBPbiAwNi8wNC8y
MDE5IDA1OjAxIFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFhpYW9saW4gWmhh
bmcgKDIwMTktMDYtMDMgMDc6MDI6NDQpCj4gPj4gK3N0YXRpYyB2b2lkIGdlbjhfcHBndHRfY2xl
YXJfNGx2bF9wdihzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICp2bSwKPiA+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdTY0IHN0YXJ0LCB1NjQgbGVuZ3RoKQo+ID4+ICt7Cj4g
Pj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9od19wcGd0dCAqcHBndHQgPSBpOTE1X3ZtX3RvX3BwZ3R0
KHZtKTsKPiA+PiArICAgICAgIHN0cnVjdCBpOTE1X3BtbDQgKnBtbDQgPSAmcHBndHQtPnBtbDQ7
Cj4gPj4gKyAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB2bS0+aTkx
NTsKPiA+PiArICAgICAgIHN0cnVjdCBwdl9wcGd0dF91cGRhdGUgKnB2X3BwZ3R0ID0KPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAmZGV2X3ByaXYtPnZncHUuc2hhcmVkX3BhZ2UtPmJ1Zi5w
dl9wcGd0dDsKPiA+PiArICAgICAgIHU2NCBvcmlnX3N0YXJ0ID0gc3RhcnQ7Cj4gPj4gKyAgICAg
ICB1NjQgb3JpZ19sZW5ndGggPSBsZW5ndGg7Cj4gPj4gKwo+ID4+ICsgICAgICAgZ2VuOF9wcGd0
dF9jbGVhcl80bHZsKHZtLCBzdGFydCwgbGVuZ3RoKTsKPiA+PiArCj4gPj4gKyAgICAgICBwdl9w
cGd0dC0+cGRwID0gcHhfZG1hKHBtbDQpOwo+ID4+ICsgICAgICAgcHZfcHBndHQtPnN0YXJ0ID0g
b3JpZ19zdGFydDsKPiA+PiArICAgICAgIHB2X3BwZ3R0LT5sZW5ndGggPSBvcmlnX2xlbmd0aDsK
PiA+PiArICAgICAgIEk5MTVfV1JJVEUodmd0aWZfcmVnKGcydl9ub3RpZnkpLCBWR1RfRzJWX1BQ
R1RUX0w0X0NMRUFSKTsKPiA+PiArfQo+ID4+ICsKPiA+PiArc3RhdGljIHZvaWQgZ2VuOF9wcGd0
dF9pbnNlcnRfNGx2bF9wdihzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICp2bSwKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpOTE1X3ZtYSAqdm1hLAo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBpOTE1X2NhY2hlX2xldmVs
IGNhY2hlX2xldmVsLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IGZsYWdzKQo+ID4+ICt7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9od19wcGd0dCAqcHBndHQg
PSBpOTE1X3ZtX3RvX3BwZ3R0KHZtKTsKPiA+PiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiA9IHZtLT5pOTE1Owo+ID4+ICsgICAgICAgc3RydWN0IHB2X3BwZ3R0X3Vw
ZGF0ZSAqcHZfcHBndHQgPQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICZkZXZfcHJpdi0+
dmdwdS5zaGFyZWRfcGFnZS0+YnVmLnB2X3BwZ3R0Owo+ID4+ICsKPiA+PiArICAgICAgIGdlbjhf
cHBndHRfaW5zZXJ0XzRsdmwodm0sIHZtYSwgY2FjaGVfbGV2ZWwsIGZsYWdzKTsKPiA+PiArCj4g
Pj4gKyAgICAgICBwdl9wcGd0dC0+cGRwID0gcHhfZG1hKCZwcGd0dC0+cG1sNCk7Cj4gPj4gKyAg
ICAgICBwdl9wcGd0dC0+c3RhcnQgPSB2bWEtPm5vZGUuc3RhcnQ7Cj4gPj4gKyAgICAgICBwdl9w
cGd0dC0+bGVuZ3RoID0gdm1hLT5ub2RlLnNpemU7Cj4gPj4gKyAgICAgICBwdl9wcGd0dC0+Y2Fj
aGVfbGV2ZWwgPSBjYWNoZV9sZXZlbDsKPiA+PiArICAgICAgIEk5MTVfV1JJVEUodmd0aWZfcmVn
KGcydl9ub3RpZnkpLCBWR1RfRzJWX1BQR1RUX0w0X0lOU0VSVCk7Cj4gPj4gK30KPiA+IEZvciB0
aGlzIHRvIHdvcmssIGEgdmdwdSBtbWlvIHdyaXRlIG11c3QgYmUgdHJhcHBlZCBhbmQgc3VzcGVu
ZCB0aGUKPiA+IGNsaWVudCB3aGlsZSB0aGUgaG9zdCBwcm9jZXNzZXMgdGhlIHRyYXAuIE90aGVy
d2lzZSwgd2Ugd291bGQgYmUKPiA+IG92ZXJ3cml0aW5nIHRoZSBzaWRlLWNoYW5uZWwgYmVmb3Jl
IHRoZSBob3N0IHByb2Nlc3NlcyB0aGUgY29tbWFuZC4KPiA+Cj4gPiBUaGF0IHNvdW5kcyBob3Jy
aWJsZS4KPiA+IC1DaHJpcwo+IENocmlzLCB0aGFua3MgeW91ciBjb21tZW50LiBkbyB5b3UgdGhp
bmsgaXMgdGhlIHNwaW5fbG9jayB0byBwcm90ZWN0Cj4gdGhpcyBWR1BVIE1NSU8gd3JpdGUgZW5v
dWdoIHRvIGVsaW1pbmF0ZSB0aGUgc2lkZS1jaGFubmVsIGVmZmVjdD8KCkkgd291bGQgc3VnZ2Vz
dCB5b3UgY29uc2lkZXIgdXNpbmcgYSBwYWlyIG9mIGNvbW1hbmQvcmVzcG9uc2UgcmluZ3MuCi1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
