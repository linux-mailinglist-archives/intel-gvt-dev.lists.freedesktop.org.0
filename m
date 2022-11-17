Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218362D1C1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Nov 2022 04:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A746C10E52F;
	Thu, 17 Nov 2022 03:37:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DE210E532;
 Thu, 17 Nov 2022 03:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668656245; x=1700192245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qg4pMU0dfWZm4BOVblwUaM9szVZkmV6E5AUHpa0sn+0=;
 b=hPNKuPcSDbJgexXSBveZhAW+w6rjMtCpuw1qfUVkr0ST32lK2Geuuw8i
 3JV+0MOBKTbr0vowX3kc0Cnrgzab5eH/WA+0fHWrT7Luhdf7WdUafvWcq
 jR3On1OoeUra8pIXHs3PTf9rHSYTkvIeA1vqOX0Q2TcM77UUhSFRzDr9Z
 2F+1gmFQVh/I4TqgJzpySWj9jTtWvRwuU2XisHfCsqYd//H6eYm5VNmHv
 hey2BVxI9mAP5Dt9vBkpC9uwUXtrf1J21BqHIl2g4NihkZ1Cu/6etsnWG
 y+h8KLAGUffEOvtIzxNRDvKY0sDr5SBITMKDdgGKbN4QRSeR0JRZjEDcX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="312760664"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="312760664"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 19:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="641927634"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="641927634"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 16 Nov 2022 19:37:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 19:37:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 19:37:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 19:37:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 19:37:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkIGuSc0i8GQDMwsk5qFjD2YznmSb24syL3HyaDGUfn8MDnHDssAeQZ2kWo55IfrVqNvxFxrelYcYT6xHP26UhWDfmackt0j8CGpCxCkCZgM4Pz/cmVI3Tt8VYayT8M5JtgmcHIy+4gpWwIjz85/dE87z24E2plZDfyYGRN+fSHUfn5D4Kdb5TXTMUJ/vcbP6WY00yO2p/iOza1B1Pm7jvpzMCPxe9P+Sig67sfbb1B9MxUYCaz677Tc9gCF+8OYh0MXoWZIu3DhXsHs7VE6RsnsVp8CgKycAnjESDla4tcDqvyiNunWOP+wkQGiZvKLOUoIaP/dsP+95KO+06xZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg4pMU0dfWZm4BOVblwUaM9szVZkmV6E5AUHpa0sn+0=;
 b=jeGRgk+1qVq3mhuv4GCbmwRW50F8NGPI1pPNnXDPcVJGLbQbQDrj+erb8jJQfQXLCxzm0op5sfAplNixs4e8rWEJhiq93nZaf9Nww/BaPvHsaJH/Pp++hd/KMqC6kGnIvzhI5bqXavlo5sbKuGifvkUlLza5I/cyV99wYmjNm3Am7v3KUZDpx8m9hgCgrLdZfrtdxXNFlY3zkA5KeDe5T/gS86+nPDrwcovpsF2g+TtK3ydk+iGjlm0R+j0CadTiNBpKNxGsDTvChTsO7LoDO11NgM/i9fS/Jk1kp9syTW3SmPgY6GiFZm8QbCfCP/e3SbaqI2/mBtpbnt8rz/bjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Thu, 17 Nov
 2022 03:37:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 03:37:17 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHY9avv0nb2HwXp2063AzeqmD+s7K5AJNuAgAJRy4CAAAnHgA==
Date: Thu, 17 Nov 2022 03:37:17 +0000
Message-ID: <6d9f565acb5bd57ee2df79fc5a9cf802724a3333.camel@intel.com>
References: <20221111085903.GP30028@zhen-hp.sh.intel.com>
 <Y3OyGyJLhL7k8EV+@intel.com> <20221117030215.GR30028@zhen-hp.sh.intel.com>
