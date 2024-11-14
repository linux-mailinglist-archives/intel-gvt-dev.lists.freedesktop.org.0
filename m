Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29F9C8F77
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 14 Nov 2024 17:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAF010E81E;
	Thu, 14 Nov 2024 16:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqHHw8kZ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C6410E81F;
 Thu, 14 Nov 2024 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731600913; x=1763136913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WKbAer0E30H6v/cHqZhtcCuM41g2zqvhfNQQTJI0doY=;
 b=GqHHw8kZY2GaeUvTTe7Gxzfz9zOx7GBa3YxbRFXjVirnF2V/VqbBhHiE
 VYF8tbFUT+JvmlkW9N3zNaOt+DF840gex+EHs4ODCXHB+vLAjgju2fVEe
 1Qt/gMxU6if80NXaL7rOi1tkDJGcMCOUdNUjK45mj3/ASLgZAA4yBPhfk
 TSBSBz4GbAWQwKLSJ0ynl3ptD9ThrVk6/gCUi/n5jNhXeE8qFBMWqVi5z
 VaigOeX/6mYmCqZWD3nOrojbnxzp6moKA6tYjOucRU5ngkezlyWHtY9RG
 7NSnaNcsxYFwqmUZ6XyUmlZV0vwRj7tY/9FomsCNBYdtaay6xu9yIWEZg Q==;
X-CSE-ConnectionGUID: C3LmcKzoSxu9PuYBFNxGuw==
X-CSE-MsgGUID: j9ufMzVFSvma1X0y3NyIzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31803096"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31803096"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:15:03 -0800
X-CSE-ConnectionGUID: hS/2w+CeThSKy+qV7WauIw==
X-CSE-MsgGUID: IN0OwhvYROaPvmz7y6SyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="92698581"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:15:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:14:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:14:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:14:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIwLWaowcNqTrEMfuuBRsdk2MEYJ0kOZ4ccqm8IUr/Z1873hzm9+GjqukQdRX+SQ7VF/JKA4lGxHgJiM1rcjqAD+eea5iGwaLWRZu/uuY+9MbHU7PJ+MubPRIc9XRKN5vSF6UrL4Pgyyr+7EJPM59yF5hnqd+zS8arGRHsZtfi4IvZgfJL3eCQ1uhWyUoaGJ/eyepMqo/0F2C9vigXAp4PjBHMx405PAuKvjnGT4g5dNrpE/tAY7UGrzAW2kIUPqDwG09aWa/Ea1jus9VDjfei6vBlvdKjcM12m2p8US19ybQ8u1ittomEtrZ2wkCl1J8wFLhL8x0dqr8V/3clVc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMjkTgHgztgWz7nR76UioHTWc+UbPanXEfS+yRuXqeE=;
 b=B4mN2Z2sFH+wlNEr94KWmm/EssPME54FCEMVjrYBCI0GIV2/+DfZE0OCYqDl0i4O6tQofkJgBiD/RKZ02iOR3duW/hC3Dr2MtqTu6IHnEYoFYvqzKD2lJDbf7fHVyQo6mSIoyVRWAzRPtQbEaBZ0OhTcCHAx2BQoSHLWvh82KINgndfyr85X5j71k01Be5F2JPcv/aLxPGiMpCoCoqTjNJXE5bNZOUk5eBbVI+MiYFMGmGgJ5I2qnHk9OKVStjO5T8r55iDwO0H7clEz6aPl4FNOfYKjKU8hNi8SBECTwdyPp6Y0oWx4patOo9k1o1OOkBSbs8BO7e556nFxeHHhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 16:14:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 16:14:25 +0000
Date: Thu, 14 Nov 2024 11:14:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>, 
 Zhi Wang <zhi.wang.linux@gmail.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>,
 "James Wu" <james.y.wu@intel.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: switch my mail address for GVT driver
