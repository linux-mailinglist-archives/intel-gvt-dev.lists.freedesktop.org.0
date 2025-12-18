Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61FCCBB81
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 13:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4A010EEBD;
	Thu, 18 Dec 2025 12:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jf5SqoO2";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4A10EEAF;
 Thu, 18 Dec 2025 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059523; x=1797595523;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ae7pq/3ggoQ9BtUam/E6D1ZRQgGpu79n8X/m6wdZoLY=;
 b=jf5SqoO2/uq/AfatOdzwDV1n91ut5ZbPFDQgOQRc22+1HKXxIs6S2u3U
 k4V1EjowkZaJQokiW6i+MheFdRsMKhfkyX+FqWIcsollTO3spmKILxh2o
 RmmvIeX3YPVWo9iYgihRqBXSjl0BgXZO2mCx1T9aRS6tGMznO9KGeeJHr
 DlxNGgVI3Dm4/NkHEqg0FcYDdtgQvMRZvqYuEMy570JtLj7Cct6LWBqVi
 3X4hMoXfH2hkY2iLlHJm3Y0B037a3RYtCHRKm/wKMKhO9xei8AEb7BBNw
 A56aKQcO2+1+Lqj9j6RXX5JTN6LpB1MDWvOYp8y+UTxDmzoB/WqtqiXdV w==;
X-CSE-ConnectionGUID: SkoxZso9QdW/ZyE2mVx1Zg==
X-CSE-MsgGUID: FiejgMZ7S3OyyfXcM3ozGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68165347"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68165347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:05:22 -0800
X-CSE-ConnectionGUID: vfAyqcsTQUaBHyFSiKVZFA==
X-CSE-MsgGUID: SzCMxju+Q2CyIle2qxHALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="229626593"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:05:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:05:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 04:05:21 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:05:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0tXbuPqS07oNvnFvl+63rWXVEAC/zQWTTIGJmJ2WL37cUHLVrCVDOahFbxhj+43SLtXe6nse0mODUTdT+7UdO2BfmCe7peV+hZir95/B5nNMiihoAZxGE0/fpsMzfkBcfoHI+eWJSzuCD9ZA16PRP0Ppyt+XzlDAH02ZENsDhLUdL0x3YzFfoCspuHDyf1NazqigxyLDPneYEzBqpH70eLw6ihsA7eVC8SY1ubuu8gGka3nXk6oXKOxLIAoBeaYjrCeU/+XoypoMWmGBSkjIYPhAKNRY3JTFTOb/p7Gu2Dmo3MOGL4jnmzpDGUvgQ0jLTl8UOUwnBeBiUSn/1BhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DEzFz6iGjM3TKXH43ix4AiXZw1f2Q+3Qsb9lh9B8Y4=;
 b=kwdSpXRtfFzwHssdzGD1jW9e//cyK6f5uRm4CSeIJpZN5fREMaT9qfSnAvwPY+6+fZGEOT5Cq1l8qDMpReHGwTkgBgQxJldk6c7aEnEVOK3kKfLNIcneyG2qa/3Lj9GwRcT0WytCqSPLThBNYxWMNRAgIBZ9Irn+ouNkB000WFR8wKk8ocYallaeB7whUp2184S1xe6Jrb5fDYF2EhLHfhrHMaO8FsB8ua6YUhhWYM3PTVfUZpw0fOeTf6zGd6sZX1TBF4h2GqHXb2odi9nKQBnA3HkYLVeFM0poS5gaCt3yN4bdQ6mOi2tVlO3Xqx780nuvMvJy0YHfxZZlm4gUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:05:19 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:05:19 +0000
