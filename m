Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D059815B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Aug 2022 12:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21379BC7D8;
	Thu, 18 Aug 2022 10:16:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E54BC7D8;
 Thu, 18 Aug 2022 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660817747; x=1692353747;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YIlK145YnTrtkqCSVNUYb214nlmUyZrXguc7Ge3+Dw4=;
 b=KUdWlF7ti9SyJLgQCfibHMraEWyr1YlLtC4Zf2Xl4nsNrcA6DoXcuKMU
 3k2Zd/f7Xixt3MbllChLS6JwkVsvqO17HLWYT04CYzErwOeT66o6v7in2
 f2mxoJL61PewgqSKt6kerkjsy6JdKy/uL3HcDacua3W74mTE0xKNfKIRC
 3sdHD3iiK6+vQ6za3CawshFK7P29G7oIDxPqbhxNbkfy52b6tanKSPOJ8
 C3NlYh5TuujbpHNUB4NGSFXz0eRc1ELX4CfF/TBb70nLLvKek+ruhn2a9
 iGAaj4j8o2+5gh1BL+0SBwZn4Y8qCrTbjd8szr5WJBUx74P3mYINiTZgT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293998529"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="293998529"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 03:15:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="668044508"
Received: from mwiniars-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.40.166])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 03:15:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>, "King, Colin" <colin.king@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <9f6e3433-5748-b7e4-bbc6-b0e47cb9d1c5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com> <20220816040508.GG1089@zhen-hp.sh.intel.com>
 <20220816044303.GH1089@zhen-hp.sh.intel.com>
 <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
 <9f6e3433-5748-b7e4-bbc6-b0e47cb9d1c5@gmail.com>
Date: Thu, 18 Aug 2022 13:15:33 +0300
Message-ID: <875yipq2m2.fsf@intel.com>
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

On Wed, 17 Aug 2022, "Colin King (gmail)" <colin.i.king@gmail.com> wrote:
> On 17/08/2022 21:07, Vivi, Rodrigo wrote:
>> On Tue, 2022-08-16 at 12:43 +0800, Zhenyu Wang wrote:
>>> On 2022.08.16 12:05:08 +0800, Zhenyu Wang wrote:
>>>> On 2022.08.15 19:32:45 -0400, Rodrigo Vivi wrote:
>>>>> On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhenyu Wang wrote:
>>> oh, surprise! I just found Colin's email is actually defined in
>>> .mailmap,
>>> so all his commits in kernel are changed for @intel.com address as in
>>> mailmap...
>> 
>> Colin, would you mind to get the Sign-off-by in the patches the same
>> as your authorship so the tools don't get confused?
>> (starting with modifying in tree this already merged patch)
>
> Since my patches are generally trivial janitorial fixed done in my spare 
> time I'm going to get the .mailmap changed to use my gmail email address 
> rather than my Intel one (since I don't do kernel work in my current role).
>
> This should clean up the confusion. Apologies.

Everyone hold your horses.

I think our tooling should handle the mailmap stuff. The commit *is*
fine, it's just that the when we check it, we let mailmap alter it. We
should check the commit without mailmap modifications.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
