Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B54D96A8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Mar 2022 09:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9401510E826;
	Tue, 15 Mar 2022 08:47:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CFB10E825;
 Tue, 15 Mar 2022 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647334021; x=1678870021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kakqjQCanOuw2LyERSzNKINczvU+7ul6+uHm8qhPuHs=;
 b=ZjoO+dMl0nAB1NurPjlTX/kHK0tz0I84saHrWyUrdNbZiPInQh1DMRhJ
 JzxyJdpvxa9/ozr5zxjw9c/3A3FImmGtT3JWsw+AsXumyXGB00IGiGBDr
 ukO2VIl4o/ounUrmKd4IXBEPydA+yTVbWFllFxEQfFh4eK8Q8CYy9Xo4E
 wfL3s1uPL0e/L8MmPuAbldFgIIuhzPoQFc4R2gjNoFTqpsv0z65za4IdO
 ueZatZIQ90FL+PY1CmwyxYuSwIFYzcJC9liFshMUTzuV8pajBh+gR+nK+
 24EBnJtOyvM3BMv/CAvVeN88+ltoI05q7u6hr0FpfzOG+lW9jvoav6vl3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236853211"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="236853211"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 01:46:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="556827480"
Received: from cgrilli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 01:46:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
In-Reply-To: <20220315075217.GA2830@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
 <4e2faf7b-383e-58b3-8ae9-8f8d25c64420@intel.com>
 <20220315075217.GA2830@lst.de>
Date: Tue, 15 Mar 2022 10:46:53 +0200
Message-ID: <87a6drvc02.fsf@intel.com>
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Xu, 
 Terrence" <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 15 Mar 2022, Christoph Hellwig <hch@lst.de> wrote:
> Just curious, what is the state of this seris?  It would be good to
> have it ready early on for the next merge window as there is quite
> a backlog that depends on it.

Can't speak for the status of the series, but for drm the deadline for
changes headed for the merge window is around -rc5/-rc6 timeframe
i.e. this has already missed the upcoming merge window.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
