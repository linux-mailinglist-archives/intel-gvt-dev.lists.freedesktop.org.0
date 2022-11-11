Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD519625134
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 03:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7665210E0C3;
	Fri, 11 Nov 2022 02:57:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B02410E0C3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Nov 2022 02:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668135455; x=1699671455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=90XKm4LLzIXzFijpolmctobahjwrsIcXdDoe9XdrkwE=;
 b=GLHHQq/9PV0nA2ixmP9DdN0kXjgZWqV7TOULk0oF2JCCVgkOygABaBW0
 nud1sLf3BQE5NVWak3zHWYbg8OsDZ+S3fE6acswz0TLc//Ky/e7b9t7C8
 HDpLlwrb0WLHjv8fJgjZVxIIXlYCtxRR+PgooYd0q1VGB/LpOXOwuqsfL
 D0RUOiUKfSeKYvkkPU3HBO0C1r1xqbeZ4/Rvps9r4xoWVnoyHhlGMxRHy
 q6pa68dFh2N9rtQtRplYUZ8wFZnbrNpNsrKnyONlE/OkjA+c32KFd2H/E
 mZ04Qq6MnQkwUvHebfuN3LPC5W8d5XlJDLg5GiMEY+dTaxfxj81td0nIP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="310221786"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="310221786"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:57:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="762521287"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="762521287"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 10 Nov 2022 18:57:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 18:57:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 18:57:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 18:57:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiwUgdX4P+zDq0O3+pXQv6n5iUdaA2+PXfOKwMeefZusC756cmPDti36FNWfhYNg1Xv20k6FOqOiHygsjahPZ/FriwZN32AkPsO+fVhMzELrcOZik2RQWSaSwFh9EClhWIiQXyoSgp7Na/hqvHuk0f1oMHUTUEvdS2SkqRd5FZgNFNaULPu2Kt5x3GqpuG/7b7io1vmYBinzabKukqyUHFgOXHvucOTuw+jtGSwRFRCRXozOcpbKRQDmWXgrD41DR/vurt/ifCBqeWM2sHFwviUnZp9m+6z3BTyB6SSvAjXLT4eAXhA80wtxrTyVdNnUUzeczdjYqK2QUue4lARBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90XKm4LLzIXzFijpolmctobahjwrsIcXdDoe9XdrkwE=;
 b=TzCt4PPkh/mMeScBdHqUzQKToA7ZpBUwxXXRW72Gzg3Pop/0fUruX4U4f8F7Yq+jyh8LsRIoPBgdGlnupwnN7TojyeqFwhYu5XECTsWvHFU/Rz0MJsXhXX0oQCQXc37RNmQNb3rGDEVmMHQLnrlzkh7hm/x92wVJ7X3zpMWr7TFuFEEWXbLZbUG1A/4u5x8OPoAI5VgELNR8IMJt2KN3ZckCiXMAmwrFZx0wMWg9wNox/J/knGrNLZfyuly8HQq3T9XChE6EFkUyqqggLMtpO5DeQMfF4VpSXovm0SA1JPnFMQqrMTv2E8G0L9sY6jDLym4lbS+gzrR5XczPL8lHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 02:57:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 02:57:32 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhi Wang <zhi.wang.linux2@gmail.com>
Subject: RE: [PATCH 2/2] drm/i915/gvt: use atomic operations to change the
 vGPU status
Thread-Topic: [PATCH 2/2] drm/i915/gvt: use atomic operations to change the
 vGPU status
Thread-Index: AQHY9P7ub1ocebpAvECu1dV0f1NugK45B7iw
Date: Fri, 11 Nov 2022 02:57:32 +0000
Message-ID: <BN9PR11MB5276CFEC621811E944DA52BC8C009@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221110122034.3382-1-zhi.a.wang@intel.com>
 <20221110122034.3382-2-zhi.a.wang@intel.com>
