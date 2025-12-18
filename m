Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE30CCBB96
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 13:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FECD10EEAF;
	Thu, 18 Dec 2025 12:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilq2kYXn";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAC410E411;
 Thu, 18 Dec 2025 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059638; x=1797595638;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/QMRoJdE16QSpb7NruQwe2F6rfOIh7bkklmSs+92oes=;
 b=ilq2kYXnA8NIQhYrYhUmdGL0ofao5MkJDtqIEv9e1i8p4jxTaX9vdQ75
 FnwpTNdjJ5DBvfA/ypvEj7p0KGQ3C5CUPGlDXtAbilY9X/VYN1xkM6w/h
 S5FtQQUEis57iSiPXpI5qLRRoOqHv5CkbUM1IWnYdxoKKHIgib34sYj29
 qczMamB9yRg8xnhwh5EcJ2z03rhCW+CZLTOJSTfiTU/aBiZBQUFg3tdUV
 +qdQrlwSoCBwpMkqkUKR2NdMF0N0Wh8/PCWPfmQeQPjSSiDzIrFNVFHtT
 kXr00Y7L8pPo5Skhdpt/Km03hYuffpW+5zuj1FtTCabSbclWyVOTO8AOY Q==;
X-CSE-ConnectionGUID: supiAoFNR/OJcvex6jMvAw==
X-CSE-MsgGUID: XzeQJ/ShQWSR4DyAeul81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68050719"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68050719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:07:09 -0800
X-CSE-ConnectionGUID: RQEf4I98QS+G/5nDpdTfHw==
X-CSE-MsgGUID: Bx9hD+pKTF2BrwoiDVB7Tg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:07:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:07:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 04:07:08 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:07:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYIIHXFf3uasU/a/E5xGvyW8bGjlvONt3S2QMRLIgzlyhYa4UZvdt00KJJV8GqcczlwhWWwQ+HRmx5psav4FnF9yAbWALuFqRWwcsKkNyknKDwy612/RsDVrRLq07BTRvX3HA3L/dx+9c9H/0szZbv+lHSIrEjrwM/+n1kEeVK4X6OvfOqAE+dS6S8YpTDa8q9GiyArsQuqaSCkpbKSjvf3yBNSjmEQUU4NU/X1YcKRdXhvNc4OimJ1/JpIiVvggAYHx7WIT883Dam66nPKcVBIKnBs1W6f8FD1gD7j8ke+89V6UQKmXwDOSuqrx9bip4JOMlYn4wlElMRXWbe/AYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dekUIlTvP03yB1P/H8TFmDYFthM3CgRByQFZhhM2cyA=;
 b=wMQVZF5iW+tj7ZGmSNsN3vACVpVRgTD1jqEdnouoi6v0u8H/4F2b6Fjbxs2ZEZ96P3ywzoX2vH/ycwUu16EQJi6fMgXbrR8ejipTjnRxafkn9KfIVZXfalSs47rX1f70lRaRNrkliIG61PYdwV7ZYs+G5yCvrq8V7Y+QaxH4128HoS4jeXvuTHxa6HX2SxmuLdegy5KsDPt+ghCYgqynzwX8DfrPyZjxyeT/58BErTSB9rKS5VtXRuxoSjZ/Mhq7ZehL1kImzTnm4/GQkhlyDHLZ6tsIT0sCIRhzaPwYsOL1xnK6CJn8AWcgUgWF/SUSA/SjR/SmrK6zsysHGxG14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:07:01 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:07:01 +0000
