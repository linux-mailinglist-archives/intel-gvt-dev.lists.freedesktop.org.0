Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4A759C35A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Aug 2022 17:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3CE95209;
	Mon, 22 Aug 2022 15:49:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962D1951D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Aug 2022 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661183332; x=1692719332;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=PYQY1trkQoMajEkAds9atGYV89mcX+XCKu70CcvDvPE=;
 b=FlTIRbW04k6UeVXhjhiHKquldQbAKogp0S+m9Z55ROXeXU5WQRRSifbs
 OfwGDsMbGOR4n0bTkYQEnKO7A6cusTlqYo+9HLjV7APk5o+FaHLFroIO9
 3uVUgiRwJWKrgx+0t7EsLZ0e6PnL+wdS6DoNPXLcJW09Gronl4v74Q1xw
 5ztT3SoIRZXfi+WSfY2fWnyCP0DUt0UN3gXiRzhECCzLDk1g7OXYLQT6q
 n5JByroU48SwSwEKwOVSFEZ6RSUnXvkootxIzhFHhGbE9a1gM29DAvB4H
 Y6geUu9jjiRM3sUZRD2tzW9IaI6A6NtjJwPuq9GPXl3WmUKvikDN4sviq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379739569"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="379739569"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 08:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="751330215"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2022 08:48:50 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oQ9fV-0000Pm-30;
 Mon, 22 Aug 2022 15:48:49 +0000
Date: Mon, 22 Aug 2022 23:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 b75ef35bb57791a5d675699ed4a40c870d1da12f
Message-ID: <6303a54d.rhmOsJ1HvTRwIxXZ%lkp@intel.com>
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
branch HEAD: b75ef35bb57791a5d675699ed4a40c870d1da12f  drm/i915/gvt: Fix Comet Lake

elapsed time: 726m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                              defconfig
um                             i386_defconfig
arm                                 defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20220821
arc                  randconfig-r043-20220822
riscv                randconfig-r042-20220822
x86_64                           allyesconfig
csky                              allnoconfig
arc                               allnoconfig
sh                               allmodconfig
i386                                defconfig
alpha                             allnoconfig
riscv                             allnoconfig
s390                 randconfig-r044-20220822
mips                             allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
x86_64                          rhel-8.3-func
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64               randconfig-a014-20220822
x86_64               randconfig-a012-20220822
x86_64               randconfig-a013-20220822
m68k                             allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20220822
x86_64               randconfig-a015-20220822
x86_64               randconfig-a016-20220822
i386                 randconfig-a015-20220822
i386                 randconfig-a014-20220822
i386                 randconfig-a013-20220822
i386                 randconfig-a011-20220822
i386                 randconfig-a012-20220822
i386                 randconfig-a016-20220822

clang tested configs:
hexagon              randconfig-r041-20220822
hexagon              randconfig-r045-20220822
riscv                randconfig-r042-20220821
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821
i386                 randconfig-a001-20220822
i386                 randconfig-a002-20220822
i386                 randconfig-a003-20220822
i386                 randconfig-a006-20220822
i386                 randconfig-a005-20220822
i386                 randconfig-a004-20220822
x86_64               randconfig-a002-20220822
x86_64               randconfig-a003-20220822
x86_64               randconfig-a001-20220822
x86_64               randconfig-a004-20220822
x86_64               randconfig-a006-20220822
x86_64               randconfig-a005-20220822

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
