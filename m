Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18FCE6C3E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Dec 2025 13:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EB710E459;
	Mon, 29 Dec 2025 12:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWsPWeXd";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CDE10E44D;
 Mon, 29 Dec 2025 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767012465; x=1798548465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f9r0Av1ojWPGzrSQw4fYb2ZwrXFHi/1Fee1Ov/1OzxU=;
 b=XWsPWeXdPS1F2sH3ydvT+9IxCIlQy9iLW8WMePJZhZOn5o0KE50IUcgx
 jGFmmalZFWEHsoVbhPKITcMPHhuOj2IFf26ShHckJMynQTJKGoGMK0ZlS
 w7+ua8kaxI+pyl8wNNouY81Ysl32oy0uoIm3mmyvnWrMRGRlxWLWRBBfG
 JmFMy8Wa3yqaDpm3aU+V0IhfcRJaY3YU6nSBrVVi6OWNWvZMXtwL781yE
 +y5zK7tVCTnQCgcQXoJBHFB7hRYOV4v5IfA6cXMvQVmn0K4SuSyHGDfVg
 sklgZJm017S5wF2MnSF+GsYfdopNlFO1HVecdwpLqYyMcxLCQmorkEaQS w==;
X-CSE-ConnectionGUID: gX3VxaVTS2Ww7rG7Ky2pvA==
X-CSE-MsgGUID: IeBJonu/QxayrZEVPotLlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="67621595"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="67621595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 04:47:45 -0800
X-CSE-ConnectionGUID: rnOix393Sf+yFRekIZYpzQ==
X-CSE-MsgGUID: AZoJV947SjGkle8+AiuiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="200132918"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 04:47:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 04:47:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 04:47:43 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 04:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3upy8QR5zHSNpzjvvEGUZ6oFboH9S/fMEIrm6c/uzDD65xEBiDBzx2k4w0/oAsOBtic7sP1iRHTDw3l2gsY+MC6F7+du8BwC0S4lp7X3ZXrVvJ4M8UHWI0u+11qv68vqKbYKwKXztjZFKVCbPloxwjn9noqiVu1Vo7TKUyxDVyHmGkRy929nXKZOO+zT4BoDvohXz63VRQ9/kNT0T8JMHfBKQtsfGVji8mw8SbnPYmNW/8DY7GRnCZdlhFvWAOndTZlQeCHFhRBebjlZWgrf6jetVwmpDAAZ3qQJRBOY5UftTwgUEvPHeIZ8saRyGz7Izk9hJmZDYl9ufRfUCq43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huwDXXHKHMk4xlgFnQcgTrooU7upY6ynSVAlIBA2nso=;
 b=wAmohn/MHPMctEJ7PQLHqfkvzJy/AqqSt0nfgO3g6rnZt/L/CbTMguDa7HzBHQBIeBz3u751mZwtyLqqvNhvy8OaU6V+9Hb7rYUI0Q6BZn76mial2GomLwBJnszDYJ6Cregt/vyFpnouMsc37VFndRzrYE8Hj4P20tCEVxVSAkRmquk+e6/t8bAhM6ZSNNInv0XUH2Pypu+B0gF/v7cZrHWieqIxCrIhAnjCBUrmSX8efZA9TBdQnD9IDVWwSUwjkoatIV98SOlp8fQG4sxcj3G4uL+CTsnVeVvMdGvF/hUtnCY2IERc3Atia72K2G/qQWrBufmyZgfFQp314th4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA3PR11MB8965.namprd11.prod.outlook.com (2603:10b6:208:582::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 12:47:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 12:47:41 +0000
Message-ID: <54c40d40-f365-49cc-93d0-b40a8db54585@intel.com>
Date: Mon, 29 Dec 2025 18:17:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Prepare GVT for display modularization
To: <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>, 
 <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA3PR11MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: bc93fa5e-7431-4333-5079-08de46d8744d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZYS1B5cjhZOG9XeVVkT2cvYzdJVlJIWm9RWTUrRFZ2TDNBQ2xrZHdMMVR5?=
 =?utf-8?B?dU5tcWsyZElOclE4RG5PL0FFR25FZ0dQWWF4NHFaa09oNHFRNGhwOWFkRitL?=
 =?utf-8?B?clZrRHR3NzZVakU5Q05UUjR3WTF2dDYrTGJDVVE4Q003MTJxUHh0Mm5zbXRK?=
 =?utf-8?B?NTkwQ01rUitPRkFqYWtveSttRTM3VnQvajlCbHZLM0tyRGpJb1NVWmFMN3Qr?=
 =?utf-8?B?U1V1UUhvY01lYkZwQUtudGtjcDJyZ2hNZG95Sk5PN0ZBTmtwMW5ZcmloaHIy?=
 =?utf-8?B?YlE1M0NTQTNHWDB1MGFUWnlSVGJwUXprQ21uVVBRNmFzZVVpQWsxWDllc0Nv?=
 =?utf-8?B?TWNENndTSEZucU9jQ2lpQlFpK3B6cTRXNTNQT0gvdFk2OEcwa0VRUGdJS1RD?=
 =?utf-8?B?aXpLb2U0Y2c5SXJCOE5ISHhVSFdQNjl6bW9SbGpzQUpIbGVRcDNZQ0E3OEZC?=
 =?utf-8?B?R2NDUmVORERCK2RNaDJ0M2xWYXJQOTRxVnVlNC9xaEFQK1BsTUlucVdZRGJq?=
 =?utf-8?B?dGxMdjR6Q3JjdjM5VEsvVjdvVC9kdEtpQm8xZTYxQlBQaWNVcUJDU1JCWUo1?=
 =?utf-8?B?ekhFNDR4UjNEYnB3QytodkVYV1VJREp2KzJicXlrU1FKbDdLZDg4WFJFckRu?=
 =?utf-8?B?NHU0YnRvWkFjZDhRTnBmWWhoVGVUOUxaZEd3MEg5YzBmQmhwYjVwYjY0QzRY?=
 =?utf-8?B?cVZka2RlQnM5dmFXbHd4Zi9ZR291VHBlRlZuTjJZb2JYeFRCMHVJbGJ5dUNF?=
 =?utf-8?B?Y2cxRDIwdUdyejlsQzd2bzJ3OHkxeWhndGhVTUVuKy9qVjVXbHRwNEtNTHpD?=
 =?utf-8?B?TjVEWC9EMkwrMzR0dEg1V0FOaTVjbkZxc0h5T0xoMmlQdzhZVnYyWTBLb1R4?=
 =?utf-8?B?S0sra01OdU9FUFNHbll6NFZtTlNTdW8wbEgxV3dtcVVrSlc4WU1aVVhnN2I5?=
 =?utf-8?B?RDNZSEhRK1J6MnBSS1gzQkk2VEJ3cjNnN054SEJTUTkrUUxpL203MUpVSHRX?=
 =?utf-8?B?aFhlb2ZjYkV1NlBHWmhFZi81Qm0wUmx5ZmR3a2J4NzNTb21JbDlLckxwcjZ0?=
 =?utf-8?B?UFlpZ1c1alB1YW1sRUhiVjFrREdyZ3JCVkppUXpjYmc5TVVCajBFVXphcHNT?=
 =?utf-8?B?bnFVTnZEcmxTZUFjc2FycndHdEc1YU9VRnNyaUkvLzU4TVFPaXUvdkJIcmM3?=
 =?utf-8?B?MVlpdHFsRzBJSVAwejF5NzdpS3QvRE94TGxJMDI3UWMxTUZRU1laaTNYNXd6?=
 =?utf-8?B?QWhHYUp3TTB1TnIxSkliT2hUelpGTHNXeWpqR05ESlVlV3RmalRWTkY2RHpM?=
 =?utf-8?B?V05QTXk1YTEzQTJFdXhkcktOR2pUL0J2WXZsUXVpYlJ2TnhFMHVUeTFkTkRa?=
 =?utf-8?B?RVNjVmVaSEJFY2hmY0F3cUFuSVpEM3lEWGpxWFE1c3RzUWRodDBjNE5HZkth?=
 =?utf-8?B?K1BJSlpvNFhlejBPdEo4VldTb281amtNQ0JoK1hJSmRYWU4wV20zMDkxc2Rk?=
 =?utf-8?B?aWFtcEdDc3FrS0J1c2dSTTRWUTdaQVZydThCc25jV2pTNXZ0WlEyTHJMVVBC?=
 =?utf-8?B?SC9qakJTSUNHY2R1bm9SUlhhTGo1d0pGdmRDM2hEeXZ5QUgvUWtBZ3VSVW1E?=
 =?utf-8?B?cXF1V3JVT25Wc1pnbDVDS3dTMkFZZWt3R3dnTDJJMVZCWEEyYUV4T2FMNDM0?=
 =?utf-8?B?OWxpTGxLbW9YQ1RUOFZMZytkQzhuRlVxUHFNZ2pMSHRZUXZPZGpIcmNJK2po?=
 =?utf-8?B?UUU1alVmUkErQld3SU9mZFViQzJlTURXVmN3cVI5R250TXhHd0V1UWMwZkNQ?=
 =?utf-8?B?MGF0aTlISEJaSFNhYXJvZm1QbnVhYjV3ZmlXTi9GNjNVYTRsK0kyWkFQL0o5?=
 =?utf-8?B?OW9KOXNONmhtNXJRNXJCeXlPQ2hRNDFLNHJyTkcvWGY2L3RvN3drQTl4dnF4?=
 =?utf-8?Q?cSVJPMeUgE+ZP1u1HTKl+8zS6rI4xDPO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVKclA3UVcxVENwQTltRGc2cXlDOWtDZ2FYdlRJNEkrNUFwZ2NNd3ZoclNQ?=
 =?utf-8?B?bkNOYzIvK2pGeVlwaEM5ZFhaQ3ROb3dOY29sRFFCMkhxMEpEc01TSmk0NkhG?=
 =?utf-8?B?N1NJWERtc0V3YnlUUURLSGtZa2JCRjRkMHdXZHJNYmZ2TFRxWHk5T0FhRitL?=
 =?utf-8?B?UkRub081L1prU1ArdGlNemExOUhXWC9NTzMxTG40cENiS1RDTUlXVkZJbFE4?=
 =?utf-8?B?Njh3NGRJa255ZVN3eEoveTdSRmtPNDF2YVJRd0lQWlN4ZWFCbXVrQTZ2ZDNM?=
 =?utf-8?B?M29tdU53U0FWNk1TUDd2MzA5bVQzeGN4WUlkOWpEQWFTditSamVhUFp1RUZl?=
 =?utf-8?B?S3FmLzBESHNQSzNldEhPVG1SL3ZTbEdXb0xqanV5SytuWUwzeStFNy9kNjRt?=
 =?utf-8?B?RlVMUWZsMTlmUHRyMHkra016eWpjd05Cbnd0eVJBaEsrbGZZQURMWk8zZmxG?=
 =?utf-8?B?VjI1NnRNT2RNa3hqaXgycmdaWG9WZTRMT2czUnQ4c2V1MXV1NUVZQ3d3Szl1?=
 =?utf-8?B?V0hHMlZuL3VXcm5oYWVSSVMzRjI1anIxTjVIWFJiSVpKazF5NVB4QmZBd05C?=
 =?utf-8?B?Rk82SXdhdno0NVBkZDBWYzYrRmxtOFpiOFNxTzEvUU5Fak9iM05zSmdlMXBk?=
 =?utf-8?B?RDFYcW8zV2FScTB3eXE1OG5YWnNKV3AzSnpoMGQ5cEVWM2lLL0p4OWM0Vlc5?=
 =?utf-8?B?aHlDaktOOExSNjdXS1ZMSVdqb3g5c2doc0pncnZvTERqMW5ZR1A2UjhUNzY3?=
 =?utf-8?B?c0pSZzBLL0pQaURCR3FHM0luTEtDZkUzRkVQalRmV280Q3BSajU5bXV2bmdy?=
 =?utf-8?B?dmVCWVI4anhMODZEQ2xhOTFzMWFoTWZHaUFYOTVjTEFpUGNpamJwQjFmZkk2?=
 =?utf-8?B?Mzg2a3FrczJtQVR2eS9uUTVnSHFGUG9uNnNucUtsQU5rT3lzZEU1ejN4UGh1?=
 =?utf-8?B?dlMzWXFkZ1VsdW81anJSR0g2cjBBa1QwempLZS95azJ4NFMvM3hxc2tHd0hQ?=
 =?utf-8?B?b3FKTFFROThNczBBRktjVmhDSkYzZ3EwVGJQQ0JCV01GNDQzVHZxSmZWaWQw?=
 =?utf-8?B?SlUyQUlNR1grM1VGRmFTMU4yZHRrZWtuR2ZCWFF5K2JBbStQMGRsbHZmRUZQ?=
 =?utf-8?B?bWxZd3BWQm5CNERQclZVUzFhOUQxR0JIb1F2dVNiVjRsOGxiZWRJSUVOWWpF?=
 =?utf-8?B?SlR0Z1JPamM3WTVTQi9NUmlkb3Vpc1FmaXdaYUpPMWFKeHBpYVFybXVvU2Zs?=
 =?utf-8?B?RXVLWVVPTEd0NmJyNDU2alo4T0FBNnNCR1JZUm9nZjlsbng4bnIwKzRhZ2dV?=
 =?utf-8?B?Slp2NjVWbk5NaXd3QnZUOGUxNDgza3hGRUVnMDdXSExpNHlSempQbjJ5dTBt?=
 =?utf-8?B?TE1FMC9pNXZTSWptUUt5RkJXMGRtZzFna0l0ejRNd3JOUktGSitKYkdDVGlK?=
 =?utf-8?B?T2dHZ0d3dm9lSlNLK3hVR3FQZjNmSXpNanJLc3FpTENEZVBSM21pWHVWQlM3?=
 =?utf-8?B?aVRBUmk0V3NxZmprUyttbnpWWVRnak8ySWdkeGlHTGNUNFdNZmRjYnhiYU9U?=
 =?utf-8?B?NmMwN05zd3FEbU9EdHRhaW5qeHlENmR0by9FOU1LWi9wQzU5VnVIdmpKVHVF?=
 =?utf-8?B?SVRBZnhpZll0VWNvbFlBT2xGTWl4WEFUTTh1dUpQbEwrL2xDY1lsRkphcTZq?=
 =?utf-8?B?STdxOHU1UXg1TUwyd2QvUVVvNXczNWxVRmZXTE90ME15ancxYjZuVVRsVmRU?=
 =?utf-8?B?UXdPMWVWSnY5d01Gdk5iYkF5VUdSMEtlTUUza2JRUy9lZmdHTFIwZzZBTDRS?=
 =?utf-8?B?dE9ISmc3dWxwSFdlSktMYUdSb2JZdTVvR0taUE80UHVMSTIxd3ZPNTJTRGp2?=
 =?utf-8?B?U29TcEJUeEJWNHBiOVk4SEVML3I1YU1aTnhrOHltQVJaOE4rY2hLNnhCNHo3?=
 =?utf-8?B?c2ZBZmE3UU5wYlN3N2ZRM3JJRHJoaUtVdnh4VjVyNFlyaFdxV2NFdVRWdFh4?=
 =?utf-8?B?MTJBaUxkNk8xNDY0L0FjTURQQytpWVZVUmgrcGlEODZUeDcrZWY0UWxyVHRl?=
 =?utf-8?B?dUtRMGtjeG1JNGtIdnN0OVlObmZGVlRwRGhGTlRyRVBLdmNZbmtCLzVGSXpy?=
 =?utf-8?B?OVNmc3ErY2Y5NExJOUVxZnBJcys2cmxlM1BlcVhwdGpKd0l0cUdVc2ZuVkhQ?=
 =?utf-8?B?SzB0anlubGs1bjBDUGppNThLY1drRklJUkxTM09qTEpCczJmUWhEbkh2cVJQ?=
 =?utf-8?B?SUMrbEF2Yy9LYllScExKbENONE4vcGlLQ09MVnhyQkJnekFTQ1V3c3NTL3RP?=
 =?utf-8?B?TlF0WnlJV0VYbitzUUFNM09ocWNOVHpVQXdUWERVUzU0aXpydmRlWi93WXR0?=
 =?utf-8?Q?Nbo4ssa+/wPXjhoc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc93fa5e-7431-4333-5079-08de46d8744d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 12:47:41.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: as+eHAq7QCeu1KKmIFbuJdDa0hHS6W3dIa56rsN6hn0t9OjYQuuumcbRSibVhTWZEacR11Kh4RvgtBfM2vtLChAVfVEs8c6ySDBS/ocKiAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8965
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


On 12/18/2025 1:52 PM, Ankit Nautiyal wrote:
> GVT currently relies on display internals through register macros and
> helpers like for_each_pipe(). This tight coupling makes modularization
> difficult because GVT should not access struct intel_display directly.
> Add an API for GVT code to expose DISPLAY_RUNTIME_INFO()->pipe_mask.
> This series introduces changes to make GVT independent of display internals
> while keeping existing macros usable:
>
> - Abstract offset calculations in display using
>    INTEL_DISPLAY_DEVICE_*_OFFSET() macros.
> - Add APIs for GVT to compute offsets and pipe mask via functions.
> - Update GVT to use these APIs by overriding helper macros and
>    for_each_pipe().
>
> Rev2:
> - Remove conflicting headers and get rid of #ifdefs/#undefs in last
>    patch.
> - Wrap macro arguments in paranthesis.
> - Rename for_each_pipe to gvt_for_each_pipe.
>
> PS: I have not yet addressed the question about whether we need to start
>      using _MMIO_TRANS2() instead of_MMIO_PIPE2() in TRANSCONF() macro.
>      That likely needs a separate patch and discussion.
>      For now, I have kept the patch#4 to deal with the
>      -Werror=enum-conversion:
>       - drm/i915/gvt/display_helpers: Cast argument to enum pipe for
>         pipe-offset macro
>
> Ankit Nautiyal (7):
>    drm/i915/display: Abstract pipe/trans/cursor offset calculation
>    drm/i915/display: Add APIs to be used by gvt to get the register
>      offsets
>    drm/i915/gvt: Add header to use display offset functions in macros
>    drm/i915/gvt/display_helpers: Cast argument to enum pipe for
>      pipe-offset macro
>    drm/i915/gvt: Change for_each_pipe to use pipe_valid API
>    drm/i915/gvt: Use the appropriate header for the DPLL macro
>    drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs


Thanks Jani for the actual ground work, suggestions, for this series and 
for the reviews.

Pushed to drm-intel-next.


PS: Fixed the SPDX license identifier styling for the header files (and 
the checkpatch warnings due to these), before pushing.

Regards,

Ankit


>
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   .../drm/i915/display/intel_display_device.h   | 17 +++++++
>   .../drm/i915/display/intel_display_limits.c   |  0
>   .../drm/i915/display/intel_display_reg_defs.h | 15 ++-----
>   drivers/gpu/drm/i915/display/intel_gvt_api.c  | 45 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_gvt_api.h  | 21 +++++++++
>   drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +-
>   drivers/gpu/drm/i915/gvt/display.c            |  9 ++--
>   drivers/gpu/drm/i915/gvt/display_helpers.h    | 27 +++++++++++
>   drivers/gpu/drm/i915/gvt/fb_decoder.c         |  2 +-
>   drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>   11 files changed, 123 insertions(+), 18 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
>   create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
>
