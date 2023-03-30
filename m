Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA66CFAC8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Mar 2023 07:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1AF10E075;
	Thu, 30 Mar 2023 05:35:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C1E10E075;
 Thu, 30 Mar 2023 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680154516; x=1711690516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=26t1PkJKtQAZoUxOT1gF0JbXDFFzLgoR5+bs2KhzUkc=;
 b=LJZ9hciAM/YiFi/veTl7hiFXRtSjO/l01j0HHWe5kInOt4DVRGK3anZP
 MGw+YOwCA4cEyv7wiGePSTrByegpVIwLCzhJK85kXe6Dl7vjxQnY9GCOe
 un3ThwN6IFv7f/gDGVbf2+TKrSFQUTrLhXlskcSnOGPU7+Evdm3BOqNQF
 PRPCXtSt9i9jmZwh2lEc3i0J5mw1Fy7MfVqcGKWDN1rfn3WZaRmW7YiE5
 tTXxbKME83zrCRPOPzT6IfPeDRh89MVNee2AXhhrQmBRgxj36AVpOdxKH
 dIsdneE3n/GwV3gEpXdGVCbuZ/QG4xE5+h2z7V/HrhxuAvaxA6KrjK7ph g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="341090882"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="341090882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 22:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714861074"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="714861074"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 29 Mar 2023 22:35:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 22:35:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 22:35:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 22:35:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 22:35:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeDm2+nxYkq/3n38ykgGz8qizxM6rRptdsOV9cHzfAO1VtOjLa95nFK1h6l2E3SQm3eDZ9W23MXnk+PKoVEP/AtWzq/IOTSHn9fOVY4HxNSvZcwhHKxhkwbL98soJzBURnROkNXI7/dF76YrA4P5s8FfODrjH7JJ4K5Hyvcs7Ea0i/crI2O8odwD9nUpfLMmqPfjGXb70yeLlUx6xoWOcTUjdOM1eGW6tcW9adwfT4glkU9KRlxMU/VJnLt490wTq+xaFUB4BgPrcwvdD+t5aTLG4SO8kBxtVvu8woiNQ/EzRH27RweIQERdoN7kUN2Z7OFedYBJAPLsBC3w1GdLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuutFvCEabRPK17aigtAAdVScfoxtK/eJqxzWxolPqg=;
 b=nE0PL4K4ihSCRlPmgofRdevK8YbJ7aOJvdnHfNpPWtgt/i8ePOVThs2j/NtXUC8HfyI3daDS5yQOPrkn8sHAhoPQSyPWz1Jfg0e4eeygAzmRnz0Ju9gqBC80/SYV3DTi3i8VbVnZ3bdzwJpnQwmyUrsaxaxTq1dbIxG101kS3Qns9zCoumPtPnhOGfywDTnSvkzelaz5q1vOtJ/e0LA0ObIf5o+vPAgKrGVs7cir2sOinQp2SkB9EbOI27EtKy+OpmfFA+EwprUUJtL1Oxhev/cawV42yTojtygzgs48lAWoMnoXrDK/rLOMm5vag2vFlpv7gAuerLU9FDfU22mJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 05:35:11 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de%4]) with mapi id 15.20.6254.020; Thu, 30 Mar 2023
 05:35:11 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v8 20/24] vfio: Add cdev for vfio_device
Thread-Topic: [PATCH v8 20/24] vfio: Add cdev for vfio_device
Thread-Index: AQHZYJBJCmZN16F9XU+/2pw4LnyBN68SMDWAgACc4qA=
Date: Thu, 30 Mar 2023 05:35:10 +0000
Message-ID: <DS0PR11MB75293361C1465E891EBC694EC38E9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
 <20230327094047.47215-21-yi.l.liu@intel.com>
 <20230329135719.22ac6c12.alex.williamson@redhat.com>
