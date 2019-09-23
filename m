Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1966BB4C5
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Sep 2019 15:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894AF6E8F3;
	Mon, 23 Sep 2019 13:04:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC36F6E8E8;
 Mon, 23 Sep 2019 13:04:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39CF63091740;
 Mon, 23 Sep 2019 13:04:45 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-93.pek2.redhat.com [10.72.12.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 010B710013D9;
 Mon, 23 Sep 2019 13:04:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH 2/6] mdev: introduce device specific ops
Date: Mon, 23 Sep 2019 21:03:27 +0800
Message-Id: <20190923130331.29324-3-jasowang@redhat.com>
In-Reply-To: <20190923130331.29324-1-jasowang@redhat.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 23 Sep 2019 13:04:45 +0000 (UTC)
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
Cc: sebott@linux.ibm.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
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

Q3VycmVudGx5LCBleGNlcHQgZm9yIHRoZSBjcmVhdGUgYW5kIHJlbW92ZS4gVGhlIHJlc3Qgb2YK
bWRldl9wYXJlbnRfb3BzIGlzIGRlc2lnbmVkIGZvciB2ZmlvLW1kZXYgZHJpdmVyIG9ubHkgYW5k
IG1heSBub3QgaGVscApmb3Iga2VybmVsIG1kZXYgZHJpdmVyLiBGb2xsb3cgdGhlIGNsYXNzIGlk
IHN1cHBvcnQgYnkgcHJldmlvdXMgcGF0Y2gsCnRoaXMgcGF0Y2ggaW50cm9kdWNlcyBkZXZpY2Ug
c3BlY2lmaWMgb3BzIHBvaW50ZXIgaW5zaWRlIHBhcmVudCBvcHMKd2hpY2ggcG9pbnRzIHRvIGRl
dmljZSBzcGVjaWZpYyBvcHMgKGUuZyB2ZmlvIG9wcykuIFRoaXMgYWxsb3dzIHRoZQpmdXR1cmUg
ZHJpdmVycyBsaWtlIHZpcnRpby1tZGV2IHRvIGltcGxlbWVudCBpdHMgb3duIGRldmljZSBzcGVj
aWZpYwpvcHMuCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
PgotLS0KIC4uLi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCAgICAgICB8ICA0
ICstCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgfCAxNSArKyst
LS0KIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICB8IDE1ICsr
KystLQogZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgMTEg
KystLQogZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgIHwgMzEg
KysrKysrLS0tLS0KIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDM2ICsrLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvdmZpb19tZGV2LmggICAgICAgICAg
ICAgICAgICAgICB8IDUzICsrKysrKysrKysrKysrKysrKysKIHNhbXBsZXMvdmZpby1tZGV2L21i
b2Nocy5jICAgICAgICAgICAgICAgICAgICB8IDE3ICsrKy0tLQogc2FtcGxlcy92ZmlvLW1kZXYv
bWRweS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTcgKysrLS0tCiBzYW1wbGVzL3ZmaW8tbWRl
di9tdHR5LmMgICAgICAgICAgICAgICAgICAgICAgfCAxNSArKysrLS0KIDExIGZpbGVzIGNoYW5n
ZWQsIDEzOCBpbnNlcnRpb25zKCspLCA3NyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L3ZmaW9fbWRldi5oCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKaW5kZXggMGUwNTIwNzJlMWQ4Li4zYWIwMGU0
ODIxMmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVk
LWRldmljZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQt
ZGV2aWNlLnJzdApAQCAtMTUyLDcgKzE1Miw5IEBAIGNhbGxiYWNrcyBwZXIgbWRldiBwYXJlbnQg
ZGV2aWNlLCBwZXIgbWRldiB0eXBlLCBvciBhbnkgb3RoZXIgY2F0ZWdvcml6YXRpb24uCiBWZW5k
b3IgZHJpdmVycyBhcmUgZXhwZWN0ZWQgdG8gYmUgZnVsbHkgYXN5bmNocm9ub3VzIGluIHRoaXMg
cmVzcGVjdCBvcgogcHJvdmlkZSB0aGVpciBvd24gaW50ZXJuYWwgcmVzb3VyY2UgcHJvdGVjdGlv
bi4pCiAKLVRoZSBjYWxsYmFja3MgaW4gdGhlIG1kZXZfcGFyZW50X29wcyBzdHJ1Y3R1cmUgYXJl
IGFzIGZvbGxvd3M6CitUaGUgZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNrcyBhcmUgcmVmZXJyZWQg
dGhyb3VnaCBkZXZpY2Vfb3BzIHBvaW50ZXIKK2luIG1kZXZfcGFyZW50X29wcy4gRm9yIHZmaW8t
bWRldiBkZXZpY2UsIGl0cyBjYWxsYmFja3MgaW4gZGV2aWNlX29wcworYXJlIGFzIGZvbGxvd3M6
CiAKICogb3Blbjogb3BlbiBjYWxsYmFjayBvZiBtZWRpYXRlZCBkZXZpY2UKICogY2xvc2U6IGNs
b3NlIGNhbGxiYWNrIG9mIG1lZGlhdGVkIGRldmljZQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwppbmRleCBiMjMyNmRlY2UyOGUuLjg5ODMyYjMxNjUwMCAxMDA2NDQKLS0t
IGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE3MDc1LDYgKzE3MDc1LDcgQEAg
UzoJTWFpbnRhaW5lZAogRjoJRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQt
ZGV2aWNlLnJzdAogRjoJZHJpdmVycy92ZmlvL21kZXYvCiBGOglpbmNsdWRlL2xpbnV4L21kZXYu
aAorRjoJaW5jbHVkZS9saW51eC92ZmlvX21kZXYuaAogRjoJc2FtcGxlcy92ZmlvLW1kZXYvCiAK
IFZGSU8gUExBVEZPUk0gRFJJVkVSCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQva3ZtZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCmluZGV4IDE5ZDUx
YTM1ZjAxOS4uOGVhODZiMWU2OWYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQva3ZtZ3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwpAQCAtNDIs
NiArNDIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+CiAjaW5jbHVkZSA8bGludXgv
dmZpby5oPgogI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KKyNpbmNsdWRlIDxsaW51eC92ZmlvX21k
ZXYuaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+CiAKICNpbmNsdWRlIDxsaW51eC9ub3Nw
ZWMuaD4KQEAgLTE2MDAsMjAgKzE2MDEsMjIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1
dGVfZ3JvdXAgKmludGVsX3ZncHVfZ3JvdXBzW10gPSB7CiAJTlVMTCwKIH07CiAKLXN0YXRpYyBz
dHJ1Y3QgbWRldl9wYXJlbnRfb3BzIGludGVsX3ZncHVfb3BzID0gewotCS5tZGV2X2F0dHJfZ3Jv
dXBzICAgICAgID0gaW50ZWxfdmdwdV9ncm91cHMsCi0JLmNyZWF0ZQkJCT0gaW50ZWxfdmdwdV9j
cmVhdGUsCi0JLnJlbW92ZQkJCT0gaW50ZWxfdmdwdV9yZW1vdmUsCi0KK3N0YXRpYyBzdHJ1Y3Qg
dmZpb19tZGV2X3BhcmVudF9vcHMgaW50ZWxfdmZpb192Z3B1X29wcyA9IHsKIAkub3BlbgkJCT0g
aW50ZWxfdmdwdV9vcGVuLAogCS5yZWxlYXNlCQk9IGludGVsX3ZncHVfcmVsZWFzZSwKLQogCS5y
ZWFkCQkJPSBpbnRlbF92Z3B1X3JlYWQsCiAJLndyaXRlCQkJPSBpbnRlbF92Z3B1X3dyaXRlLAog
CS5tbWFwCQkJPSBpbnRlbF92Z3B1X21tYXAsCiAJLmlvY3RsCQkJPSBpbnRlbF92Z3B1X2lvY3Rs
LAogfTsKIAorc3RhdGljIHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgaW50ZWxfdmdwdV9vcHMgPSB7
CisJLm1kZXZfYXR0cl9ncm91cHMgICAgICAgPSBpbnRlbF92Z3B1X2dyb3VwcywKKwkuY3JlYXRl
CQkJPSBpbnRlbF92Z3B1X2NyZWF0ZSwKKwkucmVtb3ZlCQkJPSBpbnRlbF92Z3B1X3JlbW92ZSwK
KwkuZGV2aWNlX29wcwkgICAgICAgID0gJmludGVsX3ZmaW9fdmdwdV9vcHMsCit9OworCiBzdGF0
aWMgaW50IGt2bWd0X2hvc3RfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmd2dCwgY29u
c3Qgdm9pZCAqb3BzKQogewogCXN0cnVjdCBhdHRyaWJ1dGUgKiprdm1fdHlwZV9hdHRyczsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgYi9kcml2ZXJzL3MzOTAv
Y2lvL3ZmaW9fY2N3X29wcy5jCmluZGV4IDI0NmZmMGY4MDk0NC4uMDIxMjJiYmMyMTNlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jCisrKyBiL2RyaXZlcnMvczM5
MC9jaW8vdmZpb19jY3dfb3BzLmMKQEAgLTEyLDYgKzEyLDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4
L3ZmaW8uaD4KICNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+CisjaW5jbHVkZSA8bGludXgvdmZpb19t
ZGV2Lmg+CiAjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5o
PgogCkBAIC01NzQsMTEgKzU3NSw3IEBAIHN0YXRpYyBzc2l6ZV90IHZmaW9fY2N3X21kZXZfaW9j
dGwoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LAogCX0KIH0KIAotc3RhdGljIGNvbnN0IHN0cnVj
dCBtZGV2X3BhcmVudF9vcHMgdmZpb19jY3dfbWRldl9vcHMgPSB7Ci0JLm93bmVyCQkJPSBUSElT
X01PRFVMRSwKLQkuc3VwcG9ydGVkX3R5cGVfZ3JvdXBzICA9IG1kZXZfdHlwZV9ncm91cHMsCi0J
LmNyZWF0ZQkJCT0gdmZpb19jY3dfbWRldl9jcmVhdGUsCi0JLnJlbW92ZQkJCT0gdmZpb19jY3df
bWRldl9yZW1vdmUsCitzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fbWRldl9wYXJlbnRfb3BzIHZm
aW9fbWRldl9vcHMgPSB7CiAJLm9wZW4JCQk9IHZmaW9fY2N3X21kZXZfb3BlbiwKIAkucmVsZWFz
ZQkJPSB2ZmlvX2Njd19tZGV2X3JlbGVhc2UsCiAJLnJlYWQJCQk9IHZmaW9fY2N3X21kZXZfcmVh
ZCwKQEAgLTU4Niw2ICs1ODMsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9v
cHMgdmZpb19jY3dfbWRldl9vcHMgPSB7CiAJLmlvY3RsCQkJPSB2ZmlvX2Njd19tZGV2X2lvY3Rs
LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgdmZpb19jY3dfbWRl
dl9vcHMgPSB7CisJLm93bmVyCQkJPSBUSElTX01PRFVMRSwKKwkuc3VwcG9ydGVkX3R5cGVfZ3Jv
dXBzICA9IG1kZXZfdHlwZV9ncm91cHMsCisJLmNyZWF0ZQkJCT0gdmZpb19jY3dfbWRldl9jcmVh
dGUsCisJLnJlbW92ZQkJCT0gdmZpb19jY3dfbWRldl9yZW1vdmUsCisJLmRldmljZV9vcHMJCT0g
JnZmaW9fbWRldl9vcHMsCit9OworCiBpbnQgdmZpb19jY3dfbWRldl9yZWcoc3RydWN0IHN1YmNo
YW5uZWwgKnNjaCkKIHsKIAlyZXR1cm4gbWRldl9yZWdpc3Rlcl92ZmlvX2RldmljZSgmc2NoLT5k
ZXYsICZ2ZmlvX2Njd19tZGV2X29wcyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvY3J5cHRv
L3ZmaW9fYXBfb3BzLmMgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMKaW5kZXgg
NzQ4N2ZjMzlkMmM1Li40MjUxYmVjYzdhNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jcnlw
dG8vdmZpb19hcF9vcHMuYworKysgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMK
QEAgLTE2LDYgKzE2LDcgQEAKICNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KICNpbmNsdWRlIDxs
aW51eC9rdm1faG9zdC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxp
bnV4L3ZmaW9fbWRldi5oPgogI2luY2x1ZGUgPGFzbS9rdm0uaD4KICNpbmNsdWRlIDxhc20vemNy
eXB0Lmg+CiAKQEAgLTEyODAsMTUgKzEyODEsMTkgQEAgc3RhdGljIHNzaXplX3QgdmZpb19hcF9t
ZGV2X2lvY3RsKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKIAlyZXR1cm4gcmV0OwogfQogCitz
dGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fbWRldl9wYXJlbnRfb3BzIHZmaW9fbWRldl9vcHMgPSB7
CisJLm9wZW4JCQk9IHZmaW9fYXBfbWRldl9vcGVuLAorCS5yZWxlYXNlCQk9IHZmaW9fYXBfbWRl
dl9yZWxlYXNlLAorCS5pb2N0bAkJCT0gdmZpb19hcF9tZGV2X2lvY3RsLAorfTsKKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgdmZpb19hcF9tYXRyaXhfb3BzID0gewogCS5v
d25lcgkJCT0gVEhJU19NT0RVTEUsCiAJLnN1cHBvcnRlZF90eXBlX2dyb3Vwcwk9IHZmaW9fYXBf
bWRldl90eXBlX2dyb3VwcywKIAkubWRldl9hdHRyX2dyb3Vwcwk9IHZmaW9fYXBfbWRldl9hdHRy
X2dyb3VwcywKIAkuY3JlYXRlCQkJPSB2ZmlvX2FwX21kZXZfY3JlYXRlLAogCS5yZW1vdmUJCQk9
IHZmaW9fYXBfbWRldl9yZW1vdmUsCi0JLm9wZW4JCQk9IHZmaW9fYXBfbWRldl9vcGVuLAotCS5y
ZWxlYXNlCQk9IHZmaW9fYXBfbWRldl9yZWxlYXNlLAotCS5pb2N0bAkJCT0gdmZpb19hcF9tZGV2
X2lvY3RsLAorCS5kZXZpY2Vfb3BzCQk9ICZ2ZmlvX21kZXZfb3BzLAogfTsKIAogaW50IHZmaW9f
YXBfbWRldl9yZWdpc3Rlcih2b2lkKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvdmZp
b19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwppbmRleCBmZDJhNGQ5YTNm
MjYuLmQyM2M5ZjU4Yzg0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2
LmMKKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKQEAgLTE0LDYgKzE0LDcgQEAK
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvdmZpby5oPgogI2luY2x1
ZGUgPGxpbnV4L21kZXYuaD4KKyNpbmNsdWRlIDxsaW51eC92ZmlvX21kZXYuaD4KIAogI2luY2x1
ZGUgIm1kZXZfcHJpdmF0ZS5oIgogCkBAIC0yNSwxNSArMjYsMTYgQEAgc3RhdGljIGludCB2Zmlv
X21kZXZfb3Blbih2b2lkICpkZXZpY2VfZGF0YSkKIHsKIAlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYgPSBkZXZpY2VfZGF0YTsKIAlzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudCA9IG1kZXYtPnBh
cmVudDsKKwljb25zdCBzdHJ1Y3QgdmZpb19tZGV2X3BhcmVudF9vcHMgKm9wcyA9IHBhcmVudC0+
b3BzLT5kZXZpY2Vfb3BzOwogCWludCByZXQ7CiAKLQlpZiAodW5saWtlbHkoIXBhcmVudC0+b3Bz
LT5vcGVuKSkKKwlpZiAodW5saWtlbHkoIW9wcy0+b3BlbikpCiAJCXJldHVybiAtRUlOVkFMOwog
CiAJaWYgKCF0cnlfbW9kdWxlX2dldChUSElTX01PRFVMRSkpCiAJCXJldHVybiAtRU5PREVWOwog
Ci0JcmV0ID0gcGFyZW50LT5vcHMtPm9wZW4obWRldik7CisJcmV0ID0gb3BzLT5vcGVuKG1kZXYp
OwogCWlmIChyZXQpCiAJCW1vZHVsZV9wdXQoVEhJU19NT0RVTEUpOwogCkBAIC00NCw5ICs0Niwx
MCBAQCBzdGF0aWMgdm9pZCB2ZmlvX21kZXZfcmVsZWFzZSh2b2lkICpkZXZpY2VfZGF0YSkKIHsK
IAlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBkZXZpY2VfZGF0YTsKIAlzdHJ1Y3QgbWRldl9w
YXJlbnQgKnBhcmVudCA9IG1kZXYtPnBhcmVudDsKKwljb25zdCBzdHJ1Y3QgdmZpb19tZGV2X3Bh
cmVudF9vcHMgKm9wcyA9IHBhcmVudC0+b3BzLT5kZXZpY2Vfb3BzOwogCi0JaWYgKGxpa2VseShw
YXJlbnQtPm9wcy0+cmVsZWFzZSkpCi0JCXBhcmVudC0+b3BzLT5yZWxlYXNlKG1kZXYpOworCWlm
IChsaWtlbHkob3BzLT5yZWxlYXNlKSkKKwkJb3BzLT5yZWxlYXNlKG1kZXYpOwogCiAJbW9kdWxl
X3B1dChUSElTX01PRFVMRSk7CiB9CkBAIC01NiwxMSArNTksMTIgQEAgc3RhdGljIGxvbmcgdmZp
b19tZGV2X3VubG9ja2VkX2lvY3RsKHZvaWQgKmRldmljZV9kYXRhLAogewogCXN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiA9IGRldmljZV9kYXRhOwogCXN0cnVjdCBtZGV2X3BhcmVudCAqcGFyZW50
ID0gbWRldi0+cGFyZW50OworCWNvbnN0IHN0cnVjdCB2ZmlvX21kZXZfcGFyZW50X29wcyAqb3Bz
ID0gcGFyZW50LT5vcHMtPmRldmljZV9vcHM7CiAKLQlpZiAodW5saWtlbHkoIXBhcmVudC0+b3Bz
LT5pb2N0bCkpCisJaWYgKHVubGlrZWx5KCFvcHMtPmlvY3RsKSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAKLQlyZXR1cm4gcGFyZW50LT5vcHMtPmlvY3RsKG1kZXYsIGNtZCwgYXJnKTsKKwlyZXR1cm4g
b3BzLT5pb2N0bChtZGV2LCBjbWQsIGFyZyk7CiB9CiAKIHN0YXRpYyBzc2l6ZV90IHZmaW9fbWRl
dl9yZWFkKHZvaWQgKmRldmljZV9kYXRhLCBjaGFyIF9fdXNlciAqYnVmLApAQCAtNjgsMTEgKzcy
LDEyIEBAIHN0YXRpYyBzc2l6ZV90IHZmaW9fbWRldl9yZWFkKHZvaWQgKmRldmljZV9kYXRhLCBj
aGFyIF9fdXNlciAqYnVmLAogewogCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IGRldmljZV9k
YXRhOwogCXN0cnVjdCBtZGV2X3BhcmVudCAqcGFyZW50ID0gbWRldi0+cGFyZW50OworCWNvbnN0
IHN0cnVjdCB2ZmlvX21kZXZfcGFyZW50X29wcyAqb3BzID0gcGFyZW50LT5vcHMtPmRldmljZV9v
cHM7CiAKLQlpZiAodW5saWtlbHkoIXBhcmVudC0+b3BzLT5yZWFkKSkKKwlpZiAodW5saWtlbHko
IW9wcy0+cmVhZCkpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JcmV0dXJuIHBhcmVudC0+b3BzLT5y
ZWFkKG1kZXYsIGJ1ZiwgY291bnQsIHBwb3MpOworCXJldHVybiBvcHMtPnJlYWQobWRldiwgYnVm
LCBjb3VudCwgcHBvcyk7CiB9CiAKIHN0YXRpYyBzc2l6ZV90IHZmaW9fbWRldl93cml0ZSh2b2lk
ICpkZXZpY2VfZGF0YSwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKQEAgLTgwLDIyICs4NSwyNCBA
QCBzdGF0aWMgc3NpemVfdCB2ZmlvX21kZXZfd3JpdGUodm9pZCAqZGV2aWNlX2RhdGEsIGNvbnN0
IGNoYXIgX191c2VyICpidWYsCiB7CiAJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gZGV2aWNl
X2RhdGE7CiAJc3RydWN0IG1kZXZfcGFyZW50ICpwYXJlbnQgPSBtZGV2LT5wYXJlbnQ7CisJY29u
c3Qgc3RydWN0IHZmaW9fbWRldl9wYXJlbnRfb3BzICpvcHMgPSBwYXJlbnQtPm9wcy0+ZGV2aWNl
X29wczsKIAotCWlmICh1bmxpa2VseSghcGFyZW50LT5vcHMtPndyaXRlKSkKKwlpZiAodW5saWtl
bHkoIW9wcy0+d3JpdGUpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXJldHVybiBwYXJlbnQtPm9w
cy0+d3JpdGUobWRldiwgYnVmLCBjb3VudCwgcHBvcyk7CisJcmV0dXJuIG9wcy0+d3JpdGUobWRl
diwgYnVmLCBjb3VudCwgcHBvcyk7CiB9CiAKIHN0YXRpYyBpbnQgdmZpb19tZGV2X21tYXAodm9p
ZCAqZGV2aWNlX2RhdGEsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewogCXN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldiA9IGRldmljZV9kYXRhOwogCXN0cnVjdCBtZGV2X3BhcmVudCAqcGFy
ZW50ID0gbWRldi0+cGFyZW50OworCWNvbnN0IHN0cnVjdCB2ZmlvX21kZXZfcGFyZW50X29wcyAq
b3BzID0gcGFyZW50LT5vcHMtPmRldmljZV9vcHM7CiAKLQlpZiAodW5saWtlbHkoIXBhcmVudC0+
b3BzLT5tbWFwKSkKKwlpZiAodW5saWtlbHkoIW9wcy0+bW1hcCkpCiAJCXJldHVybiAtRUlOVkFM
OwogCi0JcmV0dXJuIHBhcmVudC0+b3BzLT5tbWFwKG1kZXYsIHZtYSk7CisJcmV0dXJuIG9wcy0+
bW1hcChtZGV2LCB2bWEpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fZGV2aWNlX29w
cyB2ZmlvX21kZXZfZGV2X29wcyA9IHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWRldi5o
IGIvaW5jbHVkZS9saW51eC9tZGV2LmgKaW5kZXggM2ViYWUzMTBmNTk5Li5mYTE2N2JjYjgxZTEg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWRldi5oCisrKyBiL2luY2x1ZGUvbGludXgvbWRl
di5oCkBAIC00OCwzMCArNDgsOCBAQCBzdHJ1Y3QgZGV2aWNlICptZGV2X2dldF9pb21tdV9kZXZp
Y2Uoc3RydWN0IGRldmljZSAqZGV2KTsKICAqCQkJQG1kZXY6IG1kZXZfZGV2aWNlIGRldmljZSBz
dHJ1Y3R1cmUgd2hpY2ggaXMgYmVpbmcKICAqCQkJICAgICAgIGRlc3Ryb3llZAogICoJCQlSZXR1
cm5zIGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9yICg8IDApCi0gKiBAb3BlbjoJCU9wZW4g
bWVkaWF0ZWQgZGV2aWNlLgotICoJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlLgotICoJCQlSZXR1
cm5zIGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9yICg8IDApCi0gKiBAcmVsZWFzZToJCXJl
bGVhc2UgbWVkaWF0ZWQgZGV2aWNlCi0gKgkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UuCi0gKiBA
cmVhZDoJCVJlYWQgZW11bGF0aW9uIGNhbGxiYWNrCi0gKgkJCUBtZGV2OiBtZWRpYXRlZCBkZXZp
Y2Ugc3RydWN0dXJlCi0gKgkJCUBidWY6IHJlYWQgYnVmZmVyCi0gKgkJCUBjb3VudDogbnVtYmVy
IG9mIGJ5dGVzIHRvIHJlYWQKLSAqCQkJQHBwb3M6IGFkZHJlc3MuCi0gKgkJCVJldHVucyBudW1i
ZXIgb24gYnl0ZXMgcmVhZCBvbiBzdWNjZXNzIG9yIGVycm9yLgotICogQHdyaXRlOgkJV3JpdGUg
ZW11bGF0aW9uIGNhbGxiYWNrCi0gKgkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2Ugc3RydWN0dXJl
Ci0gKgkJCUBidWY6IHdyaXRlIGJ1ZmZlcgotICoJCQlAY291bnQ6IG51bWJlciBvZiBieXRlcyB0
byBiZSB3cml0dGVuCi0gKgkJCUBwcG9zOiBhZGRyZXNzLgotICoJCQlSZXR1bnMgbnVtYmVyIG9u
IGJ5dGVzIHdyaXR0ZW4gb24gc3VjY2VzcyBvciBlcnJvci4KLSAqIEBpb2N0bDoJCUlPQ1RMIGNh
bGxiYWNrCi0gKgkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2Ugc3RydWN0dXJlCi0gKgkJCUBjbWQ6
IGlvY3RsIGNvbW1hbmQKLSAqCQkJQGFyZzogYXJndW1lbnRzIHRvIGlvY3RsCi0gKiBAbW1hcDoJ
CW1tYXAgY2FsbGJhY2sKLSAqCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZSBzdHJ1Y3R1cmUKLSAq
CQkJQHZtYTogdm1hIHN0cnVjdHVyZQorICogQGRldmljZV9vcHM6ICAgICAgICAgRGV2aWNlIHNw
ZWNpZmljIGVtdWxhdGlvbiBjYWxsYmFjay4KKyAqCiAgKiBQYXJlbnQgZGV2aWNlIHRoYXQgc3Vw
cG9ydCBtZWRpYXRlZCBkZXZpY2Ugc2hvdWxkIGJlIHJlZ2lzdGVyZWQgd2l0aCBtZGV2CiAgKiBt
b2R1bGUgd2l0aCBtZGV2X3BhcmVudF9vcHMgc3RydWN0dXJlLgogICoqLwpAQCAtODMsMTUgKzYx
LDcgQEAgc3RydWN0IG1kZXZfcGFyZW50X29wcyB7CiAKIAlpbnQgICAgICgqY3JlYXRlKShzdHJ1
Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKIAlpbnQgICAgICgq
cmVtb3ZlKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwotCWludCAgICAgKCpvcGVuKShzdHJ1
Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwotCXZvaWQgICAgKCpyZWxlYXNlKShzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYpOwotCXNzaXplX3QgKCpyZWFkKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYs
IGNoYXIgX191c2VyICpidWYsCi0JCQlzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcyk7Ci0Jc3Np
emVfdCAoKndyaXRlKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIGNvbnN0IGNoYXIgX191c2Vy
ICpidWYsCi0JCQkgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpOwotCWxvbmcJKCppb2N0bCko
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25lZCBpbnQgY21kLAotCQkJIHVuc2lnbmVk
IGxvbmcgYXJnKTsKLQlpbnQJKCptbWFwKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKKwljb25zdCB2b2lkICpkZXZpY2Vfb3BzOwogfTsKIAog
LyogaW50ZXJmYWNlIGZvciBleHBvcnRpbmcgbWRldiBzdXBwb3J0ZWQgdHlwZSBhdHRyaWJ1dGVz
ICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZmaW9fbWRldi5oIGIvaW5jbHVkZS9saW51
eC92ZmlvX21kZXYuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjBj
MWIzNGY5OGY1ZAotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvbGludXgvdmZpb19tZGV2LmgK
QEAgLTAsMCArMSw1MyBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSAqLworLyoKKyAqIFZGSU8gTWVkaWF0ZWQgZGV2aWNlIGRlZmluaXRpb24KKyAqLworCisjaWZu
ZGVmIFZGSU9fTURFVl9ICisjZGVmaW5lIFZGSU9fTURFVl9ICisKKyNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPgorI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KKworLyoqCisgKiBzdHJ1Y3QgdmZpb19t
ZGV2X3BhcmVudF9vcHMgLSBTdHJ1Y3R1cmUgdG8gYmUgcmVnaXN0ZXJlZCBmb3IgZWFjaAorICog
cGFyZW50IGRldmljZSB0byByZWdpc3RlciB0aGUgZGV2aWNlIHRvIHZmaW8tbWRldiBtb2R1bGUu
CisgKgorICogQG9wZW46CQlPcGVuIG1lZGlhdGVkIGRldmljZS4KKyAqCQkJQG1kZXY6IG1lZGlh
dGVkIGRldmljZS4KKyAqCQkJUmV0dXJucyBpbnRlZ2VyOiBzdWNjZXNzICgwKSBvciBlcnJvciAo
PCAwKQorICogQHJlbGVhc2U6CQlyZWxlYXNlIG1lZGlhdGVkIGRldmljZQorICoJCQlAbWRldjog
bWVkaWF0ZWQgZGV2aWNlLgorICogQHJlYWQ6CQlSZWFkIGVtdWxhdGlvbiBjYWxsYmFjaworICoJ
CQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlIHN0cnVjdHVyZQorICoJCQlAYnVmOiByZWFkIGJ1ZmZl
cgorICoJCQlAY291bnQ6IG51bWJlciBvZiBieXRlcyB0byByZWFkCisgKgkJCUBwcG9zOiBhZGRy
ZXNzLgorICoJCQlSZXR1bnMgbnVtYmVyIG9uIGJ5dGVzIHJlYWQgb24gc3VjY2VzcyBvciBlcnJv
ci4KKyAqIEB3cml0ZToJCVdyaXRlIGVtdWxhdGlvbiBjYWxsYmFjaworICoJCQlAbWRldjogbWVk
aWF0ZWQgZGV2aWNlIHN0cnVjdHVyZQorICoJCQlAYnVmOiB3cml0ZSBidWZmZXIKKyAqCQkJQGNv
dW50OiBudW1iZXIgb2YgYnl0ZXMgdG8gYmUgd3JpdHRlbgorICoJCQlAcHBvczogYWRkcmVzcy4K
KyAqCQkJUmV0dW5zIG51bWJlciBvbiBieXRlcyB3cml0dGVuIG9uIHN1Y2Nlc3Mgb3IgZXJyb3Iu
CisgKiBAaW9jdGw6CQlJT0NUTCBjYWxsYmFjaworICoJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNl
IHN0cnVjdHVyZQorICoJCQlAY21kOiBpb2N0bCBjb21tYW5kCisgKgkJCUBhcmc6IGFyZ3VtZW50
cyB0byBpb2N0bAorICogQG1tYXA6CQltbWFwIGNhbGxiYWNrCisgKgkJCUBtZGV2OiBtZWRpYXRl
ZCBkZXZpY2Ugc3RydWN0dXJlCisgKgkJCUB2bWE6IHZtYSBzdHJ1Y3R1cmUKKyAqLworc3RydWN0
IHZmaW9fbWRldl9wYXJlbnRfb3BzIHsKKwlpbnQgICAgICgqb3Blbikoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2KTsKKwl2b2lkICAgICgqcmVsZWFzZSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
KTsKKwlzc2l6ZV90ICgqcmVhZCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBjaGFyIF9fdXNl
ciAqYnVmLAorCQkJc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpOworCXNzaXplX3QgKCp3cml0
ZSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAorCQkJ
IHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKTsKKwlsb25nCSgqaW9jdGwpKHN0cnVjdCBtZGV2
X2RldmljZSAqbWRldiwgdW5zaWduZWQgaW50IGNtZCwKKwkJCSB1bnNpZ25lZCBsb25nIGFyZyk7
CisJaW50CSgqbW1hcCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSk7Cit9OworCisjZW5kaWYKZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2
L21ib2Nocy5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKaW5kZXggNzFhNDQ2OWJlODVk
Li4xMDdjYzMwZDBmNDUgMTAwNjQ0Ci0tLSBhL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCisr
KyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCkBAIC0zMCw2ICszMCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvaW9tbXUuaD4KICNpbmNsdWRlIDxsaW51eC9zeXNmcy5oPgogI2luY2x1ZGUgPGxp
bnV4L21kZXYuaD4KKyNpbmNsdWRlIDxsaW51eC92ZmlvX21kZXYuaD4KICNpbmNsdWRlIDxsaW51
eC9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+CiAjaW5jbHVkZSA8bGludXgvaGln
aG1lbS5oPgpAQCAtMTQxOCwxMiArMTQxOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlX2dy
b3VwICptZGV2X3R5cGVfZ3JvdXBzW10gPSB7CiAJTlVMTCwKIH07CiAKLXN0YXRpYyBjb25zdCBz
dHJ1Y3QgbWRldl9wYXJlbnRfb3BzIG1kZXZfZm9wcyA9IHsKLQkub3duZXIJCQk9IFRISVNfTU9E
VUxFLAotCS5tZGV2X2F0dHJfZ3JvdXBzCT0gbWRldl9kZXZfZ3JvdXBzLAotCS5zdXBwb3J0ZWRf
dHlwZV9ncm91cHMJPSBtZGV2X3R5cGVfZ3JvdXBzLAotCS5jcmVhdGUJCQk9IG1ib2Noc19jcmVh
dGUsCi0JLnJlbW92ZQkJCT0gbWJvY2hzX3JlbW92ZSwKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmZp
b19tZGV2X3BhcmVudF9vcHMgdmZpb19tZGV2X29wcyA9IHsKIAkub3BlbgkJCT0gbWJvY2hzX29w
ZW4sCiAJLnJlbGVhc2UJCT0gbWJvY2hzX2Nsb3NlLAogCS5yZWFkCQkJPSBtYm9jaHNfcmVhZCwK
QEAgLTE0MzIsNiArMTQyOCwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29w
cyBtZGV2X2ZvcHMgPSB7CiAJLm1tYXAJCQk9IG1ib2Noc19tbWFwLAogfTsKIAorc3RhdGljIGNv
bnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0geworCS5vd25lcgkJCT0gVEhJ
U19NT0RVTEUsCisJLm1kZXZfYXR0cl9ncm91cHMJPSBtZGV2X2Rldl9ncm91cHMsCisJLnN1cHBv
cnRlZF90eXBlX2dyb3Vwcwk9IG1kZXZfdHlwZV9ncm91cHMsCisJLmNyZWF0ZQkJCT0gbWJvY2hz
X2NyZWF0ZSwKKwkucmVtb3ZlCQkJPSBtYm9jaHNfcmVtb3ZlLAorCS5kZXZpY2Vfb3BzCQk9ICZ2
ZmlvX21kZXZfb3BzLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMg
dmRfZm9wcyA9IHsKIAkub3duZXIJCT0gVEhJU19NT0RVTEUsCiB9OwpkaWZmIC0tZ2l0IGEvc2Ft
cGxlcy92ZmlvLW1kZXYvbWRweS5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jCmluZGV4IGQz
MDI5ZGQyN2Q5MS4uMmNkMjAxOGE1M2Y5IDEwMDY0NAotLS0gYS9zYW1wbGVzL3ZmaW8tbWRldi9t
ZHB5LmMKKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jCkBAIC0yNiw2ICsyNiw3IEBACiAj
aW5jbHVkZSA8bGludXgvaW9tbXUuaD4KICNpbmNsdWRlIDxsaW51eC9zeXNmcy5oPgogI2luY2x1
ZGUgPGxpbnV4L21kZXYuaD4KKyNpbmNsdWRlIDxsaW51eC92ZmlvX21kZXYuaD4KICNpbmNsdWRl
IDxsaW51eC9wY2kuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPgogI2luY2x1ZGUgIm1k
cHktZGVmcy5oIgpAQCAtNzI1LDEyICs3MjYsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9n
cm91cCAqbWRldl90eXBlX2dyb3Vwc1tdID0gewogCU5VTEwsCiB9OwogCi1zdGF0aWMgY29uc3Qg
c3RydWN0IG1kZXZfcGFyZW50X29wcyBtZGV2X2ZvcHMgPSB7Ci0JLm93bmVyCQkJPSBUSElTX01P
RFVMRSwKLQkubWRldl9hdHRyX2dyb3Vwcwk9IG1kZXZfZGV2X2dyb3VwcywKLQkuc3VwcG9ydGVk
X3R5cGVfZ3JvdXBzCT0gbWRldl90eXBlX2dyb3VwcywKLQkuY3JlYXRlCQkJPSBtZHB5X2NyZWF0
ZSwKLQkucmVtb3ZlCQkJPSBtZHB5X3JlbW92ZSwKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19t
ZGV2X3BhcmVudF9vcHMgdmZpb19tZGV2X29wcyA9IHsKIAkub3BlbgkJCT0gbWRweV9vcGVuLAog
CS5yZWxlYXNlCQk9IG1kcHlfY2xvc2UsCiAJLnJlYWQJCQk9IG1kcHlfcmVhZCwKQEAgLTczOSw2
ICs3MzUsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3Bz
ID0gewogCS5tbWFwCQkJPSBtZHB5X21tYXAsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IG1k
ZXZfcGFyZW50X29wcyBtZGV2X2ZvcHMgPSB7CisJLm93bmVyCQkJPSBUSElTX01PRFVMRSwKKwku
bWRldl9hdHRyX2dyb3Vwcwk9IG1kZXZfZGV2X2dyb3VwcywKKwkuc3VwcG9ydGVkX3R5cGVfZ3Jv
dXBzCT0gbWRldl90eXBlX2dyb3VwcywKKwkuY3JlYXRlCQkJPSBtZHB5X2NyZWF0ZSwKKwkucmVt
b3ZlCQkJPSBtZHB5X3JlbW92ZSwKKwkuZGV2aWNlX29wcwkJPSAmdmZpb19tZGV2X29wcywKK307
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHZkX2ZvcHMgPSB7CiAJLm93
bmVyCQk9IFRISVNfTU9EVUxFLAogfTsKZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L210
dHkuYyBiL3NhbXBsZXMvdmZpby1tZGV2L210dHkuYwppbmRleCA3NDRjODhhNmIyMmMuLmU0Mjc0
MjViNWRhZiAxMDA2NDQKLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jCisrKyBiL3NhbXBs
ZXMvdmZpby1tZGV2L210dHkuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2N0
eXBlLmg+CiAjaW5jbHVkZSA8bGludXgvZmlsZS5oPgogI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4K
KyNpbmNsdWRlIDxsaW51eC92ZmlvX21kZXYuaD4KICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KICNp
bmNsdWRlIDxsaW51eC9zZXJpYWwuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3NlcmlhbF9yZWcu
aD4KQEAgLTE0MTAsNiArMTQxMSwxNCBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAq
bWRldl90eXBlX2dyb3Vwc1tdID0gewogCU5VTEwsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0
IHZmaW9fbWRldl9wYXJlbnRfb3BzIHZmaW9fbWRldl9vcHMgPSB7CisJLm9wZW4gICAgICAgICAg
ICAgICAgICAgPSBtdHR5X29wZW4sCisJLnJlbGVhc2UgICAgICAgICAgICAgICAgPSBtdHR5X2Ns
b3NlLAorCS5yZWFkICAgICAgICAgICAgICAgICAgID0gbXR0eV9yZWFkLAorCS53cml0ZSAgICAg
ICAgICAgICAgICAgID0gbXR0eV93cml0ZSwKKwkuaW9jdGwJCSAgICAgICAgPSBtdHR5X2lvY3Rs
LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0g
ewogCS5vd25lciAgICAgICAgICAgICAgICAgID0gVEhJU19NT0RVTEUsCiAJLmRldl9hdHRyX2dy
b3VwcyAgICAgICAgPSBtdHR5X2Rldl9ncm91cHMsCkBAIC0xNDE3LDExICsxNDI2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0gewogCS5zdXBwb3J0
ZWRfdHlwZV9ncm91cHMgID0gbWRldl90eXBlX2dyb3VwcywKIAkuY3JlYXRlICAgICAgICAgICAg
ICAgICA9IG10dHlfY3JlYXRlLAogCS5yZW1vdmUJCQk9IG10dHlfcmVtb3ZlLAotCS5vcGVuICAg
ICAgICAgICAgICAgICAgID0gbXR0eV9vcGVuLAotCS5yZWxlYXNlICAgICAgICAgICAgICAgID0g
bXR0eV9jbG9zZSwKLQkucmVhZCAgICAgICAgICAgICAgICAgICA9IG10dHlfcmVhZCwKLQkud3Jp
dGUgICAgICAgICAgICAgICAgICA9IG10dHlfd3JpdGUsCi0JLmlvY3RsCQkgICAgICAgID0gbXR0
eV9pb2N0bCwKKwkuZGV2aWNlX29wcyAgICAgICAgICAgICA9ICZ2ZmlvX21kZXZfb3BzLAogfTsK
IAogc3RhdGljIHZvaWQgbXR0eV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
