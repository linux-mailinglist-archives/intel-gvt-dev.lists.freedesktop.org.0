Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F957A1F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 05:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF416E594;
	Thu, 27 Jun 2019 03:44:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C4E6E594
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 03:44:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 20:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="360560931"
Received: from gvt.bj.intel.com ([10.238.158.187])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2019 20:43:59 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Date: Thu, 27 Jun 2019 11:37:58 +0800
Message-Id: <20190627033802.1663-1-tina.zhang@intel.com>
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

VGhpcyBzZXJpZXMgdHJpZXMgdG8gc2VuZCB0aGUgdkdQVSBkaXNwbGF5IHZibGFuayBldmVudCB0
byB1c2VyIGxhbmQuCgpJbnN0ZWFkIG9mIGRlbGl2ZXJpbmcgcGFnZSBmbGlwIGV2ZW50cywgd2Ug
Y2hvb3NlIHRvIHBvc3QgZGlzcGxheSB2YmxhbmsKZXZlbnQuIEhhbmRsaW5nIHBhZ2UgZmxpcCBl
dmVudHMgZm9yIGJvdGggcHJpbWFyeSBwbGFuZSBhbmQgY3Vyc29yIHBsYW5lCm1heSBtYWtlIHVz
ZXIgc3BhY2UgcXVpdGUgYnVzeSwgYWx0aG91Z2ggd2UgaGF2ZSB0aGUgbWFzay91bm1hc2sgbWVj
aGFuc2ltCmZvciBtaXRpZ2F0aW9uLiBCZXNpZGVzLCB0aGVyZSBhcmUgc29tZSBjYXNlcyB0aGF0
IGd1ZXN0IGFwcCBvbmx5IHVzZXMKb25lIGZyYW1lYnVmZmVyIGZvciBib3RoIGRyYXdpbmcgYW5k
IGRpc3BsYXkuIEluIHN1Y2ggY2FzZSwgZ3Vlc3QgT1Mgd29uJ3QKZG8gdGhlIHBsYW5lIHBhZ2Ug
ZmxpcCB3aGVuIHRoZSBmcmFtZWJ1ZmZlciBpcyB1cGRhdGVkLCB0aHVzIHRoZSB1c2VyCmxhbmQg
d29uJ3QgYmUgbm90aWZpZWQgYWJvdXQgdGhlIHVwZGF0ZWQgZnJhbWVidWZmZXIuCgpXaXRoIHZH
UFUncyB2YmxhbmsgZXZlbnQgd29ya2luZyBhcyBhIHRpbWVyLCB1c2Vyc3BhY2Ugc3RpbGwgbmVl
ZHMgdG8KcXVlcnkgdGhlIGZyYW1lYnVmZmVyIGZpcnN0LCBiZWZvcmUgZ2V0dGluZyBhIG5ldyBk
bWEtYnVmIGZvciBpdC4KCnYzOgotIERlbGl2ZXIgZGlzcGxheSB2YmxhbmsgZXZlbnQgaW5zdGVh
ZCBvZiBwYWdlIGZsaXAgZXZlbnQuIChaaGVueXUpCnYyOgotIFVzZSBWRklPIGlycSBjaGFpbiB0
byBnZXQgZXZlbnRmZHMgZnJvbSB1c2Vyc3BhY2UgaW5zdGVhZCBvZiBhZGRpbmcKYSBuZXcgQUJJ
LiAoQWxleCkKdjE6Ci0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDk2MjM0
MS8KCgpUaW5hIFpoYW5nICg0KToKICB2ZmlvOiBEZWZpbmUgZGV2aWNlIHNwZWNpZmljIGlycSB0
eXBlIGNhcGFiaWxpdHkKICB2ZmlvOiBJbnRyb2R1Y2UgdkdQVSBkaXNwbGF5IGlycSB0eXBlCiAg
ZHJtL2k5MTUvZ3Z0OiBSZWdpc3RlciB2R1BVIGRpc3BsYXkgdmJsYW5rIGlycQogIGRybS9pOTE1
L2d2dDogRGVsaXZlciB2R1BVIHZibGFuayBldmVudCB0byB1c2Vyc3BhY2UKCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jICAgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndnQuaCAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJj
YWxsLmggfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgIHwgMTkz
ICsrKysrKysrKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21w
dC5oICAgICAgIHwgIDE3ICsrKwogaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCAgICAgICAgICAg
IHwgIDIyICsrLQogNiBmaWxlcyBjaGFuZ2VkLCAyNDEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
