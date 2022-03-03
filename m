Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161704CB729
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  3 Mar 2022 07:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48DA10E411;
	Thu,  3 Mar 2022 06:47:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86110E411
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  3 Mar 2022 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646290046; x=1677826046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a9M9J1TxzYRx4At44wqUSgu992AfjffR57ErXJuo10k=;
 b=aBjKyC9O0ztyjDiSs5vhqQTysKTXMNPi/A6AzElmjDxS1jG+mZYEotEn
 0vTIrH+P38Hr4lRpzfNAwkAVLBkvKFDB94x2KBox/IJaUt3BzgyUQb4FO
 LmKOO2ZL+dT6pEktpVHYbIj7NWeDV3VAu0xxfHXlhvsKQOZJuywLJ5GBm
 1wbxSMGYNpzKMN8/Qi645oK0VhpaZVwssJWKqsfguRH2UNP8epSE3gfKw
 dUOgZxcFZ6btk4FGdxwS+1GHnGSI/xJnnbpHU3RVyZFaBmALxwf9RrIx5
 kvPVlcmAeLeI77nGJRAJaJa+Huy5V8KFjiS8jAvgb7oiN9yAocxxpJpD3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="252421077"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="252421077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 22:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="641996573"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2022 22:47:25 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 22:47:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 22:47:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 2 Mar 2022 22:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTiFRPP3wmAH3tda6DFZOI2f0gYT7LLDlo8mV9ZWze+HKpCyWgeoMKgVrEU5euyc8ot7V+2JIEd3C9FODrWFKvbXBbAdNzejgbBoJhwO8gr2okPt/SEq4ycrCLIzJyUfOVymU/dQ7XXnNe7N8en03+9P1Ao0Ggv5uU0NCB/6GQ/Eyc+gxBHxW056uINVZ3OQ8A+PjsZR4JkHa3M4vVxTWnWNpvAVuLVtRsip3SMZy+o0O07exsCi0BoUhqTG26Icw44cO8fhEIAie+yAf5/Kn6GXLKQpLHp4X8+e9G0cavk2i47MVH0jxVkhHWybyQ2V5/EYtKeUekOVgnoo4rDitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze2c4dHk01pcxA2kcuzb9+PbK8poAVoefGzzXuRFWv8=;
 b=WgjXVZ5FfCdmOu2eRUPdt9bxFuiVn7NObbCpfoGSt3hMxi/1fv45tix+fT2PHAGNT/b4EdxtRir/aRwyTRl7Tlvec1zkvRvuNf/3MS3DwwopJTbh+2F4Bf1c4sFQHfekYCJJKUW2dfyS43j/kRr/QipdmDaQWlaoWfTvny+zC7w2o7V1xieMiOrxKqva5+TMd6KQsKobSz2V/c8+FgrL+MlRmmtPXcCLPVD/tb4SDRG3nkifCViAOOuopDuPcz3p+LDaLFjXKHIFjYrn6WUD/yS5QNlgOvq2fbj36s66cv474AF5XFsnIbtuL6QXLTTPoAqwOoYIkqAiCvjWknD1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by DM6PR11MB3051.namprd11.prod.outlook.com (2603:10b6:5:61::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 06:47:22 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::b127:cf9e:f810:7f98]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::b127:cf9e:f810:7f98%4]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 06:47:22 +0000
From: "Ong, Hui Chun" <hui.chun.ong@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: RE: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Thread-Topic: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Thread-Index: AQHYJ/3nv7QbUlIlxkarJ5pEVdO1a6yg0tMAgAxxyDA=
Date: Thu, 3 Mar 2022 06:47:22 +0000
Message-ID: <MW5PR11MB5857DB8BA7BFF279CED2BEE0CD049@MW5PR11MB5857.namprd11.prod.outlook.com>
References: <20220222150532.9090-1-zhi.a.wang@intel.com>
 <20220223084318.GG1100@zhen-hp.sh.intel.com>
