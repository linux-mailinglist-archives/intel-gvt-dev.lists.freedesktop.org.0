Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A53626793
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 12 Nov 2022 08:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E402210E03A;
	Sat, 12 Nov 2022 07:08:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC510E030
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 12 Nov 2022 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668236918; x=1699772918;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=AZuwyt9avC4A9qORrkiHDhkk1jjhcTwglMYJjzvBomQ=;
 b=USbfARsjclqwfluMRUV992THTK2ZAiUoO0j/7oadqX+TkuBm71bxwN/i
 oUXIlhB5LMmcsLugUqLa9cT+sN7Vuqgh9KPcjTpOQ4asLWx5ZT9tR3c+F
 AiHiMAPD84j1VJ/49JJYzrNf15CVn8CRqnrLibO4OIjDmuGKfqFEyYGHU
 qKtpWDgufpAaFcZSFTk5APG/euuBXg/VVJczatdBX3loySwar8t1FGHVb
 XEUP75UOzihbkxIB+NjMmTswqW1VxYxNkAh3QZkQDFai/Nh1/CurRP1Lz
 V0xUqvtTqn/kv0JozFJABTtfni2Qyclw4rHbF8qldfbuIHgzD+3M0GyP9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="313511933"
X-IronPort-AV: E=Sophos;i="5.96,158,1665471600"; d="scan'208";a="313511933"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 23:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="743502127"
X-IronPort-AV: E=Sophos;i="5.96,158,1665471600"; d="scan'208";a="743502127"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2022 23:08:36 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1otkd1-0004fp-2Q;
 Sat, 12 Nov 2022 07:08:35 +0000
Date: Sat, 12 Nov 2022 15:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 b3257a6c8f01d93bdd717100273c2a81e7368ba4
Message-ID: <636f463d.M5BfwJ9/VDST2Dhz%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: b3257a6c8f01d93bdd717100273c2a81e7368ba4  gvt-staging: 2022y-11m-11d-13h-40m-57s CST integration manifest

elapsed time: 1494m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221111
riscv                randconfig-r042-20221111
s390                 randconfig-r044-20221111
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                                 defconfig
s390                             allmodconfig
x86_64                        randconfig-a004
alpha                               defconfig
x86_64                        randconfig-a002
s390                                defconfig
x86_64                        randconfig-a006
i386                          randconfig-a001
ia64                             allmodconfig
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
i386                          randconfig-a016
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                              defconfig
i386                                defconfig
x86_64                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221111
hexagon              randconfig-r045-20221111
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
