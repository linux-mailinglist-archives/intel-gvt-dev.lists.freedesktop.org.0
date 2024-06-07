Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799F90099E
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D8110ECC1;
	Fri,  7 Jun 2024 15:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PhNl/1Oh";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058F210ECC1;
 Fri,  7 Jun 2024 15:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBo1SvvDnFk2xj2lrIjGgL6Y2LsF/RAzbrQxt2h8IJiL/jonfYkX09p2DyUDT3W1QCPeBy/SGzTmDzBPakII3OtopTYoKklVQMoLwEUUPiV5U9+DdOl59ijUPWQL9WUu0b3vHlngkkvIu3SwhGie6X6O/pXNvklDvG0JQd04L6yjE0pg8sheqC2rm0eH1u+mZ9PUy8gbzyEZOa+n14w4TbK5oWI9TtPH3DPdGTWqCivr6wzvJ6HvSCsud5T1wCDiuouR4ggc2cZbdVu5Drp8GpCjbNwKKh8WkPxVluMuGKLKrKLN/r3COrcpR2Xs2bmigDJEKhWUBSxcupVVzRgdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2K4eTkIF1GXQgp2QEntpwa7rT1ybn5B1lNDdBidJCI=;
 b=h4NFqQhmYp/L2u529HMcUL2f8aqhwbUq6cP7pHzGcvlTGtD8ZNJRJnlEjYa/3UJnDJlu6YU/UKzozoeiYV+PcIotn1zLJg/rdl8Qo79YHRVLqqhsj0T1gRyUKEg5QseBMbVMB8zrKJ7BZ/YFoUslTZGi2L/C133vHkRHNQ+81/HOSK8B0EkUW0mXBXn3bVXmfndrsmCNLc1UpEGHGwy17lngFd6gVho8A6r8OQReOzUxlm3xFBW3f9M5neZEyIepPOuezW/lPP6HDbFmFCLrdPGqmWAwbV7kfW/OCoOg85uj/+DfIhJFwTwHnHjMvK5qW+7DBwFQ584dUyuXHnGsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2K4eTkIF1GXQgp2QEntpwa7rT1ybn5B1lNDdBidJCI=;
 b=PhNl/1OhnRLZcpoDS6/QoQHc9sN/NpQ4oYfjfEzB4Axcr2D2D1oQgl6DdLeyVJzH+zhUdWCpDUzStgHM3z/TOZUpc3vFf811KXhvIjEudvCYBk02pedFIVxIOTuXt0RdY0fQKC7t9lzyyZIvJLvE9QyLc0iAvllN7GlD1C5AHqP/ZB0j3Ylda3ZrM2rOnH33Cnv8GbJhZaIZgY7FO+ReeeQxNc37MsYpgTCcdH6TewJ1EaljOWrvM5XcZhAhnorKVUGj3ualZ7+Q52MGrkIX+hRyL5J+Ed95cLs+Z6SZPB7budZ5B4m4g4RoJBsY04OAj9CaW/sdU+aCsdN+R2qeaw==
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 15:52:39 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::f6) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.22 via Frontend
 Transport; Fri, 7 Jun 2024 15:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 15:52:39 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Jun 2024
 08:52:22 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Jun 2024
 08:52:21 -0700
Received: from localhost (10.127.8.10) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Fri, 7 Jun 2024
 08:52:20 -0700
Date: Fri, 7 Jun 2024 18:52:19 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <ville.syrjala@linux.intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v2 1/6] drm/i915/gvt: remove the unused end parameter
 from calc_index()
