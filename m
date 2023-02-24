Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B56A1598
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 Feb 2023 04:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F83710E558;
	Fri, 24 Feb 2023 03:43:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710FD10E558;
 Fri, 24 Feb 2023 03:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677210226; x=1708746226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+jz9vyLQ10sNbplFT7K3/U3xz8qbxLVd2UfXu0MHiT0=;
 b=fK74MSvgGYEHkoC97Egedg/FWD1e9ZgDJ8qAUMfrl0C0cjLrIDwdDVUA
 TVisdfRZeRtfvjN5jPitQF8MxBMGsXGgy7kRkNYh9krH/Yj4HRmoNU+wG
 HKfUptapn/XlxBxlJH67OMi2Hz2cUnXAU32PScaaZ1niwXtUyFyHU2Znv
 nNqPj+3KbPRANd94IqJ3L9vAga9vmA7oTnFsak0ENgbYRK3kvXg4nDYOG
 +Mc6LSF+89RxCZooP9WUKkO+wjVQyL2wygFCgpg3i71XdcNw4sBxjT9FV
 tOeD2dhSbc1srUo5K/3dRPZuIhA7BiNDKsJ62eQ58cX1jfi/Bub9hxrGc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317148537"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="317148537"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 19:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="672761324"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="672761324"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 23 Feb 2023 19:43:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 19:43:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 19:43:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 19:43:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 19:43:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzmSWsYx9YX98pdBB9Z8aD6nORO9haTcBIZLbgTb/Jkt5YukAjJ75sF4V0iE/nnjeNOIOKvYWAwaSHoxtkdbA6lbeW+VrBb34naNxICBmtL+2YPVHzMZxW9PFPqM3uCT4tPnTAAHVE4/P3UfKxvjG6xnsdbQH7FjvdIxwzXxl8atclcDwjyiaBDF8q0saEy2Zq1G7OA7S2HnvmP/1pt9/w7Kcc9YMW0HjJMYItpdEMFTyhvWqddRXv89vwZS5lq7jYmhyzDn15BhoHkjBtDljgd46XT4IUipBeoMI6BdYSWN6KGjyrMZy7MB2AZFZ8IucuPUnszIRUOIEvmhB+93uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jz9vyLQ10sNbplFT7K3/U3xz8qbxLVd2UfXu0MHiT0=;
 b=YbS3HzLvFZFYw09+e0Vne9wd/0xgM3pZulaNNyzdrsADXbcXwDRFM+J7ZF+5D19uEyQqJ7EBvSGzsTG7STvhrdGnUegKeiZV/jjEY8PfVpmZP/OvVR1xIG/7QSUlT+6T+G9GDEbX0ml10zRT8Oi4JJ9kIhcQDYSka6ogB4KaARNDln6E2vCe6TUpL2BsdYpuIpctVd/iDjYPPO/2PI/QQEUGkPmYKRL982FDoANxagMfiHRPrC4nMaL2zUaBEORNb3oLhNhR5oP23Mo0XaI6YlnUFrTOb09pDdxnD5NulcvOoPJ53XO7XfOlUnHjwhAfwlrjvcG7+INqzrapJ03iQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 03:43:37 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%6]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 03:43:37 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v4 09/19] vfio/pci: Accept device fd for hot reset
Thread-Topic: [PATCH v4 09/19] vfio/pci: Accept device fd for hot reset
Thread-Index: AQHZRadeNlgrDl2wokCstlukf6hiCq7akpcAgABgJDCAAEUdAIAA9TSAgABbNoCAANnbgIAABBCAgAADaICAAA57UA==
Date: Fri, 24 Feb 2023 03:43:37 +0000
Message-ID: <DS0PR11MB7529EC1C6A54BC57C1251154C3A89@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230221034812.138051-1-yi.l.liu@intel.com>
 <20230221034812.138051-10-yi.l.liu@intel.com>
 <BL1PR11MB5271D122329B6908BDE1F8328CAA9@BL1PR11MB5271.namprd11.prod.outlook.com>
 <DS0PR11MB7529B33D098225CFAAA7D63FC3AA9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <Y/ZOOClu8nXy2toX@nvidia.com>
 <BN9PR11MB52767915B9A5E509BC90E0888CAB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y/dobS6gdSkxnPH7@nvidia.com>
 <BN9PR11MB5276C959AA31F8515002B6B48CA89@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y/gilafqe4Xm45jY@nvidia.com>
 <BN9PR11MB52767479FDC6F1CE16275B8D8CA89@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52767479FDC6F1CE16275B8D8CA89@BN9PR11MB5276.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|MN2PR11MB4743:EE_
