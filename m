Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B072B091
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 10:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD39898BC;
	Mon, 27 May 2019 08:48:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1BE898A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 08:48:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 01:48:45 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 01:48:43 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH 1/2] vfio: ABI for setting mdev display flip eventfd
Date: Mon, 27 May 2019 16:43:11 +0800
Message-Id: <20190527084312.8872-2-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527084312.8872-1-tina.zhang@intel.com>
References: <20190527084312.8872-1-tina.zhang@intel.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 kraxel@redhat.com, hang.yuan@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWRkIFZGSU9fREVWSUNFX1NFVF9HRlhfRkxJUF9FVkVOVEZEIGlvY3RsIGNvbW1hbmQgdG8gc2V0
IGV2ZW50ZmQKYmFzZWQgc2lnbmFsaW5nIG1lY2hhbmlzbSB0byBkZWxpdmVyIHZHUFUgZnJhbWVi
dWZmZXIgcGFnZSBmbGlwCmV2ZW50IHRvIHVzZXJzcGFjZS4KClNpZ25lZC1vZmYtYnk6IFRpbmEg
WmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9saW51eC92Zmlv
LmggfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCBiL2luY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmgKaW5kZXggMDJiYjdhZDZlOTg2Li4yNzMwMDU5NzcxN2YgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaApA
QCAtNjk2LDYgKzY5NiwxOCBAQCBzdHJ1Y3QgdmZpb19kZXZpY2VfaW9ldmVudGZkIHsKIAogI2Rl
ZmluZSBWRklPX0RFVklDRV9JT0VWRU5URkQJCV9JTyhWRklPX1RZUEUsIFZGSU9fQkFTRSArIDE2
KQogCisvKioKKyAqIFZGSU9fREVWSUNFX1NFVF9HRlhfRkxJUF9FVkVOVEZEIC0gX0lPVyhWRklP
X1RZUEUsIFZGSU9fQkFTRSArIDE3LCBfX3MzMikKKyAqCisgKiBTZXQgZXZlbnRmZCBiYXNlZCBz
aWduYWxpbmcgbWVjaGFuaXNtIHRvIGRlbGl2ZXIgdkdQVSBmcmFtZWJ1ZmZlciBwYWdlCisgKiBm
bGlwIGV2ZW50IHRvIHVzZXJzcGFjZS4gQSB2YWx1ZSBvZiAtMSBpcyB1c2VkIHRvIHN0b3AgdGhl
IHBhZ2UgZmxpcAorICogZGVsaXZlcmluZy4KKyAqCisgKiBSZXR1cm46IDAgb24gc3VjY2Vzcywg
LWVycm5vIG9uIGZhaWx1cmUuCisgKi8KKworI2RlZmluZSBWRklPX0RFVklDRV9TRVRfR0ZYX0ZM
SVBfRVZFTlRGRCBfSU8oVkZJT19UWVBFLCBWRklPX0JBU0UgKyAxNykKKwogLyogLS0tLS0tLS0g
QVBJIGZvciBUeXBlMSBWRklPIElPTU1VIC0tLS0tLS0tICovCiAKIC8qKgotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
