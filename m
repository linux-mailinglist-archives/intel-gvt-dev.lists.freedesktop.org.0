Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192348AC2E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 12:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C775112971;
	Tue, 11 Jan 2022 11:08:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B511710FAB3;
 Tue, 11 Jan 2022 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641899313; x=1673435313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g+sldeXmfVCmOgugwjkM6WKULi3j+9N/3TZfafP/w+4=;
 b=RfSz0/bJ/hYqo7fzxJtY0MZgU6t1juhYeSEi4Iwq9L6HO39Vufdf57EV
 TIlnN/QL3i+zaTeiOr/CGI5GHf1H7SjqAJnCrAOglDOGmeQoSO+kSIHCK
 fa9eCmvZ6d0duXs+EiXSHlWSVRrmSsbXQIYy8JEQwynKzHMq6fAUO20ci
 cSCMozkAxgoQzOskiUmn688EQrR4dHbgXv05+WWyTx22USDKQunJghRRC
 vCjL0oXYrJSbf/rzSlhE/TX2TbY12rphrDuTA9O3kSRo6uNLGnhG8Aj+m
 DiAE+pNrKwHabPu2bfaiyP2GzQ0lal831h+RYdDTojaPQkz74S26L7C+M g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="241013026"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="241013026"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="490344790"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 11 Jan 2022 03:08:32 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 03:08:32 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 03:08:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 03:08:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 03:08:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5s5PapPUBB3IKS4Z4Y751s5P/4PoKByNrWqMp2EqF/mttBXDkYSKYhePHkAisIfOVCy3P3DtRVvV3CpJsWVIUblZQXqdjQUiyrOw599fPOu/vhJKlP/Islkwz7EMt/2oxYbzHE7DUZa/hbvVOE6iN/FP/onxE85zfnp1IUWFaDUaVMJ3cR8Qh25lttSKs6FotXgWscDGwn4XdbOG0Vl9yhA3rTzlbwQcBCHUtppFquMql2c8kfJyHYZvjl4TLfjwZ9/WL57PqCsfXcf5RGE5rUHmWaI80FUrLnwAK263p3WRbeijTCdL4nQ8karam/qqDap754BijDPSYg3ko6+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+sldeXmfVCmOgugwjkM6WKULi3j+9N/3TZfafP/w+4=;
 b=VMmyZhBxCcKqK+YMjJ0yBXWZRoCZ0FFmQzOHO2FTqwa5p3EaPIPlFo0LJc8fole6s/g71rsQ9yC9hmJRYyWZ7ukWm9cKY/L+nQqtOBVM0KjXfgel7lGj2+H0RHkTYtTrnFghRKF9dbFSHZZBnZ3HX5t2SqpMv4HxnJrJRlPrSWRf11z2r/VXQzrRqam/Ad/NeUWO3XWnP7GnIiDuUIf3AxEvWN5nsyU/oVt07eAOxhUA4VVi/FQyLNvjXyAKAUB4JTIsMVrubnr4c4DDnGMLLGvGOcADkBGzpt9YRUSGzKW/HhLSqRnaW+8OQw2mmTs5D9HqLIG4AO3nrHX1CvRylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SN6PR11MB2590.namprd11.prod.outlook.com (2603:10b6:805:54::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Tue, 11 Jan 2022 11:08:29 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47%9]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 11:08:28 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYA9Tuucz5FdQejkegRXcQeTo5nqxdZ/oA///zkQCAAFPpAA==
