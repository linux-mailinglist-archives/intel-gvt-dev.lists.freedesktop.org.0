Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48666A4AAD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 20:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8397410E3BA;
	Mon, 27 Feb 2023 19:19:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A1110E3BA;
 Mon, 27 Feb 2023 19:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMLXfEBsX6qy/Yy1NxXT6zGmrdpW4ckxRRaazWDfzD8XYfQhyXyGsSv6CR0Rxq+F4pLfq/5Az7uqtnH4/51mQ3HfJF+EVfZr0U0A00tAylpk6DFJfi7dcqncZWpqdjtXVaiAjCWDLhFUKx+QLfkKwGLCz2rDgIv9QC0lHMYAopo/JB2rfcnZl8ThG0Jnnkz3Qou5uTgCRBR7fnZJfcKqUYYgrpUfscYvIl2IhWZd0gfLN3BuLAH4i15c8m20GWoprcxKJrfPmfXJ2EHYKrntgwq8sfDM8cepDkRx345xg5zwm+fE/e+HY4eqQW00fSXtTRUCyWRkSM2OWqPme8TH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnNZ+rqRVKRcv67Yq470C75hd5an0Y3RZAlz5XaaV2A=;
 b=PU8wdHwadvZRC0JoutN9iFZuD9YKIKI3Cjs9cDDnINRNKDtId5r8+nhazmWxPgjiDBWY8IanCt6hvSvQBpcxXN2uzWoCPk1DNJ4dhwXTaICwtXC4oRGmv+oqXi1ozEUFGP704kMbKK6voCahvIvYP6GhToWma4bHlBozwDAL25NjUlked86EUM6hiaafTi2cWojYrU0If2IxIwxziqluzJ+UCfnMGConTcAmQ0K/nTDi5rHqt06lSSS4aObIAjyBkgIsToeBqpA0TNDiM1qrFFzVUmTTiPMDT1kvSmuaDWBtq1pEmIDnDPnk2RviUI5ZybkA4GRC6ZczU2IaSA48Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnNZ+rqRVKRcv67Yq470C75hd5an0Y3RZAlz5XaaV2A=;
 b=CasoWLCQp98prKEHqszEuvxzBn2FfbeMXLLWVSxp8V07pRFywznn0vG4AUnI/Kswq/c7H9ldWwgna+8CcxhMoJ09BJTqqyz/K1ryaj3y8yoWP0Do8TZwCzIIJT5tMxE1vhqt/JwUH8PWNGAHAUWnatbgAGaZcgXAUuXf5tZOR8EZGEt1PbQwArldydKzKPoWWJpInNsJJiCeaDC0Py5w5c3ZxcA08neNm3GO35XjX6T5pO434iLYV9kf+EIMyusFVVTARV45qvSGtP7jEg3jQX9900DHDIPiazfgWzR0buscD8/CBjqOO6vZJuPC601+uNzbCZ/aCgNilzo/rM7ipg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4892.namprd12.prod.outlook.com (2603:10b6:610:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 19:19:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 19:19:52 +0000
Date: Mon, 27 Feb 2023 15:19:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 16/19] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <Y/0CV1K0YNHA+olf@nvidia.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-17-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111135.61728-17-yi.l.liu@intel.com>
X-ClientProxiedBy: MN2PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:208:d4::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: ba821a90-54f7-4e90-d930-08db18f799d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQuTeDAdRnVcR4wDlH/TyaaCYCmtxYBleE716ZpyLJmHwNpPvH4jhGK9HtI9KADb4OM96bzLJXS/7fubDGKH07bqRlmPVTFM7iCuUD6upMOd4gT1vI+l2kOxNz4B6NzgAp7xolofdIPl+7rgnEtQiiJFhkgRk7z3E4WCWSRnayLBJ8SXhMp6fcio2D6gG552m6qnDUJdxKlDSHV5WQDEqJCRp2CB3iXhF/siqEwco0F4D8d1lz47yAbRAETzYr9qECbjTOKLAWbXKPdd5nEXUFkBOmEyYho7OnIfT/OTRE9C1Js0GaMyNbjaI5r6ymzjyWf+F0kr/Sgnx4eoKE6pHrC2axsmcjy+x7Vd/2AG1hjxSKqMzuWb2bgI0e6nlC+Dg3EGFMTd1U0B3YAqrxGrJWi4k1L9A+NXRarKUZhzMTM+a85mJERxzHbhdo0lAzkMed4iBTZaI6rNqS7dOgbfhGRYoKmtnBjn9JNobzTC5xgXjKWC31skXHBQKNuBt7TSJEzxgvCWB2HFc112+G5xo6o0DQk3ztU7tJAmsIhDI7UaxA1fdEHr2hjUfZ1HG7RPh/pEYdME9irXrwZzKTnaaGSwpXsVo+SYhHSN7pX6ClNDqSC4DXG9xu4z7Ja39Cna9+aWve6HvXu0kNI9h6YiBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(6512007)(26005)(186003)(6506007)(83380400001)(86362001)(36756003)(38100700002)(2616005)(66556008)(66476007)(66946007)(4326008)(6916009)(8676002)(2906002)(8936002)(5660300002)(7416002)(316002)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YzZn1LxHlc3IR8CRQG9OFNemkfHFfrU8EEC9bx/sid70W3kpSrnqy9lFBRdC?=
 =?us-ascii?Q?QsTbDpZkCn3co0niE3w2Jm0mVHJ5ttuYHJQC7K9H6iviO0MSSTLjFf8etK4X?=
 =?us-ascii?Q?ULvomHD0ubtJu81b8PEcHKoK4prGpS4tb8Y7WxclTaV7QgjpAMx2593f/hfO?=
 =?us-ascii?Q?VQsrckzFMn2wPL+9LmFqLLsIGZrJGsduAwmmcs4bALXV0BHDmL2JtmgVQlq7?=
 =?us-ascii?Q?TvZnnaLhmz8Upk5Fh9yHiMUuojTv3b3qnI140PaZSCwarb9z7G0rxSMMNWnk?=
 =?us-ascii?Q?A51skAHMB9iUrVwbJfXZd0/Y2BJhpOP3v4uonDhSipFFxiU8wlLZalor0lEu?=
 =?us-ascii?Q?Dq/qH4nLlV5U+ClWKRZh1DLx8Ksy6uqS6OHaD6f47vHDeuowHSsrhd7onDng?=
 =?us-ascii?Q?4AER9dp6LKgIIKZwD5kEbfe1V0niJ+dypcWchX6Jfsf5DagNjsXOkvAeslxH?=
 =?us-ascii?Q?0yaQ4ro0WSjyWM+PrspK3QiVleCWXuz8ISQDH/ISRMxzXs31HqBQWFspyEd+?=
 =?us-ascii?Q?O/jAfADPMKWKoocFEuzhEzcdGqy374VPktlw6MSZpRlMdPJCv7EzGdbTU9/i?=
 =?us-ascii?Q?7rRSMlpFJ3ouGowNUjWK3Pa64Dcgtow84MLq9+7H7DUGLxRR2DbKpVmfA/fM?=
 =?us-ascii?Q?EhEQpmLLWFH0EJUUkV6t5J+HZZZ9L9cfuTOTG2mGJ3xJm31/6MRiw6GcrBhB?=
 =?us-ascii?Q?aMaa8zimeyUb9O+X1xcIwL3nNlHbwzEXAR2oY5/3vpBgFRQXyqEMgAdMQToh?=
 =?us-ascii?Q?VLT26civ3nr7SlpCbI7ru+XJxXBTJKn48saKDRtPmiBli6X7ibmEQlEMPrMV?=
 =?us-ascii?Q?HuhCQIZPUwEUtNMu0NiWQpWMJEKBvppP8ltEJ1f99o9obIWaig6JtqESkYA3?=
 =?us-ascii?Q?374bA6czdJ3v25475nqhNnzJBvZJjAR47tn7X/w4Ffasyk0PyJmRfiyl6BTH?=
 =?us-ascii?Q?FJU8F1SZJxTDur0XazEa5OUVbbpniEUg4QB8ETvV3TMkhfjUXwSCnuj0BDoP?=
 =?us-ascii?Q?ImX/Bk1HgvG+5ZLPa15gLnDpWM/4aodUPSRM6f1yOhhVnOf8KGcz/oo9yph9?=
 =?us-ascii?Q?Z1KdpgvL7LYVQioqcHMfK2Jo5lwqURTjfSKkqvrpXmFu16l3ahDnXp++C8WR?=
 =?us-ascii?Q?mkhprzdd8hKBeQCmTDAfpIO4O6QOj/esvtQh+XLsGWCsj/PLXr+uRPSPjP/S?=
 =?us-ascii?Q?jT54PgorP25F5HtljK77qgJHVkeqOHLlxBAEpdlpLKZ+CGPDdhBiZccQ8kMh?=
 =?us-ascii?Q?rXFI3roJu9GwDYrx16zPf7D/WcFRVuRNKUFFtc+N7VXDN3RpDTYIr/d5mEkN?=
 =?us-ascii?Q?qO0Q+HqKGWT4Gzvns0WCoIwLET2mjWXlge+pbokSDFVs2K0aiNye0yM4V+6X?=
 =?us-ascii?Q?PcLrVWffgtsndegFmqQOQWO5eQ0+0ngOYEbU6xJc75DXkrVDtEgNWuHcIog9?=
 =?us-ascii?Q?N0+RniTSh63nd+2Mrxxx9UuKYMCxJcB5ahDIAw8ef4ze3CbF85C0DLT/CGnQ?=
 =?us-ascii?Q?RBTVvcvhs/1dNUu4XyGIN3xq+4P7iDf3PSp2wNPXQnvlsWHYVfISyOp95sL9?=
 =?us-ascii?Q?vMEzEeVgGDEPgPY0YrdyEPS7XnuHb5xB2516SWMt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba821a90-54f7-4e90-d930-08db18f799d3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 19:19:52.2343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf0VlckQqFodTjrkn8zUy3d2TWe2xrXhvXwGW0HAc2SW5NoPfiToepLvg96tnjrO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4892
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 joro@8bytes.org, nicolinc@nvidia.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 03:11:32AM -0800, Yi Liu wrote:
> This adds ioctl for userspace to bind device cdev fd to iommufd.
> 
>     VFIO_DEVICE_BIND_IOMMUFD: bind device to an iommufd, hence gain DMA
> 			      control provided by the iommufd. open_device
> 			      op is called after bind_iommufd op.
> 			      VFIO no iommu mode is indicated by passing
> 			      a negative iommufd value.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/device_cdev.c | 146 +++++++++++++++++++++++++++++++++++++
>  drivers/vfio/vfio.h        |  17 ++++-
>  drivers/vfio/vfio_main.c   |  54 ++++++++++++--
>  include/linux/iommufd.h    |   6 ++
>  include/uapi/linux/vfio.h  |  34 +++++++++
>  5 files changed, 248 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index 9e2c1ecaaf4f..37f80e368551 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2023 Intel Corporation.
>   */
>  #include <linux/vfio.h>
> +#include <linux/iommufd.h>
>  
>  #include "vfio.h"
>  
> @@ -45,6 +46,151 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
>  	return ret;
>  }
>  
> +static void vfio_device_get_kvm_safe(struct vfio_device_file *df)
> +{
> +	spin_lock(&df->kvm_ref_lock);
> +	if (!df->kvm)
> +		goto unlock;
> +
> +	_vfio_device_get_kvm_safe(df->device, df->kvm);
> +
> +unlock:

Just 

if (df->kvm)
   _vfio_device_get_kvm_safe(df->device, df->kvm);

Without the goto

> +	spin_unlock(&df->kvm_ref_lock);
> +}
> +
> +void vfio_device_cdev_close(struct vfio_device_file *df)
> +{
> +	struct vfio_device *device = df->device;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	/*
> +	 * As df->access_granted writer is under dev_set->lock as well,
> +	 * so this read no need to use smp_load_acquire() to pair with
> +	 * smp_store_release() in the caller of vfio_device_open().
> +	 */

This is a bit misleading, we are about to free df in the caller, so at
this moment df has no current access. We don't even need to have the
mutex to test it.

> +long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
> +				    unsigned long arg)

