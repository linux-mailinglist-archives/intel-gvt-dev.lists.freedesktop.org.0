Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3D72E1F3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 13:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70B10E389;
	Tue, 13 Jun 2023 11:47:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7697110E389
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 11:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+JcLmPT0368jTayYpQ/eHdy1bT9xZoV0g8UU2Wm+TD513nzs1PJMrKckmsXeS2a1lDuJhLNawpdOoc+x/aSekoKLiqv7/RiZOtmYvg14KkChhnaZdUmZWY7CUUBM9usJtPdm+UQTi70hEww1Li0WBXEat/OSL2DELbiDe18GISsfY2TGt5yfXx3MlkFr42IEwUTqrxUzleDxJmflzQ7lFl17q0yebIcInX9bE6fI5B8NGFHDLeV9cv7Jk6nTtcZkwiNAg3uXDt0+yB6YU4eZzu7xJ28gxwXrN0exI/awaxWXtpCBYH0LErqSaMNY/OiVOLdBZmCA9XL72mI8FbbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFSJMVWl2qE0TZnaTF6JoTKhEQvRfYEZTyusha5dKbw=;
 b=Tf8veEzNbS9K0sya8j/P3gQ/oed0FHri4oNd/8xKM0HEShc/27YSIin4xmtBH0491bJa1mgPjuRJIVFp8lMpJQENHcz6f12zIP3OP+X6B9DLms6cjpwOELEMJ/620lMK23/ko5+XJjyYLB3GCsybQgNHDgSZoYbC6pS1FrWbIaavEvDdaYHICblP7ERVX1YUFfJ2D6jtyFSvOhl1XBSBpEOREpaB//8PIf2P2/XWiA7IqJWWfRmXu7JNqlXo5k1XFrlrYLs6vxgnJU5HGaEdcWFa+tsEUNNV2LE2dbqr7DJREt/hlv6H/O81ZPLOyIqYCN05lMme9AMByuxIs7NQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFSJMVWl2qE0TZnaTF6JoTKhEQvRfYEZTyusha5dKbw=;
 b=KTW1ulPOj036YUljfP9q1pPMboq7guPrCoY6aMwAkYItCS+EqiGXBAvrbTp+Csu9GqRIfBARxsbtNszjIoFugGABZaqGJaOMWry12yYkCSOyilrNY+/Hw9ywikm9Axjn2gY04n7zBS9hUaPDBjpsSagQb2vYhUjMpT2nIQYGrvodYEI094CRPDmoX/r56h3V+JWIxLDeEzszlDNVaoRs//E/qzD0P5z+Sbvr5e/NuSYnw3SKStTLrqBYdkUNX9eO9exmTIKCjr7idZOsMtckDc+MlHWtv7LdvOBYTqrYf1t8tkekC9hEq09Byc6XhSbM6k+O5NQgXk8Z66/6Ub7tyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 11:47:28 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 11:47:28 +0000
Date: Tue, 13 Jun 2023 08:47:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 5/9] iommufd: Add helper to retrieve iommufd_ctx and
 devid
Message-ID: <ZIhXTtUQYLpOlLlS@nvidia.com>
References: <20230602121515.79374-1-yi.l.liu@intel.com>
 <20230602121515.79374-6-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602121515.79374-6-yi.l.liu@intel.com>
