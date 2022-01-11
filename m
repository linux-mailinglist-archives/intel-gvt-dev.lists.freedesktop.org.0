Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D4C48A795
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 07:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C8A11B717;
	Tue, 11 Jan 2022 06:08:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DFD11B6FA;
 Tue, 11 Jan 2022 06:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641881293; x=1673417293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=brdABXBNAr+JcpGTDWUWOVuYISRv7KN+rhWGuUkAoaM=;
 b=RaY+Hb2vRnsV+NG52SkSs9js0zaHYWYpNff+xWR70kI3Yl0T24sJGZX3
 r469nJmPGFk9GqXLgqmIOSecUttYcMRHMEJGaQm5y+7xHGrtU/JcCKfAM
 j/76oHDJa0lYkGvZah6+xTE8qdzgZcUhJYL9XW7c7rAkJmzPyes6veAW/
 ClMm5YC/VRzLK9ksiyGPzApYPNujle4AHReliW79aZSaz8su0PRLaMAfM
 i9AHSWmhCJNcAQBnxvJc1rQE1pF1p62iyq5qMMrJkQWyXvl7hyPr3TlzE
 +cmuqhAsR9eGsMHj5hfUcvZIdEZ9SnIsO5aAcm8+ViSyLKDP+VaBLLC/d g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="329752521"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="329752521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 22:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="558252630"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2022 22:08:12 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 22:08:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 22:08:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 22:08:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSt4qZiNjPSctu5lFUqSC2fnNpPctUJFKn1VtXov7ov/qX+I/9tHE6H2pKvvMBj7mh/xQ8ouVeh7Cg1GhXd34dheq2njjq4q/aMmDXDDzHz50qh5FErscJ7ni7lCZvqVx4nrnEevOzBGx02E/CKUqQbTfo1NF8PEvseww+bmmImU+pxYnK2hT/wj1mj3/GAtAv5Ia42ZEX/Zo82owONXdWmfDDiRHpLAsTMa/dAaWSHLMr/TomhS4hetruwIajEjhMoNe0ZwK8C34KfDr7EyBS9VusAOOr/kxEHQ23Nhat6vlA8OizCUE8mZQDwYQuDtkkxVO7Zu/kYdgfx6y0NM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brdABXBNAr+JcpGTDWUWOVuYISRv7KN+rhWGuUkAoaM=;
 b=l0k2v+w+E6DIZQOZO1f2fOSzifKjFx2iEHwEs+9dkocXreJJdsklZbJkrm6zIMljY1p/g8MJChzuLJNjWsNsiAaEU1o8pj/mzZqzAHk4E54jVbvh46h+nuJH0YIPlb8/Nv9BaRKr04VcICYEhU1F+em46r4Tq5OSPluxslcmghcD/Qs6MftQddkDQ8MzWZI602PzIL45vxS4XhLD2xur1VJ5A3CeJoch1yfLlmT/AAXYDv4GqY1V+dNwJbFMr01jT2sZ7x7JIfrCmUcnZTuaKLrWvLmCGTA7K3WaL4cdVidirAoUhggqdVF2cJ0pKUebZy7WNri1lVy32FLnr/JVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB3051.namprd11.prod.outlook.com (2603:10b6:5:61::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Tue, 11 Jan 2022 06:08:09 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47%9]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 06:08:09 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYA9Tuucz5FdQejkegRXcQeTo5nqxdZ/oA///zkQA=
