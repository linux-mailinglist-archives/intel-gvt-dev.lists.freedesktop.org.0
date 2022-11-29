Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2A63BEB5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 12:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837DD10E3AB;
	Tue, 29 Nov 2022 11:16:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90610E3AB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669720577; x=1701256577;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iamkDt4OHOmh2uRwbivfPp3jO9cZLaa5+VqQ7rE1Utc=;
 b=TddTQij1ICEA7kT2XFrmm7lIa8wYd32r3qlJHoaVSvRjNbs3I/7yLReA
 TkOu4pXCIgzcf+R38hg4aMkJfLLUenKJe/+xbDiPv9AUpyL+W9qxy4N2y
 hbJsoqTOUvT/y+uwYWRTz7Z7FUBjbP+wC+sLKVM4OTQsTP9WfqNZd+MNC
 wVxLB5bmU88pqQy1Cp0rtex3FfgYjuCdf2tyfSmdyFujLGVdEmue1LGOz
 xvihEm8PlQA9IS+9QBs/NvqZ1pDKUsW3Igx99lddY2vN5NbCMRnlL8FYC
 FRBY6nSRune8Lo+V1358koG0cZYKlUlP3hL3bryrVgNJ5CKgJnI60/ofZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="315114903"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="315114903"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 03:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="888809860"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="888809860"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2022 03:15:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 03:15:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 03:15:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 03:15:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 03:15:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjU7tIzVVgRT6yhYqwwFlvuc3miUTQQD0fa7VXBu0zR382wKyKYVpXxth6YNILPwvNQqPWIxALaHwtowYCqYRP4eRC5gzMi4A9hH3S1/cB9zgYtNsB5U/BDXBTBsTK963g0SkdfxQdODB8VgAoPdz43YOdbMRYDIwkevSs1kAE7gSvcdfsOxuxMP3NnXD5hHYmG2kSq84uLY6AZxxJp+Ogre8hODNMoLx0u+pw7h4hk5EJjA/XS60yy7V1N1EApvnMvs1erbuv+1Ym30fbzpU5Mccbyk9dXHeha6y8pmlJR8sWQb0Iitz/2V6IP1HJfB0HhfcpslM0/GTUV3rRaFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgYCe7MqjgL7C3kpuxuzsIGqXWI+O4dbQZ9WaKvIRW4=;
 b=fxqE9F+vq5gignDfHfv1urhuGPl/M1kpgALF1f5nv3XFh9lVX9+9a22xJ5OdHP9gIeJ87va3n7poiZnXSNTO0SwiY7Eh/9O7m7a0ora2y0XfGqcWqhEswtN9myJpKknP5K+3FpQGIA2RljhO/6wR6lssh4tCQULuMPs27exkJVHWtzGL3oFbRwxSuXlPeokWTtvRdyqZP1+jgRNDYvyLcSinxYN3mNR5mhWBbtLe85fsR2tzXoL3T1RqIdhGllxM5dQQbnqTZmG1oANp2vMFML2UxkdRqC70GDbgcSSHQRLGzN/sHfXx5NGOPOk6m+gDuiM6N3QwdXG+OQGUxNSUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2684.namprd11.prod.outlook.com (2603:10b6:5:c7::18) by
 SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 11:15:49 +0000