In-Reply-To: <20220223084318.GG1100@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f6e2591-373d-49f7-c10f-08d9fce1ab9b
x-ms-traffictypediagnostic: DM6PR11MB3051:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3051047DBB9CB41CC0F37B89CD049@DM6PR11MB3051.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GogYwEc1tIj5GnDnrhqJ4l5elB11RvQmkUtC64FMddCwQ0Om03NpHIY1OLyWcw74mswfBcSxLd71w4tNFq3lX1v7YeiIFuql8kO8cStN7IRNpjDsrkG8BYUcAiItAPTSQN5d8FkXjosh/lX2qvdEJ5bZhyJvzEmobZkoCGdTm2ByPaMOu+3hrKfoYQg2GQvFvaHnxgYAmLR7vFk7QrpTeB0n17hDJ8YrykiN2+yKySAIaiv7hkQ9i7zP1rINxWk7maf9SqbUWZhpx2GswFN0gNUBjfAkNHxxdk9GXoA7M16wWworq58QPqbp8XW9gzhJDBJk7sIyhwk8GsInVQnS4dNN5qbL7eq4z+YiXDCbcOpx2A2hi/zXyHmIPo7qw2MWR0E72u6C26ZiLxUweoRMP3dlkKUwMIWwtC8hAy1Azvow+0SOearU9fyMvTY6z2jKyL/b5IKB1MjIZN+tIIgX913XH82h+eMOA+RgUbU4lmnuAvHFveWub3X+hBCjAG2F9dsQFsr2Zg2LKmn4q/CaohqqP2js888sfgwpUZWzTFdizJpKgx8Zh1/Zv8BNhcxhz/qboWWMdADTx1PZH26a2iv+NumbPKb+9H+GZcQwBDriGGKiZali1HqiseBV97o8PNMU7JuNGk6xWN8MZKs5PT9ey+xYsyfFEl8V8PquvGpDikOOCe3TnbtLv81PEOtJU9nmvtLcXA29FLSUTWDEpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5857.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(38070700005)(38100700002)(83380400001)(26005)(33656002)(54906003)(508600001)(110136005)(8936002)(2906002)(82960400001)(52536014)(5660300002)(66556008)(66476007)(64756008)(66446008)(8676002)(66946007)(122000001)(76116006)(4326008)(71200400001)(86362001)(55016003)(316002)(9686003)(53546011)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/i4knlDki/+yXWMFAKEBQF+xVZjlFV5Mn/XPbCken2CiUWHAou2DjgorxQrs?=
 =?us-ascii?Q?lQ0No3wcix68C0SMzdYeWZCd/PKDjGr4xgJOIbFztZNuVhibEfAmuO2sOgu0?=
 =?us-ascii?Q?CikN5W/hYA4VIf0ArhRGqOiaeG6Wa1MXUAl2m4ErlNyrk8hirhq3ly5PLyjM?=
 =?us-ascii?Q?72tycdikOWI7zafITGujuQCiL/zsU/tO7/YMt7nyItEHv/gcK6LCaIQO/rkU?=
 =?us-ascii?Q?END8hvOA9poS6BCQAhjJv3xd6YuPd0Cv0BekADY+nt2RlSHWEeeoUKHuXhiT?=
 =?us-ascii?Q?iqjcDLFIY+6n7mt0DlYbvk3KdqOYES57SL3lcL1kYlAwof7dYtP44AA8fNCc?=
 =?us-ascii?Q?zTuAjUH9QpVocxSGV65VklauqMslAq/3x/bGok0S0QJK+2MM/Bg2+ZsViuK9?=
 =?us-ascii?Q?3Az/3zQkhHM/+RNKdNYXP/Qc1NM+MPZgHOc35IT4a8mS/Diye1+Bu2K2A1Xv?=
 =?us-ascii?Q?93PqBPAF+aBzCZNg3CltG1Kui+AKVjBY5k4D7lCQr7BJWa+tVLKVn7tAJ+e6?=
 =?us-ascii?Q?yjBZNG1i74qtluxaOLkhM+GCiRJfjIL50L4BPoO9iyixOUsu5ZE0VBf6WqVO?=
 =?us-ascii?Q?mVNs87y830JbeeY3JdAtWcd+7fJzhzqEX3BtTnTMGKQ2ArvDdCYJyT15DnbQ?=
 =?us-ascii?Q?COld+oicqIOZy7YiSCUxzK6dvODeUfet5d9R6LJSnjhjVqcZVaRqaea5T5/U?=
 =?us-ascii?Q?Mnbl22cEl70yUnImVyCn16D+rJ9xHjfZIeJ9wVn+KuufHCsRc2abY2dIGa6S?=
 =?us-ascii?Q?KubzsGrKXVX46GY9gLuVh/E21ZYSG+CZAd8F17w7OAZrZ7OG8xTjhlNqrO+4?=
 =?us-ascii?Q?0fp1B9KZ6UoYWTidO/3m434V6dWEqTGAMsfVCbD5FXhnGYtNaarJjDzppytE?=
 =?us-ascii?Q?tyE6OWLQEAV2mLrgisJFA/RNpUzgsZN2cKfer6z5GzogbLfXcI8iUgEeHcHN?=
 =?us-ascii?Q?K3CG4vkKtJPP6myVuTQjz4J7wa6T23jP4uowaGo7AlL66QIdFgJOeKO/wTva?=
 =?us-ascii?Q?UzJ5GqwpTwi7OrIHzzP6DEk5qowKAEvjfYjWToe7aUprvXgYjwMHsEj0V5ew?=
 =?us-ascii?Q?BHkgUkrWrY+OoCI/nMPrED70GgivMOAo56GFtSAqdiEj0MDqdX+oiYB5l2jH?=
 =?us-ascii?Q?5u61spxUpzKlIS2S5OoZ98eDTj9C3+iMiaX/bXSEPJfn54NHyfCTVudmuqwC?=
 =?us-ascii?Q?dHtkZ1DHp+ldEoqB/a22jpzGENeOLf+ETEp1xtyZfPmATX9R5rOWgRvRrPdZ?=
 =?us-ascii?Q?bquOzUgQTq8EJPIkw46Td15liZr6h+MUtu0J/KGMWPQsAvgB8dANdLAHv7Gb?=
 =?us-ascii?Q?hN0Ct4Dql6g8Tv4BRdwlZTGUsy0F7zhNfGtOOwZ4D9HNivsy3s62rBjPngle?=
 =?us-ascii?Q?HC9/SXJ0hVRyeZ5WeHPXe/HgkIDhYJyEQk4fueJWrYIz2HRQltHxWg9H78lK?=
 =?us-ascii?Q?zHDcsb6FFxKdjg+BwnlMqCKZanbcSD2NrFZiEVX05us9p7khPKzM3EfHOQ5u?=
 =?us-ascii?Q?7jb8SlHfsClw6RafcDe8L60Gl61TkTip+gtVTvi2XHO4QlJ8zRD/UF7fZZQC?=
 =?us-ascii?Q?83oRuQbdt2uJvXAEr/qEWYc2uDnpwT9mgjhkyuqePQt0PLWG02MTHg/e9ZWV?=
 =?us-ascii?Q?8s67tIb1zNrlZAmYpSJVkJg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6e2591-373d-49f7-c10f-08d9fce1ab9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 06:47:22.5651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkxb2mV8onEIe8xrXWVvyPld5OUIZGv52Ct/0uO81XMEBuDuq44c5zGO83tPkJCsMxSaSANkID8Hv2sN/l1o9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3051
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
Cc: "Xu, Terrence" <terrence.xu@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi,

