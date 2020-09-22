Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB5C27476E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Sep 2020 19:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856D66E8CD;
	Tue, 22 Sep 2020 17:27:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25C6E8CF;
 Tue, 22 Sep 2020 17:27:29 +0000 (UTC)
IronPort-SDR: 52PBwtrd00UhtlQLZ83rOnUx/4YUjavZ9st6vesjHUplbYB0RZ0i2OwYXFV1+Y+5idSUxLpVDs
 xilcpI4Epntg==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="140145439"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="140145439"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 10:27:28 -0700
IronPort-SDR: 3ctCw1yfVA/UVgQhgBWb97q0m4tz74T7YXwzal6jt9uInMKsVJ5CMrAZZ06VTiYnoRg2cWpIeA
 FqGHtCtZgzwg==
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="454570497"
Received: from kgriffi1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.84.202])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 10:27:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20200917064208.GF11592@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200917064208.GF11592@zhen-hp.sh.intel.com>
Date: Tue, 22 Sep 2020 20:27:37 +0300
Message-ID: <87o8lxraba.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 17 Sep 2020, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's one left GVT fix against 5.9 is for kernel oops with VFIO edid
> on BDW.

Pulled, thanks.

BR,
Jani.

>
> Thanks
> --
> The following changes since commit a291e4fba259a56a6a274c1989997acb6f0bb03a:
>
>   drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context (2020-06-17 12:36:19 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-09-17
>
> for you to fetch changes up to 28284943ac94014767ecc2f7b3c5747c4a5617a0:
>
>   drm/i915/gvt: Fix port number for BDW on EDID region setup (2020-09-14 16:44:39 +0800)
>
> ----------------------------------------------------------------
> gvt-fixes-2020-09-17
>
> - Fix kernel oops for VFIO edid on BDW (Zhenyu)
>
> ----------------------------------------------------------------
> Zhenyu Wang (1):
>       drm/i915/gvt: Fix port number for BDW on EDID region setup
>
>  drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
