Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685331DC717
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 08:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD186E112;
	Thu, 21 May 2020 06:38:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1268E6E112
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 06:38:22 +0000 (UTC)
IronPort-SDR: QhdfrAZHDJBqrDsFPtzMl2FVD3HHFx4/VPRnMenivrMxWq4KID9crbQJaR6vXmkATrAGP34QWJ
 6vZ5aNN/PdRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 23:38:21 -0700
IronPort-SDR: KkYVDkIOA6SVZ4pZvVCmLgkYDVNgKBuwA/dAVrt+GxCEYjYRjVsN/iVTo1YslttxGzkT3OArAD
 zrtObpdhC/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,416,1583222400"; d="scan'208";a="300200086"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga002.fm.intel.com with ESMTP; 20 May 2020 23:38:21 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 20 May 2020 23:38:21 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX159.amr.corp.intel.com (10.22.240.24) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 20 May 2020 23:38:20 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.55) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 20 May 2020 23:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R15EpcRTfoEtGqUJ4VUDKkW00y8u7b0Q5YJP7zE+S3zvboR1RQYlcIHUa2w4ZZPzKIkK7F6JaDM0CcNxC/keG6rLJupLgcSoquqUsN3qJddrhh+OmuOvw7j/V4ztak449hKiRQ0jM8oCtb9Lv35DpnAQu6nzR8GNLrirv3+l3VB8RBfEIsrfF022ZbcKpm1YhLuesdUQSGFOE/3yvFMwTFlc219AscNNRDn5E47eMV7vEPXzLJnsLSAbeR7N+zQagBcG649g4HxK32MjcUQcQyYMliyNu+tqJEubwFDnhCCzfptIPfVPKd123MSYKT2IRdNg0028v5xL3qRcVptCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRcwIKOyjXFuDRjl+KrK0wAGqGRhiM/1Y8u2Dy5yJ88=;
 b=k24+xDuAV1ucIeMSjW1DTvrujrt/sCUq/JHslXg2ufsp1D9EOTUHmxztSIxYA5a5SyGk8wpwPbcWG+f9HuPFYD5O0yjz/pA0QCEMeSZ/YaCfU926i2t7/1TYCtkzYPgTeBEcvbJMzTEMaXHyMSYFa+BPPnC+smBBjsErj4vDHDf5T5QHCC500vdnm+6/jKNHw2hZDRfVcclSblzpRteo94dvnO342S2c82iOqxCCz8HDxSvxddNztemcbjPqVrjwx9ndYjwG+7pYeCDnzHYdXn+nnQNXmcnHVG05uP2kufwnUA6SN7jrz7pKbgki1SGdAjQCOA2oXo44mKRvnhZM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRcwIKOyjXFuDRjl+KrK0wAGqGRhiM/1Y8u2Dy5yJ88=;
 b=pLNdurUgJcGBbb1NIyzM9XMxLDZ3fTbN4pUnVjOtWhHEAmtvvMGa2Ihftl9WWt4L/z/m2b6c5J5bC4Aldg6JXTC3d8TYrzw96khebdnJ6pdCMbH4lVwCaJhL8C+tL3xk5/gEd2SNpFZw8SkVl7DF5hpaPhagkP7hunTvrkm1Nj4=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1869.namprd11.prod.outlook.com (2603:10b6:300:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 21 May
 2020 06:38:18 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41%2]) with mapi id 15.20.3021.020; Thu, 21 May 2020
 06:38:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Enable GVT vGPU enabled guest S3 and resume
