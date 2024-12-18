Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A99F68A4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2024 15:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4434910EBA5;
	Wed, 18 Dec 2024 14:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPJM7niC";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A7C10EBA5;
 Wed, 18 Dec 2024 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734532634; x=1766068634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Urtx0sVIbAY2st/DByvDDSJsO/iPJ77I+ZXgnwDIUaY=;
 b=YPJM7niCwuhn7kxa2OG6ff/2ntp8ZiNhvpvfFKcJtIDGV5lT5w7OXpyE
 +q1VtGgK7KlW5w/2C9y1/LYdWMVmz4ZawjbmXj8LR0PzK/TiCUTkOVY22
 1yaWaecLc3qppLBR7EB5DiljRU6aY5mhBK2ne7ENFyf6qrra/ehTC9B5S
 uW2MswFMmthXvnTO/MiPHGy+DRrK2bfFRl/yYF4Tsh8o1T9kYtRBAsN4e
 pz9QpbNjypsEygfLcJNHPsnhzd4GzcaUrRzQJ3gwAhIA/Sjll+SNTt9Yg
 9ZUxEiCgbiwpHtYUE8CNEZSeGa6iroFb5mczpmVRwZCW9748otcgbMeqW w==;
X-CSE-ConnectionGUID: tWO1UEAWQjCsv0dDi+klOw==
X-CSE-MsgGUID: mfG+rWU4QO+qLpm0mKbDBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46428356"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46428356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:37:13 -0800
X-CSE-ConnectionGUID: n8C+7SS7TQuegOMlyNptDg==
X-CSE-MsgGUID: 4fRBR/nRSiGwDH0BkOhRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121138628"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 06:37:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 06:37:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 06:37:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 06:37:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c20BTLrcTqH81RO7+lueOQm3x1+NvKtWzfsN604+U6uve2TOen2OFaOrKgpBHQhdD6d5iUOmfwgCUc8dqJgkeEsjdmN5n39V8BqWaI7qB8ffoHJDvpoaMSlrSmV3ynJKxIqzf29Sk75Lkko8Vq0GrFgn9KUMANczBvwqhc/PXUoIOhxpEs9/x5Q5GhW+oyXz16yEZWgK7XC7+FDlOXTdAEOIA9T50jifZkESruPs0qV97qzZzJYsl47G/sSG1IaqfBHpYEvJ6ZaY2fkjdywZmNbNbjyGGtxtLBNuSITvPIFHXqPRGr/kBFT8SNpjLy7Ad3Zb3UwjRLSXZnWedVS8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8JRmngg1bpg7NgLUP4kc231t1EoStBSvJeHQY8VOPM=;
 b=sOswOeP2K6fEDFG5MM6/YQKDZyvmvD/SdJr9G8XA0+8HEEeNB3LtGEIE9RVkzAcpQIqvnAuccbOawW6iHt0Y7n54ayDxEVxo0mKQ2BWFS2JXMENUxBunyF3AZ3F+7ZGOTZTYwuGPP8lYnu/bwp2juoaWbesirQH/+6fiGZg7vEjf34voATXZSBVkV+HjrNewZgvKt6lsDDNoO87HSY1KjigayXwhW+4QuI543zugYGV0a2Hj3qctYTPHPzJXW7334352wf3z5ByLCsolCysSugGqBFyGIwzYGYj6Pbs20wMvoqCD8dvrpPCRhbHxr/dKUsRgU3jaXOfrFk4dUfbNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Wed, 18 Dec
 2024 14:37:09 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 14:37:09 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata
