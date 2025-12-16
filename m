Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE25CC1CAD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Dec 2025 10:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19B310E938;
	Tue, 16 Dec 2025 09:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA0OAicx";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4FA10E91D;
 Tue, 16 Dec 2025 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877418; x=1797413418;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Lnuh1mSd2OjyH1WXBCM5Fd8T0kQVPJthFFbFc8qUVaw=;
 b=ZA0OAicxftOUSmX088ndmeHO5gTh75bbXrmcdK7yP46a68Bd2PeerFLW
 3isFqJuUVqtC1ra4G3gBQr2XmuFs1FKBwtTI3PF06l7F8kMeZbUGOEl3C
 tq4fdqalcLyszG2KG14eNnKh0MyAs2ZfdAuksrYpzFjHLJN7QUvAe4jSd
 bz4eT7afpgwjNMUAVLEdWOG1dtl1ih3miOzihw2CWExTGxvLYL6aGZQVF
 VUHvvjmEAOZej5S3Zo/d1OuNnXEnE33Ke93hzdmXcYclaxHWMS+u3jrxr
 aYwKgDY0yvqWzo73dmI6lJDxhVXv8lVWibUq3sjVjACZXbcaK07vZaJLz w==;
X-CSE-ConnectionGUID: QyvDLLKsQnaTbTZEvursQg==
X-CSE-MsgGUID: /Cij1UM4Q1OqcmzJeywy+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66980999"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="66980999"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:30:18 -0800
X-CSE-ConnectionGUID: /GgBIUaLQXeVMww+YNr4Kw==
X-CSE-MsgGUID: liVYkJG7RQ2g9Vfxk7f3dw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:30:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:30:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 01:30:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:30:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMr95miugC7cfapuQ87VhW7Fl2EFcTT8x11jh/VfJUSVAn6pFRZwamqal77U9q3gWa4lrJRU3jGzWlvZnq3wxtQr9o3qLtTIHSeZVhmgCRs7vYdjvz/HHhsDfxJvWW6gi4NTH7lR2Wq4d25ErMXAQgLikJJxjAmQ+34vupbt5qmNZ8IYwlpNAswUFt4GsRWzvLQeAZ5ZO00/uxW2U2ack+96dPwOSTsfIKEHYHkOEM58hJc/Rc2/Tg5/7n6BMYCbhf+pVeiqhcof5gYh2dOVATxzHZUBWHrXZ2HEpHTZ1SUlAl/tUfZv0XnFD4UcOZjpZ82M/ti4fm2y9CKOmL/R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEu+Utb3uCfNAp4E7TI3xt9OqGT0/H1TAlPnqiLRBT4=;
 b=URmGhbd03I9KvBn1p2dTRGGjIl649HiSX/UCqT2+TsxEVw68zWq9tBtJ4J6eHRs5qNiVwLArGEs7X37Epqy81nYHDnb4sBgvfwu3jXl4FVn+BrCmGmB/OR6d+WNjg52jwI4w8JzCCNMQDPAdq7XMUoiDeGgcW5ujqbDyJdeT9JNT6CC314ZJ7zP60il3KwvByqoqYffmKPw/JIOxnAGH++daDbrBNuyDsp66uilEZv6O5Dd0/r/WpO9p6WxuuMjXBYjbjZuUGS6TBKJe7jc9fkYHlMuxdlxSBkD/e3CFqyTb/UB8+nfHPyPVbuhYAKzl2B1OTqPC2/7kEyygXjVF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:30:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:30:15 +0000
