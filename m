Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8872E6BB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 17:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CDE89907;
	Tue, 13 Jun 2023 15:11:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06289907;
 Tue, 13 Jun 2023 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686669072; x=1718205072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b4jnKfK1H4bpV3FZuepNPutRBfqeTgYorYXnXujS/wo=;
 b=EviekFkPkJ/v01+kprij8JHfBAYSPqwgsLJ2rgCkiUlfhsIGikIYo4tA
 7OgdjZ16+0zXCPyx+n0WPVRkAX+lXR7RaZxXwRXOFYc2BrIRx9aED9nB3
 xBpaksmC5Esgx+/yTyMu6sgfTfFxzVcf87/Z1r2/YRqVnGh0Jgvhz7xe+
 gPO7YG0JJE8rTe2RHuRHB8J300Z2O3fUujXVVKyV1vwBKBMpBMmRPwsGr
 tcnLUIozZc6FkRfzkbJFbvewstvkIEuu5EMVsbc6Sywk7H6Z8XeEtQFfs
 6kC+Eae5M8J06CRW5KitBAFeTXNNeDfmrIM7rLZjtkovQO+BN82zDjg64 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338000295"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="338000295"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 08:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="1041802772"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="1041802772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2023 08:11:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 08:11:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 08:11:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 08:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyUcFPuA+k1FSmAeNMCnnrszqd526XCMcW3mAhDzxtOC/NUU065JYFUKV+ntZKm1XYluVKBOiJ326b0vnCLbdOdi2oz38Ra51EusBpp3GT7hUXVVT09OUifXKkybOtrElXV2b+qxp76iMdXURK2l+/wy/6HRrvysfx+KBrBrrr6xeG6WQzJLMm4cWqzGsChJpfw84TnwymMWZuxM1sAD5QBrzriqG2R8OiRKH+04z5X9Cqd6DvbJmjIXA59Py///EootZzrnu6SaKspIEYDcWNn/rvQiq0LDn4TON8lMNWMv+rEz5rbNudVBLovuBrLHbCbdVcdsOs6Vvny663PkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AcgFtkDRQUklAUIqLNLjAp/uqKfnwC8fwRIak0ZAOY=;
 b=Y6ouNzeW//sBbW21JTdoMyZRt8OEvR4x5hjbQ8ELzeHn+nHEu9W7ZGXn271cMfLZYKeJSS+AXJs3QBXem4MRSlnQv7GRdRZfJ/B5oZQSqkTQE+2tmz6G0ndj2Y+po12OqG0mIXzeK25M2+ZhR2By3AXdLRnvPmQ2Qpu3vmFYLkPTJqM84FKx35iG3lCLS9aUXqIOKu/RT79xkEfXQdtc3xjyjOXxoxBqvRsfZ+42nNQGRmgFxCv8jEyf7fASIMMYRpFMKwSVl8xw5/Nce9vvypVBN4Iinjj68uDCrevEREVDp9pyzLfjr2oNVVqU7d+IskMG4iR8Cs26Uz6fQjukdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY5PR11MB6236.namprd11.prod.outlook.com (2603:10b6:930:23::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 13 Jun
 2023 15:11:06 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5%3]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 15:11:06 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v12 24/24] docs: vfio: Add vfio device cdev description
Thread-Topic: [PATCH v12 24/24] docs: vfio: Add vfio device cdev description
Thread-Index: AQHZlUw9Uf04nacAO0q7EN/OKT++06+H2nAAgADVnWCAACregIAABjdggAAE2oCAAAB1wA==
Date: Tue, 13 Jun 2023 15:11:06 +0000
Message-ID: <DS0PR11MB7529C440A84B75234E49C77CC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-25-yi.l.liu@intel.com>
 <20230612170628.661ab2a6.alex.williamson@redhat.com>
 <DS0PR11MB7529B0A71849EA06DA953BBCC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613082427.453748f5.alex.williamson@redhat.com>
 <DS0PR11MB75297AC071F2EF4F49D85999C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613090403.1eecd1a3.alex.williamson@redhat.com>
