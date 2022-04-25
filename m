Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67A50EB68
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Apr 2022 00:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B626610EBEE;
	Mon, 25 Apr 2022 22:05:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0E910EBDB;
 Mon, 25 Apr 2022 22:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924321; x=1682460321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2j2t4OgT3D+FbTIjUmTEKqJKS1E2lZNrf4j6r/Nex/4=;
 b=edDAOFxcz7+3koO8QUx3Nu2sLsVOhFFXMrHZhpVOMLmPmvIKNvSbvXzM
 CdtMFFqBVSdkqJw8aTxsVRNP+HczHnWdn6Q7nFM7W8Rvu/G+tFxOHmMR+
 PKM/h7neFx2sK8xcB2NWlAK8TE9ytdXabEc2Sg+UJCYXz7LBv9mP3C/Iv
 aI9yhmCuetSr8buKncEySxFEI+tPVec3W0s0zrp/J1r3k8RCO7/vkp0PI
 VAB19CMVvuL75IUaNGLdhwEkVeXAHNuNUcxMSRYH54WzGlD4qPvAMELbu
 hDwke2TqTKGhfLprvlQVRA9kskdMRN/5XGDlw+M5b3mSpTHrA+4VE1KuJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351819460"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="351819460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="512831766"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 25 Apr 2022 15:05:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 15:05:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 15:05:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 25 Apr 2022 15:05:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 25 Apr 2022 15:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkFdLJaeIheLme14orzLtqTAJ158a344iRd/fWw8/WQGbR8kvATfwfVhfpbHiOAgtQTpa44cfidgO5XTXDzWSDHIsvRR/5m1YxnjiE4Xf2lAzjPa+/V1JV8r2wQLjhn6fQctWVEib8ZHOWz1BMz/ucdSuJXLI2LS1T/clSbU1/c56x3tisVhrVvhjZSzBearFlNPqbe98M4o8hUlUtI4/13HKclsDkQVFGGw8yTj6XMIuxXJxN6WtTNbQUT0ZZVB/oN8BiW5BQaTQobFfkLlkx+FINr0V4OMIApfwH81x7lRmj+c/V1lpHWTchjj4Cfd/kDUGccJ8gc4B5ESySu24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj6bP8kZ0b9vNbLs1XN8obb8ZWrRV6PGYKR/LQWVJ6I=;
 b=Y964NCATrJKBqz8GI+u5hEldYD+vWN6NzLPcXV7dSsV5lR9LQpteO8f4e1XH2NRsC9lw6ah+hzz8mM6Gwx+mw7/8nFqYqSghsutMT/r9wfNOyh6ekp7bKSuBKQT9+r1JlHODrIFFX+nshRiq5X2TXQSWB1RfbJKiB9jWoy6nybbzRohIDbHqJW4Jkogb3RKf62RLIyBjaXoTgmRNhQ78CfedVDN8t0/ppnagZd3dSNhO9JGZCHPJro0Lzn2NlyDqec9RmpSh5esHKmgjAWK3MFtowyeqT3DgmR0YigO/H7D5c0Ykk6SgoE+yOGKvKWHdb0KWX4BlPFycmq1HsrJv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Mon, 25 Apr 2022 22:05:18 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 22:05:18 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gvt: Add missing symbol export.
