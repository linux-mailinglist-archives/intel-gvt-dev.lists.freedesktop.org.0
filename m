Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE12C42A18D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 12 Oct 2021 12:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBB36E82D;
	Tue, 12 Oct 2021 10:00:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1306F6E82D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 12 Oct 2021 10:00:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="250494784"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="250494784"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 02:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="524163450"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 12 Oct 2021 02:59:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 02:59:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 02:59:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 02:59:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 02:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFUIT7DLnMoiWC65ljFCyuHPzWEqrUDC3EvLVNSwn+O5K3ZkkkCiP6kSdFi8T1mqeMDqkAgydN3cfA70KCDIFZO0HtvtmoKW5bC/aTjhyYN3rS6rTi+wv10HIRvHiTL9mMe+mYvmLGF8nGjATsRpuJzT6cNx2XgD575ZVvMowX2sGntHXni52FMJmF53u6bVd9Zm3A5NxJSW/u9Kz9iuUOYiRIpgBcdu7QRVCf1sfp17WNUIrA/B+IPz9pA5F0bYSaBtcpDbg4IMuHZ5HhJuMZvtxTi/MbCotu+ExTHj6ojEp4C8b5Tnsui73HHCaZfECrAwtygyXKYt4tB0a1VPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/tbWtCU97He0su4KNeik+/DGr68/vTAclpvOUevDdw=;
 b=XyZQ9ZKNdca8KuL5CWDNLdY5ZkOq5JJk9Fsh92XQ0YOUAE32VJTFjNBkwctd09gso8j8FXIIoUn3ZNiWF+lkUoZnOmsTiG+O4ffhnNr+jxRGbqjAWlRcVypbhRZULSsbGmcdIARDbR29Aye5S4qG/fMDcKqug2VdkrwwFAlVNUB0EQEASarCh0DxTu2DqJHzG0u+P3eb9GLBDpIS1L6QOZ+NbajQQMkXTnnAP/bQqcaeN+w7z8ZhwJb7jdteQ+uSMf73UztQ9BKNKN6MV3T0ILATCMom9yRSDC1OBUR0FO6hqUzrMf0F3YVhAtW15wQ5m+19Ysp1P6tO8XvBhOQwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/tbWtCU97He0su4KNeik+/DGr68/vTAclpvOUevDdw=;
 b=tMQrmdNEs1nIlSrPij+vgovrW3PPZRCJdxzY+woDRGFbfwAMdfi6M95B583uAzb6AAz109mBrKmDwf//HON2pzRv3jZEjW0g0+ElV7GFG5NaIT++Lf0P1hSKn+M6cI3CrVeiuZG28dYBW41c9YfPx7KZRx8TOPTUKLTbA7qxmYU=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB4170.namprd11.prod.outlook.com (2603:10b6:5:19a::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Tue, 12 Oct 2021 09:59:48 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:59:48 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
