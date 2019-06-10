Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B423AFAA
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2019 09:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C14D89017;
	Mon, 10 Jun 2019 07:29:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782D689017
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Jun 2019 07:29:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 00:29:41 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga002.jf.intel.com with ESMTP; 10 Jun 2019 00:29:41 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Jun 2019 00:29:41 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Jun 2019 00:29:41 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.10]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.137]) with mapi id 14.03.0415.000;
 Mon, 10 Jun 2019 15:29:39 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/gvt: Double check batch buffer size after copy
Thread-Topic: [PATCH v2] drm/i915/gvt: Double check batch buffer size after
 copy
Thread-Index: AQHVH1Pcz8OeT72/1UKZmc5Vunv/JaaUfZPA
Date: Mon, 10 Jun 2019 07:29:38 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8764B6CE@SHSMSX101.ccr.corp.intel.com>
References: <20190610060916.609-1-tina.zhang@intel.com>
In-Reply-To: <20190610060916.609-1-tina.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmJmN2Q2N2MtNjBhNi00ZWRhLThmODgtYjBkMGNkYWNkYTk3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOEx5S21YMTY4aHVYbkxHYVJ3dU0zekxvZzNWOEFaYUxPekh1QlRaN3dDcHlhRjRrM3hvSHlTOG80WXdlUzNJcSJ9
x-ctpclassification: CTP_NT
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RGlzY3Vzc2VkIHdpdGggWWFuLiBTZWVtcyB3ZSBuZWVkIHYzIGZvciB0aGlzIHBhdGNoLiAKVGhh
bmtzLgoKQlIsClRpbmEKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBaaGFu
ZywgVGluYQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAxMCwgMjAxOSAyOjA5IFBNCj4gVG86IGludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFpoYW5nLCBUaW5hIDx0aW5hLnpo
YW5nQGludGVsLmNvbT47IHpoZW55dXdAbGludXguaW50ZWwuY29tOyBZdWFuLAo+IEhhbmcgPGhh
bmcueXVhbkBpbnRlbC5jb20+OyBaaGFvLCBZYW4gWSA8eWFuLnkuemhhb0BpbnRlbC5jb20+Cj4g
U3ViamVjdDogW1BBVENIIHYyXSBkcm0vaTkxNS9ndnQ6IERvdWJsZSBjaGVjayBiYXRjaCBidWZm
ZXIgc2l6ZSBhZnRlciBjb3B5Cj4gCj4gRG91YmxlIGNoZWNrIHRoZSBzaXplIG9mIHRoZSBwcml2
aWxlZ2UgYnVmZmVyIHRvIG1ha2Ugc3VyZSB0aGUgc2l6ZSByZW1haW5zCj4gdW5jaGFuZ2VkIGFm
dGVyIGNvcHkuCj4gCj4gdjI6Cj4gLSBVc2UgbGlnaHR3ZWlnaHQgd2F5IHRvIGF1ZGl0IGJhdGNo
IGJ1ZmZlciBlbmQuIChZYW4pCj4gCj4gQ2M6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDI3Cj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMK
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKPiBpbmRleCA2ZWE4ODI3
MGM4MTguLjU2YThhZGEwMDg5ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvY21kX3BhcnNlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuYwo+IEBAIC0xNzE2LDYgKzE3MTYsMjkgQEAgc3RhdGljIGludCBmaW5kX2JiX3NpemUoc3Ry
dWN0IHBhcnNlcl9leGVjX3N0YXRlCj4gKnMsIHVuc2lnbmVkIGxvbmcgKmJiX3NpemUpCj4gIAly
ZXR1cm4gMDsKPiAgfQo+IAo+ICtzdGF0aWMgaW50IGF1ZGl0X2JiX2VuZChzdHJ1Y3QgcGFyc2Vy
X2V4ZWNfc3RhdGUgKnMsIHZvaWQgKnZhKSB7Cj4gKwlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9
IHMtPnZncHU7Cj4gKwl1MzIgY21kID0gKih1MzIgKil2YTsKPiArCWNvbnN0IHN0cnVjdCBjbWRf
aW5mbyAqaW5mbzsKPiArCj4gKwlpbmZvID0gZ2V0X2NtZF9pbmZvKHMtPnZncHUtPmd2dCwgY21k
LCBzLT5yaW5nX2lkKTsKPiArCWlmIChpbmZvID09IE5VTEwpIHsKPiArCQlndnRfdmdwdV9lcnIo
InVua25vd24gY21kIDB4JXgsIG9wY29kZT0weCV4LAo+IGFkZHJfdHlwZT0lcywgcmluZyAlZCwg
d29ya2xvYWQ9JXBcbiIsCj4gKwkJCWNtZCwgZ2V0X29wY29kZShjbWQsIHMtPnJpbmdfaWQpLAo+
ICsJCQkocy0+YnVmX2FkZHJfdHlwZSA9PSBQUEdUVF9CVUZGRVIpID8KPiArCQkJInBwZ3R0IiA6
ICJnZ3R0Iiwgcy0+cmluZ19pZCwgcy0+d29ya2xvYWQpOwo+ICsJCXJldHVybiAtRUJBRFJRQzsK
PiArCX0KPiArCj4gKwlpZiAoKGluZm8tPm9wY29kZSA9PSBPUF9NSV9CQVRDSF9CVUZGRVJfRU5E
KSB8fAo+ICsJICAgICgoaW5mby0+b3Bjb2RlID09IE9QX01JX0JBVENIX0JVRkZFUl9TVEFSVCkg
JiYKPiArCSAgICAgKEJBVENIX0JVRkZFUl8yTkRfTEVWRUxfQklUKGNtZCkgPT0gMCkpKQo+ICsJ
CXJldHVybiAwOwo+ICsKPiArCXJldHVybiAtRUJBRFJRQzsKPiArfQo+ICsKPiAgc3RhdGljIGlu
dCBwZXJmb3JtX2JiX3NoYWRvdyhzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpICB7Cj4gIAlz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHMtPnZncHU7Cj4gQEAgLTE3ODgsNiArMTgxMSwxMCBA
QCBzdGF0aWMgaW50IHBlcmZvcm1fYmJfc2hhZG93KHN0cnVjdAo+IHBhcnNlcl9leGVjX3N0YXRl
ICpzKQo+ICAJCWdvdG8gZXJyX3VubWFwOwo+ICAJfQo+IAo+ICsJcmV0ID0gYXVkaXRfYmJfZW5k
KHMsIGJiLT52YSArIHN0YXJ0X29mZnNldCArIGJiX3NpemUgLSA0KTsKPiArCWlmIChyZXQpCj4g
KwkJZ290byBlcnJfdW5tYXA7Cj4gKwo+ICAJSU5JVF9MSVNUX0hFQUQoJmJiLT5saXN0KTsKPiAg
CWxpc3RfYWRkKCZiYi0+bGlzdCwgJnMtPndvcmtsb2FkLT5zaGFkb3dfYmIpOwo+IAo+IC0tCj4g
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
