Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2396B3872
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 09:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6BD10E974;
	Fri, 10 Mar 2023 08:22:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3CA10E970;
 Fri, 10 Mar 2023 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678436556; x=1709972556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PH+IoGLsVRqgfN8DImTy6G1vs4EG9DOPzSKl4CJtO9c=;
 b=R1tbzzuKocX+dfympysFwk/DfW1ks9ROScah4lxfhEV9gIrF1+CFZNzw
 /Yg8TAIKRrOb7daWyjvqOiXkcHm7NCiGahsliHxK9Nf5T2t5Mxe6RZ7r6
 YUOSIeh3pL0+NdKWJZjYCPDS3TzoAiFGmxjE0jbEhKduqUPD3udvyUfDH
 dOFafTQP2huQqqnnkYX2keTHYBL7yD0aRB8bYJLrSxlOBgEmn/b+G5nH6
 l/1Lg9PIm0ftTRcDwX6U102Znq6TczuVyMSF7mta1IB4WIyh/eV22MV/1
 JRj/5EleKT4wujqsR/vom3QRhO5lj2p27e7/PP1ejbltwOu749OS8qSnZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="317070203"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="317070203"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 00:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="655100017"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="655100017"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2023 00:22:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 00:22:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 00:22:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 00:22:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 00:22:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYHiEcCs/3eL6+UjMPeMdGCaln8A9Bj9r4LOK/dQ3FYclD0NYCEl4N9JVaj3KupiHDITLm013lmTZiXwvfQCOLprr/22vJLPy3+gyN3GMyTLTH/9+EJ6tvA/d2PXUnxr4tJtgf2aceJzpS1vG/+ReY5u7p8pHi5Y3eUavwW8oC3TB7R00MZoxFfZSQY0P5z13StjNZmrPH9Z2aCxfuQBF4DaE1LLxEdzBhV4sVdTqPeEXJXN1v2VFF5qC0zkkqU8BnG1c8O8h19FH89OXRHIcCAq2U7v45gY6R/Qibmj5FibB9/q72n8wlggMbz+Yk8r7nbsLOnlUDe8jbbbHfMmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEfZxBzRwRFuwWELxWdvpSDhV4rQhsrxaJTXoJ6Y0gs=;
 b=C3Vk0DncfiVRein3ZlH7sur4Ct2/WpiZ/cHlp4q8r7PgYNRZQUxrLkf5gRVIN0vqdvmRSHjucRIGqN27QP1IvLXxQbpwLxh/dtNdQ23WEb9EfTjkG3EtY/wWKa8QWm4XwAO1JihqLHwwbEGtuZ5Flep/v/jixnPSDERLoB5mD2e2GVS6RYb783D681nNqogwBgjOW+ENhlwAxcrjGorLtnekel+e0uh+Nxgif6l5pDD7hO3yWSgzN0lnFA5nk+UzzRrL2kE0hWQ/6Gvrku31tG8wKr2VhPEg7Mr42c7TbIzUhc83SMowy4G0NHCUKaYejRgFCHP4RHc3KeJ6QIhiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM4PR11MB5535.namprd11.prod.outlook.com (2603:10b6:5:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 08:22:23 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:22:23 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v6 13/24] vfio/iommufd: Split the compat_ioas attach out
 from vfio_iommufd_bind()
Thread-Topic: [PATCH v6 13/24] vfio/iommufd: Split the compat_ioas attach out
 from vfio_iommufd_bind()
Thread-Index: AQHZUcIKwrJK9uulkk+0mMZZcJqffq7zq2QAgAAAf2A=
Date: Fri, 10 Mar 2023 08:22:22 +0000
Message-ID: <DS0PR11MB7529BF46B3A81438DE7A11D2C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-14-yi.l.liu@intel.com>
 <BN9PR11MB5276CF102D9EBB7B447C58FD8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276CF102D9EBB7B447C58FD8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DM4PR11MB5535:EE_
