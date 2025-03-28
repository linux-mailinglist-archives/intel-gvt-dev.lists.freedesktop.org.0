Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E68A742DA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Mar 2025 04:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9CE10E00C;
	Fri, 28 Mar 2025 03:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz5+lRbT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF0010E00C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Mar 2025 03:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743134201; x=1774670201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LUse5tPNp8umPb/3ove6zGC8BVjYPV4WSLJssDldnbs=;
 b=Lz5+lRbTAmUPeMVGn2YwRQOc5SS8cKcUjN81T6Sg+lIw8wRz5oKH8GC/
 +4J6RahPPFBQIzLURgOhizKi+Jcb3fBxtnne2eDhXaS4xHpKmyuTUoTDI
 XvNyOzLoteMOqxHcjX9lPGf4uiBMhPgHtaW+ORmdoZlcjSykNJunePwn5
 5Eq+690tp0DexSOSHOHO67yBvdygtnbrYbaE92K+Al3kNPgHUQlSLw9j9
 aKCJGhUTzGPMqVi3VVvmcUtIGHkBlGeGWWlrpwFHrJvaamCRYlGD6GnSE
 wrGb5QfLz/HhGzJBg7LWnCb+BBmL2TmkPSMJ/EImnv1+diokMRlRop6UT g==;
X-CSE-ConnectionGUID: s0DCTnXSRWuf+v9KgPU+1A==
X-CSE-MsgGUID: 2fxaPGC+T8+BpLbuprMX7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44651889"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44651889"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:56:39 -0700
X-CSE-ConnectionGUID: FkBXJkDJQUSZNI69ERLrKw==
X-CSE-MsgGUID: uG13fF7ASuuZLh8YVXojxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130546762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:56:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 20:56:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 20:56:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 20:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7PddHoPRqpAyYVDMQv3Hadqq9AdMoNjATSxOokTpeb0wHMvSUQVwhCfRC/2owzJdpO6YAoQuSqqLdO/7YWYXLIJ8C+ge5hhpw4OYiPpVzA6VI3tmSe02thj04zbpH1s7jR2QqEixD3ngMCHme58sb9RLxxlalA3ctRenpixR8g4yVDQcB4/eUJQjS5YJCn/OTKoZySQQFLjjkrSoNlXLkvea6kg7QTQz2GL09AMtjiYNeDp67xMHq0dP1jPmgGlU25SBtM+g2BMhx2bTXeFwx+KGYEQaELTBhxAh8q3+qUXNdWM/LccLPDxQ5+PkaqPxhD8GEANqgfDTCoH+jM/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToqwgTVyLS1zYden/uX2vxdp7N3vLgcBIQZbziCMepw=;
 b=cngVCGPwFG9Qk4h5gnwh8xaRxjVDC7USSG+xPX6SF8qB95e+eF/ns8gaBvaz87Zu/XwSyWCpe+f8Ag2r4Q3k5UTS+Ug2nGzN8y3f2+JxIEKUbO605ApdLDUJ2mOIEEIka19aq4XsSdGtxvzvBhDY18XbBWQ2605jL2DWU4QJAdB+wduhWk8xIl25GEUuMeElYV+I71lcLLml1ztUgjoGOJxyr6951vJnzO+4MaDr9Z30G/nOLViYxTpQzbDeQ4ZEJ2MQq6aFuz8bP7nb9KkhEiTGMa9+DzHA4fz4+jsoTBrFctyFoXyzJvuWtf2rpdsoursEQgo/es62h6Yy2w4FNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Fri, 28 Mar
 2025 03:56:23 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:56:23 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: char array initialization overflow
Thread-Topic: [PATCH] drm/i915/gvt: char array initialization overflow
Thread-Index: AQHbnTqYV0ZClQ07P02ET09Zkj3QRLOHIs6AgAC/J8A=
Date: Fri, 28 Mar 2025 03:56:23 +0000
Message-ID: <IA0PR11MB73076DCE29DCBACC9F185DF6BAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250325-gvt-v1-1-ef41d30592fd@intel.com>
 <Z-VxJfzIYgcglE51@ashyti-mobl2.lan>
