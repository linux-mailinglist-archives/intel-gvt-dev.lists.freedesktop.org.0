Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22BB8F902
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Aug 2019 04:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982716E1B7;
	Fri, 16 Aug 2019 02:35:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0D6E1B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Aug 2019 02:35:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 19:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="194894829"
Received: from gvt.bj.intel.com ([10.238.158.180])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 19:35:43 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 0/6] Deliver vGPU display refresh event to userspace
Date: Fri, 16 Aug 2019 10:35:22 +0800
Message-Id: <20190816023528.30210-1-tina.zhang@intel.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 alex.williamson@redhat.com, kraxel@redhat.com,
 Tina Zhang <tina.zhang@intel.com>, zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgdHJpZXMgdG8gc2VuZCB0aGUgdkdQVSBkaXNwbGF5IHJlZnJlc2ggZXZlbnQg
dG8gdXNlciBsYW5kLgoKSW5zdGVhZCBvZiBkZWxpdmVyaW5nIHBhZ2UgZmxpcCBldmVudHMgb25s
eSBvciB2YmxhbmsgZXZlbnRzIG9ubHksIHdlIApjaG9vc2UgdG8gY29tYmluZSB0d28gb2YgdGhl
bSwgaS5lLiBwb3N0IGRpc3BsYXkgcmVmcmVzaCBldmVudCBhdCB2YmxhbmtzIAphbmQgc2tpcCBz
b21lIG9mIHRoZW0gd2hlbiBubyBwYWdlIGZsaXAgaGFwcGVucy4gVmJsYW5rcyBhcyB1cHBlciBi
b3VuZCAKYXJlIHNhZmUgYW5kIHNraXBwaW5nIG5vLXBhZ2UtZmxpcCB2YmxhbmtzIGd1YXJhbnRl
ZXMgYm90aCB0cml2aWFsIHBlcmZvcm1hbmNlIAppbXBhY3RzIGFuZCBnb29kIHVzZXIgZXhwZXJp
ZW5jZSB3aXRob3V0IHNjcmVlbiB0ZWFyaW5nLiBQbHVzLCB3ZSBoYXZlIHRoZSAKbWFzay91bm1h
c2sgbWVjaGFuc2ltIHByb3ZpZGluZyB1c2VyIHNwYWNlIGZsZXhpYmlsaXR5IHRvIHN3aXRjaCBi
ZXR3ZWVuIApldmVudC1ub3RpZmllZCByZWZyZXNoIGFuZCBjbGFzc2ljIHRpbWVyLWJhc2VkIHJl
ZnJlc2guCgpJbiBhZGRpdGlvbiwgdGhlcmUgYXJlIHNvbWUgY2FzZXMgdGhhdCBndWVzdCBhcHAg
b25seSB1c2VzIG9uZSBmcmFtZWJ1ZmZlciAKZm9yIGJvdGggZHJhd2luZyBhbmQgZGlzcGxheS4g
SW4gc3VjaCBjYXNlLCBndWVzdCBPUyB3b24ndCBkbyB0aGUgcGxhbmUgcGFnZSAKZmxpcCB3aGVu
IHRoZSBmcmFtZWJ1ZmZlciBpcyB1cGRhdGVkLCB0aHVzIHRoZSB1c2VyIGxhbmQgd29uJ3QgYmUg
bm90aWZpZWQgCmFib3V0IHRoZSB1cGRhdGVkIGZyYW1lYnVmZmVyLiBIZW5jZSwgaW4gc2luZ2xl
IGZyYW1lYnVmZmVyIGNhc2UsIHdlIGFwcGx5CmEgaGV1cmlzdGljIHRvIGRldGVybWluZSB3aGV0
aGVyIGl0IGlzIHRoZSBjYXNlIG9yIG5vdC4gSWYgaXQgaXMsIG5vdGlmeSB1c2VyCmxhbmQgd2hl
biBlYWNoIHZibGFuayBldmVudCB0cmlnZ2Vycy4KCnY1OgotIEludHJvZHVjZSBhIHZHUFUgZGlz
cGxheSBpcnEgY2FwIHdoaWNoIGNhbiBub3RpZnkgdXNlciBzcGFjZSB3aXRoCiAgYm90aCBwcmlt
YXJ5IGFuZCBjdXJzb3IgcGxhbmUgdXBkYXRlIGV2ZW50cyB0aHJvdWdoIG9uZSBldmVudGZkLiAo
R2VyZCAmIEFsZXgpCnY0OgotIERlbGl2ZXIgcGFnZSBmbGlwIGV2ZW50IGFuZCBzaW5nbGUgZnJh
bWVidWZmZXIgcmVmcmVzaCBldmVudCBib3VuZGVkIApieSBkaXNwbGF5IHZibGFua3MuIChLZWNo
ZW4pCnYzOgotIERlbGl2ZXIgZGlzcGxheSB2YmxhbmsgZXZlbnQgaW5zdGVhZCBvZiBwYWdlIGZs
aXAgZXZlbnQuIChaaGVueXUpCnYyOgotIFVzZSBWRklPIGlycSBjaGFpbiB0byBnZXQgZXZlbnRm
ZHMgZnJvbSB1c2Vyc3BhY2UgaW5zdGVhZCBvZiBhZGRpbmcKYSBuZXcgQUJJLiAoQWxleCkKdjE6
Ci0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDk2MjM0MS8KCktlY2hlbiBM
dSAoMik6CiAgZHJtL2k5MTUvZ3Z0OiBEZWxpdmVyIGFzeW5jIHByaW1hcnkgcGxhbmUgcGFnZSBm
bGlwIGV2ZW50cyBhdCB2YmxhbmsKICBkcm0vaTkxNS9ndnQ6IEFkZCBjdXJzb3IgcGxhbmUgcmVn
IHVwZGF0ZSB0cmFwIGVtdWxhdGlvbiBoYW5kbGVyCgpUaW5hIFpoYW5nICg0KToKICB2ZmlvOiBE
ZWZpbmUgZGV2aWNlIHNwZWNpZmljIGlycSB0eXBlIGNhcGFiaWxpdHkKICB2ZmlvOiBJbnRyb2R1
Y2UgdkdQVSBkaXNwbGF5IGlycSB0eXBlCiAgZHJtL2k5MTUvZ3Z0OiBSZWdpc3RlciB2R1BVIGRp
c3BsYXkgZXZlbnQgaXJxCiAgZHJtL2k5MTUvZ3Z0OiBEZWxpdmVyIHZHUFUgcmVmcmVzaCBldmVu
dCB0byB1c2Vyc3BhY2UKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwg
ICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jICAgIHwgIDQ5ICsrKysr
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuaCAgICB8ICAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgIHwgICA2ICsKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9oYW5kbGVycy5jICAgfCAgMzIgKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2h5cGVyY2FsbC5oICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0
LmMgIHwgICA3ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuaCAgfCAgIDMg
KwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICB8IDIzMCArKysrKysrKysr
KysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oICAgICAgICB8
ICAxNyArKwogaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCAgICAgICAgICAgICB8ICA0MCArKysr
LQogMTEgZmlsZXMgY2hhbmdlZCwgMzc1IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
