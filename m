Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3B10298B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 17:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EBC6E395;
	Tue, 19 Nov 2019 16:39:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B296E395;
 Tue, 19 Nov 2019 16:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcEZQTOCs6980vFn7VP6esZNMXkCuoycKh9jQsU6Sfw3rvy6EbiVoVmdaxK9qSiDUK+fjqECex5O19U7g7lXObfogCjqPpJlmiPfUpaOC4U6dBFi0CZCQ4pzNzwpAfYcV9ZS74NAPdKN+i4BEpZ4KXb9ev4V34Thcc8b1QD6wcQ/FwftbNaulT2ZWVlGUmvvrQA+TVH7cYrtEzKMqFor8tY24h9rCMTkkubXtLg/X4dfpL5eOhSb/0vydLq8SZESGL+pvYLj2hhTP46nt+3U55jW07ToXpwc6pDmvOX8U822Ka+w9LFZ4rqDFfjA7kmfFCiiPVxcKM41Qm1jXjiMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqkL59Hp4PTeGh2cJxP4VyDFhSQguYm0ggGkeZ0BfVY=;
 b=k8BSobtTFzlurWAIYRJGI3E23ueXFW7fJr0OkOhCu3I9Z1NJc9iqVRRmnSo+V2A2axpICEfq37LWqe2lJMm3ipwlEnDqZx4eGqy566cZDsP34VrMJr/Um3pmJRiJ8OwQUIjxk4Jf8jPit7vmUAGrrpSuXDZgiNguoVOUCAs9rK8OqIk238/OsnOpzJv0dp7pMK1vFB6zqN4TKccMgf+j+2Uy9EdiOD6qIud7+lNACc57FoyZTMk6iY7vu7u1bXdAhc5XdywMwrwB+JkG+R91GOTRtLlUlIg17XwLPGqpc8cmj9RwaQBpGJjeDsn40r2y5zCdWoeRApKIQd+YXPx77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB5480.eurprd05.prod.outlook.com (20.177.192.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Tue, 19 Nov 2019 16:39:31 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 16:39:31 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Thread-Topic: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Thread-Index: AQHVnf/RA3TghfsdmEu7f/QASUhCzKeRCnoAgADFaICAAKEIAIAAGGQAgAAqg4A=
Date: Tue, 19 Nov 2019 16:39:30 +0000
Message-ID: <20191119163927.GA4967@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-7-jasowang@redhat.com>
 <20191118151706.GA371978@kroah.com>
 <4fed1e7e-9d27-d441-f0a1-0eb6f15e90b1@redhat.com>
 <20191119124000.GB26739@mellanox.com>
 <9e786429-866d-e2ca-45f9-30c8e1ebece9@redhat.com>
In-Reply-To: <9e786429-866d-e2ca-45f9-30c8e1ebece9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3970992-6bdf-4821-0d19-08d76d0f0cdc
x-ms-traffictypediagnostic: DB7PR05MB5480:|DB7PR05MB5480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR05MB54804906A1C4986657C2C8CDCF4C0@DB7PR05MB5480.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(81156014)(6506007)(25786009)(3846002)(486006)(26005)(5660300002)(86362001)(52116002)(66476007)(66446008)(64756008)(66946007)(14454004)(33656002)(7416002)(7736002)(7406005)(6116002)(186003)(66066001)(2906002)(6512007)(99286004)(11346002)(1076003)(256004)(8936002)(478600001)(316002)(6486002)(305945005)(4326008)(6916009)(6246003)(66556008)(8676002)(2616005)(102836004)(81166006)(76176011)(36756003)(54906003)(476003)(71200400001)(229853002)(71190400001)(386003)(446003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB5480;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AWUkuZQhfWNKoXMFdxNnK+LiO95JDOWEEPWRRAgxfs8mqXeCHHeWC3zRmVefeD0zCvLsYQKTGb+LBMOzRM+oACUcmbvxolSYVJRCW5eGq160y40sOFTJTPwZ2QcFvxATvh0F6rSvW01D1Xnm76xaoyTSAr9wwOqbylVKOP7A3F0e1++Mbbem4f/0gHE6R9FHRTDwwtCR6l0CVZTydAT10uvBEg5Rq5DONkIhTzpFDoDiDafMDC1/p5V8tkhhwgBGFlDDU6tQgwqwZ5vBE5f/8eIq7/WTuDXsnD31ZPSvCkWPubTc37OvW5xf3DmW0JBgRAZSyGqWBwyuqdq9n1GSlMbdywY6HTLPcfBKQ7Q64773u/HUyO41eyasBPXBfukJMGdPsbEM5zEIsngirLLss7iUV8hIX9afP5MKuN9I44OAuHnWOZ6jfnW8O58SgrmQ
Content-ID: <2FFB180DA087624395E05639E2EB1D15@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3970992-6bdf-4821-0d19-08d76d0f0cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 16:39:30.8526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBtJrHaL2woso79EjX4N1uUfPfVqLHauusxSPXxuDKd+U/ECfyhyD76kumy+lLWDjNEIBcnDpLS1XlZe1GWu7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB5480
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqkL59Hp4PTeGh2cJxP4VyDFhSQguYm0ggGkeZ0BfVY=;
 b=mGMR2Da2C7F2NTsdOB6l/UQK3ZoC75vuaQDCmQZMPnv8Kihkpz5f35+ZJFcITE0hHV620ogtd7w+gq+N8+WELOfYY90HwN6wieOZ6cckNoon3ff9+V5LB472/manoJ4AKSZMITnGbR/qp91vRvid32ACxVDmelRWXB5/fMEULzk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTA6MDc6MThQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToNCj4gDQo+IE9uIDIwMTkvMTEvMTkg5LiL5Y2IODo0MCwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgTm92IDE5LCAyMDE5IGF0IDExOjAzOjM5QU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6DQo+ID4gPiA+IEFsc28sIHNlZSB0aGUgb3RoZXIgY29udmVyc2F0aW9ucyB3ZSBh
cmUgaGF2aW5nIGFib3V0IGEgInZpcnR1YWwiIGJ1cw0KPiA+ID4gPiBhbmQgZGV2aWNlcy4gIEkg
ZG8gbm90IHdhbnQgdG8gaGF2ZSB0d28gZGlmZmVyZW50IHdheXMgb2YgZG9pbmcgdGhlIHNhbWUN
Cj4gPiA+ID4gdGhpbmcgaW4gdGhlIGtlcm5lbCBhdCB0aGUgc2FtZSB0aW1lIHBsZWFzZS4gIFBs
ZWFzZSB3b3JrIHRvZ2V0aGVyIHdpdGgNCj4gPiA+ID4gdGhlIEludGVsIGRldmVsb3BlcnMgdG8g
c29sdmUgdGhpcyBpbiBhIHVuaWZpZWQgd2F5LCBhcyB5b3UgYm90aA0KPiA+ID4gPiBuZWVkL3dh
bnQgdGhlIHNhbWUgdGhpbmcgaGVyZS4NCj4gPiA+IFN1cmUsIHNvbWUgZnVuY3Rpb25zIGxvb2tz
IHNpbWlsYXIsIGJ1dCB0aGUgInZpcnR1YWwiIGJ1cyBkb2VzIG5vdCBjb250YWluIGENCj4gPiA+
IG1hbmFnZW1lbnQgaW50ZXJmYWNlIGFuZCBpdCdzIG5vdCBjbGVhciB0aGF0IGhvdyBpdCBjYW4g
YmUgdXNlZCBieSB1c2Vyc3BhY2UNCj4gPiA+IGRyaXZlci4gRm9yIHRoaXMgc2VyaWVzLCBzeXNm
cy9HVUlEIGJhc2VkIG1hbmFnZW1lbnQgaW50ZXJmYWNlIGlzIHJldXNlZCBhbmQNCj4gPiA+IHdl
IGhhZCBhIGNvbmNyZXRlIGV4YW1wbGUgb2YgaG93IGl0IHdvdWxkIGJlIHVzZWQgYnkgdXNlcnNw
YWNlIGRyaXZlclsxXSBhbmQNCj4gPiA+IGEgcmVhbCBoYXJkd2FyZSBkcml2ZXIgaW1wbGVtZW50
YXRpb25bMl0uDQo+ID4gVGhlIGxpZmVjeWNsZSBzdHVmZiBzaG91bGQgYmUgcmUtdXNlZCB0aHJv
dWdoIGEgbGlicmFyeSBvZiB0aGlzIGd1aWQNCj4gPiBzdHVmZiwgbm90IGJ5ICdzdWJjbGFzc2lu
ZycgbWRldl9kZXZpY2UNCj4gDQo+IEJ1dCBtZGV2IHByb3ZpZGVzIG1vcmUgdGhhbiBsaWZlY3lj
bGUgbWFuYWdlbWVudDogdHlwZSBtYW5hZ2VtZW50LCBJT01NVQ0KPiBzdXBwb3J0IGV0Yy4gQW5k
IG1vcmUgY291bGQgYmUgYWRkZWQgaW4gdGhlIGZ1dHVyZS4NCg0KaW9tbXUgc3VwcG9ydCBjb21l
cyBmcm9tIGRtYV9vcHMsIG5vdCBtZGV2Lg0KDQptZGV2IG9ubHkgcHJvdmlkZXMgdmZpbywgYW5k
IGluIHRoaXMgZXhhbXBsZSB0aGVyZSBpcyBubyB1c2Ugb2YgdGhvc2UNCnZmaW8gb3BzIC0gc28g
aXQgaXMgbm90IG1kZXYuDQogDQo+IEhhdmluZyBhIGxpYnJhcnkgdGhhdCBzZXJ2ZXMgZXhhY3Rs
eSBmb3IgdGhlIGNhc2Ugb2YgbWRldiBzZWVtcyBsZXNzDQo+IGNvbnZlbmllbnQgdGhhbiBtYWtp
bmcgbWRldl9kZXZpY2UgYSAncGFyZW50IGNsYXNzJy4NCg0KSXQgaXMgdGhlIGRlc2lnbiBwYXR0
ZXJuIHRoZSBkZXZpY2UgY29yZSB1c2VzDQoNCkphc29uDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
