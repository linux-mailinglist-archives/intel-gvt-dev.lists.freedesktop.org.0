Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C05634300
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 11:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2438972B;
	Tue,  4 Jun 2019 09:17:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4279B89722;
 Tue,  4 Jun 2019 09:17:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16784180-1500050 for multiple; Tue, 04 Jun 2019 10:00:24 +0100
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1559541769-25279-4-git-send-email-xiaolin.zhang@intel.com>
References: <1559541769-25279-1-git-send-email-xiaolin.zhang@intel.com>
 <1559541769-25279-4-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <155963882020.4471.1671907244294890584@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v6 3/8] drm/i915: vgpu ppgtt update pv optimization
Date: Tue, 04 Jun 2019 10:00:20 +0100
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTA2LTAzIDA3OjAyOjQ0KQo+ICtzdGF0aWMgdm9p
ZCBnZW44X3BwZ3R0X2NsZWFyXzRsdmxfcHYoc3RydWN0IGk5MTVfYWRkcmVzc19zcGFjZSAqdm0s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBzdGFydCwgdTY0IGxlbmd0
aCkKPiArewo+ICsgICAgICAgc3RydWN0IGk5MTVfaHdfcHBndHQgKnBwZ3R0ID0gaTkxNV92bV90
b19wcGd0dCh2bSk7Cj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9wbWw0ICpwbWw0ID0gJnBwZ3R0LT5w
bWw0Owo+ICsgICAgICAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdm0tPmk5
MTU7Cj4gKyAgICAgICBzdHJ1Y3QgcHZfcHBndHRfdXBkYXRlICpwdl9wcGd0dCA9Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgJmRldl9wcml2LT52Z3B1LnNoYXJlZF9wYWdlLT5idWYucHZfcHBn
dHQ7Cj4gKyAgICAgICB1NjQgb3JpZ19zdGFydCA9IHN0YXJ0Owo+ICsgICAgICAgdTY0IG9yaWdf
bGVuZ3RoID0gbGVuZ3RoOwo+ICsKPiArICAgICAgIGdlbjhfcHBndHRfY2xlYXJfNGx2bCh2bSwg
c3RhcnQsIGxlbmd0aCk7Cj4gKwo+ICsgICAgICAgcHZfcHBndHQtPnBkcCA9IHB4X2RtYShwbWw0
KTsKPiArICAgICAgIHB2X3BwZ3R0LT5zdGFydCA9IG9yaWdfc3RhcnQ7Cj4gKyAgICAgICBwdl9w
cGd0dC0+bGVuZ3RoID0gb3JpZ19sZW5ndGg7Cj4gKyAgICAgICBJOTE1X1dSSVRFKHZndGlmX3Jl
ZyhnMnZfbm90aWZ5KSwgVkdUX0cyVl9QUEdUVF9MNF9DTEVBUik7Cj4gK30KPiArCj4gK3N0YXRp
YyB2b2lkIGdlbjhfcHBndHRfaW5zZXJ0XzRsdmxfcHYoc3RydWN0IGk5MTVfYWRkcmVzc19zcGFj
ZSAqdm0sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaTkxNV92
bWEgKnZtYSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaTkxNV9j
YWNoZV9sZXZlbCBjYWNoZV9sZXZlbCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHUzMiBmbGFncykKPiArewo+ICsgICAgICAgc3RydWN0IGk5MTVfaHdfcHBndHQgKnBwZ3R0
ID0gaTkxNV92bV90b19wcGd0dCh2bSk7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYgPSB2bS0+aTkxNTsKPiArICAgICAgIHN0cnVjdCBwdl9wcGd0dF91cGRhdGUg
KnB2X3BwZ3R0ID0KPiArICAgICAgICAgICAgICAgICAgICAgICAmZGV2X3ByaXYtPnZncHUuc2hh
cmVkX3BhZ2UtPmJ1Zi5wdl9wcGd0dDsKPiArCj4gKyAgICAgICBnZW44X3BwZ3R0X2luc2VydF80
bHZsKHZtLCB2bWEsIGNhY2hlX2xldmVsLCBmbGFncyk7Cj4gKwo+ICsgICAgICAgcHZfcHBndHQt
PnBkcCA9IHB4X2RtYSgmcHBndHQtPnBtbDQpOwo+ICsgICAgICAgcHZfcHBndHQtPnN0YXJ0ID0g
dm1hLT5ub2RlLnN0YXJ0Owo+ICsgICAgICAgcHZfcHBndHQtPmxlbmd0aCA9IHZtYS0+bm9kZS5z
aXplOwo+ICsgICAgICAgcHZfcHBndHQtPmNhY2hlX2xldmVsID0gY2FjaGVfbGV2ZWw7Cj4gKyAg
ICAgICBJOTE1X1dSSVRFKHZndGlmX3JlZyhnMnZfbm90aWZ5KSwgVkdUX0cyVl9QUEdUVF9MNF9J
TlNFUlQpOwo+ICt9CgpGb3IgdGhpcyB0byB3b3JrLCBhIHZncHUgbW1pbyB3cml0ZSBtdXN0IGJl
IHRyYXBwZWQgYW5kIHN1c3BlbmQgdGhlCmNsaWVudCB3aGlsZSB0aGUgaG9zdCBwcm9jZXNzZXMg
dGhlIHRyYXAuIE90aGVyd2lzZSwgd2Ugd291bGQgYmUKb3ZlcndyaXRpbmcgdGhlIHNpZGUtY2hh
bm5lbCBiZWZvcmUgdGhlIGhvc3QgcHJvY2Vzc2VzIHRoZSBjb21tYW5kLgoKVGhhdCBzb3VuZHMg
aG9ycmlibGUuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
