Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771A6DAB3F
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Apr 2023 12:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BAC10E378;
	Fri,  7 Apr 2023 10:10:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781F10ED5F;
 Fri,  7 Apr 2023 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680862223; x=1712398223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HCJcv7TwBB3VI/aDOd/dOJ2/xE2+TTahhl5Puw4Rg8U=;
 b=ZBk2Iqq3NDXAAc850Mo1V2G2vPWtZekMb7aFG40G2AhsCwLAazzOMRoo
 vruxIY08JohJdQMtBH4xDKYYqOvyih6/vkv9FtMomyQpKs1uj09JXQFie
 cEawYSKHLFbYXS384uSH39zL1xD+tMYUwZB5KWMcmjZ19STA4kZu4046c
 CAb5LIzDAJTZ2eyzdMlNhHGKl5faT7CWxYcqy+xtE3LbIr94cIRbKGLhJ
 VoGaxQXQ+WtGHsxlloxMuSq99Tlnq4p6MrDwWsqNmTviGxv0YTiDNiDyx
 plLPn1TKkljD0XtbWNL+ElfnZX6MF0vLRkPQZ7URS9NvKLadautBtnddC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341714530"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="341714530"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 03:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="756675751"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="756675751"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2023 03:10:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 03:10:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 03:10:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 03:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGZE/miH8AEPOO2M6zlIK5nDi9YvoirQfzhbI0M9dzsR7OhFCldF0LUlV0nHKivYRYGQe+LGtPkvWONr6PJH1fHpx+QI8S4xIifA58f0v4HSp7LMolZpNgASRNtS34QBAzgaURou67jOi9v+G3EAbAH+WjWAnATFxAHklqL3i19KbqmcENfLuDUBz7ybKOk/PFGui92aOYyd+iUCQANtOvDNKK1Q+29QW5m2kVW531GhyuSlXtuct+t9p1Mkd1z85B+UItxCnvPB+w/1e5JmgcsE6CrNytOhsWjgaRf4V7kO64Orc0MZmVZgTjLVk2O6ullnxEgq4jl0Abf0AJ2bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3nHM+zJmeEGZlOH1LoQqa/geJaa+pBe/ti031bSVqQ=;
 b=c15eIrWqIKbCmYx53X9QsI/awiCg+gL86NEuHvyLeETUVhFePFhDVC4PR0gel8OApCovqlRvqUId2MMOZwVq6qsu3gtDBbgYIrkNqFu02sdKqX+BKhNXw/7PidE7C8ojLenYG7zpiI7k1JuOiQBYtaMOzqD1lFmHQE8VdpA/9wZa7IhdWvNbvak8G5gx6UTeJRbiWVS6g/HEo1xCegIIRm2c6bWYBW5inx3dzTbjHx9QrKyQ1mIU+UA8Ae4MZ2ptU2nW0zvF+xTxP8xL2yMosneFLmoI9Q+nS5ZB6CDnvCpMHFGMrbP1vkIjef/jPEkg/joAkOa2sFI+5B1rNfzSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 10:09:58 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de%5]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 10:09:58 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Topic: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Index: AQHZZKiCMJJkpNrujkKpjX0h05Zqwa8ZTcVQgABjWoCABfZ/IA==