In-Reply-To: <20230329135719.22ac6c12.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DM4PR11MB5294:EE_
x-ms-office365-filtering-correlation-id: 71b72ed4-8ad0-4c61-cec4-08db30e087a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZfnBQOLL31NCa0INsYMPTSKs3mnUNZZqW+OK5FX3jvqkOFgfhp9R/vmHkcSqGC+yNLtDBlFCpZn3hikHTbVclYPuznuW6N5avAVufl7dTLG/Z6sf1PjkjBMbpwZxSnwL7k8JtLiQ6LnFBXEret5O1NSEOQs4sVja7+UnGA2Y17qQAPxFKu6hEL4z/3a9tG/iK3AopbAgvnOauq5Bj94fQ2bgWJQan7giyJH8LP/JT0ivxtzaHwDl5xq4MBAqfGrOMZ5VHRSzr/TUppdtHb6fb5lJ5gNWgRzHY3efUXQp1CZBUJK53C+IFNoHvE4Bjx0BkRhP6adheOhqUJCZS0oSh448DTkUVrHVPw6Jep0y1Qv5GEL8mLdh0cBg8qWKmo75PhQHNQGW3/sQrZ8uNaEF/VawrKHsjZ3T5uIcZW/ak8OOlVkRufN74+fWw+VQBbtzHrke/ewmBD7kJ9MgxdR28vBJ3JyOq0NYwgK8woIPd8c1e9y+F5l5e/+9M3sgd8g4su121Zgjbu6Avj1Ry/HB88VvulfH8hr6v1TP3GIlNPf0k2wcRGv8isKxKg6HwMYeznWZO3Vbu8ZrBmauNCQoaCy+z2H6rYjBTkWqbKWTB/NiabL8LSF03gOclgufs3yB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(2906002)(7416002)(52536014)(8936002)(83380400001)(5660300002)(86362001)(55016003)(7696005)(82960400001)(33656002)(71200400001)(38070700005)(122000001)(38100700002)(66476007)(4326008)(6916009)(66446008)(8676002)(66556008)(66946007)(76116006)(186003)(41300700001)(64756008)(54906003)(316002)(26005)(6506007)(9686003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?srCqHGX2CXeyYjugdDuehiRKiAFChq+B/ckiWrOAzsi9CQ+MH32TU3YIaFHQ?=
 =?us-ascii?Q?G4OINWREHoibJgvkzqloUThjkyGfUSUH8TSw5BOD7RqSqoR2QgH19kNP8kDl?=
 =?us-ascii?Q?QiiIDctOgMnsAQRnhF50/i4vXm6xR05JMjRzPNimYjfICRSMB0YmJ7bUfTC4?=
 =?us-ascii?Q?jvFwJk3teHS7laH80R3t9RUZViTG3DklHmuGEIzvqHQeb+URE9ASWmaan34Q?=
 =?us-ascii?Q?yxpLd3orh+pVjuZg7jbHZxhQvV7LUJXbctElGM6LmfvwBtWD5+BSNVIH/bks?=
 =?us-ascii?Q?5uNUktHq+lw6CbdjnnNjuv+h/TLhZLE3eiA03XNPwvAFD6tHQqcIiUGPl6tr?=
 =?us-ascii?Q?c44+3wy4X95/KyCbS4GgjOqhcTrdxmBUmiQW751zOyQnhtoeaA1fGIzYC5fH?=
 =?us-ascii?Q?3xpRT2y99tHCtSAJF3BrOiShWaUf+98EplwbCWJLugLdGWUKmwCEJsINWzwO?=
 =?us-ascii?Q?aGCGZG472gAmPMM2yheQ1XBRQ7tM4XXkJ/QzsYTX3cEfq2Y7ADlKbiG+jmqe?=
 =?us-ascii?Q?sflb91ZCEQw76Ft130lbA9KrWhG3ZtQJwX1Fj8o8qdB2TiYO8x6EoppaBhHg?=
 =?us-ascii?Q?SXC11lwg6efBuXyGgicfleNL+VC6EWb7+emSBjATyHfTiZE550JZ/FUHqoS1?=
 =?us-ascii?Q?Ms7pTj/SmuP27/tZ182KgHfD3tjNijt/d45wvga7bFxd3uUfqjWBzHXgiJYz?=
 =?us-ascii?Q?Kuh7AVBLMdFbKWnR7Zwua6wVuD3ZqHgnf6+CYw0IhSkfr4VyYgQ8aViroQEh?=
 =?us-ascii?Q?px+3nSSzdV4IRwSAuzG95I2845aGeETFUdIVZenx2pJ9ad/+16vW5eijOqxF?=
 =?us-ascii?Q?TEcH+GcNeU4Io2ut8hMQCQAYsLZ6s3KTbvatxEYNZFaEMt7H3y6d9t3fm3au?=
 =?us-ascii?Q?UV4TgEz9gNG2oRbMFuixqfz3FHYc6eCW2V5q95acNLY34i1tFV5xLmG8SawM?=
 =?us-ascii?Q?INxU9YshHAJm1L/k9qmGVRlFQD5sQ2UjYtb6yiY3q6twsFl6ZsxyUuj4MMpp?=
 =?us-ascii?Q?A2/vYAWGUjBFAj6aa/cuSy9efMM1O0Z+BdrjNXZMoBn16niO9daAfWDRnDhJ?=
 =?us-ascii?Q?QYzdOpMw5bbFyx0Bt+7UUPc5lf/2z+62JqbxiGfUFTpkQ5TitQ+jYFHLXb9Q?=
 =?us-ascii?Q?W/TJFSj4n/6sWVdLncUFliT6Y/+rgX2HDu8zG8knzmO9aWn1wBuaC5hI+047?=
 =?us-ascii?Q?Zwx3+NNKD6aFn/qpMRcULNEYtKi81qVVGwlnJuFg6J0go1S1VbNXMR301wDm?=
 =?us-ascii?Q?BDwueAVTE4BB125zV/jA4/JReUjp3tEC2DZEyXOC4dX2w/m2NqpLsE8IxspI?=
 =?us-ascii?Q?zqW0yovjBMctrS4slewpjCSdjZZuA2NG0pu8rgzAtd9+w1gL47JSXG5I9d+d?=
 =?us-ascii?Q?j4T2Mpu4KuNxgfvlCArT9xKYwq+55F/0kRPy7/1K2AtNs71HctKtGVp77E1N?=
 =?us-ascii?Q?Mx0QQfpMj1G3vYnkr89OlezA7XZQV/N3p7bOGHB0B4+N3MkPJOQVy1D8yy2H?=
 =?us-ascii?Q?7XS4pWIXPPmIc2E9PaYGSpfX2qgspo9lq3J8GkWcsSMFDADX56ZbStuZgqXH?=
 =?us-ascii?Q?srPVS0A6tPhfKqyL7FAmjy4qFoWLcNgiivQPfKTO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b72ed4-8ad0-4c61-cec4-08db30e087a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 05:35:10.8862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJTzLepN/FApNy0f9xUUX7nXq4kiIDK6U1yhiRlTinzN3ONnQ5fSzvFMPNRz5ROIiah/2SRK5mIOqftSt8v7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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
> Sent: Thursday, March 30, 2023 3:57 AM
>=20
> On Mon, 27 Mar 2023 02:40:43 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
>=20
[...]
> > +/*
> > + * device access via the fd opened by this function is blocked until
> > + * .open_device() is called successfully during BIND_IOMMUFD.
> > + */
> > +int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep=
)
> > +{
> > +	struct vfio_device *device =3D container_of(inode->i_cdev,
> > +						  struct vfio_device, cdev);
> > +	struct vfio_device_file *df;
> > +	int ret;
> > +
> > +	if (!vfio_device_try_get_registration(device))
> > +		return -ENODEV;
> > +
> > +	df =3D vfio_allocate_device_file(device);
> > +	if (IS_ERR(df)) {
> > +		ret =3D PTR_ERR(df);
> > +		goto err_put_registration;
> > +	}
> > +
> > +	filep->private_data =3D df;
> > +
> > +	return 0;
> > +
> > +err_put_registration:
> > +	vfio_device_put_registration(device);
> > +	return ret;
> > +}
> > +
[...]
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index 8e96aab27029..58fc3bb768f2 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -242,6 +242,7 @@ static int vfio_init_device(struct vfio_device *dev=
ice, struct
> device *dev,
> >  	device->device.release =3D vfio_device_release;
> >  	device->device.class =3D vfio.device_class;
> >  	device->device.parent =3D device->dev;
> > +	vfio_init_device_cdev(device);
> >  	return 0;
> >
> >  out_uninit:
> > @@ -280,7 +281,7 @@ static int __vfio_register_dev(struct vfio_device *=
device,
> >  	if (ret)
> >  		goto err_out;
> >
> > -	ret =3D device_add(&device->device);
> > +	ret =3D vfio_device_add(device);
> >  	if (ret)
> >  		goto err_out;
> >
> > @@ -320,6 +321,12 @@ void vfio_unregister_group_dev(struct vfio_device =
*device)
> >  	bool interrupted =3D false;
> >  	long rc;
> >
> > +	/* Prevent new device opened in the group path */
> > +	vfio_device_group_unregister(device);
> > +
> > +	/* Prevent new device opened in the cdev path */
> > +	vfio_device_del(device);
> > +
> >  	vfio_device_put_registration(device);
> >  	rc =3D try_wait_for_completion(&device->comp);
> >  	while (rc <=3D 0) {
> > @@ -343,11 +350,6 @@ void vfio_unregister_group_dev(struct vfio_device =
*device)
> >  		}
> >  	}
> >
> > -	vfio_device_group_unregister(device);
> > -
> > -	/* Balances device_add in register path */
> > -	device_del(&device->device);
> > -
>=20
> Why were these relocated?  And additionally why was the comment
> regarding the balance operations dropped?  The move seems unrelated to
> the patch here, so if it's actually advisable for some reason, it
> should be a separate patch.  Thanks,

The reason for the relocation is to prevent new device which would result
in the device->refcount increasing. If the user keeps open device then the
device->refcount may keep increasing. Then the vfio_unregister_group_dev()
may be stuck here. This is rare, but possible.=20

By doing vfio_device_group_unregister(), the device is removed from the
group->device_list. Then user cannot open the device by VFIO_GROUP_GET_DEVI=
CE_FD.
Hence it won't increase the device->refcount. I agree with you, this should
be done in a separate patch.

Same reason for relocating device_del(&device->device); User may keep
opening the cdev to increase the device->refcount. Then the
vfio_device_group_unregister() path would be stuck as well. But this
relocation needs to be done here since user cannot do it if without cdev.

Last, need to keep the balance comment as well even the sequence
it not strictly mirrored. will keep the comment.

> Alex
>=20
> >  	/* Balances vfio_device_set_group in register path */
> >  	vfio_device_remove_group(device);
> >  }
> > @@ -555,7 +557,8 @@ static int vfio_device_fops_release(struct inode *i=
node,
> struct file *filep)
> >  	struct vfio_device_file *df =3D filep->private_data;
> >  	struct vfio_device *device =3D df->device;
> >
> > -	vfio_device_group_close(df);
> > +	if (df->group)
> > +		vfio_device_group_close(df);
> >
> >  	vfio_device_put_registration(device);
> >

Thanks,
Yi Liu
