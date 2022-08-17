Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49481597759
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Aug 2022 22:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6B7A66F3;
	Wed, 17 Aug 2022 20:07:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59E0A667C;
 Wed, 17 Aug 2022 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660766861; x=1692302861;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F1SktRwo2Ob05uPVGFC1dmpB+VMBXf+M61SkUz/1oEE=;
 b=WU+c34ALzwLm+DaB5Wuxn3hgMnSTCzWsVyblqCATp+fElVSID018z6mD
 GoFy2b0Ba4ZR5Z55mEyEQLGyjvcY/Eoa/rbwUYZo15KGW6U991qxAo1QI
 PaSrbncFCjewraWCaISdtIhN1IlEn/tNIWrdC40Kfb0vXVPNE/DVmnjpF
 f6NZe5sOHjUutmD50J7zKZq0QiltrKvWUs8E26lD3cvDipvKEKakWSPqS
 NGCylh7FXBKdM+b02FbGKqS155zwphIZmi5cRSbypPO3eMswtp0Gz8p8p
 mJiUh9T5cibvZgjnbc7Z8M3hQz4DOyE/1Ko2TPgiw5Nd1ojSEVsMPE8hg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="272985892"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="272985892"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 13:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="675775282"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2022 13:07:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 13:07:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 13:07:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 13:07:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVK1UgKHFYl6wO673QzX/KRNRlbRE4/TTqB+O5IbnnJGUhbhfjAT7GsBtssNixil4wItxue9NqN9/HdXNs+Ty5pTHSiOAhcjy5loWWXNl3BapSN7WAOaIn89Qv6gksX89PqkhT6Upl1/amPhzq6yRjF4un8SaiBB4WaGdAA0ZAypwqxnetUD4uCUxnzuS5NLJyImzB9Irw49RXtHkC/ywAkF03IkAyi1VIeXmgbBKNUIUZYesvrRZGa9MROU0jABvQVj/QNLMCfn8KDBUMDAYoWV8YzuwgmIxZxZ/8tRE5zn3INfDl3HYzItZVMzqyn4oaLEoI4cDxqtIBPOXsJyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1SktRwo2Ob05uPVGFC1dmpB+VMBXf+M61SkUz/1oEE=;
 b=fQv1btYAEJg/eP3sgkGc2umoHKZwSTUEvP4OG2Gs456To4QGUVsZk2zWNp+ACVKGCC+GHns2liQQSJu9MyjzWMlBQHNc0Ol2HVhuW8n+aD89IA4lYdu58LE5Z/pxPYlNkekcNVzf6Lhi9RevUqNfj5lJq/1PhcHzwiytRLKH2qAjoC1OChKHo66ENZAyUnu7X8lSIzo0pkfCtWM1QAyLodWamtyYfF+HF2ojAUdodEahm486vj4ybB7gpVgFS0l6bD3h5+t2gB4rdZ0muluaxqE2YZ+Xu2RrevZeTDJ31gfaZpX/thNnKbzoe1r/F5uvf7Cfc4roFbdhyPXs2qABng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 20:07:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 20:07:37 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "colin.i.king@gmail.com" <colin.i.king@gmail.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "King, Colin"
 <colin.king@intel.com>
Subject: Re: [PULL] gvt-fixes
Thread-Topic: [PULL] gvt-fixes
Thread-Index: AQHYsFOkCKMg7zltNUWqWYQzDrFnJq2wnf2AgABMGgCAAAqYgIAClKYA
Date: Wed, 17 Aug 2022 20:07:37 +0000
Message-ID: <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com> <20220816040508.GG1089@zhen-hp.sh.intel.com>
 <20220816044303.GH1089@zhen-hp.sh.intel.com>
