Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75566572941
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Jul 2022 00:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1201A9722D;
	Tue, 12 Jul 2022 22:24:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5680E97227;
 Tue, 12 Jul 2022 22:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657664686; x=1689200686;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uxwT2GxILGFnSnjNt3feYu2ENfLs3BzWD2UNL3JbfH0=;
 b=YGLvQ1xSJ6g7YcxoCXnE6wWNOv0yHt9sEWCepTj73iH6wNWx6Xr1OdwO
 3R10NE9lxkreUgqoUoxLMV2VBaEIJ9tZIAfWpZq3RRKHovz7ML5bNueF4
 iLQGrGIE+UKk9do1ezR0X0C6YxcFlBFwYJGOhf0HmcQrcnAcOZ5moQb2/
 gxaZH4OyE8DBpxLHC0PwkseSXHCKueKMqGhET5jYKOTYEq37sYxvCs/QV
 PcZf4D+vGAPrx0BgmNXO9ThjweAJjitOG1/+AHGNma7NUjjWkab/za2GS
 //gkm2zpXh/6r9JqXcvqgfcxS/Nm+eG+kOo7nzrkiVpLxIn/M8l/CRZM+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285799558"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285799558"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 15:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="628063379"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 12 Jul 2022 15:24:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 15:24:45 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 15:24:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 15:24:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 15:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LB5TJJPWqT9tKz0wIVYD3Zis85i0bhap/U4yQ4CNqAixZ+pXaDAIn/NKuVp49KBlHfJG4TQcWj65YrGmFAIrXVPQJ4wViOtAURxEslnPfqStAr+3tEcLHRKe/wYe+JAUmSUXgPczXeIQrbjEkgndJ1hdVVtZLCg6VCas9aWs5EWLOSdpR4YFOxB7pna4nE5k+6m9nJaHwnCdRDSGaO6DYfBBEUv0jYmJZwMTEsfs86muyRU8mAlRBnGM15FP5FFolbnmJn+MDvvDRDKOlGP8FNYrkUahQWaVIZU6uXumaMhivyIeHXFYZKs6T3bvQHIwcEKAw9S9gTv8n0bRmW0z2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfZnbOplKRZFDBnA2ksA++yoaLqzh8eqfhIGWAwgw88=;
 b=b2fCMvylDH7dXlpUmLS0jWsY/+MsKx/5xJn/g+j/wyzzu7f0zKcWuFcTPirzisxyvn31x6mk+vtSRh42CskmZn2Q0O2wqvt4yvgw0vzt2zAdotfW0U6I4lMwjgCVw9wMLDCSMkjYZrCV2i2P9yASetRrDq88GmO3BGx6eMpQOG0rR3UBZ0J2RICx6XucwtDOCYiENZ2lEwTQxn5rN6zZP2jCihtJBQB1O/hIGAUwTpGYsxWW5pYQDktjf3s742nketUkJTskNfTJ+O1GNrFhkYzfO+/+yyh2ntux1rj4sTA5k1LNi47/Yg13XPILA868ieqt7duEbpXpGVQ6M9kxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 22:24:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 22:24:43 +0000
