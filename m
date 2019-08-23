Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CF9A8DA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Aug 2019 09:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680246EBD3;
	Fri, 23 Aug 2019 07:32:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9024E6EBD3;
 Fri, 23 Aug 2019 07:32:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 22:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; d="scan'208";a="208429209"
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.72])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2019 22:23:28 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: to make vgpu ppgtt notificaiton as atomic operation
Date: Fri, 23 Aug 2019 13:23:12 +0800
Message-Id: <1566537792-12728-1-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, stable@vger.kernel.org,
 zhenyu.z.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

dmdwdSBwcGd0dCBub3RpZmljYXRpb24gd2FzIHNwbGl0IGludG8gMiBzdGVwcywgdGhlIGZpcnN0
IHN0ZXAgaXMgdG8KdXBkYXRlIFBWSU5GTydzIHBkcCByZWdpc3RlciBhbmQgdGhlbiB3cml0ZSBQ
VklORk8ncyBnMnZfbm90aWZ5IHJlZ2lzdGVyCndpdGggYWN0aW9uIGNvZGUgdG8gdGlyZ2dlciBw
cGd0dCBub3RpZmljYXRpb24gdG8gR1ZUIHNpZGUuCgpjdXJyZW50bHkgdGhlc2Ugc3RlcHMgd2Vy
ZSBub3QgYXRvbWljIG9wZXJhdGlvbnMgZHVlIHRvIG5vIGFueSBwcm90ZWN0aW9uLApzbyBpdCBp
cyBlYXN5IHRvIGVudGVyIHJhY2UgY29uZGl0aW9uIHN0YXRlIGR1cmluZyB0aGUgTVRCRiwgc3Ry
ZXNzIGFuZApJR1QgdGVzdCB0byBjYXVzZSBHUFUgaGFuZy4KCnRoZSBzb2x1dGlvbiBpcyB0byBh
ZGQgYSBsb2NrIHRvIG1ha2UgdmdwdSBwcGd0dCBub3RpY2F0aW9uIGFzIGF0b21pYwpvcGVyYXRp
b24uCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpo
YW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2Rydi5oICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMg
fCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jICAgIHwgMSArCiAzIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCmluZGV4
IGViMzFjMTYuLjMyZTE3YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaApAQCAtOTYxLDYgKzk2
MSw3IEBAIHN0cnVjdCBpOTE1X2Zyb250YnVmZmVyX3RyYWNraW5nIHsKIH07CiAKIHN0cnVjdCBp
OTE1X3ZpcnR1YWxfZ3B1IHsKKwlzdHJ1Y3QgbXV0ZXggbG9jazsKIAlib29sIGFjdGl2ZTsKIAl1
MzIgY2FwczsKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9n
dHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jCmluZGV4IDJjZDJkYWIu
LjFiYjkzYjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jCkBAIC04MzMsNiArODMz
LDggQEAgc3RhdGljIGludCBnZW44X3BwZ3R0X25vdGlmeV92Z3Qoc3RydWN0IGk5MTVfcHBndHQg
KnBwZ3R0LCBib29sIGNyZWF0ZSkKIAllbnVtIHZndF9nMnZfdHlwZSBtc2c7CiAJaW50IGk7CiAK
KwltdXRleF9sb2NrKCZkZXZfcHJpdi0+dmdwdS5sb2NrKTsKKwogCWlmIChjcmVhdGUpCiAJCWF0
b21pY19pbmMocHhfdXNlZChwcGd0dC0+cGQpKTsgLyogbmV2ZXIgcmVtb3ZlICovCiAJZWxzZQpA
QCAtODYwLDYgKzg2Miw4IEBAIHN0YXRpYyBpbnQgZ2VuOF9wcGd0dF9ub3RpZnlfdmd0KHN0cnVj
dCBpOTE1X3BwZ3R0ICpwcGd0dCwgYm9vbCBjcmVhdGUpCiAKIAlJOTE1X1dSSVRFKHZndGlmX3Jl
ZyhnMnZfbm90aWZ5KSwgbXNnKTsKIAorCW11dGV4X2xvY2soJmRldl9wcml2LT52Z3B1LmxvY2sp
OworCiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfdmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMKaW5kZXggYmYyYjgz
Ny4uNzQ5MzU0NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMKQEAgLTk0LDYgKzk0LDcgQEAg
dm9pZCBpOTE1X2RldGVjdF92Z3B1KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikK
IAlkZXZfcHJpdi0+dmdwdS5jYXBzID0gcmVhZGwoc2hhcmVkX2FyZWEgKyB2Z3RpZl9vZmZzZXQo
dmd0X2NhcHMpKTsKIAogCWRldl9wcml2LT52Z3B1LmFjdGl2ZSA9IHRydWU7CisJbXV0ZXhfaW5p
dCgmZGV2X3ByaXYtPnZncHUubG9jayk7CiAJRFJNX0lORk8oIlZpcnR1YWwgR1BVIGZvciBJbnRl
bCBHVlQtZyBkZXRlY3RlZC5cbiIpOwogCiBvdXQ6Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