In-Reply-To: <20220816044303.GH1089@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f20de6a7-8709-4381-e549-08da808c21c6
x-ms-traffictypediagnostic: DM6PR11MB4707:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bvs/f8ZTqP+463cFzXeWJo9RyVtHF/Cg0xhjBbqRgjdImvEiVxxwdIWVjhqDDG0JqpaLKy9tDWW2mDucOc08o6lfXKLnkCykp3VTQOpdg6kRpjQzQZ/0wTkHST45CnFegOM5vkE+8MBfytiGcIxg7Q6rUm3EHm+UWfqtW8lNOdrCmfWHfBZAUkItypzBTqNjiApZ6FxX0VRB5zsHQHA1m+ImT5fYRYvLpBAQWcHUBj3rWr/m/6UMqq1dfJLXtHCK/iVfFEmyhv1ijQ3KXKBaHO/RqwrPFFXhfds95DQBvobwADSBPyZDxDsq3gbNAWT8cUAu5sesxql+f8E6FTsLlQP8CVCMUOl/GVNBTIOjq4TyDQBnCC/mBsQnsxA0SM1hZ4BN7hfy5uukIXGKyjE+2QNLUkvp0BCUDBFYACUeVjVO1NAgO9tKF0DzFeYr99DNVrZFOBJApMreWr0EU9xbQweRbboIftpju5JAKKyP8gM9isSDRdc+4SA9CNk4S9DFkoEXcciBSfZxVxusSmRHVzNPzkGbBXQALz9KUpUCIvo73Lvg5uiYOzloE8qohgQwZV0hVWBYLQtp+vWZXJ5LiVCrpCB9O305KIl/hbq4tx+bafKyGJb6rhzyU6sF44LBR8fDEMmCYpEX3wKNkyYQC6nRfXyi/ZJd8SyXFU1t4GQ2sVHRyVBHT2/+aqve2S3ZC7aMzzBKg1Bhuxu8mKfpPtrVGBRSbTy5FGg9nxBOQZsGLOzrXbHETYqwq7WXeLOHd1LhkciuTBzM4IxqgZ2SdpxT4UoNQ42TiXyHpbLQmCM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(346002)(366004)(136003)(122000001)(38070700005)(316002)(6512007)(26005)(53546011)(66476007)(8676002)(66556008)(76116006)(38100700002)(66946007)(4326008)(91956017)(478600001)(71200400001)(66446008)(64756008)(82960400001)(6486002)(6506007)(41300700001)(54906003)(6636002)(110136005)(2906002)(2616005)(186003)(36756003)(5660300002)(966005)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zy8wcUE5S2h0bHpHSmNhQXdvd1AzSHRNWXgySTVGd1Z4a0Vqb1AvMlRubzNS?=
 =?utf-8?B?NXFlSG95Vmg1S0RTMzl5bEZDNlV3SUk1Yi8yVGk4WmhsSnY1bGtHYzZIdGEy?=
 =?utf-8?B?MUxwVE9TUldlRzdxVzBNc1AweWFpbTNTRjhQcjdOQmczMjNpcEhwOWZKekhM?=
 =?utf-8?B?dFF3c1lnQXJKMlg0bTBpYUZLVGN5dTlsZStQemEvNnJPSktpTjJHK2QzSmhq?=
 =?utf-8?B?SU54di9WY1hXbHlrK1g0SnBqMUI2c25aSXdYYUFTQytRU2FWeTlpYVZFNFcw?=
 =?utf-8?B?VkRyd1Z3Qm55YnRvVFBVbkdnUU12NmxYQXNkRU1idDZFMExnVXptZ2VSU1R5?=
 =?utf-8?B?NHhGYWJjY1UwZWpzQitFZlFkUnp3RmpiekRNUmt2M2pIbXRCY0hPR0V4RTMv?=
 =?utf-8?B?UTBHS01QSEQ0d1lrY2ZmVmE4dDJvcGZtWkMxUWpQRnVWVlhvbkFGM2xISFk0?=
 =?utf-8?B?N1pwOW0wVnRjY29Fcng1T0N3cTVzOW1pT1dhaUxOR1VRRkZPQ01ZemRVZWIx?=
 =?utf-8?B?cUtKbi95UnVwWnk1N2xEZWVBeUg2L2tpaVFqSEIyU1VxU0JScGVvaSttczJs?=
 =?utf-8?B?THczRjR4VTdBMmNwYXE4azBxdWlMZ1F2Y3g1M1F1Smw0WHFQN3UwQ0ZqNksz?=
 =?utf-8?B?Z3BxbnVLcmpoR2xLZUQ3dG92eVZZSWpZQXRoc3p4ZnNidHRCM3p2c1NvSEZD?=
 =?utf-8?B?cjJMc1dFTkxudmhKMnNsWTFocnpWMUI1Qkxud2RQeWtFd0x4WVpidUNyNExL?=
 =?utf-8?B?OGVxODU0QlNxNExSNUc4OHpTZmpVR01sdEV6YStyODF0OFl1NG4rKzFYL3VU?=
 =?utf-8?B?RkRrVE83c1VIdnlNcko5d1NJa2E4cFRtaU5kTUMzM1d5SUZEQmt3VHErYkpD?=
 =?utf-8?B?MEM4VGFDZGZzNDF5OFhTSGVZdVlQcG1ReTVLZEJYR0RmNk10aCtEWHEzVkpM?=
 =?utf-8?B?QnBJL2IrMysrRGVnbStoOG5hSzcwdi8zUmpZVmczNWxwczF5NTduYVlWRi9S?=
 =?utf-8?B?QlFJeGJhOE5QYlhFZjFoSk8wU3dPMWJDQjFvTFBzY0R2Q2M1SjNORVdEYTlN?=
 =?utf-8?B?MTBPNFhTYU9FcU5WSURYS0tibkN1dVNCTHNTSnNGUzZ2YzVMb3ZrbmxmazY0?=
 =?utf-8?B?V1dFTXlGdGVHVFZOWTVOZUlHcDQvR2RJY1N2bEtBWkhydzZIK0ZNcmdNYmE0?=
 =?utf-8?B?akpqOUxVQU96dG4xVEZXeFozL0gyekR0ZmhiZFVtNWMwbVdlU0o1YWxlQlhh?=
 =?utf-8?B?MTN2Rzc3ZWRjMkYraDgzNVI1bk91cDVZT3hpN0JtRnllaFFBVnBnaGJWazVv?=
 =?utf-8?B?MEx3c2JvcFNROG5zTlNnR0tqYzd4eU05M1FyWjlRNTAwNUIvOStVdkNNME9j?=
 =?utf-8?B?V1p2M2ZjQzVHVUcvMUpWWUVvQkJ2ZVRNRStzMC83YkNhWjl3N1V2L0lWK3hC?=
 =?utf-8?B?cEcxUVVYSU4zLyt5UnlNTUlkbjl3czZpd0pRZk1PcnN1V3MrK1cwVis4M0RT?=
 =?utf-8?B?Qk5aTTdYdHFPYTVhWmdnOVpCanVDeVZkV3NneFg3dmdvMlBUY3VKdzFPaXB0?=
 =?utf-8?B?Vk1OSWNWcUNqNWsvb1ZKYVpMbnpwN0RueXYycnpPSXFoOHRHcWZZa2hTd1Fl?=
 =?utf-8?B?Y01xNEVaN01IaXd2U2VSaGNLeWhnQ0JhcWI4TEJZNzN3QWc1LzgwM2hsK2Fv?=
 =?utf-8?B?Y0lhc0c1UVBWclR0bWduOGRON3pYMFRoRU9YZ0pMS3hRd0pMTXk0a3VGd2VC?=
 =?utf-8?B?bER5QnEvczZ1T0ZJUGlEV002a0xOZTdkSmU1L1Y5enFoYlFBa1N1YmxrYkVI?=
 =?utf-8?B?S1VUUlZRQ1N3cThRRVR3Z0tYdEJpZk42aFJWUnhwS0pLdWRTZkdYMjlDYm5y?=
 =?utf-8?B?OFBhenZ1c0ZxT3FuUDV4cTUxZkZGZ0RlbjBNZFJWblJ5MENUZ0Y3aVo3OU96?=
 =?utf-8?B?UG1CR0lVbUpnK0o2SHgvWjRKclYzbzE3Wm9HUGloQ29kM1djVjZWdW5jUWov?=
 =?utf-8?B?L3ovRG9STk9SVmVnMVcydGd0VGhLQkw2QlJWK1NRNTE4MmRGU3VuSUFHM0ZN?=
 =?utf-8?B?cjBudWRiKzkzME1WZVc3K3JWQmlxWnh6Szc0V296WHp5b1I1cUYxZ3g4WGZ6?=
 =?utf-8?B?Mnp5UVlWVnMxN3M1UnA4K2llUEQwaEJ4VFVXUG5XS0J3NmxRTFlyZU5YSi9X?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8176322E1B23240B97E25D28E1FE8A1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20de6a7-8709-4381-e549-08da808c21c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 20:07:37.6181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eElJE0tcBo1LYUcW5Xa7Vq9VRzDTDWrS8UM6fhvOy5aB21pNQAdXmtFlKz5uobUDgI11a+KqqruLZgeKBydoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA4LTE2IGF0IDEyOjQzICswODAwLCBaaGVueXUgV2FuZyB3cm90ZToNCj4g