Date: Tue, 11 Jan 2022 11:08:28 +0000
Message-ID: <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
In-Reply-To: <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d2e5601-4633-48ff-77d8-08d9d4f2b262
x-ms-traffictypediagnostic: SN6PR11MB2590:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR11MB2590C63F445E21C9FA550050CA519@SN6PR11MB2590.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4x49xAaXM4SXWhHPlLK+sFOpa4ryqI/1LdYWdwqf2OdG7jnBDq4IDg7dN1Zn6dW6vMdRkBPHcgbQ117143tvjtIDdwRiW1eqwAOgmxs5YeeJU8K+SEUnoLazixc6rYZ1nKBQEbVeVTmYKyA6X0YuLbFsjNnefBPCuXha0tTGIIRjzxeXg3sAdJvOwVmtNOp9zFQkTY++We7uKKBy9oXWB0yekfPva0OukSkv8QyMvyJNtw5t97ZO3HZmD5z9zpRWJGrJxTWPIPFchvRmRGkdllCS+QcYr1Eim3hhty0fn6FJmxzJ0/zT/6D4AmqnP3/bEteuF02d+jcQTJKHkWGtn8Rc4G5o5LCw66xEluVEvR8i68rFvmxGRufUyqa3SGVh5daD8sKEuhHrtv2HTlyN/AFm30x9E9mp3wP5hNPe98YLD8vhkKpFS8g2/3wLk4Yb2Whlgynbyy7i4HipMNq5I+sbg3Cs7hWVPYzjm1jDU/6GBd5v0hw9AevDPaGG6RNN8PAKM4BmbIkmBNSFE67vvqcBrqcWV+P0MiNcHBEgGDhkNBWvdp8ethnQNt6LJ0OjCnUmTtP8Ulb81loFMamzkh0uJSEdU2lNKfBWuSWWduTJpSTF4LXx+dNyr23WzxI2NaJ3ob00b3XN6akmOvMAFMP/lsOJFG4+Rr1P3GbYn4N3AyHZ0T6eORSwQz+1fUd6/UkJODas98skeoP1DGTShxESVEH3rhzwCsl6aag8hD+CIpjo5RX0oSC2rj1Cx5Q0Sd7qykgQ4laf+imra9ZALECR6C8ZOifWyZUr6lZVL4o6i79xyKqbpLqMfOAK/NZi+1YTEt1dVFxCAEgeOJmdRle39x9YkcmkTjLqHWNwgDQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(8936002)(6486002)(31696002)(71200400001)(54906003)(6636002)(86362001)(2906002)(8676002)(4001150100001)(966005)(38100700002)(122000001)(110136005)(2616005)(316002)(36756003)(66446008)(66556008)(76116006)(53546011)(6506007)(186003)(38070700005)(508600001)(66946007)(5660300002)(26005)(64756008)(66476007)(91956017)(82960400001)(31686004)(4326008)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjZiL0M2UXFqeUVBMXFTUGZUWXpTTUVQekdyQWVSYkIweEZhQVRSd0l5M0xy?=
 =?utf-8?B?ZDlUd01QRERDc1FOdU9tS0Y4OVZ6dU1KdXdZR0w0ekFJT010YnUyRW9sczJY?=
 =?utf-8?B?SVVnc2dYbi9HZXFuL0R2OTJNQWh2eVMxNzJCZUpuV1JNaHpFdFpJTEtVNzFG?=
 =?utf-8?B?Z0NtWlRseTRoeTZBdTNXVjMxd2hvUi9lOVZZK1dwV0FUK2dBNStBYko0TmJS?=
 =?utf-8?B?dTdpU1hqVVRGYkNBbU9QcXVUcHFnZHFRMXFtRm8xSDdpeXN3OUhBMzNac3cz?=
 =?utf-8?B?T1d2bVBkOE45UVB2WUZOZGF5Y1ZaSG9NdGNwVnhlYkUzVWd3eStsZ1krZWUv?=
 =?utf-8?B?clN5ZExBY3R3aC9nWDZVampTU1U4UWU3YWpxdnV5bmUwcEJFZkYraGJtVDJJ?=
 =?utf-8?B?WFlZODdzOFVaYzdzbWRnVTd0Wjd5cFJZb0RrSk9XNzkyZ3NkUW12d3VCb3hq?=
 =?utf-8?B?K0lUWUxha21EWHkzWTQyVWFFbXRxWXZhdUR4bnB5by9SVUJjdDBvbG1Pbm8r?=
 =?utf-8?B?YUVGZVlaOE1IL1VGTndFUFJvMjYwK2htR3ExeU1SMFlYN1hsZzhMQWFuR3R2?=
 =?utf-8?B?WVorNlYrLzN6U3RlUXduRjk3WHZWcE5heDFKVHdmNGRIM2JKTm9GNXBxdFFa?=
 =?utf-8?B?Rm5mYzQyclNXY01UTjh5ZXBhZjEwdGpvZVZOWjk4R3dlOHNTd1NVSDV5Skpo?=
 =?utf-8?B?T2g5bk5TeWtrMGpzRTY0OFZJcTFTZmUwMWV6ZmpkYkhTdmZUOGlUVXZCUjhZ?=
 =?utf-8?B?SG5GVkxFNU1xQm1RdjlqcVRqVXhCcmtNN3NEcGRCc0hJWG9rY0ZMMFRtcnY3?=
 =?utf-8?B?ajFFdE5YTFRlaC9lM2JEWVRranRBcENsNGNmWnowclZFcGFZajdpSHB2SFB3?=
 =?utf-8?B?cjU5NXNHS2k5UkJCZUM4eGQ2YU9MWjVmcjlsNGtIcjAwMm04MG5RZWJ6VmRH?=
 =?utf-8?B?Y2hlY3BlMUoxN1U0YVAzR1ZscHlvTE94aXlwOTRZTENxSkNERldhT1ZmQ0NS?=
 =?utf-8?B?OFNKMndxUTNXQjFWTUVsam9ldVFWdlFmSFZGNWFNUTJwVjkxbERpY28xK1Zr?=
 =?utf-8?B?Z0IwNFd3cEM2MlRwSmlUS0NNK29pNXFLanA1SUQ2YTFuZmRRVExZRGpyTG90?=
 =?utf-8?B?NTViZ0pBNWdOTWswd2lOVGllbzQwSzA0amRpdFR3Q0tEU3loMXBBWW42MHFK?=
 =?utf-8?B?Vzl6cTFPQTh5dHJZWmZaTTZtRUx5MXRyWUo3c2IwYm80NE9YMS9yTGxaRGFw?=
 =?utf-8?B?REdCamNRNXlic0owWk5mYXJxNkNlQktLVVkvMDhyc2JOaGpBU3FuQlhQN2g2?=
 =?utf-8?B?TFppbGtPQlkyMmhNbkVJOEFLRk5jK2RlZksyNUEvM2w0by9LNUhLd0pXS1lL?=
 =?utf-8?B?aENSVGhzQ3NJYUs1U2crS0wrRTBNTlZORElWaTQyaUhnekR5Q0o0TUI2b2xW?=
 =?utf-8?B?Nk9kNkYxT2M3a2djV29xcEtJSTVNTkQxWUV2WlhuRjhFZE1ycTNzSEQ3NTJk?=
 =?utf-8?B?aVJCZVVYazg2TDZ1Q3BjZCtHUWRPOWZ6WG1NSEltZ0Z2OGdST01CTzdqcTZG?=
 =?utf-8?B?SEpvNjVQQStEMW1Hajk0empkbVdEWENORU5zcUN3WTdvWENCMHREcEQ5YWVB?=
 =?utf-8?B?Ui9adTNlZVlXZ0puK1V2K3J4OTNlT3dacGNnRWI1QUpPdEx0K3ZGOVFGb1By?=
 =?utf-8?B?eHIveWRWS0lJNTVkMHpvN1NweXArUzdDQWM0YmtMVXFGSDlvWjhZaFI3akR6?=
 =?utf-8?B?cDM4S1lsb3lpQjhYS3k1QTU0TkhaR0J3aEVrSkRrVmNpQWpPdytOMFVkMjB6?=
 =?utf-8?B?cXZoUnRQWGQ3NWtMbGZvRG9WR2FGT2c2YmZsamNVcWtIbDhZWGZCb25QM2o3?=
 =?utf-8?B?VHNMN1U4U0orYU14VXNQdUJvKzVHQ0hhbEhlWHV3a0lOL2NJVU16QW5LTU4r?=
 =?utf-8?B?QjluRTNITzhtVSt0N05WQnlsSmE2MDFKbmRJdGVhZGJtSkxvVmplSmhHbHQ5?=
 =?utf-8?B?em5Sd29mMjlVV3VEaWYxL0dPcjhyb3pKT1JWcWNiUjlrdFRRSU9PbmFhQ0s3?=
 =?utf-8?B?OHZjdFdHWGRQWnllZFphL1dmR0p1dnlLdlV4ZkQ5UjBnZElNMmN4SVJEUk51?=
 =?utf-8?B?WldpMmxIRjF4TUMxalpRNVIwV1BjT2hXUFM3Vmw5Q0FNczBJRis0YjJ1aXpS?=
 =?utf-8?Q?m5ySzqqdWjzZu6zD+g4upUA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB6FBA848BC13F4681D8317F06415E4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2e5601-4633-48ff-77d8-08d9d4f2b262
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 11:08:28.8514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fw/rmEm4ZOlKp+h955ygfj/eMoa7wceUJms9KAFzXTWtDBZGhHTRm/+PyV5ULh7FILSLspwLteKj+ojawUoqlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2590
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMS8xMS8yMiA2OjA4IEFNLCBXYW5nLCBaaGkgQSB3cm90ZToNCj4gT24gMS8xMS8yMDIyIDEy
OjUyIEFNLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0KPj4gT24gRnJpLCAyMDIyLTAxLTA3IGF0IDE0
OjQzICswMDAwLCBXYW5nLCBaaGkgQSB3cm90ZToNCj4+PiBIaSBmb2xrczoNCj4+Pg0KPj4+IEhh
cHB5IGhvbGlkYXlzISBUaGlzIHB1bGwgbW9zdGx5IGNvbnRhaW5zIHRoZSBjb2RlIHJlLWZhY3Rv
cnMgcGF0Y2hlcw0KPj4+IGZyb20gR3VlbnRlciBSb2VjayBhbmQgUmlrYXJkLiBBbHNvIGEgbWlu
b3IgY2hhbmdlIGZyb20gWmhlbnl1Lg0KPj4+DQo+Pj4gWmhpDQo+Pj4NCj4+PiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+Pj4gM2JmYTdkNDBjZTczNmZmYmJmZTA3MTI3MDYx
ZjU0YjM1OWVlMmIxMjoNCj4+Pg0KPj4+IMKgwqDCoCBkcm0vaTkxNS9kZzI6IEFkZCBzdXBwb3J0
IGZvciBuZXcgREcyLUcxMSByZXZpZCAweDUgKDIwMjEtMDgtMDYNCj4+PiAwOTowMzoxMCAtMDcw
MCkNCj4+Pg0KPj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPj4+
DQo+Pj4gwqDCoMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXggdGFncy9ndnQt
bmV4dC0yMDIyLTAxLTA3DQo+Pj4NCj4+PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8N
Cj4+PiBkN2E4NTg1NDMwZjJiNmRmNTk2MGJiYzMwNWVkY2VjNWE1NTE4MGYzOg0KPj4gSSdtIG5v
dCBzdXJlIHdoYXQncyBnb2luZyBvbiBoZXJlLCBidXQ6DQo+Pg0KPj4gZGltOiBubyBwdWxsIHJl
cXVlc3QgZm91bmQNCj4+DQo+PiBkaWQgeW91IGRvIGFueXRoaW5nIGRpZmZlcmVudCBvbiB0aGlz
IHJvdW5kIGZvciBnZW5lcmF0aW5nIGFuZCBzZW5kaW5nDQo+PiBvdXQgdGhpcyBwdWxsIHJlcXVl
c3QgZW1haWw/DQo+IFN0cmFuZ2UuDQo+IA0KPiBJIGdlbmVyYXRlZCB0aGlzIHB1bGwgcmVxdWVz
dCBieSBnaXQgcHVsbC1yZXF1ZXN0IHNpbmNlIHRoZXJlIGlzIG5vIA0KPiBzdXBwb3J0IGZvciBn
ZW5lcmF0aW5nIHB1bGwtcmVxdWVzdCBmb3IgZ3Z0LW5leHQgcmlnaHQgaW4gZGltIG5vdy4gQ2Fu
IA0KPiB5b3Ugc2hhcmUgbWUgdGhlIGNvbW1hbmQgbGluZSBvZiBkaW0geW91IHdlcmUgdXNpbmcg
Zm9yIGFwcGx5IHRoaXMgcHVsbCANCj4gcmVxdWVzdD8gSSBjYW4gdHJ5IHRvIGFwcGx5IGl0IGJl
Zm9yZSBzZW5kaW5nIHRoZSBwdWxsIHJlcXVlc3QuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBaaGku
DQo+IA0KSGkgVml2aToNCg0KSSBkaWQgc29tZSBjaGVja3MgYW5kIGR1bXBlZCB0aGUgcGxhaW4g
c291cmNlIG9mIHRoZSBlbWFpbCBJIHNlbnQuIEkgDQpndWVzcyBJIGZpZ3VyZWQgb3V0IHRoZSBy
ZWFzb24uIEl0J3MgdGhlIHByb2JsZW0gb2YgdGh1bmRlcmJpcmQgaW4gDQpXaW5kb3dzLiBXaGVu
IGl0IHNlbmRzIHRoZSBwbGFpbiBlbWFpbCwgaXQgd2lsbCByZXBsYWNlIHNvbWUgc3BhY2Ugd2l0
aCANCiLDgiIsIHdoaWNoIGNhdXNlZCB0aGUgZGltIGNhbm5vdCBmaW5kIHRoZSBnaXQgcmVwbyB1
cmwuIEkgaGF2ZSBubyBpZGVhIA0KaG93IHRoYXQgY2FuIGhhcHBlbiBzaW5jZSBUaHVuZGVyYmly
ZCBpbiBMaW51eCB3b3JrZWQgdG90YWxseSBmaW5lIHdpdGggDQp0aGUgc2FtZSBzZXR0aW5ncy4N
Cg0KQmVmb3JlIHRoZSB2YWNhdGlvbiwgbXkgVlBOIGNlcnRpZmljYXRlIGluIExpbnV4IGhhcyBi
ZWVuIGV4cGlyZWQuIEkgaGFkIA0KdG8gdXNlIHRoZSB0aHVuZGVyYmlyZCBpbiBXaW5kb3dzLCB3
aGljaCBjYXVzZWQgdGhlIHByb2JsZW0gYWJvdmUuDQoNCldpbGwgcmUtc2VudC4gU29ycnkgZm9y
IHRoZSBidW1wcy4NCg0KWmhpLg0KDQo+Pj4gwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkg
dmdwdV90eXBlcyAoMjAyMS0xMi0xNiAwOToxMzowMiAtMDUwMCkNCj4+Pg0KPj4+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+PiBHdWVudGVyIFJvZWNrICgxKToNCj4+PiDCoMKgwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6
IFVzZSBsaXN0X2VudHJ5IHRvIGFjY2VzcyBsaXN0IG1lbWJlcnMNCj4+Pg0KPj4+IFJpa2FyZCBG
YWxrZWJvcm4gKDkpOg0KPj4+IMKgwqDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkg
aW50ZWxfZ3Z0X2d0dF9nbWFfb3BzDQo+Pj4gwqDCoMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBD
b25zdGlmeSBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMNCj4+PiDCoMKgwqDCoMKgwqDCoCBkcm0vaTkx
NS9ndnQ6IENvbnN0aWZ5IGludGVsX2d2dF9pcnFfb3BzDQo+Pj4gwqDCoMKgwqDCoMKgwqAgZHJt
L2k5MTUvZ3Z0OiBDb25zdGlmeSBpbnRlbF9ndnRfc2NoZWRfcG9saWN5X29wcw0KPj4+IMKgwqDC
oMKgwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgZ3Z0X21taW9fYmxvY2sNCj4+PiDCoMKg
wqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGNtZF9pbnRlcnJ1cHRfZXZlbnRzDQo+
Pj4gwqDCoMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBmb3JtYXRzDQo+Pj4gwqDC
oMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBndHRfdHlwZV90YWJsZV9lbnRyeQ0K
Pj4+IMKgwqDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgdmdwdV90eXBlcw0KPj4+
DQo+Pj4gWmhlbnl1IFdhbmcgKDEpOg0KPj4+IMKgwqDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDog
Rml4IGNtZCBwYXJzZXIgZXJyb3IgZm9yIFBhc3NtYXJrOQ0KPj4+DQo+Pj4gwqDCoCBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jwqDCoCB8wqAgMiArLQ0KPj4+IMKgwqAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jwqDCoMKgwqDCoMKgIHwgMTggKysrLS0tLS0t
DQo+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jwqDCoCB8IDI0
ICsrKysrKy0tLS0tLQ0KPj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jwqDC
oMKgwqDCoMKgwqDCoMKgIHwgNjgNCj4+PiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0NCj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNCArLQ0KPj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5owqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuY8KgwqDCoMKgIHwgMTMgKysrKy0tLQ0KPj4+IMKgwqAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jwqDCoMKgIHwgMTAgKystLS0NCj4+PiDCoMKgIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuaMKgwqDCoCB8wqAgMiArLQ0KPj4+IMKgwqAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkX3BvbGljeS5jIHzCoCAyICstDQo+Pj4gwqDC
oCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmjCoMKgwqAgfMKgIDIgKy0NCj4+
PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmPCoMKgwqDCoMKgwqDCoMKgIHzC
oCA0ICstDQo+Pj4gwqDCoCAxMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCA3OSBk
ZWxldGlvbnMoLSkNCj4+Pg0KPiANCg0K
