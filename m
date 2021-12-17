Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864E447867C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Dec 2021 09:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2753910F68B;
	Fri, 17 Dec 2021 08:51:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632A10F68B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Dec 2021 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639731058; x=1671267058;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8L4W0FAkfX+xd/zuS1Oxog7tz7DJvy/sJ54PRfkGswg=;
 b=bQ2eJQGcqu7FGXSgvnpZkpyuHow+4rnZqVZw4kl2AYGqfn+f9R4BdSJ5
 ZGiprp6O0y5YPjlP3bj6CGmmKoyq04WTM7iqXucgyNP9vbrq0vfPOmBuR
 jJxZvcZDSXmFlzYF5ziIjs0fGA4U+fr1AX8YANb8S3x7Tu7EYR0/mJYEg
 Sfh6CzQWZnImazf5ie+QQ4O6k5DWrYQzjaKk9o+1M8kEVEXTTGdJzmVCb
 gHhuIEU/TYkZz/jzN6lsTA+JtM8tnSWNkS7jGmRgz5XJ4YDVpeXEd6veR
 7uwTXqBGN4NW2ZZhyiPGRk2FmbnQASvNVXOGnQA2aHJpZHdsUjkXYmBmD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="219728412"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="219728412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 00:50:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="466433157"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 17 Dec 2021 00:50:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 00:50:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 00:50:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 00:50:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 00:50:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYn9KhH0nDwBIPhbdtM6OG516wDlV/dkHt1mmyAQQUsZ8CMjbplWBVvG5DMKhdGMGJQPnYBiLuc4TmfXvELxjrinsau3ZH0ZCyM7XH9mm1Dh1WSWAeVmEsxAUWvcuFU3jexIFGPoeyzkHa9ZhwIxvuI7do0rCzIjzpuD+5ojOVVe/Ksu9c2FmFmyuUuzxpJ1VaPWsAVBV7E+0Pd9jCefqrDt8VPhCLmeZFlkYmbVn60JpP8DPTnFPq7DV303+KfgZtbzzHcm1d62PtbcSEK7GIYZ5T7lDKeDVDQJEZvst+s/+d/K5wz0mGVHUxyXhCupy+pU+5gPN46WyLidfaH8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L4W0FAkfX+xd/zuS1Oxog7tz7DJvy/sJ54PRfkGswg=;
 b=oLzr3vu87oACqB49L1oORaEJn88YqpFthQcgU2yHBxUBp9sUC8q8WVzvFyz0X+FW4hnjhdzJVA5ydfqs/Oq0g+wPYBymTCzhPD1rO0vbSUrNEpXJpOCqKcfLGWSXnS4rL/bCLHj6FTJbSkoHsrsis3LWKuBei00YvoVB/CfMlCFJqyhWgwrMVZ69CZ92xg6LzfYn6ui5h5U8mWu7M+YGRN8Ffb6xWzVUX4nsOz01CSbm9+PCYwxzyzSo91sGoRbZJEbF/eA0FNuefP5R5J496hKjfWf9F/DthW9iLp83x5xTowWX9PJB7HqmTZ6xfCUoECyeb4MF2bI+4kD/errc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by CH0PR11MB5721.namprd11.prod.outlook.com (2603:10b6:610:112::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 17 Dec
 2021 08:50:56 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::755d:532a:e27d:4742]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::755d:532a:e27d:4742%8]) with mapi id 15.20.4778.016; Fri, 17 Dec 2021
 08:50:55 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] i915/gvt: Stop tracking the pages of page table when
 failing to do shadow.
Thread-Topic: [PATCH] i915/gvt: Stop tracking the pages of page table when
 failing to do shadow.
Thread-Index: AQHX8rup9JQQBqhNAkav8UYFIa0cFaw1+3GAgABlf4A=
Date: Fri, 17 Dec 2021 08:50:55 +0000
Message-ID: <0ba174b6-8c32-328f-54ae-59ed3dc24a12@intel.com>
References: <20211216202900.1111-1-zhi.a.wang@intel.com>
 <20211217024739.GF1856@zhen-hp.sh.intel.com>
