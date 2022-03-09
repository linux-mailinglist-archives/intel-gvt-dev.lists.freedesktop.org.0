Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE694D2971
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Mar 2022 08:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106510E125;
	Wed,  9 Mar 2022 07:26:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF19A10E125;
 Wed,  9 Mar 2022 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646810805; x=1678346805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JsDJ5+AbDH3gp3oBrgL6IRGlf8/sX3sDT/427jij20I=;
 b=QZzELIlZo32o5KTtVC85l8LPjZdwBwihFhDWKpJGn7VFsIOGQPUivWVA
 d4FiV5DJeHovNj7+yTA4k4y9RDjVwNcbvf5NhoD7QoBtA5KV/g7vISzXr
 nactSrmC7aIqnwYTNCmFVkzsK4OHth6uycNl8Vi1XtR9H+3vY2il+W0jV
 7tfqh0d2Dh0ApgMoPjrv7dTWQ7mKoomjLC1hv1C8/dgrmE6UK1xjqUEKT
 aNUtjBO6ba0N1fPlP8K0usf0gENxQQOYLqPCbEH67jZDAca0XKCF18WXz
 R3UUZ7bKKxCFRuOjqTGOR/tRaZyOW7PfqYOKjoN0YR6uSmaR8dB1NfFoB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="318137260"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="318137260"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 23:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="537896178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2022 23:26:45 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 23:26:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 23:26:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 23:26:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL0lqXhb41ktz5kgxsrYp/TosmQsbOlUZtF3amlkCRt6IhuESUccy80TfK85kYK4PcI3RWRCWAeDl60iuZn7/hZgSkOV69B3pWwf2TK+XIE6Y66RZgGvG9+awoejlN1EiJuDrXVGY2qdSroTLfexxxPSJjGpovAeG6tt49+KSpSU+EbnFSWwIN/jld5tkl6Ux/XjmB4vb/1pUbNTCArWaidcCyv5taad96oXbVBWhc6YUPG8lUiCmht2Zgfyx/yEoB4tbvlUHZfXXhmY9h0ddd/EWb9ScwX7oxLfyecPtViSeclZUBhNl0J6P5875K5TWHa0mp1PBsIsCtbMDlR1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsDJ5+AbDH3gp3oBrgL6IRGlf8/sX3sDT/427jij20I=;
 b=FT2/mwVlbjQWpvhv3BdabM1b9vMIid2B1ZURtE1jq68Gm7pnvkoJJYU8698X0Qnvx2VvNwsz/JhSH1glpp7CWFskP9WDYeT/u09pR12K+oOWyCzBDl+95f5lDwL4SzmjNT46S7HgsSxjDOIvpY3xkFPP6ABuay3n4e/ToL83NRqOx4jx3SjPFnDclb3jxmTrapYYCZY9khosNcK5uKdx6FJ6xeMdGZuL5qx3lY38TGBfO+Xtlr5lJKiPgfmRasv9szqPkn/3lkg1WpbiuFwGHeVmRMQ3nCOkb4rB+ibgGRpiWsrwTdEaVa2/CKysSsoWo2vYKLfsuyqVdIj2sc4cdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BY5PR11MB3943.namprd11.prod.outlook.com (2603:10b6:a03:185::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Wed, 9 Mar
 2022 07:26:36 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 07:26:36 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next
Thread-Index: AQHYMresZ/14w/uEPUO59mgSWWfBhqy1QA2AgAADCACAAFc8gIABDkOA
Date: Wed, 9 Mar 2022 07:26:36 +0000
Message-ID: <25295e6f-1b85-a58c-cc80-1f13df39c2c6@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com> <Yd2W4T1Y8X0cP/PL@intel.com>
 <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
 <e38f0725-6b22-8e49-b8f6-41986b0ece06@intel.com> <87wnh422f6.fsf@intel.com>
 <ebfe0e0f-d240-8435-0517-2be3b89252ba@intel.com>
 <164675275779.144512.4612996465580196155@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <164675275779.144512.4612996465580196155@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f761bac-4bf2-4859-5d4a-08da019e253c
x-ms-traffictypediagnostic: BY5PR11MB3943:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB3943B90AB2AD711E806706BDCA0A9@BY5PR11MB3943.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XX0rL3W8lX3UkxH8v0NrV8xW0kPLoM1cu+sAQGM9WWCwqvxqaPO2J0VDeEmlZ8LYv0Odvi8T5jIkCmL1NgjU0Awu7rbSPPXs7ChBcsRZvo7HvuTDs6zcCtOwcDsQ/ix8AgBJX9RkVWlZymhBNjT+x2BLlJvAiEesJhXG0Vtm/wx+DiHn18evRpbquJ0WkcSoRCozLv7+VaV1G1XRwFIl50CYosFpwXD3i2F8Nsd1VDLrAzkFYrSGY7O+Gc/z8ZxUGkn35aaWNLK5XtDhMtebMqWXH34ssfSEg6fTRFxGfLD5HnLwOYA6DIGpzH2roE+Je+2VIdNJcrISr6WxG0oVW/+INnPsUaqpujXR1Jno1NA9I00yKCK+qCTCkXEefNXLdnBeOXj7ypjMTFe2Q26ov00duuChsvXKYG1SFQwMlNDJwhSKdkJBdOraBg60gpJW2d+d9VsvMdNL5k1wbcpa90E0bBF9/tE4FkmqJNfwCqUdBebPdJPcbZXD4zqx3Gt/vI0PZ8yD6GUUXb0CcTG9uBcw8oWuIVGuyj2coBSKm+HJaxNNf+ZlCzfnsje4H7JGzkcWLq8Ha1Ebpl6evXPZkO0EcTvuhIZu6ZXXzbxjrhEknWlakdGg2Aa3AfNrWrCiInDPRKPCzVXLWdSu/UoTYeFt+ZPylat46otAXdUf2OO59XfceveSX3zZzdQxg1Q8oB3NOv7DpAal1AtVf1wyhE/+w+3g9/o003Exo4kJy0X6Ba4BAWijnQRoElXcKXzrrDhaZ6VTlRJNNUyenmZYDlgOqLNByGoL4U8uL9srzPS8V9nC9Hi+RcQ9KOkcjSiWG1WFJW9FAydXlrUQv7suuL3dtL41LQGyXyb3PAqYJOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(66556008)(66446008)(66946007)(8676002)(966005)(6506007)(4326008)(91956017)(71200400001)(5660300002)(53546011)(64756008)(66476007)(76116006)(38100700002)(508600001)(6486002)(2906002)(8936002)(36756003)(110136005)(54906003)(38070700005)(31686004)(83380400001)(2616005)(186003)(6512007)(26005)(86362001)(82960400001)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXFTRldHNE5Cb01vaUZPeGIrQnIzVFZ0dTFLeVBvU2Y0TWQwR0RKTXNhYzhw?=
 =?utf-8?B?cW1NaG4wOXY4N0czWnhlWHRXbERRd1hSNTladjZWZ1E5TDA0TUhUUjFhMElq?=
 =?utf-8?B?eHFhZ1J3bUFrM0p2d1R2L29wQ1l4QUllOC9SVXoxdFFWUVhSRGR6ZCtmZWFk?=
 =?utf-8?B?d0M4WEpvN0Z0S3UycU9raWljanF5RWhkWVNRdWd2Uzl4V0Z1TlREZERVK1JD?=
 =?utf-8?B?NEQxT21Uc0xrNUZzdU81VUg3cXZ1Nml1T29mend6QzcydlRpMllNNmJEMWJR?=
 =?utf-8?B?anJHbTBWMWhmT2dlQlp0WWd6dHc1S2MrNDNQNnlrK3JhOUNKeVFXTmJXWWFl?=
 =?utf-8?B?SHlSRDdyRjNlLzIwZG0zTnlaazlJczlBeXRvWWtIaFFSVFUra3VYa2RqZDBw?=
 =?utf-8?B?WENUVDF3dGlZbzNhTExCQmV2TVNGeEJUS25ac3B2QmdScmtTUVpwY3FLc3JW?=
 =?utf-8?B?TGoxb3JqL1YweXVxYlphSVQrUUJnb3lRSlhNVlFCR3hOZ25veFVPYUNzNTBH?=
 =?utf-8?B?TExxQkVpYksybDlBdmVBbDdwNnNyQkhHS0FVbFk5cVNlKzZkWVRYckljOTg4?=
 =?utf-8?B?dTJtc3ZueGU4ZHBXQ2VMZSt1aXZXb3FWVG9yTDhBQndqVXk4T28rZk00OHZD?=
 =?utf-8?B?a0NOR2xFUm1EY2lGZm1CUTZtanNhRG9jOCtzaXZ3T1I4OGJOVCt6Z25yc2RO?=
 =?utf-8?B?RVd6QTFhbWIxakpGTU51SXp3ZGdFRlowdUtjZ1JHaUJHRXFzK201L0R6VXBj?=
 =?utf-8?B?TjJyMnYyL3JiMGVNZXNkcTloc0dMZUFUODJMZ3c2dStOUmRQdGhnRGRBRHhM?=
 =?utf-8?B?L2NZOXdHVVk2SEtpTi9wVjFiYUxkTUxWRzVUN1Rma2ZEakYveWV4TGMvblpE?=
 =?utf-8?B?eWp3M0loUGJpTjloQm82Z3FWSkZqNlpuc2tFYUxlamVFblRHaU5sS3BhbWxF?=
 =?utf-8?B?Q1dBSjR0elJZQkNRYUFKd0lwcUFNeUE1b1VxcENXSmlVN2ZybGtyYnpYMEVx?=
 =?utf-8?B?TzlMcTZBRVVOUXBkTllQb3RFby9waGtWbGl1NnRZeVFGVVVDbkNsWDNkUUE4?=
 =?utf-8?B?QnA4VHNzd1RVWUtaRmh4S0FWclc4UHJEUG1JNHJTMEt2M2lnTEdSMGIzZkVo?=
 =?utf-8?B?eWJNbjZ6c3paNWQ0bi84MElmTDExS3ZiRFltbkpYanRxbi9lQm1kdU5XVW8r?=
 =?utf-8?B?MXhKbWZFQXcxL2NodGx2amtQa1VZUVhoMlIxV2lnN0ZXZlo3RHF0QVcwbWVl?=
 =?utf-8?B?VGNKOXJ0ZmExT2t6QjR4eUx5aXRJYm5ycW1XOVBYdElvRFFDWCtNUGNiTHp6?=
 =?utf-8?B?VmVKbk44cmU0a3YwU3lsdDhESHUvWUtHTnkvb0t5dFo0US80Z0syWkpiZ2t4?=
 =?utf-8?B?bUdiNkNTSlk5NEhLTU5FdXlBSWx4NVVBZExGejhDcWdZOXdKcjRsZWRwYmJm?=
 =?utf-8?B?Ym92WkJtYmkyZS9LaVB0dlU3WmlKT2crQ1ZROWJKb2hQR21GK25DcERYdzRu?=
 =?utf-8?B?ak1oUjhaazJ6UFJqTk1lZm1lalgvNEw2OEk5a2ZOLzVBaUdKK0w1MStIQUhq?=
 =?utf-8?B?ZHY3bHg3ZVhvSkNwcmptaTVjeW9ndFVvNU9RNWlvRVB4Rk1VeEZvL3NEWGtR?=
 =?utf-8?B?WlI0VWZLS1lUVjNYeGsrWkVUQ0dhWTBnM1Ereit0OFRWaGpYblFxSnZ1REZD?=
 =?utf-8?B?N0dLRTFYQ3Z6YWY1UVhTaG5Wa0lpQVR6WS8wVTJnbG05N2FhS1Z4T2cyMm5B?=
 =?utf-8?B?NkxTeUozaVhRYXNwV2IvcU15dnhIY3oxQ1ZaTldJRzVkb3RpTDRVeDRQRml0?=
 =?utf-8?B?SEFtYjJTbDZObHZHSWtSV1ZFaEphYmpzRkx5M040bHZVZ1VFdVpza1pHeDg5?=
 =?utf-8?B?Zm5GK3FNVVZ0blk1VWRVWGZWNis5bENldDYyZmZlcmN2ZXVYeHB1L3NQMGth?=
 =?utf-8?B?Q1dGMXdLUVI0bFUxdTRBUWxxaldDZitMZ3ZlK0ZLVWxDTm5uNys3Y295MXRC?=
 =?utf-8?B?cmdHdVY3RFozZzJnRmxpNjZBSmExSDZJYkFpUEpYRHk4YVVCMVFmd1BqbWZ4?=
 =?utf-8?B?dHlqM1BLQkRzYk9jZVROOGFTUlVPbTJyZnRmeXRaRkJEejd1QmVGOHNvNHlZ?=
 =?utf-8?B?RzlwcHh5YjFFZ1ZuQy8yQVJlWmVwcXdxZWU2MzdiVzJlZVUxWXZyK0JLSXJT?=
 =?utf-8?Q?d+uZqf5wz10EcK6J8XJwsRQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7824C7AE3F401848A3E9E95F37D1DE2B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f761bac-4bf2-4859-5d4a-08da019e253c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 07:26:36.6426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sC07gUtLAYLUtCT8s/ClZ+2sQdL57HSWXWa/sq++otmQubp7Vw4MwmpTx9X4P7f4GO1U/RiU269X2whLGZyT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3943
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgSm9vbmFzOg0KDQpUaGFua3Mgc28gbXVjaC4gV2lsbCBkby4gOikNCg0KVGhhbmtzLA0KWmhp
Lg0KDQpPbiAzLzgvMjIgMzoxOSBQTSwgSm9vbmFzIExhaHRpbmVuIHdyb3RlOg0KPiBRdW90aW5n
IFdhbmcsIFpoaSBBICgyMDIyLTAzLTA4IDEyOjA3OjA0KQ0KPj4gV2hpY2ggc3VpdHMgYmV0dGVy
IGZvciB5b3U/IEZvciBtZSwgSSBhbSBPSyB3aXRoIGJvdGguIElmIHlvdSBhcmUgbm90IGluIGEg
cnVzaCBvZiBjbG9zaW5nIHRoZSB3aW5kb3csIEkgY2FuIHN1Ym1pdCB0aHJvdWdoIGRybS1pbnRl
bC1uZXh0LWZpeGVzLg0KPiANCj4gSSBwdWxsZWQgdGhpcyBpbnRvIGRybS1pbnRlbC1uZXh0LWZp
eGVzIG5vdy4NCj4gDQo+IEZvciBmdXR1cmUgcmVmZXJlbmNlLCBsZXQncyBoYXZlIGZpeGVzIG9u
bHkgUFJzIGFzIGd2dC1maXhlcyBhbmQgUFJzDQo+IHdpdGggZmVhdHVyZXMgYXMgZ3Z0LW5leHQg
YW5kIGVhY2ggYXMgYSBuZXcgbWFpbCB0aHJlYWQgaW5zdGVhZCBvZiBhDQo+IHJlcGx5IHRvIG9s
ZGVyLCBzbyB0aGV5IHdpbGwgYmUgZWFzeSB0byBzcG90IDopDQo+IA0KPiBSZWdhcmRzLCBKb29u
YXMNCj4gDQo+Pg0KPj4gVGhhbmtzLA0KPj4gWmhpLg0KPj4NCj4+IE9uIDMvOC8yMiA5OjU2IEFN
LCBOaWt1bGEsIEphbmkgd3JvdGU6DQo+Pj4gT24gVHVlLCAwOCBNYXIgMjAyMiwgIldhbmcsIFpo
aSBBIiA8emhpLmEud2FuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPj4+PiBIaSBmb2xrczoNCj4+Pj4N
Cj4+Pj4gSGVyZSBpcyBhIG5ldyBwdWxsIHJlcXVlc3Qgb2YgZ3Z0LW5leHQuIEl0IGNvbnRhaW5z
IGEgc21hbGwgcGF0Y2ggdG8gYWRkIHRoZSBtaXNzaW5nDQo+Pj4+IG1kZXYgYXR0cmlidXRlIG5h
bWUsIHdoaWNoIHdpbGwgYmUgdXNlZCBieSB0aGUgbWlkZGxld2FyZSwgbGlrZSBrdWJldmlydC4N
Cj4+Pg0KPj4+IEknbSB3b25kZXJpbmcgaWYgSSBzaG91bGQgcHVsbCB0aGlzIHRvIGRybS1pbnRl
bC1uZXh0LCB3aGljaCBpcyBhbHJlYWR5DQo+Pj4gdGFyZ2V0aW5nIHY1LjE5LCBvciBpZiBpdCBz
aG91bGQgYmUgcHVsbGVkIHRvIGRybS1pbnRlbC1uZXh0LWZpeGVzDQo+Pj4gdGFyZ2V0aW5nIHY1
LjE4LiBJdCBkb2VzIGxvb2sgbGlrZSBhIGZpeC4NCj4+Pg0KPj4+IEJSLA0KPj4+IEphbmkuDQo+
Pj4NCj4+Pg0KPj4+Pg0KPj4+PiBUaGlzIHB1bGwgaGFzIGJlZW4gdGVzdGVkIGJ5Og0KPj4+Pg0K
Pj4+PiAkIGRpbSBhcHBseS1wdWxsIGRybS1pbnRlbC1uZXh0IDwgdGhpc19lbWFpbC5lbWwNCj4+
Pj4NCj4+Pj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzMDQyNGViYWU4ZGYw
Zjc4NjgzNWU3YTMxYWQ3OTBmYTAwNzY0ZjM1Og0KPj4+Pg0KPj4+PiAgIE1lcmdlIHRhZyAnZHJt
LWludGVsLWd0LW5leHQtMjAyMi0wMi0xNycgb2YgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5v
cmcvZHJtL2RybS1pbnRlbCBpbnRvIGRybS1pbnRlbC1uZXh0ICgyMDIyLTAyLTIzIDE1OjAzOjUx
IC0wNTAwKQ0KPj4+Pg0KPj4+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoNCj4+Pj4NCj4+Pj4gICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4IHRhZ3Mv
Z3Z0LW5leHQtMjAyMi0wMy0wNw0KPj4+Pg0KPj4+PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gNDNkMjZjNGZjNmM0NDZkNzY2MjUzZDU0NmYwMDgzZDc4MDIzZDM0YToNCj4+Pj4NCj4+
Pj4gICBkcm0vaTkxNS9ndnQ6IGFkZCB0aGUgbWlzc2luZyBtZGV2IGF0dHJpYnV0ZSAibmFtZSIg
KDIwMjItMDMtMDcgMTI6MjE6NTggLTA1MDApDQo+Pj4+DQo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gLSBh
ZGQgdGhlIG1pc3NpbmcgYXR0cmlidXRlICJuYW1lIiBpbiBWRklPIG1kZXYgaGllcmFyY2h5Lg0K
Pj4+Pg0KPj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+IFpoaSBXYW5nICgxKToNCj4+Pj4gICAgICAgZHJtL2k5
MTUvZ3Z0OiBhZGQgdGhlIG1pc3NpbmcgbWRldiBhdHRyaWJ1dGUgIm5hbWUiDQo+Pj4+DQo+Pj4+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyB8IDE1ICsrKysrKysrKysrKysrKw0K
Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pg0KPj4NCg0K
