Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28B365A60
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Apr 2021 15:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5643C89854;
	Tue, 20 Apr 2021 13:43:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24989854;
 Tue, 20 Apr 2021 13:43:33 +0000 (UTC)
IronPort-SDR: fgmEL/9XyZ8xyw+XQ5JsW1gaTkRBSYX91MSDbh/Qqo1lKtALW28kzJvMEHx25VxPTXju+RAacr
 jsdTcn3Rws4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280834566"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="280834566"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:43:24 -0700
IronPort-SDR: YQmTEgBXZVwNlSyolQrbyInc+Q1kWsAfHjg2dkX5fTJuR25JdW4wnRDPAaEgO/SRlSarIAlf3Q
 vY+HefTYdYEQ==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="452492117"
Received: from jyick-mobl.amr.corp.intel.com (HELO intel.com) ([10.212.57.228])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:43:23 -0700
Date: Tue, 20 Apr 2021 09:43:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <YH7aeio2Yx3SDvIq@intel.com>
References: <20210420023312.GL1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420023312.GL1551@zhen-hp.sh.intel.com>
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 10:33:12AM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's one BDW regression fix for cmd parser rework in 5.12 on recent
> Windows guest driver update. Sorry to be a bit late, hopefully can
> still catch up.

pulled, thanks!

> 
> Thanks!
> ---
> The following changes since commit b6a37a93c9ac3900987c79b726d0bb3699d8db4e:
> 
>   drm/i915: Fix invalid access to ACPI _DSM objects (2021-04-07 19:07:44 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2021-04-20
> 
> for you to fetch changes up to 6b5b2a5bcfe9a250da19bac4ef7cabdc81d154ec:
> 
>   drm/i915/gvt: Fix BDW command parser regression (2021-04-16 13:41:41 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2021-04-20
> 
> - Fix cmd parser regression on BDW (Zhenyu)
> 
> ----------------------------------------------------------------
> Zhenyu Wang (1):
>       drm/i915/gvt: Fix BDW command parser regression
> 
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
