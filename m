Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A16B35D5
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 06:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1E10E949;
	Fri, 10 Mar 2023 05:01:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D2110E941;
 Fri, 10 Mar 2023 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678424517; x=1709960517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LytqFAWkI0zwvrjHmAp8xosZE+QJYZ1W0cMh4AY3S8U=;
 b=guixF/g6C451e7dDM1L/0kX5V4euvxUStX6Gvc4vhmaw+z3gMmUmDFSh
 42hlQOT0b7pOe6QEVhrm1bE+T2dbnfVWa48RFVzT1AvFK769pIThBCCz1
 B1YID5VabkSoXrk1xFW04/h+EBn0dmDrSudOU+m+Tsf928XXHNxZpikov
 zSjXAXvElCoR8TdRZAD20ZAtdbyJbOZnUnoFGzlNQfwZnGVVmbySiXkoP
 WkRevR4XkadZpyt5FYCw8NR/scqNvrAQ7d6dkOCCzIv3mCUkAH2Ye2y0v
 f2mvytC9alWutmB5WgtqNxxWuGBAofAg4cSkILzecTWHq1GJtch3b3FRJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="336665319"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="336665319"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 21:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="680089262"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="680089262"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 21:01:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 21:01:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 21:01:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 21:01:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 21:01:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5PYzQWxnbgsOryNiSyn/WHJWvDfSMqzAp/okWNX6eF2F/f7Y8DX1zZYNhB0SYGZFQo+3zc+/9UA1AObXEJV0hw8lAed+ilNGU7XD8ILFExgHM4ZcMSrnWHHFIzI3FMh/2nXwMWuQZa+zv9mHuQGxJBSR8kQYYiRieA/Mw4H6y97mvXuJgsGzUzmXZnjJaflAK5S4cLlRvX0aPIrvlcb4m1b0Q5RChMQJYJYHxRDl++vJ9KnUe834Vo/1kbEojBIq6g245LSbd5Qw9zKKzx2WJLEZtgZSiDuW9ME9aeScUwF3omywmDnr5l6LNkkg9NouvwXOztse0NOu5jqRe42cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt/Hkq6SMBlsGRtC+6vC9Whk16dGRe73RaLlbkA6dqU=;
 b=aYEvFuSDtnfqCc9fojMq2Z3Go0wXGS9JB3bQ1Us+VtiZDBbgKXXA2U+0jDOUlp4w3t0z0Oiq1J10q0tdxw6ZACyiy3/4rJOvgEC6NEGYpVVZF03S+Xc8OSvugsO4z/ERKH+BOR8zvemrTbmxvG7osVPvHS/JOII2B/SvP475YJLWXcJ8rXrCRVMZxAhOWs0LN0QKBaOt7niKN/biZCNL94D2s/nd9Fx9tANK2VhaePYvrmgbJ4jgHXANcVO38Pa2BHClBlbHhushnGbzOHw/as7mcjFI0r6e1GrMCIYJkz9nn8xhuj/IeqfQ+UTAy9jEQJkTz58Bf/owX6Yu6UdkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 05:01:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:01:52 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v6 10/24] vfio/pci: Rename the helpers and data in hot
 reset path to accept device fd
Thread-Topic: [PATCH v6 10/24] vfio/pci: Rename the helpers and data in hot
 reset path to accept device fd
