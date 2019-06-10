Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155803B20F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2019 11:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62989100;
	Mon, 10 Jun 2019 09:28:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE883890EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Jun 2019 09:27:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 02:27:58 -0700
X-ExtLoop1: 1
Received: from debian-nuc.sh.intel.com ([10.239.160.63])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2019 02:27:57 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix typo of VBLANK_TIMER_PERIOD
Date: Mon, 10 Jun 2019 17:27:50 +0800
Message-Id: <20190610092750.11307-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyB0eXBvIGZvciBWQkxBTktfVElNRVJfUEVSSU9ELgoKU2lnbmVkLW9mZi1ieTog
Wmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9pbnRlcnJ1cHQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvaW50ZXJydXB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmMK
aW5kZXggOTUxNjgxODEzMjMwLi4xMWFjY2QzZTEwMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
aW50ZXJydXB0LmMKQEAgLTY3Miw3ICs2NzIsNyBAQCB2b2lkIGludGVsX2d2dF9jbGVhbl9pcnEo
c3RydWN0IGludGVsX2d2dCAqZ3Z0KQogCWhydGltZXJfY2FuY2VsKCZpcnEtPnZibGFua190aW1l
ci50aW1lcik7CiB9CiAKLSNkZWZpbmUgVkJMTkFLX1RJTUVSX1BFUklPRCAxNjAwMDAwMAorI2Rl
ZmluZSBWQkxBTktfVElNRVJfUEVSSU9EIDE2MDAwMDAwCiAKIC8qKgogICogaW50ZWxfZ3Z0X2lu
aXRfaXJxIC0gaW5pdGlhbGl6ZSBHVlQtZyBJUlEgZW11bGF0aW9uIHN1YnN5c3RlbQpAQCAtNzA0
LDcgKzcwNCw3IEBAIGludCBpbnRlbF9ndnRfaW5pdF9pcnEoc3RydWN0IGludGVsX2d2dCAqZ3Z0
KQogCiAJaHJ0aW1lcl9pbml0KCZ2YmxhbmtfdGltZXItPnRpbWVyLCBDTE9DS19NT05PVE9OSUMs
IEhSVElNRVJfTU9ERV9BQlMpOwogCXZibGFua190aW1lci0+dGltZXIuZnVuY3Rpb24gPSB2Ymxh
bmtfdGltZXJfZm47Ci0JdmJsYW5rX3RpbWVyLT5wZXJpb2QgPSBWQkxOQUtfVElNRVJfUEVSSU9E
OworCXZibGFua190aW1lci0+cGVyaW9kID0gVkJMQU5LX1RJTUVSX1BFUklPRDsKIAogCXJldHVy
biAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
