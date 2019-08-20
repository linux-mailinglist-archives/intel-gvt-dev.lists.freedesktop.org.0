Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB6956C3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Aug 2019 07:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7334F6E5DB;
	Tue, 20 Aug 2019 05:41:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5C46E5D9;
 Tue, 20 Aug 2019 05:41:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 22:41:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,407,1559545200"; d="scan'208";a="207243533"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2019 22:41:19 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Don't deballoon unused ggtt drm_mm_node in
 linux guest
Date: Tue, 20 Aug 2019 13:46:17 +0800
Message-Id: <1566279978-9659-1-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBjYWxsIHRyYWNlIG1heSBleGlzdCBpbiBsaW51eCBndWVzdCBkbWVzZyB3
aGVuIGd1ZXN0IGk5MTUKZHJpdmVyIGlzIHVubG9hZGVkLgpbICAgOTAuNzc2NjEwXSBbZHJtOnZn
dF9kZWJhbGxvb25fc3BhY2UuaXNyYS4wIFtpOTE1XV0gZGViYWxsb29uIHNwYWNlOiByYW5nZSBb
MHgwIC0gMHgwXSAwIEtpQi4KWyAgIDkwLjc3NjYyMV0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgMDAwMDAwMDAwMDAwMDBjMApbICAgOTAu
Nzc2NjkxXSBJUDogZHJtX21tX3JlbW92ZV9ub2RlKzB4NGQvMHgzMjAgW2RybV0KWyAgIDkwLjc3
NjcxOF0gUEdEIDgwMDAwMDAxMmM3ZDAwNjcgUDREIDgwMDAwMDAxMmM3ZDAwNjcgUFVEIDEzOGU0
YzA2NyBQTUQgMApbICAgOTAuNzc3MDkxXSB0YXNrOiBmZmZmOWFkYWI2MGYyZjAwIHRhc2suc3Rh
Y2s6IGZmZmZhZjM5YzBmZTAwMDAKWyAgIDkwLjc3NzE0Ml0gUklQOiAwMDEwOmRybV9tbV9yZW1v
dmVfbm9kZSsweDRkLzB4MzIwIFtkcm1dClsgICA5MC43Nzc1NzNdIENhbGwgVHJhY2U6ClsgICA5
MC43Nzc2NTNdICBpbnRlbF92Z3RfZGViYWxsb29uKzB4NGMvMHg2MCBbaTkxNV0KWyAgIDkwLjc3
NzcyOV0gIGk5MTVfZ2d0dF9jbGVhbnVwX2h3KzB4MTIxLzB4MTkwIFtpOTE1XQpbICAgOTAuNzc3
NzkyXSAgaTkxNV9kcml2ZXJfdW5sb2FkKzB4MTQ1LzB4MTgwIFtpOTE1XQpbICAgOTAuNzc3ODU2
XSAgaTkxNV9wY2lfcmVtb3ZlKzB4MTUvMHgyMCBbaTkxNV0KWyAgIDkwLjc3Nzg5MF0gIHBjaV9k
ZXZpY2VfcmVtb3ZlKzB4M2IvMHhjMApbICAgOTAuNzc3OTE2XSAgZGV2aWNlX3JlbGVhc2VfZHJp
dmVyX2ludGVybmFsKzB4MTU3LzB4MjIwClsgICA5MC43Nzc5NDVdICBkcml2ZXJfZGV0YWNoKzB4
MzkvMHg3MApbICAgOTAuNzc3OTY3XSAgYnVzX3JlbW92ZV9kcml2ZXIrMHg1MS8weGQwClsgICA5
MC43Nzc5OTBdICBwY2lfdW5yZWdpc3Rlcl9kcml2ZXIrMHgyMy8weDkwClsgICA5MC43NzgwMTld
ICBTeVNfZGVsZXRlX21vZHVsZSsweDFkYS8weDI0MApbICAgOTAuNzc4MDQ1XSAgZW50cnlfU1lT
Q0FMTF82NF9mYXN0cGF0aCsweDI0LzB4ODcKWyAgIDkwLjc3ODA3Ml0gUklQOiAwMDMzOjB4N2Yz
NDMxMmFmMDY3ClsgICA5MC43NzgwOTJdIFJTUDogMDAyYjowMDAwN2ZmZGVhM2RhMGQ4IEVGTEFH
UzogMDAwMDAyMDYKWyAgIDkwLjc3ODI5N10gUklQOiBkcm1fbW1fcmVtb3ZlX25vZGUrMHg0ZC8w
eDMyMCBbZHJtXSBSU1A6IGZmZmZhZjM5YzBmZTNkYzAKWyAgIDkwLjc3ODM0NF0gLS0tWyBlbmQg
dHJhY2UgZjRiMWJjODMwNWZjNTlkZCBdLS0tCgpGb3VyIGRybV9tbV9ub2RlIGFyZSB1c2VkIHRv
IHJlc2VydmUgZ3Vlc3QgZ2d0dCBzcGFjZSwgYnV0IHNvbWUgb2YgdGhlbQptYXkgYmUgc2tpcHBl
ZCBhbmQgbm90IGluaXRpYWxpc2VkIGR1ZSB0byBzcGFjZSBjb25zdHJhaW50cyBpbgppbnRlbF92
Z3RfYmFsbG9vbigpLiBJZiBkcm1fbW1fcmVtb3ZlX25vZGUoKSBpcyBjYWxsZWQgd2l0aAp1bmlu
aXRpYWxpemVkIGRybV9tbV9ub2RlLCB0aGUgYWJvdmUgY2FsbCB0cmFjZSBvY2N1cnMuCgpUaGlz
IHBhdGNoIGNoZWNrIGRybV9tbV9ub2RlJ3MgdmFsaWRpdHkgYmVmb3JlIGNhbGxpbmcKZHJtX21t
X3JlbW92ZV9ub2RlKCkuCgpGaXhlczogZmY4Zjc5NzU1N2M3KCJkcm0vaTkxNTogcmV0dXJuIHRo
ZSBjb3JyZWN0IHVzYWJsZSBhcGVydHVyZSBzaXplIHVuZGVyIGd2dCBlbnZpcm9ubWVudCIpCkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFhpb25nIFpoYW5nIDx4aW9u
Zy55LnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZncHUu
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3ZncHUuYwppbmRleCBiZjJiODM3Li5kMmZkNjZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3ZncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Zn
cHUuYwpAQCAtMTE5LDYgKzExOSw5IEBAIHN0YXRpYyBzdHJ1Y3QgX2JhbGxvb25faW5mb18gYmxf
aW5mbzsKIHN0YXRpYyB2b2lkIHZndF9kZWJhbGxvb25fc3BhY2Uoc3RydWN0IGk5MTVfZ2d0dCAq
Z2d0dCwKIAkJCQlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUpCiB7CisJaWYgKCFub2RlLT5hbGxv
Y2F0ZWQpCisJCXJldHVybjsKKwogCURSTV9ERUJVR19EUklWRVIoImRlYmFsbG9vbiBzcGFjZTog
cmFuZ2UgWzB4JWxseCAtIDB4JWxseF0gJWxsdSBLaUIuXG4iLAogCQkJIG5vZGUtPnN0YXJ0LAog
CQkJIG5vZGUtPnN0YXJ0ICsgbm9kZS0+c2l6ZSwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
