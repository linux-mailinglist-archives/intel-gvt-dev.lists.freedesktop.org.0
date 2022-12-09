Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D26647E48
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Dec 2022 08:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9B10E0C7;
	Fri,  9 Dec 2022 07:08:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F5D10E0C7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Dec 2022 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670569706; x=1702105706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m+xp3iYsAHudlkZ+Csq1wQ4toDaCdv6SA6uo5bd9eUs=;
 b=RZpc4dmLyqudA8xEuQJd+syUvRyDVJjj9JwLmtL2eKcJpoxhMdEk6nin
 1G6UU2uhCjVjoZZrpZ5yty1rvDD7qwZddjLdsbWTblIUvA6BRpWzkmXIc
 2IoNiJI0wZhLWOpuw1D9rFjAyMIjN04qra+xViEYSstAuQ18dGYrakScm
 0632iY7RvG6J6eiA7WYHuL3mfU8AZn5RM79ya1Pi6eORSz5EMW8hbk4Tc
 LK4pYtVsns/broL6tRZt0ERNJhWyQQiIJyRN3mF1+parWYmT9cdQyfgt1
 ND+Pz1OlknPtRfIXSkeEMMbfX0JyqIqC+VGg5WQczJdNlB6wA0p+Ez6w3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="379610488"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="379610488"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 23:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="771774752"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="771774752"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 08 Dec 2022 23:08:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 23:08:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 23:08:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 8 Dec 2022 23:08:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 8 Dec 2022 23:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbP3/BcJLOAMzzbknOyGq0j1NvseQ+eL2eytAhkiTiu+eAn3uw6Jd95V0W18vYE7T+1YLQ+SNjC0XfC+SuKc6txe26wOTLpUhBFH7Ms049orYQIz+yKfau7aFx8bP/36EcLW9PLmUH2z1ffzfLI/WpZeg1MzzsK5OFNWzPW3ctKz2839WgVYPc0O9LixOPXOkVbyww1njD5ydw2dsZlVwCcau9z/WXHU9fu9DCBLg1WM7GrVRSYRuuoWnbDpBAtc9XvtF7Cg73E16kQDzq+Tfh2Ye1Dw23NUThr2j3NXnXxW9zOieOcZnEEg3PmOQqIUVvGXgJXefli9xtez2qdHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RacuW7vTZjwtFJfXsn4Xjfo4V8BIHDbOSXwk9R9H8d0=;
 b=PQ1xy47vBSZFY+2h91gmhWCkeGytwnj2/vNEiAE5g6nBclfUR42f5T39DQ+uFgcQJXmEirwJ6bguItIfJV8IsKnuIdh36irWmpBW82846ecg6nVh9KelgG3Mdqm+C3Lvh2LdUbbMm08JJJaNmWTJ4jgKbAzRkLIpdyDepanPcEnWSNhNF/MYRHqZHrRQI5n3oFbSE+PU+vrkuMJUuSf272AbP690AO1bTxAaMyB5pw/yfWGeerJkFtfXKuISWRjkzJpzYKYwlzazoRcHZt9ciXM7E1d2zbwESLqP/X1ZkuYO2CyL0uqklOymaVOltNqq9JUqMGsA8hDem2CGXi1JNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 07:08:23 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::8db4:2bd7:1f20:1ff1]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::8db4:2bd7:1f20:1ff1%9]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 07:08:23 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: fix gvt debugfs destroy
