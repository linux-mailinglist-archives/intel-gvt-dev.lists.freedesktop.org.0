Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517076F0101
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 08:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C23E10EAB9;
	Thu, 27 Apr 2023 06:45:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32A410EAB8;
 Thu, 27 Apr 2023 06:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682577947; x=1714113947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x/4p3ZHTorthOzQez4XJYhEQeP9fQoYyglp8PqthWb0=;
 b=iVo/gYDzOEQEbj1cVnra85hlbbOS32aQdJD5RKrOLmt2BNswybWkLQac
 a2XLNzp8vH7Qfs1MqV66byg/s1uokIksB7eNgpTRQuI+I/bHjOIMxRBFP
 NKb2gNUrezH2gzulU+rcyiyE4WFsyM3PCM45puZMQITwpsWILjHerX39B
 TRxJbK9YgDzwBGeBN8OgNhzYLjd6mf4jI/k9rpPTe6wt4jyPERWmZCsWx
 UvQNlOPk+R6NK2v32Iko261J7q1EOVgTuN9ysbzCnLB7imVny1LxpQbs7
 CZgmcpz2ro/XO59vbQikjrh8YmPhEfOVUSkZNqd7SNgFecNWo/VxcqebL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350185891"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="350185891"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 23:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688282433"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="688282433"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 23:45:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 23:45:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 23:45:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 23:45:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 23:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0R4QqJQ35/E9Nh/3Pgf4jU05EtgK2KKapon8gRco+804VXmNERkutZZJ6UFUm5J6930GUgQsSJlsOI/w9m4ywjye0ku1tkZIxLEVY3zLzuw36BiJZgZfZPB/9wJbR2ljN1dZECbkqt4Z1YrP86S4wAnetQxXUShvUt2FyvJkEB+uvHDsPPMvcgaA4xFhN6pj8VvXy+svVkwTfV6JAteUGzcvaG0B4D8RugHiztKJJVwz6BhKQD/QLf1VOgEARE5JNQwVTwCdio20tPkO9Lck5CzrCQxvARYHDJkIsPWFCHMlnG+OpDCWrHwStTU0sv52Lp8Tk8rXRhQ82v18Ez/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TvpmaSWJ3qLjXPQfYZ0PLmk3ijR+qFy9Ga9G+AG/ZQ=;
 b=VpD+qMkYIPevI/MPXFR0xRnETS43a3+ZWZs8iAZcwgkw9Aw4VhEbFvq3wc3ko9QGGVxDk7KdPmmDzg2I3vBZdA2a6NMe/z/dGoCynB0dlJhRaG9uNK+XtLCfMn8BzuDIyW8ht6JW8/Mtoqs4M0YRl9woCuZEN07nUnDRrHL/RkOF5FmokruAjBno6rwGvUWYlv2lvorsWjzu1HuxUE7n0IFbCH9cUfi0K6Q4U9Hp1hmBH/TvU/poALqW7JENHvPgFPX/mnSyQVBrzwa8z5AVK2L5PRvJZSb0UWIP9bDPogHQyK6G7MbTlRWusShVZaQckQSXrqaQFRehjLl/1MhtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 06:45:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 06:45:41 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v4 7/9] vfio-iommufd: Add helper to retrieve iommufd_ctx
 and devid for vfio_device
Thread-Topic: [PATCH v4 7/9] vfio-iommufd: Add helper to retrieve iommufd_ctx
 and devid for vfio_device
