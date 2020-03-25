Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0BC193034
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Mar 2020 19:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F086897F0;
	Wed, 25 Mar 2020 18:19:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20713897F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Mar 2020 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585160371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azMKMjKPV052t5XwJnSu9sgGfeYyXtSz8ruQxkbcDxo=;
 b=QjX2UgYmQOSLDBQWVeihhdOvPOM8yTs9q/O3OCJsrkZ2hbhWC2XlPFVaiVpGUSIaqDDpqK
 W+7yB9FYFAsac+Q7J+AAzIzrsJhWUKNrqDOHBa1jVoXoVvxkIwp+MI5fvm693fL7EVqqF3
 hVrdc3MzBLADuUrGuFmjJzmqlpZATE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-eTiE4i44May_JqiRMfDmiQ-1; Wed, 25 Mar 2020 14:19:23 -0400
X-MC-Unique: eTiE4i44May_JqiRMfDmiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F26E8100550D;
 Wed, 25 Mar 2020 18:19:21 +0000 (UTC)
Received: from w520.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88E801001B09;
 Wed, 25 Mar 2020 18:19:21 +0000 (UTC)
Date: Wed, 25 Mar 2020 12:19:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>, kwankhede@nvidia.com
Subject: Re: [PATCH] vfio/migration: fix dirty pages lost bug for ram beyond 3G
Message-ID: <20200325121921.511d6e3b@w520.home>
In-Reply-To: <1583487689-9813-1-git-send-email-yan.y.zhao@intel.com>
References: <1583487689-9813-1-git-send-email-yan.y.zhao@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  6 Mar 2020 17:41:29 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> the start address passing to
> cpu_physical_memory_set_dirty_range() and
> cpu_physical_memory_set_dirty_lebitmap() is the address within the
> ram block plus ram block offset.
> 
> it's safe to set this start address to gpa if total memory is less than
> 3G, as ram block offset for pc.ram is 0. But if memory size is beyond
> 3G, gpa is not equal to the offset in its ram block.
> 
> e.g.
> for gpa 0x100000000, its offset is actually 0xc0000000.
> and for gpa 0x42f500000, its offset should be 0x3EF500000.
> 
> This fix is based on Kirti's VFIO live migration patch set v8.
> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05542.html
> (for PATCH v8 11/13
> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05553.html
> and PATCH v8 12/13
> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05554.html
> }
> 
> The idea behind it should also be applied to other VFIO live migraiton
> patch series below:
> https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg01763.html
> (Kirti v9)
> https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg04912.html
> (Yan)
> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg01138.html
> (Yulei RFC v4)
> https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg05568.html
> (Yulei RFC)
> 
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  hw/vfio/common.c              | 5 ++++-
>  hw/vfio/migration.c           | 8 +++++---
>  include/hw/vfio/vfio-common.h | 3 ++-
>  3 files changed, 11 insertions(+), 5 deletions(-)

Thanks for this, Yan.

Kirti, I never saw an acknowledgment of this, can you confirm you've
incorporated this into your latest?  I do see we're making use of
memory_region_get_ram_addr() now.  Thanks,

Alex

 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6f36b02..ba1a8ef 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -799,6 +799,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>          MemoryRegionSection *section)
>  {
>      uint64_t start_addr, size, pfn_count;
> +    uint64_t block_start;
>      VFIOGroup *group;
>      VFIODevice *vbasedev;
>  
> @@ -819,11 +820,13 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>      start_addr = TARGET_PAGE_ALIGN(section->offset_within_address_space);
>      size = int128_get64(section->size);
>      pfn_count = size >> TARGET_PAGE_BITS;
> +    block_start = TARGET_PAGE_ALIGN(section->offset_within_region +
> +                             memory_region_get_ram_addr(section->mr));
>  
>      QLIST_FOREACH(group, &vfio_group_list, next) {
>          QLIST_FOREACH(vbasedev, &group->device_list, next) {
>              vfio_get_dirty_page_list(vbasedev, start_addr >> TARGET_PAGE_BITS,
> -                                     pfn_count, TARGET_PAGE_SIZE);
> +                                     pfn_count, TARGET_PAGE_SIZE, block_start);
>          }
>      }
>  }
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 640bea1..a19b957 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -279,7 +279,8 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>  void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>                                uint64_t start_pfn,
>                                uint64_t pfn_count,
> -                              uint64_t page_size)
> +                              uint64_t page_size,
> +                              uint64_t block_start)
>  {
>      VFIOMigration *migration = vbasedev->migration;
>      VFIORegion *region = &migration->region;
> @@ -293,6 +294,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>      while (total_pfns > 0) {
>          uint64_t bitmap_size, data_offset = 0;
>          uint64_t start = start_pfn + count;
> +        uint64_t block_start_seg = block_start + count * page_size;
>          void *buf = NULL;
>          bool buffer_mmaped = false;
>  
> @@ -341,7 +343,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>              break;
>          } else if (copied_pfns == VFIO_DEVICE_DIRTY_PFNS_ALL) {
>              /* Mark all pages dirty for this range */
> -            cpu_physical_memory_set_dirty_range(start * page_size,
> +            cpu_physical_memory_set_dirty_range(block_start_seg,
>                                                  total_pfns * page_size,
>                                                  DIRTY_MEMORY_MIGRATION);
>              break;
> @@ -382,7 +384,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>          }
>  
>          cpu_physical_memory_set_dirty_lebitmap((unsigned long *)buf,
> -                                               start * page_size,
> +                                               block_start_seg,
>                                                 copied_pfns);
>          count      += copied_pfns;
>          total_pfns -= copied_pfns;
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 41ff5eb..6d868fa 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -220,6 +220,7 @@ int vfio_spapr_remove_window(VFIOContainer *container,
>  int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
>  void vfio_migration_finalize(VFIODevice *vbasedev);
>  void vfio_get_dirty_page_list(VFIODevice *vbasedev, uint64_t start_pfn,
> -                               uint64_t pfn_count, uint64_t page_size);
> +                               uint64_t pfn_count, uint64_t page_size,
> +                               uint64_t block_start);
>  
>  #endif /* HW_VFIO_VFIO_COMMON_H */

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
