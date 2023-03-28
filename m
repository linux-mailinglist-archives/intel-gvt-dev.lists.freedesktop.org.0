Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDB6CC23F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Mar 2023 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EE510E484;
	Tue, 28 Mar 2023 14:38:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979CE10E3DE;
 Tue, 28 Mar 2023 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680014321; x=1711550321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4HSEjDNdcn2f6B07/HBFHA9X26G8Mvm/Z9GeNgLHFUc=;
 b=BDLcWHdTg7m5nS3tcEOfpWBBrKybIHm+UmsVXATWHCRSgpkD2tuQ8M/Z
 /fUxlMjtdurAzlcFfu3IBou78qaKj2I5crIBXLPYh5b+slOM4JvEEC1Sm
 ZI7PFU2lqPQyA3c3Fm1aJo3gupMysxNL5IoLXf8rp/Ve1g80PI8d9nkHw
 fFF8dZYwHuXQtkOHrh+6UrpkU9NxaVvITHKzL+QzcFD5P9RiWEQ24TJxq
 sBTScK9Tu56XTPGenjdgCFnP7+mEsSpGp8E6WCgJkTL/m64oMjnf7yVW5
 9toQU+OsDe1aVm5KuNi8LNzmdyB3qBX4gcqQ5lgm70NxNy1EPjTaXTbng g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340603723"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="340603723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 07:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="634068285"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="634068285"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 28 Mar 2023 07:38:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 07:38:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 07:38:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 07:38:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 07:38:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSi/OGNa7NNk2to0BQKq9pB09GwZ/77krOTHIoNSMBjpzohJnkeuDfuq1E9hl/+A9nOphe31tEi2ma0sWbzyb96w1mWozEWZM6dZXWVdokzv52NHn6Se/dVjGvrwYstt9VtzxR7ZrDlr/t9X8gtISu1M+iBYAfNYZdYcRTiaCXujvuHzQ0VOpw9xi9c/5ivNdVmoGGS7NTKne0jCHr7nmL15nUUv2pqrXobxNkXP/bAn6U2gj7ph1iL8UqTT2wHKu9hEZmKWNIod14lerZ7XLJYrj6PchxzbcmcHW4hA/Q2VyzU36qP0DYAWpN6dm9y/oG1cvo3umw6/Qym6U1Jo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izyWEI278/pPRn221TBavkUJPwqjgw8T+qBIoU5E75M=;
 b=XgURgpNk6A35vPI+2EnhcbvZkn8mjxvJ+iqIyhuGoOXuV1pYn67iYYH1x+sFAQax1cmkdtUWM6/PUjcZir43jeZOQX2NQ0EqhCAfg9/KYTgZqL85gqAOTil//KR7Jm6hr9+pH2ip4Ryt8gDV1ls3eZA0fwoutmunj9rticGVbbqB/4ptVmftswOEK99Es+WQICaf/hgW4zp5KQHC+3S2hS7lH5f6oDaLftuAUSbGy0usGXuB4JcDO68ngDi0JnNUfFY7RRDqMxbIMu9BY8ccyUhoyJB2aUytE0WqOOndq/oHdurFEv7xJNQaq4nDySx24+1mrg62ZXtV858LfkCQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Mar
 2023 14:38:13 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 14:38:13 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Tian, Kevin"
 <kevin.tian@intel.com>
Subject: RE: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Thread-Topic: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Thread-Index: AQHZYI92Dc+A7iEOnEaMeK3O2ipWfK8PAuSAgACBxlCAADScAIAAh+4AgAABaZA=
Date: Tue, 28 Mar 2023 14:38:12 +0000
Message-ID: <DS0PR11MB7529B6782565BE8489D922F9C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
 <20230327093458.44939-11-yi.l.liu@intel.com>
 <20230327132619.5ab15440.alex.williamson@redhat.com>
 <DS0PR11MB7529E969C27995D535A24EC0C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <BL1PR11MB52717FB9E6D5C10BF4B7DA0A8C889@BL1PR11MB5271.namprd11.prod.outlook.com>
 <20230328082536.5400da67.alex.williamson@redhat.com>
