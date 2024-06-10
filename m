Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434490294F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2024 21:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE59D897F0;
	Mon, 10 Jun 2024 19:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKc0Q1m2";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF6110E24E;
 Mon, 10 Jun 2024 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718047913; x=1749583913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sAdDIggK+3wgjElLfIli6IDYYDoEkfd5k+hur2mcfFI=;
 b=QKc0Q1m2lJqk6371Ao8wkilucyFToBYwa4p5xaeUefm5BmeWgvxi7XmB
 0GxB56I8lgFK1xIzA/KgHjUYnBki3fjqerB5P8EHTIjuZslP7UE5UY74p
 JYNQfpDBI/UR6DfsF9+fm8QRVk/tz4jTD9L3O7+EvJ80fmGrnpNl1Belm
 rF4pCFbwbzJClnCIm/ZrPHyW4KOZEqQN++AimRwib0XOFeAQZ9+F4R4QH
 lT764yhT0vwMPzWhNEP+Eo3V/OyIxz1hDXHijsecCddUTGzkFeBDpXYJo
 wbDzjd8+5lKS41FPsGzukn7SDAk3mSyxvmLRshfAOJ6qFjSMY8tNfkrvc w==;
X-CSE-ConnectionGUID: BftTmwO1QdaKkQ1tylR0iA==
X-CSE-MsgGUID: I4VjAxH9RQG0S3Wc60eeZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14954876"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14954876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:31:52 -0700
X-CSE-ConnectionGUID: OWQzy8zrTPCwkOXbZoOviQ==
X-CSE-MsgGUID: X/o27FKVRKq6lk1wQKf8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70328013"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:31:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:31:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:31:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Phu9iWVRhAXE9P6Lj9sgFEQXUW2JA9w756DF1wYnyZNsRYJGlp2iWH2yDtl0Oxdj+t7sAkTWm7syOMjHAk+vilMnvjOOLmaOmRLjSngwTaWzMIHCFBMBcWaEwrnhBNiYKUo/cUhua1N5+gcmV/WACHwqJc7vzTrPhqZLck7U/JcAjoK0UOpP66KnFyhL1M26nmBQr5eT0gJHaVSVvxdTQwWyDFEFSTi5Kho5JCu0k/3tZeBEbjCwyvZ/qsmMrfjQkl/hmyhzct9KiOoAmJ03NU9eIEAfuJHW7MwEYlTA+YSYvPOrb2VAxSOEU2PggkpG/gCro6xS+TQ1dtoKV2wTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCZn2MOTNoufF34C4DlyYxFJELX/d+tYmcZgOVAF8rw=;
 b=ib4jlClE8nMKSJ24HaOYI4XuDNDh0yI0WMqkYX5C3q5a0JUz1Re1f8kdu67eVCXEi4vyzVCZVEFgRnnNG/PYTxRyriq9Z+rimUfOGO3jCqk1qYzHVQINGHkhg6xODRIf35c031V+2nS3Z5nvwH/9/OZdxqKH6qcQnA3RKIWIEZ4T4AKJZjEK/q1+pEu/Way9C1/x6RyIAm9WTNwfdhoo+ydTwigYsOyQ/K7uqSEIoZaEbDO8s8eBepy5uR8jYkj+/Y2Xf0U83lFOjFhFlg/dvp664e0nDrHrrHI//T120TuqDr3LlRQ2daUSaiVfRdSY+bIasonz1V1QhZzAcS2R2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:31:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:31:48 +0000
