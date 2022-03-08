Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013354D1066
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Mar 2022 07:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1A610E1CA;
	Tue,  8 Mar 2022 06:42:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BA610E1CA;
 Tue,  8 Mar 2022 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646721752; x=1678257752;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JljYFypCgTMAT/Gn1OASVrLK7LeLFLo/8yaF+Xb/57I=;
 b=b2FlX+0VAQbd8DxGKzTgRMCYDxCUHeWd4Z6rv/WjEmVErcwRZJF50SVa
 6p7+i66KcJiBeXjxwAi0ZGc12HSXqQsVED7EDr00WvfTqztkOZjLoFnKm
 0lXX1MwnJZjDb510gqEmh2dAt/bUSZISB7RoRqhvGx0LajMy1oWDVxSJO
 WPlHYm63yYTFa1M2d3NH4ggDtoSGC96y1GzhtfoLf0j3KHbbS98HAKyqt
 /F7ivuVRZOshsLHmeLuOhFZXJy4aVgCidL8IXWdoyoi+2nYtPn4IkD97K
 KpitRBw1xNjusFp36bnt/eBVh3F5zTfERBq3Iupy6HGq9nnvDq96lcdlL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="279320616"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="279320616"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 22:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="595787917"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2022 22:42:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 22:42:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 22:42:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 22:42:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 22:42:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRYYjkIK0H37tUz0UJRZ5iR1U7yLSKy+brGR68zK8bv4gTdWT5pQBKM0MhvEB7NBqciWlNS9JQKmaOiEYn2rJWh6etmMJ2f8Jr39gSSUbRSiW9TkmcxX2jz57Ru7Ju2UHG0bYCXm5Qd3rmvgac+q0GMjcOjxkKuRSDGmflB9ygw2dTsddSH2m4mA2yCAbavW++kYkOE+0gP5Cf9C1FpvHNHxQvj0XsPsO20zRZmGiamGs69Yl8Ml5A5nC5s9iM1sAjHLWcVY8KDqQ8RQGVHy7lJ//MuovfDWj+3k5fii6kIfd/8n2iDHCMoiFkbohLw17Z7DdJh71ajU8teexNgWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3ZrrLJNd+srIew1UI6La+6EXbbob5PCNVz1WGv4e+Y=;
 b=cElfaL3Y/ouhy4YlnTRXqYnqLf+KsyY+XLgsK+SiHi786uiqXty0j6UCdUDg5B0FJ9NipCiXnpkHc1GE/yJ/zC9kpjBmsNbsHzk5suzY0aW/4QShhFmf6K2lK5woEtigvx4YP4LHtUEjkvH6DAebXchkPkvm2Dc2WEUt5VWGzIX6fUhLEfsC6ENd7aOmTQlJmpvjLeukTHN9rIBYzatLNSiCrLnCLSQCzRVPl4/3loAar9XU0X9xts76w7hKMSdXr4J/0hvUEgTzsECSEKOJ4Wf7Gu8t/8roEzEuXyEWuChdt+0lj/hkbAJUzH/B0SpamDYJuRBi5THFnqg8gm8FEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.26; Tue, 8 Mar 2022 06:42:26 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 06:42:26 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: [GIT PULL] GVT next changes for drm-intel-next
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next
Thread-Index: AQHYMresZ/14w/uEPUO59mgSWWfBhg==
Date: Tue, 8 Mar 2022 06:42:26 +0000
Message-ID: <e38f0725-6b22-8e49-b8f6-41986b0ece06@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com> <Yd2W4T1Y8X0cP/PL@intel.com>
 <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
