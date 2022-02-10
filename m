Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8064B0A55
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Feb 2022 11:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DB210E7AF;
	Thu, 10 Feb 2022 10:14:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803710E79E;
 Thu, 10 Feb 2022 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644488079; x=1676024079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kJvGzRLF4VfX3Rxz0EVLg0q9Wz7fR1yBq3lGyNdWjz4=;
 b=MhqWciCnmYi86BjRKyOhEpvMZuwxEqA969PW7M2Tw7fAECWQq32XvoPp
 z/Jsc553q6cNMGJTiDpbn40WwM+GK4neoZX1iGSosF2myvwN86FV2TfEF
 zg+yoiE6KaqN6RDedNwrwXF49NdRao/0dZ5qJbj7NLdPR3nFQwISZW1YJ
 Js4VuiRiDd/3uCpsjZ5REQVB43mBWnX6qty79ilhlkcbfO40HqCgWgVq4
 xULrH/HbSkPO8UsJW/osUtBdIyjf39nbDTeyHF2y8xEeJGewFFm1ix0zh
 9oi1ZO8gdx9km1RWBaymfDuU3fJrciVLBC4JLU0XxJ3+K+5jYb8eQDedB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="335874227"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="335874227"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="679097881"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2022 02:14:38 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 10 Feb 2022 02:14:38 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 10 Feb 2022 02:14:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 10 Feb 2022 02:14:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 10 Feb 2022 02:14:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJckP/L8iGfR2tQiMw4R3y2/St5mjx+PaxO3vOKE3EPnFf+aQ0ycnwpeeSsmBBsJJ1QvmCqemSq9QGADCszT3bbDEjbyaoCaNcq2oP/YK/h08FkBPNiEw+ehMYs8dSnkzmfMYz1CUTf1SAzlEqOGXy6FZ0kVHhO3uu30NYIgFbqvrVHw5NmldA59DcbgjIXi8TedW4ehi+tIxjM7FuefXY7PNHJG4Ejj2bUPTWzL5Srz9MHyJmwszM/NKxUKwJUULYh7ofL9WFM7OFGcmhd8ZmTS2DlRhy7K6Qz3s5a8OKzihtzlLtkzXQJxFIvC3s9Ba4eThxWYSXro0A0DifNhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtA6YDChMPWbYEb9s2/SrmAuueT6zokUPgd/me5+syE=;
 b=d2P6q+kTqckzs9i47C2vEOGgMpiz0ftCaxH72mH0QUPgYf0LCkwNfgGIB90Gm72JOmTwrkC7nm66TOplgXFv5T4IS83ef/2/c9W42Z3M1JlUfDBcI/+n+nNYqyTLQEVr5p0FYJ0Da89hIdJvmYmXF8/gIrcr4SXxVzPFebbtmlbcqOphg8cdKHhy/2rmVzmaS+/KV8o6cTirBcIYCaJkKqJzsfKPaYv/JCIFJNw63z62d1Lr35/gBQ4iguy01RWWAqS01p+gFFrnG61PVXRa7h1rNCE49G4mXEk6eWfFAViIpcys4w0KMpqYeINPX7AyuguXYMNw/7rDtNAhQGn+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM8PR11MB5685.namprd11.prod.outlook.com (2603:10b6:8:20::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Thu, 10 Feb 2022 10:14:30 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34%7]) with mapi id 15.20.4975.015; Thu, 10 Feb 2022
 10:14:30 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Subject: Re: [GVT PULL] gvt-fixes for drm-intel-fixes
Thread-Topic: [GVT PULL] gvt-fixes for drm-intel-fixes
Thread-Index: AQHYCf0mJ2s4LZZM2U+PUpTHCr4gQqyLgT2ggAEhpYCAABcfAA==
Date: Thu, 10 Feb 2022 10:14:30 +0000
Message-ID: <2aab060f-a7a5-04c1-03c4-2c401f4088d1@intel.com>
References: <1f619581-e3da-3899-09ac-f714d954a580@gmail.com>
 <DM4PR11MB5549FFC6FF4AA53549199770CA2E9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <87mtiz85pa.fsf@intel.com>
