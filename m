Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053CF508AE9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 16:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC7D10EA90;
	Wed, 20 Apr 2022 14:41:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9111110F0AF;
 Wed, 20 Apr 2022 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650465667; x=1682001667;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=63U/q7unG58r47QM1Nm6Og0xg1hUuU8Aoj1OFQtvG6U=;
 b=WLyEuH1SZE2JSmklnNLGWtVK4c6MKOz4z+20LGWLA2ZKFX77yDURhyKU
 m3g8uA16qtLT004VZGixlz8hMbG2/61biuhLTkVkco0oN3IlVlF8hFGPo
 EjLi0Yv6e925zZWgveqHQuELoWwgqIBtI/poh8vbfmVpdZnjR4f7hWaiC
 LNnuyMQJZzKerBpx1k/f1BsZtPBc0dUQ2Z78GnK5IE5qSn6F2HY3z0TbD
 RcOJCMSRIiS4De8d4TDCdSGGY9MLadeKNVCR+AXxz9u/6BHdyFqtQzY2T
 S+MRJ54Rx6JTmah6zFZoSNE/FiNwF5+qlix1UK+9BnDgh3NpROj+lOnC2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261643200"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="261643200"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 07:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="510577560"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2022 07:41:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 07:41:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 07:41:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Apr 2022 07:41:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Apr 2022 07:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKRbzey3Bqfk2HWl68RGCY/e9bzdrEzH0+Lauu/mcUJIVQUVmGiY8OyYk0u65BXM+OFsm6ads5fFstXwRvFAvp4WsP5D2siUWOSmKE4bmkbTUiA68QtshTPgQoe0bw2uY7J0kCJoCXybCcjuweJ9DXOt7qmcb5nzzC8sCjPouOoiTeJOfsK7oeUwV9tM4RSKuq5G7GEiPTR8EUjBntnK1BjhoryYlIwULxpq9ayIM8BML4Hrcp2G/imI9GLYIIfGv58eR3EaB+D3zE5A+kLTEzM6qeJ4IjWStjY7L5qWZ3sqPoiRYkG6F8/EqCq+ZlB7+2vjj4ppaYr0XIEsASzoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvwd/hXZzTL9BRzYwHBYkEp47xSUUwr40VM63wnJg1c=;
 b=enp+kpjY4pXBuJpLkS8lz+p50WqczqaSD57T/dLtZq5B4m+xrqgH1UZ1G2PYdcZBLaxXsD01ldEjeC5M0v0+9OysisNhpwoQAkP2+D3m9rNvPZpKe/mfsog4dDcMjvoZrPSimwUnvm8/3vaNQuB8vmv50BtFFmll2xgkBViQSt/1KTQv4fUkrVqOr1h4i49x1u54Gbjq3k9nMuAaHajBNLQa9TKJyVdW7hPYrK9w/w+ku63bDLrWkOGGC64t362rfzKf8tbBiNuNu/8O6jn59/CSLOTtarjUVHUHboYU8cXzdxOizB8XEF7b+ojGH1l3IiHEfccG6D8+CjvV/+eIng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 14:41:04 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 14:41:04 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHYVI1DfNiTLpeqnEGvHyikgylmNqz4tu6AgAApSYA=
Date: Wed, 20 Apr 2022 14:41:04 +0000
Message-ID: <16fd439d-6a6d-63d0-76d8-16daadfe5bde@intel.com>
References: <18c3c1b1-6f78-6140-4ec8-e18bc7916352@intel.com>
 <20220420121317.GV2120790@nvidia.com>