Date: Fri, 7 Apr 2023 10:09:58 +0000
Message-ID: <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
In-Reply-To: <20230403090151.4cb2158c.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|BN9PR11MB5529:EE_
x-ms-office365-filtering-correlation-id: 91fcfa4a-a770-40e6-bad9-08db37503e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lqO4XuaiuOd5/U+Ce6+ceH93oQi1Sr25lRrO13gPSZWhWpFg6UOkBz8xTH6w3AZWpw2vXZkRtkWWpV5GmTnHGWs74QqeG+3K1Si36uy3dvTZu8nmb4kErFrtXRT8GKf+yJKxd2oYGdOXQdzuKUc63Ki/aTL/tAw6XqOYfMDtexjRqeW8Ejevz2hWoAaR1CTppf8kvZeHHVcKouWkahI5Wy2SCiuemF/iMAllyI/0mq0ZkaJSGnC8Rua2tBZtCG828P+7obnGv+8GWjfbIUReaplNTo290SLE7vrKfI9X4llLyT1OD9AYwwVzlujULgvOEEle20o5qZpWD6oEGf7AeHy/yNCa7KzJkr14W4vDH/U7Y5wvmAT3Y/hJeEKEc5J54lDXdB/wp3R46laidB93XKx8xac2TxFWyykIEQ/5WN3WW53dz+W4EVKvd/Gu9L6W4dSpxEoNZXPpo5+jZQYDYkq+AeTLGj0hL/9BrG0yeiaAsCrmFFmOF/HIt21GHRomTYk8f+ft67KeuwqXSFdZdrdRVB9y4gSHJ3vWvsUULsfuf5kgUyZFlQRZtlTc2LkT6fqu41Sr0Y5smB27hK75BNt6RQb6RYMfPsG6B8XFgyxXX7vEnT+z4jg30nj0NYXQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(71200400001)(55016003)(54906003)(8936002)(186003)(26005)(8676002)(9686003)(41300700001)(76116006)(6506007)(316002)(6916009)(4326008)(82960400001)(52536014)(7696005)(38100700002)(66476007)(66556008)(64756008)(66946007)(478600001)(122000001)(86362001)(33656002)(7416002)(2906002)(5660300002)(38070700005)(83380400001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MoxUMtV/T5Tj75hJ7axYXK8DdXxo5JtTldlPp73NxpE93/sNVOv+FER397qR?=
 =?us-ascii?Q?/VgBImJXuIWJotwVwBvc7hAHmwfFiLh3IjUI+X3dPCFp6m9G48DB4TIvOIsQ?=
 =?us-ascii?Q?nrx/3u9DWDCphcjAYxE5MLTGyun6Aii5bsdlRN7NU0Icx287PKSCPOnP6eeB?=
 =?us-ascii?Q?5CvzHbEzdKQF5ckWdMrs5KqvXSYH91qJ5YHd/ZbWTwG2MNcooOCWU2snnqba?=
 =?us-ascii?Q?8RdcfhHFVpQxspvbIY+uKX71nf1ng6xw3l/15VDKd7gkU0vH4qThiLETvOmu?=
 =?us-ascii?Q?QKvSLMbLNqmPdxe8XJe8zdP2RRZHiKo1xfICyUs1MlNDBTzTvWojaG/Ht3TG?=
 =?us-ascii?Q?FFwEYNgnbZCkpIkEd0vpjzroZdK63+tkekXQETKQ4YDRhtqRrYFqn1uIWgDo?=
 =?us-ascii?Q?W4xLYIBMFsfc2YoZvoErkoM4OLQBCcn+Usv6PV7I3o37DxihC8gEr+12NAnr?=
 =?us-ascii?Q?ZYU9TAjOVJtk735MCAAR3nGiPphfzbC+BrUiwC0HYjAe5UOE0m1haY+cy89D?=
 =?us-ascii?Q?JpWLBUs9LtuatRqyebsxITCYlHf/oT9JsewQrvG6/8XdnLtrtD1Rc7NvmceC?=
 =?us-ascii?Q?IPLLDWPVzted39KqsA17DnXdhfnfA9jcpOwxLmCMhB51Eoe1PLfH0lkPVhX0?=
 =?us-ascii?Q?FmOt8YeUa4qh8cr43DTVqAf4roXxsEiY81wyv2GaiKelVQuuxOnIC+jAlTCo?=
 =?us-ascii?Q?J7+a/gWA4i4IkPyOgzNW8kXX0o+le+aUITE7ckytkRrbX+CPQRNKr2HzHc5S?=
 =?us-ascii?Q?a8B4eITvz/XmM40l1RZHE3B5BiXgB0Lk90ofhLvUwZUfMerD6r7AtzP6w79L?=
 =?us-ascii?Q?hcLEz1y11/4dpJBP+PmhH3/bh0MOQuntQpypcNVPbO7kAGEP4KZXppj2GTev?=
 =?us-ascii?Q?1lc8/kprkrTxxjowEUvU7AW8XmuFXJa0jr6HmbXc/6L800C/4cCn7JPtEg88?=
 =?us-ascii?Q?XvzQBwEFDpTneRUc2lXN5lMtWA0t7slQrGh60MfZ2CQ/QGX2Z8X/mTdYSgHd?=
 =?us-ascii?Q?qipNX2a4Xb10Bu4E7ed3JpTOolvyj6mnKTQLXVmAMLCE34oeABhRGLkmUq4B?=
 =?us-ascii?Q?S/xdNNkXjgJG6e2S0xZf4a0asw6+pXH3iDP1/83DEL1jVz0QdJTttu+ee6S8?=
 =?us-ascii?Q?q+QYvEotanmlx6MkQFzZoJlsfYzmDTzKRfqQu8MtY3Wu6sCM5Wd1z7r/QdaG?=
 =?us-ascii?Q?jsGviNfeSuxK4+jKUpeHoAOuXtO/eFZ3e42NEMwgSwvbfLk+/L/0OpPw4lTo?=
 =?us-ascii?Q?xKblHuduwokzS1H/KR814B2jXyXMXqnaLJcZhPI0/eXmQBUDLczfEnxfHmB1?=
 =?us-ascii?Q?7KCK9Yx1LYdMUzTX5/RNPHk23EB9zjm6hP9qo8P7ky6QD/iDFUuSBjXdjzsL?=
 =?us-ascii?Q?araE9oicKSCIs+6rv66ixQ9BN8szo4MaDYhrcyNCdonVcsatjttKkfxu4K99?=
 =?us-ascii?Q?XV8utIaFpQyEvVU7MvcfOEdrAyiUffok1HAEewFpT6jT2NEU0QeMab8SZN2s?=
 =?us-ascii?Q?UqYPaPilU67tVZc9A9nYHhMW3nhE18By4hfjeMLSmepBP+GBIFQiBZQOh7tT?=
 =?us-ascii?Q?lg2gJzh29J6Hj3By3Hw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fcfa4a-a770-40e6-bad9-08db37503e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 10:09:58.6449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wylan1nk7Ma2ghM21o6CECuVbgYdkbIaI7IQ0OhF0cLPsU7ERMeJt+eX44832BOAhFyCSfrNVyw5ahDPC/eHaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
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

Hi Alex,

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Monday, April 3, 2023 11:02 PM
>=20
> On Mon, 3 Apr 2023 09:25:06 +0000
> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
>=20
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Saturday, April 1, 2023 10:44 PM
> >
> > > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pd=
ev, void
> *data)
> > >  	if (!iommu_group)
> > >  		return -EPERM; /* Cannot reset non-isolated devices */
> >
> > Hi Alex,
> >
> > Is disabling iommu a sane way to test vfio noiommu mode?
>=20
> Yes
>=20
> > I added intel_iommu=3Doff to disable intel iommu and bind a device to v=
fio-pci.
> > I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-vfio0. =
Bind
> > iommufd=3D=3D-1 can succeed, but failed to get hot reset info due to th=
e above
> > group check. Reason is that this happens to have some affected devices,=
 and
> > these devices have no valid iommu_group (because they are not bound to =
vfio-pci
> > hence nobody allocates noiommu group for them). So when hot reset info =
loops
> > such devices, it failed with -EPERM. Is this expected?
>=20
> Hmm, I didn't recall that we put in such a limitation, but given the
> minimally intrusive approach to no-iommu and the fact that we never
> defined an invalid group ID to return to the user, it makes sense that
> we just blocked the ioctl for no-iommu use.  I guess we can do the same
> for no-iommu cdev.

I just realize a further issue related to this limitation. Remember that we
may finally compile out the vfio group infrastructure in the future. Say I
want to test noiommu, I may boot such a kernel with iommu disabled. I think
the _INFO ioctl would fail as there is no iommu_group. Does it mean we will
not support hot reset for noiommu in future if vfio group infrastructure is
compiled out?

As another thread, we are going to add a new bdf/group capability to
DEVICE_GET_INFO. If the above kernel is booted, shall we exclude the new
bdf/group capability or add a flag in the capability to mark the group_id
is invalid?

Regards,
Yi Liu
