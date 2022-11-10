Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64108623D7F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Nov 2022 09:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4210E117;
	Thu, 10 Nov 2022 08:29:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693F010E117
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668068971; x=1699604971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4C9cBHPKdS238/51DYhVSf43Ic09arfscvgq9OsMHKE=;
 b=W15zwPWT1QLNFgY5sn5FJVTsZQy25YD2jmMUVDZQyBESMydios5sjUwd
 ibCVwaSWvdDCQzP32SG6Ynar+VTgE2MS9qT3kmUX3IlOgk9sxxMuelUE2
 nY9CWEFXy48EROAwMMtR1zIH1ipuTyLJh/w2k6hLAtHTWwwH3oPNLuMnS
 JjKWqF2s/NJEaBKLmH36EjTFexC+eQyRhHx3xaIcseOQdZaLAS4vydvGs
 Erc9SQMkszh4j3x65NTqv1TNLPaXIhko5eOIys5TxN/+xIjZS/jdsTzDC
 1jF0QF4uE9HQWTNSZCNf9W3EmxEeW1ndRy7La4iz63J7ObONPAzEKTCK7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="311252146"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="311252146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 00:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700710709"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="700710709"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2022 00:29:30 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 00:29:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 00:29:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 00:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3oAX+OADkL4e+MFo3CmRhFex/SiFivDQXojOZDoQJR0kR12F0PaDeEOo4fyke4YlxXXzThJ9kz07J+mC5gAgrqjvXiW0LyNWOctwiKiOWKKavgRwJRDDL/OeOA1hkx+bPz4C3PSFeITpGgT27CmyK5Obu1zSfTto0yH6s+hrG49YHTWZ9gkUkK81soX9bXbctIHV9rINkV9kDpcAvLpeZ4LKeLmWXJJV2kMfEfItzzalCpdF+vtsKTzWVTuHiebB7hHf1HANxvTpp+EdujTwOrlzZOSjgYwi332OqjvSH9n1T8fTyoKQFNrgHa5tUjeqGyCEEhZOFfvq3X7Qyl/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C9cBHPKdS238/51DYhVSf43Ic09arfscvgq9OsMHKE=;
 b=OIwLm2YJdFyk+CLfCbExxczCy/lGjw7gYvtxIbTX7bLU9XDGs0yO8N08fyJ47SRsg0JyIsteK+TWVuijLrJyKUXypMhDl1nARUTlwCIKWJa9+OLD+p/20iboT+SOzUuSUAtbXpIbKmRIwRKGivc7A5ewIKQb3ZfvXAkA1XD8moJLzehyHEqsnunw1Cz6e3tsmaIHWumSieR4vRvTvlQbznzhSOjtOnCPAbATSVHCmGOLuF+6Xunu9mJ+DSUJn/o2FdLdx4/xv6cgRawixPoGylVRQGpI5cG9MIjYHuedrr5lq1YG23LtqMI9/+Ydqvsx4QV/GuDTKUQrQu2/Jr0twg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 08:29:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 08:29:28 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhi Wang <zhi.wang.linux2@gmail.com>
Subject: RE: [PATCH v2 1/3] drm/i915/gvt: remove the vgpu->released and its
 sanity check
Thread-Topic: [PATCH v2 1/3] drm/i915/gvt: remove the vgpu->released and its
 sanity check