Date: Tue, 11 Jan 2022 06:08:09 +0000
Message-ID: <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
In-Reply-To: <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3efd576-9345-4415-7558-08d9d4c8be10
x-ms-traffictypediagnostic: DM6PR11MB3051:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB30517FE379892DCABFFB158DCA519@DM6PR11MB3051.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sq4yhXea3b9Jjimmu61+CBYmvB/hUQf9ScbIZq6AIRTdmUf/jUfkMMnjlnhbeOM3WeD5ns94dsZvAUW3VAylecb4Lb6UCCOmnHOAq/FYDTwAO/Yqdphx7oDyJRxYKAJgeq/Gp1PJ0nhbIArJ79sU1wW1uSeORZEFvujcks+3ZPP8POiMeK71qGU5/ojsJFVywVTz1GPKk/DsaXnE30qSzG/gbfEb3FXB2Rs4Fb+ljH1vl/nRjlBPr9RD1vmby0cVWYdmYe1XEvy0kP8eqfA5CiG4gIxfd4tb8DYSBL0K71t07RY+suhXzv37eiw7B6c5qu0xMYefkJK7fyi6gwyn2XwyKXNWWNMYVSFeRGC9KvxH2RgdkVVHfYMIa1SL2JHN8UZTgzOqUroX0e1NEREJxnUm9Whau0OKrPMrHHS9OAbUgEQzY9CJhX07Tuv/OEC+qPfFU7b5m3uFx3pc2WLy/Ah7Oy30OHdONqZ8gUAmkt0Bw5QnIJ+RzLPUe71WDCpMMhbbLl5yR80+NoP7dinKJfs4tkkRHFcd21GGFTdvVcyoDqhg3xJVHEyNgT5XMa9d8xtZyJAMIiGx1r/2CrxtwIKt05mjFywPuiVi699IJhO/G8xYdP+d8tlPnOHqGn12CZuYpKkXHL3wVqEQL45My/JnhQnQw2wx4d9iaKhichEKq4bivsfA0zT1iTjriIHXx2VzDnoGDh2Ea3CzYbglUJTl5c/avveYpOqlpTmUWDc/vBO1t9iRDvSUyqDWJ0p24GQ9gTueK1QLXDWoVnj+jW4X1fxpiA2NP228WYgu3eCnrhaxIM0AkKRtr7YheMw7S+YdIDoS2w2eAzaoXEAGr2IIdt0gSELcDOz+gNOmaEw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(8676002)(86362001)(8936002)(76116006)(66946007)(54906003)(4001150100001)(110136005)(91956017)(2616005)(316002)(2906002)(82960400001)(83380400001)(31686004)(71200400001)(6486002)(966005)(31696002)(4326008)(38100700002)(6512007)(122000001)(6506007)(6636002)(5660300002)(53546011)(66476007)(66556008)(64756008)(66446008)(186003)(26005)(508600001)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXNzb2tVNzhTQjlCYzI5c1VxK05GYVdNMjVKejF1MzJLeDJvMlovYU9BQUZv?=
 =?utf-8?B?WnA2Y1dWTkFMUExBcWF2WlI0aWo0empBclFTZ3kwVmV3UzFFS2xzZm1sZFEy?=
 =?utf-8?B?TTIxMUZZai9jcEN0Wm5qZDJubkRhUVZpZjVrYmpha2tuZHBPR2kvNnRJclln?=
 =?utf-8?B?bTJKQ2NOSFQwWHA4Wk1JQ3hiVzVHSFRkeXh4cktubzJSWFVQRm9WY0dxVVVm?=
 =?utf-8?B?c2w2aGREV0NGU3BTTUNQVjhQTXdoWkgxRGdOZWNuSGMzc3orQmFjcjFHYkww?=
 =?utf-8?B?TzlFUnk3RXBrNUJaTDdsUkdCZElpNUU0L1dkYmtnQ3o0ank0bFZnVktCbUdw?=
 =?utf-8?B?WGFHZG9nZ0p6Rjk3THBtK0ZzSDIyYUg2anVJRmxsMUFOVzlhbGFEUWRKQlQ5?=
 =?utf-8?B?RHFYRzlubWFRNVJUenloQ0F4NGZIMTg5YzRaWVhxRFVmNVJVSDBsN2xtcjhX?=
 =?utf-8?B?VFdyc0RLUCt1WnFTUkRSaWlYbmNoZGQ5TTArbndMSGNHL29xOGVOVDhKazd4?=
 =?utf-8?B?akNWWHNxUkduZnpZV1ZGZUVXWVY4QnpiYnp0MVRMVHcwSDNPemVoV1llZ2Iy?=
 =?utf-8?B?TU9JQ1pWNVFHYklMd1MzdHNIbUo3cGZwN2N1U3VGRUxXKytBSU1vN21LempF?=
 =?utf-8?B?bkRRckNyU09RVVp1NmZCOHFJbVBvYWZQN2lrZGdpcmtvMlBab1FYRUJBQXBp?=
 =?utf-8?B?Y2Zpa1pGdXBVWEZGTVppNVhOYUNOUEZ1UmcrQlRKZFU2ZlVXZlBJbDE2Uk9E?=
 =?utf-8?B?WnJLK1krUDhTZFdubW83Znk0UzhXOFdBVi9EVGdkb3BkcEVGQkgvVTlNUEho?=
 =?utf-8?B?eUN5bm54K0xLakJ4SjlDL1JidzFpYnliNnRoQnkyUE5YbDNzbm1ib0ZyVjd3?=
 =?utf-8?B?YmNhbjdIcklkcS95N3lsVGlTRUI4SDZpVU55ZUN5N1VOQmtDMFVZcyt1VlpN?=
 =?utf-8?B?dXdWVUxCVkIrcENqRXhKbGNoU3JiaGwwWWdrcFhPbkgyQ05EdmJqVEt4dTRH?=
 =?utf-8?B?TXBNaDFTalBLTmhCOW8yVTg3TUd6TEpBMTNKUEhXY2tUL1k4MDU2Q2JjMWpo?=
 =?utf-8?B?eEVDTC9OVVNUSHNISklZK3hmUlFaVlR5VjVibVZtU2Y4S0pGdFZ6bEhxQ2ZV?=
 =?utf-8?B?ZUJsdlp4NTZkUEVBMGtEemdLK2lzd1pUUmQ3aEZ5NlhFNmJ0MGlxWU81aTV5?=
 =?utf-8?B?TGZocktkempzT2NzMmtrTURzUDYyb2tEL1pPNUNXTmpTcnV1bDMzNEp3ZWM3?=
 =?utf-8?B?RmxQT3RRTEVSVUJPYnhlVHFIM3RCSnJaZEgreXlDVjR0aWR1K1h1WnJZNFRD?=
 =?utf-8?B?VVZoeldIV2plYTNsaGNOSEdjRFEwa3NyYmtFTkJqTkduTzc2aUl0bm54cCsv?=
 =?utf-8?B?M1UxSGh1TmlsclJIZmR6bmJzUVBSa2JkZXV1bDJVdlh0TzY0OXhqNjh3TVFl?=
 =?utf-8?B?RmZ5QXpVSXVGcEhTQXhXY3BodkZkazNOcUpLOVMwTjZHUEs3cHc4Q3psUXFo?=
 =?utf-8?B?aHdNbWhqazYvMDFTVW54MjhoZk1TZ3lyeEFZVEFaS0RBeU15UTA4aEtqZ0NK?=
 =?utf-8?B?N3c1TTFOdjFWcWpwbkRCR1RRZlFSZ25ZRU5WdnRnOWZ2ZFZzQVdYQ0NibG1w?=
 =?utf-8?B?ZHVCSDcwU3ZWdlJmNG4remg3ek80ZUprZ3hOQjQ5K3VMOWFWLzZ4Z3hQeFZ6?=
 =?utf-8?B?V0d4QldSM1NDRzVPREZwY1ExeFlwU2EyT0xqV0dUTUk0Z29BdVgwaWRVN2dS?=
 =?utf-8?B?bWNGclVXd2pYdU5lUFNPb1E1ZUZRdUlzMU1OM0Q5VUZJd2Q4N1I3N2FUMlJH?=
 =?utf-8?B?c0xaMjFaRk5Idi9uRnFyTlNIdXNITXRzZ215akt1ZFoyMmgrajR3SVlPMzkz?=
 =?utf-8?B?THIzT0RqSU9OcDBydXMyV21jc2dSQVduTW10WU9VTlBiYjVmRDRLQWl5ZTBF?=
 =?utf-8?B?ZEJlWnhyL0tFUzN2WVUzRVZRL05vOU1wOEd2NEI5dHYycWpKZ3VoWk5EOHdL?=
 =?utf-8?B?V09BaFovMXViVlVlTE9OaU43bG1BaVVHdHVJalNxV0RWR25sSlpITnd6MUlK?=
 =?utf-8?B?RG5OTjEzQ2phZWFFbTlxMVpxMVJpUVl0LzdndUFCMW9CVUVJbkxFNEdyaVJo?=
 =?utf-8?B?Qkxidm5RKzBBUmFkZ2tVUWVnbC9CU1ZzV0ROT0FRNThiR2RFU0tjUVBzYVRr?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3E05A216FF0BE4A9D71416BBD2916EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3efd576-9345-4415-7558-08d9d4c8be10
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 06:08:09.5840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSccHXDkoK3Jr+K0nqGTAxhDtBoEg0BAgFChJS8gXGRWDymvgB4AvBiOHAwbegFij1/VE/98a2UppBNMfCTIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3051
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