In-Reply-To: <20230328082536.5400da67.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CH3PR11MB7896:EE_
x-ms-office365-filtering-correlation-id: aa7fd962-671e-47cc-b741-08db2f9a0f1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8qKXnUs8O5S7A1nNVw1SaKRuv2prOsedrngRLqd2cBNKvyRsKVKW9+hDk3OoBZVXzDH/dPH6KIl/JN0a7I1TLBJMMybNrb8JP4IfDrw0COl0/X/cQGYabiVC+EoLu+bcvXgXoELVrTDz/PrBqIXJ4ZGuDayymJpnvcg7M5R2ECu/BfSTUcAJ6Z73Z5sX86TP/rv+nLRuiqavaX0LVXkaVVqSamJ3PXTMmQTel5HnIkW9ycSxpcI99GsDLkVOiNnAhvdVHnNdj6QYPF5cCaMw4kx/QKRckQVaqGNCJd23LkWpL5/uwhX5R4dOxOav9eNPy87Cx7IINeUpEuu8j0w8R3TNwV/LxcLH6ZyrkLMYmxQf41fDcVUtRgfXdBfyU8Egc1zOq8IUp1435riBfCXEIiZnZlw72CWNl1A0thHzEltkGfsW4DTobPynP7ESr8ddwMRLOmzUtxJCVSueym88dIVs+btXBoEa1/1LZFQDPm24MFtvIpqtu+0xZO/0Cb0n0XiovOL6L6auPG9qOlx/fBRs+aGgg/XdE9m7xUTyXtM8EOBobvguIcwUaiXRlXFYvwoDyvqMEiH+wTT7Z0N+//U6F3p/NqRZFJylBnpTxftFK1Gxo85eEXxV6zRO3fbMdJWqiUj0dKcq7z1+CFrndA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(7696005)(186003)(9686003)(478600001)(26005)(6636002)(110136005)(54906003)(76116006)(316002)(4326008)(8676002)(6506007)(71200400001)(66556008)(64756008)(66446008)(66946007)(66476007)(41300700001)(5660300002)(122000001)(8936002)(52536014)(38100700002)(7416002)(2906002)(82960400001)(38070700005)(55016003)(86362001)(33656002)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gR3GwgEc38zCnFWSV/DVmRuDvl7GHE8N+Sfxfil1drGLw8qNP5ILDV3VhsKv?=
 =?us-ascii?Q?5SzTS1rj3SLN0TsBGjoTX0l2XePlsOMbqJuigICro+DzHAZ5Ts6XVp73jOeH?=
 =?us-ascii?Q?q3KU0Jcy7nOfI9AJkDmTqaytBqTWbDjtFhGjid2NsTH94IZa8KJ3QWFM8U3B?=
 =?us-ascii?Q?1mIWo78gJCNZFdfWWxKni1f1r9RGpcYLUShYTkCzJPyGMb2GePwojm3VsTmJ?=
 =?us-ascii?Q?pF6kPnJzUb0HecU1dAA7wwYWUH7vyIRKGQ+hkTsSxh13lz5Tegc4Nfw3m0TW?=
 =?us-ascii?Q?cZZe/DUrxJKPk9QjewhQZlqxBAIEIUScOwGGez17fadu6iBTM31LzHZ670hH?=
 =?us-ascii?Q?eq03Cx5tz82NHEqU3Y8/+MDdvPav9/I26ullr91iOg2QMrHsfPuZOqATdg5Y?=
 =?us-ascii?Q?SfBy0Hzu47eYAST2UZmsm7qUduEWOVgesXU9l7EyiQNuOYgEKOFcRZioQQa/?=
 =?us-ascii?Q?1Tla9+gBleVUQJipfDjS/escZpnX6AErhPS79s6imZvmghqhh3nOhc8YuYYr?=
 =?us-ascii?Q?3m/NCKZz749oC1jH6Gy8lBCBAv2ZkDKOUL8k0rxgmsvUSkKkRbgnD+RUC/SG?=
 =?us-ascii?Q?RlYWZCCsLg7fZVl5r6XL8fPsW1djpGhTHjn8bqoME3k6+uK8ukHtXqHRGdaj?=
 =?us-ascii?Q?Z9sh+jOf20L1SLyX52nZxlpCaXq7hpQ40tCg2ILw+5U+J5I/oNG5KqOTGjT+?=
 =?us-ascii?Q?1GQjrw028P16w4gHNYDRLFGg8fJe4taVXkCMxHiQAHdOCNf4ocFkOO3iQVcR?=
 =?us-ascii?Q?jpTcLVNisNLqredwaHTqg+MSte4WOS1DDMvTxK0EFuDSBs2cqP93amdMj2us?=
 =?us-ascii?Q?dIV9KQkqnd2rqCJJgbCO6nf10u44RB7woACkLUfVpHJgdAgxmHgLn9CUApXr?=
 =?us-ascii?Q?nEgDdkP+8kIUmkydMq6GD8ZGkkcDSmsCrJBiAklWjG0E/KF7ZWmr6b+9IRjd?=
 =?us-ascii?Q?nEfOUZ51blgkNPKueJzdOELgZScocOAsoJDmB6ZIkX80RNkgOUc+xaahqDOB?=
 =?us-ascii?Q?WgLS0/FzAoo7dzBlxVAX+ytOdgTIpqOWQ0T9mXvmYyNwXx0AYEQKbI3uhk9G?=
 =?us-ascii?Q?D92DpcBQES+OM8RoH/xSNbmo7CYhHF546YRPkZN5WyaQPQiMXRK9JP603KlH?=
 =?us-ascii?Q?/id0+W2E0j0XwikM6qDkcN6QvoyIWnLLZ1bPhmllMttpi5l0oObqUgVDDFOr?=
 =?us-ascii?Q?/r0IWn0Xik8zFJWc7aPSuo1fq0mAP8hN3IIHwMcl8T2HmG5iUCx099zpoWXb?=
 =?us-ascii?Q?JGpzUkjhVQ+q12P4cuUWQCYMAdYrQc5/f/ZVMXHwml6b/Lar377E3Cu/U8GC?=
 =?us-ascii?Q?H8roWbO0FiTWCX0mnxpYYUvoXMmjlAZ8HZCmMNx0G/1JiNbc7gx8+nxRgwRd?=
 =?us-ascii?Q?tjT13/D/6py37jMMyK1NYDZxbmoPa5GoY5fQ/PI3vZzZNSQz+S19DP4Qkh0Q?=
 =?us-ascii?Q?WM9DKz7y0qhtAUlG0iJhYpXI3Fb3Xv1D1dkoWrKEtS1f/0A9P+sLuZW/2Hb6?=
 =?us-ascii?Q?8WfsqCb8jzpE+eHeMMsrRwx5T9iE4EhhckhKRGYDP3E1PwHqH6WuGFSmykpZ?=
 =?us-ascii?Q?SM/UQktqzx5cuVh/4UU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7fd962-671e-47cc-b741-08db2f9a0f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 14:38:12.7884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLM3P//SeF5eBM33vVMORstWtk9jlP7Z+16oITYzftWamDvQkep0CjhfYdTpTTbtROcPFal4YLMraXspI4TpjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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
