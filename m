Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90690D959E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 16 Oct 2019 17:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9126E99F;
	Wed, 16 Oct 2019 15:31:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884A86E99F;
 Wed, 16 Oct 2019 15:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAqvxnf0FYTNDPgs78aktQIcwfmOAlUrr0FuX1UxpXRhQW1FzBTKdRWoceuX/Evv7njWshXLiV4eNXhgZJSPkEdIZLBzMD9qb67q3pb8pLIp2ys46Z7WXeUh2ZoVximT+PIqnfzozB6x6jnitSy22ZCKKMk6s/E+e1AENnyZb/EmUeH/gum5sz7F7UxTPKq3qJODL9E3UAgFXTFc4aCn3o/h7h02s7/0oG8lCU5Cf6e4yanv2t3VLWpiKwsPeX4XAD+wyd1VqX3NQ0hNedIS3pgSA5i5U7kZdFNBtJcioJeVfV20DbwxjNZTAhsBV9S7gp1Ap79u9Whr6B/pASCUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a13AomUSOWk96WRFgAxCBh55VGXc+EjqSr2ZKoIMW8Y=;
 b=N8b+ifTdb6RApvEG98zdCQh7dK7GoHHD8s7dcBMr9pzO26IS/yWSP6/dZcUI6+EOPLC6WaibZOFDBuk9cz0+8VFgG0qL3cR93JwtO6zviFuPcBMJqA7sYys5ngW4t/kd6MvxfGaS2Sj0dB9V3JZH6PtaiO/THOZHVBmJ629Xm+2OH2lUd7rntta1GXE/VeVB4Jn7sYrHfShlvbveQyjOE2tPlN/iydPC+Q7lGf528LFVW+xd/JpoGrGYtb69SULn1a1L96hw9XGmCoFqn3f7d5hajJX1E2k6w3yFS9CZZw1J7tnfwBTRgl4+pd1xOJrT+9zcGvzhuaq7pRQXiewmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com (20.176.214.160) by
 AM0PR05MB4468.eurprd05.prod.outlook.com (52.134.93.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Wed, 16 Oct 2019 15:31:26 +0000
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432]) by AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 15:31:26 +0000
From: Parav Pandit <parav@mellanox.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: RE: [PATCH V3 4/7] mdev: introduce device specific ops
Thread-Topic: [PATCH V3 4/7] mdev: introduce device specific ops
Thread-Index: AQHVgAyQozin1kXkaES8p6PvWVgevKdbiiSAgAAaqICAAFaLAIAAy62AgAA2+wCAAG6mwA==
Date: Wed, 16 Oct 2019 15:31:25 +0000
Message-ID: <AM0PR05MB486625E53B8ADBA2BBAA80F6D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-5-jasowang@redhat.com>
 <20191015124137.4f948bd2.cohuck@redhat.com>
 <eb7ecd99-7465-6be4-7ecd-84c11f66e0ac@redhat.com>
 <20191015112646.3776dc29@x1.home>
 <AM0PR05MB4866954855AF080639ED2384D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
 <20191016105232.663dd3c9.cohuck@redhat.com>
