Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18238BC1DC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 08:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83036E9FB;
	Tue, 24 Sep 2019 06:43:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF456E0EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Sep 2019 06:43:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 23:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="203306293"
Received: from gvt.bj.intel.com ([10.238.158.180])
 by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 23:43:02 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] Deliver vGPU display refresh event to userspace
Date: Tue, 24 Sep 2019 14:41:37 +0800
Message-Id: <20190924064143.9282-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, hang.yuan@intel.com, zhi.a.wang@intel.com,
 kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgc2VuZHMgdGhlIHZHUFUgZGlzcGxheSByZWZyZXNoIGV2ZW50cyB0byB1c2Vy
IGxhbmQuIEEgdkdQVQpkaXNwbGF5IElSUSBpcyBwcm9wb3NlZCB0byBub3RpZnkgdXNlciBzcGFj
ZSB3aXRoIGFsbCB0aGUgZGlzcGxheQp1cGRhdGVzIGV2ZW50cy4gIFdpdGggdGhpcyBJUlEgc3Vw
cG9ydGVkIGJ5IHZlbmRvciBkcml2ZXIsIHVzZXIgc3BhY2UKY2FuIHN0b3AgdGhlIGRpc3BsYXkg
dXBkYXRlIHRpbWVyIGFuZCBmdWxseSBkZXBlbmQgb24gZ2V0dGluZyB0aGUKbm90aWZpY2F0aW9u
IGlmIGFuIHVwZGF0ZSBpcyBuZWVkZWQuCgpIb3cgZG9lcyBndnQtZyBwcm92aWRlIHRoZSB2R1BV
IGRpc3BsYXkgcmVmcmVzaCBJUlEgY292ZXJpbmcgYWxsIHRoZQpkaXNwbGF5IHVwZGF0ZSBldmVu
dHM/CgpJbnN0ZWFkIG9mIGRlbGl2ZXJpbmcgcGFnZSBmbGlwIGV2ZW50cyBvbmx5IG9yIHZibGFu
ayBldmVudHMgb25seSwgd2UKY2hvb3NlIHRvIGNvbWJpbmUgdHdvIG9mIHRoZW0sIGkuZS4gcG9z
dCBkaXNwbGF5IHJlZnJlc2ggZXZlbnQgYXQKdmJsYW5rcyBhbmQgc2tpcCBzb21lIG9mIHRoZW0g
d2hlbiBubyBwYWdlIGZsaXAgaGFwcGVucy4gVmJsYW5rcyBhcwp1cHBlciBib3VuZCBhcmUgc2Fm
ZSBhbmQgc2tpcHBpbmcgbm8tcGFnZS1mbGlwIHZibGFua3MgZ3VhcmFudGVlcyBib3RoCnRyaXZp
YWwgcGVyZm9ybWFuY2UgaW1wYWN0cyBhbmQgZ29vZCB1c2VyIGV4cGVyaWVuY2Ugd2l0aG91dCBz
Y3JlZW4KdGVhcmluZy4gUGx1cywgd2UgaGF2ZSB0aGUgbWFzay91bm1hc2sgbWVjaGFuc2ltIHBy
b3ZpZGluZyB1c2VyIHNwYWNlCmZsZXhpYmlsaXR5IHRvIHN3aXRjaCBiZXR3ZWVuIGV2ZW50LW5v
dGlmaWVkIHJlZnJlc2ggYW5kIGNsYXNzaWMKdGltZXItYmFzZWQgcmVmcmVzaC4KCkluIGFkZGl0
aW9uLCB0aGVyZSBhcmUgc29tZSBjYXNlcyB0aGF0IGd1ZXN0IGFwcCBvbmx5IHVzZXMgb25lCmZy
YW1lYnVmZmVyIGZvciBib3RoIGRyYXdpbmcgYW5kIGRpc3BsYXkuIEluIHN1Y2ggY2FzZSwgZ3Vl
c3QgT1Mgd29uJ3QKZG8gdGhlIHBsYW5lIHBhZ2UgZmxpcCB3aGVuIHRoZSBmcmFtZWJ1ZmZlciBp
cyB1cGRhdGVkLCB0aHVzIHRoZSB1c2VyCmxhbmQgd29uJ3QgYmUgbm90aWZpZWQgYWJvdXQgdGhl
IHVwZGF0ZWQgZnJhbWVidWZmZXIuIEhlbmNlLCBpbiBzaW5nbGUKZnJhbWVidWZmZXIgY2FzZSwg
d2UgYXBwbHkgYSBoZXVyaXN0aWMgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgaXQgaXMgdGhlCmNhc2Ug
b3Igbm90LiBJZiBpdCBpcywgbm90aWZ5IHVzZXIgbGFuZCB3aGVuIGVhY2ggdmJsYW5rIGV2ZW50
CnRyaWdnZXJzLgoKdjY6Ci0gQWRkIG1vcmUgZGVzY3JpcHRpb24gdG8gVkZJT19JUlFfU1VCVFlQ
RV9HRlhfRElTUExBWV9JUlEgYW5kCiAgVkZJT19JUlFfSU5GT19DQVBfRElTUExBWS4gKEFsZXgg
JiBHZXJkKQotIElycSBjYXBhYmlsaXR5IGluZGV4IHN0YXJ0cyBmcm9tIDEKdjU6Ci0gSW50cm9k
dWNlIGEgdkdQVSBkaXNwbGF5IGlycSBjYXAgd2hpY2ggY2FuIG5vdGlmeSB1c2VyIHNwYWNlIHdp
dGgKICBib3RoIHByaW1hcnkgYW5kIGN1cnNvciBwbGFuZSB1cGRhdGUgZXZlbnRzIHRocm91Z2gg
b25lIGV2ZW50ZmQuIChHZXJkICYgQWxleCkKdjQ6Ci0gRGVsaXZlciBwYWdlIGZsaXAgZXZlbnQg
YW5kIHNpbmdsZSBmcmFtZWJ1ZmZlciByZWZyZXNoIGV2ZW50IGJvdW5kZWQgCmJ5IGRpc3BsYXkg
dmJsYW5rcy4gKEtlY2hlbikKdjM6Ci0gRGVsaXZlciBkaXNwbGF5IHZibGFuayBldmVudCBpbnN0
ZWFkIG9mIHBhZ2UgZmxpcCBldmVudC4gKFpoZW55dSkKdjI6Ci0gVXNlIFZGSU8gaXJxIGNoYWlu
IHRvIGdldCBldmVudGZkcyBmcm9tIHVzZXJzcGFjZSBpbnN0ZWFkIG9mIGFkZGluZwphIG5ldyBB
QkkuIChBbGV4KQp2MToKLSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzEwOTYy
MzQxLwoKS2VjaGVuIEx1ICgyKToKICBkcm0vaTkxNS9ndnQ6IERlbGl2ZXIgYXN5bmMgcHJpbWFy
eSBwbGFuZSBwYWdlIGZsaXAgZXZlbnRzIGF0IHZibGFuawogIGRybS9pOTE1L2d2dDogQWRkIGN1
cnNvciBwbGFuZSByZWcgdXBkYXRlIHRyYXAgZW11bGF0aW9uIGhhbmRsZXIKClRpbmEgWmhhbmcg
KDQpOgogIHZmaW86IERlZmluZSBkZXZpY2Ugc3BlY2lmaWMgaXJxIHR5cGUgY2FwYWJpbGl0eQog
IHZmaW86IEludHJvZHVjZSB2R1BVIGRpc3BsYXkgaXJxIHR5cGUKICBkcm0vaTkxNS9ndnQ6IFJl
Z2lzdGVyIHZHUFUgZGlzcGxheSBldmVudCBpcnEKICBkcm0vaTkxNS9ndnQ6IERlbGl2ZXIgdkdQ
VSByZWZyZXNoIGV2ZW50IHRvIHVzZXJzcGFjZQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9j
bWRfcGFyc2VyLmMgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMg
ICAgfCAgNDcgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5oICAgIHwg
ICAzICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgICAgfCAgIDcgKwogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgICB8ICAzMiArKystCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmggIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9pbnRlcnJ1cHQuYyAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVy
cnVwdC5oICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgIHwg
MjMwICsrKysrKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bXB0LmggICAgICAgIHwgIDE3ICsrCiBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oICAgICAgICAg
ICAgIHwgIDU3ICsrKysrKy0KIDExIGZpbGVzIGNoYW5nZWQsIDM5MSBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
