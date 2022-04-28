Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5F1513CC6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 22:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004D810EC2C;
	Thu, 28 Apr 2022 20:42:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA47010EC24;
 Thu, 28 Apr 2022 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651178576; x=1682714576;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uCP1V5yl9YMNrtjocAA4fYpK+sK8ZR2Beh3TxAv9wBg=;
 b=n/xtdShZo1l3g08REUSFv/BuRSfvRCR/10lsTdg0VwmGWdop0qBoqn2Z
 dt3PsSlglSTp+gCefDexpaTGmqPhXAe+0RyPtDeMEF1OiQ2e7HyrzrTLT
 jHHMQWsQBetX0PBOuJ5qofMsL+rOJW12L1WlNLcxvlSrU6+xq3N7qq1OF
 hOrvOQ9ogh15aEhTeVMkA2CueAfpmG+pG8PvmkMDL/e6nkGoQgbkTFawj
 Db+3SrBYXue0XMuBNo5CEjH9GoU7lMUZ+RdlD0UCCnTRHPdsjumYIO4NJ
 wS0+ZqQk3yu6zV00lH7jzMVzgszeF45WiqnNR/Y+ihnXrrVs0/BOUAb0e g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="265265898"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="265265898"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="618319753"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2022 13:42:56 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 13:42:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 13:42:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 28 Apr 2022 13:42:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 28 Apr 2022 13:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwwMid5xuMYMflV3asRhAyv+LG+TubqfcVQaD/txw7fl+4qU8l1H3Is7d53z9h53n8iyIUclKiA/pQtjQSIty9d6eNCJOt17qr9MnyZr7W9kEfCQZd7vqBm2t9kM/dFgz8D2zEgUfGsJQvbNSZyF7bFZ7LdPk1mzlP3CVlGlPADDcfFQXmkknJiXSo0H9MQlBX+adyhEwvScajkj8vdBFZwiTAW9KAJ7w2ATklzOLWJduWq6X7sVf5K9D9S9owIwAYgdCLAWuALfTxPdbYrIDaEXt2DyEOz8kL19NWnYQnSO2rtlq/f9VkqEyws9yCfMwzqPKapvc9sVeIV6ZEOG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCP1V5yl9YMNrtjocAA4fYpK+sK8ZR2Beh3TxAv9wBg=;
 b=Bq/UH1XpADqsEnvhdarwyAFv5FL9P7w51XB5VHJp+pdb2zL3joovLJ0ku+rNeqfbf8166jBA7ZQCxbqR2UsB4EnZKVIKeESRFKp5fsgxLfEAzg10WCmoOeeY9TXsvVwrlGSA4wut38wOs9zdYRVDzivWmF8hhCxyVsAa/AGOuOmK+5gNNMCww7fkv19PHfavq+099Jq6SMpoXORYfyXkvQnoCwXxdyC+tAwU2p95QHrs//rD5dGIzoTPm7xzThozkvnjbS+IH9WeeoyQhgfG8k+ke2HckHWD4y+0030cTyNgv4iZxQAuJ+tf8KCTbkcwaD32dPcgomuldmM5LNro+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM5PR11MB0074.namprd11.prod.outlook.com (2603:10b6:4:69::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.21; Thu, 28 Apr 2022 20:42:53 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 20:42:53 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix missing static
