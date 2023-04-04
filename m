Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33F6D6462
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 15:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13FC10E69B;
	Tue,  4 Apr 2023 13:59:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AE510E69B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616782;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxXQaGpyUM5ChSgPSymgIrV3xjP+dbX+YB7Kwp3u8FE=;
 b=Ok3LvyadOLKJ4kTL4FZeUfjX5jxvNAl27AjAupKfAEbYtgV088OO1P8R4nlOE2hrCT5Qp2
 QPGWCqjVyp0dzSlHEoLJGU/3m3OR5fOWhp5BcRk5aS2x1tZRdrEhP/yg3aoiLEiJHvDh7K
 drocne3PrjOB8/NEJAFuf8rIZ7hRCYU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-YBkwC9IAPmeIjveAOBmAHw-1; Tue, 04 Apr 2023 09:59:41 -0400
X-MC-Unique: YBkwC9IAPmeIjveAOBmAHw-1
Received: by mail-qt1-f197.google.com with SMTP id
 u22-20020a05622a011600b003dfd61e8594so22158835qtw.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 06:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxXQaGpyUM5ChSgPSymgIrV3xjP+dbX+YB7Kwp3u8FE=;
 b=U8KFs0LyCvkbMrNlwnSwwANYA2dry0b56UIEU4BDuPpGA5NeeeoRSUcRsCC3YZ130o
 w+k2eczHJLX1oQfTP5E5XqbX8u4WACKCWxE9RRLSzoTbuxl0uPizKRP+rU3n21yMaS03
 5Y2aTQ6BjvUKA3C/5/PVZGWMjvAYCe0Qwn/HTbKR1OGreZPCvVrBO/fVpX7snwmW5v9J
 Fttr7cuy0t0JUFVHKB9omHa+CuQRVHpHDAFTSRzgPSimVgeYQnEpgm/6rQ3XFlzozxYK
 t6HN/ebNTYNl+byskNJKKYlBddd6KaeTiUS3ZdULtEIBOWrsknUOLAnz76fv+sWhGnQj
 Uuig==
X-Gm-Message-State: AAQBX9ca9tnGv2iApz60RtQNC3+2LvI7IrRljgpu14/fzwu8p0mc7Tie
 4vKNgA/GohrG9D3kmefCpMvurq6HGZR5j47ehRywL49TxfhTWUxls4P0zF7k7QU2fxkH4I7UHev
 n+Xx8/kxOCnuQRYxlLHKHcj0PXoxn/MZ4PQ==
X-Received: by 2002:ac8:5990:0:b0:3bf:e364:1d19 with SMTP id
 e16-20020ac85990000000b003bfe3641d19mr3487130qte.54.1680616779658; 
 Tue, 04 Apr 2023 06:59:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCWWuuTxHWY9DOMfflmCQARBlvG/akS0xtd4IuYfgAD/YTofqLq6p8mh4g/QJi69uADkX8yQ==
X-Received: by 2002:ac8:5990:0:b0:3bf:e364:1d19 with SMTP id
 e16-20020ac85990000000b003bfe3641d19mr3487031qte.54.1680616778531; 
 Tue, 04 Apr 2023 06:59:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a37f91a000000b007422eee8058sm3597749qkj.125.2023.04.04.06.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:59:37 -0700 (PDT)
Message-ID: <4bc269aa-f2b9-d8ac-82bf-2205d05e4b11@redhat.com>
Date: Tue, 4 Apr 2023 15:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 03/12] vfio/pci: Move the existing hot reset logic to
 be a helper
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-4-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-4-yi.l.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Reply-To: eric.auger@redhat.com
Cc: linux-s390@vger.kernel.org, yi.y.sun@linux.intel.com, kvm@vger.kernel.org,
 mjrosato@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org,
 cohuck@redhat.com, xudong.hao@intel.com, peterx@redhat.com,
 yan.y.zhao@intel.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com, yanting.jiang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Yi,

