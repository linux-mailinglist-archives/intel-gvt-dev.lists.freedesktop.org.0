Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B96DC49F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Apr 2023 10:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B360110E29B;
	Mon, 10 Apr 2023 08:49:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CFF10E29B;
 Mon, 10 Apr 2023 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681116539; x=1712652539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NV9xURfzVJMXVeEcwYM3dnfRWGRntJh8LwtjYmQuuhQ=;
 b=aDIzJn1d9oV+eEH0caEQxqm1PvZ6Sgp2w8EuNRH8La4Vy1/WXC+VinUK
 2NF2y3DarpHuRz4pm3ZPtM86M5UY4q11APFn+I3IBq2hDB6ViJAbHmo2M
 1OI+BQkQHz/MKAADJk0bkgRI8PJovlbOgRvFBrJSnSCr05UwSulemZGYu
 KTPOhT/u2JBX/MZUzqSIP509JeyxnJe0GBVWczS9bD1vMi/ZaVaJNNPE2
 Wf9uMRAXexWsJ/4GOuQettBxmYIvxgwfN35SvFDaQVO98dBCYZBm7YfdF
 1tTlhGA5eVXxJpfNIbfhxabUxUbNAP08lQ+4zDKpVE8c3hUVpHLQLYHAs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="342079627"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342079627"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 01:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="799438319"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="799438319"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 01:48:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 01:48:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 01:48:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 01:48:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 01:48:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyJ9fAAEPj1fKxAkOdD6XG06jroVkm5T9UMcM0CZzny2c35ubpNK0w18Tk69JIvCm4njDXARsjbWXD6zg71UawoWjM9WyRXWHEhBWykZY4VMR1/P8p4DKcEO5OfpKq1HjNvVVgDH7KA4K70eQdf+sL3hpDcxIabCPQzDZtIPBV97fZRGrBfnJ55ySKjqFkzoRELN2BNJ9l+1YA6GuoMgwV3rI2TQiXoGn1238gL/8DIE6XV/m9rZ3LUEtBXJLH//gT4RDS/6l5qsmZTVlQoSqgjKdIkUf3tzCI4olxVN7erwNajEJnRV1mC19+1zWz8KL2al3cep2XF7WJIMUp484w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQX6SY0iOwQ4h6urNjjKfJ+5hZ9FfEXD4/zxMxziSxg=;
 b=FQhrxp3lRRzIWMYrgV+8EjIMk2De1ugowFxGPOC3I3kEdf591sUF0e/l4mfpu4j+d2BMGgjatQIbVAw+hr/AhmO1rq/4rdYG3qqanUiqxN+uINil51EuhoJp6jVbvC0G+0KXUxwwEGgQz7TXlo1BJTMJtIBErEyBw5SGhLUDCvTUsljAphiBFgoFRo1+g4IqH4nT2C9YJn4Sy4tAVyD21edvv8jJdJNL/CNJ4G9/kI5qhLlcnOWx/dACd2YKP5Nx+R3GwjfB3BDyUisM9Nv3IaRoVSHwIPTG6o/twNSH06Ld8XZY0efGPO/8XOKrdtVIP3XQTMUWYFA1w1zZp89HgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 08:48:55 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de%5]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 08:48:54 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Topic: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Index: AQHZZKiCMJJkpNrujkKpjX0h05Zqwa8ZTcVQgABjWoCABfZ/IIAAIQaAgAAVGHCAAAktgIAAAk+wgAAUoYCAAAeeMIAAWxqAgAB8OECAAKRjAIABasqAgAAZcoCAABTt4A==
Date: Mon, 10 Apr 2023 08:48:54 +0000
Message-ID: <DS0PR11MB7529BE00767D7ABC1136BF7CC3959@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
 <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407060335.7babfeb8.alex.williamson@redhat.com>
 <DS0PR11MB7529B0A91FF97C078BEA3783C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407075155.3ad4c804.alex.williamson@redhat.com>
 <DS0PR11MB7529C1CA38D7D1035869F358C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407091401.1c847419.alex.williamson@redhat.com>
 <DS0PR11MB7529A9D103F88381F84CF390C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407150721.395eabc4.alex.williamson@redhat.com>
 <SN7PR11MB75407463181A0D7A4F21D546C3979@SN7PR11MB7540.namprd11.prod.outlook.com>
 <20230408082018.04dcd1e3.alex.williamson@redhat.com>
 <81a3e148-89de-e399-fefa-0785dac75f85@intel.com>
 <20230409072951.629af3a7.alex.williamson@redhat.com>