In-Reply-To: <87mtiz85pa.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2f8822c-c47a-4a21-632e-08d9ec7e20c2
x-ms-traffictypediagnostic: DM8PR11MB5685:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM8PR11MB56855BDCA47C7003967F6B5BCA2F9@DM8PR11MB5685.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9h921F1hqBgtlvYZVIh3tXjHJkOUOTYXReAkEr4NpAycrOTjmn4+ZmaoYpeFhjzxaFXH13/QiDw5KdpAI6ln+AcTj88cuhuffkHGqqcbjtc3o8TglYoVLXv+vWi0A/4edol8lLqBxb8+Hw69LWcdYgRtewg1ymFZKJxGtvho9676RmNHkFiniSra6iIzSZAjq1lifh1lAfzme1Z9HGYV9roXd0Kd9V7kx45oKtMIjzv5EacwgjSQJMCKK9PTd3uzYRGI+CDwYc/RY3WByJWtnruop6aeF8JATPp1hVp5hXsv+lmuUSDOK2VMazcq7mi54NfHVc/Cw9li/O5Wyl7KNI6VvjHoPF2KIK7L0WVklW5/XizLiHPIQqDNUTef12vYd3i+jifBtUyTK2HfiQsPQbPdi83px74cxEaoZakJ0h0OL/Y/8ApyuVl/21l+JeTe7E9HoWW/m5OCDMPtrzW0pvcMVJJzGj3zSZ09EkoYfgLqVs3XKzfgQ9Qx8B/U7e8w3tFAUnMoqYCuCD0NpJFoVnUk7HEbxDJ/nwRxT3S3Ysr+qPJ5h6COzX+bUKPec2H+hcSRPvOdmv3/P2Mc/sXdZaRPi54dmJgaa2XhT9MYpcAcyYaV0+j+iH2bwNX/7o9JNGrKh5ypQbP/3ppNLFFr4heAc3yWk5G2sPVGZumi2lsRbvyv2SuTX+ZgX32325yfRA8lE4wmbQrG/bbV3q9sG40Jn6sGFRuDDYCxd2T/Jw0CoY14KjbLGFxX6eO/fHUBScKx62bl48BJlUOK388oddwBUiNkVayYTZZmAtdSIbwl5D/iGKbZzQu/841Cxb73M4u68dcC8vfZM+LYqi3fjRjDnaVwi4YGySmE8hf+pVY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(5660300002)(6486002)(966005)(2906002)(36756003)(31686004)(83380400001)(508600001)(4001150100001)(38070700005)(66476007)(66556008)(6506007)(316002)(6636002)(38100700002)(110136005)(6512007)(86362001)(31696002)(186003)(122000001)(26005)(66446008)(64756008)(2616005)(91956017)(54906003)(82960400001)(53546011)(4326008)(66946007)(8676002)(71200400001)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?NEC6PW1QyfKnauovrYobGWGY62LLrms4d0nNnIQ+frBS6FiC9zXcRV7Q?=
 =?Windows-1252?Q?CxNDowCMPOaKCW119Fg0mStNUp+pZR3xUjgNauVU6eA7K9eQeTsQDiQe?=
 =?Windows-1252?Q?bopPdR+GRs9WJLKrTL3pvUZ2IhLgW0gw6WYNqavd+yNPmq332uh02L0I?=
 =?Windows-1252?Q?gL9UfGKim4vFYIb0ObjsGoguRKpgeNhxDByzJZoeGyBwjtPC50vmy6bh?=
 =?Windows-1252?Q?c7Pb0OfP36dsm8OeKIVePceTw8X9OWokP3PQ8nfyt3a9V6ZCiIH/pJ3M?=
 =?Windows-1252?Q?un8nVtB1Sxot9qrJoSCZ1JqoioEorxe6l/MGQW3h2ZeQXp7cGj/PWFUI?=
 =?Windows-1252?Q?0jAByYQqbbLi056mNCR5kZezBWTmBrSDOmKpMZML3cX0ioGmPUPyb63i?=
 =?Windows-1252?Q?I8c1TuZfPU9W8zNQFGinA80hrxIDbQPmw3RvG9s1kdAEcpHQdc1pgm+2?=
 =?Windows-1252?Q?1sx+pnUviBiNb/+BwRwjtLKUSCAxbNHkDPoBLklrXHJzMQiI/37LdauF?=
 =?Windows-1252?Q?AfRFY3BlMnzWBfOIjIUdPukZHn8QbHWOc3VT481YHBl4ghegxbynJWHz?=
 =?Windows-1252?Q?b7/BrYQHOIC8iiBMWQhoIB8HKA4TjqcycrPJEEj6cWw1FptK+DLSLmVI?=
 =?Windows-1252?Q?rkOYeuIMfgdDQthe3Wco8DLjUb76Pqv+X+srYA/FayvioX1dHVe/sQlm?=
 =?Windows-1252?Q?oXsSBZinnklqoIH5vsJ02nkQfJw0jmcZrm28lsHMcsbtBaLvwhHfbH6B?=
 =?Windows-1252?Q?OqUaGjBnjAf8fvmCDKA0xoHU1awWpJo2nfr+z3iU7kLPIwUUrm/LQRlU?=
 =?Windows-1252?Q?Z/U2AnqrzE07VDugwdZ1ZWt+G06VOejvTkhHEyHUSmtjrCGAGkGLr+Ap?=
 =?Windows-1252?Q?N8b1Vk+OKs2hIxyJL125MylOME4whRQlmjvs83MQDFmuhmNxJefOKVCj?=
 =?Windows-1252?Q?7O4NUGV+IZrHKkUY2mt2fc5Je6HHzCdxHO4LeejJUTyWWnIbGHTqx7Pf?=
 =?Windows-1252?Q?FhIJrshhzt4qwsLV5ND0dfsEaPLS/gS8nV157/qFaKDl7os0RXYws19/?=
 =?Windows-1252?Q?GMnmBvlppY/oV/HuPZV3d12Pe6BdmAi9H7D7kRMuzd24JMCmShXHmeps?=
 =?Windows-1252?Q?2psDj6ppBhLRBhPtbo5pusOL6RDi/8O0ENMFU9HX3fiZJxe2Q96dNyvM?=
 =?Windows-1252?Q?IPOppdHara1ts7U/eqTZHR3QaJIU344m/1GKwxRPz5bEkULNnM3D4ZPD?=
 =?Windows-1252?Q?X9RolmAFCj8gMOeBEeABd92X1TXfN1vOy7i4XH36z3btv+owWLW3dj3T?=
 =?Windows-1252?Q?zKArh1L+y+Oe4nVixJ1fmR3y4hg9T6st587yz06YRMOn81+yOayR+mFP?=
 =?Windows-1252?Q?CbwOd7zell9hS629OBz5QNeWY7ZKnuD/6UTExD0tZFjS/lonne1YZiiq?=
 =?Windows-1252?Q?DHqYsnqRQ+FKRK4dcHTGz3U7kayueie+Tjv6xi4okiQRnKrlkRWM9bwz?=
 =?Windows-1252?Q?hJXRtTfRyvjuHhSSzGwQU7sGu0521jg+1m8AGy5WPphYTNIeqS5ZXWVZ?=
 =?Windows-1252?Q?2iheJknnAjD+ESqa+zB3jRkI1lDrikHfRY8Uw8Vc/j4xEJ6bVIoc20Vc?=
 =?Windows-1252?Q?QdBPLB2Dcec+GsGIpG2ubAYNa5jgjwJh3iW06VQhRlH3q2CtIAHBBtAo?=
 =?Windows-1252?Q?Y22RakuDHpb0wR4FIkw5DjzVbV2V/ahEHEVV0vmGOv5dp6m9D7196FSj?=
 =?Windows-1252?Q?n30Lh8+P8WNQBWesYBw=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C086021D84C29943AAB2765D79565440@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f8822c-c47a-4a21-632e-08d9ec7e20c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 10:14:30.8499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLh1aFeHRCaNmKaHwsY3ZosbCLoqat07Z+XmctnocfvdDZeHaW+f0MY+rl1lKNW5tlohMuMgWW5zhlcCrcLx5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5685
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

