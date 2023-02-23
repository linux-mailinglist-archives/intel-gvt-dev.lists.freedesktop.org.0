Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75D6A1152
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Feb 2023 21:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BBF10E2E2;
	Thu, 23 Feb 2023 20:40:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB5310E214
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 Feb 2023 20:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677184848; x=1708720848;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=rgGtH8lu4Ra/80MP9+7q4TR6P1HzE8IjV1+RE/9Yneo=;
 b=FjPoyQ9HLMihKJxB9cOgc8U+MNqGAMgrJ6NEPNgrDAZMEbgQ7mogH0aN
 JQfGuwiJjgFGqgZT4RLXcTidISrU99zgBS6e3ROTKTUVLo0ppn7Pd+EoX
 TNWSqiArKGn97dCcvKd0qoSNX87ej831ZZKF7iTEvA2848q0W5aFUBXvb
 qfmnl12rrmWJ3n0ph7okpfAuIpIDzdqTmmhvp7lBxFILvvyT8wiKuqomo
 pWSRp+WB/EO5ViZW4DGxr/tsSwbN8aDQcTEwf69v9pKCvOjL6b+W3M4a8
 dOVlMoWXP27va9I3xZdx/83M97uOIZC0NLLhkN/v0x2v4x0lnAOXRzBjV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360819903"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360819903"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 12:40:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="846704317"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="846704317"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 23 Feb 2023 12:40:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pVIO2-0001jV-12;
 Thu, 23 Feb 2023 20:40:18 +0000
Date: Fri, 24 Feb 2023 04:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next-fixes] BUILD SUCCESS
 0b93efca3659f6d55ed31cff6722dca5f6e4d6e2
Message-ID: <63f7cf30.a1Rq0iGkEQt0VQiT%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next-fixes
branch HEAD: 0b93efca3659f6d55ed31cff6722dca5f6e4d6e2  drm/i915: move a Kconfig symbol to unbreak the menu presentation

elapsed time: 726m

configs tested: 79
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                          axs103_defconfig
arc                                 defconfig
arc                  randconfig-r043-20230222
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                        oxnas_v6_defconfig
arm                            qcom_defconfig
arm                  randconfig-r046-20230222
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                         amcore_defconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                            alldefconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                    sam440ep_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                               rhel-8.3

clang tested configs:
hexagon              randconfig-r041-20230222
hexagon              randconfig-r045-20230222
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20230222
s390                 randconfig-r044-20230222
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
