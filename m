Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6E6A66A2
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  1 Mar 2023 04:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530310E06F;
	Wed,  1 Mar 2023 03:44:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A910E06F;
 Wed,  1 Mar 2023 03:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677642275; x=1709178275;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OVFn4n+WBIA7H0Yrp2uJ84/L7oDfZVYt/b8l+CBdqho=;
 b=cnO3KXYbUJXW3JXb4bVsZ2EH1e1lUHd4vBEm13Jst4XEtAF+ovM+BcVj
 T6z3vnWr1ckKo2vg2vovhKLA25tQSuJIiTe1MuAVRTIh/AWCiWw5ywC6G
 D9WWHMBvB4KncL13U5Jtq7WWcm41BxZ7qQzJ4XgGWob1BiJITrmnZqnnL
 LLb/AUzOWGQfLGhqN5+DjeulhYF/E0s06Z5fX0oy/Bm5nsgbY5Fg49Z2q
 N1EMrVWD5b5Znc7+ZL4606PU6a+Ksgoxz9wXEsiWBuGCjJgHrt0W6oWQT
 xOA0Rj/EloN7Z1f4eCzonaWYDIAhN0x7p+NpUY7JDzncoyQzEJ+LZijEh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="313983757"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; d="scan'208";a="313983757"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 19:44:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="784166789"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; d="scan'208";a="784166789"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2023 19:44:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 19:44:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Feb 2023 19:44:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 28 Feb 2023 19:44:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 28 Feb 2023 19:44:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqRZzq4OCL2ZzuNtqmV9WIgoDPtJ+dQiK7k00oZDo7ZDZEGENPVttkL2ND07PnrbORW+/0VbvXQg2Fk5ifQEB9TR2MSW5JEpoB2Ay6RtWARKuiU2RGKcQH/bbRbNZFuWOSj49v7SMpD0aVtTZTP2jjhgp8z69YWVhCx4LC9K32oj9Fh9NimY2BXipck92TnNc0T+Gxor5dJQ/8xhie19HgEiDXkSF395++P9q8zJH/eg//fKmzjBI9cHVrLHdX1AHYg4MOeVojHqfDxtuf2sE9wH+mFLlMXWyRzJRUfe+HpOw4WHcNCUmOmlM59jTbkJyy4XtgYmqW8CdofvA2uHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVFn4n+WBIA7H0Yrp2uJ84/L7oDfZVYt/b8l+CBdqho=;
 b=mg6DUrJE1SfKNQhJELBi00b0w66Ff3wdD+NtIKWXJXuptK9wfvdWkE/kz7I7RCjPp1tcUm0WIYPhJxKZH0gzHu0n6ev+2RoT2sqzFnXauKEHZApzy/C0fUcqZMT/3F8idAZnB/lltJQzaHC7A7qyUEnCArX/zsFBm8wAyCXeJ61Q4+hw/+6qzar2tSVpjl8aT/AXXvWEh0G/xxvBVsW5bmiS0vlPEwYHgToudcT5NJbQSchkX2siWnQr86LG0IcgeEw5SJ+SWEJqWFTbQkw8Ua6kiIosHrkd/rUgc38d0ItP9QMReitpcmbsG5UoicAiQO0gs3dSjZ3ux4/8Zh7pNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 03:44:12 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 03:44:11 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "Xu, Terrence" <terrence.xu@intel.com>
Subject: RE: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Thread-Topic: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Thread-Index: AQHZSpxK1lmQCF+hqU67xTFYCSDhDq7jLB2AgACAqYCAAOmpAIAAn5IAgAAUy6A=
Date: Wed, 1 Mar 2023 03:44:11 +0000
Message-ID: <DS0PR11MB7529BAF792E14E2AB872EC3EC3AD9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <Y/0Cr/tcNCzzIAhi@nvidia.com>
 <DS0PR11MB7529A422D4361B39CCA3D248C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <SA1PR11MB5873479F73CFBAA170717624F0AC9@SA1PR11MB5873.namprd11.prod.outlook.com>
 <Y/64ejbhMiV77uUA@Asurada-Nvidia>
