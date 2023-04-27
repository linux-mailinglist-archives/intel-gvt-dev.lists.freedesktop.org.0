Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 360596F0113
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 08:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C49C10EAB8;
	Thu, 27 Apr 2023 06:54:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4B10EAB8;
 Thu, 27 Apr 2023 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682578470; x=1714114470;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SDlZ1zwS/TNVFSl8fxKWVRQ596lbEGsRVMA5OU/BD/Q=;
 b=mQk8aFlxjiwhEorafq+zdP9YC6yAjIQjMCtmMm9fv/jCw6xDTLL/+Ury
 NfhciNqHci+kxygiMtm0UPmNASM19EN2zWE7Q43u3I39zOaf2j+FaeBAl
 u1+ikCOK4mv2pA7+MdV1qbqznzJimEPH7ya2HSmQLqAjrKCdI5sRpJm9E
 U1M5toD+if6BonqhLhZJ9jYlgQgyxI4YrpcJtWiomM0exRvfqxgtMYi2v
 jQNcgO7Ac+TfxaFWAIo8rj678CB1m2734vnp5sjQX5FknNx8I9hGriwJo
 db35INkvVbHGoSWmwnwVtUnt8GeWSt15s/vNNATW8VlAteGMsApY+gMWn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375326917"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="375326917"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 23:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696956631"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="696956631"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 23:54:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 23:54:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 23:54:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 23:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLAP2uuzYJvYivYyq9V/bRH6YF86hiOGhu2fg8YtB+2PRXH+LQT9o6cdR0uiX2itGIXnw+8ohZ104VaqTIhBtEZASGUZ+FKLoKmp7gLplkU857YVDMT7j0gvFLMw9Y6MQN6bSxMVDqJYO205eBH0g4wEZnzo/AlVWByiu7opR9SnBkXZU/iL5eglrlKoI/5dDJGZXjhAKSsNIDSFbPjwjEfG6XWooKFD9gI5QJRu8nD+6U+XG6V4jT32lF03UuJmsZ16lJ2ehA76SeR00Wgb2baBJ/W87E1DY78KSkw0R8oJ/6Y31a3F+bth6pAvTVz0HciERq7BA0j3ZtQVR34jEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOiFZFkhbmk2z+WVmZPAK/ILkmFMZif3DU8VqHh50fs=;
 b=V/kAeEUINc8XuA8sDt25UWDupHygkYJYienYuAxAGOzKV4uBQOnvUBkUKtVeUUfjfzVBLVUCekI2VKzqYnWZsCdHQbAp4jEUZ2QX2Hge6xh7j4WO2Zpqh79Heoquwo0NxSfGL7201JvEEyQ1c73ib6RKRQzdrErEKHytOjl0ksCIpgDtqS2DhjxvRTsMG8OCr/PegR/SYlAbEKu7p/f3AMhzjgB+1b1OJ96coohfWHyNKohsMAhitvpIirSUB30PSQQglyriK5LNh6+StwEEPP8b0AVjk8+y59A8RHgnR26EYzFHyVMXb8A/zXmavVDtdP/QQnKMHRcDXmOHWFgrdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA0PR11MB4589.namprd11.prod.outlook.com (2603:10b6:806:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 06:54:20 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 06:54:20 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v4 9/9] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Thread-Topic: [PATCH v4 9/9] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Thread-Index: AQHZeE8Nk4hZtMeu602j9IGvJb9y3a8+uQpw
