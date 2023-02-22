Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FC69EF3A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Feb 2023 08:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DBC10E3E8;
	Wed, 22 Feb 2023 07:20:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E097210E3C7;
 Wed, 22 Feb 2023 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677050452; x=1708586452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NA9jxFHZC1atsflNhWULqD/AsdxfyXyx2Luq4wIHnTs=;
 b=DVLmNId9R9EI0qQY+mmFjyb2g2s6fMc6ZXY1oVPELZDigikWTWkZkdP3
 ymwwuAJPb9gGPTNWmXKCN8taF9kQmWh73frIbLMWzmHAhK1uW6+xtIboC
 gISBaM/uPowoTjzbRkD3ivF526+e0vmMj7osZu52yYYMP8n6Rb7UQMGGn
 yx9HpowgUZVBKrPbXaXhp2N5+4ivrhlLpdVP/4y7xDjKxeg44T7IfeFRz
 IbHHY6WT9vlCVlscWqKHS51pXZFzRDwrXXMvN/Ip+KnsUSDnCPsh1ik60
 X4qGX9GFAtVhGGtEUiC0ay5lJI6etnQwYehENiF3T5uq+RdVvBlO9j+Hj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397541558"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="397541558"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 23:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="846016958"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="846016958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 23:20:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 23:20:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 23:20:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 23:20:47 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 23:20:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGLNVTT+FqJIIfgoe/8Uz/mWS7j0f1xNDdwCdh5s7qjZ/xYr4zqyMLCXG3ohEsMnugTTybD1Cx8glbGBG5comRTDEM9j5jLtPoVrnjwZcL6w7jq71oDolw7Hwxetd6OqlIY58mTYaTyzLrmDFZx4kQ3gvu++3LN5ZVS6JB+BkaPfQtjuXbPzdyJL9hsqyqVTPGe6k4npZv0uO4d6FTdmO+bO3bS5I6K0U/W5p/G77X4CabiEkdWGLy2Dl9WrJQZqjMhRS0rSZOVslvuiuKTZA7zVGhJwvHFhJ0tQo3SoUlp217glPt7Vhf3V3vrEwxtpXE0fq4LPjebYuQjwDagEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx+72SeUeU/D7gLg4VMb9BJSGyWYb5OML+edxH40YG4=;
 b=jlRhZgMl5WKmU0xKRybGU8zRpj8dD8BivKtINbAkc9yFhaxGN+SYj1s34d+Tbq2D0kXQeA/YxpUoG0RuVAiJqvHuNqVaQHHkzytSkSoJqKPdE2wYMP54NOQvGcC5C7K50y2jXEHgJJLIfm3HWQVEkt7TNCYvG5SEXLa8tRFZqBRUq24zi/5VZmBIi1PneoZzt2s7mRYiLTMDT7GAMn5b/vPB+m5SJfeGdIT0uWNFV2k0NDIOTw8mDdfjC8JBS7NGd5ljPpwsMslKVyZGrXWRM9plpO2VGfRk6KPt0QETHBI1KdSeX2tszJKyKD3rTa3IGibjl9AcfJLqZxTKInVBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 07:20:40 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::38d9:ca7f:b9fc:ef7f]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::38d9:ca7f:b9fc:ef7f%8]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 07:20:40 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v4 08/19] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
Thread-Topic: [PATCH v4 08/19] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
Thread-Index: AQHZRadctSAahlUQt0mlt8UWBagGEK7akFgA
Date: Wed, 22 Feb 2023 07:20:40 +0000
Message-ID: <BL1PR11MB5271C2FD4491D385B97BA3598CAA9@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20230221034812.138051-1-yi.l.liu@intel.com>
 <20230221034812.138051-9-yi.l.liu@intel.com>
