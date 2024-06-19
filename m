Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B385990E1F0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Jun 2024 05:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9BB10EA90;
	Wed, 19 Jun 2024 03:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu2+I2zT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35CB10EA90
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Jun 2024 03:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718767361; x=1750303361; h=date:from:cc:subject:message-id;
 bh=5ivcn0KPscCTQwUYD1FN4cQ0KHI9RDIiEmtGLXQ2fHA=;
 b=Hu2+I2zTzlzJ7KeNKpqHAdebOoT4RCcF0XEnUYigTDWjcYHT1hvkdlp9
 j4Ea0ldfJQ5iWqIdwbWJNSx9DdG5m/YD9L1cySOovBuD4gfckQ8nYXH7l
 xPmFrdLQhh7IfQn/Y4uX/NHtohaPbJ1c1+aMtr3wOkpumToUAZSNquhS4
 1SWgBPeLrNT/n376eMifqltJanWQ09wckqPWMDtl2FQJfDLyp7LDOHyD6
 n8S1tgNs3HUovjiej4BbY6SnUIrvyaULA0N6SxuC2fBITa9V89S8xUKqA
 mYSqLRSMmE8UiFkmFtJABac5XPylo2Alf0Y6+ZJX7113PdowShP0yj7jl A==;
X-CSE-ConnectionGUID: yT1JXJt9Qzi2L7rTmByefw==
X-CSE-MsgGUID: EXcsbFsQS0e+gv0amc2OzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33225871"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="33225871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 20:22:40 -0700
X-CSE-ConnectionGUID: UKixTFm+S1mkec8I6OdmQQ==
X-CSE-MsgGUID: aUcdgFPNSd2/ADVJLokIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="41900719"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2024 20:22:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sJlu8-0006EL-2l;
 Wed, 19 Jun 2024 03:22:36 +0000
Date: Wed, 19 Jun 2024 11:21:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [intel-gvt:dependabot/pip/drivers/gpu/drm/ci/xfails/urllib3-2.2.2]
 BUILD SUCCESS 74f29db864d3be1eabed9dd449c50547555e0294
Message-ID: <202406191144.vFlsZFb5-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git dependabot/pip/drivers/gpu/drm/ci/xfails/urllib3-2.2.2
branch HEAD: 74f29db864d3be1eabed9dd449c50547555e0294  build(deps): bump urllib3 in /drivers/gpu/drm/ci/xfails

elapsed time: 1704m

configs tested: 80
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240618   gcc-13.2.0
arc                   randconfig-002-20240618   gcc-13.2.0
arm                   randconfig-001-20240618   gcc-13.2.0
arm                   randconfig-002-20240618   gcc-13.2.0
arm                   randconfig-003-20240618   clang-19
arm                   randconfig-004-20240618   gcc-13.2.0
arm64                 randconfig-001-20240618   clang-17
arm64                 randconfig-002-20240618   clang-19
arm64                 randconfig-003-20240618   clang-16
arm64                 randconfig-004-20240618   clang-19
csky                  randconfig-001-20240618   gcc-13.2.0
csky                  randconfig-002-20240618   gcc-13.2.0
hexagon               randconfig-001-20240618   clang-19
hexagon               randconfig-002-20240618   clang-19
i386         buildonly-randconfig-001-20240618   gcc-13
i386         buildonly-randconfig-002-20240618   gcc-12
i386         buildonly-randconfig-003-20240618   gcc-8
i386         buildonly-randconfig-004-20240618   gcc-10
i386         buildonly-randconfig-005-20240618   gcc-10
i386         buildonly-randconfig-006-20240618   gcc-10
i386                  randconfig-001-20240618   clang-18
i386                  randconfig-002-20240618   gcc-13
i386                  randconfig-003-20240618   gcc-13
i386                  randconfig-004-20240618   clang-18
i386                  randconfig-005-20240618   clang-18
i386                  randconfig-006-20240618   clang-18
i386                  randconfig-011-20240618   gcc-13
i386                  randconfig-012-20240618   gcc-11
i386                  randconfig-013-20240618   gcc-7
i386                  randconfig-014-20240618   gcc-11
i386                  randconfig-015-20240618   clang-18
i386                  randconfig-016-20240618   clang-18
loongarch             randconfig-001-20240618   gcc-13.2.0
loongarch             randconfig-002-20240618   gcc-13.2.0
nios2                 randconfig-001-20240618   gcc-13.2.0
nios2                 randconfig-002-20240618   gcc-13.2.0
parisc                randconfig-001-20240618   gcc-13.2.0
parisc                randconfig-002-20240618   gcc-13.2.0
powerpc               randconfig-001-20240618   gcc-13.2.0
powerpc               randconfig-002-20240618   clang-19
powerpc               randconfig-003-20240618   clang-19
powerpc64             randconfig-001-20240618   clang-19
powerpc64             randconfig-002-20240618   clang-17
powerpc64             randconfig-003-20240618   clang-19
riscv                 randconfig-001-20240618   gcc-13.2.0
riscv                 randconfig-002-20240618   clang-14
s390                  randconfig-001-20240618   clang-15
s390                  randconfig-002-20240618   gcc-13.2.0
sh                    randconfig-001-20240618   gcc-13.2.0
sh                    randconfig-002-20240618   gcc-13.2.0
sparc64               randconfig-001-20240618   gcc-13.2.0
sparc64               randconfig-002-20240618   gcc-13.2.0
um                    randconfig-001-20240618   clang-19
um                    randconfig-002-20240618   clang-19
x86_64       buildonly-randconfig-001-20240618   clang-18
x86_64       buildonly-randconfig-002-20240618   gcc-8
x86_64       buildonly-randconfig-003-20240618   clang-18
x86_64       buildonly-randconfig-004-20240618   gcc-13
x86_64       buildonly-randconfig-005-20240618   gcc-13
x86_64       buildonly-randconfig-006-20240618   gcc-12
x86_64                randconfig-001-20240618   clang-18
x86_64                randconfig-002-20240618   clang-18
x86_64                randconfig-003-20240618   gcc-11
x86_64                randconfig-004-20240618   clang-18
x86_64                randconfig-005-20240618   clang-18
x86_64                randconfig-006-20240618   clang-18
x86_64                randconfig-011-20240618   gcc-13
x86_64                randconfig-012-20240618   gcc-8
x86_64                randconfig-013-20240618   clang-18
x86_64                randconfig-014-20240618   clang-18
x86_64                randconfig-015-20240618   gcc-13
x86_64                randconfig-016-20240618   clang-18
x86_64                randconfig-071-20240618   gcc-13
x86_64                randconfig-072-20240618   clang-18
x86_64                randconfig-073-20240618   gcc-12
x86_64                randconfig-074-20240618   clang-18
x86_64                randconfig-075-20240618   gcc-8
x86_64                randconfig-076-20240618   gcc-13
xtensa                randconfig-001-20240618   gcc-13.2.0
xtensa                randconfig-002-20240618   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
