Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79BEC963
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  1 Nov 2019 21:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE716F862;
	Fri,  1 Nov 2019 20:11:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50047.outbound.protection.outlook.com [40.107.5.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B776F860;
 Fri,  1 Nov 2019 20:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9c5jmLCRkkrZ0yR/IKrF1+ewdArAsI2MtXXYPB2/KIUx28+yjtP4yVDzmp15RQJuAexHsUYyHQdlowp55qBpKjtw6MRz0EGosiCvICk3RIQGxF5/d9TphWG83v8lCze0qqRGjYB2yBkf5nX1hpcv00r3trvNv1qBFevlT54FSIi9HVr7EPFhNIOpOuryF8Z0ZDfPsQLGADgCjVwP1dsqGULEjjMn9i9KkaAVbAcRfIlSAp8Y0dZsjI+GlulJtf75lLDITWv5W/B0aGV5wlow4PSQ8NE0SgML93KKBYuvw8d/n0pKmc6JAEYyOTrFPNhnyA8q26Md8nJzwO1mgWiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5MgvGOAx/HfUZj2RnveEiLcK9cxzl/d30370nKYdAU=;
 b=jQG0Mu8nTNgT6JwkoR71MJJP+pvwkI/pThHq9bLW6LsfEnNS5tVz/D2BYfNKzV4nmoS4B177ir1niY8iYovrAYD955CkrAV7MQTe8KtCcNGUL2Gc+ojWiCRal0LcU9H2Csf3upSS4jpclEeWE5X+zONQk3I3ZfAZcNg0lPJB6SyNbkipsPwdBu1b1uPtsWzOrPCpA06G7TWGPkrBCMVVse9Udptt9zJtOivOe/iiaUsLdiLNDg1lnt2MwP6e48LpWs6v0kwTZ10vxoegOwM8aRsmboct33/ctG30yqbvhiqgoB/P548Go9JJ+YzhRpZVmDP7eWL0V2I3cJgpGVLfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com (20.176.214.160) by
 AM0PR05MB5665.eurprd05.prod.outlook.com (20.178.112.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 20:11:29 +0000
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432]) by AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::64b2:6eb4:f000:3432%7]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 20:11:29 +0000
From: Parav Pandit <parav@mellanox.com>
To: Jason Wang <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: RE: [PATCH V6 3/6] mdev: introduce device specific ops
Thread-Topic: [PATCH V6 3/6] mdev: introduce device specific ops
Thread-Index: AQHVju3ug3yiMO78q0axXkP5igJmr6d2wYnQ
Date: Fri, 1 Nov 2019 20:11:28 +0000
Message-ID: <AM0PR05MB4866E91139617C9F2380BBAFD1620@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20191030064444.21166-1-jasowang@redhat.com>
 <20191030064444.21166-4-jasowang@redhat.com>