Date: Mon, 10 Jun 2024 15:31:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>, 
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915: relocate some DSPCNTR reg bit definitions
Message-ID: <ZmdUohluaL5VsKIR@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
 <85409fbe5073797c0dc17df43eeb25abe9ff889f.1717773890.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85409fbe5073797c0dc17df43eeb25abe9ff889f.1717773890.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR02CA0031.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::44) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d204e5-be93-4922-420c-08dc8983f8ab
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U9cl+eOjgCvwQjk6Gb9+c3iw/OCXTv6Ca2gprXh2cn1hwv32ZEEuiafLPkvw?=
 =?us-ascii?Q?b2AETrqemFtrdAKqNRQ6omAKpux3BCXHEwcRIcvXyFU7YYRNaZ0SuKtmLt5c?=
 =?us-ascii?Q?84WKfgHK9v7gOBxDEc/QTwkgPz9j4NK6uXEztyjid4KJL8sTIcO3IciIAmqV?=
 =?us-ascii?Q?euyWuhXC5ShrV2/LVSpSAUwqGuj6pKrvbtuDNbZ+vo/k8ggd2GM9lbccrv8F?=
 =?us-ascii?Q?iH33wH1ewaq6bmzxm9CKNANrIg+dqU3acwnaS2X+BVnzhWLvVFtOE/T7g5Dl?=
 =?us-ascii?Q?0ZnCzAkdIxN+uOCzXHix9O9+lHKD7Seq9Vp32ThrHZ8dKbVytIadPwe7Lb0N?=
 =?us-ascii?Q?OJ6tg+cFzBtGJQwhBwz7XpDFyyrTUxVnfIlR3K4aSTbJgNbMm0SRGx+EEK69?=
 =?us-ascii?Q?6IQBtj9APSf8RCDAJ4RtxNpFK8JbQ0+kjUUVxeucD69mtBWRV+k+XGzlZY9+?=
 =?us-ascii?Q?poEEPyhFKKe0FGcQYmKM1oX8RBCBI2iN0umtt3Uvaj+yNBaqVl0Ak42BgmOb?=
 =?us-ascii?Q?NQC7qTed+ibFcUFkfebi2f9y2drK4RdRB2akkQYBFngetLY9PKQRSrziwacz?=
 =?us-ascii?Q?oSZ3ZhQYWFaM/VpLS5seEcTQuSfA1XocqDLLIe17/XSQ64jnDjfz8eTfV3nf?=
 =?us-ascii?Q?8KlMaLTM/6OE0YvNUGc9D97WGJXWct1kS+RVqG8sJuKI2SNNMlvzPfIGeuxP?=
 =?us-ascii?Q?QUmaPp0uw0kki9xDhDyGpaTg0gPD5hOzz26v8tjGOmII7yqCFJzjxPT0QwsV?=
 =?us-ascii?Q?osA9aTLagQFt59zC0y2Vv1nU5PpLlRkiXJmjbuPTOq2Uxs5miYGDAorg05S1?=
 =?us-ascii?Q?vf+tT7kAb/0ADxf/eSsgCNHQNBpJtIgJTZzFZXUQimVi0Hxb1YeTHi/kLrCq?=
 =?us-ascii?Q?2s0wAWvmAqmABZZrFC0YsuV+cQRmdAnEv7PsjhAHQVMHAQqDwrQtZHYpm1he?=
 =?us-ascii?Q?aJuHyCgDYfL/9Zr+q+9vXNZcKIt682iUIbzXdM88b+FUEZkn59dtkXCsuh/4?=
 =?us-ascii?Q?nmmuEAskJE1STqUzUqvwf6DcyeVzPXtpz3L3fjjAkZc9c/jQMaoSTFAAtWEG?=
 =?us-ascii?Q?ODl9PZGaP0++VruU8iw7ZbleDOXaOtYTAJGucPEvuXwuf9zyIOAeS8p5ePpL?=
 =?us-ascii?Q?TBXXDbsCPeZX+9bMr1G2xVx21Wj1OijTavyEfG1i2GCrhsFM3eD4Wi/2Sf83?=
 =?us-ascii?Q?SvGWxrAskc/dTt9QRm2gGhkhiOuRYjxdj2QRL6Pe/IrlFSGsbHSrSIae7LsR?=
 =?us-ascii?Q?zqwvnRj/qXUcLzTI+t5KfSnuJg8Nwl0nyOJAc5lHIT1zqQwYxKrHeJ1g8DEm?=
 =?us-ascii?Q?MI0VR9WncFw/CPewQ5PoQ4gq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DStPxaj+QEu3X6g8cBXWwvXc4iM09dIFGErG4poCThJDazKr+5Vf+kzE/rVc?=
 =?us-ascii?Q?nhVakVxmS92ezFHbBaieYaNG+W/qdWhV2rXmDXi+fZDdIIIeO5mpXbuBUs2W?=
 =?us-ascii?Q?NByjyup/vmIfpm/frk/mgIHe+UaPtV6ZKrsSAHHtW7lx3KjGeGjsjVorvc3g?=
 =?us-ascii?Q?6jYBcMTCiazzYeLXav7mIZyvG0e06WOlSez+bj9Sb/y7ktLsr1lJ8QbE3ZkN?=
 =?us-ascii?Q?DuJWMVAbnp3LG3W2li7whIhkoPcZohZ/rg2ktZF7PAgkRs8uDp6uOOEXwLm2?=
 =?us-ascii?Q?6TZbaNGbzRZT4TvNvmZkWHHRZcPvMhlUjO3vE05AQyaAVD3UfQeJ/6KYH2PT?=
 =?us-ascii?Q?CvGv/v5o532NUTCVTiqCATwE9Jw9vLobTg/C0dZsU5ehU4nqrzgu1SgKBoFP?=
 =?us-ascii?Q?z0WUXtcxhjtSwHYSUaJS99hnCRuot8U6LAf7FmBGzalvmkBXJUNn7YZ5qrxD?=
 =?us-ascii?Q?JLshRoyxTLRdI0jxZBNlW13tQo0wC78cfoenx+EmgKWZDp5lK2o43ChUOLGm?=
 =?us-ascii?Q?qovdScVTqmWg4VjkRYPPUHBRNjWI69j+5VIq7haM7VoOiUehwlBVpmFRe0Gb?=
 =?us-ascii?Q?twUTX9DUfJgyn2i/VwJMc1ip2eO8IrytY/XwyjqwkwQ3rCv2X6ki3z34NjwO?=
 =?us-ascii?Q?TjM0l541wqpbmdLdMQ/rGuwvJ8yt+e0fwUViGAaujaxDkglItEeIIhY9F7bx?=
 =?us-ascii?Q?wqNLLqG85IQ3xqBlEsQ1/1gScMa1tvhekWaOqiogl9c9+5JCmGmsFhwIVqh6?=
 =?us-ascii?Q?R0962xTd7U4azbqD08VQKysjJDy62uTYopWQzpnguM7Vb1R8p1YjJm0MACXc?=
 =?us-ascii?Q?PN5/S24iPehGgoa5/cArQjFcLgCDw6qI9kn1S2hspwa2tIIgv8oVD8fZiRJQ?=
 =?us-ascii?Q?zAvzcN5GzP1xyKpoeylcoG7p9j7W9RPQ1BBiMJ1CU2B/J0gNXO7oGSsumYZh?=
 =?us-ascii?Q?JXOpyFblHptvsuT/wBPTBiJXn+CVPaqcSh1MbXro0gcWwEQIjQruJNR/PNVv?=
 =?us-ascii?Q?0UXRV0Sd/pSnrb+wtbBl9hhCnE/kBs/9cV0pWu8TYsnxoxoF1DPd6Pd7rnbr?=
 =?us-ascii?Q?KzH0h/1UdFsoWPDdzVaU/gdJ9ZGNR/kmIVbyB6/2U2yRld6uu8ylNWK/+/Y3?=
 =?us-ascii?Q?8uC3e8vw5MjxSq1u8kvqtJGUNN/qAeFMZdyTE1tiIfKUA29WOnAGZ8guDBk2?=
 =?us-ascii?Q?bTYf8VyNRbxXEJ6logzYRHI4KV7ZcPbfx29ejV6KWar7IFsAY4ojzaZBqQJ+?=
 =?us-ascii?Q?VqrmYuvdlIrnYFsjDb2rSJTiV+WwG2h9OCvOnJq0+A7flW3P+PuFuNKIwDEw?=
 =?us-ascii?Q?1wK7x2PSV4C5qTiRjPVgK8EYJJbUdQC991l4Y4+LTOYktVx2JIDhSKLKKHX7?=
 =?us-ascii?Q?ECpzH4ep5PnLC9xbq9Kxf/eYICHwnM0FcfNJWpWG04mS1VTnQFtKtC2u2Fsu?=
 =?us-ascii?Q?q5mWbKHnuF4mr4jp98GN7gSW/pOGgZIL+SHkM7DRvHy8yYpfdOrc1Oz2G0UH?=
 =?us-ascii?Q?6kajVR5aYx37GjFJAmE5Q4vNzPGl08wQ3OYtx6Eos9OfpDLtpKUA6leOktoz?=
 =?us-ascii?Q?7Cz+K6xwTw4UysRIBqJ70+VkQrr36TfW8VJuLSSk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d204e5-be93-4922-420c-08dc8983f8ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 19:31:48.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0YtpkM7iEzdusWNfFUqTCUMEkxjpXfDjq8HX6j/qHowGEKFAfMFOgm0B42brcsUEPKDEJEDR7sB7+Udm5SxWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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

