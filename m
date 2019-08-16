Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B25909A9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Aug 2019 22:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BBF6E30C;
	Fri, 16 Aug 2019 20:51:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389306E30C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Aug 2019 20:51:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB462859FB;
 Fri, 16 Aug 2019 20:51:51 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12AE44139;
 Fri, 16 Aug 2019 20:51:49 +0000 (UTC)
Date: Fri, 16 Aug 2019 14:51:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v5 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190816145148.307408dc@x1.home>
In-Reply-To: <20190816023528.30210-3-tina.zhang@intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <20190816023528.30210-3-tina.zhang@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 16 Aug 2019 20:51:51 +0000 (UTC)
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
 zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAxNiBBdWcgMjAxOSAxMDozNToyNCArMDgwMApUaW5hIFpoYW5nIDx0aW5hLnpoYW5n
QGludGVsLmNvbT4gd3JvdGU6Cgo+IEludHJvZHVjZSB2R1BVIHNwZWNpZmljIGlycSB0eXBlIFZG
SU9fSVJRX1RZUEVfR0ZYLCBhbmQKPiBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBh
cyB0aGUgc3VidHlwZSBmb3IgdkdQVSBkaXNwbGF5Lgo+IAo+IEludHJvZHVjZSB2ZmlvX2lycV9p
bmZvX2NhcF9kaXNwbGF5X3BsYW5lX2V2ZW50cyBjYXBhYmlsaXR5IHRvIG5vdGlmeQo+IHVzZXIg
c3BhY2Ugd2l0aCB0aGUgdkdQVSdzIHBsYW5lIHVwZGF0ZSBldmVudHMKPiAKPiB2MjoKPiAtIEFk
ZCBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBkZXNjcmlwdGlvbi4gKEFsZXggJiBL
ZWNoZW4pCj4gLSBJbnRyb2R1Y2UgdmZpb19pcnFfaW5mb19jYXBfZGlzcGxheV9wbGFuZV9ldmVu
dHMuIChHZXJkICYgQWxleCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3ZmaW8uaAo+IGluZGV4IGQ4M2M5ZjEzNmE1Yi4uMjFhYzY5ZjBlMWE5IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGlu
dXgvdmZpby5oCj4gQEAgLTQ2NSw2ICs0NjUsMjcgQEAgc3RydWN0IHZmaW9faXJxX2luZm9fY2Fw
X3R5cGUgewo+ICAJX191MzIgc3VidHlwZTsgIC8qIHR5cGUgc3BlY2lmaWMgKi8KPiAgfTsKPiAg
Cj4gKyNkZWZpbmUgVkZJT19JUlFfVFlQRV9HRlgJCQkJKDEpCj4gKy8qCj4gKyAqIHZHUFUgdmVu
ZG9yIHN1Yi10eXBlCj4gKyAqIHZHUFUgZGV2aWNlIGRpc3BsYXkgcmVsYXRlZCBpbnRlcnJ1cHRz
IGUuZy4gdmJsYW5rL3BhZ2VmbGlwCj4gKyAqLwo+ICsjZGVmaW5lIFZGSU9fSVJRX1NVQlRZUEVf
R0ZYX0RJU1BMQVlfSVJRCQkoMSkKCklmIHRoaXMgaXMgYSBHRlgvRElTUExBWSBJUlEsIHdoeSBh
cmUgd2UgdGFsa2luZyBhYm91dCBhICJ2R1BVIiBpbiB0aGUKZGVzY3JpcHRpb24/ICBJdCdzIG5v
dCBzcGVjaWZpYyB0byBhIHZHUFUgaW1wbGVtZW50YXRpb24sIHJpZ2h0PyAgSXMKdGhpcyByZWxh
dGVkIHRvIGEgcGh5c2ljYWwgZGlzcGxheSBvciBhIHZpcnR1YWwgZGlzcGxheT8gIElmIGl0J3MK
cmVsYXRlZCB0byB0aGUgR0ZYIFBMQU5FIGlvY3RscywgaXQgc2hvdWxkIHN0YXRlIHRoYXQuICBJ
dCdzIG5vdCB3ZWxsCnNwZWNpZmllZCB3aGF0IHRoaXMgaW50ZXJydXB0IHNpZ25hbHMuICBJcyBp
dCB2Ymxhbms/ICBJcyBpdCBwYWdlZmxpcD8KSXMgaXQgYm90aD8gIE5laXRoZXI/ICBTb21ldGhp
bmcgZWxzZT8KCj4gKwo+ICsvKgo+ICsgKiBEaXNwbGF5IGNhcGFiaWxpdHkgb2YgdXNpbmcgb25l
IGV2ZW50ZmQgdG8gbm90aWZ5IHVzZXIgc3BhY2Ugd2l0aCB0aGUKPiArICogdkdQVSdzIHBsYW5l
IHVwZGF0ZSBldmVudHMuCj4gKyAqIGN1cl9ldmVudF92YWw6IGV2ZW50ZmQgdmFsdWUgc3RhbmRz
IGZvciBjdXJzb3IgcGxhbmUgY2hhbmdlIGV2ZW50Lgo+ICsgKiBwcmlfZXZlbnRfdmFsOiBldmVu
dGZkIHZhbHVlIHN0YW5kcyBmb3IgcHJpbWFyeSBwbGFuZSBjaGFuZ2UgZXZlbnQuCj4gKyAqLwo+
ICsjZGVmaW5lIFZGSU9fSVJRX0lORk9fQ0FQX0RJU1BMQVkJNAo+ICsKPiArc3RydWN0IHZmaW9f
aXJxX2luZm9fY2FwX2Rpc3BsYXlfcGxhbmVfZXZlbnRzIHsKPiArCXN0cnVjdCB2ZmlvX2luZm9f
Y2FwX2hlYWRlciBoZWFkZXI7Cj4gKwlfX3U2NCBjdXJfZXZlbnRfdmFsOwo+ICsJX191NjQgcHJp
X2V2ZW50X3ZhbDsKPiArfTsKCkFnYWluLCB3aGF0IGRpc3BsYXk/ICBEb2VzIHRoaXMgcmVmZXJl
bmNlIGEgR0ZYIHBsYW5lPyAgVGhlIGV2ZW50X3ZhbApkYXRhIGlzIG5vdCB3ZWxsIHNwZWNpZmll
ZCwgZXhhbXBsZXMgbWlnaHQgYmUgbmVjZXNzYXJ5LiAgVGhleSBzZWVtIHRvCmJlIHVzZWQgYXMg
YSBmbGFnIGJpdCwgc28gc2hvdWxkIHdlIHNpbXBseSBkZWZpbmUgYSBiaXQgaW5kZXggZm9yIHRo
ZQpmbGFnIHJhdGhlciB0aGFuIGEgdTY0IHZhbHVlPyAgV2hlcmUgYXJlIHRoZSBhY3R1YWwgZXZl
bnRzIHBlciBwbGFuZQpkZWZpbmVkPwoKSSdtIG5vdCBzdXJlIHRoaXMgcGF0Y2ggc2hvdWxkbid0
IGJlIHJvbGxlZCBiYWNrIGludG8gMSwgSSBjb3VsZG4ndApmaW5kIHRoZSBwcmV2aW91cyBkaXNj
dXNzaW9uIHRoYXQgdHJpZ2dlcmVkIGl0IHRvIGJlIHNlcGFyYXRlLiAgUGVyaGFwcwpzaW1wbHkg
Zm9yIHNoYXJpbmcgd2l0aCB0aGUgd29yayBFcmljIGlzIGRvaW5nPyAgSWYgc28sIHRoYXQncyBm
aW5lLApidXQgbWF5YmUgbWFrZSBub3RlIG9mIGl0IGluIHRoZSBjb3ZlciBsZXR0ZXIuICBUaGFu
a3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
