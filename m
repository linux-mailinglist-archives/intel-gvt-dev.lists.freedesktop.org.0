Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4D343A9
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF53897C5;
	Tue,  4 Jun 2019 10:04:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BE6897BC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:04:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:04:26 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2019 03:04:23 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] hw/display: Refresh UI depending on vGPU page flip
 events
Date: Tue,  4 Jun 2019 17:58:44 +0800
Message-Id: <20190604095847.10532-1-tina.zhang@intel.com>
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

VGhpcyBzZXJpZXMgc2hvd3MgdGhlIGlkZWEgdG8gcmVmcmVzaCBVSSBjb25zb2xlIGRlcGVuZGlu
ZyBvbiB2R1BVCnBhZ2UgZmxpcCBldmVudHMuCgpUaW5hIFpoYW5nICgzKToKICB2ZmlvOiBBZGQg
YSBmdW50aW9uIHRvIHJldHVybiBhIHNwZWNpZmljIGlycSBjYXBhYmlsaXRpZXMKICB1aS9jb25z
b2xlOiBJbnRyb2R1Y2UgdHdvIG5ldyBBUElzCiAgdmZpby9kaXNwbGF5OiBSZWZyZXNoIGRpc3Bs
YXkgZGVwZW5kaW5nIG9uIHZHUFUgcGFnZSBmbGlwIGV2ZW50cwoKIGh3L3ZmaW8vY29tbW9uLmMg
ICAgICAgICAgICAgIHwgIDc4ICsrKysrKysrKysrCiBody92ZmlvL2Rpc3BsYXkuYyAgICAgICAg
ICAgICB8IDI0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiBpbmNsdWRlL2h3
L3ZmaW8vdmZpby1jb21tb24uaCB8ICAxMSArKwogaW5jbHVkZS91aS9jb25zb2xlLmggICAgICAg
ICAgfCAgIDIgKwogdWkvY29uc29sZS5jICAgICAgICAgICAgICAgICAgfCAgMzUgKysrKysKIDUg
ZmlsZXMgY2hhbmdlZCwgMzQzIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
