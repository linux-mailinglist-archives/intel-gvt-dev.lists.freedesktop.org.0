Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A566B3BB1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 11:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2391D10E9B9;
	Fri, 10 Mar 2023 10:07:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6020D10E9C9;
 Fri, 10 Mar 2023 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678442820; x=1709978820;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=muuXK2P04NqVJ/MWo7g/8xYxb8OUiUEuIs6iqAX6Q2Q=;
 b=k4JUAcX1wwliJiyVHgRmI4WgSEreE4dGHjfH//ZQ0UcdrLVsPePXhVqz
 g+EGqO7SBWhbqUpSRV9HZoOxp6tPjjcMW0mCFiB21dWR0t7SRUgzjU7Z3
 uZXygJoz3nDyEZres/XNZmQy3jwzrIbhQWPxO9u6pYbGE6eqzab4EE95G
 qXYja+xHbzRMfkYhaUrTZSqRaQJnvKJ85dKGspHvd8s12rR8Tg8Qr0Vx+
 HJ672x6nRxKmlMLroJ0q9sZqXxt1UNqIzFkMyP1TIz5Ew4feSD7nMLUit
 VcYfgAuM3DS0TlVSYkIs3sBHEniHvL2qD01rjKW88LuohXXMnrLPhnVEA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422963902"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="422963902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 02:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="655131978"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="655131978"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2023 02:06:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 02:06:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 02:06:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 02:06:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 02:06:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adJkUSEFOY46+dAHU9JD6kk5Efvn0mrkKH9RT0pmoYirSxS29I6mBynYAIEbipBpSDykHiNlyGE38UXQVFzqrE1yHB/06PT9uwkaY9YS+RDmd3nnwzx57QPvaHfzEKeXX8oFLh/bA9rsPquLbiedtkRx6A2osdmdZHsD7bMGR9w2HytoBbZ9tXt/tn0OQKiPigoCeHNNQi5yBgkjguEjnyt6uOkonBkP5iaCrJjsuoWvEDSU7LLgUpndmEFxY6F5nIRUSAqF9mZMUAxfnO7bD3QYndZjOJmr3CETm3NSf6+UwumZgDxULyXZmD76DTCLiUAm5dBq150Kvta32VS9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyeDIAIut4AU8JqpEATCykDRZ6cTwrkdYq/DN4wLHLg=;
 b=dEgDRM/iki8A3ga9h3sOON35RK+3EtE/ezpBY1xUGPoO/3kvOyYrwxMBBPHNOG+k8wfTenlDmUWitWfrTQ63bta+PR6pAq7eRuGWRTZCVt9Si+/NiMvTumO/xmMEmykhL/dXR94bbbqeQZUM/cCI8nm59QqybBOnlqVtG2+i/Bn8rMrxSwcSDmpijlx6mVEc8+4n9a+F8VuPN0+l+u1Eo0jbSxX/Z6vXB7GiSONmkFKSqr0lQOudR6fxQe6cP0esPLwqtIYaLpvINrW8WvjIGBZfogpLKXH5lD4wV4fRg1/i/c5X0H8BnAuyjNKjegpcyHQZ51iAaNWuwPBO/PvXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 10:06:54 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%8]) with mapi id 15.20.6178.020; Fri, 10 Mar 2023
 10:06:54 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v6 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Topic: [PATCH v6 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Index: AQHZUcIPMa9EffDOZkWyiNA29dWGmq7zuaqggAAQh4CAAAHT8A==
Date: Fri, 10 Mar 2023 10:06:54 +0000
Message-ID: <BN9PR11MB5276684B2C0CD076FA3CD0938CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-22-yi.l.liu@intel.com>
 <BN9PR11MB527665CA5753E413CB4291AE8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529B3BFD999C9720836F049C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB7529B3BFD999C9720836F049C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB7167:EE_
x-ms-office365-filtering-correlation-id: 063e0459-7689-4ba8-d6f0-08db214f2d14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +BNzEHl6DJHOML0U9y6f9Fk3fcROYWX4t5wDzHiQWe1HBNTp2Gp6AVA3qafpQhkdtiPg59IYvYEcV3OzVZRLarAVKKgQRVlkS8C6aNHSh+JHRDcXnUp276Y88KsIav9bvOMSEQvmCisAynJ7hnaGVGTu+XtoXpixFukAyr8WQC0G0LUU/hlKtxDppyG21KEaWX2StYyCt8zVW8uph+TGC898w9/87kmUYT9mdFMAqws7Zth0cZBFN0MNcqM2JMvy7ahpxAweL0ZJDKVx2wiANQh5yz73N9b/GSHEEJbn+dYxrVhLV1wT0z0Y5gJvKv2O0oqAK6+Si28mJ6ZigMJdQWFD7DoMGyAvgh62yBp6uvYvulTwUxDlTQPMak3XdMJon4PngV/JvgOkzIyRT3tLYA9milDh/DjZ2bl7qK8N1ZLx4AcP2tZHJXhofX1ZYDWNUwvneUYTq7Q87ZkNIFz6vriLlGYs7c7RCCLxmkYAXBTSKX51M0cQoC5cTX1/Gv0teJau5UgBX+8cRI5D6EhRfHBDTMoEWlK7oG7E/DyosmiMmP3ENj7HOvCggg7EAhQn+ck0Qi81J1Ig0keZPViWLjLb+A3hvQDvJVp5kni9awYTcAFTWBHl1tz1jJTQ7c/DOHSMzle5erJRxMC9EnYIQIihF8GWpNLuvBkKI0cg/+BRWHjN5psuIwBE74wwJz3dAmf2B9CLZamaRLRy9Ty+Zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199018)(55016003)(33656002)(86362001)(38070700005)(82960400001)(38100700002)(122000001)(83380400001)(8936002)(52536014)(478600001)(110136005)(7696005)(71200400001)(2906002)(5660300002)(7416002)(4326008)(76116006)(66556008)(66446008)(66476007)(64756008)(8676002)(66946007)(316002)(54906003)(41300700001)(9686003)(186003)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8lupcmRRhkfX7fbWDv4sbFMWpZIl3qt3YFou8wC91JxcTii67A39FY5TQ7FI?=
 =?us-ascii?Q?zQHowN/PbZFfcv4TYDUL6CzMHTsYfLLt+m+rrLJKmAPGvHdQyhJijZ/+bJeq?=
 =?us-ascii?Q?x9tZ47NN19yCuZ7xxWtlagTZavb5H9r3pd7C6rKBGLzWtlXYs48dK3UsvbPR?=
 =?us-ascii?Q?GGQpkXUn7aeD592tySODv3g6mt+eKsA76AuCjy+oLJbhMb8kYlvFTDHC/U/U?=
 =?us-ascii?Q?CqgqmloHwRTJXRkbCM67G/QYCHZhwaJbp6ZupU7WSdH242OnCTm3kMGyRoRG?=
 =?us-ascii?Q?wgKHbIy7/LRAeYmDBXGtrWJ7pY2NYqsEdwktIy76PlKmqIlIbj/FNj4a26k/?=
 =?us-ascii?Q?lnY46ycJE7SLjQp9SMM6bLJvrKXb0yQvCkQKpzPoI1l5cT73SuxLm1A5qUQy?=
 =?us-ascii?Q?LVYYa9MC7bBo1YN7mW5SloWDXwjKj6MGUKjXkis42HV1iM7ceUCOXhlIKSOv?=
 =?us-ascii?Q?dNmKyt1Z2vE2x6WqsfHhqGAvJsopqwDWWipAS39k7p+bpHQcXF/TszFEgwDU?=
 =?us-ascii?Q?qHwl3ZpTuhmXL7NV/d5ae4eL3iBi8tARknZFlyOsfMlOiPDdc6xw1YW71V+9?=
 =?us-ascii?Q?F6DtTYIiCJolIkroHIK8MIarDzjvqbPiqPmWOa5f67x/m47asq4cXCNAWy47?=
 =?us-ascii?Q?WvyrQELZYJEEFEPYCdnxpYVpVNcF0NA5F/3fw4ZihXmHZ+IigYniYDMEcG80?=
 =?us-ascii?Q?CYTbRsPP4pHHb1iktegbMVbCfftfWxOM3MCEzsKhuiLGlG2b0bkOvoXPtrst?=
 =?us-ascii?Q?SdWiVfAHJ+UgMYyGOwV+3hnMCK8JSrALAwqDG+ge0QtIS0OTxbtndgs7VrTr?=
 =?us-ascii?Q?IfpY7Vh19bn8LZxlMSUQ52w+mHWXR1CUdqsOhmqC1sTcYOx6Tsvvlbv8e0JU?=
 =?us-ascii?Q?dn4A/kHqlhKtqxev8fNZDv6iHKgr9nV0G03Wi006/1JlupPDs/IWu0Y8hXuB?=
 =?us-ascii?Q?Ox/7+eEfl8n7Ga55gRxSGoMUCHpgJQRhZEwpO2gzXWOZMCVMBLpsF4YfKJFF?=
 =?us-ascii?Q?y0VONJD/Gfupv7QZYLzhUpqiZ33TsHs/fPhZ4lkSQ3Z9zkqhmK/i8/B2tZ1x?=
 =?us-ascii?Q?3S0BWsCPYJBac5o8eplVxuSVxEo1ZG/tn701w3gGN3tox5vmLDPetXWZ87cz?=
 =?us-ascii?Q?t2UKlm/h28BRcrB3C9oJGzS6UWy+VnOlPVqtd+WSJ6IKn5qE4TE/bRb2jfjZ?=
 =?us-ascii?Q?XkTAbCHA19XRetY6lGyJ7XHuCGwC1bvJgxuph6U0zrsObDjiRExiAluiIzrb?=
 =?us-ascii?Q?y742uCWy/lBTujQ92e/8RSPZgcvpsJlzddbufKQtmgENWW+IXRlDgNSPcX1s?=
 =?us-ascii?Q?3dkXOl+rf2/Afv2Z0ZXwR9J72vHZT6LrbL7QRF6a+qYQkVzdD0Ue8cDXAom4?=
 =?us-ascii?Q?enjdh8wKw0FZURaG4r5z/l4lsuQV1bP3r9KqSsXPaKeKTUZ9dsNQdOZkFSah?=
 =?us-ascii?Q?BmpkuqcJwO6gsD0+xHfp2TMaInULr2uE9BSepFrKaYJv7LJ5PAgmBKK9EVX2?=
 =?us-ascii?Q?ZN2Wb+V/kdrqVaWApm7FkimEd5ZS3z/wKxufCrF0xePULVRBORoU72SFVHJE?=
 =?us-ascii?Q?q6mcgmFCE1225oX0KqEq76i4bRzCiwAqcSORZ3Tk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e0459-7689-4ba8-d6f0-08db214f2d14
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 10:06:54.5374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NugvEQFuSskWpVkzsVxSc/X0mJMG0cmyBcsU11G8x38Qp/LL/W/sj6Mf6gaXujJeCXX0Uuet4XytymjaV06Z2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Friday, March 10, 2023 5:58 PM
>=20
> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Friday, March 10, 2023 5:02 PM
> >
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Wednesday, March 8, 2023 9:29 PM
> > > +
> > > +static int vfio_device_cdev_probe_noiommu(struct vfio_device *device=
)
> > > +{
> > > +	struct iommu_group *iommu_group;
> > > +	int ret =3D 0;
> > > +
> > > +	if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU) || !vfio_noiommu)
> > > +		return -EINVAL;
> > > +
> > > +	if (!capable(CAP_SYS_RAWIO))
> > > +		return -EPERM;
> > > +
> > > +	iommu_group =3D iommu_group_get(device->dev);
> > > +	if (!iommu_group)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * We cannot support noiommu mode for devices that are
> > protected
> > > +	 * by IOMMU.  So check the iommu_group, if it is a no-iommu group
> > > +	 * created by VFIO, we support. If not, we refuse.
> > > +	 */
> > > +	if
> > (!vfio_group_find_noiommu_group_from_iommu(iommu_group))
> > > +		ret =3D -EINVAL;
> > > +	iommu_group_put(iommu_group);
> > > +	return ret;
> >
> > can check whether group->name =3D=3D "vfio-noiommu"?
>=20
> But VFIO names it to be "vfio-noiommu" for both VFIO_EMULATED_IOMMU
> and VFIO_NO_IOMMU. And we don't support no-iommu mode for emulated
> devices since VFIO_MAP/UNMAP, pin_page(), dam_rw() won't work in the
> no-iommu mode.

correct.

>=20
> So maybe something like below in drivers/vfio/vfio.h. It can be used
> to replace the code from iommu_group_get() to
> vfio_group_find_noiommu_group_from_iommu() In my patch.
>=20
> #if IS_ENABLED(CONFIG_VFIO_GROUP)
> static inline bool vfio_device_group_allow_noiommu(struct vfio_device
> *device)
> {
> 	lockdep_assert_held(&device->dev_set->lock);
>=20
> 	return device->group->type =3D=3D VFIO_NO_IOMMU;
> }
> #else
> static inline bool vfio_device_group_allow_noiommu(struct vfio_device
> *device)
> {
> 	struct iommu_group *iommu_group;
>=20
> 	lockdep_assert_held(&device->dev_set->lock);
>=20
> 	iommu_group =3D iommu_group_get(device->dev);
> 	if (iommu_group)
> 		iommu_group_put(iommu_group);
>=20
> 	return !iommu_group;
> }
> #endif

this makes sense.
