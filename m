Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F43C57A21
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 05:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA66E598;
	Thu, 27 Jun 2019 03:44:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948A76E598
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 03:44:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 20:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="360560977"
Received: from gvt.bj.intel.com ([10.238.158.187])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2019 20:44:04 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 2/4] vfio: Introduce vGPU display irq type
Date: Thu, 27 Jun 2019 11:38:00 +0800
Message-Id: <20190627033802.1663-3-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627033802.1663-1-tina.zhang@intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
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

SW50cm9kdWNlIHZHUFUgc3BlY2lmaWMgaXJxIHR5cGUgVkZJT19JUlFfVFlQRV9HRlgsIGFuZApW
RklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUSBhcyB0aGUgc3VidHlwZSBmb3IgdkdQVSBk
aXNwbGF5CgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4K
LS0tCiBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIGIv
aW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAppbmRleCA2MDA3ODRhY2M0YWMuLmMzZTljODIxYTVj
YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAorKysgYi9pbmNsdWRlL3Vh
cGkvbGludXgvdmZpby5oCkBAIC00NjUsNiArNDY1LDkgQEAgc3RydWN0IHZmaW9faXJxX2luZm9f
Y2FwX3R5cGUgewogCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovCiB9OwogCisj
ZGVmaW5lIFZGSU9fSVJRX1RZUEVfR0ZYCQkJCSgxKQorI2RlZmluZSBWRklPX0lSUV9TVUJUWVBF
X0dGWF9ESVNQTEFZX0lSUQkJKDEpCisKIC8qKgogICogVkZJT19ERVZJQ0VfU0VUX0lSUVMgLSBf
SU9XKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVjdCB2ZmlvX2lycV9zZXQpCiAgKgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXY=
