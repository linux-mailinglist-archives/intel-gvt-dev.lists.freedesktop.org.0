Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81A6CA68
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 09:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987E06E339;
	Thu, 18 Jul 2019 07:57:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBA26E339
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 07:57:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 00:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="158713076"
Received: from gvt-optiplex-7060.bj.intel.com ([10.238.158.89])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2019 00:57:34 -0700
From: Kechen Lu <kechen.lu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Date: Thu, 18 Jul 2019 23:56:36 +0800
Message-Id: <20190718155640.25928-3-kechen.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718155640.25928-1-kechen.lu@intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
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

RnJvbTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+CgpJbnRyb2R1Y2UgdkdQVSBz
cGVjaWZpYyBpcnEgdHlwZSBWRklPX0lSUV9UWVBFX0dGWCwgYW5kClZGSU9fSVJRX1NVQlRZUEVf
R0ZYX0RJU1BMQVlfSVJRIGFzIHRoZSBzdWJ0eXBlIGZvciB2R1BVIGRpc3BsYXkKClNpZ25lZC1v
ZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvdWFw
aS9saW51eC92ZmlvLmggfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGlu
dXgvdmZpby5oCmluZGV4IGJlNmFkYWI0Zjc1OS4uZGYyOGIxN2E2ZTJlIDEwMDY0NAotLS0gYS9p
bmNsdWRlL3VhcGkvbGludXgvdmZpby5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgK
QEAgLTQ2OSw2ICs0NjksOSBAQCBzdHJ1Y3QgdmZpb19pcnFfaW5mb19jYXBfdHlwZSB7CiAJX191
MzIgc3VidHlwZTsgIC8qIHR5cGUgc3BlY2lmaWMgKi8KIH07CiAKKyNkZWZpbmUgVkZJT19JUlFf
VFlQRV9HRlgJCQkJKDEpCisjZGVmaW5lIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJR
CQkoMSkKKwogLyoqCiAgKiBWRklPX0RFVklDRV9TRVRfSVJRUyAtIF9JT1coVkZJT19UWVBFLCBW
RklPX0JBU0UgKyAxMCwgc3RydWN0IHZmaW9faXJxX3NldCkKICAqCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
