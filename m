Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90C714C1B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 May 2023 16:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C6810E04F;
	Mon, 29 May 2023 14:35:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D276210E04F;
 Mon, 29 May 2023 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685370901; x=1716906901;
 h=message-id:date:to:cc:from:subject:
 content-transfer-encoding:mime-version;
 bh=d7vh+s1sSYl3QzxgBv1RoebUjjZmoqE+hcOn+Gy4MG8=;
 b=X3lcALnYrqntXvDbfXcS3XaMga/Dw/6WTFqGipYHP7iMMaJyUwBR60fj
 SV05oBWkpXcU4e61O0r3mTk6TLZVef1Z0rX0o9vBM4bNZO0MPp9jiQIgC
 TyDSo9tKodxlPr1S9RF5Hy5Hi4RdsQAK0NaSfKFa9WNZQ2Ct8jQ62iDPX
 9iOr+t2U4Y8SMxtZEngmRwI6sfIQcY+S6ylZo48Xpf59spPZWR4yMNxRu
 ZslM+VyFFTaNWuMilOEb6WdC8J/9Ui7rZaUkFt6BZOejGBkwpBqe/a0+b
 m2bOD1Wz3vtdAY3+9XUveSALc8m5COURwTerAp5ZhBquLmFWPwYLexg8p g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354732207"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="354732207"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656503736"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="656503736"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2023 07:35:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:34:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 07:34:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 07:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu0M2IfjePpp6JWrPuZylANG2EPi3sxOuGHL+3La1fMApfmfAvORGBNmlESMtwrBwocTczbDnMOyndIlYIX35Mihb7HgTDWls4rsU5KA5BSc6nLmi0Rurq14FE2dlVFkpKmLa9W6UcG8g/KJ4JoND1IQpk6x/hRkDCKgICeC/0hKOMimBlyoFT8eRoCZmEoHLM2JuRk67YtS5P3n6DSc7hL++ErTFh2VwOI+DGkhHAQtBgLDrDQU+8ar26HBA5aTrGikauq5PNI+V8mz5haH20ezLvjcgx0WUTxn1oRM5Cis3MOr172oSB1TqJb95UdFiZUK9YpxYuIWPkLEXFewig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pUlPyru0sG3whs/zDZnErKbNstiIqSd1nXeGXXw3/A=;
 b=fFXyUdBfdy/aAXv7tLZKWpVKzGRiT+DpjQnjlYsoIPk421IbJoatFKFeCC8qFb76rEyns5wOaxc3+aEnjxzAK60cH8kpZUdapFd0IbgnNtvQrdK1NNh7XTvoXWhtkSoPcAsnUXLlX/kT4OxOVbavomTgrAsc/kJMZYNB9uhH3Lq1gxb5ZT17Y/d+s4+TJGjvs6zC/GCRkzilRCEDeCJxsbk3v/cD20JA4KXO9fcwR9LJaUDxPrjgeX++zQP3NAfBT6spqy+5r+Qzg72ZCbewVRka4zwXb8hGXL+ieKPS070s40nFDzphmrfz9nTkhL223tJYKSXeZJz02xNskrc+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Mon, 29 May 2023 14:34:58 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::1fb5:ca10:6240:e80]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::1fb5:ca10:6240:e80%3]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 14:34:58 +0000
