Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33691EAB6A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Oct 2019 09:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD96EDAC;
	Thu, 31 Oct 2019 08:15:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AC26EDAC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Oct 2019 08:15:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 01:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="401802356"
Received: from cfl-host.sh.intel.com ([10.239.13.106])
 by fmsmga006.fm.intel.com with ESMTP; 31 Oct 2019 01:15:11 -0700
From: "Gao, Fred" <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/2] [Security Check] vfio/pci: Refine Intel IGD OpRegion
 support
Date: Fri,  1 Nov 2019 00:14:51 +0800
Message-Id: <20191031161451.2693-1-fred.gao@intel.com>
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

SXQgaXMgdHJ1ZSBmb3IgT3BSZWdpb24gYWRkcmVzcyB6ZXJvIG9uIGRHUFUuCgpDaGFuZ2UtSWQ6
IElmMWJmNzdiNTBhZGEwNDQxMTRlZTAwZTYxNTE4NTgxMThmMmQzZWU4ClNpZ25lZC1vZmYtYnk6
IEdhbywgRnJlZCA8ZnJlZC5nYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdmZpby9wY2kvdmZp
b19wY2lfaWdkLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9wY2kvdmZpb19wY2lfaWdk
LmMgYi9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2lnZC5jCmluZGV4IDUzZDk3ZjQ1OTI1Mi4u
ZWZmMGQzZDk5ODMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2lnZC5j
CisrKyBiL2RyaXZlcnMvdmZpby9wY2kvdmZpb19wY2lfaWdkLmMKQEAgLTYzLDcgKzYzLDExIEBA
IHN0YXRpYyBpbnQgdmZpb19wY2lfaWdkX29wcmVnaW9uX2luaXQoc3RydWN0IHZmaW9fcGNpX2Rl
dmljZSAqdmRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JaWYgKCFhZGRyIHx8ICEo
fmFkZHIpKQorCS8qIGFkZHIgPTAgZm9yIGRHUFUgd2l0aCBleHBhbnNpb24gUk9NICovCisJaWYg
KCFhZGRyKQorCQlyZXR1cm4gMDsKKworCWlmICghKH5hZGRyKSkKIAkJcmV0dXJuIC1FTk9ERVY7
CiAKIAliYXNlID0gbWVtcmVtYXAoYWRkciwgT1BSRUdJT05fU0laRSwgTUVNUkVNQVBfV0IpOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXY=