In-Reply-To: <20230409072951.629af3a7.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CO1PR11MB5089:EE_
x-ms-office365-filtering-correlation-id: f0663a41-e15f-4b47-1ee7-08db39a06a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DVT+vo3EjPwtvUnYXiZ5ucyGZ5FgMeA7xTEpobd7EM8eGDajOpURv2NlVB3SmNq5eSNc2Go6SVcZh14G4J0I/glEvzPrM/9yeFGLQ31oY/U34XEzDc21T2pR6z23rGRIUkpR+ERfU/BoW00jq4BccryxHFIy6W4zS+z/CQ+99rhGI4OhM1pNJUcGf8Kzi3kqEdObDF9AsRGzzZh1orXnNvTEMu5pNEKi7p2aEyuNxc2sg0yjKOmUWjVWL5+KBoSuQ8TNnwxrZHmwrFiKElc4cQrQp9W4vNjNLfm2KCi4Vi+4TiO7x+dzku3FFv0NdDE7jxNIcIY59vk25+nDYmCJ5+tMfpNaPL38CyaYqirAPdjbgoJ6X7LxPhXPtg0OTRfQS7+7T51hOiX1Atz1+BGP+VK0Bff2HtA7gsoTig2C3EYYpeRIz1gzDGcym4KuhwFdnvxC2XHwaKPOrK001UNf4kmdTDPleyFUIQ6diIz/q+jw6QB2eRNu1RiMPaYT9qzrAjE3Vr3NCCFFRFkD5pBRY1iEzNpmHYN6PPg6cs3GYWW0ckHzDU+j0zl6Rk7cnBwbvCnEAQMLQpSRjO+VZeRsEyeP8rJ6hu2p/W9l6vezmhS+yn6hwrNvEQEcVy/6XFXT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(478600001)(7696005)(71200400001)(54906003)(316002)(9686003)(6506007)(26005)(186003)(966005)(2906002)(7416002)(4326008)(76116006)(66946007)(41300700001)(64756008)(66446008)(8936002)(6916009)(66556008)(66476007)(8676002)(52536014)(5660300002)(122000001)(38100700002)(82960400001)(86362001)(55016003)(33656002)(38070700005)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f2wUPITQtjXbQFFq+165uvyZth3SSPLaSZot8vqdgvXIaATkfa+Pc0Sa7xA8?=
 =?us-ascii?Q?4dmR9T2k/Mm/GpR7nQQgvVMEFaCnR5R/IXP1qE3zyMY/R20/YSx1l/64u7bC?=
 =?us-ascii?Q?+RgPcJnhiD514TKv6A7W5WAVxxoldeqtjKHYGb+0N9L2sa3bJAqdCrGGk7xa?=
 =?us-ascii?Q?hPgbwSA+OcS1PdeTiNZ09hzIAYYoEaZ1/Ecqe6PERXnkf4eH04gTW/BmAfeB?=
 =?us-ascii?Q?arAz8KMnPVAKitTdMCj4a1dpehjhHa34f5K2pX5cddtpe5bspwfO0f1HemnP?=
 =?us-ascii?Q?ZMMaFYEWKq7RaVVBeVs0001QkeivDmPAQs33h839v1oddGBU097UptQkKRQT?=
 =?us-ascii?Q?dkOFw2XpXXOH02d/HKsbMz4ctSUrzCbz/NeykcXobY6dH+7HpAlgYwEBpJO2?=
 =?us-ascii?Q?AlV1bFaEwi9nIv820cWrRHMx95t07JGXbAby1C6H9tLvp36KbnLcE8ESghnm?=
 =?us-ascii?Q?kMWxElamspSyBvwx+iIsRWhTHTcVwzIsFSlCFEIq5muGF3s8hRMGna+uS76c?=
 =?us-ascii?Q?QkE08LYR7w31VFaXjPfcevL+ef/hoC8SV+H8W+cYNB/gRfVJBFpctKvFJfNe?=
 =?us-ascii?Q?0amqOvcVCKvW4oSUW+fDisJWpW3nH3ZpskmWw2Rutuvp/DQyVwS1BELm+czM?=
 =?us-ascii?Q?7qxepV9Wgdf28ebH7NGLXl2BLtJ/X2pls32FLzUmiJwyBRTkT84yYM0PIHM5?=
 =?us-ascii?Q?DJGyK585naDORWuBON5n7VCCtu5NdMSlHP6buD4+EM4weNtNOe1Dlou1Uq28?=
 =?us-ascii?Q?lmJo7+OeGefVuRHQIbhUUMyrxaV3n9Mp/rz5jIVLT77vBbWTN7BlBErjwidp?=
 =?us-ascii?Q?NK4RZnsxixxpdFYCfr+qY9cGMmy83CQiGJ+3Hr+iLvoTJXsT5rfXQHbrVkdL?=
 =?us-ascii?Q?3fA9AWe9dG5QsGypg9/wpxEo16zeXhiUUX8sm/RcZfTZct33KoBQQeMc+d8B?=
 =?us-ascii?Q?wwBTBkVITUtQl3k0VReD5n2db+/BWMrbngbqOStR5ww9avOADnho+KQfTrJY?=
 =?us-ascii?Q?zg4OoZQ9QdAQ5i2QnKGGkW3QA674L4kac1MoEWga+gejTkkXbJiIDM4H6S70?=
 =?us-ascii?Q?0uu2NPepIIHw9tP0yM4GYjEQB5C9WJOo+CLSLh486KalldsK/FVckgPUoqUg?=
 =?us-ascii?Q?j3xk7XwanL5+5oP5UdgJrlvD1DccFrkaji0GStI08c0RBLZa3pd9kOQhzT4E?=
 =?us-ascii?Q?M5sLgNkr5EGZKcYGrkLqSGFXhjnNtM58yHBYGr6+I6qw/j+KAnvyKF14SrBl?=
 =?us-ascii?Q?tpbfXkS7LpxUgWQgWo7JVvRxhLbH71J+7BizCzGzrg8BLVmCKTDOkMZAPzfh?=
 =?us-ascii?Q?fkDWdDvTWeEyRvGilzTHc3YP4VNgmWwP2Lh9aAQFasVMQBu2/a76Gw7skTxs?=
 =?us-ascii?Q?Desi3s13iUHdYm7QJ4IqH3zZT1uoX+vLj4v+lq6TeRnWcFJ5a8X1RY/Nb+Vo?=
 =?us-ascii?Q?qmVgeJIHv6pv/rrpwE1AhvGxvKjBOCodrzZhGlyFV5czrcwfifzrZnMcxCpw?=
 =?us-ascii?Q?EhkSquI+PRDa4x2si65oMeIB3e5ovHXIhuXV7X+p3Pmb98AmWQLXC3oB5/PM?=
 =?us-ascii?Q?f+25jlHAWepOhCVHkH4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0663a41-e15f-4b47-1ee7-08db39a06a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 08:48:54.2755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ODr1seJFCRkZEJIeHLrX8/FIqvWWQOib86/RJNx+Zg306qGBrYZZKPsNQIe6uL06G0u2uaAHuhMnV+jLsmzZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
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

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Sunday, April 9, 2023 9:30 PM
[...]
> > yeah, needs to move the iommu group creation back to vfio_main.c. This
> > would be a prerequisite for [1]
> >
> > [1] https://lore.kernel.org/kvm/20230401151833.124749-25-yi.l.liu@intel=
.com/
> >
> > I'll also try out your suggestion to add a capability like below and li=
nk
> > it in the vfio_device_info cap chain.
> >
> > #define VFIO_DEVICE_INFO_CAP_PCI_BDF          5
> >
> > struct vfio_device_info_cap_pci_bdf {
> >          struct vfio_info_cap_header header;
> >          __u32   group_id;
> >          __u16   segment;
> >          __u8    bus;
> >          __u8    devfn; /* Use PCI_SLOT/PCI_FUNC */
> > };
> >
>=20
> Group-id and bdf should be separate capabilities, all device should
> report a group-id capability and only PCI devices a bdf capability.

ok. Since this is to support the device fd passing usage, so we need to
let all the vfio device drivers report group-id capability. is it? So may
have a below helper in vfio_main.c. How about the sample drivers?
seems not necessary for them. right?

int vfio_pci_info_add_group_cap(struct device *dev,
                                struct vfio_info_cap *caps)
{
        struct vfio_pci_device_info_cap_group cap =3D {
                .header.id =3D VFIO_DEVICE_INFO_CAP_GROUP_ID,
                .header.version =3D 1,
        };
        struct iommu_group *iommu_group;

        iommu_group =3D iommu_group_get(&pdev->dev);
        if (!iommu_group) {
                kfree(caps->buf);
                return -EPERM;
        }

        cap.group_id =3D iommu_group_id(iommu_group);

        iommu_group_put(iommu_group);

        return vfio_info_add_capability(caps, &cap.header, sizeof(cap));
}

Regards,
Yi Liu
