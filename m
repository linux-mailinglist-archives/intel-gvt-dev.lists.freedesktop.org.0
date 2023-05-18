Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB9708128
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 May 2023 14:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1211210E520;
	Thu, 18 May 2023 12:23:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE38210E521;
 Thu, 18 May 2023 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684412621; x=1715948621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PoiZxbvbxlL2Y4buCRoar/tnP++nb9PvcXpP6aWB5oo=;
 b=DTzf+Miy5G3ajRLnYZAff1BE5XYa0nKIzb3upT4PSthRRmfiCSZXOVlN
 lCMx4Tu7ZQjaVbSxonnvMvb3ivRdyUJKIBjoE4VOeeiM0huQESG6MLXO6
 GH+3flQOkHUp1aPB5LlV9dmbn7Qom9CPYr/gDolu83QDmS8zqS3DhjZWR
 BlclB7/M92N1XAQi49LBALoSSSZGboz001obpzD6Fcxkf/HcTalp8MuM9
 b753pzlWECQrdyme0aQaG9Czld+1uxzhrwFkdWaDimMK7Xn1HxfrO/LR5
 ZdzAPRIIR93y4wFcmVfGR81Jyofat0o2/axqUQfoQU7mXHf/1y2/AYgXr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349562626"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="349562626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 05:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732859322"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="732859322"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 18 May 2023 05:23:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 05:23:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 05:23:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 05:23:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 05:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGfQxEluc1cCSMLM5QuDGBC8YIEuIl0OzVpCX5NBkeOK19wjRchI2tOG7ZnnVi9QckX1q6n1AREFbuki/VoFd1+DGv3XZSG1uMlqvZGLAbN7HPBr63dyzjfYgzHJx7TZ3vvOqdMBV+eI+Q+i0TY1zXu5BL/TAau0WhItNIhLvkUxBRA5K4tKREuMPjRmZDeKqkQe2EpLbY6IfTwWZgShmFeiExiouG/u1etQmU+/I50O/SDJMGc2YG5RAQ4L9cbxN8y5qQbWmr0MfITkXsm2n4t9lMuIHpJSyKLOphelqqe2trqW/kbpy099lTIYleD3gMTBTWkoaaZ6xs2pIlcCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoiZxbvbxlL2Y4buCRoar/tnP++nb9PvcXpP6aWB5oo=;
 b=O2Rzo0cReYWIRfnalxqVzt+ib/AdQ792Lz7JRY9aaOR+zCzLryRyWN0HNBfDiOt5TcJH1c4SgMvSC4CzY4briAhvSj7dqyldwBJr6uJuZvMsT8FqRCqb9ptY689CLWyO28R+Npx0dIB7mVIayvwKpwFD5COv94FELCwC3Kc5Q2U5zHdYrBnGZCqJJZQ5inND8lwhLQfvrcS1O4r7jIeDoyfE/uYL0xK1e3jYRdOY1V+lpFiKUHW0vVJ0EYrD1h7dGX8kucZwiviJ27oClB59kMqrsPyCn4hOSJDjBa6CkaDSIPzrUqyo993711SYEcsamC2NRzUayEgjEmhzzqQ1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19; Thu, 18 May 2023 12:23:30 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5%3]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 12:23:30 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v5 01/10] vfio-iommufd: Create iommufd_access for noiommu
 devices
Thread-Topic: [PATCH v5 01/10] vfio-iommufd: Create iommufd_access for noiommu
 devices
Thread-Index: AQHZhZ3cwCi8E1zoUUyDJFJWvTO8nK9evhqAgAAPSYCAASzE4A==
Date: Thu, 18 May 2023 12:23:29 +0000
Message-ID: <DS0PR11MB7529AD3369CE1F296086A607C37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-2-yi.l.liu@intel.com>
 <20230517112609.78a3e916.alex.williamson@redhat.com>
 <ZGUbAzl985p5kX1Z@nvidia.com>
