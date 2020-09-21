Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1F271A61
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 21 Sep 2020 07:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575F26E141;
	Mon, 21 Sep 2020 05:27:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1AE89C82;
 Mon, 21 Sep 2020 05:27:23 +0000 (UTC)
IronPort-SDR: qgyE9TY3LjEw5x8iwKUrDiuSJ9jdTMZ5pUgCzXLU2Ynq8xreSgw0z4XbW6VU9/EfzXMVC8hA82
 ATz+/GBmaefg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="140324987"
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; d="scan'208";a="140324987"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2020 22:27:23 -0700
IronPort-SDR: QgjkxGvUvyNW6jVac1pfrMfEdZSB03o151ADZLeujdKmqx4lbX0F6YuiiTcIrSmfsD+gqrytG8
 YwTjej779btA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; d="scan'208";a="347924715"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 20 Sep 2020 22:27:22 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 22:27:22 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Sep 2020 22:27:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 20 Sep 2020 22:27:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 20 Sep 2020 22:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyDs1NlSoOz8ngdWpKiD0cac5NvtoAFW9/kY+ozP+xZu7ZdyKe0lLMgnIYEHL1DXPTdgu/QExFYMLXjBxhQ961WIauF08x2zJJ9Y6Rsz730WXawK7N8mSijwREFFnhmSouV8W7xDHZKu9qOIXA1TyZkwWeoJxtVRHX6wfMnndgeckEa+lvx6bL3VVAfTijQ5nxfTd5euDu6418A0qKxO0rMeFt9//ajmAIKAY2+YFFhbXi341CN7Tgz1rzcdU/gj22AcyCcagfLZl1eyj1BbYL7PTCYaKRSxU9ckFOjjb7r+wEQ+BTf9N6g/rduM/k9QQ6vIGnqO3Z8J1J/gSSxPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcV2iG+vHXgeGJpfbLZpklSoQzLPZ995rg2ye5w8/6E=;
 b=RiHUgktQ5c5D22x1HhngY2d8LGyAqkEELrqmJYmQbMjCXs/ZIuQtpfWjMfOowGlpCXmrdcSPwJN33tgqjz13teXvbDWRaJe4sfiwDWxCsH3zh4aSqJypSgxYlbrlYK1zGaMKbLnFvaiWuNVwpjWeindPpWjCQLfq+DBYuvMJQdVlfnC+dOezQDnUYa1Rfy1+QKEcP/+KB0w5MWMJxxce69NafP9hCoSgMhjHbwyp+rFVecwkYpG4lzW6Hr/zg39tMP7mfMZr9vJCs7jyN0vwyKF21xpf6dqVkGO92JyQf2wnj3Pix1hIFUf1R6jEOlvcGWbIl8Y5sl1VQcCtMzn30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcV2iG+vHXgeGJpfbLZpklSoQzLPZ995rg2ye5w8/6E=;
 b=qqsyGpaAL49cKtxyxN/0yYh8AxQ/HaIB/4ozlCUmXoF9RR9oxiShO5XwvTqOWy5uJF6wZpVpjZteoyyBEhxuvoA9jURIsGCI+7wyHoMfaRqXNNgsqiegsNJ6/rNZo4YMVsYV6jS5YwCZJvpze/kwEJxck1tt+grU50nqlpxlkU8=
