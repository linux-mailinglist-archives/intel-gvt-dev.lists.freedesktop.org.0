Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F316D2A6C4B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Nov 2020 19:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E456E175;
	Wed,  4 Nov 2020 18:00:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316D96E175
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Nov 2020 18:00:06 +0000 (UTC)
IronPort-SDR: TvMqrOrSAczpUcV8m1PFzvspRgEFhHbIRrze8zR30aFBU4tEzIcduVfn/jDks/UmZRUZc6JoTE
 bNloMInkkFZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="148541767"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="148541767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 10:00:02 -0800
IronPort-SDR: bG9gzvw/THopK3izsxUtci54+jW3BVtHlSEs33/jkVsDfSSBadvodkZ8XnQAgBUmfMoWSe72qq
 w0YqmBMoFO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="363510637"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2020 10:00:01 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kaN4i-00012Y-EM; Wed, 04 Nov 2020 18:00:00 +0000
Date: Thu, 05 Nov 2020 01:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 133f49180d4b06bd94e23ee3974f65f5c6501090
Message-ID: <5fa2ebfa.kUsiuogVyrya9J3m%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
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
Cc: terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhenyu.z.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git  gvt-staging
branch HEAD: 133f49180d4b06bd94e23ee3974f65f5c6501090  gvt-staging: 2020y-11m-04d-13h-27m-40s CST integration manifest

elapsed time: 722m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
h8300                               defconfig
sh                           se7705_defconfig
mips                           ip28_defconfig
m68k                       m5208evb_defconfig
sh                           se7712_defconfig
arm                        multi_v7_defconfig
powerpc                   motionpro_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
arm                            mmp2_defconfig
mips                      pistachio_defconfig
ia64                            zx1_defconfig
mips                        vocore2_defconfig
mips                           ip22_defconfig
s390                       zfcpdump_defconfig
powerpc                 mpc834x_itx_defconfig
ia64                                defconfig
m68k                       m5249evb_defconfig
arm                          pxa910_defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
sh                           se7722_defconfig
riscv                            allyesconfig
powerpc                      katmai_defconfig
sh                            hp6xx_defconfig
microblaze                      mmu_defconfig
mips                           xway_defconfig
c6x                         dsk6455_defconfig
arm                          lpd270_defconfig
powerpc                        icon_defconfig
powerpc                      tqm8xx_defconfig
mips                     cu1000-neo_defconfig
arm                          exynos_defconfig
mips                          ath79_defconfig
powerpc                    sam440ep_defconfig
sh                          landisk_defconfig
m68k                          amiga_defconfig
powerpc                 canyonlands_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8555_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                         wii_defconfig
powerpc                       eiger_defconfig
arm                              alldefconfig
arm                            zeus_defconfig
powerpc                     rainier_defconfig
arm                       cns3420vb_defconfig
powerpc                        fsp2_defconfig
ia64                             alldefconfig
mips                      maltaaprp_defconfig
arm                     am200epdkit_defconfig
xtensa                          iss_defconfig
arm                           viper_defconfig
arm                           sunxi_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201104
i386                 randconfig-a006-20201104
i386                 randconfig-a005-20201104
i386                 randconfig-a001-20201104
i386                 randconfig-a002-20201104
i386                 randconfig-a003-20201104
x86_64               randconfig-a012-20201104
x86_64               randconfig-a015-20201104
x86_64               randconfig-a013-20201104
x86_64               randconfig-a011-20201104
x86_64               randconfig-a014-20201104
x86_64               randconfig-a016-20201104
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201104
x86_64               randconfig-a003-20201104
x86_64               randconfig-a005-20201104
x86_64               randconfig-a002-20201104
x86_64               randconfig-a006-20201104
x86_64               randconfig-a001-20201104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
