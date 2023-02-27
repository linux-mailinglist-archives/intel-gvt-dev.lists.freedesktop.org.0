Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E26A49B9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 19:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8E010E1D8;
	Mon, 27 Feb 2023 18:29:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E18810E1D8;
 Mon, 27 Feb 2023 18:29:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZEqYbRkNp9d9IfW5iI2WVxYsc4Rz+5Pg8AT0Bll4twiMceih1e3HzkE0IBXPj9Q5ZAL2WRHdUbpZQHQ4ExjFcYRctLI/OcaAFYPr/pEtkrGtvSiNkJnTQ3aEtnuOEAVeJXW9I9uxbEoHFvFFcJg9BgS5EzKvhHeTaIeVhhqkvVPYFMS7boAwwxLQt7yVcamDjUAxhtR2F+fTCwsjgd9h+k7Sc7glbgDOrMWu4mwvXPW4G63aALe++cODUPvInx5okrhDUWbKK06NcgoIsgjSqHCGhlyNUVAwe2CCYnqOrARqFNPP0Jxfz3YDO8dzKQwqe3HAhUiYbHzlN1BGeRC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7df/SEAaHBHJCmz1YaHBxU1p32KdKUuok31aArlxazI=;
 b=RMrQnjrn21sVk5UCnu58MMpYBu67FFeo2sqFRPsKn8tCR8OTyVFJyeEb0aS/4CBx5cMLFCHiDAEWsESm3Qfs8OH9UtgVNIQShWtE0P56KifSf4mN5ltRZMt07BNp5GuZLQoXRTtyrkQLRiHka5zeO8b5YRzI37I1c3bQfLmzgAILjW6Qn5n6T3WXHAtEXt3JNFtUk73mVie7JuDKeuzAy4k5rbVlekfBd00E3nTQqeVCGL3oDdMhDYnCSV2roYi9em9hwj0OlXfYTPDDZpa3eo758dTEZrZSslcvQXEYxpKObUtKl16D9Fojj9wONQE1tFvlagx/vd2xDtG5Hyo9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7df/SEAaHBHJCmz1YaHBxU1p32KdKUuok31aArlxazI=;
 b=mhHhabXqmPbgoDzcO1PL9iqdc+uOEv+kqwXPcylfFuPHHeG1Gk/gSFYW8eetq2z60XReojwB4a1Bk5Lgj8rjH1orjiqNQNU24YpNQOZksO6H//xhOeqjSyWBCJH+VXs8nLlR9Xl2YISrWPdzVAvQV1qHcCaM/4V1POA5HhsrZo6d5b2ohqtD8FhceX6XtDHfYu4HuF1X04L+U/4kxa3KUdDitpFRhrlUVO7KRAR4t9ZRxQsfqci/mJK6x8tRZ1c6WEjtLUFLcz2W1PUM53yOzf+2iqZTXEUnHAXSbH97virh5Hw8LfPqjEnlpllxnpqWO2xktN18lKuN0nZSOWIzmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 18:29:46 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 18:29:46 +0000
Date: Mon, 27 Feb 2023 14:29:45 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 10/19] vfio: Add infrastructure for bind_iommufd from
 userspace
