Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685BED7BDD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Oct 2019 18:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E976E855;
	Tue, 15 Oct 2019 16:38:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7686E869;
 Tue, 15 Oct 2019 16:38:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D70D0308FBAC;
 Tue, 15 Oct 2019 16:38:16 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 144475D6B7;
 Tue, 15 Oct 2019 16:38:07 +0000 (UTC)
Date: Tue, 15 Oct 2019 10:38:06 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 1/7] mdev: class id support
Message-ID: <20191015103806.0538ccb2@x1.home>
In-Reply-To: <20191011081557.28302-2-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-2-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 15 Oct 2019 16:38:17 +0000 (UTC)
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
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

T24gRnJpLCAxMSBPY3QgMjAxOSAxNjoxNTo1MSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRl
dl9jb3JlLmMgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+IGluZGV4IGI1NThkNGNm
ZDA4Mi4uNzI0ZTliOTg0MWQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZf
Y29yZS5jCj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPiBAQCAtNDUsNiAr
NDUsMTIgQEAgdm9pZCBtZGV2X3NldF9kcnZkYXRhKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwg
dm9pZCAqZGF0YSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2RydmRhdGEpOwo+ICAK
PiArdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCkK
PiArewo+ICsJbWRldi0+Y2xhc3NfaWQgPSBpZDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKG1kZXZf
c2V0X2NsYXNzKTsKPiArCj4gIHN0cnVjdCBkZXZpY2UgKm1kZXZfZGV2KHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldikKPiAgewo+ICAJcmV0dXJuICZtZGV2LT5kZXY7Cj4gQEAgLTEzNSw2ICsxNDEs
NyBAQCBzdGF0aWMgaW50IG1kZXZfZGV2aWNlX3JlbW92ZV9jYihzdHJ1Y3QgZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEpCj4gICAqIG1kZXZfcmVnaXN0ZXJfZGV2aWNlIDogUmVnaXN0ZXIgYSBkZXZp
Y2UKPiAgICogQGRldjogZGV2aWNlIHN0cnVjdHVyZSByZXByZXNlbnRpbmcgcGFyZW50IGRldmlj
ZS4KPiAgICogQG9wczogUGFyZW50IGRldmljZSBvcGVyYXRpb24gc3RydWN0dXJlIHRvIGJlIHJl
Z2lzdGVyZWQuCj4gKyAqIEBpZDogY2xhc3MgaWQuCj4gICAqCj4gICAqIEFkZCBkZXZpY2UgdG8g
bGlzdCBvZiByZWdpc3RlcmVkIHBhcmVudCBkZXZpY2VzLgo+ICAgKiBSZXR1cm5zIGEgbmVnYXRp
dmUgdmFsdWUgb24gZXJyb3IsIG90aGVyd2lzZSAwLgo+IEBAIC0zMjQsNiArMzMxLDkgQEAgaW50
IG1kZXZfZGV2aWNlX2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKPiAgCWlmIChyZXQpCj4g
IAkJZ290byBvcHNfY3JlYXRlX2ZhaWw7Cj4gIAo+ICsJaWYgKCFtZGV2LT5jbGFzc19pZCkKClRo
aXMgaXMgYSBzYW5pdHkgdGVzdCBmYWlsdXJlIG9mIHRoZSBwYXJlbnQgZHJpdmVyIG9uIGEgcHJp
dmlsZWdlZApwYXRoLCBJIHRoaW5rIGl0J3MgZmFpciB0byBwcmludCBhIHdhcm5pbmcgd2hlbiB0
aGlzIG9jY3VycyByYXRoZXIgdGhhbgpvbmx5IHJldHVybiBhbiBlcnJubyB0byB0aGUgdXNlci4g
IEluIGZhY3QsIHJldCBpcyBub3Qgc2V0IHRvIGFuIGVycm9yCnZhbHVlIGhlcmUsIHNvIGl0IGxv
b2tzIGxpa2UgdGhpcyBmYWlscyB0byBjcmVhdGUgdGhlIGRldmljZSBidXQKcmV0dXJucyBzdWNj
ZXNzLiAgVGhhbmtzLAoKQWxleAoKPiArCQlnb3RvIGNsYXNzX2lkX2ZhaWw7Cj4gKwo+ICAJcmV0
ID0gZGV2aWNlX2FkZCgmbWRldi0+ZGV2KTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBhZGRfZmFp
bDsKPiBAQCAtMzQwLDYgKzM1MCw3IEBAIGludCBtZGV2X2RldmljZV9jcmVhdGUoc3RydWN0IGtv
YmplY3QgKmtvYmosCj4gIAo+ICBzeXNmc19mYWlsOgo+ICAJZGV2aWNlX2RlbCgmbWRldi0+ZGV2
KTsKPiArY2xhc3NfaWRfZmFpbDoKPiAgYWRkX2ZhaWw6Cj4gIAlwYXJlbnQtPm9wcy0+cmVtb3Zl
KG1kZXYpOwo+ICBvcHNfY3JlYXRlX2ZhaWw6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
