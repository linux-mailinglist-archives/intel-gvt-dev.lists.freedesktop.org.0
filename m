Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AACA2A113D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Oct 2020 23:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD7A6EEA1;
	Fri, 30 Oct 2020 22:57:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D651B6EE9F;
 Fri, 30 Oct 2020 22:57:26 +0000 (UTC)
IronPort-SDR: H1ekapzUC0QvFpD6M8Qahhc0kN1f35TUlbagR8tT2PhxJwWXZNT60BdmcINmGabf5Ja3gzVtpa
 5pJV7Ri+VxFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="155657109"
X-IronPort-AV: E=Sophos;i="5.77,435,1596524400"; d="scan'208";a="155657109"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 15:57:26 -0700
IronPort-SDR: 7KThp0pa1yVH7+ZREr6BxcpK5x6LZ4OI9GIN23fyZf6Sjrx/NALNnZTw1cttUvIhyC25HSkzYo
 R9z7Q+rJ79SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,435,1596524400"; d="scan'208";a="537228906"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga005.jf.intel.com with ESMTP; 30 Oct 2020 15:57:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 22:57:23 +0000
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Fri, 30 Oct 2020 15:57:22 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
Thread-Topic: [Intel-gfx] [PULL] gvt-fixes
Thread-Index: AQHWrBKsP6vgaCbhMUe7vqjiY+MZE6msYcGAgADzpYCAAsDKAIABJw+A
Date: Fri, 30 Oct 2020 22:57:21 +0000
Message-ID: <D3FBD605-98AC-4EC2-A9BB-119ECE21FF10@intel.com>
References: <20201027031740.GA27141@zhen-hp.sh.intel.com>
 <20201027204643.GE3771340@intel.com>
 <C9292B4F-9A82-46AF-BFAB-D372D202F314@intel.com>
 <20201030052117.GC27141@zhen-hp.sh.intel.com>
In-Reply-To: <20201030052117.GC27141@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-originating-ip: [10.22.254.132]
Content-ID: <9E0093201A022C449F6D6E140F0549F2@intel.com>
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> On Oct 29, 2020, at 10:21 PM, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> 
> On 2020.10.28 11:18:45 +0000, Vivi, Rodrigo wrote:
> 
>> 
>> I'm actually pulling it off. I had bypassed dim, considering this was an old
>> issue with our email decoder,
>> but it happens that 
>> 
>> $ git show 401ccfa87856 | grep Fixes
>> Fixes: e6ba76480299 (drm/i915: Remove i915->kernel_context)
>> 
>> And this is what it should have:
>> 
>> $ dim fixes e6ba76480299 | grep Fixes
>> Fixes: e6ba76480299 ("drm/i915: Remove i915->kernel_context")
>> 
>> Sorry for the trouble.
>> Let's fix this in place so we don't propagate bad tag that might break other
>> scripts on the way
>> 
> 
> Hi, Rodrigo, here's re-generated pull. I also picked another fixes for
> MMIO cmd access flag on BXT/APL, which required a backmerge.
> 
> Thanks!
> --
> The following changes since commit 61334ed227a5852100115180f5535b1396ed5227:
> 
>  drm/i915: Reject 90/270 degree rotated initial fbs (2020-10-29 14:20:24 -0400)
> 
> are available in the Git repository at:
> 
>  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-10-30
> 
> for you to fetch changes up to 92010a97098c4c9fd777408cc98064d26b32695b:
> 
>  drm/i915/gvt: Fix mmio handler break on BXT/APL. (2020-10-30 11:50:06 +0800)


pulled, thanks!


> 
> ----------------------------------------------------------------
> gvt-fixes-2020-10-30
> 
> - Fix HWSP reset handling during vGPU suspend/resume (Colin)
> - Apply flush workaround on APL now for possible guest hang (Colin)
> - Fix vGPU context pin/unpin also for host suspend regression with
>  vGPU created (Colin)
> - more BXT/APL mmio cmd access fixes (Colin)
> 
> ----------------------------------------------------------------
> Colin Xu (4):
>      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
>      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
>      drm/i915/gvt: Only pin/unpin intel_context along with workload
>      drm/i915/gvt: Fix mmio handler break on BXT/APL.
> 
> Zhenyu Wang (1):
>      Merge tag 'drm-intel-fixes-2020-10-29' into gvt-fixes
> 
> drivers/gpu/drm/i915/gvt/handlers.c  | 47 +++++++++++++++++++++++++++++++++---
> drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++------
> 2 files changed, 52 insertions(+), 10 deletions(-)
> 
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
