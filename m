Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56EC48792B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jan 2022 15:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249F11216F;
	Fri,  7 Jan 2022 14:43:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C09D112119;
 Fri,  7 Jan 2022 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641566612; x=1673102612;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=XddcBdOfXKHdZxYdQ6Li9hOeo+HUADeezP1EKrq15/U=;
 b=ifZtKjzKDDnqJCphgezibYcfTqq8Px/i0lY0nzguonM+NZs3nInRGCOm
 1k/NiS+wZzvIZuLSNhktNoPeXkQy8Mn3UYOwLsqAzZ2ECFTjK9oBYnx2R
 x8qo2zQjaS0QwpCdOljbgJ30omrKImKJo3cDp8d4EUTRepDfH17ELuLBn
 mKw93DcY6ECxiECi86zonp/T9Nkp4z6BfKgZ1Ru3apPMo19Oa4PqSVUXA
 i31bBhgqT7iFIBInQkMuwullYX/KQbiDFCLa26C7qDJwPgoxoroRSp6h+
 LEfj0IURlw81iYXC1+8jOWlYggVli5Iva7HJ+bPabhzAjasrxZsSQ/A24 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242673963"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="242673963"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 06:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="763858502"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jan 2022 06:43:31 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 06:43:30 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 06:43:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 7 Jan 2022 06:43:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 7 Jan 2022 06:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIRTkie4VJsjjBwkk/wY5BF4Zh3DoUL4/yFPQxAiQURGemi1dkiBucNyBLz5/FWZ/i1FYPgRwN6M5C3u+xmSyqA3wfvHJPPx2IyLVQh3jiu0ywhEHDxHTTV3AtueflZlXzsZdkPLL+Cyg2dVuSYaP9Eb129XPdC0XnYBDX0tK71fHjwkh72kgJpr4VtduYbraWlUQavA1RmnS/8EcH0SqOdmEu8M8SVw+oqs8b+mjVQTo/9MYIF+8EaTd/AxpBGRC9vKUFmHWdIV/lTRk2RUPXPwJiDCFCGztAdz7XLo97BWdQVxDd2tAYsigSD9OlyJ2xNbR24vUkTNjgfDrrqtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XddcBdOfXKHdZxYdQ6Li9hOeo+HUADeezP1EKrq15/U=;
 b=C3EPrAZlDNKOTedHaA45/gWcIwvLZOyiF/hHN3AdL+1j8jamcupu2WTFfM7AoMVwBlK2krZ7Jjp+5mW76BxI8mKlvvS4F9HMFq8T1EWYstSRqoIr5NqXMpdUchEIlBltBqrUikbCrGi9S0mqy4yqOcchNjJMVZtXglRmNJk9DvfNHzurqgEKX10WBMY3FUuJ3QtoiTUCfJN/yLh7BpubrL9deezMYxwe+jlyJAvmBJu6+MtbdmZFZlShLlPyIyh1j9zgaJQwordsY1eqQJ80/ES5vjzse097dsYm0pyEvdE0PQcyVtd1rdU0w28APS7z9fxGV1yKX7Hlf3QKjG6zOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB3834.namprd11.prod.outlook.com (2603:10b6:5:137::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.7; Fri, 7 Jan 2022 14:43:28 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47%9]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 14:43:28 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYA9Tuucz5FdQejkegRXcQeTo5ng==
