Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95DD34399
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40F389598;
	Tue,  4 Jun 2019 10:01:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB889598
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:01:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:01:14 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga005.jf.intel.com with ESMTP; 04 Jun 2019 03:01:11 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/3] Deliver vGPU page flip events to userspace
Date: Tue,  4 Jun 2019 17:55:31 +0800
Message-Id: <20190604095534.10337-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, hang.yuan@intel.com, zhi.a.wang@intel.com,
 kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgdHJpZXMgdG8gc2VuZCB0aGUgdkdQVSBwYWdlIGZsaXAgZXZlbnRzIHRvIHVz
ZXJzcGFjZSwgd2hpY2gKY2FuIGJlIHVzZWQgYnkgUUVNVSBVSSBmb3IgcmVuZGVyaW5nIGFuZCBk
aXNwbGF5IHdpdGggdGhlIGxhdGVzdCBndWVzdApmcmFtZWJ1ZmZlcnMuCgp2MjogVXNlIFZGSU8g
aXJxIGNoYWluIHRvIGdldCBldmVudGZkcyBmcm9tIHVzZXJzcGFjZSBpbnN0ZWFkIG9mIGFkZGlu
ZwphIG5ldyBBQkkuIChBbGV4KQoKdjE6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292
ZXIvMTA5NjIzNDEvCgoKVGluYSBaaGFuZyAoMyk6CiAgdmZpbzogVXNlIGNhcGFiaWxpdHkgY2hh
aW5zIHRvIGhhbmRsZSBkZXZpY2Ugc3BlY2lmaWMgaXJxCiAgZHJtL2k5MTUvZ3Z0OiBMZXZlcmFn
ZSBpcnEgY2FwYWJpbGl0eSBjaGFpbiB0byBnZXQgZXZlbnRmZAogIGRybS9pOTE1L2d2dDogU2Vu
ZCBwbGFuZSBmbGlwIGV2ZW50cyB0byB1c2VyIHNwYWNlCgogZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2Rpc3BsYXkuYyAgIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0Lmgg
ICAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgIHwgIDIw
ICsrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oIHwgICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICB8IDIwOCArKysrKysrKysrKysrKysrKysr
KysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaCAgICAgICB8ICAxNiArKysK
IGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggICAgICAgICAgICB8ICAyMyArKy0KIDcgZmlsZXMg
Y2hhbmdlZCwgMjY4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
