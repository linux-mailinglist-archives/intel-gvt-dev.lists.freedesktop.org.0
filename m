Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6C68017
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 14 Jul 2019 18:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93F0897F3;
	Sun, 14 Jul 2019 16:17:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0045897EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 14 Jul 2019 16:17:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2019 09:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,491,1557212400"; 
 d="gz'50?scan'50,208,50";a="365656844"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2019 09:17:00 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hmhBM-00093Z-5G; Mon, 15 Jul 2019 00:17:00 +0800
Date: Mon, 15 Jul 2019 00:16:31 +0800
From: kbuild test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: [intel-gvt-linux:topic/display_event 4/6]
 drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
Message-ID: <201907150030.VAlG2wOm%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qeg6zvufsxn7bz5e"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com, kbuild-all@01.org,
 Kechen Lu <kechen.lu@intel.com>, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--qeg6zvufsxn7bz5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/gvt-linux topic/display_event
head:   42736b7c620a10f44f4c69ad6255233362caff5a
commit: d3a240c6d0af743ead84e2463bff054e5905db73 [4/6] drm/i915/gvt: Deliver vGPU flip event to userspace
config: x86_64-randconfig-a003-201928 (attached as .config)
compiler: gcc-6 (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
reproduce:
        git checkout d3a240c6d0af743ead84e2463bff054e5905db73
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5:0,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/io-mapping.h:22,
                    from drivers/gpu/drm/i915/i915_drv.h:36,
                    from drivers/gpu/drm/i915/gvt/display.c:35:
   drivers/gpu/drm/i915/gvt/display.c: In function 'emulate_vblank_on_pipe':
   drivers/gpu/drm/i915/gvt/display.c:428:10: error: 'struct intel_vgpu' has no member named 'vdev'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
     ^~
   drivers/gpu/drm/i915/gvt/display.c:428:41: error: 'struct intel_vgpu' has no member named 'vdev'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
                                            ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
     ^~
   drivers/gpu/drm/i915/gvt/display.c:428:10: error: 'struct intel_vgpu' has no member named 'vdev'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
     ^~
   drivers/gpu/drm/i915/gvt/display.c:428:41: error: 'struct intel_vgpu' has no member named 'vdev'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
                                            ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
     ^~
   drivers/gpu/drm/i915/gvt/display.c:428:10: error: 'struct intel_vgpu' has no member named 'vdev'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
             ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
     ^~
   drivers/gpu/drm/i915/gvt/display.c:428:41: error: 'struct intel_vgpu' has no member named 'vdev'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
                                            ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/display.c:428:2: note: in expansion of macro 'if'
     if (vgpu->vdev.vblank_trigger && !(vgpu->vdev.display_event_mask
     ^~
   drivers/gpu/drm/i915/gvt/display.c:431:22: error: 'struct intel_vgpu' has no member named 'vdev'
      eventfd_signal(vgpu->vdev.vblank_trigger, eventfd_signal_val);
                         ^~

vim +/if +428 drivers/gpu/drm/i915/gvt/display.c

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--qeg6zvufsxn7bz5e
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
07+bWC6NAKQBAA==

--qeg6zvufsxn7bz5e
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--qeg6zvufsxn7bz5e--
