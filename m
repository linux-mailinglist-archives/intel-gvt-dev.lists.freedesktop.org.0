Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770B5931C5
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Aug 2022 17:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56398CC290;
	Mon, 15 Aug 2022 15:28:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA28CC1AA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Aug 2022 15:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660577319; x=1692113319;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TH5SdisVnoHzSB4f3pf7l3Yr26E0v4Iz6xEIBmweArQ=;
 b=Ia4zojfONJJsx2jvCNN+ctp9PgVrJ7b8kFoI5V4QcXr/h4uPnPD1Cjtb
 EAupH83FyMkBye6aSW+CQPBKNW3Dj+MRiRDMvooHBODyGiFCOAidXbK+I
 QubO1wYdGNnNR9o/4Vmcc4xOrL2+GAUZb56Pn7zy6pT47+Q0nS1vjGkyk
 9I5ia1zUF4AMckcHFeagLgDIhDOxv+WROGCkrmU0pkWOglyiN34a8nnoc
 NTNyYiMHBYucW6c/mS4585k9xunXwC5y+dyduQ4iG+1wN3UfzMj6cBsf1
 PIcujav6Cjzdhk1Jnzw424uPrv01sWlIOnV9aOg37C2QoLyBl1SsxUD/K A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271756449"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="271756449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 08:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="748963434"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2022 08:28:36 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oNc16-00016D-0j;
 Mon, 15 Aug 2022 15:28:36 +0000
Date: Mon, 15 Aug 2022 23:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 394f0560a76298842defd1d95bd64b203a5fdcc4
Message-ID: <62fa660c.gxhhRm2U4JiZx8vl%lkp@intel.com>
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
branch HEAD: 394f0560a76298842defd1d95bd64b203a5fdcc4  drm/i915/gvt: Fix Comet Lake

elapsed time: 708m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
powerpc                           allnoconfig
i386                                defconfig
i386                 randconfig-a003-20220815
i386                 randconfig-a004-20220815
x86_64                        randconfig-a004
i386                 randconfig-a005-20220815
arc                              allyesconfig
i386                 randconfig-a002-20220815
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
riscv                randconfig-r042-20220814
x86_64                          rhel-8.3-func
i386                 randconfig-a001-20220815
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
i386                             allyesconfig
i386                 randconfig-a006-20220815
alpha                            allyesconfig
arm                                 defconfig
arc                               allnoconfig
x86_64                    rhel-8.3-kselftests
alpha                             allnoconfig
m68k                             allyesconfig
riscv                             allnoconfig
csky                              allnoconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
arc                  randconfig-r043-20220814
sh                               allmodconfig
s390                 randconfig-r044-20220814
arm                              allyesconfig
ia64                             allmodconfig
loongarch                         allnoconfig
arc                  randconfig-r043-20220815
powerpc                          allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
sh                          kfr2r09_defconfig
loongarch                           defconfig
s390                                defconfig
arm                            hisi_defconfig
sh                           se7750_defconfig
sparc                       sparc32_defconfig
sh                   secureedge5410_defconfig
i386                 randconfig-c001-20220815

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220815
x86_64                        randconfig-a003
riscv                randconfig-r042-20220815
hexagon              randconfig-r041-20220814
x86_64               randconfig-a012-20220815
hexagon              randconfig-r045-20220814
x86_64               randconfig-a011-20220815
hexagon              randconfig-r041-20220815
x86_64               randconfig-a015-20220815
x86_64               randconfig-a014-20220815
s390                 randconfig-r044-20220815
x86_64               randconfig-a013-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a013-20220815
i386                 randconfig-a014-20220815
i386                 randconfig-a015-20220815
powerpc                      obs600_defconfig
x86_64               randconfig-a016-20220815
i386                 randconfig-a016-20220815
powerpc                  mpc866_ads_defconfig
mips                           rs90_defconfig
arm                      pxa255-idp_defconfig
mips                        bcm63xx_defconfig
arm                         socfpga_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