In-Reply-To: <Z-VxJfzIYgcglE51@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5087:EE_
x-ms-office365-filtering-correlation-id: f0ddca88-b554-4e85-d2c0-08dd6dac8182
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KkSynYGdKHNmYpTqer7xlGjEWF4bkJ6VmJ043sjOUF85VaWdRGhLjUP3xjPy?=
 =?us-ascii?Q?axZqVSM/4SFiGRG0jvFdhBvfqWM9yCFtZypRMmYhlcf9chHhyNCAIDRzziRe?=
 =?us-ascii?Q?Hap7Y5A6yxc2AYx/XIy6VYpLsoVtNoQ/INM5CjNTamF8QZ5t0Y73rlUr14Rc?=
 =?us-ascii?Q?qSq1x1lVaND89GgTe3hygTLz7t7SpJ3BnvAQKvWb+JsKB4+ml2C4K/xtDUVd?=
 =?us-ascii?Q?YDnyoMAVF8zmwpbn33+/0kjyDI3uh1FJwH43lyDgeQS1kkoR5XZhL2/sFJuB?=
 =?us-ascii?Q?tKq26KCLDbocHzdY5u2UT3Z+zk9XM8KNeK245Ryv1zOMk082fKegQQya9TGe?=
 =?us-ascii?Q?BA4XUOUf8iMpstchkxl3YY+beFDRKXH+O3n1X/5v67rkG7C8pFnrgQdGltYO?=
 =?us-ascii?Q?LHhOGD2jQnpwppIX4Hj4cuPGDFTwLz274t68QP8zCBVVwfJZwVV2Zfkp0EV+?=
 =?us-ascii?Q?YiHzx+XL4WQ2MPQplAw3srUQxSmbtdjEgvZRkNp59UOgnBjcU1BiLrfs9GCJ?=
 =?us-ascii?Q?r/eV8NemhxgEkuj6dDvTSS7WhzHw+3jvQ66Ze9pftuL36Bmsrq8LY0Gkoll+?=
 =?us-ascii?Q?epSpXWNAvyq0jVA4lWrOsF8JfCYBW6D2R7Ndkf2DE0FyrSFwZ3ex1GCrapLp?=
 =?us-ascii?Q?GJBnKYJD5oZj1O41WBvJt5X6vYPxYg43iarQexJ2pAgOAxw0RZPTCpCMZP7O?=
 =?us-ascii?Q?1DwB4ElbKM1Czgg4TbDl3GJtT2YvNYPIm5Qw0fsp9sV5zOLDAw3pScg/6vrK?=
 =?us-ascii?Q?GR628V2wlgf2NL/kj+pBoDJZH0I+wk9J7Z0+PKXFAIhLrvQLGVad3cjbUk0t?=
 =?us-ascii?Q?Mp4sjhvF8Tbb1mgv0VxYSxI9JQkB67N1uQfVqDXc68upGqM5xQecodqfbcrr?=
 =?us-ascii?Q?7MxO6xiQDCh15iog98gmNOCJeCO8DDyICi9a2hB3GSmlrD435E8OKpZC2BlB?=
 =?us-ascii?Q?8tScQXfSColScqiLUi6n3AQEbMHONJXOnFDtAlUr8megiHX1/8Wy0qL38Coy?=
 =?us-ascii?Q?8G5lobu+1gZJEjelzSRhUr35Fy1QpioOjGAd2i79Bl0qFZKBxsahO58yi0rH?=
 =?us-ascii?Q?tErukgOkX7m0Vcb/Hd9GuQq+xHshVsrAHRJLzX5YY7vUNZh4nYSR0LGUGNBu?=
 =?us-ascii?Q?kzf5b314+sn5dnS5r3VhPbYGl/vCm94qXUobg/9HetRD5H1NE1CGGXacEIRb?=
 =?us-ascii?Q?yqXGaMqr8ul4+WMtBgF9fC+uNppfjW+NaKYFdkKxrRlS3tOsKII0ehhQNt0R?=
 =?us-ascii?Q?wjHxgOQBaXj0GEchYizi0Zg8hhLjSIYlJIqZIfq3z231es08RkPw0l3cbCFA?=
 =?us-ascii?Q?pLLGs+6GsTLKphl8Y1g8Jh4FTPz2iKMS4TAQLfqEyfPFtUB+JMKVU4jtjrbR?=
 =?us-ascii?Q?SB6K3zy/JowkCHuARuO7mo6x39TEMemtUnD+ufJqTvagcSH8KqC7EVhjoH01?=
 =?us-ascii?Q?yMQcUvWUhc81BTug9ARealEnkLaxvkAI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MD8KN/1BdqqfsK8mQcTEnMgbEqn+2hTP7HpQz7gu/RdmBYGpTk7UFvUhOAC+?=
 =?us-ascii?Q?VRLM8OJlZTd7zMRpUAdrUnYmYHNVy/wWvNEDbDUTx5o9cdO1v2y8KqW2bm4Y?=
 =?us-ascii?Q?TzAVj/ogoTtn8ASbGMc2Hd/lJpMOwXKokEiggNPW0xc2uZDNSXQpKGZwZtYd?=
 =?us-ascii?Q?7tgh2znDkervsGcZ/j6+yOspRj+PWK3GeRS6hEM06fkTKO1pAKrwnoC23tA5?=
 =?us-ascii?Q?Tf1pAE/5LSUvG6csRCC+w3/7m3pnjArhuv8/8fckw45zZf8uyoqwTvDoNSXY?=
 =?us-ascii?Q?vWoCcuUHtSvJqHluIBYIcZMVuIdiau5Ud/+pUHsZ8VaCnSMaJeS82IsKjS2G?=
 =?us-ascii?Q?JRrmN2qpsXY19jAjlbK9qp+ZQaXxZE59PSzJXD4U7RRdM5Rm6MRbQr6Sy5Zm?=
 =?us-ascii?Q?aRPOp+cTqagLCs78utxXKoa1X9cYG3PrR1gonOgNJmNHOM+bu08QGO3Dkk+M?=
 =?us-ascii?Q?HBbVyeiI38s0lx/14jFm7BkbP1J37yJwPo1RBgV2wQYtm6J3JDiSoWS5x5ls?=
 =?us-ascii?Q?KWbu5JkDuOkYzLtQSXL9j8/qQPWUwLP31slQC8MJWrggHLl6LMqscozAKxTi?=
 =?us-ascii?Q?B7RB9RmQoil8++hacst0Dre3eRj0FHsRx7Uegs1hm9gDqocQuyOKoXJU+IiV?=
 =?us-ascii?Q?QlQw99spcNXft6wRYEof4m64J+/jXEeInLZan2LpIX5vCsMWj+52TzlPHiqI?=
 =?us-ascii?Q?+iP5Jjg4EfWBRfk+qRiBccWUZDoBmg+1569gpUrH7ORCp8s/6QZXb+5RPgAE?=
 =?us-ascii?Q?GH4oq5zpv1QrOSkmDaJcUkJ8UUI0PiwTMSAWu+y3W1KhRUfpATOUX59BsQ3D?=
 =?us-ascii?Q?oq4uCZVebfwqdYinm+ojq/KBcGCDBi26IaLxhM1SZlOgivWcez2WQY+ISYLg?=
 =?us-ascii?Q?qL1ltFHNezj3cZ9Y+Mi6Da7WTBc9KbgWJm6hHBw5SReTNqpuOK4hPph59Ybl?=
 =?us-ascii?Q?eparyIyeoasvy51ZdlViFaoUUceEPrau/E2BjDLXaUZIfz66SBRlUAJEEZiS?=
 =?us-ascii?Q?UQ2AF7t3cSHzwrxnjGd+h7UqJphUutUQAJzBL4jMZKyw0geBDclOLQ1VMVE9?=
 =?us-ascii?Q?78DETYBbdXOkXC4/6GFONk5ZT2J18I8qsQunfYwf0ZUGJiFTEYc6Vy+8K/KS?=
 =?us-ascii?Q?7FmXGfdqTgkCLRct2DkeE8I/7G0iUmLGdU4zaF9EFG5vrHHsGY4XWWne79RS?=
 =?us-ascii?Q?qMkc6o3TuQpAyrrnZKTc8F0m1yJoSI5BoRC9lLNqIxmbMF5PenRM+L+153ft?=
 =?us-ascii?Q?fdx988xFOBUNC+Ue5MO3vvr+Is43AhLVF5a/FecbTYrxFYSO4HEAFDwtMVhx?=
 =?us-ascii?Q?5YV8q+nzpazVnoKZlR82MHtvnrHJcL8HHGT27Cago9sw92cOknOLSb7LI0sL?=
 =?us-ascii?Q?d32a5SS0AyHPRq5YijEHCE/23+FDLQ2jmxv1bg2WmtZVm4ju/xfB0UZPiOVC?=
 =?us-ascii?Q?tIwUEMo4KRvgdWY/+qFM+N9etwi4bpAScFGXfaEw4ewOiU1e0vK80R8d/nQN?=
 =?us-ascii?Q?j/wogx/7s1VrXn7Vr55bwsuX492uJr1fjuailMxH2e1CP3dU29c2URGhGqP9?=
 =?us-ascii?Q?lzDO/TSRMV2EmlIXAxeA41MJdQ6Rj1IyeXLgekUT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ddca88-b554-4e85-d2c0-08dd6dac8182
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 03:56:23.0624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYKyYMi/pzSvIGCPbVj9wBLFHnmPTIzomOKEHtBrKRDiCMYJLuQuGJPGSNW4eF6M/e9qvCWVkLuTf20/FuoEoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Thursday, March 27, 2025 9:11 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org; andi.shyti@linux.intel.com
> Subject: Re: [PATCH] drm/i915/gvt: char array initialization overflow
>=20
> Hi Arun,
>=20
> This produces a build error in my configuration, could you please cc also=
 intel-
