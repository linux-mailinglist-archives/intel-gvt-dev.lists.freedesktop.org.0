Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BDAF4012
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Nov 2019 06:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D806F835;
	Fri,  8 Nov 2019 05:43:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1711 seconds by postgrey-1.36 at gabe;
 Fri, 08 Nov 2019 05:43:31 UTC
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D496E5BF;
 Fri,  8 Nov 2019 05:43:30 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id xA85hAqI017114;
 Fri, 8 Nov 2019 14:43:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xA85hAqI017114
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id y23so3022586vso.1;
 Thu, 07 Nov 2019 21:43:11 -0800 (PST)
X-Gm-Message-State: APjAAAU6EyFhLmEtSE3taXjrpYALfxGD1QFou4VLsuLci1im6DZC+ifU
 I9lDjLJUNxquUAp26DA+BMSBmPpiqnsBUW+IdNg=
X-Google-Smtp-Source: APXvYqzFZ/7b6NKCOgjPE2Y1caYatrAiBl7F6D8unziYAwgq3DdhyY+2Rp2jyqtT5GujnUf2ds9kT4mFWboTPl9DTvg=
X-Received: by 2002:a67:e290:: with SMTP id g16mr6420977vsf.54.1573191789696; 
 Thu, 07 Nov 2019 21:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20191108051356.29980-1-yamada.masahiro@socionext.com>
 <20191108051356.29980-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191108051356.29980-2-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Nov 2019 14:42:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_gmkpHojSm-3vooqFqJZUan7ut83MHbxp=4bNTrmuig@mail.gmail.com>