Thread-Topic: [PATCH] drm/i915/gvt: fix gvt debugfs destroy
Thread-Index: AQHZCu8pKtPoJvCMCE6WoyDYf7f/lq5lI+/w
Date: Fri, 9 Dec 2022 07:08:22 +0000
Message-ID: <CH0PR11MB5538B0BB4180DE6FE93EFBE0CA1C9@CH0PR11MB5538.namprd11.prod.outlook.com>
References: <20221208103329.733843-1-zhenyuw@linux.intel.com>
In-Reply-To: <20221208103329.733843-1-zhenyuw@linux.intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5538:EE_|SA2PR11MB4812:EE_
x-ms-office365-filtering-correlation-id: 34048e9f-44d8-478d-6e8e-08dad9b428e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5mL5PjKKVw/fR1M9IYdRaIioT3kpFrHFCREYM9SPovAqDYCcGWRl5IIYbTc3D8uxOs8lxkqDPAyLFZR5H4RCfsN3YpR3+oQFNkD0ZgLVwd3rxI+l/mdHzi6iorUqNuaGExcnpSWRer9QPBDW2iSFZF/ZQPsMGjeejEoqRPhAvEBxGo6IsZfayyKB7kzqCFniG4icVazmZUTlUyOPbSd5hwazIZne3BjnsL3V9E98Nb2e06RW1gpX4dcbeoKb5GCUU1M8Z417kKA6ImazNyVUOM1IGlKBYRZyuZlSk5ZB4TbI1VTndt41ZTUQASH5JfeCK/mePTTiFoVEZf6oL4ySxz9GvcHakkMcOpdcS2+6fGxg5Yh5T1OV4yqk0td8bDDpAuH/fSyWRYEu1CfeX8FGigf2ijGCJMz6Pob05/2TrnE9SgWeB/e/NUp4EMWYcmtgIgUK1tSp3KfEoZHemCLtuBR3Nk8AQOrXcxGb2cU/PcPIC40X65AQtcFDzw/7hqvh3fi7e7EFdID97YYCqfaAHQqgNTujW6fzo/FI9HGUmVpeHzpTYgzUOpV5iTFNRCgI7Up6HJvT2YR3O6fzJzROHGn2J5NwnZO0Qf/54xzizvdZf2v1bHwBXEnGdjUgO5pzPm6QFymwgv9n0yMNQlOenC3BVyFjvWTvJeivA3+f7Uyp/TrDGG+itmAblQXHQHUDGQsvc98Hzzo2RXIfawzraw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199015)(186003)(9686003)(26005)(5660300002)(83380400001)(2906002)(53546011)(7696005)(6506007)(38100700002)(8936002)(82960400001)(86362001)(122000001)(71200400001)(52536014)(478600001)(55016003)(316002)(66946007)(66446008)(8676002)(33656002)(4326008)(66556008)(64756008)(66476007)(76116006)(38070700005)(41300700001)(110136005)(54906003)(45080400002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tfzz0LginVYnmvA9iAIgZ42U8LmG5IIsyCtvunF5TCx1F3nxQ+eHI28tEwwW?=
 =?us-ascii?Q?CCBP1WVEjrEHOwb8+Vjf2PrIEgB8ryubE2SaqGoakhJi6J3JZu2uzaFP3Gx4?=
 =?us-ascii?Q?uKBNT+e+RgmX3z/gboPOGZmL5bxasmRdBIBnx/NmAcZO3jEraOjTiE8NHLBU?=
 =?us-ascii?Q?GGJXrBXqAbfXB+vJDYz/uSJupGvV3tW97eIwL0vUMxf/sCdcl03ifxl0AJC9?=
 =?us-ascii?Q?2gTgMJcNjErwZ5fOcKDsOmo/yrVcDvgwU7NHwmypT4C4IhRTVoAg4ZJzv7Qk?=
 =?us-ascii?Q?jfJKuzucf6p8HgDS3gSyWG1axgAOYEQY1dJ8KOlTO2VZdO/sHVfUT4kWGu2C?=
 =?us-ascii?Q?cVuyBQQ2UZUnmvsDaucQlDw3IhrQYjnrRDocbAeUq3hZl6HeZEE7oHeCPdMk?=
 =?us-ascii?Q?gxCteBsTJjPYcadI4CUbqiR0LFwFzYGJ4i/FMErg/KLHCeezuqHOLkxLEstY?=
 =?us-ascii?Q?qZ9wfi6WgetMXNr4MmPi++m/+SIJRGiIGNQTu15q8nF/CdR9wVCGgHkOA665?=
 =?us-ascii?Q?rnawmTuNyq1tpU2mAduoG/MQu92xOeCKslRAclKCPbNWH6iWDjYpPL+gN+Ki?=
 =?us-ascii?Q?s9Usr4e3EeSaMUmszwx6fYrKBMPWj++xIXye0vhiTUTcSJIfTMiwOsqJ/97R?=
 =?us-ascii?Q?udpSem9sv0RD+TqJVR9f/XqMYmT1uiqRd9DGHHxCxbBFDuMug1HS3+jeAZlF?=
 =?us-ascii?Q?mHAZGTK3h8Nb/PQimkuufkUrKDoLy2cowh9O5vG9ehQCrO6arQ8ffA3JwMOE?=
 =?us-ascii?Q?Zcs6ZFd+S9XXF6KptRbHapti4GscoKjSAUfndZqMOxO4FIdv/bBSGH8amV+P?=
 =?us-ascii?Q?6vOJvpdVw3OdftW7v+V/x64PsOHQxTH0TS5UrRFFg5Cz8IGJbqH24HSGiqYc?=
 =?us-ascii?Q?G3SQ78mChA7dNW6zJwGwPTKhfqMg22MZoU9/FLd+8nK8gjBnIHxlDQ1wk1HW?=
 =?us-ascii?Q?b8N0fmVDjsStBuuVux2ttAmo6CZceZG0t/vqvyMWhIYbRRskWlqUjwNpYCDC?=
 =?us-ascii?Q?mXc/TGwIo/v0vK/KSOkXXYuGbpgCX4b6T5MzQBcj+1SRXHWRkymXJVLNj5tv?=
 =?us-ascii?Q?r/PhFaC4kbuE2su8T7lY266Vv3rv88Itq01IOISCwUoam9C20DSlbdzNu8j/?=
 =?us-ascii?Q?hHA8vYpIlonB0pjfGaZYJjmvekTQFAYQXFtLfG47XEF2KzeTXCxZSmqoXer5?=
 =?us-ascii?Q?ZFC+TMMQB4OZjyAmger5/ceLbzmBF4La8mVztakcbIYkMaE60nwSTt6B9i/k?=
 =?us-ascii?Q?Wcdk9XPmXilARKQJJb4eveMX1uVi8gfT/i5piVCKFrhJSryuazZa4AmEPD0i?=
 =?us-ascii?Q?MW3GbDgmHfD4wkdjr/ki3vc7ty6Bq5YaqXCM+GU03xS1AtEXo9eXNS8P742s?=
 =?us-ascii?Q?+FyAmV7AxhWMDZ1aqkRZoCFClK30yB6nQLPTDOeGj8Sh0c3WrcLpIHBSnVvN?=
 =?us-ascii?Q?sy4ZB/hc48Pq7X3f9RQPDM0HM2Rz3HJosNP44rQcgm4Mvz7P41r8EML1f/WJ?=
 =?us-ascii?Q?l9NEC4S/TwD65u/5JECLqGzc9GcQO5td+7y9epAhX6YghNqrvQlo3E9QYbhI?=
 =?us-ascii?Q?GZ1TPEC29r871JTMULvo18B8PAApZr6ZDT1H4jcy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34048e9f-44d8-478d-6e8e-08dad9b428e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 07:08:22.8990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MgEX54eINkjtCUPooXSxYU+FOzgp0JLJMPM8VSkZctwfTtXrtp1q2FNYNGvb7XwWo9tE8d1sE/XzZ4f7w8l4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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
Cc: "He, Yu" <yu.he@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>

-----Original Message-----
From: Zhenyu Wang <zhenyuw@linux.intel.com>=20
Sent: Thursday, December 8, 2022 12:33 PM
To: intel-gvt-dev@lists.freedesktop.org
Cc: Wang; Wang, Zhi A <zhi.a.wang@intel.com>; He; He, Yu <yu.he@intel.com>
Subject: [PATCH] drm/i915/gvt: fix gvt debugfs destroy

When gvt debug fs is destroyed, need to have a sane check if drm minor's de=
bugfs root is still available or not, otherwise in case like device remove =
through unbinding, drm minor's debugfs directory has already been removed, =
then intel_gvt_debugfs_clean() would act upon dangling pointer like below o=
ops.

[   48.067618] i915 0000:00:02.0: Direct firmware load for i915/gvt/vid_0x8=
086_did_0x1926_rid_0x0a.golden_hw_state failed with error -2
[   48.070156] i915 0000:00:02.0: MDEV: Registered
[   52.966222] Console: switching to colour dummy device 80x25
[   53.403599] i915 0000:00:02.0: MDEV: Unregistering
[   53.403730] BUG: kernel NULL pointer dereference, address: 0000000000000=
0a0
[   53.403735] #PF: supervisor write access in kernel mode
[   53.403738] #PF: error_code(0x0002) - not-present page
[   53.403740] PGD 0 P4D 0
[   53.403744] Oops: 0002 [#1] PREEMPT SMP PTI
[   53.403749] CPU: 2 PID: 2486 Comm: gfx-unbind.sh Tainted: G          I  =
      6.1.0-rc8+ #15
[   53.403754] Hardware name: Dell Inc. XPS 13 9350/0JXC1H, BIOS 1.13.0 02/=
10/2020
[   53.403756] RIP: 0010:down_write+0x1f/0x90
[   53.403763] Code: 1d ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 53 48 =
89 fb e8 62 c0 ff ff bf 01 00 00 00 e8 28 5e 31 ff 31 c0 ba 01 00 00 00 <f0=
> 48 0f b1 13 75 33 65 48 8b 04 25 c0 bd 01 00 48 89 43 08 bf 01
[   53.403767] RSP: 0018:ffff9eb3036ffcc8 EFLAGS: 00010246
[   53.403771] RAX: 0000000000000000 RBX: 00000000000000a0 RCX: ffffff81000=
00000
[   53.403774] RDX: 0000000000000001 RSI: 0000000000000064 RDI: ffffffffa48=
787a8
[   53.403776] RBP: ffff9eb3036ffd30 R08: ffffeb1fc45a0608 R09: ffffeb1fc45=
a05c0
[   53.403779] R10: 0000000000000002 R11: 0000000000000000 R12: 00000000000=
00000
[   53.403781] R13: ffff91acc33fa328 R14: ffff91acc033f080 R15: ffff91acced=
533e0
[   53.403784] FS:  00007f6947bba740(0000) GS:ffff91ae36d00000(0000) knlGS:=
0000000000000000
[   53.403788] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   53.403791] CR2: 00000000000000a0 CR3: 00000001133a2002 CR4: 00000000003=
706e0
[   53.403794] Call Trace:
[   53.403797]  <TASK>
[   53.403800]  simple_recursive_removal+0x9f/0x2a0
[   53.403808]  ? start_creating.part.0+0x120/0x120
[   53.403815]  ? _raw_spin_lock+0x13/0x40
[   53.403820]  debugfs_remove+0x40/0x60
[   53.403826]  intel_gvt_debugfs_clean+0x15/0x30 [kvmgt]
[   53.403848]  intel_gvt_clean_device+0x49/0xe0 [kvmgt]
[   53.403871]  intel_gvt_driver_remove+0x2f/0xb0
[   53.403876]  i915_driver_remove+0xa4/0xf0
[   53.403882]  i915_pci_remove+0x1a/0x30
[   53.403886]  pci_device_remove+0x33/0xa0
[   53.403892]  device_release_driver_internal+0x1b2/0x230
[   53.403897]  unbind_store+0xe0/0x110
[   53.403903]  kernfs_fop_write_iter+0x11b/0x1f0
[   53.403909]  vfs_write+0x203/0x3d0
[   53.403917]  ksys_write+0x63/0xe0
[   53.403923]  do_syscall_64+0x37/0x90
[   53.403928]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   53.403933] RIP: 0033:0x7f6947cb5190
[   53.403938] Code: 40 00 48 8b 15 71 9c 0d 00 f7 d8 64 89 02 48 c7 c0 ff =
ff ff ff eb b7 0f 1f 00 80 3d 51 24 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
[   53.403942] RSP: 002b:00007ffcbac45a28 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000001
[   53.403946] RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007f6947c=
b5190
[   53.403949] RDX: 000000000000000d RSI: 0000555e35c866a0 RDI: 00000000000=
00001
[   53.403951] RBP: 0000555e35c866a0 R08: 0000000000000002 R09: 0000555e358=
cb97c
[   53.403954] R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000=
00001
[   53.403956] R13: 000000000000000d R14: 0000000000000000 R15: 0000555e358=
cb8e0
[   53.403962]  </TASK>
[   53.403963] Modules linked in: kvmgt
[   53.403968] CR2: 00000000000000a0
[   53.403971] ---[ end trace 0000000000000000 ]---

Cc: Wang, Zhi <zhi.a.wang@intel.com>
Cc: He, Yu <yu.he@intel.com>
Fixes: bc7b0be316ae ("drm/i915/gvt: Add basic debugfs infrastructure")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/=
debugfs.c
index dfef822fdae0..e64d97e44716 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -216,6 +216,10 @@ void intel_gvt_debugfs_init(struct intel_gvt *gvt)
  */
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt)  {
-	debugfs_remove_recursive(gvt->debugfs_root);
-	gvt->debugfs_root =3D NULL;
+	struct drm_minor *minor =3D gvt->gt->i915->drm.primary;
+
+	if (minor->debugfs_root) {
+		debugfs_remove_recursive(gvt->debugfs_root);
+		gvt->debugfs_root =3D NULL;
+	}
 }
--
2.38.1

