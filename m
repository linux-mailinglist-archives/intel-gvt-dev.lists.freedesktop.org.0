Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5B509F12
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Apr 2022 13:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162610E27F;
	Thu, 21 Apr 2022 11:55:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD07E10E27F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Apr 2022 11:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650542124; x=1682078124;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EbaCOg82VVXY5n23Sa21XMMNEd2ZnEJvcZ85BFzEmcI=;
 b=W/0KXidlFQmX7WqzWkciHwSrj29oGyL1ESjaoNXIsrqVMEVKMG2GRm3W
 w1ulP1TGIsdP4Ga5yH44aWGqniVXU1l1ZqLnhDyq6MtoNv+HhgrrB3zEp
 rPU22cVtA+UD1XjjB3bu9winlqtXrWe4dlJJGN7j4AfGrUBoSQ7bbVVng
 eT9rlC1V+pH34wxLkyICi8a3cS3NoL0kl3AjdfaeExCi+rbSIl2MaK8QR
 RavYATG/kVjdzdOOhcgmoFGRWQby9TSgNIDc+H2xU1KNf6bvu49s0Owtz
 yIHYDnVb63IOM57vOdgIxaC7W/HLzwwLi4d804uLoFnt4pEWgyE4tVgsz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263793205"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="263793205"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="555732102"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 21 Apr 2022 04:54:07 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 04:54:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 04:54:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 04:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu/dHZ6V/UjM7xHCT6q7O27J7YIvyrygEmbWgwrb11pRX+RlDQvenLTtaxpDdtGmfg41NF1kCN34/5BqfOvV16opLOIk2/j/pUYE2nClfw+6BhasZxq5o8rb+dRh3ynCXXh3MqzLjw1zNhhLyd1Fu+ySlO8JUoPzRufYxqlGi8CbSOGGkaQFp+hDHX64oyFF3JfhovwEJh2Vld0mKjKTplrwZZwjAdZoyt5Z6X6kI5DPZHjS4q309oVCny5FpUhVVxB+XSHahLcfHvUDL3mDfQo8d3Ex4FvAFmIOxpwORjUd2qH68wvz7HaETxl6Jhb3INe4LdyVueb765jJt6XQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/E2l+N9L2zF6yB8YXhOEn1uyDO941WbYUpq5baNw2o=;
 b=YWfbuPBbWPQ2w9Sgf6z7NLi2apr82qLbhZVocGjJaqMB6jDsAXB/46KeQMrfERjKdL+5dj+V1t1LtmIF4vHY+HmkIOx+CDJpYDdr9Me8DciQSNKMuiEDgPCKPJuP1G/L4xSRZkXystp/c/MqZBhJnPjKGkZ/eHo8iHzqyRydQLANk93n9Vbjuv12fAddx194qn0W6sjmMQRIw4tWaHClxdnfjbq9fkqlwqur0TBA5cb/z+XkLSeD3uARkXAEL0in2uf0shY8QPDFUdyBgHEAwsiSS13bMY/4qOMwedZmAa5XsYjVgukYzVyqHHvflFvIpVQiCrqKvjx16TOBh3VKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB3484.namprd11.prod.outlook.com (2603:10b6:5:55::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Thu, 21 Apr 2022 11:54:06 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 11:54:05 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gvt: add the missing header back for
 drm-intel-next
Thread-Topic: [PATCH] drm/i915/gvt: add the missing header back for
 drm-intel-next
Thread-Index: AQHYVXYxwOhHVy9L+UKU0nzjWDGzDKz6QgqA
Date: Thu, 21 Apr 2022 11:54:05 +0000
Message-ID: <bf178643-99da-fe5d-1e9f-f27b9df3b4ec@intel.com>
References: <20220421115133.8052-1-zhi.a.wang@intel.com>
In-Reply-To: <20220421115133.8052-1-zhi.a.wang@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aace995-499b-4616-9d00-08da238da2fd
x-ms-traffictypediagnostic: DM6PR11MB3484:EE_
x-microsoft-antispam-prvs: <DM6PR11MB34847C34BDCC7D0F1B858735CAF49@DM6PR11MB3484.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Peu2EBoL4ZJcnU9M/6lvvPSa22/WnJBsSTkEb7WRCGvCtvUcmNlA3/NSiAYx7NllliJeRVLugsSeRG2+/yN08GfBNdOPyMh3/ujY+p32m8CiH1X1H7swAiXF8gcdqZfvZV2x4roYTxk+r8Og3b1CNSyqP0TRo6ek8vXkutqnexA1saZ3J33rU5iYri9x2IVyUdYWXwYruoDBfDKG/VyfbyTgQbvl4foT5A89RyT+IDQmXnnFC1UeqsPyvEMAVFhnjoDF1tW+ZCP7xdQ9cg1RAr1xygQtrscZBvNzsuc6llQGXlZch8Idx0o0XY14ObgByIXHbPkNU9rSoS2JdOF9DcwiGe6vvY1EqnQCF6O+tvgsx/Iw0GcU4SCn4aCAxhW6rAig8pPQQealwxQKPIEOek1nVDp6vTefmU8IGbiv3Uj007fEBEMTMB83GVcK25Cp6m13OpoLtHfYw31gXC6vstWTjGGeiqJBM8bGJiCPukGAWlVyI9fZ1EoJnpGqMDIlUNFquF9tZ5jXaIpBZwvfNHtiW8N5WwUYn6SujKHH2fiek12GmdsRMqE9M11/TUhQ2DuQmHAKvbKdOSfHcg4ZPh7xJh/3VLV9/o9hxpZ3VG1gPLR7ODFxYjRvqBWEuokn2enWmlPAxOX9pDzSlWZOJZv552XweLQcxO6/+t454JpKbC89bJEbEpfT5UW6gPyDsn0GFzlPsRswXy9WPJlZMYfd0UL5UvWSJnmnz1VouLFeof0I5+Dljn1DIzj7ZQr1T6i8LreppHf0ZYaiZ9SXfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31696002)(2616005)(83380400001)(8676002)(316002)(26005)(186003)(110136005)(38070700005)(36756003)(5660300002)(38100700002)(6486002)(6512007)(91956017)(66946007)(71200400001)(53546011)(508600001)(6506007)(76116006)(2906002)(122000001)(66476007)(8936002)(82960400001)(66556008)(66446008)(31686004)(64756008)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?bUXhnJzuh+COu1bKiRQSHMvf3VhKqlM9wXW8sTTiGaXQ6/xpei0otf8d?=
 =?Windows-1252?Q?dqQOh+FMsZQNfYAKXDcd/+aa5E6uPgXly/ZQ8oeYaWDLXxO7vIkX6zZr?=
 =?Windows-1252?Q?hhnXDd2DWlkGeEE/lECC4Vwam7JzGXL1+X/iERLLMqUKzU06JHmMOOFC?=
 =?Windows-1252?Q?BCb+U+/Jo9pIEnUZb5nK89n5OdCfhTkWG2fPg1TKE1syrupoq5b8CXgD?=
 =?Windows-1252?Q?EAEKfo2UlLD4pFmxisnkYtooFURC5R/ArfJDlqQ3QYMv2moShklXdyvX?=
 =?Windows-1252?Q?2+pgo/tHVyMPMn1sR7eLfJCzzslq0gx42CCp8UhPEjRCvJW6swSnm5oU?=
 =?Windows-1252?Q?rgxRhzrTWsID554G5mz2fkJZ6eHaPxALRRiJ6iACcuUYKwewlKlMDPG3?=
 =?Windows-1252?Q?v4cwz/1dQVwxd7zfLFuQvPaHuN/ds8b8q00KJi9yyG2EHKXOese6WXlJ?=
 =?Windows-1252?Q?3sGO4FQn7sO5np4/54EwRMnmbuzQZ+c+fM4gJg25nS+xo+WueDv/uvIT?=
 =?Windows-1252?Q?kw97vnE8lQeC11IAvweCf0rK9DHOZrL2UOl9/GoV7PhWkr3t4SCEEveQ?=
 =?Windows-1252?Q?jc30t4QIAs7bPWKITcy3kRZMkIwWtOPRZ9nDqxb3q40m6OzBWNzJsfas?=
 =?Windows-1252?Q?sjiNbvbsbVlrlYiy9Am5/Muz62YC1JEeACsXacOenlfyZH0lHi4TujyX?=
 =?Windows-1252?Q?T1IljsgPx8xIeXMkfuTrpcFxieDeol7uuFcEX6jUY0wmBoXe6XPrTGeO?=
 =?Windows-1252?Q?n6v7I2HQD19oToYmaRHqEk3Rn20/bmGF6GQf1POOFagjD7OX1Wn/joF/?=
 =?Windows-1252?Q?kDdI0QxbFWi+E2WWyIXozB8kmcXkkgzM3rEdbUXWnGf7prgCY3ubBb8q?=
 =?Windows-1252?Q?6v9VC54UiZxzOpBplV4MGPDieaFzXKZou6ZFkMD1pP6z0XUZm5EHClbE?=
 =?Windows-1252?Q?0ki6az5hx89o5+0JGgG5wj6HnR0BrSfEqovbYdyw2q8liapaWCVEpzid?=
 =?Windows-1252?Q?+KEcljoBDLgdj/1UmVZe+b3kxcuMduGf3jshhgWeEUJD+LuBvYXTB0Ya?=
 =?Windows-1252?Q?d70pnQwIabnzURH4yo9FCu8wukLrkO+ZUUg3y3zDUikGCiganx4vKtmm?=
 =?Windows-1252?Q?l/fGvtKxD2ZwiH3hxEGcYSt/6HKkHamUDpaGPdtDKzM+miVwi2gXTR5I?=
 =?Windows-1252?Q?EIe7avQ7u0vVpRHXORkM9vQrozQ07NbW/9U8lw4QeLOJUorLPoAFFbQc?=
 =?Windows-1252?Q?9V2eCaUi/Cl5dXN5Gz0iBIEU2YZavpX3Kv3H6cjVgmQmi9WwSusv0Uts?=
 =?Windows-1252?Q?E0qvk+nk2NnX4Il5scEXMKxTX1xDNZCUI53wVqc211h4i57HU3Wl6wtg?=
 =?Windows-1252?Q?lNq6b8jIJKSLvY81m4yXv86n5vH2/a+hQUKocpqIx4DGrNrhY68sVp2q?=
 =?Windows-1252?Q?5qsPKuwIYcRh3B1VQfpBNQVfy48OIsN/F6SRRU6p+Sy0spWBQADeXsvd?=
 =?Windows-1252?Q?7PiUx+InK1KhkP8w/yET/6ZKDrziAv7+JEUXDB17n8h3ytYgGk7ORmFE?=
 =?Windows-1252?Q?8bAR2erfjwtlp5w/6P1UxUw6qMyfl0rXfMSFsO/7gXoAcrCwK5Q2Mma9?=
 =?Windows-1252?Q?CeJt+09dgxBwGY+J+JfbjgT4Kz/FmKZTy7n6UqIZOMbTzAr7D2FyBqsg?=
 =?Windows-1252?Q?qsZ5IgQQZWav4vtaoQJo4TKEX2vGCObrQ99IYPgcveAyotA5sXTpFQ7G?=
 =?Windows-1252?Q?5I3Fc9n9fQLaVlEw5Lw7/z56Tr4Vqn2Y1vJ9yeQ7yKPSxOYcoIUAESit?=
 =?Windows-1252?Q?HgX98xFpNUmVozpCqpTZCE6DnpVietuSl5IwcQ0Kwxl7uuWtXZbDQLdq?=
 =?Windows-1252?Q?+JKxRgqtkxaH6Q=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <03457855D8154D48B498D893E3C5ACBD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aace995-499b-4616-9d00-08da238da2fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 11:54:05.7924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vSNS7kbkOZG1sBQrb5XEX3c0AG7oB0alBwzzQcS0j+DxWX0YAAzKfk3yKYigdav1kmfREL4DaNRjhxqX7Wv0Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3484
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Zhenyu:

Can you give a rb for this patch so that I can continue to organize the GVT=
-g refactor patches.

On 4/21/22 11:51 AM, Zhi Wang wrote:
> Add the missing header back for the pull request for drm-intel-next. The
> patches of GVT-g re-factor will go through both i915 and vfio. As the
> header of DMC registers has been moved in the latest drm-intel-next,
> the patch is required for compiling.
>=20
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/dr=
m/i915/intel_gvt_mmio_table.c
> index 03a7fcd0f904..a8edb3f317f3 100644
> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -4,6 +4,7 @@
>   */
> =20
>  #include "display/vlv_dsi_pll_regs.h"
> +#include "display/intel_dmc_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gvt/gvt.h"
>  #include "i915_drv.h"
>=20

