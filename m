Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997C63B5B8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 00:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B9410E246;
	Mon, 28 Nov 2022 23:15:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210E310E246
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Nov 2022 23:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669677307; x=1701213307;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=+vxSxpP+fuEREw3arVRcPRxcWEJ6FrKiNtEe+i6jDog=;
 b=oH7Vv3gGq7vef715beEMxwK3ivLQJKf6H9cnSxrdR4Cf+7DT2MStS6SF
 tEZyzfam61jbxBKJwuhgVzlDS3/p3bTv7XKODubMNyKwsUjRKM7XmId0x
 Bm3r9vwa5lCUBI0xHKN5m2m6iciUyN5mHlPaVFho83SiaXv58IUiQcx8H
 7PTGgrVRKtrBs40PV4CjrwBZoq48uk09Qffa++0FNcZfKaiO1GoJZkyUv
 BBXV3N+LLGqyRvPFpCvQ39cjqn8GBLKf/lKKA1qo8xs41K+4bL5rixqvT
 AuJd6slbS4VTFw1q8r1aVbKN3SGaOsRURS59lUIIHZVKhHnWwC4np+fKG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="341888520"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="341888520"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 15:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="749588658"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="749588658"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2022 15:15:02 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oznL4-0008Nf-0T;
 Mon, 28 Nov 2022 23:15:02 +0000
Date: Tue, 29 Nov 2022 07:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 40b97ba06773d0f5f8e8ed71824f67dd05bc01bc
Message-ID: <638540e6.7KJyL5La8mQSHJ85%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhenyu.z.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-fixes
branch HEAD: 40b97ba06773d0f5f8e8ed71824f67dd05bc01bc  drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()

elapsed time: 792m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
s390                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                              defconfig
i386                                defconfig
arc                  randconfig-r043-20221128
x86_64                               rhel-8.3
i386                 randconfig-a002-20221128
x86_64                           allyesconfig
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                             allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a001-20221128
m68k                             allmodconfig
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
arc                              allyesconfig
x86_64               randconfig-a002-20221128
alpha                            allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a015-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