In-Reply-To: <20230613090403.1eecd1a3.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CY5PR11MB6236:EE_
x-ms-office365-filtering-correlation-id: 115abc68-8845-42ce-e14c-08db6c20691a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A3Rap2Ncfzzkhfnmvir1i29bHJjSsW/i9z0sXNsS8Q0Z+u4dZFC7bLFzuEbg+exKFysVBuDdURkKJ9iv/+mVmn72LI7F4Zht6wLv8t+s4f2uWMDKf9/EvSQceBTa68wQDVxDuTvBVpInfS+CnCsVU53y/IehxQ/5znmxUf70FhgC9t5X4T9zBkz2X+lJ2/6DpVIAl72E6AyvNYN+xy6rHKj+Q/PgLalc6X/eLQhhF1Wf7SkNK23zFZRhOy/uDBzR3cBAd3BhLbwxOQQcAMIzO6WAUwYyRn/BTZuCmFYGPndRQEB9WtFxBOt+IxvYGKQ2hacShuX99zoqSZwD0q6f+sDj/3o4IEIF3KJ/+p9Uu+rCim9slNFzsjyIMwpBHzlYdkxEC5tFZU5yQxkZs35jmVtSn9qWAjxeTTf3FVCg/NBIvW+H5JK3IifUMSbwJUqXUBn5CkDj7aaidKRbgB60aELK7bNJR7oEWBZM9HAn11I9dbCWJG6Yhg2acw4dbg6G1FTel+iXFCDaepmZA+yptUPmpAvCZQvr3VLR9NPc6rfNtsLsB4e8hrXCnQ4cDolZDB87snJPbwizilRjJ8Hvkk4c2rU/58hySDCSaP+A4iKr8HA4Hu+qggaW1XsM+fY8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(66476007)(66946007)(316002)(64756008)(76116006)(71200400001)(66446008)(4326008)(86362001)(66556008)(6916009)(478600001)(54906003)(33656002)(38070700005)(83380400001)(9686003)(186003)(26005)(55016003)(6506007)(8936002)(2906002)(8676002)(5660300002)(82960400001)(7696005)(41300700001)(52536014)(7416002)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q1oxrOSFBvGuw43p5GNCUSJWaUJqZkTWhAwuWI3XRvqg5skBNJK22lu76Edc?=
 =?us-ascii?Q?xNWVySw10D97gAPomK8uKrCl5Wmn4tLGJglYTIk1oS8JQAE3vg58tiC//lms?=
 =?us-ascii?Q?3uLSZoZlY6daJ31I5o3uJMM6QadqjVpNJMacMWC0DHHiQmM1jl3peQv9iYdp?=
 =?us-ascii?Q?WlM4BQ7WvUcvl5N2HVw/DyPZTamntRrF4F5ea3D1CJQP7HC5hSLewqR6ZyXQ?=
 =?us-ascii?Q?VlZcU4Rngy9D308LAK7oBAz2MtQjT2xYcWmwPX5StjsQEptI2Kym1Q0SE4qC?=
 =?us-ascii?Q?XnZ3jbiJy054TFAlcuDlOtXE98BTIysz9+GEx3UVTzG0kMDtXsARXP7F8HSV?=
 =?us-ascii?Q?X9zB+ve0/kNYevgaYBcGZavO7gjRPkKFL3M8JgbQLlkG0tIVjxiWkNQAfvUl?=
 =?us-ascii?Q?wizeMX9QzbSi7kXU8UuRdJt8Rus+WoF/0Ph/QkOEAuYBshOYy50nTga1bqfE?=
 =?us-ascii?Q?jQbL4cNv0A+1glNmxb7Gju2VsdNRJSia3GYzqdGSSJSraNtFKoIT7G6MPoTU?=
 =?us-ascii?Q?qGrJZ1Lo8mjWx3+PCsPPUIm2qNz9cNJGNHkQZeevz6JCaVloEUOvyJjvGAXN?=
 =?us-ascii?Q?e9lThcHA6g7oZNeWDJeEpGTemiJFo6zfkDbKpr7vrNQSbXlfhWaCCVxvadY+?=
 =?us-ascii?Q?eH/dk3+dj368vQbINnB12Fu+j+wPfTMuXIlS0dP0ux8eEiBYH/grHronU1U6?=
 =?us-ascii?Q?LPoYN6qQwaO1iI2lpAdZuxvWfLAMoMzs4rszQoWiEiKTfgKQsaKcImOIVh+3?=
 =?us-ascii?Q?pvCfd9TXK3P0wcJSc3R5s2KSLNuWHn+zrYzQQ+XKHK9ayx+WyPEnR/L/apfH?=
 =?us-ascii?Q?sogRmVXg35ADCQbHL4vUZBt0xiW+It8BnMbche7/jQ1ai0Trig9CUcogEEiQ?=
 =?us-ascii?Q?FxVZ1rVM2V2opwg+o6rPIHngJoXobmQc40Rv2zxSb6P1cdhazATc8Kb39wo3?=
 =?us-ascii?Q?UHYJ2RR4gSGMWUzJXRbpCYcoYKCp0mk+cw66AOrd+NQhxeh09BdPjFgqpRu6?=
 =?us-ascii?Q?2MihJXFOpU7HLF3snpkhkzJkqgDd09c2ihNcERw9TFylshY15fhON8wov1hs?=
 =?us-ascii?Q?TOV0wjF8o3i7HMsCdmbsM/zcXM9sV5kZqsPKczKCWDUQ9T/tOBExfew7TP1B?=
 =?us-ascii?Q?NkJ8ND70vOAfaHBT7ynK9AYNJ56A2ZPxenlAK8iznRDJmLAOkV1Iobs6M/ly?=
 =?us-ascii?Q?2t76B0aCFaDAen7FdfXHILEsp3dlKywjFohUBe39ccQTYO95bRSo4BJUzBVe?=
 =?us-ascii?Q?rdekXu2VCpy3lkL4HsarNUEpq+c4pb45PeQ4WoFmYOB8osnyhnitt4/A046J?=
 =?us-ascii?Q?nSdHGLm4sEW82HNdGgIdFMBgXF00bKvPyzDFR2MimGCZkBm8yoiJHMtj7nQI?=
 =?us-ascii?Q?FZoH2Tuj2gJTSgqfd2OUZ6qs3HpNFhFRMQx9lxXDSeNnbixle3oq34r0CCTy?=
 =?us-ascii?Q?Z3Qj9hhD39r5ePZMglKsDHKxM8L76QD3PSJUnDiK30umyMZikxKAjfGoVA3C?=
 =?us-ascii?Q?lXfiKyTSsTStdrp/9ieWEpI1QzQZyokMUTyL+iiiobluv10CrHVtbb1b8b4W?=
 =?us-ascii?Q?oZMqBGCR28hCeC7m6LkQuihdrwWO4NNfCXGFO0ZJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115abc68-8845-42ce-e14c-08db6c20691a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 15:11:06.0670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zw60lp1Owzo4iWQsAoF9Sw0bVWl3hC+7fvD2eJyDZjgORHzPbmMQ692FKX/uF2MbM26cr3hjLry7hfYeu8vNtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6236
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
> Sent: Tuesday, June 13, 2023 11:04 PM
>=20
> > > >
> > > > >
> > > > > Unless I missed it, we've not described that vfio device cdev acc=
ess is
> > > > > still bound by IOMMU group semantics, ie. there can be one DMA ow=
ner
> > > > > for the group.  That's a pretty common failure point for multi-fu=
nction
> > > > > consumer device use cases, so the why, where, and how it fails sh=
ould
> > > > > be well covered.
> > > >
> > > > Yes. this needs to be documented. How about below words:
> > > >
> > > > vfio device cdev access is still bound by IOMMU group semantics, ie=
. there
> > > > can be only one DMA owner for the group.  Devices belonging to the =
same
> > > > group can not be bound to multiple iommufd_ctx.
> > >
> > > ... or shared between native kernel and vfio drivers.
> >
> > I suppose you mean the devices in one group are bound to different
> > drivers. right?
>=20
> Essentially, but we need to be careful that we're developing multiple
> vfio drivers for a given bus now, which is why I try to distinguish
> between the two sets of drivers.  Thanks,

Indeed. There are a set of vfio drivers. Even pci-stub can be considered
in this set? Perhaps, it is more precise to say : or shared between drivers
that set the struct pci_driver::driver_managed_dma flag and the drivers
that do not.

Regards,
Yi Liu
