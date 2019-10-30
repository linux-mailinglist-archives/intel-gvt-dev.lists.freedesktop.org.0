Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E69E96A2
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Oct 2019 07:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967756E890;
	Wed, 30 Oct 2019 06:46:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FB66EC85
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Oct 2019 06:46:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-WNU8rwzpM5ajq7bmmPQLKw-1; Wed, 30 Oct 2019 02:45:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A23B107AD28;
 Wed, 30 Oct 2019 06:45:51 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8905D9C3;
 Wed, 30 Oct 2019 06:45:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V6 1/6] mdev: class id support
Date: Wed, 30 Oct 2019 14:44:39 +0800
Message-Id: <20191030064444.21166-2-jasowang@redhat.com>
In-Reply-To: <20191030064444.21166-1-jasowang@redhat.com>
References: <20191030064444.21166-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: WNU8rwzpM5ajq7bmmPQLKw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572417959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P919cs9kLqhOLxjmVpL/0WVat63lfGNnCbk/tFscCiY=;
 b=HWXrlZQU90WIpLF12YAzcfmOxpn/w+T+svfSa+r6fasYkquj8ML+tIqeOinQ8jwGCS1QJT
 TCNSBqz60bkP6bwyZAMozoMZB+PoyQHzdyD5jIp4YANIsUpLfRKpxjMCkHE3P/ZtfaUilA
 qBxj3Aai/oiVku+7BYgDmycYViePmS0=
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
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, jani.nikula@linux.intel.com,
 parav@mellanox.com, zhihong.wang@intel.com, stefanha@redhat.com,
 akrowiak@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
 oberpar@linux.ibm.com, maxime.coquelin@redhat.com, daniel@ffwll.ch,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TWRldiBidXMgb25seSBzdXBwb3J0cyB2ZmlvIGRyaXZlciByaWdodCBub3csIHNvIGl0IGRvZXNu
