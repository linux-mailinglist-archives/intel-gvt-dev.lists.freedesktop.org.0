Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114784191B2
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Sep 2021 11:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805CE6E83D;
	Mon, 27 Sep 2021 09:39:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013816E83D;
 Mon, 27 Sep 2021 09:39:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="211529813"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="211529813"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 02:39:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="561153172"
Received: from susuale1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.36.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 02:39:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, "Lv\, 
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan\, Hang" <hang.yuan@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20210918071105.GY14689@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210918071105.GY14689@zhen-hp.sh.intel.com>
Date: Mon, 27 Sep 2021 12:39:36 +0300
Message-ID: <87czous6g7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, 18 Sep 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's one ww lock fini fix from Zhi which resolved recent regression
> with i915 change.

Thanks, pulled and pushed to drm-intel-fixes.

BR,
Jani.

>
> Thanks
> --
> The following changes since commit 71de496cc489b6bae2f51f89da7f28849bf2836e:
>
>   drm/i915/dp: Drop redundant debug print (2021-08-26 07:31:52 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2021-09-18
>
> for you to fetch changes up to d168cd797982db9db617113644c87b8f5f3cf27e:
>
>   drm/i915/gvt: fix the usage of ww lock in gvt scheduler. (2021-09-13 21:59:31 +0800)
>
> ----------------------------------------------------------------
> gvt-fixes-2021-09-18
>
> - ww locking fix from Zhi
>
> ----------------------------------------------------------------
> Zhi A Wang (1):
>       drm/i915/gvt: fix the usage of ww lock in gvt scheduler.
>
>  drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