In-Reply-To: <ZGUbAzl985p5kX1Z@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DS7PR11MB7932:EE_
x-ms-office365-filtering-correlation-id: d822f4a7-a3af-4146-43ea-08db579ab071
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jTzZuH9cEQuY/NmSbX9GMxn5MWrDQ95V9iMLg4rul87H3BvLxDQScg6lXD51vN/r80EklLPiqzuwEYHCFBl+6h35k5vi64ZZoYex3UXoOpf41hHWv82LiMHrD1i9bKU433ohskKHBjuFof06Y3J/YRf5GbFhokbF67A2bmYUm9HsQWiciJx8EZ9J6Ek5xvlgRzrHt4fgQQe64/mp0nUnRFYRtTyyTnFllzjSXeBTQ24VFWxojffBtAuID1f1/AOK6+KYbDOGlOBAgTNIC4dHinozBgbci30DRJQLoO2OhaVW/+5fsv+nylLc8VNdAfdVdgztXK2TWeG8fN7sYogtPA4vEQaTum/Z63Rl4YyEEj7B7hlhoznq0mkasrPipcnz9bUVFcMm/CX49+KDlnwrKkCV/H7VbdFrrMzOeBCuneijsuxpj114cNAThzaDZlUd/w+1hMWQdY9eQPwl4fiffxkW57VWSAh8eEeaf2FfPdi6zl0ntg0QDFYN8z/pGj//8AkojKVgQJtmSrZLYMqgQt5h1TSqjiJxSdDWZt6EN3ICrk535oT1lWDOga/DQId4Uv5fOZQduAdacQPm6tH8Tstn2QkPNkRPuz6/SD8hXhzXz1wpIz4P4CIzH1hhcjSFq3wyAjNXM9agSdKrzv8VTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(6506007)(26005)(9686003)(186003)(5660300002)(66476007)(83380400001)(52536014)(64756008)(66446008)(66556008)(66946007)(76116006)(4326008)(7416002)(316002)(41300700001)(8676002)(8936002)(54906003)(71200400001)(7696005)(110136005)(478600001)(2906002)(4744005)(55016003)(33656002)(86362001)(82960400001)(38070700005)(38100700002)(122000001)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/doyiCwG1IrzR7sd4dGUEm4FDfRmTzDkG5jKSAEzsnQLxTufKyNj3WiyhesH?=
 =?us-ascii?Q?we1Zt1J6ox96spqwvkZR0LloU4zdxw+XqZ3IJyzxrnnALhLO64JwYQKYIcNP?=
 =?us-ascii?Q?VWPvh2ZX4WhK5jkGvY7kANE7j2OpkdpNyJ3PaWZJnFGnu7W138BV26HFJLgI?=
 =?us-ascii?Q?WOs/PKkDH5Ak2yGRKAnvRQ+rhmJ4JoUbrl1AvqpiH6M2KXxqDMujLE/CSZGp?=
 =?us-ascii?Q?bDDbasWkHPp8/iCPwq6AHEQUlu3wYLQv6Cl6xk28gIhPs7HLgjmmUipRiWrE?=
 =?us-ascii?Q?AsVABnZn9jXzoRJLX7N0MK6jJnETECiBuADsLvPbEWn0oiDZM5QcR852uEK5?=
 =?us-ascii?Q?n+iXQfeI2mw0z+bMuzfCnsyiibWOJ0o/B+tpTd53a+bndS2V9VuZd9itMTFt?=
 =?us-ascii?Q?Zjtitn4pZ54biFLzstRaMFFBTes6dz6bfhXUEST/qfeF9RZDo9rv4wRGuRFn?=
 =?us-ascii?Q?ZiDmBh+tPuudCCnLMiy8wWrkiBOzvkNTPOz0d8oPcAHzlyqxeE/EsdKZ/8Ju?=
 =?us-ascii?Q?oVw2Pz+z9sTJB68VSHU7CmI+qNWYX0qxbFBgRK50VcFqLf56IVhbvpz+wtoK?=
 =?us-ascii?Q?5gfSRM+ZS8HepPOjcBKg6P3T3lqspqKwBIBBZlROGErSTFTLgNrZBH3buDhK?=
 =?us-ascii?Q?tCQey+9ESAefxSPgwy7OAu0F3SeDGh9vHENv1Mn7WJ37B+ultg19KxT695ww?=
 =?us-ascii?Q?inI+5O19qaCCyGMpTBaZ71uGWFqk9bFaeN7ZhCdZa2DdEMr8guE5dkRxdoVh?=
 =?us-ascii?Q?KVX5cGUajjCHF2EfC7Ensh7tu90uNTp8IsnGTGjYfvwACU+3f31BUvtNX2P0?=
 =?us-ascii?Q?EXsp2Axw9P9eD983ZKtPJDXvody4JpOMWfDJGWA3aGF6lvvAEnDoPvLfqh7b?=
 =?us-ascii?Q?e7sKYqPWyAOOifXcgHs6JX069jb9sMOihV8///r25CDVvFylcxb5+SNB8+Hw?=
 =?us-ascii?Q?jMfXzHZi7LfArAtFY+pvchEGDOEN8IU2z1ESMn4vmAkKfJQkeWjxw7oF7cPC?=
 =?us-ascii?Q?i/8xSMxiKDx08oXbn4nP4ozngR/g9lf55jmpaOAEgA/RhEkM+F/G7p79yybR?=
 =?us-ascii?Q?pMAMrc48PM2egqv2AaeMz4esYT+y+JjSWQ4xrQDwEvqxuUfWdy7qO6/AcVtc?=
 =?us-ascii?Q?T2FOT+FDhlm0rOb94fn/eibIZuU9Xj7kohzpjMrymTCyBuA8KMpsIf7ya9vf?=
 =?us-ascii?Q?LoHEGDVKncZplOaqsKqbveRKckFnSUcFl055BC6+PebeKOag5BngxR8LpLdU?=
 =?us-ascii?Q?OIefu4YTGo/O7D3cYYq9z86WZmtQ/6QW6IC3ZDBYXIsKkMSHbki7SB8BFtZ6?=
 =?us-ascii?Q?PqY1M8SCTcbp+SzhYO6IAj6ZaU3anIEpz0tiqmLUCU3ZjZculn7z/d+7dT1h?=
 =?us-ascii?Q?H6zj9WLLk2i9Y94ddRQLrunNFreZCoHrukeONHFvwuQa0rsmKeV0RDuNVTOe?=
 =?us-ascii?Q?HFvN/+Od17RzK0/W6JJg7yCPZTOMYpF3yC8D0TI/R2yOr72StZ5B8HtFDxf4?=
 =?us-ascii?Q?4UOCDDhE6WragNkJrZid2FfQ+rN1I+g0B9vrCEBZU7OywmxGsa0v07ohxuKT?=
 =?us-ascii?Q?1bTPF5vdNShfzRUwnr+8/a3pKxAZaHtk0j5d6zj0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d822f4a7-a3af-4146-43ea-08db579ab071
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 12:23:29.9559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: an5I/OvgcgeP4MziwyEgb/cFGo4biifOBBUkZp38b/uDPZdjm+OsoXr4ojMtLfAtl/p2fH4NPrwC2Xcwhe8T6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
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
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, May 18, 2023 2:21 AM
>=20
> On Wed, May 17, 2023 at 11:26:09AM -0600, Alex Williamson wrote:
>=20
> > It's not clear to me why we need a separate iommufd_access for
> > noiommu.
>=20
> The point was to allocate an ID for the device so we can use that ID
> with the other interfaces in all cases.

I guess Alex's question is why adding a new pointer named noiommu_access
while there is already the iommufd_access pointer named iommufd_access.

Maybe we shall reuse the iommufd_access pointer?

Regards,
Yi Liu
