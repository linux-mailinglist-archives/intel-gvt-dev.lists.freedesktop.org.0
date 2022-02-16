Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3534B82FA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 16 Feb 2022 09:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30B110E8B5;
	Wed, 16 Feb 2022 08:34:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60110E89A;
 Wed, 16 Feb 2022 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645000487; x=1676536487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/qhool3l6iYPjYa3sq1USGx9mmodYJEhU0n+DIIbRfM=;
 b=EhdwFhMjpx8D+8+P8X9oVTPtecYEs+TsWmhL94HeDVOFum7czoeLX5y/
 SPL5U7ic5ippFbal/f9lISJ5fBUczNifU4WK3b5jatqKC0DJxMsb5jl7P
 04C3tBTyJ0gPGdU1Lvb3jSLfjQISYQBcpJd8LH371UsvHgqEnQFU649gY
 aUTWdcEUcnKvYX1/L+ulWP263F/4jjntpxCat+AbVym7l4a4g43ujRyYr
 fMssoAGqSpPo/zwRxhrlycX1Zl58ZZUa6ECj1dnO9TnVqE2IEH+pe/PZm
 OHTwnwZtrlxUqHIZA9fhS5O2KTXQbE6sSghSYRyEk31cPqfJUDN1BbQRh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250496609"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="250496609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="636387517"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 00:34:46 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 00:34:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 16 Feb 2022 00:34:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 16 Feb 2022 00:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vmwr9egAXmZFzK5yyzDInVm2pjX8LWW3q5bUjOhPocRp5EAq+WEsR+bzqI6hEBBsYGsWLdFEOrFMZkf6eGEwAM4RsvY3v9eN/6pxWzUJ4077hFY/QqBu1cZk9FaMqNgi9+nRY1U2gdonJpdRBOG7uRKuIdKybsejkIINNnyw8rtulArVqxUuRrTwa/HYlwXi7503/KRYZHzdO7jRUM0SaaX3Ru6HWDQbBdTd2sK8HvwVazf0iOouWF5TJFFxWd8WAvBOpewmar/JHGnnISX1C+uynH7pIL07vFblMTzB93S6VE3h8nn7d+fQhR6nRMCcEazVjvntubTHk7XUpfWrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTukWSwrdSISsf64FNhgbfMybSRsBrCJsXpSl4p9OjA=;
 b=BoZJW4svy7FfNN8Bt+7KyAI3ecpStz0c4tAeQHdGodSYaW+psfYdsbEyO5exFcm6M9a0kr7O867FGo8MA4b0p7dc9c14S4QTuJVyKcO/uNNr0aO0YPkDvqE8FCVvotMnyBA8d9RiPsuhcYi7krVJ4ctukCYcBxYW3yK0dgydwn2pN1S7Q6IKx77562W3tc2NmXhe9zwcmaOCjPF1MczbXjTjipRVU8H76ce/QvwGU13gJWnnpNywCmd19JHQu0j9skw96tJIeDOFhtWYSCg++Mbox6gnKw+FGPiEDpgPXnha7WidPl2fFQJKUW4FtZqODBv7Zyw2MQQxf//Nm6aWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 08:34:44 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34%7]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 08:34:44 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gvt: #include drm_edid.h for
 drm_edid_block_valid()
Thread-Topic: [PATCH] drm/i915/gvt: #include drm_edid.h for
 drm_edid_block_valid()
