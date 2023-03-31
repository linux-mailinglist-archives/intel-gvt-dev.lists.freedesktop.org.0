Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E626D26A3
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 Mar 2023 19:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F0710E231;
	Fri, 31 Mar 2023 17:27:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32010E23F;
 Fri, 31 Mar 2023 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680283666; x=1711819666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iLGOFdnPhwB0g1FK1uxCgnnNZuIayKj1kL8QHp+fNAA=;
 b=D6FrpZbWUkUs3r+9s8umDco4ci2CoLaI58DfVM46gN0FCRIySWlT4nd/
 eoWkkLPEHLB4oDVsKVwOfR9J5XNJaJqrMvpr83QO/rP3Ssg4UWxpx+Onr
 xuSnSKmjrBcAUVL89LRFxS0Z5I2TYgOnSVHeT7+VTjmxGVPdjYXM1ZdnQ
 n9VQ+x3UvE31Zq/t6nRWRYlPagxnD47x+gCQeEo/IZyjZMagywtwcrJ/Z
 q/t+2PHsZjegQarphzvkOOwImC1ABqJbuRJyUPD0NT9FCKydsHqA1qzrE
 fo6nQIwg4Q96TRj2i4OkAKu83z6r9D/9XlXkNjYqmKiwXm/X32eMlTNjj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="369310587"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="369310587"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931269823"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="931269823"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 10:27:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 10:27:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 10:27:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 10:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7l84qbqqbQFpe0HIyiwGpT6LZgYs+Fe238F5RUBvHWnSl0Z/xpOnHoISpyu6yoUzPKhmHsgGBqqwxcMrPW0/eVnirRZ4dMUd8ypWUbxF/r2Rhl51/gBT6TziKFyr4hi3B8pUmZVtDheJPFgY52UwzKx4/2iAMQArb1D0p8V6UEI4w92yx6XsTv2RhCu17IlSvUWxQTh4wL8rb/5ttR8rPlpmAlszAi3/VPaT6JxVq4C8AssxPrgl/WtcKZxfJqHXj4Lky1HEClvuEnmtAyLAjsVRk0xZ7/07BCkiC+KBJX3arkEcfd6yzVEF/4F2Rrp+JfEaJNC93QUA32WoeZFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0vG8eIrLNYOPkwq0+2qGKWX1v7Q2W8fP36YkLjNkyM=;
 b=YIS7IbcadOiuadrGz0fO46fTeKadUPWPFQa/fuQqBh/gJsd6k9Ba5JDziX+CVKkSpQuN9BtEa5h41JDVGIUCzZwwAOvvjLD1769J4PFB1chu6uw0Clrizn4A9ChS0bhK5HkYlBFjojOmueAGDVy8S5LZrjLwJDhQZ9UTA0cT51H1zMLW/F7vAFxqN+MJf3wkmVQTAHZvHvxYH3OyUkC91yUeZK4+VWo3GUmtcNpBTf5DsoA7x3WDPFps1jXOkaB9kmDuSK32VaYJMyEdtujJwJf28iMNlINX1tB86kBa5UfIa2oS9fGPS6MHTsq0jBl5fQmjtekT7MZOUyCPDsJxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 by DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 17:27:28 +0000
Received: from BL3PR11MB6483.namprd11.prod.outlook.com
 ([fe80::15a1:856b:dd83:f4cd]) by BL3PR11MB6483.namprd11.prod.outlook.com
 ([fe80::15a1:856b:dd83:f4cd%7]) with mapi id 15.20.6222.035; Fri, 31 Mar 2023
 17:27:28 +0000
From: "Xu, Terrence" <terrence.xu@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>
Subject: RE: [PATCH v2 00/10] Introduce new methods for verifying ownership in
 vfio PCI hot reset
Thread-Topic: [PATCH v2 00/10] Introduce new methods for verifying ownership
 in vfio PCI hot reset
