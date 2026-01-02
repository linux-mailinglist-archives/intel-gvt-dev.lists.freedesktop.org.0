Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F030ACEDAC1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 02 Jan 2026 07:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061910E046;
	Fri,  2 Jan 2026 06:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2wGf4N4";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99EE10E03F;
 Fri,  2 Jan 2026 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767334577; x=1798870577;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TgZN7C4mShP4N+TWBVF6Ml3d8oz5vdfWODfk7qXcaUc=;
 b=d2wGf4N4peAcHmQl6DyQhVLFvWvlZmYJT3UqxAgDgukMqp3lmMnlpZfY
 sPY09miKMeO1y6OsjJxq5e/kU/qTvWACwXI05JSJwFWqEr0m6FTul4AQ6
 wQmKEQcavMdUd6DT8OplJ70u+dLTxNezf3vDv0m3/pTaA+oyQC9y54E8q
 OTr9DXC5GuX7XQ4m4BVKgrrKaoNoau0mpdfP/W2M5jsiYwJmXLxbfcxmD
 pzEYBy2N1prGZ60V9gJURly36VGVk5Jnd/e5gCd5/Qj5nkN7DPrpRbDO6
 zsp8npFMJVadqHBLM5kSRVOzVbPUSvMpVPaY+0IMdAxNCe6O6d15yNlak w==;
