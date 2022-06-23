Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3D558A6C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Jun 2022 22:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0010E743;
	Thu, 23 Jun 2022 20:59:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B7410E743
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 Jun 2022 20:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqvdFfk2Kofouvn2s5wHyQmyUBSDf65rChsqd1RL8Gf31Howx8zhTaAyYT4dzeAu2Kcln434QnftOCHN5QSKeeYrQ1KM1XqbrUEQAqtD/YgPiVSLEN2zefpUxsKCrokpSZlYu5M4dt5f41Ok3xF1LxiJ2Y9yzLH+v4GRSPZFPIUgu5kbKV3vdCXD6iu89UzS8TKoeL9pWWrLDZqhFB2J4p+lhhnxr90+gt01y3OBtcS+qtZWCv538A35v4WRli/gXDjEzbY+X5eW1lV+9sf6Ot7miqx4+7/n0aQidqLynBNMP1rE9gwxgwNsl8sVChkPzj3lgvWhmH3FFRdugH7RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtKnKYqAQ7KUFqV68SeRBlBV5z5ChyzCM1BeyEfHTjk=;
 b=chSgfml7f4GUPAmajU1pKvEmig4Pc5n67ux4OKZGmYRNkK4dYd4Hokjw9LQDwc1zlfgqMqqSBM72eKxC127wc7WECWnhQIUSbR9RTEwysfq5eJ5ZYQfK5kLX1+yw9+rHuTw9C708aIOygCIHP1nBvvMBHB3PKg6HYPjUJn56kCtNNa3xjsSJrhuhHWU9kUTQuGrcjuV7Mc2+ardhhibwZoDUvaNgr4xT6RgHChx7fqL/FztUWJ6iewCjWBDZ7+wEDAHGz8LwVoJBfQz9kC/rx6gH/DhSEQ/zrSqLmRtB9J7QIYwS2lF+I/eKHuD+KZfgbSyOLK6Rs+JGpxjgI7O7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtKnKYqAQ7KUFqV68SeRBlBV5z5ChyzCM1BeyEfHTjk=;
 b=h3xj513HtgDyI2Q29Qia0iEVCsp3d26SDHM7t6dBqGoqCOoV7SMkarM+5hOGnN2Icjvs8WHK8g2GOHmoleLn1d0DXLJDBhGNVPT+HuIb5GTsuCDWmsndjQgGdXy5+fXngC3vz/F1iVQxgZRpQjvNmZiI8zw+uAZFfA/Ab168gWyD7/6OQq7E0wiOJA6FSXzH0Jqo6ZTtWh6X6oMzHw9NJN7cILSWwXoXo95MNAnuUz2594bivdkxaTNu4k2yNQ2fP/3ipO3zenLgWwiUnfvB6rhoGbu6DDuFYwPmED4hj+rBlOkjXZke3IIybJDIBT/0c5VrXDgMTGTjDtxW0+2iDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 20:59:38 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 20:59:38 +0000
Date: Thu, 23 Jun 2022 17:59:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/13] vfio/mdev: embedd struct mdev_parent in the parent
 data structure
