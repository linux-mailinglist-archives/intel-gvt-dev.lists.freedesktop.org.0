Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A2D7B8476
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Oct 2023 18:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75C810E11F;
	Wed,  4 Oct 2023 16:05:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B37310E09A;
 Wed,  4 Oct 2023 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696435503; x=1727971503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JQKh7Wboygt5ir5M+FKbYJ72tUmFOs4WHh70ooQExrc=;
 b=Bk+Z0cu6nMviSb9QJEcs0KmS3hIY6Lht3zY0S5DGNsMCAni/H50A3Fkw
 gQGobeRHy68GpO9ttUw2YGUe70wXBovHnWWPZa9aUvlL02rPhYCEvQu/Z
 SuMN4QpeShunWdXGOurMFYaEgNhKvYlHrJTrOJWEpHhDjn1cxCmlNfoGT
 NMlDJQI7pV8bKuPoNBNdeMoxqowe9v6RLuFebGAlX8+PnkMA906acS2iZ
 3beo3prdbYfUy5ITPaGfczBTNzJ+YQgzLAyonnmv5vBl5/nomOZVPqebz
 TM6OCEqxSkf1wQ+44xwXAsb98qgOaohqniSpe9mp5DY42+j+IZA5geZmZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368269977"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368269977"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082565916"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="1082565916"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:03:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:03:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:03:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:03:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7NRjIFHptYpornxh5dv5YKh53MV73xXXfz5Vi9g6oiY/yEzj5VkM6AvDdkQh9Q+PGcJtp80Z52Lz/4aRIjgwCXlQBzr6eASrmYXZ7EOZM1P6NXQHHIzE18dVmOJlB1ZILm02X7NWPgMQ1Dpzjb5VSyOFcD4585EBRlgNtBaNbymewCtByifHIkma7l5BY8v4xRO3hKh/w9aD/mt+GpRj6fUIEI3AxRL0ieT3U/GEBuuv5pkASml/KhpmwBrwU387CjmqfW6K8zquaMCJ3HbGqLMHMFObjj9cJCbPyOvWrPdfIqH4+btl8cAN8HyTQlywE3atFUnzoVojD+e6qnNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQKh7Wboygt5ir5M+FKbYJ72tUmFOs4WHh70ooQExrc=;
 b=bHxtYOZ0RE83lGA8u0/e1Otjc/1JOeGFofqQxW8ef5GWbgZ7N9vxkVSUDpyoXUJDk4uHmqFyTHipxZG9R8Ys0x8wVs7SiNMmHszkNUNmo7ywpdngbg6uj+GeifLSKz2Xb9zY4l2WTNz+gGK5bbD0/BUMWNPTp4QqqwhDSPHciESfGhkh/LFYnhWd0aK3AUHe21kE9FpwM5Avm8+wbOcIMQ+MfkN14anXwxad1HjMyTUA676Z1bewKcC6/8C/queRhsD6QBWO1+aeo24nZLBouwy67+3gs62bWoFMskqJx9oIzc+CN3MA8SVZmFNtDe44Uc+KP0OXQl+H94hMnQE6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.31; Wed, 4 Oct 2023 16:03:08 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::7132:20cd:338c:9ab1]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::7132:20cd:338c:9ab1%6]) with mapi id 15.20.6813.017; Wed, 4 Oct 2023
 16:03:08 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
