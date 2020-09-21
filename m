Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8386271A74
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 21 Sep 2020 07:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6ED6E14C;
	Mon, 21 Sep 2020 05:37:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C1C6E141;
 Mon, 21 Sep 2020 05:37:30 +0000 (UTC)
IronPort-SDR: 2Er8ZgDMgLJzyePdGzPp2EQEXz15vZdVqNipE1KLeWl7DBzLIoovSaCAegFWCeH/qNDc0nXOX8
 a/jPfL7j+9wA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="157697025"
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; d="scan'208";a="157697025"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2020 22:37:30 -0700
IronPort-SDR: es6PtM/Sclg/sfgRzVfXoFSYgODZKA06jxFU6FlZdO5S74yP+H5xD1W3k7MLC8Tru8mzo7H9Cj
 ZX+lzbe4AiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; d="scan'208";a="308862356"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 20 Sep 2020 22:37:30 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 22:37:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 22:37:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 20 Sep 2020 22:37:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 20 Sep 2020 22:37:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZjvUg+sQk74LhkqvOhC6bVqkpYF6tZkvP9DK/oV0hx0xp+yi5W4RuWgEHlqQR2KMBMxRwF9vjvlp8JUcC1byqfXnqxmuz87NxfsvUy12UVjAOi7EuRgXeMjeta0MJmOXJfDJ/ef4wp9bszimKh/GqnHRJObmbSerjOXaLJbvftT7M8C5NchPVZC6EEwOWi0fANchQggqqTIWRav8s6uFUTkul8+NFOubGY/xORwxXyoYuTo5eNucvvG9qL22dlBNEb8tUvi80EEQsA/xZVGEz1vyATCxEDCE5YTmAYHMcHepnowP4rxBl6UTlfQZIxBGLGxg+9r8Z708o3f3qIVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFDes5qCKfxj4bWCwojl+yimMPS6MfWaqSFwAM7EMno=;
 b=gdb02hIX9G0kIF/8V9N7ptYXufxbo69BPIdBTdYGDKuiv0hYRMkt2YwHIJ9DZYi9dwHD5+/gIzD9c5XBnFYgxmtCfh339Yh/bnVdTF/nq5+X21HCOGJGyBSQ+K2MDDWJIq5BNWrJwe7Su8cos0lKw4ZHQHhyG6LEP9NFj4zcRDP+9udfJbRwK4CdMl7DzBmHdXLrczrMXu3OkRLR86yQIUJxpGeKW34G1YU802bo0h7RKF24KiQ6bRwaC0D8vAw8UxTG4eGUryn8A6gFZp1R241pMRoxptRoOJTyD8CL3xATr88hQZhcGtcjAldEy6dK0WRrLdjZ+b27m4bjydLpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFDes5qCKfxj4bWCwojl+yimMPS6MfWaqSFwAM7EMno=;
 b=h0+tG9U89D1lp70XEacZRi1eD4edqVXuJFgbJz6kzLLVpCFo+/9XcAPKZfr2+31lRVDxtgIpEPAkUJuiV/Zfcbn2eqo7LvIW2iruu5RAi6Bq+X0ZYL2SYSW26x3ERYnYMlltoMZrToNvFTlnVhcT7M82dZF3CFrcu9wJ8EPT1VY=
Received: from BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 05:37:26 +0000
Received: from BYAPR11MB3672.namprd11.prod.outlook.com
 ([fe80::f1e3:d0d5:92e0:5dea]) by BYAPR11MB3672.namprd11.prod.outlook.com
 ([fe80::f1e3:d0d5:92e0:5dea%7]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 05:37:26 +0000
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v1 01/12] drm/i915: introduced vgpu pv
 capability
Thread-Topic: [Intel-gfx] [PATCH v1 01/12] drm/i915: introduced vgpu pv
 capability
Thread-Index: AQHWhLGSa1e5LnHQ2UyfwbLJa99P6qlh3g+AgBDJwAA=
Date: Mon, 21 Sep 2020 05:37:26 +0000
Message-ID: <6a2f3fb679257898c5dc2a38770460173f995f63.camel@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
 <1599236505-9086-2-git-send-email-xiaolin.zhang@intel.com>
 <87tuw522x4.fsf@intel.com>
