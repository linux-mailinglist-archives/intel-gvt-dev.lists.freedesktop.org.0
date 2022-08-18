Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB935987AF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Aug 2022 17:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE98BB522;
	Thu, 18 Aug 2022 15:44:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF42BB596;
 Thu, 18 Aug 2022 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660837429; x=1692373429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=248f08bQ5UiANF9CcxPkjnu27eXSP7tJCHecL+gO2lM=;
 b=gNB9VwjUkTETn4TiIbmj7EiMFJ+nyAOEEsAZt1y2r1QteCU3HWH+6Inv
 X6+PQf61vl4JYgAYc38v+gZ85rB28l8oNvYotTTAc4Jmgz8dGWjGuXWnr
 EkdwXvTFeFedLyXp0aaZJCNmEljJdoC+oqjkpkCiwEUbqjQRqpXQBMdLs
 t1+5UmH74vvqy/QoIEI9jwgOViFzDBlrB+zUcHKe51s/MAbiH+rpOjp49
 ca4HgVejXalrzlhrd05J0sFFI+LimtStr2cEaX7CZ93fcREWSZGWhtvff
 42G46FwWMGBlL0BWIFXFAL7jUsBFGG5SHUiZIZ3ZMsWzC7nBwOc2VreND A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="356781718"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
 d="scan'208,217";a="356781718"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 08:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
 d="scan'208,217";a="668160472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2022 08:43:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 08:43:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 08:43:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 08:43:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 08:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLyzp1ibh0zWeQLmBd2TfF2jYueKkaYCUg5AIyMDKRvUbgK+XWIKLah6iZnRIJn6vXHMeAWXsAO2lLxqqpCXt6p+8sUc5dsAec349BXVaNQJiOu7jFHaqT4/ZOUOWAp3u0OMlIap3fxAKe5en27MrdW1Vsdnh9ekkCR6/ps6fdYT+lufDuxYQMndjspE0nbPNpoZf1/2jhB8erRw6rM7xtL0ZL1ZpD/IxGjl4uO1GIWTu0g6HWFp2ayghrRu/jANjwdkA0uqRZ9Xy/WPiQ3SnuPqOwPTKtmOaetmNEY9tdrng4r4s0Y+U8OJbLSuCYPae1FMGzH32J2cD1+gOmW20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=248f08bQ5UiANF9CcxPkjnu27eXSP7tJCHecL+gO2lM=;
 b=meGRE+LdGCn2UgD3002hVpWaIBXqdmjSa/0i8vV9qP396OjAPMiPh1LK9JYp0QAftgbCcXA6n+zYZsDZbqhPJDmiC7accG899b4gY5zUmKkU7WR9bRYtONXqDbre8b8A5a/TaYOPSeJC6UxW2em6RaiaLNreKDDtU2pON/WB2FL8hMnGbS34zmVw+98pjhQxedMK5mbJjNTHhl/IF8grY9GC5XIajDND4YBGDAGBnvOt0u7DITpuAYJweeE4j2Crqxnt3dZv/P/7VnGiFM+sgDJi9t8RSuCAwff7PXI/aKtwpsZdzGJj+fjsqA1PIFryqvnETo1qZQyI+m0TNvN1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR1101MB2254.namprd11.prod.outlook.com (2603:10b6:301:58::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:43:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Thu, 18 Aug 2022
 15:43:33 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "colin.i.king@gmail.com"
 <colin.i.king@gmail.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>, "King, Colin" <colin.king@intel.com>
Subject: Re: [PULL] gvt-fixes
Thread-Topic: [PULL] gvt-fixes
Thread-Index: AQHYsFOkCKMg7zltNUWqWYQzDrFnJq2wnf2AgABMGgCAAAqYgIAClKYAgAAYaoCAANSAgIAARmoAgAAVOIA=
Date: Thu, 18 Aug 2022 15:43:32 +0000
Message-ID: <bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5.camel@intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com> <20220816040508.GG1089@zhen-hp.sh.intel.com>
 <20220816044303.GH1089@zhen-hp.sh.intel.com>
 <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
 <9f6e3433-5748-b7e4-bbc6-b0e47cb9d1c5@gmail.com> <875yipq2m2.fsf@intel.com>
 <87wnb5ocdl.fsf@intel.com>
In-Reply-To: <87wnb5ocdl.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8718c02-b074-4214-2185-08da81306825
x-ms-traffictypediagnostic: MWHPR1101MB2254:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e2ooC0yS7aZfdyjGrJdP0hGolxDBcun4TJV93ZRGONkfeBIXXbINr8esvCjQisUNapgaYSf38b08clovpM6ZDiX9Kc5GoerBNUAsdjYK40hAUp06EOXIwLOTZNLsDdlpexQXltALvH1jdQ76fYZlScAMtwo9Lq5fnX5OQSZt/JCf6JkVLs7FjBUJ+Jxkh/f1HeTfixVDnu3Hi8DdaamqI54mg4pdNsUEJSyNM53qEJTtjKVUcGYWdHpTXiSpNFbdEZAFK57Z6r3aJedWOwDNF1L55XcfFS5USKdLTRHR/70gcb4dOu60x8cBfrwolVUWx0byiYGErWYd/Lwd/3gJR1gZ9ijm7PUxn+HJB05P+lUPMkiyeWQ97cFpSzeXU96//zZaKkQM8vEeZyd5q+F479ZB4BbTyuQaELWH3dXiDrk9PfMpCHMEpwoMEvnjSLzM0e3YwiQ0Eyk+UEBCA0Y+8Cs8RvRp6wu6GYDQEHEK14kBjbOIZvmseOajLRezmG2qrKmZsNi6cR36Le2CSjoXWzdl8aCt2pyiNFQo2xOLMse1RRte39gYzFN61a4qqNf3PsumIJHBp8bjxdRN6zvezfKBwzLHVNiBs2MKe99ftMjCXZHXHu3kaFGa0SSVpJ/vP8nhSDcmc6/KHvsBO1ua6HY5YxetOOc19da1dXNy3b3FFwQ4dvgIKH9/7RFZJnID4qtk11ZxzNLCC5dG8stx6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(376002)(136003)(346002)(396003)(6636002)(41300700001)(40265005)(316002)(66946007)(110136005)(54906003)(53546011)(66446008)(6512007)(82960400001)(66476007)(66556008)(64756008)(8676002)(26005)(4326008)(91956017)(76116006)(36756003)(6506007)(2616005)(478600001)(2906002)(6486002)(966005)(186003)(38070700005)(166002)(5660300002)(86362001)(83380400001)(38100700002)(71200400001)(8936002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmQ1K3J5TWFPNmxkTEpYY1NnR01zd0tXUzl0NnpxMkgxbUpvRVJXbDMrbnhK?=
 =?utf-8?B?ZjMvS010amt3bVMxaWFscmRUOHVnc2l2WG83NWQybGFRenNaK0V6OGoxVGtQ?=
 =?utf-8?B?cmJxZGRKdjE0d3UyUS9xUHErRmhRbXBKd3BrQWFaSXdJQ1RUOHVmeG9PS2VZ?=
 =?utf-8?B?bXFpVk9lMmI4d2FtRjJ4UGhVUk0rMzduUXQ2ZUFJN2dCTHVHRjdhS0lLc2J6?=
 =?utf-8?B?Y0dKejRtZzJMa1JybVlvS3ZUTHpZd2VtaTc5cDZoYUZIQWJLTlhvUDQzWllZ?=
 =?utf-8?B?SFo4eEZtbEd2MXAxdW5KUmMvempQQ1hKTGIwb010OWRQRGxRZVQvMWZYUlJj?=
 =?utf-8?B?T2dSRVg5U3NJSWdsMEdrOW5TQkp4d2J6ZmxCWW9EczI2L2JCQklTd2I3L1VD?=
 =?utf-8?B?ZVhNTGlCZnZCUzNhaGNmOHpQcWFWakpOQ0N1a3VrTVdWTmlhcDVTUmh4WGk2?=
 =?utf-8?B?S3VqR01ua3RDRHBjVUd4d09kQTBxd0oxQXlFcHh6TUFXUmp3MGxsR0x0OTZW?=
 =?utf-8?B?YWhKU0tHS1NMczlWd2haaG5xdDgrNjJybjM3UXNNZ29ibGpaSjY1eU1hS1BR?=
 =?utf-8?B?M1N3WjdrQ0FCM2prVVUrbHNlOFNkd1oxTnlvRmZsanFXNXlkaEdPTFlJQUFE?=
 =?utf-8?B?cUJueWsvWmVsVWVTK05hOGw0NTVhRC9KYWZxekR1ZmpvY05lR1d2N3RyRFJR?=
 =?utf-8?B?L29ZSGZsQVJKMm1Tb0RkdHdGNzJMMTJKaUJ6MVozb2NFQVU1dWtmMlV6WGlw?=
 =?utf-8?B?TnZlNDI0cWM5OU9KcTdhVm0yTFdWZzRPMDVLOFRua20vdi91QkYvbmo5MVg1?=
 =?utf-8?B?ZldQNXZDOUkrZWdZTmh6SStON1NEZkFCNTcxbGMrUWwwdjR5c3JLOGdXeXVN?=
 =?utf-8?B?dVNGeTZLMFd4cDN1V2RXT01uNDhBVTN0N3RIc3N5WVlMZTdPOTBqSnMwZS85?=
 =?utf-8?B?cDY2L0RhOGQyMmw0SXBucytua3BRVGx4Wmp5R1VidEc4VVRzblBJODdWcHE0?=
 =?utf-8?B?dlhrZ3ZycnRKUkxJQkpnOS91WG03dlpOWVQxd09EZ0xvbzQ3anMzUzVTaFhW?=
 =?utf-8?B?ZEE0SGpoMEFEczVSVDIvd2lDZVVKZnlqVHR5Z3k2OUFXK2RoVFBtc0lZTjIz?=
 =?utf-8?B?dTZCdElZeklWN0Z5dU1FWWhsRDBLdUI2aGEzY3ZoSm9wc3N3NCtEYUFPL1Bs?=
 =?utf-8?B?QmtCT3prUjU1bHowQSt4M00xUUJXejZGdW8vampmYTBrblZmSzVrdUNNL0cy?=
 =?utf-8?B?eW5zSDhRT29zT1U1cythemZDZUZ2K2dhSmNiSkRDWDRONW5SL0lHQUg4a1Bl?=
 =?utf-8?B?eG9GU0RCMDg5WjJQU0hBcDA1R2RaSTJ4S3pHNFUwMWRobFd5RURsYnBsMC9X?=
 =?utf-8?B?MStQRUFsZVFxZ0hlVTVJTzNJTG5Xa3RWT2hpZWZHdytBTEdLc2ozbFY0Rlps?=
 =?utf-8?B?T3E2UjY2RXc4dFNHeDdSa29WcFc1OWNDbGJaUnBZdGRqYXdxVmV1cStGMktV?=
 =?utf-8?B?MUcxK2Q1cGdtZGI0RS9zSTVycmY2UGQwNjBMOVdQR2Z2UUJPS1FSRFBPRnpD?=
 =?utf-8?B?SUtlY3ladnBXODNUcjQrK0pYSTEvQWt5REpXUVVaYVVpdEQ0dmRGTlhoaHNv?=
 =?utf-8?B?TUZCeWcrT0xlbmJ2WVlzMkNzK1krdms2MFN3NGhZRkpqSVVXQitGLzk0d3hz?=
 =?utf-8?B?N0VmcnJkZzZva3B6dmlCSkhKYjZwNkhvcDhsUEl5NE5lcDlSMUpSRyt4d1hx?=
 =?utf-8?B?R0NKQmo5MUQvclYvcmpxYTNoY0VQdUxEaXVlM0ZwUEFSZGpabjdqNkZSbnd0?=
 =?utf-8?B?eGNSZC9yWm9XUzVZa05vWkV5a3RVcE43b0JjVVQvNUkzMXNkNGhPcTlZUW5t?=
 =?utf-8?B?cDlRRno0K0tYS2s4Y21Ea3BTZGxmYzl6bWFQOE5nVERWa0FEYWdaSkY4U0lV?=
 =?utf-8?B?bEJ5eXVneXdDKzhEK1o2dzlXc0V0K3J3Z1ErWjQreGgxeE9ObXBjVkxsTHJj?=
 =?utf-8?B?Q3VwZEdNWEpPMVNxUWdPK0VKNzdNMkF5UkJlL2w4d0VNN0tLOEQvQk1QOGxJ?=
 =?utf-8?B?T0s3c2ZjWXhXL1BUd29SVVVQbUN2c1d0b0N1K3hISjRxeXV2US9rU1dSYjlB?=
 =?utf-8?B?dnlqRGIzNHRQdXN6SDFTdURqZmsxSHF0dnBHa0luOTA1dkhPWGxTaWVBN1Za?=
 =?utf-8?B?akE9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5camelintelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8718c02-b074-4214-2185-08da81306825
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 15:43:33.1711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrxYlE8/sdXaYZH1/IJT8xUq7uuYNyxCZqmoKl8vaOPJpBQjoYq6bzIE1h7M8/HFufR2PZ9LcHI5ENRBqpEL5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2254
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--_000_bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5camelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIyLTA4LTE4IGF0IDE3OjI3ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCk9u
IFRodSwgMTggQXVnIDIwMjIsIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb208bWFp
bHRvOmphbmkubmlrdWxhQGludGVsLmNvbT4+IHdyb3RlOg0KT24gV2VkLCAxNyBBdWcgMjAyMiwg
IkNvbGluIEtpbmcgKGdtYWlsKSIgPGNvbGluLmkua2luZ0BnbWFpbC5jb208bWFpbHRvOmNvbGlu
Lmkua2luZ0BnbWFpbC5jb20+PiB3cm90ZToNCk9uIDE3LzA4LzIwMjIgMjE6MDcsIFZpdmksIFJv
ZHJpZ28gd3JvdGU6DQpPbiBUdWUsIDIwMjItMDgtMTYgYXQgMTI6NDMgKzA4MDAsIFpoZW55dSBX
YW5nIHdyb3RlOg0KT24gMjAyMi4wOC4xNiAxMjowNTowOCArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6DQpPbiAyMDIyLjA4LjE1IDE5OjMyOjQ1IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQpP
biBNb24sIEF1ZyAxNSwgMjAyMiBhdCAxMDozODo1NUFNICswODAwLCBaaGVueXUgV2FuZyB3cm90
ZToNCm9oLCBzdXJwcmlzZSEgSSBqdXN0IGZvdW5kIENvbGluJ3MgZW1haWwgaXMgYWN0dWFsbHkg
ZGVmaW5lZCBpbg0KLm1haWxtYXAsDQpzbyBhbGwgaGlzIGNvbW1pdHMgaW4ga2VybmVsIGFyZSBj
aGFuZ2VkIGZvciBAaW50ZWwuY29tIGFkZHJlc3MgYXMgaW4NCm1haWxtYXAuLi4NCg0KQ29saW4s
IHdvdWxkIHlvdSBtaW5kIHRvIGdldCB0aGUgU2lnbi1vZmYtYnkgaW4gdGhlIHBhdGNoZXMgdGhl
IHNhbWUNCmFzIHlvdXIgYXV0aG9yc2hpcCBzbyB0aGUgdG9vbHMgZG9uJ3QgZ2V0IGNvbmZ1c2Vk
Pw0KKHN0YXJ0aW5nIHdpdGggbW9kaWZ5aW5nIGluIHRyZWUgdGhpcyBhbHJlYWR5IG1lcmdlZCBw
YXRjaCkNCg0KU2luY2UgbXkgcGF0Y2hlcyBhcmUgZ2VuZXJhbGx5IHRyaXZpYWwgamFuaXRvcmlh
bCBmaXhlZCBkb25lIGluIG15IHNwYXJlDQp0aW1lIEknbSBnb2luZyB0byBnZXQgdGhlIC5tYWls
bWFwIGNoYW5nZWQgdG8gdXNlIG15IGdtYWlsIGVtYWlsIGFkZHJlc3MNCnJhdGhlciB0aGFuIG15
IEludGVsIG9uZSAoc2luY2UgSSBkb24ndCBkbyBrZXJuZWwgd29yayBpbiBteSBjdXJyZW50IHJv
bGUpLg0KDQpUaGlzIHNob3VsZCBjbGVhbiB1cCB0aGUgY29uZnVzaW9uLiBBcG9sb2dpZXMuDQoN
CkV2ZXJ5b25lIGhvbGQgeW91ciBob3JzZXMuDQoNCkkgdGhpbmsgb3VyIHRvb2xpbmcgc2hvdWxk
IGhhbmRsZSB0aGUgbWFpbG1hcCBzdHVmZi4gVGhlIGNvbW1pdCAqaXMqDQpmaW5lLCBpdCdzIGp1
c3QgdGhhdCB0aGUgd2hlbiB3ZSBjaGVjayBpdCwgd2UgbGV0IG1haWxtYXAgYWx0ZXIgaXQuIFdl
DQpzaG91bGQgY2hlY2sgdGhlIGNvbW1pdCB3aXRob3V0IG1haWxtYXAgbW9kaWZpY2F0aW9ucy4N
Cg0KSW4gdGhpcyBjYXNlLCBpdCdzIGFjdHVhbGx5IG5vdCBhYm91dCBDb2xpbidzIFNpZ25lZC1v
ZmYtYnkgb3IgbWFpbG1hcA0KYXQgYWxsISBMaWtlIHRoZSBlcnJvciBtZXNzYWdlIGZyb20gZGlt
IHNheXMsICJjb21taXR0ZXIgU2lnbmVkLW9mZi1ieQ0KbWlzc2luZyIuIENvbW1pdHRlciwgbm90
IGF1dGhvciENCg0KJCBnaXQgc2hvdyAtcyB0YWdzL2d2dC1maXhlcy0yMDIyLTA4LTE1XiAtLXBy
ZXR0eT1mdWxsZXINCmNvbW1pdCBkNjYzMjM3MDUzNmQwYjgwYmUzYmZjOTBkZDY3ZTFmNjkzMzM1
YTc1DQpBdXRob3I6ICAgICBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BpbnRlbC5jb208bWFp
bHRvOmNvbGluLmtpbmdAaW50ZWwuY29tPj4NCkF1dGhvckRhdGU6IFR1ZSBNYXIgMTUgMjA6MjQ6
NDkgMjAyMiArMDAwMA0KQ29tbWl0OiAgICAgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50
ZWwuY29tPG1haWx0bzp6aGVueXV3QGxpbnV4LmludGVsLmNvbT4+DQpDb21taXREYXRlOiBNb24g
QXVnIDE1IDEwOjUxOjE1IDIwMjIgKzA4MDANCg0KICAgIGRybS9pOTE1L3JlZzogRml4IHNwZWxs
aW5nIG1pc3Rha2UgIlVuc3VwcG9ydCIgLT4gIlVuc3VwcG9ydGVkIg0KDQogICAgVGhlcmUgaXMg
YSBzcGVsbGluZyBtaXN0YWtlIGluIGEgZ3Z0X3ZncHVfZXJyIGVycm9yIG1lc3NhZ2UuIEZpeCBp
dC4NCg0KICAgIEZpeGVzOiA2OTVmYmMwOGQ4MGYgKCJkcm0vaTkxNS9ndnQ6IHJlcGxhY2UgdGhl
IGd2dF9lcnIgd2l0aCBndnRfdmdwdV9lcnIiKQ0KICAgIFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPG1haWx0bzpjb2xpbi5pLmtpbmdAZ21haWwu
Y29tPj4NCiAgICBTaWduZWQtb2ZmLWJ5OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb208
bWFpbHRvOnpoaS5hLndhbmdAaW50ZWwuY29tPj4NCiAgICBMaW5rOiBodHRwOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIyMDMxNTIwMjQ0OS4yOTUyODQ1LTEtY29s
aW4uaS5raW5nQGdtYWlsLmNvbQ0KICAgIFJldmlld2VkLWJ5OiBaaGkgV2FuZyA8emhpLmEud2Fu
Z0BpbnRlbC5jb208bWFpbHRvOnpoaS5hLndhbmdAaW50ZWwuY29tPj4NCg0KQ29tbWl0dGVkIGJ5
IFpoZW55dSwgU2lnbmVkLW9mZi1ieSBaaGkuIE1heWJlIGNhdXNlZCBieSByZWJhc2UgYnkgWmhl
bnl1DQphZnRlciBiZWluZyBjb21taXR0ZWQgYnkgWmhpPw0KDQpQcm9iYWJseSBlYXNpZXIgaWYg
eW91IGNvdWxkIHJlYmFzZSBpdCBhZ2FpbiBzaWduaW5nIGl0IHRoZW4/DQoNCkkgY291bGQgYnlw
YXNzIGRpbSBoZXJlLCBidXQgdGhpcyB3aWxsIGxpa2VseSBhZmZlY3Qgc29tZW9uZSBlbHNlIGxh
dGVyIGluIHRoZSB1cHN0cmVhbSBjaGFpbiBhcyB3ZWxsLi4NCg0KDQpCUiwNCkphbmkuDQoNCg0K
DQo=

--_000_bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5camelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <18590F42B4B96C4FA608695BDC1942EA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUaHUs
IDIwMjItMDgtMTggYXQgMTc6MjcgKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOjwvZGl2Pg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVm
dDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+T24gVGh1LCAxOCBB
dWcgMjAyMiwgSmFuaSBOaWt1bGEgJmx0OzxhIGhyZWY9Im1haWx0bzpqYW5pLm5pa3VsYUBpbnRl
bC5jb20iPmphbmkubmlrdWxhQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCjwvZGl2Pg0K
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXIt
bGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+T24gV2VkLCAx
NyBBdWcgMjAyMiwgJnF1b3Q7Q29saW4gS2luZyAoZ21haWwpJnF1b3Q7ICZsdDs8YSBocmVmPSJt
YWlsdG86Y29saW4uaS5raW5nQGdtYWlsLmNvbSI+Y29saW4uaS5raW5nQGdtYWlsLmNvbTwvYT4m
Z3Q7IHdyb3RlOjxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1h
cmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxl
ZnQ6MWV4Ij4NCjxkaXY+T24gMTcvMDgvMjAyMiAyMTowNywgVml2aSwgUm9kcmlnbyB3cm90ZTo8
YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8
ZGl2Pk9uIFR1ZSwgMjAyMi0wOC0xNiBhdCAxMjo0MyArMDgwMCwgWmhlbnl1IFdhbmcgd3JvdGU6
PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0K
PGRpdj5PbiAyMDIyLjA4LjE2IDEyOjA1OjA4ICswODAwLCBaaGVueXUgV2FuZyB3cm90ZTo8YnI+
DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2
Pk9uIDIwMjIuMDguMTUgMTk6MzI6NDUgLTA0MDAsIFJvZHJpZ28gVml2aSB3cm90ZTo8YnI+DQo8
L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsg
Ym9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pk9u
IE1vbiwgQXVnIDE1LCAyMDIyIGF0IDEwOjM4OjU1QU0gKzA4MDAsIFpoZW55dSBXYW5nIHdyb3Rl
Ojxicj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj5vaCwgc3Vy
cHJpc2UhIEkganVzdCBmb3VuZCBDb2xpbidzIGVtYWlsIGlzIGFjdHVhbGx5IGRlZmluZWQgaW48
YnI+DQo8L2Rpdj4NCjxkaXY+Lm1haWxtYXAsPGJyPg0KPC9kaXY+DQo8ZGl2PnNvIGFsbCBoaXMg
Y29tbWl0cyBpbiBrZXJuZWwgYXJlIGNoYW5nZWQgZm9yIEBpbnRlbC5jb20gYWRkcmVzcyBhcyBp
bjxicj4NCjwvZGl2Pg0KPGRpdj5tYWlsbWFwLi4uPGJyPg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5Db2xpbiwgd291bGQgeW91IG1pbmQgdG8gZ2V0IHRo
ZSBTaWduLW9mZi1ieSBpbiB0aGUgcGF0Y2hlcyB0aGUgc2FtZTxicj4NCjwvZGl2Pg0KPGRpdj5h
cyB5b3VyIGF1dGhvcnNoaXAgc28gdGhlIHRvb2xzIGRvbid0IGdldCBjb25mdXNlZD88YnI+DQo8
L2Rpdj4NCjxkaXY+KHN0YXJ0aW5nIHdpdGggbW9kaWZ5aW5nIGluIHRyZWUgdGhpcyBhbHJlYWR5
IG1lcmdlZCBwYXRjaCk8YnI+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9k
aXY+DQo8ZGl2PlNpbmNlIG15IHBhdGNoZXMgYXJlIGdlbmVyYWxseSB0cml2aWFsIGphbml0b3Jp
YWwgZml4ZWQgZG9uZSBpbiBteSBzcGFyZSA8YnI+DQo8L2Rpdj4NCjxkaXY+dGltZSBJJ20gZ29p
bmcgdG8gZ2V0IHRoZSAubWFpbG1hcCBjaGFuZ2VkIHRvIHVzZSBteSBnbWFpbCBlbWFpbCBhZGRy
ZXNzIDxicj4NCjwvZGl2Pg0KPGRpdj5yYXRoZXIgdGhhbiBteSBJbnRlbCBvbmUgKHNpbmNlIEkg
ZG9uJ3QgZG8ga2VybmVsIHdvcmsgaW4gbXkgY3VycmVudCByb2xlKS48YnI+DQo8L2Rpdj4NCjxk
aXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlRoaXMgc2hvdWxkIGNsZWFuIHVwIHRoZSBjb25mdXNpb24u
IEFwb2xvZ2llcy48YnI+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+
DQo8ZGl2PkV2ZXJ5b25lIGhvbGQgeW91ciBob3JzZXMuPGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4N
CjwvZGl2Pg0KPGRpdj5JIHRoaW5rIG91ciB0b29saW5nIHNob3VsZCBoYW5kbGUgdGhlIG1haWxt
YXAgc3R1ZmYuIFRoZSBjb21taXQgKmlzKjxicj4NCjwvZGl2Pg0KPGRpdj5maW5lLCBpdCdzIGp1
c3QgdGhhdCB0aGUgd2hlbiB3ZSBjaGVjayBpdCwgd2UgbGV0IG1haWxtYXAgYWx0ZXIgaXQuIFdl
PGJyPg0KPC9kaXY+DQo8ZGl2PnNob3VsZCBjaGVjayB0aGUgY29tbWl0IHdpdGhvdXQgbWFpbG1h
cCBtb2RpZmljYXRpb25zLjxicj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+SW4gdGhpcyBjYXNlLCBpdCdzIGFjdHVhbGx5IG5vdCBhYm91dCBDb2xpbidz
IFNpZ25lZC1vZmYtYnkgb3IgbWFpbG1hcDxicj4NCjwvZGl2Pg0KPGRpdj5hdCBhbGwhIExpa2Ug
dGhlIGVycm9yIG1lc3NhZ2UgZnJvbSBkaW0gc2F5cywgJnF1b3Q7Y29tbWl0dGVyIFNpZ25lZC1v
ZmYtYnk8YnI+DQo8L2Rpdj4NCjxkaXY+bWlzc2luZyZxdW90Oy4gQ29tbWl0dGVyLCBub3QgYXV0
aG9yITxicj4NCjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+JCBnaXQgc2hvdyAtcyB0
YWdzL2d2dC1maXhlcy0yMDIyLTA4LTE1XiAtLXByZXR0eT1mdWxsZXI8YnI+DQo8L2Rpdj4NCjxk
aXY+Y29tbWl0IGQ2NjMyMzcwNTM2ZDBiODBiZTNiZmM5MGRkNjdlMWY2OTMzMzVhNzU8YnI+DQo8
L2Rpdj4NCjxkaXY+QXV0aG9yOiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBDb2xpbiBJYW4gS2lu
ZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNvbGluLmtpbmdAaW50ZWwuY29tIj5jb2xpbi5raW5nQGlu
dGVsLmNvbTwvYT4mZ3Q7PGJyPg0KPC9kaXY+DQo8ZGl2PkF1dGhvckRhdGU6IFR1ZSBNYXIgMTUg
MjA6MjQ6NDkgMjAyMiArMDAwMDxicj4NCjwvZGl2Pg0KPGRpdj5Db21taXQ6Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IFpoZW55dSBXYW5nICZsdDs8YSBocmVmPSJtYWlsdG86emhlbnl1d0BsaW51
eC5pbnRlbC5jb20iPnpoZW55dXdAbGludXguaW50ZWwuY29tPC9hPiZndDs8YnI+DQo8L2Rpdj4N
CjxkaXY+Q29tbWl0RGF0ZTogTW9uIEF1ZyAxNSAxMDo1MToxNSAyMDIyICswODAwPGJyPg0KPC9k
aXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgZHJtL2k5MTUv
cmVnOiBGaXggc3BlbGxpbmcgbWlzdGFrZSAmcXVvdDtVbnN1cHBvcnQmcXVvdDsgLSZndDsgJnF1
b3Q7VW5zdXBwb3J0ZWQmcXVvdDs8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7
IDxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgVGhlcmUgaXMgYSBzcGVsbGlu
ZyBtaXN0YWtlIGluIGEgZ3Z0X3ZncHVfZXJyIGVycm9yIG1lc3NhZ2UuIEZpeCBpdC48YnI+DQo8
L2Rpdj4NCjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDsm
bmJzcDsmbmJzcDsgRml4ZXM6IDY5NWZiYzA4ZDgwZiAoJnF1b3Q7ZHJtL2k5MTUvZ3Z0OiByZXBs
YWNlIHRoZSBndnRfZXJyIHdpdGggZ3Z0X3ZncHVfZXJyJnF1b3Q7KTxicj4NCjwvZGl2Pg0KPGRp
dj4mbmJzcDsmbmJzcDsmbmJzcDsgU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgJmx0Ozxh
IGhyZWY9Im1haWx0bzpjb2xpbi5pLmtpbmdAZ21haWwuY29tIj5jb2xpbi5pLmtpbmdAZ21haWwu
Y29tPC9hPiZndDs8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IFNpZ25lZC1v
ZmYtYnk6IFpoaSBXYW5nICZsdDs8YSBocmVmPSJtYWlsdG86emhpLmEud2FuZ0BpbnRlbC5jb20i
PnpoaS5hLndhbmdAaW50ZWwuY29tPC9hPiZndDs8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7Jm5i
c3A7Jm5ic3A7IExpbms6IDxhIGhyZWY9Imh0dHA6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoL21zZ2lkLzIwMjIwMzE1MjAyNDQ5LjI5NTI4NDUtMS1jb2xpbi5pLmtpbmdAZ21haWwu
Y29tIj4NCmh0dHA6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMjIw
MzE1MjAyNDQ5LjI5NTI4NDUtMS1jb2xpbi5pLmtpbmdAZ21haWwuY29tPC9hPjxicj4NCjwvZGl2
Pg0KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgUmV2aWV3ZWQtYnk6IFpoaSBXYW5nICZsdDs8YSBo
cmVmPSJtYWlsdG86emhpLmEud2FuZ0BpbnRlbC5jb20iPnpoaS5hLndhbmdAaW50ZWwuY29tPC9h
PiZndDs8YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkNvbW1pdHRlZCBieSBa
aGVueXUsIFNpZ25lZC1vZmYtYnkgWmhpLiBNYXliZSBjYXVzZWQgYnkgcmViYXNlIGJ5IFpoZW55
dTxicj4NCjwvZGl2Pg0KPGRpdj5hZnRlciBiZWluZyBjb21taXR0ZWQgYnkgWmhpPzxicj4NCjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+UHJvYmFibHkgZWFz
aWVyIGlmIHlvdSBjb3VsZCByZWJhc2UgaXQgYWdhaW4gc2lnbmluZyBpdCB0aGVuPzwvZGl2Pg0K
PGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SSBjb3VsZCBieXBhc3MgZGltIGhlcmUsIGJ1dCB0aGlz
IHdpbGwgbGlrZWx5IGFmZmVjdCBzb21lb25lIGVsc2UgbGF0ZXIgaW4gdGhlIHVwc3RyZWFtIGNo
YWluIGFzIHdlbGwuLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Yg
c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5CUiw8YnI+
DQo8L2Rpdj4NCjxkaXY+SmFuaS48YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
Pjxicj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+PHNw
YW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5camelintelcom_--