> Sent: Tuesday, March 28, 2023 10:26 PM
>=20
> On Tue, 28 Mar 2023 06:19:06 +0000
> "Tian, Kevin" <kevin.tian@intel.com> wrote:
>=20
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Tuesday, March 28, 2023 11:32 AM
> > >
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, March 28, 2023 3:26 AM
> > > >
> > > > Additionally, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO has a flags arg
> that
> > > > isn't used, why do we need a new ioctl vs defining
> > > > VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID.
> > >
> > > Sure. I can follow this suggestion. BTW. I have a doubt here. This ne=
w
> flag
> > > is set by user. What if in the future kernel has new extensions and n=
eeds
> > > to report something new to the user and add new flags to tell user? S=
uch
> > > flag is set by kernel. Then the flags field may have two kinds of fla=
gs
> (some
> > > set by user while some set by kernel). Will it mess up the flags spac=
e?
> > >
> >
> > flags in a GET_INFO ioctl is for output.
> >
> > if user needs to use flags as input to select different type of info th=
en it
> should
> > be split into multiple GET_INFO cmds.
>=20
> I don't know that that's actually a rule, however we don't currently
> test flags is zero for input, so in this case I think we are stuck with
> it only being for output.
>=20
> Alternatively, should VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
> automatically
> return the dev_id variant of the output and set a flag to indicate this
> is the case when called on a device fd opened as a cdev?  Thanks,

Personally I prefer that user asks for dev_id info explicitly. The major re=
ason
that we return dev_id is that the group/bdf info is not enough for the devi=
ce
fd passing case. But if qemu opens device by itself, the group/bdf info is =
still
enough. So a device opened as a cdev doesn't mean it should return dev_id,
it depends on if user has the bdf knowledge.

Regards,
Yi Liu
