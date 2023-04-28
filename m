Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669AE6F1F02
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Apr 2023 21:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416210EDE8;
	Fri, 28 Apr 2023 19:54:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4E610EDE8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Apr 2023 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682711697; x=1714247697;
 h=date:from:to:cc:subject:message-id;
 bh=pVl5QLKC88PEN5KWTR8nl6lbYlMPHIY7NEAGWp3CZ3I=;
 b=IX1N9wAZNQtGS1zFEBwOdvu9XBbdORhtPJQSt20kmvQDtXp4R4oqM730
 QwQ31A24mQa2aGbITPeYLA6zH5HgbD3uPQpxsSL6ZEm69yFhmoJ0GQdRA
 +oLf5yeXm+cAkxNh5Rt88zJQabXAFGKgj8m+3nqnlxmS5vE6PeafPW80v
 LtYgOc+B8d8MdQG8IZT/3wqVITPNGUm27ec+AfDUBLDD4DPGGKBV/hJkb
 mganMkiWGsxV85W3Iphs8g+iBKEhbwJ61fybHDSH8ZteQDp0oR1iOUlPb
 K3pRZNCOdrJ7cwMalWqnTEBrtSIzsbXMwmhvjdOGmb9s6rL0rKCXVNHUh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="434134971"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="434134971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 12:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="759776675"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="759776675"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2023 12:52:42 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1psU93-0000e7-1b;
 Fri, 28 Apr 2023 19:52:41 +0000
Date: Sat, 29 Apr 2023 03:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next-fixes] BUILD SUCCESS
 004040fdb55fa55463730c95d1384cb67f9396c3
Message-ID: <20230428195201.1kqkr%lkp@intel.com>
User-Agent: s-nail v14.9.24
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
branch HEAD: 004040fdb55fa55463730c95d1384cb67f9396c3  drm/i915/gvt: Make use of idr_find and idr_for_each_entry in dmabuf

elapsed time: 723m

configs tested: 85
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230427   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230427   gcc  
alpha                randconfig-r016-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230428   gcc  
arc                  randconfig-r014-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230427   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230428   gcc  
arm                  randconfig-r035-20230428   gcc  
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230427   gcc  
csky                 randconfig-r034-20230427   gcc  
hexagon      buildonly-randconfig-r004-20230427   clang
hexagon              randconfig-r003-20230428   clang
hexagon              randconfig-r041-20230428   clang
hexagon              randconfig-r045-20230428   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a013   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230427   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230428   gcc  
mips                 randconfig-r002-20230428   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230427   gcc  
nios2                randconfig-r034-20230428   gcc  
openrisc     buildonly-randconfig-r002-20230427   gcc  
openrisc             randconfig-r031-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230428   gcc  
parisc               randconfig-r015-20230428   gcc  
parisc               randconfig-r024-20230427   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r032-20230428   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230428   gcc  
sh                   randconfig-r026-20230427   gcc  
sparc        buildonly-randconfig-r003-20230427   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230428   gcc  
sparc64              randconfig-r004-20230427   gcc  
sparc64              randconfig-r006-20230427   gcc  
sparc64              randconfig-r033-20230428   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
