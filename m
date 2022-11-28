Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341163B597
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 29 Nov 2022 00:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8350610E246;
	Mon, 28 Nov 2022 23:06:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896310E246
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 28 Nov 2022 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669676766; x=1701212766;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ydGXU/6CgfnwRHAdbIpGnXtJI8+UhRKduOFjV+OxxE4=;
 b=WtWkm+PFV9Z7k5p3rHp71vqp+KJdVppk9U9S1eP6ffpaLQG0BHXknI1Y
 XAIBq+Zqptugvv4mDxb0r8ik5UPi8xSgXnrJ0dmMtCAqD86LZHOb4YKlW
 hky0JyWxWqZxLcGx+tBZtnA3hSUA3x/tEmt7gPmEVafX5br4nvgvpV1yY
 oz7H4YNGwvZZOSJaf7XvhSl1UBi9yQFjWS0QrxeRt5ztoBirErC1XUrSQ
 TWHTw3r0onmvZgWLDbAUMdlVNzD6aZHHqS3iFGrI/M/ZgluQmyaWB7SkC
 nCzSJHfkESa2AyCoQYz60JqEX9lKePXBPxPbjIlgwo8lB4WSiaALpaW0C w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="341885803"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="341885803"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 15:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="749585948"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="749585948"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2022 15:06:02 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oznCL-0008Mx-2V;
 Mon, 28 Nov 2022 23:06:01 +0000
Date: Tue, 29 Nov 2022 07:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 a4f6f18a99bedc4edbd9e23e52b98e31cf98e0a8
Message-ID: <63853ec6./zNV3pQwGiOz1uEu%lkp@intel.com>
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
branch HEAD: a4f6f18a99bedc4edbd9e23e52b98e31cf98e0a8  gvt-staging: 2022y-11m-28d-17h-38m-42s CST integration manifest

elapsed time: 782m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
arc                  randconfig-r043-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
s390                             allyesconfig
i386                 randconfig-a004-20221128
mips                             allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
ia64                             allmodconfig
i386                             allyesconfig
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a001-20221128
x86_64               randconfig-a006-20221128
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a014-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
