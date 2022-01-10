Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32748A333
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jan 2022 23:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3062010E38A;
	Mon, 10 Jan 2022 22:52:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41FD10E38A;
 Mon, 10 Jan 2022 22:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641855164; x=1673391164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m502bKnqDu1MPt2XWEwc/gLG90+OO2iv/9G3Fl0ldOw=;
 b=RM2ssphCnSzibMzHpG3DWBlj3/uCboQnGQJ4kyaKAAjZr7TwyQVmNBN6
 sb+Pe4NGdeQxtFladGGuRRw4Rwl10pH7CcBvBpxEXEjy7MCwEUUIsG97m
 ptq2VWUWR8DPiVqQHBELtkjmWD5QfLxxmC1KIyGiqWiiM5WAIZ13C6xcv
 g9GDxgir+czOBnCMGDcpuhbe0JmujvW5/bMhJ5dmL8RDjqP0TPLko1TAC
 w4DvfeywpCLVLc2de5fMv7JuJfSdtQn6U3QXxXLPQQG7m/kmuOwwup3QM
 kMKrBRzHpVOFwbzBZPkUalh87CTMSxxfcv80/OQy05jEDuyrn531KTjzT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="223335448"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="223335448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 14:52:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="528473209"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga008.jf.intel.com with ESMTP; 10 Jan 2022 14:52:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 22:52:40 +0000
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.020;
 Mon, 10 Jan 2022 14:52:39 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYA9Tuucz5FdQejkegRXcQeTo5nqxdZ/oA
Date: Mon, 10 Jan 2022 22:52:38 +0000
Message-ID: <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
In-Reply-To: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBE140ACAC36B94B9C7C222F3A4E4756@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTAxLTA3IGF0IDE0OjQzICswMDAwLCBXYW5nLCBaaGkgQSB3cm90ZToNCj4g
SGkgZm9sa3M6DQo+IA0KPiBIYXBweSBob2xpZGF5cyEgVGhpcyBwdWxsIG1vc3RseSBjb250YWlu
cyB0aGUgY29kZSByZS1mYWN0b3JzIHBhdGNoZXMNCj4gZnJvbSBHdWVudGVyIFJvZWNrIGFuZCBS
aWthcmQuIEFsc28gYSBtaW5vciBjaGFuZ2UgZnJvbSBaaGVueXUuDQo+IA0KPiBaaGkNCj4gDQo+
IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCj4gM2JmYTdkNDBjZTczNmZmYmJm
ZTA3MTI3MDYxZjU0YjM1OWVlMmIxMjoNCj4gDQo+IMKgwqAgZHJtL2k5MTUvZGcyOiBBZGQgc3Vw
cG9ydCBmb3IgbmV3IERHMi1HMTEgcmV2aWQgMHg1ICgyMDIxLTA4LTA2DQo+IDA5OjAzOjEwIC0w
NzAwKQ0KPiANCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+IA0K
PiDCoMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXjCoHRhZ3MvZ3Z0LW5leHQt
MjAyMi0wMS0wNw0KPiANCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IGQ3YTg1
ODU0MzBmMmI2ZGY1OTYwYmJjMzA1ZWRjZWM1YTU1MTgwZjM6DQoNCkknbSBub3Qgc3VyZSB3aGF0
J3MgZ29pbmcgb24gaGVyZSwgYnV0Og0KDQpkaW06IG5vIHB1bGwgcmVxdWVzdCBmb3VuZA0KDQpk
aWQgeW91IGRvIGFueXRoaW5nIGRpZmZlcmVudCBvbiB0aGlzIHJvdW5kIGZvciBnZW5lcmF0aW5n
IGFuZCBzZW5kaW5nDQpvdXQgdGhpcyBwdWxsIHJlcXVlc3QgZW1haWw/DQoNCj4gDQo+IMKgwqAg
ZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSB2Z3B1X3R5cGVzICgyMDIxLTEyLTE2IDA5OjEzOjAyIC0w
NTAwKQ0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBHdWVudGVyIFJvZWNrICgxKToNCj4gwqDCoMKgwqDCoMKg
IGRybS9pOTE1L2d2dDogVXNlIGxpc3RfZW50cnkgdG8gYWNjZXNzIGxpc3QgbWVtYmVycw0KPiAN
Cj4gUmlrYXJkIEZhbGtlYm9ybiAoOSk6DQo+IMKgwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENv
bnN0aWZ5IGludGVsX2d2dF9ndHRfZ21hX29wcw0KPiDCoMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0
OiBDb25zdGlmeSBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMNCj4gwqDCoMKgwqDCoMKgIGRybS9pOTE1
L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0X2lycV9vcHMNCj4gwqDCoMKgwqDCoMKgIGRybS9pOTE1
L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0X3NjaGVkX3BvbGljeV9vcHMNCj4gwqDCoMKgwqDCoMKg
IGRybS9pOTE1L2d2dDogQ29uc3RpZnkgZ3Z0X21taW9fYmxvY2sNCj4gwqDCoMKgwqDCoMKgIGRy
bS9pOTE1L2d2dDogQ29uc3RpZnkgY21kX2ludGVycnVwdF9ldmVudHMNCj4gwqDCoMKgwqDCoMKg
IGRybS9pOTE1L2d2dDogQ29uc3RpZnkgZm9ybWF0cw0KPiDCoMKgwqDCoMKgwqAgZHJtL2k5MTUv
Z3Z0OiBDb25zdGlmeSBndHRfdHlwZV90YWJsZV9lbnRyeQ0KPiDCoMKgwqDCoMKgwqAgZHJtL2k5
MTUvZ3Z0OiBDb25zdGlmeSB2Z3B1X3R5cGVzDQo+IA0KPiBaaGVueXUgV2FuZyAoMSk6DQo+IMKg
wqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IEZpeCBjbWQgcGFyc2VyIGVycm9yIGZvciBQYXNzbWFy
azkNCj4gDQo+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmPCoMKgIHzC
oCAyICstDQo+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuY8KgwqDCoMKgwqDC
oCB8IDE4ICsrKy0tLS0tLQ0KPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rl
ci5jwqDCoCB8IDI0ICsrKysrKy0tLS0tLQ0KPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmPCoMKgwqDCoMKgwqDCoMKgwqAgfCA2OA0KPiArKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0NCj4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5owqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA0ICstDQo+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuY8KgwqDCoMKgIHwgMTMgKysrKy0tLQ0KPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaW50ZXJydXB0LmPCoMKgwqAgfCAxMCArKy0tLQ0KPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvaW50ZXJydXB0LmjCoMKgwqAgfMKgIDIgKy0NCj4gwqAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3NjaGVkX3BvbGljeS5jIHzCoCAyICstDQo+IMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9zY2hlZHVsZXIuaMKgwqDCoCB8wqAgMiArLQ0KPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvdmdwdS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQ0KPiDCoCAxMiBmaWxlcyBjaGFu
Z2VkLCA3MiBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkNCj4gDQoNCg==