Message-ID: <ZzYh3TnP4NAkVHiv@intel.com>
References: <20241113063700.4460-1-zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241113063700.4460-1-zhenyuw@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c40358-94a2-48fb-c047-08dd04c7689b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e0GSr3yVP+3nS8soSG/h7dQ525SFDTj+u7Ini/lJigyl8+GBddhFZBDmZ56y?=
 =?us-ascii?Q?hyGivDBRBXDf5XuXv6awyGz4MV9I5YR1+VxHcSmyttDZU5+X5Mc7yd05B5vk?=
 =?us-ascii?Q?kx8lDK0zmt8q0bFrPkNYPjI4SMMaymtTsqwt/9m9S6hEpvGT8fsMJp3GPzBb?=
 =?us-ascii?Q?tOOQunjZTv2TXMz78rz4rwjL/UDkxSlcXnYT4yZFmiyQSHN5zAWHi6JYDrXS?=
 =?us-ascii?Q?5A4qPsfEtaQ1mq4UsORstSJNK92tfHYenErIBE4jHK6XKZrwpfDQbd/xEHBr?=
 =?us-ascii?Q?hO4NPIUIXjwRwmbt4PoqgyeZcKI2TLyMJ00R1f65o4n4V6SxcNWi9+mO/F9l?=
 =?us-ascii?Q?k20uVrp6CpZHHqbum6R9J20k6fHOtHtNcF4c2p0H+TmOr4kFpxaKQV5R17QN?=
 =?us-ascii?Q?ZPXYYcSelMAHWESadUuFDkcNnfdJuNfpW1sTlqbwBBBhbTBfhFLnlzE0NW/A?=
 =?us-ascii?Q?COJcpoB9S9pcgoUotl1O+2VYh1vPobPONAxKJO9dvR/LXN9s81KZ1RBCi389?=
 =?us-ascii?Q?f5kxMb1yqN9RIx7er7UP1YnIZjXWScgVfgJ1qTXpdXbiSovILsChotPV3wTb?=
 =?us-ascii?Q?v1D5nhEz2Q/fjNb11S03nT92eL8lDETWoXCI4oO/CsVhzy1EO57ZZE/yiWas?=
 =?us-ascii?Q?QDJqiKY37UI5s+YksExY1xPushmyNji6zGrfKrzWUr09diLFl2JRHgAaIiQ9?=
 =?us-ascii?Q?/mXm6u657uE7ytY3L63YPJkesvIKkUrCS5UxpcVWq8tNeVgV/8n216wENoyj?=
 =?us-ascii?Q?y0mk6PZZcF+EFXhuII3b9g7r8jhbBEj9UFPkDtZenAaZ4X3wmkJaO29lfeGp?=
 =?us-ascii?Q?JdBbvC0V/v+U861eUUHwvOZ89akbUjauEZYmZB940MiqHELQOJAjy81C8ibV?=
 =?us-ascii?Q?hEIw5S2ZMoi3YMQPAhEGq9Os4tQKDAJaKOeF0LSgyo9L7XyVvlQa4BN2sc5V?=
 =?us-ascii?Q?OSXayS05KVfKEHh3dzm89cDbL37XyWjNOUNx4gjHq00UPWQcxznpoTR2I75G?=
 =?us-ascii?Q?2ksKH3ZHfPIvSElb36qUDJfBNmuH0YWq4jBJozmB01DNgcMGeEqZSSJ6DoI2?=
 =?us-ascii?Q?yIVucY7aH/GyxNja9DBXE7YnGBOcKQvxrWMMiDHxBoQKPQyksu/WZfCTI7y2?=
 =?us-ascii?Q?ZC9xE6Jn0NCH2qPP8NBHJ2cZFaKJEmFAFIZbdrGBtKCVp4Zm7IX+HTCxS59Z?=
 =?us-ascii?Q?1kMyc4Rlv6TmCbS3nNHfH+cNtELbDq/JDKBf+Q0EHH1KY2eYYdoLP9k8cCdw?=
 =?us-ascii?Q?ph0aZeWCTeaqozLpzjA0MHiwcH5Eju7kgE7290AhXZ8nLA25dGM6CdXBurIl?=
 =?us-ascii?Q?RP97wkfirFxmeIfi+R4zLTyy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFazbDioziOgks1oS9mFf3qmfoE2vAJAU7PSwowO1nmIgKNOFVjvaqSpcElI?=
 =?us-ascii?Q?3hI5Lho2kDdETr9MYvaweeMI8zfeJYW7tyFXd33tmEuIh5fmSGSihzu6vzJ5?=
 =?us-ascii?Q?epCKq/dXrNH8DpDIMzXtxke9IgGRGgVyF6HHWBwqbGd2OCbnRTdkuTjdnU5K?=
 =?us-ascii?Q?WGtcAfCty9GYAdKLOuNp5XdvvdZnub7DJhLhY1QtHXFLnReSfI37G80w6LVB?=
 =?us-ascii?Q?8kUHtS/VrvYyg+kr38ZNKRGxHkKQ4d+i/GPGgLwyYCH3tyrpMH5GoJXzGBoi?=
 =?us-ascii?Q?yDDPLz7ynqtXpeVhoZVelBVbwsl/xSWi7BnWKi8oUiVgpSzH6w/rUjoiAXIo?=
 =?us-ascii?Q?RpomOl/C28iIV8kzqoPiDd/7/GVS02H57ku25Csq9Awy57GPfQCGEB6ajT79?=
 =?us-ascii?Q?O6YOA8dy626iQG033RSWKuZwJbsBfENYcSuZBeeMddeYvCh8mAklEW8MD5B+?=
 =?us-ascii?Q?+bBKxITYz20gONtLeZMP1NkSNQL6Lcr5APRImjIzP3+ZoO97YeS6b6JRlJIG?=
 =?us-ascii?Q?u7/QuJCgQIUReJSKo9DZnUIwBV0isTzRxqs0RuWgPDOyaKodwUWhWWvF0m2d?=
 =?us-ascii?Q?JVa7DDPdjro93ziFQVEzj0mqVEO0cFpp0Z7BTN44har8Mga/EP0//v0Mx+ru?=
 =?us-ascii?Q?Fy8UtyyKif9nPzbZ7bFVNqam0YCErem4hXg2EZYmCs6vKMxm8+qc5SzCzoRS?=
 =?us-ascii?Q?te+odHtrgfeeelBw8/FepWjj6JZ7lfWL8hTbOx6flbCoyfP91+bOE7W5X38T?=
 =?us-ascii?Q?D0z4v20yQGXZGm2ffsRoz6l8GDJg+V9NXX9e7LKa7aRGYRsAEq9MYkZqRwvZ?=
 =?us-ascii?Q?WDVWt+KtzR7yAZ+U3Cg3msCRh16rz9mVUJAF4bHHsOIrkoNuRSsh4PTHTLwP?=
 =?us-ascii?Q?KHIlUPfFN+KyrG28bOCI51ihs8a59XRcvxjnHMThRmLp7Q49l5jbQ0MC7HgY?=
 =?us-ascii?Q?5WyxY9P7rhlDBlXvrS1BvTh3unxI3qTugHOtEJ8bgF6fnRCQKUG/W92gElUm?=
 =?us-ascii?Q?KspLGOWlrjN08CjZ9bxKsuTOS3kMCjLPbAJS/Fnx90oWBmB1kmgiZywBxDeG?=
 =?us-ascii?Q?0G2Yx8TjSC7D+RaRayjkRb3oc3dCEQZ8136YqTjkaxldR1U0aE1qkTxwZmIO?=
 =?us-ascii?Q?HLZescd897w99AenMCKTK4vHMnu+XcO0Kl5CZtWUW9L3Gh6HBkLVgMzkTc4I?=
 =?us-ascii?Q?UWliik2qmStNUWlHEQO+bGbGb5BAqjdEwJporeL35eYebjvhsB1Rj0qXnG0y?=
 =?us-ascii?Q?gT5Aj/uc7EbBDf4iA/y6xhl6UFx3T4AYA6AxpXDVW5OHQfq/m09gi7lZaBsm?=
 =?us-ascii?Q?7DNeSUHI+qo/CvjUgVm8qYCv4QYmNXc7pH62Mh55UmZ5z6B5BxuY65AD/lbp?=
 =?us-ascii?Q?ryOeXi/AxKyYMbHOq05Ax8krFqbcu+vpjgikCOSjbZ7Xh5BsCJ08aohK8Gi/?=
 =?us-ascii?Q?wPP7tnV3NUOIu22nXT8YlDW3p1WdfhyfQNfGBmEPW9fdKUiTTzIXxvRahHsA?=
 =?us-ascii?Q?3dAHWnyJRQMJ1wN4rP7kLgc5s8D0CtgLEMzzlEgk+09higTybPPzYRYRlPUC?=
 =?us-ascii?Q?8LljXJVHjrJXuAIhm3J+c1Qyr8yx7IMNF24H0PNvGMJ3d7fd6R9/MVSYWgR2?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c40358-94a2-48fb-c047-08dd04c7689b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:14:25.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY76Vn4bdo9PpLBisscvQ+k7OLmP5eipk/TYCuqjCfZ3Yp/mJbJjahvXc3VsNHJZaLCJQnmBsJEVV0uZUtd9Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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

On Wed, Nov 13, 2024 at 02:37:00PM +0800, Zhenyu Wang wrote:
> I won't be able to use intel account, so this switchs address to my
> gmail account.
> 
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: Zhiyuan Lv <zhiyuan.lv@intel.com>
> Cc: James Wu <james.y.wu@intel.com>
> Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21fdaa19229a..5170ab32654c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11423,7 +11423,7 @@ F:	drivers/gpio/gpio-tangier.c
>  F:	drivers/gpio/gpio-tangier.h
>  
>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> -M:	Zhenyu Wang <zhenyuw@linux.intel.com>
> +M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
>  M:	Zhi Wang <zhi.wang.linux@gmail.com>
>  L:	intel-gvt-dev@lists.freedesktop.org
>  L:	intel-gfx@lists.freedesktop.org
> -- 
> 2.45.2
> 
