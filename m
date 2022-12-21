Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AB3652B7F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Dec 2022 03:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEA710E027;
	Wed, 21 Dec 2022 02:32:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D1510E027
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Dec 2022 02:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671589935; x=1703125935;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=war6KidvJVgrTrOpVMEVXoGEHasSQilUMpRK3uc47BQ=;
 b=MEuMGWXe+nhcMufNw8g9NXDk/TlCR4VygvDqFlF86KGrsscUbV7ufc/H
 cGot2iBSgevwzWiK2dGoYwgj5K8QR+ctMqFzrf/Uax06RKODYaQjR76hR
 f84hvPVHErZrD2iN7yjNkuGGNIeE7n/9tV6Dlzab2QwK3szE604H3df4Z
 /6UbP+UCnuU68sCVC0rZTwUXUYz4Dx9e1UUQWNAR21/2JjUfhXTf/Vc53
 wbz7mpqkzooYyUugwgPckoUkVs6cjzoHHzOV8L3+TTV+Fzk5EPnZxuTru
 aKToVu0bEeMT3VFi/ABPWqdpWfp+psp0iXSzIOWl0rGWXohPnp6zSjsbk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="303192234"
X-IronPort-AV: E=Sophos;i="5.96,261,1665471600"; d="scan'208";a="303192234"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 18:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="653339587"
X-IronPort-AV: E=Sophos;i="5.96,261,1665471600"; d="scan'208";a="653339587"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 20 Dec 2022 18:32:09 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1p7ots-0009m3-2K;
 Wed, 21 Dec 2022 02:32:08 +0000
Date: Wed, 21 Dec 2022 10:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 6dca27b063e466f68bd7b7679e5a168ec857deb1
Message-ID: <63a26fc3.98n1VScPghv05j8P%lkp@intel.com>
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
branch HEAD: 6dca27b063e466f68bd7b7679e5a168ec857deb1  drm/i915/gvt: fix vgpu debugfs clean in remove

elapsed time: 1181m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-bpf
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
ia64                             allmodconfig
m68k                             allyesconfig
um                             i386_defconfig
powerpc                           allnoconfig
s390                             allyesconfig
i386                                defconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
m68k                             allmodconfig
s390                                defconfig
sh                               allmodconfig
arc                              allyesconfig
arm                                 defconfig
x86_64                              defconfig
mips                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20221219
i386                 randconfig-a001-20221219
i386                 randconfig-a003-20221219
x86_64                           allyesconfig
x86_64                            allnoconfig
x86_64               randconfig-a003-20221219
riscv                randconfig-r042-20221218
i386                 randconfig-a002-20221219
arm64                            allyesconfig
x86_64               randconfig-a001-20221219
i386                 randconfig-a006-20221219
x86_64               randconfig-a004-20221219
x86_64               randconfig-a006-20221219
x86_64               randconfig-a005-20221219
arm                              allyesconfig
i386                 randconfig-a005-20221219
x86_64               randconfig-a002-20221219
i386                             allyesconfig
arc                  randconfig-r043-20221219
arm                  randconfig-r046-20221219
arc                  randconfig-r043-20221218
s390                 randconfig-r044-20221218

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20221219
x86_64               randconfig-a012-20221219
x86_64               randconfig-a014-20221219
arm                  randconfig-r046-20221218
hexagon              randconfig-r041-20221218
hexagon              randconfig-r045-20221219
x86_64               randconfig-a013-20221219
s390                 randconfig-r044-20221219
x86_64               randconfig-a016-20221219
hexagon              randconfig-r041-20221219
x86_64               randconfig-a015-20221219
hexagon              randconfig-r045-20221218
i386                 randconfig-a014-20221219
i386                 randconfig-a012-20221219
i386                 randconfig-a013-20221219
riscv                randconfig-r042-20221219
i386                 randconfig-a015-20221219
i386                 randconfig-a016-20221219
i386                 randconfig-a011-20221219

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
