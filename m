Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5AE9AA15B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Oct 2024 13:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2DF10E19E;
	Tue, 22 Oct 2024 11:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K71iNTo6";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6745C10E19E;
 Tue, 22 Oct 2024 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729597804; x=1761133804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1A0zPcyj+fZeKO4r+j4GFx1zCHxTvcfw83/FgSnaQVE=;
 b=K71iNTo6RbEkWOlep3XeihxbaPy6mh1FKhaxNbmG0tm8DT8THqqGQxjd
 4N6/sih34mH7b43qBCtKlRV6eLDrM/8lxUAH8JVO/cgPwUaxhZ+9JdeUT
 m/pXSX7JSaisN33H03wlioBDKkO/YbAcz1aqvMp3XrZDhEXQ+ws0y9kOR
 nXjhf9Kb5KevESLbs875LbbnVoikgEu5cqyRkScnXfBRVquQQ/3/UGabA
 i2FW5WclaXiO3hq5uxg+hf4ttgA88Fp6N/lv8Jm312MQLxYoTFWHH7rHE
 YnS0CY1QOWfu6xQez5bkLSAlDxaIA09nj2nknd0Ql3JjkEWp5RxVDJnZu A==;
X-CSE-ConnectionGUID: OQ4wb2/QR7SDwrmAga/RgA==
X-CSE-MsgGUID: 50VSD26iT2qSjPT2jTuhEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40513067"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40513067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 04:50:04 -0700
X-CSE-ConnectionGUID: dF9my6BFSJ2cyeiGf3nv0g==
X-CSE-MsgGUID: G80db1jUTSOLe307eXSGQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80258737"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 04:50:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 04:50:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 04:50:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 04:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkjIAA1O7IcyDUuzNhfV3Dvizt5HQsVyt6aBAmkmLZvoUoAAf+xH2rdQBQlSQbfqbDZolOQRtaoM5IZ3U0ThapSj0XNlXnYyN1To8Z39KH87FqtlDAI8km3oKanwbVDZLcOKvLLs+bhRTwHGpHDGeDn8EKu94SVb+D2qxoBOFnCi2or/WhS0FDhUIFXsKAV01sVdyfYrxWTE85RObAnE1zS3fWJMOohMwTUrC2zCqwM1QLwXNI3PwW0PPhEP4SvxdaS2WrXQlNNiL57rY8UQnQU25YSoBSrVJ8Y7o3zVIYdzMNVFbaLPzTcNSMt9aW+vrp2lm+RDWUb8qyAejvZ6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s31+Mxmhcc3H5WYYZqGWFnSi/fa41idKje/6I+2wct0=;
 b=mP5IoNfN95Wqu0DE5+eSOYycNZVm6ovpVTQEoFazq5qMuK6zmdCkZluj0cgojEtlWLIEvbZmQxi8wRVi6qJFgIXmr8hjYQ5bkyyE0FYRzr9SgSqY0Uqen4Gr9P9a7uzH1eQyIfYs3oX6iMRtKzrKlq7uO9+dJ61G72tUT2bbK7eos8AR0AqwC8vzI2e2s404yzyfgX0X5vpuvUsD9kk4NHjKDW/cjuixiTiloOy5k80/a9fFNoRbXyudd7ZJmNS/wETI5glFTQZ7EE/Af0Ttgj7uqPa5hi78qEm55kYxqFhfWLRP1POZfvASb84Y3DkqDkdhXs3Wdg5LfeLEvoSouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 11:49:59 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 11:49:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
 duplication
Thread-Topic: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
 duplication