Thread-Topic: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata
Thread-Index: AQHbUVkv/k+vuiOkK0KwbWZIWCopZrLsEbCA
Date: Wed, 18 Dec 2024 14:37:09 +0000
Message-ID: <IA1PR11MB6467C5B58659EF7CBA993AA4E3052@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20241218141945.2588604-1-jani.nikula@intel.com>
In-Reply-To: <20241218141945.2588604-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA3PR11MB7583:EE_
x-ms-office365-filtering-correlation-id: b4aaea52-f647-4182-33a8-08dd1f7173e9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?k8sBMSn9PeDmtDGiZYePk8pov/nsZjFAqLuTb2OfuQnwvkps5TaVzV94d2RF?=
 =?us-ascii?Q?em+OcCfWrKiNqCTAktsXiRMbmuBTx4X/EBd1hzaWO/9PJy++bZWrkNsdP3gI?=
 =?us-ascii?Q?K9TNZzTtsydcvVh8RES3wvHNHWQjsKWgGCekEJGOSTxnCP+Ot7+aBMkh71y8?=
 =?us-ascii?Q?ZrSQalHdxdsVqR0Ql9V8VGmEvrtcaU0vonkmHkoGIJcDFbGzbkclp2NQlVA0?=
 =?us-ascii?Q?BOIQNL62E6eD8bfwpKOWi0gVmyD4ZP8U5NYsNEs7kPNQnK4wih7BrGJ0+fD0?=
 =?us-ascii?Q?P5GvyXzEh2KE8TIsnx6QDI6pXzDFwyZrgkC2rbUsQlAhMPSKRmBVe1AAogvQ?=
 =?us-ascii?Q?amidvDMMcNTmRTV1c1Jg+4/ERV+qf8ztP421H/G1JmhA7/fV1k53FpRRdD56?=
 =?us-ascii?Q?xj7j3oq3GXT/f6BkLa2akxPcNBM4eD26CUH5KyUK8PkTtTuVuVru7RBT/dIv?=
 =?us-ascii?Q?iPOIMSEibSbaNQPvKUYMNRGTX3FHbyR5upFA8cxByfJ5hxJc4Yi3dOuMy4Ia?=
 =?us-ascii?Q?tHquVoYqdXKhIalEVZH9XnbtTvuCJ9BcfUA8lcCI7g1nEmt9TAvsTBKe6cZH?=
 =?us-ascii?Q?Kz/QsgGqLbORM4whJRWHRb5JpU9BVsfWAMfUhAt2evCB2tg9FiZ5DVp+jMh2?=
 =?us-ascii?Q?GkAztv58LqhNTn5w0g/nEqlp9wke0O+dBTqXCxDUi7cR/l4UxpdD3wRF3y5k?=
 =?us-ascii?Q?H2dNOozXJtHa412HNsLKiRfYShPkoxvRl6xINWqcW1M3Ygidkzo9vFmk9qpI?=
 =?us-ascii?Q?lP4ZMsSj3u3vJQSJplFa4FDHvkEglM04MUdyvg38aX+Az4G6/LkV6uoScZn4?=
 =?us-ascii?Q?PzIQLlOiCI5Hk3KoUuz7syNBOZcfPIU9OX5bkBsEYVByIbsQ/70/YoThVrbj?=
 =?us-ascii?Q?tPWsbGqLxB85/6dq86rSpkfx6/9eiypNrQSuZSNThzAGDvgJiVJbDsU8ovVX?=
 =?us-ascii?Q?vJN1kYJHd2JcAKw1xVT1Thb8DSmmrZyUPI98+lpfXxqP8NJM4XRANAxn5M0B?=
 =?us-ascii?Q?E+e3ma132AQYgf0+JK0CblMyEYvYoykM7UbeqW742ptCeJz+rcXWjO4C95Bd?=
 =?us-ascii?Q?kskVbt3eg54sMuYeb5vR46ImdWm3DKr4uxH9rgl+TXEkuJx9ZnEF6+C8uq8f?=
 =?us-ascii?Q?Ajgyb2w1Slp/lo4f+VlfPZQ98ffDGT1q5PVNx636h6mmKLSvFjpb3/HoO4DG?=
 =?us-ascii?Q?vomxESH806UA6gYaYdkScqKjNhK+L63/wIWuOzCh+35aQACzyd6CpNinRpBy?=
 =?us-ascii?Q?q3Pv/PbDqfvt1hFyEO3FEUd0swf6/SuIDhU3MjdoKdY+8/+RaBNt+4j0ZD42?=
 =?us-ascii?Q?GJ0Lsc8aA5GQ9iJUXHHuON/sDCAk6m+SCPh5zQwiE8AfUimGwVcuKY2pKjpm?=
 =?us-ascii?Q?cLeVWArNhhlotpQNX1lQ3nvMaKSF079pVf7U3sqs/Y9Pp2XppU8ElYtlSSGi?=
 =?us-ascii?Q?GO7SeMoCOXTulwaaIYTgU4slCoRnTgTn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b/+BLmzlbBLSNrse747GbiPNzdhsow3ivckV2Ox7VMPlpklDKOU8Mtvh05/w?=
 =?us-ascii?Q?WEINbnqqF0mOca1DsDW3iqCufxaVyE7aHOp+BKhjXsubm5/jyIK+Tz/MA5xN?=
 =?us-ascii?Q?aWeQ1oABo8zXV2+tsyBjjHbuZ0UijG5ZvBpQVamPxMyo6DCSzrDqldFv+oOA?=
 =?us-ascii?Q?LWNO0jfnLsqsxDCjsQPEr2+qs5IEXtfcAoBots6YDB3FIOLaN6a+pkA6GcaY?=
 =?us-ascii?Q?aHWoDWdKJy30XGVGKZXZuRxRvQ/STCa6DmCegWneZSXiSV1cjmy9UxXjHnPG?=
 =?us-ascii?Q?LWLvHf5UlrSLAt0m+FhtxB64d/Uc+Ek8IJiV2l3werzbSPkU5FeprpdMQBzL?=
 =?us-ascii?Q?VeI7AlDRB3CVuX1tL+xyzo93fQo19/jq7+fo5Pg2iCiCOcA8w3kXbOMbxPTY?=
 =?us-ascii?Q?BfS+wdmbrLINU0PQRvKbyqRLMHKG8fSXe2Jr1WgrqyHP7R0z1Y2xUujZUM9S?=
 =?us-ascii?Q?rVQBCbg11zHHdZf/eC4inKoPNvxhVMPYUWhLRImv3y+yr8w1CIqGFOxGi6WH?=
 =?us-ascii?Q?u/XGK9DVDUBKci92r6i7QkMZfPhfRaWiy1VvIzgEzKJKguqXDE7goWwisSHY?=
 =?us-ascii?Q?JoziBNj+1d6zuORJ4Ne8UXGwPXHiuwGOCskCuk6Mdoz1npIWJCy08mGoil7r?=
 =?us-ascii?Q?COWwLynYBUXHtjkIXWD4ZUXdy1YmLJYF4BJxufj9iUzcLteS15c2f/A4mkrh?=
 =?us-ascii?Q?wIYJMBw0FHAqBl3K7QxTc5wC1oqWFb3kuJx4+8sSbvNyuOvyzLwnz9aNBUab?=
 =?us-ascii?Q?8enDw1siUz2aKlGovkqsUZ+2vahaQGec/27vaBVWYV6B/CAK+e5wye+tlBbo?=
 =?us-ascii?Q?PzAfS0ZeuNwkyss6MjzW3duPXupXnHol1Vinkbx9FVgjL9d66Pwp+GNf2OmE?=
 =?us-ascii?Q?e4BCf50fwa/xJLjqkYwMnza2dIIvXkt6NVZNX7OEWR1uiOyn61IB0aBXkiM2?=
 =?us-ascii?Q?/1n8LRztWvxTpk5d/WsQNxLP9OdFJ2106tNHC6KqAMIVFjvISJZlPQV08QlL?=
 =?us-ascii?Q?RC3kExOcaC1rE5u9C5k2ljhTUbT5QMdoErc2r0pOBFoWbxLPmPlfD6HAUptC?=
 =?us-ascii?Q?LECA/TAUF9KL/r0ikhIqP+OSnmWhIDsKv9BOj5nofZ3ihvouYdcFa95R5miF?=
 =?us-ascii?Q?QVFqvw0W7AGWhR4UN/d3qhYKB1HMUJkAoVaylISm+oMo6F4rUv387Hsbu79h?=
 =?us-ascii?Q?D3JJX5f6E+bvbRfOiRwpmeqy/qAoMWVCfHqbm7RCvvSenlif7KZCERziZDy4?=
 =?us-ascii?Q?1C5OwaFjaX86KCqUhbQD0YpGCuNZjzv716T0V9zGQqMZlw4QxdC+MGlgjnhw?=
 =?us-ascii?Q?Yu7bFk7utS/PQKqrL6gGapqPFbOgdx/22UD9bRwkoj5H6Nsob2pYOfFVXy4D?=
 =?us-ascii?Q?WTocLhyceU9QyLPbqqITPIbQcPfXhvMY5v60xUz1H0WvVdbGav2T3zHzW7NC?=
 =?us-ascii?Q?IVy9HlC6D+AIAluhB5Pz35H35QQbhMpWGjvg2HXjrnVsaP5pEHfnH0biKwyL?=
 =?us-ascii?Q?HqMHr8WOeuOcW5EZAtFXnPi4F0OfMdcI6NytA0VEOt0GED9fcROzkSmAwtPQ?=
 =?us-ascii?Q?g8bR1IB9JydjEyPdaMqiITLkxaPW5uuQbmvBoZ49T02BJt/61fV37hZcB/Qd?=
 =?us-ascii?Q?40ozprs8vo+e+ZjwFQjN/EJqgLSYI6IzS7nMV98sqClO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4aaea52-f647-4182-33a8-08dd1f7173e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 14:37:09.2488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZI99Mym2IL1jVKQ8Q2AY0IRG0sf3kUTNl9k47JA7WEmYLva57VBStwoGwrHvl3BHW2jNc9aGvb8KXIUWoOiYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
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
> Sent: Wednesday, December 18, 2024 7:50 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: intel-gvt-dev@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.=
com>
> Subject: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata
>=20
> The virtual DP EDID isn't modified. Add const modifier to store it in rod=
ata.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c
> b/drivers/gpu/drm/i915/gvt/display.c
> index 95570cabdf27..c98dfcc3d0de 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -97,7 +97,7 @@ int pipe_is_enabled(struct intel_vgpu *vgpu, int pipe)
>  	return 0;
>  }
>=20
> -static unsigned char virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE]
> =3D {
> +static const unsigned char
> +virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE] =3D {
>  	{
>  /* EDID with 1024x768 as its resolution */
>  		/*Header*/
> --
> 2.39.5

