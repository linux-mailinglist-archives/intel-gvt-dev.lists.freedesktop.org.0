Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0157513CD7
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 22:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B52E10E164;
	Thu, 28 Apr 2022 20:48:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8F910E1A0;
 Thu, 28 Apr 2022 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651178933; x=1682714933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/xnVSCOaoFaAP010wbE+n1srDSi5yVPiInCF+4eentw=;
 b=lJltDjbCwIriIqC9ztEGKRVcleKoQmnDEkk3donU+BtErlHIqbNvrJck
 tlVcQaP0Knov28Btda4V5aspFdA13ltr5MYkLcIiZlr+Zrs1Hv3Me1fPL
 vLwziaJrYgN+BAxwfJpoWSw2huw07i5nvFEWa8AtbaU9QFkGydUIyMMhg
 O4eJVtgMj+sfySDt7X265RJsgOC0kZS3jn+NJSzg01WF80nkZUy67M309
 87020teCdRzNDqayFpAApVFMEBGMDJoJhAoE6Hf+FYTDcxFLUPHI/VL2l
 XrrDJMOTHNARY+GJOAhxdi3lDxI/o/9b4eaWhzVssntLF08/QPYn7/Jbr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="291581932"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="291581932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:48:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="581626657"
Received: from jlcarlis-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.181.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:48:34 -0700
Date: Thu, 28 Apr 2022 13:48:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix missing static
Message-ID: <20220428204834.pvbkksospxjr3bbe@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220428204011.3365653-1-lucas.demarchi@intel.com>
 <a07d23e6-548c-2b4c-fb2d-d534f425e776@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a07d23e6-548c-2b4c-fb2d-d534f425e776@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 01:42:53PM -0700, Wang, Zhi A wrote:
>On 4/28/22 8:40 PM, De Marchi, Lucas wrote:
>> Fix broken build:
>>
>>       $ make W=1 drivers/gpu/drm/i915/gvt/handlers.o
>>         ...
>>         CC [M]  drivers/gpu/drm/i915/gvt/handlers.o
>>       drivers/gpu/drm/i915/gvt/handlers.c:75:6: error: no previous prototype for ‘intel_gvt_match_device’ [-Werror=missing-prototypes]
>>          75 | bool intel_gvt_match_device(struct intel_gvt *gvt,
>>             |      ^~~~~~~~~~~~~~~~~~~~~~
>>       cc1: all warnings being treated as errors
>>
>> Commit e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from
>> GVT-g") removed the prototype from the header due to the function being
>> used only in this single compilation unit, but forgot to make it static.
>>
>> Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
>> Cc: Zhi Wang <zhi.a.wang@intel.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>Hi Lucas:
>
>Thanks so much for the patch. There is a patch to fix
>undergoing already. I will take your second patch.


oh 20220427212849.18109-1-zhi.a.wang@intel.com, I missed that.

Do you mind adding the Fixes tag in that one to avoid it going to a
kernel release without that?


thanks
Lucas De Marchi
