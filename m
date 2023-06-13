Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76872E1EA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 13:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEED710E384;
	Tue, 13 Jun 2023 11:46:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909310E384;
 Tue, 13 Jun 2023 11:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBUXBbIUX1caMBn9mVE1/wGlhF3RbvTyNHEsz3WNkEAy6Gj/5N5W0vjJaAvU7qutPbwYpAqDjsAEGCy2aYPHAEQ6qgngGThGj8FH3Nsg4Q0h8Vd+TJ3OzhyHEJ8LuCKugzv+0CDkhpTm3/jRYA49HSHFuuRbVSisIUGX/UvmTSkHexFRHKmS/oF4eUre+HKLWeaNoFZzGzBtlFlVPZBxs2pCMJSIAaz5tMP7vYavxufKBYW4VDKake10KZY++pC40cPcSKRDRwMTC3BXCRqK/NQGQX/I8GiOe/jzLyUU2qOGAxyvmCmZqGyeghNbjIP2RWUhDoncbK3X73PVEug/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLzxupXiABKPHvOIiG7zepSn0peV04arF3zkboQ+9Pg=;
 b=Zpw1F74N3mBlf+5x12Xihz5Qr/V+71HgJDhDOC/G9wqjCEiQ6Soun12KGMto9vgwO4DS2fH6gUpc+MTKc3pmDQVDV/Bpcc68Rxm0zcaonO+TD162vQHzfcc0dFSZoFY6LUOXMK2zWEEO3odWyrzjRrooNQ/yBD1chGgD25cnCTq/WpHzF3Gtp0V2pTaU3ceC3v9itK5lCOlQ14Ob+pLdW7Qw1avoFrNzBvMnwcwvrMmtQdI9JvTAQE44LEACgcud2nCDDUEf1htGGABulhdwApqC0uv5NTCd+vSu0fOPPRdtVFgsUI0n97nWtF3ejjjyxTRaZVcTOMRbWRUrJA6+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLzxupXiABKPHvOIiG7zepSn0peV04arF3zkboQ+9Pg=;
 b=FtiFVCTNzk9BNDkuDlLdbdYpSIkcB9dWzw6K0x/E8u5kE/i4aIQbOB1KtigiYYJFcbFxgCYwObISnVdVXnB3mphrFI0GpVXMKX3RGJjDlHAzmHp0iK3CNBmHj5Q3xnVV9wigUo/uWhMknwh+P/1Gib4msCp+a6apWUxe4ikT8QoilbiMMMBvQEclg1/4YsbtF3UHSAOj2FoS7ldvXHeN/IOAz0gG2Inqn7bA4bQnliAmkGoFX1l99vGu6yIPZ1kf1ScCvEDGCR+NpM+9/m1ikGcPmaG9vUqWSE2VGuwHI5G6CRJ7pIHWd3o/QnXh6WbwDhQyRBIlZBwdQq30MTdbOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5318.namprd12.prod.outlook.com (2603:10b6:208:31d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 13 Jun
 2023 11:46:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 11:46:29 +0000
Date: Tue, 13 Jun 2023 08:46:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 3/9] iommufd: Reserve all negative IDs in the iommufd
 xarray
