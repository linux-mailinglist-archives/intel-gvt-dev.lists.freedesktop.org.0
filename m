Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74255BE57
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Jun 2022 07:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A45112892;
	Tue, 28 Jun 2022 05:13:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8111287A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Jun 2022 05:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=BybgAHG8mcJZK+n0MmfXzPg6oqI7+V4cJS5wzBl8ZAE=; b=B8vLEhmssejIlGYqBqjL6vg5OW
 yAwmOIAjITTPfObls/2cn4SR/eqDHafdNul7pH1adSRUWjU+AnGfWFG+M5z0s9kCP++HP+P1BjYWI
 vJDu27KezM1mjP9YOeR3m15BZGcD/EUa03l0UxvGJCsxR8RR+s1DhFR5kyF+5K3ybNxG+8TuUHDtk
 xWHfWCfIxjrCs0Iv6a6oGeJgN0APPO3Ml9oAPo1E0GvAXS1nAggd27qg4nVW4ViIxZPhT+C29Z6l+
 1gUSKK9SqZr/12all5/AlLhiCLDp81esQ658YFFs2n3qPM4b+EzABEQ5s0gDd3bN4Y256ptl6GPt0
 bjiFZUPg==;
Received: from [2001:4bb8:199:3788:e965:1541:b076:2977] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o63XK-004KYE-O0; Tue, 28 Jun 2022 05:13:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: simplify the mdev interface v3
Date: Tue, 28 Jun 2022 07:13:02 +0200
Message-Id: <20220628051315.695254-1-hch@lst.de>
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

this series signigicantly simplies the mdev driver interface by following
the patterns for device model interaction used elsewhere in the kernel.

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
 Documentation/driver-api/vfio-mediated-device.rst |   26 +--
 Documentation/s390/vfio-ap.rst                    |    2 
 Documentation/s390/vfio-ccw.rst                   |    2 
 drivers/gpu/drm/i915/gvt/gvt.h                    |    6 
 drivers/gpu/drm/i915/gvt/kvmgt.c                  |  158 ++++--------------
 drivers/gpu/drm/i915/gvt/vgpu.c                   |   66 ++-----
 drivers/s390/cio/cio.h                            |    4 
 drivers/s390/cio/vfio_ccw_drv.c                   |    3 
 drivers/s390/cio/vfio_ccw_ops.c                   |   60 +------
 drivers/s390/cio/vfio_ccw_private.h               |    2 
 drivers/s390/crypto/vfio_ap_ops.c                 |   68 +-------
 drivers/s390/crypto/vfio_ap_private.h             |    6 
 drivers/vfio/mdev/mdev_core.c                     |  185 ++++-----------------
 drivers/vfio/mdev/mdev_driver.c                   |    7 
 drivers/vfio/mdev/mdev_private.h                  |   32 ---
 drivers/vfio/mdev/mdev_sysfs.c                    |  187 +++++++++++-----------
 include/linux/mdev.h                              |   77 ++++-----
 samples/vfio-mdev/mbochs.c                        |  103 +++---------
 samples/vfio-mdev/mdpy.c                          |  115 +++----------
 samples/vfio-mdev/mtty.c                          |   94 +++--------
 20 files changed, 380 insertions(+), 823 deletions(-)
