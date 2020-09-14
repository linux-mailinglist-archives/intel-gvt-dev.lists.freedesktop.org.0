Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1362696FC
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 22:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEFD6E5A0;
	Mon, 14 Sep 2020 20:50:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899466E58E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Sep 2020 20:50:00 +0000 (UTC)
IronPort-SDR: /q4EmFIhCaGbDYy3QM+OiY9smC9Mqh1JcCV01FoVoHy3Mlfl5KcXbq8DyqP6s9eaofSrw69pAs
 J8rhXOFwIeAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="158443482"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="158443482"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:49:59 -0700
IronPort-SDR: aSUko0AeZr9bABratvZbDa1cjnJf6OythZPa14HOwSj/aLM8ydCQVZQnHyvFYQFogeHysu+jOF
 tdiKZEnZyrqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="335412741"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 14 Sep 2020 13:49:57 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kHvQD-0001BN-2D; Mon, 14 Sep 2020 20:49:57 +0000
Date: Tue, 15 Sep 2020 04:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next] BUILD SUCCESS
 e00db7c089ebb7147d5b9610df4d18ab345d6f1d
Message-ID: <5f5fd739.BKKyNS/hcMwDLByb%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-next
branch HEAD: e00db7c089ebb7147d5b9610df4d18ab345d6f1d  drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write

elapsed time: 720m

configs tested: 202
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                         3c120_defconfig
mips                  maltasmvp_eva_defconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
mips                          ath79_defconfig
m68k                          hp300_defconfig
sh                          sdk7786_defconfig
powerpc                          g5_defconfig
arm                           tegra_defconfig
openrisc                 simple_smp_defconfig
powerpc                        icon_defconfig
sh                                  defconfig
sh                           se7724_defconfig
arm                            pleb_defconfig
m68k                        m5272c3_defconfig
m68k                        stmark2_defconfig
arm                              alldefconfig
mips                  cavium_octeon_defconfig
arc                      axs103_smp_defconfig
m68k                        m5407c3_defconfig
powerpc                      ppc6xx_defconfig
arm                      pxa255-idp_defconfig
arc                          axs103_defconfig
arm                            zeus_defconfig
um                           x86_64_defconfig
m68k                       m5208evb_defconfig
arc                           tb10x_defconfig
riscv                             allnoconfig
mips                        nlm_xlp_defconfig
arm                        clps711x_defconfig
arm                          iop32x_defconfig
powerpc                         wii_defconfig
arm                         lpc32xx_defconfig
powerpc                    klondike_defconfig
powerpc                      bamboo_defconfig
mips                        jmr3927_defconfig
mips                    maltaup_xpa_defconfig
arm                          tango4_defconfig
sh                        dreamcast_defconfig
sh                          r7780mp_defconfig
powerpc                    mvme5100_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                              defconfig
powerpc                       eiger_defconfig
mips                        nlm_xlr_defconfig
arc                          axs101_defconfig
arm                             pxa_defconfig
sh                          sdk7780_defconfig
mips                           mtx1_defconfig
c6x                        evmc6474_defconfig
sh                     magicpanelr2_defconfig
arm                          pxa3xx_defconfig
m68k                        m5307c3_defconfig
powerpc                      mgcoge_defconfig
sparc                               defconfig
arm                         nhk8815_defconfig
sh                           se7722_defconfig
powerpc                     ep8248e_defconfig
sparc                       sparc64_defconfig
ia64                         bigsur_defconfig
sh                          r7785rp_defconfig
arm                           spitz_defconfig
mips                         cobalt_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        bcm47xx_defconfig
arm                         cm_x300_defconfig
xtensa                generic_kc705_defconfig
arm                         lpc18xx_defconfig
c6x                              allyesconfig
mips                      loongson3_defconfig
powerpc                     tqm8541_defconfig
arm                         hackkit_defconfig
nds32                             allnoconfig
arm                             ezx_defconfig
sh                   sh7724_generic_defconfig
powerpc64                           defconfig
arm                         lubbock_defconfig
arm                         palmz72_defconfig
arm                           sunxi_defconfig
openrisc                         alldefconfig
powerpc                      obs600_defconfig
powerpc                     kmeter1_defconfig
s390                                defconfig
arc                        nsimosci_defconfig
arm                         ebsa110_defconfig
arm                        cerfcube_defconfig
powerpc                          allmodconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      pcm030_defconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
arm                       multi_v4t_defconfig
powerpc                  mpc866_ads_defconfig
m68k                             alldefconfig
mips                           jazz_defconfig
arm                              zx_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc8540_ads_defconfig
arm                   milbeaut_m10v_defconfig
ia64                             alldefconfig
arm                          imote2_defconfig
mips                   sb1250_swarm_defconfig
powerpc                  mpc885_ads_defconfig
microblaze                          defconfig
mips                     cu1000-neo_defconfig
sparc64                             defconfig
powerpc                        warp_defconfig
sh                          rsk7201_defconfig
powerpc                      tqm8xx_defconfig
m68k                          sun3x_defconfig
powerpc                       ppc64_defconfig
powerpc                     stx_gp3_defconfig
arm                          gemini_defconfig
xtensa                          iss_defconfig
xtensa                           alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200914
x86_64               randconfig-a006-20200914
x86_64               randconfig-a003-20200914
x86_64               randconfig-a002-20200914
x86_64               randconfig-a001-20200914
x86_64               randconfig-a005-20200914
i386                 randconfig-a004-20200913
i386                 randconfig-a006-20200913
i386                 randconfig-a003-20200913
i386                 randconfig-a001-20200913
i386                 randconfig-a002-20200913
i386                 randconfig-a005-20200913
i386                 randconfig-a004-20200914
i386                 randconfig-a006-20200914
i386                 randconfig-a001-20200914
i386                 randconfig-a003-20200914
i386                 randconfig-a002-20200914
i386                 randconfig-a005-20200914
x86_64               randconfig-a014-20200913
x86_64               randconfig-a011-20200913
x86_64               randconfig-a012-20200913
x86_64               randconfig-a016-20200913
x86_64               randconfig-a015-20200913
x86_64               randconfig-a013-20200913
i386                 randconfig-a015-20200914
i386                 randconfig-a014-20200914
i386                 randconfig-a011-20200914
i386                 randconfig-a013-20200914
i386                 randconfig-a016-20200914
i386                 randconfig-a012-20200914
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200914
x86_64               randconfig-a011-20200914
x86_64               randconfig-a016-20200914
x86_64               randconfig-a012-20200914
x86_64               randconfig-a015-20200914
x86_64               randconfig-a013-20200914
x86_64               randconfig-a006-20200913
x86_64               randconfig-a004-20200913
x86_64               randconfig-a003-20200913
x86_64               randconfig-a002-20200913
x86_64               randconfig-a005-20200913
x86_64               randconfig-a001-20200913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
