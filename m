Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0925DF6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 May 2019 08:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6882589760;
	Wed, 22 May 2019 06:20:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E7A89760
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2019 06:20:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 23:20:20 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by orsmga002.jf.intel.com with ESMTP; 21 May 2019 23:20:20 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Update force-to-nonpriv register whitelist
Date: Wed, 22 May 2019 14:20:18 +0800
Message-Id: <20190522062018.14017-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SG9zdCBwcmludHMgYmVsb3cgd2FybmluZyBtZXNzYWdlIHdoZW4gZ3Vlc3QgcnVubmluZyBzb21l
IGFwcGxpY2F0aW9uOgoiZ3Z0OiB2Z3B1KDEpIEludmFsaWQgRk9SQ0VfTk9OUFJJViB3cml0ZSAy
NzU0IGF0IDI0ZjAiLgoiZ3Z0OiB2Z3B1KDEpIEludmFsaWQgRk9SQ0VfTk9OUFJJViB3cml0ZSAy
OGEwIGF0IDI0ZjAiLgoKUmVnaXN0ZXJzIDB4Mjc1NCBhbmQgMHgyOGEwIGFyZSByZXF1aXJlZCBi
eSBndWVzdCBzbyBhZGQgdG8gd2hpdGVsaXN0LgoKU2lnbmVkLW9mZi1ieTogQ29saW4gWHUgPGNv
bGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jCmluZGV4IGUwOWJkNmUwY2M0ZC4uYjRmYzdmOTVjYmUxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwpAQCAtNDY0LDYgKzQ2NCw4IEBAIHN0YXRpYyBpOTE1
X3JlZ190IGZvcmNlX25vbnByaXZfd2hpdGVfbGlzdFtdID0gewogCV9NTUlPKDB4MjY5MCksCiAJ
X01NSU8oMHgyNjk0KSwKIAlfTU1JTygweDI2OTgpLAorCV9NTUlPKDB4Mjc1NCksCisJX01NSU8o
MHgyOGEwKSwKIAlfTU1JTygweDRkZTApLAogCV9NTUlPKDB4NGRlNCksCiAJX01NSU8oMHg0ZGZj
KSwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