Received: from BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30)
 by BY5PR11MB4324.namprd11.prod.outlook.com (2603:10b6:a03:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 05:27:18 +0000
Received: from BYAPR11MB3672.namprd11.prod.outlook.com
 ([fe80::f1e3:d0d5:92e0:5dea]) by BYAPR11MB3672.namprd11.prod.outlook.com
 ([fe80::f1e3:d0d5:92e0:5dea%7]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 05:27:18 +0000
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v1 02/12] drm/i915: vgpu shared memory setup
 for pv support
Thread-Topic: [Intel-gfx] [PATCH v1 02/12] drm/i915: vgpu shared memory setup
 for pv support
Thread-Index: AQHWhLGV+oyazQf8t0+4D9n9DrSnW6lh37SAgBDFRAA=
Date: Mon, 21 Sep 2020 05:27:18 +0000
Message-ID: <be56bd0b67ab8f38481e2ed8efcdef2e7d66fca4.camel@intel.com>
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
 <1599236505-9086-3-git-send-email-xiaolin.zhang@intel.com>
 <87o8md22na.fsf@intel.com>
In-Reply-To: <87o8md22na.fsf@intel.com>
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
x-ms-office365-filtering-correlation-id: c4e44f5a-2ee5-4c94-c38f-08d85def01e4
x-ms-traffictypediagnostic: BY5PR11MB4324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4324AC8A6172C2F12F97D3FFEF3A0@BY5PR11MB4324.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekZ7k7TuVpjiVCoSvNvYJ2KD7SpJznMX3VL539Ag71iqK7E6OvIDEXwx/7NqpvBWI64TlEIq/KAbngxqs3UaKAu/oywDnJlM/DyI22ksBZx4Cpphqvb4o/dd3kXG7RnQgQJVysMR9CV77RWwcfc4TGtzbP4+cpODovApNIuxl1eVjMtAPmqdQwrP2SMcMGifyXAtLwPoS5fZGYPMSYOpB8eENwj/xF0clUKoeyv1kZUP3//4Ti9haxLnsCCOPv97aOobaKJyhQbKHLnXkHCkMmnOqVIG6hXL0cbvNN6lkqkArP08+bOCQDrXsTqQ657s
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3672.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(86362001)(186003)(54906003)(26005)(2906002)(6506007)(8936002)(2616005)(71200400001)(110136005)(6486002)(91956017)(76116006)(64756008)(66556008)(66946007)(66446008)(6512007)(316002)(478600001)(8676002)(4326008)(66476007)(36756003)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QHfUvueBo5ZoTser872Ud1aiOOPsAnEwXaMLSj2EtllSYfJ1oe0DEOakN8TLVn50175rs1jWn8gQnn3HmSYfNjsafybWoOeGuIxe2m2Ddrt1lIJNj0snLdPqGtt8YMlLJ0FbPdEusktAz8YPHrjJhxrBRfU/PQU5U5XVVGtEq+a73VnPyV6Ypk8ADT1oB1obMSLhBwXLCJPe91ieaY5I/oJuoNHL71m+QHmpk/i0Px1ixaH6b0ZTyXXmUHp7TYoBD9o6pv9qzR8GqZQrO/zyxsVf2gobh8tGKBBeFz7ek6TqTFwgN5BRqvELPp4kS19fAshRnkV4pdwK/hFi6CALYlTF8drPTJ75l5Xo80RMlP3DCOYVRkmiALuiRrZnEi6bNm07OCazGBQgz/8JK+RK2J3Lxep6wxibh8CkisoNZcqcq2NEgD0lrpPyJEoliPyWP9egcpD0EkJBPs5S3WWfyAX4fW1s8F8n1LYwZjybi/Z2q3ijwsPXt7YK4i2gKbcIUv+TzexpqUgEQS0dZcJXLugX8rg/hXCAZ8NRi6+RQmnl0tB6rzjFAfhyn8p3s+QzOgwcQrQooa52/CO5sFh1BqqLMjx2u5CFnAPWrIOl4UCMB3IuSpCL/aGuO2+Pr5JdxNMfmwbliMd4TKCNVEt6Nw==
Content-ID: <FB16ADD9EC21B7498EFBF15254157329@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e44f5a-2ee5-4c94-c38f-08d85def01e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 05:27:18.1842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pj8F1ZpOKYPt94Z72Ry8nj5r5CVMa9z5LUx4teZ4fqCTwvDzZNjphNgHAWgGHIkU7DGPyzjl7qlmEyntdb0Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4324
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

On Thu, 2020-09-10 at 16:16 +0300, Jani Nikula wrote:
> On Sat, 05 Sep 2020, Xiaolin Zhang <xiaolin.zhang@intel.com> wrote:
> > To support vgpu pv features, a common shared memory is setup used
> > for
> > communication and data exchange between guest and host GVTg to
> > reduce
> > data access overhead and trap cost.
> > 
> > guest i915 will allocate this common memory (1 page size) and then
> > pass
> > it's physical address to host GVTg through PVINFO register so that
> > host
> > GVTg can access this shared guest page meory without trap cost with
> > hyperviser's facility.
> > 
> > guest i915 will send VGT_G2V_SHARED_PAGE_SETUP notification to host
> > GVTg
> > once shared memory setup succcessfully finished.
> > 
> > the layout of the shared_page also defined as well, the first part
> > is the
> > PV vervsion information used for compabilty support.
> > 
> > Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_drv.c    |  2 +
> >  drivers/gpu/drm/i915/i915_drv.h    |  4 +-
> >  drivers/gpu/drm/i915/i915_pvinfo.h |  5 +-
> >  drivers/gpu/drm/i915/i915_vgpu.c   | 94
> > ++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/i915_vgpu.h   | 14 ++++++
> >  5 files changed, 117 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_drv.c
> > b/drivers/gpu/drm/i915/i915_drv.c
> > index 00292a8..5fbb4ab 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.c
> > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > @@ -1071,6 +1071,8 @@ static void i915_driver_release(struct
> > drm_device *dev)
> >  
> >  	disable_rpm_wakeref_asserts(rpm);
> >  
> > +	intel_vgpu_destroy(dev_priv);
> > +
> >  	i915_gem_driver_release(dev_priv);
> >  
> >  	intel_memory_regions_driver_release(dev_priv);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> > b/drivers/gpu/drm/i915/i915_drv.h
> > index 16d1b51..3cde2c5f 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -809,7 +809,9 @@ struct i915_virtual_gpu {
> >  	bool active;
> >  	u32 caps;
> >  	u32 pv_caps;
> > -};
> > +
> > +	struct i915_virtual_gpu_pv *pv;
> > +} __packed;
> 
> I'm unsure why this struct should be packed.
Thanks your point it out. it is not necessary. will remove this next
version. 
> 
> >  
> >  struct intel_cdclk_config {
> >  	unsigned int cdclk, vco, ref, bypass;
> > diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h
> > b/drivers/gpu/drm/i915/i915_pvinfo.h
> > index 8b0dc25..1d44876 100644
> > --- a/drivers/gpu/drm/i915/i915_pvinfo.h
> > +++ b/drivers/gpu/drm/i915/i915_pvinfo.h
> > @@ -48,6 +48,7 @@ enum vgt_g2v_type {
> >  	VGT_G2V_PPGTT_L4_PAGE_TABLE_DESTROY,
> >  	VGT_G2V_EXECLIST_CONTEXT_CREATE,
> >  	VGT_G2V_EXECLIST_CONTEXT_DESTROY,
> > +	VGT_G2V_SHARED_PAGE_REGISTER,
> >  	VGT_G2V_MAX,
> >  };
> >  
> > @@ -112,7 +113,9 @@ struct vgt_if {
> >  
> >  	u32 pv_caps;
> >  
> > -	u32  rsv7[0x200 - 25];    /* pad to one page */
> > +	u64 shared_page_gpa;
> > +
> > +	u32  rsv7[0x200 - 27];    /* pad to one page */
> >  } __packed;
> >  
> >  #define vgtif_offset(x) (offsetof(struct vgt_if, x))
> > diff --git a/drivers/gpu/drm/i915/i915_vgpu.c
> > b/drivers/gpu/drm/i915/i915_vgpu.c
> > index 10960125..8b2b451 100644
> > --- a/drivers/gpu/drm/i915/i915_vgpu.c
> > +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> > @@ -110,6 +110,17 @@ void intel_vgpu_detect(struct drm_i915_private
> > *dev_priv)
> >  	pci_iounmap(pdev, shared_area);
> >  }
> >  
> > +void intel_vgpu_destroy(struct drm_i915_private *i915)
> > +{
> > +	struct i915_virtual_gpu_pv *pv = i915->vgpu.pv;
> > +
> > +	if (!intel_vgpu_active(i915) || !pv)
> > +		return;
> > +
> > +	__free_page(virt_to_page(pv->shared_page));
> > +	kfree(pv);
> > +}
> > +
> >  void intel_vgpu_register(struct drm_i915_private *i915)
> >  {
> >  	/*
> > @@ -360,6 +371,83 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
> >   */
> >  
> >  /*
> > + * shared_page setup for VGPU PV features
> > + */
> > +static int intel_vgpu_setup_shared_page(struct drm_i915_private
> > *i915,
> > +		void __iomem *shared_area)
> > +{
> > +	void __iomem *addr;
> > +	struct i915_virtual_gpu_pv *pv;
> > +	struct gvt_shared_page *base;
> > +	u64 gpa;
> > +	u16 ver_maj, ver_min;
> > +	int ret = 0;
> > +
> > +	/* We allocate 1 page shared between guest and GVT for data
> > exchange.
> > +	 *       _______________________________
> > +	 *      |version                        |
> > +	 *      |_______________________________PAGE/8
> > +	 *      |                               |
> > +	 *      |_______________________________PAGE/4
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |_______________________________PAGE/2
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |                               |
> > +	 *      |_______________________________|
> > +	 *
> > +	 * 0 offset: PV version area
> > +	 */
> > +
> > +	base =  (struct gvt_shared_page *)get_zeroed_page(GFP_KERNEL);
> > +	if (!base) {
> > +		dev_info(i915->drm.dev, "out of memory for shared
> > memory\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* pass guest memory pa address to GVT and then read back to
> > verify */
> > +	gpa = __pa(base);
> > +	addr = shared_area + vgtif_offset(shared_page_gpa);
> > +	writeq(gpa, addr);
> > +	if (gpa != readq(addr)) {
> > +		dev_info(i915->drm.dev, "passed shared_page_gpa
> > failed\n");
> > +		ret = -EIO;
> > +		goto err;
> > +	}
> > +
> > +	addr = shared_area + vgtif_offset(g2v_notify);
> > +	writel(VGT_G2V_SHARED_PAGE_REGISTER, addr);
> > +
> > +	ver_maj = base->ver_major;
> > +	ver_min = base->ver_minor;
> > +	if (ver_maj != PV_MAJOR || ver_min != PV_MINOR) {
> > +		dev_info(i915->drm.dev, "VGPU PV version
> > incompatible\n");
> > +		ret = -EIO;
> > +		goto err;
> > +	}
> > +
> > +	pv = kzalloc(sizeof(struct i915_virtual_gpu_pv), GFP_KERNEL);
> > +	if (!pv) {
> > +		ret = -ENOMEM;
> > +		goto err;
> > +	}
> > +
> > +	DRM_INFO("vgpu PV ver major %d and minor %d\n", ver_maj,
> > ver_min);
> 
> Please use drm_info(), and please polish the message for info
> level. This looks like debug to me.
> 
> > +	i915->vgpu.pv = pv;
> > +	pv->shared_page = base;
> > +	return ret;
> > +err:
> > +	__free_page(virt_to_page(base));
> > +	return ret;
> > +}
> > +
> > +/*
> >   * Config vgpu PV ops for different PV capabilities
> >   */
> >  void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
> > @@ -395,5 +483,11 @@ bool intel_vgpu_detect_pv_caps(struct
> > drm_i915_private *i915,
> >  	if (!pvcaps)
> >  		return false;
> >  
> > +	if (intel_vgpu_setup_shared_page(i915, shared_area)) {
> > +		i915->vgpu.pv_caps = 0;
> > +		writel(0, shared_area + vgtif_offset(pv_caps));
> > +		return false;
> > +	}
> > +
> >  	return true;
> >  }
> > diff --git a/drivers/gpu/drm/i915/i915_vgpu.h
> > b/drivers/gpu/drm/i915/i915_vgpu.h
> > index 1b10175..aeef20f 100644
> > --- a/drivers/gpu/drm/i915/i915_vgpu.h
> > +++ b/drivers/gpu/drm/i915/i915_vgpu.h
> > @@ -29,12 +29,26 @@
> >  struct drm_i915_private;
> >  struct i915_ggtt;
> >  
> > +#define PV_MAJOR        0
> > +#define PV_MINOR        1
> > +
> >  /* define different PV capabilities */
> >  enum pv_caps {
> >  	PV_NONE = 0,
> >  };
> >  
> > +/* A common shared page(4KB) between GVTg and vgpu allocated by
> > guest */
> > +struct gvt_shared_page {
> 
> Prefix with intel_?
> 
> > +	u16 ver_major;
> > +	u16 ver_minor;
> > +};
> > +
> > +struct i915_virtual_gpu_pv {
> 
> Why i915_virtual_gpu instead of intel_vgpu like everywhere else?
> 
> > +	struct gvt_shared_page *shared_page;
> > +};
> > +
> >  void intel_vgpu_detect(struct drm_i915_private *i915);
> > +void intel_vgpu_destroy(struct drm_i915_private *i915);
> >  bool intel_vgpu_active(struct drm_i915_private *i915);
> >  void intel_vgpu_register(struct drm_i915_private *i915);
> >  bool intel_vgpu_has_full_ppgtt(struct drm_i915_private *i915);
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
