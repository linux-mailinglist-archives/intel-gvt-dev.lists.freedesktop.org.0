Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD17546C0
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 15 Jul 2023 06:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD7010E03B;
	Sat, 15 Jul 2023 04:10:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31310E03B;
 Sat, 15 Jul 2023 04:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689394222; x=1720930222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VeYpTK+q+7TAu0eQiuP2mDHSXtmdp5Z6kcrEW0oERM0=;
 b=Tse93kYjlpmpdF1rSDJrVEYKQBuITPdsWwEYa78W6nnQ/AdOmFn3F0CE
 +a1wIX/CPxGArNekVvl8cJfpLpnJvDj7k0e+Jk5wP87+K/+OdM9X6EFNT
 gPHnROybCwPERQ3dOft2VGqtwtjTbEvxS/eOe7Ix9iYZ5seWB1fvfb6gQ
 O5mqJTUlU5fh8BZty18TYNjK6l+o/WyBuqZowgqFBOA91qag5QKfei86A
 1PICy7EmPJL6aQet8TyRnHKzZgmoBdq9RdwBqwRVVLLPzbU+BAGwHJxN6
 ICahMUPSeoJ6FyD31N4i/RUcYx30xdjfnrsoYIAvNDtfqIxRUnhyxwl8k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345224649"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; d="scan'208";a="345224649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 21:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="716537685"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; d="scan'208";a="716537685"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 14 Jul 2023 21:10:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 21:10:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 21:10:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 21:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPs9By50LDlR3YN3NJwww8QgBrxnnJSN66ZeUch6rneAW8BD+76KYEcsF25nflnVqHve652JriXiZrVcS6Lth7Qe7EajR3gUiooBsgIKLytIEpLRagP5q4Jr2UZg9HeyI34tdapWodwbOYd8/Zky7sm5fejZbc2PavyMj5IYuM0TGKNgjabmaO2HqVQSDng0K989KiCC42XSs4WgFHqT6vETl7hwHt8SovN53kdUEN1DeK8CVCX7CunllBEx34w25BQ2anul+yIKP36mijXUxnLHIfKNQUEcfiyliGMtdePpT1aHl4om6AwLD75U76q9Sjte9JCxrq/b95Ig2/d66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFs3DdPQLrsEHvF9gSAkFYQpEEWc8SiNDY+/sBxz00w=;
 b=T39f1Y+B+Lu2AWndB1DQUedJQilDiOGQqY8itHlwywu0nYH7L6ZkEjNvrmwbsuLHUj48j1YEeLYnTmnvVjSmmrWjOPZ+HGLJy2OdmEuF17yC6OYaNIsCh6yB41zFEfLd2LjpxjNRqRdmTlM8E8YvPjHURRMBB1xi2IbZfrzoYSNWr8xKl7iDQWKICTFgZYPXRHM5Yng94v0WVhkeU8VAYFc4Ke3uKOcmN+dEOkB4ZAprkSHz4iedJ72cPhdmcdRYgIy247iyD4XCjQ9ZJTf+kH01gjxMvBwRkdb3DLYWm6aa2EE3peV9pQ6Pz7eKqPqHHii/p+yqxXOuXiK9CberrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM4PR11MB5439.namprd11.prod.outlook.com (2603:10b6:5:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sat, 15 Jul
 2023 04:10:12 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::806a:6364:af2:1aea]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::806a:6364:af2:1aea%7]) with mapi id 15.20.6588.028; Sat, 15 Jul 2023
 04:10:12 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v14 20/26] iommufd: Add iommufd_ctx_from_fd()
Thread-Topic: [PATCH v14 20/26] iommufd: Add iommufd_ctx_from_fd()
Thread-Index: AQHZs6PIOvgXPxrjcUyYYNzDk4faQK+5VWmAgADnYgA=
Date: Sat, 15 Jul 2023 04:10:11 +0000
Message-ID: <DS0PR11MB7529DCE581527802A932064CC335A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
 <20230711025928.6438-21-yi.l.liu@intel.com> <ZLFZr7hOTLktRthU@nvidia.com>