Thread-Index: AQHZUcIItVeMG4jPMEux+RfoZ4FMWa7zdv8g
Date: Fri, 10 Mar 2023 05:01:52 +0000
Message-ID: <BN9PR11MB5276E8F72DD3E416CA8ED77A8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-11-yi.l.liu@intel.com>
In-Reply-To: <20230308132903.465159-11-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS7PR11MB6246:EE_
x-ms-office365-filtering-correlation-id: 3d1ce2dd-a10c-44bc-4369-08db21249000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: unSejsSXmbaJa/Ithrl2Ma4beH+ivfeC6aGils5tSAJ3Efyn4sJos/VcyC1uQmlwEwpcBIocypD526x0uF7Gj0pKiWK2/6jiHypdt2PwwLNVo8rVNvK+T/5jvGC4s8t76zW7CJEa2bGf+9zLdbf8zn64tbWsH9JI4yE2UJ+qNpp8u5VherZUeWr3A8ctyes9sDPzBFE+7UaavLJwN0V2IPazHpTUdmmDEwJOV8/a8NoQO7USGQfagZIiNV6G82weL55lxuNyVR2vi1SsCnmhzaGAUwaE/mB6KMR/N8P9CNuhgQMtdicMeTxxmo+ql8XswoeCtNLEy2yYbD6fWPED4utvCd1M/Wgqasq+kKTYHSKJpgF2xawP/b6WbfvVbGbKlzD2RBo/j4COQS4fasAWgq5+Zwceu67HW9BfnBAAkNJVq3A6rNuaRQcH6HX9/zjeh95XKmpNbAM9w8VR51se99ndDkcO1EVUdkdalhs7QMRx8Ml9i/sqEjb5i2yn1+moSmYc8SQ407DZxCzZOPwmWCz2XPQcmVbQ3h2h70Zu5efO1iobjwa0C0r9LgGfHLh44boXOBYkyBiAAoMBnfKMaVo3HqwMLUW7ujb5/mVTg/KXRFGIbN5EAHE490qRdAsn9dULiVZ/1fDHejoMwm8OIKskewu4JtGMQrSVfDkuA+5AFHX9WYo+wirhPF8s8ibQQ+UA4CE51w7v34jYesquYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199018)(33656002)(186003)(55016003)(71200400001)(7696005)(82960400001)(41300700001)(9686003)(83380400001)(26005)(76116006)(4326008)(52536014)(66946007)(66556008)(66476007)(8676002)(2906002)(64756008)(66446008)(5660300002)(7416002)(8936002)(38070700005)(122000001)(110136005)(86362001)(38100700002)(316002)(478600001)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H7uIYOEwr4hmz6c2g7rDeW339qjfR9RdVLLO/bVgz7aiSh2hphitQU9C6ov4?=
 =?us-ascii?Q?89Nx1S1GOoV5zVX1dC3Zbjahf53MWybcku9qhU2Nil0Eat9xoYyf+jB2XhHi?=
 =?us-ascii?Q?j2a9J3c4pP1tmmjic50u6cHFJCOjvZAxs+bWfdPlFW4SvsXw6GCUkn8i32j9?=
 =?us-ascii?Q?qo92Rczca4KAUhfGWDoyKBBmACjdSAnPR3rUCEbO8LLsRKxstY26cTRouC4S?=
 =?us-ascii?Q?pH19yoRiyi+tIxPDOvxQbKxJukEipistFZjrlGFhkk0TGu0wEk1ncKdGVoo/?=
 =?us-ascii?Q?yByrmHxl5el9bU1Fykvkwc2cKtfNOL0JlX6vO/2gUOuvnzho6gB5j3gH9sjl?=
 =?us-ascii?Q?bkVF9Jq/G3t+lgLYr0CIAQCe0xBPgYbhsCAtTLqbbbOIrxjbyC3WmYaoA+WT?=
 =?us-ascii?Q?j0DhPMBz02u3gzd/2cDKnp/lXlUOXAmGJrjWo1egRIoWwYO9iOUahpGAKhph?=
 =?us-ascii?Q?F0gedpN1FrbcNPOfgwdGdGhQdXPuRuFo4dD+WZT4B4maDg3CRfJKUrc8DGbn?=
 =?us-ascii?Q?nk2zPuvS1c9vpdYbH0O+NYL7JpBTdO+X+k4G4OToAeYjxOAlQBnhsCL451Ly?=
 =?us-ascii?Q?tWgflaWnIMTuRBL0fRRbwuTkju5TGd009mAblKJTaW9TcXzuvLUaIOWDdiFH?=
 =?us-ascii?Q?wBy3/S2qVzzzcNNrDvJG/S4PHJ2gyvpOBZgrVxUfSEXCM0yYltef4MycAii0?=
 =?us-ascii?Q?F0jf1Cg8PYtXtIIkluPsIDAdTGfz1GY0vvcEnkRpZ+imuasQrmjWtp0MWoc7?=
 =?us-ascii?Q?i4BToVrzS2vtNMmcu0+5jzfa2LDfUEzANb8mNppKI4S5GWH7y0KCIx8zCcmD?=
 =?us-ascii?Q?4r3jvqHkypUT5518tOvd1yGplH3Uozs8B3jpqVUIJnG8TKNUA5PWhurumrMA?=
 =?us-ascii?Q?dNZRmNaxCf+mVR5Q8SK2BxHUoXSIehSK8wREnVMSSY14bksFyEqYi7VmQMC6?=
 =?us-ascii?Q?7Vx6XOcnvSwx/ASX4bddFn2MjVnztODbs8Li76z6L/Gri3Lpgta2RlI0OkLg?=
 =?us-ascii?Q?84CoXItYazdRmqqcofzXDGODlcUi0LHJMwuNTTbY1EidQhyiRCGbD+x+EMrS?=
 =?us-ascii?Q?sritpK5M3dtZINdvn2NPqOHz4TLWENxESEU7gcMFo479VAxQ0WR4wwkmEvSW?=
 =?us-ascii?Q?6Huto5NEA6T0RNZiKDAk6py1X0c+97U6h6zXHDeKHqGoy9HDDghbq1ShYzCk?=
 =?us-ascii?Q?DKLx60seOD9McSqUq7N2DVjsHIE46KVhBQxwNzDcjWHZSaQCHRuUXZmrOKqn?=
 =?us-ascii?Q?G09mccYO0W5NBqg1EQbjE+erv4VH5EAG/QerWmwv0u3PrT2tutKpnstnK4+R?=
 =?us-ascii?Q?YbEYjPXhPVmkBqjd8qXDxArg/Velc+oIIxZXfYUmlvIc9So0PJXmpB0mX1+S?=
 =?us-ascii?Q?mFkbR6qkaH4rfHinHPr5MLKdbJJ8Q4+kPTaG5xzdgGr6Fx4sv9k1ENCtm7Cv?=
 =?us-ascii?Q?FWRDe8gkbTK75OlnuWcNUeLINxhYCN55KwJL0ay2iqPuCYZE3Oe+q6QtbxtN?=
 =?us-ascii?Q?tWozJcoWHgjBHFTYRBKQp+vuz1lfKOlHsfUohaX5rIYB6IuHCUTS2GyBIqwG?=
 =?us-ascii?Q?8iI5tApotycaMpbDHzk/JyM1uzwPq5ocs0CYUUEj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1ce2dd-a10c-44bc-4369-08db21249000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 05:01:52.1064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99OBxVtsqNJUwtv126xeMgnMWyKCNLA5nnSJ4xUkXxniEo+Q7QXda5f+lS4lW6dAEgxPXj8rS3s9c1lJ8QSocA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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
> Sent: Wednesday, March 8, 2023 9:29 PM
>=20
> No function change is intended, just to make the helpers and structures
> to be prepared to accept device fds as proof of device ownership.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 40 ++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
> index f13b093557a9..265a0058436c 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -177,10 +177,10 @@ static void vfio_pci_probe_mmaps(struct
> vfio_pci_core_device *vdev)
>  	}
>  }
>=20
> -struct vfio_pci_group_info;
> +struct vfio_pci_user_file_info;
>  static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups);
> +				      struct vfio_pci_user_file_info *user_info);

I'd just remove 'user' here and in other places.
