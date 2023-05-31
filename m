Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D82717BA5
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 May 2023 11:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BD810E1C7;
	Wed, 31 May 2023 09:20:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059C10E1C7;
 Wed, 31 May 2023 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685524828; x=1717060828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c8Dj9q9sRVhj8VCJKbVr1A6H0/7mJzLhVKywppNVYsM=;
 b=PAvPQ78fuQhjt3m7FbAgaJmFOXRsQefs96hF45psDxhKQWgbd4nkii3W
 ZhSnbZ0AKeKoqVlgHBbrwCkgye0Cs++RnUHNiKOWgkwEmCvLK41/qe8su
 F24O5EibhXE7stHU5IaOvZJRjqqmXp035I5PTCk1HSP2yIr/ho95t+gsd
 ZaG4POQ8/+cMt03EvmlfH4OBISys9bF0cIrc6DVpgMqcvg2r7A5yIeI5K
 1N0xC3aLuBWmi47T0OvpBQ01hMf9YzhYgyjSFQJnzL7XbDj/DsScDs/AT
 36pGNupYWDFXXXZXaU9vQE8mI2XyDJjA9oHDwDlDlRzr/Ly9QKnKZ3Rvv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="355193194"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="355193194"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 02:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="706804135"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="706804135"
Received: from itaraban-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 02:20:24 -0700
Date: Wed, 31 May 2023 11:20:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [Intel-gfx] [PATCH RESEND] drm/i915/gvt: remove unused variable
 gma_bottom in command parser
Message-ID: <ZHcRVDptfTDwgtPf@ashyti-mobl2.lan>
References: <20230531020411.18987-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531020411.18987-1-zhi.a.wang@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Zhi,

On Wed, May 31, 2023 at 02:04:11AM +0000, Zhi Wang wrote:
> Remove unused variable gma_bottom in scan_workload() and scan_wa_ctx().
> commit be1da7070aea ("drm/i915/gvt: vGPU command scanner") introduces
> gma_bottom in several functions to calculate the size of the command
> buffer. However, some of them are set but actually unused.
> 
> When compiling the code with ccflags -Wunused-but-set-variable, gcc
> throws warnings.
> 
> Remove unused variables to avoid the gcc warnings. Tested via compiling
> the code with ccflags -Wunused-but-set-variable.
> 
> Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>

looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