In-Reply-To: <20211217024739.GF1856@zhen-hp.sh.intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee56ff4b-4c1b-465e-d01f-08d9c13a56e6
x-ms-traffictypediagnostic: CH0PR11MB5721:EE_
x-microsoft-antispam-prvs: <CH0PR11MB5721AA91921D6CBEF3C1AEEECA789@CH0PR11MB5721.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:163;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVNNgp7dvmO4jXBLY1XEhfuUZjl2IbIbGSaWSZCypWz3LZbx3H+GA1GYYsRp4ayfyKxqCsam3Id7V/q8HNpzrKlAA0jL+gX/t/UYfiHfJDpPMiUkHLal4ltKeN8JkCgclBGbKth+2yuHNBZDLUnPIb3PW2/tTQdRBXXPauzyO0w32fiOAFyOipcpxY5158rebozoTKT5ZRkoUXZXpKZDTks2W9YQNuvZMqV/eRoNxhFCIedt8YuNmhi5SfkMa+jsHgZkNPWGMH4vcIuvjxl3wbz5QxWWHMa2jNkKAOnga8BsicKHsVom35+pBEFU7rQAitobmyfSF1wslfkgPyWen3Qxh60HZH62DneSf521wq5H3KSO2pefTzW7NweycJfEW2rHEeIWnhN01eD7rfTsHhuq9trZky4EOv27JgbOzgA6paJ83UMZY3Hku9VvPmcAUuBD9oKQS4Rt663aYo1EvJN5ZFjvGK9IUK9XqBlbqq/RyYKoPzhCi68Q4JQBQWdAtm74tX0KFgS1XM13vF1/v150U8KGGSbYaDyB6QSxTbaoUZP48H3Vsm4PR4t2net67JhmMDbRE1MyL/OdxjAR0Ca4jollKyCqD7NV8wV99hefgqtUvPasjW0rgv7Gy/IqM0GV2xBGUJnuVvD1It81KKgvQf7pFBZ1SP4W6/SM/07IbSzs4h36Ns2Ny4x1bNtj9I1duLXMYMbtGOD6nr64iBq4Aals6XGIehb7lX3x5OglyK3wciKkZmd0SlKR/86mgMjR8Q2fXaT9TOlOyS3C2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(36756003)(82960400001)(66446008)(91956017)(76116006)(316002)(6512007)(64756008)(83380400001)(110136005)(8936002)(66476007)(66556008)(31696002)(38100700002)(2906002)(53546011)(8676002)(38070700005)(31686004)(6486002)(26005)(122000001)(6506007)(66946007)(5660300002)(2616005)(508600001)(186003)(4326008)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1g2TVUwQ0x6c1FhekhWVTRvM3pScy9rY3RFSXp6a01ZNVBBemI5VUF2UXBN?=
 =?utf-8?B?ZDlSSlRVYncwY0kyNlVPazJ1WFo3Q0k2YStESEtVSzE0ZVNwWTV1TlljSGFT?=
 =?utf-8?B?a3J2Mlk3bzhZYURDZEsxWmxqL0FCcXNZT1JaSUtEMkxDRGwrc044bnkzekxQ?=
 =?utf-8?B?cUM4WDZqaFBVd0Zhai9nck0yL0pLNEdQdmhHZGQwTUZjblJEZnlLUWt5UEF2?=
 =?utf-8?B?QUt4MDNJdnkyNUZEVUNxYStXcUxyZWMzczBwNGR1RGF3MDk5MEs1eFI4M2tU?=
 =?utf-8?B?azROdUdNS3dDWHJkYUtwVWFrNy9TT2lkYUN4OHN3cnlTdHV3NjRzMlE5ZXQ5?=
 =?utf-8?B?K1RZWnRNWDNJaGYwOUc0WEdoTEF6OVJhdGZ4RjBzZUE3eFdXcnRLR3ZmM0VE?=
 =?utf-8?B?eEtCbGoyazNFcVNqbHB4cWdvQnlUMG5UZ21Eb205MDlKWEhjVE53S2xNQWhV?=
 =?utf-8?B?L0VDOUppUnZTWHZ0dlhBL2pmUzJkZUpVWmlOQm4yOWlaMktDMFIrclNJTnYz?=
 =?utf-8?B?bGs5MmxMRERpbkFwOWhMcGUwWGxQYXJ2TCt0NjJWWWxBNVAzTlJKUTZOWUNL?=
 =?utf-8?B?ajlSN29HdjFJMlhFU0J6NmFrU0J3NnpwaStmTzQ4dGNyS0Vaak9rQVZyZTdn?=
 =?utf-8?B?K0hGZE1ScDVxM0thdlFhR2hzNzl5NHlSRUNuSVU5MVQ1TFh2TW5mUTZVRGdD?=
 =?utf-8?B?Z0x0S1VkV3liRUlTUmxlVHo5Z3d3YXRXNVpKK0FJbXM2SGhnZDRGRGF6amFQ?=
 =?utf-8?B?bm1QR3o2akMzVTJHNnZmaC83eThqTnZGUXBVS1JYb1ZkMmhiWGoxc0w1Misv?=
 =?utf-8?B?akZMclBZWVBDTlQrMitDUWVNWWp6RDVqcTA4d0tWTHFUQVovWk9WdVppaUcz?=
 =?utf-8?B?L2ZmWHFGUWpsMjlTSVM1YXI5SWFpKzdnS0Rmck95VUhTbFFQN2JJTzJPTENV?=
 =?utf-8?B?WWJwa1lUYXFBaXgrTVJqM1VmdVNmY1FRU20weVNNTlo5cVU4azErTFJTZS9v?=
 =?utf-8?B?ZkF1SkJ3WDQ0bU83bmxUek9TSW1pOW01bTZBV2pHV2lWNWp2ZGhLR29WU05F?=
 =?utf-8?B?aXVBWGs3Z0hkajVEQjJQL0ptYUc0blFOTUdXNGN0Y1lvbzl2TG4vUHFVd0U5?=
 =?utf-8?B?QVFHVkgzb3N0Q1VoYjI3bWZ2djdmaExmVVVHU1kyanRad1Z6S3laL2Y3TE52?=
 =?utf-8?B?aFZDYkh5UFFTRVZTVVVIZDBDYlFSeUozeEUxTkc2MGpUVkNBVGVCUkM3b0lm?=
 =?utf-8?B?WXNFWnNKM3ZYSXo2TVJsUHh0WEZwNkFjOTZ5azlIMmdtd1QrRk5XS2VWWkhq?=
 =?utf-8?B?VnBuYjBjU1hKbEYrS2plZWZCK3J5OGtrQUpQN3F5SmJMQzcwSzV6aXpMUkw5?=
 =?utf-8?B?SVdtMTdGM1dOVGVHa09kZEJyRUdZRTh2Rkh1UnQzdERpdTkyWTBScC84ZGNy?=
 =?utf-8?B?bnZrbFhZdC9LK3IrYkpXNXZJbWNnb3pHa0k0TERZWHkxazNuOTZEaUdINEd2?=
 =?utf-8?B?UXhOQmFyeU1JVlFicU83SW45c1poVXVrRm1XM1phUHpmSmRHVnU4YmVVRWd1?=
 =?utf-8?B?Y0JyWG5CSHg0WlFDWHV4cTVURDN1d2YreGIzU2lTbmI0VnpBSVI1R1dhcHM5?=
 =?utf-8?B?enBUZ3dYSy9ocUEyWEFoZFhlMEt2TENUNmZWK1B0YlY4SS9USGJUcmVwS2d1?=
 =?utf-8?B?Ry9sVjl3Q1Y0ZDRLZUwyTnN4N0hSNTNzOXM4VEl1Q3lSdFdTUGpCbStjR1BH?=
 =?utf-8?B?ZFhHMFFJU3NUNUZIOHlaWEZUSjhSakI0bENXYXMvUVF6c3pxU29SNS9RTkQv?=
 =?utf-8?B?ekNZQWVBajR4WWtvTFJDSitMY3R5U25mc2ZzK0pPZU5IK2NwU1Azc0dKTDZZ?=
 =?utf-8?B?eW9SMzZlNTNHZmFvM0YvN1cza1dNdzJnNlIxcE1xUXZKRnRiR3B0eWptSWRw?=
 =?utf-8?B?eFFYRTExaThWVTlic3B4MFdhWjVFWjUvL24rbU45K09ETUJPbE5sZDd4TXV1?=
 =?utf-8?B?STIrOEZCMlcvOXE5WXlHUjExTjRwdWtiVjNDQ3VOUnpmRGJWeTlMMjdmUWxD?=
 =?utf-8?B?T0JSTjljbVRzRERuSWYzTWkxeHRKT0pYUnRkLzgwSTZrY2ZTME0rMGptZGti?=
 =?utf-8?B?UG56U0Q3bkNQaHdSdzEwMXdFbXNDZDh3UEgxUDkwandNdVQxaVAwbHIwb21h?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57B30F5DB41F2D418F07C181AB1ACA37@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee56ff4b-4c1b-465e-d01f-08d9c13a56e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 08:50:55.9398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RGR4e6v+ckPpkj/tW2uRlItreF51X3UhhGdWCH3OznSmCxy5uFwi3474ZJIsv4dAlVKjdBnxLP9PvIamA8EqdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5721
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMTIvMTcvMjAyMSA0OjQ3IEFNLCBaaGVueXUgV2FuZyB3cm90ZToNCj4gT24gMjAyMS4xMi4x
NiAxNToyOTowMCAtMDUwMCwgWmhpIFdhbmcgd3JvdGU6DQo+PiBUaGUgUFBHVFQgcGFnZSB0YWJs
ZSBpbnNpZGUgYSBWTSB3aWxsIGJlIHRyYWNrZWQgd2hlbiBjcmVhdGVkLiBXaGVuIGENCj4+IHRy
YWNrZWQgcGFnZSBpcyBtb2RpZmllZCwgR1ZULWcgd2lsbCB1cGRhdGUgdGhlIHNoYWRvdyBwYWdl
IHRhYmxlDQo+PiBhY2NvcmRpbmdseS4NCj4+DQo+PiBTb21ldGltZXMsIHRoZSBndWVzdCB3aWxs
IGZyZWUgYSBwYWdlIGJlbG9uZ3MgdG8gYSBQUEdUVCBwYWdlIHRhYmxlLCBidXQNCj4+IGRvZXNu
J3QgdW5iaW5kIHRoZSBwYWdlIGZyb20gaXRzIHVwcGVyIGxldmVsLiBTbyB0aGUgcGFnZSBpcyBz
dGlsbA0KPiBUaGF0J3MgYmFkLCByaWdodD8gSXMgdGhlcmUgcmVhbCBjYXNlIHRoZSBndWVzdCBk
cml2ZXIgbWlnaHQgZG8gdGhpcz8NCg0KSGkgWmhlbnl1LCBZZXMuIFRoaXMgcGF0Y2ggaXMgY29v
a2VkIGZvciBhIGtleSBjdXN0b21lciB3aGljaCBzb2x2ZXMgdGhlIA0KcHJvYiBjYXVzZWQgYnkg
dGhlIHdpbmRvd3MgZHJpdmVyLiBJdCBpcyByZXBvcnRlZCB0aGF0IHRoZSBwcm9ibGVtIGNhbiAN
CmJlIGVhc2lseSByZS1wcm9kdWNlZCBpbiB0aGVpciBlbnZpcm9ubWVudCBhbmQgdGhlIHByb2Js
ZW0gd2lsbCBiZSBmaXhlZCANCmFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2guDQoNCg0KVGhhbmtz
LA0KDQpaaGkuDQoNCj4+IHRyYWNrZWQuIExhdGVyIHRoYXQgcGFnZSBtaWdodCBiZSBhbGxvY2F0
ZWQgdG8gb3RoZXIgY2xpZW50cywgd2hpY2ggY2F1c2VzDQo+PiBhIGZsb29kIG9mIGdhcmJhZ2Ug
dHJhcHMuIEFzIHRoZSBwYWdlIGhhcyBiZWVuIHVzZWQgZm9yIG90aGVyIHB1cnBvc2UsDQo+PiBk
b2luZyB0aGUgc2hhZG93IG9uIHRoaXMgcGFnZSB3aWxsIGFsd2F5cyBmYWlsLCB3aGljaCBjYXVz
ZXMgdGhlIGVycm9yDQo+PiAiZ3Vlc3QgcGFnZSB3cml0ZSBlcnJvciIuDQo+Pg0KPj4gVGhlIHBh
dGNoIHdpbGwgaWRlbnRpZnkgdGhpcyBjYXNlIGJ5IGNvdW50aW5nIHRoZSB0aW1lcyBvZiBmYWls
dXJlIG9mDQo+PiBkb2luZyBzaGFkb3cgb24gYSB0cmFja2VkIHBhZ2UuIElmIHRoZSB0aW1lcyBv
ZiBmYWlsdXJlIGlzIGxhcmdlciB0aGFuDQo+PiAzLCBHVlQtZyB3aWxsIHN0b3AgdHJhY2tpbmcg
dGhlIHBhZ2UgYW5kIHJlbGVhc2UgdGhlIHN1YiBsZXZlbCBvZiB0aGUNCj4+IHNoYWRvdyBwYWdl
cyBhY2NvcmRpbmdseS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBaaGkgV2FuZyA8emhpLmEud2Fu
Z0BpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5j
IHwgNjIgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3R0LmggfCAgMSArDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5z
ZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0K
Pj4gaW5kZXggZDcwNTRiZmIzZTdkLi5mYmZhNWI4ZjE1NDQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndHQuYw0KPj4gQEAgLTc3OCw2ICs3NzgsMjEgQEAgc3RhdGljIHZvaWQgcHBndHRfZnJl
ZV9hbGxfc3B0KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPj4gICAJCXBwZ3R0X2ZyZWVfc3B0
KHNwdCk7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3Nw
dChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCwgYm9vbCBmb3JjZSk7DQo+PiArDQo+
PiArc3RhdGljIHZvaWQgcHBndHRfaGFuZGxlX2ludmFsaWRfc3B0KHN0cnVjdCBpbnRlbF92Z3B1
X3BwZ3R0X3NwdCAqc3B0KQ0KPj4gK3sNCj4+ICsJaWYgKHNwdC0+ZmFpbF9jbnQgPiAzKSB7DQo+
PiArCQlwcGd0dF9pbnZhbGlkYXRlX3NwdChzcHQsIHRydWUpOw0KPj4gKwl9IGVsc2UNCj4+ICsJ
CXNwdC0+ZmFpbF9jbnQrKzsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgcHBndHRfc2V0
X3NwdF92YWxpZChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCkNCj4+ICt7DQo+PiAr
CXNwdC0+ZmFpbF9jbnQgPSAwOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIGludCBwcGd0dF9o
YW5kbGVfZ3Vlc3Rfd3JpdGVfcGFnZV90YWJsZV9ieXRlcygNCj4+ICAgCQlzdHJ1Y3QgaW50ZWxf
dmdwdV9wcGd0dF9zcHQgKnNwdCwNCj4+ICAgCQl1NjQgcGEsIHZvaWQgKnBfZGF0YSwgaW50IGJ5
dGVzKTsNCj4+IEBAIC03OTEsMTIgKzgwNiwxOCBAQCBzdGF0aWMgaW50IHBwZ3R0X3dyaXRlX3By
b3RlY3Rpb25faGFuZGxlcigNCj4+ICAgCWludCByZXQ7DQo+PiAgIA0KPj4gICAJaWYgKGJ5dGVz
ICE9IDQgJiYgYnl0ZXMgIT0gOCkNCj4+IC0JCXJldHVybiAtRUlOVkFMOw0KPj4gKwkJZ290byBp
bnZhbGlkX3NwdDsNCj4+ICAgDQo+PiAgIAlyZXQgPSBwcGd0dF9oYW5kbGVfZ3Vlc3Rfd3JpdGVf
cGFnZV90YWJsZV9ieXRlcyhzcHQsIGdwYSwgZGF0YSwgYnl0ZXMpOw0KPj4gICAJaWYgKHJldCkN
Cj4+IC0JCXJldHVybiByZXQ7DQo+PiAtCXJldHVybiByZXQ7DQo+PiArCQlnb3RvIGludmFsaWRf
c3B0Ow0KPj4gKw0KPj4gKwlwcGd0dF9zZXRfc3B0X3ZhbGlkKHNwdCk7DQo+PiArCXJldHVybiAw
Ow0KPj4gKw0KPj4gK2ludmFsaWRfc3B0Og0KPj4gKwlwcGd0dF9oYW5kbGVfaW52YWxpZF9zcHQo
c3B0KTsNCj4+ICsJcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgDQo+PiAgIC8qIEZpbmQgYSBzcHQg
YnkgZ3Vlc3QgZ2ZuLiAqLw0KPj4gQEAgLTk0MSwxMCArOTYyLDggQEAgc3RhdGljIGlubGluZSBp
bnQgcHBndHRfcHV0X3NwdChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCkNCj4+ICAg
CXJldHVybiBhdG9taWNfZGVjX3JldHVybigmc3B0LT5yZWZjb3VudCk7DQo+PiAgIH0NCj4+ICAg
DQo+PiAtc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdChzdHJ1Y3QgaW50ZWxfdmdwdV9w
cGd0dF9zcHQgKnNwdCk7DQo+PiAtDQo+PiAgIHN0YXRpYyBpbnQgcHBndHRfaW52YWxpZGF0ZV9z
cHRfYnlfc2hhZG93X2VudHJ5KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPj4gLQkJc3RydWN0
IGludGVsX2d2dF9ndHRfZW50cnkgKmUpDQo+PiArCQlzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dF9lbnRy
eSAqZSwgYm9vbCBmb3JjZSkNCj4+ICAgew0KPj4gICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
Kmk5MTUgPSB2Z3B1LT5ndnQtPmd0LT5pOTE1Ow0KPj4gICAJY29uc3Qgc3RydWN0IGludGVsX2d2
dF9ndHRfcHRlX29wcyAqb3BzID0gdmdwdS0+Z3Z0LT5ndHQucHRlX29wczsNCj4+IEBAIC05NzMs
MTEgKzk5MiwxMSBAQCBzdGF0aWMgaW50IHBwZ3R0X2ludmFsaWRhdGVfc3B0X2J5X3NoYWRvd19l
bnRyeShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4+ICAgCX0NCj4+ICAgCXMgPSBpbnRlbF92
Z3B1X2ZpbmRfc3B0X2J5X21mbih2Z3B1LCBvcHMtPmdldF9wZm4oZSkpOw0KPj4gICAJaWYgKCFz
KSB7DQo+PiAtCQlndnRfdmdwdV9lcnIoImZhaWwgdG8gZmluZCBzaGFkb3cgcGFnZTogbWZuOiAw
eCVseFxuIiwNCj4+ICsJCWd2dF9kYmdfbW0oImZhaWwgdG8gZmluZCBzaGFkb3cgcGFnZTogbWZu
OiAweCVseFxuIiwNCj4+ICAgCQkJCW9wcy0+Z2V0X3BmbihlKSk7DQo+PiAtCQlyZXR1cm4gLUVO
WElPOw0KPj4gKwkJcmV0dXJuIDA7DQo+PiAgIAl9DQo+PiAtCXJldHVybiBwcGd0dF9pbnZhbGlk
YXRlX3NwdChzKTsNCj4+ICsJcmV0dXJuIHBwZ3R0X2ludmFsaWRhdGVfc3B0KHMsIGZvcmNlKTsN
Cj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIGlubGluZSB2b2lkIHBwZ3R0X2ludmFsaWRhdGVf
cHRlKHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0LA0KPj4gQEAgLTk5OCw5ICsxMDE3
LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHBwZ3R0X2ludmFsaWRhdGVfcHRlKHN0cnVjdCBpbnRl
bF92Z3B1X3BwZ3R0X3NwdCAqc3B0LA0KPj4gICAJaW50ZWxfZ3Z0X2h5cGVydmlzb3JfZG1hX3Vu
bWFwX2d1ZXN0X3BhZ2UodmdwdSwgcGZuIDw8IFBBR0VfU0hJRlQpOw0KPj4gICB9DQo+PiAgIA0K
Pj4gLXN0YXRpYyBpbnQgcHBndHRfaW52YWxpZGF0ZV9zcHQoc3RydWN0IGludGVsX3ZncHVfcHBn
dHRfc3B0ICpzcHQpDQo+PiArc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdChzdHJ1Y3Qg
aW50ZWxfdmdwdV9wcGd0dF9zcHQgKnNwdCwgYm9vbCBmb3JjZSkNCj4+ICAgew0KPj4gLQlzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHNwdC0+dmdwdTsNCj4+ICAgCXN0cnVjdCBpbnRlbF9ndnRf
Z3R0X2VudHJ5IGU7DQo+PiAgIAl1bnNpZ25lZCBsb25nIGluZGV4Ow0KPj4gICAJaW50IHJldDsN
Cj4+IEBAIC0xMDA4LDcgKzEwMjYsNyBAQCBzdGF0aWMgaW50IHBwZ3R0X2ludmFsaWRhdGVfc3B0
KHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0KQ0KPj4gICAJdHJhY2Vfc3B0X2NoYW5n
ZShzcHQtPnZncHUtPmlkLCAiZGllIiwgc3B0LA0KPj4gICAJCQlzcHQtPmd1ZXN0X3BhZ2UuZ2Zu
LCBzcHQtPnNoYWRvd19wYWdlLnR5cGUpOw0KPj4gICANCj4+IC0JaWYgKHBwZ3R0X3B1dF9zcHQo
c3B0KSA+IDApDQo+PiArCWlmICghZm9yY2UgJiYgcHBndHRfcHV0X3NwdChzcHQpID4gMCkNCj4+
ICAgCQlyZXR1cm4gMDsNCj4+ICAgDQo+PiAgIAlmb3JfZWFjaF9wcmVzZW50X3NoYWRvd19lbnRy
eShzcHQsICZlLCBpbmRleCkgew0KPj4gQEAgLTEwMzIsNyArMTA1MCw3IEBAIHN0YXRpYyBpbnQg
cHBndHRfaW52YWxpZGF0ZV9zcHQoc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpzcHQpDQo+
PiAgIAkJY2FzZSBHVFRfVFlQRV9QUEdUVF9QREVfRU5UUlk6DQo+PiAgIAkJCWd2dF92ZGJnX21t
KCJpbnZhbGlkYXRlIFBNVUw0L1BEUC9QREUgZW50cnlcbiIpOw0KPj4gICAJCQlyZXQgPSBwcGd0
dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50cnkoDQo+PiAtCQkJCQlzcHQtPnZncHUsICZl
KTsNCj4+ICsJCQkJCXNwdC0+dmdwdSwgJmUsIGZvcmNlKTsNCj4+ICAgCQkJaWYgKHJldCkNCj4+
ICAgCQkJCWdvdG8gZmFpbDsNCj4+ICAgCQkJYnJlYWs7DQo+PiBAQCAtMTA0Niw3ICsxMDY0LDcg
QEAgc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0
dF9zcHQgKnNwdCkNCj4+ICAgCXBwZ3R0X2ZyZWVfc3B0KHNwdCk7DQo+PiAgIAlyZXR1cm4gMDsN
Cj4+ICAgZmFpbDoNCj4+IC0JZ3Z0X3ZncHVfZXJyKCJmYWlsOiBzaGFkb3cgcGFnZSAlcCBzaGFk
b3cgZW50cnkgMHglbGx4IHR5cGUgJWRcbiIsDQo+PiArCWd2dF9kYmdfbW0oImZhaWw6IHNoYWRv
dyBwYWdlICVwIHNoYWRvdyBlbnRyeSAweCVsbHggdHlwZSAlZFxuIiwNCj4+ICAgCQkJc3B0LCBl
LnZhbDY0LCBlLnR5cGUpOw0KPj4gICAJcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4gQEAgLTExOTYs
NyArMTIxNCw3IEBAIHN0YXRpYyBpbnQgc3BsaXRfMk1CX2d0dF9lbnRyeShzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSwNCj4+ICAgCQlyZXQgPSBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9kbWFfbWFwX2d1
ZXN0X3BhZ2UodmdwdSwNCj4+ICAgCQkJCXN0YXJ0X2dmbiArIHN1Yl9pbmRleCwgUEFHRV9TSVpF
LCAmZG1hX2FkZHIpOw0KPj4gICAJCWlmIChyZXQpIHsNCj4+IC0JCQlwcGd0dF9pbnZhbGlkYXRl
X3NwdChzcHQpOw0KPj4gKwkJCXBwZ3R0X2ludmFsaWRhdGVfc3B0KHNwdCwgZmFsc2UpOw0KPj4g
ICAJCQlyZXR1cm4gcmV0Ow0KPj4gICAJCX0NCj4+ICAgCQlzdWJfc2UudmFsNjQgPSBzZS0+dmFs
NjQ7DQo+PiBAQCAtMTM3MSwxMSArMTM4OSwxMSBAQCBzdGF0aWMgaW50IHBwZ3R0X2hhbmRsZV9n
dWVzdF9lbnRyeV9yZW1vdmFsKHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0LA0KPj4g
ICAJCXN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqcyA9DQo+PiAgIAkJCWludGVsX3ZncHVf
ZmluZF9zcHRfYnlfbWZuKHZncHUsIG9wcy0+Z2V0X3BmbihzZSkpOw0KPj4gICAJCWlmICghcykg
ew0KPj4gLQkJCWd2dF92Z3B1X2VycigiZmFpbCB0byBmaW5kIGd1ZXN0IHBhZ2VcbiIpOw0KPj4g
LQkJCXJldCA9IC1FTlhJTzsNCj4+ICsJCQlndnRfZGJnX21tKCJmYWlsIHRvIGZpbmQgZ3Vlc3Qg
cGFnZVxuIik7DQo+PiArCQkJcmV0ID0gMDsNCj4+ICAgCQkJZ290byBmYWlsOw0KPj4gICAJCX0N
Cj4+IC0JCXJldCA9IHBwZ3R0X2ludmFsaWRhdGVfc3B0KHMpOw0KPj4gKwkJcmV0ID0gcHBndHRf
aW52YWxpZGF0ZV9zcHQocywgZmFsc2UpOw0KPj4gICAJCWlmIChyZXQpDQo+PiAgIAkJCWdvdG8g
ZmFpbDsNCj4+ICAgCX0gZWxzZSB7DQo+PiBAQCAtMTM4Nyw3ICsxNDA1LDcgQEAgc3RhdGljIGlu
dCBwcGd0dF9oYW5kbGVfZ3Vlc3RfZW50cnlfcmVtb3ZhbChzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0
dF9zcHQgKnNwdCwNCj4+ICAgDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgZmFpbDoNCj4+IC0JZ3Z0
X3ZncHVfZXJyKCJmYWlsOiBzaGFkb3cgcGFnZSAlcCBndWVzdCBlbnRyeSAweCVsbHggdHlwZSAl
ZFxuIiwNCj4+ICsJZ3Z0X2RiZ19tbSgiZmFpbDogc2hhZG93IHBhZ2UgJXAgZ3Vlc3QgZW50cnkg
MHglbGx4IHR5cGUgJWRcbiIsDQo+PiAgIAkJCXNwdCwgc2UtPnZhbDY0LCBzZS0+dHlwZSk7DQo+
PiAgIAlyZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiBAQCAtMTQyMiw3ICsxNDQwLDcgQEAgc3RhdGlj
IGludCBwcGd0dF9oYW5kbGVfZ3Vlc3RfZW50cnlfYWRkKHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0
X3NwdCAqc3B0LA0KPj4gICAJfQ0KPj4gICAJcmV0dXJuIDA7DQo+PiAgIGZhaWw6DQo+PiAtCWd2
dF92Z3B1X2VycigiZmFpbDogc3B0ICVwIGd1ZXN0IGVudHJ5IDB4JWxseCB0eXBlICVkXG4iLA0K
Pj4gKwlndnRfZGJnX21tKCJmYWlsOiBzcHQgJXAgZ3Vlc3QgZW50cnkgMHglbGx4IHR5cGUgJWRc
biIsDQo+PiAgIAkJc3B0LCB3ZS0+dmFsNjQsIHdlLT50eXBlKTsNCj4+ICAgCXJldHVybiByZXQ7
DQo+PiAgIH0NCj4+IEBAIC0xNjUzLDcgKzE2NzEsNyBAQCBzdGF0aWMgaW50IHBwZ3R0X2hhbmRs
ZV9ndWVzdF93cml0ZV9wYWdlX3RhYmxlKA0KPj4gICANCj4+ICAgCXJldHVybiAwOw0KPj4gICBm
YWlsOg0KPj4gLQlndnRfdmdwdV9lcnIoImZhaWw6IHNoYWRvdyBwYWdlICVwIGd1ZXN0IGVudHJ5
IDB4JWxseCB0eXBlICVkLlxuIiwNCj4+ICsJZ3Z0X2RiZ19tbSgiZmFpbDogc2hhZG93IHBhZ2Ug
JXAgZ3Vlc3QgZW50cnkgMHglbGx4IHR5cGUgJWQuXG4iLA0KPj4gICAJCQlzcHQsIHdlLT52YWw2
NCwgd2UtPnR5cGUpOw0KPj4gICAJcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4gQEAgLTE3OTgsNyAr
MTgxNiw3IEBAIHN0YXRpYyB2b2lkIGludmFsaWRhdGVfcHBndHRfbW0oc3RydWN0IGludGVsX3Zn
cHVfbW0gKm1tKQ0KPj4gICAJCWlmICghb3BzLT50ZXN0X3ByZXNlbnQoJnNlKSkNCj4+ICAgCQkJ
Y29udGludWU7DQo+PiAgIA0KPj4gLQkJcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2Vu
dHJ5KHZncHUsICZzZSk7DQo+PiArCQlwcGd0dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50
cnkodmdwdSwgJnNlLCBmYWxzZSk7DQo+PiAgIAkJc2UudmFsNjQgPSAwOw0KPj4gICAJCXBwZ3R0
X3NldF9zaGFkb3dfcm9vdF9lbnRyeShtbSwgJnNlLCBpbmRleCk7DQo+PiAgIA0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuaA0KPj4gaW5kZXggYTNiMGY1OWVjOGJkLi44YjAyZmY1ZDk2NTEgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaA0KPj4gQEAgLTI2Myw2ICsyNjMsNyBAQCBzdHJ1Y3Qg
aW50ZWxfdmdwdV9wcGd0dF9zcHQgew0KPj4gICAJfSBndWVzdF9wYWdlOw0KPj4gICANCj4+ICAg
CURFQ0xBUkVfQklUTUFQKHBvc3Rfc2hhZG93X2JpdG1hcCwgR1RUX0VOVFJZX05VTV9JTl9PTkVf
UEFHRSk7DQo+PiArCXVuc2lnbmVkIGxvbmcgZmFpbF9jbnQ7DQo+PiAgIAlzdHJ1Y3QgbGlzdF9o
ZWFkIHBvc3Rfc2hhZG93X2xpc3Q7DQo+PiAgIH07DQo+PiAgIA0KPj4gLS0gDQo+PiAyLjE3LjEN
Cj4+DQoNCg==