Thread-Index: AQHY9NIaBh6kFQvZjUyJVKh4Z7TtMq4301zQ
Date: Thu, 10 Nov 2022 08:29:28 +0000
Message-ID: <BN9PR11MB52764DB5574CB5E4809979B68C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221110065959.32249-1-zhi.a.wang@intel.com>
In-Reply-To: <20221110065959.32249-1-zhi.a.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN0PR11MB6133:EE_
x-ms-office365-filtering-correlation-id: 613738bf-91d2-411b-9c08-08dac2f5aeed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g6v/XoAkeA40bRBsscvDtsKzrtZUWpMDqsL7Z8G0LWia5PedGpRkBLMW/mK6C1JceKgu2F2cS+Lqfp/1z4z7eE5lBlqG+SqZxqG3sZt8oROyVAdcFWBftygv4aQpktOkB95+Qd9qGuOsrIU8zby6whwg6zOV3MMWKVG+8hENJJdhhMAice6fA5RKnjT7rBBXz/+PSCsG7wY51rIjcQlSb9wjuSOBntRzBdiJ+DCRX3ai1zUYYkD+mJn5vInAs8CH4ELh5xgWbwrnsAIMU2JKN7M4ziDmDp5FaEI0NJd0Bm3L5a3+csqHi6KlgcJ3n8EyJ9jXIN9GXWtBGKadE+NzPZEOb25MZKUeXGVgaFsVa0+RrvxBiNsBdKYA2LtTjRpBjdzHbgPisGjO9SS5h7ZRngMfomVccuzAbIINgylaVmCeFP2lUDf3Sfg6Om/04ecX2C5DMQELtSlIRmObjeuSxDnmgSyaA7MW3Hqohz9F+EaM/YEi51OPlJ9HFogQJDglnIt4Bk3OGT4GepQrJclfGyWVx9KpqqAuxU79Pk3Og8EY8ZBOcY0zdURHSHLkf08pBdg+LrMVGsjCej93vmFumeRXO5+aio+G2tY11pphebiPqucnb42k7XSqiOxhbqnewQw1ApS/0HF4sa7Zy6o5+90atVa6ICA+SL7rgi8e2/wxZC+qm3oEcTmQKsvas3NTachjv/KGeO7K25NjErVodJTNg0in3+KpNrl5i+lSIt2fVe/1qzFVJeDF/yWlNtj+6/twL0yvZf/UFux1b7q6Sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(478600001)(71200400001)(33656002)(38070700005)(6916009)(54906003)(7696005)(186003)(4326008)(4744005)(82960400001)(6506007)(41300700001)(38100700002)(66556008)(66446008)(52536014)(64756008)(76116006)(66946007)(8676002)(66476007)(26005)(8936002)(316002)(55016003)(5660300002)(86362001)(2906002)(122000001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h0tm+SNPZj+2dUF70NV3i0JmsPlqDIbDjHntAI2vUI6uD2UXMHenkkP2VhVc?=
 =?us-ascii?Q?ucDFZx8rdX1zdlVko4wz49Gcy7g20dGtz72oATF+csmfqAM7ELkScPQxQMP2?=
 =?us-ascii?Q?c4k9qR6OGspstHxIhAy1bdf/3zjk9aUMnartEF0f9MABqgCHS3Y6Ab/H+G40?=
 =?us-ascii?Q?SYyb6twHf+OxYI6e6IOLMmWY0g3Baj/Nq+3LsE6YT8A5opR1zAIrZNERQSs5?=
 =?us-ascii?Q?1A5r7hZW9S2uSTs1ZogK+3/x1klkEx4DTpfxoDkYj2fWImdwPBygn/HAp6Nh?=
 =?us-ascii?Q?tEj9ViFm6x1lBU9ov4Ud6g9oYKgtbAyNjQ5T0r07Iq7gP+0A2V8GrfXTu1vt?=
 =?us-ascii?Q?Mh7vzMxwdyj7cvOV7K3/KdOqAFnSth9dbFd4oGAS1tkIHaya+5MMaeb36ipj?=
 =?us-ascii?Q?uOXDaEI8l+G5hZFtlKDjXfbTvMqLrWskM1r8xilqzVIUOC8uNLvK8JZVHOW2?=
 =?us-ascii?Q?HiYC9mNCU8vt/owtZukSzDGjEBM4RXuP7Hlur/OA3ra7iwp8j9GqHLORviFZ?=
 =?us-ascii?Q?78QEgkERAIlpV7vyJudhXLn35kdBJ8yAPMtF7TISbRxGa20cr5stWdODZ03A?=
 =?us-ascii?Q?Yow82KnpQFOiCrwnzXri8JWRTvKmAWfIStqN9L36PbVwbTLCK3nCU1Vq/s6A?=
 =?us-ascii?Q?39CS4OA61q1sDHrddJvSv+T8ycZFciVwhzS9YPygWP6z7yMwdUxyRhTRoeiW?=
 =?us-ascii?Q?yY5OQNCODrsgXWtb7I+DSpKu5s6QGU8hPUfv47zAq5yrX8Mdj/cKk4Lsdr95?=
 =?us-ascii?Q?hbB+r/0FF9ubuu9djQUlVlIeTkNdIlv6maDidBlgu7U9DmbKbVOa3S659Hz2?=
 =?us-ascii?Q?KoIw8oVgq7DRE8JWC2jY8edP4ZJZYVTDF6v6EzvLo9UJPGMiLz6Om/x0FtM1?=
 =?us-ascii?Q?sybedtdIzVsBL2uC2RB6FBinmxCqDdLsTaVYudHwFrXsQhuAEHa/mhfYXtdc?=
 =?us-ascii?Q?nmBeCwKWdUzLBT39D034xxhARl4WsrqQyfbM22SNxKG4MQbFt01a5Oc8/dBH?=
 =?us-ascii?Q?kbKGxct+Zde5WAUGoGgVP3g5yGd84hrYXxmLDHejc1bPzpcrXAApQfQ6SsRO?=
 =?us-ascii?Q?PhjzP4uPkp2mvIiEaZ8e2Dqn5l9ituw/r4EzYUQDnwd4C3/IaGImZ50m12SV?=
 =?us-ascii?Q?ZusqPboYOzE6wvDvtruGaygLam6084l46NqwjfxSkHsGnrqoBT6Dp0hdZ60A?=
 =?us-ascii?Q?lWi+LJcDPTfOdUbfxpFsWODGCBBldtGrWl17vdANVpvS8MR3GvEn0FDk3viV?=
 =?us-ascii?Q?o8NycoOgsAT5dUU0e9u41k5UwrXq10d4SuC+9CzovYVS6ofRAW5WAArJUzr0?=
 =?us-ascii?Q?CN+eiLLkk9FQO/Fj328KgyJzsR+7bhqvAFwwIKqPZ3l1n7076yjdfs3GXU6D?=
 =?us-ascii?Q?XsVIr4KEpXxjFc+gE5lJSNpy6HvawCZ6Oxwq4sKNSn4FYdH1SpIrCQKzbvck?=
 =?us-ascii?Q?2v4RKRKw43k1PlKHmQoJ6Po8THq0aGESAfeJPxWLuMeoNssNSrgXxdOaXhiy?=
 =?us-ascii?Q?mFRYGmo/5JYseX2C425zCh/Fr0qIzqZIAPA9g/z31L93X2a4ino8y9RVRcx6?=
 =?us-ascii?Q?dc8yl6e7lawWOt8u7pXvyCpW+ZVgsPFLrNowbREm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613738bf-91d2-411b-9c08-08dac2f5aeed
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 08:29:28.3617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phFpjDcPw2Ngx31L12aXE68SP/aJtvT4aGMjMLhF5eJPM4B+yPTLjA2kgR2wE8rW3KUW8RImVNaHxCoRw5I7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Zhi Wang <zhi.wang.linux2@gmail.com>
> Sent: Thursday, November 10, 2022 3:00 PM
>=20
> The life cycle of a vGPU, which is represented by a vfio_device, has been
> managed by the VFIO core logic. Remove the vgpu->released, which was
> used
> for a sanity check on the removal path of the vGPU instance. The sanity
> check has already been covered in the VFIO core logic.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