In-Reply-To: <20191030064444.21166-4-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.176.44.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 138b56cc-818d-4114-4cd4-08d75f07ae7a
x-ms-traffictypediagnostic: AM0PR05MB5665:|AM0PR05MB5665:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR05MB5665BDDBAA2337B5A52F0FBDD1620@AM0PR05MB5665.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(189003)(199004)(13464003)(4326008)(99286004)(316002)(6116002)(55016002)(476003)(2906002)(229853002)(9686003)(3846002)(53546011)(110136005)(66946007)(14454004)(25786009)(66476007)(2501003)(54906003)(66066001)(64756008)(66556008)(486006)(11346002)(446003)(76116006)(81156014)(7696005)(74316002)(2201001)(76176011)(7416002)(7406005)(305945005)(33656002)(7736002)(52536014)(26005)(66446008)(5660300002)(86362001)(102836004)(6506007)(6246003)(81166006)(6436002)(71200400001)(71190400001)(8676002)(8936002)(478600001)(14444005)(256004)(186003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB5665;
 H:AM0PR05MB4866.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bv/wZtxh1hquQLapEfoP1sjVlYC3HofuASHTlCDx4m9dhxcBOqiHYEYv4rRo7EHFjCgJZfWdIl8mprQUk04nN9GLhoOiZcDnNQ4vUJCm1x4wB7YRHlJ+4ILk8UnUSRk/SuGp1NAyph1/KQ9HiQvgWNHy9Cw6pF6ESb/XaJyxPPgYITN9IX14KmTE1j7V5QA33ZvDh0HNZ14RSysK/wbEcw2iHDPvXaoM0gFqwXt0YEU1MNlFHArqYTm44cx9T7AV6G0rmUnB8OC9l2MqBuqB0Gk6fmotXzvp0+YYkXaBmTQ6BqAxZb3k8np7upqvKJbc4rknSa27KT496ouPMWiw7HNAzwh+8kWXJKIILNCAEEmKLCdLoqRpyN22SUwgyxtsHeRGK4Hdxq9ICM9tN9yPa8QmpcNjZCaMIOO2oDXE74N9H17kjDecmswI1Kt7pfsu
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138b56cc-818d-4114-4cd4-08d75f07ae7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 20:11:29.0456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOgp+ASMgUu+x5Y5uts7uk6VxHVNawaggp2GYSihgQOFo1NKConiaqp0Rebvsi6pEi34wUTIg6KpCrPQbR8v2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5MgvGOAx/HfUZj2RnveEiLcK9cxzl/d30370nKYdAU=;
 b=XMvYgdJ6jp3kVnbfQS0HzXcbSkQ6At4h8hbWPmXYOdqQQb4KSFhPKnO3oGRl1qJ+XDoXRHmcr0jUUBbGBmQSmgu386c1GJQXQe8CNNKnWCa1erwk9XW+e+zzENnA5pCfx78PVdRDByJ4G/MTzFRb+P0tFe7LNi8XMHVfZYnIm1Q=
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
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAsIDIwMTkgMTo0NSBB
TQo+IFRvOiBrdm1Admdlci5rZXJuZWwub3JnOyBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZzsg
bGludXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgaW50ZWwtCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4ga3dhbmtoZWRlQG52aWRpYS5jb207IGFsZXgud2ls
bGlhbXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsKPiB0aXdlaS5iaWVAaW50ZWwuY29t
Cj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyBuZXRkZXZA
dmdlci5rZXJuZWwub3JnOwo+IGNvaHVja0ByZWRoYXQuY29tOyBtYXhpbWUuY29xdWVsaW5AcmVk
aGF0LmNvbTsKPiBjdW5taW5nLmxpYW5nQGludGVsLmNvbTsgemhpaG9uZy53YW5nQGludGVsLmNv
bTsKPiByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsgeGlhby53LndhbmdAaW50ZWwuY29tOwo+IGhh
b3RpYW4ud2FuZ0BzaWZpdmUuY29tOyB6aGVueXV3QGxpbnV4LmludGVsLmNvbTsgemhpLmEud2Fu
Z0BpbnRlbC5jb207Cj4gamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBqb29uYXMubGFodGlu
ZW5AbGludXguaW50ZWwuY29tOwo+IHJvZHJpZ28udml2aUBpbnRlbC5jb207IGFpcmxpZWRAbGlu
dXguaWU7IGRhbmllbEBmZndsbC5jaDsKPiBmYXJtYW5AbGludXguaWJtLmNvbTsgcGFzaWNAbGlu
dXguaWJtLmNvbTsgc2Vib3R0QGxpbnV4LmlibS5jb207Cj4gb2JlcnBhckBsaW51eC5pYm0uY29t
OyBoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tOyBnb3JAbGludXguaWJtLmNvbTsKPiBib3JudHJh
ZWdlckBkZS5pYm0uY29tOyBha3Jvd2lha0BsaW51eC5pYm0uY29tOyBmcmV1ZGVAbGludXguaWJt
LmNvbTsKPiBsaW5nc2hhbi56aHVAaW50ZWwuY29tOyBJZG8gU2hhbWF5IDxpZG9zQG1lbGxhbm94
LmNvbT47Cj4gZXBlcmV6bWFAcmVkaGF0LmNvbTsgbHVsdUByZWRoYXQuY29tOyBQYXJhdiBQYW5k
aXQKPiA8cGFyYXZAbWVsbGFub3guY29tPjsgY2hyaXN0b3BoZS5kZS5kaW5lY2hpbkBnbWFpbC5j
b207Cj4ga2V2aW4udGlhbkBpbnRlbC5jb207IHN0ZWZhbmhhQHJlZGhhdC5jb207IEphc29uIFdh
bmcKPiA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggVjYgMy82XSBtZGV2
OiBpbnRyb2R1Y2UgZGV2aWNlIHNwZWNpZmljIG9wcwo+IAo+IEN1cnJlbnRseSwgZXhjZXB0IGZv
ciB0aGUgY3JlYXRlIGFuZCByZW1vdmUsIHRoZSByZXN0IG9mIG1kZXZfcGFyZW50X29wcyBpcwo+
IGRlc2lnbmVkIGZvciB2ZmlvLW1kZXYgZHJpdmVyIG9ubHkgYW5kIG1heSBub3QgaGVscCBmb3Ig
a2VybmVsIG1kZXYgZHJpdmVyLgo+IFdpdGggdGhlIGhlbHAgb2YgY2xhc3MgaWQsIHRoaXMgcGF0
Y2ggaW50cm9kdWNlcyBkZXZpY2Ugc3BlY2lmaWMgY2FsbGJhY2tzIGluc2lkZQo+IG1kZXZfZGV2
aWNlIHN0cnVjdHVyZS4gVGhpcyBhbGxvd3MgZGlmZmVyZW50IHNldCBvZiBjYWxsYmFjayB0byBi
ZSB1c2VkIGJ5IHZmaW8tCj4gbWRldiBhbmQgdmlydGlvLW1kZXYuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0KWyAuLl0KCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvdmZpb19tZGV2X29wcy5oIGIvaW5jbHVkZS9saW51eC92Zmlv
X21kZXZfb3BzLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwMDAwMDAuLjM5
MDdjNTM3MWMyYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZmaW9fbWRl
dl9vcHMuaAo+IEBAIC0wLDAgKzEsNTIgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSAqLwo+ICsvKgo+ICsgKiBWRklPIE1lZGlhdGVkIGRldmljZSBkZWZpbml0
aW9uCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBWRklPX01ERVZfSAo+ICsjZGVmaW5lIFZGSU9fTURF
Vl9ICj4gKwpJIHNob3VsZCBoYXZlIG5vdGljZWQgdGhpcyBiZWZvcmUuIDotKApBUElzIGV4cG9z
ZWQgYXJlIGJ5IHRoZSBtZGV2IG1vZHVsZSBhbmQgbmFtZWQgd2l0aCBtZGV2XyBwcmVmaXguCkFu
ZCBmaWxlIG5hbWUgaXMgX29wcy5oLAoKV2Ugc2hvdWxkIG5hbWUgdGhpcyBmaWxlIGFzIG1kZXZf
dmZpb19vcHMuaAoKQW5kICNkZWZpbmUgc2hvdWxkIGJlIE1ERVZfVkZJT19PUFNfSAoKPiArI2lu
Y2x1ZGUgPGxpbnV4L21kZXYuaD4KPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgdmZpb19tZGV2X2Rl
dmljZV9vcHMgLSBTdHJ1Y3R1cmUgdG8gYmUgcmVnaXN0ZXJlZCBmb3IgZWFjaApzL3ZmaW9fbWRl
dl9kZXZpY2Vfb3BzL21kZXZfdmZpb19kZXZpY2Vfb3BzLwoKU2ltaWxhcmx5IGZvciB2aXJ0aW8g
aW4gZnV0dXJlIHBhdGNoZXMuCgo+ICsgKiBtZGV2IGRldmljZSB0byByZWdpc3RlciB0aGUgZGV2
aWNlIHRvIHZmaW8tbWRldiBtb2R1bGUuCj4gKyAqCj4gKyAqIEBvcGVuOgkJT3BlbiBtZWRpYXRl
ZCBkZXZpY2UuCj4gKyAqCQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZS4KPiArICoJCQlSZXR1cm5z
IGludGVnZXI6IHN1Y2Nlc3MgKDApIG9yIGVycm9yICg8IDApCj4gKyAqIEByZWxlYXNlOgkJcmVs
ZWFzZSBtZWRpYXRlZCBkZXZpY2UKPiArICoJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlLgo+ICsg
KiBAcmVhZDoJCVJlYWQgZW11bGF0aW9uIGNhbGxiYWNrCj4gKyAqCQkJQG1kZXY6IG1lZGlhdGVk
IGRldmljZSBzdHJ1Y3R1cmUKPiArICoJCQlAYnVmOiByZWFkIGJ1ZmZlcgo+ICsgKgkJCUBjb3Vu
dDogbnVtYmVyIG9mIGJ5dGVzIHRvIHJlYWQKPiArICoJCQlAcHBvczogYWRkcmVzcy4KPiArICoJ
CQlSZXR1bnMgbnVtYmVyIG9uIGJ5dGVzIHJlYWQgb24gc3VjY2VzcyBvciBlcnJvci4KPiArICog
QHdyaXRlOgkJV3JpdGUgZW11bGF0aW9uIGNhbGxiYWNrCj4gKyAqCQkJQG1kZXY6IG1lZGlhdGVk
IGRldmljZSBzdHJ1Y3R1cmUKPiArICoJCQlAYnVmOiB3cml0ZSBidWZmZXIKPiArICoJCQlAY291
bnQ6IG51bWJlciBvZiBieXRlcyB0byBiZSB3cml0dGVuCj4gKyAqCQkJQHBwb3M6IGFkZHJlc3Mu
Cj4gKyAqCQkJUmV0dW5zIG51bWJlciBvbiBieXRlcyB3cml0dGVuIG9uIHN1Y2Nlc3Mgb3IgZXJy
b3IuCj4gKyAqIEBpb2N0bDoJCUlPQ1RMIGNhbGxiYWNrCj4gKyAqCQkJQG1kZXY6IG1lZGlhdGVk
IGRldmljZSBzdHJ1Y3R1cmUKPiArICoJCQlAY21kOiBpb2N0bCBjb21tYW5kCj4gKyAqCQkJQGFy
ZzogYXJndW1lbnRzIHRvIGlvY3RsCj4gKyAqIEBtbWFwOgkJbW1hcCBjYWxsYmFjawo+ICsgKgkJ
CUBtZGV2OiBtZWRpYXRlZCBkZXZpY2Ugc3RydWN0dXJlCj4gKyAqCQkJQHZtYTogdm1hIHN0cnVj
dHVyZQo+ICsgKi8KPiArc3RydWN0IHZmaW9fbWRldl9kZXZpY2Vfb3BzIHsKPiArCWludCAgICAg
KCpvcGVuKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ICsJdm9pZCAgICAoKnJlbGVhc2Up
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gKwlzc2l6ZV90ICgqcmVhZCkoc3RydWN0IG1k
ZXZfZGV2aWNlICptZGV2LCBjaGFyIF9fdXNlciAqYnVmLAo+ICsJCQlzaXplX3QgY291bnQsIGxv
ZmZfdCAqcHBvcyk7Cj4gKwlzc2l6ZV90ICgqd3JpdGUpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRl
diwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKPiArCQkJIHNpemVfdCBjb3VudCwgbG9mZl90ICpw
cG9zKTsKPiArCWxvbmcJKCppb2N0bCkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1bnNpZ25l
ZCBpbnQgY21kLAo+ICsJCQkgdW5zaWduZWQgbG9uZyBhcmcpOwo+ICsJaW50CSgqbW1hcCkoc3Ry
dWN0IG1kZXZfZGV2aWNlICptZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QKPiAqdm1hKTsKPiAr
fTsKPiArCj4gKyNlbmRpZgo+IGRpZmYgLS1naXQgYS9zYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMu
YyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jIGluZGV4Cj4gMTE1YmM1MDc0NjU2Li4xYWZl
YzIwYmYwYzUgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKPiArKysg
Yi9zYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYwo+IEBAIC0zMCw2ICszMCw3IEBACj4gICNpbmNs
dWRlIDxsaW51eC9pb21tdS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L21kZXYuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3ZmaW9fbWRldl9vcHMuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgo+ICAj
aW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+IEBAIC01MTYsNiArNTE3LDggQEAgc3RhdGljIGlu
dCBtYm9jaHNfcmVzZXQoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ICAJcmV0dXJuIDA7Cj4g
IH0KPiAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2ZmlvX21kZXZfZGV2aWNlX29wcyB2ZmlvX21k
ZXZfb3BzOwo+ICsKPiAgc3RhdGljIGludCBtYm9jaHNfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICpr
b2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpICB7Cj4gIAljb25zdCBzdHJ1Y3QgbWJvY2hz
X3R5cGUgKnR5cGUgPSBtYm9jaHNfZmluZF90eXBlKGtvYmopOyBAQCAtNTYxLDcKPiArNTY0LDcg
QEAgc3RhdGljIGludCBtYm9jaHNfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3Qg
bWRldl9kZXZpY2UKPiAqbWRldikKPiAgCW1ib2Noc19yZXNldChtZGV2KTsKPiAKPiAgCW1ib2No
c191c2VkX21ieXRlcyArPSB0eXBlLT5tYnl0ZXM7Cj4gLQltZGV2X3NldF9jbGFzcyhtZGV2LCBN
REVWX0NMQVNTX0lEX1ZGSU8pOwo+ICsJbWRldl9zZXRfdmZpb19vcHMobWRldiwgJnZmaW9fbWRl
dl9vcHMpOwo+ICAJcmV0dXJuIDA7Cj4gCj4gIGVycl9tZW06Cj4gQEAgLTE0MTksMTIgKzE0MjIs
NyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqbWRldl90eXBlX2dyb3Vwc1tdCj4g
PSB7Cj4gIAlOVUxMLAo+ICB9Owo+IAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50
X29wcyBtZGV2X2ZvcHMgPSB7Cj4gLQkub3duZXIJCQk9IFRISVNfTU9EVUxFLAo+IC0JLm1kZXZf
YXR0cl9ncm91cHMJPSBtZGV2X2Rldl9ncm91cHMsCj4gLQkuc3VwcG9ydGVkX3R5cGVfZ3JvdXBz
CT0gbWRldl90eXBlX2dyb3VwcywKPiAtCS5jcmVhdGUJCQk9IG1ib2Noc19jcmVhdGUsCj4gLQku
cmVtb3ZlCQkJPSBtYm9jaHNfcmVtb3ZlLAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fbWRl
dl9kZXZpY2Vfb3BzIHZmaW9fbWRldl9vcHMgPSB7Cj4gIAkub3BlbgkJCT0gbWJvY2hzX29wZW4s
Cj4gIAkucmVsZWFzZQkJPSBtYm9jaHNfY2xvc2UsCj4gIAkucmVhZAkJCT0gbWJvY2hzX3JlYWQs
Cj4gQEAgLTE0MzMsNiArMTQzMSwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfcGFyZW50
X29wcyBtZGV2X2ZvcHMgPSB7Cj4gIAkubW1hcAkJCT0gbWJvY2hzX21tYXAsCj4gIH07Cj4gCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJlbnRfb3BzIG1kZXZfZm9wcyA9IHsKPiArCS5v
d25lcgkJCT0gVEhJU19NT0RVTEUsCj4gKwkubWRldl9hdHRyX2dyb3Vwcwk9IG1kZXZfZGV2X2dy
b3VwcywKPiArCS5zdXBwb3J0ZWRfdHlwZV9ncm91cHMJPSBtZGV2X3R5cGVfZ3JvdXBzLAo+ICsJ
LmNyZWF0ZQkJCT0gbWJvY2hzX2NyZWF0ZSwKPiArCS5yZW1vdmUJCQk9IG1ib2Noc19yZW1vdmUs
Cj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB2ZF9mb3Bz
ID0gewo+ICAJLm93bmVyCQk9IFRISVNfTU9EVUxFLAo+ICB9Owo+IGRpZmYgLS1naXQgYS9zYW1w
bGVzL3ZmaW8tbWRldi9tZHB5LmMgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgaW5kZXgKPiA2
NjU2MTQ1NzRkNTAuLmQ1NzFmYjY1ZjUwZiAxMDA2NDQKPiAtLS0gYS9zYW1wbGVzL3ZmaW8tbWRl
di9tZHB5LmMKPiArKysgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMKPiBAQCAtMjYsNiArMjYs
NyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3N5c2Zz
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC92ZmlvX21k
ZXZfb3BzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1f
Zm91cmNjLmg+Cj4gICNpbmNsdWRlICJtZHB5LWRlZnMuaCIKPiBAQCAtMjI2LDYgKzIyNyw4IEBA
IHN0YXRpYyBpbnQgbWRweV9yZXNldChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4gIAlyZXR1
cm4gMDsKPiAgfQo+IAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fbWRldl9kZXZpY2Vfb3Bz
IHZmaW9fbWRldl9vcHM7Cj4gKwo+ICBzdGF0aWMgaW50IG1kcHlfY3JlYXRlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpICB7Cj4gIAljb25zdCBzdHJ1Y3Qg
bWRweV90eXBlICp0eXBlID0gbWRweV9maW5kX3R5cGUoa29iaik7IEBAIC0yNjksNwo+ICsyNzIs
NyBAQCBzdGF0aWMgaW50IG1kcHlfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3Qg
bWRldl9kZXZpY2UKPiAqbWRldikKPiAgCW1kcHlfcmVzZXQobWRldik7Cj4gCj4gIAltZHB5X2Nv
dW50Kys7Cj4gLQltZGV2X3NldF9jbGFzcyhtZGV2LCBNREVWX0NMQVNTX0lEX1ZGSU8pOwo+ICsJ
bWRldl9zZXRfdmZpb19vcHMobWRldiwgJnZmaW9fbWRldl9vcHMpOwo+ICAJcmV0dXJuIDA7Cj4g
IH0KPiAKPiBAQCAtNzI2LDEyICs3MjksNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91
cCAqbWRldl90eXBlX2dyb3Vwc1tdID0gewo+ICAJTlVMTCwKPiAgfTsKPiAKPiAtc3RhdGljIGNv
bnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0gewo+IC0JLm93bmVyCQkJPSBU
SElTX01PRFVMRSwKPiAtCS5tZGV2X2F0dHJfZ3JvdXBzCT0gbWRldl9kZXZfZ3JvdXBzLAo+IC0J
LnN1cHBvcnRlZF90eXBlX2dyb3Vwcwk9IG1kZXZfdHlwZV9ncm91cHMsCj4gLQkuY3JlYXRlCQkJ
PSBtZHB5X2NyZWF0ZSwKPiAtCS5yZW1vdmUJCQk9IG1kcHlfcmVtb3ZlLAo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IHZmaW9fbWRldl9kZXZpY2Vfb3BzIHZmaW9fbWRldl9vcHMgPSB7Cj4gIAkub3Bl
bgkJCT0gbWRweV9vcGVuLAo+ICAJLnJlbGVhc2UJCT0gbWRweV9jbG9zZSwKPiAgCS5yZWFkCQkJ
PSBtZHB5X3JlYWQsCj4gQEAgLTc0MCw2ICs3MzgsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
ZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0gewo+ICAJLm1tYXAJCQk9IG1kcHlfbW1hcCwKPiAg
fTsKPiAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgbWRldl9mb3BzID0g
ewo+ICsJLm93bmVyCQkJPSBUSElTX01PRFVMRSwKPiArCS5tZGV2X2F0dHJfZ3JvdXBzCT0gbWRl
dl9kZXZfZ3JvdXBzLAo+ICsJLnN1cHBvcnRlZF90eXBlX2dyb3Vwcwk9IG1kZXZfdHlwZV9ncm91
cHMsCj4gKwkuY3JlYXRlCQkJPSBtZHB5X2NyZWF0ZSwKPiArCS5yZW1vdmUJCQk9IG1kcHlfcmVt
b3ZlLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdmRf
Zm9wcyA9IHsKPiAgCS5vd25lcgkJPSBUSElTX01PRFVMRSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEv
c2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jIGluZGV4
Cj4gOTBkYTEyZmY3ZmQ5Li40MDQ4YjI0MmM2MzYgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy92Zmlv
LW1kZXYvbXR0eS5jCj4gKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jCj4gQEAgLTI3LDYg
KzI3LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2N0eXBlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9m
aWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZGV2Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC92Zmlv
X21kZXZfb3BzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3NlcmlhbC5oPgo+ICAjaW5jbHVkZSA8dWFwaS9saW51eC9zZXJpYWxfcmVnLmg+Cj4gQEAgLTcw
OCw2ICs3MDksOCBAQCBzdGF0aWMgc3NpemVfdCBtZGV2X2FjY2VzcyhzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYsCj4gdTggKmJ1Ziwgc2l6ZV90IGNvdW50LAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+
IAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fbWRldl9kZXZpY2Vfb3BzIHZmaW9fZGV2X29w
czsKPiArCj4gIHN0YXRpYyBpbnQgbXR0eV9jcmVhdGUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldikgIHsKPiAgCXN0cnVjdCBtZGV2X3N0YXRlICptZGV2X3N0
YXRlOwo+IEBAIC03NTUsNyArNzU4LDcgQEAgc3RhdGljIGludCBtdHR5X2NyZWF0ZShzdHJ1Y3Qg
a29iamVjdCAqa29iaiwgc3RydWN0Cj4gbWRldl9kZXZpY2UgKm1kZXYpCj4gIAlsaXN0X2FkZCgm
bWRldl9zdGF0ZS0+bmV4dCwgJm1kZXZfZGV2aWNlc19saXN0KTsKPiAgCW11dGV4X3VubG9jaygm
bWRldl9saXN0X2xvY2spOwo+IAo+IC0JbWRldl9zZXRfY2xhc3MobWRldiwgTURFVl9DTEFTU19J
RF9WRklPKTsKPiArCW1kZXZfc2V0X3ZmaW9fb3BzKG1kZXYsICZ2ZmlvX2Rldl9vcHMpOwo+ICAJ
cmV0dXJuIDA7Cj4gIH0KPiAKPiBAQCAtMTM4OCw2ICsxMzkxLDE0IEBAIHN0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlX2dyb3VwICptZGV2X3R5cGVfZ3JvdXBzW10KPiA9IHsKPiAgCU5VTEwsCj4gIH07
Cj4gCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19tZGV2X2RldmljZV9vcHMgdmZpb19kZXZf
b3BzID0gewo+ICsJLm9wZW4JCT0gbXR0eV9vcGVuLAo+ICsJLnJlbGVhc2UJPSBtdHR5X2Nsb3Nl
LAo+ICsJLnJlYWQJCT0gbXR0eV9yZWFkLAo+ICsJLndyaXRlCQk9IG10dHlfd3JpdGUsCj4gKwku
aW9jdGwJCT0gbXR0eV9pb2N0bCwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRl
dl9wYXJlbnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAgCS5vd25lciAgICAgICAgICAgICAgICAgID0g
VEhJU19NT0RVTEUsCj4gIAkuZGV2X2F0dHJfZ3JvdXBzICAgICAgICA9IG10dHlfZGV2X2dyb3Vw
cywKPiBAQCAtMTM5NSwxMSArMTQwNiw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9wYXJl
bnRfb3BzIG1kZXZfZm9wcyA9IHsKPiAgCS5zdXBwb3J0ZWRfdHlwZV9ncm91cHMgID0gbWRldl90
eXBlX2dyb3VwcywKPiAgCS5jcmVhdGUgICAgICAgICAgICAgICAgID0gbXR0eV9jcmVhdGUsCj4g
IAkucmVtb3ZlCQkJPSBtdHR5X3JlbW92ZSwKPiAtCS5vcGVuICAgICAgICAgICAgICAgICAgID0g
bXR0eV9vcGVuLAo+IC0JLnJlbGVhc2UgICAgICAgICAgICAgICAgPSBtdHR5X2Nsb3NlLAo+IC0J
LnJlYWQgICAgICAgICAgICAgICAgICAgPSBtdHR5X3JlYWQsCj4gLQkud3JpdGUgICAgICAgICAg
ICAgICAgICA9IG10dHlfd3JpdGUsCj4gLQkuaW9jdGwJCSAgICAgICAgPSBtdHR5X2lvY3RsLAo+
ICB9Owo+IAo+ICBzdGF0aWMgdm9pZCBtdHR5X2RldmljZV9yZWxlYXNlKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiAtLQo+IDIuMTkuMQpXaXRoIGFib3ZlIHNtYWxsIG5pdCBjaGFuZ2VzIHRvIHJlbmFt
ZSB0aGUgZmllbGRzIGFuZCBmaWxlLAoKUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZA
bWVsbGFub3guY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
