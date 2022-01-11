Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3E48B527
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 19:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A030B10E173;
	Tue, 11 Jan 2022 18:06:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010110E173;
 Tue, 11 Jan 2022 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641924365; x=1673460365;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=JdkSEr+n/5R0qyh0gwqrxsAhBRyELvYssWP3saqFyF8=;
 b=hdDiLOEk6qMfnZtDPkY3Ma4JfV+HBM6dWKRNMM+TnYUvdVrww5y8g+AC
 lCTXjvRsz59pTr7D9Ps1ZWkoZi6nCRvF2RhxIiJvMF9MWJRoNMpeZxdn8
 MBxnHzBHFCoxvIWqLWOOLcPFBJHIeih2CAdYHHoCRdbdRsVBWAi276VzD
 VhSYxqnvX3tsS8AbLEzkp0wBixN9d2ROlfZXyhFK33eVWp1+oXkbkPJ5h
 rEhjW73Cm5nvrqTuANGqeL6jkJaB06Vu3NH14yB42pm4H/zy5IiLnw3yE
 ndmA8JB6oD1O9T7VnasBcX2JBxanjrgoCrnbR2GkNXZ1xhMAvmIb9na1G Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243752769"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243752769"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 10:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="613297445"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2022 10:05:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 10:05:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 10:05:26 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 10:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJEWlPAvjjFMEaU55CSw8uNcmvfj+xr2dSdMTcdNpNMTm1EcsxS9vGCfadTnsNdjH1a8foul7pcagjXLvzhS6l4iQt4SBYiOz23vxru1XqBKxuyhMuxQOeY4u7hTs8T+LgOHoNra8KMqXZASJ+4k5x0HkHnoav5UlLXytVT/rTX1Le4rAHTVrv78dOqS3mUrip1VHPqjp0Ke51sd+e9D9VP+BL01W3QMCz9//vt4GCx2mww9Tmgl3m1SLxD+XYirmz71FTE8xOxCaHRD+Ijjn8ofQukDNYkJash6JBifTzl2AiIQPJamjIwIT4nwBzbM49fDVxwkTgb++6NYu1BxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbeizP9RNwIY6DHkmvYbvCAqDKf2tFhiAok5taStBG8=;
 b=ZaCmhKo0rIqsRt7IDiOKtfxskuZgBAt67NJlbrkRzQpP77TwAjQm34cY2xqnZDdq+W+URGuvysHJYVI3jmQKc1goABUo2lU928wZaJpahIgOxR9cVXmxsQUTRF7iinc+eJ0GXUrigt3yghHcgAGfzKACG9kxQIV/+XvtLeIkC7PycNJOpJ4PNbEDC6LeCl1ioL/8zvbAYDlxrZxr0YBwRmWgx339yFu2X5cSM+++gX2sFf4UCSsMNVSpNCGaSPsK8p/xvLhvUeThDmgwdpZ5j1nm1DOHzqG1hrCkCSZn2fVjkuc2sj4RS8RJBDaycvyDrIiiTZcPGeNVKu+Ax8306A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BN9PR11MB5516.namprd11.prod.outlook.com (2603:10b6:408:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 18:05:23 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47%9]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 18:05:23 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: [GIT PULL RESEND] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL RESEND] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYBxXNa/ci7FhBnkm8mnAVQxI8ug==