Message-ID: <20220623205937.GB38911@nvidia.com>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-3-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614045428.278494-3-hch@lst.de>
X-ClientProxiedBy: BL0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:208:2d::18) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9726257-f699-402a-5e45-08da555b48f3
X-MS-TrafficTypeDiagnostic: MW3PR12MB4361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jf+jpPsLoJm7DKlyqkUMiuM1zdPpmQrFmuWNRCDyvtsvJxzI5PkHon7pkgplpzuRmUnFFSvg2cPauA10GXsztOeSjj4LD8t3kldP5n8pzPDmgMi9bsuvhdKgSQcYYKxa2EUe8HLt+R12dsP2PIq6U+kz+x/j/Dttyf+ebkmytJ5jD6CVm3TRxf8tmg1UPY/fb/EvdYHiaXcQ6H7jZhsLYACDvTSqdE/xCpkDMbShnxzUYORucIxjCegU7a3o1DZZ+fAnbJ+olZET3B0PoZWuRjMHt0u/onsDWfoTWdLaMTIvex4dit0e/BMfrIjg85ROPHwMBoHa33JvbLxHqrLsOOXq5c/8QlRnBErZG32mPBxECX35Hz9G9gUsf/djckt/J04/1MEo7gxrI0+R5ht3KD03Ve5YRXG6p7zfx47pY/MKlOZzVbU40jg3HDDLDyLSRd7IjCNxVsht2taTk9u5ndUJlP81A4nKDdpGQXZnVLU1zVARcshZka4hd570p49k618QY1hqRGWHDQt0Y3ifRgdWbwHb28/EjkCVU80tP0NPwxJDwl1NYyA2BzGmcTeOv+Re5kRq0krdv+DIy83MqHBNNYvQMiepse7WxypiOeaUeg/xsSkUFPQDhw6xIbJ4ZQUPUNmG99YF+OaI5mG1J014ll71b6/aARTI281VgJ6/vrGjocbhUEvquDmj3Ywrc8DUbow5LluxHX32s7dc5TacYkpQ9WCDuKG/nYH+tXbY1vVz/Zzn6U2hHtcb+RRi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(66556008)(66476007)(66946007)(7416002)(4326008)(8676002)(36756003)(6486002)(41300700001)(478600001)(33656002)(316002)(5660300002)(8936002)(2906002)(54906003)(6916009)(86362001)(6506007)(83380400001)(186003)(1076003)(2616005)(26005)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ua5qS9Vw419CyCYLWQnVHFuBKBPiNWGBlZt4gpjOUHi3yI0tHC3H+xCtn8g2?=
 =?us-ascii?Q?gH9NrV4zWWapBSBxt3PWd0bMiSDZ7lFNl6l9t9A8dFIxe9Qj/2KGHqp4WhhX?=
 =?us-ascii?Q?X9ToRv68/CaHIGtBI+yGGZzotISxTw76hYgCWZ0qQXZN7IQPoseyB7MVnUQA?=
 =?us-ascii?Q?QVAN1h4a4KHmKqYhl+CYp7NBDKpbz+DD850htjzIbU3pI4YfMdz3sPwar67x?=
 =?us-ascii?Q?g6vKtMXwJskHwNLH4AiUPsUxkxUFRAJ9AjQeeMCOAVOImVWAn8QsGCjRRAKZ?=
 =?us-ascii?Q?KR3A6jJBxgSddAdNSpcL23yALAwmubwpzLfv6+3/JAii+NZL1ASfr0mNuNaE?=
 =?us-ascii?Q?a+320VJY9bUsSnu0azZjV/roBr4z8shRBOXDjuQoT7fadq5rhe/3DHsnMxFl?=
 =?us-ascii?Q?oj2tGXveWeLZZTNccyRb+D2rB8+BJlJwoZLufqcEpO7Bjfq8sUR0AdUPmcLd?=
 =?us-ascii?Q?4refRp7KcIMXRjvxywm+tKz0OU/H8aKXeOK8Pz79KaKZcM2X9700JGKkZkCZ?=
 =?us-ascii?Q?2o8zJlSiMLMaUz56LMN0wSZwmGbGBacbq1g9guhxkwf1T62fVZ58aXI11k8a?=
 =?us-ascii?Q?f1T6ExtJVzmSEiKOs66BoVxZXvXFTs77k7sNi1QAOJfXiHyPHtVOG9V7wXs8?=
 =?us-ascii?Q?+Er5shtTVeQyOzy4ShoQUq63QXL4K2BYCSTLRtIv5VJwo7AnWSwyXKzk+Lvy?=
 =?us-ascii?Q?Zl4cUSiwu/R42NxnEewzKqK4b7BY0u1javab/UynTYpKYdB5HbhNdAYnfrhf?=
 =?us-ascii?Q?C4bPpyjW8Dg55wcMcXCOhwMBAhu23VBW7d8xum/VWSWBtBgaU/fmcqOP3vB0?=
 =?us-ascii?Q?hGr8EmsUi0tjMaishSQv22PUZQdakMPmWFQIxTS1VW0Seofj/IUiTiRAFbCv?=
 =?us-ascii?Q?dy8fowfH9f9c9gA18yJNkZTyhK+JRoToA/NVz+GTsXSDbDcDi8ap3aE39FeM?=
 =?us-ascii?Q?bB8OhKpIYmmi1eanPGvOi+G6wOB8bbzW666P/IyopfIDuvtfAKwT+JHRwTq2?=
 =?us-ascii?Q?yOGxH2ZxyGNERJM0oG6d9ZqpjkwGAexOez9yOT7D0vrVliIadWqGFJLZuymD?=
 =?us-ascii?Q?HxmvkQgdm+E53CFyTh3LvKu4QNaXUG586tedXynhhMKU2ODQEPdcGpbw7R6t?=
 =?us-ascii?Q?8cAhL0uySGTunu8HfEovF1d/poDUrZLMKlXllxixuTVuO/u7XAW56DiXOb6u?=
 =?us-ascii?Q?s2WGUOYxiXIh7fBNvLn1JgaVBQmWGPMi6JjMSgx/zyvkLOD0nj9dc6sFgmO1?=
 =?us-ascii?Q?0KIBcd2K4xQpwFsLuHmDnfBSBJXL8JrDgNZhhthVjpQ4Tkhuz+59iwIoMivd?=
 =?us-ascii?Q?kZ1md942c5oDcJrRoZOi9DaFcM2fnSfbQgDy6O+PuIx7X0xa1L5xiB+qn0V1?=
 =?us-ascii?Q?SgS0tNsUHy5sETWyJLNH7iUqck9V3Tdsih88knaax+B4ZROw3gt9DaVItED5?=
 =?us-ascii?Q?xHOEgbSKIUoEgi+LI5zYQrUQFnpQDsTHDCRSkZsRjTTeHZyoXAOY46GVXN4y?=
 =?us-ascii?Q?WT5a36Bijof/FZlsW7WmuuO66IuXn5arpolEcOGWP2jXP1kXfMFKNR9lbDe8?=
 =?us-ascii?Q?b4IYWfSqqFC77IytO4r9uCdApSEvA+U9sfabHz2t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9726257-f699-402a-5e45-08da555b48f3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 20:59:38.1890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC4tdKsxPk4D3aMMzOuwlBf4vPDaYWKIdYAtX8qZgEa5FNW1USipKHABlI+6nn5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 06:54:17AM +0200, Christoph Hellwig wrote:
> Simplify mdev_{un}register_device by requiring the caller to pass in
> a structure allocate as part of the parent device structure.  This
> removes the need for a list of parents and the separate mdev_parent
> refcount as we can simplify rely on the reference to the parent device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       |  12 +-
>  Documentation/s390/vfio-ap.rst                |   2 +-
>  Documentation/s390/vfio-ccw.rst               |   2 +-
>  drivers/gpu/drm/i915/gvt/gvt.h                |   2 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |   5 +-
>  drivers/s390/cio/cio.h                        |   2 +
>  drivers/s390/cio/vfio_ccw_ops.c               |   6 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |   5 +-
>  drivers/s390/crypto/vfio_ap_private.h         |   1 +
>  drivers/vfio/mdev/mdev_core.c                 | 116 +++---------------
>  drivers/vfio/mdev/mdev_private.h              |  23 ----
>  drivers/vfio/mdev/mdev_sysfs.c                |   4 +-
>  include/linux/mdev.h                          |  15 ++-
>  samples/vfio-mdev/mbochs.c                    |   5 +-
>  samples/vfio-mdev/mdpy.c                      |   5 +-
>  samples/vfio-mdev/mtty.c                      |   6 +-
>  16 files changed, 65 insertions(+), 146 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