Thread-Topic: [PATCH] drm/i915/gvt: Add missing symbol export.
Thread-Index: AQHYWPBX4EFYeB6UzU24eDjlQVxPO60BLzeA
Date: Mon, 25 Apr 2022 22:05:18 +0000
Message-ID: <b4b01884-d480-73c9-056d-72638487be19@intel.com>
References: <20220425220331.24865-1-zhi.a.wang@intel.com>
In-Reply-To: <20220425220331.24865-1-zhi.a.wang@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27ebd608-0083-4163-d808-08da2707af20
x-ms-traffictypediagnostic: CY5PR11MB6161:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY5PR11MB6161D0668513F3A69D38D6DCCAF89@CY5PR11MB6161.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aWfw22/jPpIqMinOGGquOD+T2W5uKLK6mYRFnFZKTzjXzDfckbF9lIk2VnDI9Hb6xNAIoUwmQy12ypafWOXVNQzWYj7AgLMx33HF00iA1thsp5V8+ozkThXDdjo9oDPc6ovOL6TzKGipY/z4HEtkWRD08QQTelitLWiQUfvGsu2lnvU9pJOOycUOeX3FuP6sBrQl/lE1iPxnhmd09scmlS65m/m06qAVgpoKbz0Z3cpnZz8Aqe8Q+K2yBV8WXLU651Cx+0TsMU/hX7PxovtZTs6X68XnnGBq1yOQsEi5/uk3Pnlhzm4sFQTOZp3qAQoOX9zkxvQTnpDtH17z3nxBny9ZDNZSYzIMNI/H/9yYqDmk5Mtedj30Eqqzi3kE6KJICfXTU+f0TcHdgb6YVwCqJJGraA68n0aO155fFW09kqE5qwavvoZ7cf/0gTm5h960fO+kUdnSE6+9RGHCOfGxEa+YtKUPx0L17Bnn5WR0f6X93HyGkQPaiz6pCl99p3XPUxjJOZM2gury11yPjDmOCVW8tW7laTjrJXTmqKA9ie5h+xy5BuJ/wrX/LqJYDvDJT7HssosMNklAu4hsEex4b5lsg/1GMXEbISEDXgPye6EYhOk139p0ykoNpin0oscPeTz5+t07VjSg1fQ+DZhNAVT25mMjTnw8CddO2DYoJZz9+19toLU8krAKFZSp9GW6US15kPruK5vOx5IhLESui3wftHbLAGu+ZkYDIuUBwZHgjoLRA9pJoJPrdFdcszxbZvR/8IzcZOsvnw7mYFfwxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(76116006)(66556008)(64756008)(31686004)(66476007)(66946007)(66446008)(6512007)(71200400001)(82960400001)(26005)(316002)(8936002)(31696002)(36756003)(5660300002)(91956017)(8676002)(86362001)(110136005)(38100700002)(38070700005)(2616005)(508600001)(122000001)(6506007)(2906002)(53546011)(6486002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?KIy9iFyGFh4RW3zwE+VXkHirsOBC3qRb9glvnu6ED9yI+Yq6DvU1DSI2?=
 =?Windows-1252?Q?V2xFgjs9dVe9yCRmsZm0BOU40Lm8L6R6JtxcWfHpIerILrB+9aGe6b9O?=
 =?Windows-1252?Q?ADcd7QB9VvH/667xt/J8WRoBVO1FaSylYqMc5+FV2T/aD4XqXEK9Mam2?=
 =?Windows-1252?Q?lKt7LDMV5MbOQFWIutzwQNO416KFLLbusI8RkWhtReNBZxre7/nVKBoO?=
 =?Windows-1252?Q?measqaEsukkKJQV40eliRUaWadzu7pBNx/ASwTNqJmEu6ZwlEQ2Y1Zod?=
 =?Windows-1252?Q?2+FbsXj0wRj824lVTMKuezmh8p2X5UX7mlQ8LSfzMNDsHb7eBMqGmj6W?=
 =?Windows-1252?Q?4LhsFmbjMEh9Kr97MEiXde6FSPa6oB855oh4ZaMFyar7EmQ25fCke0vg?=
 =?Windows-1252?Q?TVtxYb2Mg0o059BRt8LaSLXCP6fMf+LpkwAdbkOXfI8a9hKgEdYTb0s/?=
 =?Windows-1252?Q?6RcRWAePNOTrdFj1rN1OB595FU/XXpbb5en52fdornMHu8vlEu+VY4WD?=
 =?Windows-1252?Q?5iDQZ68B+Lc8nfgoIphOWXDNXDtjKwcCRzy+lpxtheHUXisgoWcMgwrc?=
 =?Windows-1252?Q?W6i6v7y+nQv2nCfC4QZJwAVr3qVzl62D+pu4LJOxkOUnSR1IHBUZp4kC?=
 =?Windows-1252?Q?Pdr5/WVEt2OqqcUgRTYJWehwyjKPkUA3/dEuk8bflrq4/r7H+Gkn5+Wz?=
 =?Windows-1252?Q?lcrzsFpwZs1nRCurDAuhb1Env/tvOotigJ4UoS+SImyLzDEAdfYJ/sjp?=
 =?Windows-1252?Q?PAUqdQzCF9EzHOygyR+tzT5e2aRbuo8e0/xdTVe0QIF6hHLAQj+7Pt7z?=
 =?Windows-1252?Q?zYkVcWzmWBHSBaix8vGIki5cFFtOvlhIgN6ixlXnG1TPssd7GRky4k2F?=
 =?Windows-1252?Q?/cvw3Ol6shh7zbYb1Pyn0ItJAY9kGCItgG3D9nTz3tOm0sANXhGRRqxO?=
 =?Windows-1252?Q?YjQisZ4kMPcRAgLGg09H+E+f8VT8BOkZ/boqcclf/5yV3FhaV6ehg0p9?=
 =?Windows-1252?Q?gccNqGdKkbD062XQapPlx3QUG2fKHWhxlkPs3/OBxdfsMXIYbPa+bSr9?=
 =?Windows-1252?Q?f2EjlgInF7KNQVNpzlTf/ZCswbHI+yklh+WR3t/BaAjnH426apP01xB+?=
 =?Windows-1252?Q?mzULRDE3eAf8dMi0fOtTg6pa+58+pRxTxHLE9vVY1YBvxmnZbGWxu9oU?=
 =?Windows-1252?Q?fqqFKSju6GQl/qEiF1CxkjhS0iX9qSzU3zDHivuPPjYpJ4HotYdqKNHf?=
 =?Windows-1252?Q?iWlvV0mZrimec5OKJrOJwJXM1FRlWAU24zqfQJb8VJxOqqDFp94YxyNF?=
 =?Windows-1252?Q?SiHTZPxTVonveV4/m4Y8F/W53qoQ3TLFiH6GAH8qu0w9dmu0hGDSqyrw?=
 =?Windows-1252?Q?cE5nsdhqWOXSxHXY65kzrsMmgLnWceWsTfDVI42MJhZvSCdtHtaRnkfb?=
 =?Windows-1252?Q?5+NVIXg1oSY7YICC/gDeDGM8feSvxvEQR/iUjuvwHR/yq1C/mO5FqKjR?=
 =?Windows-1252?Q?2jD14ORn+PQOObLI+s1f7DcIcTGvYuNSkpJD/pA2PJ1RGp9ub9vSO50f?=
 =?Windows-1252?Q?D5JvZL8do80OVnLR0SSfS0v2AfL/BO3V1px57KCSK/wLCgr3YkW34NiI?=
 =?Windows-1252?Q?vmnioTMbPj6jsIsvmOAi1+WSKc3j8bMzI70T+1Ush+/wyxYuhE37LTc8?=
 =?Windows-1252?Q?oaxziDhrq6SzXiQOwnJZES7sNPbUecuTCTCAP4v86yscXtumThB4moVB?=
 =?Windows-1252?Q?YAthc9W9WLn0E/vBcXbDEUtTmVKIBsE3imqJcH7+ZUCjvmA+CKEMdwhs?=
 =?Windows-1252?Q?+hbeG5BxPS/QaX9BYm3Rvl6K4U4OkyvUyi2MwSfJlsfB8Df0lU1P6Q9E?=
 =?Windows-1252?Q?jC8ceecnM7sStQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <FA3541394861D945ABFCABE703FFA1D6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ebd608-0083-4163-d808-08da2707af20
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 22:05:18.2454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWDn2Ic7cIVL4v5oGIzqZ2yuj5ZAxhTXLwVPtCLnII8vYkLqLP6D50U3EY4eCvHAMQJurzmbg2Lvgj877NvmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 4/25/22 10:03 PM, Zhi Wang wrote:
> When CONFIG_DRM_I915_DEBUG_RUNTIME and CONFIG_DRM_I915_DEBUG_PM
> are enabled, two more extra symols in i915 are required to be
> exported.
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/inte=
l_gvt.c
> index 7c03d975069e..24bc693439e8 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.c
> +++ b/drivers/gpu/drm/i915/intel_gvt.c
> @@ -309,6 +309,7 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT=
);
>  EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
> @@ -316,3 +317,4 @@ EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915=
_GVT);
>  EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_fence_ops, I915_GVT);
>=20
Jani:

Can you give this an rb? As I can't give myself a rb.
