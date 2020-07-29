Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E802326B2
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Jul 2020 23:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495196E2E5;
	Wed, 29 Jul 2020 21:18:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673A36E2E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Jul 2020 21:18:52 +0000 (UTC)
IronPort-SDR: jfEEYIm5ipxebnWV/++3h3EeL8SolTDBPGXY4CU2dp8VKz2zI/NidVcvYPZZfGaQtKL6QyPjHF
 +6h9QlhFl07w==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="131057310"
X-IronPort-AV: E=Sophos;i="5.75,411,1589266800"; d="scan'208";a="131057310"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 14:18:51 -0700
IronPort-SDR: bbEomjQ71LSjHMLWPeJ6jqp/ibr75TvZuquzFF0XIIZUNX7sgczb07FwmbgwpBuQxiW8nP57tT
 gOb6aJV9PG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,411,1589266800"; d="scan'208";a="328771178"
Received: from lkp-server02.sh.intel.com (HELO 1bde1f275adc) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2020 14:18:49 -0700
Received: from kbuild by 1bde1f275adc with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k0tTM-0000Dc-IV; Wed, 29 Jul 2020 21:18:48 +0000
Date: Thu, 30 Jul 2020 05:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 9e7c0efadb86ddb58965561bbca638d44792d78f
Message-ID: <5f21e7ab.xxpaLFzMZqYF4ieg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git  gvt-next-fixes
branch HEAD: 9e7c0efadb86ddb58965561bbca638d44792d78f  drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0

elapsed time: 896m

configs tested: 57
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            qcom_defconfig
powerpc                      ep88xc_defconfig
mips                  decstation_64_defconfig
xtensa                           alldefconfig
mips                          ath79_defconfig
mips                         db1xxx_defconfig
m68k                          amiga_defconfig
arc                        nsim_700_defconfig
mips                        vocore2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