Feel free to let me know if I need to re-base on the newest tag since it ha=
s been quite some time.

On 2/10/22 8:51 AM, Jani Nikula wrote:
>=20
> +Tvrtko
>=20
> On Wed, 09 Feb 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>> Hi folks:
>>
>> Ping. This pull seems not got merged.
>>
>> Thanks,
>> Zhi.
>>
>> -----Original Message-----
>> From: Zhi Wang <zhi.wang.linux@gmail.com>=20
>> Sent: Saturday, January 15, 2022 12:46 PM
>> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; jani.nikula@linux.intel.com;=
 joonas.lahtinen@linux.intel.com
>> Cc: intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org=
; Wang, Zhi A <zhi.a.wang@intel.com>
>> Subject: [GVT PULL] gvt-fixes for drm-intel-fixes
>>
>> Hi folks:
>>
>> Here is the gvt-fixes pull for drm-intel-fixes. It contains:
>>
>> - Make DRM_I915_GVT depend on X86 (Siva Mullati)
>> - Clean kernel doc in gtt.c (Randy Dunlap)
>>
>> This pull has been tested by: dim apply-pull drm-intel-fixes < this_emai=
l.eml
>>
>> Zhi.
>>
>> The following changes since commit d46f329a3f6048e04736e86cb13c880645048=
792:
>>
>>   drm/i915: Increment composite fence seqno (2021-12-27 11:33:40 +0200)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-01-13
>>
>> for you to fetch changes up to d72d69abfdb6e0375981cfdda8eb45143f12c77d:
>>
>>   drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +00=
00)
>>
>> ----------------------------------------------------------------
>> gvt-fixes-2022-01-13
>>
>> - Make DRM_I915_GVT depend on X86 (Siva Mullati)
>> - Clean kernel doc in gtt.c (Randy Dunlap)
>>
>> ----------------------------------------------------------------
>> Randy Dunlap (1):
>>       drm/i915/gvt: clean up kernel-doc in gtt.c
>>
>> Siva Mullati (1):
>>       drm/i915/gvt: Make DRM_I915_GVT depend on X86
>>
>>  drivers/gpu/drm/i915/Kconfig   | 1 +
>>  drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20