Thread-Index: AQHbE0BCUOLgeF4wMkSWqUCgHFNbrbKSykKg
Date: Tue, 22 Oct 2024 11:49:59 +0000
Message-ID: <SN7PR11MB6750B146EA2054AB40F3F026E34C2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240930135342.3562755-1-jani.nikula@intel.com>
In-Reply-To: <20240930135342.3562755-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ0PR11MB4943:EE_
x-ms-office365-filtering-correlation-id: 0bab0a8c-1701-4061-2c9b-08dcf28fa842
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?agAMeNqMjddtOE4urYg/h59ifYaIRuqRWzNGcs/qfIfiaKTsF7XYfithPjb5?=
 =?us-ascii?Q?sKe/FbZQ2lauLdYCV04rvMDElSUqfcMAj837CNmTqEnNKWlshB7KP0WsxP/0?=
 =?us-ascii?Q?bVyyaQ/7cKBSYdGsg24matLQ8Wp82giK+doSSsDM19HrxV2LDqBpNY21F9Vy?=
 =?us-ascii?Q?ImA/zexttP8w8DS8EmsgypduyqZMVnl5TzcKLmf6oeSTi7KG1AJVBInaL269?=
 =?us-ascii?Q?4lBcQab7qU72dxs58H9vOyxZhedf08ZApqmHSqwcOojyv3KGziyL+kSOXY0a?=
 =?us-ascii?Q?VXd0mr4/mgtgAy8Bo0uFhPKuxpBPKKwgtHYRodKAYuTtlpgUGSo42Cm0V0bO?=
 =?us-ascii?Q?gQg6595iWbLAjXH82BUZ4DA7ttWWLcvqA60SacK54qoFvYDpQlY0GKvZG2Mq?=
 =?us-ascii?Q?eRRZl2FTvTiMs8QA7qoHqTwbWBlDs3RaMC1BF1NGsGKMkzzOLh7eCJY5VUbf?=
 =?us-ascii?Q?8j3Vva6CIoOUn4PkhDa5u426sosfd5tddVVceH3HeTiqf/uMiBV8n5s5AbPw?=
 =?us-ascii?Q?0k6QLBsVRYylEDJK6Se5SMXKSkTDRPjhHDgknxPnRunYi2t5AjYIDsgGFYvu?=
 =?us-ascii?Q?zlOlf12cZPPcOpXpHsHu3PWBwek8+R3KRObR7iZ+GOfv42LesBswcO3Xr9Mg?=
 =?us-ascii?Q?BxJO04gselslSr6ScZvIyRSSi/MxVz5FFiGM5RXDPqGRiI3eoF6w9G3gE1Vp?=
 =?us-ascii?Q?Jhgv7Q6cTW/smSnxIpEqM5ye+hNRemLHYOpH2UJFo/f/A7k0mPO6cdTmL/DV?=
 =?us-ascii?Q?9+XtwTrBZ8evoLuskor550jBHU5gW9BfQZc5GfKYRonqIHsAPvnMbwoF/+Fg?=
 =?us-ascii?Q?mOzIKzY3CR7LdrQyrhhMKCcfE7iGDNCzQRbZUj2OTsg2LRHpjdjB4aT3nL0z?=
 =?us-ascii?Q?Es9PibyOQAPEuzbk3+keqx6jPxMRcD1NyDgQ5ybQF5u/ocTNht60c3/FcgUZ?=
 =?us-ascii?Q?htHoIWfCm34Z89nat3ynzGDk9sdJee6y7PQNKJxGl+J6X4bKv+A91Pa5KlEV?=
 =?us-ascii?Q?aUHpELxqr12r3zwcmmc91HcPudKPFrX9Dbuve1O7O/pJHghHGjeY9MODnG/c?=
 =?us-ascii?Q?qgXQGvdi/y4qk4aV2GpqYxUnEaS3yNiHroJBlpoXNojxLj3BNTR9AxXLH0pM?=
 =?us-ascii?Q?rKOJEj8uEDgPkS2Qqn97ZcoG0SHUWGDvyUaI08V6Kf4v0m5v0cQ3PEMjYxb4?=
 =?us-ascii?Q?IQR1+uh8bp9wXSU4Y3UBU2SDS773ouhSCUMrrbifbGqgK5P+6ASEjrTQLHkw?=
 =?us-ascii?Q?SCGkifXcnxKEpB94HhlizyD3sNUTIWSV7pZJRFxCmBTEalhF1zjIXxkZIk+F?=
 =?us-ascii?Q?MaFYEPUibVljUM3MouWIFVh1SxD2DODPTpS36hwh5tU8oy9EheY63VYGuw1Z?=
 =?us-ascii?Q?zY7JbIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UFLnQSVZebJCUWZ2DwAJxPdIOg2RoAqiRb3f97PJkdRDq8Tf3ieFgoLVdgcc?=
 =?us-ascii?Q?AiSb+OkR/H66OvzYOcrYrjqCyiglByGxp0QgwZuknGiBY7DZBoMtPbMjM7c3?=
 =?us-ascii?Q?CcSOP93bMibJj9/rZfkrzR8F5YrOofWl6vSZqdG+2s1YevSy7o1YIISSRV2a?=
 =?us-ascii?Q?cBBcJKl2inSXE9QFQDeHaNIb/mB1g+Ai42kyEi0Hkloe0Q23oE5WKcWyrgZH?=
 =?us-ascii?Q?HW4D7C70zrB/Uyk2Qb+A/Ce70O56h9EeT6lmhAFbFOX9om2kCGjPfoKl2JDN?=
 =?us-ascii?Q?h4cTFMZjB0SUaGkj35eZJOVgIfvodkTG+4atbyGSMSCGBeTsuq6qD7YxGNii?=
 =?us-ascii?Q?K6+aMsbRqoxmdC6thbXZk8zBn0nNvmsKQywsuA73HIrSDTIDEnpJz8absYlS?=
 =?us-ascii?Q?xWbDqNUY4V6zNo67AmvkLPOFtACfjTRHGEOaOitkq7tvCf/5WESr/A+55t1b?=
 =?us-ascii?Q?SGowRoiGFYwXM7kMW5UL3lDi2XAze1f01bX/xXhOtw114WVHnoWyVeN61TJJ?=
 =?us-ascii?Q?r245k4u1lAkIYKvwQe/61lEXUuv+jWStnQFVPwPzJ66vvZYCUL4yR+Ik12RH?=
 =?us-ascii?Q?E9u1fZIomShV5I8Eom3+uer3/WSViQuP0cFCFpomysL45IheqvikCDK2VQcG?=
 =?us-ascii?Q?Gbi0kdegfAhFIEOxmRZDiRgzOWbKUzLrxyX7ExW+aBNXGkdIR4yJ24cVTriC?=
 =?us-ascii?Q?SuT0NljR/EJltKWCNtzD14po8A8KhWU9mFCPzflRDr/uucyf4NWsWCL2NFWA?=
 =?us-ascii?Q?O5Sil/CjKz4qHlKh0ipFVtdc1ezqteHOzolU+S7cSA8TKbfc8cuUvj1jL7Jh?=
 =?us-ascii?Q?jsBN7jz3/l26PttMTHrqsVuHzys4Ou66YK386Y+2odaFpG2h40xWXvYwgfYr?=
 =?us-ascii?Q?DhxM+gmKqMs/hofH1T/k8aDrYVn4rZSdaFH1wWdH+ju/JcVX0KWZ8YB5FGc/?=
 =?us-ascii?Q?Fi8YuhlwNHvi9iOGlzaWH/YmufVX/nbZxd1j5WmCCC8TCgnMpvoJ2q3vlBIj?=
 =?us-ascii?Q?yUMgh32Ox7nALkjQZ71qK5p0zABTF0LMHDDBditxaNMemRgMsjY6rnfEK5je?=
 =?us-ascii?Q?fgOCoC+6VWGjb9PFZQHSCXxvNnIUY7CbRF70NODUgA9zz5dqC3jPXtwgFZkj?=
 =?us-ascii?Q?Yx/HeLiPo/B6V9GGg/p1fDkyJNmJuO9QGtYYq09XZNr1At3ox4BzzFE/qaH1?=
 =?us-ascii?Q?jy2pSpE7hpWEMXYJGGvknl0cOxnqzfKZBxDBSAd+xbNbd15MONE/vZw90seE?=
 =?us-ascii?Q?MOYJAlPhFcvZQCiY5Cv/40wphAtj25+5ysJ6fMHRLcKRVczMzkW7sNFpZK2K?=
 =?us-ascii?Q?LX7Kys/0k7LVuVM9qS8AYEw4q3y8+N/pD41zSyG7yQ4j78wEiVKWLEOu1AfA?=
 =?us-ascii?Q?Ec6kyrVNMcDjwI3LDcREn6b6w5G8xenW6xpFtscxHinktOfRjmgvQ4yqc5zp?=
 =?us-ascii?Q?/YcVwonWK/tRuMazNJszs5Zi7shaL46jmcvBDogGQTUlEIEx4DkM/1xC28p9?=
 =?us-ascii?Q?7iGTeXGO7OPgLbVRMMmPIiy1dSVbJOlOaJ1UNyNQ5ZbVv8cvttIlx/UpJ64+?=
 =?us-ascii?Q?QY4TiDyUfO6Er7Qa47WDeFtByYaa+qz4cr3vYx1y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bab0a8c-1701-4061-2c9b-08dcf28fa842
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 11:49:59.6567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d/sr04rx9ogIqN5fvXe7LmkA/vjWq8lKikGHkR4dQ5nrWJY7LrBKtcZhQ2lRiA48EC19MUh4nipzv5QLBUl5fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Monday, September 30, 2024 7:24 PM
> To: intel-gfx@lists.freedesktop.org; intel-gvt-dev@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
> duplication
>=20
> Use the existing macros in drm_dp.h for DPCD and DP AUX instead of
> duplicating. Remove unused macros, as well as the duplicate definition of
> DPCD_SIZE.
>=20
> AUX_NATIVE_REPLY_NAK is left unchanged, as it does not match
> DP_AUX_NATIVE_REPLY_NACK, and I'm not sure what the right thing to do is
> here.

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c  |  4 ++-
> drivers/gpu/drm/i915/gvt/display.h  | 42 ----------------------------
>  drivers/gpu/drm/i915/gvt/edid.c     | 12 ++++----
>  drivers/gpu/drm/i915/gvt/edid.h     |  8 ------
>  drivers/gpu/drm/i915/gvt/handlers.c | 43 +++++++++++++++++------------
>  5 files changed, 36 insertions(+), 73 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c
> b/drivers/gpu/drm/i915/gvt/display.c
> index c66d6d3177c8..17f74cb244bb 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -32,6 +32,8 @@
>   *
>   */
>=20
> +#include <drm/display/drm_dp.h>
> +
>  #include "i915_drv.h"
>  #include "i915_reg.h"
>  #include "gvt.h"
> @@ -568,7 +570,7 @@ static int setup_virtual_dp_monitor(struct intel_vgpu
> *vgpu, int port_num,
>=20
>  	memcpy(port->dpcd->data, dpcd_fix_data, DPCD_HEADER_SIZE);
>  	port->dpcd->data_valid =3D true;
> -	port->dpcd->data[DPCD_SINK_COUNT] =3D 0x1;
> +	port->dpcd->data[DP_SINK_COUNT] =3D 0x1;
>  	port->type =3D type;
>  	port->id =3D resolution;
>  	port->vrefresh_k =3D GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
> diff --git a/drivers/gpu/drm/i915/gvt/display.h
> b/drivers/gpu/drm/i915/gvt/display.h
> index f5616f99ef2f..8090bc53c7e1 100644
> --- a/drivers/gpu/drm/i915/gvt/display.h
> +++ b/drivers/gpu/drm/i915/gvt/display.h
> @@ -59,52 +59,10 @@ struct intel_vgpu;
>=20
>  #define INTEL_GVT_MAX_UEVENT_VARS	3
>=20
> -/* DPCD start */
> -#define DPCD_SIZE	0x700
> -
> -/* DPCD */
> -#define DP_SET_POWER            0x600
> -#define DP_SET_POWER_D0         0x1
> -#define AUX_NATIVE_WRITE        0x8
> -#define AUX_NATIVE_READ         0x9
> -
> -#define AUX_NATIVE_REPLY_MASK   (0x3 << 4)
> -#define AUX_NATIVE_REPLY_ACK    (0x0 << 4)
>  #define AUX_NATIVE_REPLY_NAK    (0x1 << 4)
> -#define AUX_NATIVE_REPLY_DEFER  (0x2 << 4)
>=20
>  #define AUX_BURST_SIZE          20
>=20
> -/* DPCD addresses */
> -#define DPCD_REV			0x000
> -#define DPCD_MAX_LINK_RATE		0x001
> -#define DPCD_MAX_LANE_COUNT		0x002
> -
> -#define DPCD_TRAINING_PATTERN_SET	0x102
> -#define	DPCD_SINK_COUNT			0x200
> -#define DPCD_LANE0_1_STATUS		0x202
> -#define DPCD_LANE2_3_STATUS		0x203
> -#define DPCD_LANE_ALIGN_STATUS_UPDATED	0x204
> -#define DPCD_SINK_STATUS		0x205
> -
> -/* link training */
> -#define DPCD_TRAINING_PATTERN_SET_MASK	0x03
> -#define DPCD_LINK_TRAINING_DISABLED	0x00
> -#define DPCD_TRAINING_PATTERN_1		0x01
> -#define DPCD_TRAINING_PATTERN_2		0x02
> -
> -#define DPCD_CP_READY_MASK		(1 << 6)
> -
> -/* lane status */
> -#define DPCD_LANES_CR_DONE		0x11
> -#define DPCD_LANES_EQ_DONE		0x22
> -#define DPCD_SYMBOL_LOCKED		0x44
> -
> -#define DPCD_INTERLANE_ALIGN_DONE	0x01
> -
> -#define DPCD_SINK_IN_SYNC		0x03
> -/* DPCD end */
> -
>  #define SBI_RESPONSE_MASK               0x3
>  #define SBI_RESPONSE_SHIFT              0x1
>  #define SBI_STAT_MASK                   0x1
> diff --git a/drivers/gpu/drm/i915/gvt/edid.c
> b/drivers/gpu/drm/i915/gvt/edid.c index c022dc736045..0a357ca42db1
> 100644
> --- a/drivers/gpu/drm/i915/gvt/edid.c
> +++ b/drivers/gpu/drm/i915/gvt/edid.c
> @@ -32,6 +32,8 @@
>   *
>   */
>=20
> +#include <drm/display/drm_dp.h>
> +
>  #include "display/intel_dp_aux_regs.h"
>  #include "display/intel_gmbus_regs.h"
>  #include "gvt.h"
> @@ -504,13 +506,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> intel_vgpu *vgpu,
>  	}
>=20
>  	/* Always set the wanted value for vms. */
> -	ret_msg_size =3D (((op & 0x1) =3D=3D GVT_AUX_I2C_READ) ? 2 : 1);
> +	ret_msg_size =3D (((op & 0x1) =3D=3D DP_AUX_I2C_READ) ? 2 : 1);
>  	vgpu_vreg(vgpu, offset) =3D
>  		DP_AUX_CH_CTL_DONE |
>  		DP_AUX_CH_CTL_MESSAGE_SIZE(ret_msg_size);
>=20
>  	if (msg_length =3D=3D 3) {
> -		if (!(op & GVT_AUX_I2C_MOT)) {
> +		if (!(op & DP_AUX_I2C_MOT)) {
>  			/* stop */
>  			intel_vgpu_init_i2c_edid(vgpu);
>  		} else {
> @@ -530,7 +532,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> intel_vgpu *vgpu,
>  					i2c_edid->edid_available =3D true;
>  			}
>  		}
> -	} else if ((op & 0x1) =3D=3D GVT_AUX_I2C_WRITE) {
> +	} else if ((op & 0x1) =3D=3D DP_AUX_I2C_WRITE) {
>  		/* TODO
>  		 * We only support EDID reading from I2C_over_AUX. And
>  		 * we do not expect the index mode to be used. Right now
> @@ -538,7 +540,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> intel_vgpu *vgpu,
>  		 * support the gfx driver to do EDID access.
>  		 */
>  	} else {
> -		if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D
> GVT_AUX_I2C_READ))
> +		if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D
> DP_AUX_I2C_READ))
>  			return;
>  		if (drm_WARN_ON(&i915->drm, msg_length !=3D 4))
>  			return;
> @@ -553,7 +555,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> intel_vgpu *vgpu,
>  	 * ACK of I2C_WRITE
>  	 * returned byte if it is READ
>  	 */
> -	aux_data_for_write |=3D GVT_AUX_I2C_REPLY_ACK << 24;
> +	aux_data_for_write |=3D DP_AUX_I2C_REPLY_ACK << 24;
>  	vgpu_vreg(vgpu, offset + 4) =3D aux_data_for_write;  }
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/edid.h
> b/drivers/gpu/drm/i915/gvt/edid.h index c3b5a55aecb3..13fd06590929
> 100644
> --- a/drivers/gpu/drm/i915/gvt/edid.h
> +++ b/drivers/gpu/drm/i915/gvt/edid.h
> @@ -42,14 +42,6 @@ struct intel_vgpu;
>  #define EDID_SIZE		128
>  #define EDID_ADDR		0x50 /* Linux hvm EDID addr */
>=20
> -#define GVT_AUX_NATIVE_WRITE			0x8
> -#define GVT_AUX_NATIVE_READ			0x9
> -#define GVT_AUX_I2C_WRITE			0x0
> -#define GVT_AUX_I2C_READ			0x1
> -#define GVT_AUX_I2C_STATUS			0x2
> -#define GVT_AUX_I2C_MOT				0x4
> -#define GVT_AUX_I2C_REPLY_ACK			0x0
> -
>  struct intel_vgpu_edid_data {
>  	bool data_valid;
>  	unsigned char edid_block[EDID_SIZE];
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> b/drivers/gpu/drm/i915/gvt/handlers.c
> index 0f09344d3c20..9494d812c00a 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -36,6 +36,8 @@
>=20
>   */
>=20
> +#include <drm/display/drm_dp.h>
> +
>  #include "i915_drv.h"
>  #include "i915_reg.h"
>  #include "gvt.h"
> @@ -1129,29 +1131,36 @@ static int dp_aux_ch_ctl_trans_done(struct
> intel_vgpu *vgpu, u32 value,  static void dp_aux_ch_ctl_link_training(str=
uct
> intel_vgpu_dpcd_data *dpcd,
>  		u8 t)
>  {
> -	if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
> DPCD_TRAINING_PATTERN_1) {
> +	if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D DP_TRAINING_PATTERN_1)
> {
>  		/* training pattern 1 for CR */
>  		/* set LANE0_CR_DONE, LANE1_CR_DONE */
> -		dpcd->data[DPCD_LANE0_1_STATUS] |=3D
> DPCD_LANES_CR_DONE;
> +		dpcd->data[DP_LANE0_1_STATUS] |=3D DP_LANE_CR_DONE |
> +			DP_LANE_CR_DONE << 4;
>  		/* set LANE2_CR_DONE, LANE3_CR_DONE */
> -		dpcd->data[DPCD_LANE2_3_STATUS] |=3D
> DPCD_LANES_CR_DONE;
> -	} else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
> -			DPCD_TRAINING_PATTERN_2) {
> +		dpcd->data[DP_LANE2_3_STATUS] |=3D DP_LANE_CR_DONE |
> +			DP_LANE_CR_DONE << 4;
> +	} else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
> +			DP_TRAINING_PATTERN_2) {
>  		/* training pattern 2 for EQ */
>  		/* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for
> Lane0_1 */
> -		dpcd->data[DPCD_LANE0_1_STATUS] |=3D
> DPCD_LANES_EQ_DONE;
> -		dpcd->data[DPCD_LANE0_1_STATUS] |=3D
> DPCD_SYMBOL_LOCKED;
> +		dpcd->data[DP_LANE0_1_STATUS] |=3D
> DP_LANE_CHANNEL_EQ_DONE |
> +			DP_LANE_CHANNEL_EQ_DONE << 4;
> +		dpcd->data[DP_LANE0_1_STATUS] |=3D
> DP_LANE_SYMBOL_LOCKED |
> +			DP_LANE_SYMBOL_LOCKED << 4;
>  		/* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for
> Lane2_3 */
> -		dpcd->data[DPCD_LANE2_3_STATUS] |=3D
> DPCD_LANES_EQ_DONE;
> -		dpcd->data[DPCD_LANE2_3_STATUS] |=3D
> DPCD_SYMBOL_LOCKED;
> +		dpcd->data[DP_LANE2_3_STATUS] |=3D
> DP_LANE_CHANNEL_EQ_DONE |
> +			DP_LANE_CHANNEL_EQ_DONE << 4;
> +		dpcd->data[DP_LANE2_3_STATUS] |=3D
> DP_LANE_SYMBOL_LOCKED |
> +			DP_LANE_SYMBOL_LOCKED << 4;
>  		/* set INTERLANE_ALIGN_DONE */
> -		dpcd->data[DPCD_LANE_ALIGN_STATUS_UPDATED] |=3D
> -			DPCD_INTERLANE_ALIGN_DONE;
> -	} else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
> -			DPCD_LINK_TRAINING_DISABLED) {
> +		dpcd->data[DP_LANE_ALIGN_STATUS_UPDATED] |=3D
> +			DP_INTERLANE_ALIGN_DONE;
> +	} else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
> +			DP_TRAINING_PATTERN_DISABLE) {
>  		/* finish link training */
>  		/* set sink status as synchronized */
> -		dpcd->data[DPCD_SINK_STATUS] =3D DPCD_SINK_IN_SYNC;
> +		dpcd->data[DP_SINK_STATUS] =3D DP_RECEIVE_PORT_0_STATUS
> |
> +			DP_RECEIVE_PORT_1_STATUS;
>  	}
>  }
>=20
> @@ -1206,7 +1215,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
> intel_vgpu *vgpu,
>  	len =3D msg & 0xff;
>  	op =3D ctrl >> 4;
>=20
> -	if (op =3D=3D GVT_AUX_NATIVE_WRITE) {
> +	if (op =3D=3D DP_AUX_NATIVE_WRITE) {
>  		int t;
>  		u8 buf[16];
>=20
> @@ -1252,7 +1261,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
> intel_vgpu *vgpu,
>=20
>  				dpcd->data[p] =3D buf[t];
>  				/* check for link training */
> -				if (p =3D=3D DPCD_TRAINING_PATTERN_SET)
> +				if (p =3D=3D DP_TRAINING_PATTERN_SET)
>  					dp_aux_ch_ctl_link_training(dpcd,
>  							buf[t]);
>  			}
> @@ -1265,7 +1274,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
> intel_vgpu *vgpu,
>  		return 0;
>  	}
>=20
> -	if (op =3D=3D GVT_AUX_NATIVE_READ) {
> +	if (op =3D=3D DP_AUX_NATIVE_READ) {
>  		int idx, i, ret =3D 0;
>=20
>  		if ((addr + len + 1) >=3D DPCD_SIZE) {
> --
> 2.39.5

