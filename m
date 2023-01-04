Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C28465DD22
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Jan 2023 20:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039C610E090;
	Wed,  4 Jan 2023 19:53:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA5810E090
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Jan 2023 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672861992; x=1704397992;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=DT+dLRVMyQVO80WFakrNgTfWR6yRKeKp3nEDZJo0bvE=;
 b=Bc7prm7U1MHlnaHRi4l7R68jZ0VlBudILJ0ojO4J4dozw9z6CGtD00xd
 GcTrxebjGIChv2pFsDbX1QysW7ZO+84UH+CSQQcSzXAcdVpXRJwKlJElC
 XQKKyueadDGimCODWGkTIeXnuqrarIiJRS09iLNBaZH7i0/XGf+XNSLBP
 zu0IbHEyo6XYly+bCEiwmmVSe+ct/Nvc2gEGmlemM+LTBd94lEeGRcVjO
 SkiH7nEn4EMfS4yK3P1ZCh2L1BaHlXaHI+24M+GKZmIvinRS+6PFogk3o
 c5DjNgMQDnGZtkhBAXBitvHORJK4pYsbS0LhnC1MF0iFbajWiECBF/mYY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="305530887"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="305530887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 11:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="723775311"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="723775311"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2023 11:53:08 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pD9ox-0000iS-3B;
 Wed, 04 Jan 2023 19:53:07 +0000
Date: Thu, 05 Jan 2023 03:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 601fd0f6b2a4c776a21ab8300fe0de0726937623
Message-ID: <63b5d8fe.C7uxe0fIQ2jpmZVV%lkp@intel.com>
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
branch HEAD: 601fd0f6b2a4c776a21ab8300fe0de0726937623  drm/i915/gvt: fix double free bug in split_2MB_gtt_entry

elapsed time: 722m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
x86_64                           allyesconfig
arc                                 defconfig
ia64                             allmodconfig
i386                 randconfig-a003-20230102
x86_64                           rhel-8.3-bpf
s390                             allmodconfig
i386                 randconfig-a001-20230102
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
i386                 randconfig-a002-20230102
alpha                               defconfig
i386                 randconfig-a005-20230102
i386                 randconfig-a006-20230102
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
s390                                defconfig
x86_64                          rhel-8.3-func
i386                                defconfig
sh                               allmodconfig
arm                                 defconfig
mips                             allyesconfig
riscv                randconfig-r042-20230101
powerpc                          allmodconfig
s390                 randconfig-r044-20230101
arc                  randconfig-r043-20230102
x86_64               randconfig-a001-20230102
x86_64               randconfig-a004-20230102
x86_64               randconfig-a002-20230102
arm                  randconfig-r046-20230102
x86_64               randconfig-a003-20230102
x86_64               randconfig-a006-20230102
arc                  randconfig-r043-20230101
x86_64               randconfig-a005-20230102
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20230102
hexagon              randconfig-r041-20230102
s390                 randconfig-r044-20230102
hexagon              randconfig-r045-20230101
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
x86_64               randconfig-a014-20230102
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a015-20230102
i386                 randconfig-a016-20230102

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
