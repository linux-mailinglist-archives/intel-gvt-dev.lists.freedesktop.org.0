Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790917C5239
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Oct 2023 13:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE88F10E712;
	Wed, 11 Oct 2023 11:36:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE1C10E712;
 Wed, 11 Oct 2023 11:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697024195; x=1728560195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nGDOfXk8/hL0viVYqPMNYvzitIGkw3ffsjD2bFllPE8=;
 b=jDslfDp0qbMWk1P7W18ATDlJ3+JnRAa9MPGISptcMd+utwgQ2W+jSB/4
 igAKR7LW6Bl/ZyxxXBfoq+u6cJ34v1r7bKZuwPlOguIyNLaCDSO2VGkTB
 TKQjHTuuyz14rjzEpwCtxgbCddqgax0+N+eZ0NdLvZKj9ECapSnTwdbEx
 yacX0O/mq7iHrz/w9XYZKFf49saH9pxwUW+g/w9GAU1LlqLwWO0XOVM46
 6HAqR6kLElcPQ39u0UK8QDLquU2j5XGZRVK/Rj91JELB1h58ctKD/ycgP
 fMp+JnfZN+zmf4wrawIJyRRBE56LWxIDxGTCZ6w3HTOkof+PGfBnz3vv2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448837756"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="448837756"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="730466430"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="730466430"
Received: from bjvanakk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.111])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:36:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
In-Reply-To: <ZSZgisH1n0L0jwoq@debian-scheme>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230926121904.499888-1-jani.nikula@intel.com>
 <871qeafszw.fsf@intel.com> <ZSYtkk0EldETrP8l@debian-scheme>
 <878r8963o6.fsf@intel.com> <ZSZgisH1n0L0jwoq@debian-scheme>
Date: Wed, 11 Oct 2023 14:36:29 +0300
Message-ID: <87lec94chu.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2023.10.11 10:04:09 +0300, Jani Nikula wrote:
>> On Wed, 11 Oct 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
>> > On 2023.10.04 15:54:11 +0300, Jani Nikula wrote:
>> >> On Tue, 26 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> >> > gvt.h has no need to include i915_drv.h once the unused to_gvt() has
>> >> > been removed.
>> >> >
>> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> 
>> >> Zhenyu, Zhi, ping?
>> >> 
>> >
>> > Sorry for late reply, as last week was full holiday here.
>> >
>> > Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>> >
>> > I don't think I need to do extra pick and pull request for this or
>> > let me know if you has question.
>> 
>> Did you pick them up to gvt-next or shall I pick them up to
>> drm-intel-next?
>> 
>> If the former, I think I'd actually like a pull request, because
>> otherwise the trees will be out-of-sync for a long time.
>> 
>
> Sorry, I mean it's fine for me if you directly pick them for drm-intel-next.

Thanks for the review, pushed to drm-intel-next.

BR,
Jani.

-- 
Jani Nikula, Intel
