Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF731710CE1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 25 May 2023 15:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2AE10E067;
	Thu, 25 May 2023 13:02:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8404510E067;
 Thu, 25 May 2023 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685019733; x=1716555733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ah15E2my+A/6U3CvW3j3cfa4BWtIOoyH0omyPKTtYFM=;
 b=fZdLTkZKDIfvI68g223wTA/TVTZgtFoF2W4i6vN6jDeeeFBVkR4D+YGR
 FI2Sa6Qu93l6EoCVN58JDF1KLrIrEfvU+fOh+spVXaabtXlQx9GHo3w5S
 oiBz5GUgH/PJcsYymZBHcAwKkbLX0IMIfpLSjulcrQwzuhJqW8Ay/9CfR
 NOPUwA2cCKJOo7aht29fzgKaFqWQoBhvcRU1d5atknCcLC3dfXbvO1gpO
 1pGXTrTH4Tn0Yh5jw0kryfbnP0zcuRKoYB3q1KFVA0E6IoxkvY1qY2yuR
 CDQ2+vNlGWtfCBFZrRzLUJ9ByxYRABTOsGQTaNDTa8XaqLBOvXNMtN+Mb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382124551"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="382124551"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 06:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="708003283"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="708003283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 May 2023 06:02:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 06:02:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 06:02:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 06:02:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 06:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEQ3NRugBstO1Tomz9dYiYrQ3zvtdOl58RYCsD/oE8UHJNndX/8MAc63uw942N0xs2TTBKKitlXhCrmHf3T1ezIfhNwrbKR8Ikt+yCW+76LfNCEZSDbPI2Er1H6qZZoQR6nVVxIfAdbBXFBC1dUuN3GipZH+CWSfc/YlgN+lM897nQn9GTmNpUSso8d/G4GfaW6sxx5vT7oh3+KcJLaIfoWUSzuN27aRZu/azFmiZ+Qlh9/3t+3tuLJ1PafTXrkHnXm5zVGmlbPifSvtRMuj8UTXOPUcxCBrg9eCc4GHESiJwVvqLhRGYHwrmYwU8a6QG4JQCVXU417rO78NTKcGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSuAefxVN4dxvLKB80h3ktHN2mZCsHTqARzwhYbfv3A=;
 b=BKqPh+cyryMvw412aip1TfHouU524iGNe1zRFe05+UATvdy5PdJCz+0T5Ys4/zAqqZb9UCbsj0Hgk5PHfWE/YvL+bHBPanJRUFMFvUmCnadoQFABqbmj4cO8qy5xYAL4A7CHdo6C2u+Q7uUnnnAPdkZvP0XKrTp6CQQx6nToTUY7u0t1YlMYsMmmGqkt87qz6K8y5vWlwSzu/liNUVKSvqDfhArydAJjg/8CVW4K3YIMk9CeMP9c0hN0GWx9Od7ilxLq2bIHJzZtKOTIZ1ocVuoH9CVsQsPzUYsXK/HbG96TURguXnI19uvzQAm7Dm1lDr6AEwU8zrnUUD3TUi4w3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 13:02:05 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 13:02:04 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v6 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Thread-Topic: [PATCH v6 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Thread-Index: AQHZjKSwmm8rv7BAt0eU9VbGFQ2Xy69p2kCAgAEPLxA=
Date: Thu, 25 May 2023 13:02:04 +0000
Message-ID: <DS0PR11MB752935203F87D69D4468B890C3469@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230522115751.326947-1-yi.l.liu@intel.com>
 <20230522115751.326947-10-yi.l.liu@intel.com>
 <20230524135603.33ee3d91.alex.williamson@redhat.com>
In-Reply-To: <20230524135603.33ee3d91.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|SJ2PR11MB8321:EE_
x-ms-office365-filtering-correlation-id: 20faa3ab-e1eb-4de5-2896-08db5d203cfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZzI7P4KRGvfTLatQ2Fvkiy6gaRbLdNRhEFWIKYzbtPEsVQIL2NZY/NFInZw/0cFcQZdTTG2/0BbKq3cO94UsCmS5qfbKccR07awx/Ly9OGRY4/KKxRqBojGjJjF9frSncHyYHpRf/D9fMvSxn7o5T+9gWgqGmt9w5W9YoeVQfRBISfJtltlZ+LLJAi/zxCchwTbyyHH4thT2Gp4ZJs8T0anqJci8SSWu4wrkpfVIwnN8hXvNIJmGQN5Zn/R1EqqIdcJBm5MVhneJ5udX+hCOvztr3zuBp2PFFhMeHTE8WWWEXOhN1sgzHC/ip0D3G1ZDwnkMiLcPyTzvQWx7PE9DiGQo7onK1yV/ejxn9QOOvhniHf3yvPYsUYNEAFBgXTPi8m62uwUmVWrQTy3YxHpEUO8DBuja9FRp+BPkQvNIVSy2vL5JrTycbJKnPMYixmkUuhfSVL5+8AiAbAT0PRDZ+Wv5mUeIAdmUU0dY7rdE1KvIpc2wjkXJfltt3yeYGYlazI+JMtDXWwCGdSbVQ+4p0k8JbNg5jAjxC70dV2tToOXbM3Pqb2uSDZECjNKDXjE9R4zzVcjIHLGnu3dioPVstgEbsVdclHkJs4IVrzC7z4H3yBoJPo6u4hpNbBpdc3wr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(4326008)(41300700001)(7696005)(71200400001)(26005)(9686003)(82960400001)(316002)(6506007)(55016003)(122000001)(5660300002)(52536014)(7416002)(8936002)(8676002)(38100700002)(478600001)(86362001)(83380400001)(54906003)(38070700005)(2906002)(33656002)(186003)(6916009)(76116006)(64756008)(66556008)(66446008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0p6nkIaQj7vQZybo4zGjW8xhGw0Pt2lTR+UkWlX4CTKe4bn0pwShhOcY9U/6?=
 =?us-ascii?Q?O1uRyUYK2ZEdZUN0jew/3VwoR83WEJxD8syoJmiozTLGS3rriKjw8+nyG8hR?=
 =?us-ascii?Q?wXGURsucFI0okbJO+TAH/SbePEpa9ulX3KTkW+/H6juFCM3aWvHBWiVhKDTI?=
 =?us-ascii?Q?8SdK/WQhbVsEbnLu1sYwFxmFQ09iSbkgDnslkRg7CIjckUMj8DaXR9AQivFE?=
 =?us-ascii?Q?faEVhh1i1TuiE7wIDOVogihpldg5vJSKEPycwF/ovnVgVeQX75HFjbzSmGpI?=
 =?us-ascii?Q?vGXhLOMWGGugmnCS/6b24JP420Xf1RRFGhoT4h0oXCTPGq4mcLE+kqMgZs4z?=
 =?us-ascii?Q?U7nmuYLuETnV7z8YzV1EH5EPFrjrY5xKoy4wRo5tRT2zUOxbUy4SwOIbgPC+?=
 =?us-ascii?Q?EXXF1qf0YLcdVpH4eTYO3FClTnFl2yVxuo0mE/TCICC+Rnt+7VOlD9ViLvQj?=
 =?us-ascii?Q?gSEneTpwDzxg90X7+GIkLbs9/KXA9lo7sQawEqq1xXE5f/n0mGK2mbGCE95t?=
 =?us-ascii?Q?McXZtdmvu46fQ1eFpG4N9X9K7DExu45pTSAQUQDZCTACBbTViOM68H3wiz6c?=
 =?us-ascii?Q?FOe6TMUqCT+3DQOsgrecMQ2ezedN3miQBYGjOecLdtwWWQKU9WllqUzwgU5P?=
 =?us-ascii?Q?sPk6pkEDnM+mPETxf79OLnZxpDJnugOVmZEvSyhoRg7lI2QwzxWfomsrp+J0?=
 =?us-ascii?Q?SPyjprkdiGrCOtcf80UGoqjQCuKne5qOONQOrPbzHpGf2VlLdHGEx10Cuf+g?=
 =?us-ascii?Q?bghLUr/swWPG+54t0lVyGcSdOLVzDiZ9Ilv3cuYzRHtq2PwKwTDBvuIeFLTn?=
 =?us-ascii?Q?8sx+OIWTiadXjjJOrpZw0sBXU+7GhsX5WVUS6YdLy69kvU1upJY5aVD5jHhg?=
 =?us-ascii?Q?eE8lLBQ4Zaqz7Dw3xYxDLv5hf4SltnoLkyWg902hYlvBrVON89g5B/BhcF0g?=
 =?us-ascii?Q?mBVBq/Ew0KGfoQO2VLvHDgNw9w67T16lki8euNnJFQDiX0et2GSXR/XFy9o/?=
 =?us-ascii?Q?b+WP8hQesNNXlTOYezAGUDZn2CCDbWu+x6hUwolw4JvnL4zVyr4UNYv7HTed?=
 =?us-ascii?Q?IJuBY9g86kO3SPcM9Lf7oOZ8OL/x+6J29uyD5TappyMssPFyV1vUexCTz2rA?=
 =?us-ascii?Q?RmiXxFvXJGNc1ZmabRxn0i2bO44Cf5NukeP3B69iUQmxpk21ibPN/FHFIYwH?=
 =?us-ascii?Q?1OFIwT4OB+CQ4vMSQV4aLvwc2CYS/kjZaReXz+ze5i1Q/PPyNw5j53Bc0rTQ?=
 =?us-ascii?Q?zy8mBzlO6uIcnb0zUNaI+oS3+5z+6hKFYKz0dTPC9k9gfSigh76A5rhWN+u9?=
 =?us-ascii?Q?zoZDufev53sN4qUEeqX6Gj72BOZchlC3CcWkYtdZGGB+0wvUmrZKEGIXXv61?=
 =?us-ascii?Q?9gfvc/I/lLIdccvjWj5WLdH5wey1aF/uadgOSRNS2aw++qtLaRVFDVz9uHL7?=
 =?us-ascii?Q?orYrFHoiA68uBo94QWEBHVNdEM9E+7Yteum+0bR01aEkWzQ7IkKDLXwQcFWP?=
 =?us-ascii?Q?dpeX57eHwsNrQoWnqf4Dt8Xcdp0gf14Cf5+YMEEK9+I8FHMRYvOKAD86Y8bC?=
 =?us-ascii?Q?FmFiiYmQHZGfb1UKwV0R2f2UN6XNsGmeKQLdlI7v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20faa3ab-e1eb-4de5-2896-08db5d203cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 13:02:04.6317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PNRjlFuMxXPaHIPXa5Jnx2pIOSVs+WOVhpR4poY1Vfi+W/PsxbV/a7TB4ZsxNmV+Mq1lhWSvqn5Er+Icwq9Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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
 Xudong" <xudong.hao@intel.com>, "Duan, 
 Zhenzhong" <zhenzhong.duan@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Xu, Terrence" <terrence.xu@intel.com>,
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
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Thursday, May 25, 2023 3:56 AM
> On Mon, 22 May 2023 04:57:50 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
>=20
> > +
> > +/*
> > + * Return devid for vfio_device if the device is owned by the input
> > + * ictx.
> > + * - valid devid > 0 for the device that are bound to the input
> > + *   iommufd_ctx.
> > + * - devid =3D=3D VFIO_PCI_DEVID_OWNED for the devices that have not
> > + *   been opened but but other device within its group has been
>=20
> "but but"

Thanks for catching it.

>=20
> > + *   bound to the input iommufd_ctx.
> > + * - devid =3D=3D VFIO_PCI_DEVID_NOT_OWNED for others. e.g. vdev is
> > + *   NULL.
> > + */
> > +int vfio_iommufd_device_hot_reset_devid(struct vfio_device *vdev,
> > +					struct iommufd_ctx *ictx)
> > +{
> > +	struct iommu_group *group;
> > +	int devid;
> > +
> > +	if (!vdev)
> > +		return VFIO_PCI_DEVID_NOT_OWNED;
> > +
> > +	if (vfio_iommufd_device_ictx(vdev) =3D=3D ictx)
> > +		return vfio_iommufd_device_id(vdev);
> > +
> > +	group =3D iommu_group_get(vdev->dev);
> > +	if (!group)
> > +		return VFIO_PCI_DEVID_NOT_OWNED;
> > +
> > +	if (iommufd_ctx_has_group(ictx, group))
> > +		devid =3D VFIO_PCI_DEVID_OWNED;
> > +	else
> > +		devid =3D VFIO_PCI_DEVID_NOT_OWNED;
> > +
> > +	iommu_group_put(group);
> > +
> > +	return devid;
> > +}

> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -650,11 +650,53 @@ enum {
> >   * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 1=
2,
> >   *					      struct vfio_pci_hot_reset_info)
> >   *
> > + * This command is used to query the affected devices in the hot reset=
 for
> > + * a given device.
> > + *
> > + * This command always reports the segment, bus, and devfn information=
 for
> > + * each affected device, and selectively reports the group_id or devid=
 per
> > + * the way how the calling device is opened.
> > + *
> > + *	- If the calling device is opened via the traditional group/contain=
er
> > + *	  API, group_id is reported.  User should check if it has owned all
> > + *	  the affected devices and provides a set of group fds to prove the
> > + *	  ownership in VFIO_DEVICE_PCI_HOT_RESET ioctl.
> > + *
> > + *	- If the calling device is opened as a cdev, devid is reported.
> > + *	  Flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID is set to indicate this
> > + *	  data type.  For a given affected device, it is considered owned b=
y
> > + *	  this interface if it meets the following conditions:
> > + *	  1) Has a valid devid within the iommufd_ctx of the calling device=
.
> > + *	     Ownership cannot be determined across separate iommufd_ctx and=
 the
> > + *	     cdev calling conventions do not support a proof-of-ownership m=
odel
> > + *	     as provided in the legacy group interface.  In this case a val=
id
> > + *	     devid with value greater than zero is provided in the return
> > + *	     structure.
> > + *	  2) Does not have a valid devid within the iommufd_ctx of the call=
ing
> > + *	     device, but belongs to the same IOMMU group as the calling dev=
ice
> > + *	     or another opened device that has a valid devid within the
> > + *	     iommufd_ctx of the calling device.  This provides implicit own=
ership
> > + *	     for devices within the same DMA isolation context.  In this ca=
se
> > + *	     the invalid devid value of zero is provided in the return stru=
cture.
> > + *
> > + *	  A devid value of -1 is provided in the return structure for devic=
es
>=20
> s/zero/VFIO_PCI_DEVID_OWNED/
>=20
> s/-1/VFIO_PCI_DEVID_NOT_OWNED/