In-Reply-To: <20230221034812.138051-9-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5271:EE_|CO1PR11MB4884:EE_
x-ms-office365-filtering-correlation-id: 2873753e-f725-4eff-05b4-08db14a54d3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nNZ3JbIt9cLC0e7RxIocGsMlUofkZFqkcJa8dWlSNtyAMQVQkUey/XfL3uBfiuwV3W1lihrXYiErOcl5rASlWeFXa+PlZXKgJsJ/89uFMhE0uqItPnGBJrFaKn/Gb666T2h551O0QZwuU7RyJUW+P0YiY0Zasc1i1p9drj5xhAzPMsu7qnj3wHnPG5IkNt+YArYfkMxUq7q/QpQldUgKesc9F+cH7Cv+uYXGKTwDxGUPAmCV6toYwP6HCRWq6DXMRcEBHCnS04h6qa8jnAydq7FpL9MdQeV3oBYo2xY+FL+t9j6nEDGzkvpikRsvkkZLzfgDAzrzHKjZGoUWV42YlgGMJB3I72Va3TbMBOfedpGLhR007lNHgw5AvXfxvkcK8jDc/9D6dNVuABGcLQVmV4YwK/4hfTeUZPJ1EZN/8YIWxZLcAcSl0TiiXwoG8+1NrhQEjrbJFn3XAWtg3Qu4/Fic1wDgueUgSt84BM3KcAStBfqoWLQ7gBCi5Oxju9gxHEBJff+Rfx6Dk1R8cgD57l6gLHzYO5OUFMNnRP7w5bkO0bfDJmW+4R184v7haZLkbyU9IkHIEXuUJc8cTv04S7fzGwTeoffIKTOTpGrsvkacpy2Rp/noQqXOol6xy6nKhlv7OmlvhOF/IaFgUQ9Dk5fmfKFOA0VMVY0gCt6yDqQfKpebwAsPTTmUBCLHgIJXSXQduxOMco0sIozMMciv3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199018)(41300700001)(52536014)(76116006)(7696005)(9686003)(66476007)(55016003)(66946007)(66446008)(66556008)(8936002)(64756008)(6506007)(8676002)(186003)(26005)(4326008)(33656002)(86362001)(5660300002)(83380400001)(7416002)(122000001)(478600001)(54906003)(316002)(71200400001)(82960400001)(110136005)(38100700002)(2906002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OLj2YHfJ+LqbEk6iz7OAbiRwsIKXmG8tjOZ4s/aVpKjP4vn+a1A85kXr3J+c?=
 =?us-ascii?Q?spJtxwOmRfjBhOsqz/DpylKkUj/6WjLFe26lxlArsyWW2gO0NVb928GLqTyY?=
 =?us-ascii?Q?jixg0LCT0g6ZdYQ2SB5DE+hy1gbUBnB8ZsPaXclcP65MsH9co4xRPlgxySx7?=
 =?us-ascii?Q?2AtsvEVsEJUD6ejjywGsNCkcnY+XKDCoIr99zVe6lenV0JOsihsMfPVDKrE7?=
 =?us-ascii?Q?JxVj3xJnI5qmnBLRS/TdV1+Jzm9auiX7lRRQ7frjH+PadtXmol5LsJq0Fvlf?=
 =?us-ascii?Q?o+iZ+NFsSCbhMtrzzf5MvUwpZBmciAguYsPEBzDDFQeJ4s0pbfLhaB0Wvwcp?=
 =?us-ascii?Q?3DDetwEPuflOlAfhPfEB3oiG/n5LNEuBCgSHchWyb+bY+RdoGrmoRjkHjQWI?=
 =?us-ascii?Q?uXc6H+9inAk452B5QyrdPu5f7Z/bousHUANRbCswSTdmJzD1oR/KNlSVS5pk?=
 =?us-ascii?Q?dxYXP18DJSiLGXKsFCPiMdIBeyY17znnePAtaV7/WGZVMObcVzCvnIuT5YSD?=
 =?us-ascii?Q?VG9scDIkgPdNz/JgvTcFdv/SSUWPkKGI8dYj0CZhvieLGvefdFPdFatpd9LK?=
 =?us-ascii?Q?3ETkCTKzku1mamFOK8RLWGmcyegUOXaxefelexijHwDBXL3BsnXimiHKr77I?=
 =?us-ascii?Q?q4M7nj3ZxZLvWPtykG26ZdDiydP2bcjC5FqAcUMfM1LLW8yznCE5ciFB2UhX?=
 =?us-ascii?Q?qx3j5QQTo8XI79QV1VKSReq0ljqvI9/SZv1+4BDh5IOOg7xNuPApKycn9dFG?=
 =?us-ascii?Q?mla494/CW8Z2V4ZKr2bqt4o7SXb7UZrDqiXgZ0TWotKgN4u87GQNLIXDks3J?=
 =?us-ascii?Q?GhNoFdRq11NWDiWjRiu3ZA3Dv37+ITq/QEsWUxt+uw8Q4IrWfcrklM9NnMSS?=
 =?us-ascii?Q?ESta4pO1ue7auvtUQY+XikmvVDt5WPe8/IEX04VPxUR4v5mtqbc4oCxgK5tj?=
 =?us-ascii?Q?BlWrWcED5p/YNBTdXWgm4nvoqngEe6E7Dh5/RUulPYvCcEutqyzmVL8WHPiZ?=
 =?us-ascii?Q?fSs663vu6oLp68isa2Edeb2exywJnSwzDkxBeWi9NxOat+hxzMPQH9/Mcu9e?=
 =?us-ascii?Q?KHCX6IP1S89txQDlUdA4ptQwPsp1pYZ03Msboi1O/MwQ+/J+xbtpA0kb2rLW?=
 =?us-ascii?Q?OTDGijyBgzFA0D1/sN2CgD5OG9uQ0QbWC5j47r4izpdweJ/FTbUDir6/6Rgo?=
 =?us-ascii?Q?DhDfqA0dPKCFtPdLc9aHekquhQDf5fdQVKBnBryxYamjyBIHopEekfVZg231?=
 =?us-ascii?Q?LHSSa4xQKQ/mRs5S8kYEgz76D477XpIOFBbxv6C9vFbUeSvpM1raIYhkj26c?=
 =?us-ascii?Q?3hsywJEM2c6ki5EQsloi/D/C85QIChhuEzy+dWgBmudZc21USTX7uSNmtYd/?=
 =?us-ascii?Q?yZWZjBBKtW8fXL4iIAdnM724+7xopjs9O8wPgqdSEItEJ5BMTcGggUpD3m2b?=
 =?us-ascii?Q?q4+VFjKKJlncjvXGR9/Y5dua/vVVr0+ShOPHpmQ1dF/G1bs/ZU1c2FW3j8sO?=
 =?us-ascii?Q?KOfYo442JPB7p1cHTBSO74jtKQK3I0ywdr4zPpNiCZA7ey74UlnXBux/jqNk?=
 =?us-ascii?Q?o49rzDbJYu15BfCX1FO+y2ciJIVDdASxrIu72pRL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2873753e-f725-4eff-05b4-08db14a54d3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 07:20:40.0708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTA3W9bQ9cnHFdnJQ+rP/nJ3RkXOQ4H6VrBWuYs2Y70v2YDeIWGf3GON0QkTymGVsHhq4FAhYHPtfYCLRXJMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Tuesday, February 21, 2023 11:48 AM
>=20
> this suits more on what the code does.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
> index 4704c1babae3..827524510f3f 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1308,8 +1308,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct
> vfio_pci_core_device *vdev,
>  	}
>=20
>  	/*
> -	 * For each group_fd, get the group through the vfio external user
> -	 * interface and store the group and iommu ID.  This ensures the
> group
> +	 * For each group_fd, get the group file, this ensures the group
>  	 * is held across the reset.

"Get the group file for each fd to ensure the group held across the reset"

btw I'm not sure whether it's worthy of being a separate patch. but if Alex=
 is fine:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

>  	 */
>  	for (file_idx =3D 0; file_idx < hdr.count; file_idx++) {
> --
> 2.34.1

