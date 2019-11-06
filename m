Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31CF1005
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Nov 2019 08:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA76EC0D;
	Wed,  6 Nov 2019 07:12:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878C6EC14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 Nov 2019 07:12:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-75NCf1exO-yRWZVHN8xgaw-1; Wed, 06 Nov 2019 02:12:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B183A107ACC3;
 Wed,  6 Nov 2019 07:12:26 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-193.pek2.redhat.com [10.72.12.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E19321001B00;
 Wed,  6 Nov 2019 07:10:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V9 4/6] mdev: introduce virtio device and its device ops
Date: Wed,  6 Nov 2019 15:05:46 +0800
Message-Id: <20191106070548.18980-5-jasowang@redhat.com>
In-Reply-To: <20191106070548.18980-1-jasowang@redhat.com>
References: <20191106070548.18980-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 75NCf1exO-yRWZVHN8xgaw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573024356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waDiR4Z+WN5Tv5XRp52PphljdgPLRS8arSjDtxYa9og=;
 b=dF0WfcXTfQVGZovuyhom0xcmxGpdkPtsR3Jm9oEEuhgZC4PvZdd58paY6yMA3UypFEWSj+
 AlL4zBiE+cw9mLKTTh8+0WTw+/k8h3EYcV2V+LtRAhV3Zal/QvJehaB5z7nviLM2J6ZHDQ
 Z9nSa52UO3sw5I6vrMXy7daOsnR62pk=
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