Will do.

> 2) above and previously in the code comment where I noted the repeated
> "but" still doesn't actually describe the requirement as I noted in the
> last review.  The user implicitly owns a device if they own another
> device within the IOMMU group, but we also impose a dev_set requirement
> in the hot reset path.  All affected devices need to be represented in
> the dev_set, ex. bound to a vfio driver.

Yes. it is. Btw. dev_set is not visible to user. Is it good to mention it
in uapi header especially w.r.t. the below potential relaxing of this
requirement?

>  It's possible that requirement
> might be relaxed in the new DMA ownership model, but as it is right
> now, the code enforces that requirement and any new discussion about
> what makes hot-reset available should note both the ownership and
> dev_set requirement.  Thanks,

I think your point is that if an iommufd_ctx has acquired DMA ownerhisp
of an iommu_group, it means the device is owned. And it should not
matter whether all the devices in the iommu_group is present in the
dev_set. It is allowed that some devices are bound to pci-stub or
pcieport driver. Is it?

Actually I have a doubt on it. IIUC, the above requirement on dev_set
is to ensure the reset to the devices are protected by the dev_set->lock.
So that either the reset issued by driver itself or a hot reset request
from user, there is no race. But if a device is not in the dev_set, then
hot reset request from user might race with the bound driver. DMA ownership
only guarantees the drivers won't handle DMA via DMA API which would have
conflict with DMA mappings from user. I'm not sure if it is able to
guarantee reset is exclusive as well. I see pci-stub and pcieport driver
are the only two drivers that set the driver_managed_dma flag besides the
vfio drivers. pci-stub may be fine. not sure about pcieport driver.

   #   line  filename / context / line
   1     39  drivers/pci/pci-stub.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   2    796  drivers/pci/pcie/portdrv.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   3    607  drivers/vfio/fsl-mc/vfio_fsl_mc.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   4   1459  drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   5   1374  drivers/vfio/pci/mlx5/main.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   6    203  drivers/vfio/pci/vfio_pci.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   7    139  drivers/vfio/platform/vfio_amba.c <<GLOBAL>>
             .driver_managed_dma =3D true,
   8    120  drivers/vfio/platform/vfio_platform.c <<GLOBAL>>
             .driver_managed_dma =3D true,

Anyhow, I think this is not a must so far. is it? Even doable, it shall
be done in the future. :-)

Regards,
Yi Liu