CC: "Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix cmd parser error for Passmark9
Thread-Topic: [PATCH] drm/i915/gvt: Fix cmd parser error for Passmark9
Thread-Index: AQHXvlkZS/1VNpHQfUC6GpAaGKe/I6vPIxSA
Date: Tue, 12 Oct 2021 09:59:48 +0000
Message-ID: <60f25264-85bd-c9fd-1e19-65a2d7f6280b@intel.com>
References: <20211011043329.3519093-1-zhenyuw@linux.intel.com>
In-Reply-To: <20211011043329.3519093-1-zhenyuw@linux.intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379847e3-c452-416f-fe5c-08d98d6706c2
x-ms-traffictypediagnostic: DM6PR11MB4170:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4170F94A7B1696BF5AC88CB8CAB69@DM6PR11MB4170.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y4lLB6+CCg8qM4lAUshCwsBn7WMHQ63OVDbBc5wdHkQ52HY3fkwHn5RzqCNhga/KoIkK/oQyU7qdlP9xCp3KsVC5zH3pR2+6QRGmwwgEDDkCi1I32aKwcBJabBiColW4fPTIau19Pb2OQbTkAu4LCy1tlztLx1Ty+WOFd07Fl7wcyLdU+NlUz9+Tc3LBKbw66sXf7oW5KkyyQ3mIPrmzZfdBu8tB/a2r+ioPfpqiTC8Ed/PxNPT9uJDCKg4Cpnis4yaxH9RIbb1PIOU5hmf8hMQLeELfomBGtnucTHI5hQIRLu29SMnrEa49FjWBytwxg1HyVP5kH1t+dxTHgbGWFxXlU/r+/L4X3DVxGapFJeuWJ+WLNPmQZxEO1qpzoHCbsETShxkYPGSbEuC3h8kbTxxq5wl5xUTXz37hfy2lmd/UWjx1GLsXxZQukfPb1RrCpm+kKbEyV3jj3Lz+GL9eJKTplaMplpb+ickvhd3cWSVTdn4MWDtM0k87fSUzFCUl1JxMxsJ3oxNujYyqPZjfkiYyUeiv421kI/YsjHquO5lC+KgIzScj0BqryHeEp4R0XdqnpTiA0M3aOQ1yqrTrDXtz2OZOzlezXgwXlnyZH4XqbwDLZpImICqFUry0bHlVIIasuUIPlAIkloeRH8uxaTItoW0TYTtCBIbtUHLGqjRA+s1ebU7zeSvHL8vDgVzkI56Kide78QpOef85MwbZn77tjp6CF58sSPCvCFdFAUNLy/AvPSjBOmObLtV+4xAycSfxhMEmeEOPCnhKAZjcfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(64756008)(71200400001)(2616005)(36756003)(53546011)(508600001)(26005)(66446008)(186003)(6506007)(66946007)(76116006)(66476007)(4326008)(8936002)(91956017)(83380400001)(6486002)(66556008)(31696002)(316002)(110136005)(38070700005)(5660300002)(86362001)(38100700002)(4744005)(31686004)(2906002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVFxcVZJTXBQQTBHSGhwWGR3d1UrKzZFRjN5ckdDYTlnZEJvUG01UUt0eGxu?=
 =?utf-8?B?NW5HY3JqZWQxUGh0OXFpNEpHY0IvZjFnNmRWTm5TOEVJOENoTlZIN3UzWVd5?=
 =?utf-8?B?RGFyRjlFQU9aQzAxa3YrQ0x5WXZQQzhWYU0rRUlzOGg3dmE3VmhjMFl6d0Jq?=
 =?utf-8?B?T2Y5V2RhcFFpQ1JCVk5wYk54OFlYeW9oeUNqZGlhdW9UN0NPTWMrclNyakk4?=
 =?utf-8?B?QUY0L01iTHhNTFFPSTZjbjVJUTl3S1hiYmNLTXVQMWI5YTZRUTUwRnNNUFA2?=
 =?utf-8?B?b2tjcUJSTHg1M1liQkFqZkRxbHlIbzlPaFRCL25OSkdCaENsaEdGc2UxMmFp?=
 =?utf-8?B?TXF1eFdaQlYrTkNsYVZzSU9uUEJJWUo5T1FVN2JyRE9kSEJmS042Vy9jWXVV?=
 =?utf-8?B?aGJEN1UxMVQ4eFI2dTVJdzVFMDM4RDFVTitWZThPNHZDbjQ5dEg1cDNIMnUw?=
 =?utf-8?B?eTdadE1Ra083MnpiZkdDSkdpVGJEa09HdXNQdHUzYWtST1lDSnFFcHlBeURy?=
 =?utf-8?B?akdPNlNWbStvdkJYeGU5WSswZ3lDamNCaXRUaG1WZ0R6OExjY3dPM0pPSlBJ?=
 =?utf-8?B?WEJNSmF3c1pmMjNBbkZDS0Z0TG5POGlXTjdOalhtTFlhdE1nVWV6NGpXOWkz?=
 =?utf-8?B?UE9ocVBudzlRWlVhOU9xQnpjeDdBcUUvQWdTMVdicldCUXh0MDdHYWJ1UjQx?=
 =?utf-8?B?T1p0Wk04N0NDVCt3RHhZTTZvUnF5R2tNaHBFUWY1TVg0eXNQd1pweE55RkxD?=
 =?utf-8?B?MEY4djB1NC9ia2RpZ3huaEZqeHNlNmJoYkxoZms3M25Fak45MmR4TlpoVXAv?=
 =?utf-8?B?SnZqZ3BYbFNhRUUrSFdLUU1ZczVzRzRQNVdpVGl2MUdEU2VSa2FMZUpYbEky?=
 =?utf-8?B?ZEN5U0tJbDRKSG5YMFpIMkR3bkhBNVFPY2FRNWhJcFNnbXRUMitXbC9pcDFV?=
 =?utf-8?B?V1VRSlhUakNQbE5tMkdoQWVaU0F6UEYzT1FBR0VJU0tLclJwVFNYaEsvRU1w?=
 =?utf-8?B?RWs5Nlc0NWNDYi9tUElNYTJwekhzV2NOS0tVdXVjaEx3L0Z6V2tOdmU4aS9j?=
 =?utf-8?B?R09QUXQxWUdPU0RVS0xkYnl0QVI1V3cyazk0WkJrbUxuWlh2dGFPU0VMWXpI?=
 =?utf-8?B?ZVVSUkZINkxHT2xWSEN2S2RadXJHaHBCNUJBeXZNaEt4SXdRaGtONVBXUjBF?=
 =?utf-8?B?cFdKaEN4K1hYQ0tmTFFSM2lpOXZsNTVSRmF5dk1vd0MyZXhtSTNsOTZCcEJS?=
 =?utf-8?B?aGJOU1hNOXI2ZnQ0cGVZbzdvcGwveVBKVCtGUlg0TDMybWh5ZG90L1l1VTZh?=
 =?utf-8?B?Qkx1MlE5cEdGeEY1eStXNG1HdjVCTFFiWVJacGs1TVlOZmR0WCtaMFRCYVJZ?=
 =?utf-8?B?RWpZUzU2WU53OVdxVDJPZzJLOU5wUUdWbFo2NTlzMVdCdnNYZ0FGYlRzcHFR?=
 =?utf-8?B?UGdlV1BFVGgyY0wxazNTRWZzWUxtU3BXQTRVSzNtaGVEa09mUnllT0xCZDhq?=
 =?utf-8?B?M0xIaEpReEdhNlpkM3EwM3NHSUQvckhnY1BJb1VPcDN3QzlQeU14MzBhZGNw?=
 =?utf-8?B?cnBYZzVtOFlORjlob3Y2ZG1GcTFqMW12bVRCWUJCVjQ5Z0tiTStrclFLb0c4?=
 =?utf-8?B?VGticVhQR0lINXoyck16b1BJQVdXc0VjVjY5cUpZa1N1c0s4QWVwbFBSd1lq?=
 =?utf-8?B?YmVoWGMyOFpPaTJ6YXlTZ1hpUnROeVVxZ3JtMjNiZmxLZFFyOFBNeWhsSkVi?=
 =?utf-8?Q?OMNDgricUdK98tz2jRRQtsMqfQ9r1aveHbn3FyT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D17FA8B0E0F87148862828A0DC492183@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379847e3-c452-416f-fe5c-08d98d6706c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 09:59:48.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3KaR+AMpvRsRO5a4SCi22/mBVm80yKYoEtGFfM8+8GONb5ygoDRYn1Q+OuNzq3bXYXQMfRYtpucIDEjd5nG5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4170
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

T24gMTAvMTEvMjEgNDozMyBBTSwgWmhlbnl1IFdhbmcgd3JvdGU6DQo+IFRoaXMgaXMgdG8gYWRk
IG9uZSBuZXcgcmVnaXN0ZXIgcmVxdWlyZWQgZm9yIHdpbmRvd3MgZ3Vlc3QgZHJpdmVyDQo+IHVw
ZGF0ZSB3aGVuIHJ1bm5pbmcgUGFzc21hcms5LCBvdGhlcndpc2UgY21kIHBhcnNlciB3b3VsZCBj
b21wbGFpbg0KPiBhbmQgZmFpbCBndWVzdCB3b3JrbG9hZC4NCj4gDQo+IENjOiBUZXJyZW5jZSBY
dSA8dGVycmVuY2UueHVAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8
emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBpbmRleCBjZGUwYTQ3N2Zi
NDkuLjgwNWZlZTRlOTFlZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMN
Cj4gQEAgLTM0MzYsNiArMzQzNiw3IEBAIHN0YXRpYyBpbnQgaW5pdF9za2xfbW1pb19pbmZvKHN0
cnVjdCBpbnRlbF9ndnQgKmd2dCkNCj4gICANCj4gICAJTU1JT19ERkgoR0FNVF9DSEtOX0JJVF9S
RUcsIERfS0JMIHwgRF9DRkwsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVMTCk7DQo+ICAgCU1NSU9f
RChHRU45X0NUWF9QUkVFTVBUX1JFRywgRF9TS0xfUExVUyAmIH5EX0JYVCk7DQo+ICsJTU1JT19E
RkgoX01NSU8oMHhlNGNjKSwgRF9CRFdfUExVUywgRl9DTURfQUNDRVNTLCBOVUxMLCBOVUxMKTsN
Cj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiANClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBx
dWV1ZWQuDQpSZXZpZXdlZC1ieTogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0K
