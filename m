Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D587553C4E8
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jun 2022 08:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69999113A7C;
	Fri,  3 Jun 2022 06:33:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DFD112C8E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jun 2022 06:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0uBGXCRA3EENtOnIKbDFlPVB4jKOIAxPBU76Buv3j3M=; b=0uZvK/8SNHCMvpPoFLkj53nN3+
 on6+1wVinmHTEwU8iFXGZsvS45VQesZ1BC9SskcKA9OHVctRAkH34d0/eRGRNo5V0rjZt20S3Jm6P
 fqR+yzS6IkS0UJu8Ohw3L9sWuQNAmwKgy79VlG/SUzp/UDhTjGhZANIE/u91dw6lAoQX3GmQUPs2p
 ShzotAkNYZ92+BhGJhwUA+1IGESFeGtv0Kd3u+AGa0FuP8CxX7g7LzftH9pFFNuw996IBZq+XC6DC
 1/tmQ3oXJ0fejwn2Zv5hwCz14Hh5R+kb4Sv4w73Vc4zQ64Lr7hjohArPpbakH8BQi6mnuLkyr93CE
 bx33cVbw==;
Received: from [2001:4bb8:185:a81e:b29a:8b56:eb9a:ca3b] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nx0sE-00610C-7L; Fri, 03 Jun 2022 06:33:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: simplify the mdev interface
Date: Fri,  3 Jun 2022 08:33:20 +0200
Message-Id: <20220603063328.3715-1-hch@lst.de>
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
 kvm@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi all,

this series signigicantly simplies the mdev driver interface by following
the patterns for device model interaction used elsewhere in the kernel.

Diffstat:
 Documentation/driver-api/vfio-mediated-device.rst |   16 -
 Documentation/s390/vfio-ap.rst                    |    2 
 Documentation/s390/vfio-ccw.rst                   |    2 
 drivers/gpu/drm/i915/gvt/gvt.h                    |    1 
 drivers/gpu/drm/i915/gvt/kvmgt.c                  |  116 ++++----------
 drivers/gpu/drm/i915/i915_drv.h                   |    2 
 drivers/s390/cio/cio.h                            |    3 
 drivers/s390/cio/vfio_ccw_ops.c                   |   32 +--
 drivers/s390/crypto/vfio_ap_ops.c                 |   25 +--
 drivers/s390/crypto/vfio_ap_private.h             |    2 
 drivers/vfio/mdev/mdev_core.c                     |  181 ++++------------------
 drivers/vfio/mdev/mdev_driver.c                   |    1 
 drivers/vfio/mdev/mdev_private.h                  |   38 ----
 drivers/vfio/mdev/mdev_sysfs.c                    |  145 ++---------------
 include/linux/mdev.h                              |   40 +++-
 samples/vfio-mdev/mbochs.c                        |   69 ++++----
 samples/vfio-mdev/mdpy.c                          |   61 +++----
 samples/vfio-mdev/mtty.c                          |   77 +++++----
 18 files changed, 258 insertions(+), 555 deletions(-)
