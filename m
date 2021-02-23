Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6735322C97
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Feb 2021 15:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C32689B42;
	Tue, 23 Feb 2021 14:42:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EEC89B42;
 Tue, 23 Feb 2021 14:42:33 +0000 (UTC)
IronPort-SDR: Te9toicNnHhLpHYXg+3J9RNNm6PVMvB/+dKSeBX+admG5kIeKtMBmcjDnR3Vok67DYQfvpqlhR
 dyT6PnBdtm/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="269775767"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="269775767"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 06:42:32 -0800
IronPort-SDR: B30A7rHbUxONgX/CuKvH2rvKOvtMU0X8CTKW1exCv0pYE+nYnnV+BRQsDuZhnVar5WMcgNNX6t
 1yBQLNuY0JKQ==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="366609033"
Received: from mmgoodso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.211.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 06:42:31 -0800
Date: Tue, 23 Feb 2021 09:42:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
Message-ID: <YDUUVt0chYrFyUQQ@intel.com>
References: <20210222083402.GD1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222083402.GD1551@zhen-hp.sh.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 04:34:02PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Looks last gvt pull missed -gt-next window before CNY holiday.
> So here're left three changes for fixing ww locking, cmd parser
> fix for i915 state use and one left cleanup fix.

no problem at all. I believe we still have time.
pulled now.

Happy New Year!

> 
> Thanks!
> --
> The following changes since commit 81ce8f04aa96f7f6cae05770f68b5d15be91f5a2:
> 
>   drm/i915/gt: Correct surface base address for renderclear (2021-02-17 06:19:04 -0500)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-fixes-2021-02-22
> 
> for you to fetch changes up to 67f1120381df022a7016f4acc8d4880da9a66c03:
> 
>   drm/i915/gvt: Introduce per object locking in GVT scheduler. (2021-02-22 16:42:14 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-fixes-2021-02-22
> 
> - Fix to use i915 default state for cmd parser on all engines (Chris)
> - Purge dev_priv->gt (Chris)
> - Fix gvt object ww locking (Zhi)
> 
> ----------------------------------------------------------------
> Chris Wilson (2):
>       drm/i915/gvt: Parse default state to update reg whitelist
>       drm/i915/gvt: Purge dev_priv->gt
> 
> Zhi Wang (1):
>       drm/i915/gvt: Introduce per object locking in GVT scheduler.
> 
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 93 ++++++++---------------------------
>  drivers/gpu/drm/i915/gvt/execlist.c   |  8 ++-
>  drivers/gpu/drm/i915/gvt/scheduler.c  | 52 +++++++++++++++-----
>  3 files changed, 64 insertions(+), 89 deletions(-)



> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
