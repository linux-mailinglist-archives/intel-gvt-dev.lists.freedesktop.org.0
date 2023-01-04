Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B4A65DD21
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Jan 2023 20:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F139C10E073;
	Wed,  4 Jan 2023 19:53:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996510E073
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Jan 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672861991; x=1704397991;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=V03KAXXJm5pWBl5xlwo5Xd2/1wsKpr3yYlIai9nEK2c=;
 b=g2uEhTcPmLbPfV/D/A4y2EZ5SMl+rQpb2stfOck5+GCnWalKwrVFKwKa
 nwbpM+X1yEiU6QDZ+ZTwSDAECDSdVBb/AdC2U5yk6Gi+DFCXcttRzPQsT
 01K5XStBCaE0VuXnrKlH0PnHQT9RpksWXNBYpBiuFk55Dt6g0RpungdtR
 pxQatEVbGiXwj/cFdIgJY4MgbXjlTjv+POej2oSA/BKgxKEZlk/+pYrHd
 G+M6GrfRg+xgVfie0s+ub2ZmUNSI7sSQmyeh7imJfxFo59jv8zTOYVQ+l
 7LFolTutDC6/uh43uE4P0gHuT6GueSjqmCad8Yp4AOfo/IcLnNpZudPt5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="305530885"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="305530885"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 11:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="723775308"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="723775308"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2023 11:53:08 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pD9oy-0000iW-0A;
 Wed, 04 Jan 2023 19:53:08 +0000
Date: Thu, 05 Jan 2023 03:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 1a164503255e329558afa8f944abeb1c4f10cc37
Message-ID: <63b5d8f8.TxcPY4a6p74F08oG%lkp@intel.com>
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
branch HEAD: 1a164503255e329558afa8f944abeb1c4f10cc37  gvt-staging: 2023y-01m-04d-15h-34m-54s CST integration manifest

elapsed time: 722m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
i386                                defconfig
alpha                            allyesconfig
i386                 randconfig-a004-20230102
x86_64                           allyesconfig
i386                 randconfig-a003-20230102
arc                              allyesconfig
i386                 randconfig-a001-20230102
i386                 randconfig-a002-20230102
i386                 randconfig-a005-20230102
i386                 randconfig-a006-20230102
i386                             allyesconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a004-20230102
x86_64               randconfig-a002-20230102
x86_64               randconfig-a003-20230102
x86_64               randconfig-a005-20230102
x86_64                           rhel-8.3-syz
x86_64               randconfig-a006-20230102
ia64                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a001-20230102
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                              allyesconfig
riscv                randconfig-r042-20230101
s390                 randconfig-r044-20230101
arc                  randconfig-r043-20230102
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101

clang tested configs:
x86_64               randconfig-a011-20230102
x86_64                          rhel-8.3-rust
i386                 randconfig-a012-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
i386                 randconfig-a011-20230102
x86_64               randconfig-a013-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a013-20230102
x86_64               randconfig-a015-20230102
i386                 randconfig-a016-20230102
i386                 randconfig-a015-20230102
x86_64               randconfig-a016-20230102
hexagon              randconfig-r041-20230102
s390                 randconfig-r044-20230102
hexagon              randconfig-r045-20230101
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
