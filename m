Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A8BD35D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 22:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DAC6EAF8;
	Tue, 24 Sep 2019 20:14:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34FF6EAF8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Sep 2019 20:14:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 81EA410CC201;
 Tue, 24 Sep 2019 20:14:20 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F41860852;
 Tue, 24 Sep 2019 20:14:17 +0000 (UTC)
Date: Tue, 24 Sep 2019 14:14:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v6 5/6] drm/i915/gvt: Deliver async primary plane page
 flip events at vblank
Message-ID: <20190924141417.7442bcb3@x1.home>
In-Reply-To: <20190924064143.9282-6-tina.zhang@intel.com>
References: <20190924064143.9282-1-tina.zhang@intel.com>
 <20190924064143.9282-6-tina.zhang@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 24 Sep 2019 20:14:20 +0000 (UTC)
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 kraxel@redhat.com, Kechen Lu <kechen.lu@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com,
 zhiyuan.lv@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBTZXAgMjAxOSAxNDo0MTo0MiArMDgwMApUaW5hIFpoYW5nIDx0aW5hLnpoYW5n
QGludGVsLmNvbT4gd3JvdGU6Cgo+IEZyb206IEtlY2hlbiBMdSA8a2VjaGVuLmx1QGludGVsLmNv
bT4KPiAKPiBPbmx5IHN5bmMgcHJpbWFyeSBwbGFuZSBwYWdlIGZsaXAgZXZlbnRzIGFyZSBjaGVj
a2VkIGFuZCBkZWxpdmVyZWQKPiBhcyB0aGUgZGlzcGxheSByZWZyZXNoIGV2ZW50cyBiZWZvcmUs
IHRoaXMgcGF0Y2ggdHJpZXMgdG8gZGVsaXZlciBhc3luYwo+IHByaW1hcnkgcGFnZSBmbGlwIGV2
ZW50cyBib3VuZGVkIGJ5IHZibGFua3MuCj4gCj4gVG8gZGVsaXZlciBjb3JyZWN0IGFzeW5jIHBh
Z2UgZmxpcCwgdGhlIG5ldyBhc3luYyBmbGlwIGJpdG1hcCBpcwo+IGludHJvZHVjZWQgYW5kIGlu
IHZibGFuayBlbXVsYXRpb24gaGFuZGxlciB0byBjaGVjayBiaXRzZXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogS2VjaGVuIEx1IDxrZWNoZW4ubHVAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRp
bmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvY21kX3BhcnNlci5jIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9kaXNwbGF5LmMgICAgfCAxMCArKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndnQuaCAgICAgICAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYyAgIHwgIDUgKysrLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwo+
IGluZGV4IGU3NTNiMWU3MDZlMi4uMWFiYjA1NDMxMTc3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvY21kX3BhcnNlci5jCj4gQEAgLTEzNjUsOSArMTM2NSwxMSBAQCBzdGF0aWMgaW50IGdl
bjhfdXBkYXRlX3BsYW5lX21taW9fZnJvbV9taV9kaXNwbGF5X2ZsaXAoCj4gIAlpZiAoaW5mby0+
cGxhbmUgPT0gUExBTkVfUFJJTUFSWSkKPiAgCQl2Z3B1X3ZyZWdfdCh2Z3B1LCBQSVBFX0ZMSVBD
T1VOVF9HNFgoaW5mby0+cGlwZSkpKys7Cj4gIAo+IC0JaWYgKGluZm8tPmFzeW5jX2ZsaXApCj4g
KwlpZiAoaW5mby0+YXN5bmNfZmxpcCkgewo+ICAJCWludGVsX3ZncHVfdHJpZ2dlcl92aXJ0dWFs
X2V2ZW50KHZncHUsIGluZm8tPmV2ZW50KTsKPiAtCWVsc2UKPiArCQlzZXRfYml0KGluZm8tPnBs
YW5lLAo+ICsJCQl2Z3B1LT5kaXNwbGF5LmFzeW5jX2ZsaXBfZXZlbnRbaW5mby0+cGlwZV0pOwo+
ICsJfSBlbHNlCj4gIAkJc2V0X2JpdChpbmZvLT5ldmVudCwgdmdwdS0+aXJxLmZsaXBfZG9uZV9l
dmVudFtpbmZvLT5waXBlXSk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
ZGlzcGxheS5jCj4gaW5kZXggOWYyYzJjZDEwMzY5Li45YWNkZTBiZGQ1ZjQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMKPiBAQCAtNDE5LDYgKzQxOSwxNiBAQCBzdGF0aWMgdm9p
ZCBlbXVsYXRlX3ZibGFua19vbl9waXBlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQgcGlw
ZSkKPiAgCQlpbnRlbF92Z3B1X3RyaWdnZXJfdmlydHVhbF9ldmVudCh2Z3B1LCBldmVudCk7Cj4g
IAl9Cj4gIAo+ICsJZm9yX2VhY2hfc2V0X2JpdChldmVudCwgdmdwdS0+ZGlzcGxheS5hc3luY19m
bGlwX2V2ZW50W3BpcGVdLAo+ICsJCQlJOTE1X01BWF9QTEFORVMpIHsKPiArCQljbGVhcl9iaXQo
ZXZlbnQsIHZncHUtPmRpc3BsYXkuYXN5bmNfZmxpcF9ldmVudFtwaXBlXSk7Cj4gKwkJaWYgKCFw
aXBlX2lzX2VuYWJsZWQodmdwdSwgcGlwZSkpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlpZiAo
ZXZlbnQgPT0gUExBTkVfUFJJTUFSWSkKPiArCQkJZXZlbnRmZF9zaWduYWxfdmFsIHw9IERJU1BM
QVlfUFJJX1JFRlJFU0hfRVZFTlRfVkFMOwoKSXMgaXQgd29ydGh3aGlsZSB0byBjb250aW51ZSB0
aGUgZm9yX2VhY2hfc2V0X2JpdCBoZXJlLCBvciBzaG91bGQgd2UKY2xlYXIgdGhlIHJlbWFpbmlu
ZyBiaXRzIGFuZCBicmVhayBmcm9tIHRoZSBsb29wPyAgVGhhbmtzLAoKQWxleAoKPiArCX0KPiAr
Cj4gIAlpZiAoZXZlbnRmZF9zaWduYWxfdmFsKQo+ICAJCXZncHUtPm5vX3BhZ2VmbGlwX2NvdW50
ID0gMDsKPiAgCWVsc2UgaWYgKCFldmVudGZkX3NpZ25hbF92YWwgJiYgdmdwdS0+bm9fcGFnZWZs
aXBfY291bnQgPiBQQUdFRkxJUF9ERUxBWV9USFIpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAo+IGlu
ZGV4IGNjMzliNDQ5YjA2MS4uNzM3NjlhODdiNDA3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndnQuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQu
aAo+IEBAIC0xMjgsNiArMTI4LDggQEAgc3RydWN0IGludGVsX3ZncHVfZGlzcGxheSB7Cj4gIAlz
dHJ1Y3QgaW50ZWxfdmdwdV9pMmNfZWRpZCBpMmNfZWRpZDsKPiAgCXN0cnVjdCBpbnRlbF92Z3B1
X3BvcnQgcG9ydHNbSTkxNV9NQVhfUE9SVFNdOwo+ICAJc3RydWN0IGludGVsX3ZncHVfc2JpIHNi
aTsKPiArCURFQ0xBUkVfQklUTUFQKGFzeW5jX2ZsaXBfZXZlbnRbSTkxNV9NQVhfUElQRVNdLAo+
ICsJCSAgICAgICBJOTE1X01BWF9QTEFORVMpOwo+ICB9Owo+ICAKPiAgc3RydWN0IHZncHVfc2No
ZWRfY3RsIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwo+IGluZGV4IDQ1YTkxMjRl
NTNiNi4uZTVhMDIyYzJlN2JiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMK
PiBAQCAtNzYwLDkgKzc2MCwxMCBAQCBzdGF0aWMgaW50IHByaV9zdXJmX21taW9fd3JpdGUoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4gIAo+ICAJdmdwdV92
cmVnX3QodmdwdSwgUElQRV9GTElQQ09VTlRfRzRYKHBpcGUpKSsrOwo+ICAKPiAtCWlmICh2Z3B1
X3ZyZWdfdCh2Z3B1LCBEU1BDTlRSKHBpcGUpKSAmIFBMQU5FX0NUTF9BU1lOQ19GTElQKQo+ICsJ
aWYgKHZncHVfdnJlZ190KHZncHUsIERTUENOVFIocGlwZSkpICYgUExBTkVfQ1RMX0FTWU5DX0ZM
SVApIHsKPiAgCQlpbnRlbF92Z3B1X3RyaWdnZXJfdmlydHVhbF9ldmVudCh2Z3B1LCBldmVudCk7
Cj4gLQllbHNlCj4gKwkJc2V0X2JpdChQTEFORV9QUklNQVJZLCB2Z3B1LT5kaXNwbGF5LmFzeW5j
X2ZsaXBfZXZlbnRbcGlwZV0pOwo+ICsJfSBlbHNlCj4gIAkJc2V0X2JpdChldmVudCwgdmdwdS0+
aXJxLmZsaXBfZG9uZV9ldmVudFtwaXBlXSk7Cj4gIAo+ICAJcmV0dXJuIDA7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
