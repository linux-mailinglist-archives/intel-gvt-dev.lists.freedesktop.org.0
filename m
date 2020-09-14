Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8B2684EB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 08:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6EB6E1A7;
	Mon, 14 Sep 2020 06:32:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0636E1A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Sep 2020 06:32:27 +0000 (UTC)
IronPort-SDR: dOejjBh2HEew79B5AoS5esxHvzGUuGmnEgpOvRU5ymIJZeLpTwMO8e1upk2ewR0hD0ab9CF0SJ
 UfZGOBku6yCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="138539256"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="138539256"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:32:27 -0700
IronPort-SDR: QIHlnjOOOEgP+PlSoLWblStlY4iKpA0SCV11Z16c5+IuB/r52ukjWKyJnMPko39B6isNO4sJHV
 ky+K5kLc7mhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="330603646"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2020 23:32:26 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Sep 2020 23:32:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 13 Sep 2020 23:32:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 13 Sep 2020 23:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6/B1o94gesZ0ckaZ1LI6DYABxdiIH5lKIF9EH937KHoevFY04/cbgD75SCoKu3I4WMc7MHSs+IoieJyjYDO9JIFEioSSHd/jCRudv/plVvl/gifadnDu3K62kccD9emga2lkaz3Qu6QaFwvH+WffNhntF+7aeC6UNLosH+iiON/WKuSHpvxLiVPMjGIe4K1pnLxi63el7xXo6BPcohDp0ChnPU/FxxGZr+yisXF+PiISTKMnPWXwHuUbBwhLuZ8kh3NHheHoVcmbn2JRJD4AZsaLpiwS/hF0lvlZm1M0yTaJZuG7FRgs1oQe7Ux7y6Yej17Zkrv6Y5eIJKglY996w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8h9YohKUo81MNQyZiRuqE85V/O5tlZBsVMwfHzkUyx8=;
 b=iblrQVEEIYJhfExbw9yY3/YIf82Iw/+pK06l2hk8TXl8BrnPWLK5g+F3DOMUaZfyWTrJwkPUu1QIePlCSm1FX3SuNqP0UyIiqJTgrlgU4z9dFnYKMaqnIEGEXR6wsSTWtm+Ic69vd8KRC+Seyv5//OHgLTFFCygZYBFFvQHXY7pMvyPvKIVf9rxmym6Dk2g8fUPxzISE11V/WRwVKSk2M/ipLPm5alv6Xj8HZoqV7++c+3B5oBp9g22ZSa1v+zN9SlxujNMWqwW99wn2iAaqSD3rqLa+bqp1JwHqetl0OqrHgKjb285wtAN7twegSdLYANgoZtxf5T5qmn6f6UYm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8h9YohKUo81MNQyZiRuqE85V/O5tlZBsVMwfHzkUyx8=;
 b=U8m1Ma9S0FPLvgXOiHOPdxKwDprD5CM3HKApppQKPyll2CFs2NcVPIz1JxV85pikQzU+CDWa0hcAJIbc/1w1CZjSLZIQL2etLgaZFI6nF665mBB6A9C1fAgoK1uLbufHrbaI9huVX1kH6/ifFuZIO7/huz77kwVqCRqJoKbHKEc=
