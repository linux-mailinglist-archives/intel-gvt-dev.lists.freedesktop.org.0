Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5617B975
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Mar 2020 10:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBBC6E84B;
	Fri,  6 Mar 2020 09:41:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01F6ECAA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2020 09:41:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 01:41:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; d="scan'208";a="387776094"
Received: from joy-desktop.sh.intel.com ([10.239.13.12])
 by orsmga004.jf.intel.com with ESMTP; 06 Mar 2020 01:41:43 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vfio/migration: fix dirty pages lost bug for ram beyond 3G
Date: Fri,  6 Mar 2020 17:41:29 +0800
Message-Id: <1583487689-9813-1-git-send-email-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

the start address passing to
cpu_physical_memory_set_dirty_range() and
cpu_physical_memory_set_dirty_lebitmap() is the address within the
ram block plus ram block offset.

it's safe to set this start address to gpa if total memory is less than
3G, as ram block offset for pc.ram is 0. But if memory size is beyond
3G, gpa is not equal to the offset in its ram block.

e.g.
for gpa 0x100000000, its offset is actually 0xc0000000.
and for gpa 0x42f500000, its offset should be 0x3EF500000.

This fix is based on Kirti's VFIO live migration patch set v8.
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05542.html
(for PATCH v8 11/13
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05553.html
and PATCH v8 12/13
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05554.html
}

The idea behind it should also be applied to other VFIO live migraiton
patch series below:
https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg01763.html
(Kirti v9)
https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg04912.html
(Yan)
https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg01138.html
(Yulei RFC v4)
https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg05568.html
(Yulei RFC)

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 hw/vfio/common.c              | 5 ++++-
 hw/vfio/migration.c           | 8 +++++---
 include/hw/vfio/vfio-common.h | 3 ++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6f36b02..ba1a8ef 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -799,6 +799,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
         MemoryRegionSection *section)
 {
     uint64_t start_addr, size, pfn_count;
+    uint64_t block_start;
     VFIOGroup *group;
     VFIODevice *vbasedev;
 
@@ -819,11 +820,13 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
     start_addr = TARGET_PAGE_ALIGN(section->offset_within_address_space);
     size = int128_get64(section->size);
     pfn_count = size >> TARGET_PAGE_BITS;
+    block_start = TARGET_PAGE_ALIGN(section->offset_within_region +
+                             memory_region_get_ram_addr(section->mr));
 
     QLIST_FOREACH(group, &vfio_group_list, next) {
         QLIST_FOREACH(vbasedev, &group->device_list, next) {
             vfio_get_dirty_page_list(vbasedev, start_addr >> TARGET_PAGE_BITS,
-                                     pfn_count, TARGET_PAGE_SIZE);
+                                     pfn_count, TARGET_PAGE_SIZE, block_start);
         }
     }
 }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 640bea1..a19b957 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -279,7 +279,8 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
 void vfio_get_dirty_page_list(VFIODevice *vbasedev,
                               uint64_t start_pfn,
                               uint64_t pfn_count,
-                              uint64_t page_size)
+                              uint64_t page_size,
+                              uint64_t block_start)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -293,6 +294,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
     while (total_pfns > 0) {
         uint64_t bitmap_size, data_offset = 0;
         uint64_t start = start_pfn + count;
+        uint64_t block_start_seg = block_start + count * page_size;
         void *buf = NULL;
         bool buffer_mmaped = false;
 
@@ -341,7 +343,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
             break;
         } else if (copied_pfns == VFIO_DEVICE_DIRTY_PFNS_ALL) {
             /* Mark all pages dirty for this range */
-            cpu_physical_memory_set_dirty_range(start * page_size,
+            cpu_physical_memory_set_dirty_range(block_start_seg,
                                                 total_pfns * page_size,
                                                 DIRTY_MEMORY_MIGRATION);
             break;
@@ -382,7 +384,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
         }
 
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)buf,
-                                               start * page_size,
+                                               block_start_seg,
                                                copied_pfns);
         count      += copied_pfns;
         total_pfns -= copied_pfns;
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 41ff5eb..6d868fa 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -220,6 +220,7 @@ int vfio_spapr_remove_window(VFIOContainer *container,
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
 void vfio_migration_finalize(VFIODevice *vbasedev);
 void vfio_get_dirty_page_list(VFIODevice *vbasedev, uint64_t start_pfn,
-                               uint64_t pfn_count, uint64_t page_size);
+                               uint64_t pfn_count, uint64_t page_size,
+                               uint64_t block_start);
 
 #endif /* HW_VFIO_VFIO_COMMON_H */
-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