Thread-Index: AQHZYI9oWImAx545D0iJr2HHlwsM2K8VKfOA
Date: Fri, 31 Mar 2023 17:27:27 +0000
Message-ID: <BL3PR11MB64830DC9AC0517B56667532DF08F9@BL3PR11MB6483.namprd11.prod.outlook.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
In-Reply-To: <20230327093458.44939-1-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6483:EE_|DM4PR11MB5389:EE_
x-ms-office365-filtering-correlation-id: 26ec183c-b925-4256-9734-08db320d334c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5D5tz0mtBXpSzBfDHtpHvtf3ISERSa8Uo1Ejm6fhRzzGWVBXlqfcFZa7y4v89CHSTus7cPXw4w9vnalkcIiYBoKgf6GBXNEwcuWrJnQDytYwG5dQUS6ZJrsAkMQM5ItyslJNRYYONf1UvEvn80aMgQ4ts94tNIGj0/15iRAr4gpo8Qt99Bra0YC/e0ZW75O2Y9n05wL/SWOFbTFH+pUmKruAVo7PK0Bq9BhrofEALPXRgQ2rwsM16qaHiTTglRlJ2L5QgrMO+ljABhONFhW6BE3Rm7zk+CTtV4t3FS5RB9zFPZpi2RO+uhjLDPVjbjtJJEmpf+RgiNrSgshb8gZB7KNqFq6KMmzLcPK2GiVSiioXEiEgN+0buLuMpNcus2q26imqwAN+tG6klgK5SNPVV3mWmYV3XARhQdOG6OXoO6NKYSPTJYsXSeoF41K90uh6MSidWncQGJSxVaE0stRB+MoB7aB9zf5yvn3iiGjWErVtEr22kLLYrQkTNdCK2iiWLDt2L5t+3W/YmVNMB6VaWfWee8XNJk9REpQ0X3ZnIjbkBT8CQhM6JLvQbli6u7bXkcZdZSXh86tGvihDDxrFeLg/iregyodV0nzXOIgaRFelahrmHJYg3ynyDOclHSmkQ8MkxRKnr19aUkfnd4uv5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6483.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(38100700002)(966005)(122000001)(82960400001)(83380400001)(9686003)(6506007)(186003)(55016003)(52536014)(26005)(2906002)(15650500001)(5660300002)(7416002)(8936002)(33656002)(45080400002)(54906003)(71200400001)(4326008)(478600001)(6636002)(7696005)(66946007)(38070700005)(66446008)(66556008)(8676002)(76116006)(66476007)(64756008)(41300700001)(316002)(110136005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A+BLSZK+LZNs9ArhaMrdI60gfTKS+FZOCdFMh1oABJa5mhpNdsTHR+n1DbUi?=
 =?us-ascii?Q?jJ2dyrW12L6xLyp63AfUoKj2/6BHa6zTAzcCCzH7ZNqAF/f138jrTDoBwuJA?=
 =?us-ascii?Q?+8tnMF1F0VtJQmEiurb7KbHPa4SoXva6hsZSj3Ce/b62UckNa9dGQwz9G4lG?=
 =?us-ascii?Q?6//Fi/lNb1PwWPstDDSMCzmI1i9SE1RH9oL1fQOmMGr4w7erkDG8eUKKYNey?=
 =?us-ascii?Q?JgU5v//bL3uorG5QsVognuLHTpZYkp6gIlStadNKqwObw+8JJ9QBf3a74gDG?=
 =?us-ascii?Q?32YSp45VOQSzE+VlJkBtcF3QINzAW8/ndROUdwjmHpH6+/fDZe8ra0rxRoOZ?=
 =?us-ascii?Q?RyXltfyS0WLSIclotLFAZwCInbw3U0uIc23u2Okj26G56Dv2jJMUPo/fuCWk?=
 =?us-ascii?Q?WdWnsVlewamI39t+x0ggA5WZOhEs8aA1s927Qc/bU0bLc/WZizI/adZIviao?=
 =?us-ascii?Q?oxPJbVlNhUIfIyVsTac3BcLqp2Fl6DlBl9D/ecgKB7NTQghOcligWDqOhwGQ?=
 =?us-ascii?Q?Ip3hHs35hi6/exIAFTv2FDcZUK0pRvcywgEZwYfmf9hn7uSj6XMPz5MDTMqg?=
 =?us-ascii?Q?JR+yO3snx+aBB/bspYYfNV8nwCj9Il18rgH1sE+yMe4m7exLWjP6yNHKHjiA?=
 =?us-ascii?Q?GN/3HyvbQ6BUcprlFw8rDpZNQuaDEEYAHELUqzHxK4t9uIyuZ6ZDxMC8m8mM?=
 =?us-ascii?Q?qg3OSYZp5j22wadiz1NMiMqF7CZuQBUMoGgQG+kqhDieO6WUwt7uaWd11inT?=
 =?us-ascii?Q?tPUcbrilPia4SyyjlHZx/ew92A/WWuUax+Ui+gO9/0ggSJqD4KeU3hIoM1Ge?=
 =?us-ascii?Q?hwze79xz7uv3Sd5BxKS6IqjaCmSH2+RLDU5d9wiLCHFvaIhGrhs8QAihCTLj?=
 =?us-ascii?Q?GIvEHErjXFe7IXRJi/8IxPW1zUi+0TRJMApCsnjR6I4zem3JtmokzzT4coBl?=
 =?us-ascii?Q?01KBS3h/W7z1lzp0CeT4AYQ6UXasK8YlMdJljLPYMOCA54VfsmC+DRKN7v59?=
 =?us-ascii?Q?yxbUA48F+zfp6yzjcbS/XPzBKBiSrA+zf9DsAlumIvH/h9PM9y4KaOxOZz4P?=
 =?us-ascii?Q?FGgquAW+4E0kqBk+VlVbVS5L8XtTrfhSjBJO33/yMBycWBg1R9LQvTu1YNos?=
 =?us-ascii?Q?XKnf77IqVvCpr9SSWkGA7TStDz+qz3weuJYj0oA6AQHKFYjmljRJqe12F6Eh?=
 =?us-ascii?Q?A3FACbBBG02WeZtaDsZjQoimbkXu2Ln414ZmyJx4SjaVtL4rAhh+srNGvNli?=
 =?us-ascii?Q?H6IXcL6HTM/SveL0ASJU6Znwd7sCVyt5zNV+5SjFw53hKFdi9Sy5UWZIzcIk?=
 =?us-ascii?Q?V1wPVqvWXfCx1zzwh3dIsHEKUP5nwpK0Q2H95MdewfyUz8rJD/K081mOcfiu?=
 =?us-ascii?Q?MXaXVQSlY7mdowOsqYp1tpQ3hNnxBlmGhwaen8FKwHbeuW7XhPXdUy91tL2o?=
 =?us-ascii?Q?8ugBaU3kVa/G1nOpJMwYnwdl7JFXQ2Az6TdHoB0Jid+tIZYJiti1e+7IUVKT?=
 =?us-ascii?Q?calnU1MxpVnO1eLLLLj+hMCeAFCRt0AgQ0fKpKEbnm7ZxxFnN3jEhufJTE2Q?=
 =?us-ascii?Q?FCdcj7ePaUoC7A4EUwexGS4rrcwZCi880RsFjl4B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6483.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec183c-b925-4256-9734-08db320d334c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 17:27:27.8978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z48bojpRTrpoS7B4tT/q6XEX092AmAoojgltxpwAZm7B11Ennoc1NzBDOqY7uKGRuu8B6n2V4qnwf6QfGRZDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5389
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
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
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


> -----Original Message-----
> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Monday, March 27, 2023 5:35 PM
>=20
> VFIO_DEVICE_PCI_HOT_RESET requires user to pass an array of group fds to
> prove that it owns all devices affected by resetting the calling device. =
This
> series introduces several extensions to allow the ownership check better
> aligned with iommufd and coming vfio device cdev support.
>=20
> First, resetting an unopened device is always safe given nobody is using =
it. So
> relax the check to allow such devices not covered by group fd array. [1]
>=20
> When iommufd is used we can simply verify that all affected devices are
> bound to a same iommufd then no need for the user to provide extra fd
> information. This is enabled by the user passing a zero-length fd array a=
nd
> moving forward this should be the preferred way for hot reset. [2]
>=20
> However the iommufd method has difficulty working with noiommu devices
> since those devices don't have a valid iommufd, unless the noiommu device
> is in a singleton dev_set hence no ownership check is required. [3]
>=20
> For noiommu backward compatibility a 3rd method is introduced by allowing
> the user to pass an array of device fds to prove ownership. [4]
>=20
> As suggested by Jason [5], we have this series to introduce the above stu=
ffs
> to the vfio PCI hot reset. Per the dicussion in [6], this series also add=
s a new
> _INFO ioctl to get hot reset scope for given device.
>=20
> [1] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/
> [2] https://lore.kernel.org/kvm/Y%2FZOOClu8nXy2toX@nvidia.com/#t
> [3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/
> [4]
> https://lore.kernel.org/kvm/DS0PR11MB7529BE88460582BD599DC1F7C3B19
> @DS0PR11MB7529.namprd11.prod.outlook.com/#t
> [5] https://lore.kernel.org/kvm/ZAcvzvhkt9QhCmdi@nvidia.com/
> [6] https://lore.kernel.org/kvm/ZBoYgNq60eDpV9Un@nvidia.com/
>=20
> Change log:
>=20
> v2:
>  - Split the patch 03 of v1 to be 03, 04 and 05 of v2 (Jaon)
>  - Add r-b from Kevin and Jason
>  - Add patch 10 to introduce a new _INFO ioctl for the usage of device
>    fd passing usage in cdev path (Jason, Alex)
>=20
> v1: https://lore.kernel.org/kvm/20230316124156.12064-1-yi.l.liu@intel.com=
/
>=20
> Regards,
> 	Yi Liu
>=20
> Yi Liu (10):
>   vfio/pci: Update comment around group_fd get in
>     vfio_pci_ioctl_pci_hot_reset()
>   vfio/pci: Only check ownership of opened devices in hot reset
>   vfio/pci: Move the existing hot reset logic to be a helper
>   vfio-iommufd: Add helper to retrieve iommufd_ctx and devid for
>     vfio_device
>   vfio/pci: Allow passing zero-length fd array in
>     VFIO_DEVICE_PCI_HOT_RESET
>   vfio: Refine vfio file kAPIs for vfio PCI hot reset
>   vfio: Accpet device file from vfio PCI hot reset path
>   vfio/pci: Renaming for accepting device fd in hot reset path
>   vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl
>   vfio/pci: Add VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
>=20
>  drivers/iommu/iommufd/device.c   |  12 ++
>  drivers/vfio/group.c             |  32 ++--
>  drivers/vfio/iommufd.c           |  16 ++
>  drivers/vfio/pci/vfio_pci_core.c | 244 ++++++++++++++++++++++++-------
>  drivers/vfio/vfio.h              |   2 +
>  drivers/vfio/vfio_main.c         |  44 ++++++
>  include/linux/iommufd.h          |   3 +
>  include/linux/vfio.h             |  14 ++
>  include/uapi/linux/vfio.h        |  65 +++++++-
>  9 files changed, 364 insertions(+), 68 deletions(-)
>=20
> --
> 2.34.1

Verified this series by "Intel GVT-g GPU device mediated passthrough".
Passed VFIO legacy mode / compat mode / cdev mode basic functionality and G=
PU force reset test.

Tested-by: Terrence Xu <terrence.xu@intel.com>
