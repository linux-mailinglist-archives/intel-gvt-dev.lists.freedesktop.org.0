Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCFCD3AD7
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Oct 2019 10:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5279D6EBD7;
	Fri, 11 Oct 2019 08:21:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161146EBD7;
 Fri, 11 Oct 2019 08:21:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39EF718C4262;
 Fri, 11 Oct 2019 08:21:13 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-241.pek2.redhat.com [10.72.12.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18F031001B11;
 Fri, 11 Oct 2019 08:19:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V3 6/7] virtio: introduce a mdev based transport
Date: Fri, 11 Oct 2019 16:15:56 +0800
Message-Id: <20191011081557.28302-7-jasowang@redhat.com>
In-Reply-To: <20191011081557.28302-1-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 11 Oct 2019 08:21:13 +0000 (UTC)
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
 parav@mellanox.com, zhihong.wang@intel.com, akrowiak@linux.ibm.com,
 netdev@vger.kernel.org, cohuck@redhat.com, oberpar@linux.ibm.com,
 maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8uIFRo
aXMgaXMgdXNlZCB0bwp1c2Uga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhlIG1lZGlh
dGVkIGRldmljZSB0aGF0IGlzIGNhcGFibGUKb2YgcG9wdWxhdGluZyB2aXJ0cXVldWUgZGlyZWN0
bHkuCgpBIG5ldyB2aXJ0aW8tbWRldiBkcml2ZXIgd2lsbCBiZSByZWdpc3RlcmVkIHRvIHRoZSBt
ZGV2IGJ1cywgd2hlbiBhCm5ldyB2aXJ0aW8tbWRldiBkZXZpY2UgaXMgcHJvYmVkLCBpdCB3aWxs
IHJlZ2lzdGVyIHRoZSBkZXZpY2Ugd2l0aAptZGV2IGJhc2VkIGNvbmZpZyBvcHMuIFRoaXMgbWVh
bnMgaXQgaXMgYSBzb2Z0d2FyZSB0cmFuc3BvcnQgYmV0d2VlbgptZGV2IGRyaXZlciBhbmQgbWRl
diBkZXZpY2UuIFRoZSB0cmFuc3BvcnQgd2FzIGltcGxlbWVudGVkIHRocm91Z2gKZGV2aWNlIHNw
ZWNpZmljIG9wc3doaWNoIGlzIGEgcGFydCBvZiBtZGV2X3BhcmVudF9vcHMgbm93LgoKU2lnbmVk
LW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3Zp
cnRpby9LY29uZmlnICAgICAgIHwgICA3ICsKIGRyaXZlcnMvdmlydGlvL01ha2VmaWxlICAgICAg
fCAgIDEgKwogZHJpdmVycy92aXJ0aW8vdmlydGlvX21kZXYuYyB8IDQxNiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0MjQgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpcnRpby9LY29uZmlnIGIvZHJpdmVycy92aXJ0aW8vS2NvbmZpZwpp
bmRleCAwNzg2MTVjZjJhZmMuLjhkMTg3MjJhYjU3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aXJ0
aW8vS2NvbmZpZworKysgYi9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCkBAIC00Myw2ICs0MywxMyBA
QCBjb25maWcgVklSVElPX1BDSV9MRUdBQ1kKIAogCSAgSWYgdW5zdXJlLCBzYXkgWS4KIAorY29u
ZmlnIFZJUlRJT19NREVWX0RFVklDRQorCXRyaXN0YXRlICJWSVJUSU8gZHJpdmVyIGZvciBNZWRp
YXRlZCBkZXZpY2VzIgorCWRlcGVuZHMgb24gVkZJT19NREVWICYmIFZJUlRJTworCWRlZmF1bHQg
bgorCWhlbHAKKwkgIFZJUlRJTyBiYXNlZCBkcml2ZXIgZm9yIE1lZGlhdGVkIGRldmljZXMuCisK
IGNvbmZpZyBWSVJUSU9fUE1FTQogCXRyaXN0YXRlICJTdXBwb3J0IGZvciB2aXJ0aW8gcG1lbSBk
cml2ZXIiCiAJZGVwZW5kcyBvbiBWSVJUSU8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL01h
a2VmaWxlIGIvZHJpdmVycy92aXJ0aW8vTWFrZWZpbGUKaW5kZXggM2EyYjVjNWRjZjQ2Li5lYmM3
ZmExNWFlODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydGlvL01ha2VmaWxlCisrKyBiL2RyaXZl
cnMvdmlydGlvL01ha2VmaWxlCkBAIC02LDMgKzYsNCBAQCB2aXJ0aW9fcGNpLXkgOj0gdmlydGlv
X3BjaV9tb2Rlcm4ubyB2aXJ0aW9fcGNpX2NvbW1vbi5vCiB2aXJ0aW9fcGNpLSQoQ09ORklHX1ZJ
UlRJT19QQ0lfTEVHQUNZKSArPSB2aXJ0aW9fcGNpX2xlZ2FjeS5vCiBvYmotJChDT05GSUdfVklS
VElPX0JBTExPT04pICs9IHZpcnRpb19iYWxsb29uLm8KIG9iai0kKENPTkZJR19WSVJUSU9fSU5Q
VVQpICs9IHZpcnRpb19pbnB1dC5vCitvYmotJChDT05GSUdfVklSVElPX01ERVZfREVWSUNFKSAr
PSB2aXJ0aW9fbWRldi5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5j
IGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21kZXYuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLjg1MTZmM2YwZjY1OAotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMv
dmlydGlvL3ZpcnRpb19tZGV2LmMKQEAgLTAsMCArMSw0MTYgQEAKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKy8qCisgKiBWSVJUSU8gYmFzZWQgZHJpdmVyIGZvciBN
ZWRpYXRlZCBkZXZpY2UKKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMTksIFJlZCBIYXQuIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuCisgKiAgICAgQXV0aG9yOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPgorICoKKyAqLworCisjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRlIDxsaW51eC91dWlk
Lmg+CisjaW5jbHVkZSA8bGludXgvbWRldi5oPgorI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19tZGV2
Lmg+CisjaW5jbHVkZSA8bGludXgvdmlydGlvLmg+CisjaW5jbHVkZSA8bGludXgvdmlydGlvX2Nv
bmZpZy5oPgorI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19yaW5nLmg+CisKKyNkZWZpbmUgRFJJVkVS
X1ZFUlNJT04gICIwLjEiCisjZGVmaW5lIERSSVZFUl9BVVRIT1IgICAiUmVkIEhhdCBDb3Jwb3Jh
dGlvbiIKKyNkZWZpbmUgRFJJVkVSX0RFU0MgICAgICJWSVJUSU8gYmFzZWQgZHJpdmVyIGZvciBN
ZWRpYXRlZCBkZXZpY2UiCisKKyNkZWZpbmUgdG9fdmlydGlvX21kZXZfZGV2aWNlKGRldikgXAor
CWNvbnRhaW5lcl9vZihkZXYsIHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UsIHZkZXYpCisKK3N0
cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UgeworCXN0cnVjdCB2aXJ0aW9fZGV2aWNlIHZkZXY7CisJ
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2OworCXVuc2lnbmVkIGxvbmcgdmVyc2lvbjsKKworCXN0
cnVjdCB2aXJ0cXVldWUgKip2cXM7CisJLyogVGhlIGxvY2sgdG8gcHJvdGVjdCB2aXJ0cXVldWUg
bGlzdCAqLworCXNwaW5sb2NrX3QgbG9jazsKKwlzdHJ1Y3QgbGlzdF9oZWFkIHZpcnRxdWV1ZXM7
Cit9OworCitzdHJ1Y3QgdmlydGlvX21kZXZfdnFfaW5mbyB7CisJLyogdGhlIGFjdHVhbCB2aXJ0
cXVldWUgKi8KKwlzdHJ1Y3QgdmlydHF1ZXVlICp2cTsKKworCS8qIHRoZSBsaXN0IG5vZGUgZm9y
IHRoZSB2aXJ0cXVldWVzIGxpc3QgKi8KKwlzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cit9OworCitz
dGF0aWMgc3RydWN0IG1kZXZfZGV2aWNlICp2bV9nZXRfbWRldihzdHJ1Y3QgdmlydGlvX2Rldmlj
ZSAqdmRldikKK3sKKwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0
aW9fbWRldl9kZXZpY2UodmRldik7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdm1fZGV2
LT5tZGV2OworCisJcmV0dXJuIG1kZXY7Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X2dl
dChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgb2Zmc2V0LAorCQkJICAgIHZv
aWQgKmJ1ZiwgdW5zaWduZWQgbGVuKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZt
X2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpv
cHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOworCisJb3BzLT5nZXRfY29uZmlnKG1kZXYsIG9m
ZnNldCwgYnVmLCBsZW4pOworfQorCitzdGF0aWMgdm9pZCB2aXJ0aW9fbWRldl9zZXQoc3RydWN0
IHZpcnRpb19kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIG9mZnNldCwKKwkJCSAgICBjb25zdCB2b2lk
ICpidWYsIHVuc2lnbmVkIGxlbikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2bV9n
ZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3Bz
ID0gbWRldl9nZXRfZGV2X29wcyhtZGV2KTsKKworCW9wcy0+c2V0X2NvbmZpZyhtZGV2LCBvZmZz
ZXQsIGJ1ZiwgbGVuKTsKK30KKworc3RhdGljIHUzMiB2aXJ0aW9fbWRldl9nZW5lcmF0aW9uKHN0
cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9
IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3Bz
ICpvcHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOworCisJcmV0dXJuIG9wcy0+Z2V0X2dlbmVy
YXRpb24obWRldik7Cit9CisKK3N0YXRpYyB1OCB2aXJ0aW9fbWRldl9nZXRfc3RhdHVzKHN0cnVj
dCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZt
X2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpv
cHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOworCisJcmV0dXJuIG9wcy0+Z2V0X3N0YXR1cyht
ZGV2KTsKK30KKworc3RhdGljIHZvaWQgdmlydGlvX21kZXZfc2V0X3N0YXR1cyhzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldiwgdTggc3RhdHVzKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vf
b3BzICpvcHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOworCisJcmV0dXJuIG9wcy0+c2V0X3N0
YXR1cyhtZGV2LCBzdGF0dXMpOworfQorCitzdGF0aWMgdm9pZCB2aXJ0aW9fbWRldl9yZXNldChz
dHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYg
PSB2bV9nZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29w
cyAqb3BzID0gbWRldl9nZXRfZGV2X29wcyhtZGV2KTsKKworCXJldHVybiBvcHMtPnNldF9zdGF0
dXMobWRldiwgMCk7Cit9CisKK3N0YXRpYyBib29sIHZpcnRpb19tZGV2X25vdGlmeShzdHJ1Y3Qg
dmlydHF1ZXVlICp2cSkKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRl
dih2cS0+dmRldik7CisJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9
IG1kZXZfZ2V0X2Rldl9vcHMobWRldik7CisKKwlvcHMtPmtpY2tfdnEobWRldiwgdnEtPmluZGV4
KTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgaXJxcmV0dXJuX3QgdmlydGlvX21kZXZf
Y29uZmlnX2NiKHZvaWQgKnByaXZhdGUpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAq
dm1fZGV2ID0gcHJpdmF0ZTsKKworCXZpcnRpb19jb25maWdfY2hhbmdlZCgmdm1fZGV2LT52ZGV2
KTsKKworCXJldHVybiBJUlFfSEFORExFRDsKK30KKworc3RhdGljIGlycXJldHVybl90IHZpcnRp
b19tZGV2X3ZpcnRxdWV1ZV9jYih2b2lkICpwcml2YXRlKQoreworCXN0cnVjdCB2aXJ0aW9fbWRl
dl92cV9pbmZvICppbmZvID0gcHJpdmF0ZTsKKworCXJldHVybiB2cmluZ19pbnRlcnJ1cHQoMCwg
aW5mby0+dnEpOworfQorCitzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqCit2aXJ0aW9fbWRldl9z
ZXR1cF92cShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgaW5kZXgsCisJCSAg
ICAgdm9pZCAoKmNhbGxiYWNrKShzdHJ1Y3QgdmlydHF1ZXVlICp2cSksCisJCSAgICAgY29uc3Qg
Y2hhciAqbmFtZSwgYm9vbCBjdHgpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1f
ZGV2ID0gdG9fdmlydGlvX21kZXZfZGV2aWNlKHZkZXYpOworCXN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZp
Y2Vfb3BzICpvcHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOworCXN0cnVjdCB2aXJ0aW9fbWRl
dl92cV9pbmZvICppbmZvOworCXN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjayBjYjsKKwlzdHJ1
Y3QgdmlydHF1ZXVlICp2cTsKKwl1NjQgZGVzY19hZGRyLCBkcml2ZXJfYWRkciwgZGV2aWNlX2Fk
ZHI7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKwl1MzIgYWxpZ24sIG51bTsKKwlpbnQgZXJyOwor
CisJaWYgKCFuYW1lKQorCQlyZXR1cm4gTlVMTDsKKworCS8qIFF1ZXVlIHNob3VsZG4ndCBhbHJl
YWR5IGJlIHNldCB1cC4gKi8KKwlpZiAob3BzLT5nZXRfdnFfcmVhZHkobWRldiwgaW5kZXgpKQor
CQlyZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKKworCS8qIEFsbG9jYXRlIGFuZCBmaWxsIG91dCBv
dXIgYWN0aXZlIHF1ZXVlIGRlc2NyaXB0aW9uICovCisJaW5mbyA9IGttYWxsb2Moc2l6ZW9mKCpp
bmZvKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFpbmZvKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVN
KTsKKworCW51bSA9IG9wcy0+Z2V0X3ZxX251bV9tYXgobWRldik7CisJaWYgKG51bSA9PSAwKSB7
CisJCWVyciA9IC1FTk9FTlQ7CisJCWdvdG8gZXJyb3JfbmV3X3ZpcnRxdWV1ZTsKKwl9CisKKwkv
KiBDcmVhdGUgdGhlIHZyaW5nICovCisJYWxpZ24gPSBvcHMtPmdldF92cV9hbGlnbihtZGV2KTsK
Kwl2cSA9IHZyaW5nX2NyZWF0ZV92aXJ0cXVldWUoaW5kZXgsIG51bSwgYWxpZ24sIHZkZXYsCisJ
CQkJICAgIHRydWUsIHRydWUsIGN0eCwKKwkJCQkgICAgdmlydGlvX21kZXZfbm90aWZ5LCBjYWxs
YmFjaywgbmFtZSk7CisJaWYgKCF2cSkgeworCQllcnIgPSAtRU5PTUVNOworCQlnb3RvIGVycm9y
X25ld192aXJ0cXVldWU7CisJfQorCisJLyogU2V0dXAgdmlydHF1ZXVlIGNhbGxiYWNrICovCisJ
Y2IuY2FsbGJhY2sgPSB2aXJ0aW9fbWRldl92aXJ0cXVldWVfY2I7CisJY2IucHJpdmF0ZSA9IGlu
Zm87CisJb3BzLT5zZXRfdnFfY2IobWRldiwgaW5kZXgsICZjYik7CisJb3BzLT5zZXRfdnFfbnVt
KG1kZXYsIGluZGV4LCB2aXJ0cXVldWVfZ2V0X3ZyaW5nX3NpemUodnEpKTsKKworCWRlc2NfYWRk
ciA9IHZpcnRxdWV1ZV9nZXRfZGVzY19hZGRyKHZxKTsKKwlkcml2ZXJfYWRkciA9IHZpcnRxdWV1
ZV9nZXRfYXZhaWxfYWRkcih2cSk7CisJZGV2aWNlX2FkZHIgPSB2aXJ0cXVldWVfZ2V0X3VzZWRf
YWRkcih2cSk7CisKKwlpZiAob3BzLT5zZXRfdnFfYWRkcmVzcyhtZGV2LCBpbmRleCwKKwkJCQlk
ZXNjX2FkZHIsIGRyaXZlcl9hZGRyLAorCQkJCWRldmljZV9hZGRyKSkgeworCQllcnIgPSAtRUlO
VkFMOworCQlnb3RvIGVycl92cTsKKwl9CisKKwlvcHMtPnNldF92cV9yZWFkeShtZGV2LCBpbmRl
eCwgMSk7CisKKwl2cS0+cHJpdiA9IGluZm87CisJaW5mby0+dnEgPSB2cTsKKworCXNwaW5fbG9j
a19pcnFzYXZlKCZ2bV9kZXYtPmxvY2ssIGZsYWdzKTsKKwlsaXN0X2FkZCgmaW5mby0+bm9kZSwg
JnZtX2Rldi0+dmlydHF1ZXVlcyk7CisJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdm1fZGV2LT5s
b2NrLCBmbGFncyk7CisKKwlyZXR1cm4gdnE7CisKK2Vycl92cToKKwl2cmluZ19kZWxfdmlydHF1
ZXVlKHZxKTsKK2Vycm9yX25ld192aXJ0cXVldWU6CisJb3BzLT5zZXRfdnFfcmVhZHkobWRldiwg
aW5kZXgsIDApOworCVdBUk5fT04ob3BzLT5nZXRfdnFfcmVhZHkobWRldiwgaW5kZXgpKTsKKwlr
ZnJlZShpbmZvKTsKKwlyZXR1cm4gRVJSX1BUUihlcnIpOworCit9CisKK3N0YXRpYyB2b2lkIHZp
cnRpb19tZGV2X2RlbF92cShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKK3sKKwlzdHJ1Y3QgdmlydGlv
X21kZXZfZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbWRldl9kZXZpY2UodnEtPnZkZXYpOwor
CXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZtX2Rldi0+bWRldjsKKwljb25zdCBzdHJ1Y3Qg
dmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfZGV2X29wcyhtZGV2KTsKKwlz
dHJ1Y3QgdmlydGlvX21kZXZfdnFfaW5mbyAqaW5mbyA9IHZxLT5wcml2OworCXVuc2lnbmVkIGlu
dCBpbmRleCA9IHZxLT5pbmRleDsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCisJc3Bpbl9sb2Nr
X2lycXNhdmUoJnZtX2Rldi0+bG9jaywgZmxhZ3MpOworCWxpc3RfZGVsKCZpbmZvLT5ub2RlKTsK
KwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2bV9kZXYtPmxvY2ssIGZsYWdzKTsKKworCS8qIFNl
bGVjdCBhbmQgZGVhY3RpdmF0ZSB0aGUgcXVldWUgKi8KKwlvcHMtPnNldF92cV9yZWFkeShtZGV2
LCBpbmRleCwgMCk7CisJV0FSTl9PTihvcHMtPmdldF92cV9yZWFkeShtZGV2LCBpbmRleCkpOwor
CisJdnJpbmdfZGVsX3ZpcnRxdWV1ZSh2cSk7CisKKwlrZnJlZShpbmZvKTsKK30KKworc3RhdGlj
IHZvaWQgdmlydGlvX21kZXZfZGVsX3ZxcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKK3sK
KwlzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgKm47CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
dnEsIG4sICZ2ZGV2LT52cXMsIGxpc3QpCisJCXZpcnRpb19tZGV2X2RlbF92cSh2cSk7Cit9CisK
K3N0YXRpYyBpbnQgdmlydGlvX21kZXZfZmluZF92cXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZk
ZXYsIHVuc2lnbmVkIG52cXMsCisJCQkJc3RydWN0IHZpcnRxdWV1ZSAqdnFzW10sCisJCQkJdnFf
Y2FsbGJhY2tfdCAqY2FsbGJhY2tzW10sCisJCQkJY29uc3QgY2hhciAqIGNvbnN0IG5hbWVzW10s
CisJCQkJY29uc3QgYm9vbCAqY3R4LAorCQkJCXN0cnVjdCBpcnFfYWZmaW5pdHkgKmRlc2MpCit7
CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2ID0gdG9fdmlydGlvX21kZXZfZGV2
aWNlKHZkZXYpOworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZtX2dldF9tZGV2KHZkZXYp
OworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF9k
ZXZfb3BzKG1kZXYpOworCXN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjayBjYjsKKwlpbnQgaSwg
ZXJyLCBxdWV1ZV9pZHggPSAwOworCisJdm1fZGV2LT52cXMgPSBrbWFsbG9jX2FycmF5KHF1ZXVl
X2lkeCwgc2l6ZW9mKCp2bV9kZXYtPnZxcyksCisJCQkJICAgIEdGUF9LRVJORUwpOworCWlmICgh
dm1fZGV2LT52cXMpCisJCXJldHVybiAtRU5PTUVNOworCisJZm9yIChpID0gMDsgaSA8IG52cXM7
ICsraSkgeworCQlpZiAoIW5hbWVzW2ldKSB7CisJCQl2cXNbaV0gPSBOVUxMOworCQkJY29udGlu
dWU7CisJCX0KKworCQl2cXNbaV0gPSB2aXJ0aW9fbWRldl9zZXR1cF92cSh2ZGV2LCBxdWV1ZV9p
ZHgrKywKKwkJCQkJICAgICAgY2FsbGJhY2tzW2ldLCBuYW1lc1tpXSwgY3R4ID8KKwkJCQkJICAg
ICAgY3R4W2ldIDogZmFsc2UpOworCQlpZiAoSVNfRVJSKHZxc1tpXSkpIHsKKwkJCWVyciA9IFBU
Ul9FUlIodnFzW2ldKTsKKwkJCWdvdG8gZXJyX3NldHVwX3ZxOworCQl9CisJfQorCisJY2IuY2Fs
bGJhY2sgPSB2aXJ0aW9fbWRldl9jb25maWdfY2I7CisJY2IucHJpdmF0ZSA9IHZtX2RldjsKKwlv
cHMtPnNldF9jb25maWdfY2IobWRldiwgJmNiKTsKKworCXJldHVybiAwOworCitlcnJfc2V0dXBf
dnE6CisJa2ZyZWUodm1fZGV2LT52cXMpOworCXZpcnRpb19tZGV2X2RlbF92cXModmRldik7CisJ
cmV0dXJuIGVycjsKK30KKworc3RhdGljIHU2NCB2aXJ0aW9fbWRldl9nZXRfZmVhdHVyZXMoc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCit7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0g
dm1fZ2V0X21kZXYodmRldik7CisJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMg
Km9wcyA9IG1kZXZfZ2V0X2Rldl9vcHMobWRldik7CisKKwlyZXR1cm4gb3BzLT5nZXRfZmVhdHVy
ZXMobWRldik7Cit9CisKK3N0YXRpYyBpbnQgdmlydGlvX21kZXZfZmluYWxpemVfZmVhdHVyZXMo
c3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCit7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
ID0gdm1fZ2V0X21kZXYodmRldik7CisJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9v
cHMgKm9wcyA9IG1kZXZfZ2V0X2Rldl9vcHMobWRldik7CisKKwkvKiBHaXZlIHZpcnRpb19yaW5n
IGEgY2hhbmNlIHRvIGFjY2VwdCBmZWF0dXJlcy4gKi8KKwl2cmluZ190cmFuc3BvcnRfZmVhdHVy
ZXModmRldik7CisKKwlyZXR1cm4gb3BzLT5zZXRfZmVhdHVyZXMobWRldiwgdmRldi0+ZmVhdHVy
ZXMpOworfQorCitzdGF0aWMgY29uc3QgY2hhciAqdmlydGlvX21kZXZfYnVzX25hbWUoc3RydWN0
IHZpcnRpb19kZXZpY2UgKnZkZXYpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1f
ZGV2ID0gdG9fdmlydGlvX21kZXZfZGV2aWNlKHZkZXYpOworCXN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiA9IHZtX2Rldi0+bWRldjsKKworCXJldHVybiBkZXZfbmFtZShtZGV2X2RldihtZGV2KSk7
Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmlydGlvX2NvbmZpZ19vcHMgdmlydGlvX21kZXZf
Y29uZmlnX29wcyA9IHsKKwkuZ2V0CQk9IHZpcnRpb19tZGV2X2dldCwKKwkuc2V0CQk9IHZpcnRp
b19tZGV2X3NldCwKKwkuZ2VuZXJhdGlvbgk9IHZpcnRpb19tZGV2X2dlbmVyYXRpb24sCisJLmdl
dF9zdGF0dXMJPSB2aXJ0aW9fbWRldl9nZXRfc3RhdHVzLAorCS5zZXRfc3RhdHVzCT0gdmlydGlv
X21kZXZfc2V0X3N0YXR1cywKKwkucmVzZXQJCT0gdmlydGlvX21kZXZfcmVzZXQsCisJLmZpbmRf
dnFzCT0gdmlydGlvX21kZXZfZmluZF92cXMsCisJLmRlbF92cXMJPSB2aXJ0aW9fbWRldl9kZWxf
dnFzLAorCS5nZXRfZmVhdHVyZXMJPSB2aXJ0aW9fbWRldl9nZXRfZmVhdHVyZXMsCisJLmZpbmFs
aXplX2ZlYXR1cmVzID0gdmlydGlvX21kZXZfZmluYWxpemVfZmVhdHVyZXMsCisJLmJ1c19uYW1l
CT0gdmlydGlvX21kZXZfYnVzX25hbWUsCit9OworCitzdGF0aWMgdm9pZCB2aXJ0aW9fbWRldl9y
ZWxlYXNlX2RldihzdHJ1Y3QgZGV2aWNlICpfZCkKK3sKKwlzdHJ1Y3QgdmlydGlvX2RldmljZSAq
dmRldiA9CisJICAgICAgIGNvbnRhaW5lcl9vZihfZCwgc3RydWN0IHZpcnRpb19kZXZpY2UsIGRl
dik7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2ID0KKwkgICAgICAgY29udGFp
bmVyX29mKHZkZXYsIHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UsIHZkZXYpOworCisJZGV2bV9r
ZnJlZShfZCwgdm1fZGV2KTsKK30KKworc3RhdGljIGludCB2aXJ0aW9fbWRldl9wcm9iZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCit7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbWRldl9mcm9t
X2RldihkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBt
ZGV2X2dldF9kZXZfb3BzKG1kZXYpOworCXN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UgKnZtX2Rl
djsKKwlpbnQgcmM7CisKKwl2bV9kZXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnZtX2Rl
diksIEdGUF9LRVJORUwpOworCWlmICghdm1fZGV2KQorCQlyZXR1cm4gLUVOT01FTTsKKworCXZt
X2Rldi0+dmRldi5kZXYucGFyZW50ID0gZGV2OworCXZtX2Rldi0+dmRldi5kZXYucmVsZWFzZSA9
IHZpcnRpb19tZGV2X3JlbGVhc2VfZGV2OworCXZtX2Rldi0+dmRldi5jb25maWcgPSAmdmlydGlv
X21kZXZfY29uZmlnX29wczsKKwl2bV9kZXYtPm1kZXYgPSBtZGV2OworCXZtX2Rldi0+dnFzID0g
TlVMTDsKKwlJTklUX0xJU1RfSEVBRCgmdm1fZGV2LT52aXJ0cXVldWVzKTsKKwlzcGluX2xvY2tf
aW5pdCgmdm1fZGV2LT5sb2NrKTsKKworCXZtX2Rldi0+dmVyc2lvbiA9IG9wcy0+Z2V0X21kZXZf
ZmVhdHVyZXMobWRldik7CisJaWYgKHZtX2Rldi0+dmVyc2lvbiAhPSBWSVJUSU9fTURFVl9GX1ZF
UlNJT05fMSkgeworCQlkZXZfZXJyKGRldiwgIlZJUlRJT19NREVWX0ZfVkVSU0lPTl8xIGlzIG1h
bmRhdG9yeVxuIik7CisJCXJldHVybiAtRU5YSU87CisJfQorCisJdm1fZGV2LT52ZGV2LmlkLmRl
dmljZSA9IG9wcy0+Z2V0X2RldmljZV9pZChtZGV2KTsKKwlpZiAodm1fZGV2LT52ZGV2LmlkLmRl
dmljZSA9PSAwKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXZtX2Rldi0+dmRldi5pZC52ZW5kb3Ig
PSBvcHMtPmdldF92ZW5kb3JfaWQobWRldik7CisJcmMgPSByZWdpc3Rlcl92aXJ0aW9fZGV2aWNl
KCZ2bV9kZXYtPnZkZXYpOworCWlmIChyYykKKwkJcHV0X2RldmljZShkZXYpOworCWVsc2UKKwkJ
ZGV2X3NldF9kcnZkYXRhKGRldiwgdm1fZGV2KTsKKworCXJldHVybiByYzsKK30KKworc3RhdGlj
IHZvaWQgdmlydGlvX21kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3Qg
dmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKworCXVu
cmVnaXN0ZXJfdmlydGlvX2RldmljZSgmdm1fZGV2LT52ZGV2KTsKK30KKworc3RhdGljIHN0cnVj
dCBtZGV2X2NsYXNzX2lkIGlkX3RhYmxlW10gPSB7CisJeyBNREVWX0lEX1ZJUlRJTyB9LAorCXsg
MCB9LAorfTsKKworTU9EVUxFX0RFVklDRV9UQUJMRShtZGV2LCBpZF90YWJsZSk7CisKK3N0YXRp
YyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmlydGlvX21kZXZfZHJpdmVyID0geworCS5uYW1lCT0gInZp
cnRpb19tZGV2IiwKKwkucHJvYmUJPSB2aXJ0aW9fbWRldl9wcm9iZSwKKwkucmVtb3ZlID0gdmly
dGlvX21kZXZfcmVtb3ZlLAorCS5pZF90YWJsZSA9IGlkX3RhYmxlLAorfTsKKworc3RhdGljIGlu
dCBfX2luaXQgdmlydGlvX21kZXZfaW5pdCh2b2lkKQoreworCXJldHVybiBtZGV2X3JlZ2lzdGVy
X2RyaXZlcigmdmlydGlvX21kZXZfZHJpdmVyLCBUSElTX01PRFVMRSk7Cit9CisKK3N0YXRpYyB2
b2lkIF9fZXhpdCB2aXJ0aW9fbWRldl9leGl0KHZvaWQpCit7CisJbWRldl91bnJlZ2lzdGVyX2Ry
aXZlcigmdmlydGlvX21kZXZfZHJpdmVyKTsKK30KKworbW9kdWxlX2luaXQodmlydGlvX21kZXZf
aW5pdCkKK21vZHVsZV9leGl0KHZpcnRpb19tZGV2X2V4aXQpCisKK01PRFVMRV9WRVJTSU9OKERS
SVZFUl9WRVJTSU9OKTsKK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKK01PRFVMRV9BVVRIT1Io
RFJJVkVSX0FVVEhPUik7CitNT0RVTEVfREVTQ1JJUFRJT04oRFJJVkVSX0RFU0MpOwotLSAKMi4x
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