Message-ID: <a40bc25e-2b04-4736-bbf5-018be1f0ea18@intel.com>
Date: Tue, 16 Dec 2025 15:00:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/i915/gvt: Add header to use display offset
 functions in macros
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gvt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-4-ankit.k.nautiyal@intel.com>
 <fa0657de720e63a4f966fd07e86d998f2f94e5f2@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <fa0657de720e63a4f966fd07e86d998f2f94e5f2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c0bfd2-f489-49a7-096a-08de3c85b7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZTWXdQb1N1NFAzU0pYR2pETFZsVit3OEZvcU5tN2IwMS9jL2lseEVzb0Vq?=
 =?utf-8?B?dGg5d3RtQnk0QnZqS1liQkJFTFN4bGVqMjNDNU1KeGJkL1pTV3dOTWdkbkJo?=
 =?utf-8?B?UXBvc1RSR2ZFZDA1bWZzS3V1T0RWWHphSG1MeGl5UUdnMUxBWTBIcmJ1dGIv?=
 =?utf-8?B?dFdua3NHVjltTVNtU29jbXdEZDBPTGQ0TzlnbHdCczAzelRzUEhpK1VtQUhJ?=
 =?utf-8?B?alkrMGZBeHpaOHJkWmxpNHJRY1NMQ3p5MmRReUVvZjN4cElsVUZ4eFR5ZEEx?=
 =?utf-8?B?clJoZitoZ0RtQ1hqdUNxTUQxSnZWaGlNbmMvTkNNNUZjclk0SlpuZUpSRmJK?=
 =?utf-8?B?dFpwUnpuS1llSzBDWTl1VmErQXZ5UnBYM3VVTkFpYWxsaHlaMjZJY253V2lM?=
 =?utf-8?B?MUUwSExpVEhIcHRUUW1nZUtHUlAyd29jR2lYeUc5VklJZ0x1SkpUVXlYY1g0?=
 =?utf-8?B?aUNwa0UybWx2U0ZlZGhuK0EweWpKcjFXWVM2T0xhNWpxVDhMS2ZvZVpGb1U0?=
 =?utf-8?B?dmdkclRZaDFoRkFnZmJuNW9INitRT2t5ekkxOG4vaEFldXNVdG5GSnlTLzdn?=
 =?utf-8?B?MWtPcUlnTkRrQUZtK21FVkN6UlZHSTdMTkU3YytQNUpnY01TUDRCdU5yNFhB?=
 =?utf-8?B?YWtteVZDZmtGcXpRd256eEZBTkVtT05iUk1jOHhIb3d4b3lVbUpQQzdwZGtl?=
 =?utf-8?B?SmYyNkNwaURuZGVKb0NPQyt0UmhkTW1JeUJkWS8yMS9oYlJCelo5QTU3SDR3?=
 =?utf-8?B?VURpK28rS1kwYWUvcDBRWWxIMElhNWNuNXNJcW1UVVp4KzlFQ2RYYzg3MHNy?=
 =?utf-8?B?WDA4bXlmU2hrMXJkYmp3M2xaTmJxWnZqVUJzZ2ErQjl3R3pBa2JMdVdNQnZ4?=
 =?utf-8?B?bUtPcGZ2QUtGWEVyOXhTM3haVDFySzlaTE5JQzFSMlh4SnQyZHpGUUs3akRo?=
 =?utf-8?B?bmUvZEI0YXprWG5HRHk3em4rbko4d2xkaHFWWEViWUltbVVsT3ZjV1R5di8x?=
 =?utf-8?B?MFJyQURSYkVlaVZvd1BPTjZxd253d0F2RWlmcW85T1h0V1dJQjgwaXZFT1Vh?=
 =?utf-8?B?L2ErWm14dkoxMzFONTFiYVUzdThCbDE4KzZsVk5sTzZ2YU5ZSS9RMEdCbzJY?=
 =?utf-8?B?WEMrb2t1a0RIcWVuM0ZMMitqVDJkRFJDOTRLNWpxMVgvK3BNTFpjZWQ5bDRq?=
 =?utf-8?B?TE1qUEFHQUlWOFZlRDVWQzNJdVNDemRMYzZEV01zM2RVemx6Y1k3eTBxOFAy?=
 =?utf-8?B?Ny9BNWFBL3VKV0VhVzgvTGhta29XM21Ca2M0VWowLyt2QVljQk82SmpBNUNr?=
 =?utf-8?B?RC9vYzB2T2tKaW1Xb2dOV0VJWnZJbTlPaDdJZnBETmNZU0lGRHd6MkhlMGc2?=
 =?utf-8?B?aTBUOXA1Nk03YmFpUXNrZ1NCVG5RTS9welVKVmthdHB1Mmh5TklHQWNPR1FH?=
 =?utf-8?B?UTZOQWFHK3hUWFRCcGRaZE5nVXduZkg1N3g3aVVEc2dqNlpmOWt6VE81NEhB?=
 =?utf-8?B?aWk0eG5iemp0YUpwamxTUVRWWGFZK1JSUU5QdUNiWE9IYkhmelUrYzRmMWVT?=
 =?utf-8?B?WVhXOGw4UndKdjl2cEZ0a20xZEFEeW1Wb2hEcmplbCtVV0VQL3RubnQvMGIz?=
 =?utf-8?B?L3NYOHpVSkNrdlM4d2tzNE1QMkRjbTBFbjdBTlpyQ3AxYlErL2tlb25yWlZI?=
 =?utf-8?B?Z1VTUlBrRHRTRzdpaWFnNkJYS0QySUpGeEFUVkxOMG8xd2NwVjY3a2pJekxl?=
 =?utf-8?B?LytNOHRxdXpDcHhIMFZnWk1BdDFacEJvbDBWRlNvZHoxaHpoeTZGMCthK25N?=
 =?utf-8?B?K3pIb2JQZjlIM1Ezd0p2dTh0YVk4S0RHNkpPUy94ZFZEZUVQeXp5VGR0ekRV?=
 =?utf-8?B?MGZ5QzhmZ0NZb3U4QnBwa3NMc2QrWEVsMnJUc2Y0SUNXQlByTXJzd1o5a0hN?=
 =?utf-8?Q?v86Z5YZHZeiboiQ+//T44K/Tlld+Tsdg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFDQkQ0NkhPTVdOd1hrelhpUkxHV1lSaEVhTmJRU0VJYS8wNTVzWjJURUFo?=
 =?utf-8?B?b3FaekUzNHdJbzZ2SVM3cTlsTG5lYmcyTUhsOEFCanZKbjl1aWZhTHAzM2Qw?=
 =?utf-8?B?c2ZlY1VXOW4rYVl2U3BrM3pEc1dINXlsOGZocGhWM2NkSmtqS2JXMWdiR1pE?=
 =?utf-8?B?aW50VG45bVYrWkxNMXRuVFZINll3Tjk4bVJINE9tbnpiV09mS2p5S05lcnBz?=
 =?utf-8?B?SkZWUjlZQXA0WTlhMzhRSkVrdi9JOUE3Y0V3VllBZUV1ZjllbGNCTVkzNVhR?=
 =?utf-8?B?VnZoUlQ2UXhLU1FaSkRubFZxMVZlOVZPbzdlY1ZJUWJuRWVGTmhka1VLbTNP?=
 =?utf-8?B?NnoyZWlFcnZxZ3ZmKzIrbVhZQVpvalYyOGdlOXBXYTBjazZlRGhKQWd4STJQ?=
 =?utf-8?B?UkgwQXZqNFpxaDZsOHpPWTBKUkRrb3dLQ0J1Q3B6RDlpdHZCUjlFVDZVZTE0?=
 =?utf-8?B?Qy9BUHdFcWs3Z3RzelNOUCt6czNVK0x5VGwyTWNtMHE3R0xCek05ZTJiUWla?=
 =?utf-8?B?ZzJ5NEFVQXg4U2RMRWVGVEJTUjhMYWRBdU1aZWlpSFNPdEVPVm9helFOaE9h?=
 =?utf-8?B?TkVKcXhMNHlrRG5rUTArTEFteExWNVJZZHp0ZXR4T21UeFh5TG9Rbyt2RDZJ?=
 =?utf-8?B?WGpuNDNQWWZta0Z0YjZMbkJZSmNQRDZQbWozRVUxMDViUjg4RG9BQXAvc0hT?=
 =?utf-8?B?UUdUYUJmdkNLRFBjVnRlMW8wTmcvak90WjdJQzgrK3BBWTAwSkN4M25zazd4?=
 =?utf-8?B?cXJvdGtBbjlETFM0anVuV3l1ZW02UzZsb3dHWWM4RFlzVkJaa29lcFljczd2?=
 =?utf-8?B?emo1SjJheW9xQnUvb2pWNFQ2VkxZVlJQMkJJY1ZsT0pJeElyQVBTYXdUN1F2?=
 =?utf-8?B?cDd5K09qTmNjQ0xPWjNiOFR1endKT2dZVDVRM3E5R08rMGJvWE5wUm9CZ2dN?=
 =?utf-8?B?Z3F6N3VSQi9IRndZMkxXMmdwWktSNTNXSkRrYmVRbDUvdFA4aDF0WWd0Skc3?=
 =?utf-8?B?dXNTVlJleTdkazFEcHU3K3JUVlhzR1l0M0lMRWZCTFd2UUMyM3gxL3gvVHdB?=
 =?utf-8?B?enhCTi9ldG45UjBhWUZuWGpLR1I2QWhha2tKeDVKYS9ES3VkUCtsamdLUTNM?=
 =?utf-8?B?L1lQV1dyS0piMVgrTktuZEp5ajRvM2IyUFlINVVNMkVWc29ZTVlENjZUQ1h2?=
 =?utf-8?B?bmowbE93bHVOeHhpaXEwb2NpVUVtQkh2VDhsbGFkRURta1lDL1JkbXFjUllz?=
 =?utf-8?B?dWZ5TjY0dklSUVZDd1FSTXJLYmFZT2ZpVEVTL0p2ZlJsUUt2WlM4TnJFdXBL?=
 =?utf-8?B?U05ZSjBSYW5ubkoycDh0Zk1TYXVCbHVQMTRmVHlmSmlQY1M5S3FsZWo5RE5v?=
 =?utf-8?B?QituMFliL3pSbGFOUFp1aDFLcXpmWDdjT1BHTmMvOGQ3TTVnUGJQdGFNSXVm?=
 =?utf-8?B?QU4yMTFDYW9JeUQ4OFlUR0lLeE95UFFuTk9VOGxuQ2tWV3h3MmQxZWUydExk?=
 =?utf-8?B?MmpvYzlvVDVpUVMva1ZMak5IT0Fkc1JZRXBkaU14Y2E2ZnFQRzhlV0ppbThi?=
 =?utf-8?B?Si9mRHh0MExFRHNseCszY3F2emY3c2tlT1hob1cxNVhUZGkxWU1mSzJ5VVNh?=
 =?utf-8?B?VXExUHhSNGV3a1h3eTRxMCtibm42L1Y2K0ZPTDhSVDhOc0Vqck8yVzU0ZU1Q?=
 =?utf-8?B?NVNIRG1Mc2RVemVmMFQ5OHlHRWlhWHk0aUFkZU0yNkZtSkpxZndETnZEQktE?=
 =?utf-8?B?aHRra2g0TlYrQi9rbk9hRFE4WnY2NU83TnBWdnJ1TTNVVzh1cXd1ZmdlVEZl?=
 =?utf-8?B?WDVUaVd5MHFPSDU1UlNXOG1JLzZlT3hBNk5pQmZyYnBMQzhFUjB1ZUpFQkQ0?=
 =?utf-8?B?dnp1bkk1c25OS05aUGxzdTVZVGlEdFd1bDI4WWh3Mis3VlFwNXh4QkE3RTh4?=
 =?utf-8?B?T1ZScFFxc3dSVENrV3lrRzhSMG1QSnd5N0xwTTZDcGxxSU5tNnlIdXFKSXp4?=
 =?utf-8?B?ZXNiSkRVNms5UVVuSC9kc0huYzA3UGtkc0paOFJaVkRqVlFXT2NsanRTTDg0?=
 =?utf-8?B?UUNYRmgrb1hYQTZYdXBxMWpLb2NWMmh1Y3AyZzk5ZllZZ2Jsd29jUUFwVW5z?=
 =?utf-8?B?djB4d3ZKVTBOVzZYU3VGRHlLRlZadkVIUjMwZDhkUnpFeE5UaG5Xb0FqOStw?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c0bfd2-f489-49a7-096a-08de3c85b7e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:30:15.1660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5iiQkmIuazrmmxMt04ngbI21yfmJueJBNj0+A4EuNeLm4zESflDuj0ZjLlwiXcozxe2UgYxOFffavq/n1CLuYj2x6/JZUT1yZdb0/UJyVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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


