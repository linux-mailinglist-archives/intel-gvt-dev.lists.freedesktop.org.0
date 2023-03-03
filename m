Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D56A91A0
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Mar 2023 08:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31210E032;
	Fri,  3 Mar 2023 07:23:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6877410E032;
 Fri,  3 Mar 2023 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677828202; x=1709364202;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cixJjRIyZbtQlXNGPRZe+t8xPRfriQNqEOkT+2jWPVQ=;
 b=l9nNY7VBDQmkgC8ShYR1eV+04wQfut1S2Vw1KspQOCicoA7GTiJdKov8
 NpSbVU5jBB42FFcZ2bICxnn0su0N0J06+cTJV0pBPrJDtsLsibIT7+kdp
 IVTH6Bf5RstcVWaDJFqDYd7V9tiKrKbrkWSJpfB/cs0z4qosDwWywyh35
 BxWqHtVeRBNZlbN4v4zBVdF6IuaMLPjlINcUptGkAWirRJak59ioHJwja
 PdYjxDwVmMrL3IvVJVfESlUTLgkWD82lM6ZmRCI8iM3QrtfQuFbxrj4t0
 f+6FEa6Wp6salkFNFq31WUh2FUa4qBUWvYpHC3qa7AEY9h0IRUmdqDc+J Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336497002"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="336497002"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 23:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849375792"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="849375792"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 02 Mar 2023 23:23:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 23:23:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 23:23:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 23:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4RUqE5gqsyme5c/MuEt8qp8FoepnwgYI+/UGP4K3IJIL/+fTTI77F0ipYl1mGL0ZDVKyemV+5x3dCk3eecEFMVdlsyvTyuFUOusoKfGInkJtu+7mQIKOuplIKIls83+TXVsjt2mHR876jLZtVFtsw5DobCWIOWXByT3yt0LWwmcBBa8y7IUzayGpYZb09c4w37dcAmAv7e8vYpebXCdOpdsUam16uHtpAiLKy6ikxYHWBVU9suPwyqhVBDSpbVZNwERBlEzmChW35oShsBwLuomuUc2egvBHsdPWQT2sPt9mwGcktnYs97b4lIWhLj6E1TJ+LFbWcR39WC+1fyqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoI2AcnP203EgaG06qFVdOQe0x35C30aQRYG8X7++zs=;
 b=FcH4rzi7IjEDHEfpIOtIDskM6KNmE0BEhIc2ZHQfHU/vFnOT4AS7Bps86gZvDPfSZlcTJlOb5XkkN1/JhXxv/2LUCNXTKfWmX6U9klNM2WGoM+OZNb0X3Qnno43pjk6KtXzoObErlrCIIjhvU+5cMcjptIKSgP/vgsyuTi6Qca0LxQLrSgcHZdG0PGVMZ/bMcoCnsLOa6X88PPW2uG/HO8CnkSR+xsjvmAx1Dn3Lf9O8c/ALx3Y31JKc/q4O4gLBJgsv4yKdVf8RCFM1yoxn39HVhVjsUGi7NJaQeb+41pER4QhV1zDfDLOKF5RLxzgskeisdSaMpZd5v1KZOVCWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 07:23:12 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6134.030; Fri, 3 Mar 2023
 07:23:11 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v5 16/19] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Topic: [PATCH v5 16/19] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Index: AQHZSpxP1elsXPP8bE2Y+PYEE7Tlg67ln1gwgACXEYCAAlTioIAAILaA
Date: Fri, 3 Mar 2023 07:23:11 +0000
Message-ID: <DS0PR11MB752988DFFD4C81700CF45BA6C3B39@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-17-yi.l.liu@intel.com>
 <DS0PR11MB752959193D5CBA2A677B1F18C3AD9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <Y/+Pkbtr8KQmUjVp@nvidia.com>
 <DS0PR11MB7529E16DC2B558E8476D835FC3B39@DS0PR11MB7529.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB7529E16DC2B558E8476D835FC3B39@DS0PR11MB7529.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DM6PR11MB4563:EE_
