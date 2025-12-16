Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FEDCC1C68
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Dec 2025 10:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7580010E918;
	Tue, 16 Dec 2025 09:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuocUPzL";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DAC10E782;
 Tue, 16 Dec 2025 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877247; x=1797413247;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AZYbLUFCK3/QlfE/UuC8zIxtBP4NysvJRZXLulSgMJk=;
 b=GuocUPzLkzmhC6JkK/rGiT46Duz8biJX9q6gCDrmigt1AMvhvxkbWFOc
 E2HJZ0h7X1iptKviuneqbECVwGVqeCQfgDjV9u8tfc9f3wXnKOu/2RWSH
 ZcHcxbajDHM4w7oejE/E/78I1MY82aPYylmrhlS53ghtg21SP5yLj/LNY
 8fHHrTli1FoBG2+4SSjehsBFb/wh15lRBeLYGoT5mjhp4kuVDeMwE5qZL
 7wfOIqAyElVdvd789iOgCm7jNdVmx/0GOg0GTgUtgS4gtAu3C21jd8cCj
 spEI8iPxn2jBsfP9AUO6s9PtYGSLLMoNg25t5tSo1csLcrNcgi666IwxH Q==;
X-CSE-ConnectionGUID: wclJfp1NSc2wLdTSpS9FmQ==
X-CSE-MsgGUID: Gj7GS2G7TC+rw4IAJnqI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79159086"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="79159086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:27:26 -0800
X-CSE-ConnectionGUID: NK6fE8nlS+6KbF7CCE0eKQ==
X-CSE-MsgGUID: S11yQzLzQTKEwkuPzblDog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="202881502"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:27:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:27:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 01:27:26 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7R/4dbTjHsMIknnYrsrY6rMjF7aX6W0tMxBIWF07kTR+85ULzLuuucyIbxZfj2HpGnlmO5Eqpny93n3butM3zEbnDObrA/jvCB8d9BHP/qoXwCNQMn71M18543twEP3rXeDUu+WKVN4iqLwCVdgoM1XPzjNwMGCEBmmQVTh+LQeIEkTO1qzniuYFqz+DwkZ0NqSQNt9WOr/CtcpQFZ6MbvYQPeE/PWhIUVRCZEO/Ue8p77ib3UKi4uZ5wt5etxrKabCmez9UBh+DsNfTvcOsWuvh6Dgsz1k+YGNr3XjvXnurE2C+mg9nAAaisOdss+sk/ix7we4HahiWBkI27Nt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3uqxQHvrcC2lkWxaN/ILktNJ+dSTjbxXIRjP1RtLsA=;
 b=S4TbmUXSxkaR8V1L6Dlqnitd9g3klX7T2ihzbtEULZrF4FtoPxWaCvxrExVBU6bt3irPdaG26n2Fj4v8l/am8tq6eXHGaHdxz7VMPBBsnL8ELNxwUWyUlCKB+YI4yPRztsdSIJ25HHyv9AubZDoJGZZdmznyQoIYKaHNcEJqaPSOuLKeYl2uuNEQe473j3O7+pLo0TyPbyJBu1A5pB+Wziv2TjhZJpQ+DtU3QvJbYsd2o2OfFoI+C3PsMfqH0fjzl7IGST6GuMALZzwTBrAFJ3omxOgZpjR/URn//nYvbY/5O+njKG327pioxqIULUPKXTJpPUHypbxO9gPqntjvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:27:23 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:27:23 +0000
