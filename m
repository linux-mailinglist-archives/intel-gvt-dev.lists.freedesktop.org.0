Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE86B3400
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 03:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E801E10E05E;
	Fri, 10 Mar 2023 02:08:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E7910E05E;
 Fri, 10 Mar 2023 02:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678414132; x=1709950132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ak3tTigWXWQ/2NRu4bt6QTtgqvdahh9bW/EpFVqz+m0=;
 b=Fh++gvfqfcWNyPfPKDOQ7HkckH1fzsTtBtMz/s6mSYWcv79u4jgSA8OG
 8rE4/hdIRAWLbBzwcPik1ucgJ7PsWH7HvPncfQVOMBVckdTZOQ6VtmYE5
 pRF3ihJM3dmzB63+WyeY99bBUhP9SNP2UmcQQBALQMYfSYuJ5jno62NBf
 WoWiNJXo8jVB7LHxU95R7GB7J9AfeW/LAEwO0EDUn4A86SK5VYtzUJR7r
 vc51nJ7W3wRjx+Mh3QkPnnH5UlLhkIIA8WayDKl21XAIsAe1uReb7Nd8C
 HSbaLKx88NuAM4S78X6ItirjKhvYxG4OlN3DwEt4CGm+bnC1/u9Z2UfOZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422892797"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="422892797"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 18:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746538453"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="746538453"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 18:08:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 18:08:49 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 18:08:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 18:08:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 18:08:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3HPKFYLQJaZgbsyD/6ICsH/oOYmS0F1Bj4QlHq6SJzKjShfA4MjrQIgeRKAmJVI69uwcDkLVXy+AEu5CbwVkAZvOLcYHwlCwtYE05JC8kHk1KouW2PyHJI7yioO4KvX1k8MUGNVdh2kL78O4Xz2BzKvEBbxt9YjJA7v9YJbgbQHdgU7Ov9uGwNnBMxgkrHTyYdfyaYObmpDbPtz5rXn7Dap6Z7q2BZFxYxokV1rMGY+Ry+uiakYRPU8dpKGJtW8TcEyUSckfx8hzLeKOKmnYRZl3mojoo6m7sXmpfilGIfcTzrJTzpdXoEvsjcws1Puuya0NBWH/mKnvS+HZbJD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak3tTigWXWQ/2NRu4bt6QTtgqvdahh9bW/EpFVqz+m0=;
 b=TiWO5vKZibc03EWxLZPi5v0TQlLfG0jVKPRAlbYUcl/yPpQ3p30na5eFytSBrBmw16TTbg0FdgEJWap0Q1ubrl1CEoGHWeunlQs5/aaNj22Ezpp5RRbGKyDWQJgYJpCqNE6ixUmAS/JhyWb8WtBPxywO1C+1+dbgLd69k0yt/N/Ggn7lrQRyCDxXYRp8ExZU/db27+EayfMKB9uVJuBrjEf2rPSgjdTs7V3MYatXjD1WWYewsdbqfM9nIqqw5ziLdjLA3fddjjflP6MLf5uMOZHCazRnGR4FxDu0Y372EQdXqTjYUxEzEHdfPOM+GUyC7LRFy2UkCnSNzfEZoFZA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 02:08:42 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 02:08:42 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v1 3/5] vfio-iommufd: Make vfio_iommufd_emulated_bind()
 return iommufd_access ID
Thread-Topic: [PATCH v1 3/5] vfio-iommufd: Make vfio_iommufd_emulated_bind()
 return iommufd_access ID
Thread-Index: AQHZUb/YfrDmRqqpBUGo4JfLAhoazq7zRuAQ
Date: Fri, 10 Mar 2023 02:08:42 +0000
Message-ID: <BN9PR11MB527621C4D93CE9580C92AD588CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230308131340.459224-1-yi.l.liu@intel.com>
 <20230308131340.459224-4-yi.l.liu@intel.com>
