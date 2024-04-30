Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A608B66C7
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2024 02:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97210E6B2;
	Tue, 30 Apr 2024 00:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXS3jlbZ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBA910E6B2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2024 00:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714436023; x=1745972023;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+jZ5RkuDJvgEX00D+kcZ0bREV+2MB3967bErI5zdKdY=;
 b=cXS3jlbZ2nGzsuan0Q3RJ6RFDr5QruzdLiE/WAIiaeYgMQDWDjJgQa4l
 YSc4aeNXNhVxFDOycy9cQCKFJASkjlkA1pw+xQRGydL+3vr+Xkm+e4sKW
 iJZ+brPZnl3mDEYPB+vewXQEBVp+XEwy0MtYn7eX/NyjmeQIKENCirvVV
 /T2Mrbiwq6S0ysy9pChYlVoOnrSIy/GfTTARt8tflZVDVhux54ITUCqLK
 Uq5PdPw3kFwYXqL1NzrRRXZ8Y/fpitvMgQSPLrMePWRIL1PAW6e5q/Hqm
 4p/ESP3LrPXKIyPs3/kl0RcICX1rkahicNWamcM0IKjf3dKLi6kHitVQi w==;
X-CSE-ConnectionGUID: sKnNFHXLSUSrtduYqGkKVA==
X-CSE-MsgGUID: 4G0rtbVOS72dNzlCnY+dAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13911450"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="13911450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 17:13:43 -0700
X-CSE-ConnectionGUID: AUPW7x8fQgiBE7cyWORGeQ==
X-CSE-MsgGUID: lOrT2mW5QCuREQzY8/dp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="30729105"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 17:13:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s1b7q-0007Xv-2r;
 Tue, 30 Apr 2024 00:13:38 +0000
Date: Tue, 30 Apr 2024 08:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Ware <ryan.ware@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, zhenyu.z.wang@intel.com,
 terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: [intel-gvt:pr/236 1/1] htmldocs: Warning:
 Documentation/doc-guide/sphinx.rst references a file that doesn't exist:
 Documentation/sphinx/requirements.txt
Message-ID: <202404300814.T7UmgzBA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://github.com/intel/gvt-linux.git pr/236
head:   610b2bb74d663c7cc375650ffe6f8b285e18bff4
commit: 610b2bb74d663c7cc375650ffe6f8b285e18bff4 [1/1] Removed unneeded requirements.txt pointing to insecure version of Jinja2.
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404300814.T7UmgzBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300814.T7UmgzBA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/admin-guide/media/meye.rst
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
>> Warning: Documentation/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
   Warning: Documentation/mm/hugetlbfs_reserv.rst references a file that doesn't exist: Documentation/mm/hugetlbpage.rst
   Warning: Documentation/mm/physical_memory.rst references a file that doesn't exist: Documentation/admin-guide/mm/memory_hotplug.rst
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
>> Warning: Documentation/translations/it_IT/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/translations/it_IT/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/translations/zh_CN/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/translations/zh_CN/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
   Warning: Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst references a file that doesn't exist: Documentation/mm/hugetlbpage.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
>> Warning: scripts/sphinx-pre-install references a file that doesn't exist: Documentation/sphinx/requirements.txt
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
   Can't open ./Documentation/sphinx/requirements.txt at ./scripts/sphinx-pre-install line 297.
   make[1]: *** [Documentation/Makefile:95: htmldocs] Error 2
   make: *** [Makefile:1821: htmldocs] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
