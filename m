Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB333D35B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Mar 2021 12:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AB66E3AE;
	Tue, 16 Mar 2021 11:52:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC846E3AE;
 Tue, 16 Mar 2021 11:52:16 +0000 (UTC)
IronPort-SDR: G4vzvJTEKKSIYH9k/WxNXEfULRsBOfj5Gr4lkm2f9maOdsBnpWkjqBMykupRcapVeURKVBplF3
 xEsRDJM70SvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="186866511"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="186866511"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 04:52:14 -0700
IronPort-SDR: CZuSbgZivrko2fVsY+rRZ1KyrPyZXDpGN361NGOlqQGJNLP1EDxDFYDFOtWOK/CFqEySOCdWWP
 6H/FP2DAe2WA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="412187519"
Received: from dumser-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.50.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 04:52:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next
In-Reply-To: <20210316074330.GC1551@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210316074330.GC1551@zhen-hp.sh.intel.com>
Date: Tue, 16 Mar 2021 13:52:09 +0200
Message-ID: <871rcfpb86.fsf@intel.com>
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
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 16 Mar 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> This is queued gvt-next pull for 5.13. Mostly it's for accurate
> vGPU virtual display rate tracking and change for per-vGPU vblank
> timer based on that, which brings accurate vblank injection.

Pulled to drm-intel-next.

BR,
Jani.

>
> Thanks
> --
> The following changes since commit c73927183f2b85bf1a06d75d2b51be72aff42358:
>
>   drm/i915/tgl+: Sanitize the DDI LANES/IO and AUX power domain names (2021-02-24 14:05:39 +0200)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux.git tags/gvt-next-2021-03-16
>
> for you to fetch changes up to 9317f356df83a5caeccae2e343d1a569929bcfc9:
>
>   drm/i915/gvt: Fixed couple of spellings in the file gtt.c (2021-03-01 14:02:14 +0800)
>
> ----------------------------------------------------------------
> gvt-next-2021-03-16
>
> - Parse accurate vGPU virtual display rate (Colin)
> - Convert vblank timer as per-vGPU based on current rate (Colin)
> - spelling fix (Bhaskar)
>
> ----------------------------------------------------------------
> Bhaskar Chowdhury (1):
>       drm/i915/gvt: Fixed couple of spellings in the file gtt.c
>
> Colin Xu (2):
>       drm/i915/gvt: Get accurate vGPU virtual display refresh rate from vreg
>       drm/i915/gvt: Refactor GVT vblank emulator for vGPU virtual display
>
>  drivers/gpu/drm/i915/gvt/display.c   | 107 +++++++-------
>  drivers/gpu/drm/i915/gvt/display.h   |  14 +-
>  drivers/gpu/drm/i915/gvt/gtt.c       |   4 +-
>  drivers/gpu/drm/i915/gvt/gvt.c       |  25 +++-
>  drivers/gpu/drm/i915/gvt/gvt.h       |  13 +-
>  drivers/gpu/drm/i915/gvt/handlers.c  | 261 ++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gvt/interrupt.c |  37 -----
>  drivers/gpu/drm/i915/gvt/interrupt.h |   7 -
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
>  9 files changed, 355 insertions(+), 115 deletions(-)
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
