Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD94E3E96
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Mar 2022 13:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C53F10E18C;
	Tue, 22 Mar 2022 12:37:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6C10E18C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Mar 2022 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647952654; x=1679488654;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=uvwc19RUlhyqjHYUaJH1aVvDBUXO93RRDCuCo7kx+M4=;
 b=V2XdICpyZ7sx9rxKbLq/PJsXYLD7ZG3FhIFTbaMLtLY0SIUvEksVg0Nh
 uN2vf6FXfUD6hBhudzg+9UJKS37vylNRYr9kovwPUOoddY53Zms1A7Rmj
 hEnKUpGpFINoqzAbKMjfiZoUTPGlIhDEBdX2QgOVdFdRUAyplpO5yXOVi
 9gq/IVSuiFlDRMk7/Mbzn/T8yvBHC/oMjczbE/vben5al5Gxt76YJUo/F
 c5LX67mvOGFPwU3fu9nx12XzX1fP+fJ22nz9hfCOSLv5FnI41DcMQqL20
 4LaD8ZlL6u0WlPpAIIu7O3FnYl63b7DWtVTBv1zxsZ+n9OgVFoCaBHcLP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="256626888"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="256626888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 05:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="637031063"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2022 05:37:32 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWdlT-000InC-W8; Tue, 22 Mar 2022 12:37:31 +0000
Date: Tue, 22 Mar 2022 20:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 ff9df4631c63e64abb780f316ddfdc9b63b84e1f
Message-ID: <6239c2dc.6s9hBWNb7Lw3xKpR%lkp@intel.com>
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
branch HEAD: ff9df4631c63e64abb780f316ddfdc9b63b84e1f  drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

elapsed time: 799m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220321
i386                          randconfig-c001
mips                 randconfig-c004-20220320
arm                        keystone_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         nhk8815_defconfig
m68k                          hp300_defconfig
powerpc                 canyonlands_defconfig
m68k                        m5272c3_defconfig
sh                           se7721_defconfig
sh                        edosk7705_defconfig
s390                             allyesconfig
arm                          exynos_defconfig
sh                         ecovec24_defconfig
arm                          lpd270_defconfig
m68k                             allyesconfig
powerpc                   currituck_defconfig
sh                            titan_defconfig
xtensa                  nommu_kc705_defconfig
ia64                      gensparse_defconfig
sh                        sh7785lcr_defconfig
mips                         rt305x_defconfig
openrisc                  or1klitex_defconfig
powerpc                 mpc837x_mds_defconfig
sh                      rts7751r2d1_defconfig
sh                        edosk7760_defconfig
arc                        nsimosci_defconfig
sh                          rsk7201_defconfig
nios2                               defconfig
arm                             pxa_defconfig
arc                           tb10x_defconfig
parisc64                            defconfig
arc                 nsimosci_hs_smp_defconfig
sh                               j2_defconfig
sh                          r7780mp_defconfig
mips                     loongson1b_defconfig
parisc                generic-64bit_defconfig
m68k                          sun3x_defconfig
sh                        apsh4ad0a_defconfig
h8300                     edosk2674_defconfig
sh                         microdev_defconfig
sh                              ul2_defconfig
um                                  defconfig
powerpc                 mpc834x_itx_defconfig
sh                             sh03_defconfig
powerpc                     rainier_defconfig
arm                         vf610m4_defconfig
arm                     eseries_pxa_defconfig
sparc                            allyesconfig
arc                            hsdk_defconfig
powerpc                      ppc40x_defconfig
um                               alldefconfig
mips                        vocore2_defconfig
xtensa                    xip_kc705_defconfig
mips                           ci20_defconfig
nds32                               defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
arm                  randconfig-c002-20220321
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220322
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                             allnoconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a016-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a014-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a011-20220321
arc                  randconfig-r043-20220320
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
i386                          randconfig-c001
arm                  randconfig-c002-20220322
powerpc              randconfig-c003-20220322
riscv                randconfig-c006-20220322
s390                 randconfig-c005-20220320
arm                        neponset_defconfig
arm                       spear13xx_defconfig
mips                         tb0287_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                          ath79_defconfig
powerpc                     tqm8540_defconfig
mips                  cavium_octeon_defconfig
arm                          ixp4xx_defconfig
arm                        spear3xx_defconfig
arm64                            allyesconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
arm                     am200epdkit_defconfig
hexagon                             defconfig
mips                        omega2p_defconfig
mips                       lemote2f_defconfig
x86_64               randconfig-a001-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a006-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a002-20220321
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220320
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220321
hexagon              randconfig-r041-20220320
riscv                randconfig-r042-20220322
hexagon              randconfig-r045-20220322
hexagon              randconfig-r041-20220322
s390                 randconfig-r044-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