In-Reply-To: <20221110122034.3382-2-zhi.a.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CO1PR11MB4770:EE_
x-ms-office365-filtering-correlation-id: 1bff59ce-45c0-40d8-ad6a-08dac3907a5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x2FBa1jSyJFY6I/Mq1lOy4GjoKLLDe07bLpPiZHAi8l2mAjGOAuKvpOK+E0NLGW2hn69xa7enZDC78i3hHwyr28kwmtBYHpaaeV3fARYacYp1H3/9F8ptZAXVRAj1QszN3FPJ7uDKZvHqsCcNgJHDk6GLNudlMDMjSSBsh8JXejo2224lMmcHmuQGQ/VeFNfDA8s5HK6OjnCuCR4c5BTM2cYVIjtvE2sbJZnxpT7viUDUx33GTlk2n89ob1fwwGf8EeYX3/LU/i1I2qSp3Ll55p41ndUo+uRobwCfRj+WbpH6XSIjPwT5Z3fwO0Bu+D7JAleUElQLYzgYj67Dy35I6bZmAAl7Kz8iSXkdgfbiOAnMsW0mA/kmSBEVWQh0Lhbu4o3WmSoCfUWlSqmeU67MWncZm5pm3/e0ngguhdcZ6on0uvNsC3oNy/wESnUtjXCR0ZiAX5UGzv0t87floh1bK5qPcITvs2sVzdoVY/xn2l5nPxyS4G8+FQm4P2q5hRj+2l5Lxtwf4q+GVNQtKyB4LMaBwHFSkE2stbLrfpXubkAdUKnXHv65Fz8xLX+AV91o0UxMOwIlxugEgIj7sS4ifA34Cp1LcWHWBAVeOjhMX97yU5RBZ9cE1+lsmoMmj+nT7/0CG0yQSqM5vMm4u4A5oUPpU7oJuAuJs7pqnFc7agdLCSGawsIEis+uoTYQxRkLcbCSRNNFHfS9N2wiEDcUKnDc+XDrjaJzYyGXPdmY8Qtry+gZYYAcq22sZYfZWBziDW7Gw4qyMHKPczNYeZWRCClQK+74PXFFoO0+z8H5Fg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199015)(33656002)(82960400001)(38070700005)(86362001)(66476007)(52536014)(4744005)(55016003)(2906002)(6506007)(122000001)(26005)(9686003)(38100700002)(7696005)(4326008)(186003)(71200400001)(8676002)(64756008)(8936002)(66446008)(54906003)(66946007)(6916009)(66556008)(76116006)(478600001)(316002)(966005)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GkFuO3Pm8Fh7iJqMy6FNYvV6dLY+yMXTA36oyuYmTUtwRb6A16al6jEb7hDl?=
 =?us-ascii?Q?q+gAgStdmiaFg2lw67kP4Gw8qyN9A4Jbnls6IMQdSqfnkOV9sSvwwBrixRJv?=
 =?us-ascii?Q?jmk8H9iBro+JR6B+/1AuJi/npxN8mQQnEqPUJSai1pH/0zZ/RZkDY465YFlH?=
 =?us-ascii?Q?sbOQs3SKRTL7G3+HBDtJrYRbgJjQ0THQLt0NWsbCGt14wCCNaDu+lQ9vHWbg?=
 =?us-ascii?Q?p87LMUgOmA9WQu7cRg9odWUy8GXBkioBvFvRKcDv3i9ITNSC+CFiSIRXfrqr?=
 =?us-ascii?Q?HX8BnTvBwsOyCoAPhXWFLwrGYv3y4LP3cmDM2o0x7f7YV7TSFWu+gLMaianL?=
 =?us-ascii?Q?unyrwNrJs7kxy7veWk/FlAy38wOt6JWzvxhKcgbEpJRVP83nhmlRynVbHxzX?=
 =?us-ascii?Q?6bIGSp+Tjb5rZZy/tWQFL9V0mCBRDbHyggrqjC/UYTn/v3cZoWQ+y6lXCZqL?=
 =?us-ascii?Q?dZe+jsQv3N3JM+kIdcCbYZKCLBzsRbf/B3ZldD4lysx6HX0h9qQbFziGV8jt?=
 =?us-ascii?Q?5M8owisav35gIdZZoLitKL2XWYbbYzQ+B7qGZHUlNC2uwgoqMqJDVT3sFfnT?=
 =?us-ascii?Q?J5NfSEqnwMkntlr/GabdudeOC42C2JILB0EQSbBG4hvb7wlPw9pIngH952C5?=
 =?us-ascii?Q?NcOw9SXO/3/EqfT131MDMwDUy9O9/O3ntL1pwEsApK/5gEV8CJc1J8FRkNTK?=
 =?us-ascii?Q?m7xGUgkKmDVncIXFZYf3O08eqgT4edkyHUsdi/YZ+A1xD+A9l9JPREZCeUJ/?=
 =?us-ascii?Q?9UIvtSRAgR9feAFIYB5yRlm+dHZQAtxH4YX8HwlhE31b5t8utx0rWmcpzF/f?=
 =?us-ascii?Q?/96LbLf/E+KAwNYjwozdzufnQLpsDB9SxbXc6CFYeSLhl8xrsTf5tmzHgtFs?=
 =?us-ascii?Q?quuQuHUyiHEtbMglWF2gDSKb3EJ2pNCJJBRUdwDERgeEkzVFYHW5+lDf8Af3?=
 =?us-ascii?Q?R0ZdV2jtrsq09nfti8mijL6+h3+tkgYNuufDBlEzR/miyuUig5ju9CSP0i+o?=
 =?us-ascii?Q?rR3P9Jc4kZBie7KRgHmZB7x7r3PQfB2HGZW23Z6hIV1/Krc2nTXT/JIeyXvm?=
 =?us-ascii?Q?lRKt7fnJEVtUOCV318gsSmUN8G8H4L9xJn7wlOEG1I6izmPX0nTiZltMbGL0?=
 =?us-ascii?Q?BrfnYLCybsba8WJ7XKPx1IPsyf3TQCKajoHwSi7VJ7H8Fy/de8wIWthpH3jG?=
 =?us-ascii?Q?zDE7wnxFqgU11f3mygFwshgxLV9rxI8vKrpIDZJmvYHh4gyWCTPyumnlvEJq?=
 =?us-ascii?Q?7jB1Ym39a2ZCygK0UZg2eHjn18NPHjg4e/ZhjqC4gO1ZXqPRRttKOJtu+7mP?=
 =?us-ascii?Q?DEN2WQT2f1b1s2B6m1H39Y5TsT9udTPHLXavY76kiIqYnb8Ca6X6rCKUr/QK?=
 =?us-ascii?Q?Tz0+FEL8fSJ69aFGq8jnvXKrBWHouSWMDkhKSXZYkq4aULrGbEkg1lTY1gn8?=
 =?us-ascii?Q?mftgIiuvX3OQyHRPgINL6oM/E82DWuqmDeh3v7CjRstzq27tylDqxHH+6Oj7?=
 =?us-ascii?Q?M3pYb8pb/ke/KZvCjKJn9BE8WRpYKEQjUvhesQEbYqyQhMOsBibxb8AkW9OH?=
 =?us-ascii?Q?wh04u0gOOtD/Adjc3xDD0cU3CCMp/r75gjtAb/uU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bff59ce-45c0-40d8-ad6a-08dac3907a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 02:57:32.1519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9i9ZW6CpLKAKp1Fh/5PDHDe1AItWxiEA9PpXVaS3z3XYZcd5xYONTy3sb9603F+vHax/Wf9BJUEgHq6xfUIeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Zhi Wang <zhi.wang.linux2@gmail.com>
> Sent: Thursday, November 10, 2022 8:21 PM
>=20
> Several vGPU status are used to decide the availability of GVT-g core log=
ics
> when creating a vGPU. Use atomic operations on changing the vGPU status t=
o
> avoid the racing.

please also mark out that the unnecessary WARN_ON is also removed
in intel_vgpu_remove().

>=20
> v3:
>=20
> - Merge the patch 3 into this patch. (Kevin)
> - Remove unnecessary checks. (Kevin)
>=20
> v2:
>=20
> - Fixed an error reported by Zhenyu.

this is not the right format. You should have a coverletter with all
version history put there. It's not good to have it in commit msg.

>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

apart from those:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

btw please check whether this conflicts with Sean's fix:

https://lore.kernel.org/all/20221111002225.2418386-1-seanjc@google.com/
