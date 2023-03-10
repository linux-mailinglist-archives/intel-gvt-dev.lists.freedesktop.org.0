Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5046B3B81
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 10:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9D110E9BC;
	Fri, 10 Mar 2023 09:58:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64AC10E9BA;
 Fri, 10 Mar 2023 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678442310; x=1709978310;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IzzBqbpLoMVX2H0x0tFhesIRtaEJ8aOG6+c3Ls6UpeA=;
 b=Twk120vjGknNlzgf2et8CQLspFofM3EdiHJMfiUGyLghGLIVep4BCiFr
 sBXJLm1o2ZOoiHoPvn6D72wJRaLmx/bGSWBeidEynorvExPXrvvZMdPPa
 fcpOG9bYSB+wTiBMgQDXpYsDabGe5FsD9ZYtHLAbbitxY1+y9q9VynBwl
 6HbLtvuAcZXdktEId4HmWAuwGGEUAv1Ph+Q7XjU4Cc0w387g7VVEe23ub
 xecC3Aja750XDXSJ6i+2XwUposplV1267/E1OGb5nEFRsA0egvlptQAa1
 dYuVvUsg+2I0hI/esjzJvFuLNlhzukOHrXp4mZ2zfbJ0KP/0InbzkJ3of g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="325046115"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="325046115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627752520"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="627752520"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 01:58:29 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:58:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 01:58:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 01:58:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWpzLuL8pAzAhyNhy2/O++rngVwqZ+1/sBaHBQb0FlP2YBYQtmroSfMB4m5b7APzmpgldRRCk0QOKGpAmlUYOm5kGcu6+KeETFFTradc1RyDBH/CJaao+zLBI4P66OA3wiVv8Ii0ibOQsyvrG7NgU4KLrgnf2HLZJasAAPWwIawxx73oOuI+WVfeO+O2BaOqhY1S6h66DbeZeXS6FB7HI1x+RC81JrWSNJB6r+LzQGolWf+wOAMRByTrYirP0bICVd47aPDzxVPLGsxjapCpGodVZoxhTWd9quPyx0a6DT0SNYVl2Ci42A+M7POFz4jYcGe+xNIb/ibJMXpYxqVC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4ALhjJJ2ja/7bbpBC36OHc6qaw8G9b6rOq6wNTcq9c=;
 b=gNLmw6AYaP6eokx/Xy+984mXCvA8WXlTJebEi6PD1vnho6r/TD7KYrwJccVchzXJBqMSdFkIZkAIiCkqgKVPUCJM4mz7bseM8oy0BUNQh5rfjAeI/2hZ5RsEmcNoxCsE+XNs6pgYCAry7/1Dbro0/dgylwuqEDtJgiEaNtw0bIDW9sXnKCh+swrgjv6MGzHGHtJE6E4VysQ+sdEz+QiqKENBmnecgg0R6KGBq21hbWpD7UppzkvhRQTervmoad2ct22Vryl2TgYf7wOAAJMpuzlyQrhTaFTyZ7plcASwZRgir2sm+w9AnlahWbgLAuOc2jtcgMzIzoIKB8rp/Bqvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 09:58:26 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:58:25 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v6 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Topic: [PATCH v6 21/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Index: AQHZUcIP+SZa7TzGK02S6HlHFxIIra7zumiAgAAAm6A=
Date: Fri, 10 Mar 2023 09:58:25 +0000
Message-ID: <DS0PR11MB7529B3BFD999C9720836F049C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-22-yi.l.liu@intel.com>
 <BN9PR11MB527665CA5753E413CB4291AE8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB527665CA5753E413CB4291AE8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|MW3PR11MB4634:EE_
x-ms-office365-filtering-correlation-id: 4ebecd21-3818-414c-5be0-08db214dfd79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +LtL9zSRitee7LIGl6ca6nBeJDgC9WrTczHBfnwfTtWHEUEiuCjC0fpptOCITNzg6/C3xoAxWCKG82zMezs+CGocNTy8Ag/Xk+fwV2nTPzVFlA3ec1z5CmwYIXr5E8XjUKf3Rev9J5rS+cxa5hnH5546E1SGGstBW5x0+FSZ4TGOaVILI8OLNb3rdtgmgNsT9tmq/4G1SgRZqlBX2xEMrp6zH90ovEyw1vvR9PuvU1v5DIVN0SfGKsmytVPLAEgzfBUQy7WzJQKXuMOWCVK+p+G6jmFT9IcFwE/fOrQkESWmbxW9zn7etdFW0T9QQscld82yDbfblcVOst7MGoPswVortJ0QMlDiOo48LPO8lBJM3LXfscHU8ss8kg9lLXJfDyRl0vfQ0XMyuhx5TMwmMy9EP55FYyLIrr9jnrGqwbt525chWjttZrlH1Utii5izAqXV1FYJ2CcH/BugIuqdpOY2zb58iy+97hxkcJQqhmpKss4c1HhW7Xi5dyFVPfEwIXviC9LuPLcmC7Y81dbBciEnwM6R4TRBnPYojNtEgjmAfHZMlhfJGCJN7KYrefftrzlRWoyjG2M3XxSB8TX/MB3/lmhfs31lqssf+97cKOnXmu+6MadesT+UEb3WaC8HV5OFf0yjIHXCiOOd+5HEHJqvKDmpLi4KCAAt7i5MegTFxpD6EfLlVLw0rrNqlMtCqpHZQjOvEkq1Juk7/hOO+OjIfPqdPYRJYsLJP0zBsks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(38070700005)(33656002)(55016003)(86362001)(122000001)(82960400001)(38100700002)(83380400001)(8936002)(52536014)(478600001)(110136005)(7696005)(71200400001)(5660300002)(2906002)(7416002)(4326008)(66476007)(8676002)(66446008)(64756008)(66556008)(76116006)(66946007)(316002)(54906003)(41300700001)(9686003)(186003)(26005)(6506007)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MYuTbFXr4Ysp/IbHP8SGIVVcp5BwvXWfkUwoyQF4FcTfQjH56FFmNMWWb+o3?=
 =?us-ascii?Q?sfeXv9QKiwo4SJHypyQtGvmTzE8/M27Tiugv2fRpSc2vy+XcNptvtxIGq/9f?=
 =?us-ascii?Q?gRg7igIqo+l33NZukgZc4wB+8afG0FGV8irv9BoJlC2VLd9+NdLyI01CwD/B?=
 =?us-ascii?Q?RviiQW5X4XfH0q1HafrOqwwpKnq1+A13HibK+djjbkdG1Nap3v5ZyQG6xvBF?=
 =?us-ascii?Q?xhuWFys00Yj5FeSBloWdxFf3LqTfziGD7RJfQn59sV6ZaTKIxYeWrfuSoMIe?=
 =?us-ascii?Q?XuwKGWAR2WrrmmhIeTczWw8XK34GnnKcau0obhsi386A28jadpEBuTlEWaw9?=
 =?us-ascii?Q?gnzkm1n1PPg/TPAK+RjSePj5iloSzBbJR0+u3yC1ENmge8uGcAj/F/sLljVt?=
 =?us-ascii?Q?1b/0eL5Nqh9NC6LYunTIawB8eVnXOxvgTGBl8eIg4g5hejPXumhwctPFdbo5?=
 =?us-ascii?Q?sHNRfJ5Y1tUuPRMqxdeNNvP+6LyGvRUKbafiIC/hHkor8JUVlcwRwEdah8qu?=
 =?us-ascii?Q?X7dOAIWNNpQCVyGJlA9dwMvepm+gIGFHqSa8qMZ6E96hBALXzn1zEF6dVhXl?=
 =?us-ascii?Q?rogkqpFXy4TYqjxNVhW7Or9iLxaCV7JY+n9h+RKhJ1NfIGDpyVE4KTZI+z5M?=
 =?us-ascii?Q?D9G+2V3ZbsJf5j4jbcFrXc7i2xKAjoCFHh0a/0C8bh6qhDByjqpYKSZAxVKg?=
 =?us-ascii?Q?10Tf9p7VCwI4Wde8RuzVE95BZXl515Df795v7ETkYmOIilh1HdyA9473Xv78?=
 =?us-ascii?Q?RSPYL67n9n1FRx21CFqYxhP8DIknvRwK2PFc3xc7o1fjfFtxLOZhK6BFn27V?=
 =?us-ascii?Q?gphAOjunaqnubCoqe13Xv231vX9v1h4yMjnrsnVYFR1zkLeMTzZQEtXUSbny?=
 =?us-ascii?Q?kzUu6/jtMYaxfgNLrBylSW7Wj2ZQ8+DCdRoX9vySUvsBXeVb44ThWErF9gFw?=
 =?us-ascii?Q?sC49gRKwywD7kcExZiw88Aa4G2JY23FKrZJYzDpydUl1zuZFrWxNj8WgL27k?=
 =?us-ascii?Q?MzOwZD/xQ9N+W5sLUbBuddPrWf6CjlH8f3Xrv421CmKA2Kfp+r4LNGLlmutU?=
 =?us-ascii?Q?fpknOWgYlGGtvBjmuaMpyVhhUzkZuYWVkMD2pzRNWNn5Lp2HKgxkEFFYg+5a?=
 =?us-ascii?Q?zKE+8hb/bWESWTOXJtwmeVXWXkVJwLlw9eO5a8FmrlS3rHwIWDO9yr52KJF4?=
 =?us-ascii?Q?2Bg9wyB9yjneZpirrzLT2obd65dUzBe20m2MC2rQ4GnyaTLdMdpT0pni6fUY?=
 =?us-ascii?Q?7At+S+9eGEF7t2yjDJceHHF54ulyEcW0Je9uPf89m8T60g6qw+q3nYJ9Z+3+?=
 =?us-ascii?Q?tIAispF0sRSJ/iGrVQRjh8kpX/7TCxkNvnxPueMlBSPcNRYf3N1fRZbrKXhy?=
 =?us-ascii?Q?rReVBDGFCO40gpqjprwYcdTBUHHJJV+Y1vcKYClLnYS0ZlwnoFkckc+uPxg7?=
 =?us-ascii?Q?PQwlCRs086G438GqMFwjUaMYsSlr2bGm2KOa+T3nt2YzTyqaL3tg/N9l3Zxv?=
 =?us-ascii?Q?ku7TeIZFQZ7mxeEiZ0c42BAO4j/V3WPorn4dL95FowG7D1EVOXAm/W7t+sXw?=
 =?us-ascii?Q?GqK7TWUYdDarUDtxWag4yF7+dJ+diaDzUKh+/s4E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebecd21-3818-414c-5be0-08db214dfd79
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 09:58:25.1532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n69snVjRS5rROJYY9CxmniRsDXIGKHSLukd1ijsphgdB8bIgqtm4S+3HjEZRmMNsl+jUn+wcnK57sHa1VP04vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Friday, March 10, 2023 5:02 PM
>=20
> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Wednesday, March 8, 2023 9:29 PM
> > +
> > +static int vfio_device_cdev_probe_noiommu(struct vfio_device *device)
> > +{
> > +	struct iommu_group *iommu_group;
> > +	int ret =3D 0;
> > +
> > +	if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU) || !vfio_noiommu)
> > +		return -EINVAL;
> > +
> > +	if (!capable(CAP_SYS_RAWIO))
> > +		return -EPERM;
> > +
> > +	iommu_group =3D iommu_group_get(device->dev);
> > +	if (!iommu_group)
> > +		return 0;
> > +
> > +	/*
> > +	 * We cannot support noiommu mode for devices that are
> protected
> > +	 * by IOMMU.  So check the iommu_group, if it is a no-iommu group
> > +	 * created by VFIO, we support. If not, we refuse.
> > +	 */
> > +	if
> (!vfio_group_find_noiommu_group_from_iommu(iommu_group))
> > +		ret =3D -EINVAL;
> > +	iommu_group_put(iommu_group);
> > +	return ret;
>=20
> can check whether group->name =3D=3D "vfio-noiommu"?

But VFIO names it to be "vfio-noiommu" for both VFIO_EMULATED_IOMMU
and VFIO_NO_IOMMU. And we don't support no-iommu mode for emulated
devices since VFIO_MAP/UNMAP, pin_page(), dam_rw() won't work in the
no-iommu mode.

So maybe something like below in drivers/vfio/vfio.h. It can be used
to replace the code from iommu_group_get() to
vfio_group_find_noiommu_group_from_iommu() In my patch.

#if IS_ENABLED(CONFIG_VFIO_GROUP)
static inline bool vfio_device_group_allow_noiommu(struct vfio_device *devi=
ce)
{
	lockdep_assert_held(&device->dev_set->lock);

	return device->group->type =3D=3D VFIO_NO_IOMMU;
}
#else
static inline bool vfio_device_group_allow_noiommu(struct vfio_device *devi=
ce)
{
	struct iommu_group *iommu_group;

	lockdep_assert_held(&device->dev_set->lock);

	iommu_group =3D iommu_group_get(device->dev);
	if (iommu_group)
		iommu_group_put(iommu_group);

	return !iommu_group;
}
#endif