x-ms-office365-filtering-correlation-id: 09487bf9-240a-472d-fe50-08db16194fd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Goa6ZPVGVwXEyG8VrEhTwj+U4N1f8917JyUoxubXbfR3udzAR6FzHT4XoghvntVvVuLP6ZDBYU37rgrWI4rPM6MJrMrHize+3t1ACV4NeKdhj0iTi+IJAkXwunzQ0QAgBU+e/0xIMvUsAQ89sZqZdKFZ7n9CRPPyr1fuCvUhGR8PwtjqtXoCJrANPJWbEBTsql6N/VsImcp4bDxCRusL68N/dmjhcKpmdt+BDihStuZnSAprgfiZapGa2+5GRZOmrVPzdqx2Rw28Ddw19lonFlo2xOwrqDtGJpveKbHdAQ+VscQl2GFoIqRIJUL7elRWVSz5ByUIIeqwLEnHyrKfp/QKOyUxQpvwYG0DJgPKT8aq9aUc5360AHnn7dtJi1FZ/UBxPqKb8k5xNbOdabBRm4OhduFPJl/KgdyuR/PY2Lo033UUVJ//eA05PtBzAHijO5O/OYU1sD6qxSRF+zeXRbsgbMaKQHKEigOhxufUcoDrjGRBgHOfbMAuYrRvfNkDcYgYmRiIHmk/5I6AqdnLxsafKXVW4pupwApMwf/9nx+s87PzRuS08YRgf7MruiSL02vpnKuO5TFE1ceNa7BLiWP6sY4XoG+WevLY9Zeq2dyYfj1cDz7YeoJvvA1sHRC8+kG8ywqJ22jLatfJ5hm5bXyHf9Db9HJszYd/6rj0g5XgwQZAqAKN0TBuOnjUGJJgVuWq2wHiliMArHh8w7+EBAS7Lv7YObGh4gZ+zeVUoGU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(7696005)(478600001)(71200400001)(9686003)(186003)(26005)(122000001)(66476007)(64756008)(83380400001)(54906003)(8676002)(4326008)(110136005)(66556008)(6506007)(316002)(66946007)(82960400001)(76116006)(66446008)(52536014)(8936002)(5660300002)(7416002)(55016003)(38100700002)(2906002)(41300700001)(86362001)(38070700005)(33656002)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aiVCAS8yRsxgL6z2fCO1HIz22ffv8PmN9NDhdQ7iWvkqGboHj4rkrqwZObQ2?=
 =?us-ascii?Q?Ob2PSgK6mWwCK32p6nq3k8JpyzJ7zeLvUfZ6xy3YCjX7dQ0PfBln4nHKg+k6?=
 =?us-ascii?Q?wHseT2rI62Lv9OvsQiZMGnX07WT3bWnYDahwjTbEBu33W3ozXPA3SYWqlFi6?=
 =?us-ascii?Q?35FtHxyZEkDhRKYRcn6zA1A0uZxs8tsp2JKYVDDnodjpBpGDFTUFQgY9Mmhy?=
 =?us-ascii?Q?I7LMS4bp6XSNAS6KyJsJCGV9AenYF6i+zVPoNhB6FokiWLPgJMYg/wZYe/2s?=
 =?us-ascii?Q?7ybQSya9XI227ZSAtYjGh2DMCb4j1alSycuv7uyWTRCIXNxyd9xN8mNZgJex?=
 =?us-ascii?Q?r1ykA/F/giOrbF1uAhkjxwVVtMIYdS4WhaWPEVs0zDt0Hn9y0n5mgNlBLf4l?=
 =?us-ascii?Q?z3/cpsbHoWGl7DfgK0e1vxbZm6UKI+wECOVQ2WJieMq4EUPOCUckB2VPYouA?=
 =?us-ascii?Q?EIXr9lMKCwfBCq3V3yke1Pd06qY7RrKxTHiWufBSRqEc6sM5hzwg/+JGGR+o?=
 =?us-ascii?Q?NP6YtYck434VzRNKEUjU9WbJUkgXS6Nat5czgOJN7fZrE0rHRN8Nr1CfLiYE?=
 =?us-ascii?Q?0O0HnXH5vdh3tRC8HhhvnJ7Hycw4d8t75+p9HVo9gHj4AblSB987PV5aUq6e?=
 =?us-ascii?Q?WIh8lOhitqj2gQ/uLwXYi8xNSwVeV8c7hHzTIJOK/AcJj8vRFWCQQX9J7t5x?=
 =?us-ascii?Q?fry/QHC4peCGadPW5KQlgzrIWV88Qe+B3pY4l4KB9pi461NPi5egBMsbfUC1?=
 =?us-ascii?Q?SWyOaxMHJ3CqA4Y83HL7F+/Js7nG+/1/vY8bOZmX7c5tEOaHHNjLxVBmuxV7?=
 =?us-ascii?Q?5gD/S07a0WnqRrxMgTmI8GMKB4GgPX4efexqsSHR73p5PNXN8wt4N/vA6NAR?=
 =?us-ascii?Q?ckh6KzhigFPfIzOzwomJoovMJPJNJshB5oHm1rTFex3xYqPSfGstrwcDcQJ6?=
 =?us-ascii?Q?m4JcJGciZpYh1gYwlWLnjVKsChpXMoJgqQ7OIwlQbHktoCSOYF4wDBKeShQB?=
 =?us-ascii?Q?3Dp0UST4eh7jy7BinRja26fwJIz1cXdzrVRMGRTXpOpLzbLE8XlPt5sRAuy2?=
 =?us-ascii?Q?rzxYBOgcRlE8V79wQkLsxb0qHkGCI/QXuBkw0X9uAABkdOX+zKiHgMKjSHfi?=
 =?us-ascii?Q?STnaTFBPWK+Sp1Zrv8XMNHuqKFxvlSU3jgMzVVc2rYu7vj5AnCsf1CZ/EY5s?=
 =?us-ascii?Q?beCuSmcqb2TJjCHaGexRewxJFhm3tAEweaZ3fGUSchkoK0xuocb3Ah5cgPxT?=
 =?us-ascii?Q?qdjulNR32THm/d/J6IhuFx6bO0WuHnTkpwNhIOte+jcejyk7PQSKxAIKjy4b?=
 =?us-ascii?Q?fRfu7pEq4em/ZcYiDgQln7b4Pxlo49k5I/2DpLnY0mvxJIg1Z1L6HiKE5uE3?=
 =?us-ascii?Q?tMomz7bf/6THls6ZMZ2rmgostzc4T04w3lTCA5YTbh45WTFiH7E8g+4Qiltb?=
 =?us-ascii?Q?ocr/+nV8BOZc9KAXlBxHtl57k1V5ofwJ+VvgKaGoXGaiovPslaAwBta4XYbX?=
 =?us-ascii?Q?qtGJyFHbHHlFsWdsI1eRAFhCM664zxZLS6xfamVlOZj5/xTBOu93XtBRLQKC?=
 =?us-ascii?Q?cHYLwWNg0cs++8AzvbC+7O0ZIXYQBClrSgijjgMf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09487bf9-240a-472d-fe50-08db16194fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 03:43:37.2228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8udQk6DAmHP80+eVZvsJX1H5JfLUsZGh0eYl+/iLslXHhbZINiRClVtwyWcMeMT19OINTnhpAAJx161ov2XfGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Hao, Xudong" <xudong.hao@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Friday, February 24, 2023 10:48 AM
>=20
> > From: Jason Gunthorpe
> > Sent: Friday, February 24, 2023 10:36 AM
> >
> > On Fri, Feb 24, 2023 at 02:21:33AM +0000, Tian, Kevin wrote:
> >
> > > Yi, while you are incorporating this change please also update the
> > > uapi header. Rename 'group_fds[]' to 'fds[]' and add comment to
> > > explain that it could be an array of group fds or a single iommufd.
> >
> > Upon reflection we can probably make it even simpler and just have a 0
> > length fd array mean to use the iommufd the vfio_device is already
> > associated with
> >
> > And the check for correctness can be simplified to simply see if each
> > vfio_device in the dev_set is attached to the same iommufd ctx
> > pointer instead of searching the xarray.

How about the hot reset info path? We can still keep reporting the
current information to userspace. Isn't it?

another tricky question. If user passess iommufd down for reset
in the vfio iommufd compatible mode, should we support it as
well?

> yes, this is simpler
>=20
> >
> > Would need to double check that the locking is OK but seems doable
> >
>=20
> Locking is fine since dev_set->lock is already held in the reset path.

dev_set->lock is held prior to call bind_iommufd, so I agree locking
is ok.

Regards,
Yi Liu
