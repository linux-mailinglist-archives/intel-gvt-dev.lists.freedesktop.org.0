Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC72909A6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Aug 2019 22:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6312E6E2F8;
	Fri, 16 Aug 2019 20:51:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A216E2F8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Aug 2019 20:51:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 59C8F3086208;
 Fri, 16 Aug 2019 20:51:47 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EF4C84258;
 Fri, 16 Aug 2019 20:51:42 +0000 (UTC)
Date: Fri, 16 Aug 2019 14:51:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v5 1/6] vfio: Define device specific irq type capability
Message-ID: <20190816145141.6e56c6cb@x1.home>
In-Reply-To: <20190816023528.30210-2-tina.zhang@intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <20190816023528.30210-2-tina.zhang@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 16 Aug 2019 20:51:47 +0000 (UTC)
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 Eric Auger <eric.auger@redhat.com>, zhiyuan.lv@intel.com,
 intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAxNiBBdWcgMjAxOSAxMDozNToyMyArMDgwMApUaW5hIFpoYW5nIDx0aW5hLnpoYW5n
QGludGVsLmNvbT4gd3JvdGU6Cgo+IENhcCB0aGUgbnVtYmVyIG9mIGlycXMgd2l0aCBmaXhlZCBp
bmRleGVzIGFuZCB1c2UgY2FwYWJpbGl0eSBjaGFpbnMKPiB0byBjaGFpbiBkZXZpY2Ugc3BlY2lm
aWMgaXJxcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+
Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggfCAxOSArKysrKysrKysrKysrKysr
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkv
bGludXgvdmZpby5oCj4gaW5kZXggMDJiYjdhZDZlOTg2Li5kODNjOWYxMzZhNWIgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmgKPiBAQCAtNDQ0LDExICs0NDQsMjcgQEAgc3RydWN0IHZmaW9faXJxX2luZm8gewo+
ICAjZGVmaW5lIFZGSU9fSVJRX0lORk9fTUFTS0FCTEUJCSgxIDw8IDEpCj4gICNkZWZpbmUgVkZJ
T19JUlFfSU5GT19BVVRPTUFTS0VECSgxIDw8IDIpCj4gICNkZWZpbmUgVkZJT19JUlFfSU5GT19O
T1JFU0laRQkJKDEgPDwgMykKPiArI2RlZmluZSBWRklPX0lSUV9JTkZPX0ZMQUdfQ0FQUwkJKDEg
PDwgNCkgLyogSW5mbyBzdXBwb3J0cyBjYXBzICovCj4gIAlfX3UzMglpbmRleDsJCS8qIElSUSBp
bmRleCAqLwo+ICAJX191MzIJY291bnQ7CQkvKiBOdW1iZXIgb2YgSVJRcyB3aXRoaW4gdGhpcyBp
bmRleCAqLwo+ICsJX191MzIJY2FwX29mZnNldDsJLyogT2Zmc2V0IHdpdGhpbiBpbmZvIHN0cnVj
dCBvZiBmaXJzdCBjYXAgKi8KPiAgfTsKPiAgI2RlZmluZSBWRklPX0RFVklDRV9HRVRfSVJRX0lO
Rk8JX0lPKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgOSkKPiAgCj4gKy8qCj4gKyAqIFRoZSBpcnEg
dHlwZSBjYXBhYmlsaXR5IGFsbG93cyBpcnFzIHVuaXF1ZSB0byBhIHNwZWNpZmljIGRldmljZSBv
cgo+ICsgKiBjbGFzcyBvZiBkZXZpY2VzIHRvIGJlIGV4cG9zZWQuCj4gKyAqCj4gKyAqIFRoZSBz
dHJ1Y3R1cmVzIGJlbG93IGRlZmluZSB2ZXJzaW9uIDEgb2YgdGhpcyBjYXBhYmlsaXR5Lgo+ICsg
Ki8KPiArI2RlZmluZSBWRklPX0lSUV9JTkZPX0NBUF9UWVBFICAgICAgMwoKV2h5IDM/ICBXaGF0
J3MgdXNpbmcgMSBhbmQgMiBvZiB0aGlzIG5ld2x5IGRlZmluZWQgaW5mbyBjYXAgSUQ/ICBUaGFu
a3MsCgpBbGV4Cgo+ICsKPiArc3RydWN0IHZmaW9faXJxX2luZm9fY2FwX3R5cGUgewo+ICsJc3Ry
dWN0IHZmaW9faW5mb19jYXBfaGVhZGVyIGhlYWRlcjsKPiArCV9fdTMyIHR5cGU7ICAgICAvKiBn
bG9iYWwgcGVyIGJ1cyBkcml2ZXIgKi8KPiArCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNp
ZmljICovCj4gK307Cj4gKwo+ICAvKioKPiAgICogVkZJT19ERVZJQ0VfU0VUX0lSUVMgLSBfSU9X
KFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVjdCB2ZmlvX2lycV9zZXQpCj4gICAqCj4g
QEAgLTU1MCw3ICs1NjYsOCBAQCBlbnVtIHsKPiAgCVZGSU9fUENJX01TSVhfSVJRX0lOREVYLAo+
ICAJVkZJT19QQ0lfRVJSX0lSUV9JTkRFWCwKPiAgCVZGSU9fUENJX1JFUV9JUlFfSU5ERVgsCj4g
LQlWRklPX1BDSV9OVU1fSVJRUwo+ICsJVkZJT19QQ0lfTlVNX0lSUVMgPSA1CS8qIEZpeGVkIHVz
ZXIgQUJJLCBJUlEgaW5kZXhlcyA+PTUgdXNlICAgKi8KPiArCQkJCS8qIGRldmljZSBzcGVjaWZp
YyBjYXAgdG8gZGVmaW5lIGNvbnRlbnQgKi8KPiAgfTsKPiAgCj4gIC8qCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
