Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89341860B9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Mar 2020 01:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8946389EAC;
	Mon, 16 Mar 2020 00:17:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4B389EAC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Mar 2020 00:17:57 +0000 (UTC)
IronPort-SDR: 7TOzoIBhVpKnsXpwGCcq4n1Qy0RqCcJGfk7tTxFXg/uRojYKnUJcdAFgXdhm/ppWU1kBy9ZuS+
 b/oIZx2icBZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 17:17:56 -0700
IronPort-SDR: fJ5JEexqCrgT+uj4obj07Vt/lKYLvyfKAqt5k3sG8qG19PZQdEcBWFgqbNcLHGRd2lyT+l8yR9
 1Uz8MjHhkTkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,558,1574150400"; d="scan'208";a="323339293"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 15 Mar 2020 17:17:56 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 17:17:56 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 17:17:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sun, 15 Mar 2020 17:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke+/6B/N0KWbUNPwltZPLTbs14JMEt8KubSFbE5Qrgrg36aeQ6uZ8QMFTOTpzQZGV3BNHUM9KY6Z8hrVdfWqlx/qToTF5zp9S56FCH5B7Ydg/yvd5KZynUFh+Ww2OInadTrR5yZPX1gjFF8Ts7wByfzJiC6BM8LifOy0U5pvQ+N8V8JO7mVXJSfzNw9Bwm5gJk/FsaWAGjKYJUxi5zuhFGyE8Jm4ygne+lQtu+XeiWS0FUZrs66KKMFMAT5rPglP/bbkWa37Nn2vkue1KlNISwcLQ9q+aCESR0lQzG3hvrCvLMoWtkM3fZkIBnxyiDSVVdAHzIV9Yt5xcn/1ixfAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0f8KWpzzpA2mYE5WnwS1jqsuN9KYLEAsF7On4cuicNM=;
 b=EtTEnCZpH0BoW0asn4qNu66iLvhZ6h6CHaHmE7CP/uVJraijiP4Uv5Hsr5kFDtGY0BhmQALQGORf1ghkpt4wjTlh6/KiWtp6RQxWmfndqq2soB9PcTqKF+359RPx0Devln/9dn1e8tVeipMZ6H7z6m4DWEldkAUiUn4kn3CHm/qKBU79tfkAiaFG91Hfo7ujQH/Q4yijkSd8pkiqf4PHFWLLCXM8j80tQqmL7WTW9n7x75Nx2jYUhydKyltO5E9mfQZwbjTnN6URAgDPadc60dS/yf+zKUo7IUJCLdQQT7CMk4FIAfwl5VVAthOVt5XNfqML1B3AEfDmHCgZzC/z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0f8KWpzzpA2mYE5WnwS1jqsuN9KYLEAsF7On4cuicNM=;
 b=Ng5HHb+juaEdh7zS1eco4ScRI9HtPkDUx9gzt4EnewYFIV+JsxlSLPSCbH/1zMq+11Psh9LOYMtUrKCx2obYvZHisqlxdjLfAgZrorvYxzsuZy+RuMCLPdOQvqc0pB4mta8fN80mXMRVfteq4iJgN34RmT12Yy8pazCto/1JGM0=