Message-ID: <170c8343-1087-4b8a-b8f8-37422a0a401c@intel.com>
Date: Tue, 16 Dec 2025 14:57:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/i915/gvt/display_helpers: Cast argument to enum
 pipe for pipe-offset macro
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gvt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-6-ankit.k.nautiyal@intel.com>
 <9498ecce59866b5fac5410fa9d75c6d7d5a0e11e@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <9498ecce59866b5fac5410fa9d75c6d7d5a0e11e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f76494-72d1-4a67-36c0-08de3c85514d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3hUTjllUURuUTRjOVZEdm5ZMHRyT3BsSDNOQmQ5Rmh3ZmxZS1c5S3pFY0lJ?=
 =?utf-8?B?cjJJNjZrdVJaUlU3ekNoQ2lqbmMwNkJJMUM5YnZKc2NZS1plazdET1BZTzkw?=
 =?utf-8?B?QUxwK3EwS3Q3akdPUktVak5iNVlrR2hmTnpjMkJGWWlvTDVSSGEySW4wWW9D?=
 =?utf-8?B?bGNLVjZ2UG9YQ1JNdDJDdmJrblFjcjlmVVd1ZElkYm5mRlJmWCthc1RtNmcx?=
 =?utf-8?B?NDRYc0tUNzNjaU5ZMVAwZFhQZjZpblpsUDVpUEhGS1I3MkNaaDYyTXBIZ1d0?=
 =?utf-8?B?cTdYTXNvdWhHWmJLS3JmZzdzRTgwcTZ4Y1FvUVV4bzBOWnJuaW0vd2toOHh6?=
 =?utf-8?B?aUJjMzVDVjFtUUtSM1JZK1ZRMEF3QnRZU3U3bVI3QkhqWnROZ1BBNmQ0ZWZJ?=
 =?utf-8?B?UXduQlFNdW5MVDRVR0dJR3R5c1Ztbml3d1R2RWNIVGVRaE9sck1PR2lacHdk?=
 =?utf-8?B?WGFBeWtzT3BDZkVmdUoxLzhJMnR3R3l4Q21ES3JZbnlYcnp4QThCa0VMZDVS?=
 =?utf-8?B?cjB6aUtYcUV0Qy82V0Mxc0FxTzJiVXV6UnNoYlFhcG9CZHlkRXpBdSs0U3ky?=
 =?utf-8?B?eWNJTTNtL2N5WFpIdFNOQlpGbS9sZ3kxN3hXc0tXbGsyWjNVaXNDOUhsaW5y?=
 =?utf-8?B?T1JEazZEZ3VYUWRqOVZvQks5Q1dzVkZndHI2bEcwbkx4K0EvSjZPRUNSYy8x?=
 =?utf-8?B?U3hNUmhveG9wYVJ3WWszV21yR0thczhzVmlXWWRSVUE2a2dxdkQ2Snk2RllQ?=
 =?utf-8?B?WGVTSnNDSSsxdkk1UU14aFAxL0RGaTNKTWM1U2o2cll2clYrTGJFVnFXRGgz?=
 =?utf-8?B?R2o3Nyt0d1hsbXBZQnJpNm9ERjdMTVBJVHVKd1BIOE5DVmlvdHVYNkNlSXBk?=
 =?utf-8?B?clFIU050Z1NOdmE2Ui9sSmJET3U2bit5bWM0aWtmWXI2Q3l2a3pIK3ZONm9Q?=
 =?utf-8?B?NU9ROThWOTYxOXh4ZXduOWRydHZvWmg3d1p3MVJhWitpTWQwNTFZOVlIQW4v?=
 =?utf-8?B?UnFlZGxqd0tOMzRhbXB3T2FCUXNWQ2N2OXEyVzZNdFFJQXNJMzg3bUt0bTZ0?=
 =?utf-8?B?OEt3Y3FERFZ0clg5Yy9ObWVBWndnUXJnYXlCb1BYb3lheTRNaWk5cS9yN0VZ?=
 =?utf-8?B?dzdwWU9lNFZMUHhyWHUrMUxlTEZ5Ui8ybFFiMTRna2FOVnpuQjd3Ym1aM053?=
 =?utf-8?B?VWdNYkUyRTZRd04zUVptYm44dFJVcDJQQnhMM1R5TkUzYWRZWDBLb3VuWDI3?=
 =?utf-8?B?N3N2bVpiV1VEdWVOVVN0YUh5Ym9BNitKaXZNdDQrOW4wT0JzL2RWQUlZSXpF?=
 =?utf-8?B?SlQzWlZib1BpY2gwcGVVK0QyWjk4RVNIbkRMbzQ1QjQySlFVSHdXN0p3SnRp?=
 =?utf-8?B?ZHlBTVZndEt1SVZmNTUzL25tUDlJZVFNTk5rTkRNZjM4eEdVZnlTd3lJbHFJ?=
 =?utf-8?B?elhkWTQyK0NEWTFrcnl4aUs3cEY3ME9JWUNoTHNhMzkxRW12ZW5rY0F3UGhI?=
 =?utf-8?B?VVJWcWRKQ3IvYnpyWVU4dzUwaHZPcHZOZVk2TFU3cjIxS0VqK0RYbjBtWkJU?=
 =?utf-8?B?ZGw1OWhkYW8xQ1ZtSkI0SkxWTEo0a1IrU0wyMVROc2kvNU5GMFpsNFJJY011?=
 =?utf-8?B?M2pQUW1NdjZaWDRpMXhRSmFoeWlEYTRkVE4wWDFYSGtLcjloQUEyUEdqV2NQ?=
 =?utf-8?B?YzdjMXlteUJId3F2SGdWYnVzL2VyNHM2MnlHY1ZTSGJyWitZZ1ZMQldxdFlJ?=
 =?utf-8?B?T20yRzAzdkp1M2JyWHp3RmZQeFR6NXhvTHN2SllCd1A0cENzOFI0QWFVQ3k4?=
 =?utf-8?B?SUVTNDFTTm4xOUJtek84Nkd4dnhyQlVzVE8xbno3dGcrTnpZWEdzNU13MmpK?=
 =?utf-8?B?NFhkRlRDd0NSZUthT3hGcVNDNUpzQktObDJKMlpCaTJjRlcyNVFRbWFjSmdw?=
 =?utf-8?Q?f3MrfxLQshhwYAaAD/uvrCqmFbK+SrOS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE42OGZVek5La2JKN0oyclJSeHlJa3FaY3RzcytsZVJHQ1hJQ05CN2NLR3c1?=
 =?utf-8?B?bVdGNzBROEEwdExMdmRLLy9nTFo5N0ttbGQ0UC9SQTl6UXMwRnhpVGU2ZGlC?=
 =?utf-8?B?NzZ6dDFwMnd6eVA3ZG00Y1g1cGhwdWxydEZZc0dsb29VQUsxZXVmRStHZVNL?=
 =?utf-8?B?TGN3VzVmQWdMUWFsYndyRVN3M2lWVnY4Sko2QUI4MzM2ZVUwb3dHOFJLWDQw?=
 =?utf-8?B?TERRZ2d0L0EwVXBQN0hGc0o3dW9tZnlOVWVHbW15V2RJemxWWUxLbnpNeDlH?=
 =?utf-8?B?TUpjUzdiR1ZCWm9jRXRyMDZWNmRNQ05iaFRaUVdjSW5PTTZMK0l2TWhoNE9w?=
 =?utf-8?B?dVp0SGpqR3Vva0xjTWhWSGd4cEFkQ3VPbzRQWHRld25xbFhzSnkySXhRd0p6?=
 =?utf-8?B?YURaSEVNdmhBVnh0R3d5RU5aNnNsdnRIUis1SWgwanhrbDdoNDZoT2dhS1JI?=
 =?utf-8?B?YWhaczRYMVM0Z3UwOWRlSW1yMXkwWE5QTmtERWpBRWx4ekgvNUFONHdvbTlu?=
 =?utf-8?B?VlkxRWh4dzdPZ1hGRWRnblJIU09iUnZLQURUa1ZrZitPSmlqblFPaWh6RTBp?=
 =?utf-8?B?WmErMkg1VFlyYTRSajNjbWZpQWJ5SjFkbEJ0ck9GL0VURjZjVjJyM0VkSit1?=
 =?utf-8?B?b05ZL2kxNUduay9peDBVNEJ2ZmpiZ2YvQ2RUVzJaMmZDVDhOV0VIb0EvVG43?=
 =?utf-8?B?OVBMTGQ0TktOSm42RUp4Qk9FbDJNbG9CK1RONE1JOXB2cHgvRkpoZWNGcUMr?=
 =?utf-8?B?Tk1hMTJPSWk5UXdDV3J0ZU0yOWR1UzRJLzh0VERTdGU3UFNndHpnZHBUWG8z?=
 =?utf-8?B?WUJJTllvcnBZQmZCTmxBU2dFN3ptV3N6ZkttRVhSWVZvV2xzaTBZOXByK0sw?=
 =?utf-8?B?N0x5UDBEOTgrVWs2S2ZKZkp0RnhYY05DVU9lRmFBaWZrelMwSThzNmFSOU05?=
 =?utf-8?B?WnVLak9qV2NmN0k0ZWt3a2t0ZTA0MHA5UG1NamZMcmdlcWxDME9jRGJJYUNy?=
 =?utf-8?B?UU9MVW1oNTROMDNWYldKSlg1RXNyUTZSUWUrbVRUMU9oNmNrSEUreHlrWDJ1?=
 =?utf-8?B?MEFyTjIwQVpRUHlqOU8rR29TeEt4ekFLL2RjRnhkSUZCUkJEYUk2REFGeHpw?=
 =?utf-8?B?cE9Qcm0zbnNqcmhhd3RtZ0FUZHNPdEc0ZmpRUjFRL1FJOFQzTWIyRjdGMVBI?=
 =?utf-8?B?MEdtekIySFYyaVBNY2xUZ3J4L0hzazl0ZU9uQ2pKaFBRaVduRGQxRzdNa1N0?=
 =?utf-8?B?NW1CRUFXRVRMQmdvbnczdyt6dXFJc2V0Y3FQSnlMSlZuNEhmTG82YklNNmlT?=
 =?utf-8?B?WWJ2Rm9xajF0S21TUUhsdHlmbjFFd0RNQ0R4RTBZU3g3QUlnTk5ZU1U5T0xI?=
 =?utf-8?B?RmowWk4vaXZaQ2U5UEt4Zm4yWVNKSWxLMzRmSTBvTGhWK2V3a2FkSEZidEdU?=
 =?utf-8?B?KzJLRGowcWNwbjN0aWJaUnQ2Sld0RkR1aE0xeXdRTHpqclBUV2RsUXFxT011?=
 =?utf-8?B?MlNHbEhSbk9lR2VPVm4xWi9BT25HT25pZHlWbEs1eWRSYjM3OFhEcXNmRkhW?=
 =?utf-8?B?OElOM0p0Vk9PUlRYL0FQbnRtQ2d1ZFcxbXJVMGk4ZE91UWM2dEtDeWRLSUhJ?=
 =?utf-8?B?OUZMaWNrRUhhSzRKazZpbWFnTlhaR2QrMWEwVEpoZ3ZWQWpDeG1EV1FnM2F2?=
 =?utf-8?B?RnRXcmh1RE9GYUhQbzk3VFR5UFZYZnlyY2RCQWpjSkNRdDJuRlRJd29lRTgw?=
 =?utf-8?B?QTNjdlY2US9tejFKUWZNdDZ6R0Q0ZUN5djIxaTFSTUF5NWJrL25iT0JtTGF5?=
 =?utf-8?B?Z21ZRHorUm1kSVNmK3piVUc4RC9JU2djb3JDc0VsZEpadjgrVVdBb1lYdW5D?=
 =?utf-8?B?cGY2T1BodkJaNmdna0xKeTd3emxadUg3RWMxWGkrbVU2Q05yUlF2NXROSEdP?=
 =?utf-8?B?UnEvU000UlZnUFgrdXZxY0pXbG8zRUFtaWh6RHRWUDQ1OWpwY1NzL0tmdHd1?=
 =?utf-8?B?aVM1ZkR6eTd5bHZRVnVRQVBKS1hxQ3lRLysyRUl4eURCSCtZSmptRDNmY1d5?=
 =?utf-8?B?ZHFKS3FJbkRMNm82dWFiWll6T2JFdlNzTmtuNW8wN0xDbUorTkdPTmRUWjdx?=
 =?utf-8?B?OUxvdTVIam95YkZLbnVjalJsbkdQQ253VmZPbHhHLy9WZEs5d3JiTWVXbksr?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f76494-72d1-4a67-36c0-08de3c85514d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:27:23.3339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8SIk/Gur8a8UaxlgxzfSfJAhV0aQnoZXFWEwXkLBAqDB+6UQbJt2lqUCfdrYpueNuAAJKGUZfzcNkYlu6/2n7goCdXm4h80+VhUL8HvlS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
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