Received: from BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24)
 by BYAPR11MB2917.namprd11.prod.outlook.com (2603:10b6:a03:89::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 06:32:23 +0000
Received: from BYAPR11MB3031.namprd11.prod.outlook.com
 ([fe80::9872:b30a:d04c:eefa]) by BYAPR11MB3031.namprd11.prod.outlook.com
 ([fe80::9872:b30a:d04c:eefa%5]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 06:32:23 +0000
From: "Yuan, Hang" <hang.yuan@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Fix port number for BDW on EDID region setup
Thread-Topic: [PATCH] drm/i915/gvt: Fix port number for BDW on EDID region
 setup
Thread-Index: AQHWikN8LIRn6Kn0BUCIvLVQvQB9sKlnrOVQ
Date: Mon, 14 Sep 2020 06:32:23 +0000
Message-ID: <BYAPR11MB30312DAD472244E91564E980E2230@BYAPR11MB3031.namprd11.prod.outlook.com>
References: <20200914030302.2775505-1-zhenyuw@linux.intel.com>
In-Reply-To: <20200914030302.2775505-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a692c920-6c8b-42eb-b302-08d85877f0b9
x-ms-traffictypediagnostic: BYAPR11MB2917:
x-microsoft-antispam-prvs: <BYAPR11MB2917ED5855C33F53317524DBE2230@BYAPR11MB2917.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z+//N+w5AMr6zaptSjGdEOgMWJvbWT8GzMXckNIPTGZZym74XsI9tD4ZWnyalLLfi6FwOl6C6Xp1uJPCMnOY3NojQxYmXgds/Xl526p+sAqvcUwWQ5VOXdBk+QmB6Skzpe3DGawtQwCRlKyZli2iDdnsg0y0w5pW4mItHUIfHcR1j1HtYWCeEXOs6gfQTx7tcoO0ntLUac9EbxHcf79yZqdEitmoADlotBSxui5XOCw8zC6rVN4tpB2XLF0FuE1M9+SlQPptzvwQrxi+mxBKrZ0dOaqbvVIpKR8lyyCGO/6UUI8EIS7efc7j7zZJ8c4GT5VS14QR+eoMQtFkgexGai7BMlhuMcJ1Q89KUfgebvs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(71200400001)(966005)(2906002)(26005)(7696005)(4326008)(6506007)(76116006)(53546011)(186003)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(55016002)(5660300002)(83380400001)(33656002)(52536014)(9686003)(110136005)(8936002)(478600001)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: S4em44aLSutDYDvLkWjfaRz5G01YlOMTSqzWiAkjWleHKcPkZ3/PtJ3RKYE5JfWwWjRV9w+9bWPf4b6NYilBUhN0SOLHa3JBLGb2sYFYQ2+V+1j/olmXoEmSwovGozpVyxcKOEZJKOW9706Oub/anEZRa6oi0OQQH9skgmQmmgWd3jG4i5/pS8g+gstXCu7XEx7TWBHUVeuKNbPqYWnad8MTOAlF/6y2pngvuv5ZDADRCHDSFBST/qAWJ4Ab6/KD7OYs+/jTrA0C1HoCiyTtliUYGuCFF0iLU1IXoJ7TpKMRT3khazeBMLiWiorTgT7bOUH2OWnTJHVT5uiv9Gwp82cYV1CC780/OJno2S+qQEnQq5DWn4TYdcyukNnxvj0LZKBvu/Z4HmrraYWeTHKipChMthTnXCuRgwZOgsWpuXSf3h9DK0E4JAQSKOb80hc3FvKCQrGPFZf9Y7TF1+k6JT3305kw36ox6gmASK3k0tjXeHcRVaaRm7ErutAXGvr9B0O6DR2C9FmiX3DsC80DURTAKxAS3LkPovYzrHNsBL9vYm+lS4kVLQ20LgjHP5yIRjqWi+k2Y05F1kj5sIdyAc8Yz6GC/+iBO6/1QiAFINt5n2C41QKBMBlBbvzEghWi+oIdvffI8wkSrmwAKoFfTg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a692c920-6c8b-42eb-b302-08d85877f0b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 06:32:23.4960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Me5JcAtabpCzKU/OdCSLNSsDzfq8YSEcvRF1Ct2srfz0/9zv+c2fpBJc5HfZxUp4RFAVknBkH0OK801Gbr8fmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2917
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
Cc: Alejandro Sior <aho@sior.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Thanks for the fix!

Reviewed-by: Hang Yuan <hang.yuan@intel.com>

-----Original Message-----
From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf Of Zhenyu Wang
Sent: Monday, September 14, 2020 11:03 AM
To: intel-gvt-dev@lists.freedesktop.org
Cc: Alejandro Sior <aho@sior.be>
Subject: [PATCH] drm/i915/gvt: Fix port number for BDW on EDID region setup

Current BDW virtual display port is initialized as PORT_B, so need to use same port for VFIO EDID region, otherwise invalid EDID blob pointer is assigned which caused kernel null pointer reference. We might evaluate actual display hotplug for BDW to make this function work as expected, anyway this is always required to be fixed first.

Reported-by: Alejandro Sior <aho@sior.be>
Cc: Alejandro Sior <aho@sior.be>
Fixes: 0178f4ce3c3b ("drm/i915/gvt: Enable vfio edid for all GVT supported platform")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c index 8fa9b31a2484..f6d7e33c7099 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -368,6 +368,7 @@ void intel_gvt_destroy_idle_vgpu(struct intel_vgpu *vgpu)  static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 		struct intel_vgpu_creation_params *param)  {
+	struct drm_i915_private *dev_priv = gvt->gt->i915;
 	struct intel_vgpu *vgpu;
 	int ret;
 
@@ -436,7 +437,10 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
 	if (ret)
 		goto out_clean_sched_policy;
 
-	ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
+	if (IS_BROADWELL(dev_priv))
+		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
+	else
+		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;
 
--
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