x-ms-office365-filtering-correlation-id: 80bbf476-8c88-4d7b-e94c-08db214092e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j8WOimVghKbFxKebLQdZlNbpJPAooowuQcZiwYZxR7B/3Zxp9qLdGs+Xymdo/xfT7g4Nal7E+gL+om1NMVVAgaclGsoAvJc8JIOBQ0pWPDkmCkrmca4sXJRiFyZaakQQxzfa0L2uf6VP2QZtbTOqBpOgYBNoHZrszPozyab3uq7CYNEQS2wClqykKLCAlg9TMmJ8W/kw8MRHbzoT7eJrXAndVXWwxyb8sjRDpwGskPczKBhD4JlKMuQaNN/S46GW7zDU5Kc8JjBUyZAina2Xd36HWFFr+ePqlLEzGLayGSuU//HHqSvru7/lg05gqz4DD4NmMMLocgiWKIa1iFp+l+7IrTY9IioejJ9Bj5+dpIZleUhvP88bM8LboDY+SI9upeGUrNnYI3Tb+q9L7x2L/DYwmIYNhEq9jSrbbUpedtT5J/5PtJD5d46b4SaIhcpHTZyWHtg7rQTBXjFQWljvd1KfcmtjQQrNPVsiucAQ0spAR8RuHBQR2n10A9atQsDpAV+xUIxfcTVkPa3GeSy0bOXIE+hqsWlrIn8r59NLpU3rTMcHc2jLviHskMYt2h1SNlQ8fb+UKxN31Iiwjqmeu0sfpfRE2U1VFP15fdCqZ5KO/Wl7VE2p+VkTbMAC6Pde15g6dtRC5yf52ZfI/TEBv2N+0w+Tc0bXmcwZzAHMyX/WhCNrbKph91eVR0tQgpZ2e39KEQleMjlBs5CI7ZQRJUbZ7ShyPCQ0n/kof+pbgnAB1m1KVcu8XZKPm4S2nJsv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199018)(38070700005)(64756008)(2906002)(7416002)(52536014)(26005)(5660300002)(6506007)(8936002)(41300700001)(66476007)(33656002)(66556008)(66446008)(110136005)(4326008)(66946007)(8676002)(76116006)(55016003)(86362001)(316002)(54906003)(71200400001)(478600001)(7696005)(122000001)(38100700002)(82960400001)(186003)(9686003)(83380400001)(13296009)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tAUtVOvICNHloZov8eK5+VsnmKIwARNxyPlEHHc4xRrZpqXk0Iiw7IS9hvrW?=
 =?us-ascii?Q?zZ/LIpMLznTDojH9zQXtXKlWkvQqtLZMs7B+fORmAObXUfiR0Kq7jkbZEmBk?=
 =?us-ascii?Q?4ca9VaI3ukOgt799LVglLet9GG+cNhGuSaV+D9hLQPacR5nJ3pRg/VXgTQKr?=
 =?us-ascii?Q?1U1N14uCMQrm14MUbfchh8kk3aELRg1w6rCSzkf0O6j0Oc/4++njx/Nsw/ps?=
 =?us-ascii?Q?t3XI+yhRR7bDNQupPtAdPlSgxoenZAuUkmhpli+sSxUiDa6pnoEivpUWoMrS?=
 =?us-ascii?Q?siFavgrdoYHPXfQfXl82Z70Q92v7ngk9Ja1ZYSSu/WPDk+zh/A0Jt0OULQAw?=
 =?us-ascii?Q?b9D3yb+I/QJDAClrt511D/BKRCKYtN31oZRN3OO0o0gRKWLPSU8bvNsjFtvN?=
 =?us-ascii?Q?6HBmkCHM/4PNohpVj1R7tlzfIHJA0YMf1kdb/UWWjF96G5QJkUn3c3aUC4mP?=
 =?us-ascii?Q?peQeVD7uiOI8beTI32s0vB3w8KB+TRLx7YeCZdAGLYkI0g3MltbLrRG8rxhp?=
 =?us-ascii?Q?S4S5mhCWHTglJaYUtpaX061XXeCJ8th+yj+t9CM09u2YyTsGktA0uyx3WzlN?=
 =?us-ascii?Q?MwFChqa2e7LQbRBcgJU1ARcV1vr5FYzt30rWSwyECu1Dqdw5QSFP+oAMrQEH?=
 =?us-ascii?Q?OLMYh95NRejfWFdlA7OpfYUbTfbiTyjVVwyAqJTvPV/7uDLELDkUz0OUvJkK?=
 =?us-ascii?Q?0IgnzKALDZHfodYKD3nTjS9GdYr14eqlQYT8rKTyuXgE+3kigoNjk5xoPtPJ?=
 =?us-ascii?Q?Hfhj4kLlHOPGEXdBE1IlHeiLxXXhWex6aJGqaw9slsE7kxoqSeNMW2U+nPlv?=
 =?us-ascii?Q?5J5YD3SY2I+38h6zszdJ9tcVCgJ/VkKGX59Iw/ma2dxdFMa1VO9ecnwsQEt7?=
 =?us-ascii?Q?zUfraU3/0wU7ldClW1m7wjpzhb7BWLpKvM53eVxJryPQTMO26di5uHey0RWq?=
 =?us-ascii?Q?g1uirVizxJKRkViAcI2jbTXxIXFCst9dEO6POXu412vF2dkmNnoJDX3X9lc1?=
 =?us-ascii?Q?xcJdDyk0aCrzvRFbrpFFpRkAOJOgyB8wCIC19EPo/MwKZ8KXCHDzhcMlIVxF?=
 =?us-ascii?Q?DvsfknH9tPYtowMbzm+SIbofh5adyiEmwZOFAacC5lMjMrJCF6PddZPnqwQQ?=
 =?us-ascii?Q?dUvRf9OLJ3vE5Bs1617RpYp/609oV/DueAikzZ19n38NRXdwnzhFdHBhrved?=
 =?us-ascii?Q?vhJ7rK4sLqEYQA3BZzOSnZKhrVsFVWU7cycCt2a187g4tsbogz1kYaGUKFBD?=
 =?us-ascii?Q?xi23CNQpVRRUJMtxB2WmQqbQAXC2fsaZbw078tH1+VkaIND3Xz5gM/OdNo2v?=
 =?us-ascii?Q?h02BtWU/peMfXLhY8DtIIxlod1A+jEPJFYUcpUvJaQRtH4Q5x4S/ehzgwipA?=
 =?us-ascii?Q?ZOm0o4JXGDZW8pvBwMAFmasQtHnfzjEbJJ3CypHh+rmDYDj9rxrNsNNiDu8q?=
 =?us-ascii?Q?C8uB7md602rAtyHbPu2pF4JSnfzi1Xg785AOYG1rYaFD790z3kE3WDx+rQna?=
 =?us-ascii?Q?axI0lvFF1AJoj8b1T300gKAjg5QeV9tQpta5w2jvTIIVXwhJBtc9YOe1S2dN?=
 =?us-ascii?Q?iZYaYd4QZL6sd6pkbDF72NInkgTB4qT3YT0RK6ik?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bbf476-8c88-4d7b-e94c-08db214092e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 08:22:22.8647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lakZvYVyB9jac/TADxyI8KHxT1fCejgMHeWFCqF4WihuesGQkXnMBLPRpN+FCfKoTApLknNsTulGxtVSskUfVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5535
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
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Friday, March 10, 2023 4:08 PM
>=20
> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Wednesday, March 8, 2023 9:29 PM
> >
> > @@ -177,7 +177,7 @@ static int vfio_device_group_open(struct
> > vfio_device_file *df)
> >  	mutex_lock(&device->group->group_lock);
> >  	if (!vfio_group_has_iommu(device->group)) {
> >  		ret =3D -EINVAL;
> > -		goto out_unlock;
> > +		goto err_unlock;
> >  	}
>=20
> My impression - out_xxx means go to do xxx while err_xxx means
> go to do something for error xxx, though in many places the two
> are mixed to both meaning 'do xxx'.
>
> either way I don't see a need of changing it.