Message-ID: <b43f513c-b5fc-4b3a-8ba5-6bab4e956540@intel.com>
Date: Thu, 18 Dec 2025 17:35:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Prepare GVT for display modularization
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <aec7910187fc14d556af6fb84c4b9e6a43575f37@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aec7910187fc14d556af6fb84c4b9e6a43575f37@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a769ba-1bf7-4ceb-1dd3-08de3e2db673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aU93dUU2ZHo5Rm5GeWQ0OFRDc0FFbUwrTDNXZXU4dEtEZEt4N0l4M094NVRu?=
 =?utf-8?B?U2k5NjY5RVVUVDBNWjJ1K1lEU2pXUVhjRkN0MG5iQTRVQ3l4MWtHNGlVVGpT?=
 =?utf-8?B?dGFKTEliMVg2U085d1p6b25kRGw1SEM1QXkyNmMyTDZJcDZqeU9aaEFyQWNk?=
 =?utf-8?B?RmIrOTdkUDV4V2IwWDBGNVZuYXErKzZGODEyWWc5RzhCQmFPcFdxWTdrQzRi?=
 =?utf-8?B?ZGh4ZjF1M3FHOXptemROQmdMb0FoTGI5RUN0bWFSblJzaGI3bXJxSXpRZW5E?=
 =?utf-8?B?MlFMY3l6WE1PK0hPUEhqSWo4aDhIbXhXL0JKNDlpSVFwWVFGRUFUU1Y4KzU3?=
 =?utf-8?B?ZTRzL1N3L3VsaG9LL0x3UGdMUUZ0bzZ0N3ozdy9kOEFrdVJFT3RERGFkeUV1?=
 =?utf-8?B?RGYyYUlLdFRMNll0MWczM0ZBVlV4SnFaaGxGM0Q2bGhmV0pIU1JmeVZpbE1F?=
 =?utf-8?B?b0w5bmo3eWZDV2l2Vk1FbTRKcGVLaHNUUEc0Y3RqaitNSkFaaUZIYUZ6eFRa?=
 =?utf-8?B?aUl1ZEI5YkhXZFdZZGFSRHFCelhCRklQTWlQS0FDbVE3bFRnT1E3QVhFa3Fv?=
 =?utf-8?B?MHpNTDBhMnQ5dzE5SGhEUmJKQVMvbVZjZU1jRndSUytiSFR6MjdJTC9BRVFr?=
 =?utf-8?B?WnNydnBQVmlBZ0F0N3lxMGIwaGFwemN0VzJsQVpHNFBrR0NDVFQzdTRocUxJ?=
 =?utf-8?B?RkNDM3d2UG1iVjIwS3hURFZDRys4ZklMN0E1TmJ5RURjbm5iMjZnVm83OFND?=
 =?utf-8?B?Q3EwMElQVjQ4STBjVGdaMWtNdGpWaVE0SFo3Mno2ZUg2dWl2TFAzKzRQU2V2?=
 =?utf-8?B?bFFvOTlnWFlqemc2cmk4SjlsUzYzUTZ6SmluUTliKzh1YzdlYzBqMFp6V2ZS?=
 =?utf-8?B?Y3FhSTRmcElnOW4yNzJjQmZIV0lBNVpiNXJYM1pBRVJVS2JVRzBJdVV0S2cw?=
 =?utf-8?B?Wkp4YzJMZjFQRGd6bWVmejd4eEVqZndKaG54bFR4NDZjVm9qWHg5dVkzY1Nz?=
 =?utf-8?B?YmVFNnpnWmlWRFBXMElHak5Xb09HR1g3Sy92VlJ1R2FMbmhRVGtjU0JzVi95?=
 =?utf-8?B?eW11OU5wS2dEYjQzVUpCdWFrOFp4MFIvY0JGOExJd1VhTm1hNUFWOU5iZVZz?=
 =?utf-8?B?WVZidzV4NytDME8yM1ZkdVhycEdVOXBZZ3F0VXhjbWd1dUtIeG1kUnFuSkRE?=
 =?utf-8?B?aXNYQWtGZ25BS25HRUNNTUx3NFhMbTlUNjlLTGlTUnU1Umh3cG5lZnA1R25t?=
 =?utf-8?B?a2cwdHArcGRIWlFHQkRPeHU2azlhUjdrM3hXTXNrc05MeENrdFR2Q3BONVVS?=
 =?utf-8?B?VEZNU1BkR3dldzhPcXd1ZHc3NHd1KzVtYTlxWmRCUHN6QklFUjRoYkNVRGhG?=
 =?utf-8?B?aEJpNkw5bmt3eXZHdjhEQUxlM3hVdmdYR09SaVRhMzlwN1VnaUFTL2RMU080?=
 =?utf-8?B?VGNkMVZucTlzWFY5RVJPdTZ0UmFIWmN5NVhxa21HWW1KNVFKelZ1MjZoUHV5?=
 =?utf-8?B?UERDbnRaemUxM2Y1R01yK2IvM0tDSVhyZ01wdG1sME5SSzNJalpNTko4NXRz?=
 =?utf-8?B?RFBUR0ppUXR0YUcxZzlMZk84V24veXZYVnJFTUQxT1J0K0lPTUhoSVluYnpk?=
 =?utf-8?B?RkNzMURyWW5vbi9zZkhHWjZ2bkVrMGFhTkxSMDZ1SWF5K01UR00raElDTWEr?=
 =?utf-8?B?OHBETWk2eHZEZS9Xb1gzazhRYjJZLzYwRG5ER3BqMzNidGc2dnVVcUJqZWVX?=
 =?utf-8?B?aVJkNkJJUENaZjMyV3hCZHNMbEFHMWNQdzNPcjJBQ0pDbEExeFBLeXJRSm5m?=
 =?utf-8?B?ZFRjNEpnUWRleWZVd0NhTXNCanBBcVN4dnBPb0ZhcXZGeWx1d29meis5eWxM?=
 =?utf-8?B?UnhzU2piZERFZzdvVUJFd1lSZ0xvRlltd3QrR2NxZy9mcnFUWllERnNPWVFP?=
 =?utf-8?Q?rgKUiU8hU9z0/HITabw2Zhj2SRQN4CKE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTBNa0FDUDRSUW1wdm1kR0d0d05aZzF6TjVWVUx6UlJSbjE4a1U4NktsamVa?=
 =?utf-8?B?ai85UWtqRGNPS0psYkYzVVJwQWhVNkE0bWxZU1RGTXBpK1ZwQmIrTTRaVEtu?=
 =?utf-8?B?OHBSZ0VpUlpCWks3WGVQc1E3T2ZoYWZoTFgxZHU1MXk3eVEvM0dtaFlMNHRa?=
 =?utf-8?B?bFRLWkNFTlhyenRiWUUvVzdrMVpCNG1GZTNpMFhSY3JvcGp5UldoTmFOSUM2?=
 =?utf-8?B?VFU1QUdSQVNkVHRuMURpS3ZZekxFbVU1ckFMYmppRktrUTF5REg1aG5UbnJx?=
 =?utf-8?B?VmhIaUl2Y29NbkJkUkdDZFppL2I1dEMzajFxRUs2WFFIdFVnTW5rRlh4SDE5?=
 =?utf-8?B?dWtTcVBuNWhnSWVmRlNhVGxuZzE1enlCbWJWMHlsajlIZm1LUXE1Um1udDhY?=
 =?utf-8?B?SEZQamRSMEVMV3hEY0ZrVUcrUWJ5V0w3aFdCQ1NJclZBdnlBa0N3T0c5cmdh?=
 =?utf-8?B?ZzJJcFlTbHhGamlsZ1FremRRdFVyNVg2U2E4bXpISEthUzNlQmxXV1dmT1Yz?=
 =?utf-8?B?T1ZmU0VpM0Yrc2Z0OU5SWGtQd3VrZ3NRUlUwMmg2OTF2RGZCOXRPQkt4MGpr?=
 =?utf-8?B?b2x5NktXQTZnUGxZdmZQN1BlbU9aRHUyemRmNFNpR3ZhRmNKaENaaEduMnk4?=
 =?utf-8?B?cU9kejA2ek03OVFiaSsreHNRd0lUZ0pORExubW03RzRiME0zVkptVTBSVjhw?=
 =?utf-8?B?M2kvNktwMitubFhWdkJhVVhaWklQUE9PdzFGY0NnbW9LNHovaURQYjVMaVdo?=
 =?utf-8?B?eFlJcGdPUFVucXQvbWVVTEJlcnNIc1h4VkFIaHhZRXZsaG1KZGFKQ0R1MDY0?=
 =?utf-8?B?ZkoxcG9oUE5UbTF1NDlaNjRKODJHbXZXMWFUVjYvS2VjNG5FTzc2S09uMEtN?=
 =?utf-8?B?L3VDaE5DUjRFaFlCRElkUDZ6bEUza00zVXA4NVUwSVYyd0tJUVBVWmVObFcy?=
 =?utf-8?B?L1lML1dnK0lLbTEzUnpOZk9PWTRoZkNoa2RJSjZha1UwY0UwRnBHOGNuUDFO?=
 =?utf-8?B?MncrdU0xaWEyRnl1eER2SDhZSTRQZS9QT0tlQnRSbEllWHFYUFpDYXdPb2M1?=
 =?utf-8?B?TDFhRC9hYXczd25qZWE1YWdIcHRnWjFlcHhNQ3JLVXFqM2N2Q3YzRGRkSEdj?=
 =?utf-8?B?UHVJOGZIL3FIZE9obUUwT1Q3WDk2WFE0Wm05QzU5YW9ZQkhGSHpCdUxnL0dW?=
 =?utf-8?B?Ri9semR6dENtQmlhWTZMdlFwbGNJc0xMWlliNGRkQWk3YytsMitYMmVLQVVL?=
 =?utf-8?B?MElqVUVyOENmK3FkcnFEVVdqK1JTUDg4Z3lIVStPQTdsSGVibGxpTko5WFA1?=
 =?utf-8?B?QnVKMTBlcDJDdmxmV2hGU05MblJHNUpkcENCTHl5SjR5K1NtZnVnZlV5Y1Ay?=
 =?utf-8?B?NnNkZkVlQytGcldpYlRnMDZmek5JWGZ0S0UvNnk4RkpaYXMra1V5UjZDRHpD?=
 =?utf-8?B?ZHY1aVhxVVROQUxWaXFzQlpxWU54MElHSkNvUXZOM0x5Wk5ZYTVsTnkzN2Nu?=
 =?utf-8?B?TmdKUm5rMVBkQzBrUFV2L3ZTTmJJS3pSemU4UVJSRk81d0xORGhWUGp5RG9M?=
 =?utf-8?B?VEVmQTRZTDhNcEUyRmdNVllONFI4OVIwRjd0RG5MOU12K0pHUVRWNGFlQTIz?=
 =?utf-8?B?bXk2TUZSQ2xRdjhOdnZzT29TZm44VG8vM3E4V2h0bWcyWVorRk51eWQ3NTZJ?=
 =?utf-8?B?VXh1VjJGWDB3dnltNjNTK2JsTHhQK3JGdWY2elptWUkzbWxoTU9NNkYyV0NK?=
 =?utf-8?B?NVIwUitLSUZZUS9BTlM4dm5kb09VYjdBSE4xMUc0SytXN0c2R2IwcCtWZ3BK?=
 =?utf-8?B?NmtseDNzckFMUzdBQlU1Q3N0bjIvQkF6aERVSEo2MkhXbWs2Mm05c3FFQ1Bl?=
 =?utf-8?B?WjdnVFNSWnlDdjd2NWFTazdaV1ErVkd2Y2RqV3RHUUVBeUFFZHVSR3hnUWIr?=
 =?utf-8?B?VndjRk9KTHM2aVl6U05LQ0RGaVk5UXc5ejJ3eW1Rd1QxdVhXdXRrOXBFR3ox?=
 =?utf-8?B?TnRRMVFhNGdDVTVRaGZJYWhTQzNSMWMreTg4OTVGVSs0Rkd4WitVOFJwTVIx?=
 =?utf-8?B?NEtWcFRkZldHTHdwUTZBZHo2QmRxT0dSd2lOUHJ1Q3VCc3J5emxqWmpHZXR3?=
 =?utf-8?B?bU5mZFBONFgrYlA3ZWdLMlhsZXhPMXZLaStram51ZzZPVDQrYzk1aSszSEth?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a769ba-1bf7-4ceb-1dd3-08de3e2db673
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:05:19.2199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGmoH4U3jfxCz3fq7uwjy5N2QUwHrdT1BSVJwPy/Vliw/qW/7qfVZEbKOT7GotEYgwe6giPj9oid8AHcNFksBYq7wucqSA9PLq3o8eGw4PA=
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


