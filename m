Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E619758
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 May 2019 06:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF989893;
	Fri, 10 May 2019 04:20:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9E389893
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 May 2019 04:20:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 21:20:52 -0700
X-ExtLoop1: 1
Received: from tinazhang-linux-1.bj.intel.com ([10.238.158.97])
 by orsmga007.jf.intel.com with ESMTP; 09 May 2019 21:20:49 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: kraxel@redhat.com, zhenyuw@linux.intel.com, zhiyuan.lv@intel.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, daniel@ffwll.ch,
 kalyan.kondapally@intel.com, hang.yuan@intel.com,
 ville.syrjala@linux.intel.com
Subject: [RFC PATCH v2 2/3] drm/i915/gvt: Introduce enable_direct_flip
 attribute
Date: Fri, 10 May 2019 12:15:27 +0800
Message-Id: <1557461728-2831-3-git-send-email-tina.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBhdHRyaWJ1dGUgaXMgaW50cm9kdWNlZCB0byB3b3JrIGFzIGEgc3dpdGNoIG9mIHRoZSBn
dnQtZyB2R1BVIGRpcmVjdApmbGlwIGZ1bmN0aW9uLiBVc2Vyc3BhY2UgY2FuIHNpbXBseSBzd2l0
Y2ggb24vb2ZmIHRoZSBkaXJlY3QgZmxpcApmdW5jdGlvbiBieSBlY2hvaW5nIDEvMCB0byB0aGlz
IGF0dHJpYnV0dGUuCgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyB8IDM4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKaW5kZXggYTY4YWRkZi4uMjkxMTgxOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKQEAgLTE1ODEsMTIgKzE1ODEsNTAgQEAgaHdfaWRf
c2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAog
CXJldHVybiBzcHJpbnRmKGJ1ZiwgIlxuIik7CiB9CiAKK3N0YXRpYyBzc2l6ZV90CitlbmFibGVf
ZGlyZWN0X2ZsaXBfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlICphdHRyLAorCSBjaGFyICpidWYpCit7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0g
bWRldl9mcm9tX2RldihkZXYpOworCisJaWYgKG1kZXYpIHsKKwkJc3RydWN0IGludGVsX3ZncHUg
KnZncHUgPSAoc3RydWN0IGludGVsX3ZncHUgKikKKwkJCW1kZXZfZ2V0X2RydmRhdGEobWRldik7
CisJCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiV1XG4iLAorCQkJICAgICAgIHZncHUtPmRpc3BsYXku
c2hhZG93X2Zicy5lbmFibGVfZGlyZWN0X2ZsaXApOworCX0KKwlyZXR1cm4gc3ByaW50ZihidWYs
ICJcbiIpOworfQorCitzdGF0aWMgc3NpemVfdAorZW5hYmxlX2RpcmVjdF9mbGlwX3N0b3JlKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkgICAg
IGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IG4pCit7CisJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
ID0gbWRldl9mcm9tX2RldihkZXYpOworCXNzaXplX3QgcmV0OworCXUzMiB2YWw7CisKKwlyZXQg
PSBrc3RydG91MzIoYnVmLCAwLCAmdmFsKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJ
aWYgKG1kZXYpIHsKKwkJc3RydWN0IGludGVsX3ZncHUgKnZncHUgPSAoc3RydWN0IGludGVsX3Zn
cHUgKikKKwkJCW1kZXZfZ2V0X2RydmRhdGEobWRldik7CisJCXZncHUtPmRpc3BsYXkuc2hhZG93
X2Zicy5lbmFibGVfZGlyZWN0X2ZsaXAgPSAhIXZhbDsKKwl9CisKKwlyZXR1cm4gbjsKK30KKwog
c3RhdGljIERFVklDRV9BVFRSX1JPKHZncHVfaWQpOwogc3RhdGljIERFVklDRV9BVFRSX1JPKGh3
X2lkKTsKK3N0YXRpYyBERVZJQ0VfQVRUUl9SVyhlbmFibGVfZGlyZWN0X2ZsaXApOwogCiBzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqaW50ZWxfdmdwdV9hdHRyc1tdID0gewogCSZkZXZfYXR0cl92
Z3B1X2lkLmF0dHIsCiAJJmRldl9hdHRyX2h3X2lkLmF0dHIsCisJJmRldl9hdHRyX2VuYWJsZV9k
aXJlY3RfZmxpcC5hdHRyLAogCU5VTEwKIH07CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