Ok. I'm fine with either way.

> > -int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx
> *ictx)
> > +static int vfio_iommufd_device_probe_comapt_noiommu(struct
> vfio_device
> > *vdev,
> > +						    struct iommufd_ctx *ictx)
>=20
> s/comapt/compat/
>=20
> btw it's clearer to move this check into vfio_device_group_open().
>=20
> if noiommu then pass NULL to vfio_device_open(), same as the cdev path.

Right.

> > +
> > +int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx
> *ictx)
> > +{
> >  	u32 device_id;
> >  	int ret;
> >
> >  	lockdep_assert_held(&vdev->dev_set->lock);
> >
> >  	if (vfio_device_is_noiommu(vdev)) {
> > -		if (!capable(CAP_SYS_RAWIO))
> > -			return -EPERM;
> > -
> > -		/*
> > -		 * Require no compat ioas to be assigned to proceed. The
> > basic
> > -		 * statement is that the user cannot have done something
> > that
> > -		 * implies they expected translation to exist
> > -		 */
> > -		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
> > -			return -EPERM;
> > -		return 0;
> > +		ret =3D vfio_iommufd_device_probe_comapt_noiommu(vdev,
> > ictx);
> > +		if (ret)
> > +			return ret;
> >  	}
> >
> >  	if (WARN_ON(!vdev->ops->bind_iommufd))
> >  		return -ENODEV;
> >
> > -	ret =3D vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> > -	if (ret)
> > -		return ret;
> > +	/* The legacy path has no way to return the device id */
> > +	return vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> > +}
> >
> > -	ret =3D iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
> > -	if (ret)
> > -		goto err_unbind;
> > -	ret =3D vdev->ops->attach_ioas(vdev, &ioas_id);
> > -	if (ret)
> > -		goto err_unbind;
>=20
> after noiommu check and attach_ioas are moved out then this
> entire function can be removed now. Just call the ops in
> vfio_device_first_open().