Thread-Topic: [PATCH] drm/i915/gvt: Enable GVT vGPU enabled guest S3 and resume
Thread-Index: AQHWLNxWynOKLTO9rEW+W6ayTX4FwKiyGHfw
Date: Thu, 21 May 2020 06:38:18 +0000
Message-ID: <MWHPR11MB1645336A8739A57AFF12FC908CB70@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200518061910.147299-1-colin.xu@intel.com>
In-Reply-To: <20200518061910.147299-1-colin.xu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d10f6db3-a272-4551-41f4-08d7fd518c78
x-ms-traffictypediagnostic: MWHPR11MB1869:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1869F95C12F7EB111BF540928CB70@MWHPR11MB1869.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5y6uDz9MHeRAInjQ24qD+drXt1ZryaSA3vwZ6QKcBeiZ1MAltES6jVvjkQhjXuUzlcgiuK5J2E1WdpWXY7YwfKjlrBcjGfFgs2v01OkwtrJ7iplV7CGE7bcJI6pSDC34dkkjUBTJ/sWgIOrgPqie3K2ZXnCBD5GZ/8/2cUMIT5s/Yi1uypYHIT7WXjOJlXuZ2DRNFpdSA38ggjQ2IVy/OEA2usS1PZyx2U9MgJYU5zeCG8jy7iQAmMRsVt3C7OcqJ4PFlZob6qe6SRVCsz8hN6jAcQ7bWMbfuNaktqJW4x8AIZydJsIwvyNmo44fsm0IEui/IvDBun5KCgcTAfUsDhnLuwf/7Fv/I5JwvvAlTww=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(396003)(366004)(39860400002)(376002)(136003)(2906002)(26005)(7696005)(316002)(8676002)(55016002)(9686003)(86362001)(478600001)(966005)(8936002)(110136005)(4326008)(33656002)(107886003)(5660300002)(76116006)(186003)(64756008)(66476007)(71200400001)(66556008)(6506007)(52536014)(66446008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qIDvGXyFwkW5KtRz/nyjx9RQ8Dcb9x5nEhRHkDaJckOPD2HpgYLkMrq8tNNuyz+6AezUNI9g/30a5DmsmnziM+7ocirhTDUW64TehsvS9hLYnaY6d7EH7rm7MQUns0BCvwKBNpGTQwJBSyiLFbe+t+cu+FKUHBb2A4yixfSSgVsxqtjNhcvOMbwxwLzaMqcSlBIBqpoBc14bSnHmvihdYAl2PE+1+DZtWaCn29EfagIAdhD9V+5/fZLY9kYQx/Avb9NLXoattMD9ctopSS57q+wWkS85cVJOUZZgYfyDWZ2lYbiPmJ5JsBs73ONxTLatWCSP60/8aQh+W3LorhFsclNLQn4RqYPLlVwpqiyf1W4HY7rGtwJYNxwrz2mMudO7tcy3zheEKGRWOAkUHBCtq0sHFyAVgmnntSw9HxGADXv8wPSBYwsKzMOMIv8pk4Z1279PELPnA+ARn58pqlsdf1k9dL7q8hdgpFdjmOJs/U5kx9ujO/1SGssxKKL6MbtG
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d10f6db3-a272-4551-41f4-08d7fd518c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 06:38:18.5325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4w05vE5w9E9AXurJaiUrbvAGPNWtV1hJl1xLItVbi+j5VgsZUttubAPq/osj2MxGmREw4QA2aLgEFiWSlMnxNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1869
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
Cc: "Xu, Colin" <colin.xu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Colin Xu
> Sent: Monday, May 18, 2020 2:19 PM
> 

I feel the patch description is unclear here. Device doesn't know sleep states.
Also from your actual code change you just try to support D3hot. Then please
update the subject line to reflect that. Generally speaking, S3 is just one
usage of D3hot. There could be run-time device power management in S0
too.

> This patch enables GVT vGPU enabled guest enter and resume from S3.
> During S3, QEMU process is still active so all ppgtt still in memory

We should not assume QEMU behavior. Instead, please stick to the
expected behavior of guest S3.

> thus no need to invalidate them. However current ppgtt invalidation and
> destroy logic happens in dmlr, this operation happens during both boot

what is dmlr? later you also used dmrl? which one is correct?

> and resuming. Thus we need differ these different power states for
> proper handling.
> vCPU PCI cfg space is a modified copy from host. If PM cap is supported

vCPU->vGPU

> on host, vGPU cfg space will also report the capability and handle read
> or write request on PMCSR register. On receiving PCI_D3hot when enter S3,
> vGPU will track current PM status. During dmlr, gvt will check if current
> dmrl is during normal boot or S3 resume. If S3 resume, skip the ppgtt mm

how can GVT tell whether it's normal boot or S3 resume?

> invalidation and destroy so that they can be re-used, then clear the PM
> status flag. PCI_D0 is set prior to dmlr so can't depend on it to skip
> the ppgtt invalidation and destroy operation.

As said, above is very confusing about what this patch tries to do. You 
need describe clearly the purpose (D3hot), what is the expected
behavior on physical GPU, and then how it should be managed for vGPU.

> 
> To test this feature, make sure S3 is enabled in QEMU parameters:
> i440fx: PIIX4_PM.disable_s3=0
> q35: ICH9-LPC.disable_s3=0
> Also need enable sleep option in guest OS if it's disabled.
> 
> With all required options enabled and proper GFX driver installed, user
> can enter S3 from guest OS, and resume from QEMU monitor using
> system_wakeup.
> 
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.c       |  2 +-
>  drivers/gpu/drm/i915/gvt/gtt.h       |  2 ++
>  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 21 ++++++++++++++++++---
>  5 files changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c
> b/drivers/gpu/drm/i915/gvt/cfg_space.c
> index 072725a448db..ad86c5eb5bba 100644
> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
> @@ -70,6 +70,7 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu
> *vgpu, unsigned int off,
>  {
>  	u8 *cfg_base = vgpu_cfg_space(vgpu);
>  	u8 mask, new, old;
> +	pci_power_t pwr;
>  	int i = 0;
> 
>  	for (; i < bytes && (off + i < sizeof(pci_cfg_space_rw_bmp)); i++) {
> @@ -91,6 +92,15 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu
> *vgpu, unsigned int off,
>  	/* For other configuration space directly copy as it is. */
>  	if (i < bytes)
>  		memcpy(cfg_base + off + i, src + i, bytes - i);
> +
> +	if (off == vgpu->cfg_space.pmcsr_off && vgpu->cfg_space.pmcsr_off)
> {
> +		pwr = (pci_power_t
> __force)(*(u16*)(&vgpu_cfg_space(vgpu)[off])
> +			& PCI_PM_CTRL_STATE_MASK);
> +		if (pwr == PCI_D3hot)
> +			vgpu->d3_entered = true;
> +		gvt_dbg_core("vgpu-%d power status changed to %d\n",
> +			     vgpu->id, pwr);
> +	}
>  }
> 
>  /**
> @@ -366,6 +376,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu
> *vgpu,
>  	struct intel_gvt *gvt = vgpu->gvt;
>  	const struct intel_gvt_device_info *info = &gvt->device_info;
>  	u16 *gmch_ctl;
> +	u8 next;
> 
>  	memcpy(vgpu_cfg_space(vgpu), gvt->firmware.cfg_space,
>  	       info->cfg_space_size);
> @@ -401,6 +412,19 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu
> *vgpu,
>  		pci_resource_len(gvt->gt->i915->drm.pdev, 2);
> 
>  	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
> +
> +	/* PM Support */
> +	vgpu->cfg_space.pmcsr_off = 0;
> +	if (vgpu_cfg_space(vgpu)[PCI_STATUS] & PCI_STATUS_CAP_LIST) {
> +		next = vgpu_cfg_space(vgpu)[PCI_CAPABILITY_LIST];
> +		do {
> +			if (vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_ID] ==
> PCI_CAP_ID_PM) {
> +				vgpu->cfg_space.pmcsr_off = next +
> PCI_PM_CTRL;
> +				break;
> +			}
> +			next = vgpu_cfg_space(vgpu)[next +
> PCI_CAP_LIST_NEXT];
> +		} while (next);
> +	}
>  }
> 
>  /**
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index 210016192ce7..a3a4305eda01 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2501,7 +2501,7 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
>  	return create_scratch_page_tree(vgpu);
>  }
> 
> -static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
>  {
>  	struct list_head *pos, *n;
>  	struct intel_vgpu_mm *mm;
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
> index 320b8d6ad92f..52d0d88abd86 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -279,4 +279,6 @@ int intel_vgpu_emulate_ggtt_mmio_read(struct
> intel_vgpu *vgpu,
>  int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
>  	unsigned int off, void *p_data, unsigned int bytes);
> 
> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
> +
>  #endif /* _GVT_GTT_H_ */
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> index a4a6db6b7f90..ff7f2515a6fe 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -106,6 +106,7 @@ struct intel_vgpu_pci_bar {
>  struct intel_vgpu_cfg_space {
>  	unsigned char virtual_cfg_space[PCI_CFG_SPACE_EXP_SIZE];
>  	struct intel_vgpu_pci_bar bar[INTEL_GVT_MAX_BAR_NUM];
> +	u32 pmcsr_off;
>  };
> 
>  #define vgpu_cfg_space(vgpu) ((vgpu)->cfg_space.virtual_cfg_space)
> @@ -198,6 +199,8 @@ struct intel_vgpu {
>  	struct intel_vgpu_submission submission;
>  	struct radix_tree_root page_track_tree;
>  	u32 hws_pga[I915_NUM_ENGINES];
> +	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state
> */
> +	bool d3_entered;
> 
>  	struct dentry *debugfs;
> 
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c
> b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 1d5ff88078bd..3779f9f28061 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -257,7 +257,9 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
>  	intel_gvt_deactivate_vgpu(vgpu);
> 
>  	mutex_lock(&vgpu->vgpu_lock);
> +	vgpu->d3_entered = false;
>  	intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
> +	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
>  	intel_vgpu_dmabuf_cleanup(vgpu);
>  	mutex_unlock(&vgpu->vgpu_lock);
>  }
> @@ -393,6 +395,7 @@ static struct intel_vgpu
> *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
>  	idr_init(&vgpu->object_idr);
>  	intel_vgpu_init_cfg_space(vgpu, param->primary);
> +	vgpu->d3_entered = false;
> 
>  	ret = intel_vgpu_init_mmio(vgpu);
>  	if (ret)
> @@ -557,10 +560,15 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu
> *vgpu, bool dmlr,
>  	/* full GPU reset or device model level reset */
>  	if (engine_mask == ALL_ENGINES || dmlr) {
>  		intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
> -		intel_vgpu_invalidate_ppgtt(vgpu);
> +		if (engine_mask == ALL_ENGINES)
> +			intel_vgpu_invalidate_ppgtt(vgpu);
>  		/*fence will not be reset during virtual reset */
>  		if (dmlr) {
> -			intel_vgpu_reset_gtt(vgpu);
> +			if(!vgpu->d3_entered) {
> +				intel_vgpu_invalidate_ppgtt(vgpu);
> +				intel_vgpu_destroy_all_ppgtt_mm(vgpu);
> +			}
> +			intel_vgpu_reset_ggtt(vgpu, true);
>  			intel_vgpu_reset_resource(vgpu);
>  		}
> 
> @@ -572,7 +580,14 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu
> *vgpu, bool dmlr,
>  			intel_vgpu_reset_cfg_space(vgpu);
>  			/* only reset the failsafe mode when dmlr reset */
>  			vgpu->failsafe = false;
> -			vgpu->pv_notified = false;
> +			/*
> +			 * PCI_D0 is set before dmlr, so reset d3_entered
> here
> +			 * after done using.
> +			 */
> +			if(vgpu->d3_entered)
> +				vgpu->d3_entered = false;
> +			else
> +				vgpu->pv_notified = false;
>  		}
>  	}
> 
> --
> 2.26.2
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
