Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BA6CC09
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 11:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135E26E35B;
	Thu, 18 Jul 2019 09:39:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DA16E35B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 09:39:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 02:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="187757272"
Received: from cfl-host.sh.intel.com ([10.239.158.129])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2019 02:39:56 -0700
From: fred gao <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/i915/gvt: Utility for valid command length check
Date: Thu, 18 Jul 2019 09:39:01 +0800
Message-Id: <20190718013901.3267-1-fred.gao@intel.com>
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

RnJvbTogIkdhbywgRnJlZCIgPGZyZWQuZ2FvQGludGVsLmNvbT4KCkFkZCB1dGlsaXR5IGZvciB2
YWxpZCBjb21tYW5kIGxlbmd0aCBjaGVjay4KCnYyOiBBZGQgRl9WQUxfQ09OU1QgZmxhZyB0byBp
ZGVudGlmeSB0aGUgdmFsdWUgaXMgY29uc3QKICAgIGFsdGhvdWdoIExFTiBtYXliZSB2YXJpYWJs
ZS4gKFpoZW55dSkKdjM6IHVudXNlZCBjb2RlIHJlbW92YWwsIGZsYWcgcmVuYW1lL2NvbmZsaWN0
LiAoWmhlbnl1KQp2NDogcmVkZWZpbmUgRl9JUF9BRFZBTkNFX0NVU1RPTSBhbmQgbW92ZSB0aGUg
Y2hlY2sgZnVuY3Rpb24gdG8KICAgIG5leHQgcGF0Y2guIChaaGVueXUpCgpTaWduZWQtb2ZmLWJ5
OiBHYW8sIEZyZWQgPGZyZWQuZ2FvQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvY21kX3BhcnNlci5jIHwgMTUgKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21k
X3BhcnNlci5jCmluZGV4IGIwOWRjMzE1ZTJkYS4uNDJhMTBiMjAwNzQ0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKQEAgLTM3OCwxNyArMzc4LDE3IEBAIHN0cnVjdCBjbWRf
aW5mbyB7CiAJY29uc3QgY2hhciAqbmFtZTsKIAl1MzIgb3Bjb2RlOwogCi0jZGVmaW5lIEZfTEVO
X01BU0sJKDFVPDwwKQorI2RlZmluZSBGX0xFTl9NQVNLCTNVCiAjZGVmaW5lIEZfTEVOX0NPTlNU
ICAxVQogI2RlZmluZSBGX0xFTl9WQVIgICAgMFUKKy8qIHZhbHVlIGlzIGNvbnN0IGFsdGhvdWdo
IExFTiBtYXliZSB2YXJpYWJsZSAqLworI2RlZmluZSBGX0xFTl9WQVJfRklYRUQgICAgKDE8PDEp
CiAKIC8qCiAgKiBjb21tYW5kIGhhcyBpdHMgb3duIGlwIGFkdmFuY2UgbG9naWMKICAqIGUuZy4g
TUlfQkFUQ0hfU1RBUlQsIE1JX0JBVENIX0VORAogICovCi0jZGVmaW5lIEZfSVBfQURWQU5DRV9D
VVNUT00gKDE8PDEpCi0KLSNkZWZpbmUgRl9QT1NUX0hBTkRMRQkoMTw8MikKKyNkZWZpbmUgRl9J
UF9BRFZBTkNFX0NVU1RPTSAoMTw8MikKIAl1MzIgZmxhZzsKIAogI2RlZmluZSBSX1JDUwlCSVQo
UkNTMCkKQEAgLTQxOCw5ICs0MTgsMTIgQEAgc3RydWN0IGNtZF9pbmZvIHsKIAkgKiBmbGFnID09
IEZfTEVOX1ZBUiA6IGxlbmd0aCBiaWFzIGJpdHMKIAkgKiBOb3RlOiBsZW5ndGggaXMgaW4gRFdv
cmQKIAkgKi8KLQl1OCBsZW47CisJdTMyIGxlbjsKIAogCXBhcnNlcl9jbWRfaGFuZGxlciBoYW5k
bGVyOworCisJLyogdmFsaWQgbGVuZ3RoIGluIERXb3JkICovCisJdTMyIHZhbGlkX2xlbjsKIH07
CiAKIHN0cnVjdCBjbWRfZW50cnkgewpAQCAtMTkxMiw3ICsxOTE1LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBjbWRfaW5mbyBjbWRfaW5mb1tdID0gewogCXsiTUlfUlNfQ09OVEVYVCIsIE9QX01J
X1JTX0NPTlRFWFQsIEZfTEVOX0NPTlNULCBSX1JDUywgRF9BTEwsIDAsIDEsCiAJCU5VTEx9LAog
Ci0JeyJNSV9ESVNQTEFZX0ZMSVAiLCBPUF9NSV9ESVNQTEFZX0ZMSVAsIEZfTEVOX1ZBUiB8IEZf
UE9TVF9IQU5ETEUsCisJeyJNSV9ESVNQTEFZX0ZMSVAiLCBPUF9NSV9ESVNQTEFZX0ZMSVAsIEZf
TEVOX1ZBUiwKIAkJUl9SQ1MgfCBSX0JDUywgRF9BTEwsIDAsIDgsIGNtZF9oYW5kbGVyX21pX2Rp
c3BsYXlfZmxpcH0sCiAKIAl7Ik1JX1NFTUFQSE9SRV9NQk9YIiwgT1BfTUlfU0VNQVBIT1JFX01C
T1gsIEZfTEVOX1ZBUiwgUl9BTEwsIERfQUxMLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
