Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE1116C9
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 May 2019 12:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A5389216;
	Thu,  2 May 2019 10:00:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B8189216
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 May 2019 10:00:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 03:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,421,1549958400"; d="scan'208";a="342671722"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2019 03:00:50 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 0/2] Fix issues reported by klocwork
Date: Thu,  2 May 2019 12:59:20 +0300
Message-Id: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGZvdW5kIDExIGNyaXRpY2FsIGlzc3Vl
cyBhbmQgNyBlcnJvcgppc3N1ZXMgaW4gR1ZULWcgc291cmNlIGNvZGUuIEFmdGVyIHRoZSBhbmFs
eXphdGlvbiwgb25lIGNyaXRpY2FsIGlzc3VlCmFuZCA2ICJlcnJvcnMiIHdhcyBjb25jbHVkZWQg
YXMgaGFybWxlc3MuIFRoaXMgcGF0Y2hzZXQgZml4ZXMgb3RoZXIKY2FzZXMsIHdoaWNoIG1pZ2h0
IGNhdXNlIHBvdGVudGlhbCBpc3N1ZXMgaW4gZnV0dXJlLgoKdjQ6Ci0gTWlub3IgY2hhbmdlcyB0
byBvbmUgZXJyb3IgbWVzc2FnZSBpbiBwYXRjaCAxLiAoQ29saW4gWHUpIAotIEFmdGVyIGRpc2N1
c2lvbiB3ZSBhZ3JlZWQgdGhhdCBwYXRjaCAyIHJlbWFpbnMgdW5tb2RpZmllZC4KCnYzOgotIFJl
bW92ZSB0eXBlZGVmIGFuZCBsZXQgdGhlIGVudW1lcmF0aW9uIHN0YXJ0cyBmcm9tIHplcm8uICha
aGkgV2FuZykKClYyOgotIFByaW50IHNvbWUgZXJyb3IgbWVzc2FnZXMgaWYgcGFnZSB0YWJsZSB0
eXBlIGlzIGludmFsaWQuIChDb2xpbiBYdSkKLSBJbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgYnVm
ZmVyLiAoQ29saW4gWHUpCi0gSW5pdGlhbGl6ZSBmYl9pbmZvLm9iaiBpbiB2Z3B1X2dldF9wbGFu
ZV9pbmZvKCkuIChDb2xpbiBYdSkKCkFsZWtzZWkgR2ltYml0c2tpaSAoMik6CiAgZHJtL2k5MTUv
Z3Z0OiBDaGVjayBpZiBjdXJfcHRfdHlwZSBpcyB2YWxpZAogIGRybS9pOTE1L2d2dDogQXNzaWdu
IE5VTEwgdG8gdGhlIHBvaW50ZXIgYWZ0ZXIgbWVtb3J5IGZyZWUuCgogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMTcuMQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVs
IEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApC
dXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtp
IAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRp
YWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMp
LiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGli
aXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRh
Y3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
