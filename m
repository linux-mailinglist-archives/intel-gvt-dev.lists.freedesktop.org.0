Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A116576EAA
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Jul 2022 16:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392CD10EC77;
	Sat, 16 Jul 2022 14:35:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD20310E06A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Jul 2022 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657898278; x=1689434278;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=sk+ocr3w3zLAwDTZDXGS5V1pTDKWyL3ty+HKyRoGqgE=;
 b=H7dm0eBRFLjtw4+OkKmMho7zcAPxeBOatZLRMcZSYFe0eMWw0TXhgtAA
 mEO7lN5i22fmBOxaMlyff/L5/9nsLVzM9a97470g4G5vFwSmOKlA1I/Hw
 EAG4RP8CJpyrSUP9rFjuzc5EMpqOmqXL5+6p7IBiVzbmmaDq9oBZryoCU
 UFjzJMsSNKQvZ+sGUREFQDLoEDaLl/AHPLy+WqV1IOZopN3o6KovdYPPI
 p3FYkYf3BKnby8URsus7MMDa4WnvzSmjSSc3TXVUQVKVLGDZHetBHitVL
 h7Em5BGcLW4mMHyFxv8P8G9FO4QulSQIO7qcAKo46CMOYa/A20RHNRhnV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286955439"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="286955439"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 08:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="699236922"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2022 08:17:56 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCN4l-000047-5p;
 Fri, 15 Jul 2022 15:17:55 +0000
Date: Fri, 15 Jul 2022 18:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 c312491f509ad1baa4a9793d1f74ce0f1dcd6267
Message-ID: <62d14675.tIRBkVNEX6ifUoB7%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next
branch HEAD: c312491f509ad1baa4a9793d1f74ce0f1dcd6267  drm/i915: gvt: fix kernel-doc trivial warnings

elapsed time: 1663m

configs tested: 51
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                     pq2fads_defconfig
sh                           se7343_defconfig
sh                             espt_defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                               rhel-8.3

clang tested configs:
arm                  colibri_pxa270_defconfig
arm                      pxa255-idp_defconfig
mips                        workpad_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     kilauea_defconfig
i386                          randconfig-a006
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220714
hexagon              randconfig-r041-20220714

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
