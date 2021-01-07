Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A82ECB73
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Jan 2021 09:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901256E413;
	Thu,  7 Jan 2021 08:07:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4728889CA8;
 Thu,  7 Jan 2021 08:07:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0F35AE61;
 Thu,  7 Jan 2021 08:07:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v3 2/8] drm/amdgpu: Remove references to struct drm_device.pdev
Date: Thu,  7 Jan 2021 09:07:42 +0100
Message-Id: <20210107080748.4768-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107080748.4768-1-tzimmermann@suse.de>
References: <20210107080748.4768-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gvt-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VXNpbmcgc3RydWN0IGRybV9kZXZpY2UucGRldiBpcyBkZXByZWNhdGVkLiBDb252ZXJ0IGFtZGdw
dSB0byBzdHJ1Y3QKZHJtX2RldmljZS5kZXYuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCnYzOgoJ
KiByZWJhc2VkCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
QWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgIHwgMTcgKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ZiLmMgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgICAgIHwgMTAgKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2kyYy5jICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMgICAgIHwgMTAgKysrKystLS0tLQogNyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKaW5kZXggN2QxNjM5NWVkZTBhLi5mN2UyYTg3ODQxMWUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE0MjMsOSArMTQyMyw5IEBAIHN0
YXRpYyB2b2lkIGFtZGdwdV9zd2l0Y2hlcm9vX3NldF9zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRl
diwKIAkJLyogZG9uJ3Qgc3VzcGVuZCBvciByZXN1bWUgY2FyZCBub3JtYWxseSAqLwogCQlkZXYt
PnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hfUE9XRVJfQ0hBTkdJTkc7CiAKLQkJcGNp
X3NldF9wb3dlcl9zdGF0ZShkZXYtPnBkZXYsIFBDSV9EMCk7Ci0JCWFtZGdwdV9kZXZpY2VfbG9h
ZF9wY2lfc3RhdGUoZGV2LT5wZGV2KTsKLQkJciA9IHBjaV9lbmFibGVfZGV2aWNlKGRldi0+cGRl
dik7CisJCXBjaV9zZXRfcG93ZXJfc3RhdGUocGRldiwgUENJX0QwKTsKKwkJYW1kZ3B1X2Rldmlj
ZV9sb2FkX3BjaV9zdGF0ZShwZGV2KTsKKwkJciA9IHBjaV9lbmFibGVfZGV2aWNlKHBkZXYpOwog
CQlpZiAocikKIAkJCURSTV9XQVJOKCJwY2lfZW5hYmxlX2RldmljZSBmYWlsZWQgKCVkKVxuIiwg
cik7CiAJCWFtZGdwdV9kZXZpY2VfcmVzdW1lKGRldiwgdHJ1ZSk7CkBAIC0xNDM3LDEwICsxNDM3
LDEwIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9zd2l0Y2hlcm9vX3NldF9zdGF0ZShzdHJ1Y3QgcGNp
X2RldiAqcGRldiwKIAkJZHJtX2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKGRldik7CiAJCWRldi0+
c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9QT1dFUl9DSEFOR0lORzsKIAkJYW1kZ3B1
X2RldmljZV9zdXNwZW5kKGRldiwgdHJ1ZSk7Ci0JCWFtZGdwdV9kZXZpY2VfY2FjaGVfcGNpX3N0
YXRlKGRldi0+cGRldik7CisJCWFtZGdwdV9kZXZpY2VfY2FjaGVfcGNpX3N0YXRlKHBkZXYpOwog
CQkvKiBTaHV0IGRvd24gdGhlIGRldmljZSAqLwotCQlwY2lfZGlzYWJsZV9kZXZpY2UoZGV2LT5w
ZGV2KTsKLQkJcGNpX3NldF9wb3dlcl9zdGF0ZShkZXYtPnBkZXYsIFBDSV9EM2NvbGQpOworCQlw
Y2lfZGlzYWJsZV9kZXZpY2UocGRldik7CisJCXBjaV9zZXRfcG93ZXJfc3RhdGUocGRldiwgUENJ
X0QzY29sZCk7CiAJCWRldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9QT1dFUl9P
RkY7CiAJfQogfQpAQCAtMTcwMyw4ICsxNzAzLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2Rldmlj
ZV9lbmFibGVfdmlydHVhbF9kaXNwbGF5KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWFk
ZXYtPmVuYWJsZV92aXJ0dWFsX2Rpc3BsYXkgPSBmYWxzZTsKIAogCWlmIChhbWRncHVfdmlydHVh
bF9kaXNwbGF5KSB7Ci0JCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYWRldl90b19kcm0oYWRl
dik7Ci0JCWNvbnN0IGNoYXIgKnBjaV9hZGRyZXNzX25hbWUgPSBwY2lfbmFtZShkZGV2LT5wZGV2
KTsKKwkJY29uc3QgY2hhciAqcGNpX2FkZHJlc3NfbmFtZSA9IHBjaV9uYW1lKGFkZXYtPnBkZXYp
OwogCQljaGFyICpwY2lhZGRzdHIsICpwY2lhZGRzdHJfdG1wLCAqcGNpYWRkbmFtZV90bXAsICpw
Y2lhZGRuYW1lOwogCiAJCXBjaWFkZHN0ciA9IGtzdHJkdXAoYW1kZ3B1X3ZpcnR1YWxfZGlzcGxh
eSwgR0ZQX0tFUk5FTCk7CkBAIC0zMzk3LDcgKzMzOTYsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQl9CiAJfQogCi0JcGNpX2VuYWJsZV9w
Y2llX2Vycm9yX3JlcG9ydGluZyhhZGV2LT5kZGV2LnBkZXYpOworCXBjaV9lbmFibGVfcGNpZV9l
cnJvcl9yZXBvcnRpbmcoYWRldi0+cGRldik7CiAKIAkvKiBQb3N0IGNhcmQgaWYgbmVjZXNzYXJ5
ICovCiAJaWYgKGFtZGdwdV9kZXZpY2VfbmVlZF9wb3N0KGFkZXYpKSB7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwppbmRleCBmNzY0ODAzYzUzYTQuLjAxNTBh
NTFiNjVlZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5j
CkBAIC05MjYsNiArOTI2LDcgQEAgYW1kZ3B1X2Rpc3BsYXlfdXNlcl9mcmFtZWJ1ZmZlcl9jcmVh
dGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQkgICAgICAgc3RydWN0IGRybV9maWxlICpm
aWxlX3ByaXYsCiAJCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2Rl
X2NtZCkKIHsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRybV90b19hZGV2KGRldik7
CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7CiAJc3RydWN0IGFtZGdwdV9mcmFtZWJ1ZmZl
ciAqYW1kZ3B1X2ZiOwogCWludCByZXQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKaW5kZXggNzJlZmQ1NzllYzVlLi5iNGVhNjdlMTJhZGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEyMDQsNyArMTIwNCw2IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlpZiAocmV0KQogCQlyZXR1
cm4gcmV0OwogCi0JZGRldi0+cGRldiA9IHBkZXY7CiAJcGNpX3NldF9kcnZkYXRhKHBkZXYsIGRk
ZXYpOwogCiAJcmV0ID0gYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcyhhZGV2LCBlbnQtPmRyaXZlcl9k
YXRhKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMKaW5kZXggMGJmN2QzNmM2
Njg2Li41MWNkNDljNmYzOGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5j
CkBAIC0yNzEsNyArMjcxLDcgQEAgc3RhdGljIGludCBhbWRncHVmYl9jcmVhdGUoc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmhlbHBlciwKIAlEUk1fSU5GTygiZmIgZGVwdGggaXMgJWRcbiIsIGZiLT5m
b3JtYXQtPmRlcHRoKTsKIAlEUk1fSU5GTygiICAgcGl0Y2ggaXMgJWRcbiIsIGZiLT5waXRjaGVz
WzBdKTsKIAotCXZnYV9zd2l0Y2hlcm9vX2NsaWVudF9mYl9zZXQoYWRldl90b19kcm0oYWRldikt
PnBkZXYsIGluZm8pOworCXZnYV9zd2l0Y2hlcm9vX2NsaWVudF9mYl9zZXQoYWRldi0+cGRldiwg
aW5mbyk7CiAJcmV0dXJuIDA7CiAKIG91dDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYwppbmRleCBkMGExZmVlMWY1ZjYuLmE1YzQyYzMwMDRhMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwpAQCAtNjE5LDcgKzYxOSw3IEBAIGludCBhbWRncHVf
Z2VtX3ZhX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaW50IHIg
PSAwOwogCiAJaWYgKGFyZ3MtPnZhX2FkZHJlc3MgPCBBTURHUFVfVkFfUkVTRVJWRURfU0laRSkg
ewotCQlkZXZfZGJnKCZkZXYtPnBkZXYtPmRldiwKKwkJZGV2X2RiZyhkZXYtPmRldiwKIAkJCSJ2
YV9hZGRyZXNzIDB4JUxYIGlzIGluIHJlc2VydmVkIGFyZWEgMHglTFhcbiIsCiAJCQlhcmdzLT52
YV9hZGRyZXNzLCBBTURHUFVfVkFfUkVTRVJWRURfU0laRSk7CiAJCXJldHVybiAtRUlOVkFMOwpA
QCAtNjI3LDcgKzYyNyw3IEBAIGludCBhbWRncHVfZ2VtX3ZhX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAKIAlpZiAoYXJncy0+dmFfYWRkcmVzcyA+PSBBTURHUFVf
R01DX0hPTEVfU1RBUlQgJiYKIAkgICAgYXJncy0+dmFfYWRkcmVzcyA8IEFNREdQVV9HTUNfSE9M
RV9FTkQpIHsKLQkJZGV2X2RiZygmZGV2LT5wZGV2LT5kZXYsCisJCWRldl9kYmcoZGV2LT5kZXYs
CiAJCQkidmFfYWRkcmVzcyAweCVMWCBpcyBpbiBWQSBob2xlIDB4JUxYLTB4JUxYXG4iLAogCQkJ
YXJncy0+dmFfYWRkcmVzcywgQU1ER1BVX0dNQ19IT0xFX1NUQVJULAogCQkJQU1ER1BVX0dNQ19I
T0xFX0VORCk7CkBAIC02MzksMTQgKzYzOSwxNCBAQCBpbnQgYW1kZ3B1X2dlbV92YV9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXZtX3NpemUgPSBhZGV2LT52bV9t
YW5hZ2VyLm1heF9wZm4gKiBBTURHUFVfR1BVX1BBR0VfU0laRTsKIAl2bV9zaXplIC09IEFNREdQ
VV9WQV9SRVNFUlZFRF9TSVpFOwogCWlmIChhcmdzLT52YV9hZGRyZXNzICsgYXJncy0+bWFwX3Np
emUgPiB2bV9zaXplKSB7Ci0JCWRldl9kYmcoJmRldi0+cGRldi0+ZGV2LAorCQlkZXZfZGJnKGRl
di0+ZGV2LAogCQkJInZhX2FkZHJlc3MgMHglbGx4IGlzIGluIHRvcCByZXNlcnZlZCBhcmVhIDB4
JWxseFxuIiwKIAkJCWFyZ3MtPnZhX2FkZHJlc3MgKyBhcmdzLT5tYXBfc2l6ZSwgdm1fc2l6ZSk7
CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAogCWlmICgoYXJncy0+ZmxhZ3MgJiB+dmFsaWRfZmxh
Z3MpICYmIChhcmdzLT5mbGFncyAmIH5wcnRfZmxhZ3MpKSB7Ci0JCWRldl9kYmcoJmRldi0+cGRl
di0+ZGV2LCAiaW52YWxpZCBmbGFncyBjb21iaW5hdGlvbiAweCUwOFhcbiIsCisJCWRldl9kYmco
ZGV2LT5kZXYsICJpbnZhbGlkIGZsYWdzIGNvbWJpbmF0aW9uIDB4JTA4WFxuIiwKIAkJCWFyZ3Mt
PmZsYWdzKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQpAQCAtNjU4LDcgKzY1OCw3IEBAIGludCBh
bWRncHVfZ2VtX3ZhX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJ
Y2FzZSBBTURHUFVfVkFfT1BfUkVQTEFDRToKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLQkJZGV2X2Ri
ZygmZGV2LT5wZGV2LT5kZXYsICJ1bnN1cHBvcnRlZCBvcGVyYXRpb24gJWRcbiIsCisJCWRldl9k
YmcoZGV2LT5kZXYsICJ1bnN1cHBvcnRlZCBvcGVyYXRpb24gJWRcbiIsCiAJCQlhcmdzLT5vcGVy
YXRpb24pOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaTJjLmMKaW5kZXggNDdjYWQyM2E2YjllLi5iY2E0ZGRkZDVhMTUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pMmMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaTJjLmMKQEAgLTE3Niw3ICsxNzYsNyBAQCBzdHJ1Y3Qg
YW1kZ3B1X2kyY19jaGFuICphbWRncHVfaTJjX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAogCWkyYy0+cmVjID0gKnJlYzsKIAlpMmMtPmFkYXB0ZXIub3duZXIgPSBUSElTX01PRFVMRTsK
IAlpMmMtPmFkYXB0ZXIuY2xhc3MgPSBJMkNfQ0xBU1NfRERDOwotCWkyYy0+YWRhcHRlci5kZXYu
cGFyZW50ID0gJmRldi0+cGRldi0+ZGV2OworCWkyYy0+YWRhcHRlci5kZXYucGFyZW50ID0gZGV2
LT5kZXY7CiAJaTJjLT5kZXYgPSBkZXY7CiAJaTJjX3NldF9hZGFwZGF0YSgmaTJjLT5hZGFwdGVy
LCBpMmMpOwogCW11dGV4X2luaXQoJmkyYy0+bXV0ZXgpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ttcy5jCmluZGV4IGIxNmIzMjc5NzYyNC4uM2MzN2NmMWFlOGI3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCkBAIC0xNDIsNyArMTQyLDcgQEAgaW50
IGFtZGdwdV9kcml2ZXJfbG9hZF9rbXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2ln
bmVkIGxvbmcgZmxhZ3MpCiAJICAgIChhbWRncHVfaXNfYXRweF9oeWJyaWQoKSB8fAogCSAgICAg
YW1kZ3B1X2hhc19hdHB4X2RncHVfcG93ZXJfY250bCgpKSAmJgogCSAgICAoKGZsYWdzICYgQU1E
X0lTX0FQVSkgPT0gMCkgJiYKLQkgICAgIXBjaV9pc190aHVuZGVyYm9sdF9hdHRhY2hlZChkZXYt
PnBkZXYpKQorCSAgICAhcGNpX2lzX3RodW5kZXJib2x0X2F0dGFjaGVkKHRvX3BjaV9kZXYoZGV2
LT5kZXYpKSkKIAkJZmxhZ3MgfD0gQU1EX0lTX1BYOwogCiAJcGFyZW50ID0gcGNpX3Vwc3RyZWFt
X2JyaWRnZShhZGV2LT5wZGV2KTsKQEAgLTE1Niw3ICsxNTYsNyBAQCBpbnQgYW1kZ3B1X2RyaXZl
cl9sb2FkX2ttcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbG9uZyBmbGFn
cykKIAkgKi8KIAlyID0gYW1kZ3B1X2RldmljZV9pbml0KGFkZXYsIGZsYWdzKTsKIAlpZiAocikg
ewotCQlkZXZfZXJyKCZkZXYtPnBkZXYtPmRldiwgIkZhdGFsIGVycm9yIGR1cmluZyBHUFUgaW5p
dFxuIik7CisJCWRldl9lcnIoZGV2LT5kZXYsICJGYXRhbCBlcnJvciBkdXJpbmcgR1BVIGluaXRc
biIpOwogCQlnb3RvIG91dDsKIAl9CiAKQEAgLTE5OSw3ICsxOTksNyBAQCBpbnQgYW1kZ3B1X2Ry
aXZlcl9sb2FkX2ttcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbG9uZyBm
bGFncykKIAogCWFjcGlfc3RhdHVzID0gYW1kZ3B1X2FjcGlfaW5pdChhZGV2KTsKIAlpZiAoYWNw
aV9zdGF0dXMpCi0JCWRldl9kYmcoJmRldi0+cGRldi0+ZGV2LCAiRXJyb3IgZHVyaW5nIEFDUEkg
bWV0aG9kcyBjYWxsXG4iKTsKKwkJZGV2X2RiZyhkZXYtPmRldiwgIkVycm9yIGR1cmluZyBBQ1BJ
IG1ldGhvZHMgY2FsbFxuIik7CiAKIAlpZiAoYWRldi0+cnVucG0pIHsKIAkJLyogb25seSBuZWVk
IHRvIHNraXAgb24gQVRQWCAqLwpAQCAtNzM1LDEwICs3MzUsMTAgQEAgaW50IGFtZGdwdV9pbmZv
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmls
ZSAqZmlscCkKIAkJaWYgKCFkZXZfaW5mbykKIAkJCXJldHVybiAtRU5PTUVNOwogCi0JCWRldl9p
bmZvLT5kZXZpY2VfaWQgPSBkZXYtPnBkZXYtPmRldmljZTsKKwkJZGV2X2luZm8tPmRldmljZV9p
ZCA9IGFkZXYtPnBkZXYtPmRldmljZTsKIAkJZGV2X2luZm8tPmNoaXBfcmV2ID0gYWRldi0+cmV2
X2lkOwogCQlkZXZfaW5mby0+ZXh0ZXJuYWxfcmV2ID0gYWRldi0+ZXh0ZXJuYWxfcmV2X2lkOwot
CQlkZXZfaW5mby0+cGNpX3JldiA9IGRldi0+cGRldi0+cmV2aXNpb247CisJCWRldl9pbmZvLT5w
Y2lfcmV2ID0gYWRldi0+cGRldi0+cmV2aXNpb247CiAJCWRldl9pbmZvLT5mYW1pbHkgPSBhZGV2
LT5mYW1pbHk7CiAJCWRldl9pbmZvLT5udW1fc2hhZGVyX2VuZ2luZXMgPSBhZGV2LT5nZnguY29u
ZmlnLm1heF9zaGFkZXJfZW5naW5lczsKIAkJZGV2X2luZm8tPm51bV9zaGFkZXJfYXJyYXlzX3Bl
cl9lbmdpbmUgPSBhZGV2LT5nZnguY29uZmlnLm1heF9zaF9wZXJfc2U7Ci0tIAoyLjI5LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
