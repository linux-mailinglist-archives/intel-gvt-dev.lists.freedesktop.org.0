Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F4902951
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2024 21:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C011410E3D7;
	Mon, 10 Jun 2024 19:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqLLcFBA";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6465D10E36C;
 Mon, 10 Jun 2024 19:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718047932; x=1749583932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xSS9laCRc8Y0IDeBlGwxZc5vlM8Pj5IDp5v493Fvce8=;
 b=gqLLcFBA+bhaH2UdYiwyyc1bC19yMn4OaKOfeglV6I2RsKIUllsXUSno
 F6uLnrpt+qVi2m4ZaDpLA030tYFZ+QtjENbTk3msNnXf7jgWPnyBHu4h0
 rjLxzUTVURNktPr+4otMo6D19nu8z+YGwe/nAs0RgcZ3iugfc/Xs08D/G
 Sv1MZMBXGP9q0cCCQ4b6c/V+IlrFoaReWjdIMWkR1+Pk64c86ixOiIKTr
 CMzBTbwKTx5hIcg4F4D3R9wAPFxqhWfpqjwwE973Z6+tNpuTNLk2glc8U
 AWO9HiS99GMvFXoMm6se7t6C6HtbJbyUp8/kQsbwNXQbrMogUU7XW/Z6s Q==;
X-CSE-ConnectionGUID: 3sKnoDV3ToeFUgksCf0BrA==
X-CSE-MsgGUID: Csc6zBo+SIm7PlJaTMUu7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14526569"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14526569"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:32:11 -0700
X-CSE-ConnectionGUID: yWmMZHw1SPSVmSZDHaljEw==
X-CSE-MsgGUID: 4Eehh/pCT2KaZTDtcYlinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44088857"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:32:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:32:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:32:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:32:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COuN6rqTqzUmKiX44d8BArzcfD+RxQWrBQ6VpsM+B9WA+SMv5dY5VDKWFTvmExo1FebaWuQf7kbkmBmZENUjH90i7S1EiC0tLM3hRjNEpgjz++p/0ngiUkrYlTRMPG9RhiNwsKMM7F6QRw9AjGUF+3TXABA693H19o0yjlROSzueFI382Ammfd+kaJF0wdZTSlmQHRMfXXtYz4gXNX0iZtPRKAnk+UGFPrnZayG4e9ebL30ucKbbSWP2pkWewUhbbAFekh5+aVWC3NyQ4MYxxmteqrAmssU+t/U/mn9xPUop6yaQ/DJ7c5a+49jeQFBDdnWyb3HqMvkyLIpVdmpGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gE8DuZdzZoXmiV++wwKThhMjcjosvJ7ajmrfjqnWxo=;
 b=lGdu12hCWel733n1Bbc4PZyuv4owND3sk5Ky2AGvXJf8CbloDlQe0XaZCDB0gQ5Km+nKAq5sLvhWEvL9naNFIhwC6G/9PBpVHBoOfljYISndO2V58jgQDJdlnOMTHpaJaXB2UwmOdNScm7n3CYJ7tQ01DGVzT3RDDST2lVZMTywXc82C8Z19eFHyojtZ8B1jlo1UoZH4LRO/dHoQBeuOm8tjlc7hj+06VdZZ0458xdG/CgDhDOpwTrSBFifxXn7K+KH0guPcjRBlwjy7CqSO/KPu3mtFtTF+76J9em7qhevMIVMh1OuI8jX71lJwpWg7KxjszVVOzSj2hydF8A60Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:32:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:32:08 +0000
Date: Mon, 10 Jun 2024 15:32:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>, 
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 6/6] drm/i915: remove unused pipe/plane B register
 macros
