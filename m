Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC63D18E5
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 23:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB66E526;
	Wed, 21 Jul 2021 21:18:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719F66E3F4;
 Wed, 21 Jul 2021 21:18:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="191794797"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="191794797"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:18:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="501445118"
Received: from unknown (HELO intel.com) ([10.212.44.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:18:19 -0700
Date: Wed, 21 Jul 2021 17:18:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <YPiPGv/wtnjsxSZy@intel.com>
References: <YPgAuSt6Ps7w4/AI@infradead.org> <YPgD/8Y3/te/Hsu3@intel.com>
 <YPhApJo1o6yBYUh2@infradead.org> <YPiGI9tzLzGZg47j@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPiGI9tzLzGZg47j@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 09:40:03PM +0100, Christoph Hellwig wrote:
> On Wed, Jul 21, 2021 at 04:43:44PM +0100, Christoph Hellwig wrote:
> > > > I'm trying to test some changes for the gvt code, but even with a baseline
> > > > 5.14-rc2 host and guest the 915 driver does not seem overly happy:
> > > 
> > > Is this a regression over -rc1 or over 5.13?
> > > Bisect possible?
> > 
> > This was introduced somewhere between 5.12 and 5.13, still bisecting.
> > Note that it only happens for "headless" setups.  Once a display is
> > added on the qemu command line it goes away.
> 
> The culprit is:
> 
> commit f4eb6d4906669b4285c4f49c87814d4ce63c35bb
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Wed Mar 17 18:36:45 2021 +0200
> 
>     drm/i915/bios: limit default outputs to ports A through F
>         

could you please try this small patch?

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 5b6922e28ef2..8bbeb5978bf7 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2166,7 +2166,8 @@ static void
 init_vbt_missing_defaults(struct drm_i915_private *i915)
 {
        enum port port;
-       int ports = PORT_A | PORT_B | PORT_C | PORT_D | PORT_E | PORT_F;
+       int ports = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) | \
+                   BIT(PORT_D) | BIT(PORT_E) | BIT(PORT_F);
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