In-Reply-To: <20221117030215.GR30028@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|PH7PR11MB7076:EE_
x-ms-office365-filtering-correlation-id: 704b8b30-e6ba-4114-d39f-08dac84d065b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VVIhutGrUCHTDXKRdufk6ZR3j+OsbiwBQxsiwjnXGoaf0qr6IqWNuxkcTGXTB7s2M67lBCqlWgN9veYOGxNAh4C2G2tb24gQkpj5AeuYSgoIgmFAX7KuMKvhRrJFPr0HZOqkVXf5UX2KQIxgrDLtkt7ZPtv7tLPb4OqN2mNhk4eIc6i/LiOXUlpsAqftgVbXLro9MQdPXacwTk1CBzQweN9UlyJ5YWDBLVkGcv9qd22tRbZZRlQVAu/TiBbf01ylLQUsuFDrFhi46eFf5U+rpeqUG2DDB3U/zFc03MfEMMw1XygMlH2VjyRMxQL64iEOiPpW040+DIBA5g2HmThzmewGAcbS3b4gFZcchtOGGeOPzqUeq8poewQWfeVC9uawVFgg2SeObgRycwhWtwclhA2wZ8DibwRi7pk/LZ1z0NYdt5GhyeBsIg9DfUG9BoVOgqdcedO7NRy04s59votS9oohRv3nJgpOb4l0VqB+JZi4f/vlc1xFsU8SmqZtoA0RbJh0Ysp7yvM/SzWPL6XpX0dDBpYQdPrgMWwJ0wVuUXyzB+yNnWxbFifJFKhalJqwjztZVOobhLKA4104drFvDduQVtfakOl9BtWkML2KyCKOvT4vMyu+K7pNteLFtmmuCk/XxjyvPVSlaBuhosJ62wX4SynNFxHFkFwUqQmVMfkHeV1Ila4IeB4WgPMSyJS20Xbe3QZ/kp7EDDfyfkkBGeOJZ7BrWu1XCCm1pbM92lhtJWS52fGXm52qYRWTil99PJlaNAcTM6APjovqZnNCDmauNp/d3MTXHf0+0QOqxc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199015)(478600001)(966005)(86362001)(6486002)(38100700002)(82960400001)(71200400001)(26005)(6506007)(5660300002)(41300700001)(2616005)(38070700005)(53546011)(36756003)(316002)(54906003)(6916009)(8936002)(6512007)(91956017)(4326008)(83380400001)(66946007)(76116006)(122000001)(66446008)(8676002)(66476007)(186003)(4001150100001)(66556008)(64756008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWpSblArNEpDSnRqOTBZL3dubkVlRVF5amQzdUZnT1ZybkNmNjNoSHZudHpE?=
 =?utf-8?B?c2lkUzVmSlFJMzFXbzF0ajJZTm9ReCthQmRDY1NQc3pZaWNNMzZhb2U2Qy9q?=
 =?utf-8?B?YXZWMVkzVEV2UTcvazZjZ1plNlk5ZVFBdkw2blhMNjI1Kzg3aS9JUDJrQURK?=
 =?utf-8?B?cm1RdkRHRjY1WVVQcjNFQlgvVTZDUldKQ1dPYWlDQ0RhRHQvTi83a2tUdCt5?=
 =?utf-8?B?M0l4NkkydkZkZTMvQ2tLcjRkdHdWZ0E1Y2tMVEE3Mk1ETlBpakg5NDM4K01H?=
 =?utf-8?B?WTlNSkg2eFFud0xYQVp6OHN6SndWSVdzamNUNStuT3ppWGY2YmZ3S3JQNVpq?=
 =?utf-8?B?MjFPai9zZGxtTW12M1VBY2MrdDVkSyt5aU5xeCtLZUdjWlZlREhkeG5jamQv?=
 =?utf-8?B?akVWaDNtUVRudVZvNmU2UzluWW10aVR0Nlp5b3Y4NW51QnVEU3B5eUsrUitL?=
 =?utf-8?B?R3E5UHlSdnVFZ2s1M3g0alA2VWdia242cElFUmJTbWtTTE1HOEVITnVidmFQ?=
 =?utf-8?B?M21lSW1QOWJEdmI1ZFB4alo5VGNHMWtIUUJpK1VUTlZlanhnUldUTHN5d1Z3?=
 =?utf-8?B?eURwaDE5MzBBRVZOMzZCeW5acFkyNGtPVWxWcHptbFBrTGYwWU5oa2t4a2hy?=
 =?utf-8?B?OGhmTDVIZDU4Z0ZKcGxnVzdrTGJhU2FuZG1Lc0dVK0hBRjdqMDVYTEJaMTZa?=
 =?utf-8?B?NTlVbFAvQitzaDduMGRBUmU0RUVnN2s1MXFYVFBjV3VHUkF1d2xhVnVBWkxG?=
 =?utf-8?B?azZnMUFvdHh0ZGlnM2JtZUZMK2J6STZZb29TQ0haYmNjTG5obVBwakFPaGZw?=
 =?utf-8?B?TW0zWVpvZHpEMFJxZzZaSG9qRDRiZ2t4a3dBMjV3b2g0RWFKdVUzZnhlMVNz?=
 =?utf-8?B?a0FxSWQ0aFA4RzBSY0JGZ01NbzBkaWk3dWtCQ3lnc0NERjJ4M2ZVQld5RWln?=
 =?utf-8?B?Y3VYdmY2YlZtR3lnSC9pQXNLZzhVbDNGNGhpbDRKMUQySEJJQjZIak40VVMz?=
 =?utf-8?B?cXlOYVJoL0lDTDdDaEVFV1hyNXRDYVNxRmdwRVhMQlBpWTM3Yld5QzZaRkY1?=
 =?utf-8?B?ZHVYMjhhK1lBbXg1VENvNGNiVDFNVGZiaGVFZUNsUUc1MVA1Rms0OGd1K1Qw?=
 =?utf-8?B?Y1JtY2FPVDBVOGMySmtETnFSenIydXpTbUVaL3dXTklBcTIvdmxvaHBOdnl4?=
 =?utf-8?B?c2M1aEl6TXdXSUwrT2xQUUR6em1XSStLSXRpQWk1cDBISWdVSkJvQjQzSHkw?=
 =?utf-8?B?OGxmRkUyL2pJZWl5QzAwRVI5bTNFMEpaSzJKeW40aHYwTFBlSkU2b3Q3SlZI?=
 =?utf-8?B?aHhxNExUOEhlM0VDbVlvY2hmUXhaTHp1Yy9hb09HRU5FOFNiWDVqcjUwRzdI?=
 =?utf-8?B?N1VBSHdsZWZrWmVtRnROcXRGc2MyaGpuL1NqWld4UDBlakJzUzJlaktiZWtE?=
 =?utf-8?B?NklZamVyWmxHMFM2ajd5MDhROHJZaU5VMGliWG44d0dmdExCcFNBK2ZkNXgy?=
 =?utf-8?B?eXFHazRGcFIxWXhzcVN6VlZDMkVtdXFzN0pmV2FMaVJVZFR1c1QxVjlxN3FX?=
 =?utf-8?B?QlRyd3JmK3RMaTlFOHBCMUU1cW9KdllhQVZic1Uwc3dvd3FZaVpKb2VpNVN1?=
 =?utf-8?B?dkhITGJCa1J3ZHpoY1hyZ3NaMUxBRjE3Umkzc0JlNG4wd2NoMWlqNDRWREZ0?=
 =?utf-8?B?b3pVanp0V1l1eEw5SExnQ2pRbTFsZ0I0U2t5S2oxZ0VuaWtYMUNZK2lVL0Fr?=
 =?utf-8?B?Yzl4MzJJeWJhcnNiZzN2TUF6VGcyWEZoN2Z4UFRWTm5TRnNjS2NlQ01oYkFF?=
 =?utf-8?B?QnFra0tXTnl0bDlpZW9XRWdPaG5maXcyY0RIWDNSbFJPUjZnbHNUS0ROWXVR?=
 =?utf-8?B?eUhRYUFKeWFDQ1JPQ1VmcVdZSVdhY3ZKUEZ1aEZmcWtBUXFNMm1ESjN5WlY4?=
 =?utf-8?B?ZWN2eURTazFUOXQ3ZmkzOTNXWWJzY1B2bGhlTk5zWWM4Sk1KblNqNlBlZkF2?=
 =?utf-8?B?VHJ0QWtUdHNFb0l2U0kyWS9hVVlOaTJndUFOLzRBNGdjRjNKdWc1eHFEQW15?=
 =?utf-8?B?dEtwTGIzNjdrTHBkSmJiVjRkMmxqTnp4YmZ1Q2JzSDNvdmZQN2o2Y0Y3SXRl?=
 =?utf-8?B?MWZhWktDME1mM2QzL0psOUE1Tm5YemJVVFZua05IbW5EKzRTRFRXdzBiUllu?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <511AFD7DF40D0E459C313DACAE8ED594@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704b8b30-e6ba-4114-d39f-08dac84d065b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 03:37:17.0752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySg9ZFXe0C8MoH7nXjDuXvnM/J4ZfwyngsLyEZCwWZ4v81vUR0edPTl3LZs2SY2z5rmMRkS7K6jB7OlQvdHMKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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

T24gVGh1LCAyMDIyLTExLTE3IGF0IDExOjAyICswODAwLCBaaGVueXUgV2FuZyB3cm90ZToNCj4g
T24gMjAyMi4xMS4xNSAxMDozNjo1OSAtMDUwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+IE9u
IEZyaSwgTm92IDExLCAyMDIyIGF0IDA0OjU5OjAzUE0gKzA4MDAsIFpoZW55dSBXYW5nIHdyb3Rl
Og0KPiA+ID4gSGksDQo+ID4gPiANCj4gPiA+IEhlcmUncyBjdXJyZW50IGFjY3VtdWxhdGVkIGNo
YW5nZXMgaW4gZ3Z0LW5leHQuIFNvcnJ5IHRoYXQgSQ0KPiA+ID4gZGVsYXllZA0KPiA+ID4gdG8g
cmVmcmVzaCB0aGVtIG9uIHRpbWUgZm9yIHVwc3RyZWFtLi4uSXQgY29udGFpbnMgbW9zdGx5IGtl
cm5lbA0KPiA+ID4gZG9jLA0KPiA+ID4gdHlwbyBmaXhlcyBhbmQgc21hbGwgY29kZSBjbGVhbnVw
cywgYXMgZGV0YWlscyBiZWxvdy4NCj4gPiA+IA0KPiA+ID4gYnR3LCBvbmUgZ3Z0IGNoYW5nZSBm
b3IgbmV4dA0KPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzUx
MTExOC8NCj4gPiA+IGlzIHN0aWxsIHBlbmRpbmcsIEkgbmVlZCBhIGJhY2ttZXJnZSBmcm9tIGxp
bnVzIHRyZWUgZS5nIHdpdGgNCj4gPiA+IHJlY2VudCB2ZmlvL21kZXYNCj4gPiA+IGNvbnNvbGlk
YXRlIGNoYW5nZSB3aXRoIGd2dCBhbmQgSmFzb24ncyBmaXggZm9yIGRlc3Ryb3kgZGV2aWNlLA0K
PiA+ID4gdG8gYXBwbHkgWmhpJ3MNCj4gPiA+IGNoYW5nZSBjbGVhbmx5LiBQbHMgaGVscCBvbiB0
aGF0Lg0KPiA+ID4gDQo+ID4gPiBUaGFua3MhDQo+ID4gPiAtLS0NCj4gPiA+IFRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCj4gPiA+IGE2ZWJkNTM4MzY0YjFlOWU2MDQ4ZmFhYWZi
YzAxODgxNzJlZDUwYzM6DQo+ID4gPiANCj4gPiA+IMKgIGRybS9pOTE1L3Nkdm86IEZpeCBkZWJ1
ZyBwcmludCAoMjAyMi0xMC0yOCAxNDo0NjoyMSArMDMwMCkNCj4gPiA+IA0KPiA+ID4gYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+ID4gPiANCj4gPiA+IMKgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXguZ2l0wqB0YWdzL2d2dC1uZXh0LTIwMjItMTEt
MTENCj4gPiA+IA0KPiA+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+ID4gPiA1
MDQ2OGNhMmUyZTFjZTg4MmYwNjBhOGMyNjNmNjc4YWZmZTExMmRiOg0KPiA+ID4gDQo+ID4gPiDC
oCBkcm0vaTkxNS9ndnQ6IFJlbW92ZSB0aGUgdW51c2VkIGZ1bmN0aW9uIGdldF9wdF90eXBlKCkg
KDIwMjItDQo+ID4gPiAxMS0wOCAxNTozNDowNiArMDgwMCkNCj4gPiA+IA0KPiA+ID4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ID4gZ3Z0LW5leHQtMjAyMi0xMS0xMQ0KPiA+ID4gDQo+ID4gPiAtIGtlcm5lbCBkb2Mg
Zml4ZXMNCj4gPiA+IC0gcmVtb3ZlIHZncHUtPnJlbGVhc2VkIHNhbml0eSBjaGVjaw0KPiA+ID4g
LSBzbWFsbCBjbGVhbiB1cA0KPiA+ID4gDQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiBDb2xpbiBJYW4g
S2luZyAoMSk6DQo+ID4gPiDCoMKgwqDCoMKgIGRybS9pOTE1L3JlZzogRml4IHNwZWxsaW5nIG1p
c3Rha2UgIlVuc3VwcG9ydCIgLT4NCj4gPiA+ICJVbnN1cHBvcnRlZCINCj4gPiANCj4gPiBkaW06
IGQ3ZTRlOTU3OWYwMSAoImRybS9pOTE1L3JlZzogRml4IHNwZWxsaW5nIG1pc3Rha2UgIlVuc3Vw
cG9ydCINCj4gPiAtPiAiVW5zdXBwb3J0ZWQiIik6IGNvbW1pdHRlciBTaWduZWQtb2ZmLWJ5IG1p
c3NpbmcuDQo+ID4gDQo+ID4gY291bGQgeW91IHBsZWFzZSBmaXggdGhpcyBiZWZvcmUgd2UgY2Fu
IG1lcmdlIHRoaXMgcHI/DQo+ID4gDQo+IA0KPiBUaGF0IHNob3VsZCBzdGlsbCBiZSAubWFpbG1h
cCBpc3N1ZSBmb3IgQ29saW4ncyBlbWFpbC4uLg0KPiBCdXQgY291bGQgd2UgaW1wcm92ZSBvdXIg
ZGltIHNjcmlwdCB0byBncmVwIG1haWxtYXAgaW4gdGhhdCBjYXNlPyBTbw0KPiBpZiBzLW8tYiBt
YWlsIGlzIHZhbGlkDQo+IGluIG1haWxtYXAsIHdlIHNob3VsZCBzdGlsbCBhbGxvdyBpdCwgcmln
aHQ/DQoNCkJhc2VkIG9uIHdoYXQgSSBjb3VsZCB2ZXJpZnkgdGhlIGNvbW1pdGVyIHNpZ25hdHVy
ZSBpcyByZWFsbHkgbm90DQp0aGVyZS4gSXQgbG9va3MgbGlrZSB5b3UgbGF0ZXIgZm9yY2VkIGEg
cmViYXNlIGFuZCB3aGlsZQ0KcmViYXNpbmcgeW91IGZvcmdvdCB0byByZS1zaWduIGV2ZXJ5dGhp
bmcuDQoNCldlIG5lZWQgdG8gZml4IHRoaXMgaW4geW91ciB0cmVlIHRvIGF2b2lkIHByb3BhZ2F0
aW5nIHRoYXQgdG8gb3RoZXINCnRyZWVzIGxhdGVyOg0KDQpGcm9tIHRpZyB2aWV3Og0KQ29tbWl0
OiAgICAgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPg0KQ29tbWl0RGF0ZTog
VHVlIE5vdiA4IDE1OjA0OjUzIDIwMjIgKzA4MDANCg0KICAgIGRybS9pOTE1L3JlZzogRml4IHNw
ZWxsaW5nIG1pc3Rha2UgIlVuc3VwcG9ydCIgLT4gIlVuc3VwcG9ydGVkIg0KDQogICAgVGhlcmUg
aXMgYSBzcGVsbGluZyBtaXN0YWtlIGluIGEgZ3Z0X3ZncHVfZXJyIGVycm9yIG1lc3NhZ2UuIEZp
eA0KaXQuDQoNCiAgICBGaXhlczogNjk1ZmJjMDhkODBmICgiZHJtL2k5MTUvZ3Z0OiByZXBsYWNl
IHRoZSBndnRfZXJyIHdpdGgNCmd2dF92Z3B1X2VyciIpDQogICAgU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0BnbWFpbC5jb20+DQogICAgU2lnbmVkLW9mZi1ieTog
WmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPg0KICAgIExpbms6DQpodHRwOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIyMDMxNTIwMjQ0OS4yOTUyODQ1LTEt
Y29saW4uaS5raW5nQGdtYWlsLmNvbQ0KICAgIFJldmlld2VkLWJ5OiBaaGkgV2FuZyA8emhpLmEu
d2FuZ0BpbnRlbC5jb20+DQoNCm5vIHNpZ25hdHVyZSBmcm9tIHlvdS4NCg0KPiANCj4gPiA+IA0K
PiA+ID4gSmlhcGVuZyBDaG9uZyAoNCk6DQo+ID4gPiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDog
Rml4IGtlcm5lbC1kb2MNCj4gPiA+IMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBGaXgga2VybmVs
LWRvYw0KPiA+ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IEZpeCBrZXJuZWwtZG9jDQo+ID4g
PiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogUmVtb3ZlIHRoZSB1bnVzZWQgZnVuY3Rpb24gZ2V0
X3B0X3R5cGUoKQ0KPiA+ID4gDQo+ID4gPiBKdWxpYSBMYXdhbGwgKDEpOg0KPiA+ID4gwqDCoMKg
wqDCoCBkcm0vaTkxNS9ndnQ6IGZpeCB0eXBvIGluIGNvbW1lbnQNCj4gPiA+IA0KPiA+ID4gTWF1
cm8gQ2FydmFsaG8gQ2hlaGFiICgxKToNCj4gPiA+IMKgwqDCoMKgwqAgZHJtL2k5MTU6IGd2dDog
Zml4IGtlcm5lbC1kb2MgdHJpdmlhbCB3YXJuaW5ncw0KPiA+ID4gDQo+ID4gPiBQYXVsbyBNaWd1
ZWwgQWxtZWlkYSAoMSk6DQo+ID4gPiDCoMKgwqDCoMKgIGk5MTUvZ3Z0OiByZW1vdmUgaGFyZGNv
ZGVkIHZhbHVlIG9uIGNyYzMyX3N0YXJ0IGNhbGN1bGF0aW9uDQo+ID4gPiANCj4gPiA+IFpoaSBX
YW5nICgxKToNCj4gPiA+IMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiByZW1vdmUgdGhlIHZncHUt
PnJlbGVhc2VkIGFuZCBpdHMgc2FuaXR5DQo+ID4gPiBjaGVjaw0KPiA+ID4gDQo+ID4gPiB3YW5n
amlhbmxpICgxKToNCj4gPiA+IMKgwqDCoMKgwqAgZHJtL2k5MTU6IGZpeCByZXBlYXRlZCB3b3Jk
cyBpbiBjb21tZW50cw0KPiA+ID4gDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9h
cGVydHVyZV9nbS5jwqAgfCA0ICsrLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2NmZ19zcGFjZS5jwqDCoMKgIHwgMiArLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZG1hYnVmLmjCoMKgwqDCoMKgwqAgfCAyICstDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9maXJtd2FyZS5jwqDCoMKgwqAgfCAyICstDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndHQuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDkgKystLS0tLS0tDQo+ID4gPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0N
Cj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmPCoMKgwqDCoCB8IDQg
KystLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuY8KgwqDCoMKgwqDC
oMKgIHwgNCAtLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRl
eHQuYyB8IDIgKy0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3BhZ2VfdHJhY2su
Y8KgwqAgfCAyICstDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmPCoMKg
wqDCoMKgwqDCoMKgIHwgNiArKystLS0NCj4gPiA+IMKgMTEgZmlsZXMgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gDQoNCg==