In-Reply-To: <ZLFZr7hOTLktRthU@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DM4PR11MB5439:EE_
x-ms-office365-filtering-correlation-id: cb3e3655-ce5d-407f-874b-08db84e96243
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q09IxGb4z5DYKPMpjxBId/AIvuB174Kv0ccNTqLnrnK8ai5nkaOv6Ln7FJSthahajOXUqNzVsT/uh2aIeOwke9ItjMf5ZCWdbAjT2F1x/9FCioC9wjSJoVAUI9hxBsRUKTxclLw1QG8XBbeu9nHJdF7ajZz4A3Rw2RiVvKK6UrJFf1v7vlXTYkYFLZv/AniwVj+3GfHkVzUuzgbK/yHMPUyN0W3ZDMAQ5IXpwQeC7MEXgUdhcYOtqIJBc5oxXLE+l5SGVKlA5z8BnGCZNnxQAh0ZQbferWxZLGPXT/5eHNyA9Svvfw1A7Xxs1s1K8wL24LvQMBrYyWUMtaCENFDBcp+p22IgQlVyrP37vZJPyC2belueXt//1QgmkRlW4+j1GJuR05GG37EunXmUvA4EhPPMy562HJ8Rju9NPctRNUlDfrVTrDz3Ak1vBIsQGP6B2WXZwq5bI+4/Ld0xy0CILMgAC5oXiwlbXZMfNl7FlLcI0cbr9rt1rfWWnCg3ZZ+G36uhxw4GuXgtf/5prMyxJRAMzMSxuvBqs62hjU+iPkGgMVhS65rsjUYgkeEa8dM51mpwMnZCqvrAwedVl64GcsXmWeV7dbynq4Vks5o2UpRuX6tzyF/jtRg0FgOnP2rd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(316002)(5660300002)(41300700001)(38100700002)(52536014)(122000001)(8676002)(8936002)(82960400001)(7416002)(86362001)(33656002)(38070700005)(55016003)(2906002)(7696005)(71200400001)(9686003)(478600001)(83380400001)(186003)(26005)(6506007)(4326008)(64756008)(66476007)(66446008)(66556008)(66946007)(76116006)(6916009)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5sylxf1aLHtdbGn9Cutb+DExj27hpogINwPADV3OWb4cJnXlFVNuL/Hui4mH?=
 =?us-ascii?Q?ZEyo5NYK/Gb447w9f9Q265eGWulHOSt8Da6n6DlVU8DLYzlz4bE/EPGVSfMk?=
 =?us-ascii?Q?WvRoEjpDhlonGAEPWdNMsWj0Jjb2BnPvyQ1fGw3HlJ0Ij/Rmzu/F4FVw+G00?=
 =?us-ascii?Q?rx791BQN816SK7MvpmYld+9CeWe6rZhkuzA2uAykL+NIDOmqAv6E4D53ocAc?=
 =?us-ascii?Q?JTj9Cwfl+Kcd8vfzOca3DYBZPgi32FAhRnooMbuKdj0dL2/w09WbJ7s51B+u?=
 =?us-ascii?Q?TC40ey13dpfRikrlKigtKcogqA5EQk4usZxSMwNagjV133xrPerCddKhfD1W?=
 =?us-ascii?Q?wQGSeDOAMnWPreTBNlkv6Ue7HTecE+Rq4kFLZ01owUufniWMscF+1Y4RtgfU?=
 =?us-ascii?Q?QKNJ2Z54XEouOEahQ+wTJIxsQ4vuTwYOjbcZlPUUonRDiWBp6pJXGoX47Vf9?=
 =?us-ascii?Q?MpcLXGvh2teoI1O4Bvjdyw/uOvqhdWsTnTS4Kgx/bIDm/DKHGDs4s/N05uP6?=
 =?us-ascii?Q?bmglYw3TC7KIkmI588icwa5UoVGchs/aEB8SJ5RKGufVpcNFbq55ZusxkFG5?=
 =?us-ascii?Q?pFfyAxDfEwYbomSTUVCHmgCh5EvVFXk7x3D5S/kKpVaGoFUiKNllF2QO8Pkj?=
 =?us-ascii?Q?nWqXgp90fN7HnFbsna+cvIAAvtzXROUVTVxptJB9gXtDr2JBbrBo+/0xzHi3?=
 =?us-ascii?Q?mM96li322TNxdW/f33j9lhPDTLJ0Vznvm7+nLyPUQ4X6D3oaJ+/SVQ/X7CGh?=
 =?us-ascii?Q?cZrWMSiap7vNg4w6tY+kSsrfYjJDlpBHWCkcX1bukmVr90uYp2fx38TmnErL?=
 =?us-ascii?Q?hz76dEgUgZsCduo/uS9bHtJz8hEvbx3CmydlvSOhX4ly4pvrDDecWviY+FGm?=
 =?us-ascii?Q?pjkt3PO7pkz1FHByfchKxdOyWSXK6SJsNS2i5z6btei+EgfayRJmsZEiDyBO?=
 =?us-ascii?Q?vJj6e8cb7QY4a42Ow0TEGYfLSoc/iSvObwWG4vSnc8FHc/yNrsLfnepHZt/7?=
 =?us-ascii?Q?YGgoYkoL8X4izJKeC2x3zgHnyEFTJwG0vzIZY6JId9HnismP4ZNmZ3vFa2Cf?=
 =?us-ascii?Q?wGmHwuSTM64ald1MTysbw6JO8AVFlXCz/2aiOTrTRAuDVxZ6WUyCBa2offm1?=
 =?us-ascii?Q?LgTMm6F/+l0RhqOWVapqwjek2SNU7tvHPitXelF4CncjUTTnC33iHPc/Gkuy?=
 =?us-ascii?Q?ssVfb6p2Uzk0Y1EQOab/n5aZ9axvFvU9H2lmzKzXoaEoKDcJTqVeYzyKGhRf?=
 =?us-ascii?Q?27L6PNhD532qMTcpdku4tBWT9sk4fEr3UtVylJI86X7y4Z1y3EJv6x8AkISv?=
 =?us-ascii?Q?wG7r6z8wokH6sewv8fogU0l0wv7qDG9cnqEWxV3o11vzKCbvQmHHkDxiKwFF?=
 =?us-ascii?Q?OknXSewXNlRDvdXvzAhj+UNEg10K69Y3VMKG3jpN8oufnbgGNFgGdV3Bntgg?=
 =?us-ascii?Q?YcdDNT7e/uWJgzaLaS17ja8YyJAddXBJWtjEb7hL/MRNEIYGndhkKeDJw9do?=
 =?us-ascii?Q?oCMs5mYkPzrkdPZfaz4jM+Zvt464OvX4OzaqWl3bCnLyVrTg9+7UUa5vZc3i?=
 =?us-ascii?Q?r4Cosdin/yiqLj6/nCY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3e3655-ce5d-407f-874b-08db84e96243
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2023 04:10:11.3450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3bx6b5hHMYw4fGL9k6QJnJ5jVF6gU00UU+kIzzfLOLXig9bH2+pMAKq13AecaFNGLIUQffnwW6wxZjbivaklg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5439
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
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
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
> Sent: Friday, July 14, 2023 10:21 PM
>=20
> On Mon, Jul 10, 2023 at 07:59:22PM -0700, Yi Liu wrote:
> > It's common to get a reference to the iommufd context from a given file
> > descriptor. So adds an API for it. Existing users of this API are compi=
led
> > only when IOMMUFD is enabled, so no need to have a stub for the IOMMUFD
> > disabled case.
> >
> > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > ---
> >  drivers/iommu/iommufd/main.c | 23 +++++++++++++++++++++++
> >  include/linux/iommufd.h      |  1 +
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.=
c
> > index 32ce7befc8dd..e99a338d4fdf 100644
> > --- a/drivers/iommu/iommufd/main.c
> > +++ b/drivers/iommu/iommufd/main.c
> > @@ -377,6 +377,29 @@ struct iommufd_ctx *iommufd_ctx_from_file(struct f=
ile *file)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_file, IOMMUFD);
> >
> > +/**
> > + * iommufd_ctx_from_fd - Acquires a reference to the iommufd context
> > + * @fd: File descriptor to obtain the reference from
> > + *
> > + * Returns a pointer to the iommufd_ctx, otherwise ERR_PTR. On success
> > + * the caller is responsible to call iommufd_ctx_put().
> > + */
> > +struct iommufd_ctx *iommufd_ctx_from_fd(int fd)
> > +{
> > +	struct iommufd_ctx *iommufd;
> > +	struct fd f;
> > +
> > +	f =3D fdget(fd);
> > +	if (!f.file)
> > +		return ERR_PTR(-EBADF);
> > +
> > +	iommufd =3D iommufd_ctx_from_file(f.file);
> > +
> > +	fdput(f);
> > +	return iommufd;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_fd, IOMMUFD);
>=20
> This is a little wonky since iommufd_ctx_from_file() also obtains a
> reference

Yes. that's why need fdput() always.

> Just needs to be like this:
>=20
> struct iommufd_ctx *iommufd_ctx_from_fd(int fd)
> {
> 	struct file *file;
>=20
> 	file =3D fget(fd);
> 	if (!file)
> 		return ERR_PTR(-EBADF);
>=20
> 	if (file->f_op !=3D &iommufd_fops) {
> 		fput(file);
> 		return ERR_PTR(-EBADFD);
> 	}
> 	/* fget is the same as iommufd_ctx_get() */
> 	return file->private_data;
> }
> EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_fd, IOMMUFD);

This one looks ok to me. Thanks.

Regards,
Yi Liu
