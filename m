Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B101024A7
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 13:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8686E8EE;
	Tue, 19 Nov 2019 12:40:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40076.outbound.protection.outlook.com [40.107.4.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899736E8AA;
 Tue, 19 Nov 2019 12:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLYvln+/LQzyjZqYco+aOT2Rkay3LkjwA/rtGRiGdimyN37gBw1ny0ACF7S23ZyIQ2umWQDuI1zpiZiJOjYIGQYXeAipV54K/zFOCX4lzSa+qu74yn8Ku08NNhl59BSwXUDNNz3mxehZ/OiRo55F8ndRvd4V9RdgfRBdiFyw2mKzI6K38BrTzEU3lPPCfXAJU9WMt7/BvC8UmJOKsVjj1XJ8qCxRfFOl3J6j9PC5+MTUQOLt2fJ8M4c0DEQWFIvi57WzvW9LG9gMc2w40qzbGaWaJvrltjZr61KPFOfTSgbLqzU7F/9KZ4rwhnU241hS4UWo61pDZJWYT+9qbwtsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VkkhcnRUliGsx7VVMjyMh4ySrulKOW+KrvMtXWGaQI=;
 b=hSwD2AriARO1VVNzhtgq/eeosyT5qlyO/dtP5QPbK5ghSPZFHgPWBFE0LapIK96g7km4An1Ak0VI27aM1t/viVSE+DJFt9QCMZrV6ZUyUlGdrWX8xSPlZ2FxCKgnK3Xr/pmEfvfHs/vvEszalI2AaiHlqOYAwzU8YAu+8ZPJ8x8D7Lh8RJRBSYepf4Q7N/QFcdUYGnl/yZLGsjWa+kUPxroHcCqh/Iaui0jEFqnl0p/SDnTVKeShg8qm07C9UjQ4zO7cp0Z8n5gp1rR/QAWQ+S/patrUIzh22m3RiRWIdhLIaiaImwO0iRXqIX7eN810oSTbYf2gc4jFDsNyc6tW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB4858.eurprd05.prod.outlook.com (20.176.234.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Tue, 19 Nov 2019 12:40:03 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::451b:7808:4468:e116%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 12:40:03 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Thread-Topic: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Thread-Index: AQHVnf/RA3TghfsdmEu7f/QASUhCzKeRCnoAgADFaICAAKEIAA==
Date: Tue, 19 Nov 2019 12:40:03 +0000
Message-ID: <20191119124000.GB26739@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-7-jasowang@redhat.com>
 <20191118151706.GA371978@kroah.com>
 <4fed1e7e-9d27-d441-f0a1-0eb6f15e90b1@redhat.com>
In-Reply-To: <4fed1e7e-9d27-d441-f0a1-0eb6f15e90b1@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:91::36) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 06bf29d7-cbbf-49c5-de5d-08d76ced9954
x-ms-traffictypediagnostic: DB7PR05MB4858:|DB7PR05MB4858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR05MB485842F1873A11683A35A163CF4C0@DB7PR05MB4858.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
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
x-microsoft-antispam-message-info: Gobv0BIavlaQmpnestVOadnhSYosp43JJWGAieFQm4EAQJAdrTLyIZ6LyIZ7/HiU47Y4VBLgQIQV7edYw63OX2R8df4oF0B6pp8XfEP3KpfUZBFVLdq5n0myzjZ68r2reHz0WC2mqgWVRKpngySW5fpVdjc0Ed+tQiLQd4cvFKkpj1Qsh+IS3jOLzWGwlbE98k5kVjWzUI0ReENPZs/GtWpf0BDNCVZB9wKUXUvjhZlYAXMPUhK5cMSoFGyPe3CPShAHfKot/aDabWrL06PW70uqvrxpuCOSOfL63MSWIMJ9o8rotNo6v1DJM0BMqYYofnBuEXJT2MoECYWZKkc2+FZ0qPlHCCewypAFI8KfacKyaoakQ96y7dId6KxEUAA1ZWLlLaWmynWIC/5XHsV1W60//NTBAttzosbnllL919JSfXedkDWv3l4pOYP+amFn
Content-ID: <963D462E96EFBB459156BC0754B6B404@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bf29d7-cbbf-49c5-de5d-08d76ced9954
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 12:40:03.3268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dPF6TeHweDXV1bdvjGqqUNNQ+5llO54oUjcbaLJilcY5EZwTB21vEMOu7vxbaTABLJ+plteH17y9tINb2jyCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB4858
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VkkhcnRUliGsx7VVMjyMh4ySrulKOW+KrvMtXWGaQI=;
 b=FUZJuzOpyYZ079wH5V1I+RMFe3Mj1psTvOG7hLHYAUkUYtNJ1Sqd1h6Lkk36nsaMi3/lh9X9vWeotd1eTnkBbEE+B7Mc/Gv/zAg0EK+KYQKRxwy89nJHVdCc/pbHXCHgqO6kY/4JDyZ0D1n9nVG04s06/AyNv+GsY9JrPWN/lB4=
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

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTE6MDM6MzlBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiA+IEFsc28sIHNlZSB0aGUgb3RoZXIgY29udmVyc2F0aW9ucyB3ZSBhcmUgaGF2aW5nIGFi
b3V0IGEgInZpcnR1YWwiIGJ1cwo+ID4gYW5kIGRldmljZXMuICBJIGRvIG5vdCB3YW50IHRvIGhh
dmUgdHdvIGRpZmZlcmVudCB3YXlzIG9mIGRvaW5nIHRoZSBzYW1lCj4gPiB0aGluZyBpbiB0aGUg
a2VybmVsIGF0IHRoZSBzYW1lIHRpbWUgcGxlYXNlLiAgUGxlYXNlIHdvcmsgdG9nZXRoZXIgd2l0
aAo+ID4gdGhlIEludGVsIGRldmVsb3BlcnMgdG8gc29sdmUgdGhpcyBpbiBhIHVuaWZpZWQgd2F5
LCBhcyB5b3UgYm90aAo+ID4gbmVlZC93YW50IHRoZSBzYW1lIHRoaW5nIGhlcmUuCj4gCj4gU3Vy
ZSwgc29tZSBmdW5jdGlvbnMgbG9va3Mgc2ltaWxhciwgYnV0IHRoZSAidmlydHVhbCIgYnVzIGRv
ZXMgbm90IGNvbnRhaW4gYQo+IG1hbmFnZW1lbnQgaW50ZXJmYWNlIGFuZCBpdCdzIG5vdCBjbGVh
ciB0aGF0IGhvdyBpdCBjYW4gYmUgdXNlZCBieSB1c2Vyc3BhY2UKPiBkcml2ZXIuIEZvciB0aGlz
IHNlcmllcywgc3lzZnMvR1VJRCBiYXNlZCBtYW5hZ2VtZW50IGludGVyZmFjZSBpcyByZXVzZWQg
YW5kCj4gd2UgaGFkIGEgY29uY3JldGUgZXhhbXBsZSBvZiBob3cgaXQgd291bGQgYmUgdXNlZCBi
eSB1c2Vyc3BhY2UgZHJpdmVyWzFdIGFuZAo+IGEgcmVhbCBoYXJkd2FyZSBkcml2ZXIgaW1wbGVt
ZW50YXRpb25bMl0uCgpUaGUgbGlmZWN5Y2xlIHN0dWZmIHNob3VsZCBiZSByZS11c2VkIHRocm91
Z2ggYSBsaWJyYXJ5IG9mIHRoaXMgZ3VpZApzdHVmZiwgbm90IGJ5ICdzdWJjbGFzc2luZycgbWRl
dl9kZXZpY2UKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