Message-ID: <20240607185219.00001b8c.zhiw@nvidia.com>
In-Reply-To: <aaa24a5cbcf876d3b95e0f5f6594f972a860b6bc.1717773890.git.jani.nikula@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
 <aaa24a5cbcf876d3b95e0f5f6594f972a860b6bc.1717773890.git.jani.nikula@intel.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MW4PR12MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a003a4-4483-4b16-3203-08dc8709dbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EhMgXlj4RHRC/QfdrYFxmsssNBUagAJeGFek5jlav23K4KC8mZlx7zydB/Mg?=
 =?us-ascii?Q?h3y+3EjyQQ4C3GHmMrk7NfSLpVWr5C+e9iK+xu3ajbs0vbin9S1KvHS2vNMo?=
 =?us-ascii?Q?NPOU93pghti2E/pSxzeaCHpv1tqr+uSAsYYlbC+tGQKkV+bRLmbE2FMhKLG2?=
 =?us-ascii?Q?ZhX38quNyOJivmFWgAUiBglCV0vCscv1oOHuRwEGkNoGQuVXZPVJ9L+lLrFw?=
 =?us-ascii?Q?iXTj25PqiGC5EL6Am4q5kht/WzEnWLW9KxE1MFptV+7P7xE8NgDQQDEMSKOG?=
 =?us-ascii?Q?jg8DCejG4rcl+s23+W1vwFRrZtZvJFnK2PWPGuWIiZrBnZmiB8ZphiXqm6HH?=
 =?us-ascii?Q?3vbjEAcz93RGr/xsNjNqA0iFZvjvOTFfjIjCNvuuRnZUsBUwDNR4ANX3Uh26?=
 =?us-ascii?Q?pw4pXKLCloPf1zIRYgtGjiz5c6jQVV9C3NE8klSCcBEjTpJnAGhrF6KTYI1N?=
 =?us-ascii?Q?Af6NaIvsgfCw+bzBVXWzwdltLbEOlROXzMUz36+5xcjk+b2PL18PxsTvxGg2?=
 =?us-ascii?Q?KzNAHj/+DGPE6pczvvy1SB2dxlF1fn/L+Fw2U3dVVlJbKrnsu5T4nKyHW3i4?=
 =?us-ascii?Q?8DcWzrZCzN+hZl4jv5kGsA70g70CVj00hJvnyxQ7b7inH+F5sYpj6DCeG0hz?=
 =?us-ascii?Q?8wEMySDyTbYzmP6zFQVjlUttwLKNaJFCySWToVUegsVXmEW1fMPZG2j++rhw?=
 =?us-ascii?Q?CCjztSUG5reT3ecQPjn1SQHb/eXBjw/Y2SYLJmJrbIxA8KJNrHvlE3Oh8bIV?=
 =?us-ascii?Q?ZnmOH1aOyUarCCIgxTLf8uAyzQZj3qicxUgEMtZ1q0oow9rzuaeXfKic4iRW?=
 =?us-ascii?Q?DT2/Zu04JWxWLekmU824UuiGXSoWIante6TogjisbXUnI10ZhT66eIYuguxf?=
 =?us-ascii?Q?VD+GVw7Qb5WrlWsVBA1gT40OxpxAsaQek362Av8QaTNxzTuRLyzzRPeDN7Ks?=
 =?us-ascii?Q?9yFJ9thGYzg8a96mHM0X/LiQRRG+50d1BuNu7/hPAYgECwFU2VIQbw/Q0KK2?=
 =?us-ascii?Q?CQMkgWePK4scsbiq3QA3Yp2eVlEPUc35XQSH68p8s4q9OQayjPvUc+3APwOu?=
 =?us-ascii?Q?maQFmKIllVy4l7IYfiTfj8OtxPFJRZOyvTR3ca1la4T0GaqSt99W/NLES689?=
 =?us-ascii?Q?GstecSXe+MC0KVf/Peua2O+0fsZgOPuObfzNt/FI4j/u0IPVp1mwOkL0R667?=
 =?us-ascii?Q?tGUPGM9O7Ou5vHyh5xsGApGkhK2lCp0ztV0xmFJ76AwARTc+Tvxm2npPfFj2?=
 =?us-ascii?Q?EFoW57JUP/7mdNUEnA/T1XeHDSRst15MRLu9eBZpdorUpbs2qJnpJrsolcJz?=
 =?us-ascii?Q?7jhUVntpxfl1y0eoY61W2pVb2ppXQ5B/1GWvu5RAUWUUpGKlVjtI3zb+Jhvg?=
 =?us-ascii?Q?1DsaSJQTep60Gk0Ep/SOxE4/bPGDEsXp9CP01ww9PP00PPAPNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:52:39.0958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a003a4-4483-4b16-3203-08dc8709dbd2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  7 Jun 2024 18:25:35 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