x-ms-office365-filtering-correlation-id: a5820f83-32d3-4c2a-9f34-08db1bb82515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UY9oXOdIzIoIEL951EVZA13sWCdnLi9FQl2/uMw6BFw/yerd5Q2Xd+9JyIToVVk2X0WCq19XHAkLBNvozB1ont+26i76uDn5gMm2cLl/k/gMT3B7zpF+xSTcHjJNP3LWz1jWwqy269Z6qIpGqHcf4u4rksAmcNLyIRyYkG+zSgD1H4gxmPgUUvW2MWnGlMqstJVrpeagW+Sr16eXMe7pBTTM981pDQXMEY8Bkcj5dUSyMJFfUZ8AGBN0IIQtzOLsvTFV/5tVXs2+3U+QYw0od+9+KqhT1MR3CQX5weeZQbbXRbCtkv5PulVdfFe7KFddYf7A0vur7ce6CMrw+TuwLDfcDnHuyPDn0w3O1fLgEqfwQYWBLdvvf7QSsZ5dwIm5Kvk873GWAwE/U/+wYAEezs3ZO8xljvmf1VzEbftiXqNXgbACG99uJuV09cHuayY/ymSpuIe6nFA4GmvIDzrdRQR/BGdzGJ8x7Nzi2vswW5DTkm3uNjLg5ShaQ7bZ55dKYVczl6QHs+Dmfxw4Dj+0D9rd9K0W196Rl5tCCzodkJtCkpZU6G2gud7uy3WlD68n69/s9Z9+acCDnYKmdbRZ8Kz3yi0dv/pDpfXAIby3wRKcoSvpEZ9tRqAxU4sWK+5/q/qucz92fQ3HcRqJKfNaLv/PPI1lhbmAiollzXRDciWb5KCKCdBqsHN3QyOyjh6//f/89BO1uSMiu6LriBDSWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199018)(83380400001)(33656002)(38100700002)(122000001)(52536014)(5660300002)(82960400001)(8936002)(478600001)(55016003)(66946007)(7416002)(86362001)(38070700005)(71200400001)(26005)(66556008)(186003)(9686003)(6506007)(316002)(7696005)(8676002)(66476007)(76116006)(64756008)(2906002)(4326008)(66446008)(2940100002)(110136005)(41300700001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rIRfsSpEdaNe7vrkOXQJqhPsU/WTGr5wxjKH0OK0MHuk2N7UoO9Gus/PiSeb?=
 =?us-ascii?Q?mcuCW58fDd1kHpUA9sdVPAsiOK/vKbTSA2wTIP1L1mwco9gy6aU3Xf3q5/9h?=
 =?us-ascii?Q?4O6r0ThIxW6+xTfwGFs5Gwi+ZIs+CWw7E4QpjttmIyrlAXBa08uTUYpsFJPy?=
 =?us-ascii?Q?DOPQqTEpVIHGYmzMwOYJccelwJdHevLPUr6bgv0xvF503VCemGSdwD8wSRbb?=
 =?us-ascii?Q?BFGkYz2U7PHHRLqwPpQn1VIFvtDKYio6XObPMibu4e1o8eNBv+QZS77OCI7G?=
 =?us-ascii?Q?C10XcwsxXgof2bHO9kFKJiBfwStxyitj/yCMxrlNl+zcIK8zmPwVihFcD9Ep?=
 =?us-ascii?Q?wIvvlPuPuyQg15PjRBqVMk/AuzxSyTywOU9YVOJRm8AFnPW/T49ozMgoab3p?=
 =?us-ascii?Q?lAxtQpnfyO+zNPQJcC/oifVNkBo0biRwvlr1rbbQsQzNNCYiQrQOB6802m7o?=
 =?us-ascii?Q?iuHLCejRnFz0fusikpitBa6wHMjGVQ3BmSsHWkDzou2UHhVEnSBTQ/sbLolI?=
 =?us-ascii?Q?EaAkw+itEWp4gdu0MvhFPjknPYUEU4RDcBYAcHeeonyCoXehUH4YWXIoa1ra?=
 =?us-ascii?Q?PIB9N+DotdlXauNZSMN5TQxXHQEzkCjDjCylZ16OPqxs+hLW/g6iZWAPUf9K?=
 =?us-ascii?Q?LCPQbgaipadg959cqb0sBn5gU8j8YOCWvvkvELPj7MUQj8fQJXd7XPE2Z3B6?=
 =?us-ascii?Q?isYk6AtW7hIXbjzWvF0vHUpYP3fkdas2Wx4RZmSW5HsMhzKHEU3GU3Tm0PrY?=
 =?us-ascii?Q?mOHjcuGUslz6jVZ8gLqW3UlMZEaVqIcPuIaFDvI45yGeE48Vvm9EXmnWXgL4?=
 =?us-ascii?Q?7VzZZH6s79ft1W9BV7rfwT2/7ZBOXxxVIbPNY+wB0i4DoqLzJDn1znuceCfw?=
 =?us-ascii?Q?Alw4xhxTmkqZKk2pHcIT3P1r/mVEouF9dZrmR1G3prx9S9oURyL/FQ2I7R0R?=
 =?us-ascii?Q?mTUg38IfanQXa1X7T2s6mZoiZeBFNxeuPG39eoz7RinA5PB7T0Fozxr3XCHF?=
 =?us-ascii?Q?ttgpIvqA45ck4FsC0ms7QenQGbwExxlVL80KqHTsRA2xx15EtDSxIX4vV8TV?=
 =?us-ascii?Q?fYKK74YDOSMDoU6jEPuPcuacLzX0cMbj6Z/ijxJSrBHDPt6DBfR/CdqsvZKz?=
 =?us-ascii?Q?V6DL+BKePOf0J6A1TLNEvRmnZkG8i/HQOOO+PTXSr1H9dhO08037yIYbWSho?=
 =?us-ascii?Q?okcj2LOS0opZTzncoCflTvgzLrBJMfmpdmiHNbutGCvybKOfHkJUite2mZLy?=
 =?us-ascii?Q?Dk8kRDfn3pbapn3pk/zgw6k36RZ9KXkzUW89n+IVXqf8Tr1fWwvtsKl3My+l?=
 =?us-ascii?Q?7YlYmehXcpnN2ycYGQJsB7PmPRAFyF5sDZVPES3R/Z7YpoexuE2FfmpmHg02?=
 =?us-ascii?Q?sjtPrUxLhUT2X8JIbNsDwSAqcvqm+40zw83T1k9Lmb3Tix+pn1SSTd2Rmlx6?=
 =?us-ascii?Q?BioHVFZLSo5HjfOsZx5F94ibiyRq5wBb8QecXiqpmRlKLyZIRs83J0Rx5vwV?=
 =?us-ascii?Q?T9XC562GjaY5AtYzexfCy153IwhTAaUD98k/4U6CRxF7u6qBMWudFBLfU7Il?=
 =?us-ascii?Q?TGwLuWbt2Dhx4BreiIiX91lgZRxxR5z/+USR5VA3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5820f83-32d3-4c2a-9f34-08db1bb82515
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 07:23:11.3007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDGDea1dShmWz66eRNLJv2Pz1nPO/zdcKQdzLHN/SaJRiz4acMxLq2yLBpFQnKPHOTICSgH3ff/GH7lLgOQmDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Friday, March 3, 2023 2:58 PM
>=20
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Thursday, March 2, 2023 1:47 AM
> >
> > On Wed, Mar 01, 2023 at 09:19:07AM +0000, Liu, Yi L wrote:
> > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > Sent: Monday, February 27, 2023 7:12 PM
> > > [...]
> > > > +long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
> > > > +				    unsigned long arg)
> > > > +{
> > > > +	struct vfio_device *device =3D df->device;
> > > > +	struct vfio_device_bind_iommufd bind;
> > > > +	struct iommufd_ctx *iommufd =3D NULL;
> > > > +	unsigned long minsz;
> > > > +	int ret;
> > > > +
> > > > +	minsz =3D offsetofend(struct vfio_device_bind_iommufd, out_devid)=
;
> > > > +
> > > > +	if (copy_from_user(&bind, (void __user *)arg, minsz))
> > > > +		return -EFAULT;
> > > > +
> > > > +	if (bind.argsz < minsz || bind.flags)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (!device->ops->bind_iommufd)
> > > > +		return -ENODEV;
> > >
> > > Hi Jason,
> > >
> > > Per the comment in vfio_iommufd_bind(), such device driver
> > > won't provide .bind_iommufd(). So shall we allow this ioctl
> > > to go longer to call .open_device() instead of failing it here?
> > > I think we need to allow it to go further. E.g. leave the check
> > > to be in vfio_iommufd_bind(). Otherwise, user may not able
> > > to use such devices. Is it?
> >
> > You are thinking about the crazy mdev samples?
> >
> > We should probably just change them to provide a 'no dma' set of ops.
> >
> > > > +struct vfio_device_bind_iommufd {
> > > > +	__u32		argsz;
> > > > +	__u32		flags;
> > > > +	__aligned_u64	dev_cookie;
> > > > +	__s32		iommufd;
> > > > +	__u32		out_devid;
> > >
> > > As above, for the devices that do not do DMA, there is
> no .bind_iommufd
> > > op, hence no iommufd_device generated. This means no good value
> > > can be filled in this out_devid field. So this field is optional. Onl=
y
> > > for the devices which do DMA, should this out_devid field return a
> > > valid ID otherwise an invalid ID would be filled (e.g. value #0 is an
> > > invalid value in the iommufd object id pool). Userspace needs to
> > > check if the out_devid is valid or not before use. This ID can be fur=
ther
> > > used in iommufd uAPIs like IOMMU_HWPT_ALLOC,
> > IOMMU_DEVICE_GET_INFO
> > > and etc.
> >
> > I would say create an access and harmonize the no-DMA devices with the
> > emulated devices.
>=20
> How about below change?
>=20
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 4f82a6fa7c6c..e536515086d7 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -18,12 +18,8 @@ int vfio_iommufd_bind(struct vfio_device *vdev,
> struct iommufd_ctx *ictx)
>=20
>  	lockdep_assert_held(&vdev->dev_set->lock);
>=20
> -	/*
> -	 * If the driver doesn't provide this op then it means the device does
> -	 * not do DMA at all. So nothing to do.
> -	 */
> -	if (!vdev->ops->bind_iommufd)
> -		return 0;
> +	if (WARN_ON(!vdev->ops->bind_iommufd))
> +		return -ENODEV;
>=20
>  	ret =3D vdev->ops->bind_iommufd(vdev, ictx, &device_id);
>  	if (ret)
> @@ -102,7 +98,9 @@
> EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
>  /*
>   * The emulated standard ops mean that vfio_device is going to use the
>   * "mdev path" and will call vfio_pin_pages()/vfio_dma_rw(). Drivers usi=
ng
> this
> - * ops set should call vfio_register_emulated_iommu_dev().
> + * ops set should call vfio_register_emulated_iommu_dev(). Drivers that
> do
> + * not call  vfio_pin_pages()/vfio_dma_rw() has no need to provide
> dma_unmap
> + * callback.
>   */
>=20
>  static void vfio_emulated_unmap(void *data, unsigned long iova,
> @@ -110,7 +107,8 @@ static void vfio_emulated_unmap(void *data,
> unsigned long iova,
>  {
>  	struct vfio_device *vdev =3D data;
>=20
> -	vdev->ops->dma_unmap(vdev, iova, length);
> +	if (vdev->ops->dma_unmap)
> +		vdev->ops->dma_unmap(vdev, iova, length);
>  }
>=20
>  static const struct iommufd_access_ops vfio_user_ops =3D {
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index e54eb752e1ba..19391dda5fba 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -1374,6 +1374,9 @@ static const struct vfio_device_ops
> mbochs_dev_ops =3D {
>  	.write =3D mbochs_write,
>  	.ioctl =3D mbochs_ioctl,
>  	.mmap =3D mbochs_mmap,
> +	.bind_iommufd	=3D vfio_iommufd_emulated_bind,
> +	.unbind_iommufd	=3D vfio_iommufd_emulated_unbind,
> +	.attach_ioas	=3D vfio_iommufd_emulated_attach_ioas,
>  };
>=20
>  static struct mdev_driver mbochs_driver =3D {
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index e8400fdab71d..5f48aef36995 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -663,6 +663,9 @@ static const struct vfio_device_ops mdpy_dev_ops =3D
> {
>  	.write =3D mdpy_write,
>  	.ioctl =3D mdpy_ioctl,
>  	.mmap =3D mdpy_mmap,
> +	.bind_iommufd	=3D vfio_iommufd_emulated_bind,
> +	.unbind_iommufd	=3D vfio_iommufd_emulated_unbind,
> +	.attach_ioas	=3D vfio_iommufd_emulated_attach_ioas,
>  };
>=20
>  static struct mdev_driver mdpy_driver =3D {
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index e887de672c52..35460901b9f7 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -1269,6 +1269,9 @@ static const struct vfio_device_ops mtty_dev_ops
> =3D {
>  	.read =3D mtty_read,
>  	.write =3D mtty_write,
>  	.ioctl =3D mtty_ioctl,
> +	.bind_iommufd	=3D vfio_iommufd_emulated_bind,
> +	.unbind_iommufd	=3D vfio_iommufd_emulated_unbind,
> +	.attach_ioas	=3D vfio_iommufd_emulated_attach_ioas,
>  };
>=20
>  static struct mdev_driver mtty_driver =3D {
>=20
> > What should we return here anyhow if an access was created?
>=20
> iommufd_access->obj.id. should be fine. Is it?

btw. It requires creating iommufd_access in vfio_iommufd_emulated_bind()
instead of in the attach(). Seems like Nicolin's replace domain series has =
a patch
to move iommufd_access creation to the bind().

Regards,
Yi Liu