Thread-Topic: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
Thread-Index: AQHZ9sHmihh29NZBAEGB10SjA1Y22rA5yucA
Date: Wed, 4 Oct 2023 16:03:08 +0000
Message-ID: <DM4PR11MB55490489E47D54FF8224A982CACBA@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com>
In-Reply-To: <871qeafszw.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_|PH0PR11MB4821:EE_
x-ms-office365-filtering-correlation-id: 27248d14-5606-4ca3-d69d-08dbc4f3670a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FhRBxo8w7AnwDqmCWcMiCEDoWlaSLs5HWtt4jCTIF4+W1xHTnS3Ff8hWw9mV4366PSJ5ZdibIM4/D/HkEbeTysAw07PRphE05EwK22fhh8JZ6erh6faPfkWQ+cR3g+qn3pXZPKGK2DUUw3J1bHnGSQN6KaXsm9FXuyBAzHGtc8pfv04Hd6RfVRBg29kkSV2pW+8HIir3CPCAV1cu2DD9vwA1G6jXENtAlgJKLt77sQeBLbwdcBv+bD+EIT4emAAnlECH8N0Cb83vjas2ppY2C8C4RRzLj4MOevfCrqFFeyQ0KUsw+7A5/AnS8djPzP52Q9soxCDkaMWnjj7DcSqkFxwDPlpokJGc4ucj7yWrk8EhUxjPuZPjFeggXvbDrAXTB1PezSW9nUb4NyLydLX25Osimb0nS47QIn/Oox3Us8gamlSBehguVodq0aWPS5jgvis4fTKhg4WNamDHLnj99AILFZSLXBn5+oALTjPDTubN1X2ufZEx3tZNj9IJdH1jkflNHoyGpjll5rt0gtuVSD1AoRMJ224EIRx5/U0CXm/hi881imLWfiwjBCICPgTywNsosnB9uEUw/2n+4tIh8LfV5RZ14IwCOl5m9seluDA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(5660300002)(41300700001)(2906002)(8676002)(52536014)(4326008)(8936002)(76116006)(110136005)(53546011)(478600001)(9686003)(6506007)(66556008)(7696005)(316002)(66946007)(66476007)(64756008)(66446008)(55016003)(83380400001)(122000001)(33656002)(82960400001)(38070700005)(38100700002)(86362001)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWNDRE9qeTRuTXh1eVRrWm01cStQRGx6NlNCSTRWbGZ4NjdPcS9zV2UwRUlk?=
 =?utf-8?B?c1hHb3VpRW8zaFNIZ2wzQk5RY0JRRGlYTUo0UW1vSWoxTGh6UXJVZGFSSGw4?=
 =?utf-8?B?NzRhcnZTcG9ncCtML1lKQ0hRUFM2RkxKc1ZmeG1vVUJSbkQrdmN4NGprQThT?=
 =?utf-8?B?VzViTnppd3BlMDVaR0JqVFVQVncreVp0WG5kNEFDNXJrL1RNdnh4TEcyMlpK?=
 =?utf-8?B?V0gzT3FwaldlUGFYMllMY1p6bCtXa0VVSE5mVGJHQ09hNTBHSG1Uc1U1N2gv?=
 =?utf-8?B?ZC85NmxzdmdYMnBUNFJWUVRXWW5QMDg1cFBWVGhhaHoyVnhxRDEvRmdVcjVV?=
 =?utf-8?B?enVoMjk5cTZHSTJrUU5zT01paVMxQTg5Qi9GckhSUHBTa2hUdzFFVDIvTmJj?=
 =?utf-8?B?NmUwWDFzbVlZUlQ1MGdMZ05sRXlPSVNFRUJKQTk2SllNb3FzV2lwY3J0NndH?=
 =?utf-8?B?Tm5rcmlTb2krMEdyM08rMXJqblhNbitnQkZzK2Q3SWVQSktOMmZwdjF6cm0x?=
 =?utf-8?B?TXJNbTQ5bGNQY0FhYmNXelV2a3R4Ui9aUmRxcWdCclhDS1lLam1KSWhRd2RL?=
 =?utf-8?B?a2xZOE5tdEZmYzZ2eE55TldpbzJqS1I3RkwvQit3L0dwTGZtWElpeVFVNG5B?=
 =?utf-8?B?TkQveTlzQjZCWnFZejRTSG4xa2YrVEdmVmVwQkszem16VHRlTDVVVG9KYXda?=
 =?utf-8?B?clhkYUJIZXNYd2tuMnluSXBaVjhvTmZ4TWVxQ00wM1pFTUcwc0RHMEJJME90?=
 =?utf-8?B?bkpqVm1wcCthM2VUUmo5blVINkFPdEVsWlN2bXhlQmR1eHJhY1RnTDluMkxX?=
 =?utf-8?B?bGQ0WGRON0hjRjlVQzgrZnhMSEIxRXdUNTlHV2RPUXIxYWs4SmVvQXpROVRj?=
 =?utf-8?B?VHhTbWhaaUFJbWNnMlF6RGtTOUpHeERMVFNXSjg2SVJXNzYzeU5xM0FSVDVo?=
 =?utf-8?B?aUlVMkVsc1BtMHJFRlRMeTZjakJpd0oweXBCbXZKM3kvT0lDSWJRZWZOYlps?=
 =?utf-8?B?TE9qbTZmWEpQMEowVzBsZzV5TTVnQVNGVmZrMGNleUJVdEJqL3hpMWs4amtH?=
 =?utf-8?B?MWc1VlgwMko1T0hIS0k3K2RVemR6dkZ4MGZHSzVWZzdKNllJM0tXK056TGR5?=
 =?utf-8?B?VDRxaFlaQitkZlNmL2RuUjNXcUU4RTJKejA4WXcrSVNwOVpSN2N0dGxYUXZP?=
 =?utf-8?B?emc4Z2RjaHVLanJCbGU0MDRHUk1aTkdaZ05kOEZsWFgwZjBNVWgzQUxUUHQ2?=
 =?utf-8?B?ZDM0U0FVZlBDMXBQUEQ2S1hvd09pN3p1TFlrUFY4WHFCVzAyTlM5SkpyWGIr?=
 =?utf-8?B?WSt4M1U1VHdHQUJKU2hWVUVWbUtHMWV6TFJLM1E2c2xLWUFFa3RVcEdwbGF0?=
 =?utf-8?B?T0VzMDlFV0FxYkdQVXlsWnZWakdnT0dWTDB1UXViZnJSc2M1bVE0bWs4ZHVG?=
 =?utf-8?B?QXV3Uys4SzltaFB5LzlHR2ozVHM1YmJwelRLZE4rL2NwYmZvemJmYXNjbUtm?=
 =?utf-8?B?MUI2Q09QSEl6R1F1Wm1ubk5hcXJqQ1Y4eE1Ga29KVnppUjdqQVNReldTcHBu?=
 =?utf-8?B?amdYUmtvenpEK21vaUg4QUxENGtqK25NOFE0UHIvUUFyRjBwQm51QUZMMXhl?=
 =?utf-8?B?Ylpyanpob0NjOTJuTXJEZGVXMmE4VGRPRVFGN0dmNzFTWlVJM2hSOC9nV3ZP?=
 =?utf-8?B?aDl6RDc0emdmSGdQaVlnMVBWODFvOXVhVFY0OVpWUHlibFZpRTI3K2k4S3ho?=
 =?utf-8?B?VkdKMmgxczdFMUkrYmlZckFmNDVCa1JDekRWMUVyQWhMcjhOWExwNVZSM2p1?=
 =?utf-8?B?VjVjZnpSQU84OXZaSUJ0SmJkQUpDK2dsVTZUOVBhZE1uaDJzd25EWmpST2Fv?=
 =?utf-8?B?a1VaQitDRHBqdHZzd2pMeDF0SVJPbGZiV3Y3QldTUWp5TTNtNFAzY3J1T29X?=
 =?utf-8?B?ZjhiZjNHZ1FiSjhlUUJMRnA3YzdnQXBsSHhTWHo1VzhyRS9mZnFVa1c1aHN2?=
 =?utf-8?B?VHl5RHUwOTMybER6dmJrUWdFSVlPWkQyTnAyWDhZVHB6TGl3MGN1ZEdhcSto?=
 =?utf-8?B?SlBvYWRkS3BvNGJsdTVkaVR5VDA2NFZyb01NU1NSbnN0RTZCWVQ0bWRPdXFT?=
 =?utf-8?Q?kHXAgkNc0wZyLrMjfeJN5YUiq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27248d14-5606-4ca3-d69d-08dbc4f3670a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 16:03:08.7686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GSOBqA71z5zS3YgQq6whgIewJebQU6PNTp7lM5xxsSxM4YJuhPRASKl96CVadAGfFTSUTZ8pSMwxcJz/GjsQDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2luZ2VkLW9mZi1ieTogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KDQpUaGFua3Ms
DQpaaGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBOaWt1bGEsIEphbmkg
PGphbmkubmlrdWxhQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgNCwgMjAy
MyAzOjU0IFBNDQpUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoZW55
dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT47IFdhbmcsIFpoaSBBIDx6aGkuYS53YW5n
QGludGVsLmNvbT4NCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0
OiBSZTogW1BBVENIIDEvNF0gZHJtL2k5MTUvZ3Z0OiByZW1vdmUgdW51c2VkIHRvX2d2dCgpIGFu
ZCByZWR1Y2UgaW5jbHVkZXMNCg0KT24gVHVlLCAyNiBTZXAgMjAyMywgSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4gd3JvdGU6DQo+IGd2dC5oIGhhcyBubyBuZWVkIHRvIGluY2x1
ZGUgaTkxNV9kcnYuaCBvbmNlIHRoZSB1bnVzZWQgdG9fZ3Z0KCkgaGFzIA0KPiBiZWVuIHJlbW92
ZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+DQoNClpoZW55dSwgWmhpLCBwaW5nPw0KDQpCUiwNCkphbmkuDQoNCg0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oIHwgNyArLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d2dC5oIGluZGV4IDUzYTBhNDJhNTBkYi4uM2EwNjI0ZmU2M2JmIA0KPiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndnQuaA0KPiBAQCAtMzksNyArMzksNyBAQA0KPiAgDQo+ICAjaW5jbHVk
ZSA8YXNtL2t2bV9wYWdlX3RyYWNrLmg+DQo+ICANCj4gLSNpbmNsdWRlICJpOTE1X2Rydi5oIg0K
PiArI2luY2x1ZGUgImd0L2ludGVsX2d0LmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfZ3Z0LmgiDQo+
ICANCj4gICNpbmNsdWRlICJkZWJ1Zy5oIg0KPiBAQCAtMzY4LDExICszNjgsNiBAQCBzdHJ1Y3Qg
aW50ZWxfZ3Z0IHsNCj4gIAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX3Jvb3Q7DQo+ICB9Ow0KPiAg
DQo+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBpbnRlbF9ndnQgKnRvX2d2dChzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSkgDQo+IC17DQo+IC0JcmV0dXJuIGk5MTUtPmd2dDsNCj4gLX0NCj4g
LQ0KPiAgZW51bSB7DQo+ICAJLyogU2NoZWR1bGluZyB0cmlnZ2VyIGJ5IHRpbWVyICovDQo+ICAJ
SU5URUxfR1ZUX1JFUVVFU1RfU0NIRUQgPSAwLA0KDQotLQ0KSmFuaSBOaWt1bGEsIEludGVsDQo=
