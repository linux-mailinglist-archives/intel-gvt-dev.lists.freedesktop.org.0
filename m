Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE56CB4E1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Mar 2023 05:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5891710E7E8;
	Tue, 28 Mar 2023 03:32:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2610E429;
 Tue, 28 Mar 2023 03:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679974337; x=1711510337;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7kxTOKe8E/BqpSgLGiZGQ6HaV7HD7tQ+5BxpbehWQTs=;
 b=H3TXIsi7WtjCXwcUtw9TihMYed2QKwQTn1UxHG3y72TmPQ/FYjy2ikKg
 m3HjoQQW+royqeba/5HZxaqtcHJv7rhwID7eaDCmxSnPR1ROboM3fU7nI
 zkklVrN8Lvi+imzNbMQ7g21H16TsHxLPQf9OIp6OfFOJLd41p8TWnHNDk
 EZh3tLAaNVu13KghpAXU4rn73AzkBchjo6W+zBNGhf9MpR12NTl0mspDj
 obJA+IAmhTekg7WSz4/2QeAsPaX40rNydXhkJuy5WdQv9+0ozXisGeHBf
 HXbAsbS9z+E5E2s0a2lC2CDznk4eXlA11g9I6WttQt438gEDrK0k/8GQK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="368216716"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="368216716"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 20:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683724588"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="683724588"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 27 Mar 2023 20:32:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 20:32:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 20:32:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 20:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5zneCLENV0M/w818VTdvRGiPqq7GPSKJYTjJ6UazrPXmSn8K+vcvM/j+/Hj/BUQMx5SBg/dR1+YGyYrfwtpduXi7wrFBgSFEq7KPTbAT1ircKVfbQjqaJ5dST5/BpJ2YvdFXbAP+alSmTY6D9UKdj4wOWjDJ8xrs/6POsIPZax/hxrVy9W3ft2Hzr+/p7xZXaQyLhflyZyiYQ5BLb12gAI3ezDMIC3yR5tvWK1NWIdHPOIIRc5tUbNAdD5LTofgPAC9o4kzTmx2maqYN76MdGLFr7tpytpGWRIQPclSQcRNp2qB7uxyuwueY4/84FzjZ0Nfc1CTKK6XoF3IhDSgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kxTOKe8E/BqpSgLGiZGQ6HaV7HD7tQ+5BxpbehWQTs=;
 b=QJkbDqOyCIhYCFmHKwEdpfgl8qB95QrKBUGv4k24FH4hSrNp50UCn/n0p5U1ptN/fGCEy3nJaoipshgKMyjT4xJVbMTMOd/g8aR4f64Z1B4T3rVv6qqI3jEiMm0gVt0JtjYERlrFmXPCPN8EG/xeM5L+pYZMqzZY1Ynnrwg8Sc3ERjKeeUdKCIrqdStGQjzz81GLz5OkgAI+FqEzabTvw8VAGbJ+GW0cYUXbF7svCXC32itoahNk/Wr7uxIg3qEZJCwgWaVbhzeU4BZzId9oYe/aXqrLqdJ+JbObihUSN+FXlSv6F9f1xX8sH/P6VF3cLVT+vnrf8Lskgi6oHgeR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 03:32:10 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 03:32:10 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Thread-Topic: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Thread-Index: AQHZYI92Dc+A7iEOnEaMeK3O2ipWfK8PAuSAgACBxlA=
Date: Tue, 28 Mar 2023 03:32:10 +0000
Message-ID: <DS0PR11MB7529E969C27995D535A24EC0C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
 <20230327093458.44939-11-yi.l.liu@intel.com>
 <20230327132619.5ab15440.alex.williamson@redhat.com>