Message-ID: <Y/z2mY97uPsCs6Ix@nvidia.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-11-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111135.61728-11-yi.l.liu@intel.com>
X-ClientProxiedBy: BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: f2bbb3c6-20da-4788-aebb-08db18f09a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4EclTi9KiWnk5M7pJS7y469Yk5TJz9IRioNjtF9sR3lm6AAgVjsqBwHWZqIQ8Okiw0FzBwcqwOnCM0NUL5f+V6cvHcq51hyFZFM53Q30t+fjyq7BttPUW4sywXtf+ljlDTsHN8o7of8Z4SfREehD4ENXYhEkkkGTl1Coff9axMv2wn4bydz4VbS0AHDB1GQHxaMPYzjCazuzodGYuAY/OrB7y+cDbuFxZg95r0ERgI6udxpAWnYOA/WacQm3tOq5CKhG7q4TNyErYJX71a1Ma92CzpNkmdFDAkJlaP2Yj3wjXkE3VD4NdMMzBixntWAIyPuW93KnlOEkTmewrwn3A8kasrMnOYS8cPRfPz0C3I37vz3tMXSC6jF3qLHfU1/VBZcuFkxRSbsULj+cFmxzzuxqRgdmBJS8GEVDSBx11X2pBwAu8JFuwgZ8TubML/RxZWUhcJfmHm5BD2KT+t+VIy9EpMoZ0e0lPIEILghvUSgBDA6FQysGM9NnmUxj5TTO0n00SVlr0vDo5jiNuLUBChi0nuu3BaStgV1LYtSP/qG+lOSMS5DQZXHMFYiWt95+TQsuZBfNhhJdrLXlLtK9RbCvLwBpTtzuf9Jgb798Jrdsl5u2o2q5H55NC77Q5k9wCcFyYGre2M4by0VTP9Zdbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199018)(41300700001)(4326008)(66476007)(66556008)(66946007)(6916009)(38100700002)(36756003)(86362001)(2906002)(7416002)(5660300002)(83380400001)(8936002)(8676002)(2616005)(478600001)(316002)(6486002)(6512007)(186003)(26005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x2sFHRtFpRSvnMeS2Ahztlvg2emWUFjXH2rKVYF08hMJV11DVV1wVCW9xaVS?=
 =?us-ascii?Q?jo7B8i73qM1y1i7H3lY5wZ7U8DayPehdN0PvDQsM68HjeQV9SYzWHzxMHPLh?=
 =?us-ascii?Q?hFMeEQhs5Za+21dzpzIAK3aiGFw1Ke3/rJBIAkoe55wLG3EoARy4OF1c2MAk?=
 =?us-ascii?Q?M9oP9Jm5kBqUYnzr++4WTqDh8aP4TtN5F0pMIGlljR/19Uy16tMWBAawkL7I?=
 =?us-ascii?Q?T/EQV8ik6sBC4HTMrg5Mu0FAqUtS+vVb1ZSX/KZKY2RVDw5dr6uWfywvwhfX?=
 =?us-ascii?Q?SsR/w/6EvR+Y2A4dhEuvgvPr3g3XjKr9t39xhrN4VwQBq2Mhi9WXNC2lUYcS?=
 =?us-ascii?Q?lnfMkPlUXQciUXAczTSmzlPOWF7fOLObSAo0DRYPWGOza5QbkvJf+MgHN+96?=
 =?us-ascii?Q?PNwXRA/8RlLQFSThXM9TvZdFTNW+78MrWFgbkiOldJkhF9MKsU4kA/WbH9zI?=
 =?us-ascii?Q?l0m9s/PALxiQ6vMRJN+YyKagpmwv65AWnPUJlZm1dvZZpLPE5bq/C2S+ppLI?=
 =?us-ascii?Q?S/ttm9cZOPqJGrkW4kQN+lpM1ZlFyQsdue134xrz2om9xvL+3//WjnTTzapq?=
 =?us-ascii?Q?ZJn2KGWsE+EkxnbNgTRQB6nv0BueJrE8HgQ7kRpKlV0UxN+f7PLPuXaXrszD?=
 =?us-ascii?Q?fglUW3dRgxpMezdCdfg6c5emaBG7uGg/lOmDj/BmNo2ZC9Av/RCAS0FrA5P3?=
 =?us-ascii?Q?6BPZo0VOwV6Re6qRovC38JdHi6ldbXrKH+q7RN+KJT4DdfBNqvYSx0X3u9sc?=
 =?us-ascii?Q?oPa0aoaZWiteF4QUP2dM8NllqFBP7IZLeLW1eJJiD6/rXXaMOR+8/Ue39F5A?=
 =?us-ascii?Q?9HI0MVKFow9xi04jLk1i71/d4hBPU92NSQDy/16vKNFIfPZULkNGPQ3UXi//?=
 =?us-ascii?Q?mJK8Gw7C25zaR4/EB4dD3wsTDsgYfb3Y0GUhX5JjyjN1TOddxONXZch75ZDe?=
 =?us-ascii?Q?60CMBPJDDuhI5w7c4NaDwVyZZVMPmHlsmy1FZd9kK5th5KTKD6t5R14ciLV5?=
 =?us-ascii?Q?afyKNCgezeCN4Bzh/bCe7Vz4iHasHHmZV4O2RhcwbEgyq2rYoCjqNdhtSeam?=
 =?us-ascii?Q?Yz0kWrSjlGslNkJBxUNrWEh3nYz45/1NpOZnAsCjx6FpXt0ImAzuz3k+k83m?=
 =?us-ascii?Q?X9XvMtyV/x3ZAkDGtsdmR6ugesJom2ZIS6dEeXdrZ/Wa7xEb9hagDJ7bedPK?=
 =?us-ascii?Q?Lqb3bSgH2egj95sPUEqpuiZU9tSaMSdCRud5etE7aYEzcHrXVrxVu4WEmEfw?=
 =?us-ascii?Q?ZI/4tUyrVVe8oMT7MsaxfcJHqvl6R7o2i9Gu8H51ylF7YjHXTwrGAikRSxjd?=
 =?us-ascii?Q?NMAT2PulKy6BVNrqPpeRFtWTDSBZvS03GNhv5Rxd+b4nIo/JR7VjlblpB1zl?=
 =?us-ascii?Q?KBE0ibF2cYIfyvNB+qf4AQeNadvz09ttdh7TWqTYjmpBY21F3/ufJLlh76To?=
 =?us-ascii?Q?0//Jps9OIyLiPyrtEQMclKgmlC6ohhgFKuVejh5MX53aNp4sGiRFKR52/dGw?=
 =?us-ascii?Q?5Foq7nud0u/O8Hze5GJ5xj2y/37WJh0QCLLy59cUvMTSLTnPZgO9wwYWqjki?=
 =?us-ascii?Q?rYn3lvdFgX0uqdjJr5e/L/mh+F8NpBvm0sQHsbc5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bbb3c6-20da-4788-aebb-08db18f09a6d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 18:29:46.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdSI0EyY7FSI0riqHJn8BrXbrNL4ais7WWJBQDW+vHPvq5k4r0v/n0sEvOQET03f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

On Mon, Feb 27, 2023 at 03:11:26AM -0800, Yi Liu wrote:
> For the device fd opened from cdev, userspace needs to bind it to an
> iommufd and attach it to IOAS managed by iommufd. With such operations,
> userspace can set up a secure DMA context and hence access device.
> 
> This changes the existing vfio_iommufd_bind() to accept a pt_id pointer
> as an optional input, and also an dev_id pointer to selectively return
> the dev_id to prepare for adding bind_iommufd ioctl, which does the bind
> first and then attach IOAS.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/vfio/group.c     | 17 ++++++++++++++---
>  drivers/vfio/iommufd.c   | 21 +++++++++------------
>  drivers/vfio/vfio.h      |  9 ++++++---
>  drivers/vfio/vfio_main.c | 10 ++++++----
>  4 files changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index d8771d585cb1..e44232551448 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -169,6 +169,7 @@ static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
>  static int vfio_device_group_open(struct vfio_device_file *df)
>  {
>  	struct vfio_device *device = df->device;
> +	u32 ioas_id;
>  	int ret;
>  
>  	mutex_lock(&device->group->group_lock);
> @@ -177,6 +178,13 @@ static int vfio_device_group_open(struct vfio_device_file *df)
>  		goto out_unlock;
>  	}
>  
> +	if (device->group->iommufd) {
> +		ret = iommufd_vfio_compat_ioas_id(device->group->iommufd,
> +						  &ioas_id);
> +		if (ret)
> +			goto out_unlock;
> +	}

I don't really like this being moved out of iommufd.c

Pass in a NULL pt_id and the do some

> -int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
> +int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx,
> +		      u32 *dev_id, u32 *pt_id)
>  {
> -	u32 ioas_id;
>  	u32 device_id;
>  	int ret;
>  
> @@ -29,17 +29,14 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
>  	if (ret)
>  		return ret;
>  
> -	ret = iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
> -	if (ret)
> -		goto err_unbind;

  io_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx,
		      u32 *dev_id, u32 *pt_id)
{
   u32 tmp_pt_id;
   if (!pt_id) {
       pt_id = &tmp_pt_id;
       ret = iommufd_vfio_compat_ioas_id(ictx, pt_id);
       if (ret)
		goto err_unbind;
  
   }

To handle it

And the commit message is sort of out of sync with the patch, more like:

vfio: Pass the pt_id as an argument to vfio_iommufd_bind()

To support binding the cdev the pt_id must come from userspace instead
of being forced to the compat_ioas_id.


Jason