Date: Fri, 7 Jan 2022 14:43:28 +0000
Message-ID: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf5020e5-5002-4d56-027c-08d9d1ec1187
x-ms-traffictypediagnostic: DM6PR11MB3834:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3834B02EC6D8F5FF68A11ACFCA4D9@DM6PR11MB3834.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:473;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dnEvXBf0iF//jhPOMb4amiCsNxzzUqo7f9jO7dcWOWMlK5yytIZo6qLIHTg9htonlvV2kAjAWVdcmxZL4jcexM1D8Vhm40EEQEUyoZ2ZIvSTlSQev2EkUiv6nHMev1OdaxUkPuVk4+mJiJwE+395uKSK8Jexf4kegg82amm3j5XAo18xikLS0BAF1gk3Ahcs8H8n09QVmjD213SpEcSQXa7Vgj7XQZbYZUTsAaSlvZZ9zPeeaKUJ7ualKU1sutGO3qaEedpFTND9svdBEjNZiAcde4pw0NxusmaY3ogja0I4fYSdfwxEal8JsBrajw3OE4jY8ZKAVYx1ImujfccOTispGJ846ApBHQgsTM9OOEyirOpG/rX1GaDGl4T9qpwKBihDrN2FLrKvCLgMAg8EdXAwURtkiUuXPEsk95D7hWW64IfLq1pR1BoGGOLWIpmh1ZJTP1qu7cwUHPe66jJFfXBKqBouxeeyc5HaH45PP1db1tQbWfUKiSsDkUdPwckN3+pZ+5aA3cbBA2bAD2cm8KfIsnwkVRSXnv9ZHPkZpxQ8GFvaOUkqPrx5WqrvFwkJY8A3ByleaoX00xFz0ZiVy1QnDdfDt+JGW6yiPynLO6k1aas+vQ/c9giiEes1vhxbHBzdBLfH9AvjMo5n/Ib1bOoTxzBSwNjUiGRl+FrNBVypkaALb1DvYKWLpCpykdFIxeNKzpu2ddbMR1d5fkZca6SmgDcOU7uhJHRZCD4PJrukPKcRBwUtEW7k3EYBAUfHGfEAi193be2EBa1JsjpVdjo59HJOd9mSGmLkzQfsK+afnGmXAq2LlNXH5CfnfSQWstTsBAzIbxLE9SXcb227/i+HfnSWdpa3Q0Jr+vsWqDQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(6636002)(6486002)(5660300002)(110136005)(71200400001)(82960400001)(2906002)(122000001)(4001150100001)(83380400001)(6512007)(66446008)(66946007)(26005)(66476007)(66556008)(31696002)(64756008)(508600001)(4326008)(8676002)(31686004)(38100700002)(8936002)(36756003)(38070700005)(316002)(186003)(91956017)(2616005)(76116006)(54906003)(966005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjlVVkxEelJQK1FmQzQvb0ZVTHp3Z1ZrOEcvckovaVBsU3IzWGxJR0U0MDE3?=
 =?utf-8?B?WXp1czM3dTFueXBhWnNYY0NMMXEyUVJOaGtYQjlmbXgzTFZIL2RmenlKYzlM?=
 =?utf-8?B?NnhNSjFGbWdKWU9MWUxxTjF6TGFGeUF5VzlBTUVSNXNZTFRKb0s3aXBCNDAy?=
 =?utf-8?B?KzNlR0pRVm5LUkQ2R2o1Z01nYnRVSVF3NU10NHhwWmJVcXVEYzM1T09BWVA4?=
 =?utf-8?B?Wk9mdU9KZzl6UzNUTEtCVW8yalptQ2RxR24rdmNIeXpERnR5UitZME1DV2NM?=
 =?utf-8?B?ek1haWYwNS8wRk9RY1VkRlpUbFBMTW1GYXA4R1VGVkNETVI0dWdHWjZpTXFv?=
 =?utf-8?B?TEMvOWE3S2QxVVpsWkQzMTNjQlhVSFYvY2FVaG1CUG96TmxNNTBVUGV5eVlu?=
 =?utf-8?B?aTRVL09TdHFLakJvSE12Z2I3V0hrTU1QenNLZjUwTnVmNnRUNXJUaFJFK1hm?=
 =?utf-8?B?cytMRXh3YTRqUUlIS01kWUNSVHNaeitVUHJkV0ZCWHNBd2JocFNYVzl0VHR4?=
 =?utf-8?B?MC9wM2FWTW45SlFTVVJjQStRTkRtNzFXZFd1SEdDUVVZZU5EQzVIWS9sNHNt?=
 =?utf-8?B?S2czUlQxUE52bVNHUGtuRDVhSmtQNkgrWWJDdytxZGtFWHA0eFlmVW9IT05i?=
 =?utf-8?B?R2RVZmd2WHRHV1paTFdBLy94Y2doalExWDBoTkN2NDJTZURhbVF0TDBEclVW?=
 =?utf-8?B?eC8wbitXTlJYNi9MQTZyQ0h5SXB5Q2JNc0U1UkpPUU8vNHhMSmJnZERMbkhN?=
 =?utf-8?B?bko5OVdMSEtSOEl4OXBwTUNnMXBRUTFrNXJ5NE1kUUxBK0tjdnNwNlpKd0VO?=
 =?utf-8?B?WjdhNURBM25sN0JxZ2pnRlVKN1k3ZjFoK3FHWHYwT2w3Z1Rnc2EyZDBhNU1q?=
 =?utf-8?B?RlVSL0hqejZDOVYzNVd3N09VbUdBWmVpaFRzdEpDT3RGNzgvbnpLVmluVlFZ?=
 =?utf-8?B?Zmg0YzI1OHBsUUpSNTJ6VjhrdlFpdjlSZkV0TnRxS21sUURIc2lGM3NpNHlZ?=
 =?utf-8?B?WEhLRFlvTkpoU2lDR1Q3bkxUNzQ5WnkyTnIxOS9TZ1FBTVhDcjFkbExsYTJt?=
 =?utf-8?B?NzliSzNzcUZmRG9Yd0JKWVZTWlQ5RkhidXVDbnk2U0ViMXZRYkJTQkQ4NFlE?=
 =?utf-8?B?TnduejMyNldObHJDWm1tUnJwVjRjMmdUMFJSZk8rZmZoZjVkeU1zWWw3dnU2?=
 =?utf-8?B?aktJTDlobDlsRDhpZURyRHUvM0plQWl4TGUwQXJRTFk0SnFmb2tsT0VIc3Zi?=
 =?utf-8?B?U281QW9YSUtqRE9kOEdhT252ckZ2RW5DZU81cEZuL1VtUWxRa0hQcEdJcGds?=
 =?utf-8?B?RFlvZW9UQlF2TGVTY3FUeDdFd1FadEhWYUtRV2pIY3JtT3ArdDZCZytHdnhD?=
 =?utf-8?B?bXlrdnM3Y2E5cjRTM0htK0x2UDE1Y0ZOTTJoZFRXWVM1Um5WZnYwZi9ZTnl3?=
 =?utf-8?B?WUdicWordlRHOUFkZ2U1dG9KL2d4UFBlYkg2UloyaURsdzcxUnJmRjROUUU5?=
 =?utf-8?B?TzZteVQxUnVRVjNBMXFXNC82SWdNV2dlOGdRV2l3Z3RIZkUxVEgxUWxCVXlW?=
 =?utf-8?B?aW5ueUIvRnNGSm8vNlFLZ1hYWVByaTk5ODBvZ0Q0WGhXZE9NK1hON3pYR0Zj?=
 =?utf-8?B?VmhPaEtuWVRrallVbW5RRU5FbktuWEpKTjFZTndMTGowWnlTd3hIekxRZ0hB?=
 =?utf-8?B?VXlEbFVGamtRRittaXNDWEVaVzJvOEdNT2F5NHdPdVkwemtyMmpyYUdnWnNK?=
 =?utf-8?B?am9HNVZvajZNcXF6bjNYUklnclA3OGZpcXFCRHNEY2VlcC9KcGo0Z1kxWlNr?=
 =?utf-8?B?V1E2UmVad1lxc1JRWVdtcjFkQVZodXNQaE9YaUtqRHh1TFZ0U2EwdkN6dTlw?=
 =?utf-8?B?U3VTZWxrS3lUNSsvZmhrODA3bFdlRnZnejE2eXRpTm5xc0s1TzZTTWYzTDlN?=
 =?utf-8?B?OExZbTEyYTRLYTBWNWFyNFd1a1Y3VlY4VkZCc2xnSnY3d3hTbVFoRkhsb3p1?=
 =?utf-8?B?NWR2RTBmSVZONFFubHZoS2dvazRha2MyemN4VkMwN0RkUkxSazRGTkp0QUN6?=
 =?utf-8?B?T3l6RnpIbXNxdkhoc1NMLzlETGN2K05TUm9JdkFrcGpEQk1YaVdZMitUMnJw?=
 =?utf-8?B?aUMxUTdJV21TV2N1Zkppb3BqaU01WlEyOXUzU1VCcndGVVB0ZHZNVytqK28z?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47C79DE3F032BC42880B3B6A02629024@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5020e5-5002-4d56-027c-08d9d1ec1187
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2022 14:43:28.4621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxqjl3eTkW+aIY72Lv729OAaVQuHTrYuuf6K43kEYUmJwSmZIYIA8nbS1oDTungXdVzyPyk3/JRXCsN/KpNYjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3834
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgZm9sa3M6DQoNCkhhcHB5IGhvbGlkYXlzISBUaGlzIHB1bGwgbW9zdGx5IGNvbnRhaW5zIHRo
ZSBjb2RlIHJlLWZhY3RvcnMgcGF0Y2hlcyANCmZyb20gR3VlbnRlciBSb2VjayBhbmQgUmlrYXJk
LiBBbHNvIGEgbWlub3IgY2hhbmdlIGZyb20gWmhlbnl1Lg0KDQpaaGkNCg0KVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzYmZhN2Q0MGNlNzM2ZmZiYmZlMDcxMjcwNjFmNTRiMzU5
ZWUyYjEyOg0KDQogwqAgZHJtL2k5MTUvZGcyOiBBZGQgc3VwcG9ydCBmb3IgbmV3IERHMi1HMTEg
cmV2aWQgMHg1ICgyMDIxLTA4LTA2IA0KMDk6MDM6MTAgLTA3MDApDQoNCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogwqAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVs
L2d2dC1saW51eCB0YWdzL2d2dC1uZXh0LTIwMjItMDEtMDcNCg0KZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIGQ3YTg1ODU0MzBmMmI2ZGY1OTYwYmJjMzA1ZWRjZWM1YTU1MTgwZjM6DQoN
CiDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IHZncHVfdHlwZXMgKDIwMjEtMTItMTYgMDk6MTM6
MDIgLTA1MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCkd1ZW50ZXIgUm9lY2sgKDEpOg0KIMKgwqDCoMKgwqAgZHJt
L2k5MTUvZ3Z0OiBVc2UgbGlzdF9lbnRyeSB0byBhY2Nlc3MgbGlzdCBtZW1iZXJzDQoNClJpa2Fy
ZCBGYWxrZWJvcm4gKDkpOg0KIMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBpbnRl
bF9ndnRfZ3R0X2dtYV9vcHMNCiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50
ZWxfZ3Z0X2d0dF9wdGVfb3BzDQogwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGlu
dGVsX2d2dF9pcnFfb3BzDQogwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGludGVs
X2d2dF9zY2hlZF9wb2xpY3lfb3BzDQogwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5
IGd2dF9tbWlvX2Jsb2NrDQogwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGNtZF9p
bnRlcnJ1cHRfZXZlbnRzDQogwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGZvcm1h
dHMNCiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgZ3R0X3R5cGVfdGFibGVfZW50
cnkNCiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgdmdwdV90eXBlcw0KDQpaaGVu
eXUgV2FuZyAoMSk6DQogwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IEZpeCBjbWQgcGFyc2VyIGVy
cm9yIGZvciBQYXNzbWFyazkNCg0KIMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuY8KgwqAgfMKgIDIgKy0NCiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuY8Kg
wqDCoMKgwqDCoCB8IDE4ICsrKy0tLS0tLQ0KIMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Zi
X2RlY29kZXIuY8KgwqAgfCAyNCArKysrKystLS0tLS0NCiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndHQuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDY4IA0KKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tDQogwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmjCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDQgKy0NCiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KIMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLmPCoMKgwqDCoCB8IDEzICsrKystLS0NCiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9p
bnRlcnJ1cHQuY8KgwqDCoCB8IDEwICsrLS0tDQogwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
aW50ZXJydXB0LmjCoMKgwqAgfMKgIDIgKy0NCiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9z
Y2hlZF9wb2xpY3kuYyB8wqAgMiArLQ0KIMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVk
dWxlci5owqDCoMKgIHzCoCAyICstDQogwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5j
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQ0KIMKgMTIgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0
aW9ucygrKSwgNzkgZGVsZXRpb25zKC0pDQoNCg==