T24gMS8xMS8yMDIyIDEyOjUyIEFNLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0KPiBPbiBGcmksIDIw
MjItMDEtMDcgYXQgMTQ6NDMgKzAwMDAsIFdhbmcsIFpoaSBBIHdyb3RlOg0KPj4gSGkgZm9sa3M6
DQo+Pg0KPj4gSGFwcHkgaG9saWRheXMhIFRoaXMgcHVsbCBtb3N0bHkgY29udGFpbnMgdGhlIGNv
ZGUgcmUtZmFjdG9ycyBwYXRjaGVzDQo+PiBmcm9tIEd1ZW50ZXIgUm9lY2sgYW5kIFJpa2FyZC4g
QWxzbyBhIG1pbm9yIGNoYW5nZSBmcm9tIFpoZW55dS4NCj4+DQo+PiBaaGkNCj4+DQo+PiBUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+PiAzYmZhN2Q0MGNlNzM2ZmZiYmZlMDcx
MjcwNjFmNTRiMzU5ZWUyYjEyOg0KPj4NCj4+ICAgICBkcm0vaTkxNS9kZzI6IEFkZCBzdXBwb3J0
IGZvciBuZXcgREcyLUcxMSByZXZpZCAweDUgKDIwMjEtMDgtMDYNCj4+IDA5OjAzOjEwIC0wNzAw
KQ0KPj4NCj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPj4NCj4+
ICAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4IHRhZ3MvZ3Z0LW5leHQtMjAy
Mi0wMS0wNw0KPj4NCj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KPj4gZDdhODU4
NTQzMGYyYjZkZjU5NjBiYmMzMDVlZGNlYzVhNTUxODBmMzoNCj4gSSdtIG5vdCBzdXJlIHdoYXQn
cyBnb2luZyBvbiBoZXJlLCBidXQ6DQo+DQo+IGRpbTogbm8gcHVsbCByZXF1ZXN0IGZvdW5kDQo+
DQo+IGRpZCB5b3UgZG8gYW55dGhpbmcgZGlmZmVyZW50IG9uIHRoaXMgcm91bmQgZm9yIGdlbmVy
YXRpbmcgYW5kIHNlbmRpbmcNCj4gb3V0IHRoaXMgcHVsbCByZXF1ZXN0IGVtYWlsPw0KU3RyYW5n
ZS4NCg0KSSBnZW5lcmF0ZWQgdGhpcyBwdWxsIHJlcXVlc3QgYnkgZ2l0IHB1bGwtcmVxdWVzdCBz
aW5jZSB0aGVyZSBpcyBubyANCnN1cHBvcnQgZm9yIGdlbmVyYXRpbmcgcHVsbC1yZXF1ZXN0IGZv
ciBndnQtbmV4dCByaWdodCBpbiBkaW0gbm93LiBDYW4gDQp5b3Ugc2hhcmUgbWUgdGhlIGNvbW1h
bmQgbGluZSBvZiBkaW0geW91IHdlcmUgdXNpbmcgZm9yIGFwcGx5IHRoaXMgcHVsbCANCnJlcXVl
c3Q/IEkgY2FuIHRyeSB0byBhcHBseSBpdCBiZWZvcmUgc2VuZGluZyB0aGUgcHVsbCByZXF1ZXN0
Lg0KDQpUaGFua3MsDQoNClpoaS4NCg0KPj4gICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgdmdw
dV90eXBlcyAoMjAyMS0xMi0xNiAwOToxMzowMiAtMDUwMCkNCj4+DQo+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiBH
dWVudGVyIFJvZWNrICgxKToNCj4+ICAgICAgICAgZHJtL2k5MTUvZ3Z0OiBVc2UgbGlzdF9lbnRy
eSB0byBhY2Nlc3MgbGlzdCBtZW1iZXJzDQo+Pg0KPj4gUmlrYXJkIEZhbGtlYm9ybiAoOSk6DQo+
PiAgICAgICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0X2d0dF9nbWFfb3BzDQo+
PiAgICAgICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0X2d0dF9wdGVfb3BzDQo+
PiAgICAgICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgaW50ZWxfZ3Z0X2lycV9vcHMNCj4+ICAg
ICAgICAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBpbnRlbF9ndnRfc2NoZWRfcG9saWN5X29wcw0K
Pj4gICAgICAgICBkcm0vaTkxNS9ndnQ6IENvbnN0aWZ5IGd2dF9tbWlvX2Jsb2NrDQo+PiAgICAg
ICAgIGRybS9pOTE1L2d2dDogQ29uc3RpZnkgY21kX2ludGVycnVwdF9ldmVudHMNCj4+ICAgICAg
ICAgZHJtL2k5MTUvZ3Z0OiBDb25zdGlmeSBmb3JtYXRzDQo+PiAgICAgICAgIGRybS9pOTE1L2d2
dDogQ29uc3RpZnkgZ3R0X3R5cGVfdGFibGVfZW50cnkNCj4+ICAgICAgICAgZHJtL2k5MTUvZ3Z0
OiBDb25zdGlmeSB2Z3B1X3R5cGVzDQo+Pg0KPj4gWmhlbnl1IFdhbmcgKDEpOg0KPj4gICAgICAg
ICBkcm0vaTkxNS9ndnQ6IEZpeCBjbWQgcGFyc2VyIGVycm9yIGZvciBQYXNzbWFyazkNCj4+DQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jICAgfCAgMiArLQ0KPj4g
ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jICAgICAgIHwgMTggKysrLS0tLS0t
DQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jICAgfCAyNCArKysr
KystLS0tLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICB8
IDY4DQo+PiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuaCAgICAgICAgICB8ICA0ICstDQo+PiAgICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgICAgfCAgMiArLQ0KPj4gICAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgICAgIHwgMTMgKysrKy0tLQ0KPj4gICAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jICAgIHwgMTAgKystLS0NCj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuaCAgICB8ICAyICstDQo+PiAgICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvc2NoZWRfcG9saWN5LmMgfCAgMiArLQ0KPj4gICAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5oICAgIHwgIDIgKy0NCj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC92Z3B1LmMgICAgICAgICB8ICA0ICstDQo+PiAgICAxMiBmaWxlcyBjaGFuZ2Vk
LCA3MiBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkNCj4+DQoNCg==
