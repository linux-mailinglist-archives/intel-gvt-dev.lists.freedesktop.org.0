Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81961D24
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Jul 2019 12:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80189ACD;
	Mon,  8 Jul 2019 10:40:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BB589ACD;
 Mon,  8 Jul 2019 10:40:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17167003-1500050 for multiple; Mon, 08 Jul 2019 11:40:54 +0100
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1562549722-27046-6-git-send-email-xiaolin.zhang@intel.com>
References: <1562549722-27046-1-git-send-email-xiaolin.zhang@intel.com>
 <1562549722-27046-6-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <156258245193.9375.12983936154899943549@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH v7 5/9] drm/i915: vgpu context submission pv
 optimization
Date: Mon, 08 Jul 2019 11:40:51 +0100
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTA3LTA4IDAyOjM1OjE4KQo+ICtzdGF0aWMgdm9p
ZCBwdl9zdWJtaXQoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lLAo+ICsgICAgICAgICAg
ICAgIHN0cnVjdCBpOTE1X3JlcXVlc3QgKipvdXQsCj4gKyAgICAgICAgICAgICAgc3RydWN0IGk5
MTVfcmVxdWVzdCAqKmVuZCkKPiArewo+ICsgICAgICAgc3RydWN0IGludGVsX2VuZ2luZV9leGVj
bGlzdHMgKiBjb25zdCBleGVjbGlzdHMgPSAmZW5naW5lLT5leGVjbGlzdHM7Cj4gKyAgICAgICBz
dHJ1Y3QgaTkxNV92aXJ0dWFsX2dwdV9wdiAqcHYgPSBlbmdpbmUtPmk5MTUtPnZncHUucHY7Cj4g
KyAgICAgICBzdHJ1Y3QgcHZfc3VibWlzc2lvbiAqcHZfZWxzcCA9IHB2LT5wdl9lbHNwW2VuZ2lu
ZS0+aHdfaWRdOwo+ICsgICAgICAgc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7Cj4gKwo+ICsgICAg
ICAgdTY0IGRlc2NzWzJdOwo+ICsgICAgICAgaW50IG4sIGVycjsKPiArCj4gKyAgICAgICBtZW1z
ZXQoZGVzY3MsIDAsIHNpemVvZihkZXNjcykpOwo+ICsgICAgICAgbiA9IDA7Cj4gKyAgICAgICBk
byB7Cj4gKyAgICAgICAgICAgICAgIHJxID0gKm91dCsrOwo+ICsgICAgICAgICAgICAgICBkZXNj
c1tuKytdID0gZXhlY2xpc3RzX3VwZGF0ZV9jb250ZXh0KHJxKTsKPiArICAgICAgIH0gd2hpbGUg
KG91dCAhPSBlbmQpOwo+ICsKPiArICAgICAgIGZvciAobiA9IDA7IG4gPCBleGVjbGlzdHNfbnVt
X3BvcnRzKGV4ZWNsaXN0cyk7IG4rKykKPiArICAgICAgICAgICAgICAgcHZfZWxzcC0+ZGVzY3Nb
bl0gPSBkZXNjc1tuXTsKCllvdSBjYW4gcG9saXNoIHRoaXMgYSBiaXQsIG1pbm9yIG5pdC4KCj4g
KyAgICAgICB3cml0ZWwoUFZfQUNUSU9OX0VMU1BfU1VCTUlTU0lPTiwgZXhlY2xpc3RzLT5zdWJt
aXRfcmVnKTsKPiArCj4gKyNkZWZpbmUgZG9uZSAoUkVBRF9PTkNFKHB2X2Vsc3AtPnN1Ym1pdHRl
ZCkgPT0gdHJ1ZSkKPiArICAgICAgIGVyciA9IHdhaXRfZm9yX3VzKGRvbmUsIDEpOwo+ICsgICAg
ICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgZXJyID0gd2FpdF9mb3IoZG9uZSwgMSk7CgpT
dHJpY3RseSwgeW91IG5lZWQgdG8gdXNlIHdhaXRfZm9yX2F0b21pY191cygpIFt1bmRlciBhIHNw
aW5sb2NrIGhlcmVdLAphbmQgdGhlcmUncyBubyBuZWVkIGZvciBhIHNlY29uZCBwYXNzIHNpbmNl
IHlvdSBhcmUgbm90IGFsbG93ZWQgdG8gc2xlZXAKYW55d2F5LiBTbyBqdXN0IHNldCB0aGUgdGlt
ZW91dCB0byAxMDAwdXMuCgo+ICsjdW5kZWYgZG9uZQo+ICsKPiArICAgICAgIGlmICh1bmxpa2Vs
eShlcnIpKQo+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoIlBWICglcykgd29ya2xvYWQgc3Vi
bWlzc2lvbiBmYWlsZWRcbiIsIGVuZ2luZS0+bmFtZSk7Cj4gKwo+ICsgICAgICAgcHZfZWxzcC0+
c3VibWl0dGVkID0gZmFsc2U7CgpIb3dldmVyLCB0aGF0IGxvb2tzIHNvbGlkIHdydCB0byBzZXJp
YWxpc2F0aW9uIG9mIHRoaXMgZW5naW5lIHdpdGggaXRzCnB2IGhvc3QsIHdpdGhvdXQgY3Jvc3Mt
aW50ZXJmZXJlbmNlIChhdCBsZWFzdCBpbiB0aGUgY29tbXMgY2hhbm5lbCkuCgpJZiB5b3Ugd2Fu
dCB0byBnZXQgZmFuY3ksIHlvdSBzaG91bGQgYmUgYWJsZSB0byBzaW1wbHkgbm90IGRlcXVldWUg
dW50aWwKIXB2X2Vsc3AtPnN1Ym1pdHRlZCBzbyB0aGUgd2FpdC1mb3ItYWNrIG9jY3VycyBuYXR1
cmFsbHkuIFNvIGxvbmcgYXMgdGhlCnB2IGhvc3QgcGxheXMgbmljZWx5LCB3ZSBzaG91bGQgYWx3
YXlzIHNlZSBzdWJtaXR0ZWQgYWNrZWQgYmVmb3JlIHRoZQpyZXF1ZXN0IGlzIHNpZ25hbGVkLiBH
aXZlIG9yIHRha2UgcHJvYmxlbXMgd2l0aCBwcmVlbXB0aW9uIGFuZCB0aGUgcHYKaG9zdCBiZWlu
ZyBhIGJsYWNrIGJveCB0aGF0IG1heSBhbGxvdyByZXF1ZXN0cyB0byBjb21wbGV0ZSBhbmQgc28g
b3VyCnN1Ym1pc3Npb24gYmUgYSBuby1vcCAoYW5kIHNvIG5vdCBnZW5lcmF0ZSBhbiBpbnRlcnJ1
cHQgdG8gYWxsb3cgZnVydGhlcgpzdWJtaXNzaW9uKS4gSW5kZWVkLCBJIHdvdWxkIHN0cm9uZ2x5
IHJlY29tbWVuZCB5b3UgdXNlIHRoZSBkZWxheWVkIGFjawpwbHVzIGppZmZpZSB0aW1lciB0byBh
dm9pZCB0aGUgbm8tb3Agc3VibWlzc2lvbiBwcm9ibGVtLgoKSWYgeW91IHdhbnQgdG8gcHJvdmUg
dGhpcyBpbiBhIGJ1bmNoIG9mIG1vY2tlZCB1cCBzZWxmdGVzdHMgdGhhdCBwcm92aWRlCnRoZSBw
diBjaGFubmVsIG9udG9wIG9mIHRoZSBsb2NhbCBkcml2ZXIuLi4uCi1DaHJpcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