In-Reply-To: <20220420121317.GV2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 094a6851-57e6-47cd-c166-08da22dbcc0c
x-ms-traffictypediagnostic: PH0PR11MB5951:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB5951D731BB588A2A3F64CB1FCAF59@PH0PR11MB5951.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcXLgbSxQ57qgRk34j6BJkhVckjO0XhH3Mu+LWH3G7U2Sm9geN17unP9YgZxomzMrF2Bab5TxH0Av51y40f4B6txvqzIV+nkHtatGArpehOCBQnLtlkmHFMkzNM4B7T9qHvOp6tucEmJK7+tVqbRfjjKugsFD76xCNUlDfpYOfqvcoPuMmue1NEBXzmh6rm5Qr2HNmB9YU9kziynzQXMJG6+7FEGekZIjUuLxlEVIxLO0pUrmzbYEsECFbDVRu/oTSNkE1/Xi1hNzHFeGlkrq9R4h26E67gIXyDsphrt6szDUYnLAi64oHQ2wZMSZ6wxhj5269dKoAujIAKmTuHpM6axYdarANN22VG83WuuE8TR1vb8c731IbzCz2CoYcfS88fpniwdnR7T/hERB4Ub3XhsyjTrBCyjfzKZxR1zDuA7YqvqEEQtMGlQDnH6PjBhodYkerVgpz/GTJCPMKYQTIN+gqwIiNPHcNb2QhL4hA+/9Lyp3MySZ3W/+uirz6IyfjsPA87tebaFR/4DjK/ScKVc+UPccMUMck4TIYxxNEfhN5uf1HqHYMgYTmBSlz44M7zedkZkeHhqAooHkN2gC8L7016X3ndkOGiqnOykonQddhoUGdptijzPz2LNxMQlkfHLtllGzEcxG3RGBw+E8M2bvOC+Jzcv0o41WNduxPzX5t317VTx6wUNuRd+t1r6IxANJai0CJglWVYuz0HwEJ390q5yVFtSmtTjrTxv6RbupRMTLRcmuoj/vJFUsuqxL5zeY/mlJr99cLm44SzLZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2616005)(38070700005)(82960400001)(8936002)(186003)(26005)(38100700002)(5660300002)(122000001)(2906002)(6512007)(316002)(508600001)(6506007)(76116006)(53546011)(66446008)(31696002)(8676002)(71200400001)(54906003)(66946007)(64756008)(66556008)(91956017)(4326008)(6916009)(6486002)(66476007)(31686004)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?vL6XNnTgbjihYQIJZPKz8w1+aP7Lg03gH3TegkLyuxLA6Sexd1yIqtTg?=
 =?Windows-1252?Q?gWACaXLggkdQud4tozDXAVau8slDu3GGehe4/YTjz6Gy+PCOVj+R7DAC?=
 =?Windows-1252?Q?OxUYyxjvc7anS4LsInO3EFu//RZ+ALroRTyKapW/Phgt/5libMrOUv58?=
 =?Windows-1252?Q?RoDS7NeRjyjjdzMALXw1+/n9BhvR3xSAQISqf32Y+XZCIqgGKDsC/azB?=
 =?Windows-1252?Q?d/a3D4MXE2agqjvYOL62GkBJS86XpK6QRDKm4p3QtNmSL2dNTq4idda6?=
 =?Windows-1252?Q?We2E2kfoAjBDGG+C6NNdISLeCXQHvFO0PRWnNOkvrIYdcHgY+CHpV8GN?=
 =?Windows-1252?Q?Xyr37YhRb2+pHDIJ8A/0TQCT6tOkZjHBH4LY7gLhibR1NtCtnFnl2Ohg?=
 =?Windows-1252?Q?8xORyVpF42m8+QzRLtXd3kUMKrZou2CzkbZA31l5/rMMuexHJ4yc52ZE?=
 =?Windows-1252?Q?uV8iQt+G/Rhu0cmLRbQj9H/b4OEHGehAtRrwQO/UyuomR86fIBPWNfVZ?=
 =?Windows-1252?Q?1Sf8VQieM15xU70iQehiycLgdeAuxurKZPvW24PBsFSUbRNivGOVN7/3?=
 =?Windows-1252?Q?f2gWhaAkGy2sFOnihNdmCz9SXs2aWCFo53na2GAAok2b0bzUQR+N1ES6?=
 =?Windows-1252?Q?rF9alnXncrQ2nk1EHwfj/BLxjwt+gg0NY0o/NX3Kfk6NCAiMf0X62WfJ?=
 =?Windows-1252?Q?7HpB+otp3G/vTJtPmmtba64P3FsVJbJTTTH86rJQAsJk44Po8z0tkceH?=
 =?Windows-1252?Q?JFor5gXrh9FL08TaIV1NoHKrZAZwgkWITPb5BRTauyHMk0ppdpfss/oV?=
 =?Windows-1252?Q?W/GoSV/DrBuWoMvu20iqhllZZCo+gibnrbea/25B/l3hM3i7ASSzTGSG?=
 =?Windows-1252?Q?7jZQt9xkUKcMPvHsXFYTpX/JsVtH3gmjkizwbAQRg6c66SpDCO2CYJcJ?=
 =?Windows-1252?Q?ZCpah0kZ7SIpgoREPR0bk8jnx2YvDznhaluH3vFtLMEZRBgcRYsdVmYR?=
 =?Windows-1252?Q?UWXjW4xf2GdTvMFHIX3o1tj1qTrsm3O6FRy/4tEjQ5TMMI7iYNE1Gryy?=
 =?Windows-1252?Q?tVnvRE8jz+FRQTyHPGkzEs9RWzUgWeH62lAc140+M/up6MJ0x6m1KvXM?=
 =?Windows-1252?Q?cyXO1E3Gqo6rWd5AIcb2CZHwV5PFiq4ckc9nSbxI3mg7v2YartAOIfVU?=
 =?Windows-1252?Q?fCHuyg/EGgn6KpNQAZtjRhLTEGKlhBBUqaZwBXxSPmVAYj6xc9al2oPr?=
 =?Windows-1252?Q?Pt5rym5Tr2DzQ675xo5EltzlJGUlSgP6yAHVWyxHw6PO/b8Ep2nNpRqY?=
 =?Windows-1252?Q?RavJ9JsOK7A5v8yjeS3mGYbPRMFc6l1hc1wYaNcWRti4XVaPK1KqTEJi?=
 =?Windows-1252?Q?2lEV+2X4il8GW7L4fdttXq8iZx+qk780O+w+nnwR3QGesSb1aXw+NQfS?=
 =?Windows-1252?Q?WlUnKZ6aN4hOCwT0LKzUfY5PUFgeZJVFwIDqYvNQ4+PuAZsjg+/zImoe?=
 =?Windows-1252?Q?3sach34ahYn1Ia004SKAmOL/hjld0j9U4hWOeR9GvCz3Z1JLBmfOToP1?=
 =?Windows-1252?Q?ZNnM00i/qQ3PQgxdG0BbeRYX1IeJBFWALhDSpeySLb/uB3JwaFbn4RUH?=
 =?Windows-1252?Q?A7Tsg54XI2YyACVRtYPe56l/EatI2oNO/O6cs55UzcGNacwkiceOFPNn?=
 =?Windows-1252?Q?cP7a1glnrw1Cr4rcJzg+d0YXZB5hppcZ8BB83wyUMP7yDIjgsT/wXeVi?=
 =?Windows-1252?Q?wrDzJ4Xmx6pDBxRqTkYNDNUrwJJS1+shTxCjNjWoKpe/PTd7BV0whYap?=
 =?Windows-1252?Q?YYfbtKH6s89e028mLA8JCIVgT2GosdIjdkbAHpHNxzaqJmRzagDj7qeM?=
 =?Windows-1252?Q?Kf/5xq8nSZxDPw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <962C73FABED8E84BAB03B3DBA0C7EA5E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094a6851-57e6-47cd-c166-08da22dbcc0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 14:41:04.1810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7X3aMhYeQ+cF0ty4wXtc2iuahiF3jrMZbQsMgdvju1YVSsC/rsC+kFWhCliXAWAJgt89tYor/ju6h0V/xytVFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 4/20/22 12:13 PM, Jason Gunthorpe wrote:
