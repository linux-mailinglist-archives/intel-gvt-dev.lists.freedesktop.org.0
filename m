Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAD647E49
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Dec 2022 08:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A4910E0C7;
	Fri,  9 Dec 2022 07:08:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91CC10E198
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Dec 2022 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670569720; x=1702105720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3vODhPyQFj8jEsv/JqFw0v91EZ6BbJDsOD/s4x8PkHo=;
 b=axUcjeTdRVvbc2TkSoEvhlhAjpxLcVeeippZnAj6z5HKGJv5gYQFGXrM
 I20vRguOgsDLC3B7pTuQFxzv3ENzOx2Zvi7xVubF7Lzlz/Fyirhngavo7
 zgduO23TUg+SvW0aUFG9aWX3Q1sU1CaWo2aka6Ly+2UlZCDnUnVpUOv7F
 3u0NPJTiXceVi5iHkXYKe39r94pL599wAun0D5cyGhQFQ+zAwLsdOgrz/
 SD+Q9NVxGshy400vIENseKoBL8vp+pA3vEmVlUnWCp0I3tw9inGw8qjKz
 CbUj87RkunRrdcu7/RIaFaDQ9jOnAyeW+YUfen3sTdVWDErXHEoqira/8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="316103687"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="316103687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 23:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="736113381"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="736113381"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2022 23:08:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 23:08:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 8 Dec 2022 23:08:39 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 8 Dec 2022 23:08:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIcoKVYed8B3GcqzVJOWXzcSAxAv7cflL12R4wSZu3DmHRZFCRIWTOLkvTGhfHd++FXUd6pvDqPohZWqz1PHoxS+Ssx7ob1vrxS/wCQoUFll9NC7oRG5ki3rajs7WPn8eJwrI1QRtcjHovcJlXc0ylCnMCqJDs/s/B3SdDuCaVIhaZuYMezYWKCSHYwyPk2VMgq5jDnU57xX1Rcu9aIpNp0AlINrKW/QBkOCBTDUAr8IEl3NyRdk6/Y0VFJOU36tCCjKTaKEwts7QLJzXxgGu1qkvDbElHXqbrQTQ2m0Z+WDIQHJM47RCPwYQHQb02d8cC0n+dFgeT6vSJoMk/inrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzqwLYxW490KNcrVGhycrb0d52JnmRKBT9b0cO0LIU4=;
 b=ZIIZSb4n8U9dbXtSTWwUwu35AMwmAYNiGxLift+MnzIAl7s0DlxxZOWrTVLEWStIYXKudyrMaak2AFYFFREEinIE/IpZ7KviN+M2kRMj2TCceG9VegpQJiDkmI5Rg5oyGY7J6hldRCwXASOUskCwfFtQJBIXozHSg1sux240LZrVKr2Z67Q97Yzi2t1OtpS0j1wTs1vSuu0Mbz/twPDLa/g2ibaZVt3qBOUeUxI7V9Je6EjlZAapS+Ge4q5R8hCjy3j6PUGU3Cto20BUUazEKiWo/t7NKAXVok2RLAiQmEjxJUhvPbLqKEJeYh+4fDqOyIagOBVymAyaxjPrgCinxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 07:08:37 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::8db4:2bd7:1f20:1ff1]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::8db4:2bd7:1f20:1ff1%9]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 07:08:37 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: fix vgpu debugfs clean in remove
