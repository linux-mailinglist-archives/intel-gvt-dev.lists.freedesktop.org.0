Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A26838C8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 31 Jan 2023 22:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B47110E2BA;
	Tue, 31 Jan 2023 21:37:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC0310E2BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 31 Jan 2023 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675201048; x=1706737048;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NA8PIp/qAQ9S8IAfY+mK4wzu9/p8Qj4gOa/Dv1ywC/E=;
 b=FhGCOudaqDWWVbz00CSYINflFQIgoMs8Syt9Nr2XTfOWhm6KzPhdUHe9
 VpCv82QXo8j8t1sp43+kcXNDZDxXNeVqPLl++xko5IfFlLaxzZ7rTQfyV
 My9XpnaWHsBjbvGxbZ9IowTGRsR6PHfTleHxFQ3Lkw53VXBHncBGY4sDp
 j+nsDGyaklVUhRwi8d7zdamSUIpwt7o1RGv9bfonMQCV3SmulQJ8gmb8F
 WAEbQpvJD25S8BaZ2fMLPCEEixQOoE+t3kVl7Me0+xqXaeU/XhE7mHTjc
 uC+lf9B44o7mko5VX7B9M3MNK1k7dyyxL+bb3w1d++MDC1E8/xAFqDxcS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311592415"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="311592415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 13:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="773159163"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="773159163"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 13:37:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pMyJh-0004iY-0G;
 Tue, 31 Jan 2023 21:37:25 +0000
Date: Wed, 01 Feb 2023 05:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 c351c2be08711bf367cefd15d40d7a13bc5755c7
Message-ID: <63d989f0.UmP7AJs1EqmdgEy6%lkp@intel.com>
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
branch HEAD: c351c2be08711bf367cefd15d40d7a13bc5755c7  drm/i915/gvt: Remove extra semicolon

elapsed time: 721m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
alpha                            allyesconfig
arc                                 defconfig
m68k                             allmodconfig
s390                             allmodconfig
alpha                               defconfig
m68k                             allyesconfig
s390                                defconfig
arc                              allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a002-20230130
x86_64                               rhel-8.3
x86_64               randconfig-a004-20230130
x86_64                           allyesconfig
x86_64               randconfig-a006-20230130
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                 randconfig-a004-20230130
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                 randconfig-a003-20230130
i386                 randconfig-a005-20230130
i386                 randconfig-a006-20230130
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
arm                                 defconfig
arm64                            allyesconfig
i386                                defconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230129
riscv                randconfig-r042-20230129
x86_64               randconfig-a014-20230130
riscv                randconfig-r042-20230130
hexagon              randconfig-r045-20230130
x86_64               randconfig-a012-20230130
hexagon              randconfig-r041-20230130
x86_64               randconfig-a013-20230130
hexagon              randconfig-r045-20230129
x86_64               randconfig-a011-20230130
s390                 randconfig-r044-20230129
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
s390                 randconfig-r044-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
