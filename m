Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BEC7B8610
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Oct 2023 19:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A1310E3A2;
	Wed,  4 Oct 2023 17:03:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E52D10E39A;
 Wed,  4 Oct 2023 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439000; x=1727975000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TdQKfYXKXoM8rx8Z8gAcsAM//fbWRNQr+C1fqW7x0dw=;
 b=MT5pFOIwvCN0/HOCUbHb3FASrfb8b5+I1MOcrquE4JV9MVwSwErJympN
 +69lfoKdy0XfQMJcWIJiLvyfjHE+cpDz7yH/DGxjUvcE8SXWqSjdtpyUk
 ouGvHZXp1U7rwks/vwrO3B7Malm+n9zu8Erf4AyRNYOntLEqJ5vEMsewK
 F+7vFT2YV0S0hvAOp/D+tBreZRlN2fDbrEBnCNUGF9b+qIUwLexiIvahz
 hFGh8vtPySiB1WtkrEHEWjD66gPNpZ8gkrqPJt2ZmLh7BvlSQRqUTEBUp
 1ugpncUzAGrtF4V9XbQGfe4WbYqtN01kItFoFUYNr5HpeqMzuaCWjOgnw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449725227"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449725227"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701197650"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="701197650"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:03:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:03:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:03:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:02:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkpVkk778Xcg2HPQ6Rulq0GjFY3mE89vcOLtc66sXhbQkbY/fe7ZhRD3KU1P8Ve7SdHWu6zfS9VLxBToTk7q0g3POV3lgGKWEW4CoALlz1ElIS5YPIT4H9iEpCq0BH1bAYUCSSTp+ITB51EoM7kbz1XwQl5Fy0r+/vUaO1z3UBGCylTP2qevqOuZssk2excswNuvyw2sqIB+NEp2O2hUhTYMZaKeiViaz4azQpEF34YupmU9xRf2SjkkStZLIkFCFEScGXyI/zmM9JP64jN/JJgK11v3YZ8lsagEQJBs1TZnu0C0TuOKGCsEPWrZgHLw+N97mZRpResLQapHtZAGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdQKfYXKXoM8rx8Z8gAcsAM//fbWRNQr+C1fqW7x0dw=;
 b=ezOBnHXd35K5Hoyqjr8Vj7KmIA3nBIagLrCuXYc8shlwBa5cI85eixGRVlZcab0QuMoMes3EVLDE0/anbW5ABCioJPq7Rv8hySWZHtoWrWnD5JsZlg8X2PzCWiU3XnWCpnMsWGnwh3lt+llNmjwflIvBMmeED4uGSDIN4JoPNdCB3kLWQEOKBEg+H74kpVsArI7pvkF0nAPkSE4FDaL4YXXB1ZeAdP3rCGD6AIb+7GEJtKWDiS/UJJ7r9bmIBh9O4S6xOus1ZlKt1431YfLh8oCUPwKNwYnhgtUHR33sukqsEMFcynNbmsrNKyXRGjPTWJxOxlwWDG2nwZamUfsw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SJ0PR11MB5629.namprd11.prod.outlook.com (2603:10b6:a03:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 17:02:38 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::7132:20cd:338c:9ab1]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::7132:20cd:338c:9ab1%6]) with mapi id 15.20.6813.017; Wed, 4 Oct 2023
 17:02:38 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
Thread-Topic: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
Thread-Index: AQHZ9sHmihh29NZBAEGB10SjA1Y22rA5yucAgAAIjQCAAAgCUA==
Date: Wed, 4 Oct 2023 17:02:38 +0000
Message-ID: <DM4PR11MB5549E309E9CD177ADB97BB22CACBA@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com>
 <DM4PR11MB55490489E47D54FF8224A982CACBA@DM4PR11MB5549.namprd11.prod.outlook.com>
 <87a5sye4a7.fsf@intel.com>
