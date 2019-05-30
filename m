Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A544D2F861
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 May 2019 10:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523DE6E130;
	Thu, 30 May 2019 08:15:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC406E130
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 May 2019 08:15:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 01:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,530,1549958400"; d="scan'208";a="179867169"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 30 May 2019 01:15:00 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: defer page unmap until after finish referencing
 it
Date: Thu, 30 May 2019 04:09:06 -0400
Message-Id: <20190530080906.30941-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SXQgaXMgYmV0dGVyIHRvIG1vdmUga3VubWFwIHRvIGFmdGVyIHJlZmVyZW5jaW5nIHRoZSB2aXJ0
dWFsIGFkZHJlc3MKClNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCA3ICsrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCmluZGV4IDM1M2I0ZDBkYTZiNC4uOGYzYmE0OWIwNmY1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0xNjYsMTAgKzE2NiwxMyBA
QCBzdGF0aWMgaW50IHBvcHVsYXRlX3NoYWRvd19jb250ZXh0KHN0cnVjdCBpbnRlbF92Z3B1X3dv
cmtsb2FkICp3b3JrbG9hZCkKIAkJCUk5MTVfR1RUX1BBR0VfU0laRSAtIHNpemVvZigqc2hhZG93
X3JpbmdfY29udGV4dCkpOwogCiAJc3Jfb2FfcmVncyh3b3JrbG9hZCwgKHUzMiAqKXNoYWRvd19y
aW5nX2NvbnRleHQsIGZhbHNlKTsKLQlrdW5tYXAocGFnZSk7CiAKLQlpZiAoSVNfUkVTVE9SRV9J
TkhJQklUKHNoYWRvd19yaW5nX2NvbnRleHQtPmN0eF9jdHJsLnZhbCkpCisJaWYgKElTX1JFU1RP
UkVfSU5ISUJJVChzaGFkb3dfcmluZ19jb250ZXh0LT5jdHhfY3RybC52YWwpKSB7CisJCWt1bm1h
cChwYWdlKTsKIAkJcmV0dXJuIDA7CisJfQorCisJa3VubWFwKHBhZ2UpOwogCiAJZ3Z0X2RiZ19z
Y2hlZCgicmluZyBpZCAlZCB3b3JrbG9hZCBscmNhICV4IiwgcmluZ19pZCwKIAkJCXdvcmtsb2Fk
LT5jdHhfZGVzYy5scmNhKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