Message-ID: <4bafc33c-dae3-4861-acf4-86aa38ee9e80@intel.com>
Date: Thu, 18 Dec 2025 17:36:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/i915/gvt/display_helpers: Cast argument to enum
 pipe for pipe-offset macro
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-5-ankit.k.nautiyal@intel.com>
 <db0cedb60c1b9a32f0412efb97ca34e7870e1f71@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <db0cedb60c1b9a32f0412efb97ca34e7870e1f71@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 94eab4b0-87dd-4f45-c5a5-08de3e2df31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1ZXRzA5QncwUkg2c2FVQVA5bm9KcFlPd1BwVllnWFZaNlpUTWdvMkJnTkdj?=
 =?utf-8?B?cUowYjRvRjFJNnltZTRUdTVHbVFRSzJkUitBdzdvV0xTSW1ibUd4YmQwMU1T?=
 =?utf-8?B?cytvWS91RENGbTlwWXhJSUdUZVZEandUdUlSbDl4SkZYcC93Tkkzbm5jSjZU?=
 =?utf-8?B?MFpicWpxQTY3Qk4xZG1EVWpkemJWczlObjRYeWcrSTdKYVZDYjg0Q1RSS0FL?=
 =?utf-8?B?MUdqOWhLY1l6RFdpb3NjRmRuL0hScmlrdmtJYnlHRVZ3QUNEamNHM09wTXV1?=
 =?utf-8?B?d3ZudEJzN1p2MGU4a2V2b3BQZzlaRTJOeEE3TUlxajVFVXUxVVpod3V4SlY2?=
 =?utf-8?B?bFRrbFU2b1g1eXdzUE5pcEtoaEwvVXRrbGI5RGxtMUJuOGV0VEtSLzFPVS9G?=
 =?utf-8?B?Z0hGTmlCRlMrUjNNZm5MY2k0MnJiZmdEekpEUjNiVitkOXI5RzExZHQ3Z1NT?=
 =?utf-8?B?Si9PY0V4VGVyQkNHVTA2RGVQWTU0VFozSmIreXlDaE5LZ1lmRkhYMXA2V0JD?=
 =?utf-8?B?bDhnWG0rK3kydU1kcHhubzhtZEU0N0IySldnNmZEaUMvOGdRRzNscm9mK2pl?=
 =?utf-8?B?bElWZGF1M3BKUE5IM1Z3UEhKeTJabUdSVzdBSjBXbXlaUFY1azl5VXFDRytJ?=
 =?utf-8?B?ZlRjc3ZxWkZjcVZQQ3N6RDBpWFpoYUttN0VTOU40emhSaFphbWtxaS9vVWN3?=
 =?utf-8?B?MGs1NHNUdmRpZTQ3a3N4ellYNU5JMUVFMHgra3I0aGQ2bDhPS1BDM1RlODVZ?=
 =?utf-8?B?clM3ejBpcU5PclA0UHVnbFVrc1F3ZkpzSTJ3Rjh1V0tyaDNqalpldk1rd0xl?=
 =?utf-8?B?SlJ3YmIyR3QxT1BIK2UvRFg0ZlZ2d2NNQWhLcjdlN2l2Tm1qK3RjSDFpRUxI?=
 =?utf-8?B?TVR3MlJyMEtqcjljdXZ1Rk41VWl6a3oxMjhkcWsrQzNacGlvc3Bsemlhbysy?=
 =?utf-8?B?UWdlVk9CVVk2bFI5QmNaYU50S2dZZ2pUZ2x1SnI0cGlXUmUxNGNxTTk4U2hi?=
 =?utf-8?B?VFJHUDNTYW1STUh0NEczenpVWVdtdVcydjhRTGZkSnFGaVZYdytHbXBwY21R?=
 =?utf-8?B?YllQOVk4ZEV5dXFLZjBrSUczdVBQUHZKalRoM09MajFPUzVMdEpQNnhmdU5y?=
 =?utf-8?B?R0lSdFdydFptSUxVTUNha1g2VnFxMFg3QkxzMkRqN2lvTVRkdTFCdUZSdCtG?=
 =?utf-8?B?UitrbENXNlB0MkUwNXg3djZZMDk2UHVCVkUwbVFVT1dnK01jNERKMG9YK1Rp?=
 =?utf-8?B?S2VnTEJWeGZKL0JUVEFZZ0s3QlphNm96SzhUTDhvTFI4Mnp6Mkh6akYxT3hP?=
 =?utf-8?B?cU9JTDZBZE5tcEloT0JMUXAzQkh5NlhiT2UyMWt0b1pYNEdNL09Tb1RMZEJK?=
 =?utf-8?B?VGFodnRpZ0ZaUThqa1FhamErS2daSm9YbEVQZ0lMT2tjdnVabkJNYk5VQ041?=
 =?utf-8?B?cTFiNmUyZGZrRFlWaGJSbk9YMis4VktTRWdtcXA2d3JIT3IrY2Y5R1dzZmhr?=
 =?utf-8?B?V3JNb0l4eDA5c21laU5jYzF2VGhndGd3ZWxIL3kxdDBkd3NzN3I0ajRzSXJX?=
 =?utf-8?B?d1BmcEZFWnVENjlqRmZMRXgrTy9RVFpLMUFFZFpCNHczNDk1SlA0bzlUNExI?=
 =?utf-8?B?WTErd3NPZDJ3RDNEMnM4T1YxOGxMbkpySkJqaGF0VDFWUzZwdktYREp3Wkts?=
 =?utf-8?B?eStZNm9mSHhQNGEzTy81Q1N3aWdYVHhVOFg3YWkzQWtKNm9KV2k3eDlEYWJP?=
 =?utf-8?B?Q1BPWkdRdFdwRGdNYkEwcUNtd1hNZC9tWVZPSHZpYkNVR0xLVnJtR0NrWitj?=
 =?utf-8?B?bFVObXB1ZHBDSVQ1Y3o3UEp0STlrc3VSSnM1R1RjbHpNM1pJTVRoZk8yb0Ez?=
 =?utf-8?B?K0hvRkxNTGI3YUxBRDAxNmlTT0hTbi9NNi9ocjRFUnUvb2piN1dGSVBOQUg1?=
 =?utf-8?Q?AjwXCnbl5Y28uH4NumKsZ61ROKUs2rTo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVkS01Hb1FFOUw5b1BHTWVQN1FTWDgwWHNrSkxPL1JaQ3pvUlJRcHhBYXV1?=
 =?utf-8?B?NTZzUHFMc2dITUVPQ1d0cE1TY2V3TWFnNlI1c0ZCWCttNmdUU0xzdUNNbXQx?=
 =?utf-8?B?WTZiMjJKTzdnRzNiU2NXWi9qR3RvelRMQzA0NmNJcW85ZVJlTkNJenY1NHdq?=
 =?utf-8?B?TmxGckV3TnA3TUhEUFM3TWVKbGRPVDJsczdPR2VpUWltRWdOZFNFN1BXd2xM?=
 =?utf-8?B?eFltMElGK0NWUUZIR1NKVmN6ajJPWkZiQ3FQSzRDNXFnbkErK1RUZEZnQ3Ry?=
 =?utf-8?B?dHZxZXp4a1pBUDdxdEV5Y3cyMmIxallRNU9nYW0zZzV5alRDN1dLTUlCRXBR?=
 =?utf-8?B?dmVnNFdlWlBXc3ZQd094elphd251Y090U0MvL2tZMDdJVWlDNndHQ3k2OHVm?=
 =?utf-8?B?U0I4UGtFcE9EaExZeThqaXY0RVhwQ01CeFNHWTQ0eGgxdmEvd0dYUzFwZzgv?=
 =?utf-8?B?T1MwbnZIVDZ4MUQ1TjdIdXNlczdoSUtTemNiRGRyV2U1MTZMSXRXOFhXMWtX?=
 =?utf-8?B?TlJuckl0YjZ0T3Bna2JZQTdickVIZ203aS8xQjdsaW5FbmUwU1NJZkh0blVB?=
 =?utf-8?B?MXZvY0FWY3pJVlRnblp4ZnZsSHhsV2VWd2p5akxHZ1ArS0QwMFBJWnk5OGJm?=
 =?utf-8?B?MFJycFJ1ZkR5UWkrZVlRQUFHM0R3MXlRNlkvL3hTNEtzTEtNa1E1SlFncXJa?=
 =?utf-8?B?MG9DcXkvS2duNnp2cytPcDlRUTMvcGkrV2dNOGZLTVZSUG1iODR6d2J1YmNz?=
 =?utf-8?B?OHVUOXhFUlA3UEtsMmp5VHVQZ25ITkxISXJwM2FyTzllckdtV3BBTE94Nzda?=
 =?utf-8?B?YmpLMHhRa2kyUkNKUllXcURKNCtXdW8rdko3ZDVJNTEyMDF3dEVrazJ4Q2g3?=
 =?utf-8?B?azg2S1dXMDhBd0FnNWtxTWt4OS9LLzNPaGpOMFIzRmxnNFZKdGlPY0pFb2Ru?=
 =?utf-8?B?TGptWkt4d0pFN2VBNU5zVXZaczdQVSt2ZmMxaW5hRTZhUnU4eEJ3cnU5ZnlL?=
 =?utf-8?B?TmRSY3NyMnpKaktrM2tmMXpsem1WWVcrSHNlRVY3U3pNSmhWZnViTFRhVldI?=
 =?utf-8?B?VHFDT1ZKMEJwMEk3Qktla0RicmlrT3V1clNjUHRTSnFOeDMyZTVHRXVHMFQy?=
 =?utf-8?B?MUsrRVFKY1R2a3A2bFcyTXpIODZPYUNZazVZdW45azdyd0lTNmk5SWo5VDdh?=
 =?utf-8?B?dzQ5Q1RDSUdXamk2bmwvMkNnMDdHTTlTbiszMHdZUDFodDFSNTByeUVXcGVT?=
 =?utf-8?B?Zms1TGJGOWJUcW04TS9sWnA1OGVxMWpTZXFvY2J2b2JBczdWbzN5ME9EZmVh?=
 =?utf-8?B?dWJuUSt4VlZ0dm1nM3Y3SGpaQUt6WUNodG1KSktub1ZhU1VLaGJFNnR4dTd3?=
 =?utf-8?B?WlpsMUJUVmFHcGg4RU94L0x6UTNXV0tBVEFrRy9GSzFxQmZHczFqZ1NjZXdZ?=
 =?utf-8?B?eUoxMndodHd0MExIY1FPN3ozSjUvcXc0ck0yMFBrRk9aTWwzTEtoZm9oaTYv?=
 =?utf-8?B?RlJuNXc0dmt3VmZ1eU05MnlpemRtTW5WZGMyTjRHaXBoc09tcTF5SGtQR3k4?=
 =?utf-8?B?KzVIZS9qQ3JmRnJMWVhwV0c1dmpXOVhhaHZobEFLdlJ4S2FpRlkyRnMrM2t5?=
 =?utf-8?B?bGdieWFwelBwOFdwVmdkTWVLRTRvRXV6OEpOamF3UG1FTlNKa25HM1NwVWxX?=
 =?utf-8?B?RlFta1d5L3lUVE5iVWxZaGdtaTRrV0VLWVZnWlZrTFd4N0tLRlk2dDRGNXNW?=
 =?utf-8?B?dE9zaHRVWUxMQ20vS1dMdmdnM1RnOXA0WjVsM0lBVHB1MEFWMFRlN282WlAx?=
 =?utf-8?B?ZVJJNlUzQ0pmbG1oZTlRbDlFT0RBd2dub0NUSmdHcE9jT3RKUThhVEJlcVh2?=
 =?utf-8?B?R1Y1dlFQRExrbGl4a0JJbm8yeFhjRk53MWF0b0h0SXdjNnRQaWFEUm1wTnl0?=
 =?utf-8?B?empCTS9odDVOUVpaa09qYnZZTmI2RDlGcS9penZOTlFYZDJSR3pzTjF2NkFB?=
 =?utf-8?B?SmZxU0ZUSWR6cTFneklYTzFlNmU2Vm9hT2huZm8ycE5XaXZjRExtMXJtQ1kv?=
 =?utf-8?B?ZFo3M2drcHlzZ2laWGMvYURCc3FWY2lkUjNmaWdReWJGQkZScTE1aDJ1dSs4?=
 =?utf-8?B?bURBMkN1WGpuT2lMekRabm5tbFhOUUg5UkhDT1JZbmwySlZXUUZuT3kzMWRH?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94eab4b0-87dd-4f45-c5a5-08de3e2df31f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:07:01.0084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eXxUwKJyH9i1mls7vgJN3VsIdJbo3bq1OwI5oLbvNbhAh1S/M4uvMN3aEVT9Y8qRWkpFfTQGUuY4TeDFEweGYycvQMW+wel+zkZsLOmDFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
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


