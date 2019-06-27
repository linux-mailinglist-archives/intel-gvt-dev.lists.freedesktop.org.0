Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D457EC1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 10:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134F6E81E;
	Thu, 27 Jun 2019 08:55:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB096E81E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 08:55:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 01:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="156170938"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 27 Jun 2019 01:55:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 01:55:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 01:55:23 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Jun 2019 01:55:23 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.87]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.185]) with mapi id 14.03.0439.000;
 Thu, 27 Jun 2019 16:55:22 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Thread-Topic: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Thread-Index: AQHVLJqY892xL/jYXUCHg0oNNo51Q6augUsAgACuxqA=
Date: Thu, 27 Jun 2019 08:55:21 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC87683644@SHSMSX101.ccr.corp.intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-2-tina.zhang@intel.com>
 <20190627061942.k5onxbm27dju3iv5@sirius.home.kraxel.org>
In-Reply-To: <20190627061942.k5onxbm27dju3iv5@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWFhMDI3NzQtZDYwMC00YjQ4LTg2NzEtYmY4MjQxM2UyNWE3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWWRINGo5MDRjMDBpcThxZ1JQb2JaTUZjQlFObEdLM3JDU2pBYzBQT2g0RXFJNmMzbHNHeWVPSUpGSUVzZXorOCJ9
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
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
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
IEJlaGFsZiBPZiBHZXJkIEhvZmZtYW5uDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDI3LCAyMDE5
IDI6MjAgUE0NCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT47IGt2bUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyB6aGVueXV3QGxpbnV4LmludGVsLmNv
bTsgWXVhbiwgSGFuZw0KPiA8aGFuZy55dWFuQGludGVsLmNvbT47IGFsZXgud2lsbGlhbXNvbkBy
ZWRoYXQuY29tOyBMdiwgWmhpeXVhbg0KPiA8emhpeXVhbi5sdkBpbnRlbC5jb20+OyBpbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV2FuZywgWmhpIEENCj4gPHpoaS5hLndhbmdA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MyAxLzRdIHZmaW86IERlZmlu
ZSBkZXZpY2Ugc3BlY2lmaWMgaXJxIHR5cGUNCj4gY2FwYWJpbGl0eQ0KPiANCj4gICBIaSwNCj4g
DQo+ID4gK3N0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsNCj4gPiArCXN0cnVjdCB2Zmlv
X2luZm9fY2FwX2hlYWRlciBoZWFkZXI7DQo+ID4gKwlfX3UzMiB0eXBlOyAgICAgLyogZ2xvYmFs
IHBlciBidXMgZHJpdmVyICovDQo+ID4gKwlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVjaWZp
YyAqLw0KPiANCj4gRG8gd2UgcmVhbGx5IG5lZWQgYm90aCB0eXBlIGFuZCBzdWJ0eXBlPw0KVGhl
biwgaWYgb25lIGRldmljZSBoYXMgc2V2ZXJhbCBpcnFzLCBob3cgY2FuIHdlIGlkZW50aWZ5IHRo
ZW0/DQpUaGFua3MuDQoNCkJSLA0KdGluYQ0KPiANCj4gY2hlZXJzLA0KPiAgIEdlcmQNCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
