Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983D6D0669
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Mar 2023 15:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E809210E423;
	Thu, 30 Mar 2023 13:21:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8BF10E408;
 Thu, 30 Mar 2023 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680182459; x=1711718459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=soBALLv6hbDbqN2IePocOOijWJYQd9azLLjRvLFpsd8=;
 b=e/HlY+z30ZhwEocX9vzgnxtBhKlA3UauacYYktaQkOGfqIkdLIMDJf5R
 G3zw5i0zJjwoT5ofIY0i3fHYakP9iWhluxzkfv9Ur1WbUzL/OUpuCLypJ
 E7rPTCzw/Wi3IdpT4SRAmSbUFVM9kdKhzJmJk/n2WzQd3DqwBbfXxv/C+
 zTgTiQHLpmnqShQZif5Q6OflecB1W1Wr6l1j2Rkv/4O/dOu8xfCG1PrK6
 RrJQH6lKwJ7+6tq6gJZUJQ8F+NIV9qwYyWcI/I7mrPyeBODl4PrUpVNBw
 OkXLGvJjR+nJJCC6VIe6zPrA0BbezGEwAItt7DZHlmn0un3aI7Cb/z32v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343623136"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="343623136"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 06:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="930722450"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="930722450"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2023 06:11:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 06:11:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 06:11:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 06:11:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 06:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYjLiiruHkrzZL4ny7lHB6Ke7PxSpbE2VRk4lBNBdm3TQFYNiG0BfR133WTM6H5Pr+i0D0vmBqxwB9dIImKU9QZLinl0eR0Pr2xdj81Zq1YGOg605jdfqBYZb1sib0HfYYeDThKbakj/NoE1WxgKOk/odMhR5QBEgLaI2gmoGN36+K23cqP/S/VHFX6GM6ndHlwUZ/6MD1hLmGcCw08hX5yEpnQUZZvrA+E5Qv0Gvu6tJxj8NATFjvsM5tmd9hQjjDcHDDQ/f1H3qyFcUfgayRThZo8cKGiV8PpXMeM0Jeuxkc8arcc+3t83V9QrpAlerqlbkO4mmL08DBYMgy2k5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18SbTrCj3LzF46xOQn7uKvJL1KuRt4QU8NN24VIPXLQ=;
 b=jZGCxhrmY2uCC+/BPOUrZnqmRjA9x50mm6vFWes6v8yCp089nKzENjrYyRkZ51ZtrOsDRGD/Rt/DhaWZUQPdpkXH0nmV/cE3QcoNU/ZNiHhc6BoIgzilSLA1XOa4ZohjZOT+zJ7kFSgRObP36gpr2+azZZx62cP1sNJZ1mPGoaGVtrxNvYhnjypXdiZilAfOOIGjU6UWheUWLqecLKB94vnWgGGSeDQUluSO0F7wiJkxV53YqUiVskcOrqVF0E+0Qz+nGlfmWfXL62oN2QS/tDzKoI4ZawgAcARMsExREj1eMKnzjnRK2eUhHlmuU9Q082FjQgSh7sHgn9twzCTBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 13:11:18 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ca24:b399:b445:a3de%4]) with mapi id 15.20.6254.020; Thu, 30 Mar 2023
 13:11:18 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v8 24/24] docs: vfio: Add vfio device cdev description
Thread-Topic: [PATCH v8 24/24] docs: vfio: Add vfio device cdev description
Thread-Index: AQHZYJBJIpx62GtJiUCX1M8lyohqra8SX9iAgADwF0A=
Date: Thu, 30 Mar 2023 13:11:18 +0000
Message-ID: <DS0PR11MB7529937A8CE83C8A141C99A1C38E9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
 <20230327094047.47215-25-yi.l.liu@intel.com>
 <20230329164749.2778aa04.alex.williamson@redhat.com>
