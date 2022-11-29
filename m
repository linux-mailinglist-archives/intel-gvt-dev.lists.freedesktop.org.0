Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A798463B636
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 01:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE2F10E356;
	Tue, 29 Nov 2022 00:02:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AD610E356
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 29 Nov 2022 00:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669680130; x=1701216130;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Eia9YvQaDOARii/wjb/c55YbxuvFcuwODhUre897IMU=;
 b=hQlNqKZX8TBsdS0dX9Z0i5B+BCqKgtSnqoo43nx3TbLJAdWEPDFQQz+y
 IChSCrlJwEqYwpSTkUX8Ue6XD09LMKO5HKULxooJ3D3cI35/mV4EiYStL
 XUeodZj+twxmgoUo4y5ESl7b2QqNT3MgQGJPMBdCquQy7MpNykCrxlVKP
 zEgS4XZDkJcOsms6cDDwZnnfariNVYnhtoPCN9te0GdIHHUGPbMgc8QQg
 P8oAdkN+65HgC/utLwBXiF6qZOt+bWi/l3cl8T4l0ln47sK9D4XRUAZw4
 Ma7S50GX0JCxD61DaPEbDcLYOmdR6kCKISSjSTU0SMAcFdeN6337OVx79 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295354565"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="295354565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 16:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674416773"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="674416773"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 28 Nov 2022 16:02:04 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ozo4Z-0008Pq-27;
 Tue, 29 Nov 2022 00:02:03 +0000
Date: Tue, 29 Nov 2022 08:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 3a090dae8a44ea1f32dee9dbef27e2da9988634b
Message-ID: <63854be7.9lD4i1Z9Uhauj0Al%lkp@intel.com>
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
branch HEAD: 3a090dae8a44ea1f32dee9dbef27e2da9988634b  drm/i915/gvt: use atomic operations to change the vGPU status

elapsed time: 839m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
ia64                             allmodconfig
i386                 randconfig-a004-20221128
i386                 randconfig-a005-20221128
powerpc                           allnoconfig
mips                             allyesconfig
i386                 randconfig-a006-20221128
x86_64                              defconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
arc                                 defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
alpha                               defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
s390                                defconfig
arc                  randconfig-r043-20221128
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a001-20221128
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a015-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