J3QgaW1wbGVtZW50Cm1hdGNoIG1ldGhvZC4gQnV0IGluIHRoZSBmdXR1cmUsIHdlIG1heSBhZGQg
ZHJpdmVycyBvdGhlciB0aGFuIHZmaW8sCnRoZSBmaXJzdCBkcml2ZXIgY291bGQgYmUgdmlydGlv
LW1kZXYuIFRoaXMgbWVhbnMgd2UgbmVlZCB0byBhZGQKZGV2aWNlIGNsYXNzIGlkIHN1cHBvcnQg
aW4gYnVzIG1hdGNoIG1ldGhvZCB0byBwYWlyIHRoZSBtZGV2IGRldmljZQphbmQgbWRldiBkcml2
ZXIgY29ycmVjdGx5LgoKU28gdGhpcyBwYXRjaCBhZGRzIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVy
IGFuZCBjbGFzc19pZCBmb3IgbWRldgpkZXZpY2Ugd2l0aCB0aGUgbWF0Y2ggbWV0aG9kIGZvciBt
ZGV2IGJ1cy4KClNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
Ci0tLQogLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAgIHwgIDUg
KysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgIHwgIDEg
KwogZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYyAgICAgICAgICAgICAgIHwgIDEgKwog
ZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgIDEgKwogZHJp
dmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysr
KysrCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgICAgICAgICAgICAgfCAyNSAr
KysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCAgICAg
ICAgICAgICAgfCAgMSArCiBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAg
ICAgICAgfCAgNiArKysrKwogaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDggKysrKysrCiBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgICAg
ICAgICAgICAgfCAgOCArKysrKysKIHNhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKIHNhbXBsZXMvdmZpby1tZGV2L21kcHkuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIDEzIGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0IGIv
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAppbmRleCAy
NWViN2Q1YjgzNGIuLjY3MDk0MTNiZWUyOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2
ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZl
ci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0CkBAIC0xMDIsMTIgKzEwMiwxNCBAQCBzdHJ1
Y3R1cmUgdG8gcmVwcmVzZW50IGEgbWVkaWF0ZWQgZGV2aWNlJ3MgZHJpdmVyOjoKICAgICAgICog
QHByb2JlOiBjYWxsZWQgd2hlbiBuZXcgZGV2aWNlIGNyZWF0ZWQKICAgICAgICogQHJlbW92ZTog
Y2FsbGVkIHdoZW4gZGV2aWNlIHJlbW92ZWQKICAgICAgICogQGRyaXZlcjogZGV2aWNlIGRyaXZl
ciBzdHJ1Y3R1cmUKKyAgICAgICogQGlkX3RhYmxlOiB0aGUgaWRzIHNlcnZpY2VkIGJ5IHRoaXMg
ZHJpdmVyCiAgICAgICAqLwogICAgICBzdHJ1Y3QgbWRldl9kcml2ZXIgewogCSAgICAgY29uc3Qg
Y2hhciAqbmFtZTsKIAkgICAgIGludCAgKCpwcm9iZSkgIChzdHJ1Y3QgZGV2aWNlICpkZXYpOwog
CSAgICAgdm9pZCAoKnJlbW92ZSkgKHN0cnVjdCBkZXZpY2UgKmRldik7CiAJICAgICBzdHJ1Y3Qg
ZGV2aWNlX2RyaXZlciAgICBkcml2ZXI7CisJICAgICBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19p
ZCAqaWRfdGFibGU7CiAgICAgIH07CiAKIEEgbWVkaWF0ZWQgYnVzIGRyaXZlciBmb3IgbWRldiBz
aG91bGQgdXNlIHRoaXMgc3RydWN0dXJlIGluIHRoZSBmdW5jdGlvbiBjYWxscwpAQCAtMTcwLDYg
KzE3Miw5IEBAIHRoYXQgYSBkcml2ZXIgc2hvdWxkIHVzZSB0byB1bnJlZ2lzdGVyIGl0c2VsZiB3
aXRoIHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoKIAogCWV4dGVybiB2b2lkIG1kZXZfdW5yZWdpc3Rl
cl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KTsKIAorSXQgaXMgYWxzbyByZXF1aXJlZCB0byBz
cGVjaWZ5IHRoZSBjbGFzc19pZCBpbiBjcmVhdGUoKSBjYWxsYmFjayB0aHJvdWdoOjoKKworCWlu
dCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCk7CiAKIE1l
ZGlhdGVkIERldmljZSBNYW5hZ2VtZW50IEludGVyZmFjZSBUaHJvdWdoIHN5c2ZzCiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQva3ZtZ3QuYwppbmRleCAzNDNkNzljMWNiN2UuLjY0MjBmMGRiZDMxYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2t2bWd0LmMKQEAgLTY3OCw2ICs2NzgsNyBAQCBzdGF0aWMgaW50IGludGVsX3ZncHVf
Y3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCiAJ
CSAgICAgZGV2X25hbWUobWRldl9kZXYobWRldikpKTsKIAlyZXQgPSAwOwogCisJbWRldl9zZXRf
Y2xhc3MobWRldiwgTURFVl9DTEFTU19JRF9WRklPKTsKIG91dDoKIAlyZXR1cm4gcmV0OwogfQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYyBiL2RyaXZlcnMvczM5
MC9jaW8vdmZpb19jY3dfb3BzLmMKaW5kZXggZjBkNzFhYjc3YzUwLi5jZjJjMDEzYWUzMmYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMKKysrIGIvZHJpdmVycy9z
MzkwL2Npby92ZmlvX2Njd19vcHMuYwpAQCAtMTI5LDYgKzEyOSw3IEBAIHN0YXRpYyBpbnQgdmZp
b19jY3dfbWRldl9jcmVhdGUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBtZGV2X2Rldmlj
ZSAqbWRldikKIAkJCSAgIHByaXZhdGUtPnNjaC0+c2NoaWQuc3NpZCwKIAkJCSAgIHByaXZhdGUt
PnNjaC0+c2NoaWQuc2NoX25vKTsKIAorCW1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1Nf
SURfVkZJTyk7CiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9jcnlw
dG8vdmZpb19hcF9vcHMuYyBiL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYwppbmRl
eCA1YzBmNTNjNmRkZTcuLjA3YzMxMDcwYWZlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zMzkwL2Ny
eXB0by92ZmlvX2FwX29wcy5jCisrKyBiL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMu
YwpAQCAtMzQzLDYgKzM0Myw3IEBAIHN0YXRpYyBpbnQgdmZpb19hcF9tZGV2X2NyZWF0ZShzdHJ1
Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQogCWxpc3RfYWRkKCZt
YXRyaXhfbWRldi0+bm9kZSwgJm1hdHJpeF9kZXYtPm1kZXZfbGlzdCk7CiAJbXV0ZXhfdW5sb2Nr
KCZtYXRyaXhfZGV2LT5sb2NrKTsKIAorCW1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1Nf
SURfVkZJTyk7CiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2
L21kZXZfY29yZS5jIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKaW5kZXggYjU1OGQ0
Y2ZkMDgyLi5kMjNjYTM5ZTNiZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZf
Y29yZS5jCisrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCkBAIC00NSw2ICs0NSwx
NiBAQCB2b2lkIG1kZXZfc2V0X2RydmRhdGEoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB2b2lk
ICpkYXRhKQogfQogRVhQT1JUX1NZTUJPTChtZGV2X3NldF9kcnZkYXRhKTsKIAorLyogU3BlY2lm
eSB0aGUgY2xhc3MgZm9yIHRoZSBtZGV2IGRldmljZSwgdGhpcyBtdXN0IGJlIGNhbGxlZCBkdXJp
bmcKKyAqIGNyZWF0ZSgpIGNhbGxiYWNrLgorICovCit2b2lkIG1kZXZfc2V0X2NsYXNzKHN0cnVj
dCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkKQoreworCVdBUk5fT04obWRldi0+Y2xhc3NfaWQp
OworCW1kZXYtPmNsYXNzX2lkID0gaWQ7Cit9CitFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2NsYXNz
KTsKKwogc3RydWN0IGRldmljZSAqbWRldl9kZXYoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQog
ewogCXJldHVybiAmbWRldi0+ZGV2OwpAQCAtMzI0LDYgKzMzNCwxMiBAQCBpbnQgbWRldl9kZXZp
Y2VfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCWlmIChyZXQpCiAJCWdvdG8gb3BzX2Ny
ZWF0ZV9mYWlsOwogCisJaWYgKCFtZGV2LT5jbGFzc19pZCkgeworCQlyZXQgPSAtRUlOVkFMOwor
CQlkZXZfd2FybihkZXYsICJtZGV2IHZlbmRvciBkcml2ZXIgZmFpbGVkIHRvIHNwZWNpZnkgZGV2
aWNlIGNsYXNzXG4iKTsKKwkJZ290byBhZGRfZmFpbDsKKwl9CisKIAlyZXQgPSBkZXZpY2VfYWRk
KCZtZGV2LT5kZXYpOwogCWlmIChyZXQpCiAJCWdvdG8gYWRkX2ZhaWw7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9k
cml2ZXIuYwppbmRleCAwZDMyMjNhZWUyMGIuLmVkMDY0MzM2OTNlOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYworKysgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2
X2RyaXZlci5jCkBAIC02OSw4ICs2OSwzMyBAQCBzdGF0aWMgaW50IG1kZXZfcmVtb3ZlKHN0cnVj
dCBkZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBtZGV2X21hdGNoKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKK3sKKwl1bnNpZ25l
ZCBpbnQgaTsKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB0b19tZGV2X2RldmljZShkZXYp
OworCXN0cnVjdCBtZGV2X2RyaXZlciAqbWRydiA9IHRvX21kZXZfZHJpdmVyKGRydik7CisJY29u
c3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgKmlkcyA9IG1kcnYtPmlkX3RhYmxlOworCisJaWYgKCFp
ZHMpCisJCXJldHVybiAwOworCisJZm9yIChpID0gMDsgaWRzW2ldLmlkOyBpKyspCisJCWlmIChp
ZHNbaV0uaWQgPT0gbWRldi0+Y2xhc3NfaWQpCisJCQlyZXR1cm4gMTsKKwlyZXR1cm4gMDsKK30K
Kworc3RhdGljIGludCBtZGV2X3VldmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb2Jq
X3VldmVudF9lbnYgKmVudikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB0b19tZGV2
X2RldmljZShkZXYpOworCisJcmV0dXJuIGFkZF91ZXZlbnRfdmFyKGVudiwgIk1PREFMSUFTPW1k
ZXY6YyUwMlgiLCBtZGV2LT5jbGFzc19pZCk7Cit9CisKIHN0cnVjdCBidXNfdHlwZSBtZGV2X2J1
c190eXBlID0gewogCS5uYW1lCQk9ICJtZGV2IiwKKwkubWF0Y2gJCT0gbWRldl9tYXRjaCwKKwku
dWV2ZW50CQk9IG1kZXZfdWV2ZW50LAogCS5wcm9iZQkJPSBtZGV2X3Byb2JlLAogCS5yZW1vdmUJ
CT0gbWRldl9yZW1vdmUsCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9w
cml2YXRlLmggYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaAppbmRleCA3ZDkyMjk1
MGNhYWYuLmM2NWY0MzZjMTg2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9w
cml2YXRlLmgKKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKQEAgLTMzLDYg
KzMzLDcgQEAgc3RydWN0IG1kZXZfZGV2aWNlIHsKIAlzdHJ1Y3Qga29iamVjdCAqdHlwZV9rb2Jq
OwogCXN0cnVjdCBkZXZpY2UgKmlvbW11X2RldmljZTsKIAlib29sIGFjdGl2ZTsKKwl1MTYgY2xh
c3NfaWQ7CiB9OwogCiAjZGVmaW5lIHRvX21kZXZfZGV2aWNlKGRldikJY29udGFpbmVyX29mKGRl
diwgc3RydWN0IG1kZXZfZGV2aWNlLCBkZXYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRl
di92ZmlvX21kZXYuYyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCmluZGV4IDMwOTY0
YTRlMGEyOC4uMzg0MzFlOWVmN2Y1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi92Zmlv
X21kZXYuYworKysgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwpAQCAtMTIwLDEwICsx
MjAsMTYgQEAgc3RhdGljIHZvaWQgdmZpb19tZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJdmZpb19kZWxfZ3JvdXBfZGV2KGRldik7CiB9CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRl
dl9jbGFzc19pZCB2ZmlvX2lkX3RhYmxlW10gPSB7CisJeyBNREVWX0NMQVNTX0lEX1ZGSU8gfSwK
Kwl7IDAgfSwKK307CisKIHN0YXRpYyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmZpb19tZGV2X2RyaXZl
ciA9IHsKIAkubmFtZQk9ICJ2ZmlvX21kZXYiLAogCS5wcm9iZQk9IHZmaW9fbWRldl9wcm9iZSwK
IAkucmVtb3ZlCT0gdmZpb19tZGV2X3JlbW92ZSwKKwkuaWRfdGFibGUgPSB2ZmlvX2lkX3RhYmxl
LAogfTsKIAogc3RhdGljIGludCBfX2luaXQgdmZpb19tZGV2X2luaXQodm9pZCkKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbWRldi5oIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKaW5kZXggMGNl
MzBjYTc4ZGIwLi43OGI2OWQwOWViNTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWRldi5o
CisrKyBiL2luY2x1ZGUvbGludXgvbWRldi5oCkBAIC0xMTgsNiArMTE4LDcgQEAgc3RydWN0IG1k
ZXZfdHlwZV9hdHRyaWJ1dGUgbWRldl90eXBlX2F0dHJfIyNfbmFtZSA9CQlcCiAgKiBAcHJvYmU6
IGNhbGxlZCB3aGVuIG5ldyBkZXZpY2UgY3JlYXRlZAogICogQHJlbW92ZTogY2FsbGVkIHdoZW4g
ZGV2aWNlIHJlbW92ZWQKICAqIEBkcml2ZXI6IGRldmljZSBkcml2ZXIgc3RydWN0dXJlCisgKiBA
aWRfdGFibGU6IHRoZSBpZHMgc2VydmljZWQgYnkgdGhpcyBkcml2ZXIKICAqCiAgKiovCiBzdHJ1
Y3QgbWRldl9kcml2ZXIgewpAQCAtMTI1LDYgKzEyNiw3IEBAIHN0cnVjdCBtZGV2X2RyaXZlciB7
CiAJaW50ICAoKnByb2JlKShzdHJ1Y3QgZGV2aWNlICpkZXYpOwogCXZvaWQgKCpyZW1vdmUpKHN0
cnVjdCBkZXZpY2UgKmRldik7CiAJc3RydWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOworCWNvbnN0
IHN0cnVjdCBtZGV2X2NsYXNzX2lkICppZF90YWJsZTsKIH07CiAKICNkZWZpbmUgdG9fbWRldl9k
cml2ZXIoZHJ2KQljb250YWluZXJfb2YoZHJ2LCBzdHJ1Y3QgbWRldl9kcml2ZXIsIGRyaXZlcikK
QEAgLTEzMiw2ICsxMzQsNyBAQCBzdHJ1Y3QgbWRldl9kcml2ZXIgewogdm9pZCAqbWRldl9nZXRf
ZHJ2ZGF0YShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwogdm9pZCBtZGV2X3NldF9kcnZkYXRh
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdm9pZCAqZGF0YSk7CiBjb25zdCBndWlkX3QgKm1k
ZXZfdXVpZChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwordm9pZCBtZGV2X3NldF9jbGFzcyhz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCk7CiAKIGV4dGVybiBzdHJ1Y3QgYnVzX3R5
cGUgbWRldl9idXNfdHlwZTsKIApAQCAtMTQ1LDQgKzE0OCw5IEBAIHN0cnVjdCBkZXZpY2UgKm1k
ZXZfcGFyZW50X2RldihzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwogc3RydWN0IGRldmljZSAq
bWRldl9kZXYoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKIHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldl9mcm9tX2RldihzdHJ1Y3QgZGV2aWNlICpkZXYpOwogCitlbnVtIHsKKwlNREVWX0NMQVNT
X0lEX1ZGSU8gPSAxLAorCS8qIE5ldyBlbnRyaWVzIG11c3QgYmUgYWRkZWQgaGVyZSAqLworfTsK
KwogI2VuZGlmIC8qIE1ERVZfSCAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tb2RfZGV2
aWNldGFibGUuaCBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKaW5kZXggNTcxNGZk
MzVhODNjLi5mMzJjNmU0NGZiMWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbW9kX2Rldmlj
ZXRhYmxlLmgKKysrIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaApAQCAtODIxLDQg
KzgyMSwxMiBAQCBzdHJ1Y3Qgd21pX2RldmljZV9pZCB7CiAJY29uc3Qgdm9pZCAqY29udGV4dDsK
IH07CiAKKy8qKgorICogc3RydWN0IG1kZXZfY2xhc3NfaWQgLSBNREVWIGRldmljZSBjbGFzcyBp
ZGVudGlmaWVyCisgKiBAaWQ6IFVzZWQgdG8gaWRlbnRpZnkgYSBzcGVjaWZpYyBjbGFzcyBvZiBk
ZXZpY2UsIGUuZyB2ZmlvLW1kZXYgZGV2aWNlLgorICovCitzdHJ1Y3QgbWRldl9jbGFzc19pZCB7
CisJX191MTYgaWQ7Cit9OworCiAjZW5kaWYgLyogTElOVVhfTU9EX0RFVklDRVRBQkxFX0ggKi8K
ZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jIGIvc2FtcGxlcy92ZmlvLW1k
ZXYvbWJvY2hzLmMKaW5kZXggYWM1YzhjMTdiMWZmLi4xMTViYzUwNzQ2NTYgMTAwNjQ0Ci0tLSBh
L3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCisrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2No
cy5jCkBAIC01NjEsNiArNTYxLDcgQEAgc3RhdGljIGludCBtYm9jaHNfY3JlYXRlKHN0cnVjdCBr
b2JqZWN0ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCiAJbWJvY2hzX3Jlc2V0KG1k
ZXYpOwogCiAJbWJvY2hzX3VzZWRfbWJ5dGVzICs9IHR5cGUtPm1ieXRlczsKKwltZGV2X3NldF9j
bGFzcyhtZGV2LCBNREVWX0NMQVNTX0lEX1ZGSU8pOwogCXJldHVybiAwOwogCiBlcnJfbWVtOgpk
aWZmIC0tZ2l0IGEvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jIGIvc2FtcGxlcy92ZmlvLW1kZXYv
bWRweS5jCmluZGV4IGNjODZiZjY1NjZlNC4uNjY1NjE0NTc0ZDUwIDEwMDY0NAotLS0gYS9zYW1w
bGVzL3ZmaW8tbWRldi9tZHB5LmMKKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jCkBAIC0y
NjksNiArMjY5LDcgQEAgc3RhdGljIGludCBtZHB5X2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAqa29i
aiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQogCW1kcHlfcmVzZXQobWRldik7CiAKIAltZHB5
X2NvdW50Kys7CisJbWRldl9zZXRfY2xhc3MobWRldiwgTURFVl9DTEFTU19JRF9WRklPKTsKIAly
ZXR1cm4gMDsKIH0KIApkaWZmIC0tZ2l0IGEvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jIGIvc2Ft
cGxlcy92ZmlvLW1kZXYvbXR0eS5jCmluZGV4IGNlODRhMzAwYTRkYS4uOTBkYTEyZmY3ZmQ5IDEw
MDY0NAotLS0gYS9zYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMKKysrIGIvc2FtcGxlcy92ZmlvLW1k
ZXYvbXR0eS5jCkBAIC03NTUsNiArNzU1LDcgQEAgc3RhdGljIGludCBtdHR5X2NyZWF0ZShzdHJ1
Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQogCWxpc3RfYWRkKCZt
ZGV2X3N0YXRlLT5uZXh0LCAmbWRldl9kZXZpY2VzX2xpc3QpOwogCW11dGV4X3VubG9jaygmbWRl
dl9saXN0X2xvY2spOwogCisJbWRldl9zZXRfY2xhc3MobWRldiwgTURFVl9DTEFTU19JRF9WRklP
KTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