On 4/1/23 16:44, Yi Liu wrote:
> This prepares to add another method for hot reset. The major hot reset logic
> are moved to vfio_pci_ioctl_pci_hot_reset_groups().
>
> No functional change is intended.
>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 56 +++++++++++++++++++-------------
>  1 file changed, 33 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 5d745c9abf05..3696b8e58445 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1255,29 +1255,17 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
>  	return ret;
>  }
>  
> -static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
> -					struct vfio_pci_hot_reset __user *arg)
> +static int
> +vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
> +				    struct vfio_pci_hot_reset *hdr,
nit why don't you simply pass the user group count as decoded earlier.
hdr sounds like a dup of arg.
> +				    bool slot,
> +				    struct vfio_pci_hot_reset __user *arg)
>  {
> -	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
> -	struct vfio_pci_hot_reset hdr;
>  	int32_t *group_fds;
>  	struct file **files;
>  	struct vfio_pci_group_info info;
> -	bool slot = false;
>  	int file_idx, count = 0, ret = 0;
>  
> -	if (copy_from_user(&hdr, arg, minsz))
> -		return -EFAULT;
> -
> -	if (hdr.argsz < minsz || hdr.flags)
> -		return -EINVAL;
> -
> -	/* Can we do a slot or bus reset or neither? */
> -	if (!pci_probe_reset_slot(vdev->pdev->slot))
> -		slot = true;
> -	else if (pci_probe_reset_bus(vdev->pdev->bus))
> -		return -ENODEV;
> -
>  	/*
>  	 * We can't let userspace give us an arbitrarily large buffer to copy,
>  	 * so verify how many we think there could be.  Note groups can have
> @@ -1289,11 +1277,11 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  		return ret;
>  
>  	/* Somewhere between 1 and count is OK */
> -	if (!hdr.count || hdr.count > count)
> +	if (!hdr->count || hdr->count > count)
>  		return -EINVAL;
>  
> -	group_fds = kcalloc(hdr.count, sizeof(*group_fds), GFP_KERNEL);
> -	files = kcalloc(hdr.count, sizeof(*files), GFP_KERNEL);
> +	group_fds = kcalloc(hdr->count, sizeof(*group_fds), GFP_KERNEL);
> +	files = kcalloc(hdr->count, sizeof(*files), GFP_KERNEL);
>  	if (!group_fds || !files) {
>  		kfree(group_fds);
>  		kfree(files);
> @@ -1301,7 +1289,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	}
>  
>  	if (copy_from_user(group_fds, arg->group_fds,
> -			   hdr.count * sizeof(*group_fds))) {
> +			   hdr->count * sizeof(*group_fds))) {
>  		kfree(group_fds);
>  		kfree(files);
>  		return -EFAULT;
> @@ -1311,7 +1299,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	 * Get the group file for each fd to ensure the group held across
>  	 * the reset
>  	 */
> -	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
> +	for (file_idx = 0; file_idx < hdr->count; file_idx++) {
>  		struct file *file = fget(group_fds[file_idx]);
>  
>  		if (!file) {
> @@ -1335,7 +1323,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	if (ret)
>  		goto hot_reset_release;
>  
> -	info.count = hdr.count;
> +	info.count = hdr->count;
>  	info.files = files;
>  
>  	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
> @@ -1348,6 +1336,28 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	return ret;
>  }
>  
> +static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
> +					struct vfio_pci_hot_reset __user *arg)
> +{
> +	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
> +	struct vfio_pci_hot_reset hdr;
> +	bool slot = false;
> +
> +	if (copy_from_user(&hdr, arg, minsz))
> +		return -EFAULT;
> +
> +	if (hdr.argsz < minsz || hdr.flags)
> +		return -EINVAL;
> +
> +	/* Can we do a slot or bus reset or neither? */
> +	if (!pci_probe_reset_slot(vdev->pdev->slot))
> +		slot = true;
> +	else if (pci_probe_reset_bus(vdev->pdev->bus))
> +		return -ENODEV;
> +
> +	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
> +}
> +
>  static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
>  				    struct vfio_device_ioeventfd __user *arg)
>  {
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