On 12/18/2025 4:27 PM, Jani Nikula wrote:
> On Thu, 18 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> GVT currently relies on display internals through register macros and
>> helpers like for_each_pipe(). This tight coupling makes modularization
>> difficult because GVT should not access struct intel_display directly.
>> Add an API for GVT code to expose DISPLAY_RUNTIME_INFO()->pipe_mask.
>> This series introduces changes to make GVT independent of display internals
>> while keeping existing macros usable:
>>
>> - Abstract offset calculations in display using
>>    INTEL_DISPLAY_DEVICE_*_OFFSET() macros.
>> - Add APIs for GVT to compute offsets and pipe mask via functions.
>> - Update GVT to use these APIs by overriding helper macros and
>>    for_each_pipe().
> Oh, this doesn't handle intel_gvt_mmio_table.c, which is part of i915.
>
> That can be a follow-up, I guess, but still needs to be addressed.

Ohh yeah, I had looked into it earlier, but completely missed it after I 
returned from my leave.

Will look into that after this series.

Regards,

Ankit

> BR,
> Jani.
>
>> Rev2:
>> - Remove conflicting headers and get rid of #ifdefs/#undefs in last
>>    patch.
>> - Wrap macro arguments in paranthesis.
>> - Rename for_each_pipe to gvt_for_each_pipe.
>>
>> PS: I have not yet addressed the question about whether we need to start
>>      using _MMIO_TRANS2() instead of_MMIO_PIPE2() in TRANSCONF() macro.
>>      That likely needs a separate patch and discussion.
>>      For now, I have kept the patch#4 to deal with the
>>      -Werror=enum-conversion:
>>       - drm/i915/gvt/display_helpers: Cast argument to enum pipe for
>>         pipe-offset macro
>>
>> Ankit Nautiyal (7):
>>    drm/i915/display: Abstract pipe/trans/cursor offset calculation
>>    drm/i915/display: Add APIs to be used by gvt to get the register
>>      offsets
>>    drm/i915/gvt: Add header to use display offset functions in macros
>>    drm/i915/gvt/display_helpers: Cast argument to enum pipe for
>>      pipe-offset macro
>>    drm/i915/gvt: Change for_each_pipe to use pipe_valid API
>>    drm/i915/gvt: Use the appropriate header for the DPLL macro
>>    drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
>>
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   .../drm/i915/display/intel_display_device.h   | 17 +++++++
>>   .../drm/i915/display/intel_display_limits.c   |  0
>>   .../drm/i915/display/intel_display_reg_defs.h | 15 ++-----
>>   drivers/gpu/drm/i915/display/intel_gvt_api.c  | 45 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_gvt_api.h  | 21 +++++++++
>>   drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +-
>>   drivers/gpu/drm/i915/gvt/display.c            |  9 ++--
>>   drivers/gpu/drm/i915/gvt/display_helpers.h    | 27 +++++++++++
>>   drivers/gpu/drm/i915/gvt/fb_decoder.c         |  2 +-
>>   drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>>   11 files changed, 123 insertions(+), 18 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
>>   create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
