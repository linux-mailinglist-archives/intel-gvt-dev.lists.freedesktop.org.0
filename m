Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6F6F00D5
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 08:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68710EAAC;
	Thu, 27 Apr 2023 06:36:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3E10EAAD;
 Thu, 27 Apr 2023 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682577371; x=1714113371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BsACX1gxzqHBTINCD94aeG8UyyIy0VvYJMvzTBcsHW0=;
 b=i5gQuTr4ooIDAMUgjaxYQSQuLdh3dXBJsvSB9uABUpRKLRe2rrPdCbbZ
 eIzNr8eTNOPIyxKVmACf5cbu/boogVTfzFRxGPcm4PI56dGlaHOEJnj6c
 8qupeSH7mF1GO/Q/153Wg9xdJOSKjx0E37W4j9R85obGswHXHEFL7IU1h
 SRc0MwFIhQM3KPj66kHMbMYVpIX4GsMQCYKpigoTT7MBpfnxLSA/ohiL8
 wnYElsEvUgKtd2vxhvacU1WHdkOAsfZTJZ6kYLbZbUqCy1eFMW2U2VOfK
 e28PufCzHKxaNBHRAk6MxPev0Ql8/mTWK6K/PjRAL1/khcEh43khKCuvE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410368425"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="410368425"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 23:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="1023958874"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="1023958874"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2023 23:36:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 23:36:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 23:36:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 23:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8/rCxfhXH7PcHIkJlmtoScl0+tbx342zJ704dFuHfJyTy3O/h+R+OP2GA/xll+mfyupYA1aSt23kaJ9SjhqGid/Vqw/xRBCOyFIq31hH14UwYsvflb+Jz3e57KucKNZcl/kyoEHiOb6+9Br/dWmdX6Qg5KyQP0Sfk4uEtlc9ZDLd6tPHrXKLCI24WzPbEQmYNJfoHUIWvmfgx6PZrXPVsYke+GE5MPRs4D4tQEXu9mAQS1CkWsd0a3Jn+TU3r2/vcG+NCpK12TEB4dvIV+SBMXOw70E59VT8UoEwRMdHkHNuxMQrIaJOIckRB6hpRXPAmuUSyWBRzODUpHgqlGefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85n55+PH/jUxuYtV1snigDF3+1OApdTQY78wh3Er6Do=;
 b=Pnm4V0rBoq2msCh8Y6sfDyjX0UTL4R8M7ckX+S68WdKNjOYJrMV4EAKYX4+AcOjdnA98qbZ2Ar7Ee1qu06GChaPoUCcO45pJffgTM2ZWMuwZUF4OTLjshR5YgjkmS93gcT3s2KydxmRjyEpv4GlW38JCW8mJGzEhEgEavPnF1y2W7DEbiZ+1l9wb7G1RWg7RVdfQJdASfFdEJEOWGHwke+XzrOguVohZ/5opHAClSl0FaTBb4P/zlqEBIO2xSGKM1A/1BebIkgPxoyqGE+kegiB8F8dnqy/aykBOrZtx56hdPHLDaemTIoHBtU7OWpUwd/SAnaJ3g7KqOmvznKbGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Thu, 27 Apr
 2023 06:36:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 06:36:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v4 1/9] vfio: Determine noiommu in vfio_device registration
Thread-Topic: [PATCH v4 1/9] vfio: Determine noiommu in vfio_device
 registration