Thread-Topic: [PATCH 1/2] drm/i915/gvt: Fix missing static
Thread-Index: AQHYW0BOKFWCriyqcUC0w4mf4VUcp60Fyo+A
Date: Thu, 28 Apr 2022 20:42:53 +0000
Message-ID: <a07d23e6-548c-2b4c-fb2d-d534f425e776@intel.com>
References: <20220428204011.3365653-1-lucas.demarchi@intel.com>
In-Reply-To: <20220428204011.3365653-1-lucas.demarchi@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 414204c0-b4f9-4267-1b41-08da2957ab23
x-ms-traffictypediagnostic: DM5PR11MB0074:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB0074A9B51E49D9C141CE58C9CAFD9@DM5PR11MB0074.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Slt0NwOvW+V/952TRbAM7PLxahrK+YEB6X7w7luDtZL145+hRNTJjMecZtxAg7nxnldwCionHc8cg3/OU7efKv2fxDcNgbzepM1Awfc8P6e7t4VVAKkdLf5Cg9AoWYI0OfDwCxoIRORfRZswIg/sVTQJfgqeAVyooiDYFx5RDUKZUzrAZ/jc8yT6q3R9iOcQjNwollGmXdOpmIZ4zDWaCfemWRR0lFqwu+hipwpcuItmCNsOgpTa3W6UtFsFllAZ3pIbTq95M6yJCQBlwnlMLp1J4moGSMCn1GIs3e+/A1DZg5mcT7KoWR4ZdLdIJymBh2QGk3wxLBxIA/3d6IhF36PmJTFsu0Xj5t5wuOo1BVBRsuxrI2IyceqqYkt0hAYPlZEYWJUi4/bRklrWhf8dXcxJ8+q00filbeA1/pmteTJtloSCLGrGjBvrQAzmS0/OBFCpCR11o0gaczYalGSHVCbFS6KBEklZWvaxT7YhQzEPIIoLwlK10LX9X/gxhfZH+lzC254/Udu2m306JrlwB9MheEgooKwCvj1eM0fqkY7Nx47fDnuaFpEVpbUaik7SlVRvMDOoSFvjcDt1/FL5vZrEvuzn2+OSasnMlsFSnrXZGJZItoj9EEPDYGJnFmIE2UQoNZgRpFeGoyXZbyrTwBIsVjP8bXu1V1d9ifvhZqcSwkotdaXK2JzwRGtduBKTq7U/tEeOUnGQaBWVmtddZ+eQQ2QGes+vimpDzjaUjZSIw7H2sw4T4+cF1x+lxRpV3euo+8knRcMp1Iky0UE4Sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(26005)(86362001)(508600001)(31686004)(36756003)(5660300002)(186003)(38070700005)(38100700002)(8936002)(316002)(6486002)(91956017)(82960400001)(2616005)(83380400001)(122000001)(2906002)(54906003)(110136005)(31696002)(6512007)(66946007)(8676002)(4326008)(64756008)(66556008)(76116006)(71200400001)(66476007)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0lvRnpCeWNzV1BhNi9UMlJBbEpwd2hibjNrVXdJQUV2V2dDZlMrOHJGRkoy?=
 =?utf-8?B?amdib0ZvOU44SWhZL1JVd0VwWDBSMG1IcVErUjBPSnFQUTlPQ2JSTi9ZZE5D?=
 =?utf-8?B?Y3d3QjRwbFFlQS9OdTdZUnlBVW9lY2ZqK3lybTh6MWcwZVY2S1JYcmM3ZnJs?=
 =?utf-8?B?U01XVzNZQVdZS29hNTE1OEJzOCt5bE5WZG5YQ1lDRlI0anlIU1U3U3JtRis4?=
 =?utf-8?B?ckFuODVlK3EwM3R2b04xMHU4SGFMSmw1SnJaTG9ZSkFISEp5bGthenpYVVkv?=
 =?utf-8?B?Q0tDaVpWTTZ3dTNiQkdnanpUdHpzY09LNEpjVzFjN0JMZ2h3cFd3WlpKeFo4?=
 =?utf-8?B?bURDV09hNjZaUUxjT2FUcTd5Zmg4S2huMXI4L012Y2hPamlIa3lzQW1nTDlM?=
 =?utf-8?B?aWcydmUxK0UvcWpKZnNvZUZnaUJtYktqVnAwT3dhbDRjQzgxQk1wMmg2SXBK?=
 =?utf-8?B?aG56UmxWaStzcmdNVlNyZkNtcExpSWRRS09UdkdFdGsrZ2tNS0loUmIxbkxE?=
 =?utf-8?B?bDVaZzZQaTVTQkpmOW9md2ZGbDBKcTFyR3BabTA1THBSZDV3Q0ZQczZUSGRz?=
 =?utf-8?B?bGxyUm53RGpYb0dIYVUraC92STZibTVaWCtoWU1xdDI2TC95aVA2Z0I3YVF5?=
 =?utf-8?B?M0wzVkZ2SXdLRytXdi9oYVA3Y1Bma2xIMWRRVXpSR3pWZStGRXY0MTY4bWhJ?=
 =?utf-8?B?cy9sNXRLWEx2TnhtNFlnckdYU3g3c3JDVGhZK05ibERtNXZ6OWtOU2E4M1JH?=
 =?utf-8?B?SmR0cGtNb2U2NXcwNjZkSmF0VFRzTGpsTHFJR0xPSXc3M1RycUJ4QVRBdUxa?=
 =?utf-8?B?N1REeVJpWEtMZU5GZmo0MG9kcmdTdjNyVk5uUHNJS0pHTDM3VWpId0ZBbW5q?=
 =?utf-8?B?QXk4QVYyVEpHSVoremIyeTJWZFk1K0xQT25vWi9HVjJpMm1Wbmo4eXZkRWtj?=
 =?utf-8?B?L1VBZldHeW9tdWpQQ3g1TCtUNFVubFcvMzEzZmxDZXg5QW96MngzUXp0UGU4?=
 =?utf-8?B?T2l2V1BqWHZ4a0wweWpwZ3JiSW5DdHYrb3NFdXFDSjBCTWlySUJqSGY5bmRu?=
 =?utf-8?B?S09icWR5a052REtpUlNCYVB1akxSdWM4Tnp6SlNQdW9mVWh3TXBVMUlzNVhJ?=
 =?utf-8?B?MEViVlpIU0ptYUJkbG1Ea3NXNGNCTGYrbWRtSjBoN0ZsUmdiaC9VZmIrS2ZH?=
 =?utf-8?B?KzRSbk50dVowRXJ4dHdrMHVrRHJCMWErWnJNSjBNRUhRNUNRTEtrNTVveHli?=
 =?utf-8?B?OFZieE1GcFJiNUw1MS8vZ2FkekhKQ1UybVV1S2kvWk0wQW1xYnN1MzdiOXhT?=
 =?utf-8?B?a2dvNEJVZzJWazJhNFBpVXpYenNhU2FGR3pCcmhnT1RSdUJmNUJndk81K25X?=
 =?utf-8?B?cENDSTFaQUNvanppNDB5cG5CWXMydkxDdmZ3eGY2WDJYT1IrMU5xK2N3ZHJB?=
 =?utf-8?B?eUo2SGxKbzU1QnRPTm93bWR4TVdleFFOMmtKOXNWS3I0MjFQalNzZ0krd0VF?=
 =?utf-8?B?ejUrOThOL2pJM2lVMEtUMTVaMXdaTEgwdVIrUGQwZGZyVTczQUU4bUZiRmJV?=
 =?utf-8?B?RHhYWUhsK1BSRk0rR1pBM2RlNEM1L1VlSnNrV2dFeEJ6eUFkT09CSjFSdEdZ?=
 =?utf-8?B?WkNNaUdtU0t0c1FOK3BCOXBmbnNYYldBRktxd1Q1YWdDSjE0SnNiTWxOZUJz?=
 =?utf-8?B?ZlN0K0hMaHFzRysyM2hWUEgzemZwSW80Ykx4dHdMNTNuS2VBOWFVS082Vm51?=
 =?utf-8?B?Zlc5VHZHSHFVcWVsWjFOaVNmMlByZjFFZGpCajN4T0ZXTHZkdm9oNjRDWVZr?=
 =?utf-8?B?Kzd1L3ZCNmJNa2twazZkbVljU3pUaXRMeURsWHZaait5MHJnYVZvYUdrWlFQ?=
 =?utf-8?B?QXZyQnZMSmt6enhqVFhEMjFiWmdaNFcyVDcxNU44UmlTb2Z6UDZObkJqcUpi?=
 =?utf-8?B?T1ZXdWVDeHd3anl1bnZRanhZeXVvbHdiNlBDZjMvME5BcXFJMFVXQ1crVU1l?=
 =?utf-8?B?SEhIbVg0R1AvaWQ4eFVZV1MxRjc2MytFMWNReFBERjBZd3E1a3pubkxUZVdl?=
 =?utf-8?B?T1N1U1dmV0RkU0h3bEpzOWJPS2xGdXhoQk5DRWkvNGpoNGlQL3hYWHRhM2d5?=
 =?utf-8?B?M1lOblgzaXRkUHIxbHFwR3hKMGtXUzQ2aklZdndFZkpvSVgwbVc3UENrN0s3?=
 =?utf-8?B?bFNmbTE1SGhPekVxcml4bXZtVEtmMHBmYStkdXZ2RGV2amdMRExiOEZCdU9Y?=
 =?utf-8?B?TGl4SisxaE9mRWtDdjVJRE1kYzN5TFgwM1N1dkYwOXF6bXFjNk8rQ2k4Kzd6?=
 =?utf-8?B?QzdXYlo0cTJ1SHFTdGhtdkxVOHNpWjhJZSs2a1puQUJjYktVNHB1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91C109BBC0B1774AA0AF76B3F082979A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414204c0-b4f9-4267-1b41-08da2957ab23
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 20:42:53.5819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7f/ud/Cz87l1hX5WbVTkHVykyt8jXhirZR8BeKZiSiQSK//29HB6ajyIPQRtO31aJX5qNtpTh4G+4DtVPSIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0074
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
Cc: "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gNC8yOC8yMiA4OjQwIFBNLCBEZSBNYXJjaGksIEx1Y2FzIHdyb3RlOg0KPiBGaXggYnJva2Vu
IGJ1aWxkOg0KPiANCj4gCSQgbWFrZSBXPTEgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLm8NCj4gCSAgLi4uDQo+IAkgIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hh
bmRsZXJzLm8NCj4gCWRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jOjc1OjY6IGVy
cm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGludGVsX2d2dF9tYXRjaF9kZXZpY2Xi
gJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQ0KPiAJICAgNzUgfCBib29sIGludGVsX2d2
dF9tYXRjaF9kZXZpY2Uoc3RydWN0IGludGVsX2d2dCAqZ3Z0LA0KPiAJICAgICAgfCAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gCWNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQg
YXMgZXJyb3JzDQo+IA0KPiBDb21taXQgZTBmNzRlZDQ2MzRkICgiaTkxNS9ndnQ6IFNlcGFyYXRl
IHRoZSBNTUlPIHRyYWNraW5nIHRhYmxlIGZyb20NCj4gR1ZULWciKSByZW1vdmVkIHRoZSBwcm90
b3R5cGUgZnJvbSB0aGUgaGVhZGVyIGR1ZSB0byB0aGUgZnVuY3Rpb24gYmVpbmcNCj4gdXNlZCBv
bmx5IGluIHRoaXMgc2luZ2xlIGNvbXBpbGF0aW9uIHVuaXQsIGJ1dCBmb3Jnb3QgdG8gbWFrZSBp
dCBzdGF0aWMuDQo+IA0KPiBGaXhlczogZTBmNzRlZDQ2MzRkICgiaTkxNS9ndnQ6IFNlcGFyYXRl
IHRoZSBNTUlPIHRyYWNraW5nIHRhYmxlIGZyb20gR1ZULWciKQ0KPiBDYzogWmhpIFdhbmcgPHpo
aS5hLndhbmdAaW50ZWwuY29tPg0KPiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
DQo+IENjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNCArKy0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KSGkgTHVjYXM6
DQoNClRoYW5rcyBzbyBtdWNoIGZvciB0aGUgcGF0Y2guIFRoZXJlIGlzIGEgcGF0Y2ggdG8gZml4
DQp1bmRlcmdvaW5nIGFscmVhZHkuIEkgd2lsbCB0YWtlIHlvdXIgc2Vjb25kIHBhdGNoLg0KIA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBpbmRleCBjZjAwMzk4YzI4NzAuLmU0
MzU4YWEwMTA0OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gQEAg
LTcyLDggKzcyLDggQEAgdW5zaWduZWQgbG9uZyBpbnRlbF9ndnRfZ2V0X2RldmljZV90eXBlKHN0
cnVjdCBpbnRlbF9ndnQgKmd2dCkNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiAtYm9vbCBp
bnRlbF9ndnRfbWF0Y2hfZGV2aWNlKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCwNCj4gLQkJdW5zaWdu
ZWQgbG9uZyBkZXZpY2UpDQo+ICtzdGF0aWMgYm9vbCBpbnRlbF9ndnRfbWF0Y2hfZGV2aWNlKHN0
cnVjdCBpbnRlbF9ndnQgKmd2dCwNCj4gKwkJCQkgICB1bnNpZ25lZCBsb25nIGRldmljZSkNCj4g
IHsNCj4gIAlyZXR1cm4gaW50ZWxfZ3Z0X2dldF9kZXZpY2VfdHlwZShndnQpICYgZGV2aWNlOw0K
PiAgfQ0KPiANCg0K