In-Reply-To: <Y/64ejbhMiV77uUA@Asurada-Nvidia>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|SN7PR11MB6993:EE_
x-ms-office365-filtering-correlation-id: 7393657b-e82d-4eac-c056-08db1a073877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tz8ucDBs33ldGQUTe9AmEF57rfWnKbAQXuNcKBbSsD6fDSSBhCd3X8fKbwMeyDBAoqQh7SftfbJVE7Ot1nrAPANHuiqk7JYknig7f+WiTwv2dIoGEGJgceM/rO3DnjvWxjIS9ew44sh6Q2X0RYYKq++dtI56/9MazDJMvJuvaHttkhgtv3SK3m6VBL1TvRi39wPUbn0hqXEl8GWzULY0r0cjosjqNCCZu4ZsFqF5YKpyHKbY9NFdSkjegFb8qXnb1selwS8THJLo1GiJJaNu//Po/zLRXIEPwlDOIyPxckYzoS41sGXwWriTBAhzZ/bevLVQvziXf70QlgbHkUj2vh2HvTs4J3qZfIV1CBF9vyNIEXl3r2FoxSsJfFd/wnIZhZ7wkNn9+QjkGKTcXg2ezlxJNbj48aIiCtpdFoLGWb55hKd2GI18WgoKAyxi2y4jjUwK/25b/Rq3K18NEwWrv1XsIQL5aGW+6ibAePrEP8gErIHKBrqeycuSV1QyM724Hglv67RoaurbVOQtNWJ24tvb94J50VAU4maad8ld5G92XPrdXrLVXZ+SpHcs5luKym5EQGMRRPpSLlxTvuZ+MqrMbXHXZ4Gbm3TyD2RTM6UIxLwPEbqPE4c8pB19O1o06xpE6qU67DWgByXkWVdDSiQyHO+/VJijmgcZf+5fJEm+Z2rFElxp75NpYrj5Zy23
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(478600001)(83380400001)(316002)(6636002)(54906003)(110136005)(33656002)(4326008)(122000001)(82960400001)(8676002)(64756008)(66446008)(38100700002)(55016003)(66476007)(6506007)(26005)(9686003)(186003)(7696005)(71200400001)(966005)(7416002)(66946007)(66556008)(76116006)(4744005)(5660300002)(52536014)(8936002)(41300700001)(86362001)(2906002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e96QH3em95OPpq4ZuDg8DEFseCl5w1HlJXFp5/QgLE39biaAn1oaSVI0Qb/F?=
 =?us-ascii?Q?jN2bw+ucFCYTW/u6wzuDotv6LIRGsmeNRiOTWtm7SYvRt2FkcHspvRSsD0tA?=
 =?us-ascii?Q?qL+RxZm2/Qg1bGkDfIbnqKLF6HEio0zmVBEMCJv53k0TAVHshUYJY4qN1ZsO?=
 =?us-ascii?Q?IIGz9KDwwQafrX7r1RwNqXKuf8iWK3SQyateUpyFqaFxv7wvufFTShFWBLqN?=
 =?us-ascii?Q?W3j5K/4hPAi38/EI/SpJmGp9HxPnneGJMo+pxRJ6SGTxPTn/0HDWLb3tZrB6?=
 =?us-ascii?Q?jlt3zq7pBzZ0Ti/DK+B1SWjxhBmSoVqWge4hhPXrsRSlP2wM63xHSSwf2PhJ?=
 =?us-ascii?Q?ag+smeBJa1xcSLbFykpLCNVWbbne/i03v8YiWIhY8Dn5VrJnFKV8XquNsowN?=
 =?us-ascii?Q?kXP1LKy6G9bPUu5f8vhYgZHv2TqnbpFkXFqvuSMBxWL6S4eJC4z4O8NFZGH/?=
 =?us-ascii?Q?b2/zWWTqq44s+Y7be52eZ1QWC2Fx6iBgVuxZT0nHayudfexxjzGnwpD0DZ32?=
 =?us-ascii?Q?zSOGn6QMczXTEpCl54bQzat+6l5uhvf0W/vJFKTEcU6woro6HWy8WJ2odXit?=
 =?us-ascii?Q?Lgol/jFxmi/MZ+MYHqrY1VXjRp8yCiCRFWfMomzbve65ASr1LGjn3OXLyCwf?=
 =?us-ascii?Q?v6IzZ686YeQlfvVMLHdG84PID7/3O4xJcXOeRukMFxsAivAp57/0qklJ8YAN?=
 =?us-ascii?Q?YwSVgR2KQ63vNncTYKgEcwp423izWr1yW+TK2n2MyneY4qBwdV8n6YLaFNgI?=
 =?us-ascii?Q?vxdQUkgiodk/Ziqf9lXmEw2uOgrTzT1yv9O7Mn8KFQE1UuF4ibh5ZWo93aJp?=
 =?us-ascii?Q?qSnINmXV/v3ItBGbmxfYaBJxI5DcrcWpHimAbpRrf+8CZzCBuYqMr3RCx7Yq?=
 =?us-ascii?Q?mCCmuDcg3E8qRpKH4gNZdSlfof2k9p0f5xKz+fkCiHhKG4nHY9oNHs7LSOyn?=
 =?us-ascii?Q?P4RepwIVsK+RexV3obSffXXdu4WM0EzCVZgIoUh32mFlRBHK/MMeyxZquF74?=
 =?us-ascii?Q?kyY0t7mAHP61FesdJwDeyazbYuVkAGGiE71LEOzjEZ4I0bSltQF2ek5ox0Rw?=
 =?us-ascii?Q?H/yiWL1L+PL0epICLRqRf0UCVfqtB0KqCnOHzIRR79BatZInV2+SzQjlXSAU?=
 =?us-ascii?Q?183tUTptTOUunX6oFIelr6X6CC+uPNecdRvMnGgCZZa0Rb5Gj2cs9lUQ4rv9?=
 =?us-ascii?Q?8VczcMWW9jK962Ua43hdn38msbJRvbpGFBZGssrlra9QqDCCgKuS1IfWM55A?=
 =?us-ascii?Q?YxPFD+W3IemPkkwTV11GaM38po7HdvPzfsFF8/IP7e+Ob5APc56736Fw2oyT?=
 =?us-ascii?Q?p6QbW//16Vf4BwGRzhSVUJ1eHmYtRNbPZKcKjnKtMyNfHl3ryTnyCzI2DZ0a?=
 =?us-ascii?Q?GzfyAADP1xKp9QS6Y082KE0jIje6iwnR2CytzQhGXs6YPyVWO+dEikuyYnZY?=
 =?us-ascii?Q?2dfv8uOgrAfgyMMwXMA8izeUpsHlk/ogUzAtPBm5BaEyA4J/K0+aOZ7EIIWN?=
 =?us-ascii?Q?vfKq5fXwom26Klxktv8ehM3l3GMBUBXaoYmBtNJyr9KvMJPglIFzfIpgGs59?=
 =?us-ascii?Q?kSZJ6dZ3y1sz//kho0n7a2hD+tQJgBS66BTnDFTW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7393657b-e82d-4eac-c056-08db1a073877
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 03:44:11.7364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuDdODcIkP6I4UM2OluEcwVYFe23li3ZVO2i2X5xFDPcBO7jmESVCEi8rzjLPRchgyg7GgSt0UuloY6CaGjkFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, March 1, 2023 10:29 AM
>=20
> On Tue, Feb 28, 2023 at 04:58:06PM +0000, Xu, Terrence wrote:
>=20
> > Verified this series by "Intel GVT-g GPU device mediated passthrough"
> and "Intel GVT-d GPU device direct passthrough" technologies.
> > Both passed VFIO legacy mode / compat mode / cdev mode, including
> negative tests.
> >
> > Tested-by: Terrence Xu <terrence.xu@intel.com>
>=20
> Sanity-tested this series on ARM64 with my wip branch:
> https://github.com/nicolinc/iommufd/commits/wip/iommufd-v6.2-nesting
> (Covering new iommufd and vfio-compat)
>=20
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks.

Regards,
Yi Liu
