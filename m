Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A435F926
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Apr 2021 18:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA406E4AF;
	Wed, 14 Apr 2021 16:43:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AE26E4AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 14 Apr 2021 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618418637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoq/vve13zxgvLDBXXboRO7gNidH42KD3YGLZyilcKY=;
 b=GKjmay+1YPcKCejfTnX+6whXcOx3OM+AQ8o0qdw1mTqVYZgGYdYuloTrZkpFyXCUZaAbfE
 /hN9fVQS9aa3sDQbLn6/wV0Yr+noquRnXGZoomkFmyQ1Mf+Y9r3Lf7gqh20iz8Rqtyxm5H
 mV33tS6kI+l7CQl0lZMHyVRpKd3Qp/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-HRiUeCPPPcOTQxay1_gp8w-1; Wed, 14 Apr 2021 12:43:55 -0400
X-MC-Unique: HRiUeCPPPcOTQxay1_gp8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65D6A814338;
 Wed, 14 Apr 2021 16:43:54 +0000 (UTC)
Received: from omen (ovpn-117-254.rdu2.redhat.com [10.10.117.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDA9469FA4;
 Wed, 14 Apr 2021 16:43:53 +0000 (UTC)
Date: Wed, 14 Apr 2021 10:43:53 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix BDW command parser regression
Message-ID: <20210414104353.36f61fe7@omen>
In-Reply-To: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
References: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 14 Apr 2021 16:48:12 +0800
Zhenyu Wang <zhenyuw@linux.intel.com> wrote:

> On BDW new Windows driver has brought extra registers to handle for
> LRM/LRR command in WA ctx. Add allowed registers in cmd parser for BDW.
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: stable@vger.kernel.org
> Fixes: 73a37a43d1b0 ("drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Thanks!

Tested-by: Alex Williamson <alex.williamson@redhat.com>

> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index fef1e857cefc..01c1d1b36acd 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -916,19 +916,26 @@ static int cmd_reg_handler(struct parser_exec_state *s,
>  
>  	if (!strncmp(cmd, "srm", 3) ||
>  			!strncmp(cmd, "lrm", 3)) {
> -		if (offset != i915_mmio_reg_offset(GEN8_L3SQCREG4) &&
> -				offset != 0x21f0) {
> +		if (offset == i915_mmio_reg_offset(GEN8_L3SQCREG4) ||
> +		    offset == 0x21f0 ||
> +		    (IS_BROADWELL(gvt->gt->i915) &&
> +		     offset == i915_mmio_reg_offset(INSTPM)))
> +			return 0;
> +		else {
>  			gvt_vgpu_err("%s access to register (%x)\n",
>  					cmd, offset);
>  			return -EPERM;
> -		} else
> -			return 0;
> +		}
>  	}
>  
>  	if (!strncmp(cmd, "lrr-src", 7) ||
>  			!strncmp(cmd, "lrr-dst", 7)) {
> -		gvt_vgpu_err("not allowed cmd %s\n", cmd);
> -		return -EPERM;
> +		if (IS_BROADWELL(gvt->gt->i915) && offset == 0x215c)
> +			return 0;
> +		else {
> +			gvt_vgpu_err("not allowed cmd %s reg (%x)\n", cmd, offset);
> +			return -EPERM;
> +		}
>  	}
>  
>  	if (!strncmp(cmd, "pipe_ctrl", 9)) {

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