Yes. and also no vfio_iommufd_unbind().

>=20
> > +int vfio_iommufd_attach_compat_ioas(struct vfio_device *vdev,
> > +				    struct iommufd_ctx *ictx)
> > +{
> > +	u32 ioas_id;
> > +	int ret;
> > +
> > +	lockdep_assert_held(&vdev->dev_set->lock);
> >
> >  	/*
> > -	 * The legacy path has no way to return the device id or the selected
> > -	 * pt_id
> > +	 * If the driver doesn't provide this op then it means the device doe=
s
> > +	 * not do DMA at all. So nothing to do.
> >  	 */
> > -	return 0;
> > +	if (WARN_ON(!vdev->ops->bind_iommufd))
> > +		return -ENODEV;
> >
> > -err_unbind:
> > -	if (vdev->ops->unbind_iommufd)
> > -		vdev->ops->unbind_iommufd(vdev);
> > -	return ret;
> > +	if (vfio_device_is_noiommu(vdev)) {
> > +		if
> > (WARN_ON(vfio_iommufd_device_probe_comapt_noiommu(vdev, ictx)))
> > +			return -EINVAL;
> > +		return 0;
> > +	}
>=20
> no need. let's directly call following from vfio_device_group_open().
> In that case no need to do noiommu check twice in one function.

Ok. maybe still have vfio_iommufd_attach_compat_ioas() but
only call it if it's not noiommu mode. vfio_device_group_open()
can call probe_noiommu() first and has a bool to mark noiommu.
Jason had a remark that it's better to keep the
iommufd_vfio_compat_ioas_get_id() in iommufd.c

>=20
> > +
> > +	ret =3D iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* The legacy path has no way to return the selected pt_id */
> > +	return vdev->ops->attach_ioas(vdev, &ioas_id);
> >  }
> >
