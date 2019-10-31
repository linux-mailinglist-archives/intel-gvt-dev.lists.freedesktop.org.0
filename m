Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE39EAB73
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Oct 2019 09:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3DF6EDAD;
	Thu, 31 Oct 2019 08:16:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BC36EDAD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Oct 2019 08:16:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 01:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="198945878"
Received: from cfl-host.sh.intel.com ([10.239.13.106])
 by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2019 01:16:50 -0700
From: "Gao, Fred" <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] [Security Check] vfio/pci: Refine Intel IGD cfg access
Date: Fri,  1 Nov 2019 00:16:27 +0800
Message-Id: <20191031161627.3076-1-fred.gao@intel.com>
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
Cc: Gao@freedesktop.org, "Gao, Fred" <fred.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SUdEIGNmZyBpbml0IG9ubHkgd29ya3MgZm9yIGludGVncmF0ZWQgR1BVLCBub3QgZEdQVS4KCkNo
YW5nZS1JZDogSTI0ODBiYmI3ZGRlOTkyZGFkYjg3YWE5M2UxNWY5YmJiMjM0ODhiMWMKU2lnbmVk
LW9mZi1ieTogR2FvLCBGcmVkIDxmcmVkLmdhb0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy92Zmlv
L3BjaS92ZmlvX3BjaV9pZ2QuYyB8IDEwICsrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3Bj
aS92ZmlvX3BjaV9pZ2QuYyBiL2RyaXZlcnMvdmZpby9wY2kvdmZpb19wY2lfaWdkLmMKaW5kZXgg
ZWZmMGQzZDk5ODMyLi45ZGVmMmNkYjRmZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby9wY2kv
dmZpb19wY2lfaWdkLmMKKysrIGIvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9pZ2QuYwpAQCAt
MjczLDkgKzI3MywxMyBAQCBpbnQgdmZpb19wY2lfaWdkX2luaXQoc3RydWN0IHZmaW9fcGNpX2Rl
dmljZSAqdmRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gdmZpb19wY2lf
aWdkX2NmZ19pbml0KHZkZXYpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7CisJLyogb25seSBh
Y2Nlc3MgZm9yIEludGVsIFZHQSBkZXZpY2UgYXQgYWRkcmVzcyAwMDowMi4wLiAqLworCWlmICh2
ZGV2LT5wZGV2ID09IHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdCgKKwkJCQkJCTAsIDAsIFBD
SV9ERVZGTigweDIsIDApKSkgeworCQlyZXQgPSB2ZmlvX3BjaV9pZ2RfY2ZnX2luaXQodmRldik7
CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KIAogCXJldHVybiAwOwogfQotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXY=