X-CSE-ConnectionGUID: jNwRYO72THSUMSi2i2myXA==
X-CSE-MsgGUID: VCs/yevQRz2yRxh7NYMa8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="56398521"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="56398521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:16:16 -0800
X-CSE-ConnectionGUID: edYX94jkTvOmbe7twNCifg==
X-CSE-MsgGUID: b/LIIlkbTryFB5U34cliMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="202012833"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:16:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 1 Jan 2026 22:16:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 1 Jan 2026 22:16:15 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 1 Jan 2026 22:16:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXNGyLaeoNqc8oIh7u5JjpLxM5nxL9GtW2N2KKtXMD0K5sOXJCBVQliBdkMfLeOJsibZRn5PrHyAVoiM7ZoqrhOXRWZlg2l98EnG6kArqSEKhXCq+0bYdZwMGFv7AsjaB5wYJF0IEnQuVQO7IMtL3GD0htO2sdA2Je32BYyLTDuEuYiHL+j//Fl/0E3KAWiM3swANsoohTrgyi6aj74NueOxwwviPOzBk7dYErIsjGEx67gCuw5rjIvyF35XoPsSEUFuhryAMPeJDQ7+fvsjX8V7bkexKcZVtImV9+yMRdcZP0W2PuFd3G+pP4JtY8stWxOF9fg9fV7xZogqH3uGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eF1G6GOzLRCaiyJ54mTF3lC+Kl5KjnKh7iZf5Lknfc=;
 b=HUMTaNv5fHBwJPU4c8azg6j2ra5ty8MyFegvD+Heur2Xqvk6H/8q/3irhiJOlanaAJdwNOCoCYdkUdBygJMpZs5fxyEMuZFlPJ/CGw9DYpm24IfL2QsxP/m5cC6BBpKNeUBNH6Za2mt568GAwvb/phYaDwTgbqHEuWWyOQFPI7m86G2M7zObv5uCrJ2QdXL5q7TG+J1h7BHJ/1nbKiwHl/aWV/itaP1iyxIOogH/su/VJb9EQNwOu11N5777fCFEo8H1GJN+RJTEQMYaYqQZy7EZILBpwsLlOGQu7ASv7P9mGnWdoicdQkIZfi14pgoc5C3VP6kQswDswES9iPHkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8461.namprd11.prod.outlook.com (2603:10b6:408:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 06:16:09 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 06:16:09 +0000
Message-ID: <97e62d7a-d6f4-4356-985c-1b605d9d07a1@intel.com>
Date: Fri, 2 Jan 2026 11:45:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Prepare GVT for display modularization
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <54c40d40-f365-49cc-93d0-b40a8db54585@intel.com>
 <803681dce30df69342611e5dd132440e2c94ccc5@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <803681dce30df69342611e5dd132440e2c94ccc5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 0885278c-bf09-4b27-5c6d-08de49c66b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmI1d2wyTkFHY1E5cmlHWGRZTzhNclZaZHpPQUt6N0Q1Nkp4RUhnNlQzclA5?=
 =?utf-8?B?NGdGY004L1pzdmV5OTdzc0FDSXk3b3Jzd3FwSFMrYWk1WS9WdGxvQ3pKVlUv?=
 =?utf-8?B?Z2tzamV2MjBROVE5VCtMNVVwUkhLL0haMDQ2VElacmUwZVVJT0JnWHBHVk5o?=
 =?utf-8?B?MThVOEpzT1pMdTU0d0VNN1RvSWxYQ0xyZVhHenFvWmQ1aHduSXIxNjhIWmFX?=
 =?utf-8?B?OVVaQUVlcnA3U2VISmI0THhxMFlOblF0SjhmT0Y2bzFQTUpYNHVWZk1MdWNo?=
 =?utf-8?B?cjY4U2FlTWF3b3MycVB6N1lUWUNVLzFsL2FwMVI3dkpSRWtVSjI0ZE5YUGEw?=
 =?utf-8?B?K3VKOTRzR2JBemJWWlJoaURhZXd6WFFURC92OHNMcWhtYUxheS9sMGgrUDJH?=
 =?utf-8?B?VTJRTEM5bzRGcmdlTmhQMGFwcnNnNjYyOW40amdvaHhWS25lQjB5ZStSMFh0?=
 =?utf-8?B?aVJyajZHRmt0Z1B6allrNDI4dHYwU08rOE5PRVNvdjFNUElBMzhjZzkvUC9G?=
 =?utf-8?B?VEhsc2xobGUyN3RWaXF2SlJtVFZlQ2huZmFRRGlFWThJekJ2ZmVmdVZwYU9o?=
 =?utf-8?B?VGtoQ0ZTU1NvUUs5dk9FK3hxTzVUNmRCSXROaC9BZFlTUlJDbXkrTkJ2Qkxx?=
 =?utf-8?B?dW5iNUtQcmJvTUJnQ1VSRHNnb2crYzROUjlPN3Y0YjhlemhiOWdVRXR1OVBZ?=
 =?utf-8?B?ZFQzOHVrcURyempsMjl1ckpMcWdXYTR6aHJTY2FpZEphbSs5QXJiRld6UUY3?=
 =?utf-8?B?K1d2WVE2ZzNhcmNPM2tpcnpFcEJxaUpsaFNsVFN0ZWpZL3o1eVMvNEhMeU5j?=
 =?utf-8?B?cmRLTXNRaXpNVkpwUXErT3JXbFNZUitqdkNvcmw2Q3BXM0lSazZqYmVvMkdh?=
 =?utf-8?B?TTJmNll0Tk04ZXl1T2N1OEgzVnBqMzJjYzhCTzhVWXh1eld0aTdLSHRVQU8z?=
 =?utf-8?B?MHlqM214Slpzd3J2UzI2bUtJc1RSMkJvUDNKYkQvNnBBaXptcVRKcTlCRldm?=
 =?utf-8?B?VW9zNkxWYWZUVVZzQmk0cG5QMHkxelVtMG5DMzVONGhBcXFSRVFQNjdZN3Bq?=
 =?utf-8?B?UnBFYzBGRFl3WUtpWGxiRG56d09ES2dqeEhjLytPYTBYK3NtalBUVGNpakds?=
 =?utf-8?B?d3VXU0YzNnJza1BKejBCdEtYZmoxWUJLRExoRVZEU1UvWVllWnJzSnQwQzVF?=
 =?utf-8?B?V3BWWDdPMW43dEJqSlNKWlJ6Y1dLODRzckxnUnR4MGRrK21FbHVPZm4rYjYv?=
 =?utf-8?B?UFVneDZyMHRjc1NCTDBUekMxQXZiRmFhK1VRMEV1VTM0K0NaSGx3WVZxQnA0?=
 =?utf-8?B?eTd2LzZoN05lZW5GckE4Rzk1VnM2NHlSZ0puODBZWGErV0lVbzFwaGlFbkZE?=
 =?utf-8?B?REtJM1pNNjFEZDBlNGNpZjJrNjRkMGdTV2svYkU3QWZxbGtndEVuWmNtbk5N?=
 =?utf-8?B?dUx3TXZOeG9DejBTQWYrRERlby9LNjlzcEtsOGo2WTgxZVNxMTFtSjNuczM3?=
 =?utf-8?B?dE9DTnVZNDNxU1VSSTZhZitjUmtLZVRwVVZ2VWpyb3hYaUlhejBhL0kwejNM?=
 =?utf-8?B?cFJIMWRmVU5VbzR3bkx2YklEemNzL0RhTlBaTGExaUUxci9MYkt0K3BtSXRR?=
 =?utf-8?B?NGxwNjRGYWhpNDlEbWo2TnhZUEhhRnYvakhTMFZCa0NtUUlSOHNyQURHN3ZH?=
 =?utf-8?B?cVlsSkErbjFhMTN0ZkErei9aek1BeE1rcEhUME9PTGZqSHF3TUJualhEL3d2?=
 =?utf-8?B?N285T1RHcGY5WWFoM0dxQVVlV08vamg2WUJ2OEZQVk0xYWRIZTUwcmQ4SXBo?=
 =?utf-8?B?cXlaR3dmckJybllKMWNHeHZKMVJtVTVuNyt2ZGRORk11ZTdDaCt4L1NIV3J2?=
 =?utf-8?B?SjdoYmNpZGlzS1BKNG1ENlZyZnRrNzVpTU1CMTQxbDZ0UWNmanVmVzl3M2ZN?=
 =?utf-8?Q?PhG/kCGqOwKpTB2CbNUK6FqPwC5BZFtq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXVRbzN1Z0NscmpENWVPMmREMWJvRFJycDBQUU9CWElXU0xNY0tVbC9EZExG?=
 =?utf-8?B?UW15aVJycU5wVjlxc3NRVWFOK05aeG8zakFmV1R2M1o5OUplaXJvT0ZFbUpL?=
 =?utf-8?B?UHVMb21DWTFmazZwZC9sSWhETFlscTIyYXpHQms2dkl3VDdhSWt3bCtNTVk5?=
 =?utf-8?B?b3E4WnVqQmZKb3lqU2R6NU85V0JDc1ZXYTB5NkdQOENmazVVOCtabEtDNkFD?=
 =?utf-8?B?SmR3dzMxWXY0L01ydno4bEpQbzFkZEZwdWhiVVRnNUVsbHUvcGk1emdsYU5O?=
 =?utf-8?B?TlBxSlowMGdLMWN3b1hmWW0yQnlMWDRKODRVV0h5UUczekg1RW53djhCa0NK?=
 =?utf-8?B?V0JROURMNjdON3pEWmsrYW5hRzJYSVV4aGVPdEl1QXBmMXlDS010N2htWHNV?=
 =?utf-8?B?V1l6ZTdSNmN2VGFyRlF0ci9aNC9VUjk3Rm5EQmg5Ri9oQmt4dFFSSFQrZlcr?=
 =?utf-8?B?RUdxd05qZXhVdEgrZ2M0UEQvYWkxbTRkQjFKdm4zK0xGSWYzK0hpdGVvbm5n?=
 =?utf-8?B?Z3BsaUM1bmNTaHIwZUwzZ1kyVE5HUloyd0dqMUVRZnVnSy9EcXhCTUp1RHFY?=
 =?utf-8?B?bHpOd0w4bTQ1TUw3Mk1jR0lrc2d1UnM5SUhEa0xRd0Z0UTVHbnV4TVJFck1U?=
 =?utf-8?B?R3RtN25WMnJZOVlLQklRTnBiMVZzai9vSWhwT05jeUpQMkF0UW1TK053eHp3?=
 =?utf-8?B?elY1bXVWaitvbjNFYlhyU1lXOUx4a2hOWVpQOTJYcjhTWEpWWHVXWkJMdUQ0?=
 =?utf-8?B?OUhaZVlmbzlGcGNmY3M2K2ZJTmZJeDdTNWdIdjA0SGt3SlVhRVppRENzVlgx?=
 =?utf-8?B?TnFTRHduOUVKakY5SnlFaGl2RTFEYWxUVWVrVXNUUGZnMDN3Ky96cVVtWHNJ?=
 =?utf-8?B?ZzNySk9FMmdQWElsSDUzTi9CRGV4Tk1ZMHlwSDVJUzcwTk9WWWFLMXdkaWsx?=
 =?utf-8?B?a1E4aVRzejNSRi9PRWQxaFBUVFF4SXpiN1F2RTVodkRMbjhZNWVFU01iMWVh?=
 =?utf-8?B?dGRQRk5sUFdYalNPTXJmalduSXlmMGpzR3FkbnZNWllHREdXUTgrQU13Tm8z?=
 =?utf-8?B?d0FYVEZIZVdwT2JMeGFmK3l5L0h5c1NMRys3QXRSbWNzcTFqYmZha0hRNU92?=
 =?utf-8?B?RTlDcWZnd0VlN21CMXRNd1ZDQW5xcXU3K0RIdEpldlhQR0g2OFIzM1FWOUE5?=
 =?utf-8?B?eWw1QWJuNEJ5SzduczM4RGJ1Rlg0bnhWdUxTS3VyZGZxRkZGK2NDQ04rQ1F1?=
 =?utf-8?B?VnFFcVNFTEZZUlY4TXhYUVZTdU1VL2EzWXRkODNwdm01QkJOVG5VUDhDZzZW?=
 =?utf-8?B?Mk40emJrZkNTQVlGeG5GM3FqTkJndTcrSHhsbURtZGFNdndXZm5yN2o0MG1M?=
 =?utf-8?B?UTUrajd3MjJtalFRU3dLeG4yNmlSUGl6NmZMN25weXFpRTVRS0VTNm01d0tX?=
 =?utf-8?B?QjZ3V3FSZCtiMnMxeWlmQis5M21TWXZRY2x6YWoyRzBQQWtRdlppbUJuZEZQ?=
 =?utf-8?B?RUI3djlCYk9iTkNLZ0Jhd2YzNXRRSTE1Q0ZEVW92SVNEbElCUyt1WkEyMnpP?=
 =?utf-8?B?cENFaGdYY3dvazMranF3bHg0L3haMy91ZU1FVXpraVJGUGJaenRvRXdGNVpr?=
 =?utf-8?B?VDlpNFRuYnlEbzZmSTRjT2VXUE8zYXRUekgyUTdlSlJ6eUJENUl2TnFHV3NG?=
 =?utf-8?B?TXlSV2xxN0pMSVRuZGtTYjZ4b1dpUW16dy9qVDZucXNla3dQb2xvSzR4a0VM?=
 =?utf-8?B?WG52eEpCczVESTY1bkFlVklINFFwb2JGcGZaMFpobEwxOWMrOFVZMkwyZ3Yz?=
 =?utf-8?B?YlJ5VW1UQW1nbE40ek44bzVEaXlucFc2UEtYa01WR2hFYlFNMU9WSHkxeWdX?=
 =?utf-8?B?NmpsOENWU1lxam8xZFNrekhPcHhsa3ZOYjE2eDdKVmFQUldrbHFDcFdyNEFQ?=
 =?utf-8?B?TEYzSm5OZW0xclJCM0tJZmVMbGJzbDZ2TEFWRVhadTVhZEllY0pTQXVBNEgv?=
 =?utf-8?B?NHZQbWVxSUdWbzdWZ3JBMkQ4VWVJVVNIU05maEw5NU56c1VOQ2ZybE9OdDY4?=
 =?utf-8?B?QnVhMzM0SytzcUdCcWFUa1BxcG53K3VPYm1OWUlkelNqWTdha2R4Wk0yeDlO?=
 =?utf-8?B?TzVNTmpKWVZybzU3MHhFbDdlZnpnOTUxT2x4SWNtbm1SbzZDZTMzY2dRNUZJ?=
 =?utf-8?B?SWlKRzdNYWdDUGNlek9DWE52SHc4M1BzdGdTeTg0MEREazRCRHdtWUUvVURH?=
 =?utf-8?B?Zkw2K0l1QzJrSkxMZTl6REkzazUrWUlFUXpGbGNYS2UwRE9ibEVoSW0yRGdL?=
 =?utf-8?B?elNTNWVHSlJib1MzNVJidk5DR0t4aUZXZ2FGMHhsY2ZuVWhLblFWQ05mTFM4?=
 =?utf-8?Q?xQhJxle4uzw3HVB8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0885278c-bf09-4b27-5c6d-08de49c66b40
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 06:16:09.0025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyvYVVwGsQfVcPYkAxzpcTdcASc6emKqp3i79Vv8cNxTJ5m4ef3cHNGjC71Olq4+zXRetTRxlzxsa6WWpzy+41rtWRCCoycNNreNBw+XC/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8461
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


On 12/31/2025 4:05 PM, Jani Nikula wrote:
> On Mon, 29 Dec 2025, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
>> PS: Fixed the SPDX license identifier styling for the header files (and
>> the checkpatch warnings due to these), before pushing.
> Did you checkpatch the changes? Usually the style is to have the SPDX
> identifier in a comment of its own, not combined with whatever follows:
>
> /* SPDX-License-Identifier: MIT */


Hi Jani,

I did run checkpatch before pushing the changes.

With the original version of the patch, checkpatch was throwing the 
warning, but after this change it didn't.

You are absolutely right though. I misinterpreted the license rules [1] 
and assumed that Copyright line was part of the <SPDX License 
Expression>, which I can see is clearly wrong, based on the next point 
in the following section `Syntax`.

I will send patches to fix these, and will make sure to follow the 
correct style going forward.

In the new year I intend not to repeat older mistakes (but may be to 
make new ones :)).

Wish you a Happy New Year!


[1] https://www.kernel.org/doc/html/v6.9/process/license-rules.html

>
> BR,
> Jani.
>
>