Message-ID: <ZIhXFNELB/ZtTiba@nvidia.com>
References: <20230602121515.79374-1-yi.l.liu@intel.com>
 <20230602121515.79374-4-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602121515.79374-4-yi.l.liu@intel.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 4495b3c9-55b1-465c-2fa4-08db6c03d38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utgSMQqCfX/2d9ES0uK9kSpA7vzxJB7qGCXjs6sJSWohGAx+0JV9VMbFgW8epL/0pLbDS+fIi5gsKWQuKVyTL3inOHRXkukWbW3zQTuPjbaHjnS7lVRxj+GHT8bnDBhQJzBwSlC7rJVWRHUlfM+ZAfsoce0Wgfqs2hcw2T8xToAzKN9tbXnOe/xZHlR3HiCVK9nKNzh4A6xOKtU+tH0JWgJ3eMIWmaU5lxKlYl/4MYpr/a9kAojDSYIeklDCMnOky4BvvTBc3CiMSCQQpqnJuL8JqJpEzWtPhJAvn5NNoFhUnbu6QKtdEm0ZfHhva4HbnWZxXrnijufen5swnEy2WHn/sLUB+elakuaybFWRAflab8hnJf2wlDsX9jQRkaNAMY/QMaTzbupYOi48jGMi/w58dxeWDuKhnC2MYA0XJtKoPiehwh6oLTWxaTw/8KlvpvViC8PkXL0xQNghoyTx98LsePC74YW89dWm2ufPR23kOHMvgugLpJ/q9gEbqJUrL7uagDI8WVz/B9Lzyn5xMRUjSpvGYBS0Kgjmy2GCnBruY5PMf58Ej861RvwEGloBrerY3OLVM8fBF2I2XfoPMRhQyIAsvSENTCqZzuPw/kc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36756003)(86362001)(4744005)(2906002)(7416002)(5660300002)(6486002)(186003)(83380400001)(6506007)(6512007)(26005)(478600001)(66946007)(66476007)(4326008)(66556008)(316002)(38100700002)(6916009)(2616005)(41300700001)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y3O6fydOXdDjTRR78U3dWTxlJLZs7hCgZ5DMmQ7pQrzYbz0C2heXTGyT7l9w?=
 =?us-ascii?Q?GqGhGZ/fxcc3kekLBoPQIrwAbZ8W4o5zxweMaXvERbvWy3Dq5UCB6RhzPLnT?=
 =?us-ascii?Q?3e5hLxH9ftkdlFmrAnr5fAkkMlaRFopD4vIEE/e+ihImsERRhqLaBEJED2kp?=
 =?us-ascii?Q?EKM9dLZ/DhHGrYgD/qIbwCVWTCwN9s5+iQjsBWNi1fBLnxL3ag6MP4IcvBAk?=
 =?us-ascii?Q?3GSld+m7M8wHq2OxQ/Yj0fntPRLU6GmYevqwQvUPFYkqiUcw7JfOp+afKdrp?=
 =?us-ascii?Q?cg8At/3M7yZJW8DQxuF/AikoNe2g60PkYyUCvSomuXVeQhkUerVdo8h+JXiM?=
 =?us-ascii?Q?0hyJwUWgTaKKRKAt9CCxq65hkDaM3M9nSchlRqAk1MLDjmFquP2a+G23VhyK?=
 =?us-ascii?Q?pxi+KFvJbIrAOGiTyMd+jbsbRDR1OU8E6Jxtgv6ant/ZwlHoT6ZuSHd56YmA?=
 =?us-ascii?Q?z6m3YaO1Hj3t36YMx6cYDJ6gcYyy+uolYnthp30U8S6C1hN2xp+ZFwHpMbwQ?=
 =?us-ascii?Q?93S5mrL+c+Zr0HFj5CfaC+xyQlT1GmYL64YP1lfS9xdkdyYPPZR/pDbHnn2a?=
 =?us-ascii?Q?PEhaqwWm/PQCVXe29jSW7KexrU4nYsofi3eHkVQ1n28uYdETckjo7GL4fYLb?=
 =?us-ascii?Q?e7fxXGAvAQO/xxOMjGHyx7izDGxFY7sy0ukBGwuzUjKe4R9Jigu0S/4y46+M?=
 =?us-ascii?Q?E4ek5XzOCQkuoSQ+NtyadphaOUr0EEPzolKro15EDFl2DvA7Z1myHYfeAG1t?=
 =?us-ascii?Q?ToRNGPzVIidw5qSxIDvHdQKDy3o3EcWv1y1O/GpU/wVHhi1rYRGgB6vXz+1s?=
 =?us-ascii?Q?qE331Q8nkrMaCx9eThDtIoFqDstkxX70IFAsma5KW72h+pIAsgbNkt6r+nWx?=
 =?us-ascii?Q?6xl2HpeNvHCj++ylmHHMsxWHafc0kYJdgsaXAG9RliDBd7SjvwCesM/KvK2B?=
 =?us-ascii?Q?xuCWfrsAMMusLmivquw3jcHkIPT7EeyNqBGUAy7FztpkW7DM/CC1FRDDWEpH?=
 =?us-ascii?Q?RGyLlKhTG/5bWrEAbIQJ4itvkIQ0UW5GBQnmi0ly9hNOiHigAC2uGiaALezU?=
 =?us-ascii?Q?r0VNtfKi4bJ9JzTrZiKGr/PbkVfEs2+vPbDGl69gCGB/Pb2EHOb4vklebaNK?=
 =?us-ascii?Q?QV33cLiR2L3YqZrnc+H+MgJINsHoeO/wqR8nXxf9nRZCM2bY2X5Df9fM720x?=
 =?us-ascii?Q?X7/Px+9q/EWsMklhlOPBUSzU9ko9fgZZ1FHKZSlkdg85Qw4pN+eOrPkYfmEQ?=
 =?us-ascii?Q?LXYn4/QJHdavu9Eh3PIg/1RpImYxo+Uoe7zkDh3Y3V5VT1Os8SsEr+cgfKfh?=
 =?us-ascii?Q?QRZ6ID5NKDqUOhZb7sgNNxhlCVu7TZg41DANIPfFZvLsEsrdKSQizjo/WvLd?=
 =?us-ascii?Q?C2no6M5P35H9y+Py53YlrNGuwkIda674N0mELcOFRcZsbbz/yAWWO1cdUICk?=
 =?us-ascii?Q?dRCLyUJXmjNMbK60sLJ5DmQQqJFVE9FltIcXbvO9fMudQcj1T08AMOCgMvI0?=
 =?us-ascii?Q?+A5RjE5JTolB7tvzWl96ywLg7Zb0v5dKRDA1DTC/x5Sode4sKz+6W8jqL6I9?=
 =?us-ascii?Q?G8amK4eaDFasQnus1iA8+2MUlFfdAY+MhfukHCXf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4495b3c9-55b1-465c-2fa4-08db6c03d38a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 11:46:29.4109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaxBC2uc7h+IHDSYuPG7ZS8G8C6BwcBQYJWC8jXCNLgpIQtDZOxKq2R/F2Fd6rrl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5318
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

On Fri, Jun 02, 2023 at 05:15:09AM -0700, Yi Liu wrote:
> With this reservation, IOMMUFD users can encode the negative IDs for
> specific purposes. e.g. VFIO needs two reserved values to tell userspace
> the ID returned is not valid but has other meaning.
> 
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/iommu/iommufd/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
