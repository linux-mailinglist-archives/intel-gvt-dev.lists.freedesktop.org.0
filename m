Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302B10261D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 15:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B626E2C7;
	Tue, 19 Nov 2019 14:14:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40058.outbound.protection.outlook.com [40.107.4.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1721D6E2C7;
 Tue, 19 Nov 2019 14:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ssn0MGtL2QAB1UN1f0+DtpsY1JRPEdDML15RP5lWWnv8JoFbz5rQtcNxQdzIEs+dqna6286LgOUVgG/v/BoSTl6ErvL4IX1cabjkbL9uwlHKbH4yrVfBqxHrmoWAVarSySMzQE4DbjW5/ijgmlVG7ryXHkm/8yUUqbXdUDcMUPrYNp61FvtcaAd+JLBpxZ9Ozgiw3BSMCOapeYOe90nSECTmLB8b7G8N0pXXd6KA7GjR1pZFSTa60ycNAjrWvgd3rMMNl5nA0OuTM46fKd3Jm0flRd0FnqKD90XitnHX3SFR4iRyVv133kLrf/UXo/6GDh0XT+9S8vkiaFdrynaenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6LyQftnn3XD+pX+ae3e8lVuxM1xPnHGzx0lDDm+yg4=;
 b=mrMdbHMr2vJXinm+gym3yQHmORkOHJreJLYqBDBml0g4i+1TjYVqKwPR58G8bElQyhAEZsgafJ50681OBkjorOSxtxxBb6iR4U6hEZVpNfaPgwZXrYXnN5EbVMipbAG38uTRSZh0m7J1xT7QQ8QZIy1PXNKbhM0qhfvuYm+7AicH66c3yC3T+JZpMgjXUwVDSAxdBPUJM6I1qhnYLHahJIXXWyvjTdxzfrLwspXutL6MoEHrqjIQWvUahQbSrmdeq2ikD2PnHMaOIC/l4sxY3WAuy9ukfeaBWzv2P9lBPGLmCVAzl+uxoQqK1uU3qjVgXHaMw9h1MKJcYp75iS81vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB5463.eurprd05.prod.outlook.com (20.177.123.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Tue, 19 Nov 2019 14:14:33 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 14:14:33 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Topic: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Index: AQHVnf+nErtejYVqgk+5ox/jEh/QtKeQ75wAgABxg4CAAABsgIAAaCiAgACmrICAABd+AIAAA3OA
Date: Tue, 19 Nov 2019 14:14:33 +0000
Message-ID: <20191119141429.GF26739@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
 <20191118202843.GN3873@mellanox.com>
 <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
 <20191119123803.GA26739@mellanox.com>
 <d38abc98-b828-64cd-50cd-cb0d239e1696@redhat.com>
In-Reply-To: <d38abc98-b828-64cd-50cd-cb0d239e1696@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR1201CA0012.namprd12.prod.outlook.com
 (2603:10b6:405:4c::22) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84b747af-b96a-4932-978a-08d76cfaccef
x-ms-traffictypediagnostic: DB7PR05MB5463:|DB7PR05MB5463:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR05MB546336AB22582B405C24CF4FCF4C0@DB7PR05MB5463.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(52116002)(36756003)(14454004)(14444005)(256004)(33656002)(11346002)(5660300002)(478600001)(86362001)(1076003)(316002)(7406005)(54906003)(7416002)(76176011)(386003)(6116002)(71200400001)(8936002)(102836004)(71190400001)(229853002)(99286004)(4326008)(6916009)(25786009)(81166006)(26005)(81156014)(7736002)(6246003)(66066001)(6506007)(305945005)(66446008)(64756008)(66476007)(486006)(6512007)(6486002)(446003)(2906002)(186003)(8676002)(2616005)(66946007)(476003)(66556008)(6436002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB5463;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4u/CVdgiLRkyIjKduggC7C7ykh2dLQNRCe276FLeEgJgpKR8+IO9Fs5JqmxG3XReQvHm7XhMiM4ngnM+F5h0X7jHQHFs6OSP4I9nObomPnT9xIQzlymRSCs07ohPgnfCwoh08X+38yaub212K6PhjZEkDSH3/BNejYlaxc3laMLShge3Dw2Ezl9TPFqGMIS7SdaVJ6qzn9QPmedWkJ0C60fgfQXnA4vQiuB6Bve4U+nKrkn3sSiVZNg1HayiLhqAZOkiJ2f+gntxoCY1fnC2wRzY44NEZNDHy+bx9YKKhckDG0FuYUeoz+ml1P4tiZefOJmLbv9TutIW61c+ou//NTKdeuCuNWkGJFPfiuJNsm+9Jb0G3k8iRAHdsgY4hF8UQK0AJ+pOghqTP7Ii2ckyNhfwdwe2IfZBrUtdsX1wM5kd4N2FezcmGJWcNdUWKd2H
Content-ID: <205169522C3E124C9AB4CEB9A2F22320@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b747af-b96a-4932-978a-08d76cfaccef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 14:14:33.3801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nu4gMCwvSbOwYRDSwFe8x4F3z90rQgOMaQ9heVfVbZ9M3JdDvGqznNZr9ULfcpcDTQL9wFof0DE/XLpp0994VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB5463
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6LyQftnn3XD+pX+ae3e8lVuxM1xPnHGzx0lDDm+yg4=;
 b=QFkn8ke2qiUMJP4QrZM45orcIGrHcvyh+6M0TIxQFapY7mRS/4vh5cHq4Qw6alvBlOFP43U16UZta23k4HO0+xjBxSfOyI/+8B2sTatVzBgxkozHGe2xlMokeU6fGCzubbhOVcukTe8tAJGZe+SBbxSn/IcxnmMjzTfo9UpZzhg=
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTA6MDI6MDhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToNCj4gDQo+IE9uIDIwMTkvMTEvMTkg5LiL5Y2IODozOCwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgTm92IDE5LCAyMDE5IGF0IDEwOjQxOjMxQU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6DQo+ID4gPiBPbiAyMDE5LzExLzE5IOS4iuWNiDQ6MjgsIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6Mjc6MTNQTSAtMDUw
MCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgTm92IDE4LCAy
MDE5IGF0IDAxOjQxOjAwUE0gKzAwMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gPiA+ID4g
PiA+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA2OjU5OjIxUE0gKzA4MDAsIEphc29uIFdhbmcg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ICtzdHJ1Y3QgYnVzX3R5cGUgbWRldl92aXJ0aW9fYnVzX3R5
cGU7DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gK3N0cnVjdCBtZGV2X3ZpcnRpb19k
ZXZpY2Ugew0KPiA+ID4gPiA+ID4gPiArCXN0cnVjdCBtZGV2X2RldmljZSBtZGV2Ow0KPiA+ID4g
PiA+ID4gPiArCWNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19vcHMgKm9wczsNCj4gPiA+ID4gPiA+
ID4gKwl1MTYgY2xhc3NfaWQ7DQo+ID4gPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+ID4gVGhpcyBz
ZWVtcyB0byBzaGFyZSBub3RoaW5nIHdpdGggbWRldiAoaWUgbWRldi12ZmlvKSwgd2h5IGlzIGl0
IG9uIHRoZQ0KPiA+ID4gPiA+ID4gc2FtZSBidXM/DQo+ID4gPiA+ID4gSSBtdXN0IGJlIG1pc3Np
bmcgc29tZXRoaW5nIC0gd2hpY2ggYnVzIGRvIHRoZXkgc2hhcmU/DQo+ID4gPiA+IG1kZXZfYnVz
X3R5cGUgPw0KPiA+ID4gPiANCj4gPiA+ID4gSmFzb24NCj4gPiA+IA0KPiA+ID4gTm90ZTogdmly
dGlvIGhhcyBpdHMgb3duIGJ1czogbWRldl92aXJ0aW9fYnVzX3R5cGUuIFNvIHRoZXkgYXJlIG5v
dCB0aGUgc2FtZQ0KPiA+ID4gYnVzLg0KPiA+IFRoYXQgaXMgZXZlbiB3b3JzZSwgd2h5IGludm9s
dmUgc3RydWN0IG1kZXZfZGV2aWNlIGF0IGFsbCB0aGVuPw0KPiA+IA0KPiA+IEphc29uDQo+IA0K
PiANCj4gSSBkb24ndCBxdWl0ZSBnZXQgdGhlIHF1ZXN0aW9uIGhlcmUuDQoNCkluIHRoZSBkcml2
ZXIgbW9kZWwgdGhlIGJ1c190eXBlIGFuZCBmb29fZGV2aWNlIGFyZSBjbG9zZWx5DQpsaW5rZWQu
IENyZWF0aW5nICdtZGV2X2RldmljZScgaW5zdGFuY2VzIGFuZCBvdmVycmlkaW5nIHRoZSBidXNf
dHlwZQ0KaXMgYSB2ZXJ5IGFidXNpdmUgdGhpbmcgdG8gZG8uDQoNCj4gTXkgdW5kZXJzdGFuZGlu
ZyBmb3IgbWRldiBpcyB0aGF0IGl0IHdhcyBhIG1lZGlhdG9yIGJldHdlZW4gdGhlIGRyaXZlciBh
bmQNCj4gcGh5c2ljYWwgZGV2aWNlIHdoZW4gaXQncyBoYXJkIHRvIGxldCB0aGVtIHRhbGsgZGly
ZWN0bHkgZHVlIHRvIHRoZQ0KPiBjb21wbGV4aXR5IG9mIHJlZmFjdG9yaW5nIGFuZCBtYWludGVu
YW5jZS4NCg0KUmVhbGx5LCBtZGV2IGlzIHRvIHN1cHBvcnQgdmZpbyB3aXRoIGEgYmFja2VuZCBv
dGhlciB0aGFuIFBDSSwgbm90aGluZw0KbW9yZS4NCg0KQWJ1c2luZyBpdCBmb3Igb3RoZXIgdGhp
bmdzIGlzIG5vdCBhcHByb3ByaWF0ZS4gaWUgY3JlYXRpbmcgYW4NCmluc3RhbmNlIGFuZCBub3Qg
ZmlsbGluZyBpbiBtb3N0IG9mIHRoZSB2ZmlvIGZvY3VzZWQgb3BzIGlzIGFuIGFidXNpdmUNCnRo
aW5nIHRvIGRvLg0KDQo+IGhhcmR3YXJlIHRoYXQgY2FuIG9mZmxvYWQgdmlydGlvIGRhdGFwYXRo
IGJ1dCBub3QgY29udHJvbCBwYXRoLiBXZSB3YW50IHRvDQo+IHByZXNlbnQgYSB1bmlmaWVkIGlu
dGVyZmFjZSAoc3RhbmRhcmQgdmlydGlvKSBpbnN0ZWFkIG9mIGEgdmVuZG9yIHNwZWNpZmljDQo+
IGludGVyZmFjZSwgc28gYSBtZWRpYXRvciBsZXZlbCBpbiB0aGUgbWlkZGxlIGlzIGEgbXVzdC4g
Rm9yIHZpcnRpbyBkcml2ZXIsDQo+IG1lZGlhdG9yIHByZXNlbnQgYSBmdWxsIHZpcnRpbyBjb21w
YXRpYmxlIGRldmljZS4gRm9yIGhhcmR3YXJlLCBtZWRpYXRvcg0KPiB3aWxsIG1lZGlhdGUgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgYmVoYXZpb3IgZGVmaW5lZCBieSB2aXJ0aW8gc3BlYyBh
bmQNCj4gcmVhbCBoYXJkd2FyZS4NCg0KSWYgeW91IG5lZWQgdG8gYmluZCB0byB0aGUgVkZJTyBk
cml2ZXIgdGhlbiBtZGV2IGlzIHRoZSByaWdodCB0aGluZyB0bw0KdXNlLCBvdGhlcndpc2UgaXQg
aXMgbm90Lg0KDQpJdCBjZXJ0YWlubHkgc2hvdWxkIG5vdCBiZSB1c2VkIHRvIGJpbmQgdG8gcmFu
ZG9tIGtlcm5lbCBkcml2ZXJzLiBUaGlzDQpwcm9ibGVtIGlzIHdoYXQgdGhpcyB2aXJ0dWFsIGJ1
cyBpZGVhIEludGVsIGlzIHdvcmtpbmcgb24gbWlnaHQgc29sdmUuDQoNCkl0IHNlZW1zIHRoZSBv
bmx5IHRoaW5nIHBlb3BsZSBjYXJlIGFib3V0IHdpdGggbWRldiBpcyB0aGUgR1VJRA0KbGlmZWN5
Y2xlIHN0dWZmLCBidXQgYXQgdGhlIHNhbWUgdGltZSBmb2xrcyBsaWtlIFBhcmF2IGFyZSBzYXlp
bmcgdGhleQ0KZG9uJ3Qgd2FudCB0byB1c2UgdGhhdCBsaWZlY3ljbGUgc3R1ZmYgYW5kIHByZWZl
ciBkZXZsaW5rDQppbnN0ZWFkLg0KDQpNb3N0IGxpa2VseSwgYXQgbGVhc3QgZm9yIHZpcnRpby1u
ZXQsIGV2ZXJ5b25lIGVsc2Ugd2lsbCBiZSBhYmxlIHRvDQp1c2UgZGV2bGluayBhcyB3ZWxsLCBt
YWtpbmcgaXQgbXVjaCBsZXNzIGNsZWFyIGlmIHRoYXQgR1VJRCBsaWZlY3ljbGUNCnN0dWZmIGlz
IGEgZ29vZCBpZGVhIG9yIG5vdC4NCg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
