Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0F6D7620
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 10:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C3C10E860;
	Wed,  5 Apr 2023 08:02:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B6810E865
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680681742;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRLMleKr92gPF/OPLJspv7HTkQcd5+Jcm7+F2NR7Y4I=;
 b=C56Ns43DndZt8egWlCkyh6IzozGpJtPZ+C7C7o70d7pr0FpIa+K6bQUBoITkFDMHDca1k6
 jrkelG55iF23nJJFLFLd5FPigErLhTx1SEW0AFYvwk/zKvkCd6RnYksf24EY2yxCQmeT0D
 lKaxU5XM+8B5uKXb0UBodsVyaS3bVlA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-CelNF9uDPruRARDEbMu0rw-1; Wed, 05 Apr 2023 04:02:20 -0400
X-MC-Unique: CelNF9uDPruRARDEbMu0rw-1
Received: by mail-qt1-f197.google.com with SMTP id
 a11-20020ac85b8b000000b003e3979be6abso23680882qta.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 01:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680681740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TRLMleKr92gPF/OPLJspv7HTkQcd5+Jcm7+F2NR7Y4I=;
 b=6EN8gW/M2orpJB2DLa1ZQWAim2dNTS4I8uQP7mJwLssMaGcST+BPKmrMIlrzxU6QCd
 rBjiN/geDpNKW/X2SeA1iBeHkaebhpO7kOrdbCVywUTLvLzAIe6JSQaTd9p+/MWvQdj3
 0lhdUK0LVw6R+AvJi8KOPkGoApisFpPrzlcct1Tzk7EwKVxb02UMH8uqswq89yUtem+j
 JRaQkwh8uJI5bfOdkbyZvAIAiHC/S+r/ZK0ouPuOGpwoPhLNIqZ/30Qtth1mNt2sUB2Z
 g8WjESyli/SZRid5xAgONVlA/EeCueDovTjbw3wfTZ8fYruH/rBC6YxfHN6obeyjaf70
 kjuA==
X-Gm-Message-State: AAQBX9fSpDbgcHoAMUVnbBk7T8L8YiqV1FT+vHqSxGUcd2lKknFkx5Bn
 Lmny6iUstryE2cN5E75sMkq7qB2CqJ5gktNDGpQ0OAxUh+Tod6mEj2EOqrh1iSwQwPYEUMK8KUR
 m38fxikPEGOyuLpJCUrDHU4rS0LgG9WofWg==
X-Received: by 2002:a05:6214:1306:b0:5e0:5ea6:69d4 with SMTP id
 pn6-20020a056214130600b005e05ea669d4mr9959291qvb.0.1680681739981; 
 Wed, 05 Apr 2023 01:02:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZwLQoaiQae9ynKnc/QIgep6uH7H7TZvVmPWfF0Cgi43N5Q5z40m8ET3V2OgNBJYgZ18KYSSw==
X-Received: by 2002:a05:6214:1306:b0:5e0:5ea6:69d4 with SMTP id
 pn6-20020a056214130600b005e05ea669d4mr9959227qvb.0.1680681739573; 
 Wed, 05 Apr 2023 01:02:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a372c04000000b007456c75edbbsm4223342qkh.129.2023.04.05.01.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:02:18 -0700 (PDT)
Message-ID: <ee82cf0c-d208-ddac-5e00-ab34ca840c49@redhat.com>
Date: Wed, 5 Apr 2023 10:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 05/12] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
To: Alex Williamson <alex.williamson@redhat.com>, Yi Liu <yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-6-yi.l.liu@intel.com>
 <20230404141838.6a4efdd4.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230404141838.6a4efdd4.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: eric.auger@redhat.com
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



