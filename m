Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F964D1070
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Mar 2022 07:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F3910E4C0;
	Tue,  8 Mar 2022 06:44:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5939D10E1CA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Mar 2022 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646721860; x=1678257860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2OfL2JA5RSU3y+KBWYLkABEzHEhcIjdVvXtA5mSIAwA=;
 b=mLlUaOkkgtGzBu2UXmb7r941Y4MRyOM/Ae4Qz+BYIpwA8Zue4lDKN59w
 9bu3gZmIVstSs3RPicvbged+G0iM0hcZxnwg+GnJyYOKLCg1DmDaMYuOv
 GvHhG7dV0/BJQxV/havskp5HeJmcvDeup9eYKnuj7Nk0rkDEAR0jDk6UB
 9e+WhvWl7000UE+xHd5u1nFJvoNAhdrQwPxA9CT/tzAmW5UGZBpCNXAg5
 zDB96Rpwu/17RUJ3HzWLt6EoBIXTj7cyVRdrPQV73GINHXfM28CAwecgI
 Qg5qaFu/lV7K9suSuRgh80dENpdszne15el8+zzvgJpVAs0WRGy1aQpNF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254549125"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="254549125"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 22:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="610901372"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2022 22:44:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 22:44:18 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 22:44:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 22:44:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 22:44:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBLFWSYEcumlVSgGTxlef0j0F65tqhF/+KlQVcWgox6AiKsh+Hkfevyi0Pg/G3VVJdUt9Eky61CGnnkJmlxdhJq3jAC6/a4MNPmb6a96FlEx+EKCzlk6fuHoiXBXPX67qKLS822cTtgBhH+QdYSvM9R+lQKCz2ppxQ5ylulQjlSY2YvS6uTYMTorfn3MbqdfKzf7w7QSflnb+kfES6/45KukIN0RH59s2zZjr6DkyFRatOGXLkpM0eOowzumGN3P1KFed8WS5+hSfT4uyP5Dk3ikeUa/fOtODpITkyc1mTJcl8XcFkl1APu08CY5zZDvc01RZgSP6b0hplgCLtv1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLuyGxAtuYZ/WLNMyfU39U8iodv41AOAU6Kaoal1pY0=;
 b=PZhukQmsWooA5lNnLXnV+sA0/g0Atu7VkM3AvsjMTi3fHLh1B7UT34NDVBAzX/m3IqKacaDmgdlOLmNE/EgSsuZOpMJf1aAcvFh2iKANpbeENwCuGh+PxrcrzHP7COons2MOzg5CBpZlPxawKgHeJ2uCNXWbAEfvwO0XfSK8IME5YufySKJe3HTWn8WXdnyZW4JNQQ44bVw6u1aGQ2GJrN3e+TbDkXNqlnM225wRz1qBNJhuHmjZihIpJRHIVJL5Ls+WO+oWvia+TK1t8JzLoAWRpGFP46GAV2oT3tq+PYCUuOur5oyaxLyw16jqx4XVQ+PfssUg/lI02jXiu1xoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.26; Tue, 8 Mar 2022 06:44:11 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 06:44:11 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Ong, Hui Chun" <hui.chun.ong@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Thread-Topic: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Thread-Index: AQHYJ/2zrwYinHrEik6kqPHVEJKe+ayg0tMAgAxyQwCAB9rDAA==
Date: Tue, 8 Mar 2022 06:44:10 +0000
Message-ID: <f897e68c-efb0-409e-47da-5f84b7fed9ec@intel.com>
References: <20220222150532.9090-1-zhi.a.wang@intel.com>
 <20220223084318.GG1100@zhen-hp.sh.intel.com>
 <MW5PR11MB5857DB8BA7BFF279CED2BEE0CD049@MW5PR11MB5857.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5857DB8BA7BFF279CED2BEE0CD049@MW5PR11MB5857.namprd11.prod.outlook.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7352dd9f-3194-40c4-0f7b-08da00cf0d76