Has this patch been accepted upstream? And which version of kernel?

Rgds
Hui Chun

-----Original Message-----
From: Zhenyu Wang <zhenyuw@linux.intel.com>=20
Sent: Wednesday, February 23, 2022 4:43 PM
To: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Wang, Zhi A <zhi.a.wang@intel.com>; intel-gvt-dev@lists.freedesktop.org=
; Ong, Hui Chun <hui.chun.ong@intel.com>; Xu, Terrence <terrence.xu@intel.c=
om>
Subject: Re: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"

On 2022.02.22 10:05:32 -0500, Zhi Wang wrote:
> The mdev attribute "name" is required by some middle software, e.g.
> KubeVirt, an open source SW that manages VM on Kubernetes cluster uses=20
> the mdev sysfs directory/file structure to discover mediated device in=20
> nodes in the cluster.
>=20
> v2:
>=20
> - Fix the missing defination in gvt_type_attrs. (Zhenyu)
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Hui Chun Ong <hui.chun.ong@intel.com>
> Cc: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c=20
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 20b82fb036f8..da9d9f05985f 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -186,14 +186,30 @@ static ssize_t description_show(struct mdev_type *m=
type,
>  		       type->weight);
>  }
> =20
> +static ssize_t name_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf) {
> +	struct intel_vgpu_type *type;
> +	struct intel_gvt *gvt =3D=20
> +kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
> +
> +	type =3D &gvt->types[mtype_get_type_group_id(mtype)];
> +	if (!type)
> +		return 0;
> +
> +	return sprintf(buf, "%s\n", type->name); }
> +
> +
>  static MDEV_TYPE_ATTR_RO(available_instances);
>  static MDEV_TYPE_ATTR_RO(device_api);  static=20
> MDEV_TYPE_ATTR_RO(description);
> +static MDEV_TYPE_ATTR_RO(name);
> =20
>  static struct attribute *gvt_type_attrs[] =3D {
>  	&mdev_type_attr_available_instances.attr,
>  	&mdev_type_attr_device_api.attr,
>  	&mdev_type_attr_description.attr,
> +	&mdev_type_attr_name.attr,
>  	NULL,
>  };
> =20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!