Date: Thu, 27 Apr 2023 06:54:20 +0000
Message-ID: <BN9PR11MB5276451E0735E3057A9F4B628C6A9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-10-yi.l.liu@intel.com>
In-Reply-To: <20230426145419.450922-10-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA0PR11MB4589:EE_
x-ms-office365-filtering-correlation-id: bb9489b3-3f64-40c0-4f4c-08db46ec39f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1pmWdIzfzSEvLLHpKHOw8CXjvCeCPbdvv4eGvE5MwVx7tKmT/Fzuv5KnIkZPcQK2tj0WvfsXgxIdYf1NpU7FXnvZ9FAb/LjVysNkXmITvxPSID2ro/JaTWgyRyR8ZMUJU34dEhvmIBswlinma+3X3aS+HL+tX8OsVjbm8YUbI4SOkfwzxHwuc8snU8XmBfiqRqUgfhMuGOrSaI0MonXnvGoQz8dGBztll3+LmpEe9qDzBfFsNMLntRBeGjOFPe0BAA6PmzGvM0iEpYKrYnoezmY8XUUvea8tPZRPlp/17mNQbDFaxkVB9JKGkAZ+j56pO2G+18NkOtYB11pdov0r/uoPk7byh9Zhb6YYYb7VpGnyf8L3UoMmOzRk+qSOy5GzjOhuOrJhJBhlWBMhUkHzPRZI0HEX+2WohHZFkG0vgLkziowExPi936GaLjhA3NsO0WjzMnw9H+4yrN8K5hjCIyxxmEZ688kaMu82w4w9LHWjfdkeTfXY57cgRXf22GUmaLxkvoWOCwC2y9Wz5TNgVxvgbkpbHy5zqZejj+wYV9e9PRl5zhMFNm3/LGvsKs97JjXSL2lGSMB4cZKnWX2Y889ZMLEFAteAqz1BZ0klMy2cld21wu8DjYZj/QkKSh2a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(66556008)(4326008)(64756008)(66476007)(66446008)(66946007)(76116006)(316002)(110136005)(2906002)(54906003)(478600001)(7696005)(8676002)(33656002)(71200400001)(8936002)(55016003)(5660300002)(52536014)(4744005)(186003)(7416002)(41300700001)(6506007)(9686003)(86362001)(26005)(122000001)(38070700005)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2pJoTt+DLkaNm49Y23YYDVaGgk6J7KAgs23BejKcMHhHpfTD8+9uG8/TQ4SR?=
 =?us-ascii?Q?WZc5jwj0/7EgOtuBjG8Tl9wpl9vbVNQ5zZItLH4Lw3neG+fcGcjHyN9hzfI8?=
 =?us-ascii?Q?O3lDFtJF4kUX3/rG+ntTcG8csvZUU7/JlIkcIu7wg1Vxj45st6YGMdKf7Mfw?=
 =?us-ascii?Q?FFcaloH9Y8ZZySXCTrk3dwVppgHCsfBKRceSRf0zWSM1V7fH9vAfMelz6U7T?=
 =?us-ascii?Q?eYgzXbkhCd4av4ISP7Sahm1J2Auz3iw3RFtC1mZvAGAR9oUgpgSffAAoFrLF?=
 =?us-ascii?Q?knqNW41H3ByTyB4rRz+ukflrVzf7ZT2AzYB2F8xlYNPYuGz0hM1NnAWXC0TR?=
 =?us-ascii?Q?27rR5iFUfeDMINEAzwThhjj+Jfcaw6y6A2nXlkrRfYnyCWiUsU+FdGTIewOd?=
 =?us-ascii?Q?4V6Zq/ihUjxJSid7YzKEut4CEVt9e4gUbBcsMe2GnptOjCWhJE5EgJR0obvu?=
 =?us-ascii?Q?bsSUYD2CdM2uaRbWm5R4W4lhKmoF9dSCuoIVedCyvSh14YfTcGfVWiKGjYDA?=
 =?us-ascii?Q?gqhIpPZP92ZpnkugUTL2ezXuNFeN4gZLp3EurSJ8KJsBjdH0S2es2OgJKpq9?=
 =?us-ascii?Q?JAW6MQcgsh7HXk8RhM2NKx4tpIduW5LNlxXtyU81Itya1222yMADyzGtsqRR?=
 =?us-ascii?Q?9StzSRp18zeW7G9CSN1NUCHdN1OA0vbEtJTXVFfhO8GNFW3vEYaflcb4hyZv?=
 =?us-ascii?Q?0Y+jWpHRkfG8eqspvTfoMACwDVUDQA3SY7wYOGEyQx4Jr3eCjdU4RffrpxXz?=
 =?us-ascii?Q?XPLuVZ0fRTjrUST6FZMcATDGQFuE+il23xWGtScfACGNxta1Hi5Sg0m7niFW?=
 =?us-ascii?Q?sQLVTXLqjv/9d+k8y2qaRa1UAYk9LzpE4T+qHp9/TjY1YHZbuvAqlfeB2pBd?=
 =?us-ascii?Q?ZZ/nHgZ5V0nNIp4n0JixRhliI2b3XMwAKWqEGlF2xHbWe56dw7/3lqnWgxQ1?=
 =?us-ascii?Q?gUB6SeCCt8cl/GJlPU+GrMXGCSQDhuhpIoE8dVUXdw/izJLjwfWRm3Nczceb?=
 =?us-ascii?Q?CnIXvaYSovVi1V2AyKrS+w2rmX8LKV1a4I4P/DwQ/6FNOUspS4y9fDl/fdNd?=
 =?us-ascii?Q?ldvCc1Jn0CQSHIU+J1gHH+udgJu5JZQx7YvqUA5XJXCjKpH3C28B05uFihhB?=
 =?us-ascii?Q?cHH9kNLMxbuDJMYuf5wFrVn/Yfm4P/snyFeblGpUNhcfmQqq+fl9BEeRqjnG?=
 =?us-ascii?Q?mjJlgDJQ2aAnbbfcBWqRPSlKzD7yI6vq0uYxWE6/O/apD3MUxOr/HEMPLZmE?=
 =?us-ascii?Q?AP1cpFygtQhPuGosFhXRochitLsgKShEDrHwAOjbGwF/bnmrABbnkFV8qz7L?=
 =?us-ascii?Q?FGR4FYk/DVI7jsOyP9h7yDKt1etZyRdLHkAuH0EUPT7X0fTxu/XRR6Zw980E?=
 =?us-ascii?Q?gPv9mc1RNJ+THxegb7W/DY5bQLPAuHyshm7nR/d9YoTFsIGGGiJkDS5hUuA+?=
 =?us-ascii?Q?PNVkTowXnuWY45LZhwzD/gvDSSpAeuPbZhERNyN8/GFaXex7vgwvR8gCRjtY?=
 =?us-ascii?Q?exr2o9/CHz/YtS9mMSd+UHgCxdCwqeuN/pYpryFhZ5CHjsjVt35AFqLXV8pJ?=
 =?us-ascii?Q?mrr5Wyzz1YRNDGdXg8TJE2qPxLak2wGnfcS9Gr23?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9489b3-3f64-40c0-4f4c-08db46ec39f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 06:54:20.1521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXbWmk+orDMkyDEJ18A42JpGS9/ohELkOc7a42yeImfiQ54d0kfp/TYv/nIsxWaX11jkP4GR50C4aFcN1+XYrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4589
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
 "lulu@redhat.com" <lulu@redhat.com>, "Duan, 
 Zhenzhong" <zhenzhong.duan@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Wednesday, April 26, 2023 10:54 PM
>
> +static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
> +				    struct iommufd_ctx *iommufd_ctx)
> +{
> +	struct iommufd_ctx *iommufd =3D vfio_iommufd_physical_ictx(&vdev-
> >vdev);
> +	struct iommu_group *iommu_group;
> +
> +	if (!iommufd_ctx)
> +		return false;
> +
> +	if (iommufd =3D=3D iommufd_ctx)
> +		return true;
> +
> +	iommu_group =3D iommu_group_get(vdev->vdev.dev);
> +	if (!iommu_group)
> +		return false;
> +
> +	/*
> +	 * Try to check if any device within iommu_group is bound with
> +	 * the input iommufd_ctx.
> +	 */
> +	return vfio_devset_iommufd_has_group(vdev->vdev.dev_set,
> +					     iommufd_ctx, iommu_group);

iommu_group is not put.