On 12/18/2025 3:55 PM, Jani Nikula wrote:
> On Thu, 18 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> TRANSCONF() expands via _MMIO_PIPE2, i.e., it uses pipe-based addressing.
>> In GVT, some call sites pass an enum transcoder to TRANSCONF(), which now
>> routes through INTEL_DISPLAY_DEVICE_PIPE_OFFSET() and ultimately calls
>> intel_display_device_pipe_offset(), whose parameter type is enum pipe.
>>
>> This results in -Werror=enum-conversion.
> And that's really why this should be squashed to the previous patch,
> with explanation in the commit message, as otherwise the previous one
> fails to build.
>
> I don't know, maybe could also add a FIXME comment about the cast?
> *shrug*

Alright, will add a fix me and merge this with the previous patch.

Regards,

Ankit

>
> BR,
> Jani.
>
>> To address this, cast the index to enum pipe in the GVT-side macro
>> override.
>>
>> This works for all cases as TRANSCODER_{A,B,C,D} all have 1:1 mapping to
>> PIPE_{A,B,C,D} except for TRANSCODER_EDP.
>>
>> There is one place which uses TRANSCONF() with TRANSCODER_EDP, which
>> appears to be incorrect. In any case, the cast preserves the previous
>> behaviour.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/display_helpers.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> index 97ebc92768fc..3af878e3d78e 100644
>> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
>> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> @@ -17,8 +17,8 @@
>>   #ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
>>   #undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
>>   #endif
>> -#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
>> -	intel_display_device_pipe_offset((display), (pipe))
>> +#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, idx) \
>> +	intel_display_device_pipe_offset((display), (enum pipe)(idx))
>>   
>>   #ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
>>   #undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