Date: Tue, 11 Jan 2022 18:05:23 +0000
Message-ID: <9fda7db9-dff9-e416-7188-4891cfad87ae@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ccede7e-de6c-4316-1247-08d9d52cf00e
x-ms-traffictypediagnostic: BN9PR11MB5516:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5516E558FFA351D8E1D876E6CA519@BN9PR11MB5516.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9nHocsM7GqNAZ/TGuCJuVIQhUccjkRjumzvWfgxpybqWOgMZgma5+2WluLLNecrKC5/3G9adO6qXhhvfe/TkVNhSDE/W39VfridL5BRBhinz7xROMcg37ipT2Jsj4QpXg+Op0VeOF69YroPiuWuYfY0rp1blgCXzRlUGUtQfdqxjbU9Av0C/2JVQPUMtdKJW2p8hsqBQV/gRfn335rx967cyhK+3WrQ7fuLpyw0M8V1f7UW9Pvp0CpdCH72ranN3qU3EZftoES03MCCkQivK7IZs2Dd+hHCYgbXPfbMg/rmzwsXeVSdKf07aCik8XIT6bPkjQt1DVyOi0JPp864GlGhFoocaw1KUbAA84io+wFcKnYWTcY1j/Ml2aGE+MRaD9Muw76tPUSqUD78YQ+oVb7t67oRNSCUN0DCUWy/7jw7p5ERpQx15pgcSiY9pUjJxJgbtnqY/uVvxRU3EUxIAPbM3oopi++qiFL5d0DFWvjtkoxgkdnVNtM85xpioFikbFdXwWcF6Lxy2GqjrZ8/ZBg4nNNia37cScL+yQC900j8X/bngiFRAZCVAR8BBYQWgxG/srjtwcGV199irRnbg8GEQFX2YRZy12ze/7MlP6m2qHMHxyrDfBhZ88Pb8uB7Ada2KyXrup8t2ag1asuO90JSCCkB1rcAfNrfC6+qoh85m7KbEQroZpnWz8chXkcp9mDr/gP6mn6A/w7c+Yodbq854VXHwQ1rv25HdokE5TtPd16BZM0wqij6wtfCberuja2QLKgo71Ugu8CRK2zLzKt7zdNnFbx5YMItOw55fj7L+uqIH0glSP1EBe1qdRDQBSxi410ZlQKlF/sPyj7s06acujX0VhpLatvxsq5ZXc50=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(31696002)(508600001)(64756008)(66556008)(66946007)(83380400001)(6486002)(966005)(316002)(66476007)(186003)(2616005)(91956017)(5660300002)(4001150100001)(76116006)(38070700005)(31686004)(86362001)(66446008)(71200400001)(122000001)(2906002)(4326008)(8676002)(6512007)(6506007)(110136005)(38100700002)(26005)(8936002)(54906003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?y0/5X1MbBUZ+lH2Q875LPJSmzjHr5hzeMHwGu4Pcuu7LJPngB1rVNF+T?=
 =?Windows-1252?Q?lFVEyxzBnAQX98ycPpj2Qvm5qAUHjTN20NN3gLU4I6mvgZorsxZwPZgN?=
 =?Windows-1252?Q?F9IxeV1NYJpr9EBpPBoU5+ZoAPl5KnDTFf01W6K83yOSvkKFVxNFgZeX?=
 =?Windows-1252?Q?8E7mTLac6wWcTEI53YOK+ogMXcSTvkN4TTrGppymUhX7bJ62UUzwOWJG?=
 =?Windows-1252?Q?gOVyEcYxosnwMgZJUCxxkLyCGOs1wA+kvq8iJ5bS3UKYZuY0DeCIwXlV?=
 =?Windows-1252?Q?hKDjzsg/42H5AD1L9G53NmEaQmYTZR5icyj8XSauzKU9CsNBWxtOPJiT?=
 =?Windows-1252?Q?9GW4J9H3txLF062/qsIA3/0Q181tfS+GPOoruznBzNI7t2yLCri85VEY?=
 =?Windows-1252?Q?e2nSyWx5goDfcZbeYRkPGYA9pGN3AdyshRtwOg/2QNq/YY9d+NlAnQpb?=
 =?Windows-1252?Q?ng1bIP/x0Lo1yuQ7xeAo4NXlP9sviDRSmhBQ05hv2jZvZowQXH1RMH6R?=
 =?Windows-1252?Q?1tsrKVlT1SDQhuG/Xn7vsR48RVpNj2IucD7mMHK2Ky3m4IRPdSmW1C5X?=
 =?Windows-1252?Q?kcur5WmF7aFx8sazZS9tSY1u5fvrVG8xV3czfQQElVt0hXUXVvPrz7Ga?=
 =?Windows-1252?Q?AqomyPVKj2zykPGYp4YcvvETir+0+2jpchafyeCm4s2idqdg0ZVVwGeY?=
 =?Windows-1252?Q?fv3S796r500mfMMPeFokC2Y+WONBTkwpq/dow3QKz2Hrn2ZCz6xm8Xxe?=
 =?Windows-1252?Q?h4BRcYjsNnkgvpL4G4im2LjG8R6mK4bSP4pyxPseqypmIWWF7CjzlLGD?=
 =?Windows-1252?Q?S8en1uf9azCVsKOTtbMNoR+esLQ4i1hS0CzUvt++BOxADB83PFEojiIL?=
 =?Windows-1252?Q?j/jo9ID87P3IOvREQwIBPiMI7gszKpHXITOsZA/271I4FouchId5AkFq?=
 =?Windows-1252?Q?X+Fb0/5i2GZgPYHhwf+9Nq1KfRamOIeHYud5ij5RiSyrpSV4VZNUi4A2?=
 =?Windows-1252?Q?4zeRAiXIbNCzMjHUZDIIUpD0e8EKrCf2X7jvFv05GOie2ySuiWhnnI6W?=
 =?Windows-1252?Q?6c/SDf6Zt/Ah2angzHrE0VBqbMXJMMmEfvOtNG87TQYUlv/Hhv3Fw3qe?=
 =?Windows-1252?Q?MwXUWDr8NZ6nOOcT7m84HJiRvCyKAM7cS/G2wNaMtf//8V0Fl34JbEiR?=
 =?Windows-1252?Q?THQzfTyMIPp0M7Wi96cFXgrbQi/mZ/yG1/9FFRnvSKVsia030s2h9g4h?=
 =?Windows-1252?Q?UIJS1/G9TxxUG9vyPu3AGdvHq3RL9msi6sij543eM1xNfsZtg4w9FIAm?=
 =?Windows-1252?Q?Vh/acwo5XtvABFzOL3tavfmuyKPjgQbm5boO2g+I1yq+VbHwPezNikUA?=
 =?Windows-1252?Q?+v+ofqNoLb902Bu6AxDuZNmhhAtF8EovXILd6u+FVW96+FyCQSwlDOJI?=
 =?Windows-1252?Q?rx11mugnimQ6Y32hBTJJYbgD6LS1asjX1rBVq1kUnIJL0ii1FpO5R3mj?=
 =?Windows-1252?Q?6Qw7M5lEzqn1IyJcsZIpfuZ0pE5F/FevQ1cIpNAuRHmRe6ibEHmWWmUQ?=
 =?Windows-1252?Q?ayxHYElkGvsv9I2X6ndE0Dd80wQgJdYO/Qp1+IReoxtamtnF3s+4i3IG?=
 =?Windows-1252?Q?O9DehNYhZOFXMOjU7RKzAckdfIlbynumWH7Xf67vZEavIGXKRYN42l9v?=
 =?Windows-1252?Q?s0ESNH0JE2JHI7mTfR3qavHKleyr4lOIPLK4OX4rZ9UrQzV1WClfD1hb?=
 =?Windows-1252?Q?7v08DeoHYyGxyCBBsZA=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <97AB22CA9C0B6840BEF95E551EB78E2C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccede7e-de6c-4316-1247-08d9d52cf00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 18:05:23.0804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XlQn1am4t9CLIHboeAiuuxDVU+XjJ09BnjMLrbKotMFZMadwrAtcv0/CcQb+mqFamy0eeUasW8WyyjD/cEJJaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5516
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

Hi folks:

Happy holidays! This pull mostly contains the code re-factors patches from =
Guenter Roeck and Rikard. Also a minor change from Zhenyu.

v3:

- Merge drm-intel-next-2021-12-14 into gvt-next

v2:

- Fix the problem of message body encoding in Thunderbird.

The following changes since commit 96db14432d979532be4cb6d5d52a127317e68b3f=
:

  drm/i915: Fix implicit use of struct pci_dev (2021-12-14 10:38:29 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-01-11

for you to fetch changes up to 5786a889b2c7a8374d5f843f7499db88cd09823b:

  drm/i915/gvt: Constify vgpu_types (2022-01-11 10:51:11 -0500)

----------------------------------------------------------------
Guenter Roeck (1):
      drm/i915/gvt: Use list_entry to access list members

Rikard Falkeborn (9):
      drm/i915/gvt: Constify intel_gvt_gtt_gma_ops
      drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
      drm/i915/gvt: Constify intel_gvt_irq_ops
      drm/i915/gvt: Constify intel_gvt_sched_policy_ops
      drm/i915/gvt: Constify gvt_mmio_block
      drm/i915/gvt: Constify cmd_interrupt_events
      drm/i915/gvt: Constify formats
      drm/i915/gvt: Constify gtt_type_table_entry
      drm/i915/gvt: Constify vgpu_types

Zhenyu Wang (1):
      drm/i915/gvt: Fix cmd parser error for Passmark9

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c       | 18 +++++-------------
 drivers/gpu/drm/i915/gvt/fb_decoder.c   | 24 ++++++++++++------------
 drivers/gpu/drm/i915/gvt/gtt.c          | 68 +++++++++++++++++++++++++++++=
+++++----------------------------------
 drivers/gpu/drm/i915/gvt/gtt.h          |  4 ++--
 drivers/gpu/drm/i915/gvt/gvt.h          |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c     | 13 +++++++------
 drivers/gpu/drm/i915/gvt/interrupt.c    | 10 +++++-----
 drivers/gpu/drm/i915/gvt/interrupt.h    |  2 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c         |  4 ++--
 12 files changed, 72 insertions(+), 79 deletions(-)