X-ClientProxiedBy: MN2PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:208:120::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: dc005a0f-88e9-4bc6-7970-08db6c03f683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXgdfUHgDxKDTyhIhCAaHMef/tdft0RX+ujL93Q2k1JQdvhFhc1p7EzsTaciloIDuMbxUZhAwKCaGTGyOS29mpSDF+jsBzi3ilTB441UoL9ts7OhNsnQGQXpO7DTAPmzTc49zQMH4LMwASvOh6+vEVGLCOqilcjfnB8+ppJw+WEb2Tkdoy7UHUEXMHwCKSId9HYIOl1BG7cF2e3xfAYyzsDy3asGbbuEsxzRgib655xdgPXpBHzD96O1x6vErS1Fbuf4dQPgKttCEzyheIcKlkG0e54pavqLcnVV2OGkcAu3bgAwOpnlccgZMmVWrr9hvTKoRNbzqlwzLZTZFFgwJM1zAt53UBRhpjD4imNWZMVrZtY9RXcj0LoJlmJo7OcykDIklMuvpW8uopoIFRPCoitIE3F3prA/9MEr84tEFLSfu+3FkNAeAxxwead3aHhFK+sECQqYSmCHRaRx0wWwXeBvYqoy2oMxh3JAI5eEnLc9IbjStBtggi0A6vrhU7bxHDAPxRTVzD/qsi7BAK0tlN/lIEJ//6egn4EMZhqXQCaZcOUuA7LwlBDfpOepoBuC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(86362001)(4744005)(2906002)(36756003)(2616005)(38100700002)(6486002)(186003)(6506007)(26005)(6512007)(478600001)(66476007)(66946007)(66556008)(4326008)(8936002)(8676002)(316002)(6862004)(5660300002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D3sswCwhh7Sr7nL9K3rtoBMxJlFM6rEtn7LTisjX/B21nKPMOL7bgh6nUluB?=
 =?us-ascii?Q?kb0xb2M9Y/p4muT8vBwNKgZMzNvCPc0FQ1HUAPEBEfnPUJIeWGPvXi7Z5G75?=
 =?us-ascii?Q?Cl65PCOPO4S/BUrUYlWz85CO11GU3v8g+GiZVAy5GknksUl7Z3TG8yOpELrI?=
 =?us-ascii?Q?u0jRyavKyIck7d+cZEX9Uc/HkqKHiK6fg7xKYTUB1owfefLENVc9yv3UIhLU?=
 =?us-ascii?Q?pbjJ25b/i8KlSfhCo4vnNZ0cDkrhx2y3bqw1PTfOFLGOPuZVYywvmEURbAi/?=
 =?us-ascii?Q?1lij9DkAMnjAGpBLMER7D5X5Ptac3mbIpIImTHeEjJVwHeqf3+7aTttn8Alu?=
 =?us-ascii?Q?0ovBKvK1X+gP2UO+zXC5PzoLWA6VQi4dF+Op4fGaw0+9a0KNNMzcka4NEEYl?=
 =?us-ascii?Q?5FOEgSnB7iGadw8DCyBDcJHr9SA4m+w6XhMxkrDWM16BKHmBml+uAGQhH47B?=
 =?us-ascii?Q?loE/l66lNX3AtaTfYS7eNit4seyIBOInLcsGrW/ZXtz8MfPMKwl8aaMX+LIt?=
 =?us-ascii?Q?7N5Phz6ssKguqXNl7jyEZvGzx/lWLlF5zuTxltc9T35aTsrrO/98H4dTvYAu?=
 =?us-ascii?Q?wI5TTi+lSPK+R+xbm3wbKSHkcrn5R+a2uMS6Ddmx/J8DKggaER8U826lDG1K?=
 =?us-ascii?Q?XUn9T1bYlYosibDeoCzET5NkwUzeKDlKP3SfZyM6hkjLxMyX8lbDx9F4GrIO?=
 =?us-ascii?Q?XPuXGj6V2B1XSL9RkwuZddP5A929rv/eLcpret8l6ZtV15ebEpnNwE4T/mGr?=
 =?us-ascii?Q?B18op+6UH6N/CMyZOb439fjpYRHZ9VautL1Lgey3clc3Sv6uIrzTPCR498pj?=
 =?us-ascii?Q?PmqRMf3oSIwVeNoEoYB4wuPYMMAXIOsGwLbZ2D6dmZr5zrqUg9AIXsib0hMO?=
 =?us-ascii?Q?+jCbd53m/yj5YmhjVwVv9Q5b1oH2k4Sgxfcz2Awmt3qmCf1ak+KT8JLaLZ2P?=
 =?us-ascii?Q?4jTDijn7A2Vhtc1CBR+KpToTi+bgXzb09Y7eh0nDLEaVyg2Qx2/AmAaE8RAk?=
 =?us-ascii?Q?t8bF6vYwOOGBiJWTAYNRweOY3Ho5cHgKp2tNrlUpL//Z8Lof45a6nbVkoIqh?=
 =?us-ascii?Q?AJe4zoU78Hqfa7QBYtSSok5tOOzynNPBcK/jTpc72M1+G3CJ7ITFHoRvGpwe?=
 =?us-ascii?Q?x/3pRcHzZKZcP2YUpwzlmFb3XlGdsqRaU63kDs/jatI0p7LclfrE1/JsI+A9?=
 =?us-ascii?Q?VRKp0HvfRgC9Ck1kI6JZTzMXDlPIfn04aLE8yonpXVztx6A7deX6jQ1Jribt?=
 =?us-ascii?Q?LT24B7bBCjlTc9qXtSU1yMYvUN1eYlwuQDgLk4id73E38Q7ClQOQxtaStyjc?=
 =?us-ascii?Q?LoqA8b0O73Hh15BCyMf1baluav8sEcMtapgSAWuMy1vrcI6eRFxuuysl+sC+?=
 =?us-ascii?Q?KngXH4QLhlcDdribo6KgSpaGvRrmkpLH2WNV0ND53kshUbnmbgOICytwYw82?=
 =?us-ascii?Q?tJV0Yuqv7lvIYdybEGnf1Fb01Q4MQOH4e6odBOLiJeMRWifkZkDKny7EglXB?=
 =?us-ascii?Q?U6xk18zEvMioH/BT5fDw4bcHDiD/WRm9fCTPYKmya5YkTz62tL8o1urFzRJx?=
 =?us-ascii?Q?1eoCyGnaslTEEUFdDZBaL80nph8IOXeR5QbRkLDZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc005a0f-88e9-4bc6-7970-08db6c03f683
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 11:47:28.0794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssBEbfhkl7yILc6jliMKaSjRFifbeMgIgd1qA4y0LX95WmcPGxEMDshvLAg2Ovg3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628
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

On Fri, Jun 02, 2023 at 05:15:11AM -0700, Yi Liu wrote:
> This is needed by the vfio-pci driver to report affected devices in the
> hot-reset for a given device.
> 
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/iommu/iommufd/device.c | 12 ++++++++++++
>  include/linux/iommufd.h        |  3 +++
>  2 files changed, 15 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
