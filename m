Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA758DC62
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Aug 2022 18:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A518F970;
	Tue,  9 Aug 2022 16:47:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F2414A7AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  9 Aug 2022 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660063615; x=1691599615;
 h=date:from:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TKX7je0Ix7oooKX33D1iKHwMRyZ/zps84N/ObwiWzNA=;
 b=hH+kg82rZ51bcHaqBwNfKcU5c9vFEr1qr0tbBE4fnhQYOi8QdcrVH3Ad
 YirJ12HpaIAq8rWvGFBv5BSge3tVedZ4Kj1Sjo9uCHrkJ7uK9CE05hi3I
 MMS4Y6pCDkXM0MpTx8GzVawitHBfu3keMIKqP+v/8beLY0jTMsTfcN2NI
 RLhogLR7EEmFNc5km7hn/vg4bjgxIL5GaVC81r871BJizXoMpLMv31VCz
 JwwSAr0//gnS64ZRyDzQQ0rgg99p4KNF01QpiCIkmLZODXuhhJr4IJ2R4
 jEDaCfq/BvcNH502hRCAgBnaLgKYGCWhXgWTVVo2Rm7SITFN94cmpIRXS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="290885590"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; d="scan'208";a="290885590"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 09:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; d="scan'208";a="555408810"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2022 09:46:53 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oLSNY-000N5R-1K;
 Tue, 09 Aug 2022 16:46:52 +0000
Date: Wed, 10 Aug 2022 00:46:47 +0800
From: kernel test robot <lkp@intel.com>
Subject: [intel-gvt:pr/215] BUILD SUCCESS
 c63e796d7980ef5f42791bbc82b902e15d15de91
Message-ID: <62f28f77./P7zsLksgH+JxDYB%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git pr/215
branch HEAD: c63e796d7980ef5f42791bbc82b902e15d15de91  Fixes issue #212 and #77

elapsed time: 703m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
i386                             allyesconfig
x86_64                           allyesconfig
powerpc                           allnoconfig
arm                              allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220808
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                                 defconfig
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a001-20220808
i386                 randconfig-a005-20220808
i386                 randconfig-a002-20220808
i386                 randconfig-a003-20220808
i386                 randconfig-a004-20220808
i386                 randconfig-a006-20220808
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64               randconfig-a003-20220808
x86_64               randconfig-a001-20220808
x86_64               randconfig-a002-20220808
x86_64               randconfig-a004-20220808
x86_64               randconfig-a005-20220808
x86_64               randconfig-a006-20220808

clang tested configs:
hexagon              randconfig-r041-20220808
s390                 randconfig-r044-20220808
hexagon              randconfig-r045-20220808
riscv                randconfig-r042-20220808
x86_64               randconfig-a014-20220808
x86_64               randconfig-a013-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
x86_64               randconfig-a015-20220808
x86_64               randconfig-a016-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a016-20220808
i386                 randconfig-a015-20220808

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