In-Reply-To: <87a5sye4a7.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_|SJ0PR11MB5629:EE_
x-ms-office365-filtering-correlation-id: e5602b04-7f6a-4813-acf8-08dbc4fbb6b4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 86oRgvfw2cOnWaWhA7K7KnNg4c/xlMYVm/gn5+MojepLao8f44bIeWy5uwTNLVVnHFE5qnSiOdAkSsLDyyjRQmVzI2SwZMfV621T/qRBUwxr8fDp+YyeIsLAfd2J7Lo5foettO8587crKKe7rtwS+pzzLHhwPd79KbkJtYv3EVdwz0yv55GaFXuhoyYBg8QB7Cw8vCw635mvDZVhu0JCWLpGxJJroqZwC4Z3w/QEUePyFXkcQqK1j8ssXhQi0fG6LxTOEbKbzqEhX32zdbVUjPGaDhDg19tlNvrJWo3qOocCWxzHA99WiDTh8HYBbcICq+6X0fftFEU0CEB+08cxo4YTh6p8sK+sUc2xw5pYKB5ppPg/IBMY5QxBRAywhqQ7dQt/g8SpheUOgA/OWxhGBj7IjHdeqoft8wvkUInByfU4uHeZLSqFquiFncgEkbn9RrI+2Ng2dEOlCTl2S08DKJ7skXVMJ74oV8TMt+SUISJMrvbqgC8L+6GIlxf6jKVw6N/VOLxOD259Nq7pD9iPl3P4rDURc/gxyrRaRkJNqRII/3iXGYFLosyn2V4pdxmgDhqRC1ffirImGkKfpWS5NhkCLNdrUyYFXgfeYZ1WXRxvAmt6G6zRCfTsJW0ojwSb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(53546011)(110136005)(7696005)(6506007)(71200400001)(478600001)(9686003)(83380400001)(2906002)(52536014)(316002)(8676002)(41300700001)(66446008)(64756008)(26005)(66476007)(5660300002)(76116006)(66946007)(33656002)(4326008)(66556008)(8936002)(122000001)(82960400001)(38070700005)(86362001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGIxeis5Ukgrb2ZhQkV3SndkdzluTVdJMkxTWU9DL2prTHg5cWgybWhKSzcw?=
 =?utf-8?B?eXE2emlLVWFXMTBZazQ3VXI5dFRRZUhtSHYvcHZkWEU1OHN5VlZqRjBaZFdR?=
 =?utf-8?B?TEpTR3ZiTDNLNS96Q1JyWUQzVWl2VlYremttWWdKUjlzNGZlRjh4SkdlQlpJ?=
 =?utf-8?B?cGVDaFZ5bTdRUkJnZmV4NlArd2RNcjNNOVhBbjZ3Z0pNNTRDYmJLU3FGQWRE?=
 =?utf-8?B?WmdVZ1loa3NTUzhWQmYweUtyNEdzTVViR3VFcjdGOEM3M3p5T3B2ajVZQnVU?=
 =?utf-8?B?WXdmekd1M0JGcGx0TExXdGM3eXNpK0swUGNUd0ZYUGwzT0JHSjQwYU1IVFBq?=
 =?utf-8?B?bUpwdHVWMG5IaFdQbmZtVm1YcWNqcDlQV2VHMkRLNUdnVlV2NzFjd01vVlFj?=
 =?utf-8?B?L0dIWGtBWFl4STBzR2tQbDFRTlFrSXRlemR5Wk5lT3ZjcDB0b2pzUEVWY0Nj?=
 =?utf-8?B?a2ZjMThJdmRmMXoweGdZbGxZbmpEOXR6V2FHTlYrU2FXRTk0MHVBZUMyTU8v?=
 =?utf-8?B?SWlCWFpIazFNNzBVR1ZPUm44bUhCcWdtaTBYc05nNDB3d1ozZHdjdnM3dTRC?=
 =?utf-8?B?a3g4VGhoYTBkVjFqdjJzLzNUTHJteG1ScENKMmw2djdTUDdDQ2NFT2FYM2hh?=
 =?utf-8?B?NXNwUXlSWUpWR3ZXVmR5azBMNzg4NTllRHRja3ROWTR2ajZaY2pFVnhsOHNT?=
 =?utf-8?B?Qkg1Y3ZHQkhOalZ2aisxT29rSk9wakZlenBEbnlxV2FNY2JVVlllSUwwb3NV?=
 =?utf-8?B?SW05dEg5TVlaK1RGMEdQeVBMcS9qTzJ1R1M0WUF2ZDFzSlJXdGZNdmVjZ09Z?=
 =?utf-8?B?V2htcjRlaFVZMzVaVzRPOW1PUTgwQUVpZnZLNTNJdGRYZFA5TWMvZW9COEFI?=
 =?utf-8?B?c0doemIrOXE5M0xYUEFUSGk3RS90c3VhbER1WDNWdWpJVjZnNGc0N3FCUExF?=
 =?utf-8?B?QXhCR09HUWJneW00RUt4Z2lvVnBZUmhkcU1yQ1h5UXVmRlNWanV1S3R1NXBp?=
 =?utf-8?B?VGwyMVQ2Q3lpQnR6STJRa1NOb1ptbU9DSHp0aGQ0cEVvUDdsbTFESHNLTlFo?=
 =?utf-8?B?NUVNS05LSGZCWjdrRTFJbG1sZ01mL1JjZTVBdzJucWwzL3JDeDhQU3BRVkJi?=
 =?utf-8?B?NnFIMzRrV1NuMDlhRndoc01ocVRqQURDdjljMm05TDBFRDNreEZPc0FNUnhF?=
 =?utf-8?B?REFWT0dFN1BPbEJGYnhEQUF2d2srdGJ0STRNa3BnazVINEhQRDc4NlZkSnMw?=
 =?utf-8?B?Snpwa281SUpXdnpmaTc2cXAwVWNVNjVHc2kyM0tXUmZJQ0x2ek9haE9zYytO?=
 =?utf-8?B?K0RUNVFQdnF3cWhPSXRqRGdRU0lBemZRd01aRkJoOExvWW5DeVUxQlZORHJX?=
 =?utf-8?B?ZkM4NGZuWEhRdWtZcHVXQzBzcTVtMDFJUE1uTHdwNkZ1akF2QXJMVDNkYVJ1?=
 =?utf-8?B?VEM5aFppbklWbGZRYnVadXp0OVcwdTJJNFZXVE5RZlJWMVdUSGRweDdhWDU0?=
 =?utf-8?B?djlGeXJkTnFIUVozZnNrcUJVcmNJUjZzWGNZaXYxY0QwVE8xdGVIMDVlTVNP?=
 =?utf-8?B?a0RKaVNIekFaTGVrb1g3NjR1TlJiTEs1R3NFeGRJNE15NEZIRjVYbVZzdk9Q?=
 =?utf-8?B?dVNaRzdSRG4xRDdGb1hQS1hzd0svNkg1Ylo1ZDdURWxxK0NVd2FGQU8ybkRn?=
 =?utf-8?B?UG8yd2pzeDkvY1IyT2lVSEZvMWwzUVdjQW0xclY2WThqbFAzVkdCeG04MGdI?=
 =?utf-8?B?eHc1TjVseXQ5a0NlemlwaExOUld4ZE1aVEJhMVdSbTJwUGIrUXY2ZkgzYjgy?=
 =?utf-8?B?RTVMSGF1TmZBcmFBOS8zQUtsMlNRSysyWmRjVVZVUWlwd2FQL2I3ZERra1Jn?=
 =?utf-8?B?eTVoM3MwaksxNHlGcC9MMGFtZ2xvQWpYQVYxMWtrNEdKT1Y0ZHFzNTh1ZXEx?=
 =?utf-8?B?Tk1WbDI2bzNiRFArUnlXNEQrMllHemtEQkFZMVBKemRiM3QvZlB3LzBBa0RH?=
 =?utf-8?B?bjJqOC91SmRKaWlMMXVkLzhQOVR5NEkrdFVHdENYTU4xcHhhMXBLY3BNNHZU?=
 =?utf-8?B?SnlveHl1UVVHOVgyZjFUMzlWQ1dPOHZ5U3BpODBKSDFSaGp0OGVnUzMxaVIv?=
 =?utf-8?Q?/2/xYGIZk/AjxmL5ve+xI2Lkh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5602b04-7f6a-4813-acf8-08dbc4fbb6b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 17:02:38.3799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1u2xg32i79mlUe/psAo+sAHWSiNmMLh93suQE+DpIOmRbDfozDkeNZB9Nqkd0V8j4pMLIPXhEuzxn/Z12iOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5629
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

SSB3aWxsIHRyeSB0byBwaW5nIFpoZW55dSB0byBwaWNrIGl0IHVwIGZyb20gR1ZULWcuIA0KDQpU
aGFua3MsDQpaaGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBOaWt1bGEs
IEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIg
NCwgMjAyMyA3OjMzIFBNDQpUbzogV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29tPjsg
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoZW55dSBXYW5nIDx6aGVueXV3
QGxpbnV4LmludGVsLmNvbT4NCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpT
dWJqZWN0OiBSRTogW1BBVENIIDEvNF0gZHJtL2k5MTUvZ3Z0OiByZW1vdmUgdW51c2VkIHRvX2d2
dCgpIGFuZCByZWR1Y2UgaW5jbHVkZXMNCg0KT24gV2VkLCAwNCBPY3QgMjAyMywgIldhbmcsIFpo
aSBBIiA8emhpLmEud2FuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiBTaW5nZWQtb2ZmLWJ5OiBaaGkg
V2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQoNCk1taCwgc29ycnksIHdoYXQgZG9lcyB0aGF0
IG1lYW4gaGVyZT8gQXJlIHlvdSBwaWNraW5nIHRoZW0gdXAgdmlhIGd2dD8NCg0KQlIsDQpKYW5p
Lg0KDQo+DQo+IFRoYW5rcywNCj4gWmhpLg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBPY3RvYmVyIDQsIDIwMjMgMzo1NCBQTQ0KPiBUbzogaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoZW55dSBXYW5nIA0KPiA8emhlbnl1d0BsaW51eC5pbnRl
bC5jb20+OyBXYW5nLCBaaGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQo+IENjOiBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBkcm0v
aTkxNS9ndnQ6IHJlbW92ZSB1bnVzZWQgdG9fZ3Z0KCkgYW5kIA0KPiByZWR1Y2UgaW5jbHVkZXMN
Cj4NCj4gT24gVHVlLCAyNiBTZXAgMjAyMywgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4gd3JvdGU6DQo+PiBndnQuaCBoYXMgbm8gbmVlZCB0byBpbmNsdWRlIGk5MTVfZHJ2Lmgg
b25jZSB0aGUgdW51c2VkIHRvX2d2dCgpIGhhcyANCj4+IGJlZW4gcmVtb3ZlZC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPg0KPiBa
aGVueXUsIFpoaSwgcGluZz8NCj4NCj4gQlIsDQo+IEphbmkuDQo+DQo+DQo+DQo+PiAtLS0NCj4+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggfCA3ICstLS0tLS0NCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCANCj4+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oIGluZGV4IDUzYTBhNDJhNTBkYi4uM2EwNjI0ZmU2M2JmDQo+PiAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oDQo+PiBAQCAtMzksNyArMzksNyBAQA0KPj4NCj4+
ICAjaW5jbHVkZSA8YXNtL2t2bV9wYWdlX3RyYWNrLmg+DQo+Pg0KPj4gLSNpbmNsdWRlICJpOTE1
X2Rydi5oIg0KPj4gKyNpbmNsdWRlICJndC9pbnRlbF9ndC5oIg0KPj4gICNpbmNsdWRlICJpbnRl
bF9ndnQuaCINCj4+DQo+PiAgI2luY2x1ZGUgImRlYnVnLmgiDQo+PiBAQCAtMzY4LDExICszNjgs
NiBAQCBzdHJ1Y3QgaW50ZWxfZ3Z0IHsNCj4+ICAgICAgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNf
cm9vdDsNCj4+ICB9Ow0KPj4NCj4+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBpbnRlbF9ndnQgKnRv
X2d2dChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSANCj4+ICppOTE1KSAtew0KPj4gLSAgICAgcmV0
dXJuIGk5MTUtPmd2dDsNCj4+IC19DQo+PiAtDQo+PiAgZW51bSB7DQo+PiAgICAgICAvKiBTY2hl
ZHVsaW5nIHRyaWdnZXIgYnkgdGltZXIgKi8NCj4+ICAgICAgIElOVEVMX0dWVF9SRVFVRVNUX1ND
SEVEID0gMCwNCj4NCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQoNCi0tDQpKYW5pIE5pa3Vs
YSwgSW50ZWwNCg==
