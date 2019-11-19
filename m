Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C23102496
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 13:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E766E8AA;
	Tue, 19 Nov 2019 12:38:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202266E8AA;
 Tue, 19 Nov 2019 12:38:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N30dd0aVITA8nHibKw6duNmM4RLCSwt8myaeVIjeyLLNNxIqzPie7760cl2RyOpxslMa7BjMCZPH4BLGDYvCAbjabSG/N91995w2FTePJHwbo0eylGM4Vcfgk8XDxyx9mAf4fyJOjC5s4Hdn1HON/fIZF/8ukUhTqEakiwkqz3dbxKx/OUPyVV9XwwHYgXOL9mOmGajyXWA//gKyLpXm9dz/hpj9suUxBfbpAyMH/Ci6m7VUeBPj/CqxplZQog5tWE9qP29MNm7dvD1P61CyCH0Ia4cnrEa2wvMDD52pV6ZDm02iYA7eFUqDYef3JWSJNTobiPf0QlbhAotkpQ2Edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msDrjXCPvwCq2fEUiYvnvkw5VUZgSa95VNmbPPpEy7Y=;
 b=TL4h7vrJ7ozXYIMdgXYRiWy8t4XwVsSNSqoTUEWMvUwE8sLqduwWR0O+PPh6q7i6vBuGbicwgiU/WoTz0wfijsXTdQcZH+qHl8xsmaj2JHOXng78BRwnXlaluKhkX9BsOON2FN69mnxBTpObXiKipXJHxPF/sLgDqErWA1OGjXqNsktHmwFEmSqZR0qPUM9ekXONVJ3caEyszLzv1tD06JTuM+qCwZOiNvxAs2iUsm9SmaFkESsQHw5SqlceIhdJWqdLr2yiPuihnRAHLlcseuzJtsdxs/Fr12BzAscqvE2KBhyVr6lU7n2fRU6HdWRFFGdN+6BJkOair8FbTxqwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB4858.eurprd05.prod.outlook.com (20.176.234.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Tue, 19 Nov 2019 12:38:09 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 12:38:09 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Topic: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Index: AQHVnf+nErtejYVqgk+5ox/jEh/QtKeQ75wAgABxg4CAAABsgIAAaCiAgACmrIA=
Date: Tue, 19 Nov 2019 12:38:08 +0000
Message-ID: <20191119123803.GA26739@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
 <20191118202843.GN3873@mellanox.com>
 <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
In-Reply-To: <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:208:a8::30) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d9b70c25-43ee-4082-ad6b-08d76ced5500
x-ms-traffictypediagnostic: DB7PR05MB4858:|DB7PR05MB4858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR05MB48587C0CEB299AB1494F0CCDCF4C0@DB7PR05MB4858.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(86362001)(316002)(305945005)(6486002)(99286004)(11346002)(8676002)(81166006)(446003)(66066001)(14454004)(6916009)(6506007)(386003)(7406005)(186003)(486006)(2616005)(71200400001)(476003)(6436002)(7416002)(33656002)(6512007)(71190400001)(478600001)(81156014)(6246003)(64756008)(66946007)(66446008)(66556008)(66476007)(4326008)(6116002)(102836004)(3846002)(2906002)(7736002)(76176011)(4744005)(26005)(5660300002)(8936002)(25786009)(1076003)(54906003)(256004)(229853002)(52116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR05MB4858;
 H:DB7PR05MB4138.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zueEYUjj0GlSCOsCP8YhlimDCx9H/BYNfjRSY/V2L5pbzb4zrGQm/3npt7v8spDm00OdAF9KA3UQUUn/csjG7X5zHB5UdhJg0sXlD21UVtEqSoA/E36u4wnQaUFHMCrsKr1N01L1L1qqfLwg2G96FKN5m+EIp+UuWc3yVznfgbzVqdFCh0khXYe53h8QXWGt5EQhet/p/kXISdlgQHYj5bgFqWK3SciUhKdPTXPpsXDIdLVSjfBzx7LwhU2m3+m+Sz0pX/T+btg2VN6N798SdBGYWpRW0vD+l9dwkceHLl4mBaydTIHGwMAxGUml/pzrKT2cah3jkFdbaiG1ZJ/ljy3Q/tNLHWU+BGmic5XDh75AcyRvaKje2c1+TvLyetp+/K6ipChzy227wDmemK8tx6YWPFM7ECtLeBYblJAZW4UqfsDSyQLyLBwwf2Au43BH
Content-ID: <6464A472E286B84797146BCB7F17F890@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b70c25-43ee-4082-ad6b-08d76ced5500
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 12:38:08.8039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2JlBhzg/uux7GeHvvE8MPXRuG7I54lkEDkul0TRDHLVeHG7/j6inzhv62v3sQH/yzHsFwhmQ/+HgKDWM1Ub0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4858
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msDrjXCPvwCq2fEUiYvnvkw5VUZgSa95VNmbPPpEy7Y=;
 b=LJwAK1mQtaq5KlzmICefvqKxH85SMwk+qWsguX1wYMbSlRPUXZjEXsIX61x0/1mUgvXlnHT4qqAzlsL2WtWonGQOdxGRV/9BOsv8gHNx9JisGDJcdCiUvXcC5RcmzjV+OGxbeKNEUYF2qU9LPLFXWwysk8NUtW+cQqLDiONSgMg=
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

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTA6NDE6MzFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToNCj4gDQo+IE9uIDIwMTkvMTEvMTkg5LiK5Y2INDoyOCwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Og0KPiA+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAzOjI3OjEzUE0gLTA1MDAsIE1pY2hhZWwg
Uy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAxOjQxOjAw
UE0gKzAwMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBOb3YgMTgs
IDIwMTkgYXQgMDY6NTk6MjFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPiA+ID4gPiAr
c3RydWN0IGJ1c190eXBlIG1kZXZfdmlydGlvX2J1c190eXBlOw0KPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiArc3RydWN0IG1kZXZfdmlydGlvX2RldmljZSB7DQo+ID4gPiA+ID4gKwlzdHJ1Y3QgbWRl
dl9kZXZpY2UgbWRldjsNCj4gPiA+ID4gPiArCWNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19vcHMg
Km9wczsNCj4gPiA+ID4gPiArCXUxNiBjbGFzc19pZDsNCj4gPiA+ID4gPiArfTsNCj4gPiA+ID4g
VGhpcyBzZWVtcyB0byBzaGFyZSBub3RoaW5nIHdpdGggbWRldiAoaWUgbWRldi12ZmlvKSwgd2h5
IGlzIGl0IG9uIHRoZQ0KPiA+ID4gPiBzYW1lIGJ1cz8NCj4gPiA+IEkgbXVzdCBiZSBtaXNzaW5n
IHNvbWV0aGluZyAtIHdoaWNoIGJ1cyBkbyB0aGV5IHNoYXJlPw0KPiA+IG1kZXZfYnVzX3R5cGUg
Pw0KPiA+IA0KPiA+IEphc29uDQo+IA0KPiANCj4gTm90ZTogdmlydGlvIGhhcyBpdHMgb3duIGJ1
czogbWRldl92aXJ0aW9fYnVzX3R5cGUuIFNvIHRoZXkgYXJlIG5vdCB0aGUgc2FtZQ0KPiBidXMu
DQoNClRoYXQgaXMgZXZlbiB3b3JzZSwgd2h5IGludm9sdmUgc3RydWN0IG1kZXZfZGV2aWNlIGF0
IGFsbCB0aGVuPw0KDQpKYXNvbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2
