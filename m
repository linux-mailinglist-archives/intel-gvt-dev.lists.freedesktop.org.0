Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2005E6E8B9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2019 18:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FFF6E84B;
	Fri, 19 Jul 2019 16:25:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825F76E84B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2019 16:25:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC83B3364D;
 Fri, 19 Jul 2019 16:25:20 +0000 (UTC)
Received: from x1.home (ovpn-116-35.phx2.redhat.com [10.3.116.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C67DE1001B02;
 Fri, 19 Jul 2019 16:25:17 +0000 (UTC)
Date: Fri, 19 Jul 2019 10:25:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kechen Lu <kechen.lu@intel.com>
Subject: Re: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190719102516.60af527f@x1.home>
In-Reply-To: <20190718155640.25928-3-kechen.lu@intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 19 Jul 2019 16:25:21 +0000 (UTC)
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, Tina Zhang <tina.zhang@intel.com>, kraxel@redhat.com,
 hang.yuan@intel.com, intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com,
 zhiyuan.lv@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBKdWwgMjAxOSAyMzo1NjozNiArMDgwMApLZWNoZW4gTHUgPGtlY2hlbi5sdUBp
bnRlbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNv
bT4KPiAKPiBJbnRyb2R1Y2UgdkdQVSBzcGVjaWZpYyBpcnEgdHlwZSBWRklPX0lSUV9UWVBFX0dG
WCwgYW5kCj4gVkZJT19JUlFfU1VCVFlQRV9HRlhfRElTUExBWV9JUlEgYXMgdGhlIHN1YnR5cGUg
Zm9yIHZHUFUgZGlzcGxheQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhh
bmdAaW50ZWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMyArKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgvdmZpby5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+IGluZGV4
IGJlNmFkYWI0Zjc1OS4uZGYyOGIxN2E2ZTJlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9s
aW51eC92ZmlvLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gQEAgLTQ2OSw2
ICs0NjksOSBAQCBzdHJ1Y3QgdmZpb19pcnFfaW5mb19jYXBfdHlwZSB7Cj4gIAlfX3UzMiBzdWJ0
eXBlOyAgLyogdHlwZSBzcGVjaWZpYyAqLwo+ICB9Owo+ICAKPiArI2RlZmluZSBWRklPX0lSUV9U
WVBFX0dGWAkJCQkoMSkKPiArI2RlZmluZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lS
UQkJKDEpCj4gKwoKUGxlYXNlIGluY2x1ZGUgYSBkZXNjcmlwdGlvbiBkZWZpbmluZyBleGFjdGx5
IHdoYXQgdGhpcyBJUlEgaXMgaW50ZW5kZWQKdG8gc2lnbmFsLiAgRm9yIGluc3RhbmNlLCBpZiBh
bm90aGVyIHZHUFUgdmVuZG9yIHdhbnRlZCB0byBpbXBsZW1lbnQKdGhpcyBpbiB0aGVpciBkcml2
ZXIgYW5kIGRpZG4ndCBoYXZlIHRoZSBRRU1VIGNvZGUgZm9yIHJlZmVyZW5jZSB0bwp3aGF0IGl0
IGRvZXMgd2l0aCB0aGUgSVJRLCB3aGF0IHdvdWxkIHRoZXkgbmVlZCB0byBrbm93PyAgVGhhbmtz
LAoKQWxleCAKCj4gIC8qKgo+ICAgKiBWRklPX0RFVklDRV9TRVRfSVJRUyAtIF9JT1coVkZJT19U
WVBFLCBWRklPX0JBU0UgKyAxMCwgc3RydWN0IHZmaW9faXJxX3NldCkKPiAgICoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