On 4/4/23 22:18, Alex Williamson wrote:
> On Sat,  1 Apr 2023 07:44:22 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
>
>> as an alternative method for ownership check when iommufd is used. In
>> this case all opened devices in the affected dev_set are verified to
>> be bound to a same valid iommufd value to allow reset. It's simpler
>> and faster as user does not need to pass a set of fds and kernel no
>> need to search the device within the given fds.
>>
>> a device in noiommu mode doesn't have a valid iommufd, so this method
>> should not be used in a dev_set which contains multiple devices and one
>> of them is in noiommu. The only allowed noiommu scenario is that the
>> calling device is noiommu and it's in a singleton dev_set.
>>
>> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>> ---
>>  drivers/vfio/pci/vfio_pci_core.c | 42 +++++++++++++++++++++++++++-----
>>  include/uapi/linux/vfio.h        |  9 ++++++-
>>  2 files changed, 44 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>> index 3696b8e58445..b68fcba67a4b 100644
>> --- a/drivers/vfio/pci/vfio_pci_core.c
>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>> @@ -180,7 +180,8 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
>>  struct vfio_pci_group_info;
>>  static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
>>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>> -				      struct vfio_pci_group_info *groups);
>> +				      struct vfio_pci_group_info *groups,
>> +				      struct iommufd_ctx *iommufd_ctx);
>>  
>>  /*
>>   * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
>> @@ -1277,7 +1278,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>>  		return ret;
>>  
>>  	/* Somewhere between 1 and count is OK */
>> -	if (!hdr->count || hdr->count > count)
>> +	if (hdr->count > count)
>>  		return -EINVAL;
>>  
>>  	group_fds = kcalloc(hdr->count, sizeof(*group_fds), GFP_KERNEL);
>> @@ -1326,7 +1327,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>>  	info.count = hdr->count;
>>  	info.files = files;
>>  
>> -	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
>> +	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info, NULL);
>>  
>>  hot_reset_release:
>>  	for (file_idx--; file_idx >= 0; file_idx--)
>> @@ -1341,6 +1342,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>>  {
>>  	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
>>  	struct vfio_pci_hot_reset hdr;
>> +	struct iommufd_ctx *iommufd;
>>  	bool slot = false;
>>  
>>  	if (copy_from_user(&hdr, arg, minsz))
>> @@ -1355,7 +1357,12 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>>  	else if (pci_probe_reset_bus(vdev->pdev->bus))
>>  		return -ENODEV;
>>  
>> -	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
>> +	if (hdr.count)
>> +		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
>> +
>> +	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
>> +
>> +	return vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL, iommufd);
>>  }
>>  
>>  static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
>> @@ -2327,6 +2334,9 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
>>  {
>>  	unsigned int i;
>>  
>> +	if (!groups)
>> +		return false;
>> +
>>  	for (i = 0; i < groups->count; i++)
>>  		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
>>  			return true;
>> @@ -2402,13 +2412,25 @@ static int vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
>>  	return ret;
>>  }
>>  
>> +static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
>> +				    struct iommufd_ctx *iommufd_ctx)
>> +{
>> +	struct iommufd_ctx *iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
>> +
>> +	if (!iommufd)
>> +		return false;
>> +
>> +	return iommufd == iommufd_ctx;
>> +}
>> +
>>  /*
>>   * We need to get memory_lock for each device, but devices can share mmap_lock,
>>   * therefore we need to zap and hold the vma_lock for each device, and only then
>>   * get each memory_lock.
>>   */
>>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>> -				      struct vfio_pci_group_info *groups)
>> +				      struct vfio_pci_group_info *groups,
>> +				      struct iommufd_ctx *iommufd_ctx)
>>  {
>>  	struct vfio_pci_core_device *cur_mem;
>>  	struct vfio_pci_core_device *cur_vma;
>> @@ -2448,9 +2470,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>>  		 *
>>  		 * Otherwise all opened devices in the dev_set must be
>>  		 * contained by the set of groups provided by the user.
>> +		 *
>> +		 * If user provides a zero-length array, then all the
>> +		 * opened devices must be bound to a same iommufd_ctx.
>> +		 *
>> +		 * If all above checks are failed, reset is allowed only if
>> +		 * the calling device is in a singleton dev_set.
>>  		 */
>>  		if (cur_vma->vdev.open_count &&
>> -		    !vfio_dev_in_groups(cur_vma, groups)) {
>> +		    !vfio_dev_in_groups(cur_vma, groups) &&
>> +		    !vfio_dev_in_iommufd_ctx(cur_vma, iommufd_ctx) &&
>> +		    (dev_set->device_count > 1)) {
> This last condition looks buggy to me, we need all conditions to be
> true to generate an error here, which means that for a singleton
> dev_set, it doesn't matter what group fds are passed, if any, or whether
> the iommufd context matches.  I think in fact this means that the empty
> array path is equally available for group use cases with a singleton
> dev_set, but we don't enable it for multiple device dev_sets like we do
> iommufd.
>
> You pointed out a previous issue with hot-reset info and no-iommu where
> if other affected devices are not bound to vfio-pci the info ioctl
> returns error.  That's handled in the hot-reset ioctl by the fact that
> all affected devices must be in the dev_set and therefore bound to
> vfio-pci drivers.  So it seems to me that aside from the spurious error
> because we can't report an iommu group when none exists, and didn't
> spot it to invent an invalid group for debugging, hot-reset otherwise
> works with no-iommu just like it does for iommu backed devices.  We
> don't currently require singleton no-iommu dev_sets afaict.
>
> I'll also note that if the dev_set is singleton, this suggests that
> pci_reset_function() can make use of bus reset, so a hot-reset is
> accessible via VFIO_DEVICE_RESET if the appropriate reset method is
> selected.
>
> Therefore, I think as written, the singleton dev_set hot-reset is
> enabled for iommufd and (unintentionally?) for the group path, while
> also negating a requirement for a group fd or that a provided group fd
> actually matches the device in this latter case.  The null-array
> approach is not however extended to groups for more general use.
> Additionally, limiting no-iommu hot-reset to singleton dev_sets
> provides only a marginal functional difference vs VFIO_DEVICE_RESET.
> Thanks,
>
> Alex
What bout introducing a helper
static bool is_reset_ok(pdev, groups, ctx) {
    if (!pdev->vdev.open_count)
        return true;
    if (groups && vfio_dev_in_groups(pdev, groups))
        return true;
    if (ctx && vfio_dev_in_iommufd_ctx(pdev, ctx)
        return true;
    return false;
}

Assuming the above logic is correct I think this would make the code
more readable

Thanks

Eric
>>  			ret = -EINVAL;
>>  			goto err_undo;
>>  		}
>> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
>> index f96e5689cffc..17aa5d09db41 100644
>> --- a/include/uapi/linux/vfio.h
>> +++ b/include/uapi/linux/vfio.h
>> @@ -679,7 +679,14 @@ struct vfio_pci_hot_reset_info {
>>   * the calling user must ensure all affected devices, if opened, are
>>   * owned by itself.
>>   *
>> - * The ownership is proved by an array of group fds.
>> + * The ownership can be proved by:
>> + *   - An array of group fds
>> + *   - A zero-length array
>> + *
>> + * In the last case all affected devices which are opened by this user
>> + * must have been bound to a same iommufd. If the calling device is in
>> + * noiommu mode (no valid iommufd) then it can be reset only if the reset
>> + * doesn't affect other devices.
>>   *
>>   * Return: 0 on success, -errno on failure.
>>   */

