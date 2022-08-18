Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659B05985BB
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Aug 2022 16:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9182D8EFC;
	Thu, 18 Aug 2022 14:27:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F2A8FC3A;
 Thu, 18 Aug 2022 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660832860; x=1692368860;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AY6GmSW1yGvidq9soejHLo/ffTX/hIj+qt/cbJtBilE=;
 b=i38WOPDnzlhqZ4wWEhY7gWoUETV4P1Fbmz6h4332gUSa2tUm+yQP0275
 mvrYFdBLCWQuNSSRl2Hsg02P+I6QJ5JZn/O7sc01okl8yOjWeaVcpcu44
 oKazea2VphzJyFQ4ePrqbWN3XPT/mEWQiR4iPlKQEIERgTytnnpucuYTo
 mMEYDebYBEQjwuTGnOqrr8C0EnuqcE7FUYcPUMXSaVsHYJc81vVeaJB4l
 EPkPjUHb7gwsWJL4rNHIsa48nj/ifzTZgWJe0ivlIoVxk7lOJCy3sN0R2
 9F5S/FGdJqkhbdwhdDxJnCmUAI3rzPGEnHcgSJ1x2cKymTOOW0LfaZNbH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="318791691"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="318791691"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:27:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="668123437"
Received: from mwiniars-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.40.166])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:27:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>, "King, Colin" <colin.king@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <875yipq2m2.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com> <20220816040508.GG1089@zhen-hp.sh.intel.com>
 <20220816044303.GH1089@zhen-hp.sh.intel.com>
 <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
 <9f6e3433-5748-b7e4-bbc6-b0e47cb9d1c5@gmail.com>
 <875yipq2m2.fsf@intel.com>
Date: Thu, 18 Aug 2022 17:27:34 +0300
Message-ID: <87wnb5ocdl.fsf@intel.com>
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 18 Aug 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 17 Aug 2022, "Colin King (gmail)" <colin.i.king@gmail.com> wrote:
>> On 17/08/2022 21:07, Vivi, Rodrigo wrote:
>>> On Tue, 2022-08-16 at 12:43 +0800, Zhenyu Wang wrote:
>>>> On 2022.08.16 12:05:08 +0800, Zhenyu Wang wrote:
>>>>> On 2022.08.15 19:32:45 -0400, Rodrigo Vivi wrote:
>>>>>> On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhenyu Wang wrote:
>>>> oh, surprise! I just found Colin's email is actually defined in
>>>> .mailmap,
>>>> so all his commits in kernel are changed for @intel.com address as in
>>>> mailmap...
>>> 
>>> Colin, would you mind to get the Sign-off-by in the patches the same
>>> as your authorship so the tools don't get confused?
>>> (starting with modifying in tree this already merged patch)
>>
>> Since my patches are generally trivial janitorial fixed done in my spare 
>> time I'm going to get the .mailmap changed to use my gmail email address 
>> rather than my Intel one (since I don't do kernel work in my current role).
>>
>> This should clean up the confusion. Apologies.
>
> Everyone hold your horses.
>
> I think our tooling should handle the mailmap stuff. The commit *is*
> fine, it's just that the when we check it, we let mailmap alter it. We
> should check the commit without mailmap modifications.

In this case, it's actually not about Colin's Signed-off-by or mailmap
at all! Like the error message from dim says, "committer Signed-off-by
missing". Committer, not author!

$ git show -s tags/gvt-fixes-2022-08-15^ --pretty=fuller
commit d6632370536d0b80be3bfc90dd67e1f693335a75
Author:     Colin Ian King <colin.king@intel.com>
AuthorDate: Tue Mar 15 20:24:49 2022 +0000
Commit:     Zhenyu Wang <zhenyuw@linux.intel.com>
CommitDate: Mon Aug 15 10:51:15 2022 +0800

    drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
    
    There is a spelling mistake in a gvt_vgpu_err error message. Fix it.
    
    Fixes: 695fbc08d80f ("drm/i915/gvt: replace the gvt_err with gvt_vgpu_err")
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
    Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
    Link: http://patchwork.freedesktop.org/patch/msgid/20220315202449.2952845-1-colin.i.king@gmail.com
    Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>

Committed by Zhenyu, Signed-off-by Zhi. Maybe caused by rebase by Zhenyu
after being committed by Zhi?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