Message-ID: <ZmdUtZei8kb0X0Un@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
 <16d278bea466a69cdce94fd83d98dd15ce1a8c89.1717773890.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16d278bea466a69cdce94fd83d98dd15ce1a8c89.1717773890.git.jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 348431ac-340e-48b6-0236-08dc8984044f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WrsdTDr5uVW7MM8wdP122EJykJw0wZKzJWN01/Zr0+PeIzyFVg11y8X+p5PW?=
 =?us-ascii?Q?/8FbptJCqiyaDGMENFqdgKURQbU4aqauV4W3g7UqiIOYsETZOOlqSDboeS6U?=
 =?us-ascii?Q?vyWNVYkVsatBsxy2ZaSA6xGERVaSEhc9thPINdKMTSFH3CUsf0377KpRze5s?=
 =?us-ascii?Q?NMMpDfm9LYaRqIVC1HJItXSCrZqGhkPkNE59Mk0rH0SaW7m9HvGDYXF1HLgE?=
 =?us-ascii?Q?WzfJ/Gvbk3OUQ4ZbHreMx0KAYNQ0vmZXjfe82X7unf9clsn280jZTLUpm2yq?=
 =?us-ascii?Q?T7CLiYt/zHCphE3ueHZ2Ezk1NqOv148xqfPl2c76Pw0cIWVr4JvhnlvFjddP?=
 =?us-ascii?Q?8tvizRUw9LrrMbZZ4IrXMPfvaCVsPF1SLtAh91fa9r9F8AzFOLU7tydZgeYe?=
 =?us-ascii?Q?Cmzedc65WU7jAb3yr/gQu6oLX5KnTuOe0ZlnSOla2ZxrEkjD3u9Ey3r7AcF0?=
 =?us-ascii?Q?r2rSSvmosX0DYJG2KsaPTxjvhZnnp6sw+ILi5CQMLEN9hExnNGyVEOQSYMID?=
 =?us-ascii?Q?3sbmVKi55WdlEKQA7pxE+AyGRr4mVeOU0OCVRZWMvMlLJmR3NwiKL3cHiAf+?=
 =?us-ascii?Q?d/0fpYVgVCv3BjF7iEG04A9SUhGVJHf6W7Kh3m8AelXh0EdIXwiK3ZYKXRth?=
 =?us-ascii?Q?2Vaij8tqKkaPBpe/+v1hn9t1nnSjmInfyk0gJDvQHfK8LAhQjdj1fHyLYGID?=
 =?us-ascii?Q?aIOq2m71B18y+RPYLiYl4WQG8UNhLXvMIadO/xrYNPY3P1E/RGV2u4yADIjS?=
 =?us-ascii?Q?6vvRGEzzQlohdMPjdqn1ml4VzxAnhGEHkxMWnU/IwMZM5wiZWowsgK3UJQNE?=
 =?us-ascii?Q?BeUDBRLyUuh5GwgljydTNY+k+BqeO81v3OZhF+wGlxxZHxlCTeg3mMGWACdW?=
 =?us-ascii?Q?Yq2OqYiiVINJ5g4ihwU3OeM5PYavx1ac9GhoIBWASDOmJizoUnFptFle8B+q?=
 =?us-ascii?Q?MSfcYoDYXFkNa3UOUiWjmCZg99LV8u6B/Lkn5XaUcsOD93oKWMCLt836DVD3?=
 =?us-ascii?Q?bnBjJecdcX+N+iLb9HUwqeV4Wi07BKFR384z32GM8CX3x1eWXFuMFIgzS3wC?=
 =?us-ascii?Q?XeN9wRZ2qhCK79nY1J0WlJ67SxXWNmdcJslGjMTXQRrV0H4KskHC3de+HO95?=
 =?us-ascii?Q?Hytmg1zSaDRZKuKYi8T1OfEQT9ogaZScjq6A9FaYFJDPO7ojwFneZgoxTJfI?=
 =?us-ascii?Q?oaRZkYG2VZkLyo40ocqE3u92C+tDQdGpfVu5p3P7B7AR+/b6l8pd9Tvwhrpk?=
 =?us-ascii?Q?xbyYfFddEF7mpiy2+3pw5dVy56w5FckOiXYewz+u8ertVQmsLOg1/DR6cT+7?=
 =?us-ascii?Q?7z2lBrD1sM1Jj/G9p5ZXbZ8p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JlNaDYFMB9GJk6+sVEwhjBJWw+zUa5sYHzYqzkp/RM8/TFExV30kw6XmPwLd?=
 =?us-ascii?Q?muEff42JnubGcBnKNuJXjc/JWXM5qyHBO+hJsNlg1am5uAki/b1rHWpSAOlv?=
 =?us-ascii?Q?FZqUbydKOyiPZB019VTTRTvJWfvwRrokHnCbBkajOF9aFotYyA9GgBlUf5zc?=
 =?us-ascii?Q?Enav8iAc0P1uWFgi+FpYNLfjRV/1H4EaRaYgiX2N/bc3XpZSu2xQU/11aXmJ?=
 =?us-ascii?Q?z8QowsyR2HuRybLcZ7mRn1dU4srw62Tv8tHXyLz0vjP5L/QM0xcLBO4eIJ2g?=
 =?us-ascii?Q?iLwaO1ZoSDZZADNOclp+hzx/4XqTR09+8QfIEy0/zHqa3o8F0wsp60giAJ17?=
 =?us-ascii?Q?r7Jgwk0GvuSt4XXlRs8GKu2GOEmMTLLMb/uiHNe1IyF40IEvSLnz1/8o8eu5?=
 =?us-ascii?Q?33WdDkG6SryHTMWadgf+0lypcro5ZeSsNyWl7EyqYpHRmAjzcon8WXT3ORC2?=
 =?us-ascii?Q?BTbFmYXpz/G3STk+ha+P7Kx+AuGGAz7VsXPJ/OxE2VMNSKL+PnfsEo96H9bg?=
 =?us-ascii?Q?+zpYVoRxM8e0QJlgQKVk//IK1bStuz1edBLUZsgi7DKrINQEFlvuCgRbdE4H?=
 =?us-ascii?Q?6mmcb6nQa72CK6cMABPyDP093p34cX0NN9b3MJcf4aO1GRZBRKiy7hk7Xwa8?=
 =?us-ascii?Q?0uE1kYu223tY6jArAaC+A+abHeWEcIRmar5I6wkChiNeDTeUow86jZegHf8S?=
 =?us-ascii?Q?biG7TJIkZNOlWfUeC5+cEnvMN7uBe7vfokwIcK4LcJHE6Py8sE5ZljZxmVrH?=
 =?us-ascii?Q?cBULzSgIZ52m5CfndSlm3TbNhkL9RA8zH9KOj4jFB0Qcav1nBs7EL4K0lrDL?=
 =?us-ascii?Q?7/8C623dYkjWtlwufMb4BOQZ4B8OhYbatMp+jlPW3nWx0ZJHRUlBjneeQ/3v?=
 =?us-ascii?Q?sBRug8e8WkNEvnajJK8JXlCMo6tP61KU2ckfURaugyY99FghUWOudAy2SQAK?=
 =?us-ascii?Q?VXALVeOfbwYt6RFaQQ+8swp7xXA/MQaxcylDQJA6huLb7YxOr5dZB5OqHSUT?=
 =?us-ascii?Q?e5CsDJE4p/32lrfWpCy3/F594M6wliPB2fuIuy+FeaXikOQqRVSI4x61vQ7A?=
 =?us-ascii?Q?2JhmftcWLPLxSklWek3r6fXP/bGxlAq93GPd4tciI+CJQyKM0x7ecXIlmN6Z?=
 =?us-ascii?Q?SJ6fw5OVYYcFokojCEZhanBDlyolmbCgSWdJd1j904F4NirPssRvxfgUOHzE?=
 =?us-ascii?Q?ssTUvtr1fh2UHz5w3bBwT4qgKiVRqcpeQDTl30RZqwwI/Kip/lEzXr+2egOU?=
 =?us-ascii?Q?LxOn9K6K6ni9zCkqHIoprDP01VDRN+sEbibMqwPfl2TmVdcIymaut43hmEHW?=
 =?us-ascii?Q?ql3xNubIT8pt0WzX5gYbo1Kcn5cCWEVNAZ9Z+ZLVoEbjDQWbLLQnF3yZcM80?=
 =?us-ascii?Q?qrUX5UTqaXnZ3QriLVyx2i7r3p2Ba+J3Zp0zvp4or8ibYNnMKcXCGRc9rMNT?=
 =?us-ascii?Q?Rm4kZ5cLeek+fii6l2H9X1QZmk05HYOUUH6syii1vBS674tjyZVKSUnWNkS8?=
 =?us-ascii?Q?8EjBJumo7UgSd+ZK2+EWVJZwNMYGY5Ch3LiN3qyYE9Fo7GBhLDEXM7EBEZrS?=
 =?us-ascii?Q?ojl5omj9ZoFGnmd5/2ZAPWuZ4XZ9VnxZO8zKmfaK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 348431ac-340e-48b6-0236-08dc8984044f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 19:32:08.2388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5P60o3rHSxpj5rwnrIv7l1ii3zpKdQmEdmY+gW9qJstaN5fDCPZrDXFUI9omBO/Mrc4R2JSgg2SbPX6Em3a8w==
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