Date: Tue, 12 Jul 2022 18:24:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <Ys30pudtXAW8bkki@intel.com>
References: <20220711052021.GV1089@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220711052021.GV1089@zhen-hp.sh.intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7a2a5ef-3981-4a24-82f5-08da64555182
X-MS-TrafficTypeDiagnostic: PH7PR11MB6355:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHV2uVWmPOf58l5xQtXG3QJ02kbsFTD23H9P+zg1hiOfqX11TrVGqmHqoHUm7SkmkhSXWv9OZ8A5deIiKBhsqGB9Mvn7RN1vaMeWabcA0iYoBe5twP2zBQRcB+IcRq1GSkWSIB7bYNFJXb+bRszLNx6vVo/YsvpMOdgLoXJn3mABCwKCrF9Kp87WzuKHgk5DvvflpGUQLOLKFK+AWtw3fAQH1YNqf3MtE8n650ONBpXcCiS76yYyQ6avlBMphQVxvzlFpHo81BC5JY0ECBzv8mzw2uS4Ukgb3JorJUshtS/vqJiygcLHqAwe0ApjdFW00xsyWVsMVkb1itv+1dLoJZ2vADtjZs6pctTlCo55oGfIzpojUOV0RiAsFt5z785WbuUlXQm2ZrAhnzGz+1IUZNB7f16gz5u6i5TYFiG9a+n13D2y6SG06T6byYzV4sAnP5QTJ6AGgM8XRB1C3AulEVZWNZ8/+8BAcybatu3rQkTWfV8dr28QNPcCTOhKSAjYDnSBxi3tEvNk4sfwCvf+8XU+P45ObRQYrhzP5bIcKldjoe6H85j7FTE92EQuKoZAFPt6Sc20O8/swyiMdIrhho7If2oUHA9tBw87dcV2BnJupTToKyhGJPulfi3liq3lPLoWqwyI6Grv4KzT8C5IDtZd52sb9BGiNOrt7ur3zdGmQebvTRLQzh+Y/l5ZPqRlHJvobjUUOc1ez7+Q9ldcHdN8yTU54n5bVlt/hiMvNS8UV05xtz5jyozngA6nkv496Cj7h5pHB+t2odAEzLoWVou2OsqdUJjkcz+Gy6eHj7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(376002)(136003)(39860400002)(396003)(66476007)(8676002)(66556008)(4326008)(66946007)(186003)(5660300002)(82960400001)(6666004)(2616005)(44832011)(86362001)(6512007)(966005)(316002)(54906003)(83380400001)(6916009)(2906002)(38100700002)(36756003)(478600001)(26005)(6486002)(6506007)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v/kCY3x18o45fzxrfu17Pw5RNUeRNOxzNnrSqMT1g12PbI/9vkFh9bG/UUT3?=
 =?us-ascii?Q?NKOZA8iE8VIz5HJsBk4vR/e5YwOqA4dVgGQnhyjBVa7vIbdPX2HWm5jnAI8L?=
 =?us-ascii?Q?9jsn68Tnl02mjOXpNhk57KPS7+s18HksRGTEN2aygkyOcUlNlHVsRl0BBWRq?=
 =?us-ascii?Q?ecCIhUbSLz7FZy6ynT1QoVV9nF3DsIJrHOQfN8LDBmsSJg8bjpyr46jANQvY?=
 =?us-ascii?Q?xWvOm/xrQs5oQVdOpKnQjkkD62FmiXNlY4eHp9Zn4j3UC8s/SjbyQ5F0hYfZ?=
 =?us-ascii?Q?N71f3i7pkp+SRBF4CEW2n4vmPVJGA0eLUvSqwvOIwjbq0Km/3HLSTgD9tH7Z?=
 =?us-ascii?Q?x4tjBoOAIWmgS5KUamMX4PJdnOPPXOjRGNXhhyg5I1YMtnVaZQWi3hLWsqYt?=
 =?us-ascii?Q?TShaybDeqm7TgZThP9uOr/c0Ezv+AfYFVQyh2JCIPt5sWa0TYIEAbGS4WNlM?=
 =?us-ascii?Q?VG5yHMwB2aZF19vs6FKaDnk1kUyMTb/7boXe0mABKK7rmAnmMSFmAVLzoiFE?=
 =?us-ascii?Q?USie7/9Knr7kX0uXPXqfHY7Z8v0ghcrGbgk4o88u2t3qoP29DfWiKJP/kpEj?=
 =?us-ascii?Q?Zlf233Wof5pqRE7AK0FrDQHl107GpCKedEXXySvzWdG+M9GSlWI5h7ZhgnC3?=
 =?us-ascii?Q?rx4Y226Xl/pbttzhi7V0hkUFCceERiQANO4UJpC/mRj7BdiBssf13Ve3qWjG?=
 =?us-ascii?Q?GRGCnv6qlL4jX/IKfBitWV0YDwYQsNjTmHZrR/Kn7dNaJU0cLk14V5ZgXh1R?=
 =?us-ascii?Q?3jfHSoQGJ5DRc2iQ/Fc/QFZyGxwpTLjVljQfA3rwvpIqTFx1rk63xI7bWMCD?=
 =?us-ascii?Q?xzKYZe4opGkEWdNb0d3yv2YvOb7AW5vraR9ZjgkqjKSTlEK/8EPMeBW5TiAa?=
 =?us-ascii?Q?m2uWS2aaYvpDHqmkIssvgUeqls579H8IYX3kSoP3JYzPok+Qle/VM9h0H+Cc?=
 =?us-ascii?Q?tkQxZCS24BLI7R4hBisQUn8akH7mHy9qwKzo+PmErDaom5GmWOo1EEkYnvb1?=
 =?us-ascii?Q?/zbPXI3aGxciRHh+FTZpwZ9zOvimqrLad7A2rjrnt2OCGJU4zBqQp8f4EFuv?=
 =?us-ascii?Q?mlYPMzxRB96WS5oeITA5zOvIOEbSXuBNZm4wEdyMKL+2gLKu0NvCQkQ1JkdB?=
 =?us-ascii?Q?ptHsiweZS1A4ihVJaohOWn0agM3pQQhQ4JJV+77tiAbZA1WEE2gTwGcq8X0n?=
 =?us-ascii?Q?gP5FaIhYIWLSO74bQMv4FCcvuSH/iGn22gi7eRy3O7cwSRffjn2+H0mNyYEm?=
 =?us-ascii?Q?ZVSjBlcXGcUm7ogQUWEU6tJ9ffMlM/aUGDs2qWgXhwE8TRmZ6LyXs3sFHvrC?=
 =?us-ascii?Q?bJLyxhabKNExXaHfUNaPAOWJC+zZHMBiAV0PhCHm2J6+UmUP70oXArfSO2uP?=
 =?us-ascii?Q?vNAkx71Djksv6n1dmhcf+QkNmlrbLSwVv5wOWBkVFt31nRkAekECLgS1Xa1y?=
 =?us-ascii?Q?+lNyXVMk+MMeB2s0PHThL5b5+H5On+PZsHd/qt94Y/au5nP66MhsNVDHRnLP?=
 =?us-ascii?Q?oC5pBcqSu9LnqBoTFLB1uxeOp8JoA6bgXnR2LU+rrZ0zXOsxYDk0aVYbi2wf?=
 =?us-ascii?Q?jHeXygeXpWgXFIQhdFmv/Y+PzfU5qGztWL/08fCY5fLYTbMDHSSEWBC38rYZ?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a2a5ef-3981-4a24-82f5-08da64555182
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 22:24:43.0583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDAGBj37RmmutWUO7JXacPktVf3REdMgPSdSn/vM3jIeQ3IZ57p8lafxjG1ukRblalXxwLgIHCA1R/yMIG8wQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 01:20:21PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's one gvt fix for 5.19, from Dan for shmem_pin_map() return check bug.
> 
> Thanks!
> ---
> 
> The following changes since commit d72d69abfdb6e0375981cfdda8eb45143f12c77d:
> 
>   drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-07-11
> 
> for you to fetch changes up to e87197fbd137c888fd6c871c72fe7e89445dd015:
> 
>   drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist() (2022-07-11 13:05:05 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2022-07-11
> 
> - Fix return value for shmem_pin_map()

pulled to drm-intel-fixes.

Thanks,
Rodrigo.

> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist()
> 
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