Received: from BN6PR11MB1666.namprd11.prod.outlook.com (2603:10b6:405:4::8) by
 BN6PR11MB1427.namprd11.prod.outlook.com (2603:10b6:405:8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Mon, 16 Mar 2020 00:17:48 +0000
Received: from BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::707b:809e:d058:f14f]) by BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::707b:809e:d058:f14f%8]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 00:17:48 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
Thread-Topic: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
Thread-Index: AQHV8G28wgm3BbLNEk+DlrPkQjsmVqhKbqHQ
Date: Mon, 16 Mar 2020 00:17:48 +0000
Message-ID: <BN6PR11MB1666D99D7E822DDFFDF826D789F90@BN6PR11MB1666.namprd11.prod.outlook.com>
References: <20200302083130.17831-1-tina.zhang@intel.com>
In-Reply-To: <20200302083130.17831-1-tina.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tina.zhang@intel.com; 
x-originating-ip: [192.55.52.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 118ce5ec-6afc-4abc-b940-08d7c93f7535
x-ms-traffictypediagnostic: BN6PR11MB1427:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB142787CAE642501A68962A5A89F90@BN6PR11MB1427.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(8676002)(81156014)(86362001)(7696005)(54906003)(81166006)(6506007)(6636002)(186003)(26005)(55016002)(5660300002)(316002)(33656002)(66946007)(76116006)(2906002)(4326008)(8936002)(71200400001)(478600001)(6862004)(64756008)(66446008)(9686003)(52536014)(66476007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB1427;
 H:BN6PR11MB1666.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JhvJOHkziFupYySPXEJS0ty6iyn53bolBHdVsGVkhPQ+BtBphmXcibY62YyG1oWF13gbQYfc+hpYY1O2615+jH3VggFV4+c0Dgk2/kDyDmzli9Oksw5Xb/9EV14XToQUZ9c6fefZjAF5eluv07a6Q/KNz5FCFQHQCaOaz06D96wjd8FvgOolrafRWuOuciPTth0wZCt2ED0OUS8uTW7w6CZabkeY4K9QqLN1OseJkKUS+MpBT2Hb3yhV2lnhGQJG6B/Uy1DfEkGMVaUS8g3901C7zNsmOzSoPmDF17vV5ZRdryVl2ubR6iE3v//Wof7fr6vnP7aOoAMx5XmarvPQdrZdtwDbXo7yTmPzzfM/xR58OcCC9qMZ9lZhb//L0XFob90o8S1TDkCAufzgNaVLAtQg1XZs9iSkqFI+gMgdDyFnjAGw7de6kzkKTpjU976I
x-ms-exchange-antispam-messagedata: phHJADzq3dHgITZux46/TEiWHxwvqeMK3VencdKnva5Jruq2/lfmoUlg+ZoQ5f9cVXYKM+rhKegpBcmPPTIB0Ko+xz3a9NDcTNEthySE6bCmRIx3lTgr4+dC2faZjcZU+5Wgk/fMYDOq9a330h/m+Q==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 118ce5ec-6afc-4abc-b940-08d7c93f7535
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 00:17:48.0753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnaWr2yPcWAhD6S1+4Mgrj5kS6qxtiKjeMrKmnLycmR8aMr9vu6GS1Jm8znvZBRzU1HQ3PJvVHtT8CXTLpmsdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1427
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi,

We need this patch to solve the complains like this:

[70811.201818] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2341 at offset 24d8
[70811.201825] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2351 at offset 24dc
[70811.201831] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10000d82 at offset 24e0
[70811.201837] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10064844 at offset 24e4

BR,
Tina

> -----Original Message-----
> From: Zhang, Tina <tina.zhang@intel.com>
> Sent: Monday, March 2, 2020 4:32 PM
> Cc: Zhang, Tina <tina.zhang@intel.com>; intel-gvt-dev@lists.freedesktop.org;
> zhenyuw@linux.intel.com
> Subject: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
> 
> Those regs are added in order to slove the following complains:
> 
>  [70811.201818] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2341 at offset
> 24d8  [70811.201825] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2351 at
> offset 24dc  [70811.201831] gvt: vgpu(1) Invalid FORCE_NONPRIV write
> 10000d82 at offset 24e0  [70811.201837] gvt: vgpu(1) Invalid
> FORCE_NONPRIV write 10064844 at offset 24e4
> 
> So solve them by adding the required regs to the whitelist.
> 
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> b/drivers/gpu/drm/i915/gvt/handlers.c
> index 1793f6991fa8..0946d5618d29 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -460,11 +460,14 @@ static int pipeconf_mmio_write(struct intel_vgpu
> *vgpu, unsigned int offset,
>  	return 0;
>  }
> 
> -/* ascendingly sorted */
> +/* sorted in ascending order */
>  static i915_reg_t force_nonpriv_white_list[] = {
> +	_MMIO(0xd80),
>  	GEN9_CS_DEBUG_MODE1, //_MMIO(0x20ec)
>  	GEN9_CTX_PREEMPT_REG,//_MMIO(0x2248)
> -	PS_INVOCATION_COUNT,//_MMIO(0x2348)
> +	CL_PRIMITIVES_COUNT, //_MMIO(0x2340)
> +	PS_INVOCATION_COUNT, //_MMIO(0x2348)
> +	PS_DEPTH_COUNT, //_MMIO(0x2350)
>  	GEN8_CS_CHICKEN1,//_MMIO(0x2580)
>  	_MMIO(0x2690),
>  	_MMIO(0x2694),
> @@ -489,6 +492,7 @@ static i915_reg_t force_nonpriv_white_list[] = {
>  	_MMIO(0xe18c),
>  	_MMIO(0xe48c),
>  	_MMIO(0xe5f4),
> +	_MMIO(0x64844),
>  };
> 
>  /* a simple bsearch */
> --
> 2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