In-Reply-To: <20230327132619.5ab15440.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CO6PR11MB5636:EE_
x-ms-office365-filtering-correlation-id: b8169c47-58c2-4cea-3264-08db2f3d03e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4uh9eD+Z4pdagRkMW1NPQAU8QgRX1p8Sxn+bh7pFbzWUAuTKxI9xHW/flnrkB8LWSjpD20dmVamYaUK5Qikl85ZdIQMYvQSulKglgfz1dzP9MPK+pa1aTldd4nvamAsYzCJL/1mTnzwqmZiRzv51P3CPSIoM2as1BGz03DLsNrv056+fdr5Bt4cmAfRwoRBbScWt8TZ3ZimPBYOFU7PWXGKn6bAgp2wn7QBMpOW5j7/xLW98b2qAUQcl/Zkr7PHaeT6SOjuTCd2ANgQHMda+Fu2PmXAe6y0UfL2siXtjRVshneHaaR88kC4Vu0FY0L+fjSpF1dqiN3TUZkFvKI5TSmtLdxw3UZiuisJJWZ1rw48CSGm8x2WKR6HVYp/p1pJNTQ9GM3H6H0Q9ybUyABBj4/zr7/Z4cV6ZeKBMhiHtff1/7gYUyyEizcGVXBE+OcFW8m0FyEFVywU5pZRN0xnPFv3+47QSka3eiZImQ+C08fw89rb+gS5FFtRgkJDf7OX2PuE5AuCQvJcO77zeuUGxx43r60Jd7mzsCc5F5Dga4j0Js4WwjEzl3IuVFzb5i7HcPzh/uzCubt312h2Nm+ZmTxlCRlbDIlasJmOCHa8LBRwMIwQXko4gE714s5z8V4za+ldhUWQhwdnWNLZbx5CtsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(9686003)(6506007)(26005)(41300700001)(55016003)(186003)(7696005)(71200400001)(83380400001)(478600001)(54906003)(316002)(38100700002)(64756008)(4326008)(66476007)(66446008)(30864003)(2906002)(76116006)(7416002)(66556008)(66946007)(8676002)(6916009)(33656002)(52536014)(82960400001)(86362001)(38070700005)(5660300002)(8936002)(122000001)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVo3V3BlWlVzM3dNeDU4N1RTVTF3WTVzTXFySzYvcnZ6K2tiNXhJM1g1MVhp?=
 =?utf-8?B?LzFEdWc1dEFrczZISjJZekE4Rjh5eGl1YzJsdmVaemxHZDc1aUljZGtXRHZX?=
 =?utf-8?B?WXhnRFQwNnA2dGpaaGFBT01aVzc5SHRUVW5pTkRVcStyZnlCMXE3eDByWlN0?=
 =?utf-8?B?cVd3L1VaQm96dUdmcDhFT3QrUERhWG5GQ1ROR2ZMWHVTcXJtTklvSjZFU0Q1?=
 =?utf-8?B?NzJWWVFCd2t1WFZXb1RDanhUM0RRa1ZoVUx0YW5TTW5QWEllRWdobURVT0x6?=
 =?utf-8?B?ZnhQUktWRXRmR3habVMwdDdpRXVkYlZiai9WOTkzK3lFUk5BK3N3QUJCaVh0?=
 =?utf-8?B?Z1puY3FIaC8rMW81OHZDMHRPSDRBcWQxSFVBODNMaDF1OVVUMkd0MzR1N1Fi?=
 =?utf-8?B?T3puaEFmNDUzUHcvZklBeEhoUHZJV3VydUZ5M0ZIZWx5blZSVDlVRVJaREti?=
 =?utf-8?B?VmlqdVFLUXBQeVpYeXZtZVhaY0M5OXFuS0xNb0p2Z3UwcHlRQmwwbWduSXNh?=
 =?utf-8?B?ejRkNWdDZDBhWTlTaFp2ZHk0aVJUMmI5Z0VQSHRldG5ib0dBaXRSSXV4dW5x?=
 =?utf-8?B?a3duSzJDeCtxSkIvODVoUjZ2R201bEhsQVRLQVZmbXhoaUdPVnpaOUQ3c0pt?=
 =?utf-8?B?b2FmdkNGT2RTUGxKKzhHSkdPZWN0eWZFTGlLNVFXNGV2eFgrUDM5WUpORGF3?=
 =?utf-8?B?UmxDL0Z6RjhoN1A4QTh6elVRVUd0b3FsanhkbWExSnI4aTFPVXQ5WTVibWxj?=
 =?utf-8?B?RU95TGtIQnJRNXEvNThNL09kelB4elJaaFBic0JxY3QwdEdVT2ZNbW5mMXdz?=
 =?utf-8?B?aDFTeFlvWEpjSEZaUmphYisvYVhNVWlaQjdnbXl1TEV3VkM5LzZ1ZjR5Z015?=
 =?utf-8?B?VkZiZ2ZZQmlmUXF3UFRvYlVnd0EzRkJLZ2NJbEh5YS9xSUgzL2JmUnpWMTE1?=
 =?utf-8?B?UG9yS3NSKzFGMHlFSG1ZMDNZOWxDbXcxRmJjM1VHajdmeGpjVWFVbUJkbmFk?=
 =?utf-8?B?Njc3ZmtjSVJQNTlmcml4aXd4VjRtajNLYXAyYUxnUm1HSnhxbW9ELy82WkZC?=
 =?utf-8?B?UTdrTXJ5Ry9JQWcwQ3hNNjNkZ3hNS25oOUdFc3lnRTNPWUNUdFh2S3ZRTVJ2?=
 =?utf-8?B?TVljdElBQ1h3TkpIQ29DK0ZnUGJxbXJXK2N3djk5ZEdYUlRURG5aUzRqTEZE?=
 =?utf-8?B?bzRJdDQrdEFROW5ZOTIvY3NUK3lrVHdqeUFXL2VEekJRNGhHNVFSTU1CS3Zu?=
 =?utf-8?B?NFNsMnE3NXlQWFJEQmxPem5KandES0xUODg2L3J0TjZZSHdkZUtkS3Q2Y1k3?=
 =?utf-8?B?Y1FqTUZSRjlOWlVLRWhDa28wOFNTdkN1U3ROTnFYSGpsSnh4RFFwV3ZSMC9P?=
 =?utf-8?B?NlNMOFhTWGc5RGNzdUY5QmFyYkErSmdTMXpaMDNjeUoxeUpoL3FVWEhrY1R5?=
 =?utf-8?B?emtZS1c3WUhHZHAxQmhwU0tMVmlSN1ZEL1U4NmdlL2FBOWhsdUloQmJBa2gw?=
 =?utf-8?B?OWNGUzRDbE1kZFUxL09QY2M4TVlmQnRjWWg3L0tiY2hBY0hFTlArQW9SQXAv?=
 =?utf-8?B?QkhOOE9kc29rSEtZNlBOK1d4YkVOeXRwaEVGYU5lZEZPSVIzQ2lxYWg5ZmxM?=
 =?utf-8?B?QjZyU0lrNldQVUN0RGU1S0pjT1BLSFBUeGhEbzd6UExFekF0SnlzcXJiU0VY?=
 =?utf-8?B?akk1VFRjcXJJcWVHb1VyTFNDOGFPMlBpMWJoMEVJVGFIUzN0VkMzMDRybUxI?=
 =?utf-8?B?U0ZZZG9LOHFRZ3NaNTl0UVliY203cWRlb1FaK1pPSloxK2dWRDFyR0FpdTR3?=
 =?utf-8?B?N0RXTlZyckoyTXFQZVRqYnlGNk5PakNrZFlFK0V1RnBEVUhXNVRQQ3NmNDBh?=
 =?utf-8?B?T0tZQTE2cStXOVlwZ1p0L1ZoM0ZEOEtCQUIxSDJzQUhPR3lkYyt1cDJDanV5?=
 =?utf-8?B?eXR2cHJlQzNaSzhINXpVVUNjRkRIdjg2VitmbnJpY0ZnZ0xSY0syRnd3TWVH?=
 =?utf-8?B?TE9VcVM1RnYwb0F2THU5SXh1YXpHSWtZOVdDUWpRdXFqeUxGYlk1MmRmTjJ5?=
 =?utf-8?B?WnUwYXF3WUZ1WG1GZWlPL2FIRHlrajJ2ajd2S0ZGL3c5bHlNanRranZpc04x?=
 =?utf-8?Q?ABWhgFtYKl1gGD+3vYF6eEH/y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8169c47-58c2-4cea-3264-08db2f3d03e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 03:32:10.7491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXclLlonVf8JEylN9LTOVmXa5C5NYsjC1r7IJUahURR8C/8y50fARFoqYYoa877eKqgnGJEjHaVtLVauZ6KRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-OriginatorOrg: intel.com
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBNYXJjaCAyOCwgMjAyMyAzOjI2IEFNDQo+IA0KPiBPbiBNb24sIDI3IE1h
ciAyMDIzIDAyOjM0OjU4IC0wNzAwDQo+IFlpIExpdSA8eWkubC5saXVAaW50ZWwuY29tPiB3cm90
ZToNCj4gDQo+ID4gVGhpcyBpcyBhIHByZXBhcmF0aW9uIGZvciB2ZmlvIGRldmljZSBjZGV2IGFz
IGNkZXYgZ2l2ZXMgdXNlcnNwYWNlIHRoZQ0KPiA+IGNhcGFiaWxpdHkgdG8gb3BlbiBkZXZpY2Ug
Y2RldiBmZCBhbmQgbWFuYWdlbWVudCBzdGFjayAoZS5nLiBsaWJ2aXJ0KQ0KPiA+IGNvdWxkIHBh
c3MgdGhlIGRldmljZSBmZCB0byB0aGUgYWN0dWFsIHVzZXIgKGUuZy4gUUVNVSkuIEFzIGEgcmVz
dWx0LA0KPiA+IHRoZSBhY3R1YWwgdXNlciBoYXMgbm8gaWRlYSBhYm91dCB0aGUgZGV2aWNlJ3Mg
YnVzOmRldmZuIGluZm9ybWF0aW9uLg0KPiA+IFRoaXMgaXMgYSBwcm9ibGVtIHdoZW4gdXNlciB1
c2VzIFZGSU9fREVWSUNFX0dFVF9QQ0lfSE9UX1JFU0VUX0lORk8gdG8NCj4gPiBrbm93IHRoZSBo
b3QgcmVzZXQgYWZmZWN0ZWQgZGV2aWNlIHNjb3BlIGFzIHRoaXMgaW9jdGwgcmV0dXJucyBidXM6
ZGV2Zm4NCj4gPiBpbmZvLiBGb3IgdGhlIGZkIHBhc3NpbmcgdXNhZ2UsIHRoZSBhY3V0YWwgdXNl
ciBjYW5ub3QgbWFwIHRoZSBidXM6ZGV2Zm4NCj4gPiB0byB0aGUgZGV2aWNlcyBpdCBoYXMgb3Bl
bmVkIHZpYSB0aGUgZmQgcGFzc2VkIGZyb20gbWFuYWdlbWVudCBzdGFjay4gU28NCj4gPiBhIG5l
dyBpb2N0bCBpcyByZXF1aXJlZC4NCj4gPg0KPiA+IFRoaXMgbmV3IGlvY3RsIHJlcG9ydHMgdGhl
IGxpc3Qgb2YgaW9tbXVmZCBkZXZfaWQgdGhhdCBpcyBvcGVuZWQgYnkgdGhlDQo+ID4gdXNlci4g
SWYgdGhlcmUgaXMgYWZmZWN0ZWQgZGV2aWNlIHRoYXQgaXMgbm90IGJvdW5kIHRvIHZmaW8gZHJp
dmVyIG9yDQo+ID4gb3BlbmVkIGJ5IGFub3RoZXIgdXNlciwgdGhpcyBjb21tYW5kIHNoYWxsIGZh
aWwgd2l0aCAtRVBFUk0uIEZvciB0aGUNCj4gPiBub2lvbW11IG1vZGUgaW4gdGhlIHZmaW8gZGV2
aWNlIGNkZXYgcGF0aCwgdGhpcyBzaGFsbCBmYWlsIGFzIG5vIGRldl9pZA0KPiA+IHdvdWxkIGJl
IGdlbmVyYXRlZCwgaGVuY2Ugbm90aGluZyB0byByZXBvcnQuDQo+ID4NCj4gPiBUaGlzIGlvY3Rs
IGlzIHVzZWxlc3MgdG8gdGhlIHVzZXJzIHRoYXQgb3BlbiB2ZmlvIGdyb3VwIGFzIHN1Y2ggdXNl
cnMNCj4gPiBoYXZlIG5vIGlkZWEgYWJvdXQgdGhlIGlvbW11ZmQgZGV2X2lkIGFuZCBpdCBjYW4g
dXNlIHRoZSBleGlzdGluZw0KPiA+IFZGSU9fREVWSUNFX0dFVF9QQ0lfSE9UX1JFU0VUX0lORk8u
IFRoZSB1c2VyIHRoYXQgdXNlcyB0aGUgdHJhZGl0aW9uYWwNCj4gPiBtb2RlIHZmaW8gZ3JvdXAv
Y29udGFpbmVyIHdvdWxkIGJlIGZhaWxlZCBpZiBpbnZva2luZyB0aGlzIGlvY3RsLiBCdXQNCj4g
PiB0aGUgdXNlciB0aGF0IHVzZXMgdGhlIGlvbW11ZmQgY29tcGF0IG1vZGUgdmZpbyBncm91cC9j
b250YWluZXIgc2hhbGwNCj4gPiBzdWNjZWVkLiBUaGlzIGlzIGhhcm1sZXNzIGFzIGxvbmcgYXMg
dXNlciBjYW5ub3QgbWFrZSB1c2Ugb2YgaXQgYW5kDQo+ID4gc2hvdWxkIHVzZSBWRklPX0RFVklD
RV9HRVRfUENJX0hPVF9SRVNFVF9JTkZPLg0KPiANCj4gDQo+IFNvIFZGSU9fREVWSUNFX0dFVF9Q
Q0lfSE9UX1JFU0VUX0lORk8gcmVwb3J0cyBhIGdyb3VwIGFuZCBiZGYsIGJ1dA0KPiBWRklPX0RF
VklDRV9HRVRfUENJX0hPVF9SRVNFVF8qR1JPVVAqX0lORk8gaXMgbWVhbnQgZm9yIHRoZSBub24t
DQo+IGdyb3VwLA0KPiBjZGV2IHVzZSBjYXNlIGFuZCByZXR1cm5zIGEgZGV2X2lkIHJhdGhlciB0
aGFuIGEgZ3JvdXA/Pz8NCg0KWWVzLCB0aGlzIGlzIHRoZSBtZWFuaW5nLCBidXQgcG9vciBuYW1p
bmcgaGVyZSDimLkgSSBhbHNvIHN0cnVnZ2xlZCBvbiBpdC4NClBlcmhhcHMgeW91ciBiZWxvdyBT
dWdnZXN0aW9uIG1ha2VzIG1vcmUgc2Vuc2UuIEludHJvZHVjaW5nIGEgZmxhZyBhbmQNCnJldXNl
IHRoZSBleGlzdGluZyBfSU5GTyBpb2N0bC4NCg0KPiBBZGRpdGlvbmFsbHksIFZGSU9fREVWSUNF
X0dFVF9QQ0lfSE9UX1JFU0VUX0lORk8gaGFzIGEgZmxhZ3MgYXJnIHRoYXQNCj4gaXNuJ3QgdXNl
ZCwgd2h5IGRvIHdlIG5lZWQgYSBuZXcgaW9jdGwgdnMgZGVmaW5pbmcNCj4gVkZJT19QQ0lfSE9U
X1JFU0VUX0ZMQUdfSU9NTVVGRF9ERVZfSUQuDQoNClN1cmUuIEkgY2FuIGZvbGxvdyB0aGlzIHN1
Z2dlc3Rpb24uIEJUVy4gSSBoYXZlIGEgZG91YnQgaGVyZS4gVGhpcyBuZXcgZmxhZw0KaXMgc2V0
IGJ5IHVzZXIuIFdoYXQgaWYgaW4gdGhlIGZ1dHVyZSBrZXJuZWwgaGFzIG5ldyBleHRlbnNpb25z
IGFuZCBuZWVkcw0KdG8gcmVwb3J0IHNvbWV0aGluZyBuZXcgdG8gdGhlIHVzZXIgYW5kIGFkZCBu
ZXcgZmxhZ3MgdG8gdGVsbCB1c2VyPyBTdWNoDQpmbGFnIGlzIHNldCBieSBrZXJuZWwuIFRoZW4g
dGhlIGZsYWdzIGZpZWxkIG1heSBoYXZlIHR3byBraW5kcyBvZiBmbGFncyAoc29tZQ0Kc2V0IGJ5
IHVzZXIgd2hpbGUgc29tZSBzZXQgYnkga2VybmVsKS4gV2lsbCBpdCBtZXNzIHVwIHRoZSBmbGFn
cyBzcGFjZT8NCg0KPiAgSW4gZmFjdCwgd2UgY291bGQgZGVmaW5lIHZmaW9fZGVwZW5kZW50X2Rl
dmljZSBhczoNCj4gDQo+IHN0cnVjdCB2ZmlvX3BjaV9kZXBlbmRlbnRfZGV2aWNlIHsNCj4gCXVu
aW9uIHsNCj4gCSAgICAgICAgX191MzIgICBncm91cF9pZDsNCj4gCQlfX3UzMglkZXZfaWQ7DQo+
IAl9DQo+ICAgICAgICAgX191MTYgICBzZWdtZW50Ow0KPiAgICAgICAgIF9fdTggICAgYnVzOw0K
PiAgICAgICAgIF9fdTggICAgZGV2Zm47DQo+IH07DQo+IA0KPiBJZiB0aGUgdXNlciBjYWxscyB3
aXRoIHRoZSBhYm92ZSBmbGFnLCBkZXZfaWQgaXMgdmFsaWQsIG90aGVyd2lzZQ0KPiBncm91cF9p
ZC4gIFBlcmhhcHMgc2VnbWVudDpidXVzOmRldmZuIGNvdWxkIHN0aWxsIGJlIGZpbGxlZCBpbiB3
aXRoIGENCj4gTlVMTC9pbnZhbGlkIGRldl9pZCBpZiB0aGUgdXNlciBkb2Vzbid0IGhhdmUgcGVy
bWlzc2lvbnMgZm9yIHRoZSBkZXZpY2UNCj4gc28gdGhhdCBkZWJ1Z2dpbmcgZnJvbSB1c2Vyc3Bh
Y2UgaXNuJ3Qgc28gb3BhcXVlLiAgVGhhbmtzLA0KDQpBbHNvLCBoYXZlIG9uZSBxdWVzdGlvbiBo
ZXJlLiBTaG91bGQgdGhlIGludmFsaWQgZGV2X2lkIGJlIGRlZmluZWQgaW4NCnRoZSB2ZmlvIHVh
cGkgb3IgaW9tbXVmZCB1YXBpPyBNYXliZSB0aGUgbGF0dGVyIG9uZSBzaW5jZSBkZXZfaWQgaXMN
CmdlbmVyYXRlZCBieSBpb21tdWZkIHN1YnN5c3RlbS4NCg0KUmVnYXJkcywNCllpIExpdQ0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaSBMaXUgPHlpLmwubGl1QGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9jb3JlLmMgfCA5OA0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oICAg
ICAgICB8IDQ3ICsrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0NSBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3Bj
aV9jb3JlLmMNCj4gYi9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2NvcmUuYw0KPiA+IGluZGV4
IDE5ZjViMDc1ZDcwYS4uNDVlZGY0ZTliOThiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdmZp
by9wY2kvdmZpb19wY2lfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3Bj
aV9jb3JlLmMNCj4gPiBAQCAtMTE4MSw2ICsxMTgxLDEwMiBAQCBzdGF0aWMgaW50IHZmaW9fcGNp
X2lvY3RsX3Jlc2V0KHN0cnVjdA0KPiB2ZmlvX3BjaV9jb3JlX2RldmljZSAqdmRldiwNCj4gPiAg
CXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgc3RydWN0IHBjaV9kZXYgKg0K
PiA+ICt2ZmlvX3BjaV9kZXZfc2V0X3Jlc2V0dGFibGUoc3RydWN0IHZmaW9fZGV2aWNlX3NldCAq
ZGV2X3NldCk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHZmaW9fcGNpX2lvY3RsX2dldF9wY2lf
aG90X3Jlc2V0X2dyb3VwX2luZm8oDQo+ID4gKwlzdHJ1Y3QgdmZpb19wY2lfY29yZV9kZXZpY2Ug
KnZkZXYsDQo+ID4gKwlzdHJ1Y3QgdmZpb19wY2lfaG90X3Jlc2V0X2dyb3VwX2luZm8gX191c2Vy
ICphcmcpDQo+ID4gK3sNCj4gPiArCXVuc2lnbmVkIGxvbmcgbWluc3ogPQ0KPiA+ICsJCW9mZnNl
dG9mZW5kKHN0cnVjdCB2ZmlvX3BjaV9ob3RfcmVzZXRfZ3JvdXBfaW5mbywgY291bnQpOw0KPiA+
ICsJc3RydWN0IHZmaW9fcGNpX2hvdF9yZXNldF9ncm91cF9pbmZvIGhkcjsNCj4gPiArCXN0cnVj
dCBpb21tdWZkX2N0eCAqaW9tbXVmZCwgKmN1cl9pb21tdWZkOw0KPiA+ICsJdTMyIGNvdW50ID0g
MCwgaW5kZXggPSAwLCAqZGV2aWNlcyA9IE5VTEw7DQo+ID4gKwlzdHJ1Y3QgdmZpb19wY2lfY29y
ZV9kZXZpY2UgKmN1cjsNCj4gPiArCWJvb2wgc2xvdCA9IGZhbHNlOw0KPiA+ICsJaW50IHJldCA9
IDA7DQo+ID4gKw0KPiA+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZoZHIsIGFyZywgbWluc3opKQ0K
PiA+ICsJCXJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4gPiArCWlmIChoZHIuYXJnc3ogPCBtaW5z
eikNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwloZHIuZmxhZ3MgPSAwOw0K
PiA+ICsNCj4gPiArCS8qIENhbiB3ZSBkbyBhIHNsb3Qgb3IgYnVzIHJlc2V0IG9yIG5laXRoZXI/
ICovDQo+ID4gKwlpZiAoIXBjaV9wcm9iZV9yZXNldF9zbG90KHZkZXYtPnBkZXYtPnNsb3QpKQ0K
PiA+ICsJCXNsb3QgPSB0cnVlOw0KPiA+ICsJZWxzZSBpZiAocGNpX3Byb2JlX3Jlc2V0X2J1cyh2
ZGV2LT5wZGV2LT5idXMpKQ0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ICsNCj4gPiArCW11
dGV4X2xvY2soJnZkZXYtPnZkZXYuZGV2X3NldC0+bG9jayk7DQo+ID4gKwlpZiAoIXZmaW9fcGNp
X2Rldl9zZXRfcmVzZXR0YWJsZSh2ZGV2LT52ZGV2LmRldl9zZXQpKSB7DQo+ID4gKwkJcmV0ID0g
LUVQRVJNOw0KPiA+ICsJCWdvdG8gb3V0X3VubG9jazsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlp
b21tdWZkID0gdmZpb19pb21tdWZkX3BoeXNpY2FsX2ljdHgoJnZkZXYtPnZkZXYpOw0KPiA+ICsJ
aWYgKCFpb21tdWZkKSB7DQo+ID4gKwkJcmV0ID0gLUVQRVJNOw0KPiA+ICsJCWdvdG8gb3V0X3Vu
bG9jazsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwkvKiBIb3cgbWFueSBkZXZpY2VzIGFyZSBhZmZl
Y3RlZD8gKi8NCj4gPiArCXJldCA9IHZmaW9fcGNpX2Zvcl9lYWNoX3Nsb3Rfb3JfYnVzKHZkZXYt
PnBkZXYsDQo+IHZmaW9fcGNpX2NvdW50X2RldnMsDQo+ID4gKwkJCQkJICAgICZjb3VudCwgc2xv
dCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gb3V0X3VubG9jazsNCj4gPiArDQo+ID4g
KwlXQVJOX09OKCFjb3VudCk7IC8qIFNob3VsZCBhbHdheXMgYmUgYXQgbGVhc3Qgb25lICovDQo+
ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIElmIHRoZXJlJ3MgZW5vdWdoIHNwYWNlLCBmaWxsIGl0
IG5vdywgb3RoZXJ3aXNlIHJldHVybiAtRU5PU1BDIGFuZA0KPiA+ICsJICogdGhlIG51bWJlciBv
ZiBkZXZpY2VzIGFmZmVjdGVkLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoaGRyLmFyZ3N6IDwgc2l6
ZW9mKGhkcikgKyAoY291bnQgKiBzaXplb2YoKmRldmljZXMpKSkgew0KPiA+ICsJCXJldCA9IC1F
Tk9TUEM7DQo+ID4gKwkJaGRyLmNvdW50ID0gY291bnQ7DQo+ID4gKwkJZ290byByZXNldF9pbmZv
X2V4aXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZGV2aWNlcyA9IGtjYWxsb2MoY291bnQsIHNp
emVvZigqZGV2aWNlcyksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFkZXZpY2VzKSB7DQo+ID4g
KwkJcmV0ID0gLUVOT01FTTsNCj4gPiArCQlnb3RvIHJlc2V0X2luZm9fZXhpdDsNCj4gPiArCX0N
Cj4gPiArDQo+ID4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGN1ciwgJnZkZXYtPnZkZXYuZGV2X3Nl
dC0+ZGV2aWNlX2xpc3QsDQo+IHZkZXYuZGV2X3NldF9saXN0KSB7DQo+ID4gKwkJY3VyX2lvbW11
ZmQgPSB2ZmlvX2lvbW11ZmRfcGh5c2ljYWxfaWN0eCgmY3VyLT52ZGV2KTsNCj4gPiArCQlpZiAo
Y3VyLT52ZGV2Lm9wZW5fY291bnQpIHsNCj4gPiArCQkJaWYgKGN1cl9pb21tdWZkICE9IGlvbW11
ZmQpIHsNCj4gPiArCQkJCXJldCA9IC1FUEVSTTsNCj4gPiArCQkJCWJyZWFrOw0KPiA+ICsJCQl9
DQo+ID4gKwkJCXJldCA9IHZmaW9faW9tbXVmZF9waHlzaWNhbF9kZXZpZCgmY3VyLT52ZGV2LA0K
PiAmZGV2aWNlc1tpbmRleF0pOw0KPiA+ICsJCQlpZiAocmV0KQ0KPiA+ICsJCQkJYnJlYWs7DQo+
ID4gKwkJCWluZGV4Kys7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArcmVzZXRfaW5m
b19leGl0Og0KPiA+ICsJaWYgKGNvcHlfdG9fdXNlcihhcmcsICZoZHIsIG1pbnN6KSkNCj4gPiAr
CQlyZXQgPSAtRUZBVUxUOw0KPiA+ICsNCj4gPiArCWlmICghcmV0KSB7DQo+ID4gKwkJaWYgKGNv
cHlfdG9fdXNlcigmYXJnLT5kZXZpY2VzLCBkZXZpY2VzLA0KPiA+ICsJCQkJIGhkci5jb3VudCAq
IHNpemVvZigqZGV2aWNlcykpKQ0KPiA+ICsJCQlyZXQgPSAtRUZBVUxUOw0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCWtmcmVlKGRldmljZXMpOw0KPiA+ICtvdXRfdW5sb2NrOg0KPiA+ICsJbXV0ZXhf
dW5sb2NrKCZ2ZGV2LT52ZGV2LmRldl9zZXQtPmxvY2spOw0KPiA+ICsJcmV0dXJuIHJldDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCB2ZmlvX3BjaV9pb2N0bF9nZXRfcGNpX2hvdF9y
ZXNldF9pbmZvKA0KPiA+ICAJc3RydWN0IHZmaW9fcGNpX2NvcmVfZGV2aWNlICp2ZGV2LA0KPiA+
ICAJc3RydWN0IHZmaW9fcGNpX2hvdF9yZXNldF9pbmZvIF9fdXNlciAqYXJnKQ0KPiA+IEBAIC0x
NDA0LDYgKzE1MDAsOCBAQCBsb25nIHZmaW9fcGNpX2NvcmVfaW9jdGwoc3RydWN0IHZmaW9fZGV2
aWNlDQo+ICpjb3JlX3ZkZXYsIHVuc2lnbmVkIGludCBjbWQsDQo+ID4gIAkJcmV0dXJuIHZmaW9f
cGNpX2lvY3RsX2dldF9pcnFfaW5mbyh2ZGV2LCB1YXJnKTsNCj4gPiAgCWNhc2UgVkZJT19ERVZJ
Q0VfR0VUX1BDSV9IT1RfUkVTRVRfSU5GTzoNCj4gPiAgCQlyZXR1cm4gdmZpb19wY2lfaW9jdGxf
Z2V0X3BjaV9ob3RfcmVzZXRfaW5mbyh2ZGV2LCB1YXJnKTsNCj4gPiArCWNhc2UgVkZJT19ERVZJ
Q0VfR0VUX1BDSV9IT1RfUkVTRVRfR1JPVVBfSU5GTzoNCj4gPiArCQlyZXR1cm4gdmZpb19wY2lf
aW9jdGxfZ2V0X3BjaV9ob3RfcmVzZXRfZ3JvdXBfaW5mbyh2ZGV2LA0KPiB1YXJnKTsNCj4gPiAg
CWNhc2UgVkZJT19ERVZJQ0VfR0VUX1JFR0lPTl9JTkZPOg0KPiA+ICAJCXJldHVybiB2ZmlvX3Bj
aV9pb2N0bF9nZXRfcmVnaW9uX2luZm8odmRldiwgdWFyZyk7DQo+ID4gIAljYXNlIFZGSU9fREVW
SUNFX0lPRVZFTlRGRDoNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8u
aCBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgNCj4gPiBpbmRleCAyNTQzMmVmMjEzZWUuLjYx
YjgwMWRmZDQwYiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oDQo+
ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaA0KPiA+IEBAIC02NjksNiArNjY5LDUz
IEBAIHN0cnVjdCB2ZmlvX3BjaV9ob3RfcmVzZXRfaW5mbyB7DQo+ID4NCj4gPiAgI2RlZmluZSBW
RklPX0RFVklDRV9HRVRfUENJX0hPVF9SRVNFVF9JTkZPCV9JTyhWRklPX1RZUEUsDQo+IFZGSU9f
QkFTRSArIDEyKQ0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBWRklPX0RFVklDRV9HRVRfUENJX0hP
VF9SRVNFVF9HUk9VUF9JTkZPIC0gX0lPV1IoVkZJT19UWVBFLA0KPiBWRklPX0JBU0UgKyAxMiwN
Cj4gPiArICoJCQkJCQkgICAgc3RydWN0DQo+IHZmaW9fcGNpX2hvdF9yZXNldF9ncm91cF9pbmZv
KQ0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIGlzIHVzZWQgaW4gdGhlIHZmaW8gZGV2aWNlIGNkZXYg
bW9kZS4gIEl0IHJldHVybnMgdGhlIGxpc3Qgb2YNCj4gPiArICogYWZmZWN0ZWQgZGV2aWNlcyAo
cmVwcmVzZW50ZWQgYnkgaW9tbXVmZCBkZXZfaWQpIHdoZW4gaG90IHJlc2V0IGlzDQo+ID4gKyAq
IGlzc3VlZCBvbiB0aGUgY3VycmVudCBkZXZpY2Ugd2l0aCB3aGljaCB0aGlzIGlvY3RsIGlzIGlu
dm9rZWQuICBJdA0KPiA+ICsgKiBvbmx5IGluY2x1ZGVzIHRoZSBkZXZpY2VzIHRoYXQgYXJlIG9w
ZW5lZCBieSB0aGUgY3VycmVudCB1c2VyIGluIHRoZQ0KPiA+ICsgKiB0aW1lIG9mIHRoaXMgY29t
bWFuZCBpcyBpbnZva2VkLiAgVGhpcyBsaXN0IG1heSBjaGFuZ2Ugd2hlbiB1c2VyDQo+IG9wZW5z
DQo+ID4gKyAqIG5ldyBkZXZpY2Ugb3IgY2xvc2Ugb3BlbmVkIGRldmljZSwgaGVuY2UgdXNlciBz
aG91bGQgcmUtaW52b2tlIGl0DQo+ID4gKyAqIGFmdGVyIG9wZW4vY2xvc2UgZGV2aWNlcy4gIFRo
aXMgY29tbWFuZCBoYXMgbm8gZ3VhcmFudGVlIG9uIHRoZQ0KPiByZXN1bHQNCj4gPiArICogb2Yg
VkZJT19ERVZJQ0VfUENJX0hPVF9SRVNFVCBzaW5jZSB0aGUgbm90LW9wZW5lZCBhZmZlY3RlZCBk
ZXZpY2UNCj4gY2FuDQo+ID4gKyAqIGJlIGJ5IG90aGVyIHVzZXJzIGluIHRoZSB3aW5kb3cgYmV0
d2VlbiB0aGUgdHdvIGlvY3Rscy4gIElmIHRoZQ0KPiBhZmZlY3RlZA0KPiA+ICsgKiBkZXZpY2Vz
IGFyZSBvcGVuZWQgYnkgbXVsdGlwbGUgdXNlcnMsIHRoZQ0KPiBWRklPX0RFVklDRV9QQ0lfSE9U
X1JFU0VUDQo+ID4gKyAqIHNoYWxsIGZhaWwsIGRldGFpbCBjYW4gY2hlY2sgdGhlIGRlc2NyaXB0
aW9uIG9mDQo+IFZGSU9fREVWSUNFX1BDSV9IT1RfUkVTRVQuDQo+ID4gKyAqDQo+ID4gKyAqIEZv
ciB0aGUgdXNlcnMgdGhhdCBvcGVuIHZmaW8gZ3JvdXAvY29udGFpbmVyLCB0aGlzIGlvY3RsIGlz
IHVzZWxlc3MgYXMNCj4gPiArICogdGhleSBoYXZlIG5vIGlkZWEgYWJvdXQgdGhlIGlvbW11ZmQg
ZGV2X2lkIHJldHVybmVkIGJ5IHRoaXMgaW9jdGwuDQo+IEZvcg0KPiA+ICsgKiB0aGUgdXNlcnMg
b2YgdGhlIHRyYWRpdGlvbmFsIG1vZGUgdmZpbyBncm91cC9jb250YWluZXIsIHRoaXMgaW9jdGwg
d2lsbA0KPiA+ICsgKiBmYWlsIGFzIHRoaXMgbW9kZSBkb2VzIG5vdCB1c2UgaW9tbXVmZCBoZW5j
ZSBubyBkZXZfaWQgdG8gcmVwb3J0DQo+IGJhY2suDQo+ID4gKyAqIEZvciB0aGUgdXNlcnMgb2Yg
dGhlIGlvbW11ZmQgY29tcGF0IG1vZGUgdmZpbyBncm91cC9jb250YWluZXIsIHRoaXMNCj4gaW9j
dGwNCj4gPiArICogd291bGQgc3VjY2VlZCBhcyB0aGlzIG1vZGUgdXNlcyBpb21tdWZkIGFzIGNv
bnRhaW5lciBmZC4gIEJ1dCBzdWNoDQo+IHVzZXJzDQo+ID4gKyAqIHN0aWxsIGhhdmUgbm8gaWRl
YSBhYm91dCB0aGUgaW9tbXVmZCBkZXZfaWQgYXMgdGhlIGRldl9pZCBpcyBvbmx5DQo+IHN0b3Jl
ZA0KPiA+ICsgKiBpbiBrZXJuZWwgaW4gdGhpcyBtb2RlLiAgRm9yIHRoZSB1c2VycyBvZiB0aGUg
dmZpbyBncm91cC9jb250YWluZXIsIHRoZQ0KPiA+ICsgKiBWRklPX0RFVklDRV9HRVRfUENJX0hP
VF9SRVNFVF9JTkZPIHNob3VsZCBiZSB1c2VkIHRvIGtub3cgdGhlDQo+IGhvdCByZXNldA0KPiA+
ICsgKiBhZmZlY3RlZCBkZXZpY2VzLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm46IDAgb24gc3Vj
Y2VzcywgLWVycm5vIG9uIGZhaWx1cmU6DQo+ID4gKyAqCS1lbm9zcGMgPSBpbnN1ZmZpY2llbnQg
YnVmZmVyOw0KPiA+ICsgKgktZW5vZGV2ID0gdW5zdXBwb3J0ZWQgZm9yIGRldmljZTsNCj4gPiAr
ICoJLWVwZXJtID0gbm8gcGVybWlzc2lvbiBmb3IgZGV2aWNlLCB0aGlzIGVycm9yIGNvbWVzOg0K
PiA+ICsgKgkJIC0gd2hlbiB0aGVyZSBhcmUgYWZmZWN0ZWQgZGV2aWNlcyB0aGF0IGFyZSBvcGVu
ZWQgYnV0DQo+ID4gKyAqCQkgICBub3QgYm91bmQgdG8gdGhlIHNhbWUgaW9tbXVmZCB3aXRoIHRo
ZSBjdXJyZW50IGRldmljZQ0KPiA+ICsgKgkJICAgd2l0aCB3aGljaCB0aGlzIGlvY3RsIGlzIGlu
dm9rZWQsDQo+ID4gKyAqCQkgLSB0aGVyZSBhcmUgYWZmZWN0ZWQgZGV2aWNlcyB0aGF0IGFyZSBu
b3QgYm91bmQgdG8gdmZpbw0KPiA+ICsgKgkJICAgZHJpdmVyIHlldC4NCj4gPiArICoJCSAtIG5v
IHZhbGlkIGlvbW11ZmQgaXMgYm91bmQgKGUuZy4gbm9pb21tdSBtb2RlKQ0KPiA+ICsgKi8NCj4g
PiArc3RydWN0IHZmaW9fcGNpX2hvdF9yZXNldF9ncm91cF9pbmZvIHsNCj4gPiArCV9fdTMyCWFy
Z3N6Ow0KPiA+ICsJX191MzIJZmxhZ3M7DQo+ID4gKwlfX3UzMgljb3VudDsNCj4gPiArCV9fdTMy
CWRldmljZXNbXTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgVkZJT19ERVZJQ0VfR0VU
X1BDSV9IT1RfUkVTRVRfR1JPVVBfSU5GTw0KPiAJX0lPKFZGSU9fVFlQRSwgVkZJT19CQVNFICsg
MTgpDQo+ID4gKw0KPiA+ICAvKioNCj4gPiAgICogVkZJT19ERVZJQ0VfUENJX0hPVF9SRVNFVCAt
IF9JT1coVkZJT19UWVBFLCBWRklPX0JBU0UgKyAxMywNCj4gPiAgICoJCQkJICAgIHN0cnVjdCB2
ZmlvX3BjaV9ob3RfcmVzZXQpDQoNCg==
