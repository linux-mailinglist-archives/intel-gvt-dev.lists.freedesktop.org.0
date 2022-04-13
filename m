Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E674FFAE0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 18:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D6410E39B;
	Wed, 13 Apr 2022 16:05:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFD210E37A;
 Wed, 13 Apr 2022 16:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649865917; x=1681401917;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=B0P3nmEX50naVXn8TViSqOWCjP5bEKVdBpHTAANIBKM=;
 b=QDb4eFtWegUnliX9Xw6u39L0xfdnGgGw23FFLTEVYoEBakoBEdLT7gTZ
 MHKKckf4MHeER4Pe4Q0MJsAY3TMEKvkv1UgYBt5oJCZFIWHQt7SzBXNV6
 UuQNEk87kh0xqZiqZe47g4UW8KUtiBTDwRBeRXEg+hebdSng2xm2EzT9f
 xJiwVAUCscWJOA3pTOrxYNJxWip6DfiQPMSz38+LaKNGG7EUWpkdgCfko
 YeVzoXoJlDi1FLHzjBY6eLtleXNQk+UeX1MRBBaplunpOBL9xUGIGbStb
 xY7u3dvMje1o6U6d4LQRg6uIhbbEWd2SRPMF6UTkChqLkPCwBcBJGPxQt w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="287737614"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="287737614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 09:05:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="573332045"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.150.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 09:04:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/2] drm/i915/gvt: clean up makefile
In-Reply-To: <20220413154120.GC27532@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1649852517.git.jani.nikula@intel.com>
 <20220413154120.GC27532@lst.de>
Date: Wed, 13 Apr 2022 19:04:54 +0300
Message-ID: <87y209ezq1.fsf@intel.com>
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
 Zhi Wang <zhi.wang.linux@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022, Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Apr 13, 2022 at 03:25:37PM +0300, Jani Nikula wrote:
>> This is [1] rebased on gvt-next. (Which means it won't build on CI.)
>
> Btw, now that I found that gvt-next branch:
>
> Zhi, your commits still have per-commit changelog like:
>
> v6:
>  - Remove the reference of intel_gvt_device_info.(Christoph)
>  - Refine the save_mmio() function. (Christoph)
>
> which don't belong in the commit log.  It might be worth to fix that
> before sending a pull request.

I'll just note, without any value judgement, that it is customary in the
drm land to do so. They are fine here even if they're not accepted in
other subsystems. I'm not going to insist one way or the other.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
