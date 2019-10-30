Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A331AE96D1
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Oct 2019 07:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255346E888;
	Wed, 30 Oct 2019 06:51:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1006E888
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Oct 2019 06:51:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-OLx427cEOP6ghya0Qu0idw-1; Wed, 30 Oct 2019 02:51:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA46107AD28;
 Wed, 30 Oct 2019 06:51:07 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC86A5D9C3;
 Wed, 30 Oct 2019 06:49:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V6 5/6] virtio: introduce a mdev based transport
Date: Wed, 30 Oct 2019 14:44:43 +0800
Message-Id: <20191030064444.21166-6-jasowang@redhat.com>
In-Reply-To: <20191030064444.21166-1-jasowang@redhat.com>
References: <20191030064444.21166-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: OLx427cEOP6ghya0Qu0idw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572418274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7x9JkdTyCcKKn0chueqpkzNgaOG4fsM0eH9MJzehASI=;
 b=V+3CaVge4q+SMVYF0iZyaj7Ht8/nRPiX1O02G42kbmYjpXzexIYFMkf+GtVAQfMl6VNBMI
 g1w2iAJ+zI48CkNPCOhQCUxXEs3Raci1+UaTi9kHY9GqqtewgRBPjNN1DPLnk5WwhmyZnj
 1gFex9AMC3e57pcMm1H1APfK+++RWYM=
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

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8uIFRo
aXMgaXMgdXNlZCB0bwp1c2Uga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhlIG1lZGlh
dGVkIGRldmljZSB0aGF0IGlzIGNhcGFibGUKb2YgcG9wdWxhdGluZyB2aXJ0cXVldWUgZGlyZWN0
bHkuCgpBIG5ldyB2aXJ0aW8tbWRldiBkcml2ZXIgd2lsbCBiZSByZWdpc3RlcmVkIHRvIHRoZSBt
ZGV2IGJ1cywgd2hlbiBhCm5ldyB2aXJ0aW8tbWRldiBkZXZpY2UgaXMgcHJvYmVkLCBpdCB3aWxs
IHJlZ2lzdGVyIHRoZSBkZXZpY2Ugd2l0aAptZGV2IGJhc2VkIGNvbmZpZyBvcHMuIFRoaXMgbWVh
bnMgaXQgaXMgYSBzb2Z0d2FyZSB0cmFuc3BvcnQgYmV0d2VlbgptZGV2IGRyaXZlciBhbmQgbWRl
diBkZXZpY2UuIFRoZSB0cmFuc3BvcnQgd2FzIGltcGxlbWVudGVkIHRocm91Z2gKZGV2aWNlIHNw
ZWNpZmljIG9wcyB3aGljaCBpcyBhIHBhcnQgb2YgbWRldl9wYXJlbnRfb3BzIG5vdy4KClNpZ25l
ZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92
aXJ0aW8vS2NvbmZpZyAgICAgICB8ICAgNyArCiBkcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSAgICAg
IHwgICAxICsKIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMgfCA0MTMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDIxIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcK
aW5kZXggMDc4NjE1Y2YyYWZjLi44ZDE4NzIyYWI1NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmly
dGlvL0tjb25maWcKKysrIGIvZHJpdmVycy92aXJ0aW8vS2NvbmZpZwpAQCAtNDMsNiArNDMsMTMg
QEAgY29uZmlnIFZJUlRJT19QQ0lfTEVHQUNZCiAKIAkgIElmIHVuc3VyZSwgc2F5IFkuCiAKK2Nv
bmZpZyBWSVJUSU9fTURFVl9ERVZJQ0UKKwl0cmlzdGF0ZSAiVklSVElPIGRyaXZlciBmb3IgTWVk
aWF0ZWQgZGV2aWNlcyIKKwlkZXBlbmRzIG9uIFZGSU9fTURFViAmJiBWSVJUSU8KKwlkZWZhdWx0
IG4KKwloZWxwCisJICBWSVJUSU8gYmFzZWQgZHJpdmVyIGZvciBNZWRpYXRlZCBkZXZpY2VzLgor
CiBjb25maWcgVklSVElPX1BNRU0KIAl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgdmlydGlvIHBtZW0g
ZHJpdmVyIgogCWRlcGVuZHMgb24gVklSVElPCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby9N
YWtlZmlsZSBiL2RyaXZlcnMvdmlydGlvL01ha2VmaWxlCmluZGV4IDNhMmI1YzVkY2Y0Ni4uZWJj
N2ZhMTVhZTgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpcnRpby9NYWtlZmlsZQorKysgYi9kcml2
ZXJzL3ZpcnRpby9NYWtlZmlsZQpAQCAtNiwzICs2LDQgQEAgdmlydGlvX3BjaS15IDo9IHZpcnRp
b19wY2lfbW9kZXJuLm8gdmlydGlvX3BjaV9jb21tb24ubwogdmlydGlvX3BjaS0kKENPTkZJR19W
SVJUSU9fUENJX0xFR0FDWSkgKz0gdmlydGlvX3BjaV9sZWdhY3kubwogb2JqLSQoQ09ORklHX1ZJ
UlRJT19CQUxMT09OKSArPSB2aXJ0aW9fYmFsbG9vbi5vCiBvYmotJChDT05GSUdfVklSVElPX0lO
UFVUKSArPSB2aXJ0aW9faW5wdXQubworb2JqLSQoQ09ORklHX1ZJUlRJT19NREVWX0RFVklDRSkg
Kz0gdmlydGlvX21kZXYubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX21kZXYu
YyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi4zZDQ5MDcyYjJkM2UKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fbWRldi5jCkBAIC0wLDAgKzEsNDEzIEBACisvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisvKgorICogVklSVElPIGJhc2VkIGRyaXZlciBmb3Ig
TWVkaWF0ZWQgZGV2aWNlCisgKgorICogQ29weXJpZ2h0IChjKSAyMDE5LCBSZWQgSGF0LiBBbGwg
cmlnaHRzIHJlc2VydmVkLgorICogICAgIEF1dGhvcjogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KKyAqCisgKi8KKworI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KKyNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisjaW5jbHVkZSA8bGludXgvdXVp
ZC5oPgorI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9fbWRl
dl9vcHMuaD4KKyNpbmNsdWRlIDxsaW51eC92aXJ0aW8uaD4KKyNpbmNsdWRlIDxsaW51eC92aXJ0
aW9fY29uZmlnLmg+CisjaW5jbHVkZSA8bGludXgvdmlydGlvX3JpbmcuaD4KKworI2RlZmluZSBE
UklWRVJfVkVSU0lPTiAgIjAuMSIKKyNkZWZpbmUgRFJJVkVSX0FVVEhPUiAgICJSZWQgSGF0IENv
cnBvcmF0aW9uIgorI2RlZmluZSBEUklWRVJfREVTQyAgICAgIlZJUlRJTyBiYXNlZCBkcml2ZXIg
Zm9yIE1lZGlhdGVkIGRldmljZSIKKworI2RlZmluZSB0b192aXJ0aW9fbWRldl9kZXZpY2UoZGV2
KSBcCisJY29udGFpbmVyX29mKGRldiwgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSwgdmRldikK
Kworc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSB7CisJc3RydWN0IHZpcnRpb19kZXZpY2UgdmRl
djsKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXY7CisJdTY0IGZlYXR1cmVzOworCisJLyogVGhl
IGxvY2sgdG8gcHJvdGVjdCB2aXJ0cXVldWUgbGlzdCAqLworCXNwaW5sb2NrX3QgbG9jazsKKwkv
KiBMaXN0IG9mIHZpcnRpb19tZGV2X3ZxX2luZm8gKi8KKwlzdHJ1Y3QgbGlzdF9oZWFkIHZpcnRx
dWV1ZXM7Cit9OworCitzdHJ1Y3QgdmlydGlvX21kZXZfdnFfaW5mbyB7CisJLyogdGhlIGFjdHVh
bCB2aXJ0cXVldWUgKi8KKwlzdHJ1Y3QgdmlydHF1ZXVlICp2cTsKKworCS8qIHRoZSBsaXN0IG5v
ZGUgZm9yIHRoZSB2aXJ0cXVldWVzIGxpc3QgKi8KKwlzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cit9
OworCitzdGF0aWMgc3RydWN0IG1kZXZfZGV2aWNlICp2bV9nZXRfbWRldihzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0
b192aXJ0aW9fbWRldl9kZXZpY2UodmRldik7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0g
dm1fZGV2LT5tZGV2OworCisJcmV0dXJuIG1kZXY7Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19t
ZGV2X2dldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgb2Zmc2V0LAorCQkJ
ICAgIHZvaWQgKmJ1ZiwgdW5zaWduZWQgbGVuKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vf
b3BzICpvcHMgPSBtZGV2X2dldF92aXJ0aW9fb3BzKG1kZXYpOworCisJb3BzLT5nZXRfY29uZmln
KG1kZXYsIG9mZnNldCwgYnVmLCBsZW4pOworfQorCitzdGF0aWMgdm9pZCB2aXJ0aW9fbWRldl9z
ZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIG9mZnNldCwKKwkJCSAgICBj
b25zdCB2b2lkICpidWYsIHVuc2lnbmVkIGxlbikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNl
X29wcyAqb3BzID0gbWRldl9nZXRfdmlydGlvX29wcyhtZGV2KTsKKworCW9wcy0+c2V0X2NvbmZp
ZyhtZGV2LCBvZmZzZXQsIGJ1ZiwgbGVuKTsKK30KKworc3RhdGljIHUzMiB2aXJ0aW9fbWRldl9n
ZW5lcmF0aW9uKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQoreworCXN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldiA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRl
dl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aXJ0aW9fb3BzKG1kZXYpOworCisJaWYgKG9w
cy0+Z2V0X2dlbmVyYXRpb24pCisJCXJldHVybiBvcHMtPmdldF9nZW5lcmF0aW9uKG1kZXYpOwor
CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyB1OCB2aXJ0aW9fbWRldl9nZXRfc3RhdHVzKHN0cnVj
dCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZt
X2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpv
cHMgPSBtZGV2X2dldF92aXJ0aW9fb3BzKG1kZXYpOworCisJcmV0dXJuIG9wcy0+Z2V0X3N0YXR1
cyhtZGV2KTsKK30KKworc3RhdGljIHZvaWQgdmlydGlvX21kZXZfc2V0X3N0YXR1cyhzdHJ1Y3Qg
dmlydGlvX2RldmljZSAqdmRldiwgdTggc3RhdHVzKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZp
Y2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aXJ0aW9fb3BzKG1kZXYpOworCisJcmV0dXJuIG9wcy0+
c2V0X3N0YXR1cyhtZGV2LCBzdGF0dXMpOworfQorCitzdGF0aWMgdm9pZCB2aXJ0aW9fbWRldl9y
ZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2
aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmlydGlvX29wcyhtZGV2KTsKKworCXJldHVybiBvcHMt
PnNldF9zdGF0dXMobWRldiwgMCk7Cit9CisKK3N0YXRpYyBib29sIHZpcnRpb19tZGV2X25vdGlm
eShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2
bV9nZXRfbWRldih2cS0+dmRldik7CisJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9v
cHMgKm9wcyA9IG1kZXZfZ2V0X3ZpcnRpb19vcHMobWRldik7CisKKwlvcHMtPmtpY2tfdnEobWRl
diwgdnEtPmluZGV4KTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgaXJxcmV0dXJuX3Qg
dmlydGlvX21kZXZfY29uZmlnX2NiKHZvaWQgKnByaXZhdGUpCit7CisJc3RydWN0IHZpcnRpb19t
ZGV2X2RldmljZSAqdm1fZGV2ID0gcHJpdmF0ZTsKKworCXZpcnRpb19jb25maWdfY2hhbmdlZCgm
dm1fZGV2LT52ZGV2KTsKKworCXJldHVybiBJUlFfSEFORExFRDsKK30KKworc3RhdGljIGlycXJl
dHVybl90IHZpcnRpb19tZGV2X3ZpcnRxdWV1ZV9jYih2b2lkICpwcml2YXRlKQoreworCXN0cnVj
dCB2aXJ0aW9fbWRldl92cV9pbmZvICppbmZvID0gcHJpdmF0ZTsKKworCXJldHVybiB2cmluZ19p
bnRlcnJ1cHQoMCwgaW5mby0+dnEpOworfQorCitzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqCit2
aXJ0aW9fbWRldl9zZXR1cF92cShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQg
aW5kZXgsCisJCSAgICAgdm9pZCAoKmNhbGxiYWNrKShzdHJ1Y3QgdmlydHF1ZXVlICp2cSksCisJ
CSAgICAgY29uc3QgY2hhciAqbmFtZSwgYm9vbCBjdHgpCit7CisJc3RydWN0IHZpcnRpb19tZGV2
X2RldmljZSAqdm1fZGV2ID0gdG9fdmlydGlvX21kZXZfZGV2aWNlKHZkZXYpOworCXN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldiA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0
aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aXJ0aW9fb3BzKG1kZXYpOworCXN0
cnVjdCB2aXJ0aW9fbWRldl92cV9pbmZvICppbmZvOworCXN0cnVjdCB2aXJ0aW9fbWRldl9jYWxs
YmFjayBjYjsKKwlzdHJ1Y3QgdmlydHF1ZXVlICp2cTsKKwl1NjQgZGVzY19hZGRyLCBkcml2ZXJf
YWRkciwgZGV2aWNlX2FkZHI7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKwl1MzIgYWxpZ24sIG51
bTsKKwlpbnQgZXJyOworCisJaWYgKCFuYW1lKQorCQlyZXR1cm4gTlVMTDsKKworCS8qIFF1ZXVl
IHNob3VsZG4ndCBhbHJlYWR5IGJlIHNldCB1cC4gKi8KKwlpZiAob3BzLT5nZXRfdnFfcmVhZHko
bWRldiwgaW5kZXgpKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKKworCS8qIEFsbG9jYXRl
IGFuZCBmaWxsIG91dCBvdXIgYWN0aXZlIHF1ZXVlIGRlc2NyaXB0aW9uICovCisJaW5mbyA9IGtt
YWxsb2Moc2l6ZW9mKCppbmZvKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFpbmZvKQorCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKKworCW51bSA9IG9wcy0+Z2V0X3ZxX251bV9tYXgobWRldik7CisJ
aWYgKG51bSA9PSAwKSB7CisJCWVyciA9IC1FTk9FTlQ7CisJCWdvdG8gZXJyb3JfbmV3X3ZpcnRx
dWV1ZTsKKwl9CisKKwkvKiBDcmVhdGUgdGhlIHZyaW5nICovCisJYWxpZ24gPSBvcHMtPmdldF92
cV9hbGlnbihtZGV2KTsKKwl2cSA9IHZyaW5nX2NyZWF0ZV92aXJ0cXVldWUoaW5kZXgsIG51bSwg
YWxpZ24sIHZkZXYsCisJCQkJICAgIHRydWUsIHRydWUsIGN0eCwKKwkJCQkgICAgdmlydGlvX21k
ZXZfbm90aWZ5LCBjYWxsYmFjaywgbmFtZSk7CisJaWYgKCF2cSkgeworCQllcnIgPSAtRU5PTUVN
OworCQlnb3RvIGVycm9yX25ld192aXJ0cXVldWU7CisJfQorCisJLyogU2V0dXAgdmlydHF1ZXVl
IGNhbGxiYWNrICovCisJY2IuY2FsbGJhY2sgPSB2aXJ0aW9fbWRldl92aXJ0cXVldWVfY2I7CisJ
Y2IucHJpdmF0ZSA9IGluZm87CisJb3BzLT5zZXRfdnFfY2IobWRldiwgaW5kZXgsICZjYik7CisJ
b3BzLT5zZXRfdnFfbnVtKG1kZXYsIGluZGV4LCB2aXJ0cXVldWVfZ2V0X3ZyaW5nX3NpemUodnEp
KTsKKworCWRlc2NfYWRkciA9IHZpcnRxdWV1ZV9nZXRfZGVzY19hZGRyKHZxKTsKKwlkcml2ZXJf
YWRkciA9IHZpcnRxdWV1ZV9nZXRfYXZhaWxfYWRkcih2cSk7CisJZGV2aWNlX2FkZHIgPSB2aXJ0
cXVldWVfZ2V0X3VzZWRfYWRkcih2cSk7CisKKwlpZiAob3BzLT5zZXRfdnFfYWRkcmVzcyhtZGV2
LCBpbmRleCwKKwkJCQlkZXNjX2FkZHIsIGRyaXZlcl9hZGRyLAorCQkJCWRldmljZV9hZGRyKSkg
eworCQllcnIgPSAtRUlOVkFMOworCQlnb3RvIGVycl92cTsKKwl9CisKKwlvcHMtPnNldF92cV9y
ZWFkeShtZGV2LCBpbmRleCwgMSk7CisKKwl2cS0+cHJpdiA9IGluZm87CisJaW5mby0+dnEgPSB2
cTsKKworCXNwaW5fbG9ja19pcnFzYXZlKCZ2bV9kZXYtPmxvY2ssIGZsYWdzKTsKKwlsaXN0X2Fk
ZCgmaW5mby0+bm9kZSwgJnZtX2Rldi0+dmlydHF1ZXVlcyk7CisJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmdm1fZGV2LT5sb2NrLCBmbGFncyk7CisKKwlyZXR1cm4gdnE7CisKK2Vycl92cToKKwl2
cmluZ19kZWxfdmlydHF1ZXVlKHZxKTsKK2Vycm9yX25ld192aXJ0cXVldWU6CisJb3BzLT5zZXRf
dnFfcmVhZHkobWRldiwgaW5kZXgsIDApOworCVdBUk5fT04ob3BzLT5nZXRfdnFfcmVhZHkobWRl
diwgaW5kZXgpKTsKKwlrZnJlZShpbmZvKTsKKwlyZXR1cm4gRVJSX1BUUihlcnIpOworCit9CisK
K3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X2RlbF92cShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKK3sK
KwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbWRldl9kZXZp
Y2UodnEtPnZkZXYpOworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZtX2Rldi0+bWRldjsK
Kwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmly
dGlvX29wcyhtZGV2KTsKKwlzdHJ1Y3QgdmlydGlvX21kZXZfdnFfaW5mbyAqaW5mbyA9IHZxLT5w
cml2OworCXVuc2lnbmVkIGludCBpbmRleCA9IHZxLT5pbmRleDsKKwl1bnNpZ25lZCBsb25nIGZs
YWdzOworCisJc3Bpbl9sb2NrX2lycXNhdmUoJnZtX2Rldi0+bG9jaywgZmxhZ3MpOworCWxpc3Rf
ZGVsKCZpbmZvLT5ub2RlKTsKKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2bV9kZXYtPmxvY2ss
IGZsYWdzKTsKKworCS8qIFNlbGVjdCBhbmQgZGVhY3RpdmF0ZSB0aGUgcXVldWUgKi8KKwlvcHMt
PnNldF92cV9yZWFkeShtZGV2LCBpbmRleCwgMCk7CisJV0FSTl9PTihvcHMtPmdldF92cV9yZWFk
eShtZGV2LCBpbmRleCkpOworCisJdnJpbmdfZGVsX3ZpcnRxdWV1ZSh2cSk7CisKKwlrZnJlZShp
bmZvKTsKK30KKworc3RhdGljIHZvaWQgdmlydGlvX21kZXZfZGVsX3ZxcyhzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgKm47CisKKwlsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUodnEsIG4sICZ2ZGV2LT52cXMsIGxpc3QpCisJCXZpcnRpb19tZGV2
X2RlbF92cSh2cSk7Cit9CisKK3N0YXRpYyBpbnQgdmlydGlvX21kZXZfZmluZF92cXMoc3RydWN0
IHZpcnRpb19kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIG52cXMsCisJCQkJc3RydWN0IHZpcnRxdWV1
ZSAqdnFzW10sCisJCQkJdnFfY2FsbGJhY2tfdCAqY2FsbGJhY2tzW10sCisJCQkJY29uc3QgY2hh
ciAqIGNvbnN0IG5hbWVzW10sCisJCQkJY29uc3QgYm9vbCAqY3R4LAorCQkJCXN0cnVjdCBpcnFf
YWZmaW5pdHkgKmRlc2MpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2ID0g
dG9fdmlydGlvX21kZXZfZGV2aWNlKHZkZXYpOworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9
IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3Bz
ICpvcHMgPSBtZGV2X2dldF92aXJ0aW9fb3BzKG1kZXYpOworCXN0cnVjdCB2aXJ0aW9fbWRldl9j
YWxsYmFjayBjYjsKKwlpbnQgaSwgZXJyLCBxdWV1ZV9pZHggPSAwOworCisJZm9yIChpID0gMDsg
aSA8IG52cXM7ICsraSkgeworCQlpZiAoIW5hbWVzW2ldKSB7CisJCQl2cXNbaV0gPSBOVUxMOwor
CQkJY29udGludWU7CisJCX0KKworCQl2cXNbaV0gPSB2aXJ0aW9fbWRldl9zZXR1cF92cSh2ZGV2
LCBxdWV1ZV9pZHgrKywKKwkJCQkJICAgICAgY2FsbGJhY2tzW2ldLCBuYW1lc1tpXSwgY3R4ID8K
KwkJCQkJICAgICAgY3R4W2ldIDogZmFsc2UpOworCQlpZiAoSVNfRVJSKHZxc1tpXSkpIHsKKwkJ
CWVyciA9IFBUUl9FUlIodnFzW2ldKTsKKwkJCWdvdG8gZXJyX3NldHVwX3ZxOworCQl9CisJfQor
CisJY2IuY2FsbGJhY2sgPSB2aXJ0aW9fbWRldl9jb25maWdfY2I7CisJY2IucHJpdmF0ZSA9IHZt
X2RldjsKKwlvcHMtPnNldF9jb25maWdfY2IobWRldiwgJmNiKTsKKworCXJldHVybiAwOworCitl
cnJfc2V0dXBfdnE6CisJdmlydGlvX21kZXZfZGVsX3Zxcyh2ZGV2KTsKKwlyZXR1cm4gZXJyOwor
fQorCitzdGF0aWMgdTY0IHZpcnRpb19tZGV2X2dldF9mZWF0dXJlcyhzdHJ1Y3QgdmlydGlvX2Rl
dmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRldih2
ZGV2KTsKKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9n
ZXRfdmlydGlvX29wcyhtZGV2KTsKKworCXJldHVybiBvcHMtPmdldF9mZWF0dXJlcyhtZGV2KTsK
K30KKworc3RhdGljIGludCB2aXJ0aW9fbWRldl9maW5hbGl6ZV9mZWF0dXJlcyhzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRf
bWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0g
bWRldl9nZXRfdmlydGlvX29wcyhtZGV2KTsKKworCS8qIEdpdmUgdmlydGlvX3JpbmcgYSBjaGFu
Y2UgdG8gYWNjZXB0IGZlYXR1cmVzLiAqLworCXZyaW5nX3RyYW5zcG9ydF9mZWF0dXJlcyh2ZGV2
KTsKKworCXJldHVybiBvcHMtPnNldF9mZWF0dXJlcyhtZGV2LCB2ZGV2LT5mZWF0dXJlcyk7Cit9
CisKK3N0YXRpYyBjb25zdCBjaGFyICp2aXJ0aW9fbWRldl9idXNfbmFtZShzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0
b192aXJ0aW9fbWRldl9kZXZpY2UodmRldik7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0g
dm1fZGV2LT5tZGV2OworCisJcmV0dXJuIGRldl9uYW1lKG1kZXZfZGV2KG1kZXYpKTsKK30KKwor
c3RhdGljIGNvbnN0IHN0cnVjdCB2aXJ0aW9fY29uZmlnX29wcyB2aXJ0aW9fbWRldl9jb25maWdf
b3BzID0geworCS5nZXQJCT0gdmlydGlvX21kZXZfZ2V0LAorCS5zZXQJCT0gdmlydGlvX21kZXZf
c2V0LAorCS5nZW5lcmF0aW9uCT0gdmlydGlvX21kZXZfZ2VuZXJhdGlvbiwKKwkuZ2V0X3N0YXR1
cwk9IHZpcnRpb19tZGV2X2dldF9zdGF0dXMsCisJLnNldF9zdGF0dXMJPSB2aXJ0aW9fbWRldl9z
ZXRfc3RhdHVzLAorCS5yZXNldAkJPSB2aXJ0aW9fbWRldl9yZXNldCwKKwkuZmluZF92cXMJPSB2
aXJ0aW9fbWRldl9maW5kX3ZxcywKKwkuZGVsX3Zxcwk9IHZpcnRpb19tZGV2X2RlbF92cXMsCisJ
LmdldF9mZWF0dXJlcwk9IHZpcnRpb19tZGV2X2dldF9mZWF0dXJlcywKKwkuZmluYWxpemVfZmVh
dHVyZXMgPSB2aXJ0aW9fbWRldl9maW5hbGl6ZV9mZWF0dXJlcywKKwkuYnVzX25hbWUJPSB2aXJ0
aW9fbWRldl9idXNfbmFtZSwKK307CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X3JlbGVhc2Vf
ZGV2KHN0cnVjdCBkZXZpY2UgKl9kKQoreworCXN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2ID0K
KwkgICAgICAgY29udGFpbmVyX29mKF9kLCBzdHJ1Y3QgdmlydGlvX2RldmljZSwgZGV2KTsKKwlz
dHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPQorCSAgICAgICBjb250YWluZXJfb2Yo
dmRldiwgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSwgdmRldik7CisJc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2ID0gdm1fZGV2LT5tZGV2OworCisJZGV2bV9rZnJlZShtZGV2X2RldihtZGV2KSwg
dm1fZGV2KTsKK30KKworc3RhdGljIGludCB2aXJ0aW9fbWRldl9wcm9iZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCit7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbWRldl9mcm9tX2RldihkZXYp
OworCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92
aXJ0aW9fb3BzKG1kZXYpOworCXN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UgKnZtX2RldjsKKwlp
bnQgcmM7CisKKwl2bV9kZXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnZtX2RldiksIEdG
UF9LRVJORUwpOworCWlmICghdm1fZGV2KQorCQlyZXR1cm4gLUVOT01FTTsKKworCXZtX2Rldi0+
dmRldi5kZXYucGFyZW50ID0gZGV2OworCXZtX2Rldi0+dmRldi5kZXYucmVsZWFzZSA9IHZpcnRp
b19tZGV2X3JlbGVhc2VfZGV2OworCXZtX2Rldi0+dmRldi5jb25maWcgPSAmdmlydGlvX21kZXZf
Y29uZmlnX29wczsKKwl2bV9kZXYtPm1kZXYgPSBtZGV2OworCUlOSVRfTElTVF9IRUFEKCZ2bV9k
ZXYtPnZpcnRxdWV1ZXMpOworCXNwaW5fbG9ja19pbml0KCZ2bV9kZXYtPmxvY2spOworCisJdm1f
ZGV2LT5mZWF0dXJlcyA9IG9wcy0+Z2V0X21kZXZfZmVhdHVyZXMobWRldik7CisJaWYgKHZtX2Rl
di0+ZmVhdHVyZXMgIT0gVklSVElPX01ERVZfRl9WRVJTSU9OXzEpIHsKKwkJZGV2X2VycihkZXYs
ICJWSVJUSU9fTURFVl9GX1ZFUlNJT05fMSBpcyBtYW5kYXRvcnlcbiIpOworCQlyZXR1cm4gLUVO
WElPOworCX0KKworCXZtX2Rldi0+dmRldi5pZC5kZXZpY2UgPSBvcHMtPmdldF9kZXZpY2VfaWQo
bWRldik7CisJaWYgKHZtX2Rldi0+dmRldi5pZC5kZXZpY2UgPT0gMCkKKwkJcmV0dXJuIC1FTk9E
RVY7CisKKwl2bV9kZXYtPnZkZXYuaWQudmVuZG9yID0gb3BzLT5nZXRfdmVuZG9yX2lkKG1kZXYp
OworCXJjID0gcmVnaXN0ZXJfdmlydGlvX2RldmljZSgmdm1fZGV2LT52ZGV2KTsKKwlpZiAocmMp
CisJCXB1dF9kZXZpY2UoZGV2KTsKKwllbHNlCisJCWRldl9zZXRfZHJ2ZGF0YShkZXYsIHZtX2Rl
dik7CisKKwlyZXR1cm4gcmM7Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X3JlbW92ZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwl1bnJlZ2lzdGVyX3ZpcnRpb19kZXZpY2UoJnZt
X2Rldi0+dmRldik7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCB2aXJ0
aW9faWRfdGFibGVbXSA9IHsKKwl7IE1ERVZfQ0xBU1NfSURfVklSVElPIH0sCisJeyAwIH0sCit9
OworCitNT0RVTEVfREVWSUNFX1RBQkxFKG1kZXYsIHZpcnRpb19pZF90YWJsZSk7CisKK3N0YXRp
YyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmlydGlvX21kZXZfZHJpdmVyID0geworCS5uYW1lCT0gInZp
cnRpb19tZGV2IiwKKwkucHJvYmUJPSB2aXJ0aW9fbWRldl9wcm9iZSwKKwkucmVtb3ZlID0gdmly
dGlvX21kZXZfcmVtb3ZlLAorCS5pZF90YWJsZSA9IHZpcnRpb19pZF90YWJsZSwKK307CisKK3N0
YXRpYyBpbnQgX19pbml0IHZpcnRpb19tZGV2X2luaXQodm9pZCkKK3sKKwlyZXR1cm4gbWRldl9y
ZWdpc3Rlcl9kcml2ZXIoJnZpcnRpb19tZGV2X2RyaXZlciwgVEhJU19NT0RVTEUpOworfQorCitz
dGF0aWMgdm9pZCBfX2V4aXQgdmlydGlvX21kZXZfZXhpdCh2b2lkKQoreworCW1kZXZfdW5yZWdp
c3Rlcl9kcml2ZXIoJnZpcnRpb19tZGV2X2RyaXZlcik7Cit9CisKK21vZHVsZV9pbml0KHZpcnRp
b19tZGV2X2luaXQpCittb2R1bGVfZXhpdCh2aXJ0aW9fbWRldl9leGl0KQorCitNT0RVTEVfVkVS
U0lPTihEUklWRVJfVkVSU0lPTik7CitNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7CitNT0RVTEVf
QVVUSE9SKERSSVZFUl9BVVRIT1IpOworTU9EVUxFX0RFU0NSSVBUSU9OKERSSVZFUl9ERVNDKTsK
LS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