Thread-Index: AQHYImZ0DEk8vNDru0Cs9rCZ3iWvxqyV20qA
Date: Wed, 16 Feb 2022 08:34:43 +0000
Message-ID: <bddb363f-2772-4c1b-0637-5ac3165a1979@intel.com>
References: <20220215122030.2741656-1-jani.nikula@intel.com>
In-Reply-To: <20220215122030.2741656-1-jani.nikula@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9802fe4-2780-4012-d597-08d9f1272ec8
x-ms-traffictypediagnostic: BL1PR11MB5288:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL1PR11MB528847CEB332850EE292D96FCA359@BL1PR11MB5288.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: czNRKyRmOME7cX4QppSKHKl7xOQs4eNyFNzq6U845gMLI21Gbo5dm/ELkiV7/ibIoeD8QuRY/FhF0EwMXo/tVmeQNOrBTe1KlReO1WCK206JTg7kqOohynWtj606m7mf/SHzvWnYMRA49x3/dDyr+Vkh8Daesk8HzFS4PmqeeQWtiuH1inwlgyA32DWQ8p/4yvfWlBj6OWitmKXHtd67YBQGgLwX2thiw+nqp+g4+C0DwZ6NQmVUOe02+d1JGpSfEWCUTq6mMZYhmrJuPUmMz0XN/yYDhnNwoROIyGwSUWf5OzKJZOoreb9Df0RVyleEQ51xNWdcc1tuVUC1AwCuq4I+BDoafUNXuIRbYARIA8YU6SBFlYSreqlsfH8IT43vb1bvNqLgviF0g5VTF3tiaSFIMMBXkc0lvnbv3OtQ4NhwtP2Mjjn/GDyAZNU+6UMdf6Ltl87jN5JW3PBTrgTYcpqUOn9oHise24xc0WiqBVDP1HBlGaPyjJAC7Z0wTVMhTNuwBE1ucP36jV3ZuTLPT/8nW2ZlLrbHKoZo4sOiTnbMOtoU7sClwboXQMNcIIwL4SUoqbDZLliDuZSQqvS/de3lz+U0QconYK97plTYDS/YqOXwhecGciKUwgx6d1T5meE7nu3ulVXsuLHpi+DDr5TcAt9ioDnUzyu8q09EfWKbiIYHk2alOxfDdc/9myW1LWTVJN9+rNsZXFDza6OUGyKCBx8uxrXyWjYAxmzMTe0WaeSB6s5Zcg4xbxzZHrczictRLPesTTYh1AAnZVg2BQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(86362001)(2616005)(31696002)(8936002)(38100700002)(4744005)(122000001)(4326008)(186003)(38070700005)(76116006)(64756008)(66446008)(66476007)(110136005)(66556008)(82960400001)(6512007)(91956017)(71200400001)(26005)(8676002)(54906003)(508600001)(2906002)(36756003)(83380400001)(31686004)(66946007)(6486002)(316002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?EtuQXwcoDO1Za53Bo8v4FQ4o6ioBSd22t7NXjQuCn+gafglLbegCOiTn?=
 =?Windows-1252?Q?cprBQ3ZZXjuKxORlhJtr3WYTrnzzsT0+x0LaDgz/2MgCbKyfXXEmqnC1?=
 =?Windows-1252?Q?DasqCYX18/g5hG9fDnCTiJoElegKpQ9qq2QpcBCzqJAU4JHgMs7Df6ZI?=
 =?Windows-1252?Q?HBXuucukBYpVEEuc2FFI0pPQzDhHKX9YFad2sTW2W8gWOoOghQTu01Ih?=
 =?Windows-1252?Q?/NmgY9XeS6S6GUw2Hs0DYP+nJoVdhtJ7q8HgJCbCc7Ofb9m7jTew0lh6?=
 =?Windows-1252?Q?ZEKQDUi+C/u1mADYBKfO5TLIzxPl/QtT78xLecet++J38bwznJPxfzDv?=
 =?Windows-1252?Q?1THSnP8cGf/R5EX5O/P+28tuPDaUbXh/kRRMNcyuiCJiVn+1L+4mkW/j?=
 =?Windows-1252?Q?9FCItwjxFl/C2DHo91qfxIYj85/IAym7wOckwm/anEMdUpmTodb3KLRQ?=
 =?Windows-1252?Q?ylZ+jWgD9aR+NRjFUlr7SjGIgySD/pj6AH1wmhQfwp5iD+QgM/tljRzY?=
 =?Windows-1252?Q?JysPe228azS57AKIrGr86O3maZN2x3nyB48I/YflHTsWnc7Q6pL7XoqY?=
 =?Windows-1252?Q?evOVLIbnrn/mIIeUlImp5G8510VLUdK4ldv+nD7ugRJXGAnXETJO6K1t?=
 =?Windows-1252?Q?pOMYbvNEF5bfrxb3ehsfZQRIks6i+fmx8QBNqNdXeIw0Or16SmDReFlc?=
 =?Windows-1252?Q?SSEsfUfGokqb+6htxPXKsGJQR34zY+gN1UYXaZ6YN3o2RzzVmV34qHnS?=
 =?Windows-1252?Q?es5aq8v2CSZ36wtwT3QZyhmI4b8kZf9FAmOXVoCei0ZQyDSQGmMBR5SA?=
 =?Windows-1252?Q?XTDRpbIeREah1kPYflqaYvG3aLkBzXZG0jdB/vlZYAgeSiTCBWew3r21?=
 =?Windows-1252?Q?Ks3F/4DNqo4nA4aOCMyM335UxwGjwEvUiPBvV3IY3+2ktiD4coZEilBB?=
 =?Windows-1252?Q?TNF0PKHJpYXV9ELi1kHJKiKTtXAKj6/hnb1r9ApNHZ9vNGNf8RaMORDs?=
 =?Windows-1252?Q?BMQwfnCCmzw3NfYbzOpPN4aCB5KfRU/pG7HR57fMcWs0PDDzK+hHdeFh?=
 =?Windows-1252?Q?wl8mjvFCL3XdKKT6sQKmmfq3Q8MLxzdwCk6phu05glAMKP96u7npP07u?=
 =?Windows-1252?Q?uLOHdCPz7KFiv0hPuwCCPl7+TWGYhO7o8lt7yWZe4mJCdc38Sk6ELDbV?=
 =?Windows-1252?Q?XBzJiiJ2MjicIFOUzNzgGECmDWZf5inbJCWNWlRgU0oBo48oT8+ThlCC?=
 =?Windows-1252?Q?9ryNJnNLBaWt6R+MY5z6mGvpV0iOKpdism/hFMNNFfzY8it1Jup6IWnL?=
 =?Windows-1252?Q?5OpKkERQaqAXiUbuXaGu8D5xKg+aMYPD+pKrIKs7Q9N8cZx9pypsDS3+?=
 =?Windows-1252?Q?1vhtWEiIOWnCkqUcsEt+7zSVHkyyXIu9Ps7+ewSz9FKfAGG7ExGgYm6r?=
 =?Windows-1252?Q?Je5htMPq+YhE/uFKfG771x0W3s/GmGB1ela/i0kCqO6F3qTbLyYbw9mg?=
 =?Windows-1252?Q?JI36AdgPeVfgzBo6feen+MkoI95SoTQLgHsL2FXs8Nvv0EPSz3DEMPlR?=
 =?Windows-1252?Q?FQ7r91Ow/oVCJOq275SZMZ94Sqc/Erl3PUTCZJebKh7nXvEslk/jR+YX?=
 =?Windows-1252?Q?XY76acACuuKSNnIn1vvTKcLzXV39XnXjtZgQXV0P1sC7Mk142W+ZkBIi?=
 =?Windows-1252?Q?MRXJ8Y0p25Rs6p6X7NAnGB0rPeq0z1cPk7EjtUBfQLELA0o9cS9lvHAx?=
 =?Windows-1252?Q?TEt/MVdmAbaC43Y4xbE=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <89C5C6672E468C4FB19A78424144D59A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9802fe4-2780-4012-d597-08d9f1272ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 08:34:43.9474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q/OrFUrDAhfqmL4tG5RR9de0YAmLB8l8vOX8CxxsOpbRAwfDWPokXALgnPEAoPOxM4LCep3vu0m3ikqgB5iJxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2/15/22 12:20 PM, Nikula, Jani wrote:
> As the excessive #includes from i915_drv.h were axed, kvmgt.c build
> started failing. Add the necessary #include where needed.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 14da21cc4671 ("drm/i915: axe lots of unnecessary includes from i91=
5_drv.h")
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> Going to merge this via drm-intel-next along with the regressing commit.
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 20b82fb036f8..e8d6c76e9234 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -46,6 +46,8 @@
> =20
>  #include <linux/nospec.h>
> =20
> +#include <drm/drm_edid.h>
> +
>  #include "i915_drv.h"
>  #include "gvt.h"
> =20
>=20
Hi:

Thanks for the notification!

Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