In-Reply-To: <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cc5d43f-314c-48f6-f8ac-08da00cecf61
x-ms-traffictypediagnostic: SJ0PR11MB5183:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR11MB5183AF36C82F1FAD222AFAC8CA099@SJ0PR11MB5183.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: haqSDGg0NKX+QM5MKR69ZU8wzF1VQ/L83Y5TNUmhYl1MqJItNi6ogPyNgp558l/ln1korUpgLHZe5GdIKGX9i02T3sZaAVnowNb7omXMtOlxj4THaTqvRp1CKODefCqf2sHV9sSInGYh5mJin8XaMwEcEQctRSh5LgsMl4fzJWtBfnGx9smMU5Cuv/sDozLu6OcDE+40hTGjSsJW5T7qjdPYR4X1nvWgIRqpmqfIyrcPAwpBY8tBb2PrupaAkyR/rNtJ8mBxfr9IJ+MdjFuM4/F/x4RzFWPKGLKuk/R2+XBfXlj4dZA7cOJ5cp+JBvEVimC5dysTbkVsoA6AMLlsfzN9+Ev2tx/hfiRlsNvbBo0Sw8zNOpssRgt22rGl/K8cEcNT7Dl0+z0hOF7ggZJRCTXA8y8RT5DIOqkNAkoQLAf7uA95HlCQO1/H2V+UHNhLnf94oWqd0aYxFyLO+gpqfG1uz/YI4C+gfTK+FpIqitzKhHnmynriJVNzqyhMXULhTihpf+GFEOC0AhXZezQXaXPp+BAS2fT8CDSYDASY9N8219GeKQnw38BzehWj7cXvt9S90JE6c0RP6LR/aH0+r8cgrm7+YOD0MEppgFN+ZVTyZYdL11MtfFhKrXupTvyFWslboW4CsQgbL5raCyvjpb8b45NmFukmQS8PRe1+SWGXOmoRcNyP2VM5HqfVXfMpnBKJTY6TgF+Z6eUQPvcAkvNpuKxBL8+B4/O+i3IKAkx99Z/4mWW/TX80OuP3z7yfef+i8LkQKJU7yXabHMIgfkUVp9H09X/N8vGMXPNeVMLAilf5cdKJHexiht3e96v+c3zeYSWGGTU8uvwgky3w/8gZ3Y36MGKnNLL7cg+NCpg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(31686004)(83380400001)(26005)(6506007)(36756003)(316002)(38100700002)(2906002)(86362001)(8936002)(186003)(5660300002)(31696002)(54906003)(2616005)(66946007)(76116006)(82960400001)(66476007)(64756008)(4326008)(91956017)(66446008)(8676002)(38070700005)(966005)(66556008)(71200400001)(508600001)(6512007)(6916009)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?7tE7eALcZq0dyyh2a52A3HpAYwOj0vYifyRyF4RKu8KqzqCH24eOWTh+?=
 =?Windows-1252?Q?wDeJzImxiLC86Kl5errWsvYh+90QE8ITLnYwO3OdAxi5c0naRJQ1Ckm3?=
 =?Windows-1252?Q?28GokGziC4HbzrKg4e2vXShnQ3xuMOU8Dd6l6COVG5stco1tAX1jIyKV?=
 =?Windows-1252?Q?hHgD6HsGiUK3AOnOPqxR63TI1fy2jsVhaiKHuDmUG4BnQ4uRztNJYDxl?=
 =?Windows-1252?Q?0tTBNTPveJ6V+InvfPf9ifWWMnm7SYZslIzs2oYlCl6iwXxv2CwkegDF?=
 =?Windows-1252?Q?h1om03kKa+GKd4GuhEiU1doA6lksxunhafIsdVfURs0tdFHWI7GZP4zj?=
 =?Windows-1252?Q?ucck+berG/3dPM1AjU2cs4X9aZu/2LG2wyEeedyiI6EczAywlirpAtGD?=
 =?Windows-1252?Q?csg41IqRG5jA/zZEMdNf5O9j4QdCjIP/dMLM8s4sMSdYtAhO4Z09prY6?=
 =?Windows-1252?Q?sQXu+P3oZCXJy+sqg5tRCfTr+DjEbzQLS6S/FfGeu/bbatUld0qyF/Eq?=
 =?Windows-1252?Q?XfGMMlfxlZH490ZrI8w17KiK8PrIwfMhjDUwlz7z5spME38OyRaPTUyg?=
 =?Windows-1252?Q?V2/S/dCZuxYrTEp+fWr/mZ0WoaHi0kxF2hUYrw55bnvkNODTbI4X9HaF?=
 =?Windows-1252?Q?JX9a/GtLncmi+H1BsIC0lpkZ37ijElc3y6qvL3X9IJb4c8Yglk0c0Yf9?=
 =?Windows-1252?Q?IM9LKb5VqPCe2wEqUu699YU5gFeNQmpTN+quZBVx1qFCT/LCZirv2QjE?=
 =?Windows-1252?Q?k5Q2/jjwUCcZVn85jsoyDloTxBdqiFzt/5NiXnTNYi9ujcghUCex8eWX?=
 =?Windows-1252?Q?sAtEAmmfPumfkqo6nkDcrRjjZm0n016n+owq7vJwUDL4fDlfEVITFrK/?=
 =?Windows-1252?Q?KO0rfidtnCRXHn0ZYNDGcdqJtt6p8Vm4Ao76yAkA29Z7WhEo1Bq+F5AU?=
 =?Windows-1252?Q?rjxQbtLAneExAwIJ6qUXDKRXLHEYDcYfIet8CAtRxE082m1P0/is9jPZ?=
 =?Windows-1252?Q?F7wZfwLDJVOY5P067DO5Mj86iU12msHn5M4tVzqnuc5Box1qRZgNu6f8?=
 =?Windows-1252?Q?z4jae+Md+8qn0zeOskX9lTzOH4EeGl8uLs8EVsCKxlPrKqBWGIJDAZDG?=
 =?Windows-1252?Q?JCO9OPJxOzyfHVsPGDPsF0I41P2RoA3SGQmjjzWN3Y0fd99O9oCIVz2V?=
 =?Windows-1252?Q?FYzHY1hgJeyMisQyQXH86W3OBmqsaUNDQhh5OivkwUiKDpqa3Jqv0bD6?=
 =?Windows-1252?Q?zXtVQGfePnYHsew33tDvbhqwAYCUDZsDVm9XgsmUVEHzLflXJMOc9vgU?=
 =?Windows-1252?Q?duz2oiFUfKYsoc4i9F/ofd43fn+0zNU0uI1bygNDaE8Q7LZRH3Ih0OTy?=
 =?Windows-1252?Q?MwzujmK8eK38SkJVAf2uuztDtDgqqNX45Mtlw8xdigv3QBBCOUB55/Oc?=
 =?Windows-1252?Q?rmv8CEJ9G+gtKH7BD9kcwVGtDJ9VBR0idlzk9emfYHDz9m0IRmlPCHQ8?=
 =?Windows-1252?Q?eg9udanjDxP7y7Nsdk/mpi6dwX3gd24iLgMgPA3bGFGHHGe/ClXXdPE1?=
 =?Windows-1252?Q?0AeVmFd1PGRPwgGZxxZYf9L/8Zu3SoiT4Dw415BP8ENK04aAHYqbQQsl?=
 =?Windows-1252?Q?86w4Ul3tOUzPEHPhoXV/srKU8tWbylXekpRzx8ECXhV0cPGP2dT5Aci8?=
 =?Windows-1252?Q?KqY+h5C80JUTWTNVqlndXB5q356QW553BgsJ98Ux43ZonQJL403ApYCx?=
 =?Windows-1252?Q?w8OUFZawiYW7ghElHo8=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <619675C594080447A2DF09116C8106C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc5d43f-314c-48f6-f8ac-08da00cecf61
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 06:42:26.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbmO0bmhIj/zkldAvzJebjt2guw6ydCzCUSccjBHe0VIQjAopLwTDdptMxkLbszS69MQOnKHcYixJonTArWvqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi folks:

Here is a new pull request of gvt-next. It contains a small patch to add th=
e missing
mdev attribute name, which will be used by the middleware, like kubevirt.

This pull has been tested by:

$ dim apply-pull drm-intel-next < this_email.eml

The following changes since commit 30424ebae8df0f786835e7a31ad790fa00764f35=
:

  Merge tag 'drm-intel-gt-next-2022-02-17' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-intel-next (2022-02-23 15:03:51 -0500)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-03-07

for you to fetch changes up to 43d26c4fc6c446d766253d546f0083d78023d34a:

  drm/i915/gvt: add the missing mdev attribute "name" (2022-03-07 12:21:58 =
-0500)

----------------------------------------------------------------
- add the missing attribute "name" in VFIO mdev hierarchy.

----------------------------------------------------------------
Zhi Wang (1):
      drm/i915/gvt: add the missing mdev attribute "name"

 drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