Thread-Index: AQHZeE8N9jX7dGDd2keqUVDgAYyuf68+ttTA
Date: Thu, 27 Apr 2023 06:45:41 +0000
Message-ID: <BN9PR11MB5276819E5A0D37CD20300EE68C6A9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-8-yi.l.liu@intel.com>
In-Reply-To: <20230426145419.450922-8-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7358:EE_
x-ms-office365-filtering-correlation-id: e2d1c796-59b5-436f-a98f-08db46eb04f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WzRsRVK203q2uhnRaAHWkg8FufT9xWmS8iElNzKSeKK6M1K5YNoz3it9M5Y99OSSjaKOHnKslm2XJY6paPCdRAdFLExzye7EIDFgL+OjqXhlqI3WfXhqyBt4vspmw6GTneKVKV2z8/aWgq4XklBVJV+UQlgj/Jo4uzRUeoVuJq9Rig3KzO1mUSKxOWas6+PKjuhY8VRh3K94Se41qkuRnFQBZwZTmwArf4Frp0EEexzUkli6sGVx6B442e+OdTcV44XR6R+dFEGw64ArrgGInDbpr3jo4IVFtG0arVyd7qY8cnpcDIk1uMpOvnTpFvi88USVCAFed2NMKLvjAor0+UJY6P0N57mWqABf/iGEJOMzcnhLCM+B2+uyoX1Cm1P7JCsC6/n5DG7xNVl7VAqM1Xnkp7qMtgZzmiu+8kSA0My99JIsqBUxC4GWVdGjH6xd9dZ7sLXCctx2mxSlCE45M/93uFr3N47i2DUOYvaQs5/jyGYhFQD9T8Yp6P7OrFjYoa5koYvfeuf5YLgpnt+WzwCnQhTTVItE4mwKV5dU+qqWaC/0A9KXPur4mPM6jIibadxxB+y+9S+ZeHU5jXI/TdD3CNGGp3UsKkrpLt+CF6IPxgq87CKoO9Nj8Gf0Ue/B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(54906003)(110136005)(4326008)(316002)(66446008)(76116006)(66946007)(66556008)(66476007)(64756008)(478600001)(41300700001)(86362001)(71200400001)(7696005)(8676002)(55016003)(5660300002)(8936002)(52536014)(4744005)(2906002)(7416002)(82960400001)(38070700005)(33656002)(38100700002)(122000001)(9686003)(6506007)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8EdmoFAFRd6amdU9W6sz/TQ27EUGWnrrWndGRuFQYT3lrABXhl82Jx8gILkl?=
 =?us-ascii?Q?ttVErjqiw6TUx8YBfYVp8qLMNvtiHCeEi3AgH5O0LICNzhb49F/SjTsJ97kJ?=
 =?us-ascii?Q?GnIaX1Di2fM1inL7VoYPqUwWCcgxv6SKvRFaXQxNfLQtYo/UgAT7ihAv6uh9?=
 =?us-ascii?Q?S9Gk0ziBpL6rN6uhnXCbzWbiFGNFAZV/lRlppRGOCEOeaxDAmJ6Aoh8O0sTT?=
 =?us-ascii?Q?spd8NvUVAXGiS6Zwb9r6ZXwmpwlk8PF+qqGhyFgHirnjJ2g0X38nQugLlkA7?=
 =?us-ascii?Q?r1P7HOuIJgXUHumJZc9TUZOtx8zGOQZ9e0Pm7oX97UM1zk7kv5qlniWSVlR9?=
 =?us-ascii?Q?3ikRkIf6M3+nc9xEpizR0T4Bfa510h/FNb+7uX1nijAYJnMygIhSvNnOm/ST?=
 =?us-ascii?Q?dlISmbk7C9pdQkc+xfbQxNW7k4r7OzY4aOD4yOanNUm5f+ZN1w9AJCsnYcxX?=
 =?us-ascii?Q?1fGIPkdU8iWJR4K8IychuCiYD1nxLDWzXZadS1XaMaDLw/nRwhjZcPNYjIuU?=
 =?us-ascii?Q?tJQojCr2pKOXLT5688fN39Mtnh6S4IE5ye6L9x5LYcO0jGivNmmQKXd+l7J8?=
 =?us-ascii?Q?RQFr4KWdRqGHV85SkgkMxqK2Kf7hIWekSx2pNWmno+ie/VPbY4WHEwmtEhfo?=
 =?us-ascii?Q?omPgiLF/1ak14Ur5Od3rQQfQc0/S/4lfPB0r0xvejxYwjEjadsTipXNFVIIK?=
 =?us-ascii?Q?7oA4Z5f7GWfzJMODm/D4C6uIHtgIIFBrNbDvo76PVL9F1fYx8ThKhEwO39aq?=
 =?us-ascii?Q?ieorz9BKNGH1zEjIeQ3wR6NWsxfKfwiFHSirQjDcESuWvQ4ig74CqQl9s+8c?=
 =?us-ascii?Q?KYE4vHb58ZhDDY/H0RlyEmOVZ41m1raVIdgzH/+SRWuP3YRF1yMNYbo4lMKS?=
 =?us-ascii?Q?T/cjmhLkbEYDElBE/ATG3VHf2LTDONIaYJfa2YA2UMpgjBPsuQ8G3feyRhq9?=
 =?us-ascii?Q?MJ3KLdvmjY84AvBypAj7AEq519xtXIQoifTF1dqnUNMXP82Gns7DenwDooMm?=
 =?us-ascii?Q?j4f8awp8ya5HSEzEJlqXlOyH0r9H+VJQQvXuIG66DNITa+rAgDrvm7clSTPk?=
 =?us-ascii?Q?x3xj2U7NpB1uYiYcY8fXp6hL59BUdRcUD8X2nmDiDTcYAcsSOpJewJcm+QWg?=
 =?us-ascii?Q?nMKD9sPZkpRsOptcqmT+G7Tn70iHqjTjRxCal2vSVIAFci8UfL+UrB3hz/rm?=
 =?us-ascii?Q?pvgoXGipbp79QpAp0aOi9cKECt0eV0YN7TFRjt2oZfvcFrLeDknz1s8nboS3?=
 =?us-ascii?Q?iMPJ345qlGMwWwQ4xSR4/60b29vHNofDHTANHqZTIqHClopcEBicL3IUl5te?=
 =?us-ascii?Q?ia4ZyYYmkMeN3jwf1dmLBLT8O2qYPwIk6aCNmV+WE9LSJq1rWV1gh3RL37mz?=
 =?us-ascii?Q?VrvJa2eRQWAx6N3+olefph61bJ6S8t0CqOmjMjPkYAtLhPqdHZaw2spLGKon?=
 =?us-ascii?Q?2FQgfomRK9g1fnxG2ABX0WLW0DYVOkEUaH9WkgxtlmqZk48JpXSjYL9rT9H8?=
 =?us-ascii?Q?YynfTGhkWY1dSgXWBlxGCVK4Ax34DUvI6GyWGuMjnmNfdnmEzaejSlocS3Vm?=
 =?us-ascii?Q?fywWqI7K6hAP8FtGoEfsgR9tBl4mPulC2T9XfuxM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d1c796-59b5-436f-a98f-08db46eb04f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 06:45:41.6993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxUpqfLcFnAAAP1plWEBU5gNSuyGrkcgGxw2VomDM2DrkiwuRKLWRIJJs4st7LafZf5Q8j2WSHzi0VlhlCmLrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, 
 Zhenzhong" <zhenzhong.duan@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Xu, Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
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

> From: Yi Liu
> Sent: Wednesday, April 26, 2023 10:54 PM
> +
> +/*
> + * Return devid for devices that have been bound with iommufd,
> + * returns 0 if not bound yet.
> + */
> +u32 vfio_iommufd_physical_devid(struct vfio_device *vdev)
> +{
> +	if (WARN_ON(!vdev->iommufd_device && !vdev->iommufd_access))
> +		return 0;

is WARN_ON too restrictive?
