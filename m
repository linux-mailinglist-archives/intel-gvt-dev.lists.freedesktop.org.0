Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E066CA66
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 09:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338716E32F;
	Thu, 18 Jul 2019 07:56:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1C6E32F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 07:56:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 00:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="158712948"
Received: from gvt-optiplex-7060.bj.intel.com ([10.238.158.89])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2019 00:56:33 -0700
From: Kechen Lu <kechen.lu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 0/6] Deliver vGPU display refresh event to  userspace
Date: Thu, 18 Jul 2019 23:56:34 +0800
Message-Id: <20190718155640.25928-1-kechen.lu@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 alex.williamson@redhat.com, kraxel@redhat.com, Kechen Lu <kechen.lu@intel.com>,
 zhi.a.wang@intel.com, zhiyuan.lv@intel.com
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
biBlYWNoIHZibGFuayBldmVudCB0cmlnZ2Vycy4KCnY0OgotIERlbGl2ZXIgcGFnZSBmbGlwIGV2
ZW50IGFuZCBzaW5nbGUgZnJhbWVidWZmZXIgcmVmcmVzaCBldmVudCBib3VuZGVkIApieSBkaXNw
bGF5IHZibGFua3MuIChLZWNoZW4pCnYzOgotIERlbGl2ZXIgZGlzcGxheSB2YmxhbmsgZXZlbnQg
aW5zdGVhZCBvZiBwYWdlIGZsaXAgZXZlbnQuIChaaGVueXUpCnYyOgotIFVzZSBWRklPIGlycSBj
aGFpbiB0byBnZXQgZXZlbnRmZHMgZnJvbSB1c2Vyc3BhY2UgaW5zdGVhZCBvZiBhZGRpbmcKYSBu
ZXcgQUJJLiAoQWxleCkKdjE6Ci0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8x
MDk2MjM0MS8KCktlY2hlbiBMdSAoMik6CiAgZHJtL2k5MTUvZ3Z0OiBEZWxpdmVyIGFzeW5jIHBy
aW1hcnkgcGxhbmUgcGFnZSBmbGlwIGV2ZW50cyBhdCB2YmxhbmsKICBkcm0vaTkxNS9ndnQ6IEFk
ZCBjdXJzb3IgcGxhbmUgcmVnIHVwZGF0ZSB0cmFwIGVtdWxhdGlvbiBoYW5kbGVyCgpUaW5hIFpo
YW5nICg0KToKICB2ZmlvOiBEZWZpbmUgZGV2aWNlIHNwZWNpZmljIGlycSB0eXBlIGNhcGFiaWxp
dHkKICB2ZmlvOiBJbnRyb2R1Y2UgdkdQVSBkaXNwbGF5IGlycSB0eXBlCiAgZHJtL2k5MTUvZ3Z0
OiBSZWdpc3RlciB2R1BVIGRpc3BsYXkgZXZlbnQgaXJxCiAgZHJtL2k5MTUvZ3Z0OiBEZWxpdmVy
IHZHUFUgcmVmcmVzaCBldmVudCB0byB1c2Vyc3BhY2UKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvY21kX3BhcnNlci5jIHwgICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxh
eS5jICAgIHwgIDU0ICsrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAg
ICAgfCAgMTEgKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgfCAgMzIg
KysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCAgfCAgIDEgKwogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jICB8ICAgNyArCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvaW50ZXJydXB0LmggIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9rdm1ndC5jICAgICAgfCAxOTcgKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9tcHQuaCAgICAgICAgfCAgMTcgKysrCiBpbmNsdWRlL3VhcGkvbGlu
dXgvdmZpby5oICAgICAgICAgICAgIHwgIDIyICsrLQogMTAgZmlsZXMgY2hhbmdlZCwgMzMwIGlu
c2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
