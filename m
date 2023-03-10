Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197036B4EF9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 18:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E597C10E302;
	Fri, 10 Mar 2023 17:39:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613A610E302;
 Fri, 10 Mar 2023 17:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJyibPlvK97JyqiRzZYRePYPEs/0a190gPupFX4fBT8hK6uDJ2G5JVH4ntUy64wNMrYKpautHtW04RyR4YN99HpDHITHK97h+cyHUfWmAyTSH5DE6HtR/sFnW8c4oYmYfL7FSATynxvfDMXb7yGk2SrIqJ8sYDLYQNf43safP3LgW/Z9nnvEKMpFDaRCzHCJytcvRBa4ac7N6Wv129j5qQK2afr/kya20aTdtyXXR6QdOWZR79MOtTsGyvzf6Ocsh4SH/JYbtOvLvnwRkmF1UkhGEY/ezix1F3uZ/LYd37pdIsXAqh0DeUw1mW0KK6bXhpGKUMzRUhcycIeP1B1/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqs38odXr3XwTYowWHVQFeUzVNI9q4gt1q10lA69KiU=;
 b=QdsLIPM66nNZk5pF0ehOJo0cikcOTJS9FoLsUco1tSToNcbMGD/oUsGP3K/CwuokzsUP75riYvhjhp/8KKM6V2UarWLf89vZoTqO2s64NCzsKHDtGkS+PiW1H8HArbkGdwIXe/WoRaN/h8cR4/8zSuFY/bBstomeVqjR7WpAaTJC7Zsh9TO9IW71Br7sBVwCBSQIAf0mCZ0gM4hTLoXA8sVU/MW54SEe5idzeSQyI70X97aiv/BLgBkaWVp7JHzrwWILKeP/gt4eFvikTU2JcmH8mX7Ue6F+1DLV6ttJkbbUMMZ1FqdNMj8Y5shKzwElIgoEPqdPPe3Envl3kg+1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqs38odXr3XwTYowWHVQFeUzVNI9q4gt1q10lA69KiU=;
 b=utLExpBzY0Hc7DSZucdD3cEMKnotuWXW6P73HewcWQlAcEKfZFCvd1AU5ffYZoiu7PBPyMv8JmTuzM/LMN5Y0pWyO5YitLTbUI9EM2jDZgbgfO2cC9zBuL+4mX55BPhcUD91jNtqOaqrC4Hj6xLFwKZypP0Q9LsGUgITWEJFxBWMOlh2Fr+0Y+soej65q3fiR8eWvKtyHJoKH3nwAG/4zRQv9psYpF6wpl3mwiPqBf0aAm/DgmF8r6oy04mq+oJOE/7SNyZq6nH22/Vr0FQYzpN0Qa8SgJBwoX61QQRgzVMcjYFcpnhh4PZ9cJLOX6kReiandj3/9+fBuZTj2YLEpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 17:39:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1%3]) with mapi id 15.20.6178.017; Fri, 10 Mar 2023
 17:39:15 +0000
Date: Fri, 10 Mar 2023 13:39:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 4/5] Samples/mdev: Uses the vfio emulated iommufd ops
 set in the mdev sample drivers