VGhpcyBwYXRjaCBpbXBsZW1lbnRzIGJhc2ljIHN1cHBvcnQgZm9yIG1kZXYgZHJpdmVyIHRoYXQg
c3VwcG9ydHMKdmlydGlvIHRyYW5zcG9ydCBmb3Iga2VybmVsIHZpcnRpbyBkcml2ZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgotLS0KIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvdmZpby9tZGV2L21kZXZf
Y29yZS5jICAgIHwgIDIxICsrKysrCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaCB8
ICAgMiArCiBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICB8ICAgNiArKwogaW5jbHVk
ZS9saW51eC9tZGV2X3ZpcnRpb19vcHMuaCAgfCAxNDcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxNzcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvbGludXgvbWRldl92aXJ0aW9fb3BzLmgKCmRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGY2NjFkMTMzNDRkNi4uNDk5Nzk1NzQ0M2RmIDEw
MDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTcyNDgsNiArMTcy
NDgsNyBAQCBGOglpbmNsdWRlL2xpbnV4L3ZpcnRpbyouaAogRjoJaW5jbHVkZS91YXBpL2xpbnV4
L3ZpcnRpb18qLmgKIEY6CWRyaXZlcnMvY3J5cHRvL3ZpcnRpby8KIEY6CW1tL2JhbGxvb25fY29t
cGFjdGlvbi5jCitGOglpbmNsdWRlL2xpbnV4L21kZXZfdmlydGlvX29wcy5oCiAKIFZJUlRJTyBC
TE9DSyBBTkQgU0NTSSBEUklWRVJTCiBNOgkiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhh
dC5jb20+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyBiL2RyaXZl
cnMvdmZpby9tZGV2L21kZXZfY29yZS5jCmluZGV4IDRlNzBmMTlhYzE0NS4uYzU4MjUzNDA0ZWQ1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYworKysgYi9kcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X2NvcmUuYwpAQCAtNzgsNiArNzgsMjcgQEAgY29uc3Qgc3RydWN0IG1k
ZXZfdmZpb19kZXZpY2Vfb3BzICptZGV2X2dldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYpCiB9CiBFWFBPUlRfU1lNQk9MKG1kZXZfZ2V0X3ZmaW9fb3BzKTsKIAorLyoKKyAqIFNw
ZWNpZnkgdGhlIHZpcnRpbyBkZXZpY2Ugb3BzIGZvciB0aGUgbWRldiBkZXZpY2UsIHRoaXMKKyAq
IG11c3QgYmUgY2FsbGVkIGR1cmluZyBjcmVhdGUoKSBjYWxsYmFjayBmb3IgdmlydGlvIG1kZXYg
ZGV2aWNlLgorICovCit2b2lkIG1kZXZfc2V0X3ZpcnRpb19vcHMoc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2LAorCQkJIGNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICp2aXJ0aW9f
b3BzKQoreworCW1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1NfSURfVklSVElPKTsKKwlt
ZGV2LT52aXJ0aW9fb3BzID0gdmlydGlvX29wczsKK30KK0VYUE9SVF9TWU1CT0wobWRldl9zZXRf
dmlydGlvX29wcyk7CisKKy8qIEdldCB0aGUgdmlydGlvIGRldmljZSBvcHMgZm9yIHRoZSBtZGV2
IGRldmljZS4gKi8KK2NvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICoKK21kZXZf
Z2V0X3ZpcnRpb19vcHMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQoreworCVdBUk5fT04obWRl
di0+Y2xhc3NfaWQgIT0gTURFVl9DTEFTU19JRF9WSVJUSU8pOworCXJldHVybiBtZGV2LT52aXJ0
aW9fb3BzOworfQorRVhQT1JUX1NZTUJPTChtZGV2X2dldF92aXJ0aW9fb3BzKTsKKwogc3RydWN0
IGRldmljZSAqbWRldl9kZXYoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQogewogCXJldHVybiAm
bWRldi0+ZGV2OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgg
Yi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZhdGUuaAppbmRleCA0MTEyMjczNzM2MjUuLjJj
NzRkZDAzMjQwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgK
KysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKQEAgLTExLDYgKzExLDcgQEAK
ICNkZWZpbmUgTURFVl9QUklWQVRFX0gKIAogI2luY2x1ZGUgPGxpbnV4L21kZXZfdmZpb19vcHMu
aD4KKyNpbmNsdWRlIDxsaW51eC9tZGV2X3ZpcnRpb19vcHMuaD4KIAogaW50ICBtZGV2X2J1c19y
ZWdpc3Rlcih2b2lkKTsKIHZvaWQgbWRldl9idXNfdW5yZWdpc3Rlcih2b2lkKTsKQEAgLTM4LDYg
KzM5LDcgQEAgc3RydWN0IG1kZXZfZGV2aWNlIHsKIAl1MTYgY2xhc3NfaWQ7CiAJdW5pb24gewog
CQljb25zdCBzdHJ1Y3QgbWRldl92ZmlvX2RldmljZV9vcHMgKnZmaW9fb3BzOworCQljb25zdCBz
dHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyAqdmlydGlvX29wczsKIAl9OwogfTsKIApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZGV2LmggYi9pbmNsdWRlL2xpbnV4L21kZXYuaAppbmRl
eCA5ZTM3NTA2ZDE5ODcuLmYzZDc1YTYwYzJiNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9t
ZGV2LmgKKysrIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKQEAgLTE3LDYgKzE3LDcgQEAKIAogc3Ry
dWN0IG1kZXZfZGV2aWNlOwogc3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzOworc3RydWN0IG1k
ZXZfdmlydGlvX2RldmljZV9vcHM7CiAKIC8qCiAgKiBDYWxsZWQgYnkgdGhlIHBhcmVudCBkZXZp
Y2UgZHJpdmVyIHRvIHNldCB0aGUgZGV2aWNlIHdoaWNoIHJlcHJlc2VudHMKQEAgLTExMiw2ICsx
MTMsMTAgQEAgdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUx
NiBpZCk7CiB2b2lkIG1kZXZfc2V0X3ZmaW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwK
IAkJICAgICAgIGNvbnN0IHN0cnVjdCBtZGV2X3ZmaW9fZGV2aWNlX29wcyAqdmZpb19vcHMpOwog
Y29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzICptZGV2X2dldF92ZmlvX29wcyhzdHJ1
Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwordm9pZCBtZGV2X3NldF92aXJ0aW9fb3BzKHN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldiwKKwkJCSBjb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29w
cyAqdmlydGlvX29wcyk7Citjb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyAqCitt
ZGV2X2dldF92aXJ0aW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7CiAKIGV4dGVybiBz
dHJ1Y3QgYnVzX3R5cGUgbWRldl9idXNfdHlwZTsKIApAQCAtMTI3LDYgKzEzMiw3IEBAIHN0cnVj
dCBtZGV2X2RldmljZSAqbWRldl9mcm9tX2RldihzdHJ1Y3QgZGV2aWNlICpkZXYpOwogCiBlbnVt
IHsKIAlNREVWX0NMQVNTX0lEX1ZGSU8gPSAxLAorCU1ERVZfQ0xBU1NfSURfVklSVElPID0gMiwK
IAkvKiBOZXcgZW50cmllcyBtdXN0IGJlIGFkZGVkIGhlcmUgKi8KIH07CiAKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbWRldl92aXJ0aW9fb3BzLmggYi9pbmNsdWRlL2xpbnV4L21kZXZfdmly
dGlvX29wcy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uODk1MTMz
MWM2NjI5Ci0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9saW51eC9tZGV2X3ZpcnRpb19vcHMu
aApAQCAtMCwwICsxLDE0NyBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLworLyoKKyAqIFZpcnRpbyBtZWRpYXRlZCBkZXZpY2UgZHJpdmVyCisgKgorICogQ29w
eXJpZ2h0IDIwMTksIFJlZCBIYXQgQ29ycC4KKyAqICAgICBBdXRob3I6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+CisgKi8KKyNpZm5kZWYgTURFVl9WSVJUSU9fT1BTX0gKKyNkZWZp
bmUgTURFVl9WSVJUSU9fT1BTX0gKKworI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgorI2lu
Y2x1ZGUgPGxpbnV4L21kZXYuaD4KKyNpbmNsdWRlIDx1YXBpL2xpbnV4L3Zob3N0Lmg+CisKKyNk
ZWZpbmUgVklSVElPX01ERVZfREVWSUNFX0FQSV9TVFJJTkcJCSJ2aXJ0aW8tbWRldiIKKworc3Ry
dWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIHsKKwlpcnFyZXR1cm5fdCAoKmNhbGxiYWNrKSh2b2lk
ICpkYXRhKTsKKwl2b2lkICpwcml2YXRlOworfTsKKworLyoqCisgKiBzdHJ1Y3QgbWRldl92aXJ0
aW9fZGV2aWNlX29wcyAtIFN0cnVjdHVyZSB0byBiZSByZWdpc3RlcmVkIGZvciBlYWNoCisgKiBt
ZGV2IGRldmljZSB0byByZWdpc3RlciB0aGUgZGV2aWNlIGZvciB2aXJ0aW8vdmhvc3QgZHJpdmVy
cy4KKyAqCisgKiBUaGUgY2FsbGJhY2tzIGFyZSBtYW5kYXRvcnkgdW5sZXNzIGV4cGxpY2l0bHkg
bWVudGlvbmVkLgorICoKKyAqIEBzZXRfdnFfYWRkcmVzczoJCVNldCB0aGUgYWRkcmVzcyBvZiB2
aXJ0cXVldWUKKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKKyAqCQkJCUBpZHg6IHZpcnRx
dWV1ZSBpbmRleAorICoJCQkJQGRlc2NfYXJlYTogYWRkcmVzcyBvZiBkZXNjIGFyZWEKKyAqCQkJ
CUBkcml2ZXJfYXJlYTogYWRkcmVzcyBvZiBkcml2ZXIgYXJlYQorICoJCQkJQGRldmljZV9hcmVh
OiBhZGRyZXNzIG9mIGRldmljZSBhcmVhCisgKgkJCQlSZXR1cm5zIGludGVnZXI6IHN1Y2Nlc3Mg
KDApIG9yIGVycm9yICg8IDApCisgKiBAc2V0X3ZxX251bToJCQlTZXQgdGhlIHNpemUgb2Ygdmly
dHF1ZXVlCisgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCisgKgkJCQlAaWR4OiB2aXJ0cXVl
dWUgaW5kZXgKKyAqCQkJCUBudW06IHRoZSBzaXplIG9mIHZpcnRxdWV1ZQorICogQGtpY2tfdnE6
CQkJS2ljayB0aGUgdmlydHF1ZXVlCisgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCisgKgkJ
CQlAaWR4OiB2aXJ0cXVldWUgaW5kZXgKKyAqIEBzZXRfdnFfY2I6CQkJU2V0IHRoZSBpbnRlcnJ1
cHQgY2FsbGJhY2sgZnVuY3Rpb24gZm9yCisgKgkJCQlhIHZpcnRxdWV1ZQorICoJCQkJQG1kZXY6
IG1lZGlhdGVkIGRldmljZQorICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4CisgKgkJCQlAY2I6
IHZpcnRpby1tZGV2IGludGVycnVwdCBjYWxsYmFjayBzdHJ1Y3R1cmUKKyAqIEBzZXRfdnFfcmVh
ZHk6CQlTZXQgcmVhZHkgc3RhdHVzIGZvciBhIHZpcnRxdWV1ZQorICoJCQkJQG1kZXY6IG1lZGlh
dGVkIGRldmljZQorICoJCQkJQGlkeDogdmlydHF1ZXVlIGluZGV4CisgKgkJCQlAcmVhZHk6IHJl
YWR5ICh0cnVlKSBub3QgcmVhZHkoZmFsc2UpCisgKiBAZ2V0X3ZxX3JlYWR5OgkJR2V0IHJlYWR5
IHN0YXR1cyBmb3IgYSB2aXJ0cXVldWUKKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKKyAq
CQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAorICoJCQkJUmV0dXJucyBib29sZWFuOiByZWFkeSAo
dHJ1ZSkgb3Igbm90IChmYWxzZSkKKyAqIEBzZXRfdnFfc3RhdGU6CQlTZXQgdGhlIHN0YXRlIGZv
ciBhIHZpcnRxdWV1ZQorICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQorICoJCQkJQGlkeDog
dmlydHF1ZXVlIGluZGV4CisgKgkJCQlAc3RhdGU6IHZpcnRxdWV1ZSBzdGF0ZSAobGFzdF9hdmFp
bF9pZHgpCisgKgkJCQlSZXR1cm5zIGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9yICg8IDAp
CisgKiBAZ2V0X3ZxX3N0YXRlOgkJR2V0IHRoZSBzdGF0ZSBmb3IgYSB2aXJ0cXVldWUKKyAqCQkJ
CUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKKyAqCQkJCUBpZHg6IHZpcnRxdWV1ZSBpbmRleAorICoJ
CQkJUmV0dXJucyB2aXJ0cXVldWUgc3RhdGUgKGxhc3RfYXZhaWxfaWR4KQorICogQGdldF92cV9h
bGlnbjoJCUdldCB0aGUgdmlydHF1ZXVlIGFsaWduIHJlcXVpcmVtZW50CisgKgkJCQlmb3IgdGhl
IGRldmljZQorICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQorICoJCQkJUmV0dXJucyB2aXJ0
cXVldWUgYWxnaW4gcmVxdWlyZW1lbnQKKyAqIEBnZXRfZmVhdHVyZXM6CQlHZXQgdmlydGlvIGZl
YXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgZGV2aWNlCisgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2
aWNlCisgKgkJCQlSZXR1cm5zIHRoZSB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9ydCBieSB0aGUKKyAq
CQkJCWRldmljZQorICogQHNldF9mZWF0dXJlczoJCVNldCB2aXJ0aW8gZmVhdHVyZXMgc3VwcG9y
dGVkIGJ5IHRoZSBkcml2ZXIKKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKKyAqCQkJCUBm
ZWF0dXJlczogZmVhdHVyZSBzdXBwb3J0IGJ5IHRoZSBkcml2ZXIKKyAqCQkJCVJldHVybnMgaW50
ZWdlcjogc3VjY2VzcyAoMCkgb3IgZXJyb3IgKDwgMCkKKyAqIEBzZXRfY29uZmlnX2NiOgkJU2V0
IHRoZSBjb25maWcgaW50ZXJydXB0IGNhbGxiYWNrCisgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2
aWNlCisgKgkJCQlAY2I6IHZpcnRpby1tZGV2IGludGVycnVwdCBjYWxsYmFjayBzdHJ1Y3R1cmUK
KyAqIEBnZXRfdnFfbnVtX21heDoJCUdldCB0aGUgbWF4IHNpemUgb2YgdmlydHF1ZXVlCisgKgkJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCisgKgkJCQlSZXR1cm5zIHUxNjogbWF4IHNpemUgb2Yg
dmlydHF1ZXVlCisgKiBAZ2V0X2RldmljZV9pZDoJCUdldCB2aXJ0aW8gZGV2aWNlIGlkCisgKgkJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCisgKgkJCQlSZXR1cm5zIHUzMjogdmlydGlvIGRldmlj
ZSBpZAorICogQGdldF92ZW5kb3JfaWQ6CQlHZXQgaWQgZm9yIHRoZSB2ZW5kb3IgdGhhdCBwcm92
aWRlcyB0aGlzIGRldmljZQorICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQorICoJCQkJUmV0
dXJucyB1MzI6IHZpcnRpbyB2ZW5kb3IgaWQKKyAqIEBnZXRfc3RhdHVzOgkJCUdldCB0aGUgZGV2
aWNlIHN0YXR1cworICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQorICoJCQkJUmV0dXJucyB1
ODogdmlydGlvIGRldmljZSBzdGF0dXMKKyAqIEBzZXRfc3RhdHVzOgkJCVNldCB0aGUgZGV2aWNl
IHN0YXR1cworICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQorICoJCQkJQHN0YXR1czogdmly
dGlvIGRldmljZSBzdGF0dXMKKyAqIEBnZXRfY29uZmlnOgkJCVJlYWQgZnJvbSBkZXZpY2Ugc3Bl
Y2lmaWMgY29uZmlndXJhdGlvbiBzcGFjZQorICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQor
ICoJCQkJQG9mZnNldDogb2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBvZgorICoJCQkJY29uZmln
dXJhdGlvbiBzcGFjZQorICoJCQkJQGJ1ZjogYnVmZmVyIHVzZWQgdG8gcmVhZCB0bworICoJCQkJ
QGxlbjogdGhlIGxlbmd0aCB0byByZWFkIGZyb20KKyAqCQkJCWNvbmZpZ3JhdGlvbiBzcGFjZQor
ICogQHNldF9jb25maWc6CQkJV3JpdGUgdG8gZGV2aWNlIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24g
c3BhY2UKKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKKyAqCQkJCUBvZmZzZXQ6IG9mZnNl
dCBmcm9tIHRoZSBiZWdpbm5pbmcgb2YKKyAqCQkJCWNvbmZpZ3VyYXRpb24gc3BhY2UKKyAqCQkJ
CUBidWY6IGJ1ZmZlciB1c2VkIHRvIHdyaXRlIGZyb20KKyAqCQkJCUBsZW46IHRoZSBsZW5ndGgg
dG8gd3JpdGUgdG8KKyAqCQkJCWNvbmZpZ3JhdGlvbiBzcGFjZQorICogQGdldF9nZW5lcmF0aW9u
OgkJR2V0IGRldmljZSBjb25maWcgZ2VuZXJhdG9uIChvcHRpb25hbCkKKyAqCQkJCUBtZGV2OiBt
ZWRpYXRlZCBkZXZpY2UKKyAqCQkJCVJldHVybnMgdTMyOiBkZXZpY2UgZ2VuZXJhdGlvbgorICov
CitzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyB7CisJLyogVmlydHF1ZXVlIG9wcyAqLwor
CWludCAoKnNldF92cV9hZGRyZXNzKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCisJCQkgICAg
ICB1MTYgaWR4LCB1NjQgZGVzY19hcmVhLCB1NjQgZHJpdmVyX2FyZWEsCisJCQkgICAgICB1NjQg
ZGV2aWNlX2FyZWEpOworCXZvaWQgKCpzZXRfdnFfbnVtKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHUxNiBpZHgsIHUzMiBudW0pOworCXZvaWQgKCpraWNrX3ZxKShzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYsIHUxNiBpZHgpOworCXZvaWQgKCpzZXRfdnFfY2IpKHN0cnVjdCBtZGV2X2Rldmlj
ZSAqbWRldiwgdTE2IGlkeCwKKwkJCSAgc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrICpjYik7
CisJdm9pZCAoKnNldF92cV9yZWFkeSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4
LCBib29sIHJlYWR5KTsKKwlib29sICgqZ2V0X3ZxX3JlYWR5KShzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsIHUxNiBpZHgpOworCWludCAoKnNldF92cV9zdGF0ZSkoc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2LCB1MTYgaWR4LCB1NjQgc3RhdGUpOworCXU2NCAoKmdldF92cV9zdGF0ZSkoc3RydWN0
IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KTsKKworCS8qIFZpcnRpbyBkZXZpY2Ugb3BzICov
CisJdTE2ICgqZ2V0X3ZxX2FsaWduKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOworCXU2NCAo
KmdldF9mZWF0dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKKwlpbnQgKCpzZXRfZmVh
dHVyZXMpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTY0IGZlYXR1cmVzKTsKKwl2b2lkICgq
c2V0X2NvbmZpZ19jYikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LAorCQkJICAgICAgc3RydWN0
IHZpcnRpb19tZGV2X2NhbGxiYWNrICpjYik7CisJdTE2ICgqZ2V0X3ZxX251bV9tYXgpKHN0cnVj
dCBtZGV2X2RldmljZSAqbWRldik7CisJdTMyICgqZ2V0X2RldmljZV9pZCkoc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2KTsKKwl1MzIgKCpnZXRfdmVuZG9yX2lkKShzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYpOworCXU4ICgqZ2V0X3N0YXR1cykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKKwl2
b2lkICgqc2V0X3N0YXR1cykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1OCBzdGF0dXMpOwor
CXZvaWQgKCpnZXRfY29uZmlnKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGlu
dCBvZmZzZXQsCisJCQkgICB2b2lkICpidWYsIHVuc2lnbmVkIGludCBsZW4pOworCXZvaWQgKCpz
ZXRfY29uZmlnKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGludCBvZmZzZXQs
CisJCQkgICBjb25zdCB2b2lkICpidWYsIHVuc2lnbmVkIGludCBsZW4pOworCXUzMiAoKmdldF9n
ZW5lcmF0aW9uKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOworfTsKKwordm9pZCBtZGV2X3Nl
dF92aXJ0aW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKKwkJCSBjb25zdCBzdHJ1Y3Qg
bWRldl92aXJ0aW9fZGV2aWNlX29wcyAqdmlydGlvX29wcyk7CisKKyNlbmRpZgotLSAKMi4xOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