In-Reply-To: <20230308131340.459224-4-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB8136:EE_
x-ms-office365-filtering-correlation-id: 11356b8e-6833-4128-b582-08db210c5f39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0MOq7kP6lwamUSTEOJMDrqO8iAPGmqBNkVgBKGDvoWlREKPwVCI7xCvbjlGWDElyjEjl71mGCI71BcpSJeqiBgoK77H3F8/zzqR2TaNr5+XfZvBMHSNoKQn6lGIgyyynSwIu8DLyGcWAHywTf+XfgyBKc9gXVUK08i9gbC/akPCJ6/3H96V39ouRd7Y+HCQmJJn5EJPRs/RVxBvJNtKM2v+YkQKj+L+DMX/XoplMg+YLguCoFlDwCYjASqC32oOsrNwvVHUUNWvKbY0z5Ckldwc+uD8MiiprMB7rB/D9IygQa6+/ELo7FDQd0WCcgQ8XTUUboq2mqN65u51s86ocTT6y1pKeeA7gzrwsalUnHt4Xj4xeC23iFxUOwRjT9U8UN18TOON3aM829gZSAoBWJwHKCD82y23P/g3mU58G9f7etCaZrZu7Z8B7J8rem9kGQ+4WOUx4zI7crNeTquSMQpJepVN3Qr6k3HFuu/A0tiznHeNzzdL+YhVaojm6QWP8/4AZ9mrK5Cb21vzi67M4Wh7viY2k4cnB+yor27svs+isUkEp1BM1uDq5ue4szJ8BelimQVfTRvxvXk6u8AbVJpxQnYUsrKuYZYAqz6GDL89UMZO9AwKDmoSh5PPHfaZEcr73CaDQbBsPTB26qJ/TtXR+oJH15Ywvog+HT1w7xym5G58rEyF8Kg/+FN+EBSxIl6HokIyRaZgGvg+CCfW2gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199018)(82960400001)(83380400001)(33656002)(558084003)(478600001)(122000001)(55016003)(54906003)(110136005)(38070700005)(316002)(38100700002)(71200400001)(7696005)(6506007)(9686003)(186003)(26005)(5660300002)(52536014)(7416002)(64756008)(2906002)(76116006)(66446008)(66476007)(66556008)(41300700001)(8676002)(66946007)(8936002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KYI0xZWDLEa4pz3NZ0raVpBWP4U9SfeiTAhcIsxr5F2llGeXC2WDGJrLqCz+?=
 =?us-ascii?Q?hpjj2btL6MrIosXOFvLkzctebgRQ2kENw5se7Y86fsuACE9pLreBaqFLBori?=
 =?us-ascii?Q?c4jSbR1BcmSnaMvWpgEsHMGcVBYLzbgXuMCOinRf2r95l3n/K8Wd8MzD1Jzg?=
 =?us-ascii?Q?x3HOnXOcmf3Gm1xpE+189/b+1MZaltP+jkw1XmXjUiVCLreii+UWCRsTuWu4?=
 =?us-ascii?Q?j43RLIcoq+mDmHeXtVcK3VslWn/X+8vNR++BrOqprPcnQ8UVcsyjm+ZT9GaF?=
 =?us-ascii?Q?xpeCbRF4/8CB3ZxfkXu1gHqD6BHzMJMBs8w+2WoJKroi+30HywRzdcQoQXxV?=
 =?us-ascii?Q?IZ2MTNl0eH/JZXpJPn1khGNKSQLgGuvNBXQSS6iaNuZUPMv34hyIjIZz4ii6?=
 =?us-ascii?Q?FraS8PdYecTtOQI+aqDZ14eY5qk9qFP+DfnbE3XOPVTkkS5pfgjoTyZP3ZYz?=
 =?us-ascii?Q?BcRZdOGhiqME/8aQ1ydyHJSvlYbXgLCtYMuFXhmQB1YXumvg3ZKkNgsKv8a0?=
 =?us-ascii?Q?KPByzwHhgbVuUJKOKcn3I+a761adeKugKpk2KQL3jzomtrQm5rM1NDJ3c7S4?=
 =?us-ascii?Q?lG8KkbYtSoa/NkxRlkxakMzlc7ElkS/cbQMFKJKwv0SOBG7w+/zP5A4ONa3s?=
 =?us-ascii?Q?DMfj21Ew614/8151nXieE08cosZaKqVnhLGQ/mXs6C4EztvY9m+zw2fSGo/T?=
 =?us-ascii?Q?WR/2lLq8TBBWRUPue5L57pg3jMTMm+tikTdWbpxGVCF6B5CfYZ3kVzz8w9iT?=
 =?us-ascii?Q?+zUYAASZhY3EBeRgCu9aoG7dD2RMfihqPAuCcedSF713HCb33UhUSUKg3GX+?=
 =?us-ascii?Q?5gERqTQyNukLh96+SdLmHWwn9VxWxxZzIJJ+XDi0OJeZMihFLkOgOMCmxnZA?=
 =?us-ascii?Q?M4+18hfD7XiG++Ywg2OX0IbpvW1uY3gTscirLML+cmVNtFmUoO+7bg8Rl/aa?=
 =?us-ascii?Q?hTfN+4t6wJo+lORangCADnxzIyK6uZ18qdMVtkypfkQ2efGx31t1rEBztg+L?=
 =?us-ascii?Q?V0v9EygpCSEXbcrgJc34Pn7fG/5zeFLVzoXSTDo7McKghr4cOFEdnje0+yqk?=
 =?us-ascii?Q?mzvnrPzvVQVcCYTMQ8kcm518E22aVosPMkHTMkLo1W/ZAIq1yaAfOwuiH4ll?=
 =?us-ascii?Q?YxAwsHA5I2svFVYmr528fLANuk9SEqHY8D1yT0B3TuM4Uilu7EoT9xzihr3t?=
 =?us-ascii?Q?Do0ajZfFcewD/8IXv30MHDW+jr9Pf9lNe7NwgtYGjiiv+DtORBcDvc9yPz5S?=
 =?us-ascii?Q?uGnWVW20vMgIDrk3kEV68KsuZ4zEgUSrj6/TRAXvRuQoOgCQl5w7nh85hAbm?=
 =?us-ascii?Q?uxMjSstQeCRPpOpExbBZ6qyDYtqTqg8aYKPb5huS0SX+DAFjT7u6jOogSnuL?=
 =?us-ascii?Q?Iwo/GmFNwPs3k6Bd0atAXCAE+HKOGEI8WRbKFJGUKlkIWUrIhhveMVfz+fph?=
 =?us-ascii?Q?WFJ0XiVP/y0gBNLEHnFMHXLkDjJqRaycXsNGy352G0Jea0M+6JKSd16w1jsS?=
 =?us-ascii?Q?840o8R5md6QcVk2dhhQj8fBebd3KPQKiW0y54Fb/UNkxJaipVUq7gQOeaTCv?=
 =?us-ascii?Q?tsqAljDxF4xag0l/iM7aKOdosIGv7yW/byYpM/Z6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11356b8e-6833-4128-b582-08db210c5f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 02:08:42.3842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N9kYAMEQ+kMJsB3M1uBTwdJdMYzDrwvRAsbk5mc2HZCvKRMrvudcvMtzY+Fw31/jZJ68Ib4k7ABNtNNQbMcwLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
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
> Sent: Wednesday, March 8, 2023 9:14 PM
>=20
> vfio device cdev needs to return iommufd_access ID to userspace if
> bind_iommufd succeeds.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
