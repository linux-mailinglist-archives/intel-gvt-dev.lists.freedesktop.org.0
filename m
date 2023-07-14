Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1E753C42
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Jul 2023 15:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E7910E88B;
	Fri, 14 Jul 2023 13:56:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA1510E88B;
 Fri, 14 Jul 2023 13:56:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzTcw/5+fKyUMRkmxBzYygelmJHttufJMsxfgAVKnGByEYNrT3gHujx32vLwBa3LtSFwJ1F0tb6HmHV5P31ZnQ3kPQBabAcWf4UiH2iWyowJavSTKNzIfD0e90xrYh6kSBRTPB0GsK2+7ytdx/0MhAppd0PqzGqFOGn2ihPQlaO1B5ejOCynjOefqYA3SvZEKmvq1ccTVTV/z0q+IIEJiQbODNXhv/XQGwUYD39z6ncMCOpuse/+pPyq5COYaV2auuMyjo0Yf16MO9L40UQvQGRNWw9ZVQG7adVZZNgAk9whiU3sbZNSQa2HrqGEreVSG5j3ai4qtdZrERsBvzYVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWFm/iMumIK5Lk1ZG9fNbUU3qpk1iPLY/FSffzcp6NE=;
 b=avY0pjBhApAXQFyp6Q4qe9uDFi88lXUgfg4u4vA88C0XmDJbUgEE2U8J7xMej1kt4D1W4B00eUbJ+VvM/VFOWA/7yp3dhKOWRA2cQOM8pJjTARK9xh0udt6MDBLY+faTBwnLe4i7ThTLFamZiVPMN5yA2gxzxdAuvsk0+Xh2pnrH4DvzGy8lSo6rVtRfiXamn1E5ZguYPWmiYQOS6GRaPyNT2NLBQtxW81wAW9cp1kduqoyAkFQAPIZVa13Rv88pcwHvbswyTR5ahi08xoJc3KKUHfxwvAjjWTcsI5uqb8DCGXAjSzaCilLSA8NBCB+XusxLuVpXE9egcm7WQ/ejiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWFm/iMumIK5Lk1ZG9fNbUU3qpk1iPLY/FSffzcp6NE=;
 b=baTamQ3lqCJRRw63HEP3/6dCdMj3JiJ1eO0awqD9G7Zrbg+t5KMScUldsYAw3V7RuJvONpPDKlBNukI6j3wCi2AKmruB5Ht6a6iGma07Dhks1IyJciIG1x2tSbz5J02wqJ76G0tRagQhaB+FCAclyL1lHOaj0rqYyg9RLx2iI4OYaWV5OttNwl96CF3kURIXDP9y7VLKC0MtSF0cbOy8cyK+U8nawNEBdrUTRAcP9o+W61xqj+36uDdzKlx15SlLczuFJrvkc4hwwcpahXKdth3xDHVAaBPVU7kVYQ6btl4X4qyg4UaTkX0XyMFD0lSoaLvfMRIaGInVp95zP1j48g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:56:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::69c1:5d87:c73c:cc55]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::69c1:5d87:c73c:cc55%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 13:56:08 +0000
Date: Fri, 14 Jul 2023 10:56:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v14 17/26] vfio: Move device_del() before waiting for the
 last vfio_device registration refcount