Message-ID: <ZAtrQT9ZUFHYrk1f@nvidia.com>
References: <20230308131340.459224-1-yi.l.liu@intel.com>
 <20230308131340.459224-5-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308131340.459224-5-yi.l.liu@intel.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW3PR12MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9bf5ab-24b8-420d-6349-08db218e5e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSA0zVf1/8uVbOP3kkIVn8C2HQk/WsyUoJBStWXYhDQayHQQJMfHqnvzKNjx6HxuplRjuSG9jloMnq6PkEDjFA8hiTMO8F+OTxKdCz3qREDU1E+bZ+wnlLBH0J0CPGmMk68bNeB7NhXTOHj04B6iND1vLk4zfqe0GMdFB+ty/rrwKTGmoK8sfFeuTPrFZrLknCvkzUlQddAV6/f3F8FWMOwz9rkMS0dupM2icFxQb/tGuoIgODraw2qSchWr13OvlQ7EyAbhjYKPrAUPDDS+PZn0WRG+4p8XlRHRNYmq2HFLd1cs5238A9vikIG1wbVnAiGq/dwlcquU7sefL9ZHwHJlgtmeNYCOBt1ZX4c/L3RyWoeGhfjDYFlTPqdHU3ID5ZsN8jIOS7t5xnAgiWZ/PuZzNd79fiuocVTsk0L9XAyQGfl5dXVaQJ41cYz2whRoh5lUVyiaqB5TFuy/nB86Qs4eV0UZXIpKiEaa9kz37k2EOKcVWFBqb0y1ZpK3truf9Y0l78miwOjVAIEYwsDAOsz4+bXPOho8Qm2nXcCE7MFeuQMtrP3h/ivgsPsCExBrqjry6Ugg1yMcEr31UyVq3SMSlJ2hk8+WnHojpRbfo34I4IHdpAo2sLyMMi9SgHQTJZX299eebDZASFkSVkU5rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(36756003)(186003)(6486002)(41300700001)(2616005)(83380400001)(26005)(4326008)(6512007)(66946007)(66556008)(66476007)(8676002)(2906002)(6916009)(5660300002)(8936002)(7416002)(86362001)(38100700002)(316002)(478600001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+1kTGw2qaiswZ13pw0ONcdKfF4mYvF2Gs+3TiVtL9S6uslwna9RbaJfoN5sT?=
 =?us-ascii?Q?c963zGBoH11oNPtkEH02yPRTfVQBnxkoKsWzyrPIAnnuw1b/NbsWHPPGrWyf?=
 =?us-ascii?Q?4bjOqHCH+vXAbVkLY3FJlfIFoLzQLnSwjK3vTDZ+CMPEZ1cRuorlPAhN/gbI?=
 =?us-ascii?Q?KCIoc9/cHfOe4KX2HssILMpZLEX+sYvmodsGSoVsi9XiDZMlOntprRDWubH3?=
 =?us-ascii?Q?JwRCZfddnUKiJSQQ11jsdJvKXtMZow6+wkV2fu1dMYLepMNJKRu2Ffn96CZz?=
 =?us-ascii?Q?5AufFgAL8fQW+twKqRO26WK6Kk85hwFBl4svG3WY777yc0+Yx98x2+tAiFLN?=
 =?us-ascii?Q?M3+IbMyjo4bPGUAd065IdnkL+lSBHyAYvkwSk744+TQUPpbIhiniSJyJZgcm?=
 =?us-ascii?Q?B0zv3ybpt51H43a15hei8OZL58BiLN7iMTZfiUnt3tmJAptcZS9tMNLRds53?=
 =?us-ascii?Q?X9sRD7gGV/yPnKYPO1kyqGVGjMv4tLD/daos1WcjIq8WGp9k//IndfY6Wtv2?=
 =?us-ascii?Q?vapXlmhsSXdxiJUJc0w5dk56Ku7usv22YiWoN6XcEDo7q9qWqWMZCr02bkJk?=
 =?us-ascii?Q?703mIlobVQu0kvvYAZwWLKz17GiI7u68aPohHEaMiXNIJNkVV3CoosVlvsoZ?=
 =?us-ascii?Q?PIX5Q/g1teZoOVtRzf4pMyO0kh0jWLVFqOGEXCpXodTxvYN3DIfgVtzSOg0t?=
 =?us-ascii?Q?BNo7gd2eTzI0XKWQRycJY4pKKvJaNcK3lWS+cUyAzQhGVOvBFTBUw5pslaiO?=
 =?us-ascii?Q?JNuxWMGxXTbYt72V1ddH3jgoGOIPSzw6+7H9Vn0vmVxNQ4B1a/LK0Dweq9BB?=
 =?us-ascii?Q?B1/t3HR1ONF3gkqwAzEj7vQn8QwQVh3MAeWNoY9eVzTkcZkmvzBwgn0E5Pfv?=
 =?us-ascii?Q?VtRSxyVMeYNFPHYn47HWmepRNqp0QFVegFueuDPhZIXwcLe2xyGZdUrcCpno?=
 =?us-ascii?Q?dqncrqFvtyVPEupOVXWOJiBM6knTIw/Zh0f57tiCbwOaY/2sk+vEIjFhN1zP?=
 =?us-ascii?Q?mPU2iLypaB4Bdvgt/cXMEbvcCEzkZPog1/jUZaWnGgvD1qpeNn7tMtn0ME5s?=
 =?us-ascii?Q?JnxLAmhio5b57zathEJbGiOqCF99n6xs30ZENQqDkiF77DUxtXt575Y8gzTr?=
 =?us-ascii?Q?0Ei0gzAguUP8gHhCvjtYVo+8CpyIBC6Db7izjJDWxH2HuwHyv8MPBG7xmatJ?=
 =?us-ascii?Q?muA+GNemBb5Q59GNV2ftD+nJdQjCZOV+GFVC+/GYZxJOQKWDSl6yanBAvUIX?=
 =?us-ascii?Q?rstoPILrBiLO7bHOXgi3b6ZoKdt2lIcZOq5tftxTUV50FAxqlmp7wCghjruO?=
 =?us-ascii?Q?AMms3hzxRud8R/ZJr7HHvAuPFlpyXuAVvY4Ha/ZycDBKbwOmyIDIk/mPWce2?=
 =?us-ascii?Q?4EmscM9wW3DgN32GdZb9wElXklMGvejId0k6hNx1jVNRV3r29sqr7OUPLGKp?=
 =?us-ascii?Q?tFfqpP+0v7X009sl+kYGpSw9/hamO/Qpu4NmvDiZ5nfH2S56jKUiVBlLpXVF?=
 =?us-ascii?Q?gPIhPnu3Iiy2NeetAQTGXHVbu+boAlsUGI8F8Pj6LQnWLTfeFJaLGVaAqqpj?=
 =?us-ascii?Q?6lpJ0hydaSBBlafFC2Ob0eSx0dlfE5d0Lqppkpem?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9bf5ab-24b8-420d-6349-08db218e5e5d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:39:15.7339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yjxTeo0EnAcDJN/mkr/WqRVmdbmYo/fW9UXsFcS+6wHI1oKratQq9zLGgaF4hfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
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

On Wed, Mar 08, 2023 at 05:13:39AM -0800, Yi Liu wrote:
> This harmonizes the no-DMA devices (the vfio-mdev sample drivers) with
> the emulated devices (gvt-g, vfio-ap etc.). It makes it easier to add
> BIND_IOMMUFD user interface which requires to return an iommufd ID to
> represent the device/iommufd bond.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/iommufd.c     | 14 ++++++--------
>  samples/vfio-mdev/mbochs.c |  3 +++
>  samples/vfio-mdev/mdpy.c   |  3 +++
>  samples/vfio-mdev/mtty.c   |  3 +++
>  4 files changed, 15 insertions(+), 8 deletions(-)

Subject should be 'vfio/mdev: ..'

> @@ -119,7 +115,8 @@ EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
>  /*
>   * The emulated standard ops mean that vfio_device is going to use the
>   * "mdev path" and will call vfio_pin_pages()/vfio_dma_rw(). Drivers using this
> - * ops set should call vfio_register_emulated_iommu_dev().
> + * ops set should call vfio_register_emulated_iommu_dev(). Drivers that do
> + * not call vfio_pin_pages()/vfio_dma_rw() no need to provide dma_unmap.
>   */

'have no need'

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