T24gMjAyMi4wOC4xNiAxMjowNTowOCArMDgwMCwgWmhlbnl1IFdhbmcgd3JvdGU6DQo+ID4gT24g
MjAyMi4wOC4xNSAxOTozMjo0NSAtMDQwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+ID4gT24g
TW9uLCBBdWcgMTUsIDIwMjIgYXQgMTA6Mzg6NTVBTSArMDgwMCwgWmhlbnl1IFdhbmcgd3JvdGU6
DQo+ID4gPiA+IA0KPiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4gPiA+IEhlcmUncyBvbmUgZ3Z0
LWZpeGVzIHB1bGwgZm9yIDYuMC1yYy4gTWFqb3Igb25lIGlzIENvbWV0bGFrZQ0KPiA+ID4gPiBy
ZWdyZXNzaW9uDQo+ID4gPiA+IGZpeCBmb3IgbW1pbyB0YWJsZSByZXdvcmssIGFuZCBvdGhlcnMg
YXJlIGxlZnQga2VybmVsIGRvYyBmaXhlcw0KPiA+ID4gPiBub3QgcHVzaGVkIHlldC4NCj4gPiA+
ID4gDQo+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiAtLQ0KPiA+ID4gPiBUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0DQo+ID4gPiA+IGE3YTQ3YTVkZmE5YTk2OTJhNDE3NjRlZTlhYjQw
NTRmMTI5MjRhNDI6DQo+ID4gPiA+IA0KPiA+ID4gPiDCoCBkcm0vaTkxNS9yZXNldDogQWRkIGFk
ZGl0aW9uYWwgc3RlcHMgZm9yIFdhXzIyMDExODAyMDM3IGZvcg0KPiA+ID4gPiBleGVjbGlzdCBi
YWNrZW5kICgyMDIyLTA3LTI1IDE1OjU3OjU0ICswMTAwKQ0KPiA+ID4gPiANCj4gPiA+ID4gYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+ID4gPiA+IA0KPiA+ID4gPiDC
oCBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdMKgdGFncy9ndnQtZml4ZXMt
MjAyMi0NCj4gPiA+ID4gMDgtMTUNCj4gPiA+ID4gDQo+ID4gPiA+IGZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0bw0KPiA+ID4gPiAzOTRmMDU2MGE3NjI5ODg0MmRlZmQxZDk1YmQ2NGIyMDNh
NWZkY2M0Og0KPiA+ID4gPiANCj4gPiA+ID4gwqAgZHJtL2k5MTUvZ3Z0OiBGaXggQ29tZXQgTGFr
ZSAoMjAyMi0wOC0xNSAxMDo1NDowMyArMDgwMCkNCj4gPiA+ID4gDQo+ID4gPiA+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ID4gPiAtDQo+ID4gPiA+IGd2dC1maXhlcy0yMDIyLTA4LTE1DQo+ID4gPiA+IA0KPiA+ID4g
PiAtIENvbWV0TGFrZSByZWdyZXNzaW9uIGZpeCBpbiBtbWlvIHRhYmxlIHJld29yayAoQWxleCkN
Cj4gPiA+ID4gLSBtaXNjIGtlcm5lbCBkb2MgYW5kIHR5cG8gZml4ZXMNCj4gPiA+ID4gDQo+ID4g
PiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiA+ID4gPiAtDQo+ID4gPiA+IEFsZXggV2lsbGlhbXNvbiAoMSk6DQo+ID4g
PiA+IMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBGaXggQ29tZXQgTGFrZQ0KPiA+ID4gPiANCj4g
PiA+ID4gQ29saW4gSWFuIEtpbmcgKDEpOg0KPiA+ID4gPiDCoMKgwqDCoMKgIGRybS9pOTE1L3Jl
ZzogRml4IHNwZWxsaW5nIG1pc3Rha2UgIlVuc3VwcG9ydCIgLT4NCj4gPiA+ID4gIlVuc3VwcG9y
dGVkIg0KPiA+ID4gDQo+ID4gPiBkaW06IGQ2NjMyMzcwNTM2ZCAoImRybS9pOTE1L3JlZzogRml4
IHNwZWxsaW5nIG1pc3Rha2UNCj4gPiA+ICJVbnN1cHBvcnQiIC0+ICJVbnN1cHBvcnRlZCIiKTog
Y29tbWl0dGVyIFNpZ25lZC1vZmYtYnkgbWlzc2luZy4NCj4gPiA+IA0KPiA+ID4gaXMgaXQgcG9z
c2libGUgdG8gZml4IHRoaXMgaW4geW91ciB0cmVlPw0KPiA+IA0KPiA+IFNvcnJ5IGFib3V0IHRo
YXQuIExldCBtZSByZS1nZW5lcmF0ZS4NCj4gDQo+IG9oLCBzdXJwcmlzZSEgSSBqdXN0IGZvdW5k
IENvbGluJ3MgZW1haWwgaXMgYWN0dWFsbHkgZGVmaW5lZCBpbg0KPiAubWFpbG1hcCwNCj4gc28g
YWxsIGhpcyBjb21taXRzIGluIGtlcm5lbCBhcmUgY2hhbmdlZCBmb3IgQGludGVsLmNvbSBhZGRy
ZXNzIGFzIGluDQo+IG1haWxtYXAuLi4NCg0KQ29saW4sIHdvdWxkIHlvdSBtaW5kIHRvIGdldCB0
aGUgU2lnbi1vZmYtYnkgaW4gdGhlIHBhdGNoZXMgdGhlIHNhbWUNCmFzIHlvdXIgYXV0aG9yc2hp
cCBzbyB0aGUgdG9vbHMgZG9uJ3QgZ2V0IGNvbmZ1c2VkPw0KKHN0YXJ0aW5nIHdpdGggbW9kaWZ5
aW5nIGluIHRyZWUgdGhpcyBhbHJlYWR5IG1lcmdlZCBwYXRjaCkNCg0KVGhhbmtzLA0KUm9kcmln
by4NCg0KPiANCj4gU28gbWF5YmUgSSBjYW4ndCBjaGFuZ2UgdGhhdD8NCj4gDQo+IA0KDQo=
