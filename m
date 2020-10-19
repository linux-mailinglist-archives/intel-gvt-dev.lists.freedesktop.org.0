Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B629302C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 23:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07B6EA9D;
	Mon, 19 Oct 2020 21:06:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B196EA9D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Oct 2020 21:06:43 +0000 (UTC)
IronPort-SDR: Du0CJz8A4ch8xt9AWv33tmpx1HMuKxB8ATVglI848T42pKLPq5o2kkSdeXkiJwzMfACEDQbKrn
 rxujDmZxCIIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="146400695"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="146400695"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 14:06:36 -0700
IronPort-SDR: K4OR4Q8OLHwD+/Fe5MiGlu0LaWmuO7Soi+7ZIkHlwKr5O1Q+OzjBf2C6IjCfmaYXmzW1gzZ9Ki
 pOMvyr13t0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="358277267"
Received: from lkp-server01.sh.intel.com (HELO 88424da292e0) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2020 14:06:35 -0700
Received: from kbuild by 88424da292e0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kUcMU-0000H4-O7; Mon, 19 Oct 2020 21:06:34 +0000
Date: Tue, 20 Oct 2020 05:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 401ccfa87856656b874c737522ea92721394a348
Message-ID: <5f8dffc0.kpSEhYXDfWKt/5Jz%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-fixes
branch HEAD: 401ccfa87856656b874c737522ea92721394a348  drm/i915/gvt: Only pin/unpin intel_context along with workload

elapsed time: 724m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                malta_qemu_32r6_defconfig
m68k                             allmodconfig
mips                  decstation_64_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                    sam440ep_defconfig
mips                           ip27_defconfig
sh                         apsh4a3a_defconfig
powerpc                     tqm8540_defconfig
sh                     sh7710voipgw_defconfig
sh                         ecovec24_defconfig
powerpc                         ps3_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      chrp32_defconfig
powerpc                     tqm5200_defconfig
microblaze                    nommu_defconfig
powerpc                 mpc834x_itx_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
powerpc                      acadia_defconfig
arm                          collie_defconfig
powerpc                   bluestone_defconfig
arm                           corgi_defconfig
powerpc                      ep88xc_defconfig
sh                             sh03_defconfig
parisc                generic-32bit_defconfig
arm                     davinci_all_defconfig
arm                         s3c6400_defconfig
sh                               j2_defconfig
sh                        sh7763rdp_defconfig
powerpc                   currituck_defconfig
sh                           se7722_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         s5pv210_defconfig
ia64                             allyesconfig
microblaze                          defconfig
alpha                            alldefconfig
arm                          pcm027_defconfig
arm                            hisi_defconfig
sh                            shmin_defconfig
mips                       lemote2f_defconfig
arm                           sunxi_defconfig
arm                       imx_v6_v7_defconfig
arm                      pxa255-idp_defconfig
powerpc64                        alldefconfig
arm                            zeus_defconfig
m68k                          hp300_defconfig
arm                        spear3xx_defconfig
sh                           se7750_defconfig
sh                          kfr2r09_defconfig
sh                           se7751_defconfig
sh                            migor_defconfig
powerpc                     mpc512x_defconfig
powerpc                      pcm030_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                  mpc866_ads_defconfig
arm                           sama5_defconfig
mips                        nlm_xlp_defconfig
sh                          rsk7264_defconfig
powerpc                      katmai_defconfig
powerpc                     skiroot_defconfig
arm                          lpd270_defconfig
powerpc                      makalu_defconfig
sh                     magicpanelr2_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
mips                             allmodconfig
mips                         mpc30x_defconfig
alpha                               defconfig
c6x                        evmc6457_defconfig
sparc64                             defconfig
arm                      footbridge_defconfig
sh                   sh7770_generic_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201019
x86_64               randconfig-a002-20201019
x86_64               randconfig-a006-20201019
x86_64               randconfig-a003-20201019
x86_64               randconfig-a005-20201019
x86_64               randconfig-a001-20201019
i386                 randconfig-a006-20201019
i386                 randconfig-a005-20201019
i386                 randconfig-a001-20201019
i386                 randconfig-a003-20201019
i386                 randconfig-a004-20201019
i386                 randconfig-a002-20201019
i386                 randconfig-a015-20201019
i386                 randconfig-a013-20201019
i386                 randconfig-a016-20201019
i386                 randconfig-a012-20201019
i386                 randconfig-a011-20201019
i386                 randconfig-a014-20201019
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a016-20201019
x86_64               randconfig-a015-20201019
x86_64               randconfig-a012-20201019
x86_64               randconfig-a013-20201019
x86_64               randconfig-a011-20201019
x86_64               randconfig-a014-20201019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