x-ms-traffictypediagnostic: SJ0PR11MB5183:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5183B54AC88B8F0DD98D5C34CA099@SJ0PR11MB5183.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rprYTZw+2ny60/5lNom6AsrgQtcV0YTZT573GnWhKUolMX8ZM6/P5zMbw4hii4ZWim3BNGfqH/SQnlQWyFESaa3xB+B+yCoUFQkQTpGBRI19+CaWf94etyDJlP1woFTie4onvNhWniiGl8snDYMsgGhyfGZsmZ3zvell+4raWmjAnMOFyJ82BjdjwNhfkmtP8IAN1l7udOagVq6V+aU5XlbRYcASg/rayM8UvyEWD9xvllsUVLPZEQo5GUfYQUM0KD6Cp95JkVPw7FBBpEAoHoTsfSLCs/wc/cHxmuH6Po1XYcUA47voLVXW7XLTiwcL0V0NAtXANGbc7YNg1OA2sSRdZ7U3XxB3BMY9be1LefpPq1XpLGMXv6tn2sxw604aGXtaEOoaTCoHtOK5gvxk4rjRLuQKmrmhqDzsPJoZOHPZ1tp89gD5Ds5nXaKwGneLBnN+8ILZ++Z33exRPGgs/BCB3c+tbWy0wfOgq5swxBAJovqqrMXjSStH1L5B5brqe9FJagOYNsngu6IIR3Tb7spwuN128NFRdSpHcUrWoH8yHWwwQpXuGFHkapgrgOdsk+VZDVC4hCzxkEG9H35a/QhVeYZFm2KHWvyTCfZ+1OARWXrsYRBzaIr+RtKvst6EHPGYRUi4LYkgdVNeNIL3DrnMm9JGARlJCBia/cs/mz8fJWnHprHUQXL7t0FxbrT39YyqoGiq0k9YcTHw8k/Zn25VdJSVFtAvXdKXBoTLbKu4vkvHsNXtdb0o7JDLba09qKPG25OpU2ILlOYmwCv2Qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(31686004)(83380400001)(26005)(6506007)(36756003)(316002)(53546011)(38100700002)(2906002)(86362001)(8936002)(186003)(5660300002)(31696002)(54906003)(2616005)(66946007)(76116006)(82960400001)(66476007)(64756008)(4326008)(91956017)(66446008)(8676002)(38070700005)(66556008)(71200400001)(508600001)(6512007)(6486002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?8HL7f5bZxiFhLr4zFfk8m7vstGP8YuA1ulOURD2iAenwGOK3/7tzDehW?=
 =?Windows-1252?Q?KXS4TIE9tvwQn8MRe2SUuLKSFN3crWPZFp6kJfPtgMcGsC7cNd9mqekl?=
 =?Windows-1252?Q?sIO9dNxpZpaBhEAKuOuRtBFQQeymE/OlLDRSm8z+ENu8pMrVucsy/g+Y?=
 =?Windows-1252?Q?qcisAjL+8mImUk9LANf7sm6PZr6TV+xuBf9NXbqFYrb98/vmWgpFnvg8?=
 =?Windows-1252?Q?/xJeIPb94RBJ+Vbc7bbmG1U1sYEK+PotPXRBFxp6vORIpKcULpVeCi29?=
 =?Windows-1252?Q?B4AymYNnXpv4tb+bTVH3mkn6KiOxPTIu6RdwV3hQ0zwgn0d80sPanmVD?=
 =?Windows-1252?Q?a/IVyViRzmylpxI6PKh7GBOPwrdQxXODb4Rx5T1I8fpEBh/SSMZaesT6?=
 =?Windows-1252?Q?9NluRxn4wHmD+JSPiU8K8qbmnUnP26Ihf4IjXesvsLfvfObCDk576CiX?=
 =?Windows-1252?Q?Glwg8n1zILwmyAyGxbZkyWtBrZufx1AQB19DgHAhBVZOKOEWT0ex8ILo?=
 =?Windows-1252?Q?x/BGr3nvJR8I9ma/Ph+33anbXvD8N3JB4aWcqihuqtvASgFfHYjd9O6H?=
 =?Windows-1252?Q?ispVfMx1SokN9/IRfB4PAyEaNDkN5RyK6FeKyGoe0XLlV5RE5tl4ZNg0?=
 =?Windows-1252?Q?lvsHtD6FPpGz0LKjzYzicJuYIkmkvuoxABMUKYlLdc4xT+7w3LEtOa0l?=
 =?Windows-1252?Q?OZ9p5fcgJTXZGBIe/2LtFtINj4QGT34HmsTP+omkr3Jbbf809I1JRaWk?=
 =?Windows-1252?Q?jWXz7Vr8gn0xrKNT0W147Y7OB+XtHsGzwH9G5dZ1p+t5AdkJnB7VR9AP?=
 =?Windows-1252?Q?gtb4p7WrWlD6s0nOxKd+W7E4DMSww3zfyKpf9PZiF4pRfry9HWoK8fhy?=
 =?Windows-1252?Q?1NYn05q0GDjF+dYTXQVnFvMY0RNAyFm1JKxxcl1DzjGRp1LPdkNWFptW?=
 =?Windows-1252?Q?CtUMw9V5JifTXyvGXBMXFEcLmMBOr0mpa6w/JZyxjeQczx0wXTdmB4aV?=
 =?Windows-1252?Q?7m3gutiaMUjRhfQEyjD3/Pvoju3rDJLBibx5fs8wBJd8NoGMmrJ5DWrK?=
 =?Windows-1252?Q?3Y86Y1anFrGmds5EcRSSqLV7lfRn04A77KlKx5FoUi/ttXMbLyz91goE?=
 =?Windows-1252?Q?Dk+h+ZLFMFBjDh+40vO0PW1xxtkv50weMVbrYujUjnh8GH61KZA6PBYP?=
 =?Windows-1252?Q?wL0HOYG5M5W5gLwWMcz5DLosahYO560jV0cWHVUPfKOZSmRc1qgfPamZ?=
 =?Windows-1252?Q?bsBrs3rrdtYlm4sikd+2GA2884l8+UPqCzAr0QjhMobXVgYmbDNdMR1g?=
 =?Windows-1252?Q?6UR66jAJxoEKLaZ2yHtPDaOTIlcbPEuH0IxvNoNn/N6DxL/AL5cxUNT9?=
 =?Windows-1252?Q?93zHqOUu5t6TikD57NsfsWdAtvKHm+CPYdEIz88QY4ZO0pOONv72yqe2?=
 =?Windows-1252?Q?GBPMaLcLoeoiH9gBYuYCNt4f36dGen5meSsJEt/UMxEO1t7a3RNzO6Og?=
 =?Windows-1252?Q?69a8EvowNaCZj7Fx0CG+fSuTinnzP18yhcEdZUv000WOflm9DAUuw5Zx?=
 =?Windows-1252?Q?Ebkk75cIeXrk0+/dhcD5N8zwnYMzgBSOfpy9FYqGjFvjwE9NunHdWz21?=
 =?Windows-1252?Q?YBvFddKdo+YmS4N647bJr7CHPX9cP/APG2EBtpe9tLgqp+H4Jw8XurZd?=
 =?Windows-1252?Q?73SZA6Oo6q6UVasTyNn15+RR+XuYuXKsEagayfkzMOHL4XmGGXEscmP9?=
 =?Windows-1252?Q?M3BB1fBsAj/yIpJV3tM=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <5FE0A9A51AF6664F891CF892EFD89858@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7352dd9f-3194-40c4-0f7b-08da00cf0d76
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 06:44:10.9793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6ccEWKQsRIp1xpdaU8+/Pj1BtcTqhC8Bziuv53nzyCQye8WLfxT5HpvhlusIdI1LVaPw8APtaikh0RftXOeyg==
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
Cc: "Xu, Terrence" <terrence.xu@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Yes. I just sent the PR to i915. When that pull got merged, we will know th=
e kernel version.

Thanks,
Zhi.

On 3/3/22 6:47 AM, Ong, Hui Chun wrote:
> Hi,
>=20
> Has this patch been accepted upstream? And which version of kernel?
>=20
> Rgds
> Hui Chun
>=20
> -----Original Message-----
> From: Zhenyu Wang <zhenyuw@linux.intel.com>=20
> Sent: Wednesday, February 23, 2022 4:43 PM
> To: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: Wang, Zhi A <zhi.a.wang@intel.com>; intel-gvt-dev@lists.freedesktop.o=
rg; Ong, Hui Chun <hui.chun.ong@intel.com>; Xu, Terrence <terrence.xu@intel=
.com>
> Subject: Re: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
>=20
> On 2022.02.22 10:05:32 -0500, Zhi Wang wrote:
>> The mdev attribute "name" is required by some middle software, e.g.
>> KubeVirt, an open source SW that manages VM on Kubernetes cluster uses=20
>> the mdev sysfs directory/file structure to discover mediated device in=20
>> nodes in the cluster.
>>
>> v2:
>>
>> - Fix the missing defination in gvt_type_attrs. (Zhenyu)
>>
>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>> Cc: Hui Chun Ong <hui.chun.ong@intel.com>
>> Cc: Terrence Xu <terrence.xu@intel.com>
>> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gvt/kvmgt.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c=20
>> b/drivers/gpu/drm/i915/gvt/kvmgt.c
>> index 20b82fb036f8..da9d9f05985f 100644
>> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
>> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
>> @@ -186,14 +186,30 @@ static ssize_t description_show(struct mdev_type *=
mtype,
>>  		       type->weight);
>>  }
>> =20
>> +static ssize_t name_show(struct mdev_type *mtype,
>> +			       struct mdev_type_attribute *attr, char *buf) {
>> +	struct intel_vgpu_type *type;
>> +	struct intel_gvt *gvt =3D=20
>> +kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
>> +
>> +	type =3D &gvt->types[mtype_get_type_group_id(mtype)];
>> +	if (!type)
>> +		return 0;
>> +
>> +	return sprintf(buf, "%s\n", type->name); }
>> +
>> +
>>  static MDEV_TYPE_ATTR_RO(available_instances);
>>  static MDEV_TYPE_ATTR_RO(device_api);  static=20
>> MDEV_TYPE_ATTR_RO(description);
>> +static MDEV_TYPE_ATTR_RO(name);
>> =20
>>  static struct attribute *gvt_type_attrs[] =3D {
>>  	&mdev_type_attr_available_instances.attr,
>>  	&mdev_type_attr_device_api.attr,
>>  	&mdev_type_attr_description.attr,
>> +	&mdev_type_attr_name.attr,
>>  	NULL,
>>  };
>> =20
>=20
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20
> Thanks!
>=20

