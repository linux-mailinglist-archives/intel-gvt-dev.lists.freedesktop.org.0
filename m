Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24037173
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Jun 2019 12:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38E89317;
	Thu,  6 Jun 2019 10:17:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695C989317
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Jun 2019 10:17:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 03:17:54 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 06 Jun 2019 03:17:54 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 6 Jun 2019 03:17:54 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 6 Jun 2019 03:17:53 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.10]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.187]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 18:17:52 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: RE: [RFC PATCH v2 1/3] vfio: Use capability chains to handle device
 specific irq
Thread-Topic: [RFC PATCH v2 1/3] vfio: Use capability chains to handle
 device specific irq
Thread-Index: AQHVGrx1sbtkzcdtCkGKiqXjrLufOqaL7AoAgADZGxD//4zbAIAB2aBQ
Date: Thu, 6 Jun 2019 10:17:51 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8764837E@SHSMSX101.ccr.corp.intel.com>
References: <20190604095534.10337-1-tina.zhang@intel.com>
 <20190604095534.10337-2-tina.zhang@intel.com>
 <20190605040446.GW9684@zhen-hp.sh.intel.com>
 <237F54289DF84E4997F34151298ABEBC87646B5C@SHSMSX101.ccr.corp.intel.com>
 <20190605100942.bceke6yqjynuwk3z@sirius.home.kraxel.org>
In-Reply-To: <20190605100942.bceke6yqjynuwk3z@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWY5MDgyNjMtZTFlMS00NzU5LTljYTItYzAxNDcyYmYwODg1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRmoxeWpBOXVaeUxJaU02TUVzcTZ0bXBzdnlnZVpYQjZjMnU5WHZDRmk3eVJRSXB2MDIrakZCNVpkaUJhRXJDZCJ9
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBb
bWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uDQo+
IEJlaGFsZiBPZiBrcmF4ZWxAcmVkaGF0LmNvbQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwg
MjAxOSA2OjEwIFBNDQo+IFRvOiBaaGFuZywgVGluYSA8dGluYS56aGFuZ0BpbnRlbC5jb20+DQo+
IENjOiBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBrdm1Admdlci5rZXJuZWwu
b3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgWmhlbnl1IFdhbmcgPHpoZW55
dXdAbGludXguaW50ZWwuY29tPjsgWXVhbiwNCj4gSGFuZyA8aGFuZy55dWFuQGludGVsLmNvbT47
IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBMdiwgWmhpeXVhbg0KPiA8emhpeXVhbi5sdkBp
bnRlbC5jb20+OyBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV2FuZywgWmhp
IEENCj4gPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2
MiAxLzNdIHZmaW86IFVzZSBjYXBhYmlsaXR5IGNoYWlucyB0byBoYW5kbGUgZGV2aWNlDQo+IHNw
ZWNpZmljIGlycQ0KPiANCj4gICBIaSwNCj4gDQo+ID4gPiBSZWFsbHkgbmVlZCB0byBzcGxpdCBm
b3IgZGlmZmVyZW50IHBsYW5lcz8gSSdkIGxpa2UgYQ0KPiA+ID4gVkZJT19JUlFfU1VCVFlQRV9H
RlhfRElTUExBWV9FVkVOVA0KPiA+ID4gc28gdXNlciBzcGFjZSBjYW4gcHJvYmUgY2hhbmdlIGZv
ciBhbGwuDQo+IA0KPiA+IFVzZXIgc3BhY2UgY2FuIGNob29zZSB0byB1c2VyIGRpZmZlcmVudCBo
YW5kbGVycyBhY2NvcmRpbmcgdG8gdGhlDQo+ID4gc3BlY2lmaWMgZXZlbnQuIEZvciBleGFtcGxl
LCB1c2VyIHNwYWNlIG1pZ2h0IG5vdCB3YW50IHRvIGhhbmRsZSBldmVyeQ0KPiA+IGN1cnNvciBl
dmVudCBkdWUgdG8gcGVyZm9ybWFuY2UgY29uc2lkZXJhdGlvbi4gQmVzaWRlcywgaXQgY2FuIHJl
ZHVjZQ0KPiA+IHRoZSBwcm9iZSB0aW1lcywgYXMgd2UgZG9uJ3QgbmVlZCB0byBwcm9iZSB0d2lj
ZSB0byBtYWtlIHN1cmUgaWYgYm90aA0KPiA+IGN1cnNvciBwbGFuZSBhbmQgcHJpbWFyeSBwbGFu
ZSBoYXZlIGJlZW4gdXBkYXRlZC4NCj4gDQo+IEknZCBzdWdnZXN0IHRvIHVzZSB0aGUgdmFsdWUg
cGFzc2VkIHZpYSBldmVudGZkIGZvciB0aGF0LCBpLmUuIGluc3RlYWQgb2YNCj4gc2VuZGluZyAi
MSIgdW5jb25kaXRpb25hbGx5IHNlbmQgYSBtYXNrIG9mIGNoYW5nZWQgcGxhbmVzLg0KSWYgdGhl
cmUgaXMgb25seSBvbmUgZXZlbnRmZCB3b3JraW5nIGZvciBHRlhfRElTUExBWSwgc2hvdWxkIGl0
IGJlICBWRklPX0lSUV9JTkZPX0VWRU5URkQgYW5kIFZGSU9fSVJRX0lORk9fQVVUT01BU0tFRD8g
aS5lLiBhZnRlciBzaWduYWxpbmcsIHRoZSBpbnRlcnJ1cHQgaXMgYXV0b21hdGljYWxseSBtYXNr
ZWQgYW5kIHRoZSB1c2VyIHNwYWNlIG5lZWRzIHRvIHVubWFzayB0aGUgbGluZSB0byByZWNlaXZl
IG5ldyBpcnEgZXZlbnQuDQoNCkJSLA0KVGluYQ0KDQoNCj4gDQo+IGNoZWVycywNCj4gICBHZXJk
DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg==