In-Reply-To: <20191016105232.663dd3c9.cohuck@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.176.44.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 529d6f48-df21-4981-582c-08d7524de861
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR05MB4468:|AM0PR05MB4468:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR05MB4468A4595BC8B93FE929EEB2D1920@AM0PR05MB4468.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(13464003)(8676002)(33656002)(25786009)(64756008)(6916009)(66446008)(86362001)(256004)(55016002)(4326008)(81156014)(8936002)(81166006)(316002)(476003)(486006)(54906003)(66556008)(229853002)(11346002)(446003)(76116006)(66946007)(66476007)(71190400001)(71200400001)(7406005)(74316002)(52536014)(76176011)(66066001)(7416002)(7696005)(6436002)(102836004)(5660300002)(26005)(6116002)(3846002)(53546011)(6506007)(7736002)(305945005)(186003)(99286004)(9686003)(6246003)(478600001)(2906002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB4468;
 H:AM0PR05MB4866.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j9AD0m3wo++Bn/wxEQgRXUcGUQB51tIps8kNhm/IGbK3wEdyonyISE9WA7gM8sRH3R+gIksz1EcfnHP2g+e9N+qLy2pX/6xGc59X9mh0+hpL9VSPrGqrRciioqCsRfHkfNowvNMZSZDAPkSXwNh/9QEfKPq5oTFUm0Q62WPsVViVKXAsMAQ2MCdSyie5GRcb41dDx4PViLA1xL9ks7v3GWY65S5sXghME1jV19YhueO1wMIf/Zvczoadj848Run83bDqxKigduo/5nZ6P6qaMAKFPl0LDcGncVkKU3H4hfOOAcStHqu9zAHl07929xxjSoIJKmnuUvYeqi81sRk4Z2Re+mUX4vD2leYfcySgv/Fze3LxRiZDz/WHw+XmWm5AD+C3tjml8i91x2nQOZHE8L1CLlzbf44R00LzhbfoSK4=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529d6f48-df21-4981-582c-08d7524de861
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 15:31:25.8698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9qkzGjc/9jYlUwCA4yt5ezM5N7VhNyqdGgfWBrJBPH1YGVg5Pm5J0DQ/W0bckVWFHtNAk4L3Q0jOeqSRimBwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4468
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a13AomUSOWk96WRFgAxCBh55VGXc+EjqSr2ZKoIMW8Y=;
 b=L6Y0yExnNs4tgf+HYNFvJO8PaIK5li4d1wmgfCyMSvqq1NAzqekjfNuEF9Tbyd/ufLH14SHWvPfjO6YvbH14kYgOQ+HZSiAJNd5Kx/kkG8+6Og4HnEv3aJqfUyfWyazQgVWlUdzBCj8ykQpB4H6ANCQtrIwbJvTId9Al8rRptRI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=parav@mellanox.com; 
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ29ybmVsaWEgSHVjayA8
Y29odWNrQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxNiwgMjAxOSAz
OjUzIEFNDQo+IFRvOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG1lbGxhbm94LmNvbT4NCj4gQ2M6IEFs
ZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+OyBKYXNvbiBXYW5nDQo+
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgtczM5MEB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4ga3dhbmtoZWRlQG52
aWRpYS5jb207IG1zdEByZWRoYXQuY29tOyB0aXdlaS5iaWVAaW50ZWwuY29tOw0KPiB2aXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9y
ZzsNCj4gbWF4aW1lLmNvcXVlbGluQHJlZGhhdC5jb207IGN1bm1pbmcubGlhbmdAaW50ZWwuY29t
Ow0KPiB6aGlob25nLndhbmdAaW50ZWwuY29tOyByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsgeGlh
by53LndhbmdAaW50ZWwuY29tOw0KPiBoYW90aWFuLndhbmdAc2lmaXZlLmNvbTsgemhlbnl1d0Bs
aW51eC5pbnRlbC5jb207IHpoaS5hLndhbmdAaW50ZWwuY29tOw0KPiBqYW5pLm5pa3VsYUBsaW51
eC5pbnRlbC5jb207IGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb207DQo+IHJvZHJpZ28u
dml2aUBpbnRlbC5jb207IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsNCj4gZmFy
bWFuQGxpbnV4LmlibS5jb207IHBhc2ljQGxpbnV4LmlibS5jb207IHNlYm90dEBsaW51eC5pYm0u
Y29tOw0KPiBvYmVycGFyQGxpbnV4LmlibS5jb207IGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb207
IGdvckBsaW51eC5pYm0uY29tOw0KPiBib3JudHJhZWdlckBkZS5pYm0uY29tOyBha3Jvd2lha0Bs
aW51eC5pYm0uY29tOyBmcmV1ZGVAbGludXguaWJtLmNvbTsNCj4gbGluZ3NoYW4uemh1QGludGVs
LmNvbTsgSWRvIFNoYW1heSA8aWRvc0BtZWxsYW5veC5jb20+Ow0KPiBlcGVyZXptYUByZWRoYXQu
Y29tOyBsdWx1QHJlZGhhdC5jb207IGNocmlzdG9waGUuZGUuZGluZWNoaW5AZ21haWwuY29tOw0K
PiBrZXZpbi50aWFuQGludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIDQvN10gbWRl
djogaW50cm9kdWNlIGRldmljZSBzcGVjaWZpYyBvcHMNCj4gDQo+IE9uIFdlZCwgMTYgT2N0IDIw
MTkgMDU6NTA6MDggKzAwMDANCj4gUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+IHdy
b3RlOg0KPiANCj4gPiBIaSBBbGV4LA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0
LmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTUsIDIwMTkgMTI6MjcgUE0NCj4g
PiA+IFRvOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gQ2M6IENvcm5l
bGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPjsga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgt
DQo+ID4gPiBzMzkwQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgZHJpLQ0KPiA+ID4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+ID4gaW50ZWwtZ3Z0LSBkZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBrd2Fua2hlZGVAbnZpZGlhLmNvbTsNCj4gPiA+IG1zdEByZWRoYXQuY29tOyB0aXdl
aS5iaWVAaW50ZWwuY29tOw0KPiA+ID4gdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmc7DQo+ID4gPiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBtYXhpbWUuY29xdWVsaW5A
cmVkaGF0LmNvbTsNCj4gPiA+IGN1bm1pbmcubGlhbmdAaW50ZWwuY29tOyB6aGlob25nLndhbmdA
aW50ZWwuY29tOw0KPiA+ID4gcm9iLm1pbGxlckBicm9hZGNvbS5jb207IHhpYW8udy53YW5nQGlu
dGVsLmNvbTsNCj4gPiA+IGhhb3RpYW4ud2FuZ0BzaWZpdmUuY29tOyB6aGVueXV3QGxpbnV4Lmlu
dGVsLmNvbTsNCj4gPiA+IHpoaS5hLndhbmdAaW50ZWwuY29tOyBqYW5pLm5pa3VsYUBsaW51eC5p
bnRlbC5jb207DQo+ID4gPiBqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tOyByb2RyaWdv
LnZpdmlAaW50ZWwuY29tOw0KPiA+ID4gYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNo
OyBmYXJtYW5AbGludXguaWJtLmNvbTsNCj4gPiA+IHBhc2ljQGxpbnV4LmlibS5jb207IHNlYm90
dEBsaW51eC5pYm0uY29tOyBvYmVycGFyQGxpbnV4LmlibS5jb207DQo+ID4gPiBoZWlrby5jYXJz
dGVuc0BkZS5pYm0uY29tOyBnb3JAbGludXguaWJtLmNvbTsNCj4gPiA+IGJvcm50cmFlZ2VyQGRl
LmlibS5jb207IGFrcm93aWFrQGxpbnV4LmlibS5jb207DQo+ID4gPiBmcmV1ZGVAbGludXguaWJt
LmNvbTsgbGluZ3NoYW4uemh1QGludGVsLmNvbTsgSWRvIFNoYW1heQ0KPiA+ID4gPGlkb3NAbWVs
bGFub3guY29tPjsgZXBlcmV6bWFAcmVkaGF0LmNvbTsgbHVsdUByZWRoYXQuY29tOyBQYXJhdg0K
PiA+ID4gUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+OyBjaHJpc3RvcGhlLmRlLmRpbmVjaGlu
QGdtYWlsLmNvbTsNCj4gPiA+IGtldmluLnRpYW5AaW50ZWwuY29tDQo+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYzIDQvN10gbWRldjogaW50cm9kdWNlIGRldmljZSBzcGVjaWZpYyBvcHMNCj4g
PiA+DQo+ID4gPiBPbiBUdWUsIDE1IE9jdCAyMDE5IDIwOjE3OjAxICswODAwDQo+ID4gPiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IE9uIDIw
MTkvMTAvMTUg5LiL5Y2INjo0MSwgQ29ybmVsaWEgSHVjayB3cm90ZToNCj4gPiA+ID4gPiBPbiBG
cmksIDExIE9jdCAyMDE5IDE2OjE1OjU0ICswODAwIEphc29uIFdhbmcNCj4gPiA+ID4gPiA8amFz
b3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiA+ID4gPiA+PiBAQCAtMTY3LDkgKzE3Niwx
MCBAQCByZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6DQo+ID4gPiA+
ID4+ICAgCWV4dGVybiBpbnQgIG1kZXZfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRl
diwNCj4gPiA+ID4gPj4gICAJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0DQo+ID4gPiA+ID4+IG1kZXZfcGFyZW50X29wcyAqb3BzKTsNCj4gPiA+ID4gPj4NCj4g
PiA+ID4gPj4gLUl0IGlzIGFsc28gcmVxdWlyZWQgdG8gc3BlY2lmeSB0aGUgY2xhc3NfaWQgdGhy
b3VnaDo6DQo+ID4gPiA+ID4+ICtJdCBpcyBhbHNvIHJlcXVpcmVkIHRvIHNwZWNpZnkgdGhlIGNs
YXNzX2lkIGFuZCBkZXZpY2UNCj4gPiA+ID4gPj4gK3NwZWNpZmljIG9wcw0KPiA+ID4gdGhyb3Vn
aDo6DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IC0JZXh0ZXJuIGludCBtZGV2X3NldF9jbGFzcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHUxNiBpZCk7DQo+ID4gPiA+ID4+ICsJZXh0ZXJuIGludCBtZGV2
X3NldF9jbGFzcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUxNiBpZCwNCj4gPiA+ID4gPj4gKwkgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKm9wcyk7DQo+ID4gPiA+ID4gQXBvbG9n
aWVzIGlmIHRoYXQgaGFzIGFscmVhZHkgYmVlbiBkaXNjdXNzZWQsIGJ1dCBkbyB3ZSB3YW50IGEN
Cj4gPiA+ID4gPiAxOjEgcmVsYXRpb25zaGlwIGJldHdlZW4gaWQgYW5kIG9wcywgb3IgY2FuIGRp
ZmZlcmVudCBkZXZpY2VzDQo+ID4gPiA+ID4gd2l0aCB0aGUgc2FtZSBpZCByZWdpc3RlciBkaWZm
ZXJlbnQgb3BzPw0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIHRoaW5rIHdlIGhhdmUgYSBO
OjEgbWFwcGluZyBiZXR3ZWVuIGlkIGFuZCBvcHMsIGUuZyB3ZSB3YW50IGJvdGgNCj4gPiA+ID4g
dmlydGlvLW1kZXYgYW5kIHZob3N0LW1kZXYgdXNlIGEgc2luZ2xlIHNldCBvZiBkZXZpY2Ugb3Bz
Lg0KPiA+ID4NCj4gPiA+IFRoZSBjb250ZW50cyBvZiB0aGUgb3BzIHN0cnVjdHVyZSBpcyBlc3Nl
bnRpYWxseSBkZWZpbmVkIGJ5IHRoZSBpZCwNCj4gPiA+IHdoaWNoIGlzIHdoeSBJIHdhcyBsZWFu
aW5nIHRvd2FyZHMgdGhlbSBiZWluZyBkZWZpbmVkIHRvZ2V0aGVyLg0KPiA+ID4gVGhleSBhcmUg
ZWZmZWN0aXZlbHkgaW50ZXJsb2NrZWQsIHRoZSBpZCBkZWZpbmVzIHdoaWNoIG1kZXYgImVuZHBv
aW50Ig0KPiA+ID4gZHJpdmVyIGlzIGxvYWRlZCBhbmQgdGhhdCBkcml2ZXIgcmVxdWlyZXMgbWRl
dl9nZXRfZGV2X29wcygpIHRvDQo+ID4gPiByZXR1cm4gdGhlIHN0cnVjdHVyZSByZXF1aXJlZCBi
eSB0aGUgZHJpdmVyLiAgSSB3aXNoIHRoZXJlIHdhcyBhIHdheQ0KPiA+ID4gd2UgY291bGQgaW5j
b3Jwb3JhdGUgdHlwZSBjaGVja2luZyBoZXJlLiAgV2UgdG95ZWQgd2l0aCB0aGUgaWRlYSBvZg0K
PiA+ID4gaGF2aW5nIHRoZSBjbGFzcyBpbiB0aGUgc2FtZSBzdHJ1Y3R1cmUgYXMgdGhlIG9wcywg
YnV0IEkgdGhpbmsgdGhpcw0KPiA+ID4gYXBwcm9hY2ggd2FzIGNob3NlbiBmb3Igc2ltcGxpY2l0
eS4gIFdlIGNvdWxkIHN0aWxsIGRvIHNvbWV0aGluZyBsaWtlOg0KPiA+ID4NCj4gPiA+IGludCBt
ZGV2X3NldF9jbGFzc19zdHJ1Y3Qoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QNCj4g
PiA+IG1kZXZfY2xhc3Nfc3RydWN0ICpjbGFzcyk7DQo+ID4gPg0KPiA+ID4gc3RydWN0IG1kZXZf
Y2xhc3Nfc3RydWN0IHsNCj4gPiA+IAl1MTYJaWQ7DQo+ID4gPiAJdW5pb24gew0KPiA+ID4gCQlz
dHJ1Y3QgdmZpb19tZGV2X29wcyB2ZmlvX29wczsNCj4gPiA+IAkJc3RydWN0IHZpcnRpb19tZGV2
X29wcyB2aXJ0aW9fb3BzOw0KPiA+ID4gCX07DQo+ID4gPiB9Ow0KPiA+ID4NCj4gPiA+IE1heWJl
IGV2ZW46DQo+ID4gPg0KPiA+ID4gc3RydWN0IHZmaW9fbWRldl9vcHMgKm1kZXZfZ2V0X3ZmaW9f
b3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikgew0KPiA+ID4gCUJVR19PTihtZGV2LT5jbGFz
cy5pZCAhPSBNREVWX0lEX1ZGSU8pOw0KPiA+ID4gCXJldHVybiAmbWRldi0+Y2xhc3MudmZpb19v
cHM7DQo+ID4gPiB9DQo+ID4gPg0KPiA+ID4gVGhlIG1hdGNoIGNhbGxiYWNrIHdvdWxkIG9mIGNv
dXJzZSBqdXN0IHVzZSB0aGUgbWRldi0+Y2xhc3MuaWQgdmFsdWUuDQo+ID4gPiBGdW5jdGlvbmFs
bHkgZXF1aXZhbGVudCwgYnV0IG1heWJlIGJldHRlciB0eXBlIGNoYXJhY3RlcmlzdGljcy4NCj4g
PiA+IFRoYW5rcywNCj4gPiA+DQo+ID4gPiBBbGV4DQo+ID4NCj4gPiBXZSBoYXZlIDMgdXNlIGNh
c2VzIG9mIG1kZXYuDQo+ID4gMS4gY3VycmVudCBtZGV2IGJpbmRpbmcgdG8gdmZpb19tZGV2DQo+
ID4gMi4gbWRldiBiaW5kaW5nIHRvIHZpcnRpbw0KPiA+IDMuIG1kZXYgYmluZGluZyB0byBtbHg1
X2NvcmUgd2l0aG91dCBkZXZfb3BzDQo+ID4NCj4gPiBBbHNvDQo+ID4gKGEpIGEgZ2l2ZW4gcGFy
ZW50IG1heSBzZXJ2ZSBtdWx0aXBsZSB0eXBlcyBvZiBjbGFzc2VzIGluIGZ1dHVyZS4NCj4gPiAo
YikgbnVtYmVyIG9mIGNsYXNzZXMgbWF5IG5vdCBsaWtlbHkgZXhwbG9kZSwgdGhleSB3aWxsIGJl
IGhhbmRmdWwgb2YNCj4gPiB0aGVtLiAodmZpb19tZGV2LCB2aXJ0aW8pDQo+ID4NCj4gPiBTbywg
aW5zdGVhZCBvZiBtYWtpbmcgY29waWVzIG9mIHRoaXMgZGV2X29wcyBwb2ludGVyIGluIGVhY2gg
bWRldiwgaXQgaXMgYmV0dGVyDQo+IHRvIGtlZXAgY29uc3QgbXVsdGlwbGUgb3BzIGluIHRoZWly
IHBhcmVudCBkZXZpY2UuDQo+ID4gU29tZXRoaW5nIGxpa2UgYmVsb3csDQo+ID4NCj4gPiBzdHJ1
Y3QgbWRldl9wYXJlbnQgew0KPiA+IAlbLi5dDQo+ID4gCXN0cnVjdCBtZGV2X3BhcmVudF9vcHMg
KnBhcmVudF9vcHM7IC8qIGNyZWF0ZSwgcmVtb3ZlICovDQo+ID4gCXN0cnVjdCB2ZmlvX21kZXZf
b3BzICp2ZmlvX29wczsgLyogcmVhZCx3cml0ZSwgaW9jdGwgZXRjICovDQo+ID4gCXN0cnVjdCB2
aXJ0aW9fbWRldl9vcHMgKnZpcnRpb19vcHM7IC8qIHZpcnRpbyBvcHMgKi8gfTsNCj4gDQo+IFRo
YXQgZmVlbHMgYSBiaXQgb2RkLiBXaHkgc2hvdWxkIHRoZSBwYXJlbnQgY2FycnkgcG9pbnRlcnMg
dG8gZXZlcnkgcG9zc2libGUNCj4gdmVyc2lvbiBvZiBvcHM/DQo+IA0KSG93IG1hbnkgYXJlIHdl
IGV4cGVjdGluZz8gSSBlbnZpc2lvbmVkIGhhbmRmdWwgb2YgdGhlbS4NCkl0IGNhcnJpZXMgYmVj
YXVzZSBwYXJlbnQgaXMgZmV3LCBtZGV2cyBhcmUgc2V2ZXJhbCBodW5kcmVkcy4NCkl0IG1ha2Vz
IHNlbnNlIHRvIGtlZXAgZmV3IGNvcGllcywgaW5zdGVhZCBvZiBzZXZlcmFsIGh1bmRyZWQgY29w
aWVzIGFuZCBpdCBkb2Vzbid0IG5lZWQgdG8gc2V0dXAgb24gZXZlcnkgbWRldiBjcmVhdGlvbi4N
Cg0KPiA+DQo+ID4gY29uc3Qgc3RydWN0IHZmaW9fbWRldl9vcHMgKm1kZXZfZ2V0X3ZmaW9fb3Bz
KHN0cnVjdCBtZGV2X3BhcmVudA0KPiA+ICpwYXJlbnQpOyBjb25zdCBzdHJ1Y3QgdmlydGlvX21k
ZXZfb3BzICptZGV2X2dldF92aXJ0aW9fb3BzKHN0cnVjdA0KPiA+IG1kZXZfcGFyZW50ICpwYXJl
bnQpOw0KPiA+DQo+ID4gVGhpcyB3YXksDQo+ID4gKGEpIHdlIGhhdmUgc3Ryb25nIHR5cGUgY2hl
Y2sgc3VwcG9ydA0KPiA+IChiKSBvcHMgcG9pbnRlciBpcyBub3QgZHVwbGljYXRlZCBhY3Jvc3Mg
c2V2ZXJhbCBodW5kcmVkIG1kZXYgZGV2aWNlcywNCj4gPiBhbmQgZG9uJ3QgaGF2ZSB0byBzZXQg
b24gZXZlcnkgbWRldiBjcmVhdGlvbg0KPiA+IChjKSBhbGwgMyBjbGFzc2VzIG9mIG1kZXYgYXJl
IHN1cHBvcnRlZA0KPiA+IChkKSBvbmUgZXh0cmEgc3ltYm9sIHRhYmxlIGVudHJ5IHVzZWQgcGVy
IG9wcyB0eXBlLCBidXQgdGhlcmUgYXJlIG5vdA0KPiBleHBlY3RlZCB0byBncm93IGEgbG90Lg0K
PiA+IChlKSBtdWx0aXBsZSBjbGFzc2VzIHBlciBzaW5nbGUgcGFyZW50IGlzIHN0aWxsIHN1cHBv
cnRlZA0KPiA+IChmKSBzdGlsbCBleHRlbmRpYmxlIGZvciBtdWx0aXBsZSBjbGFzc2VzICh3ZWxs
IGRlZmluZWQgY2xhc3NlcyA9DQo+ID4gdmZpbywgdmlydGlvLCBhbmQgdmVuZG9yIGNsYXNzKQ0K
PiANCj4gWWV0IGFub3RoZXIgc3VnZ2VzdGlvbjogaGF2ZSB0aGUgY2xhc3MgaWQgZGVyaXZlIGZy
b20gdGhlIGZ1bmN0aW9uIHlvdSB1c2UgdG8NCj4gc2V0IHVwIHRoZSBvcHMuDQo+IA0KPiB2b2lk
IG1kZXZfc2V0X3ZmaW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgY29uc3Qgc3RydWN0
DQo+IHZmaW9fbWRldl9vcHMgKnZmaW9fb3BzKSB7DQo+IAltZGV2LT5kZXZpY2Vfb3BzID0gdmZp
b19vcHM7DQo+IAltZGV2LT5jbGFzc19pZCA9IE1ERVZfSURfVkZJTzsNCj4gfQ0KPiANCj4gdm9p
ZCBtZGV2X3NldF92aXJ0aW9fb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgY29uc3Qgc3Ry
dWN0DQo+IHZpcnRpb19tZGV2X29wcyAqdmlydGlvX29wcykgew0KPiAJbWRldi0+ZGV2aWNlX29w
cyA9IHZpcnRpb19vcHM7DQo+IAltZGV2LT5jbGFzc19pZCA9IE1ERVZfSURfVklSVElPOw0KPiB9
DQo+IA0KPiB2b2lkIG1kZXZfc2V0X3Zob3N0X29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYs
IGNvbnN0IHN0cnVjdA0KPiB2aXJ0aW9fbWRldl9vcHMgKnZpcnRpb19vcHMpIHsNCj4gCW1kZXYt
PmRldmljZV9vcHMgPSB2aXJ0aW9fb3BzOw0KPiAJbWRldi0+Y2xhc3NfaWQgPSBNREVWX0lEX1ZI
T1NUOw0KPiB9DQo+IA0KPiB2b2lkIG1kZXZfc2V0X3ZlbmRvcl9vcHMoc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2KSAvKiBubyBvcHMgKi8gew0KPiAJbWRldi0+Y2xhc3NfaWQgPSBNREVWX0lEX1ZF
TkRPUjsNCj4gfQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
