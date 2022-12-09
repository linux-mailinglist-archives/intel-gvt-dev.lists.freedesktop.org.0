Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B981E647EDD
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Dec 2022 09:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7771B10E502;
	Fri,  9 Dec 2022 08:01:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A610E4F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Dec 2022 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670572854; x=1702108854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CL/dQbiA6zr8EgOsDUkvphAIrWRgR17C7+TZMqiPN4c=;
 b=D9sxL4D4NoxSoTHGNmQVYQCzFepdbMPPdY8t0eWRmxjwOGjStm54rfrV
 HzQSk8fnev5YSNHdXzeNqlk2YNSIAHL+nsNlcY0p5xiXHIsEFHOrmVYPX
 2cAt3lGPRwBPDxINxqlllqoyxOaxlbz9AO4amP/ptbL0rPQMKnl7rltls
 FK2xqd6btnneLezdhu3mbQLWpgOMkdss+u17Q9LSxL6/0h0URSq15T6y3
 UotUPd9a3aVgsbdTS9o/qE19B7ewyuo2xDnCH2KsK1N+qt+/rS4bolVGR
 H0BZOJNww/wunDExSf/nFe6ZGAod1JPw0FDODH/JssO/LKToNNvBW+MYw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="403661768"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="403661768"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 00:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="771787609"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="771787609"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 09 Dec 2022 00:00:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 9 Dec 2022 00:00:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 9 Dec 2022 00:00:50 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 9 Dec 2022 00:00:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8bR1tU58T1VSz4qEPLo0ZUozpI37VZV1CvL91XYSOITuXvDluDPXUmhyVVg1Yz5coL3odOJLS1Oph1hgeFgVOlcxcxChQ7NQIkUXHvbHWWH2rlC2V42/Dp0bcnuepRPlmUzcwNCc1KmalATzV8Naf80MsNO/IS7tCrS0ja1QPU2HTMuQfxwUyd+A2zKSbH/rVnsdZf9b+Ud8OdsOFh0qF2WdIwFpnlYpDPFpU2EVV5MzY70OnQyjmtGGf7I54KW0n38I2PvyyjVZYoW+v+D+F2L9PR1oNp7LhGsufpSN8ZtIXBEVEYcP5gl5+DbwejiNJHV4cJ2o630rBv00VZJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlVGLU9HNY6B6c5rrGt09jLqSPXBe4WDxkITqQ+EV5o=;
 b=RFudWRZfi5NMs7TY0oHCRulxRDi3H3Dov85JOYmy6/IDvR2W6FamD7qz+jGzwMC2frrEKKIuyqbOlMKSE+GIBPonVpAq7L1qkbnzOuFvLziprCsvdUejN4HU4kyxSqmGYxDUf0BIw0q2kHX919iPBao8OCXRdE/EE8soEe4zinUtijJRgxyeu8vq7s+Y9nLByX9kxXxmRx8Y71gPS07Yxq5BIYyUiSKONk4GFkMCiByb4lYTQb43LBwo649JGmhTHKCHI4TVWnkd+Av7NUWgai2QuwYQANTdq5m1dnGOQ5efGFWPCH2bCauYDHeZGQTve+JKnhTFqLQ9I5bp5fmExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2684.namprd11.prod.outlook.com (2603:10b6:5:c7::18) by
 SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Fri, 9 Dec 2022 08:00:48 +0000