Message-ID: <CAK7LNAR_gmkpHojSm-3vooqFqJZUan7ut83MHbxp=4bNTrmuig@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: make more headers self-contained
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1573191791;
 bh=rWfRG0vGczXXh1HRjIPA1FpUvlWYaxUQjl/t6nm9mTk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BqoZMkseYYDo2vCl9XVEAoWv2bojN64pALLbyG0gY8LCueNWCCYPjoqI4C0bIOpGO
 H3YRLHUzR+aKhCtN8BzyhfLBJx4kefneOkt0sHOHz1d2m8S9wZ6w3PhkderkFqCkE1
 hme2ft1yv9hN7bikVXMgUMXHdmW6CuIeB3TQlypzoKBUMIhmz8c40jio3RRgwpM54A
 FBqfOJLz1lMeEXX+pdiPyJRivCnwHloUNJHUBM5NFmJNvWBU3wg1xG+zjI2ibfqQA7
 Q3x2harw4gRKaLKSY/JrpV6/p6ORfWShwfiqMN1DuPC1DoZMtIUKrtmgmJKyrGKr83
 14SOjpTaF/rHw==
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAyOjE1IFBNIE1hc2FoaXJvIFlhbWFkYQo8eWFtYWRhLm1h
c2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlOgo+Cj4gVGhlIGhlYWRlcnMgaW4gdGhlIGdlbS9z
ZWxmdGVzdHMvLCBndC9zZWxmdGVzdHMsIGd2dC8sIHNlbGZ0ZXN0cy8KPiBkaXJlY3RvcmllcyBo
YXZlIG5ldmVyIGJlZW4gY29tcGlsZS10ZXN0ZWQsIGJ1dCBpdCB3b3VsZCBiZSBwb3NzaWJsZQo+
IHRvIG1ha2UgdGhlbSBzZWxmLWNvbnRhaW5lZC4KPgo+IFRoaXMgY29tbWl0IG9ubHkgYWRkcmVz
c2VzIG1pc3NpbmcgPGxpbnV4L3R5cGVzLmg+IGFuZCBmb3J3YXJkCj4gc3RydWN0IGRlY2xhcmF0
aW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJv
QHNvY2lvbmV4dC5jb20+Cj4gLS0tCgpJIGNvbmZpcm1lZCB0aGlzIHBhdGNoIGlzIGFwcGxpY2Fi
bGUgdG8gbmV4dC0yMDE5MTEwNwpidXQgQ0kgZmFpbHMgdG8gYXBwbHkgaXQuCgpXaGljaCBicmFu
Y2ggc2hvdWxkIEkgYmFzZSBteSBwYXRjaCBvbj8KCgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9zZWxmdGVzdHMvbW9ja19jb250ZXh0LmggfCAzICsrKwo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9zZWxmdGVzdHMvbW9ja190aW1lbGluZS5oIHwgMiArKwo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvY21kX3BhcnNlci5oICAgICAgICAgICAgIHwgNCArKysrCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmggICAgICAgICAgICAgICAgfCA1ICsrKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9lZGlkLmggICAgICAgICAgICAgICAgICAgfCA0ICsrKysK
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmggICAgICAgICAgICAgICB8IDIg
KysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuaCAgICAgICAgICAgICB8
IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oICAgICAgICAgICAg
ICB8IDQgKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmggICAgICAg
ICAgICAgIHwgMyArKysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uaCAgICAgICAg
ICAgICAgICAgICB8IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3BhZ2VfdHJhY2su
aCAgICAgICAgICAgICB8IDMgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZF9w
b2xpY3kuaCAgICAgICAgICAgfCAzICsrKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVz
dHMvbW9ja19kcm0uaCAgICAgICAgIHwgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxm
dGVzdHMvbW9ja19ndHQuaCAgICAgICAgIHwgMyArKysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
c2VsZnRlc3RzL21vY2tfcmVnaW9uLmggICAgICB8IDUgKysrKysKPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvc2VsZnRlc3RzL21vY2tfdW5jb3JlLmggICAgICB8IDMgKysrCj4gIDE2IGZpbGVzIGNo
YW5nZWQsIDUwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vc2VsZnRlc3RzL21vY2tfY29udGV4dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL3NlbGZ0ZXN0cy9tb2NrX2NvbnRleHQuaAo+IGluZGV4IDBiOTI2NjUzOTE0Zi4uNDVkZTA5
ZWMyOGQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMv
bW9ja19jb250ZXh0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3Rz
L21vY2tfY29udGV4dC5oCj4gQEAgLTcsNiArNyw5IEBACj4gICNpZm5kZWYgX19NT0NLX0NPTlRF
WFRfSAo+ICAjZGVmaW5lIF9fTU9DS19DT05URVhUX0gKPgo+ICtzdHJ1Y3QgZHJtX2ZpbGU7Cj4g
K3N0cnVjdCBkcm1faTkxNV9wcml2YXRlOwo+ICsKPiAgdm9pZCBtb2NrX2luaXRfY29udGV4dHMo
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpOwo+Cj4gIHN0cnVjdCBpOTE1X2dlbV9jb250
ZXh0ICoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RzL21v
Y2tfdGltZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0cy9tb2NrX3Rp
bWVsaW5lLmgKPiBpbmRleCA2ODllZmM2NmM5MDguLmQyYmNjM2RmNjE4MyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdHMvbW9ja190aW1lbGluZS5oCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RzL21vY2tfdGltZWxpbmUuaAo+IEBA
IC03LDYgKzcsOCBAQAo+ICAjaWZuZGVmIF9fTU9DS19USU1FTElORV9fCj4gICNkZWZpbmUgX19N
T0NLX1RJTUVMSU5FX18KPgo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiArCj4gIHN0cnVj
dCBpbnRlbF90aW1lbGluZTsKPgo+ICB2b2lkIG1vY2tfdGltZWxpbmVfaW5pdChzdHJ1Y3QgaW50
ZWxfdGltZWxpbmUgKnRpbWVsaW5lLCB1NjQgY29udGV4dCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvY21kX3BhcnNlci5oCj4gaW5kZXggMjg2NzAzNjQzMDAyLi5hYjI1ZDE1MTkzMmEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmgKPiBAQCAtMzgsNiArMzgsMTAgQEAK
Pgo+ICAjZGVmaW5lIEdWVF9DTURfSEFTSF9CSVRTIDcKPgo+ICtzdHJ1Y3QgaW50ZWxfZ3Z0Owo+
ICtzdHJ1Y3QgaW50ZWxfc2hhZG93X3dhX2N0eDsKPiArc3RydWN0IGludGVsX3ZncHVfd29ya2xv
YWQ7Cj4gKwo+ICB2b2lkIGludGVsX2d2dF9jbGVhbl9jbWRfcGFyc2VyKHN0cnVjdCBpbnRlbF9n
dnQgKmd2dCk7Cj4KPiAgaW50IGludGVsX2d2dF9pbml0X2NtZF9wYXJzZXIoc3RydWN0IGludGVs
X2d2dCAqZ3Z0KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3Bs
YXkuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmgKPiBpbmRleCBhODdmMzNl
NmEyM2MuLmI1OWIzNDA0NmUxZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZGlzcGxheS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuaAo+
IEBAIC0zNSw2ICszNSwxMSBAQAo+ICAjaWZuZGVmIF9HVlRfRElTUExBWV9IXwo+ICAjZGVmaW5l
IF9HVlRfRElTUExBWV9IXwo+Cj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsKPiArc3Ry
dWN0IGludGVsX2d2dDsKPiArc3RydWN0IGludGVsX3ZncHU7Cj4gKwo+ICAjZGVmaW5lIFNCSV9S
RUdfTUFYICAgIDIwCj4gICNkZWZpbmUgRFBDRF9TSVpFICAgICAgMHg3MDAKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZWRpZC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2VkaWQuaAo+IGluZGV4IGY2ZGZjOGI3OTVlYy4uZGZlMGNiYzZhYWQ4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9lZGlkLmgKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZWRpZC5oCj4gQEAgLTM1LDYgKzM1LDEwIEBACj4gICNpZm5kZWYgX0dW
VF9FRElEX0hfCj4gICNkZWZpbmUgX0dWVF9FRElEX0hfCj4KPiArI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+Cj4gKwo+ICtzdHJ1Y3QgaW50ZWxfdmdwdTsKPiArCj4gICNkZWZpbmUgRURJRF9TSVpF
ICAgICAgICAgICAgICAxMjgKPiAgI2RlZmluZSBFRElEX0FERFIgICAgICAgICAgICAgIDB4NTAg
LyogTGludXggaHZtIEVESUQgYWRkciAqLwo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9leGVjbGlzdC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0
LmgKPiBpbmRleCA1Y2NjMmM2OTU4NDguLjVjMGMxZmQzMGM4MyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZXhlY2xpc3QuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9leGVjbGlzdC5oCj4gQEAgLTM1LDYgKzM1LDggQEAKPiAgI2lmbmRlZiBfR1ZUX0VY
RUNMSVNUX0hfCj4gICNkZWZpbmUgX0dWVF9FWEVDTElTVF9IXwo+Cj4gKyNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPgo+ICsKPiAgc3RydWN0IGV4ZWNsaXN0X2N0eF9kZXNjcmlwdG9yX2Zvcm1hdCB7
Cj4gICAgICAgICB1bmlvbiB7Cj4gICAgICAgICAgICAgICAgIHUzMiBsZHc7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmggYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5oCj4gaW5kZXggNjBjMTU1MDg1MDI5Li42N2I2ZWRlOWU3
MDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuaAo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmgKPiBAQCAtMzYsNiAr
MzYsOCBAQAo+ICAjaWZuZGVmIF9HVlRfRkJfREVDT0RFUl9IXwo+ICAjZGVmaW5lIF9HVlRfRkJf
REVDT0RFUl9IXwo+Cj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsKPiAgI2RlZmluZSBf
UExBTkVfQ1RMX0ZPUk1BVF9TSElGVCAgICAgICAgICAgICAgICAyNAo+ICAjZGVmaW5lIF9QTEFO
RV9DVExfVElMRURfU0hJRlQgICAgICAgICAxMAo+ICAjZGVmaW5lIF9QSVBFX1ZfU1JDU1pfU0hJ
RlQgICAgICAgICAgICAwCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9o
eXBlcmNhbGwuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaAo+IGluZGV4
IDQ4NjJmYjEyNzc4ZS4uOTU5OWMwYTc2MmIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oeXBlcmNhbGwuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9o
eXBlcmNhbGwuaAo+IEBAIC0zMyw2ICszMywxMCBAQAo+ICAjaWZuZGVmIF9HVlRfSFlQRVJDQUxM
X0hfCj4gICNkZWZpbmUgX0dWVF9IWVBFUkNBTExfSF8KPgo+ICsjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4KPiArCj4gK3N0cnVjdCBkZXZpY2U7Cj4gKwo+ICBlbnVtIGh5cGVydmlzb3JfdHlwZSB7
Cj4gICAgICAgICBJTlRFTF9HVlRfSFlQRVJWSVNPUl9YRU4gPSAwLAo+ICAgICAgICAgSU5URUxf
R1ZUX0hZUEVSVklTT1JfS1ZNLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaW50ZXJydXB0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmgKPiBp
bmRleCA1MzEzZmIxYjMzZTEuLmZjZDY2MzgxMWQzNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaW50ZXJydXB0LmgKPiBAQCAtMzIsNiArMzIsOCBAQAo+ICAjaWZuZGVmIF9HVlRfSU5URVJS
VVBUX0hfCj4gICNkZWZpbmUgX0dWVF9JTlRFUlJVUFRfSF8KPgo+ICsjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4KPiArCj4gIGVudW0gaW50ZWxfZ3Z0X2V2ZW50X3R5cGUgewo+ICAgICAgICAgUkNT
X01JX1VTRVJfSU5URVJSVVBUID0gMCwKPiAgICAgICAgIFJDU19ERUJVRywKPiBAQCAtMTM1LDYg
KzEzNyw3IEBAIGVudW0gaW50ZWxfZ3Z0X2V2ZW50X3R5cGUgewo+Cj4gIHN0cnVjdCBpbnRlbF9n
dnRfaXJxOwo+ICBzdHJ1Y3QgaW50ZWxfZ3Z0Owo+ICtzdHJ1Y3QgaW50ZWxfdmdwdTsKPgo+ICB0
eXBlZGVmIHZvaWQgKCpndnRfZXZlbnRfdmlydF9oYW5kbGVyX3QpKHN0cnVjdCBpbnRlbF9ndnRf
aXJxICppcnEsCj4gICAgICAgICBlbnVtIGludGVsX2d2dF9ldmVudF90eXBlIGV2ZW50LCBzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9tbWlvLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5oCj4gaW5kZXggNTg3
NGYxY2I0MzA2Li4yZTY4ZjRiMDJjOTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L21taW8uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmgKPiBA
QCAtMzYsNiArMzYsOCBAQAo+ICAjaWZuZGVmIF9HVlRfTU1JT19IXwo+ICAjZGVmaW5lIF9HVlRf
TU1JT19IXwo+Cj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsKPiAgc3RydWN0IGludGVs
X2d2dDsKPiAgc3RydWN0IGludGVsX3ZncHU7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3BhZ2VfdHJhY2suaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9wYWdl
X3RyYWNrLmgKPiBpbmRleCBmYTYwN2E3MWMzYzAuLmY2ZWI3MTM1NTgzYyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcGFnZV90cmFjay5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3BhZ2VfdHJhY2suaAo+IEBAIC0yNSw2ICsyNSw5IEBACj4gICNpZm5k
ZWYgX0dWVF9QQUdFX1RSQUNLX0hfCj4gICNkZWZpbmUgX0dWVF9QQUdFX1RSQUNLX0hfCj4KPiAr
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gKwo+ICtzdHJ1Y3QgaW50ZWxfdmdwdTsKPiAgc3Ry
dWN0IGludGVsX3ZncHVfcGFnZV90cmFjazsKPgo+ICB0eXBlZGVmIGludCAoKmd2dF9wYWdlX3Ry
YWNrX2hhbmRsZXJfdCkoCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9z
Y2hlZF9wb2xpY3kuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZF9wb2xpY3kuaAo+
IGluZGV4IDdiNTllM2U4OGI4Yi4uM2RhY2RhZDVmNTI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZF9wb2xpY3kuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9zY2hlZF9wb2xpY3kuaAo+IEBAIC0zNCw2ICszNCw5IEBACj4gICNpZm5kZWYgX19H
VlRfU0NIRURfUE9MSUNZX18KPiAgI2RlZmluZSBfX0dWVF9TQ0hFRF9QT0xJQ1lfXwo+Cj4gK3N0
cnVjdCBpbnRlbF9ndnQ7Cj4gK3N0cnVjdCBpbnRlbF92Z3B1Owo+ICsKPiAgc3RydWN0IGludGVs
X2d2dF9zY2hlZF9wb2xpY3lfb3BzIHsKPiAgICAgICAgIGludCAoKmluaXQpKHN0cnVjdCBpbnRl
bF9ndnQgKmd2dCk7Cj4gICAgICAgICB2b2lkICgqY2xlYW4pKHN0cnVjdCBpbnRlbF9ndnQgKmd2
dCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9tb2NrX2Ry
bS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL21vY2tfZHJtLmgKPiBpbmRleCBi
MzliZWVlOWY4ZjYuLjVmMmFiYTg0M2ZhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9zZWxmdGVzdHMvbW9ja19kcm0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3Nl
bGZ0ZXN0cy9tb2NrX2RybS5oCj4gQEAgLTI1LDYgKzI1LDggQEAKPiAgI2lmbmRlZiBfX01PQ0tf
RFJNX0gKPiAgI2RlZmluZSBfX01PQ0tfRFJNX0gKPgo+ICtzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZTsKPiArCj4gIHN0cnVjdCBkcm1fZmlsZSAqbW9ja19maWxlKHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICppOTE1KTsKPiAgdm9pZCBtb2NrX2ZpbGVfZnJlZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqaTkxNSwgc3RydWN0IGRybV9maWxlICpmaWxlKTsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvbW9ja19ndHQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L3NlbGZ0ZXN0cy9tb2NrX2d0dC5oCj4gaW5kZXggMzM4NzM5MzI4NmRlLi5lM2YyMjRmNDNiZWIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL21vY2tfZ3R0LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvbW9ja19ndHQuaAo+IEBAIC0y
NSw2ICsyNSw5IEBACj4gICNpZm5kZWYgX19NT0NLX0dUVF9ICj4gICNkZWZpbmUgX19NT0NLX0dU
VF9ICj4KPiArc3RydWN0IGRybV9pOTE1X3ByaXZhdGU7Cj4gK3N0cnVjdCBpOTE1X2dndHQ7Cj4g
Kwo+ICB2b2lkIG1vY2tfaW5pdF9nZ3R0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LCBz
dHJ1Y3QgaTkxNV9nZ3R0ICpnZ3R0KTsKPiAgdm9pZCBtb2NrX2ZpbmlfZ2d0dChzdHJ1Y3QgaTkx
NV9nZ3R0ICpnZ3R0KTsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxm
dGVzdHMvbW9ja19yZWdpb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9tb2Nr
X3JlZ2lvbi5oCj4gaW5kZXggMjQ2MDgwODlkODMzLi4zMjliZjc0ZGZhY2EgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL21vY2tfcmVnaW9uLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxmdGVzdHMvbW9ja19yZWdpb24uaAo+IEBAIC02LDYgKzYs
MTEgQEAKPiAgI2lmbmRlZiBfX01PQ0tfUkVHSU9OX0gKPiAgI2RlZmluZSBfX01PQ0tfUkVHSU9O
X0gKPgo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiArCj4gK3N0cnVjdCBkcm1faTkxNV9w
cml2YXRlOwo+ICtzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbjsKPiArCj4gIHN0cnVjdCBpbnRl
bF9tZW1vcnlfcmVnaW9uICoKPiAgbW9ja19yZWdpb25fY3JlYXRlKHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICppOTE1LAo+ICAgICAgICAgICAgICAgICAgICByZXNvdXJjZV9zaXplX3Qgc3RhcnQs
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9tb2NrX3VuY29y
ZS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL21vY2tfdW5jb3JlLmgKPiBpbmRl
eCA4YTJjYzU1M2Y0NjYuLjdhY2YxZWY0ZDQ4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9zZWxmdGVzdHMvbW9ja191bmNvcmUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L3NlbGZ0ZXN0cy9tb2NrX3VuY29yZS5oCj4gQEAgLTI1LDYgKzI1LDkgQEAKPiAgI2lmbmRl
ZiBfX01PQ0tfVU5DT1JFX0gKPiAgI2RlZmluZSBfX01PQ0tfVU5DT1JFX0gKPgo+ICtzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZTsKPiArc3RydWN0IGludGVsX3VuY29yZTsKPiArCj4gIHZvaWQgbW9j
a191bmNvcmVfaW5pdChzdHJ1Y3QgaW50ZWxfdW5jb3JlICp1bmNvcmUsCj4gICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KTsKPgo+IC0tCj4gMi4xNy4x
Cj4KCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
