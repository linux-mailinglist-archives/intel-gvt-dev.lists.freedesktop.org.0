Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492F116CB
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 May 2019 12:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7134892E5;
	Thu,  2 May 2019 10:00:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E561A892E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 May 2019 10:00:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 03:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,421,1549958400"; d="scan'208";a="342671733"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2019 03:00:52 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/i915/gvt: Assign NULL to the pointer after memory
 free.
Date: Thu,  2 May 2019 12:59:22 +0300
Message-Id: <20190502095922.31917-3-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
References: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGNvbXBsYWlucyBhYm91dCB1c2luZyBw
b2ludGVyIGFmdGVyCmJlaW5nIGZyZWVkLCBiZWNhdXNlIGZ1cnRoZXIgd2UgcGFzcyBpdCB0byB0
aGUgZ3Z0X3ZncHVfZXJyKCkgZnVuY3Rpb24uCkFzc2lnbiBwb2ludGVyIHRvIGJlIE5VTEwgaW50
ZW50aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0aGUgY29kZQphbmFseXplci4KClRo
aXMgcGF0Y2ggZml4ZWQgdGhlIGlzc3VlICM2NDggcmVwb3J0ZWQgYXMgZXJyb3IgYnkga2xvY3dv
cmsuCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0c2tp
aUBpbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+CkNj
OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKaW5kZXggN2U2MTM5NmE2NWM2Li4yYzcyMzUwOWFiNjggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKQEAgLTExMDksNiArMTEwOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxf
dmdwdV9wcGd0dF9zcHQgKnBwZ3R0X3BvcHVsYXRlX3NwdF9ieV9ndWVzdF9lbnRyeSgKIAogZXJy
X2ZyZWVfc3B0OgogCXBwZ3R0X2ZyZWVfc3B0KHNwdCk7CisJc3B0ID0gTlVMTDsKIGVycjoKIAln
dnRfdmdwdV9lcnIoImZhaWw6IHNoYWRvdyBwYWdlICVwIGd1ZXN0IGVudHJ5IDB4JWxseCB0eXBl
ICVkXG4iLAogCQkgICAgIHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7Ci0tIAoyLjE3LjEKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAw
MDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWlj
aWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVu
ZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGll
bnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