In-Reply-To: <20230329164749.2778aa04.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DS7PR11MB7885:EE_
x-ms-office365-filtering-correlation-id: 65e205e0-2cce-494a-dc8f-08db3120400b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DUwPH+uMF2bOHNQyPTa1m76Y32zEn3OsoQAqTglsi8gtQYFHXoeSs25sy3YEtnQBI9/E+OHFhl4p9R8/B7RczqhaXgff1s3YURgoFyZp5XKIfC7whAf/1QGxbgT+rjvp3TM+NUz8RjhQz2IkyEiqTCbnyMHZ7VEKW6lQgLgES56wyisBagxUlAksPhE29GKQ+IZHDGX1ZjCrj0ztO+4cIbh91wQxqYQvcQ2gqQL6L1JXye8AiAwG1M0mQ2dFMySv93vyELqkNwGZvF+QvqoCCThyMI6LWCq1df0oyTTjtyDvaTFjamaHF39ezmXZEFWWjPiyD28EtsYjU3WlXWFqYB/rEw3WewD+KcbLRks4Xh7Sjoc9+DY39CIDCIyyzZ+fnFC9ffn+otWzLcHft+ahVthC/WdhnzjmnoibISxTmxTIUnmPKZT5M5uRlkTxA3AazwPac3APUUs4pcgOlHlNnc1pbEIGuMp8fryh7kba0XGbJeteXzmzkw4F7OgaSypN1JIEhHNm9CByhQQ5/dY9v4Dq3wkqnuVYbWzkuH8WThFDzUZ05CqDQhM/IxuURHs87qOiuf5m6hfHC86rdqDoZwKmpGbsn8uNuvmnPUFizI/v3VQtzCFs1l8cjGESDVIEYRC69c2h36f7AIxBufDDlLJMItheZcwFBwKqReJu6WI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(478600001)(316002)(9686003)(6506007)(26005)(186003)(83380400001)(54906003)(66476007)(7696005)(71200400001)(38100700002)(122000001)(86362001)(8936002)(5660300002)(33656002)(38070700005)(55016003)(7416002)(52536014)(6916009)(66556008)(76116006)(66446008)(66946007)(4326008)(64756008)(8676002)(2906002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kv1yGk7zbZRnhbgHd+Ed4aBWG0IIst2Lak4/2oK0qkGuenXjqDfwIrFT0l7U?=
 =?us-ascii?Q?JONVFGB3yPrGaV2ISTtHgbkvqy0pGLZ2BsMm97MxHDd2qOuoSGIV721ZfwwW?=
 =?us-ascii?Q?riueP5DcdOnkqwA7JWuvGRDjakFGgMg94lhHYgXCrHu3gGAieOMPmxY30/7H?=
 =?us-ascii?Q?XGJmHyccV9OZnskhLHNQqskrOythJCQGLCzso1WfoLfSI2ovY4EM8izfsaNl?=
 =?us-ascii?Q?QWa7Cz1mGsdJPxpuAytXOOWNq8jjKU7EYi6p1s/1kx9FB/OZ/ARj2SQMCo8r?=
 =?us-ascii?Q?Bx/qm2bCWBpmhfsBFF+jgKPsn3xEwXgiQd1moY5wE3BFIYmpDoZYsPBijq+E?=
 =?us-ascii?Q?It5lVH/gk7x5z9hl8na9+HUN/wiuoXSVrI1xE8IWh11BqwcaKdcaYayF3gkm?=
 =?us-ascii?Q?7hUAlMcp0KZbeHp7K/tWVFL1uBJFQoxo7rCbFOsMf9tYe8KOzdTU4CyiNwwh?=
 =?us-ascii?Q?jGmiWk3NENfqVvZPsaRehhGW9rJCJlD7eSFM0TapB5K9gRfM8f522m9/Yvnj?=
 =?us-ascii?Q?0Tzlh/tkFjaIoaUUWDCkjtHjVxKxEdYNoJh1Da2UDYi3EJl79bf828+1t+FZ?=
 =?us-ascii?Q?So0xfIfuCn0LT+wd108QvS/V81PPnDZAE7rz05YizXQsewlmHo/D30G2+zk4?=
 =?us-ascii?Q?GsRDl5cTBPcAjawkkbtjjNWhAc0VBkRQdeHYGSB08IpRMSwZTVpyrhOhUoj8?=
 =?us-ascii?Q?2IVI854FMHrQzGKejSWeS5pXOGGnfJt2TjGjEj8uHkl3BuIXGFGkvraQzmoA?=
 =?us-ascii?Q?e9sKJF6tWHf0jQ1HNHZB0QtMV+d+rQxxF+mGy4MkB66KaLdkUyjlD0eStox8?=
 =?us-ascii?Q?LvERDroZNTI7scrLT1+GNezjRgz7/o0m84YQZ+Eei7dckPTo0hW4ZBYbI62H?=
 =?us-ascii?Q?QkUQ1xiIccD/Lm6AzxKcmuRMC1MUfuT7xxwCfBzF6jL1BwXqq3WlWDU7wLLk?=
 =?us-ascii?Q?tgWXOu9RVRtwDy/tf3DUMB6HTDe+VG0rX+5Ggikak1NtxI5AXZO3ytum4+VP?=
 =?us-ascii?Q?bbGRgwLYUZJ86xv0BRLVe4axfdgsm/QIUJE3vmyd8jBffK88TDva9ndUILRm?=
 =?us-ascii?Q?E9US/kDOMiLSA9I81eLNaJM/CF89xbnprCLENUySQ5gC1A15/FK2BXSg+15n?=
 =?us-ascii?Q?1s/MjnSQRJdZtRspWO5Dw3NfTe+8+IbKHl6v9HVJMpYPAKl15VlUVl2kCXRw?=
 =?us-ascii?Q?qZIf9gdazTDKpb5MROiQvGB2Vxcr5P5IFSG7vNgHkLX2BGE+hLtzn0M+9Hna?=
 =?us-ascii?Q?BgTC/48wRKm09rhcEevtZNZnyZ48a/pZvx6IR/BUgh8BJBLdjSeqx9yhIDuf?=
 =?us-ascii?Q?Rgm1MrpvlUGLJ5XsXWtum3b/CX/WCJzXeAXqsGRFLOyi9lKgihiy5vGtJnuB?=
 =?us-ascii?Q?V+3u1ZoI6YzMtPvD0RCqOePIm0bnZc27xjFwSyC5m1793bioL8/sdNPr3NJp?=
 =?us-ascii?Q?ortA1uka/FZhlR0vjsJt74gP5v63QCGsNTCvCxjuqg2kRCOEuiawdOaJlZo/?=
 =?us-ascii?Q?zQWzE98UhyIU8Q7pYGLPW29RM/fi6TD8YCrC4fCNNwzX/m1YHAx00g0EI8VN?=
 =?us-ascii?Q?UttWRAeka+qvfz0VN64cYq3Mez7TgdYiUdh9Mtfg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e205e0-2cce-494a-dc8f-08db3120400b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 13:11:18.5987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkERRT10sGRm17uVXJlbrw1ddWkbNHzy5aHH5WJt1Ldq83zGjFoAedMAh/R2k38sbPsUaRqXmnzfdIC3GCFCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
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

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Thursday, March 30, 2023 6:48 AM
>=20
> On Mon, 27 Mar 2023 02:40:47 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
>=20
> > This gives notes for userspace applications on device cdev usage.
> >
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > ---
> >  Documentation/driver-api/vfio.rst | 127 ++++++++++++++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >
> > diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-a=
pi/vfio.rst
> > index 363e12c90b87..77408788b98d 100644
> > --- a/Documentation/driver-api/vfio.rst
> > +++ b/Documentation/driver-api/vfio.rst
> > @@ -239,6 +239,125 @@ group and can access them as follows::
> >  	/* Gratuitous device reset and go... */
> >  	ioctl(device, VFIO_DEVICE_RESET);
> >
> > +IOMMUFD and vfio_iommu_type1
> > +----------------------------
> > +
> > +IOMMUFD is the new user API to manage I/O page tables from userspace.
> > +It intends to be the portal of delivering advanced userspace DMA
> > +features (nested translation [5], PASID [6], etc.) while being backwar=
d
> > +compatible with the vfio_iommu_type1 driver.  Eventually vfio_iommu_ty=
pe1
> > +will be deprecated.
>=20
> "... while also providing a backwards compatibility interface for
> existing VFIO_TYPE1v2_IOMMU use cases.  Eventually the vfio_iommu_type1
> driver, as well as the legacy vfio container and group model is
> intended to be deprecated."

only TYPE1v2 or either v1 or v2?

>=20
> > +
> > +With the backward compatibility, no change is required for legacy
> > VFIO +drivers or applications to connect a VFIO device to IOMMUFD.
> > +
> > +	When CONFIG_IOMMUFD_VFIO_CONTAINER=3Dn, VFIO container still provides
> > +	/dev/vfio/vfio which connects to vfio_iommu_type1.  To disable VFIO
> > +	container and vfio_iommu_type1, the administrator could symbol link
> > +	/dev/vfio/vfio to /dev/iommu to enable VFIO container emulation
> > +	in IOMMUFD.
> > +
> > +	When CONFIG_IOMMUFD_VFIO_CONTAINER=3Dy, IOMMUFD directly provides
> > +	/dev/vfio/vfio while the VFIO container and vfio_iommu_type1 are
> > +	explicitly disabled.
> > +
>=20
> "The IOMMUFD backwards compatibility interface can be enabled two ways.
> In the first method, the kernel can be configured with
> CONFIG_IOMMUFD_VFIO_CONTAINER, in which case the IOMMUFD subsystem
> transparently provides the entire infrastructure for the the VFIO

remove the

> container and IOMMU backend interfaces.  The compatibility mode can
> also be accessed if the VFIO container interface, ie. /dev/vfio/vfio is
> simply symlink'd to /dev/iommu.  Note that at the time of writing, the
> compatibility mode is not entirely feature complete relative to
> VFIO_TYPE1v2_IOMMU (ex. DMA mapping MMIO) and does not attempt to
> provide compatibility to the VFIO_SPAPR_TCE_IOMMU interface.  Therefore
> it is not generally advisable at this time to switch from native VFIO
> implementations to the IOMMUFD compatibility interfaces.
>=20
> Long term, VFIO users should migrate to device access through the cdev
> interface described below, and native access through the IOMMUFD
> provided interfaces."
>=20

will apply the above suggestion. thanks!

Regards,
Yi Liu
>=20
> > +VFIO Device cdev
> > +----------------
> > +
> > +Traditionally user acquires a device fd via VFIO_GROUP_GET_DEVICE_FD
> > +in a VFIO group.
> > +
> > +With CONFIG_VFIO_DEVICE_CDEV=3Dy the user can now acquire a device fd
> > +by directly opening a character device /dev/vfio/devices/vfioX where
> > +"X" is the number allocated uniquely by VFIO for registered devices.
> > +For noiommu devices, the character device would be named with
> > "noiommu-" +prefix. e.g. /dev/vfio/devices/noiommu-vfioX.
> > +
> > +The cdev only works with IOMMUFD.  Both VFIO drivers and applications
> > +must adapt to the new cdev security model which requires using
> > +VFIO_DEVICE_BIND_IOMMUFD to claim DMA ownership before starting to
> > +actually use the device.  Once BIND succeeds then a VFIO device can
> > +be fully accessed by the user.
> > +
> > +VFIO device cdev doesn't rely on VFIO group/container/iommu drivers.
> > +Hence those modules can be fully compiled out in an environment
> > +where no legacy VFIO application exists.
> > +
> > +So far SPAPR does not support IOMMUFD yet.  So it cannot support
> > device +cdev neither.
> > +
> > +Device cdev Example
> > +-------------------
> > +
> > +Assume user wants to access PCI device 0000:6a:01.0::
> > +
> > +	$ ls /sys/bus/pci/devices/0000:6a:01.0/vfio-dev/
> > +	vfio0
> > +
> > +This device is therefore represented as vfio0.  The user can verify
> > +its existence::
> > +
> > +	$ ls -l /dev/vfio/devices/vfio0
> > +	crw------- 1 root root 511, 0 Feb 16 01:22
> > /dev/vfio/devices/vfio0
> > +	$ cat /sys/bus/pci/devices/0000:6a:01.0/vfio-dev/vfio0/dev
> > +	511:0
> > +	$ ls -l /dev/char/511\:0
> > +	lrwxrwxrwx 1 root root 21 Feb 16 01:22 /dev/char/511:0 ->
> > ../vfio/devices/vfio0 +
> > +Then provide the user with access to the device if unprivileged
> > +operation is desired::
> > +
> > +	$ chown user:user /dev/vfio/devices/vfio0
> > +
> > +Finally the user could get cdev fd by::
> > +
> > +	cdev_fd =3D open("/dev/vfio/devices/vfio0", O_RDWR);
> > +
> > +An opened cdev_fd doesn't give the user any permission of accessing
> > +the device except binding the cdev_fd to an iommufd.  After that
> > point +then the device is fully accessible including attaching it to
> > an +IOMMUFD IOAS/HWPT to enable userspace DMA::
> > +
> > +	struct vfio_device_bind_iommufd bind =3D {
> > +		.argsz =3D sizeof(bind),
> > +		.flags =3D 0,
> > +	};
> > +	struct iommu_ioas_alloc alloc_data  =3D {
> > +		.size =3D sizeof(alloc_data),
> > +		.flags =3D 0,
> > +	};
> > +	struct vfio_device_attach_iommufd_pt attach_data =3D {
> > +		.argsz =3D sizeof(attach_data),
> > +		.flags =3D 0,
> > +	};
> > +	struct iommu_ioas_map map =3D {
> > +		.size =3D sizeof(map),
> > +		.flags =3D IOMMU_IOAS_MAP_READABLE |
> > +			 IOMMU_IOAS_MAP_WRITEABLE |
> > +			 IOMMU_IOAS_MAP_FIXED_IOVA,
> > +		.__reserved =3D 0,
> > +	};
> > +
> > +	iommufd =3D open("/dev/iommu", O_RDWR);
> > +
> > +	bind.iommufd =3D iommufd; // negative value means vfio-noiommu
> > mode
> > +	ioctl(cdev_fd, VFIO_DEVICE_BIND_IOMMUFD, &bind);
> > +
> > +	ioctl(iommufd, IOMMU_IOAS_ALLOC, &alloc_data);
> > +	attach_data.pt_id =3D alloc_data.out_ioas_id;
> > +	ioctl(cdev_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, &attach_data);
> > +
> > +	/* Allocate some space and setup a DMA mapping */
> > +	map.user_va =3D (int64_t)mmap(0, 1024 * 1024, PROT_READ |
> > PROT_WRITE,
> > +				    MAP_PRIVATE | MAP_ANONYMOUS, 0,
> > 0);
> > +	map.iova =3D 0; /* 1MB starting at 0x0 from device view */
> > +	map.length =3D 1024 * 1024;
> > +	map.ioas_id =3D alloc_data.out_ioas_id;;
> > +
> > +	ioctl(iommufd, IOMMU_IOAS_MAP, &map);
> > +
> > +	/* Other device operations as stated in "VFIO Usage Example"
> > */ +
> >  VFIO User API
> >  ----------------------------------------------------------------------=
---------
> >
> > @@ -566,3 +685,11 @@ This implementation has some specifics:
> >  				\-0d.1
> >
> >  	00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev
> > 90) +
> > +.. [5] Nested translation is an IOMMU feature which supports two
> > stage
> > +   address translations.  This improves the address translation
> > efficiency
> > +   in IOMMU virtualization.
> > +
> > +.. [6] PASID stands for Process Address Space ID, introduced by PCI
> > +   Express.  It is a prerequisite for Shared Virtual Addressing (SVA)
> > +   and Scalable I/O Virtualization (Scalable IOV).