On 12/15/2025 5:33 PM, Jani Nikula wrote:
> On Mon, 15 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> TRANSCONF() expands via _MMIO_PIPE2, i.e., it uses pipe-based addressing.
>> In GVT, some call sites pass an enum transcoder to TRANSCONF(), which now
>> routes through INTEL_DISPLAY_DEVICE_PIPE_OFFSET() and ultimately calls
>> intel_display_device_pipe_offset(), whose parameter type is enum pipe.
>>
>> This results in -Werror=enum-conversion.
>>
>> To address this, cast the index to enum pipe in the GVT-side macro
>> override.
>>
>> This works for all cases as TRANSCODER_{A,B,C,D} all have 1:1 mapping to
>> PIPE_{A,B,C,D} except for TRANSCODER_EDP.
>>
>> There is one place which uses TRANSCONF() with TRANSCODER_EDP, which
>> appears to be incorrect. In any case, the cast preserves the previous
>> behaviour.
> Maybe the question to ask is if TRANSCONF() using _MMIO_PIPE2() is
> correct or not?


Yeah I was wondering that, that's the reason I separated out this patch.

Hehe .. Just wanted to make sure with others, before going down that 
rabbit hole. :D

On the serious note,the suspected transcoder EDP usage in gvt is also 
highlighted in the commit that replaced PIPECONF with TRANSCONF:


3eb08ea58e57 ("drm/i915: s/PIPECONF/TRANSCONF/")

I guess we are supposed to use TRANSCODERS A - D which map to PIPES A - D.

For other transcoders like EDP/DSI we should perhaps find their pipes 
A-D(cast them to transcoder enum) and then call TRANSCONF.


Regards,

Ankit


>
> BR,
> Jani.
>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/display_helpers.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> index d11ebb03b946..fb75cc9f97cc 100644
>> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
>> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> @@ -21,8 +21,8 @@ struct display;
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
