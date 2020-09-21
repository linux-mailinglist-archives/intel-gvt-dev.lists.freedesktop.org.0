Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA496271A5D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 21 Sep 2020 07:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6561689780;
	Mon, 21 Sep 2020 05:24:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F13B8979E;
 Mon, 21 Sep 2020 05:24:16 +0000 (UTC)
IronPort-SDR: ongcDZzvpCFwIrk1hb12h241VbyRNwY65YsBX2W7m9SebX3qN1VC1gvIDffypbvhh7Y06JISAS
 h5d8iDk7TCtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="139810596"
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; d="scan'208";a="139810596"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2020 22:24:15 -0700
IronPort-SDR: PZfTWx2AvOZ7B54WRri7tPeqh4/+er9qX+jaBhtOGQTXvuepRGzhS5qSnJn+PCBM159F9TGMXB
 JE+C6NXC7KCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; d="scan'208";a="510402865"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2020 22:24:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 22:24:14 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 22:24:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 20 Sep 2020 22:24:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 20 Sep 2020 22:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMwvrIVxy/xJkBlhNpV/NnjcWBYE6A+rQS4aTjacw0KlIdtDJs0zfIaEN826wTbLtxYBb1bQ1m70NsTKR9+O/r+9uZKoVHejbry5/0RoXT1/yfW54SGh1LsqxB769bF5YM76dnFdxSne24QVdVpPFFP3RpdVHuVjaSedydBnZ3x1g+z+84x8ZIealBhNSW97QYc/Rv4cMAsaaLMxvCFCmYj2+ZT/OVLNShs5CFNLQu4yFldHw5QYPPZjJbtJbqhet4ROp5pQ1PYZQzxEaJIBqE/GI7O+kB3eqjodBZBOTJ0Fjk+DrekvY7x/ks5qbM/UUKVG848nZwlcQC86ijIHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SPhTNrkbHFCBMAAkRgvahYTHPTfm0NTY29Av7v7afw=;
 b=dFz4BiOPSrPsfbBfbwZfhFsHUfquHiWKuk4yFLQnv05RkCJWoZhmOgsLrTUGYYIAShthkFaRlFOh2dVUI3trT+5egWK9afsLphNQn5EQVNjBJV+uJq5sOrrUlCgpXHD0LONDGYrIJUrlVwCfvRG6TY3e8Dcgw7J5PMZH1tAzqqUAOsrYMExwabLoGnpN6vnDDJOzbyg+4EzzwjXmSqMkxSPlsivP7MJ6ksOx2qOLS7/jApAf2GamARAOv/W5f1UOnyDmadZl6xnjYQuvvVCZzccSlxhufj6etQPd2PQq+x5J+pUPnDQ46ngebA1huazHvnP2LFtV/u4gPlvQ2wdsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SPhTNrkbHFCBMAAkRgvahYTHPTfm0NTY29Av7v7afw=;
 b=XmpNxIjKLrMxtBmqNzJe/V9rmwrclAsRpiVh9u1cWfpCspHaRJIvWqG8oN3hVS5ppPPA7TapeED5H5hkSVXg++9PMh6s1eHPZQ/4DnPPry92OpWDesxo47Sr2MO81/UDaS95WsJK/v222uyoVLshJiXi3jV5BL/AfuAgmEUuDWc=
Received: from BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 05:24:11 +0000
Received: from BYAPR11MB3672.namprd11.prod.outlook.com
 ([fe80::f1e3:d0d5:92e0:5dea]) by BYAPR11MB3672.namprd11.prod.outlook.com
 ([fe80::f1e3:d0d5:92e0:5dea%7]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 05:24:11 +0000
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v1 01/12] drm/i915: introduced vgpu pv
 capability
Thread-Topic: [Intel-gfx] [PATCH v1 01/12] drm/i915: introduced vgpu pv
 capability
Thread-Index: AQHWhLGSa1e5LnHQ2UyfwbLJa99P6qlh3jWAgBDF4YA=
Date: Mon, 21 Sep 2020 05:24:11 +0000
Message-ID: <50fa3f6a8e754f81a2c53a9e38d76d728cbf3920.camel@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
 <1599236505-9086-2-git-send-email-xiaolin.zhang@intel.com>
 <87r1r922w8.fsf@intel.com>