Received: from DM6PR11MB2684.namprd11.prod.outlook.com
 ([fe80::6fd8:7a37:ba4:58c9]) by DM6PR11MB2684.namprd11.prod.outlook.com
 ([fe80::6fd8:7a37:ba4:58c9%7]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 08:00:48 +0000
From: "He, Yu" <yu.he@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: fix vgpu debugfs clean in remove
Thread-Topic: [PATCH] drm/i915/gvt: fix vgpu debugfs clean in remove
Thread-Index: AQHZCvUv47gvsk19MUGnRf0zitQ1P65lMBtg
Date: Fri, 9 Dec 2022 08:00:47 +0000
Message-ID: <DM6PR11MB2684A0681F8A47EF6A8E36A7E01C9@DM6PR11MB2684.namprd11.prod.outlook.com>
References: <20221208111634.734185-1-zhenyuw@linux.intel.com>
In-Reply-To: <20221208111634.734185-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2684:EE_|SA1PR11MB6758:EE_
x-ms-office365-filtering-correlation-id: e6d04161-b18e-43d9-7e8b-08dad9bb7b61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZGaDQoVhJo1NAtRXg7XV7Jo68oYJPbrpP/T/0/XTWkYc7Pg5BrSa2FRuVTYhzlEcnGMKnRD8fUPq8AJj7SEmsjngulS4ZDPf7xsHBdGBp7yn+lmmaw1s+8j9yv9zITY336Djkbx599gUUSBgrKGlTM31BkOobb3btK+ZYOYQWp/CZ8EHXqGUTk5FONJ/k801+FbPKf44jNdTjvCTXSgtrxLqbVkzDihsWLhZg8ElGiMb2TMIx7TAlQ21afzYPKa9zjerY4TbzGvFP+jZrhiskF6nwaVuabNYnlmxVOllOgycC994KpUPPUb8NyBWcHwg778KHzUTAXSyKWkUu2uzx/1MLvBZGZskhQbNIJgUOTNfzgleOhVbpfMKQVF4fxAWd3FlVhlCBPdiPjtGdhE8AALC3XLo9nfZ6En7TVYJqAZD+r2ZfXdYLaAQwfj88UHQRIe0x1AM+PYQilzb0pciIF2uaNzNHvlrtkgIlpRqaYWbrBd8PeODeIMhRGKiGVN8cEBjDi3muChRYE+QD/qInoncZ5frdM1pTPCPdGANrq4UMHFqMSi4D4t6Ld+Sc0GlouuxQL7KBsuw3o4aD9cxPjtSJTQYXuWq8nq27lBvVgaXnU+vurRkmQTh+3lLakpiDIB5EvilEDG+Uf0syKbjZ5NB/JRZcu7Jv9x0j3eFBhK4ZYopa7MigQgWjYSt8Wfgb52BiZGNaRBAr+Q2hirUSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(41300700001)(66556008)(66946007)(186003)(76116006)(66446008)(66476007)(478600001)(52536014)(26005)(9686003)(5660300002)(38070700005)(8936002)(316002)(4326008)(7696005)(6506007)(53546011)(55016003)(2906002)(122000001)(71200400001)(8676002)(64756008)(86362001)(33656002)(45080400002)(82960400001)(38100700002)(54906003)(110136005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bvV2E226z7phLWsb1MvC9/chpOAvFDzjr6A9c/E0zB7CLtfbh/VrjN1rcpj1?=
 =?us-ascii?Q?b2RPOAztEp8yahY2/5MJ/uo5oeXaapgoaQ3fa1X7Utm7tIyWSZ/OfMKLWjg4?=
 =?us-ascii?Q?48lPJhvgVYIKuWQiip6clbQ9e/BpRxeHMz0V8/dyyR+RsZIGG5xyQQ8Tn9lE?=
 =?us-ascii?Q?094lUcpqgIePCvn8QUJcD4s+G+tYzxecHZ8xqHru+VJu6GOl0ogPmtQk5Nwu?=
 =?us-ascii?Q?K3igADIO8BeLIjx3jaGsq2v8lbnbFdjOCoaos8zQL4zaezxAwiBllqIT+J1z?=
 =?us-ascii?Q?AErtMiVIlEhwoP8AQHhL4VTEPqIEiP5nKQ5hAR+qz1Rc5m9t5XamPSLztt4t?=
 =?us-ascii?Q?1lrbZtgLuKhHxsVGfQb5cE7y0dQNRdeUVcQNPRUMWwjUgtjaGnhp9R3kiOS7?=
 =?us-ascii?Q?tqbuBUqm0PExF6dXCg598eAshNFOiWJ15u8SiJl4xZX3G31Af/24brMfeFA+?=
 =?us-ascii?Q?HqTf3pDv1WrXG/v3Ih0BYtd+SJFHSqz7nwb0f7e5JaZnWCK1Oxmed1KzPyMq?=
 =?us-ascii?Q?Htz8GDDOj3mU1LN/5k0u61VlrWkiKljGGCedL1CUwQp1BR/bJ4bNYV6q3EQQ?=
 =?us-ascii?Q?mtjb1Cfch622sHxzUBJ9DnvttC3O4Au+lf+SPNPBDcnba3B5M1SUeTT5Ks8s?=
 =?us-ascii?Q?ujWcv9UcEwjc0HjqHOG5zZalkgjILQjNItvbmXbAkOC67VqAyt/HzY9kyLx4?=
 =?us-ascii?Q?nl56jDT27J/wI0X0qJyekLsEgZvvTTnbKlRC9SZLoUbyreGo1fpI5MJ2VwwB?=
 =?us-ascii?Q?sfujdf9lt1nPt7tUCic/rRvIHJ0C9VNK39PKXJxqSUtSnlCia1H7oRvwsEFH?=
 =?us-ascii?Q?y+5UlAw7oFN8OCDmeQ+g3JgJdwjtTvZCzKwNCLe0M9sxi+AC22gTZFFPdmHZ?=
 =?us-ascii?Q?U2BG2x6nnts/8Vmi2UqfZ8sdJgX3h0LyS4k9D1HVKjwvCMxoH/24EP+mASbf?=
 =?us-ascii?Q?qcDLnlBjqUHboT8rloFDKcGpr/+FjDvVTiAL1mioo1zFa7TZLQNb3ePenPaH?=
 =?us-ascii?Q?Le4nfQ4VA2S450Fk7f9a6qTwT3wThF33Xf1tbpE8d61g+Oq8JeUom9C1bWDO?=
 =?us-ascii?Q?TMKl0tiYkGIFtKBaqVcL8TS2zO84g8WBAzGDj25nIsQ8QOgoufmiZe3OdXfE?=
 =?us-ascii?Q?1ES5DEHsmipzjvVPN41Og+bj3mmdKxMpaiQ6xiz8l+peClUBvHeYkl8ux8KT?=
 =?us-ascii?Q?RH8OyVyjXe53GpS1S5aDcya2p9urfaUvPsWl41JmNtJxiHYtgMbuutxG3ZXT?=
 =?us-ascii?Q?5d2BujZsPiq83mM0oPg3cDPHJtdoaeIfxZF8bYuDNkpVEYcrkWe4jrWJlu7k?=
 =?us-ascii?Q?W1ddtbFvPdQ4ex4qJ/X6WdVgJSxDcfRlPUNqw8rk5EHeavim30jgSxHqVdsY?=
 =?us-ascii?Q?g/jsq2dzlFcTVA891GIB8aCB3KKlodN5m/or/Lz3HN/3iNTzXK7UNne9saVS?=
 =?us-ascii?Q?FbMMeD5cHEvSVHjybo76y6TvmWywH1pVl259BloO7BLo5L5tb0vJWf8/9WCD?=
 =?us-ascii?Q?DbJ7jY2YcEw/Ka5OtQse00rHfHKrywrcBOlnb1AswbVvH1IP6hKGAo55mnKT?=
 =?us-ascii?Q?1SL4Sh1p3Uj1KSjQlho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d04161-b18e-43d9-7e8b-08dad9bb7b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 08:00:47.7976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DE2xFykxjJdm+cxq32ZbZ9Gq1I2pt/Zox08o4XauEkypQ7doOrIkSrHjEjQ5UPT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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
Cc: Alex Williamson <alex.williamson@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2022/12/9 16:00, He, Yu wrote:=20
> Check carefully on root debugfs available when destroying vgpu, e.g in re=
move
> case drm minor's debugfs root might already be destroyed, which led to ke=
rnel
> oops like below.
>=20
> Console: switching to colour dummy device 80x25
> i915 0000:00:02.0: MDEV: Unregistering
> intel_vgpu_mdev b1338b2d-a709-4c23-b766-cc436c36cdf0: Removing from
> iommu group 14
> BUG: kernel NULL pointer dereference, address: 0000000000000150 PGD 0
> P4D 0
> Oops: 0000 [#1] PREEMPT SMP
> CPU: 3 PID: 1046 Comm: driverctl Not tainted 6.1.0-rc2+ #6 Hardware name:=
 HP
> HP ProDesk 600 G3 MT/829D, BIOS P02 Ver. 02.44 09/13/2022
> RIP: 0010:__lock_acquire+0x5e2/0x1f90
> Code: 87 ad 09 00 00 39 05 e1 1e cc 02 0f 82 f1 09 00 00 ba 01 00 00 00 4=
8 83
> c4 48 89 d0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 45 31 ff <48> 81 3f 60 9e c2=
 b6
> 45 0f 45 f8 83 fe 01 0f 87 55 fa ff ff 89 f0
> RSP: 0018:ffff9f770274f948 EFLAGS: 00010046
> RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000150
> RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
> R10: ffff8895d1173300 R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000150 R14: 0000000000000000 R15: 0000000000000000
> FS:  00007fc9b2ba0740(0000) GS:ffff889cdfcc0000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000150 CR3: 000000010fd93005 CR4: 00000000003706e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  lock_acquire+0xbf/0x2b0
>  ? simple_recursive_removal+0xa5/0x2b0
>  ? lock_release+0x13d/0x2d0
>  down_write+0x2a/0xd0
>  ? simple_recursive_removal+0xa5/0x2b0
>  simple_recursive_removal+0xa5/0x2b0
>  ? start_creating.part.0+0x110/0x110
>  ? _raw_spin_unlock+0x29/0x40
>  debugfs_remove+0x40/0x60
>  intel_gvt_debugfs_remove_vgpu+0x15/0x30 [kvmgt]
>  intel_gvt_destroy_vgpu+0x60/0x100 [kvmgt]
>  intel_vgpu_release_dev+0xe/0x20 [kvmgt]
>  device_release+0x30/0x80
>  kobject_put+0x79/0x1b0
>  device_release_driver_internal+0x1b8/0x230
>  bus_remove_device+0xec/0x160
>  device_del+0x189/0x400
>  ? up_write+0x9c/0x1b0
>  ? mdev_device_remove_common+0x60/0x60 [mdev]
>  mdev_device_remove_common+0x22/0x60 [mdev]
>  mdev_device_remove_cb+0x17/0x20 [mdev]
>  device_for_each_child+0x56/0x80
>  mdev_unregister_parent+0x5a/0x81 [mdev]
>  intel_gvt_clean_device+0x2d/0xe0 [kvmgt]
>  intel_gvt_driver_remove+0x2e/0xb0 [i915]
>  i915_driver_remove+0xac/0x100 [i915]
>  i915_pci_remove+0x1a/0x30 [i915]
>  pci_device_remove+0x31/0xa0
>  device_release_driver_internal+0x1b8/0x230
>  unbind_store+0xd8/0x100
>  kernfs_fop_write_iter+0x156/0x210
>  vfs_write+0x236/0x4a0
>  ksys_write+0x61/0xd0
>  do_syscall_64+0x55/0x80
>  ? find_held_lock+0x2b/0x80
>  ? lock_release+0x13d/0x2d0
>  ? up_read+0x17/0x20
>  ? lock_is_held_type+0xe3/0x140
>  ? asm_exc_page_fault+0x22/0x30
>  ? lockdep_hardirqs_on+0x7d/0x100
>  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> RIP: 0033:0x7fc9b2c9e0c4
> Code: 15 71 7d 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f=
3 0f 1e fa
> 80 3d 3d 05 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54=
 c3 0f
> 1f 00 48 83 ec 28 48 89 54 24 18 48
> RSP: 002b:00007ffec29c81c8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000001
> RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007fc9b2c9e0c4
> RDX: 000000000000000d RSI: 0000559f8b5f48a0 RDI: 0000000000000001
> RBP: 0000559f8b5f48a0 R08: 0000559f8b5f3540 R09: 00007fc9b2d76d30
> R10: 0000000000000000 R11: 0000000000000202 R12: 000000000000000d
> R13: 00007fc9b2d77780 R14: 000000000000000d R15: 00007fc9b2d72a00
> </TASK> Modules linked in: sunrpc intel_rapl_msr intel_rapl_common
> intel_pmc_core_pltdrv intel_pmc_core intel_tcc_cooling
> x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel ee1004 igbvf
> rapl vfat fat intel_cstate intel_uncore pktcdvd i2c_i801 pcspkr wmi_bmof
> i2c_smbus acpi_pad vfio_pci vfio_pci_core vfio_virqfd zram fuse dm_multip=
ath
> kvmgt mdev vfio_iommu_type1 vfio kvm irqbypass i915 nvme e1000e igb
> nvme_core crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni
> polyval_generic serio_raw ghash_clmulni_intel sha512_ssse3 dca drm_buddy
> intel_gtt video wmi drm_display_helper ttm
> CR2: 0000000000000150
> ---[ end trace 0000000000000000 ]---
>=20
> Cc: Wang Zhi <zhi.a.wang@intel.com>
> Cc: He Yu <yu.he@intel.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Fixes: bc7b0be316ae ("drm/i915/gvt: Add basic debugfs infrastructure")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c
> b/drivers/gpu/drm/i915/gvt/debugfs.c
> index e64d97e44716..0616b73175f3 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -192,8 +192,13 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu
> *vgpu)
>   */
>  void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu)  {
> -	debugfs_remove_recursive(vgpu->debugfs);
> -	vgpu->debugfs =3D NULL;
> +	struct intel_gvt *gvt =3D vgpu->gvt;
> +	struct drm_minor *minor =3D gvt->gt->i915->drm.primary;
> +
> +	if (minor->debugfs_root && gvt->debugfs_root) {
> +		debugfs_remove_recursive(vgpu->debugfs);
> +		vgpu->debugfs =3D NULL;
> +	}
>  }
>=20
>  /**
> --
> 2.38.1

With this patch, no "kernel NULL pointer" error occurred when removing GPU =
through unbinding. And display would be inactive after removing GPU as expe=
cted.
Tested-by: Yu He <yu.he@intel.com>
--
Best regards,
He,Yu
