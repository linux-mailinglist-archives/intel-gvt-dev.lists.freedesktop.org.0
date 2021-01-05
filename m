Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E714F2EA6A2
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Jan 2021 09:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931126E094;
	Tue,  5 Jan 2021 08:37:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881EC6E094;
 Tue,  5 Jan 2021 08:37:02 +0000 (UTC)
IronPort-SDR: lZmBlgLcAKKUOc4oOZsflyZtWUaXcoJ4VjOTI9/EBrVIoUqE9GPY0Sywlh32F4eeRPXV8sgGkh
 CCg1Rp9ETW/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="261837733"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="261837733"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 00:37:02 -0800
IronPort-SDR: y7xDEIz1SBFBzpeFi3A/Tnf8OupnvWcK5Wye/8LHIsFuVyOX+oVePcU+W2xLOIIsv9iKBrWG4l
 RmU1vw/c1UbA==
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="378785616"
Received: from mpaczkow-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.139])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 00:36:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
In-Reply-To: <20210105075424.GV16939@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201225022009.GF16939@zhen-hp.sh.intel.com>
 <20210105075424.GV16939@zhen-hp.sh.intel.com>
Date: Tue, 05 Jan 2021 10:36:54 +0200
Message-ID: <87ft3f2315.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 05 Jan 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Ping...

I suppose this should be merged to drm-intel-next (or drm-intel-gt-next,
or both). It was too late for next-fixes, and it's really not the kind
of fixes we need to queue to v5.11-rc's.

Rodrigo?

BR,
Jani.

>
> On 2020.12.25 10:20:09 +0800, Zhenyu Wang wrote:
>> 
>> Hi,
>> 
>> Here's queued fixes from Jani for one useless inline and fix
>> CONFIG_DRM_I915_WERROR for gvt headers.
>> 
>> Thanks and Merry Christmas!
>> --
>> The following changes since commit 9a3a238b3de97b4210c6de66aa88b2d7021ac086:
>> 
>>   drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17:14:20 +0800)
>> 
>> are available in the Git repository at:
>> 
>>   https://github.com/intel/gvt-linux tags/gvt-next-fixes-2020-12-25
>> 
>> for you to fetch changes up to e056f669dbf76b8752b6cb0b8edd2f75cbdcabb1:
>> 
>>   drm/i915/gvt: make mpt.h self-contained (2020-12-22 11:41:35 +0800)
>> 
>> ----------------------------------------------------------------
>> gvt-next-fixes-2020-12-25
>> 
>> - Avoid one useless inline (Jani)
>> - make gvt header self-contained, fix CONFIG_DRM_I915_WERROR (Jani)
>> 
>> ----------------------------------------------------------------
>> Jani Nikula (9):
>>       drm/i915/gvt: avoid useless use of inline
>>       drm/i915/gvt: make execlist.h self-contained
>>       drm/i915/gvt: make fb_decoder.h self-contained
>>       drm/i915/gvt: make gtt.h self-contained
>>       drm/i915/gvt: make interrupt.h self-contained
>>       drm/i915/gvt: make mmio_context.h self-contained
>>       drm/i915/gvt: make gvt.h self-contained
>>       drm/i915/gvt: make scheduler.h self-contained
>>       drm/i915/gvt: make mpt.h self-contained
>> 
>>  drivers/gpu/drm/i915/Makefile           | 10 +---------
>>  drivers/gpu/drm/i915/gvt/execlist.h     |  3 ---
>>  drivers/gpu/drm/i915/gvt/fb_decoder.h   |  6 ++++--
>>  drivers/gpu/drm/i915/gvt/gtt.h          | 11 ++++++++++-
>>  drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++++
>>  drivers/gpu/drm/i915/gvt/handlers.c     |  3 +--
>>  drivers/gpu/drm/i915/gvt/interrupt.h    |  5 ++++-
>>  drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
>>  drivers/gpu/drm/i915/gvt/mpt.h          |  2 ++
>>  drivers/gpu/drm/i915/gvt/scheduler.h    |  5 +++++
>>  10 files changed, 42 insertions(+), 18 deletions(-)
>> 
>> -- 
>> 
>> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>
>
>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
