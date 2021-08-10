Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C93E5C34
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Aug 2021 15:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EAD89FA9;
	Tue, 10 Aug 2021 13:52:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA10989FA5;
 Tue, 10 Aug 2021 13:52:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="195171653"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="195171653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 06:52:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="515849013"
Received: from allisonc-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.36.250])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 06:52:08 -0700
Date: Tue, 10 Aug 2021 09:52:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "Yuan, Hang" <hang.yuan@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <YRKEhyXqzS5UXQTz@intel.com>
References: <20210810050133.GO13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810050133.GO13928@zhen-hp.sh.intel.com>
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

On Tue, Aug 10, 2021 at 01:01:33PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's one regression fix for windows VM hang issue on recent drivers.
> 
> Thanks
> --
> The following changes since commit c90b4503ccf42d9d367e843c223df44aa550e82a:
> 
>   drm/i915/gvt: Clear d3_entered on elsp cmd submission. (2021-07-08 16:42:34 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2021-08-10
> 
> for you to fetch changes up to 699aa57b35672c3b2f230e2b7e5d0ab8c2bde80a:
> 
>   drm/i915/gvt: Fix cached atomics setting for Windows VM (2021-08-09 14:42:09 +0800)

pulled, thanks

> 
> ----------------------------------------------------------------
> gvt-fixes-2021-08-10
> 
> - Fix windows VM hang issue for atomics workaround (Zhenyu)
> 
> ----------------------------------------------------------------
> Zhenyu Wang (1):
>       drm/i915/gvt: Fix cached atomics setting for Windows VM
> 
>  drivers/gpu/drm/i915/gvt/handlers.c     | 1 +
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 ++
>  2 files changed, 3 insertions(+)


