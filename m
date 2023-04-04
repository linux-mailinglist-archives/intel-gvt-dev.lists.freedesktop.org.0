Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B86D6583
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 16:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2D710E6C8;
	Tue,  4 Apr 2023 14:37:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A122D10E6C8;
 Tue,  4 Apr 2023 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680619074; x=1712155074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=toOGM2OfMQZU8Cg6v2g9lyOB/mItN60fmG7ozF6fQQo=;
 b=EWTsoRyf5ydwBFAG3NMYJ/KUvjTt/WM9wgUdHvOKTGYWwrAYdLtZQl8b
 KThllSDqYAToTbLLw159GUnRPCyZPC6gaX5h/rVKEEg5nel6l6K4BiQi6
 AvoPXHHFPidgF0jaQkiGRwMnAzc8YAyhx8FAiWYg1SB5xPrRiKkPtgvP0
 SHFvibdHUCuGgkWAgCEGjNyvjTCcTKQHA4tQtsVyTmK8tFNcG1Ylgg2Dx
 Yc+RJv/wx6wo/K8B7Mr4g+Bo4oFQw1iiHwy7ZvP83sgo0CDUqS0envzhi
 qUSb4eUXbWHs4TQN0KZ3sPRgICi8xc1n+l0EGS3w5PAZVnCXthYP8Yv3C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="407264414"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="407264414"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688919725"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688919725"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 04 Apr 2023 07:37:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 07:37:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 07:37:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 07:37:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoWQL7Glo55zTvzCCKQ41gWFFWIYk7ljdlKJcBazuRHPiV6nWPUT4orcHgpkF63EPaqjj00XxYUwwLaUm7jaZeXLT/OKGoWa+cQ5AaGsBmIUrrCudOxaiZ4ijoScpdRmYPfH1Zl/x0ePpEOvb4LecZcTqgnOfB9rHre5NoeWD5ry84DTib4W3nvtiqiHI2DQ1wP4svl2nPlEqm74UFv+NTp6PctI5aiDS7VoJD1bQch1DgVUfEM209bwQKCTprY3iMB9Bo4MtNdG9NYZfCAySEZNI3LafihtzPFg36KmVxtOSQkCe3w1DJl2CszuJBvBUEDzZJWXO6rOtwbHw36eYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toOGM2OfMQZU8Cg6v2g9lyOB/mItN60fmG7ozF6fQQo=;
 b=XniV88Ojj7ks8Agoa4R1ZrZSJu1Zex464XYSDqcB/KJbyOJ30Og+wXgFHB2B8p9OLXlaZ7X9jrBYyadWZ0shqaifVOSvQT++4PixVwdlV9WL3Vqws9iCVRpVJVUsZLGtNFt3dFnRCYrmXB5gaf8Pa120OapIftuW/eiBQ7Z1xAmO4hUjvokHZSWFe18ZkTHh8G5Y1lt9s4nbpHZFM0nzljxLjlVEPLKH6ArDvuXow+ff21t1jjMSDAi6XQfpnre5zyzp6gBJ8LudNkfZ/WW2yMcwtdSABDzcwCSldUJLnUGFWRQ0+lqMGMh5+yz4VzIA8AOSapHgsQyco/S37/rBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SJ0PR11MB5662.namprd11.prod.outlook.com (2603:10b6:a03:3af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:37:48 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:37:48 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: RE: [PATCH v3 01/12] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
Thread-Topic: [PATCH v3 01/12] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
Thread-Index: AQHZZKh8Cc+kmKDweEasXXAeTFWGGa8bMiMAgAAKgEA=
Date: Tue, 4 Apr 2023 14:37:48 +0000
Message-ID: <DS0PR11MB752912E1BE240C535711F47BC3939@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-2-yi.l.liu@intel.com>
 <1f8ddafd-6fad-aff6-5dc7-9d67f89eea73@redhat.com>
In-Reply-To: <1f8ddafd-6fad-aff6-5dc7-9d67f89eea73@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|SJ0PR11MB5662:EE_
x-ms-office365-filtering-correlation-id: 8b0467c2-e505-4837-62b2-08db351a29a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iknMnOYBjtNyVX+ean8gEbMJLahXC+UuogVIg/6udmQRYun2zBNGIlJA7/hZD7EpfbH+xtHbEF34JzFaKsukWUw2j/k/i+JnFm2lrPS8knVBI1B1Em05zP7ctDeeQSUk62OGtIxrRVrb9eW0vwGjXBDiwE2TV3YRW2omgjdOBv+uoI8oyIYjoQ9RawtV3s4zB6zn3WMjXLBw8LdYJoIPGhiOEaeAjxrEhNCQRAlRg7YDqcoptUwJUFWmouYxp6/dOI+hqqaa+ukg7iE3BKeacOo6s34998QvTwanbpIur7LXWHkx/mf40VV492yQ2Idl659j4BkTLJvD1VsgFLE23kj0pUPcARvuwnPYeNOR0PDcR/dNToxDVK15Ng7VbzXIO521uq+FFUtPcQyjhnnwYluchvOk20NoM8edpn35kMIudl1QL4G0Vp7vtN4C7CRkYHDL9m+iwnhnUL6fAD/nUSwdTzWh6RXiDOpi+lVpbTIze2zlhvTq5AF1OM2OTdZ4GP7W82qGLKvUl1JXu/wbmxhQ7MBwRtDlYmNIOjo4+fZmS6fmnCVNHtHquGXwtbSYuNSPwAs0FA2d3x0x+/wbDc27pm06caMLWwa04unC0xnh5zq4jyGh/Bzg4CMFV7WuhCsBMXABe3Em4XM9kieDiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(55016003)(186003)(26005)(53546011)(83380400001)(6506007)(41300700001)(52536014)(54906003)(6636002)(76116006)(478600001)(66946007)(110136005)(316002)(4326008)(9686003)(7696005)(71200400001)(66476007)(66556008)(66446008)(64756008)(38100700002)(82960400001)(8676002)(122000001)(38070700005)(33656002)(7416002)(86362001)(2906002)(8936002)(5660300002)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czVkOTdnYUM1NkJpTmE2SVFra2IyVFo3cWoyQ3hKTjRLSFlRQWMybk41Y1d1?=
 =?utf-8?B?TmFiQjZtVElyZEN5T2k0UzdjeXlybVQwS1lPVVZOYmZ6U2FNd2xLWE5sQ2lP?=
 =?utf-8?B?N3lkN3ZZTGJHZVdPVDBpS0NhV05ObEdnSXVlZUxtUVhYUGQzL2JVV1hHYUgz?=
 =?utf-8?B?VjZuQkVsWG0xWmpybkxtdFdiOTBza3hmbDdZMkI4bzExUGUxNnJFVkJxNGZD?=
 =?utf-8?B?bllVOEpuVTgvTmVpb2xZTTdnbmNIWDBZU3hFeWYzbDR1TmorZjZHOXIydGhi?=
 =?utf-8?B?SHFoME1ISGVjbXRydVNCZlBmK1JSZW4ydVNkSTFpUGtLdDFpRHFwTzBKakdU?=
 =?utf-8?B?UURYR1N6T3BBL3ZFcG5qT3IxMEpCNHZnbkhpeE9FR0I4U3lXTkZUS1JkSGFR?=
 =?utf-8?B?NnlLNlB1V3JlODJNbUFUMWd2UC9WTW1GK1ZXNHFYd0JSUmRFSHJDRkV3aks2?=
 =?utf-8?B?SXZZWHFUakNBNmtrMEpweXBuYityYUdTSnFEMG45dUNJMG9xNndoUWR6Z0Mx?=
 =?utf-8?B?NmorL2lPY2duNWRMaUU3eWtmRURVUEQrVkl6bVJhTnpIYnRKVW5xYlEvc3Zo?=
 =?utf-8?B?dHdyZkVLSnl3dy9CeWtZUGtBSElRS2hpMzFSSnFYOFcyOTMwa2FDOFZwQzI1?=
 =?utf-8?B?OTAxRlBNWUdDTkxxTzZyNzV6akFLUDVpNjh6M29kYXVJcHZuV2E0Vjl0WmFY?=
 =?utf-8?B?U2NyOXZ4Ukp5RUlJeFdKeFJUVjVZWTJLWFZpSk5iRndPZEtNNUZvTzhTak01?=
 =?utf-8?B?eUpqSTIvTlpVUHFTcmw0WEcyYW40V3A3S2dFUUFsQkwrM0dUZzVVcUNmbVkz?=
 =?utf-8?B?blpPNU52L2hCZDZWRzZzK3VvTXg2N09XVkw4Q0ZWVTFnL0o2NE9NSVprTmZK?=
 =?utf-8?B?UnEzUHhkb1hyWWhkY3RBMTVDb2JScTJVQWh1dU5Ld2NsZ1BKQmZsdUpDdTJp?=
 =?utf-8?B?YmxiYU1pK2hzbUlxckVUUWJZTFlWck1STHdlR1kxV2FoVEtYd1I1Z3RQQWNL?=
 =?utf-8?B?bFR0OFJOSGpVRE4vYkQveE16QWUxTHN5dm4rc0JNMHVQS2EvdHd0dnRINjJH?=
 =?utf-8?B?aTFWNzVYVE1OTU9xYVQyMnlCdkxHWkNNdmpNVHVRcEQxa1dmVEFNRTdmYVFw?=
 =?utf-8?B?Q1VwVVlhOWZacGd2ZCtnbFQ4YWZhNGxLNUdZeW80aWp0Yi9ZN0R4VHcrYTBj?=
 =?utf-8?B?U2dKZWtmbFIxejhCVHU0Wnhlcll4eFlQZy81eHoySXpzQzRBdFZPVlFsOWtm?=
 =?utf-8?B?dUg1eUZBdnJCSzRlOTFYcG5tSHNiS0pFWkJHWUExVDdSUzJtTFcwUmp1cWp2?=
 =?utf-8?B?bnQ5U3ZLQUdJVy85VG95ZHZjc05TR3hmSmFwYzN2VGQ0TmREeW1PRFkxdUt2?=
 =?utf-8?B?VEI3R3VXbUNRRkN4M3FISitNbjJPNHRZUk43eStNRlQxK2dsTlI5OGdXM0ph?=
 =?utf-8?B?djFEQU9icWRUbGhNNHhoSTdlc1k0M05PRlZia0NJN3MrSm9WQmc1UkxQOFA3?=
 =?utf-8?B?WlltVHFFVEZIUGUwVnJUVldkcm42TGV6QjNtV2NCRktTR0RZNHNqdnRUWVZk?=
 =?utf-8?B?UUNISEo4VUc0UmtPRWNldllzTFNaS1pqN2xRdmdXUmxDK1VSWWR5VG5xaFBm?=
 =?utf-8?B?TmlBZ1RxV3ZDSUxxT0IzK0EvOHUzRm9nd0lhTUQyNTE1NkdrVWxWWlBTTW1t?=
 =?utf-8?B?YUVYS05RMXhualpDVXhtbW03aGhwRmkrU01acVU4RTl2Ylp5dUpxbUFQNjBj?=
 =?utf-8?B?azN6R0Nzc3c5d09abHZvUUtoMVpnODdyUmhjNmNJaENadHFrdnJ0YjJoZ0VV?=
 =?utf-8?B?aVA2eWE5cFBvTnRORGlPMzFKMEd2bWVYTE8wMzNzY0JLYWpMVEZVbjg2anhu?=
 =?utf-8?B?SE8yclpETmljUk9yR01pSGtQaVhDaldiOVZrOEhDWG9aVHVqS3FXV3J0bTZK?=
 =?utf-8?B?Nm9WdGV1dVZjcTdZa0RrL2QzT0JURjA3Z2ZOTHVRbTZtSEpwTHVIT2JzeFJk?=
 =?utf-8?B?OEFucmk0YVJTU3BQa0U5Y1pzeWpZZlFZTUVqWHdIRDZqaXVFRVVUUmhGVUtD?=
 =?utf-8?B?R0Q2ejlkZVhjaUhJQ0xVbWJzcFBrNUNGVGVqUU1haTliRHpWVmlsSURlYUtj?=
 =?utf-8?Q?LTpA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0467c2-e505-4837-62b2-08db351a29a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 14:37:48.6525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sj/PCqwQEG1aDwbM0N5i14HVmozQ/puw85LIAJgsHnRlGnJeRb83WZQlQPu3snB0dxSvpZ3cUANJKMfirtEZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5662
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>, "Xu, Terrence" <terrence.xu@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDQsIDIwMjMgMTA6MDAgUE0NCj4gDQo+IEhpIFlpLA0KPiANCj4gT24gNC8xLzIz
IDE2OjQ0LCBZaSBMaXUgd3JvdGU6DQo+ID4gdGhpcyBzdWl0cyBtb3JlIG9uIHdoYXQgdGhlIGNv
ZGUgZG9lcy4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNv
bT4NCj4gPiBUZXN0ZWQtYnk6IFlhbnRpbmcgSmlhbmcgPHlhbnRpbmcuamlhbmdAaW50ZWwuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlpIExpdSA8eWkubC5saXVAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2NvcmUuYyB8IDUgKystLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2NvcmUuYyBiL2RyaXZlcnMv
dmZpby9wY2kvdmZpb19wY2lfY29yZS5jDQo+ID4gaW5kZXggYTVhYjQxNmNmNDc2Li42NWJiZWY1
NjIyNjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9jb3JlLmMN
Cj4gPiArKysgYi9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2NvcmUuYw0KPiA+IEBAIC0xMzA4
LDkgKzEzMDgsOCBAQCBzdGF0aWMgaW50IHZmaW9fcGNpX2lvY3RsX3BjaV9ob3RfcmVzZXQoc3Ry
dWN0DQo+IHZmaW9fcGNpX2NvcmVfZGV2aWNlICp2ZGV2LA0KPiA+ICAJfQ0KPiA+DQo+ID4gIAkv
Kg0KPiA+IC0JICogRm9yIGVhY2ggZ3JvdXBfZmQsIGdldCB0aGUgZ3JvdXAgdGhyb3VnaCB0aGUg
dmZpbyBleHRlcm5hbCB1c2VyDQo+ID4gLQkgKiBpbnRlcmZhY2UgYW5kIHN0b3JlIHRoZSBncm91
cCBhbmQgaW9tbXUgSUQuICBUaGlzIGVuc3VyZXMgdGhlIGdyb3VwDQo+ID4gLQkgKiBpcyBoZWxk
IGFjcm9zcyB0aGUgcmVzZXQuDQo+ID4gKwkgKiBHZXQgdGhlIGdyb3VwIGZpbGUgZm9yIGVhY2gg
ZmQgdG8gZW5zdXJlIHRoZSBncm91cCBoZWxkIGFjcm9zcw0KPiB0byBlbnN1cmUgdGhlIGdyb3Vw
IGlzIGhlbGQNCg0KZ290IGl0Lg0KDQo+IEJlc2lkZXMNCj4gDQo+IFJldmlld2VkLWJ5OiBFcmlj
IEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IA0KPiBFcmljDQo+IA0KPiANCj4gPiAr
CSAqIHRoZSByZXNldA0KPiA+ICAJICovDQo+ID4gIAlmb3IgKGZpbGVfaWR4ID0gMDsgZmlsZV9p
ZHggPCBoZHIuY291bnQ7IGZpbGVfaWR4KyspIHsNCj4gPiAgCQlzdHJ1Y3QgZmlsZSAqZmlsZSA9
IGZnZXQoZ3JvdXBfZmRzW2ZpbGVfaWR4XSk7DQoNClJlZ2FyZHMsDQpZaSBMaXUNCg==
