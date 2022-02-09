Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35D4AF56E
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Feb 2022 16:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4280B10E210;
	Wed,  9 Feb 2022 15:36:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0F510E210;
 Wed,  9 Feb 2022 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644420971; x=1675956971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NC2cwzfOCjIrSFbuM6Nj86KeTqsw5Ww3h6TPRpQ31Lc=;
 b=eAAwj9aJ8htILcWxt+EBFodbGSzrxGrS2Bgb7MGOZ0bL3KsG/o/rtHWO
 AcnzQmkgjf8IPLByD0qAn/DRU+kUzA+MM3vCOtU1N/Hma5Hs/pVT08dEL
 MZj11oO8zCweYRaT+oRbnH4MG7dkw3zBllEjqTX9w4OZ5U4GLRvbOxQU4
 sEOLtboovWvR89QXx3Q2omYKoiBCsKwf4mW+soPQwrxSHv9RIY31FJHEC
 zZRBuJ0Fj4i7B29tQ3vCOUokPN26Le2lNTqxSk8vnAlj66dAnH4cEIQo7
 u6On/zvPeTWXz8TEIPktG4fPDjxcdqBK/gTg1xPL2ToqxvMxgOyFCQa6W A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232794288"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="232794288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="541140436"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 09 Feb 2022 07:36:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 07:36:09 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 07:36:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 07:36:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 07:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRoOoBfzJowpmU3vN5w6RvFA0rJLDuW/snzMncvFSDhKfFyMWVJfVTBeXFEqk0Iy5TRY2ddcFVLKN1zlA4gm/9Bh7+TfVnHDoJGyhlKeGbdBN3lIIoEyHlrdpH8AwiMUbJIXTw9ZKDXqbnS9m5hM4WeRnZCC0t8pXi0ut2HM8TBkuqeiGa67t0v6SZ7vARxQNz8g3XKR8XOFk55ZYxEzaLhAg4kOZATiMsjFHeCeS/tN7MMlCghy+OkR8Huz5C/o2ZFW5UFGFvuJkYYz770EDqsIwtg7LmTOg9GpM1OtIAERaseZT693f+/Jrl+mFjvyqTqhrPvKl/y4O/Rj9CfW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qCVyhV73bw9AP7pAhLQbXtySzfVUhLK4GlwO85vjnk=;
 b=lfmC2sD8L5t4JbCwKGS7BWjTT0UdDORlv4mttQ38/9shQpRA9fysVDYI6XxkFYn/IwoXmqtldjtajpzTG3HIpziP8fBl/inemjFauXSSiF9Kcc4BFd7dluD6WVePI0NK7HXdtMibiezYdirNu5tq0DPqifSJSs37IvxeotLDeESxfJj+zMaLM1MdSuKZhKW+6IQ1v3jG1HUyFtBcRQGhOA4g67CxeT27sn+csGmqUHqhi5lBXBGUceLSH8XR8dMfmg2axfK3v/1l4aX2c9erhUODHT+oO+0Rm6MVTxXXXsGFxb1+/5L/5eADJ2K1e5CvxqKBRHRlQuSY+Xz036+Klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CY4PR11MB1350.namprd11.prod.outlook.com (2603:10b6:903:2e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.17; Wed, 9 Feb 2022 15:36:06 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 15:36:06 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>
Subject: RE: [GVT PULL] gvt-fixes for drm-intel-fixes
Thread-Topic: [GVT PULL] gvt-fixes for drm-intel-fixes
Thread-Index: AQHYCf0mJ2s4LZZM2U+PUpTHCr4gQqyLgT2g
Date: Wed, 9 Feb 2022 15:36:06 +0000
Message-ID: <DM4PR11MB5549FFC6FF4AA53549199770CA2E9@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <1f619581-e3da-3899-09ac-f714d954a580@gmail.com>
In-Reply-To: <1f619581-e3da-3899-09ac-f714d954a580@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbda7bf3-4f93-47ed-8920-08d9ebe1e3a8
x-ms-traffictypediagnostic: CY4PR11MB1350:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB135053F286FE97F67234BEE4CA2E9@CY4PR11MB1350.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6EGdwAIJkSYTKGArP6w8nFVtRpdVhC7KfakyLC8Jr3banFWLWWaRQfssSdNAmv6pYG2Kw0ykboHhAnAEoo+MsJPYSfr9Ojp4xDt789kjd/g06fR0aMVeBx+gXzrpQY+dgIfm1gKtyC2dQqHdjv40qHBKYXnpsnXRSYl+GRzO8+PFmmqweU1kFP7HaeYfRYI63Wqma++Kvkv46guwbU6L9skJK0W52LCy31tng7SXtJFhr9eS2s9dWlnqFSKFAPaMY7ktAusNoylidpkLtvKGMkU+GYH920V5NNX+qc13F6n3vKkkqyKMATWyEAsnX2OVHy7Rks5Hx3pSt6MbqjpZ4GRvMdbJIMw1SDZxYQtEbZgtiaiY0S4/yTVztxSiIQhMqqWgj6ljJ+SYvZi9OR+1vSnOmWhtoiJCgGVTo0LsHK41CXXicGvTPCmlxr/+37eNc2u2wZ7hUvTp5uthXbZNnlj9ulmCntGCIz0eWh4gHSKr9vTnIIKu9wrBCC1KPKx0tYYfD8vMOOVEnvoL007cKHB2XVMA6A+GIC+w57Cd+4uuYSgRg9vPxpTzGshmgKOYoXpjkKm7e99tne9mqtwKamfDoHckGcJhL5oCIPdIk4W3Y87NIsCdlElMZbwz8mee7kMWxoHoDLsZ7XtcOxA1gaF0qHwyUTRhjm/DpR+B0mKCBwRIKWD0KVSX75P1QUH9c5fPen3UiauCPlst2p2sXfSh17/iscQXor89Okso9Z4Hp1YJjbUit6Et8qZkaMkZhyUxOKRZDRmF2RkTARSE+WQHGGrFcKXeN1LQyZCNyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(7696005)(64756008)(508600001)(66446008)(6506007)(66476007)(66556008)(8676002)(8936002)(55016003)(316002)(33656002)(9686003)(53546011)(54906003)(71200400001)(4326008)(110136005)(66946007)(26005)(38100700002)(966005)(2906002)(83380400001)(4001150100001)(122000001)(82960400001)(52536014)(86362001)(186003)(76116006)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2leDNmyI78iR6p8auRuLKkC6XzZ4Vc+Bc7fW5YCzznrIDXT4QfDDcdnsDmLz?=
 =?us-ascii?Q?b1dUzl5jgJSAAv3u2jXlgIxp8BS9AHHTk3jk+kta2ItIZQ1S1bZiJ1n2HI1O?=
 =?us-ascii?Q?fdMYTfjtlFYeEsc5Ws21XjerAW0H8rLC6zI+t5fKGV2k68x/MGAMN0BKp3Uf?=
 =?us-ascii?Q?5AQzBzOgmkdK6OSJgndr3i75AdhDh7He3Qg5/2K/sEGtDqwjtM6i6x1aHMxv?=
 =?us-ascii?Q?9ZIYREnfBtacEFDMw759AhhlWlAj54jxUCLgtoqGiCVzxeo3xqFi/oRdt5CL?=
 =?us-ascii?Q?ZlVyf1hfpq2/76DTnlWv7C6igB4a5tC6lsoKbsD0Y2uSQ8ZWAmtmemlhuPRq?=
 =?us-ascii?Q?Q2NNjuHNQwM5nUWTjMLUpakhkY2kkdz/mbcjEqYNeDa4AKSwXnWVn93+fesZ?=
 =?us-ascii?Q?D++2nF8yrmWKrbWYe1FXPbHPiF68g/U1Dru88jekc1G2t8uLR1IRtICd0Mqx?=
 =?us-ascii?Q?cdvNN7KGQwmPPkSeDkWel6Xbiy29LBPc3JHJ6a9UU+TTK5ahHcAO+KNVTp6F?=
 =?us-ascii?Q?J72i0lPpP0mcdIXG4vbS0/OnHtUXNYIRbVZli/kcKbPRYV8K3Qm/NizrQSgi?=
 =?us-ascii?Q?zdXr5NaRBQ4uci2fnbItyarN+RJqcZYWt4x+hLCbF8EGRNdjJGoNoyrNbKis?=
 =?us-ascii?Q?psEIzU8Hb2ZXEFVgVm3P0YMWOA+YviU12vQhp0UZtMNW0tmR6Efw43JDufET?=
 =?us-ascii?Q?kiCmqrHrtmw7KZxm7CMuq5AuRkHFmrcgsUGHAy9/ObVnSZ4A0lnM/IFgAkbx?=
 =?us-ascii?Q?qW4BNaVEqrNh3l3odFToqLbbY0YjfvW94VwrA6PuO/apgyhyExaTSeglpfEg?=
 =?us-ascii?Q?aT1aEqPkUoQVYpWT8szyslFtkTfWV9vwx+PzQbL3ajIW3tDkCZPEOcdXEUWC?=
 =?us-ascii?Q?utgKy742QGvnTmHuvO3iYDpsSacZQK+IxKpoW9vYvFoFlcfVhScFDENOZXtL?=
 =?us-ascii?Q?QQXh8+FqoaLRMOYaMXNJ4FejGhwJx99sefL5iUnK43vB5hwINc7lDTJyDyaH?=
 =?us-ascii?Q?tnhXP2a6S75SlbX8rdxQxm6ZNCON0AsUQfJKKH32/e+JziUcClc9Mx9F2AV2?=
 =?us-ascii?Q?vcnlKrUbFm8Iq2BQAimZ3SK+qHaP8s6wDHhgVYretvPd7DKhoBIJDYGRG1n2?=
 =?us-ascii?Q?bqUttT6k8bg8ZhWDcpGAiE0Sw5ZD3P2zXhqgckzl/PS7szSQvMMrfv0jKzKo?=
 =?us-ascii?Q?9f2xL1U6PGonllNweBZgYn8E33jYGF26dmufwpYYldrmcxDmrBx4ZcJ7d9mx?=
 =?us-ascii?Q?a7WR0njuiI5k/T5uZVWJ6UWqk7GJ6obslVe6wza72sXRXlq15owOoT5/CFgo?=
 =?us-ascii?Q?tesS0kRJDDjjDa9WfqB5xZJ/b7XAVDjN38NfDwaQRmMJG+/+qwwIpIlrAXsD?=
 =?us-ascii?Q?0JMSA9Rdocp4p2oK9vJFj8iWDT+f42XlU4L9mBltSzbSV98gflOaHDFo1cqH?=
 =?us-ascii?Q?r1K2yFeYTVcaT6RWUhOqHmyrKtDeNCE5sPYzhPgk6/iSJpuHuvsp/fM3RIRS?=
 =?us-ascii?Q?pYhQPZ0TmIH5YkJLSSQfGtKj7t1WfewiTmIUilhcQhriuPnTyGecn8s/kGn7?=
 =?us-ascii?Q?vtXO9XfD5I5halCiRJCQpfClGgeYfIuhUozV6aZ018maL53mSktnCKuOGGm9?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbda7bf3-4f93-47ed-8920-08d9ebe1e3a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 15:36:06.8340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhk8PLcQjibf1vL5rdpSwXiev3cD0TbAKkSMrLgASfZrKDsZuCqp7F9u1C87G7TDpBH6JrsQf9jc+pSNvCsDyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1350
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

Ping. This pull seems not got merged.

Thanks,
Zhi.

-----Original Message-----
From: Zhi Wang <zhi.wang.linux@gmail.com>=20
Sent: Saturday, January 15, 2022 12:46 PM
To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; jani.nikula@linux.intel.com; jo=
onas.lahtinen@linux.intel.com
Cc: intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; W=
ang, Zhi A <zhi.a.wang@intel.com>
Subject: [GVT PULL] gvt-fixes for drm-intel-fixes

Hi folks:

Here is the gvt-fixes pull for drm-intel-fixes. It contains:

- Make DRM_I915_GVT depend on X86 (Siva Mullati)
- Clean kernel doc in gtt.c (Randy Dunlap)

This pull has been tested by: dim apply-pull drm-intel-fixes < this_email.e=
ml

Zhi.

The following changes since commit d46f329a3f6048e04736e86cb13c880645048792=
:

  drm/i915: Increment composite fence seqno (2021-12-27 11:33:40 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-01-13

for you to fetch changes up to d72d69abfdb6e0375981cfdda8eb45143f12c77d:

  drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +0000)

----------------------------------------------------------------
gvt-fixes-2022-01-13

- Make DRM_I915_GVT depend on X86 (Siva Mullati)
- Clean kernel doc in gtt.c (Randy Dunlap)

----------------------------------------------------------------
Randy Dunlap (1):
      drm/i915/gvt: clean up kernel-doc in gtt.c

Siva Mullati (1):
      drm/i915/gvt: Make DRM_I915_GVT depend on X86

 drivers/gpu/drm/i915/Kconfig   | 1 +
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