Message-ID: <7bb5f792-dbda-791c-fc52-0131b5dcd9fd@intel.com>
Date: Mon, 29 May 2023 22:34:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: [PATCH] drm/i915/gvt: remove unused variable gma_bottom in command
 parser
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: edceb2b4-5de4-41b7-ebf7-08db6051e0aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CpOxsJL7m/ViXv/gDSR2ggP1STsTJtn4Jyg6R3Drcl1sv3JlXURQx70q3zQiU42ZL/oMSejSx4kwrPfKEZZ2Clkn+2DEPo/a4LRCYgQIVaIoERKITb7FWwOqSI8NI+rJ96hZi+qRt0p1rxgQvWUWQITcuE+zXHMIIPQwoMpjbmtFIhFH1RtkTikMhj/5CxqKy9UjN6FMP2d+u6dzDyJf/jpUn1toNp86oSq2CZeckM2eleT2upO2qVYs2WXIFN/m1ju5VH/8Nsvp+G8ikcv9PN/Bs78bQbYvcSpNsRnOXToldAuuiNHgJkGnOQkNdDBrPraU8wLgSh+YAqGfW88v/qL9UO2uL7aHwf/OcpdlJUPVvLb/vmJNd4YQqmyWVhK/0+QBOrI/l2WPQoh8UaypTmZWW1C2Uol7PTbIz5SbyeRQrr1NmOGS7oyRj/f9JXcUp/4RxByaIsO3cD504Ko2zo3Ofu/Cogo24FRXLRQZUb4sYICxtCNTjJ+edhcCU16sYLbN+JG9Et9vScJrQBFFR/aRxw0EQ6wHh4qi/VH69qjzdpSTAHHgfXjcIvE4/ikBMKbWqg0dPLSuWCNNS2h9tNRnYOOOsYnXqAwPe3aFzR3R0qKNrboRDxTiWMUtNq1BDkQkXsEBI99sn0hr4ii/PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(31696002)(86362001)(6486002)(41300700001)(6916009)(4326008)(6666004)(316002)(66556008)(66476007)(66946007)(36756003)(5660300002)(186003)(478600001)(2906002)(31686004)(6506007)(6512007)(26005)(2616005)(83380400001)(8676002)(8936002)(82960400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1mQjkxWXVyRGhPRnJWQm0yMG5vYk1TM28yYVl2MHdGQlRmSjFSckNlMHpa?=
 =?utf-8?B?cUVnTldoZ0ZuZVBQeU9od3lGV2tUcHU4Zlp3ZEdxOEwvSFc0b05EQlNYNGFo?=
 =?utf-8?B?KzRJWC9nRWlGMk4xUW9TeXNZQjkrb3BleGNmZDF3OXJpR1dGKzZqNUQ3a3ov?=
 =?utf-8?B?S3RuYUJGMHpiRVN2eDdYT1RIU0U3NldzbWh5dTM0TzVyWHdnYlRhOFp2SzVY?=
 =?utf-8?B?WTh6bHNiaDBvckZNYmNSNWNIc3pCaXc4WXh4U2M0cFZNTjF5bzFNUlF4cGFR?=
 =?utf-8?B?UFRaK1R6TkdqR1ZJdUlENy94Vy9wVlJvRHVINWYxQk80TWJqODZuZXJSMURY?=
 =?utf-8?B?Ri85QzM1KzNkRWRXNlZxR0d6TEtvTzJHaWZvK20zMzNZbDNYSmxVYzAwTnhM?=
 =?utf-8?B?ejRCdDNYcFQxa2Y0Smx1bVdGU29aZ0VCbkFLNEd1RHlnNVFTTHRobktCU1pi?=
 =?utf-8?B?aWQyR2VNNUNLUGdBNXFPY2FadXBxa3J6TmppRUxaYXByYmNoZ04yN1NzMEE0?=
 =?utf-8?B?bHFST3UyYTRLNTkwM2xST2RtTDZudEcyempsdGk5RDBQeWVlKzFYeHN3b0R5?=
 =?utf-8?B?WXNSTVc3dFRCNTBxblNqYitMV0FGM3ArdmlSMVFrV0FaamJpMnAzVFJtMkNJ?=
 =?utf-8?B?VkMyNWNYNWVCVkhWVHpjaDlEdnRKZTJDQ01QZWp2NC9BdFM1R3VnTEluSFM0?=
 =?utf-8?B?VFpBRHFEMXVLT1VpaUszYUxpUGVHOFdGZUt1WGVuRUwxNXd5ZndDSitvK2c5?=
 =?utf-8?B?MU1kQ1NkLzhqb2NheFZ3RTRSalkrQ1pORVczaVpwNU5NSzdNNDhsMTJjZUtH?=
 =?utf-8?B?NnpQQ3lMZFNwWGxxUUdTU2N0YW50cHpvL1BmRkZQNUVGZDJBcnJianlUK21P?=
 =?utf-8?B?b2xZWFV1enluNlZGcm14ZWNrVy9hajBWNS9haElFNndiQVF1ZyswZkYvcXoy?=
 =?utf-8?B?bjZmWFB0eXJWcXVIU09GSjNiakRHQWZuZ2R3OWtOeVVoc2ppTlNpRHFES055?=
 =?utf-8?B?K0M4L3ladlJkV0U0aW4zYU9mMmhJR0hJeFV3enFLclZvUU9DZXlqNlBFdXd3?=
 =?utf-8?B?YXJkQ2dBQWIrcUlINk1kZ0NTbjdWZ29DOGFzUGt5T1o2SUZ5TjZMNFBKMHVi?=
 =?utf-8?B?QlRldVNJei9TY1ZUaDEwZTFOUXhZVGo2RjliaFRNMzBwRld0Sk1sQ28zR0ND?=
 =?utf-8?B?QzNRZkRGQ3VBMmVNbFRPVVc4MTVPZmRFUmhwMGxSdU40bUJTWXhxTEYyNWcy?=
 =?utf-8?B?NDUzd2pZeWQ3QVpDOGVGZEk2c2h3bUxQOTg0U2VRQmVnenNNdUVvd0p3cEN6?=
 =?utf-8?B?WUo2RWVNRE5TYVUxSTZMNko1MkkxYnRTKzA0aTYvNU9qSzVDTmV0VlpZdGsr?=
 =?utf-8?B?dC8vRXUySzR5ckVBRThwcldCaWhtclJuNXA5NnB2dTZScDlZdUZxYkMyWjJn?=
 =?utf-8?B?M1VydTRyVThkTTNvUWUwQ0hINHFtcDVXZkM5TFJpUElTSzVhWHFsbzZCOHJo?=
 =?utf-8?B?V2IvbEZnVVhQSGc4c2xOUEwycGozMit6UElxQnVYWDJ1KzduOENFMGFuK1Vw?=
 =?utf-8?B?akRFaEpmSEpPVHdoOUlseTc4dUJEUE9zN2RpSytpYms3eDUxQXY4TWhGYzYw?=
 =?utf-8?B?SXFIaER4cDF6em15ZDU5bVAraHdZMTJMa1BSVDBtb0RWNEZEM25JS0c3T1pR?=
 =?utf-8?B?Z0FZTEFVTTZTMU9aYWhydnpvM0pacUJHaXIyTlUzeXNGYWsveFNRMmZSNzlm?=
 =?utf-8?B?a0Y1Sm1JMG80T2JsN094b1hITVlaR3dwZ2QzRW5sTTgraWV1MzRvT0FTUExs?=
 =?utf-8?B?Y0pSTkpGUDRkZG5rZmxtSlZLVHU1cVpaWW1zRDEzc2FxQ0g1SDJ5czlKR0t2?=
 =?utf-8?B?YWVKWUZOT1ljVTlodUNFME1CM3RWT2dpMW5VQmRjZ2ZoQ3JvRk5VOTNDdUxK?=
 =?utf-8?B?bU1qejNCOEcwcjRmSTlpZEtkRzQzWC9ZcTVvd3FpbGhHK2tBUXZ6M0d3K3hl?=
 =?utf-8?B?dDdmT2U5RTY4UUhlK1N1THQ2bHhISGV5MmhBQXF0NzNhNEdac2hacWpaU1gz?=
 =?utf-8?B?V2dCTFJEdWtXcVRCdzI2TDYwUzR3dXdlV0VET2NiQnpqMnR1VHk1bEt2MVVm?=
 =?utf-8?Q?HI1OPLpuB6lRr2uWqVa3nZ3rN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edceb2b4-5de4-41b7-ebf7-08db6051e0aa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 14:34:58.4651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcXbENJmtXHIyNKCPV2UQTixKKuAar79zAuAU5cp0eakmRMzX1tnoLhMqeYVCnO0TgP3bdtP1m5O31KL0KTV6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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
Cc: jani.nikula@intel.com, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Remove unused variable gma_bottom in scan_workload() and scan_wa_ctx().
commit be1da7070aea ("drm/i915/gvt: vGPU command scanner") introduces
gma_bottom in several functions to calculate the size of the command
buffer. However, some of them are set but actually unused.

When compiling the code with ccflags -Wunused-but-set-variable, gcc
throws warnings.

Remove unused variables to avoid the gcc warnings. Tested via compiling
the code with ccflags -Wunused-but-set-variable.

Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
  drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c 
b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 3c4ae1da0d41..05f9348b7a9d 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -2833,7 +2833,7 @@ static int command_scan(struct parser_exec_state *s,

  static int scan_workload(struct intel_vgpu_workload *workload)
  {
-	unsigned long gma_head, gma_tail, gma_bottom;
+	unsigned long gma_head, gma_tail;
  	struct parser_exec_state s;
  	int ret = 0;

@@ -2843,7 +2843,6 @@ static int scan_workload(struct 
intel_vgpu_workload *workload)

  	gma_head = workload->rb_start + workload->rb_head;
  	gma_tail = workload->rb_start + workload->rb_tail;
-	gma_bottom = workload->rb_start +  _RING_CTL_BUF_SIZE(workload->rb_ctl);

  	s.buf_type = RING_BUFFER_INSTRUCTION;
  	s.buf_addr_type = GTT_BUFFER;
@@ -2874,7 +2873,7 @@ static int scan_workload(struct 
intel_vgpu_workload *workload)
  static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
  {

-	unsigned long gma_head, gma_tail, gma_bottom, ring_size, ring_tail;
+	unsigned long gma_head, gma_tail, ring_size, ring_tail;
  	struct parser_exec_state s;
  	int ret = 0;
  	struct intel_vgpu_workload *workload = container_of(wa_ctx,
@@ -2891,7 +2890,6 @@ static int scan_wa_ctx(struct intel_shadow_wa_ctx 
*wa_ctx)
  			PAGE_SIZE);
  	gma_head = wa_ctx->indirect_ctx.guest_gma;
  	gma_tail = wa_ctx->indirect_ctx.guest_gma + ring_tail;
-	gma_bottom = wa_ctx->indirect_ctx.guest_gma + ring_size;

  	s.buf_type = RING_BUFFER_INSTRUCTION;
  	s.buf_addr_type = GTT_BUFFER;
-- 
2.25.1