> On Wed, Apr 20, 2022 at 08:04:31AM +0000, Wang, Zhi A wrote:
>> Hi folks:
>>
>> Here is the PR of gvt-next.
>>
>> Mostly it includes the patch bundle of GVT-g re-factor patches for adapt=
ing the GVT-g with the
>> new MDEV interfaces:
>>
>> - Separating the MMIO table from GVT-g. (Zhi)
>> - GVT-g re-factor. (Christoph)
>> - GVT-g mdev API cleanup. (Jason)
>> - GVT-g trace/makefile cleanup. (Jani)
>>
>> Thanks so much for making this happen.
>>
>> This PR has been tested as following and no problem shows up:
>>
>> $dim update-branches
>> $dim apply-pull drm-intel-next < this_email.eml
>>
>> The following changes since commit b39d2c6202426b560641e5800c5523851b5db=
586:
>>
>>   drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flus=
h (2022-04-13 17:20:49 +0300)
>=20
> ??
>=20
> Why did you rebase this again? It needs to be on a rc release tag as
> you had in your github, not whatever this is.
>=20
Hi Jason:

Here is what I understand, the pull going to the drm-intel-next needs to be=
 based on drm-intel-next from the branch gvt-next. The pull going to the VF=
IO needs to be based on -rc, the topic/for-christoph brnach. So I did a mer=
ge from topic/for-christoph to my gvt-next branch and sent this pull, so th=
at our QA can test these bundle on the gvt-staging branch.

Sorry this is way too complicated to me. Let me prepare the new pull as wha=
t you ask. Shall I send the exact same pull to i915 and VFIO ?

Thanks,
Zhi.

> Jason
>=20

