Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77962E4E3
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Nov 2022 19:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D653010E002;
	Thu, 17 Nov 2022 18:57:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D562810E002
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Nov 2022 18:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668711446; x=1700247446;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=9no9IwRkLQa82dXu7hotSr/TZp/YD66Bn2pK5eNmJO0=;
 b=kqGI61kEg0ntE9aR2SKMpMgp9vQhJAeomMlm/Ri0yqzz1oyRZSZxrpGE
 F3IHgka676+IJOXW0H1ldZJZSshiBchRu2Y3RTo491ZZllX9OuWhHwyFZ
 NWKNsdInNXV0mXhe5mULMJOBCs0SQwGQzKz8efMbWfJGOxEZPACGm16H+
 CoNe16uxeppC2iEsWtOseoxqCfkUU6lwQYFaO1way4kevmZW6tcZZ2H3m
 5P2yUMGvqZO9AcclWad3f0HjxerHS9ChMjT6r8+R1/9H+5WHkCc5IR4W8
 OVFjIM1iZaL6No0oo7VOG1Y5/7OgKw4lhVuH2kpBxzLDYxltmtvfc2Gkq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339777652"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="339777652"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 10:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="617724676"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="617724676"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 17 Nov 2022 10:57:09 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ovk4S-0000Z6-38;
 Thu, 17 Nov 2022 18:57:08 +0000
Date: Fri, 18 Nov 2022 02:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 04ec334e1a0381c3305da4d277cef9250769ca43
Message-ID: <637683dd.sCkzKmI9IjC98qsu%lkp@intel.com>
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
branch HEAD: 04ec334e1a0381c3305da4d277cef9250769ca43  drm/i915/gvt: Remove the unused function get_pt_type()

elapsed time: 737m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
arc                  randconfig-r043-20221117
ia64                             allmodconfig
riscv                randconfig-r042-20221117
x86_64                        randconfig-a013
s390                 randconfig-r044-20221117
x86_64                        randconfig-a011
arc                              allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
x86_64                               rhel-8.3
m68k                             allmodconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a003
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a005
powerpc                          allmodconfig
x86_64                        randconfig-a006
sh                               allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
m68k                       m5249evb_defconfig
sparc64                             defconfig
x86_64                           alldefconfig
arc                     nsimosci_hs_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        shmobile_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7780_defconfig

clang tested configs:
x86_64                        randconfig-a016
i386                          randconfig-a013
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221117
hexagon              randconfig-r041-20221117
i386                          randconfig-a011
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
