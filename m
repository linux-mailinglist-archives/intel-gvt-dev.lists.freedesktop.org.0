Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC325E7711
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Sep 2022 11:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C40710E7F8;
	Fri, 23 Sep 2022 09:28:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4210E7F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Sep 2022 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CoUw4thW9ufTem91w3lWVNAkfwZXyINk29SvpieilW4=; b=n/TzYmCPrsheitSnJKSvN1lOnx
 OW+6TwU3Secx2oyZd3yujIcMnW0Nn34Re3TLuxrhLzsXTQ1+CHHFXzZoj5iDgk/asXroRyz/nyOEU
 n6sRMk1pdYCrqBmmAsp9Ff3iWheISVdSFGN04NR/8YTyeZQadMASXbjZsP5UFiaiXpc8g3PdQtKUa
 FcUqtT2m1wjKiPTSSzfllf6aIbDlTayfxacJ4XzBvxKLMqyFDwdEfCecgsmPM1QtTLcol+hHjiwek
 jJSZYPVNH1O2lDKkyEbceXqpa1qT0jDrjXhc3aZTj4W5Kbed6N4n1UqeXEMSkAplVVrh0qybaoMms
 sEloIlFw==;
Received: from ip4d15bec4.dynamic.kabel-deutschland.de ([77.21.190.196]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1obexS-003JeO-Gs; Fri, 23 Sep 2022 09:26:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: simplify the mdev interface v8
Date: Fri, 23 Sep 2022 11:26:38 +0200
Message-Id: <20220923092652.100656-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-s390@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi all,

this series significantly simplifies the mdev driver interface by
following the patterns for device model interaction used elsewhere in
the kernel.

Changes since v7:
 - rebased to the latests vfio/next branch
 - move the mdev.h include from cio.h to vfio_ccw_private.h
 - don't free the parent in mdev_type_release
 - set the pretty_name for vfio_ap
 - fix the available_instances check in mdev_device_create

Changes since v6:
 - rebased to Linux 6.0-rc2
 - folded in a patch from Eric Farman to fix the placement of the new
   embedded mdev structured in the s390 cio driver

Changes since v5:
 - rebased to the latest vfio/next branch
 - drop the last patch again
 - make sure show_available_instances works properly for the internallly
   tracked case

Changes since v4:
 - move the kobject_put later in mdev_device_release 
 - add a Fixes tag for the first patch
 - add another patch to remove an extra kobject_get/put

Changes since v3:
 - make the sysfs_name and pretty_name fields pointers instead of arrays
 - add an i915 cleanup to prepare for the above

Changes since v2:
 - rebased to vfio/next
 - fix a pre-existing memory leak in i915 instead of making it worse
 - never manipulate if ->available_instances if drv->get_available is
   provided
 - keep a parent reference for the mdev_type
 - keep a few of the sysfs.c helper function around
 - improve the documentation for the parent device lifetime
 - minor spellig / formatting fixes

Changes since v1:
 - embedd the mdev_parent into a different sub-structure in i916
 - remove headers now inclued by mdev.h from individual source files
 - pass an array of mdev_types to mdev_register_parent
 - add additional patches to implement all attributes on the
   mdev_type in the core code

Diffstat:
 Documentation/driver-api/vfio-mediated-device.rst |   26 +-
 Documentation/s390/vfio-ap.rst                    |    2 
 Documentation/s390/vfio-ccw.rst                   |    2 
 drivers/gpu/drm/i915/gvt/aperture_gm.c            |   20 +-
 drivers/gpu/drm/i915/gvt/gvt.h                    |   42 ++--
 drivers/gpu/drm/i915/gvt/kvmgt.c                  |  168 ++++-------------
 drivers/gpu/drm/i915/gvt/vgpu.c                   |  210 +++++++---------------
 drivers/s390/cio/cio.h                            |    1 
 drivers/s390/cio/vfio_ccw_drv.c                   |   12 -
 drivers/s390/cio/vfio_ccw_ops.c                   |   51 -----
 drivers/s390/cio/vfio_ccw_private.h               |    6 
 drivers/s390/crypto/vfio_ap_ops.c                 |   68 +------
 drivers/s390/crypto/vfio_ap_private.h             |    6 
 drivers/vfio/mdev/mdev_core.c                     |  190 ++++---------------
 drivers/vfio/mdev/mdev_driver.c                   |    7 
 drivers/vfio/mdev/mdev_private.h                  |   32 ---
 drivers/vfio/mdev/mdev_sysfs.c                    |  189 ++++++++++---------
 include/linux/mdev.h                              |   77 ++++----
 samples/vfio-mdev/mbochs.c                        |  103 +++-------
 samples/vfio-mdev/mdpy.c                          |  115 +++---------
 samples/vfio-mdev/mtty.c                          |   94 +++------
 21 files changed, 464 insertions(+), 957 deletions(-)