On Fri, Jun 07, 2024 at 06:25:40PM +0300, Jani Nikula wrote:
> None of these are used. The parametrized register macros all depend on
> the pipe/plane A offset macros alone. Remove the unused ones.
> 
> v2: Rebase

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 2a14dd9ef4a0..a33f3a61a9a4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2214,27 +2214,6 @@
>  #define SWF3(dev_priv, i)	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x72414 + (i) * 4)
>  #define SWF_ILK(i)	_MMIO(0x4F000 + (i) * 4)
>  
> -/* Pipe B */
> -#define _PIPEBDSL		(DISPLAY_MMIO_BASE(dev_priv) + 0x71000)
> -#define _TRANSBCONF		(DISPLAY_MMIO_BASE(dev_priv) + 0x71008)
> -#define _PIPEBSTAT		(DISPLAY_MMIO_BASE(dev_priv) + 0x71024)
> -#define _PIPEBFRAMEHIGH		0x71040
> -#define _PIPEBFRAMEPIXEL	0x71044
> -#define _PIPEB_FRMCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71040)
> -#define _PIPEB_FLIPCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71044)
> -
> -
> -/* Display B control */
> -#define _DSPBCNTR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71180)
> -#define _DSPBADDR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71184)
> -#define _DSPBSTRIDE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71188)
> -#define _DSPBPOS		(DISPLAY_MMIO_BASE(dev_priv) + 0x7118C)
> -#define _DSPBSIZE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71190)
> -#define _DSPBSURF		(DISPLAY_MMIO_BASE(dev_priv) + 0x7119C)
> -#define _DSPBTILEOFF		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
> -#define _DSPBOFFSET		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
> -#define _DSPBSURFLIVE		(DISPLAY_MMIO_BASE(dev_priv) + 0x711AC)
> -
>  /* ICL DSI 0 and 1 */
>  #define _PIPEDSI0CONF		0x7b008
>  #define _PIPEDSI1CONF		0x7b808
> -- 
> 2.39.2
> 