Thread-Index: AQHZeE8BYlOjF6JKvUCJ1cDRgFlwZq8+s+8A
Date: Thu, 27 Apr 2023 06:36:01 +0000
Message-ID: <BN9PR11MB527688F8FBB299306400A1308C6A9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-2-yi.l.liu@intel.com>
In-Reply-To: <20230426145419.450922-2-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB4776:EE_
x-ms-office365-filtering-correlation-id: 6eb2907a-0311-49d2-6459-08db46e9ab1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nqykg6xnmrYLaSxC7+ktt3lo99JwN/YbGbaeiCmpWJtawbbEi8RvY8PbEF9k0SpPf9PlBNGnMmzG/Rq3/QNeGG4hXW7eKl71J5FgYpBiQfcbZ2zv57MAorWp0wxCz0HCJxWBo4Lec7mMChPAoux6rwyraKMR9zfvBsXXwlschyCA10C9Cr3ZbLsB5KjaGyAXqg66kQa3Z1Iv0s0hfRwGnpavzcxiNBYEpeO/In08HrCdt1RlUr7x4z6CYMm16r2VPRYL/Ex1ra1Nd60ZMe8VlsTp3CBv4EjOozE+kN0DZy2sqXnCD4rgWFgQ3+gbcONl3fzF+Pr8t8PHrKzz7fr5NhWWYaeZZ5Y1pMQb/v+Gp3vNTHqsDVfAnS/37KB6mgxWLkavy0acfvRxG8Jw2f4U/a5PBdRzxA8RqSEc+hH3cec9he9c+gIHTawmgkCInwkdzUJ6dj6EpyR5TGAMemBEn1yA63HQYeba6Zbz/u9xb1vJ7hY3MIfiQzBq5N+4l2qKrXLZO3hlbpT7KdF8/sHf9ejEpC8mSMJPu2BO2RlVk8xbWxYelvtDpXjMzTqO+s2XtBD65BNF5oVOLIMIthKlmDtHjGfe/MIDpZpb/70v4O5UpIuZPXW+kpkVmJgOnijN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(66446008)(86362001)(186003)(6506007)(9686003)(26005)(38100700002)(5660300002)(52536014)(7696005)(33656002)(71200400001)(478600001)(54906003)(110136005)(38070700005)(7416002)(41300700001)(2906002)(8676002)(4744005)(8936002)(82960400001)(76116006)(316002)(55016003)(122000001)(66476007)(66556008)(64756008)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D7WE1+LL0SI5rKb3qX6FpBXjfRTQz4dj1I2NX1yggXXByY1urEZxvibOE/vl?=
 =?us-ascii?Q?UrxOlnDpIOvSBu26FzLiPq1BXhgMrWHSLQByxCiu8ZR16HLyXClQ2kmKV0oZ?=
 =?us-ascii?Q?kOgsNN0ElM81ugGdIzV4DjGnUlU6/XA6M4ZPsJDV69LMRUUcD/cPSjtM3LxU?=
 =?us-ascii?Q?+NuGLFI9f1g/9aTPYi9BXZ6Ynyqa+XTOEwjlVO2lciaYUc6WqBVoFl2m3JwJ?=
 =?us-ascii?Q?3rCSR9lW/Y2hXv/r55wZ7iKjptGqJr++Rmq7LpAp/Jx9TmYrNTHiUhuzcZVD?=
 =?us-ascii?Q?Wx6fmAV/DVAj93NrOpAfVtjqhRqVC3LGqxhISfbHmMYRyFUiM+b6F0EOOFXk?=
 =?us-ascii?Q?FFTSVeBgIlXi0KaBEWEhWC69YyLDhOFS6UH1SP2ZispXZrPgb2uAWZ6p2IIm?=
 =?us-ascii?Q?YG7/O/AQf+l2wM+npw6/Sy6c7HKuobA2W5g6zE9ws8qhP21dGYAGw+YsSyDy?=
 =?us-ascii?Q?OEaLksuQpAkNUaALz2JEvO7fR1CH2K8lNGHQZuFdy8l7bN3DbO+PD53s05zF?=
 =?us-ascii?Q?yBgLGQyrzSPmiOJj3fuu++A6ONhwERK8FXMhBTl/FXeG27niuGrGrHDCjQhE?=
 =?us-ascii?Q?u4z8O2dAWVPRV/wEwWI3+x7W8BnXd+sX2DvqxTkjgDou+452tDH9b3sFtIO3?=
 =?us-ascii?Q?vy/+3DwrDOOweGPa7BdjwNl29eRAdqI1q0d5DqJX1qWi/ASLJO5lH74JPiCd?=
 =?us-ascii?Q?qzmmbHu8E9V8giYopL47C1mGjoD9kBphvtKSiSXYEh5994+YyoqsBIBbGfB7?=
 =?us-ascii?Q?nRZScmStjEamENzkDiT/aUa534x3P0cBRBkEbSviV/dVS/kaqWqDfdpQ8rYD?=
 =?us-ascii?Q?rji1vxeAjUOMlrzqvPC+BWCLFGr6Tn0Q9iuKHy52Bqb2Ij1ZcwPA4f0RiUzx?=
 =?us-ascii?Q?SzxV8IPGsgj83kJogmhxxnrpf2DSIkqXe5O1OTz7vrhSSy8EhA0vO8Jbukib?=
 =?us-ascii?Q?EacIHejb/StzOOyCM0IoTmRTOE7daOZHog+EL+RhV4wLJxmYAAe6qiNNOZNm?=
 =?us-ascii?Q?cw0iXTi+uC4QQLC5qfbaF/vo09jPuLG7wHvaHky1fl4NVvvyU5t9bIG+wN7p?=
 =?us-ascii?Q?E15/XtYlvZuZsDC8/XMNIpHiL7SP8QR5yASDFspy5ltJiqYRs2v1yoAXegQh?=
 =?us-ascii?Q?j/jcEUdFAw6AM3M+F8z+VSTfLYr3swf5s37hWt8PcDru8WSRqLzVdy01xBSr?=
 =?us-ascii?Q?lQoVsAU/+Tjm23F1ncKP488RlU9L397VF8Biz1DUVGA1gTMTUKlr4mBzjfUG?=
 =?us-ascii?Q?BGJ/1zYVpssmes5zWuQEJS+11Z97HKKB+V1+9l4DExupW5j9xquWiBwaD2I8?=
 =?us-ascii?Q?GCMEOHHOZodN8I6Ueg5LA7eV1HPY9uH23l6c3CTIdKda4tAGtMJ8+oOjbc+H?=
 =?us-ascii?Q?7kKXC/9Viel7xLBBkv9S+1NJ7ECYkVvJmd1xu57dyfU/Rl1cTNgA1/4aPPxo?=
 =?us-ascii?Q?kKDAdA6ovcjy55jGrSS6HP8b2ndoQZSuz4b4PMvY3wYdTWGovKpRcRTITWlo?=
 =?us-ascii?Q?T68wMvhtvZFGLjk6OaonwM8HKyy0A6yC/LpMQMO8+b4+iI+l6TjcU6xoAPcl?=
 =?us-ascii?Q?6eAoZ+6q1bKiHJSEbAVrnsKFa8c+8L4QUb1mwgIZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb2907a-0311-49d2-6459-08db46e9ab1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 06:36:01.5199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kzgZqElWyY66j7FqIzbsqHizP7RrE6rKhEp8ZU7oHlyyQuMBbOrg3Lat/IMjWO2aoIcorXMIe6lbTNStsaaWlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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
>=20
> -static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
> +static inline int vfio_device_set_noiommu(struct vfio_device *device)
>  {
> -	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> -	       vdev->group->type =3D=3D VFIO_NO_IOMMU;
> +	device->noiommu =3D IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> +			  device->group->type =3D=3D VFIO_NO_IOMMU;
> +	return 0;

Just void. this can't fail.