On Fri, Jun 07, 2024 at 06:25:39PM +0300, Jani Nikula wrote:
> Some plane B/C specific bits were left next to the unused _DSPBCNTR
> macro. Move them next to the DSPCNTR() macro.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_plane_regs.h | 2 ++
>  drivers/gpu/drm/i915/i915_reg.h                | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane_regs.h b/drivers/gpu/drm/i915/display/i9xx_plane_regs.h
> index a2ba55fa2b30..5d7ba824f354 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane_regs.h
> @@ -38,10 +38,12 @@
>  #define   DISP_STEREO_POLARITY_SECOND	REG_BIT(18)
>  #define   DISP_ALPHA_PREMULTIPLY	REG_BIT(16) /* CHV pipe B */
>  #define   DISP_ROTATE_180		REG_BIT(15) /* i965+ */
> +#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15) /* pre-g4x plane B */
>  #define   DISP_TRICKLE_FEED_DISABLE	REG_BIT(14) /* g4x+ */
>  #define   DISP_TILED			REG_BIT(10) /* i965+ */
>  #define   DISP_ASYNC_FLIP		REG_BIT(9) /* g4x+ */
>  #define   DISP_MIRROR			REG_BIT(8) /* CHV pipe B */
> +#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0) /* pre-g4x plane B/C */
>  
>  #define _DSPAADDR				0x70184 /* pre-i965 */
>  #define DSPADDR(dev_priv, plane)		_MMIO_PIPE2(dev_priv, plane, _DSPAADDR)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 7daf902772e4..2a14dd9ef4a0 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2226,8 +2226,6 @@
>  
>  /* Display B control */
>  #define _DSPBCNTR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71180)
> -#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15)
> -#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0)
>  #define _DSPBADDR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71184)
>  #define _DSPBSTRIDE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71188)
>  #define _DSPBPOS		(DISPLAY_MMIO_BASE(dev_priv) + 0x7118C)
> -- 
> 2.39.2
> 