Reviewed-by: Zhi Wang <zhiwang@kernel.org>

> All callers of calc_index() pass 0 for the end parameter. Remove it.
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> b/drivers/gpu/drm/i915/gvt/handlers.c index
> b3b5fdbee64f..a2e9d24d646e 100644 ---
> a/drivers/gpu/drm/i915/gvt/handlers.c +++
> b/drivers/gpu/drm/i915/gvt/handlers.c @@ -882,12 +882,11 @@ static
> int check_fdi_rx_train_status(struct intel_vgpu *vgpu, #define
> INVALID_INDEX (~0U) 
>  static unsigned int calc_index(unsigned int offset, unsigned int
> start,
> -	unsigned int next, unsigned int end, i915_reg_t i915_end)
> +			       unsigned int next, i915_reg_t _end)
>  {
> +	u32 end = i915_mmio_reg_offset(_end);
>  	unsigned int range = next - start;
>  
> -	if (!end)
> -		end = i915_mmio_reg_offset(i915_end);
>  	if (offset < start || offset > end)
>  		return INVALID_INDEX;
>  	offset -= start;
> @@ -895,13 +894,13 @@ static unsigned int calc_index(unsigned int
> offset, unsigned int start, }
>  
>  #define FDI_RX_CTL_TO_PIPE(offset) \
> -	calc_index(offset, _FDI_RXA_CTL, _FDI_RXB_CTL, 0,
> FDI_RX_CTL(PIPE_C))
> +	calc_index(offset, _FDI_RXA_CTL, _FDI_RXB_CTL,
> FDI_RX_CTL(PIPE_C)) 
>  #define FDI_TX_CTL_TO_PIPE(offset) \
> -	calc_index(offset, _FDI_TXA_CTL, _FDI_TXB_CTL, 0,
> FDI_TX_CTL(PIPE_C))
> +	calc_index(offset, _FDI_TXA_CTL, _FDI_TXB_CTL,
> FDI_TX_CTL(PIPE_C)) 
>  #define FDI_RX_IMR_TO_PIPE(offset) \
> -	calc_index(offset, _FDI_RXA_IMR, _FDI_RXB_IMR, 0,
> FDI_RX_IMR(PIPE_C))
> +	calc_index(offset, _FDI_RXA_IMR, _FDI_RXB_IMR,
> FDI_RX_IMR(PIPE_C)) 
>  static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
>  		unsigned int offset, void *p_data, unsigned int
> bytes) @@ -945,7 +944,7 @@ static int update_fdi_rx_iir_status(struct
> intel_vgpu *vgpu, }
>  
>  #define DP_TP_CTL_TO_PORT(offset) \
> -	calc_index(offset, _DP_TP_CTL_A, _DP_TP_CTL_B, 0,
> DP_TP_CTL(PORT_E))
> +	calc_index(offset, _DP_TP_CTL_A, _DP_TP_CTL_B,
> DP_TP_CTL(PORT_E)) 
>  static int dp_tp_ctl_mmio_write(struct intel_vgpu *vgpu, unsigned
> int offset, void *p_data, unsigned int bytes)
> @@ -1009,7 +1008,7 @@ static int south_chicken2_mmio_write(struct
> intel_vgpu *vgpu, }
>  
>  #define DSPSURF_TO_PIPE(offset) \
> -	calc_index(offset, _DSPASURF, _DSPBSURF, 0,
> DSPSURF(dev_priv, PIPE_C))
> +	calc_index(offset, _DSPASURF, _DSPBSURF, DSPSURF(dev_priv,
> PIPE_C)) 
>  static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int
> offset, void *p_data, unsigned int bytes)
> @@ -1032,7 +1031,7 @@ static int pri_surf_mmio_write(struct
> intel_vgpu *vgpu, unsigned int offset, }
>  
>  #define SPRSURF_TO_PIPE(offset) \
> -	calc_index(offset, _SPRA_SURF, _SPRB_SURF, 0,
> SPRSURF(PIPE_C))
> +	calc_index(offset, _SPRA_SURF, _SPRB_SURF, SPRSURF(PIPE_C))
>  
>  static int spr_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int
> offset, void *p_data, unsigned int bytes)

