Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D522B04
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 06:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25378915E;
	Mon, 20 May 2019 04:59:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AD98915E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 04:59:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 21:59:35 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2019 21:59:35 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 19 May 2019 21:59:35 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 19 May 2019 21:59:34 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.249]) with mapi id 14.03.0415.000;
 Mon, 20 May 2019 12:59:33 +0800
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v4 0/2] Fix issues reported by klocwork
Thread-Topic: [PATCH v4 0/2] Fix issues reported by klocwork
Thread-Index: AQHVAM37p4VgMhWMo0am6lfAT4DMGKZzj9/Q
Date: Mon, 20 May 2019 04:59:32 +0000
Message-ID: <F3B0350DF4CB6849A642218320DE483D7DA1E5CD@SHSMSX104.ccr.corp.intel.com>
References: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
In-Reply-To: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGY1ZGZhZjMtODZlMS00M2M3LTg3YjktOWUwZjZmYjc2OTgwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidmJjbUJKUW9XZko5bTZjMmxQRmZoYUJtYnY0THlTWTNONXRxRFlTS1ZmUXNLWnN2MWdPaVVkYWVyMW43MHR5TCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UGluZyBmb3IgcmV2aWV3Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogaW50
ZWwtZ3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmddIE9uIEJlaGFsZiBPZiBBbGVrc2VpIEdpbWJpdHNraWkNClNlbnQ6IFRodXJzZGF5LCBN
YXkgMiwgMjAxOSAxMjo1OSBQTQ0KVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpDYzogR2ltYml0c2tpaSwgQWxla3NlaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNv
bT4NClN1YmplY3Q6IFtQQVRDSCB2NCAwLzJdIEZpeCBpc3N1ZXMgcmVwb3J0ZWQgYnkga2xvY3dv
cmsNCg0KVGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGZvdW5kIDExIGNyaXRpY2Fs
IGlzc3VlcyBhbmQgNyBlcnJvciBpc3N1ZXMgaW4gR1ZULWcgc291cmNlIGNvZGUuIEFmdGVyIHRo
ZSBhbmFseXphdGlvbiwgb25lIGNyaXRpY2FsIGlzc3VlIGFuZCA2ICJlcnJvcnMiIHdhcyBjb25j
bHVkZWQgYXMgaGFybWxlc3MuIFRoaXMgcGF0Y2hzZXQgZml4ZXMgb3RoZXIgY2FzZXMsIHdoaWNo
IG1pZ2h0IGNhdXNlIHBvdGVudGlhbCBpc3N1ZXMgaW4gZnV0dXJlLg0KDQp2NDoNCi0gTWlub3Ig
Y2hhbmdlcyB0byBvbmUgZXJyb3IgbWVzc2FnZSBpbiBwYXRjaCAxLiAoQ29saW4gWHUpDQotIEFm
dGVyIGRpc2N1c2lvbiB3ZSBhZ3JlZWQgdGhhdCBwYXRjaCAyIHJlbWFpbnMgdW5tb2RpZmllZC4N
Cg0KdjM6DQotIFJlbW92ZSB0eXBlZGVmIGFuZCBsZXQgdGhlIGVudW1lcmF0aW9uIHN0YXJ0cyBm
cm9tIHplcm8uIChaaGkgV2FuZykNCg0KVjI6DQotIFByaW50IHNvbWUgZXJyb3IgbWVzc2FnZXMg
aWYgcGFnZSB0YWJsZSB0eXBlIGlzIGludmFsaWQuIChDb2xpbiBYdSkNCi0gSW5jcmVhc2UgdGhl
IHNpemUgb2YgdGhlIGJ1ZmZlci4gKENvbGluIFh1KQ0KLSBJbml0aWFsaXplIGZiX2luZm8ub2Jq
IGluIHZncHVfZ2V0X3BsYW5lX2luZm8oKS4gKENvbGluIFh1KQ0KDQpBbGVrc2VpIEdpbWJpdHNr
aWkgKDIpOg0KICBkcm0vaTkxNS9ndnQ6IENoZWNrIGlmIGN1cl9wdF90eXBlIGlzIHZhbGlkDQog
IGRybS9pOTE1L2d2dDogQXNzaWduIE5VTEwgdG8gdGhlIHBvaW50ZXIgYWZ0ZXIgbWVtb3J5IGZy
ZWUuDQoNCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxMiArKysrKysrKysrKy0N
CiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQotLQ0K
Mi4xNy4xDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KSW50ZWwgRmlubGFuZCBPeQ0KUmVnaXN0ZXJlZCBBZGRy
ZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIEJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2
MDYgLSA0IERvbWljaWxlZCBpbiBIZWxzaW5raSANCg0KVGhpcyBlLW1haWwgYW5kIGFueSBhdHRh
Y2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yIHRoZSBzb2xlIHVz
ZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlv
biBieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFs
bCBjb3BpZXMuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2