> gfx so that we run also the CI tests?
>=20
> Thanks,
> Andi
>=20
Hi Andi,

Thanks for the review. I think this patch can be discarded as a patch was t=
his fix has already been floated https://lore.kernel.org/r/87r02ma8s3.fsf@i=
ntel.com

Thanks and Regards,
Arun R Murthy
--------------------

> On Tue, Mar 25, 2025 at 09:16:43AM +0530, Arun R Murthy wrote:
> > Initializer string for array of char is too long, since the char array
> > is initialized in place leave the length as open and let compiler
> > choose based on the initialized value.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/opregion.c
> > b/drivers/gpu/drm/i915/gvt/opregion.c
> > index
> >
> 509f9ccae3a9f09a7596904d88a3ac15cf6b1be7..c5ea490bf2e184c4184e16197
> 367
> > 5a38436e078c 100644
> > --- a/drivers/gpu/drm/i915/gvt/opregion.c
> > +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> > @@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgp=
u)
> >  	u8 *buf;
> >  	struct opregion_header *header;
> >  	struct vbt v;
> > -	const char opregion_signature[16] =3D OPREGION_SIGNATURE;
> > +	const char opregion_signature[] =3D OPREGION_SIGNATURE;
> >
> >  	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
> >  	vgpu_opregion(vgpu)->va =3D (void *)__get_free_pages(GFP_KERNEL |
> >
> > ---
> > base-commit: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
> > change-id: 20250325-gvt-4e9f71337d3f
> >
> > Best regards,
> > --
> > Arun R Murthy <arun.r.murthy@intel.com>
