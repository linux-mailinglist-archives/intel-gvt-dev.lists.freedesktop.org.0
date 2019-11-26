Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0351099EE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Nov 2019 09:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4236E225;
	Tue, 26 Nov 2019 08:09:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006B76E225
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Nov 2019 08:09:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 00:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,244,1571727600"; d="scan'208";a="239841957"
Received: from cfl-host.sh.intel.com ([10.239.13.96])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 00:09:14 -0800
From: "Gao, Fred" <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gvt: Update force-to-nonpriv register
 whitelist
Date: Wed, 27 Nov 2019 00:08:29 +0800
Message-Id: <20191126160829.1090-1-fred.gao@intel.com>
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
Cc: "Gao, Fred" <fred.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SG9zdCBwcmludCBiZWxvdyB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiBjcmVhdGluZyBndWVzdDoKICAg
ICJndnQ6IHZncHUoMSkgSW52YWxpZCBGT1JDRV9OT05QUklWIHdyaXRlIDEwMDAyMzQ5Ii4KCkFk
ZCByZWdpc3RlciAweDIzNDggaW4gZm9yY2UtdG8tbm9ucHJpdiB3aGl0ZWxpc3QgYXMgcmVxdWly
ZWQKYnkgZ3Vlc3QuCgpTaWduZWQtb2ZmLWJ5OiBHYW8gRnJlZCA8ZnJlZC5nYW9AaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCmlu
ZGV4IGYzNDZiZGQyNjZhYi4uM2RlNjY0ZGViMmY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYwpAQCAtNDYwLDYgKzQ2MCw3IEBAIHN0YXRpYyBpbnQgcGlwZWNvbmZfbW1pb193cml0
ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIHN0YXRpYyBp
OTE1X3JlZ190IGZvcmNlX25vbnByaXZfd2hpdGVfbGlzdFtdID0gewogCUdFTjlfQ1NfREVCVUdf
TU9ERTEsIC8vX01NSU8oMHgyMGVjKQogCUdFTjlfQ1RYX1BSRUVNUFRfUkVHLC8vX01NSU8oMHgy
MjQ4KQorCVBTX0lOVk9DQVRJT05fQ09VTlQsLy9fTU1JTygweDIzNDgpCiAJR0VOOF9DU19DSElD
S0VOMSwvL19NTUlPKDB4MjU4MCkKIAlfTU1JTygweDI2OTApLAogCV9NTUlPKDB4MjY5NCksCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