Received: from DM6PR11MB2684.namprd11.prod.outlook.com
 ([fe80::8494:3561:ee6e:1be3]) by DM6PR11MB2684.namprd11.prod.outlook.com
 ([fe80::8494:3561:ee6e:1be3%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 11:15:49 +0000
From: "He, Yu" <yu.he@intel.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: GVT-g KVM potential regression with 6.1.0-rc5
Thread-Topic: GVT-g KVM potential regression with 6.1.0-rc5
Thread-Index: AdkD443iCAPuErIeR6WEykCV93tJmg==
Date: Tue, 29 Nov 2022 11:15:49 +0000
Message-ID: <DM6PR11MB268425F4CECDE45ED07AE302E0129@DM6PR11MB2684.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2684:EE_|SN7PR11MB6995:EE_
x-ms-office365-filtering-correlation-id: b6e321c1-4a45-442c-ebe6-08dad1fb11d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cG5wFXaXN41XLOGNOSCisVWgYpwUq3HObUQ+xwSYMg3UZgLsC8IHGcTO/DoFnYxOr4MjVUe6SX5oANee5aLCJnezhSYmjwFzTSM//70biYlmKgk+aVhK6U4F7mZ0TrR9dbxUp/cKycsFPG4bgjugHyr/P4aMd4Ayy0xnHzD+T+PLPlB8cBfJdCiirUKzXQtsZM74rMVHFoTC7X9PthO+UH2+21g3prjOxJoxgoGf7eUGTfC710HqfOnhiik0AceZ/QaHKxXgGqCLsB/QHWSVzGyd/BozP5XLrb8VcTnLEIhbaknL4VrfaJMfCE/z/pDT+MXwCbzw0vurd7NKlCO0Wp77cDytrQ+NGAN5nB8r6eEwwj6AehxYlCnxhWUsTSGHNOAydxsP4lekGiaIM3albkxLfCGy0EyBz47AI3gigQXSNivS0eiKEAOfdqKmnQo+7Wl3SqRnuEjsVoQiYHKIzXDqcNMy0/LUB5Bq4bdXnkCjL+DC9nmAFvygn1RDnHsYaBdVc+5ELmRoJ7HIxMiQRYAubf0+y+4M24vSlTyA/P+y3K4VaC4Li5IWWaaQLdl9EbcEWQm4UqaNuVG2oINrRbnhkMH1Aa+zJAhUAiXwdfF5XC+eRxFKl78iM7Zq9kmYlvq648xzYkwGChL57OQLKWqLfzsd1Ix9WV6tpZh3mSGXOOAymqCEzu1a1MJxh++6v2tH2BOCi0+KiRdi40P47w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199015)(186003)(41300700001)(478600001)(38070700005)(52536014)(54906003)(6916009)(122000001)(82960400001)(38100700002)(7696005)(6506007)(316002)(107886003)(26005)(33656002)(71200400001)(55016003)(9686003)(66946007)(86362001)(66476007)(4326008)(66556008)(8676002)(64756008)(66446008)(8936002)(76116006)(5660300002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EwWKNJZTDUX2j9vKnrEoJ71vygaxPquk6WzMWelhF2gAUCQ49vm2PkeNbb3i?=
 =?us-ascii?Q?uQXzNMCsrHG0zUbbj/iKsYqeWwSMktOIhc9NjzE1QEdtNNgzRl+/aNGhH/F7?=
 =?us-ascii?Q?lbzaMHp5CU2YRE1mTe87GDikzVlVRgAhJU+DIfKoRCrabuKsfTfD/JEAJL4J?=
 =?us-ascii?Q?SUcnpXo/i9izMzJ02JCeDWaz11oLNW9SounLc6AxYT1z1TNTIo/xdu3RCkdn?=
 =?us-ascii?Q?OdKLZdmIPdFBQLX16J0C4hXJ3nyUIVLpwGOW+XfBWCojyj2Up5P3wYAlCNsR?=
 =?us-ascii?Q?xccS4gYaoRTwbRf6j7lVhkVX34G5GOHk/BQ6hVRXoBtxThLMSs6YrQ5lTzG0?=
 =?us-ascii?Q?Olr6eCd8QUFVmT5Aj0Xv8OjknBHx0Azy2Rc3T48PG2X1cCWWcOIGFdF8Mvj2?=
 =?us-ascii?Q?OUMf1qurohfbJo+KIBTNsv0rCGjdpOLemZw38kH2MTTpFfVJtwOPQMRLLVys?=
 =?us-ascii?Q?nQw3Keu5iEva9wmU1tuznL72cTEAGAxZNOgzX6ZoC1ux9HFxA7rFqmOIXco8?=
 =?us-ascii?Q?Ter4Ui1tal7znkMiPB91TC/CRcR5tg6m6zRF2qpTIdKrous3T/c3BQkkycjE?=
 =?us-ascii?Q?NGpQ2dAMacg7pVyCO3mSIme4BGWsfu4RwasUQ5Qe5KByUGIf3JMAz/fRDLLg?=
 =?us-ascii?Q?IL5fePP2kHgiddwtsOM3wQS+k+sfESvxrZs5Coy8X1N0nrmPYvqScKbhb4ZT?=
 =?us-ascii?Q?nX/61WGN1iHH5qF2uJhOYrY6+LGaIih1LeD6GLLlD8Ybb27yUgKTbTj7sEYh?=
 =?us-ascii?Q?R03QnaPPMBHGYQQBOgEZGQkK3pITBlBzZng+RkPIjJxIfVb5tL2d9OcB5pQD?=
 =?us-ascii?Q?7hJPWxtqx8C+WVQJv4TfK1YpxL85+0qgtn5xrTzg9rI8aQqAGabr9qy6NFjO?=
 =?us-ascii?Q?NpLAewsMQzMKSzv/gCGWln5cgD9CH9WsjtVHGgmitcHp45cJA5GBExhoATXr?=
 =?us-ascii?Q?BZlTKYxZfth27no+PW5Rgx4oB59SG+edktzboywgPTc1e2m3rY8raaQO9irY?=
 =?us-ascii?Q?hRhmBkuHpb4cgrqnterOwXD/P/FQotDY2ZU8x+AZ3x6ky59WtXeMlUJ7tK+F?=
 =?us-ascii?Q?Ilb80ufuul5J+zCoSPrOth9XrDjESYy9m5+z/m7fmQnssMCjA1oOcXw60shv?=
 =?us-ascii?Q?lVUk0bddleLINvnK0oTxdeaw2iEnTQhPvE2tf7N1Zh0ztE0k8Q5D8dNSPvki?=
 =?us-ascii?Q?hE6MPqf9/uSIN9Hv0q2GHaev0rTKSeHUl8I5xLsKzPbQrF7lpTM2ifZwk5sY?=
 =?us-ascii?Q?69IaQhwbOL5wYPhpwkedeZ4ijnSmJvS1gBTyDF3aDkpi0bZRXfTQzq5kHOTu?=
 =?us-ascii?Q?OtBDzpYp/1z1Ygvs1Uz0uxJIN6JjaNgOkbSazpv/qKXeil49h45I4J74y6Wp?=
 =?us-ascii?Q?WTBLyn5UsJp2YGCBYNMou+CSaEVE6I37VJHbylW0fFNVHYl+v+iICa0PBpcA?=
 =?us-ascii?Q?lOrpIND7aObP8OQ19s4G715QyC1oUleCUniIr0PCSnVmpOR3AEbZqmfCZeOb?=
 =?us-ascii?Q?W4iYOe0X5YL4BkAp8SLvhgffCVUACNsA7XnXBW58er3ajlfR5QPNxDsvyWxO?=
 =?us-ascii?Q?ZsJiHLkc5mLqpxLYLTg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e321c1-4a45-442c-ebe6-08dad1fb11d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 11:15:49.2156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZW2VuTCaRjL6Nap0zIgBKt8a2VWySsyrfyfvi8i9aEYg1lTW1j4t87FK7wZWo82M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>, "Zou, Terry" <terry.zou@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "Jin, Gordon" <gordon.jin@intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi GVT Folks,

I recently encountered a blank display issue when testing GVT-g on Intel iG=
FX.=20
Below are my tests.

Kernels I used:
#1 37c9e6e4 -> Jason Gunthorpe's vfio iommufd compat based on 6.1.0-rc3
#2 77f7ccbc -> Jason Gunthorpe's vfio iommufd compat based on 6.1.0-rc3
                newer version compared with #1
#3 57f62422 -> Jason Gunthorpe's vfio iommufd compat (77f7ccbc) + 6.1.0-rc5=
 merge
#4 Jason Gunthorpe's vfio iommufd compat + 6.1.0-rc6 merge


Results I got:

- For #1&2 , display was normal after testing finished
- For #3, blank screen after 2D cairo running
- For #4, display was normal during/after testing, but met blank screen onc=
e in 24hrs after testing finished (display could recover when restarting gd=
m3 which not worked with rc5). For a double check, I re-tested the whole ca=
ses but the blank display issue didn't reproduce in another 15 hrs.

I checked with Jason Gunthorpe offline, the vfio diff between #2 and #3 is =
not likely to result in the blank display. So highly suspect it is a regres=
sion in gvt or i915.


Logs of VM when display was blank:

[   14.361137] [drm] Initialized i915 1.6.0 20201103 for 0000:00:03.0 on mi=
nor 0
[   14.388315] fbcon: i915drmfb (fb0) is primary device
[   24.595849] i915 0000:00:03.0: [drm] *ERROR* flip_done timed out
[   24.595856] i915 0000:00:03.0: [drm] *ERROR* [CRTC:51:pipe A] commit wai=
t timed out
[   24.617269] Console: switching to colour frame buffer device 240x75
[   24.639108] i915 0000:00:03.0: [drm] fb0: i915drmfb frame buffer device
[   27.606771] rfkill: input handler disabled
[115345.696470] gdm3[650]: segfault at 0 ip 00007f3310708494 sp 00007ffcfc1=
8e9a8 error 4 in libglib-2.0.so.0.6400.2[7f33106e4000+84000] likely on CPU =
2 (core 2, socket 0)
[115345.696500] Code: f8 5b 5d c3 66 90 f3 0f 1e fa 48 83 ec 08 e8 a3 cf fd=
 ff 85 c0 0f 94 c0 48 83 c4 08 0f b6 c0 c3 66 0f 1f 44 00 00 f3 0f 1e fa <0=
f> be 07 41 b8 05 15 00 00 84 c0 74 1d 0f 1f 80 00 00 00 00 44 89
[115345.696582] gsd-keyboard[1088]: segfault at 0 ip 00007fc70eed6494 sp 00=
007ffdc623c1b8 error 4 in libglib-2.0.so.0.6400.2[7fc70eeb2000+84000] likel=
y on CPU 2 (core 2, socket 0)
[115345.696597] Code: f8 5b 5d c3 66 90 f3 0f 1e fa 48 83 ec 08 e8 a3 cf fd=
 ff 85 c0 0f 94 c0 48 83 c4 08 0f b6 c0 c3 66 0f 1f 44 00 00 f3 0f 1e fa <0=
f> be 07 41 b8 05 15 00 00 84 c0 74 1d 0f 1f 80 00 00 00 00 44 89
[115345.698706] gdm-session-wor[661]: segfault at 0 ip 00007f9990c4e494 sp =
00007ffc50aae428 error 4 in libglib-2.0.so.0.6400.2[7f9990c2a000+84000] lik=
ely on CPU 1 (core 1, socket 0)
[115345.698716] Code: f8 5b 5d c3 66 90 f3 0f 1e fa 48 83 ec 08 e8 a3 cf fd=
 ff 85 c0 0f 94 c0 48 83 c4 08 0f b6 c0 c3 66 0f 1f 44 00 00 f3 0f 1e fa <0=
f> be 07 41 b8 05 15 00 00 84 c0 74 1d 0f 1f 80 00 00 00 00 44 89
[115346.878394] rfkill: input handler enabled
[115348.518884] rfkill: input handler disabled
[115500.612521] SGI XFS with ACLs, security attributes, realtime, quota, no=
 debug enabled
[115500.621449] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[115500.632789] ntfs: driver 2.1.32 [Flags: R/O MODULE].
[115500.648481] QNX4 filesystem 0.2.3 registered.


Best regards,
He,Yu

