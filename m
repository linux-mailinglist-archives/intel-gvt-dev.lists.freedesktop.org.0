Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9E10036C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Nov 2019 12:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9360B8970B;
	Mon, 18 Nov 2019 11:02:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305E889722
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Nov 2019 11:02:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-wt8gg8UfPaqA9ucurp0gbw-1; Mon, 18 Nov 2019 06:02:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1600A85EE6A;
 Mon, 18 Nov 2019 11:02:37 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-65.pek2.redhat.com [10.72.12.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7652060BE1;
 Mon, 18 Nov 2019 11:02:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com, gregkh@linuxfoundation.org, jgg@mellanox.com
Subject: [PATCH V13 5/6] virtio: introduce a mdev based transport
Date: Mon, 18 Nov 2019 18:59:22 +0800
Message-Id: <20191118105923.7991-6-jasowang@redhat.com>
In-Reply-To: <20191118105923.7991-1-jasowang@redhat.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wt8gg8UfPaqA9ucurp0gbw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574074965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9mTZX0fRz4Az5tS6O2SMzhtrRGL3+OTtnNT3CjGECg=;
 b=by/KluGpAAucQm3Jui4LvB/Z8tNA0s/HdMH64oXPa9/++N5vRZkoccNi4R2sb55tXYHSDt
 gQzdXrjg8TZr10xbiJAPxkmbZsTf0tjQJoyAdqAtN5nVd7VZO0uViS3PNyN9OYvLBXR5+p
 Izls1807EW+yrvyaOY0TPTYybHChOwE=
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
Cc: rdunlap@infradead.org, jakub.kicinski@netronome.com,
 christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com, rob.miller@broadcom.com,
 hch@infradead.org, lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, jeffrey.t.kirsher@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, parav@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, zhenyuw@linux.intel.com,
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 jani.nikula@linux.intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 akrowiak@linux.ibm.com, jiri@mellanox.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, aadam@redhat.com, lingshan.zhu@intel.com
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
diBkZXZpY2UuIFRoZSB0cmFuc3BvcnQgd2FzIGltcGxlbWVudGVkIHRocm91Z2gKYnVzX29wcyBv
ZiBtZGV2IHBhcmVudC4KClNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy92aXJ0aW8vS2NvbmZpZyAgICAgICB8ICAxMyArKwogZHJpdmVy
cy92aXJ0aW8vTWFrZWZpbGUgICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRl
di5jIHwgNDA5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xp
bnV4L21kZXZfdmlydGlvLmggIHwgICA1ICsKIDQgZmlsZXMgY2hhbmdlZCwgNDI4IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL0tjb25m
aWcKaW5kZXggMDc4NjE1Y2YyYWZjLi42YTg5YjNkZTk3ZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlydGlvL0tjb25maWcKKysrIGIvZHJpdmVycy92aXJ0aW8vS2NvbmZpZwpAQCAtNDMsNiArNDMs
MTkgQEAgY29uZmlnIFZJUlRJT19QQ0lfTEVHQUNZCiAKIAkgIElmIHVuc3VyZSwgc2F5IFkuCiAK
K2NvbmZpZyBWSVJUSU9fTURFVgorCXRyaXN0YXRlICJNREVWIGRyaXZlciBmb3IgdmlydGlvIGRl
dmljZXMiCisJZGVwZW5kcyBvbiBNREVWX1ZJUlRJTworCWRlZmF1bHQgbgorCWhlbHAKKwkgIFRo
aXMgZHJpdmVyIHByb3ZpZGVzIHN1cHBvcnQgZm9yIHZpcnRpbyBiYXNlZCBwYXJhdmlydHVhbAor
CSAgZGV2aWNlIGRyaXZlciBvdmVyIE1ERVYgYnVzLiBGb3IgdGhpcyB0byBiZSB1c2VmdWwsIHlv
dSBuZWVkCisJICBhbiBhcHByb3ByaWF0ZSB2aXJ0aW8gbWRldiBkZXZpY2UgaW1wbGVtZW50YXRp
b24gdGhhdAorCSAgb3BlcmF0ZXMgb24gYSBwaHlzaWNhbCBkZXZpY2UgdG8gYWxsb3cgdGhlIGRh
dGFwYXRoIG9mIHZpcnRpbworCSAgdG8gYmUgb2ZmbG9hZGVkIHRvIGhhcmR3YXJlLgorCisJICBJ
ZiB1bnN1cmUsIHNheSBNLgorCiBjb25maWcgVklSVElPX1BNRU0KIAl0cmlzdGF0ZSAiU3VwcG9y
dCBmb3IgdmlydGlvIHBtZW0gZHJpdmVyIgogCWRlcGVuZHMgb24gVklSVElPCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpcnRpby9NYWtlZmlsZSBiL2RyaXZlcnMvdmlydGlvL01ha2VmaWxlCmluZGV4
IDNhMmI1YzVkY2Y0Ni4uZjI5OTdiNmM4MTJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpcnRpby9N
YWtlZmlsZQorKysgYi9kcml2ZXJzL3ZpcnRpby9NYWtlZmlsZQpAQCAtNiwzICs2LDQgQEAgdmly
dGlvX3BjaS15IDo9IHZpcnRpb19wY2lfbW9kZXJuLm8gdmlydGlvX3BjaV9jb21tb24ubwogdmly
dGlvX3BjaS0kKENPTkZJR19WSVJUSU9fUENJX0xFR0FDWSkgKz0gdmlydGlvX3BjaV9sZWdhY3ku
bwogb2JqLSQoQ09ORklHX1ZJUlRJT19CQUxMT09OKSArPSB2aXJ0aW9fYmFsbG9vbi5vCiBvYmot
JChDT05GSUdfVklSVElPX0lOUFVUKSArPSB2aXJ0aW9faW5wdXQubworb2JqLSQoQ09ORklHX1ZJ
UlRJT19NREVWKSArPSB2aXJ0aW9fbWRldi5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92
aXJ0aW9fbWRldi5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21kZXYuYwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjdmZGI0MmYwNTVkZgotLS0gL2Rldi9udWxsCisr
KyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMKQEAgLTAsMCArMSw0MDkgQEAKKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKy8qCisgKiBWSVJUSU8gYmFzZWQg
ZHJpdmVyIGZvciBNZWRpYXRlZCBkZXZpY2UKKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMTksIFJl
ZCBIYXQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisgKiAgICAgQXV0aG9yOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgorICoKKyAqLworCisjaW5jbHVkZSA8bGludXgvaW5pdC5oPgor
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgorI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRl
IDxsaW51eC91dWlkLmg+CisjaW5jbHVkZSA8bGludXgvdmlydGlvLmg+CisjaW5jbHVkZSA8bGlu
dXgvbWRldl92aXJ0aW8uaD4KKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9fY29uZmlnLmg+CisjaW5j
bHVkZSA8bGludXgvdmlydGlvX3JpbmcuaD4KKworI2RlZmluZSBEUklWRVJfVkVSU0lPTiAgIjAu
MSIKKyNkZWZpbmUgRFJJVkVSX0FVVEhPUiAgICJSZWQgSGF0IENvcnBvcmF0aW9uIgorI2RlZmlu
ZSBEUklWRVJfREVTQyAgICAgIlZJUlRJTyBiYXNlZCBkcml2ZXIgZm9yIE1lZGlhdGVkIGRldmlj
ZSIKKworI2RlZmluZSB0b192aXJ0aW9fbWRldl9kZXZpY2UoZGV2KSBcCisJY29udGFpbmVyX29m
KGRldiwgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSwgdmRldikKKworc3RydWN0IHZpcnRpb19t
ZGV2X2RldmljZSB7CisJc3RydWN0IHZpcnRpb19kZXZpY2UgdmRldjsKKwlzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXY7CisJdTY0IGZlYXR1cmVzOworCisJLyogVGhlIGxvY2sgdG8gcHJvdGVjdCB2
aXJ0cXVldWUgbGlzdCAqLworCXNwaW5sb2NrX3QgbG9jazsKKwkvKiBMaXN0IG9mIHZpcnRpb19t
ZGV2X3ZxX2luZm8gKi8KKwlzdHJ1Y3QgbGlzdF9oZWFkIHZpcnRxdWV1ZXM7Cit9OworCitzdHJ1
Y3QgdmlydGlvX21kZXZfdnFfaW5mbyB7CisJLyogdGhlIGFjdHVhbCB2aXJ0cXVldWUgKi8KKwlz
dHJ1Y3QgdmlydHF1ZXVlICp2cTsKKworCS8qIHRoZSBsaXN0IG5vZGUgZm9yIHRoZSB2aXJ0cXVl
dWVzIGxpc3QgKi8KKwlzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cit9OworCitzdGF0aWMgc3RydWN0
IG1kZXZfZGV2aWNlICp2bV9nZXRfbWRldihzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKK3sK
KwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbWRldl9kZXZp
Y2UodmRldik7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdm1fZGV2LT5tZGV2OworCisJ
cmV0dXJuIG1kZXY7Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X2dldChzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgb2Zmc2V0LAorCQkJICAgIHZvaWQgKmJ1ZiwgdW5z
aWduZWQgbGVuKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZtX2dldF9tZGV2KHZk
ZXYpOworCWNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19vcHMgKm9wcyA9IG1kZXZfdmlydGlvX2dl
dF9vcHMobWRldik7CisKKwlvcHMtPmdldF9jb25maWcobWRldiwgb2Zmc2V0LCBidWYsIGxlbik7
Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X3NldChzdHJ1Y3QgdmlydGlvX2RldmljZSAq
dmRldiwgdW5zaWduZWQgb2Zmc2V0LAorCQkJICAgIGNvbnN0IHZvaWQgKmJ1ZiwgdW5zaWduZWQg
bGVuKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZtX2dldF9tZGV2KHZkZXYpOwor
CWNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19vcHMgKm9wcyA9IG1kZXZfdmlydGlvX2dldF9vcHMo
bWRldik7CisKKwlvcHMtPnNldF9jb25maWcobWRldiwgb2Zmc2V0LCBidWYsIGxlbik7Cit9CisK
K3N0YXRpYyB1MzIgdmlydGlvX21kZXZfZ2VuZXJhdGlvbihzdHJ1Y3QgdmlydGlvX2RldmljZSAq
dmRldikKK3sKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsK
Kwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fb3BzICpvcHMgPSBtZGV2X3ZpcnRpb19nZXRfb3Bz
KG1kZXYpOworCisKKwlpZiAob3BzLT5nZXRfZ2VuZXJhdGlvbikKKwkJcmV0dXJuIG9wcy0+Z2V0
X2dlbmVyYXRpb24obWRldik7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHU4IHZpcnRpb19t
ZGV2X2dldF9zdGF0dXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCit7CisJc3RydWN0IG1k
ZXZfZGV2aWNlICptZGV2ID0gdm1fZ2V0X21kZXYodmRldik7CisJY29uc3Qgc3RydWN0IG1kZXZf
dmlydGlvX29wcyAqb3BzID0gbWRldl92aXJ0aW9fZ2V0X29wcyhtZGV2KTsKKworCXJldHVybiBv
cHMtPmdldF9zdGF0dXMobWRldik7Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X3NldF9z
dGF0dXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHU4IHN0YXR1cykKK3sKKwlzdHJ1Y3Qg
bWRldl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgbWRl
dl92aXJ0aW9fb3BzICpvcHMgPSBtZGV2X3ZpcnRpb19nZXRfb3BzKG1kZXYpOworCisJcmV0dXJu
IG9wcy0+c2V0X3N0YXR1cyhtZGV2LCBzdGF0dXMpOworfQorCitzdGF0aWMgdm9pZCB2aXJ0aW9f
bWRldl9yZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0
aW9fb3BzICpvcHMgPSBtZGV2X3ZpcnRpb19nZXRfb3BzKG1kZXYpOworCisJcmV0dXJuIG9wcy0+
c2V0X3N0YXR1cyhtZGV2LCAwKTsKK30KKworc3RhdGljIGJvb2wgdmlydGlvX21kZXZfbm90aWZ5
KHN0cnVjdCB2aXJ0cXVldWUgKnZxKQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZt
X2dldF9tZGV2KHZxLT52ZGV2KTsKKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fb3BzICpvcHMg
PSBtZGV2X3ZpcnRpb19nZXRfb3BzKG1kZXYpOworCisJb3BzLT5raWNrX3ZxKG1kZXYsIHZxLT5p
bmRleCk7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKworc3RhdGljIGlycXJldHVybl90IHZpcnRpb19t
ZGV2X2NvbmZpZ19jYih2b2lkICpwcml2YXRlKQoreworCXN0cnVjdCB2aXJ0aW9fbWRldl9kZXZp
Y2UgKnZtX2RldiA9IHByaXZhdGU7CisKKwl2aXJ0aW9fY29uZmlnX2NoYW5nZWQoJnZtX2Rldi0+
dmRldik7CisKKwlyZXR1cm4gSVJRX0hBTkRMRUQ7Cit9CisKK3N0YXRpYyBpcnFyZXR1cm5fdCB2
aXJ0aW9fbWRldl92aXJ0cXVldWVfY2Iodm9pZCAqcHJpdmF0ZSkKK3sKKwlzdHJ1Y3QgdmlydGlv
X21kZXZfdnFfaW5mbyAqaW5mbyA9IHByaXZhdGU7CisKKwlyZXR1cm4gdnJpbmdfaW50ZXJydXB0
KDAsIGluZm8tPnZxKTsKK30KKworc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKgordmlydGlvX21k
ZXZfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIGludCBpbmRl
eCwKKwkJICAgICB2b2lkICgqY2FsbGJhY2spKHN0cnVjdCB2aXJ0cXVldWUgKnZxKSwKKwkJICAg
ICBjb25zdCBjaGFyICpuYW1lLCBib29sIGN0eCkKK3sKKwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2
aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbWRldl9kZXZpY2UodmRldik7CisJc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2ID0gdm1fZ2V0X21kZXYodmRldik7CisJY29uc3Qgc3RydWN0IG1kZXZfdmly
dGlvX29wcyAqb3BzID0gbWRldl92aXJ0aW9fZ2V0X29wcyhtZGV2KTsKKwlzdHJ1Y3QgdmlydGlv
X21kZXZfdnFfaW5mbyAqaW5mbzsKKwlzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgY2I7CisJ
c3RydWN0IHZpcnRxdWV1ZSAqdnE7CisJdTY0IGRlc2NfYWRkciwgZHJpdmVyX2FkZHIsIGRldmlj
ZV9hZGRyOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CisJdTMyIGFsaWduLCBudW07CisJaW50IGVy
cjsKKworCWlmICghbmFtZSkKKwkJcmV0dXJuIE5VTEw7CisKKwkvKiBRdWV1ZSBzaG91bGRuJ3Qg
YWxyZWFkeSBiZSBzZXQgdXAuICovCisJaWYgKG9wcy0+Z2V0X3ZxX3JlYWR5KG1kZXYsIGluZGV4
KSkKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7CisKKwkvKiBBbGxvY2F0ZSBhbmQgZmlsbCBv
dXQgb3VyIGFjdGl2ZSBxdWV1ZSBkZXNjcmlwdGlvbiAqLworCWluZm8gPSBrbWFsbG9jKHNpemVv
ZigqaW5mbyksIEdGUF9LRVJORUwpOworCWlmICghaW5mbykKKwkJcmV0dXJuIEVSUl9QVFIoLUVO
T01FTSk7CisKKwludW0gPSBvcHMtPmdldF92cV9udW1fbWF4KG1kZXYpOworCWlmIChudW0gPT0g
MCkgeworCQllcnIgPSAtRU5PRU5UOworCQlnb3RvIGVycm9yX25ld192aXJ0cXVldWU7CisJfQor
CisJLyogQ3JlYXRlIHRoZSB2cmluZyAqLworCWFsaWduID0gb3BzLT5nZXRfdnFfYWxpZ24obWRl
dik7CisJdnEgPSB2cmluZ19jcmVhdGVfdmlydHF1ZXVlKGluZGV4LCBudW0sIGFsaWduLCB2ZGV2
LAorCQkJCSAgICB0cnVlLCB0cnVlLCBjdHgsCisJCQkJICAgIHZpcnRpb19tZGV2X25vdGlmeSwg
Y2FsbGJhY2ssIG5hbWUpOworCWlmICghdnEpIHsKKwkJZXJyID0gLUVOT01FTTsKKwkJZ290byBl
cnJvcl9uZXdfdmlydHF1ZXVlOworCX0KKworCS8qIFNldHVwIHZpcnRxdWV1ZSBjYWxsYmFjayAq
LworCWNiLmNhbGxiYWNrID0gdmlydGlvX21kZXZfdmlydHF1ZXVlX2NiOworCWNiLnByaXZhdGUg
PSBpbmZvOworCW9wcy0+c2V0X3ZxX2NiKG1kZXYsIGluZGV4LCAmY2IpOworCW9wcy0+c2V0X3Zx
X251bShtZGV2LCBpbmRleCwgdmlydHF1ZXVlX2dldF92cmluZ19zaXplKHZxKSk7CisKKwlkZXNj
X2FkZHIgPSB2aXJ0cXVldWVfZ2V0X2Rlc2NfYWRkcih2cSk7CisJZHJpdmVyX2FkZHIgPSB2aXJ0
cXVldWVfZ2V0X2F2YWlsX2FkZHIodnEpOworCWRldmljZV9hZGRyID0gdmlydHF1ZXVlX2dldF91
c2VkX2FkZHIodnEpOworCisJaWYgKG9wcy0+c2V0X3ZxX2FkZHJlc3MobWRldiwgaW5kZXgsCisJ
CQkJZGVzY19hZGRyLCBkcml2ZXJfYWRkciwKKwkJCQlkZXZpY2VfYWRkcikpIHsKKwkJZXJyID0g
LUVJTlZBTDsKKwkJZ290byBlcnJfdnE7CisJfQorCisJb3BzLT5zZXRfdnFfcmVhZHkobWRldiwg
aW5kZXgsIDEpOworCisJdnEtPnByaXYgPSBpbmZvOworCWluZm8tPnZxID0gdnE7CisKKwlzcGlu
X2xvY2tfaXJxc2F2ZSgmdm1fZGV2LT5sb2NrLCBmbGFncyk7CisJbGlzdF9hZGQoJmluZm8tPm5v
ZGUsICZ2bV9kZXYtPnZpcnRxdWV1ZXMpOworCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnZtX2Rl
di0+bG9jaywgZmxhZ3MpOworCisJcmV0dXJuIHZxOworCitlcnJfdnE6CisJdnJpbmdfZGVsX3Zp
cnRxdWV1ZSh2cSk7CitlcnJvcl9uZXdfdmlydHF1ZXVlOgorCW9wcy0+c2V0X3ZxX3JlYWR5KG1k
ZXYsIGluZGV4LCAwKTsKKwlXQVJOX09OKG9wcy0+Z2V0X3ZxX3JlYWR5KG1kZXYsIGluZGV4KSk7
CisJa2ZyZWUoaW5mbyk7CisJcmV0dXJuIEVSUl9QVFIoZXJyKTsKK30KKworc3RhdGljIHZvaWQg
dmlydGlvX21kZXZfZGVsX3ZxKHN0cnVjdCB2aXJ0cXVldWUgKnZxKQoreworCXN0cnVjdCB2aXJ0
aW9fbWRldl9kZXZpY2UgKnZtX2RldiA9IHRvX3ZpcnRpb19tZGV2X2RldmljZSh2cS0+dmRldik7
CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdm1fZGV2LT5tZGV2OworCWNvbnN0IHN0cnVj
dCBtZGV2X3ZpcnRpb19vcHMgKm9wcyA9IG1kZXZfdmlydGlvX2dldF9vcHMobWRldik7CisJc3Ry
dWN0IHZpcnRpb19tZGV2X3ZxX2luZm8gKmluZm8gPSB2cS0+cHJpdjsKKwl1bnNpZ25lZCBpbnQg
aW5kZXggPSB2cS0+aW5kZXg7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKworCXNwaW5fbG9ja19p
cnFzYXZlKCZ2bV9kZXYtPmxvY2ssIGZsYWdzKTsKKwlsaXN0X2RlbCgmaW5mby0+bm9kZSk7CisJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdm1fZGV2LT5sb2NrLCBmbGFncyk7CisKKwkvKiBTZWxl
Y3QgYW5kIGRlYWN0aXZhdGUgdGhlIHF1ZXVlICovCisJb3BzLT5zZXRfdnFfcmVhZHkobWRldiwg
aW5kZXgsIDApOworCVdBUk5fT04ob3BzLT5nZXRfdnFfcmVhZHkobWRldiwgaW5kZXgpKTsKKwor
CXZyaW5nX2RlbF92aXJ0cXVldWUodnEpOworCisJa2ZyZWUoaW5mbyk7Cit9CisKK3N0YXRpYyB2
b2lkIHZpcnRpb19tZGV2X2RlbF92cXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCit7CisJ
c3RydWN0IHZpcnRxdWV1ZSAqdnEsICpuOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHZx
LCBuLCAmdmRldi0+dnFzLCBsaXN0KQorCQl2aXJ0aW9fbWRldl9kZWxfdnEodnEpOworfQorCitz
dGF0aWMgaW50IHZpcnRpb19tZGV2X2ZpbmRfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2
LCB1bnNpZ25lZCBudnFzLAorCQkJCXN0cnVjdCB2aXJ0cXVldWUgKnZxc1tdLAorCQkJCXZxX2Nh
bGxiYWNrX3QgKmNhbGxiYWNrc1tdLAorCQkJCWNvbnN0IGNoYXIgKiBjb25zdCBuYW1lc1tdLAor
CQkJCWNvbnN0IGJvb2wgKmN0eCwKKwkJCQlzdHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNjKQorewor
CXN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UgKnZtX2RldiA9IHRvX3ZpcnRpb19tZGV2X2Rldmlj
ZSh2ZGV2KTsKKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsK
Kwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fb3BzICpvcHMgPSBtZGV2X3ZpcnRpb19nZXRfb3Bz
KG1kZXYpOworCXN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjayBjYjsKKwlpbnQgaSwgZXJyLCBx
dWV1ZV9pZHggPSAwOworCisJZm9yIChpID0gMDsgaSA8IG52cXM7ICsraSkgeworCQlpZiAoIW5h
bWVzW2ldKSB7CisJCQl2cXNbaV0gPSBOVUxMOworCQkJY29udGludWU7CisJCX0KKworCQl2cXNb
aV0gPSB2aXJ0aW9fbWRldl9zZXR1cF92cSh2ZGV2LCBxdWV1ZV9pZHgrKywKKwkJCQkJICAgICAg
Y2FsbGJhY2tzW2ldLCBuYW1lc1tpXSwgY3R4ID8KKwkJCQkJICAgICAgY3R4W2ldIDogZmFsc2Up
OworCQlpZiAoSVNfRVJSKHZxc1tpXSkpIHsKKwkJCWVyciA9IFBUUl9FUlIodnFzW2ldKTsKKwkJ
CWdvdG8gZXJyX3NldHVwX3ZxOworCQl9CisJfQorCisJY2IuY2FsbGJhY2sgPSB2aXJ0aW9fbWRl
dl9jb25maWdfY2I7CisJY2IucHJpdmF0ZSA9IHZtX2RldjsKKwlvcHMtPnNldF9jb25maWdfY2Io
bWRldiwgJmNiKTsKKworCXJldHVybiAwOworCitlcnJfc2V0dXBfdnE6CisJdmlydGlvX21kZXZf
ZGVsX3Zxcyh2ZGV2KTsKKwlyZXR1cm4gZXJyOworfQorCitzdGF0aWMgdTY0IHZpcnRpb19tZGV2
X2dldF9mZWF0dXJlcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKK3sKKwlzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYgPSB2bV9nZXRfbWRldih2ZGV2KTsKKwljb25zdCBzdHJ1Y3QgbWRldl92
aXJ0aW9fb3BzICpvcHMgPSBtZGV2X3ZpcnRpb19nZXRfb3BzKG1kZXYpOworCisJcmV0dXJuIG9w
cy0+Z2V0X2ZlYXR1cmVzKG1kZXYpOworfQorCitzdGF0aWMgaW50IHZpcnRpb19tZGV2X2ZpbmFs
aXplX2ZlYXR1cmVzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQoreworCXN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiA9IHZtX2dldF9tZGV2KHZkZXYpOworCWNvbnN0IHN0cnVjdCBtZGV2X3Zp
cnRpb19vcHMgKm9wcyA9IG1kZXZfdmlydGlvX2dldF9vcHMobWRldik7CisKKwkvKiBHaXZlIHZp
cnRpb19yaW5nIGEgY2hhbmNlIHRvIGFjY2VwdCBmZWF0dXJlcy4gKi8KKwl2cmluZ190cmFuc3Bv
cnRfZmVhdHVyZXModmRldik7CisKKwlyZXR1cm4gb3BzLT5zZXRfZmVhdHVyZXMobWRldiwgdmRl
di0+ZmVhdHVyZXMpOworfQorCitzdGF0aWMgY29uc3QgY2hhciAqdmlydGlvX21kZXZfYnVzX25h
bWUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2Rl
dmljZSAqdm1fZGV2ID0gdG9fdmlydGlvX21kZXZfZGV2aWNlKHZkZXYpOworCXN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiA9IHZtX2Rldi0+bWRldjsKKworCXJldHVybiBkZXZfbmFtZShtZGV2X2Rl
dihtZGV2KSk7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmlydGlvX2NvbmZpZ19vcHMgdmly
dGlvX21kZXZfY29uZmlnX29wcyA9IHsKKwkuZ2V0CQk9IHZpcnRpb19tZGV2X2dldCwKKwkuc2V0
CQk9IHZpcnRpb19tZGV2X3NldCwKKwkuZ2VuZXJhdGlvbgk9IHZpcnRpb19tZGV2X2dlbmVyYXRp
b24sCisJLmdldF9zdGF0dXMJPSB2aXJ0aW9fbWRldl9nZXRfc3RhdHVzLAorCS5zZXRfc3RhdHVz
CT0gdmlydGlvX21kZXZfc2V0X3N0YXR1cywKKwkucmVzZXQJCT0gdmlydGlvX21kZXZfcmVzZXQs
CisJLmZpbmRfdnFzCT0gdmlydGlvX21kZXZfZmluZF92cXMsCisJLmRlbF92cXMJPSB2aXJ0aW9f
bWRldl9kZWxfdnFzLAorCS5nZXRfZmVhdHVyZXMJPSB2aXJ0aW9fbWRldl9nZXRfZmVhdHVyZXMs
CisJLmZpbmFsaXplX2ZlYXR1cmVzID0gdmlydGlvX21kZXZfZmluYWxpemVfZmVhdHVyZXMsCisJ
LmJ1c19uYW1lCT0gdmlydGlvX21kZXZfYnVzX25hbWUsCit9OworCitzdGF0aWMgdm9pZCB2aXJ0
aW9fbWRldl9yZWxlYXNlX2RldihzdHJ1Y3QgZGV2aWNlICpfZCkKK3sKKwlzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldiA9CisJICAgICAgIGNvbnRhaW5lcl9vZihfZCwgc3RydWN0IHZpcnRpb19k
ZXZpY2UsIGRldik7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2ID0KKwkgICAg
ICAgY29udGFpbmVyX29mKHZkZXYsIHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2UsIHZkZXYpOwor
CXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHZtX2Rldi0+bWRldjsKKworCWRldm1fa2ZyZWUo
bWRldl9kZXYobWRldiksIHZtX2Rldik7Cit9CisKK3N0YXRpYyBpbnQgdmlydGlvX21kZXZfcHJv
YmUoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG1k
ZXZfdmlydGlvX2Zyb21fZGV2KGRldik7CisJY29uc3Qgc3RydWN0IG1kZXZfdmlydGlvX29wcyAq
b3BzID0gbWRldl92aXJ0aW9fZ2V0X29wcyhtZGV2KTsKKwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2
aWNlICp2bV9kZXY7CisJaW50IHJjOworCisJdm1fZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCp2bV9kZXYpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXZtX2RldikKKwkJcmV0dXJuIC1FTk9N
RU07CisKKwl2bV9kZXYtPnZkZXYuZGV2LnBhcmVudCA9IGRldjsKKwl2bV9kZXYtPnZkZXYuZGV2
LnJlbGVhc2UgPSB2aXJ0aW9fbWRldl9yZWxlYXNlX2RldjsKKwl2bV9kZXYtPnZkZXYuY29uZmln
ID0gJnZpcnRpb19tZGV2X2NvbmZpZ19vcHM7CisJdm1fZGV2LT5tZGV2ID0gbWRldjsKKwlJTklU
X0xJU1RfSEVBRCgmdm1fZGV2LT52aXJ0cXVldWVzKTsKKwlzcGluX2xvY2tfaW5pdCgmdm1fZGV2
LT5sb2NrKTsKKworCXZtX2Rldi0+dmRldi5pZC5kZXZpY2UgPSBvcHMtPmdldF9kZXZpY2VfaWQo
bWRldik7CisJaWYgKHZtX2Rldi0+dmRldi5pZC5kZXZpY2UgPT0gMCkKKwkJcmV0dXJuIC1FTk9E
RVY7CisKKwl2bV9kZXYtPnZkZXYuaWQudmVuZG9yID0gb3BzLT5nZXRfdmVuZG9yX2lkKG1kZXYp
OworCXJjID0gcmVnaXN0ZXJfdmlydGlvX2RldmljZSgmdm1fZGV2LT52ZGV2KTsKKwlpZiAocmMp
CisJCXB1dF9kZXZpY2UoZGV2KTsKKwllbHNlCisJCWRldl9zZXRfZHJ2ZGF0YShkZXYsIHZtX2Rl
dik7CisKKwlyZXR1cm4gcmM7Cit9CisKK3N0YXRpYyB2b2lkIHZpcnRpb19tZGV2X3JlbW92ZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJc3RydWN0IHZpcnRpb19tZGV2X2RldmljZSAqdm1fZGV2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwl1bnJlZ2lzdGVyX3ZpcnRpb19kZXZpY2UoJnZt
X2Rldi0+dmRldik7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fY2xhc3Nf
aWQgdmlydGlvX2lkX3RhYmxlW10gPSB7CisJeyBNREVWX1ZJUlRJT19DTEFTU19JRF9WSVJUSU8g
fSwKKwl7IDAgfSwKK307CisKK01PRFVMRV9ERVZJQ0VfVEFCTEUobWRldl92aXJ0aW8sIHZpcnRp
b19pZF90YWJsZSk7CisKK3N0YXRpYyBzdHJ1Y3QgbWRldl92aXJ0aW9fZHJpdmVyIHZpcnRpb19t
ZGV2X2RyaXZlciA9IHsKKwkuZHJ2ID0geworCQkubmFtZQk9ICJ2aXJ0aW9fbWRldiIsCisJCS5w
cm9iZQk9IHZpcnRpb19tZGV2X3Byb2JlLAorCQkucmVtb3ZlID0gdmlydGlvX21kZXZfcmVtb3Zl
LAorCX0sCisJLmlkX3RhYmxlID0gdmlydGlvX2lkX3RhYmxlLAorfTsKKworc3RhdGljIGludCBf
X2luaXQgdmlydGlvX21kZXZfaW5pdCh2b2lkKQoreworCXJldHVybiBtZGV2X3JlZ2lzdGVyX2Ry
aXZlcigmdmlydGlvX21kZXZfZHJpdmVyLmRydiwgVEhJU19NT0RVTEUsCisJCQkJICAgICZtZGV2
X3ZpcnRpb19idXNfdHlwZSk7Cit9CisKK3N0YXRpYyB2b2lkIF9fZXhpdCB2aXJ0aW9fbWRldl9l
eGl0KHZvaWQpCit7CisJbWRldl91bnJlZ2lzdGVyX2RyaXZlcigmdmlydGlvX21kZXZfZHJpdmVy
LmRydik7Cit9CisKK21vZHVsZV9pbml0KHZpcnRpb19tZGV2X2luaXQpCittb2R1bGVfZXhpdCh2
aXJ0aW9fbWRldl9leGl0KQorCitNT0RVTEVfVkVSU0lPTihEUklWRVJfVkVSU0lPTik7CitNT0RV
TEVfTElDRU5TRSgiR1BMIHYyIik7CitNT0RVTEVfQVVUSE9SKERSSVZFUl9BVVRIT1IpOworTU9E
VUxFX0RFU0NSSVBUSU9OKERSSVZFUl9ERVNDKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bWRldl92aXJ0aW8uaCBiL2luY2x1ZGUvbGludXgvbWRldl92aXJ0aW8uaAppbmRleCBlZjJkYmI2
YzM4M2EuLjVmNzVmM2NmNTllMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZGV2X3ZpcnRp
by5oCisrKyBiL2luY2x1ZGUvbGludXgvbWRldl92aXJ0aW8uaApAQCAtMjUsNiArMjUsMTEgQEAg
c3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIHsKIAl2b2lkICpwcml2YXRlOwogfTsKIAorZW51
bSB7CisJTURFVl9WSVJUSU9fQ0xBU1NfSURfVklSVElPID0gMSwKKwkvKiBOZXcgZW50cmllcyBt
dXN0IGJlIGFkZGVkIGhlcmUgKi8KK307CisKIC8qKgogICogc3RydWN0IG1kZXZfdmlydGlvX2Rl
dmljZV9vcHMgLSBTdHJ1Y3R1cmUgdG8gYmUgcmVnaXN0ZXJlZCBmb3IgZWFjaAogICogbWRldiBk
ZXZpY2UgdG8gcmVnaXN0ZXIgdGhlIGRldmljZSBmb3IgdmlydGlvL3Zob3N0IGRyaXZlcnMuCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
