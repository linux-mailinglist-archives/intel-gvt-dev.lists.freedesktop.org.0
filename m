Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9522F589
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Jul 2020 18:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBE389BF0;
	Mon, 27 Jul 2020 16:40:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D835B89BD5;
 Mon, 27 Jul 2020 16:40:00 +0000 (UTC)
IronPort-SDR: 5x3ulLxDacSeRbHsMOP4o+X8qccRw0hU6Te/h/8UbCC/zXDwjTJ1yCot2yP4uAotRUV0YFAEJ4
 4BLRrtEZLXbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="148936532"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="148936532"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 09:40:00 -0700
IronPort-SDR: Lwl6C8xpLRUVd/HR7fdtZebJAijtMcB79WCgaPjDSEyZY45rqQOyfcgYe+uFIjmzZmwGsVmwkS
 F9m9KeecPIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="285824097"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by orsmga003.jf.intel.com with ESMTP; 27 Jul 2020 09:39:59 -0700
Received: from orsmsx122.amr.corp.intel.com (10.22.225.227) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Jul 2020 09:39:59 -0700
Received: from orsmsx163.amr.corp.intel.com ([169.254.9.67]) by
 ORSMSX122.amr.corp.intel.com ([169.254.11.52]) with mapi id 14.03.0439.000;
 Mon, 27 Jul 2020 09:39:59 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHWXm7+37u6arI7wESbBQfEsXROOakSVfGAgADkb4CACOc7AA==
Date: Mon, 27 Jul 2020 16:39:58 +0000
Message-ID: <215475D8-668C-48F7-B2D0-8D82E9836CE5@intel.com>
References: <20200720080541.GT27035@zhen-hp.sh.intel.com>
 <159532948169.9008.15612685518487144837@jlahtine-desk.ger.corp.intel.com>
 <20200722004217.GA27035@zhen-hp.sh.intel.com>
In-Reply-To: <20200722004217.GA27035@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.213.182.115]
Content-ID: <EA1737144552014FBEEE580A7FD20285@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> On Jul 21, 2020, at 5:42 PM, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> 
> On 2020.07.21 14:04:41 +0300, Joonas Lahtinen wrote:
>> Quoting Zhenyu Wang (2020-07-20 11:05:41)
>>> 
>>> Hi,
>>> 
>>> Sorry that this might be a bit late as last week our QA people were
>>> busy on something else..So this is gvt changes queued for 5.9 which is
>>> to improve guest suspend/resume with proper PCI PM state tracking for
>>> resource handling, e.g ppgtt. Hopefully this could still be in queue
>>> for 5.9.
>> 
>> Is this a regression fix to a problem introduced by previous
>> gvt-next PR targeting 5.9?
>> 
>> Or is it an incremental improvement over 5.8?
>> 
> 
> Second case. This is incremental improvement. Guest suspend/resume
> did work somehow before but has bad performance and possible failure
> with some guest versions.

I'm afraid Jani already sent the last pull request towards 5.9.
So if there are fixes inside this pull request this should move to the -next-fixes

and the remaining improvements to another 5.10 pull request

Thanks,
Rodrigo.

> 
> Thanks
> 
>> 
>>> 
>>> Thanks
>>> --
>>> The following changes since commit d524b87f77364db096855d7eb714ffacec974ddf:
>>> 
>>>  drm/i915: Update DRIVER_DATE to 20200702 (2020-07-02 21:25:28 +0300)
>>> 
>>> are available in the Git repository at:
>>> 
>>>  https://github.com/intel/gvt-linux tags/gvt-next-2020-07-20
>>> 
>>> for you to fetch changes up to 02b5fc1527c0bb26a1012c6a806dc033f3b125a6:
>>> 
>>>  drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it. (2020-07-14 16:42:14 +0800)
>>> 
>>> ----------------------------------------------------------------
>>> gvt-next-2020-07-20
>>> 
>>> - Improve guest suspend/resume handling (Colin)
>>> 
>>> ----------------------------------------------------------------
>>> Colin Xu (3):
>>>      drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
>>>      drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
>>>      drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.
>>> 
>>> drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>>> drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
>>> drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
>>> drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>>> drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
>>> 5 files changed, 47 insertions(+), 23 deletions(-)
>>> --
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