struct device __user *arg and remove all the casts.

> +{
> +	struct vfio_device *device = df->device;
> +	struct vfio_device_bind_iommufd bind;
> +	struct iommufd_ctx *iommufd = NULL;
> +	unsigned long minsz;
> +	int ret;
> +
> +	minsz = offsetofend(struct vfio_device_bind_iommufd, out_devid);
> +
> +	if (copy_from_user(&bind, (void __user *)arg, minsz))
> +		return -EFAULT;
> +
> +	if (bind.argsz < minsz || bind.flags)
> +		return -EINVAL;
> +
> +	if (!device->ops->bind_iommufd)
> +		return -ENODEV;
> +
> +	ret = vfio_device_block_group(device);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	/*
> +	 * If already been bound to an iommufd, or already set noiommu
> +	 * then fail it.
> +	 */
> +	if (df->iommufd || df->noiommu) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	/* iommufd < 0 means noiommu mode */
> +	if (bind.iommufd < 0) {
> +		if (!capable(CAP_SYS_RAWIO)) {
> +			ret = -EPERM;
> +			goto out_unlock;
> +		}
> +		df->noiommu = true;
> +	} else {
> +		iommufd = vfio_get_iommufd_from_fd(bind.iommufd);
> +		if (IS_ERR(iommufd)) {
> +			ret = PTR_ERR(iommufd);
> +			goto out_unlock;
> +		}
> +	}
> +
> +	/*
> +	 * Before the device open, get the KVM pointer currently
> +	 * associated with the device file (if there is) and obtain
> +	 * a reference.  This reference is held until device closed.
> +	 * Save the pointer in the device for use by drivers.
> +	 */
> +	vfio_device_get_kvm_safe(df);
> +
> +	df->iommufd = iommufd;
> +	ret = vfio_device_open(df, &bind.out_devid, NULL);
> +	if (ret)
> +		goto out_put_kvm;
> +
> +	ret = copy_to_user((void __user *)arg +
> +			   offsetofend(struct vfio_device_bind_iommufd, iommufd),

??

&arg->out_dev_id

static_assert(__same_type...)

> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 650d45629647..9672cf839687 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -17,6 +17,12 @@ struct iommufd_ctx;
>  struct iommufd_access;
>  struct file;
>  
> +/*
> + * iommufd core init xarray with flags==XA_FLAGS_ALLOC1, so valid
> + * ID starts from 1.
> + */
> +#define IOMMUFD_INVALID_ID 0

Why? vfio doesn't need to check this just to generate EINVAL.

Jason
