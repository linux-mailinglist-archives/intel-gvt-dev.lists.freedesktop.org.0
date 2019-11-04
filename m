Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDFEEBCA
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  4 Nov 2019 22:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041116E899;
	Mon,  4 Nov 2019 21:51:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DEE6E88E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Nov 2019 21:51:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-iSJhyMx1MLeaIJDzakQDTQ-1; Mon, 04 Nov 2019 16:51:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA4091800D53;
 Mon,  4 Nov 2019 21:51:02 +0000 (UTC)
Received: from x1.home (ovpn-116-110.phx2.redhat.com [10.3.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 668265D729;
 Mon,  4 Nov 2019 21:50:52 +0000 (UTC)
Date: Mon, 4 Nov 2019 14:50:08 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V7 3/6] mdev: introduce device specific ops
Message-ID: <20191104145008.4b6839f0@x1.home>
In-Reply-To: <20191104123952.17276-4-jasowang@redhat.com>
References: <20191104123952.17276-1-jasowang@redhat.com>
 <20191104123952.17276-4-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: iSJhyMx1MLeaIJDzakQDTQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572904270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krYUvblqoy57T0eKJRfErQM0uPjkgJEwDiA0BG9w6ug=;
 b=QDGsasVkBr6xbK0W1gnR1/paF9C4Zsgeh13dMsEIpwZVPf/l35hqff9HAJsVHgLe9mElKV
 heyJ9De9kiA3yQ5qxGGq3JcajWeQ1vUpDAJduJB6bHE5pgvaDFZZwd8a7HNDfiM2jjpFWQ
 i1SXquDb5d78thl2ZP6UcZsim1nKECU=
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAgNCBOb3YgMjAxOSAyMDozOTo0OSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gQ3VycmVudGx5LCBleGNlcHQgZm9yIHRoZSBjcmVhdGUgYW5k
IHJlbW92ZSwgdGhlIHJlc3Qgb2YKPiBtZGV2X3BhcmVudF9vcHMgaXMgZGVzaWduZWQgZm9yIHZm
aW8tbWRldiBkcml2ZXIgb25seSBhbmQgbWF5IG5vdCBoZWxwCj4gZm9yIGtlcm5lbCBtZGV2IGRy
aXZlci4gV2l0aCB0aGUgaGVscCBvZiBjbGFzcyBpZCwgdGhpcyBwYXRjaAo+IGludHJvZHVjZXMg
ZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBpbnNpZGUgbWRldl9kZXZpY2UKPiBzdHJ1Y3R1cmUu
IFRoaXMgYWxsb3dzIGRpZmZlcmVudCBzZXQgb2YgY2FsbGJhY2sgdG8gYmUgdXNlZCBieQo+IHZm
aW8tbWRldiBhbmQgdmlydGlvLW1kZXYuCj4gCj4gUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8
cGFyYXZAbWVsbGFub3guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+Cj4gLS0tCj4gIC4uLi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNl
LnJzdCAgICAgICB8IDM1ICsrKysrKysrKy0tLS0KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
a3ZtZ3QuYyAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4gIGRyaXZlcnMvczM5MC9jaW8vdmZp
b19jY3dfb3BzLmMgICAgICAgICAgICAgICB8IDE4ICsrKystLS0KPiAgZHJpdmVycy9zMzkwL2Ny
eXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgMTQgKysrLS0KPiAgZHJpdmVycy92Zmlv
L21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKystCj4gIGRyaXZl
cnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICB8ICA1ICsrCj4gIGRyaXZl
cnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKy0tLS0t
LS0KPiAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDMg
KysrKy0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbWRldl92ZmlvX29wcy5oICAgICAgICAg
ICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJv
Y2hzLmMgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKy0tLQo+ICBzYW1wbGVzL3ZmaW8tbWRl
di9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrLS0tCj4gIHNhbXBsZXMvdmZp
by1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKystLS0KPiAgMTMgZmls
ZXMgY2hhbmdlZCwgMjA2IGluc2VydGlvbnMoKyksIDEwMCBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWRldl92ZmlvX29wcy5oCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgYi9E
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4gaW5kZXgg
NjcwOTQxM2JlZTI5Li5lMzVmMWY4Zjk0NmUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKPiBAQCAtMTUyLDE1ICsxNTIsNiBA
QCBjYWxsYmFja3MgcGVyIG1kZXYgcGFyZW50IGRldmljZSwgcGVyIG1kZXYgdHlwZSwgb3IgYW55
IG90aGVyIGNhdGVnb3JpemF0aW9uLgo+ICBWZW5kb3IgZHJpdmVycyBhcmUgZXhwZWN0ZWQgdG8g
YmUgZnVsbHkgYXN5bmNocm9ub3VzIGluIHRoaXMgcmVzcGVjdCBvcgo+ICBwcm92aWRlIHRoZWly
IG93biBpbnRlcm5hbCByZXNvdXJjZSBwcm90ZWN0aW9uLikKPiAgCj4gLVRoZSBjYWxsYmFja3Mg
aW4gdGhlIG1kZXZfcGFyZW50X29wcyBzdHJ1Y3R1cmUgYXJlIGFzIGZvbGxvd3M6Cj4gLQo+IC0q
IG9wZW46IG9wZW4gY2FsbGJhY2sgb2YgbWVkaWF0ZWQgZGV2aWNlCj4gLSogY2xvc2U6IGNsb3Nl
IGNhbGxiYWNrIG9mIG1lZGlhdGVkIGRldmljZQo+IC0qIGlvY3RsOiBpb2N0bCBjYWxsYmFjayBv
ZiBtZWRpYXRlZCBkZXZpY2UKPiAtKiByZWFkIDogcmVhZCBlbXVsYXRpb24gY2FsbGJhY2sKPiAt
KiB3cml0ZTogd3JpdGUgZW11bGF0aW9uIGNhbGxiYWNrCj4gLSogbW1hcDogbW1hcCBlbXVsYXRp
b24gY2FsbGJhY2sKPiAtCj4gIEEgZHJpdmVyIHNob3VsZCB1c2UgdGhlIG1kZXZfcGFyZW50X29w
cyBzdHJ1Y3R1cmUgaW4gdGhlIGZ1bmN0aW9uIGNhbGwgdG8KPiAgcmVnaXN0ZXIgaXRzZWxmIHdp
dGggdGhlIG1kZXYgY29yZSBkcml2ZXI6Ogo+ICAKPiBAQCAtMTcyLDEwICsxNjMsMzQgQEAgdGhh
dCBhIGRyaXZlciBzaG91bGQgdXNlIHRvIHVucmVnaXN0ZXIgaXRzZWxmIHdpdGggdGhlIG1kZXYg
Y29yZSBkcml2ZXI6Ogo+ICAKPiAgCWV4dGVybiB2b2lkIG1kZXZfdW5yZWdpc3Rlcl9kZXZpY2Uo
c3RydWN0IGRldmljZSAqZGV2KTsKPiAgCj4gLUl0IGlzIGFsc28gcmVxdWlyZWQgdG8gc3BlY2lm
eSB0aGUgY2xhc3NfaWQgaW4gY3JlYXRlKCkgY2FsbGJhY2sgdGhyb3VnaDo6Cj4gK0FzIG11bHRp
cGxlIHR5cGVzIG9mIG1lZGlhdGVkIGRldmljZXMgbWF5IGJlIHN1cHBvcnRlZCwgY2xhc3MgaWQg
bmVlZHMKPiArdG8gYmUgc3BlY2lmaWVkIGluIHRoZSBjcmVhdGUgY2FsbGJhY2soKS4gVGhpcyBj
b3VsZCBiZSBkb25lCj4gK2V4cGxpY2l0bHkgZm9yIHRoZSBkZXZpY2UgdGhhdCBkb2VzIG5vdCB1
c2Ugb24gbWRldiBidXMgZm9yIGl0cwo+ICtvcGVyYXRpb24gdGhyb3VnaDoKPiAgCj4gIAlpbnQg
bWRldl9zZXRfY2xhc3Moc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWQpOwo+ICAKPiAr
Rm9yIHRoZSBkZXZpY2UgdGhhdCB1c2VzIG9uIHRoZSBtZGV2IGJ1cyBmb3IgaXRzIG9wZXJhdGlv
biwgdGhlIGNsYXNzCj4gK3Nob3VsZCBwcm92aWRlIGhlbHBlciBmdW5jdGlvbiB0byBzZXQgY2xh
c3MgaWQgYW5kIGRldmljZSBzcGVjaWZpYwo+ICtvcHMuIEUuZyBmb3IgdmZpby1tZGV2IGRldmlj
ZXMsIHRoZSBmdW5jdGlvbiB0byBiZSBjYWxsZWQgaXM6Ogo+ICsKPiArCWludCBtZGV2X3NldF92
ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyAqdmZpb19vcHMpOwo+
ICsKPiArVGhlIGNsYXNzIGlkIChzZXQgYnkgdGhpcyBmdW5jdGlvbiB0byBNREVWX0NMQVNTX0lE
X1ZGSU8pIGlzIHVzZWQgdG8KPiArbWF0Y2ggYSBkZXZpY2Ugd2l0aCBhbiBtZGV2IGRyaXZlciB2
aWEgaXRzIGlkIHRhYmxlLiBUaGUgZGV2aWNlCj4gK3NwZWNpZmljIGNhbGxiYWNrcyAoc3BlY2lm
aWVkIGluICp2ZmlvX29wcykgYXJlIG9idGFpbmFibGUgdmlhCj4gK21kZXZfZ2V0X3ZmaW9fb3Bz
KCkgKGZvciB1c2UgYnkgdGhlIG1kZXYgYnVzIGRyaXZlcikuIEEgdmZpby1tZGV2Cj4gK2Rldmlj
ZSAoY2xhc3MgaWQgTURFVl9DTEFTU19JRF9WRklPKSB1c2VzIHRoZSBmb2xsb3dpbmcKPiArZGV2
aWNlLXNwZWNpZmljIG9wczoKPiArCj4gKyogb3Blbjogb3BlbiBjYWxsYmFjayBvZiB2ZmlvIG1l
ZGlhdGVkIGRldmljZQo+ICsqIGNsb3NlOiBjbG9zZSBjYWxsYmFjayBvZiB2ZmlvIG1lZGlhdGVk
IGRldmljZQo+ICsqIGlvY3RsOiBpb2N0bCBjYWxsYmFjayBvZiB2ZmlvIG1lZGlhdGVkIGRldmlj
ZQo+ICsqIHJlYWQgOiByZWFkIGVtdWxhdGlvbiBjYWxsYmFjawo+ICsqIHdyaXRlOiB3cml0ZSBl
bXVsYXRpb24gY2FsbGJhY2sKPiArKiBtbWFwOiBtbWFwIGVtdWxhdGlvbiBjYWxsYmFjawo+ICsK
PiAgTWVkaWF0ZWQgRGV2aWNlIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFRocm91Z2ggc3lzZnMKPiAg
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgCj4g
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCBjYmExMDk1NTQ3
ZmQuLmY2NjFkMTMzNDRkNiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5U
QUlORVJTCj4gQEAgLTE3MTIxLDYgKzE3MTIxLDcgQEAgUzoJTWFpbnRhaW5lZAo+ICBGOglEb2N1
bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4gIEY6CWRyaXZl
cnMvdmZpby9tZGV2Lwo+ICBGOglpbmNsdWRlL2xpbnV4L21kZXYuaAo+ICtGOglpbmNsdWRlL2xp
bnV4L21kZXZfdmZpb19vcHMuaAo+ICBGOglzYW1wbGVzL3ZmaW8tbWRldi8KPiAgCj4gIFZGSU8g
UExBVEZPUk0gRFJJVkVSCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9r
dm1ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPiBpbmRleCA2NDIwZjBk
YmQzMWIuLjY2MmYzYTY3MjM3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQva3ZtZ3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gQEAg
LTQyLDYgKzQyLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+Cj4gICNpbmNsdWRl
IDxsaW51eC92ZmlvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9tZGV2X3ZmaW9fb3BzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gIAo+
ICAjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+Cj4gQEAgLTY0Myw2ICs2NDQsOCBAQCBzdGF0aWMg
dm9pZCBrdm1ndF9wdXRfdmZpb19kZXZpY2Uodm9pZCAqdmdwdSkKPiAgCXZmaW9fZGV2aWNlX3B1
dCgoKHN0cnVjdCBpbnRlbF92Z3B1ICopdmdwdSktPnZkZXYudmZpb19kZXZpY2UpOwo+ICB9Cj4g
IAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzIGludGVsX3ZmaW9f
dmdwdV9kZXZfb3BzOwo+ICsKPiAgc3RhdGljIGludCBpbnRlbF92Z3B1X2NyZWF0ZShzdHJ1Y3Qg
a29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICB7Cj4gIAlzdHJ1Y3Qg
aW50ZWxfdmdwdSAqdmdwdSA9IE5VTEw7Cj4gQEAgLTY3OCw3ICs2ODEsNyBAQCBzdGF0aWMgaW50
IGludGVsX3ZncHVfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYpCj4gIAkJICAgICBkZXZfbmFtZShtZGV2X2RldihtZGV2KSkpOwo+ICAJcmV0ID0g
MDsKPiAgCj4gLQltZGV2X3NldF9jbGFzcyhtZGV2LCBNREVWX0NMQVNTX0lEX1ZGSU8pOwo+ICsJ
bWRldl9zZXRfdmZpb19vcHMobWRldiwgJmludGVsX3ZmaW9fdmdwdV9kZXZfb3BzKTsKPiAgb3V0
Ogo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IEBAIC0xNTk5LDIwICsxNjAyLDIxIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICppbnRlbF92Z3B1X2dyb3Vwc1tdID0gewo+ICAJ
TlVMTCwKPiAgfTsKPiAgCj4gLXN0YXRpYyBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzIGludGVsX3Zn
cHVfb3BzID0gewo+IC0JLm1kZXZfYXR0cl9ncm91cHMgICAgICAgPSBpbnRlbF92Z3B1X2dyb3Vw
cywKPiAtCS5jcmVhdGUJCQk9IGludGVsX3ZncHVfY3JlYXRlLAo+IC0JLnJlbW92ZQkJCT0gaW50
ZWxfdmdwdV9yZW1vdmUsCj4gLQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZp
Y2Vfb3BzIGludGVsX3ZmaW9fdmdwdV9kZXZfb3BzID0gewo+ICAJLm9wZW4JCQk9IGludGVsX3Zn
cHVfb3BlbiwKPiAgCS5yZWxlYXNlCQk9IGludGVsX3ZncHVfcmVsZWFzZSwKPiAtCj4gIAkucmVh
ZAkJCT0gaW50ZWxfdmdwdV9yZWFkLAo+ICAJLndyaXRlCQkJPSBpbnRlbF92Z3B1X3dyaXRlLAo+
ICAJLm1tYXAJCQk9IGludGVsX3ZncHVfbW1hcCwKPiAgCS5pb2N0bAkJCT0gaW50ZWxfdmdwdV9p
b2N0bCwKPiAgfTsKPiAgCj4gK3N0YXRpYyBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzIGludGVsX3Zn
cHVfb3BzID0gewo+ICsJLm1kZXZfYXR0cl9ncm91cHMgICAgICAgPSBpbnRlbF92Z3B1X2dyb3Vw
cywKPiArCS5jcmVhdGUJCQk9IGludGVsX3ZncHVfY3JlYXRlLAo+ICsJLnJlbW92ZQkJCT0gaW50
ZWxfdmdwdV9yZW1vdmUsCj4gK307Cj4gKwo+ICBzdGF0aWMgaW50IGt2bWd0X2hvc3RfaW5pdChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmd2dCwgY29uc3Qgdm9pZCAqb3BzKQo+ICB7Cj4gIAlz
dHJ1Y3QgYXR0cmlidXRlICoqa3ZtX3R5cGVfYXR0cnM7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
czM5MC9jaW8vdmZpb19jY3dfb3BzLmMgYi9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5j
Cj4gaW5kZXggY2YyYzAxM2FlMzJmLi5mYTQ3M2RlZDcxYzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYwo+ICsrKyBiL2RyaXZlcnMvczM5MC9jaW8vdmZpb19j
Y3dfb3BzLmMKPiBAQCAtMTIsNiArMTIsNyBAQAo+ICAKPiAgI2luY2x1ZGUgPGxpbnV4L3ZmaW8u
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21kZXZfdmZp
b19vcHMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L25vc3BlYy5oPgo+ICAjaW5jbHVkZSA8bGludXgv
c2xhYi5oPgo+ICAKPiBAQCAtMTEwLDYgKzExMSw4IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRl
X2dyb3VwICptZGV2X3R5cGVfZ3JvdXBzW10gPSB7Cj4gIAlOVUxMLAo+ICB9Owo+ICAKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyBtZGV2X3ZmaW9fb3BzOwo+ICsK
PiAgc3RhdGljIGludCB2ZmlvX2Njd19tZGV2X2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwg
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgdmZpb19jY3dfcHJpdmF0
ZSAqcHJpdmF0ZSA9Cj4gQEAgLTEyOSw3ICsxMzIsNyBAQCBzdGF0aWMgaW50IHZmaW9fY2N3X21k
ZXZfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYp
Cj4gIAkJCSAgIHByaXZhdGUtPnNjaC0+c2NoaWQuc3NpZCwKPiAgCQkJICAgcHJpdmF0ZS0+c2No
LT5zY2hpZC5zY2hfbm8pOwo+ICAKPiAtCW1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1Nf
SURfVkZJTyk7Cj4gKwltZGV2X3NldF92ZmlvX29wcyhtZGV2LCAmbWRldl92ZmlvX29wcyk7Cj4g
IAlyZXR1cm4gMDsKPiAgfQo+ICAKPiBAQCAtNTc1LDExICs1NzgsNyBAQCBzdGF0aWMgc3NpemVf
dCB2ZmlvX2Njd19tZGV2X2lvY3RsKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiAgCX0KPiAg
fQo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgdmZpb19jY3dfbWRl
dl9vcHMgPSB7Cj4gLQkub3duZXIJCQk9IFRISVNfTU9EVUxFLAo+IC0JLnN1cHBvcnRlZF90eXBl
X2dyb3VwcyAgPSBtZGV2X3R5cGVfZ3JvdXBzLAo+IC0JLmNyZWF0ZQkJCT0gdmZpb19jY3dfbWRl
dl9jcmVhdGUsCj4gLQkucmVtb3ZlCQkJPSB2ZmlvX2Njd19tZGV2X3JlbW92ZSwKPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyBtZGV2X3ZmaW9fb3BzID0gewo+ICAJ
Lm9wZW4JCQk9IHZmaW9fY2N3X21kZXZfb3BlbiwKPiAgCS5yZWxlYXNlCQk9IHZmaW9fY2N3X21k
ZXZfcmVsZWFzZSwKPiAgCS5yZWFkCQkJPSB2ZmlvX2Njd19tZGV2X3JlYWQsCj4gQEAgLTU4Nyw2
ICs1ODYsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgdmZpb19jY3df
bWRldl9vcHMgPSB7Cj4gIAkuaW9jdGwJCQk9IHZmaW9fY2N3X21kZXZfaW9jdGwsCj4gIH07Cj4g
IAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyB2ZmlvX2Njd19tZGV2X29w
cyA9IHsKPiArCS5vd25lcgkJCT0gVEhJU19NT0RVTEUsCj4gKwkuc3VwcG9ydGVkX3R5cGVfZ3Jv
dXBzICA9IG1kZXZfdHlwZV9ncm91cHMsCj4gKwkuY3JlYXRlCQkJPSB2ZmlvX2Njd19tZGV2X2Ny
ZWF0ZSwKPiArCS5yZW1vdmUJCQk9IHZmaW9fY2N3X21kZXZfcmVtb3ZlLAo+ICt9Owo+ICsKPiAg
aW50IHZmaW9fY2N3X21kZXZfcmVnKHN0cnVjdCBzdWJjaGFubmVsICpzY2gpCj4gIHsKPiAgCXJl
dHVybiBtZGV2X3JlZ2lzdGVyX2RldmljZSgmc2NoLT5kZXYsICZ2ZmlvX2Njd19tZGV2X29wcyk7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYyBiL2RyaXZl
cnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYwo+IGluZGV4IDA3YzMxMDcwYWZlYi4uN2JkYzYy
MzkzMTEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYwo+
ICsrKyBiL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYwo+IEBAIC0xNiw2ICsxNiw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2t2bV9o
b3N0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21k
ZXZfdmZpb19vcHMuaD4KPiAgI2luY2x1ZGUgPGFzbS9rdm0uaD4KPiAgI2luY2x1ZGUgPGFzbS96
Y3J5cHQuaD4KPiAgCj4gQEAgLTMyMSw2ICszMjIsOCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2FwX21h
dHJpeF9pbml0KHN0cnVjdCBhcF9jb25maWdfaW5mbyAqaW5mbywKPiAgCW1hdHJpeC0+YWRtX21h
eCA9IGluZm8tPmFweGEgPyBpbmZvLT5OZCA6IDE1Owo+ICB9Cj4gIAo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzIG1kZXZfdmZpb19vcHM7Cj4gKwo+ICBzdGF0aWMg
aW50IHZmaW9fYXBfbWRldl9jcmVhdGUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBtZGV2
X2RldmljZSAqbWRldikKPiAgewo+ICAJc3RydWN0IGFwX21hdHJpeF9tZGV2ICptYXRyaXhfbWRl
djsKPiBAQCAtMzQzLDcgKzM0Niw3IEBAIHN0YXRpYyBpbnQgdmZpb19hcF9tZGV2X2NyZWF0ZShz
dHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICAJbGlzdF9h
ZGQoJm1hdHJpeF9tZGV2LT5ub2RlLCAmbWF0cml4X2Rldi0+bWRldl9saXN0KTsKPiAgCW11dGV4
X3VubG9jaygmbWF0cml4X2Rldi0+bG9jayk7Cj4gIAo+IC0JbWRldl9zZXRfY2xhc3MobWRldiwg
TURFVl9DTEFTU19JRF9WRklPKTsKPiArCW1kZXZfc2V0X3ZmaW9fb3BzKG1kZXYsICZtZGV2X3Zm
aW9fb3BzKTsKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IEBAIC0xMjgxLDE1ICsxMjg0LDE4IEBA
IHN0YXRpYyBzc2l6ZV90IHZmaW9fYXBfbWRldl9pb2N0bChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZf
dmZpb19kZXZpY2Vfb3BzIG1kZXZfdmZpb19vcHMgPSB7Cj4gKwkub3BlbgkJCT0gdmZpb19hcF9t
ZGV2X29wZW4sCj4gKwkucmVsZWFzZQkJPSB2ZmlvX2FwX21kZXZfcmVsZWFzZSwKPiArCS5pb2N0
bAkJCT0gdmZpb19hcF9tZGV2X2lvY3RsLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBtZGV2X3BhcmVudF9vcHMgdmZpb19hcF9tYXRyaXhfb3BzID0gewo+ICAJLm93bmVyCQkJPSBU
SElTX01PRFVMRSwKPiAgCS5zdXBwb3J0ZWRfdHlwZV9ncm91cHMJPSB2ZmlvX2FwX21kZXZfdHlw
ZV9ncm91cHMsCj4gIAkubWRldl9hdHRyX2dyb3Vwcwk9IHZmaW9fYXBfbWRldl9hdHRyX2dyb3Vw
cywKPiAgCS5jcmVhdGUJCQk9IHZmaW9fYXBfbWRldl9jcmVhdGUsCj4gIAkucmVtb3ZlCQkJPSB2
ZmlvX2FwX21kZXZfcmVtb3ZlLAo+IC0JLm9wZW4JCQk9IHZmaW9fYXBfbWRldl9vcGVuLAo+IC0J
LnJlbGVhc2UJCT0gdmZpb19hcF9tZGV2X3JlbGVhc2UsCj4gLQkuaW9jdGwJCQk9IHZmaW9fYXBf
bWRldl9pb2N0bCwKPiAgfTsKPiAgCj4gIGludCB2ZmlvX2FwX21kZXZfcmVnaXN0ZXIodm9pZCkK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgYi9kcml2ZXJzL3Zm
aW8vbWRldi9tZGV2X2NvcmUuYwo+IGluZGV4IGQyM2NhMzllM2JlNi4uOGQ1NzlkN2VkODJmIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4gKysrIGIvZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPiBAQCAtNDUsOSArNDUsMTAgQEAgdm9pZCBtZGV2X3Nl
dF9kcnZkYXRhKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdm9pZCAqZGF0YSkKPiAgfQo+ICBF
WFBPUlRfU1lNQk9MKG1kZXZfc2V0X2RydmRhdGEpOwo+ICAKPiArCgpFeHRyYSB3aGl0ZXNwYWNl
Cgo+ICAvKiBTcGVjaWZ5IHRoZSBjbGFzcyBmb3IgdGhlIG1kZXYgZGV2aWNlLCB0aGlzIG11c3Qg
YmUgY2FsbGVkIGR1cmluZwo+IC0gKiBjcmVhdGUoKSBjYWxsYmFjay4KPiAtICovCj4gKyAqIGNy
ZWF0ZSgpIGNhbGxiYWNrIGV4cGxpY2l0bHkgb3IgaW1wbGljaXR5IHRocm91Z2ggdGhlIGhlbHBl
cnMKCnMvaW1wbGljaXR5L2ltcGxpY2l0bHkvCgo+ICsgKiBwcm92aWRlZCBieSBlYWNoIGNsYXNz
LiAqLwo+ICB2b2lkIG1kZXZfc2V0X2NsYXNzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2
IGlkKQo+ICB7Cj4gIAlXQVJOX09OKG1kZXYtPmNsYXNzX2lkKTsKPiBAQCAtNTUsNiArNTYsMjYg
QEAgdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCkK
PiAgfQo+ICBFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2NsYXNzKTsKPiAgCj4gKy8qIFNwZWNpZnkg
dGhlIG1kZXYgZGV2aWNlIHRvIGJlIGEgVkZJTyBtZGV2IGRldmljZSwgYW5kIHNldCBWRklPCj4g
KyAqIGRldmljZSBvcHMgZm9yIGl0LiBUaGlzIG11c3QgYmUgY2FsbGVkIGZyb20gdGhlIGNyZWF0
ZSgpIGNhbGxiYWNrCj4gKyAqIGZvciBWRklPIG1kZXYgZGV2aWNlLgo+ICsgKi8KCkNvbW1lbnQg
c3R5bGUuICBUaGFua3MsCgpBbGV4Cgo+ICt2b2lkIG1kZXZfc2V0X3ZmaW9fb3BzKHN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldiwKPiArCQkgICAgICAgY29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZp
Y2Vfb3BzICp2ZmlvX29wcykKPiArewo+ICsJbWRldl9zZXRfY2xhc3MobWRldiwgTURFVl9DTEFT
U19JRF9WRklPKTsKPiArCW1kZXYtPnZmaW9fb3BzID0gdmZpb19vcHM7Cj4gK30KPiArRVhQT1JU
X1NZTUJPTChtZGV2X3NldF92ZmlvX29wcyk7Cj4gKwo+ICsvKiBHZXQgdGhlIFZGSU8gZGV2aWNl
IG9wcyBmb3IgdGhlIG1kZXYgZGV2aWNlLiAqLwo+ICtjb25zdCBzdHJ1Y3QgbWRldl92ZmlvX2Rl
dmljZV9vcHMgKm1kZXZfZ2V0X3ZmaW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikKPiAr
ewo+ICsJV0FSTl9PTihtZGV2LT5jbGFzc19pZCAhPSBNREVWX0NMQVNTX0lEX1ZGSU8pOwo+ICsJ
cmV0dXJuIG1kZXYtPnZmaW9fb3BzOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0wobWRldl9nZXRfdmZp
b19vcHMpOwo+ICsKPiAgc3RydWN0IGRldmljZSAqbWRldl9kZXYoc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2KQo+ICB7Cj4gIAlyZXR1cm4gJm1kZXYtPmRldjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZh
dGUuaAo+IGluZGV4IGM2NWY0MzZjMTg2OS4uNDExMjI3MzczNjI1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oCj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYv
bWRldl9wcml2YXRlLmgKPiBAQCAtMTAsNiArMTAsOCBAQAo+ICAjaWZuZGVmIE1ERVZfUFJJVkFU
RV9ICj4gICNkZWZpbmUgTURFVl9QUklWQVRFX0gKPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9tZGV2
X3ZmaW9fb3BzLmg+Cj4gKwo+ICBpbnQgIG1kZXZfYnVzX3JlZ2lzdGVyKHZvaWQpOwo+ICB2b2lk
IG1kZXZfYnVzX3VucmVnaXN0ZXIodm9pZCk7Cj4gIAo+IEBAIC0zNCw2ICszNiw5IEBAIHN0cnVj
dCBtZGV2X2RldmljZSB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICppb21tdV9kZXZpY2U7Cj4gIAlib29s
IGFjdGl2ZTsKPiAgCXUxNiBjbGFzc19pZDsKPiArCXVuaW9uIHsKPiArCQljb25zdCBzdHJ1Y3Qg
bWRldl92ZmlvX2RldmljZV9vcHMgKnZmaW9fb3BzOwo+ICsJfTsKPiAgfTsKPiAgCj4gICNkZWZp
bmUgdG9fbWRldl9kZXZpY2UoZGV2KQljb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgbWRldl9kZXZp
Y2UsIGRldikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgYi9k
cml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+IGluZGV4IGE2NjQxY2Q4YjVhMy4uYzAxZTIx
OTRlNGIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCj4gKysr
IGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPiBAQCAtMTQsNiArMTQsNyBAQAo+ICAj
aW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8bGludXgvdmZpby5oPgo+ICAjaW5j
bHVkZSA8bGludXgvbWRldi5oPgo+ICsjaW5jbHVkZSA8bGludXgvbWRldl92ZmlvX29wcy5oPgo+
ICAKPiAgI2luY2x1ZGUgIm1kZXZfcHJpdmF0ZS5oIgo+ICAKPiBAQCAtMjQsMTYgKzI1LDE2IEBA
Cj4gIHN0YXRpYyBpbnQgdmZpb19tZGV2X29wZW4odm9pZCAqZGV2aWNlX2RhdGEpCj4gIHsKPiAg
CXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IGRldmljZV9kYXRhOwo+IC0Jc3RydWN0IG1kZXZf
cGFyZW50ICpwYXJlbnQgPSBtZGV2LT5wYXJlbnQ7Cj4gKwljb25zdCBzdHJ1Y3QgbWRldl92Zmlv
X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3ZmaW9fb3BzKG1kZXYpOwo+ICAJaW50IHJldDsK
PiAgCj4gLQlpZiAodW5saWtlbHkoIXBhcmVudC0+b3BzLT5vcGVuKSkKPiArCWlmICh1bmxpa2Vs
eSghb3BzLT5vcGVuKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gIAlpZiAoIXRyeV9tb2R1
bGVfZ2V0KFRISVNfTU9EVUxFKSkKPiAgCQlyZXR1cm4gLUVOT0RFVjsKPiAgCj4gLQlyZXQgPSBw
YXJlbnQtPm9wcy0+b3BlbihtZGV2KTsKPiArCXJldCA9IG9wcy0+b3BlbihtZGV2KTsKPiAgCWlm
IChyZXQpCj4gIAkJbW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4gIAo+IEBAIC00MywxMCArNDQs
MTAgQEAgc3RhdGljIGludCB2ZmlvX21kZXZfb3Blbih2b2lkICpkZXZpY2VfZGF0YSkKPiAgc3Rh
dGljIHZvaWQgdmZpb19tZGV2X3JlbGVhc2Uodm9pZCAqZGV2aWNlX2RhdGEpCj4gIHsKPiAgCXN0
cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IGRldmljZV9kYXRhOwo+IC0Jc3RydWN0IG1kZXZfcGFy
ZW50ICpwYXJlbnQgPSBtZGV2LT5wYXJlbnQ7Cj4gKwljb25zdCBzdHJ1Y3QgbWRldl92ZmlvX2Rl
dmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3ZmaW9fb3BzKG1kZXYpOwo+ICAKPiAtCWlmIChsaWtl
bHkocGFyZW50LT5vcHMtPnJlbGVhc2UpKQo+IC0JCXBhcmVudC0+b3BzLT5yZWxlYXNlKG1kZXYp
Owo+ICsJaWYgKGxpa2VseShvcHMtPnJlbGVhc2UpKQo+ICsJCW9wcy0+cmVsZWFzZShtZGV2KTsK
PiAgCj4gIAltb2R1bGVfcHV0KFRISVNfTU9EVUxFKTsKPiAgfQo+IEBAIC01NSw0NyArNTYsNDcg
QEAgc3RhdGljIGxvbmcgdmZpb19tZGV2X3VubG9ja2VkX2lvY3RsKHZvaWQgKmRldmljZV9kYXRh
LAo+ICAJCQkJICAgICB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZykKPiAgewo+
ICAJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gZGV2aWNlX2RhdGE7Cj4gLQlzdHJ1Y3QgbWRl
dl9wYXJlbnQgKnBhcmVudCA9IG1kZXYtPnBhcmVudDsKPiArCWNvbnN0IHN0cnVjdCBtZGV2X3Zm
aW9fZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmZpb19vcHMobWRldik7Cj4gIAo+IC0JaWYg
KHVubGlrZWx5KCFwYXJlbnQtPm9wcy0+aW9jdGwpKQo+ICsJaWYgKHVubGlrZWx5KCFvcHMtPmlv
Y3RsKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXR1cm4gcGFyZW50LT5vcHMtPmlv
Y3RsKG1kZXYsIGNtZCwgYXJnKTsKPiArCXJldHVybiBvcHMtPmlvY3RsKG1kZXYsIGNtZCwgYXJn
KTsKPiAgfQo+ICAKPiAgc3RhdGljIHNzaXplX3QgdmZpb19tZGV2X3JlYWQodm9pZCAqZGV2aWNl
X2RhdGEsIGNoYXIgX191c2VyICpidWYsCj4gIAkJCSAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90
ICpwcG9zKQo+ICB7Cj4gIAlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBkZXZpY2VfZGF0YTsK
PiAtCXN0cnVjdCBtZGV2X3BhcmVudCAqcGFyZW50ID0gbWRldi0+cGFyZW50Owo+ICsJY29uc3Qg
c3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92ZmlvX29wcyhtZGV2
KTsKPiAgCj4gLQlpZiAodW5saWtlbHkoIXBhcmVudC0+b3BzLT5yZWFkKSkKPiArCWlmICh1bmxp
a2VseSghb3BzLT5yZWFkKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXR1cm4gcGFy
ZW50LT5vcHMtPnJlYWQobWRldiwgYnVmLCBjb3VudCwgcHBvcyk7Cj4gKwlyZXR1cm4gb3BzLT5y
ZWFkKG1kZXYsIGJ1ZiwgY291bnQsIHBwb3MpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgc3NpemVfdCB2
ZmlvX21kZXZfd3JpdGUodm9pZCAqZGV2aWNlX2RhdGEsIGNvbnN0IGNoYXIgX191c2VyICpidWYs
Cj4gIAkJCSAgICAgICBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykKPiAgewo+ICAJc3RydWN0
IG1kZXZfZGV2aWNlICptZGV2ID0gZGV2aWNlX2RhdGE7Cj4gLQlzdHJ1Y3QgbWRldl9wYXJlbnQg
KnBhcmVudCA9IG1kZXYtPnBhcmVudDsKPiArCWNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNl
X29wcyAqb3BzID0gbWRldl9nZXRfdmZpb19vcHMobWRldik7Cj4gIAo+IC0JaWYgKHVubGlrZWx5
KCFwYXJlbnQtPm9wcy0+d3JpdGUpKQo+ICsJaWYgKHVubGlrZWx5KCFvcHMtPndyaXRlKSkKPiAg
CQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXR1cm4gcGFyZW50LT5vcHMtPndyaXRlKG1kZXYs
IGJ1ZiwgY291bnQsIHBwb3MpOwo+ICsJcmV0dXJuIG9wcy0+d3JpdGUobWRldiwgYnVmLCBjb3Vu
dCwgcHBvcyk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgdmZpb19tZGV2X21tYXAodm9pZCAqZGV2
aWNlX2RhdGEsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gIAlzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYgPSBkZXZpY2VfZGF0YTsKPiAtCXN0cnVjdCBtZGV2X3BhcmVudCAqcGFy
ZW50ID0gbWRldi0+cGFyZW50Owo+ICsJY29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3Bz
ICpvcHMgPSBtZGV2X2dldF92ZmlvX29wcyhtZGV2KTsKPiAgCj4gLQlpZiAodW5saWtlbHkoIXBh
cmVudC0+b3BzLT5tbWFwKSkKPiArCWlmICh1bmxpa2VseSghb3BzLT5tbWFwKSkKPiAgCQlyZXR1
cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXR1cm4gcGFyZW50LT5vcHMtPm1tYXAobWRldiwgdm1hKTsK
PiArCXJldHVybiBvcHMtPm1tYXAobWRldiwgdm1hKTsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCB2ZmlvX2RldmljZV9vcHMgdmZpb19tZGV2X2Rldl9vcHMgPSB7Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbWRldi5oIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKPiBpbmRleCA3
OGI2OWQwOWViNTQuLjllMzc1MDZkMTk4NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21k
ZXYuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWRldi5oCj4gQEAgLTEwLDcgKzEwLDEzIEBACj4g
ICNpZm5kZWYgTURFVl9ICj4gICNkZWZpbmUgTURFVl9ICj4gIAo+ICsjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
bWRldi5oPgo+ICsjaW5jbHVkZSA8dWFwaS9saW51eC91dWlkLmg+Cj4gKwo+ICBzdHJ1Y3QgbWRl
dl9kZXZpY2U7Cj4gK3N0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wczsKPiAgCj4gIC8qCj4gICAq
IENhbGxlZCBieSB0aGUgcGFyZW50IGRldmljZSBkcml2ZXIgdG8gc2V0IHRoZSBkZXZpY2Ugd2hp
Y2ggcmVwcmVzZW50cwo+IEBAIC00OCwzMCArNTQsNyBAQCBzdHJ1Y3QgZGV2aWNlICptZGV2X2dl
dF9pb21tdV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KTsKPiAgICoJCQlAbWRldjogbWRldl9k
ZXZpY2UgZGV2aWNlIHN0cnVjdHVyZSB3aGljaCBpcyBiZWluZwo+ICAgKgkJCSAgICAgICBkZXN0
cm95ZWQKPiAgICoJCQlSZXR1cm5zIGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9yICg8IDAp
Cj4gLSAqIEBvcGVuOgkJT3BlbiBtZWRpYXRlZCBkZXZpY2UuCj4gLSAqCQkJQG1kZXY6IG1lZGlh
dGVkIGRldmljZS4KPiAtICoJCQlSZXR1cm5zIGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9y
ICg8IDApCj4gLSAqIEByZWxlYXNlOgkJcmVsZWFzZSBtZWRpYXRlZCBkZXZpY2UKPiAtICoJCQlA
bWRldjogbWVkaWF0ZWQgZGV2aWNlLgo+IC0gKiBAcmVhZDoJCVJlYWQgZW11bGF0aW9uIGNhbGxi
YWNrCj4gLSAqCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZSBzdHJ1Y3R1cmUKPiAtICoJCQlAYnVm
OiByZWFkIGJ1ZmZlcgo+IC0gKgkJCUBjb3VudDogbnVtYmVyIG9mIGJ5dGVzIHRvIHJlYWQKPiAt
ICoJCQlAcHBvczogYWRkcmVzcy4KPiAtICoJCQlSZXR1bnMgbnVtYmVyIG9uIGJ5dGVzIHJlYWQg
b24gc3VjY2VzcyBvciBlcnJvci4KPiAtICogQHdyaXRlOgkJV3JpdGUgZW11bGF0aW9uIGNhbGxi
YWNrCj4gLSAqCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZSBzdHJ1Y3R1cmUKPiAtICoJCQlAYnVm
OiB3cml0ZSBidWZmZXIKPiAtICoJCQlAY291bnQ6IG51bWJlciBvZiBieXRlcyB0byBiZSB3cml0
dGVuCj4gLSAqCQkJQHBwb3M6IGFkZHJlc3MuCj4gLSAqCQkJUmV0dW5zIG51bWJlciBvbiBieXRl
cyB3cml0dGVuIG9uIHN1Y2Nlc3Mgb3IgZXJyb3IuCj4gLSAqIEBpb2N0bDoJCUlPQ1RMIGNhbGxi
YWNrCj4gLSAqCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZSBzdHJ1Y3R1cmUKPiAtICoJCQlAY21k
OiBpb2N0bCBjb21tYW5kCj4gLSAqCQkJQGFyZzogYXJndW1lbnRzIHRvIGlvY3RsCj4gLSAqIEBt
bWFwOgkJbW1hcCBjYWxsYmFjawo+IC0gKgkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2Ugc3RydWN0
dXJlCj4gLSAqCQkJQHZtYTogdm1hIHN0cnVjdHVyZQo+ICsgKgo+ICAgKiBQYXJlbnQgZGV2aWNl
IHRoYXQgc3VwcG9ydCBtZWRpYXRlZCBkZXZpY2Ugc2hvdWxkIGJlIHJlZ2lzdGVyZWQgd2l0aCBt
ZGV2Cj4gICAqIG1vZHVsZSB3aXRoIG1kZXZfcGFyZW50X29wcyBzdHJ1Y3R1cmUuCj4gICAqKi8K
PiBAQCAtODMsMTUgKzY2LDYgQEAgc3RydWN0IG1kZXZfcGFyZW50X29wcyB7Cj4gIAo+ICAJaW50
ICAgICAoKmNyZWF0ZSkoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldik7Cj4gIAlpbnQgICAgICgqcmVtb3ZlKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+
IC0JaW50ICAgICAoKm9wZW4pKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gLQl2b2lkICAg
ICgqcmVsZWFzZSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiAtCXNzaXplX3QgKCpyZWFk
KShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIGNoYXIgX191c2VyICpidWYsCj4gLQkJCXNpemVf
dCBjb3VudCwgbG9mZl90ICpwcG9zKTsKPiAtCXNzaXplX3QgKCp3cml0ZSkoc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAo+IC0JCQkgc2l6ZV90IGNvdW50
LCBsb2ZmX3QgKnBwb3MpOwo+IC0JbG9uZwkoKmlvY3RsKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHVuc2lnbmVkIGludCBjbWQsCj4gLQkJCSB1bnNpZ25lZCBsb25nIGFyZyk7Cj4gLQlpbnQJ
KCptbWFwKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKTsKPiAgfTsKPiAgCj4gIC8qIGludGVyZmFjZSBmb3IgZXhwb3J0aW5nIG1kZXYgc3VwcG9y
dGVkIHR5cGUgYXR0cmlidXRlcyAqLwo+IEBAIC0xMzUsNiArMTA5LDkgQEAgdm9pZCAqbWRldl9n
ZXRfZHJ2ZGF0YShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ICB2b2lkIG1kZXZfc2V0X2Ry
dmRhdGEoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB2b2lkICpkYXRhKTsKPiAgY29uc3QgZ3Vp
ZF90ICptZGV2X3V1aWQoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiAgdm9pZCBtZGV2X3Nl
dF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCk7Cj4gK3ZvaWQgbWRldl9z
ZXRfdmZpb19vcHMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LAo+ICsJCSAgICAgICBjb25zdCBz
dHJ1Y3QgbWRldl92ZmlvX2RldmljZV9vcHMgKnZmaW9fb3BzKTsKPiArY29uc3Qgc3RydWN0IG1k
ZXZfdmZpb19kZXZpY2Vfb3BzICptZGV2X2dldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYpOwo+ICAKPiAgZXh0ZXJuIHN0cnVjdCBidXNfdHlwZSBtZGV2X2J1c190eXBlOwo+ICAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmggYi9pbmNsdWRlL2xp
bnV4L21kZXZfdmZpb19vcHMuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zMTc1MThmMzA2MjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9saW51
eC9tZGV2X3ZmaW9fb3BzLmgKPiBAQCAtMCwwICsxLDUyIEBACj4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KPiArLyoKPiArICogVkZJTyBNZWRpYXRlZCBkZXZp
Y2UgZGVmaW5pdGlvbgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgTURFVl9WRklPX09QU19ICj4gKyNk
ZWZpbmUgTURFVl9WRklPX09QU19ICj4gKwo+ICsjaW5jbHVkZSA8bGludXgvbWRldi5oPgo+ICsK
PiArLyoqCj4gKyAqIHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyAtIFN0cnVjdHVyZSB0byBi
ZSByZWdpc3RlcmVkIGZvciBlYWNoCj4gKyAqIG1kZXYgZGV2aWNlIHRvIHJlZ2lzdGVyIHRoZSBk
ZXZpY2UgdG8gdmZpby1tZGV2IG1vZHVsZS4KPiArICoKPiArICogQG9wZW46CQlPcGVuIG1lZGlh
dGVkIGRldmljZS4KPiArICoJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlLgo+ICsgKgkJCVJldHVy
bnMgaW50ZWdlcjogc3VjY2VzcyAoMCkgb3IgZXJyb3IgKDwgMCkKPiArICogQHJlbGVhc2U6CQly
ZWxlYXNlIG1lZGlhdGVkIGRldmljZQo+ICsgKgkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UuCj4g
KyAqIEByZWFkOgkJUmVhZCBlbXVsYXRpb24gY2FsbGJhY2sKPiArICoJCQlAbWRldjogbWVkaWF0
ZWQgZGV2aWNlIHN0cnVjdHVyZQo+ICsgKgkJCUBidWY6IHJlYWQgYnVmZmVyCj4gKyAqCQkJQGNv
dW50OiBudW1iZXIgb2YgYnl0ZXMgdG8gcmVhZAo+ICsgKgkJCUBwcG9zOiBhZGRyZXNzLgo+ICsg
KgkJCVJldHVucyBudW1iZXIgb24gYnl0ZXMgcmVhZCBvbiBzdWNjZXNzIG9yIGVycm9yLgo+ICsg
KiBAd3JpdGU6CQlXcml0ZSBlbXVsYXRpb24gY2FsbGJhY2sKPiArICoJCQlAbWRldjogbWVkaWF0
ZWQgZGV2aWNlIHN0cnVjdHVyZQo+ICsgKgkJCUBidWY6IHdyaXRlIGJ1ZmZlcgo+ICsgKgkJCUBj
b3VudDogbnVtYmVyIG9mIGJ5dGVzIHRvIGJlIHdyaXR0ZW4KPiArICoJCQlAcHBvczogYWRkcmVz
cy4KPiArICoJCQlSZXR1bnMgbnVtYmVyIG9uIGJ5dGVzIHdyaXR0ZW4gb24gc3VjY2VzcyBvciBl
cnJvci4KPiArICogQGlvY3RsOgkJSU9DVEwgY2FsbGJhY2sKPiArICoJCQlAbWRldjogbWVkaWF0
ZWQgZGV2aWNlIHN0cnVjdHVyZQo+ICsgKgkJCUBjbWQ6IGlvY3RsIGNvbW1hbmQKPiArICoJCQlA
YXJnOiBhcmd1bWVudHMgdG8gaW9jdGwKPiArICogQG1tYXA6CQltbWFwIGNhbGxiYWNrCj4gKyAq
CQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZSBzdHJ1Y3R1cmUKPiArICoJCQlAdm1hOiB2bWEgc3Ry
dWN0dXJlCj4gKyAqLwo+ICtzdHJ1Y3QgbWRldl92ZmlvX2RldmljZV9vcHMgewo+ICsJaW50ICAg
ICAoKm9wZW4pKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gKwl2b2lkICAgICgqcmVsZWFz
ZSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPiArCXNzaXplX3QgKCpyZWFkKShzdHJ1Y3Qg
bWRldl9kZXZpY2UgKm1kZXYsIGNoYXIgX191c2VyICpidWYsCj4gKwkJCXNpemVfdCBjb3VudCwg
bG9mZl90ICpwcG9zKTsKPiArCXNzaXplX3QgKCp3cml0ZSkoc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAo+ICsJCQkgc2l6ZV90IGNvdW50LCBsb2ZmX3Qg
KnBwb3MpOwo+ICsJbG9uZwkoKmlvY3RsKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVuc2ln
bmVkIGludCBjbWQsCj4gKwkJCSB1bnNpZ25lZCBsb25nIGFyZyk7Cj4gKwlpbnQJKCptbWFwKShz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiAr
fTsKPiArCj4gKyNlbmRpZgo+IGRpZmYgLS1naXQgYS9zYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMu
YyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCj4gaW5kZXggMTE1YmM1MDc0NjU2Li4xMjk2
Mzc2N2JhMzcgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKPiArKysg
Yi9zYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYwo+IEBAIC0zMCw2ICszMCw3IEBACj4gICNpbmNs
dWRlIDxsaW51eC9pb21tdS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L21kZXYuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21kZXZfdmZpb19vcHMuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgo+ICAj
aW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+IEBAIC01MTYsNiArNTE3LDggQEAgc3RhdGljIGlu
dCBtYm9jaHNfcmVzZXQoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICAJcmV0dXJuIDA7Cj4g
IH0KPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl92ZmlvX2RldmljZV9vcHMgbWRldl92
ZmlvX29wczsKPiArCj4gIHN0YXRpYyBpbnQgbWJvY2hzX2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAq
a29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICB7Cj4gIAljb25zdCBzdHJ1Y3QgbWJv
Y2hzX3R5cGUgKnR5cGUgPSBtYm9jaHNfZmluZF90eXBlKGtvYmopOwo+IEBAIC01NjEsNyArNTY0
LDcgQEAgc3RhdGljIGludCBtYm9jaHNfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1
Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4gIAltYm9jaHNfcmVzZXQobWRldik7Cj4gIAo+ICAJbWJv
Y2hzX3VzZWRfbWJ5dGVzICs9IHR5cGUtPm1ieXRlczsKPiAtCW1kZXZfc2V0X2NsYXNzKG1kZXYs
IE1ERVZfQ0xBU1NfSURfVkZJTyk7Cj4gKwltZGV2X3NldF92ZmlvX29wcyhtZGV2LCAmbWRldl92
ZmlvX29wcyk7Cj4gIAlyZXR1cm4gMDsKPiAgCj4gIGVycl9tZW06Cj4gQEAgLTE0MTksMTIgKzE0
MjIsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqbWRldl90eXBlX2dyb3Vwc1td
ID0gewo+ICAJTlVMTCwKPiAgfTsKPiAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJl
bnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAtCS5vd25lcgkJCT0gVEhJU19NT0RVTEUsCj4gLQkubWRl
dl9hdHRyX2dyb3Vwcwk9IG1kZXZfZGV2X2dyb3VwcywKPiAtCS5zdXBwb3J0ZWRfdHlwZV9ncm91
cHMJPSBtZGV2X3R5cGVfZ3JvdXBzLAo+IC0JLmNyZWF0ZQkJCT0gbWJvY2hzX2NyZWF0ZSwKPiAt
CS5yZW1vdmUJCQk9IG1ib2Noc19yZW1vdmUsCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl92
ZmlvX2RldmljZV9vcHMgbWRldl92ZmlvX29wcyA9IHsKPiAgCS5vcGVuCQkJPSBtYm9jaHNfb3Bl
biwKPiAgCS5yZWxlYXNlCQk9IG1ib2Noc19jbG9zZSwKPiAgCS5yZWFkCQkJPSBtYm9jaHNfcmVh
ZCwKPiBAQCAtMTQzMyw2ICsxNDMxLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJl
bnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAgCS5tbWFwCQkJPSBtYm9jaHNfbW1hcCwKPiAgfTsKPiAg
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAr
CS5vd25lcgkJCT0gVEhJU19NT0RVTEUsCj4gKwkubWRldl9hdHRyX2dyb3Vwcwk9IG1kZXZfZGV2
X2dyb3VwcywKPiArCS5zdXBwb3J0ZWRfdHlwZV9ncm91cHMJPSBtZGV2X3R5cGVfZ3JvdXBzLAo+
ICsJLmNyZWF0ZQkJCT0gbWJvY2hzX2NyZWF0ZSwKPiArCS5yZW1vdmUJCQk9IG1ib2Noc19yZW1v
dmUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB2ZF9m
b3BzID0gewo+ICAJLm93bmVyCQk9IFRISVNfTU9EVUxFLAo+ICB9Owo+IGRpZmYgLS1naXQgYS9z
YW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMKPiBpbmRl
eCA2NjU2MTQ1NzRkNTAuLjUwZWU2Yzk4YjJhZiAxMDA2NDQKPiAtLS0gYS9zYW1wbGVzL3ZmaW8t
bWRldi9tZHB5LmMKPiArKysgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMKPiBAQCAtMjYsNiAr
MjYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3N5
c2ZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZGV2
X3ZmaW9fb3BzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiAgI2luY2x1ZGUgPGRybS9k
cm1fZm91cmNjLmg+Cj4gICNpbmNsdWRlICJtZHB5LWRlZnMuaCIKPiBAQCAtMjI2LDYgKzIyNyw4
IEBAIHN0YXRpYyBpbnQgbWRweV9yZXNldChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4gIAly
ZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNl
X29wcyBtZGV2X3ZmaW9fb3BzOwo+ICsKPiAgc3RhdGljIGludCBtZHB5X2NyZWF0ZShzdHJ1Y3Qg
a29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICB7Cj4gIAljb25zdCBz
dHJ1Y3QgbWRweV90eXBlICp0eXBlID0gbWRweV9maW5kX3R5cGUoa29iaik7Cj4gQEAgLTI2OSw3
ICsyNzIsNyBAQCBzdGF0aWMgaW50IG1kcHlfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4gIAltZHB5X3Jlc2V0KG1kZXYpOwo+ICAKPiAgCW1k
cHlfY291bnQrKzsKPiAtCW1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1NfSURfVkZJTyk7
Cj4gKwltZGV2X3NldF92ZmlvX29wcyhtZGV2LCAmbWRldl92ZmlvX29wcyk7Cj4gIAlyZXR1cm4g
MDsKPiAgfQo+ICAKPiBAQCAtNzI2LDEyICs3MjksNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0
ZV9ncm91cCAqbWRldl90eXBlX2dyb3Vwc1tdID0gewo+ICAJTlVMTCwKPiAgfTsKPiAgCj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAtCS5vd25l
cgkJCT0gVEhJU19NT0RVTEUsCj4gLQkubWRldl9hdHRyX2dyb3Vwcwk9IG1kZXZfZGV2X2dyb3Vw
cywKPiAtCS5zdXBwb3J0ZWRfdHlwZV9ncm91cHMJPSBtZGV2X3R5cGVfZ3JvdXBzLAo+IC0JLmNy
ZWF0ZQkJCT0gbWRweV9jcmVhdGUsCj4gLQkucmVtb3ZlCQkJPSBtZHB5X3JlbW92ZSwKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyBtZGV2X3ZmaW9fb3BzID0gewo+
ICAJLm9wZW4JCQk9IG1kcHlfb3BlbiwKPiAgCS5yZWxlYXNlCQk9IG1kcHlfY2xvc2UsCj4gIAku
cmVhZAkJCT0gbWRweV9yZWFkLAo+IEBAIC03NDAsNiArNzM4LDE0IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbWRldl9wYXJlbnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAgCS5tbWFwCQkJPSBtZHB5X21t
YXAsCj4gIH07Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyBtZGV2
X2ZvcHMgPSB7Cj4gKwkub3duZXIJCQk9IFRISVNfTU9EVUxFLAo+ICsJLm1kZXZfYXR0cl9ncm91
cHMJPSBtZGV2X2Rldl9ncm91cHMsCj4gKwkuc3VwcG9ydGVkX3R5cGVfZ3JvdXBzCT0gbWRldl90
eXBlX2dyb3VwcywKPiArCS5jcmVhdGUJCQk9IG1kcHlfY3JlYXRlLAo+ICsJLnJlbW92ZQkJCT0g
bWRweV9yZW1vdmUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0
aW9ucyB2ZF9mb3BzID0gewo+ICAJLm93bmVyCQk9IFRISVNfTU9EVUxFLAo+ICB9Owo+IGRpZmYg
LS1naXQgYS9zYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgYi9zYW1wbGVzL3ZmaW8tbWRldi9tdHR5
LmMKPiBpbmRleCA5MGRhMTJmZjdmZDkuLmJlNDc2ZTdhZDFmOCAxMDA2NDQKPiAtLS0gYS9zYW1w
bGVzL3ZmaW8tbWRldi9tdHR5LmMKPiArKysgYi9zYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMKPiBA
QCAtMjcsNiArMjcsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2ZpbGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L21kZXZfdmZpb19vcHMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvc2VyaWFsLmg+Cj4gICNpbmNsdWRlIDx1YXBpL2xpbnV4L3NlcmlhbF9yZWcuaD4K
PiBAQCAtNzA4LDYgKzcwOSw4IEBAIHN0YXRpYyBzc2l6ZV90IG1kZXZfYWNjZXNzKHN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldiwgdTggKmJ1Ziwgc2l6ZV90IGNvdW50LAo+ICAJcmV0dXJuIHJldDsK
PiAgfQo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyB2Zmlv
X2Rldl9vcHM7Cj4gKwo+ICBzdGF0aWMgaW50IG10dHlfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICpr
b2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4gIHsKPiAgCXN0cnVjdCBtZGV2X3N0YXRl
ICptZGV2X3N0YXRlOwo+IEBAIC03NTUsNyArNzU4LDcgQEAgc3RhdGljIGludCBtdHR5X2NyZWF0
ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICAJbGlz
dF9hZGQoJm1kZXZfc3RhdGUtPm5leHQsICZtZGV2X2RldmljZXNfbGlzdCk7Cj4gIAltdXRleF91
bmxvY2soJm1kZXZfbGlzdF9sb2NrKTsKPiAgCj4gLQltZGV2X3NldF9jbGFzcyhtZGV2LCBNREVW
X0NMQVNTX0lEX1ZGSU8pOwo+ICsJbWRldl9zZXRfdmZpb19vcHMobWRldiwgJnZmaW9fZGV2X29w
cyk7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiBAQCAtMTM4OCw2ICsxMzkxLDE0IEBAIHN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICptZGV2X3R5cGVfZ3JvdXBzW10gPSB7Cj4gIAlOVUxM
LAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyB2
ZmlvX2Rldl9vcHMgPSB7Cj4gKwkub3BlbgkJPSBtdHR5X29wZW4sCj4gKwkucmVsZWFzZQk9IG10
dHlfY2xvc2UsCj4gKwkucmVhZAkJPSBtdHR5X3JlYWQsCj4gKwkud3JpdGUJCT0gbXR0eV93cml0
ZSwKPiArCS5pb2N0bAkJPSBtdHR5X2lvY3RsLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0gewo+ICAJLm93bmVyICAgICAgICAgICAg
ICAgICAgPSBUSElTX01PRFVMRSwKPiAgCS5kZXZfYXR0cl9ncm91cHMgICAgICAgID0gbXR0eV9k
ZXZfZ3JvdXBzLAo+IEBAIC0xMzk1LDExICsxNDA2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
ZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0gewo+ICAJLnN1cHBvcnRlZF90eXBlX2dyb3VwcyAg
PSBtZGV2X3R5cGVfZ3JvdXBzLAo+ICAJLmNyZWF0ZSAgICAgICAgICAgICAgICAgPSBtdHR5X2Ny
ZWF0ZSwKPiAgCS5yZW1vdmUJCQk9IG10dHlfcmVtb3ZlLAo+IC0JLm9wZW4gICAgICAgICAgICAg
ICAgICAgPSBtdHR5X29wZW4sCj4gLQkucmVsZWFzZSAgICAgICAgICAgICAgICA9IG10dHlfY2xv
c2UsCj4gLQkucmVhZCAgICAgICAgICAgICAgICAgICA9IG10dHlfcmVhZCwKPiAtCS53cml0ZSAg
ICAgICAgICAgICAgICAgID0gbXR0eV93cml0ZSwKPiAtCS5pb2N0bAkJICAgICAgICA9IG10dHlf
aW9jdGwsCj4gIH07Cj4gIAo+ICBzdGF0aWMgdm9pZCBtdHR5X2RldmljZV9yZWxlYXNlKHN0cnVj
dCBkZXZpY2UgKmRldikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