Message-ID: <ZLFT9SDyZ2H/XVhd@nvidia.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
 <20230711025928.6438-18-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711025928.6438-18-yi.l.liu@intel.com>
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 158f4f24-271a-469d-259a-08db84721322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dReDOiE4BepJY2+tAtrYw0kzI7UDCt29cv+aLbPS4cu5hJUGxNX9Kxv3yyFBtERfBiJRcBS+oe9L41ELAMzXUV0BGXgb3DDf77dSJdS3hHrquMW08WmeE4o+5FkUVDJGLcjhN2fbKzj4FQsRwGXbeVKU4ZRT7TSqGRXkz/8sGMRbc9x1UrBkiqBJayqumlGahxqANdpPLEHueZGhte7mtOf1ga4Twgt0Q/ZJ6gnpp7h9JQRJ010aq0A1MpVVRwU7bIBGs4WGxI2RtWMdRWcPt4QIog0o4fZFuZqV+/C39DkYQ/csspyr1MULTDbFjwxWkfA2NzbEasPNAsjHT1YKSPk7M7AESeobLwJYE5Q/cLLZLruIO89TfPeSvkjcAsjD98NEKRjMb5zN8/y3MfPpYBGAXSYDrMaZIv0QYhaFe1FtZsysXCxe1IFJ+79g5Gtzzc2NLlEgXJjpPrRIcD25XpTkjUYiEKwwL41jgC6ejerrnqA4fvkw1PA1EUqvjpOgqimC8fXIj8vugLOCL5WLmHkgvnKgG4+u1FJMfj/pt2+0daHBa0wyt0ZS6aOgK1w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(86362001)(36756003)(38100700002)(478600001)(2906002)(6486002)(6666004)(4744005)(6506007)(26005)(6512007)(6916009)(8676002)(8936002)(316002)(41300700001)(7416002)(66946007)(66556008)(5660300002)(4326008)(66476007)(2616005)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SlqAR9eATcWoPELpu6x9oyAfgIFMHo6tYw1WLvJ2TUbo3hCxJsVeoseIUpkC?=
 =?us-ascii?Q?j+471tjD8fjPIAvJ8GND+Yi1G92EF+VKxIM2Tb17SdwtlCVeCGYFL3oiaVI9?=
 =?us-ascii?Q?s5ohT+eyXt+K4u92Fd05ULEpoCeWJGWC7ErE6wS6eDK+knxgRZ+ZWhQIynnu?=
 =?us-ascii?Q?jqsrjJHmINLsWB179ngNjIuCoU2s5B58aJCCJzdfjie62cRcvpbL9dA+2xEO?=
 =?us-ascii?Q?JrehLtmQ2+vkmgY7uT70Kh7Bgf+7W88aQZ2Ow9T38gQ4ugB/6Hccg2C++b5k?=
 =?us-ascii?Q?l6G6k6yEMymtJGql3YuHgrfCxDtlMA+2+0b/48S9IQ8ok1VQLK7AUIUbq1/z?=
 =?us-ascii?Q?AQTjAws5o/9LbI6S+HpbNYs73pnZyauXhzOUKch5FgddMeyYUNBhPYRK7v/X?=
 =?us-ascii?Q?6b+9Vge6IKVrAGh+M/bayrbLY2r0boawYQlx7sjKGW5VIDwVepY+iGRGxcsE?=
 =?us-ascii?Q?BKjdhkV0ny4RDafXdldSnsBQFE/NexxngokdnGZK75Kw+ldtGnwwoB1q41Hw?=
 =?us-ascii?Q?EYloEuUIcH9uX/6xIxdwTOtOs2jbage9+0chGHyfOjZb6o6JvlDSFfpUKfYl?=
 =?us-ascii?Q?+VdzDdvVEIu5OYOfVeAsqjOdKVQxxUWWyl7RzYhBcf11rnaiyKACnJYMIW6b?=
 =?us-ascii?Q?zHuP1BApxrOrfJuIQaYk8t6a4I485dkKoRZ5oWQK9p6GsXKGWfEdnRz0/SlN?=
 =?us-ascii?Q?kXX7ghiZIl2ixH6EGD4C0IkcuX7k6hNWQyCTLxI8v4tlINXL8LZI5iCn1B5F?=
 =?us-ascii?Q?Yto0Td3TVI0cEi3WZ3J9ORL9EyvUP1uZu0RgCpliuBMbElYzmcvsT7DbYshR?=
 =?us-ascii?Q?MJDwl/0chlrj5Xdf3+lH8YOv56gngzTmt4+fcs0K6wLVVNIdZQ11R33Btmhb?=
 =?us-ascii?Q?zc7HmoaIm95TZbhFtwtB1hUItODGZ8e0XNKxuN1N9lNV7IBIn+qT+IfaGDZB?=
 =?us-ascii?Q?mhtj1PecIbEFdzbA+GirudyBtX/m0/zhDbR5tUVqPDBnfSixWZzFyCNcboox?=
 =?us-ascii?Q?Ci57Vft5SfeKH6G39996j5rn2mhAC35v3YJ89q5VReiU1v5NUNH5kb2U8O7Y?=
 =?us-ascii?Q?LF2a1QPvCNNn8ud7zmqF3OHnyTQgX3l2hhRGn6a2kLVnqGL92dn8OGsvJPrv?=
 =?us-ascii?Q?JZOrsujyXNyupe99/bX72qaZwAnS7mFEZcfSohiLTjH0Vvw7kiCZk51HcAOU?=
 =?us-ascii?Q?seU+dofE56WISnkajlqlZSPFXV0AIJ9UQH7PJ/y+nhRXZxkTY5yM2/GWfjfk?=
 =?us-ascii?Q?AbohEJtD6Z6K0P94B8WiHP7TKtFl5CfG4tYL9ff0VCcMahG/oQVwvvbOEfUF?=
 =?us-ascii?Q?dVaDQz2Iw/ZCrkH1RB4XEVvCdjYukOkpOOhRtC4+04XSLJUhZ+RuC1+W7Zdl?=
 =?us-ascii?Q?uHZ57OOlyyBE4UZhF5YH+M3FSgeyQvyeA9wzFRLYo+98Qdk5j/RhShV/bSdu?=
 =?us-ascii?Q?KBzbr1lKTxur0AeTVEXhKzR6WfBIgnfBq4HotTHkmXGVi5LSfOJp458bhbqW?=
 =?us-ascii?Q?kiBsg4qTNUtVTj4zimdL8TJHY6Xb+0lQmkDIx5ljvAcR8EBtB5PQyfdXazKJ?=
 =?us-ascii?Q?XIRGAJXRQdi6xVGO4icr9EO+RQ66P1mg3099re2o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158f4f24-271a-469d-259a-08db84721322
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 13:56:08.7319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzX7Alum4XtH2JKklEp4MliBZ5xHYcoC8IwYMgy++K2GgzwUuGqxtzH521mJqLvb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962
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
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, alex.williamson@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 clegoate@redhat.com, cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 07:59:19PM -0700, Yi Liu wrote:
> device_del() destroys the vfio-dev/vfioX under the sysfs for vfio_device.
> There is no reason to keep it while the device is going to be unregistered.
> 
> This movement is also a preparation for adding vfio_device cdev. Kernel
> should remove the cdev node of the vfio_device to avoid new registration
> refcount increment while the device is going to be unregistered.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/vfio_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
