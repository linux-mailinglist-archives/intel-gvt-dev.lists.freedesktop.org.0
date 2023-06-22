Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9373A7E3
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jun 2023 20:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4810E5A5;
	Thu, 22 Jun 2023 18:00:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73510E09D;
 Thu, 22 Jun 2023 18:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv/Cm+069G5hwxILKnoHmfUKDPbXmpjVMbhpEBP9DcxP2we4iRpuEd7BnZ9xUkiUCne8473Bms33vbbHbOsJXefFhhLP6Kdq30RuhQjnlN3yzKD28ymlDzH3fZsdIztiRoF9VaoO9KfODqbmEKwKLpoJTsH19LIG3lefA65bTmI2BJmkce3omKiQ99kbKOF5K6SDLiB9M4fUeYisMzQNZpfbKmCDWPFSpRsVSkqsSDmWYGCeJBMFriO7DZyfxABvWdUqNLMWTkMmuJlhkGBoCR6A6aN2VZSQSyW3Ferrs0wWCMKSkeeyTXqR3fVsiweB+xPcEEv2X62lShgyHekoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u68psKh90UF+5BUtazb3NY9jIfPOmAb436hahaGThjc=;
 b=FHZcmxky9kIJPCn4gRzVb1pgCeEiD1ss/+3TFvDvZ3UVR3J9Bwsc5MXDGEY6AWe63jsWpInTv/0i/PrugdX4q540oSclxtgrZREPbCM+4Xtx6meO1zY8dkSO51nGRhICg9FIApHjVP1i2H5Z83we1iKBvM8UCM0GHrtGDqTNll9z8dfJM9S/YlnfrAz5Jlkk+huqrHBTUwijC2EB4MshOo1dyO6RXF87sH43dfjoQUUPd+HEdFE4CFY88fVBD3vD+BrTdK+s5tKcH2fKorQQihxOi06/qMR4IoRTN+tekqW1E9IkApi+em6sp8SBMXonMjA/BwXmzsDwghFnkKfyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u68psKh90UF+5BUtazb3NY9jIfPOmAb436hahaGThjc=;
 b=OrOdgRz0OMgOGGYm5rUxFJ3IB9tFn2ZL3t8qvq+egBfjUENnq18PfFr3L45k52BzgR2q8Xk2NhUU7I8pPLimo5NT8g3YWJpzxymMiyja4i85Xzc1MYLdA85xD7w+87DiGXafxeaxbkqGbyxPcRmVvTkLAb5RSv5zhLxq+/kKQU+/z8LtC/f7hc27hOHxdw399OQdkvgRwB1OquikGv35J+/Jhqq2LQjq2UkgsD0xQ/SFsAyh5H6b1f7gGdeIxY/qBd9MLGQsxfEdlDyNnJ5nhN1xcZJ+cjN5cQ1rw8CfX2B+rvQa+kWoUUFNb3F7tN3uq/tg2IlK/F4KsWW+rY/dgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW3PR12MB4569.namprd12.prod.outlook.com (2603:10b6:303:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 18:00:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 18:00:15 +0000
Date: Thu, 22 Jun 2023 15:00:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 12/24] vfio: Record devid in vfio_device_file
Message-ID: <ZJSMLOJQQlny3QD8@nvidia.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-13-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602121653.80017-13-yi.l.liu@intel.com>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW3PR12MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 981f9cd5-9f28-4b19-2753-08db734a8846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lutVlHtqvqQ/nWjlF3SPGSQYohTei8HVhvsjKu7B3Bj/wLJLgS7SZsc7Pv+zd+DGFKLg9pGB1KpMrn6gnwqfwmvUOoFgCNVWvp6Ey5TFUbmRJV9zHiUSUrnvkOEhkEd9xwKkIjYTJNg0k5Jvoig9aUVuMjhxM/Cq7anJ4sAGlqBW+2n1D+MSODLOTJdhYOK5fkXdJjbQB0+48Tw/vlzdNjs+1YXVI2zim1lVlDEfUZwpiQoQv4IV1jmRFKc6kRrY7UxIu5KSsZ2aeSBeDcMfsX/eBaHz2w2TNiChVAUe/T3NIFRuIcBGExIdUhfLrTimJFr0oPVZESCBrTH/ZdySVRJs9oumN3krJ3Am4y/Lb0OED4lFSc8neFO7PDgUgYFj/4ZUxUMg23rGm/BRQhSlHdHlTWhrUYHqJDftUjBf5AujqPuD8jBWxvvVKRXJM1f+M9zTz/EhFlsC2jWlKC9UNMI2gsikkZrtJJngtT286lUeHWgH9LkYc/7cX2VXox0GrviYDLEhTzNwVOO9A7DvguX4WPZxuhy+ytiHLQzW9FqZE40uKHsxMKJPaf18ro6+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(4326008)(6916009)(66556008)(66476007)(36756003)(6666004)(2616005)(316002)(66946007)(83380400001)(7416002)(6506007)(86362001)(4744005)(5660300002)(6486002)(2906002)(41300700001)(6512007)(186003)(26005)(8936002)(8676002)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mWk6jNFB0y17VUDCsTrrbQLzVLVTut+YpKRw/LJS85U+MpHkWh+2fQmA1Zfc?=
 =?us-ascii?Q?XRphuCnHQTDEnn9Vp/QJPFJ/Lx0TVflZI/n0pz6HhubD1Nhl+nYRcD5topbA?=
 =?us-ascii?Q?Ixli1FdsNBj/f8NrBlskCcKU2ZvlW9ToPnxMOZvKnlu0jXSHxvWb8JXcMRCL?=
 =?us-ascii?Q?CHyY82kNcspzck+7vSBuJJsveNgj9ndFQRaZQ6Gvjk9OsNJj/eLbvs4OgfeE?=
 =?us-ascii?Q?6pdD7nWRrOQQnPxH2KFDWfWKbdI/mIAxk8Y4xcRBhXtXu5Hp3USPnIWkZYW1?=
 =?us-ascii?Q?tmv6XlfUklHx/Wvasd9P7ED+Sjb61fM8IMFYWzlXYAi5IbKkuItCj3pwQmay?=
 =?us-ascii?Q?hrM6UNW/XWscQPu8h9+U/e6H05z2zccoVfLs9eU8UmNt3/YpzZ7CfuYOkuMn?=
 =?us-ascii?Q?AWhwKNO1iB8bIHK+W088ft5LBzRvslbj0pPwfTymL8HDT2A2Pn1hrNaVxM+Q?=
 =?us-ascii?Q?FS2h2RF2n1VYkZclLSJFwTdDxb26kUY+GzeyWVnG1XtsxSWckzAWKkbOCBLc?=
 =?us-ascii?Q?ECMuMdW588I1+S+ijd3vr8ivXrx2TWyED8JQw3VwYCa5i9WXBH0tNeg6i/OD?=
 =?us-ascii?Q?M6t5rgurT/lbsAZqL70QF3od3M0xahjGwcjLWQpDrJkWn/XzX6Hd0wVNVJqR?=
 =?us-ascii?Q?YGELGVwjCO5dLGLBuxIoZIrsLmOe+JgIdBYR82tzjd6DixWYXjEmQZPYSdnL?=
 =?us-ascii?Q?udoFnKSNKARQJv734UvR+Al8cphJf4rEFuqrYFVj+WGyD7AmZ23EZQ8pRfC+?=
 =?us-ascii?Q?xOn3sGLVi6lU+yRsht/VM8Pr69lrXJF177Pfji5Qhuy4rezTMyqKtGlehxb9?=
 =?us-ascii?Q?k+5sCenZVQvWzQ5U0SjJWQjVTUlgcHSKyp/N2xBl6a4qedarR/drQ88iyX1i?=
 =?us-ascii?Q?C8CFqnYCpy8QZ9b1mAakwfeqMsUVNje4sstwcA2TwY3iv2LEFvbHDJOx2Rfj?=
 =?us-ascii?Q?q2rP2zmcYZLvs/bU8781GiSRpHI9A/iRlFQv4DYk2/a2D9s8h+9bslA6oQVn?=
 =?us-ascii?Q?4wK2grRozdWGHhHTmymDZGIhNQXseCclMVza6ujaDZEro+/EsLRFq1RUXFBP?=
 =?us-ascii?Q?hi0Mgl3JIEX830bXh2JlQpxTf/vh8TCldjYM6BN75/IuGHjHaSaOZQflu6hq?=
 =?us-ascii?Q?z0Q4/wYNl8zsfvKnrQbAzWoGqL42hwHhuxxWgHuZOFhdYPYcURts04XTQV7d?=
 =?us-ascii?Q?6planplkc8ybCs9YNp3qYYf0tixZSovO37mVeiYHU3ZGhVLyMpR3kG/IFI7P?=
 =?us-ascii?Q?IFd8I+KFQN7BBNMGmlr9WZrxTSL9D5Z8RBJ6CBHPUlmBCnOrmtcN7sXQXWsv?=
 =?us-ascii?Q?i5sYOF2+L5xovohQisRBpVhxJ+31XYfHswCFv019h+AhBQpzkv0L9K8FP1bb?=
 =?us-ascii?Q?IdbmnY0lF6SSv5XvradUc0UJwRnJ56TeSvbLShk1gJJCmYqABOSR613scQWS?=
 =?us-ascii?Q?mutRcGb2RNqcZ3hqqXsnfoRpipw+PoF8JXQqRDHdiz2PjOZERFsP4QzvvnQI?=
 =?us-ascii?Q?5Qxlb05BuY3Alq9mhByMyUOMmfpqDl9uw37p6WDvkIw4CdrK2FwkfYGvtO87?=
 =?us-ascii?Q?RTjseNfOfIBsXojsSn7a9BZ1m2uoJKWxdUFO+GXz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981f9cd5-9f28-4b19-2753-08db734a8846
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 18:00:15.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMRmNX9rgV97BkTwV4m8IHQboovGRd82mR+9CEE6zM6hh6uNbgnrbIUR7VUYJB0Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4569
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

On Fri, Jun 02, 2023 at 05:16:41AM -0700, Yi Liu wrote:
> .bind_iommufd() will generate an ID to represent this bond, which is
> needed by userspace for further usage. Store devid in vfio_device_file
> to avoid passing the pointer in multiple places.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/iommufd.c   | 12 +++++++-----
>  drivers/vfio/vfio.h      | 10 +++++-----
>  drivers/vfio/vfio_main.c |  6 +++---
>  3 files changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
