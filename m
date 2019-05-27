Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7B2B08F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 10:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B66898A7;
	Mon, 27 May 2019 08:48:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABC2898A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 08:48:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 01:48:43 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 01:48:41 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH 0/2] Deliver vGPU page flip event to userspace
Date: Mon, 27 May 2019 16:43:10 +0800
Message-Id: <20190527084312.8872-1-tina.zhang@intel.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 kraxel@redhat.com, hang.yuan@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZFTlRGRCBp
b2N0bCBjb21tYW5kIHRvCnNldCB0aGUgZXZlbnRmZCBiYXNlZCBzaWduYWxpbmcgbWVjaGFuaXNt
IGluIHZmaW8gZGlzcGxheS4gdkdQVSBjYW4gdXNlCnRoaXMgZXZlbnRmZCB0byBkZWxpdmVyIHRo
ZSBmcmFtZWJ1ZmZlciBwYWdlIGZsaXAgZXZlbnQgdG8gdXNlcnNwYWNlLgoKClRpbmEgWmhhbmcg
KDIpOgogIHZmaW86IEFCSSBmb3Igc2V0dGluZyBtZGV2IGRpc3BsYXkgZmxpcCBldmVudGZkCiAg
ZHJtL2k5MTUvZ3Z0OiBTdXBwb3J0IGRlbGl2ZXJpbmcgcGFnZSBmbGlwIGV2ZW50IHRvIHVzZXJz
cGFjZQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyAgIHwgMzEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuaCAg
IHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5jICAgICAgfCAgMSArCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYyB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3Zt
Z3QuYyAgICB8ICA3ICsrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggICAgICAgICAg
IHwgMTIgKysrKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1ndnQtZGV2
