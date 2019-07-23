Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E320B71537
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 11:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D08089950;
	Tue, 23 Jul 2019 09:30:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FF58992E;
 Tue, 23 Jul 2019 09:30:25 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17528573-1500050 for multiple; Tue, 23 Jul 2019 10:30:15 +0100
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1563881524-147440-2-git-send-email-xiaolin.zhang@intel.com>
References: <1563881524-147440-1-git-send-email-xiaolin.zhang@intel.com>
 <1563881524-147440-2-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <156387421346.31349.17560663189266498755@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v8 1/9] drm/i915: introduced vgpu pv capability
Date: Tue, 23 Jul 2019 10:30:13 +0100
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTA3LTIzIDEyOjMxOjU2KQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfdmdwdS5jCj4gaW5kZXggZGJkMWZhMy4uOWIzN2RkMSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfdmdwdS5jCj4gQEAgLTk1LDcgKzk1LDE0IEBAIHZvaWQgaTkxNV9kZXRlY3RfdmdwdShz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCj4gICAgICAgICBkZXZfcHJpdi0+dmdw
dS5jYXBzID0gcmVhZGwoc2hhcmVkX2FyZWEgKyB2Z3RpZl9vZmZzZXQodmd0X2NhcHMpKTsKPiAg
Cj4gICAgICAgICBkZXZfcHJpdi0+dmdwdS5hY3RpdmUgPSB0cnVlOwo+IC0gICAgICAgRFJNX0lO
Rk8oIlZpcnR1YWwgR1BVIGZvciBJbnRlbCBHVlQtZyBkZXRlY3RlZC5cbiIpOwo+ICsKPiArICAg
ICAgIGlmICghaW50ZWxfdmdwdV9jaGVja19wdl9jYXBzKGRldl9wcml2LCBzaGFyZWRfYXJlYSkp
IHsKPiArICAgICAgICAgICAgICAgRFJNX0lORk8oIlZpcnR1YWwgR1BVIGZvciBJbnRlbCBHVlQt
ZyBkZXRlY3RlZC5cbiIpOwo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9Cj4g
Kwo+ICsgICAgICAgRFJNX0lORk8oIlZpcnR1YWwgR1BVIGZvciBJbnRlbCBHVlQtZyBkZXRlY3Rl
ZCB3aXRoIHB2X2NhcHMgMHgleC5cbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X3By
aXYtPnZncHUucHZfY2Fwcyk7CgpUaGlzIGlzIGEgdXNlci1mYWNpbmcgbWVzc2FnZSwgYXZvaWQg
dXNpbmcgYW55IGphcmdvbi4gSW5zdGVhZCBvZgpwdl9jYXBzOiV4LCBleHBhbmQgaXQgdG8gYSBz
ZXQgb2Ygc3RyaW5ncyBpZiB5b3UgdGhpbmsgaXQncyBpbXBvcnRhbnQKZm9yIHRoZSB1c2VyIHRv
IGtub3cuIEl0J3MgcHJvYmFibHkgbm90ISBCdXQgeW91IHByb2JhYmx5IHdhbnQgdG8KaW5jbHVk
ZSB0aGUgY2FwcyBpbiBkZWJ1Z2ZzL2k5MTVfY2FwYWJpbGl0aWVzLgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
