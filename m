Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B675876C641
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Aug 2023 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88610E4C6;
	Wed,  2 Aug 2023 07:17:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA1D10E4C6;
 Wed,  2 Aug 2023 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690960632; x=1722496632;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K7w68Be8ROY7JkeIMJ+WjNGFv2OlHQ/9NFIBHmuZmcs=;
 b=i1p+GE9dh93XP+Y89JzGmy5XNjFq9GzJxoIAuutsTc3c1GFSUwoWw+d3
 +V6I3jsF/Q52/2K9p8C255eJ8GoBvWjOPZYHTpEBLro/mL1gy9ZGaGYrT
 ST0xdn8oVs0NWQXuF4RvV8A0zn1ApoXEC6N442HjwYy56GJkwf4ciMKrQ
 EaXeM+xHT/5NQdfNd4RZVbz0zBywetwzMn0HNAczSE0S59WcIAFRENs+p
 wMJbPxkz6rwFEdJmAcRpt+obQpPVtke7jsic4X5SvizGCkwLXCKktc8nn
 ZRjqFwdLprGSn6xwiAxzpyKtx01FNIuF9TILMAZNTH/jdAYbzjfxfgfB8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368400344"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="368400344"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 00:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="843025106"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="843025106"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.213.196.157])
 ([10.213.196.157])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 00:17:10 -0700
Message-ID: <f8a96212-a7f5-d5ee-1a56-e43261a34543@linux.intel.com>
Date: Wed, 2 Aug 2023 08:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PULL] gvt-fixes
Content-Language: en-US
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <ZMnvf46JqgeIuTir@debian-scheme>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZMnvf46JqgeIuTir@debian-scheme>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 02/08/2023 06:54, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here is one gvt fix for bug in AUX CH register message length get.
> Please help to pick.

Pulled, thank you!

Regards,

Tvrtko

> Thanks!
> --
> The following changes since commit e354f67733115b4453268f61e6e072e9b1ea7a2f:
> 
>    drm/i915: Fix an error handling path in igt_write_huge() (2023-07-25 08:38:12 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/intel/gvt-linux.git tags/gvt-fixes-2023-08-02
> 
> for you to fetch changes up to 46d14e17095237007b59f56aae2d81ae2dcb0f93:
> 
>    drm/i915/gvt: Fix bug in getting msg length in AUX CH registers handler (2023-08-01 11:21:09 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2023-08-02
> 
> - Fix bug to get AUX CH register message length (Yan)
> 
> ----------------------------------------------------------------
> Yan Zhao (1):
>        drm/i915/gvt: Fix bug in getting msg length in AUX CH registers handler
> 
>   drivers/gpu/drm/i915/gvt/edid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