In-Reply-To: <87tuw522x4.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f98767b1-81c9-4157-7f94-08d85df06c31
x-ms-traffictypediagnostic: BYAPR11MB3816:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB381609B7EB9729A95C737F52EF3A0@BYAPR11MB3816.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMIn6XCOT9UJIn57iOQtIw6HftYxlyoZ4zhxwQbU+FhBp9z4uG7ZOQD/mMyL58Sl/3RJoGvkBRPhcVvqUTVbKV42YpiQXXAh+h1t51iCbkgDh+X3N+7EfeoeSB6O/TI0p192HOmqdF8iIUR+Z1pkZawpEdpGu3CRxOUqx8dbas37n/9B+2loml74m8GDGhT9in1/f8mXc52varIS23QYEF2xEVWb6dDHde2FM1Kcg0TOPgIzM0nuBpAZtUR4TcxB93I3GRL3wr9L6PEKfzXz49rgvXmXMefXa1grygYWoKCAmZXWVwXq4XdQxSqvkt3xsHsHVfMJ8OTRmZiylFkbuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3672.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(76116006)(478600001)(316002)(6486002)(66446008)(36756003)(64756008)(66556008)(66946007)(66476007)(91956017)(2616005)(8936002)(71200400001)(26005)(4326008)(6506007)(86362001)(5660300002)(8676002)(2906002)(110136005)(6512007)(186003)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hKh1/FQ/F4yWBkOlujo/0qczp2jYKh58v6oajRWUDGxApR3jriEKTYGJovGVDHvTImX3/NHt2UWZCpM5EeUHUjUGetFT62KGZ0jzSggpHJmLV0kmvHEOx7jjmVohnhFF0T4qAFCQ8ioEyZo6z5I0un5gUzG+4r6cbwRoiF7NVJdGI2iboRINyvjOf2rl6AEqgQecmNmzK+KiFc1qdPQhKkk6SBpX27VmfRf36gE+wIC2UAX6rQ9YsqJY1nuJQH99/1FfyJgZpcIrfafbSe1jJbaOOhbqCAsCW9jukQ8fwy41FbNA7ieb/mbUYkVpmATxA+qAU2s9HCLsBliR2pI+E/JH2qDyl61CNYBJrFC2e7pS3GDTalhjNKbA5ixhXeD5pwhK2u13qGg6QfAAmH7xOnnzg6y4PYMyVRkiUHzpb6Fmv8DL5OKUMeE59H+IjoNKi5pWoMbvb2x10YaMLtdhMTTRxkVTzbZhnyLkl0eetx1Yd+Q1NW4bRtditAiFA/p+ptQLipGO4BdwVntvIxNk4KvYnGJ50DrdSwzSpXPUrzzy9mYYfUZkeFuEkbHASNHR4PJpXYrBu1775pw/xhBqRSh9MLh49f6XzU+96A44EKeUZIFAboN/y4pg+/bY8mlSIGd4z60FEE3bhTxccawvwA==
Content-ID: <70171964E202D04F9BB0AB6F1D186B1A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98767b1-81c9-4157-7f94-08d85df06c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 05:37:26.0223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g66jDSq9ZOODzhzGC28Kpk72ISO+DTeqqlNjCASAVOTzSPp2i48adGBXi6hsB+ZcQlOd7d0kiU+IvlKZGclTeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
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
> 
> I think the placement here over-emphasizes the importance of the
> caps. Maybe you also want to print something if vgpu isn't active?
thanks comment. will consider how to print this. 
> 
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
> 
> Seems clearer without the goto. It's not like one is an error path,
> right?
> 
> > +	}
> > +
> > +	DRM_INFO("Virtual GPU for Intel GVT-g detected with PV
> > Optimized.\n");
> 
> Please retain use of drm_info().
> 
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
> 
> The indentation is off here, and all over the place, as reported by
> checkpatch. Please address them everywhere.
> 
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
> 
> If you use kernel-doc, please write proper kernel-doc comments.
> Again,
> please see the report sent to you by our CI.
> 
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
> 
> The comment adds nothing.
> 
> > +enum pv_caps {
> 
> Please prefix the type name and the enumerations with intel_ or
> something.
> 
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