In-Reply-To: <87r1r922w8.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e1efc28-0a79-4a55-cd88-08d85dee92b0
x-ms-traffictypediagnostic: BYAPR11MB2680:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2680410C14545A3F620289ADEF3A0@BYAPR11MB2680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FiapQMyK1fsoErJKG6PMJS5mA8YDMSo37A6VZIbPWDdOoAYJK5p979YTFt03UScjZHDgzeenX6zibxUqUXJBsiNcyQW1UfunhkDIaDG8qo/IxoDeWj2NS7QPVlBKqoFKSbvK9uEbuBcejh5KBEUYcfaqErvVevv8XFn6ZShlUOmch9v9Nzxkraskw6fjkRmpAOkMT65jF5156XYBYcPC1VW7Yp04KYSwi+VB50alFFlQPqidFmzTsWv6VSZQip/LWWCfSe7Q1hlU7nbrim3QMd96nCDooxRZs6t8hdZ1udB9LX8L9EpeGGiE1ffpWYqY7yM4yfC4LoytyA/8YbFHqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3672.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(8676002)(6486002)(71200400001)(86362001)(66556008)(91956017)(66476007)(64756008)(6512007)(76116006)(66446008)(66946007)(5660300002)(2616005)(54906003)(316002)(6506007)(2906002)(36756003)(83380400001)(8936002)(186003)(4326008)(478600001)(26005)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: d74HFWvRZhhBl5kZrofz6jw4dak0B7xO6bsVY/uR6+/XtZ+zbn/vbRwIrtzHuW8GpileqXKnTv/DOaoJgSK9QWLwda+lT9bwNEoT2LJounabZLnvYvYdgYeXPF+H6dvSy3PjzysbPQCHTxtcJFCOa440s0SU392i6779mkJgQIRMpLa18MTmucc+jcjpdkDc8fOY1lSVTjzW++GXfMWfdb7uTE2twd54RFR72Z2hM2AuY+EAP46VYHI68jwywmaooDv8UYPkdCgVMRKs/qRrRVBtoos2Gwj554lOy9kDwgDoDBgytA5XLmUE8F6o3Ek4KlXHeb1KGljhUxfK8T6kdA5Ys6M4zG8/2O2/hmEIrntaT2JRTHS5zGOMyYWyEAsT2aTFovdG7/cJBZCCia0xoMkuentXALbaRUBJZT7XH47yjAw2wQfpJkp9xTli2gtHzDbZp7qBpGTRk9/oJUFIU7seSdlTvEuOWeI68Oa5Gso65TR7TVzR4kvLikIdVuNu15uYZ5bCP6CT0KJpYSZf3UO44+ObbXanRSIbevj1ZZowPnF3dbSY3VcAzutqabiP9U43IgBx7zJYl3oJ2JxTcu1W6if/HHh7FXosrRJmTnwGnNLf31GVfve70SaIoe7m5PTvXrtTvMitMntXf/cB9A==
Content-ID: <84662A79D349BF4CB1B92E3F9AD182A3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1efc28-0a79-4a55-cd88-08d85dee92b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 05:24:11.6046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnMmOeBdhUgqii+pvBKFmztQzU0eOWzh+Q4Na2+QUBvctHwdbY4DHaZGP3V1Jsc9X8hHFiAr1WRzwqSjacOveQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
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
Cc: "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 2020-09-10 at 16:10 +0300, Jani Nikula wrote:
> On Sat, 05 Sep 2020, Xiaolin Zhang <xiaolin.zhang@intel.com> wrote:
> > to enable vgpu pv feature, pv capability is introduced for guest by
> > new pv_caps member in struct i915_virtual_gpu and for host GVT by
> > new pv_caps register in struct vgt_if.
> > 
> > both of them are used to control different pv feature support in
> > each
> > domain and the final pv caps runtime negotiated between guest and
> > host.
> > 
> > it also adds VGT_CAPS_PV capability BIT useb by guest to query host
> > GVTg
> > whether support any PV feature or not.
> > 
> > Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_debugfs.c |  3 ++
> >  drivers/gpu/drm/i915/i915_drv.h     |  1 +
> >  drivers/gpu/drm/i915/i915_pvinfo.h  |  5 ++-
> >  drivers/gpu/drm/i915/i915_vgpu.c    | 63
> > ++++++++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_vgpu.h    | 10 ++++++
> >  5 files changed, 80 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c
> > b/drivers/gpu/drm/i915/i915_debugfs.c
> > index 7842199..fd1e0fc 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -48,6 +48,7 @@
> >  #include "i915_trace.h"
> >  #include "intel_pm.h"
> >  #include "intel_sideband.h"
> > +#include "i915_vgpu.h"
> 
> Please keep includes sorted.
Sure. thanks for review. 
> 
> >  
> >  static inline struct drm_i915_private *node_to_i915(struct
> > drm_info_node *node)
> >  {
> > @@ -60,6 +61,8 @@ static int i915_capabilities(struct seq_file *m,
> > void *data)
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  
> >  	seq_printf(m, "pch: %d\n", INTEL_PCH_TYPE(i915));
> > +	if (intel_vgpu_active(i915))
> > +		seq_printf(m, "vgpu pv_caps: 0x%x\n", i915-
> > >vgpu.pv_caps);
> >  
> >  	intel_device_info_print_static(INTEL_INFO(i915), &p);
> >  	intel_device_info_print_runtime(RUNTIME_INFO(i915), &p);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> > b/drivers/gpu/drm/i915/i915_drv.h
> > index a455752..16d1b51 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -808,6 +808,7 @@ struct i915_virtual_gpu {
> >  	struct mutex lock; /* serialises sending of g2v_notify command
> > pkts */
> >  	bool active;
> >  	u32 caps;
> > +	u32 pv_caps;
> >  };
> >  
> >  struct intel_cdclk_config {
> > diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h
> > b/drivers/gpu/drm/i915/i915_pvinfo.h
> > index 683e97a..8b0dc25 100644
> > --- a/drivers/gpu/drm/i915/i915_pvinfo.h
> > +++ b/drivers/gpu/drm/i915/i915_pvinfo.h
> > @@ -57,6 +57,7 @@ enum vgt_g2v_type {
> >  #define VGT_CAPS_FULL_PPGTT		BIT(2)
> >  #define VGT_CAPS_HWSP_EMULATION		BIT(3)
> >  #define VGT_CAPS_HUGE_GTT		BIT(4)
> > +#define VGT_CAPS_PV			BIT(5)
> >  
> >  struct vgt_if {
> >  	u64 magic;		/* VGT_MAGIC */
> > @@ -109,7 +110,9 @@ struct vgt_if {
> >  	u32 execlist_context_descriptor_lo;
> >  	u32 execlist_context_descriptor_hi;
> >  
> > -	u32  rsv7[0x200 - 24];    /* pad to one page */
> > +	u32 pv_caps;
> > +
> > +	u32  rsv7[0x200 - 25];    /* pad to one page */
> >  } __packed;
> >  
> >  #define vgtif_offset(x) (offsetof(struct vgt_if, x))
> > diff --git a/drivers/gpu/drm/i915/i915_vgpu.c
> > b/drivers/gpu/drm/i915/i915_vgpu.c
> > index 70fca72..10960125 100644
> > --- a/drivers/gpu/drm/i915/i915_vgpu.c
> > +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> > @@ -98,7 +98,13 @@ void intel_vgpu_detect(struct drm_i915_private
> > *dev_priv)
> >  
> >  	dev_priv->vgpu.active = true;
> >  	mutex_init(&dev_priv->vgpu.lock);
> > -	drm_info(&dev_priv->drm, "Virtual GPU for Intel GVT-g
> > detected.\n");
> > +
> > +	if (!intel_vgpu_detect_pv_caps(dev_priv, shared_area)) {
> > +		DRM_INFO("Virtual GPU for Intel GVT-g detected.\n");
> > +		goto out;
> > +	}
> > +
> > +	DRM_INFO("Virtual GPU for Intel GVT-g detected with PV
> > Optimized.\n");
> >  
> >  out:
> >  	pci_iounmap(pdev, shared_area);
> > @@ -134,6 +140,18 @@ bool intel_vgpu_has_huge_gtt(struct
> > drm_i915_private *dev_priv)
> >  	return dev_priv->vgpu.caps & VGT_CAPS_HUGE_GTT;
> >  }
> >  
> > +static bool intel_vgpu_check_pv_cap(struct drm_i915_private
> > *dev_priv,
> > +		enum pv_caps cap)
> > +{
> > +	return (dev_priv->vgpu.active && (dev_priv->vgpu.caps &
> > VGT_CAPS_PV)
> > +			&& (dev_priv->vgpu.pv_caps & cap));
> > +}
> > +
> > +static bool intel_vgpu_has_pv_caps(struct drm_i915_private
> > *dev_priv)
> > +{
> > +	return dev_priv->vgpu.caps & VGT_CAPS_PV;
> > +}
> > +
> >  struct _balloon_info_ {
> >  	/*
> >  	 * There are up to 2 regions per mappable/unmappable graphic
> > @@ -336,3 +354,46 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
> >  	drm_err(&dev_priv->drm, "VGT balloon fail\n");
> >  	return ret;
> >  }
> > +
> > +/*
> > + * i915 vgpu PV support for Linux
> > + */
> > +
> > +/*
> > + * Config vgpu PV ops for different PV capabilities
> > + */
> > +void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
> > +		enum pv_caps cap, void *data)
> > +{
> > +
> > +	if (!intel_vgpu_check_pv_cap(i915, cap))
> > +		return;
> > +}
> > +
> > +/**
> > + * intel_vgpu_detect_pv_caps - detect virtual GPU PV capabilities
> > + * @dev_priv: i915 device private
> > + *
> > + * This function is called at the initialization stage, to detect
> > VGPU
> > + * PV capabilities
> > + */
> > +bool intel_vgpu_detect_pv_caps(struct drm_i915_private *i915,
> > +		void __iomem *shared_area)
> > +{
> > +	u32 gvt_pvcaps;
> > +	u32 pvcaps = 0;
> > +
> > +	if (!intel_vgpu_has_pv_caps(i915))
> > +		return false;
> > +
> > +	/* PV capability negotiation between PV guest and GVT */
> > +	gvt_pvcaps = readl(shared_area + vgtif_offset(pv_caps));
> > +	pvcaps = i915->vgpu.pv_caps & gvt_pvcaps;
> > +	i915->vgpu.pv_caps = pvcaps;
> > +	writel(pvcaps, shared_area + vgtif_offset(pv_caps));
> > +
> > +	if (!pvcaps)
> > +		return false;
> > +
> > +	return true;
> > +}
> > diff --git a/drivers/gpu/drm/i915/i915_vgpu.h
> > b/drivers/gpu/drm/i915/i915_vgpu.h
> > index ffbb77d..1b10175 100644
> > --- a/drivers/gpu/drm/i915/i915_vgpu.h
> > +++ b/drivers/gpu/drm/i915/i915_vgpu.h
> > @@ -29,6 +29,11 @@
> >  struct drm_i915_private;
> >  struct i915_ggtt;
> >  
> > +/* define different PV capabilities */
> > +enum pv_caps {
> > +	PV_NONE = 0,
> > +};
> > +
> >  void intel_vgpu_detect(struct drm_i915_private *i915);
> >  bool intel_vgpu_active(struct drm_i915_private *i915);
> >  void intel_vgpu_register(struct drm_i915_private *i915);
> > @@ -39,4 +44,9 @@ bool intel_vgpu_has_huge_gtt(struct
> > drm_i915_private *i915);
> >  int intel_vgt_balloon(struct i915_ggtt *ggtt);
> >  void intel_vgt_deballoon(struct i915_ggtt *ggtt);
> >  
> > +/* i915 vgpu pv related functions */
> > +bool intel_vgpu_detect_pv_caps(struct drm_i915_private *i915,
> > +		void __iomem *shared_area);
> > +void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
> > +		enum pv_caps cap, void *data);
> >  #endif /* _I915_VGPU_H_ */
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
