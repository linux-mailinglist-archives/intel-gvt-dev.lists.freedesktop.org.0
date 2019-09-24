Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C537BC1DE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Sep 2019 08:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DCA6E9FC;
	Tue, 24 Sep 2019 06:43:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C2C6E9FC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Sep 2019 06:43:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 23:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="203306309"
Received: from gvt.bj.intel.com ([10.238.158.180])
 by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 23:43:07 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] vfio: Introduce vGPU display irq type
Date: Tue, 24 Sep 2019 14:41:39 +0800
Message-Id: <20190924064143.9282-3-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190924064143.9282-1-tina.zhang@intel.com>
References: <20190924064143.9282-1-tina.zhang@intel.com>
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

SW50cm9kdWNlIHZHUFUgc3BlY2lmaWMgaXJxIHR5cGUgVkZJT19JUlFfVFlQRV9HRlgsIGFuZApW
RklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBhcyB0aGUgc3VidHlwZSBmb3IgdkdQVSBk
aXNwbGF5LgoKSW50cm9kdWNlIHZmaW9faXJxX2luZm9fY2FwX2Rpc3BsYXlfcGxhbmVfZXZlbnRz
IGNhcGFiaWxpdHkgdG8gbm90aWZ5CnVzZXIgc3BhY2Ugd2l0aCB0aGUgdkdQVSdzIHBsYW5lIHVw
ZGF0ZSBldmVudHMKCnYzOgotIEFkZCBtb3JlIGRlc2NyaXB0aW9uIHRvIFZGSU9fSVJRX1NVQlRZ
UEVfR0ZYX0RJU1BMQVlfSVJRIGFuZAogIFZGSU9fSVJRX0lORk9fQ0FQX0RJU1BMQVkuIChBbGV4
ICYgR2VyZCkKCnYyOgotIEFkZCBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBkZXNj
cmlwdGlvbi4gKEFsZXggJiBLZWNoZW4pCi0gSW50cm9kdWNlIHZmaW9faXJxX2luZm9fY2FwX2Rp
c3BsYXlfcGxhbmVfZXZlbnRzLiAoR2VyZCAmIEFsZXgpCgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpo
YW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5o
IHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zm
aW8uaCBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKaW5kZXggYWE2ODUwZjFkYWVmLi4yOTQ2
YTAyOGIwYzMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKKysrIGIvaW5j
bHVkZS91YXBpL2xpbnV4L3ZmaW8uaApAQCAtNDc2LDYgKzQ3Niw0NCBAQCBzdHJ1Y3QgdmZpb19p
cnFfaW5mb19jYXBfdHlwZSB7CiAJX191MzIgc3VidHlwZTsgIC8qIHR5cGUgc3BlY2lmaWMgKi8K
IH07CiAKKy8qIHZHUFUgSVJRIFRZUEUgKi8KKyNkZWZpbmUgVkZJT19JUlFfVFlQRV9HRlgJCQko
MSkKKworLyogc3ViLXR5cGVzIGZvciBWRklPX0lSUV9UWVBFX0dGWCAqLworLyoKKyAqIHZHUFUg
ZGV2aWNlIGRpc3BsYXkgcmVmcmVzaCBpbnRlcnJ1cHQgcmVxdWVzdC4gVGhpcyBpcnEgYXNraW5n
IGZvcgorICogYSB1c2VyIHNwYWNlIGRpc3BsYXkgcmVmcmVzaCwgY292ZXJzIGFsbCBkaXNwbGF5
IHVwZGF0ZXMgZXZlbnRzLAorICogaS5lLiB1c2VyIHNwYWNlIGNhbiBzdG9wIHRoZSBkaXNwbGF5
IHVwZGF0ZSB0aW1lciBhbmQgZnVsbHkgZGVwZW5kCisgKiBvbiBnZXR0aW5nIHRoZSBub3RpZmlj
YXRpb24gaWYgYW4gdXBkYXRlIGlzIG5lZWRlZC4KKyAqLworI2RlZmluZSBWRklPX0lSUV9TVUJU
WVBFX0dGWF9ESVNQTEFZX0lSUQkoMSkKKworLyoKKyAqIERpc3BsYXkgY2FwYWJpbGl0eSBvZiBy
ZXBvcnRpbmcgZGlzcGxheSByZWZyZXNoIGludGVycnVwdCBldmVudHMuCisgKiBUaGlzIGdpdmVz
IHVzZXIgc3BhY2UgdGhlIGNhcGFiaWxpdHkgdG8gaWRlbnRpZnkgZGlmZmVyZW50IGRpc3BsYXkK
KyAqIHVwZGF0ZXMgZXZlbnRzIG9mIHRoZSBkaXNwbGF5IHJlZnJlc2ggaW50ZXJydXB0IHJlcXVl
c3QuCisgKgorICogV2hlbiBub3RpZmllZCBieSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZ
X0lSUSwgdXNlciBzcGFjZSBjYW4KKyAqIHVzZSB0aGUgZXZlbnRmZCBjb3VudGVyIHZhbHVlIHRv
IGlkZW50aWZ5IHdoaWNoIHBsYW5lIGhhcyBiZWVuCisgKiB1cGRhdGVkLgorICoKKyAqIE5vdGUg
dGhhdCB0aGVyZSBtaWdodCBiZSBzb21lIGNhc2VzIGxpa2UgY291bnRlcl92YWx1ZSA+CisgKiAo
Y3VyX2V2ZW50X3ZhbCArIHByaV9ldmVudF92YWwpLCBpZiBub3RpZmljYXRpb25zIGhhdmVuJ3Qg
YmVlbgorICogaGFuZGxlZCBvbiB0aW1lIGluIHVzZXIgbW9kZS4gVGhlc2UgY2FzZXMgY2FuIGJl
IGhhbmRsZWQgYXMgYWxsCisgKiBwbGFuZSB1cGRhdGVkIGNhc2Ugb3Igc2lnbmxlIHBsYW5lIHVw
ZGF0ZWQgY2FzZSBkZXBlbmRpbmcgb24gdGhlCisgKiB2YWx1ZS4KKyAqCisgKiBjdXJfZXZlbnRf
dmFsOiBldmVudGZkIGNvdW50ZXIgdmFsdWUgZm9yIGN1cnNvciBwbGFuZSBjaGFuZ2UgZXZlbnQu
CisgKiBwcmlfZXZlbnRfdmFsOiBldmVudGZkIGNvdW50ZXIgdmFsdWUgZm9yIHByaW1hcnkgcGxh
bmUgY2hhbmdlIGV2ZW50LgorICovCisjZGVmaW5lIFZGSU9fSVJRX0lORk9fQ0FQX0RJU1BMQVkJ
MgorCitzdHJ1Y3QgdmZpb19pcnFfaW5mb19jYXBfZGlzcGxheV9wbGFuZV9ldmVudHMgeworCXN0
cnVjdCB2ZmlvX2luZm9fY2FwX2hlYWRlciBoZWFkZXI7CisJX191NjQgY3VyX2V2ZW50X3ZhbDsK
KwlfX3U2NCBwcmlfZXZlbnRfdmFsOworfTsKKwogLyoqCiAgKiBWRklPX0RFVklDRV9TRVRfSVJR
UyAtIF9JT1coVkZJT19UWVBFLCBWRklPX0JBU0UgKyAxMCwgc3RydWN0IHZmaW9faXJxX3NldCkK
ICAqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