Thread-Topic: [PATCH] drm/i915/gvt: fix vgpu debugfs clean in remove
Thread-Index: AQHZCvUv+ybSkatoFk2tIhCCp3YWRa5lJClw
Date: Fri, 9 Dec 2022 07:08:37 +0000
Message-ID: <CH0PR11MB5538A592EA78A191D41036C8CA1C9@CH0PR11MB5538.namprd11.prod.outlook.com>
References: <20221208111634.734185-1-zhenyuw@linux.intel.com>
In-Reply-To: <20221208111634.734185-1-zhenyuw@linux.intel.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5538:EE_|SA2PR11MB4812:EE_
x-ms-office365-filtering-correlation-id: 10335ac0-a545-421d-7f96-08dad9b431ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjBTqyjTtCxGruCXIJvm0QRfgcCjv7Qldy6BXtU5t6hWBZyIOwfPkTYWrfG9pmKadihI4wPJg7Vt00JU7kaKTTVAH6hpeQwxA/b4fQEnJFwZ/Yo38ca6CCgDpNOlcroD3hXUequjG80H/5DSgsxLX3Xks5t8ZwuQfck05mLFj4ClQqnIX3fKJOwodxPm1N1mrmxmx5xknov7dGg1gOxVqiH0n8CA/u1Zxt1yGoBTAX0Fp1VBErGYayLbG7DPzm4LgYO2WOAY1pzJDfRvcSVtIBX61FCcZZdhx2sxh4pi1pD/tzJp9CJ6ehOBlZSorTQirOHMCoIAf3X9thr4nT+W0OcMJb/O7lY6WCVNFxeqvC5nZNjURe2bAWzFoGjXaPnhAdVSvE0Zg0EDGnVWeZUeKg44v23trdTLfWSaBB00j5O21WIAUPDRTNaEl98eAhdnpW44epAc5smYFGY/ah7H0G9jA6hQOLlfb9vTkTxhAkBO8kPVAnGPTrHrYbz55T7k1AgEsmVx/kVQz41SnCCa6NAzLiETaf2Bw0/TFIgJdCCOLQqIp2ygmAJBC9bs0Fpo2MXLpgtqpqq1UFva/0+Tak3lJnuBQiAcSiH1N/IFBnSaJsa/rEVo6Y/NgTPCtKtiO+LwJXRXhk0XUxsaIY4admAwFEQbwN9gv+R5CmgcVVPVe2JDASExA2K1WhrcpV1W/tD3cd7K8GRr3zb+0I30FQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199015)(186003)(9686003)(26005)(5660300002)(83380400001)(2906002)(53546011)(7696005)(6506007)(38100700002)(8936002)(82960400001)(86362001)(122000001)(71200400001)(52536014)(478600001)(55016003)(316002)(66946007)(66446008)(8676002)(33656002)(4326008)(66556008)(64756008)(66476007)(76116006)(38070700005)(41300700001)(110136005)(54906003)(45080400002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OKtBP6Zw6mk2bBA0zN/vxR04jhj9g3OvCXgBInxZvePVKh24zFOGr7bju6Pp?=
 =?us-ascii?Q?s1cXjyXH3SmynFOvyy+KPu/R2wYenfv5y/JWO51TuZEbr2NfSJoXGwko/Cac?=
 =?us-ascii?Q?aPLhVVmpJYmvK0XHwVZWueW5Xe1f45n6Ag/iJGsjanPF47LGVLLaFB5rpKzI?=
 =?us-ascii?Q?2X11dgsan7X2pWGfUqOuj5u8NVhnlxr7fsN7MYhrJafg21ENs4/JElwiU602?=
 =?us-ascii?Q?7mSoKJh4d+iRi3CL2TtWhsBY7N/N8dqSes1ar20rcHKRLtaBUacMsPLBv/5Y?=
 =?us-ascii?Q?Djy0/BJS6Swe9zNfg1qF1oi3eUEERAN0n+tMV1T2cEAgHChfW0UoSuuXP96b?=
 =?us-ascii?Q?RmZKkvvwYyv4fuot+VDTxyLi8pQoLqry+3ZQ1iV6m3S4RcYuNXb/5vdTY2Ij?=
 =?us-ascii?Q?9RCxQL3PqzBIn/mP08kkvq8rGwG2YtlA30W13iB1zdJRJ7jKmcqO+pWmAym2?=
 =?us-ascii?Q?bO6M0r2eak//6RoeQtXSsFYr6mV1Xr14ZMqGNarOFAoumBtz/GLlVEuIz7Ad?=
 =?us-ascii?Q?CnSx2VGn5YcH54+qnbaB6FKnc6ZVhjVgWdcJSLdV3jZKUcpeyrAxdHbo2k2N?=
 =?us-ascii?Q?EFrJr4ApksF2F11fwekCrmeSmmhjheD1djt68olaQUkEzuvyxQxF6xZ9crz4?=
 =?us-ascii?Q?GmAs+XWA/MW86bJ4HjZ6nz16g+GYiaNFg7cG6txbq5xCwFg4LfHlvC7FBnwn?=
 =?us-ascii?Q?8CpvisyEUPlyxj1ZFywB/hg5p29EWdZelprmv5AeIp9XPU4tBg/vPz3y1eK4?=
 =?us-ascii?Q?ZRwO+cOSPV99EuxydcLYO1bxY4USfK3KdSqJHrcUoJDxO3irjXD0EQJ5myB9?=
 =?us-ascii?Q?YeJck+Ue4hjUCHxYGGUXgF9xrCUAyZdRkI+zeQ5tpsLlZqq9wCYCYh9HyQJN?=
 =?us-ascii?Q?RQX7kjxW02kwgR0aOTvxghLoZz0mMPiqw0vLlyE7VMkDioTjqRycZ9w3fuZl?=
 =?us-ascii?Q?8Z1X/7l3lfizqhrV4zDFB/oG4oVHFAy3HyyltY6GdvLt8DJujKt7FuhQsw29?=
 =?us-ascii?Q?KOB5mBZqbw4OVBqLEJmHPaF04X70uFTtzc9nZTx4w2KWsmMSB90mVJyKHC6e?=
 =?us-ascii?Q?ao6yOBX0MYwgaQbISfYcbXcKSQUtOLR2PwR2+KDgRJPxxwbwoXURAPkd7/hP?=
 =?us-ascii?Q?k39d5KKPDj3ZtJNByhb6Q16VrJaEWTqx2v91z7lDsmzhCXwAkyZMhJrdRO/f?=
 =?us-ascii?Q?wkwKpDvHBo/o3N7OeS6XfHAaLUYZO6wvYRDxxGHU3OEW25KLHcXJPS6WoDOd?=
 =?us-ascii?Q?eOtgxOEglyRvunQVdoAg5fgtZ6doHAJNVADdUrL8Yrgpi/HE6/dByuwhP5Vd?=
 =?us-ascii?Q?0l82aSu3gwh5YbXFVZj2WxyZhFyRf6R76JWOiQGNFUvsx5PVDklx4JpiQrpH?=
 =?us-ascii?Q?gWxHzlBG1jtLq1u66VTl2gVCCbY5sv2IRGAbklbIzkhXMq3qz12kotChXKtE?=
 =?us-ascii?Q?l3NCo/O41pjDZISFjgl9kVOeuyXOTTEs9sqyocDArd+vPhGolphmwLvhPT1X?=
 =?us-ascii?Q?opHkn8Pq3Sty50yk9uLntm6Wz2RVMP31SPd0fHfGCsGADcWCSMVMS5Llyn3U?=
 =?us-ascii?Q?7hy9HufzS8XpC3JJTTlQHZKGSkXEfS2zevp8gI3E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10335ac0-a545-421d-7f96-08dad9b431ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 07:08:37.6984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cM1oCewxlX/8jCD1+oZuE2Ul1ak6CkGmQcMvJKvdC1c1ESKwiQmqPZczkzsFssFaolt4A+lr+wjgND0ccfdg1Q==
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
Cc: Alex Williamson <alex.williamson@redhat.com>, "He, Yu" <yu.he@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>

-----Original Message-----
From: Zhenyu Wang <zhenyuw@linux.intel.com>=20
Sent: Thursday, December 8, 2022 1:17 PM
To: intel-gvt-dev@lists.freedesktop.org
Cc: Wang, Zhi A <zhi.a.wang@intel.com>; He, Yu <yu.he@intel.com>; Alex Will=
iamson <alex.williamson@redhat.com>
Subject: [PATCH] drm/i915/gvt: fix vgpu debugfs clean in remove

Check carefully on root debugfs available when destroying vgpu, e.g in remo=
ve case drm minor's debugfs root might already be destroyed, which led to k=
ernel oops like below.

Console: switching to colour dummy device 80x25
i915 0000:00:02.0: MDEV: Unregistering
intel_vgpu_mdev b1338b2d-a709-4c23-b766-cc436c36cdf0: Removing from iommu g=
roup 14
BUG: kernel NULL pointer dereference, address: 0000000000000150 PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 3 PID: 1046 Comm: driverctl Not tainted 6.1.0-rc2+ #6 Hardware name: H=
P HP ProDesk 600 G3 MT/829D, BIOS P02 Ver. 02.44 09/13/2022
RIP: 0010:__lock_acquire+0x5e2/0x1f90
Code: 87 ad 09 00 00 39 05 e1 1e cc 02 0f 82 f1 09 00 00 ba 01 00 00 00 48 =
83 c4 48 89 d0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 45 31 ff <48> 81 3f 60 9e c=
2 b6 45 0f 45 f8 83 fe 01 0f 87 55 fa ff ff 89 f0
RSP: 0018:ffff9f770274f948 EFLAGS: 00010046
RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000150
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: ffff8895d1173300 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000150 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fc9b2ba0740(0000) GS:ffff889cdfcc0000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000150 CR3: 000000010fd93005 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400 Call Trac=
e:
 <TASK>
 lock_acquire+0xbf/0x2b0
 ? simple_recursive_removal+0xa5/0x2b0
 ? lock_release+0x13d/0x2d0
 down_write+0x2a/0xd0
 ? simple_recursive_removal+0xa5/0x2b0
 simple_recursive_removal+0xa5/0x2b0
 ? start_creating.part.0+0x110/0x110
 ? _raw_spin_unlock+0x29/0x40
 debugfs_remove+0x40/0x60
 intel_gvt_debugfs_remove_vgpu+0x15/0x30 [kvmgt]
 intel_gvt_destroy_vgpu+0x60/0x100 [kvmgt]
 intel_vgpu_release_dev+0xe/0x20 [kvmgt]
 device_release+0x30/0x80
 kobject_put+0x79/0x1b0
 device_release_driver_internal+0x1b8/0x230
 bus_remove_device+0xec/0x160
 device_del+0x189/0x400
 ? up_write+0x9c/0x1b0
 ? mdev_device_remove_common+0x60/0x60 [mdev]
 mdev_device_remove_common+0x22/0x60 [mdev]
 mdev_device_remove_cb+0x17/0x20 [mdev]
 device_for_each_child+0x56/0x80
 mdev_unregister_parent+0x5a/0x81 [mdev]
 intel_gvt_clean_device+0x2d/0xe0 [kvmgt]
 intel_gvt_driver_remove+0x2e/0xb0 [i915]
 i915_driver_remove+0xac/0x100 [i915]
 i915_pci_remove+0x1a/0x30 [i915]
 pci_device_remove+0x31/0xa0
 device_release_driver_internal+0x1b8/0x230
 unbind_store+0xd8/0x100
 kernfs_fop_write_iter+0x156/0x210
 vfs_write+0x236/0x4a0
 ksys_write+0x61/0xd0
 do_syscall_64+0x55/0x80
 ? find_held_lock+0x2b/0x80
 ? lock_release+0x13d/0x2d0
 ? up_read+0x17/0x20
 ? lock_is_held_type+0xe3/0x140
 ? asm_exc_page_fault+0x22/0x30
 ? lockdep_hardirqs_on+0x7d/0x100
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7fc9b2c9e0c4
Code: 15 71 7d 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 =
0f 1e fa 80 3d 3d 05 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff f=
f 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48
RSP: 002b:00007ffec29c81c8 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007fc9b2c9e0c4
RDX: 000000000000000d RSI: 0000559f8b5f48a0 RDI: 0000000000000001
RBP: 0000559f8b5f48a0 R08: 0000559f8b5f3540 R09: 00007fc9b2d76d30
R10: 0000000000000000 R11: 0000000000000202 R12: 000000000000000d
R13: 00007fc9b2d77780 R14: 000000000000000d R15: 00007fc9b2d72a00  </TASK> =
Modules linked in: sunrpc intel_rapl_msr intel_rapl_common intel_pmc_core_p=
ltdrv intel_pmc_core intel_tcc_cooling x86_pkg_temp_thermal intel_powerclam=
p coretemp kvm_intel ee1004 igbvf rapl vfat fat intel_cstate intel_uncore p=
ktcdvd i2c_i801 pcspkr wmi_bmof i2c_smbus acpi_pad vfio_pci vfio_pci_core v=
fio_virqfd zram fuse dm_multipath kvmgt mdev vfio_iommu_type1 vfio kvm irqb=
ypass i915 nvme e1000e igb nvme_core crct10dif_pclmul crc32_pclmul crc32c_i=
ntel polyval_clmulni polyval_generic serio_raw ghash_clmulni_intel sha512_s=
sse3 dca drm_buddy intel_gtt video wmi drm_display_helper ttm
CR2: 0000000000000150
---[ end trace 0000000000000000 ]---

Cc: Wang Zhi <zhi.a.wang@intel.com>
Cc: He Yu <yu.he@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Fixes: bc7b0be316ae ("drm/i915/gvt: Add basic debugfs infrastructure")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/=
debugfs.c
index e64d97e44716..0616b73175f3 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -192,8 +192,13 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgp=
u)
  */
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu)  {
-	debugfs_remove_recursive(vgpu->debugfs);
-	vgpu->debugfs =3D NULL;
+	struct intel_gvt *gvt =3D vgpu->gvt;
+	struct drm_minor *minor =3D gvt->gt->i915->drm.primary;
+
+	if (minor->debugfs_root && gvt->debugfs_root) {
+		debugfs_remove_recursive(vgpu->debugfs);
+		vgpu->debugfs =3D NULL;
+	}
 }
=20
 /**
--
2.38.1