On 12/15/2025 5:23 PM, Jani Nikula wrote:
> On Mon, 15 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Introduce gvt/display_helpers.h to make DISPLAY_MMIO_BASE and
>> INTEL_DISPLAY_DEVICE_*_OFFSET macros call exported display functions.
>> This lets GVT keep using existing register macros (e.g.,
>> TRANSCONF(display, pipe)) while ensuring offset calculations happen
>> through functions instead of accessing display internals.
>>
>> Include gvt/display_helpers.h after display headers to avoid
>> conflicts.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/cmd_parser.c      |  2 ++
>>   drivers/gpu/drm/i915/gvt/display.c         |  2 ++
>>   drivers/gpu/drm/i915/gvt/display_helpers.h | 39 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gvt/fb_decoder.c      |  2 ++
>>   drivers/gpu/drm/i915/gvt/handlers.c        |  2 ++
>>   5 files changed, 47 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> index df04e4ead8ea..6b5e18fca403 100644
>> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> @@ -59,6 +59,8 @@
>>   #include "gem/i915_gem_pm.h"
>>   #include "gt/intel_context.h"
>>   
>> +#include "gvt/display_helpers.h"
> None of these includes need the gvt/ prefix as they're in the same
> subdirectory.
Alright, will drop the gvt/ prefix.
>
>> +
>>   #define INVALID_OP    (~0U)
>>   
>>   #define OP_LEN_MI           9
>> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
>> index 06517d1f07a2..7a51c13b9b58 100644
>> --- a/drivers/gpu/drm/i915/gvt/display.c
>> +++ b/drivers/gpu/drm/i915/gvt/display.c
>> @@ -49,6 +49,8 @@
>>   #include "display/intel_dpio_phy.h"
>>   #include "display/intel_sprite_regs.h"
>>   
>> +#include "gvt/display_helpers.h"
>> +
>>   static int get_edp_pipe(struct intel_vgpu *vgpu)
>>   {
>>   	u32 data = vgpu_vreg(vgpu, _TRANS_DDI_FUNC_CTL_EDP);
>> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> new file mode 100644
>> index 000000000000..6f68a1e8751a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> @@ -0,0 +1,39 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __DISPLAY_HELPERS_H__
>> +#define __DISPLAY_HELPERS_H__
>> +
>> +#include "display/intel_gvt_api.h"
>> +
>> +enum pipe;
>> +enum trans;
>> +struct display;
>> +
>> +#ifdef DISPLAY_MMIO_BASE
> Ideally, we shouldn't need these ifdefs. I think it's better if we can
> drop any includes from gvt that would cause a conflict here, and it's
> better to get the build failure.
>
> If we can't do that in this patch already, then please drop the relevant
> includes and these ifdefs at the end of the series.

Ok, let me re-check this part.


Regards,

Ankit

>
> BR,
> Jani.
>
>> +#undef DISPLAY_MMIO_BASE
>> +#endif
>> +#define DISPLAY_MMIO_BASE(display) \
>> +	intel_display_device_mmio_base((display))
>> +
>> +#ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
>> +#undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
>> +#endif
>> +#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
>> +	intel_display_device_pipe_offset((display), (pipe))
>> +
>> +#ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
>> +#undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
>> +#endif
>> +#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
>> +	intel_display_device_trans_offset((display), (trans))
>> +
>> +#ifdef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
>> +#undef INTEL_DISPLAY_DEVICE_CURSOR_OFFSET
>> +#endif
>> +#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>> +	intel_display_device_cursor_offset((display), (pipe))
>> +
>> +#endif /* __DISPLAY_HELPERS_H__ */
>> diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
>> index a8079cfa8e1d..ee4213fa2cda 100644
>> --- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
>> +++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
>> @@ -47,6 +47,8 @@
>>   #include "display/intel_sprite_regs.h"
>>   #include "display/skl_universal_plane_regs.h"
>>   
>> +#include "gvt/display_helpers.h"
>> +
>>   #define PRIMARY_FORMAT_NUM	16
>>   struct pixel_format {
>>   	int drm_format;	/* Pixel format in DRM definition */
>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>> index 36ea12ade849..3e58e35ea2b9 100644
>> --- a/drivers/gpu/drm/i915/gvt/handlers.c
>> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>> @@ -67,6 +67,8 @@
>>   #include "gt/intel_gt_regs.h"
>>   #include <linux/vmalloc.h>
>>   
>> +#include "gvt/display_helpers.h"
>> +
>>   /* XXX FIXME i915 has changed PP_XXX definition */
>>   #define PCH_PP_STATUS  _MMIO(0xc7200)
>>   #define PCH_PP_CONTROL _MMIO(0xc7204)
