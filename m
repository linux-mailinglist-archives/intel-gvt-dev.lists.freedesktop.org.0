Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14646194889
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Mar 2020 21:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35796E2EC;
	Thu, 26 Mar 2020 20:16:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Thu, 26 Mar 2020 20:16:32 UTC
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12F26E2EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Mar 2020 20:16:32 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7d0c170002>; Thu, 26 Mar 2020 13:09:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 26 Mar 2020 13:11:32 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 26 Mar 2020 13:11:32 -0700
Received: from [10.40.103.35] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Mar
 2020 20:11:28 +0000
Subject: Re: [PATCH] vfio/migration: fix dirty pages lost bug for ram beyond 3G
To: Alex Williamson <alex.williamson@redhat.com>, Yan Zhao
 <yan.y.zhao@intel.com>
References: <1583487689-9813-1-git-send-email-yan.y.zhao@intel.com>
 <20200325121921.511d6e3b@w520.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <ef61658f-bf21-4ade-ae0a-268c722fe5f5@nvidia.com>
Date: Fri, 27 Mar 2020 01:41:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325121921.511d6e3b@w520.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585253400; bh=TblJJ8M9VXqRXFhyymdsyeCST+EyN15WuSiVIFaPLQg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=S01iUp81SYuX6SVirVLZLZQaSyZ5wW3kDYarskWQni40r2cp7ZTIU2Ji2tGaO3ZrT
 jiEVzMPZW/tYVfwCfplEqJqR7Rkkg4ZCWvJ/L6RLXqD0cjbRgBwfQHPCP+FEVJnHIV
 7He8lGcI0dbSR5YWWyIKiNr0jQMrM18J3F5LUvp5en63ql13hN/IsIQqL82t1UmS8Y
 eeAY0CV4tzKS5huq8hBXnUNDNhJ6BzAkhNkyWreN0/37hHX/KXy5dyTxCXqSD7hzZW
 Ramnx2dE//WM2KMGLExpmocHJkcpl8/zKmHGWM1NtifH6Rc7IBlzG/x9vqzfhQEGGw
 5n7nptm2LD40g==
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



On 3/25/2020 11:49 PM, Alex Williamson wrote:
> On Fri,  6 Mar 2020 17:41:29 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
>> the start address passing to
>> cpu_physical_memory_set_dirty_range() and
>> cpu_physical_memory_set_dirty_lebitmap() is the address within the
>> ram block plus ram block offset.
>>
>> it's safe to set this start address to gpa if total memory is less than
>> 3G, as ram block offset for pc.ram is 0. But if memory size is beyond
>> 3G, gpa is not equal to the offset in its ram block.
>>
>> e.g.
>> for gpa 0x100000000, its offset is actually 0xc0000000.
>> and for gpa 0x42f500000, its offset should be 0x3EF500000.
>>
>> This fix is based on Kirti's VFIO live migration patch set v8.
>> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05542.html
>> (for PATCH v8 11/13
>> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05553.html
>> and PATCH v8 12/13
>> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05554.html
>> }
>>
>> The idea behind it should also be applied to other VFIO live migraiton
>> patch series below:
>> https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg01763.html
>> (Kirti v9)
>> https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg04912.html
>> (Yan)
>> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg01138.html
>> (Yulei RFC v4)
>> https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg05568.html
>> (Yulei RFC)
>>
>> Cc: Kevin Tian <kevin.tian@intel.com>
>> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>> ---
>>   hw/vfio/common.c              | 5 ++++-
>>   hw/vfio/migration.c           | 8 +++++---
>>   include/hw/vfio/vfio-common.h | 3 ++-
>>   3 files changed, 11 insertions(+), 5 deletions(-)
> 
> Thanks for this, Yan.
> 
> Kirti, I never saw an acknowledgment of this, can you confirm you've
> incorporated this into your latest?  I do see we're making use of
> memory_region_get_ram_addr() now.  Thanks,
> 

We do saw this in our testing and I already had it in QEMU patches 
during my testing.

Thanks,
Kirti


> Alex
> 
>   
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 6f36b02..ba1a8ef 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -799,6 +799,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>>           MemoryRegionSection *section)
>>   {
>>       uint64_t start_addr, size, pfn_count;
>> +    uint64_t block_start;
>>       VFIOGroup *group;
>>       VFIODevice *vbasedev;
>>   
>> @@ -819,11 +820,13 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>>       start_addr = TARGET_PAGE_ALIGN(section->offset_within_address_space);
>>       size = int128_get64(section->size);
>>       pfn_count = size >> TARGET_PAGE_BITS;
>> +    block_start = TARGET_PAGE_ALIGN(section->offset_within_region +
>> +                             memory_region_get_ram_addr(section->mr));
>>   
>>       QLIST_FOREACH(group, &vfio_group_list, next) {
>>           QLIST_FOREACH(vbasedev, &group->device_list, next) {
>>               vfio_get_dirty_page_list(vbasedev, start_addr >> TARGET_PAGE_BITS,
>> -                                     pfn_count, TARGET_PAGE_SIZE);
>> +                                     pfn_count, TARGET_PAGE_SIZE, block_start);
>>           }
>>       }
>>   }
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 640bea1..a19b957 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -279,7 +279,8 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>>   void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>>                                 uint64_t start_pfn,
>>                                 uint64_t pfn_count,
>> -                              uint64_t page_size)
>> +                              uint64_t page_size,
>> +                              uint64_t block_start)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>>       VFIORegion *region = &migration->region;
>> @@ -293,6 +294,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>>       while (total_pfns > 0) {
>>           uint64_t bitmap_size, data_offset = 0;
>>           uint64_t start = start_pfn + count;
>> +        uint64_t block_start_seg = block_start + count * page_size;
>>           void *buf = NULL;
>>           bool buffer_mmaped = false;
>>   
>> @@ -341,7 +343,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>>               break;
>>           } else if (copied_pfns == VFIO_DEVICE_DIRTY_PFNS_ALL) {
>>               /* Mark all pages dirty for this range */
>> -            cpu_physical_memory_set_dirty_range(start * page_size,
>> +            cpu_physical_memory_set_dirty_range(block_start_seg,
>>                                                   total_pfns * page_size,
>>                                                   DIRTY_MEMORY_MIGRATION);
>>               break;
>> @@ -382,7 +384,7 @@ void vfio_get_dirty_page_list(VFIODevice *vbasedev,
>>           }
>>   
>>           cpu_physical_memory_set_dirty_lebitmap((unsigned long *)buf,
>> -                                               start * page_size,
>> +                                               block_start_seg,
>>                                                  copied_pfns);
>>           count      += copied_pfns;
>>           total_pfns -= copied_pfns;
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 41ff5eb..6d868fa 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -220,6 +220,7 @@ int vfio_spapr_remove_window(VFIOContainer *container,
>>   int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
>>   void vfio_migration_finalize(VFIODevice *vbasedev);
>>   void vfio_get_dirty_page_list(VFIODevice *vbasedev, uint64_t start_pfn,
>> -                               uint64_t pfn_count, uint64_t page_size);
>> +                               uint64_t pfn_count, uint64_t page_size,
>> +                               uint64_t block_start);
>>   
>>   #endif /* HW_VFIO_VFIO_COMMON_H */
> 
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
