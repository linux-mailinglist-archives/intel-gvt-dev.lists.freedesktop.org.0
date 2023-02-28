Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F156A5912
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Feb 2023 13:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5D410E4CA;
	Tue, 28 Feb 2023 12:32:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB8310E1F6;
 Tue, 28 Feb 2023 12:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTqijxGZvfssQBYv9++yLS2t/ZHwR6d7X1WsH9KaPRvrTY6AYT9h/uQWJc34I0j1udC7Q9awSAm6FUuk8O37nKsKnPCKJurmp3Hn2X8tmpaC5JQHlLun6FQwHZ+aAKfe/ijTiVpLzbyXro754OcR4y0575ZpSU7fZ/eq4WkE5qyUyI1ZUx93LtgYeWvsGvCr+saVsE4n1E/wcLnj5NiJ+6uyPLNoTJ2VP5RVQsRo6dUtP0qF9C+G3ZmEEP7pJzix10UUzwv9NCodfgvq/xyTPwrCt0pXxYfLELk7arW98IVDSXwwi0l8ytlWImKClHoZaifiv3kx5Kd4iJWON93Nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+vGvnESA3t+emYonStk4L6f3ISyr/OlmSBjP+MDL8I=;
 b=UWlR525g5L3gzipH1gfXYduHDGkOiCjda8OBhjXma4BJuh017aYHvn1+z95EDNlPDWw5NxmtTIRMSdW0wBNB2iFsfnKuLIKGVw44tqQlpQQTayHmFGo5W8UpAlD058+3zI8BJVXSsSCviyUMskg7dBsdXIcRJGLxQRbS3+6KI71qyzX16L3VDmofPf6Zb00qieDvT4FZB1qLQ3jPa4Nf2jDTaU65YJvLPoYJAFGEWI8wNud7UHR6hUvY3PSR1pLPN+TlPr0sheo9LedpSFw0c5ydlBJPJp34Ngd7qyni7Wy+bIAbBuoXLQGujOzwIyMTsXqkXJHUp3YiLz50mJfG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+vGvnESA3t+emYonStk4L6f3ISyr/OlmSBjP+MDL8I=;
 b=Owh5tFZoDUzue3KJbrltQkgimWxqHkLRi8yByjdWTobXTviqGiquwGb6SCDpOdksxDbVhCV1ypNia2GdejD16ElAwKx8SLKvxgjur1BjIvbu4yWndQsxff0MKSoB8oXLm5hW1Y2XikJeKveRDKasfufklpo0AnbGERJEWQ2HpjKpOq+2ikYpXH8IDgaO9ak0lt8/slsaOKaGzzNdw0ktnb4mawVZ0ShPp6RsJqHUqzyAUw9pmtnkKE6QVtz+lWabZGEWhLjVyLB9Px0l1meN+BwMN5jQ67YR80SZ7tzmlgtQ03MVsQCCy1PuLf2uahdqM+8wyBOfA8eiyRutzq1MSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5069.namprd12.prod.outlook.com (2603:10b6:5:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 12:32:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Tue, 28 Feb 2023
 12:32:14 +0000
Date: Tue, 28 Feb 2023 08:32:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 17/19] vfio: Add VFIO_DEVICE_AT[DE]TACH_IOMMUFD_PT
Message-ID: <Y/30TEk3t7q/D0Ho@nvidia.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-18-yi.l.liu@intel.com>
 <Y/z400uzn7Nk0CXe@nvidia.com>
 <DS0PR11MB75293EF02CB0F0A54A22D943C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB75293EF02CB0F0A54A22D943C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR0102CA0009.prod.exchangelabs.com
 (2603:10b6:207:18::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d6dbb3-e4fe-4ebb-9727-08db1987d1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MkJAikhh6L9ojbxq/K2CjkYjKD9KXDBc2s/6FhTzZjHL4Z99B+MtI8ledjYwfWZ9m+q/bXLk0i8gWp7jHoNZv+TT/TW8AC23hzt50bUqkJGiAKIxUWka/dDzwCrOTwoQaJKvYhc13mPCl3LT+Vhn6/xMNwj1T1EiXjvUQX/JRrnXQ54HfmYhHoPgBBMLiRAebyp5H0v4DYeXpcijE4CiSIHBstBeBmVP2raeq0M4H2PS2PlFPKy1HLPkue2+4Vs12uzL1H55XzVACEvJVP/JO2k/gvTpa2cZe8OdVsG2KnpogAvGpWZF/flAsYUm8nPvgaRwzu+3YoM53B6AgbeXoG72dRtKvjLe6Hmw3XvGAyvOWYYdYrZNXq2unIOfVDaKKpbziGlDudvPhtF0RQmr0V/zRwcu2cIo294XI2UMjhtSpIrT2z6oM6bFTyS9TRzizKrHXue41L9Cwqnw1xL86h1YJMcE0Nb4PgWxO7cT3kb1Tcri/VrX0oDcdFsI/GJfTCTwdPAIbbCQZ6PYCx29zZ68kvW7lncRAtppOZdCTPFgEXhgU9LlrHCi6/275AKH699F6w8KglgDq96xj2LVlTcQ4w6TeS1GwasRcdSQerYdFphJpmettEi/G2/j9VYUEViFvLEYlm5WAfDDmE6k2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199018)(38100700002)(86362001)(36756003)(2906002)(4744005)(66476007)(7416002)(8676002)(6916009)(66556008)(4326008)(8936002)(66946007)(41300700001)(5660300002)(2616005)(26005)(6506007)(6512007)(186003)(54906003)(316002)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXI02cKANSI2YViXfwZfQnblaClPOqEZ3y1vt0mGpxvPx/kJQY+fUxqJV/L8?=
 =?us-ascii?Q?sEbTFbxtdf2OYTz9tbBtg5Oz3NAKMQdjsKecKygIEUUm8Y61GcZI8GEkajaZ?=
 =?us-ascii?Q?oE1bDO5kkEsJhpZDkrujx4VgSomF3EgwNgyIAeLpi+r8fgsTIRAYRWPBnZoe?=
 =?us-ascii?Q?iCJA57esQIoi3lNSjOrk4mrg2lbDg+KKnJYORtaBSMbr2sqNkIarzKkJr2ap?=
 =?us-ascii?Q?vRd1vEAZLS3WRSCy1M/VCsorStq9mRvbHji0huzqcaMjMhZQeOQ43aoZUow/?=
 =?us-ascii?Q?FNATl8FQP0f0CL1FdjJCg006lziMhgf9l4DjnYUaIX5ccFUAgDIsX+1Th6hu?=
 =?us-ascii?Q?jy2kWnPFu+HqPQXnd3glEv4p3fMBwIaggqbmQnEwrhb0dJr9JFzYvSm5t5op?=
 =?us-ascii?Q?s2LH/nX7qdS/3sXGmqOBXPZHM3R7WaEVL67AcdRzKVpBP0meSalr/UQDSsTV?=
 =?us-ascii?Q?niS9LtimvpB95Cd7oKswFPszeHAEn3bvRETom48bT38Zmhn41KhT+W1ougp3?=
 =?us-ascii?Q?pPh3NkcnkBVjClCHjkcLMwd9ycu/TcLHREQT2+aJ+k425uhzGvCVziEygb5e?=
 =?us-ascii?Q?R05IeuzfjurzJxuwMWMgIpioVe01+v4ul0tZljs2SQq1gOm4O/MhwdibmwUz?=
 =?us-ascii?Q?V0hR67gWWnNmLnhmLu1ncgOwoQJta61LC9z2cQsLKcUhxxHiQohVt2Yy63Mo?=
 =?us-ascii?Q?9V+q0ucklF5DS/PWkwJGv6hygBkQDzSgBZvFiVFBrd8K+VQmhVtxclvlgjqy?=
 =?us-ascii?Q?ozSAQd4xd45c+kN4IqSG931s8QNJ8c0oNaOIT+HXWqnmG8qZclNjq81n23J9?=
 =?us-ascii?Q?i+ElzbbVd/0/HMgxCbiO02+JmW4+0QiWVmYfMqGG1YxOm7VuKKlcXm0bMxOs?=
 =?us-ascii?Q?oyunGQzrF3m0DEUvY1V6g4J9klKs2BpNDHEX+camkeHC69y4rAic3aBgUFtS?=
 =?us-ascii?Q?rP7//jm7b/EGw7CdgsKTLCupKtSgMteF+4aLjc0tFtnfjXrmjFQKqoUSwUd3?=
 =?us-ascii?Q?ZuPUegQWyyILk5ManGvVRuyr1KfBGsloPFhSPlK3Nwo98a3v4hVAMf+BV+1I?=
 =?us-ascii?Q?rz5ZzR+mov2P+gjtrG97/0zbCayB5KuMYrkXcXHTIpSkqUYxQqCYHnuxSe4K?=
 =?us-ascii?Q?c8KFBiawc47UXUMAZkg6niAIXpTFW0W6KoPRXFW+/Bbx/CZjitjdRTQX/y7v?=
 =?us-ascii?Q?+7PQVjz0NKgzxJEIJlp+PMqXGmMepHM29UfCNO1RrV1um7oaE06e8wOiIxqb?=
 =?us-ascii?Q?mxfUjLqpzEmqEnvKBRBRvlIh9d4RcSXvX3dV6ey5VWe3/wQRj31q0erEx2Ox?=
 =?us-ascii?Q?QvEgfmSoVJMyqtSZaWSOM8GVJ12thf3ysPGnQSHAjKqSbgxeHwcGwtuTr6wH?=
 =?us-ascii?Q?zSenWGNvfeXPZjftHnW9ATNIc9xS66zZwTzYwhzEEmwLNvBpoiq3VUSpSlEx?=
 =?us-ascii?Q?GsH9dW1yaKAmjPOSbV6rJGlzMr64P1SZM9Lp5q6F356xd5VoBTVjGXD3pBdf?=
 =?us-ascii?Q?TNvw5eNebInNbezzTpxGu+Uw2lkJPGjGydVDYXZkHPK2CTtrAwssvOkjjzuF?=
 =?us-ascii?Q?XZJuGbxZe4Gf4hhk91KBY5h99/5W/9YP4MHruirY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d6dbb3-e4fe-4ebb-9727-08db1987d1f3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 12:32:13.9238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igrP8OnvqSXYrlJTKUZhjmx+d+Mid3cxVUQ2wx01sThaX6hLe0DZsO+yhuQAu8wR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5069
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 02:51:28AM +0000, Liu, Yi L wrote:
> > This seems strange. no iommu mode should have a NULL dev->iommufctx.
> > Why do we have a df->noiommu at all?
> 
> This is due to the vfio_device_first_open(). Detail as below comment (part of
> patch 0016).
> 
> +	/*
> +	 * For group/container path, iommufd pointer is NULL when comes
> +	 * into this helper. Its noiommu support is handled by
> +	 * vfio_device_group_use_iommu()
> +	 *
> +	 * For iommufd compat mode, iommufd pointer here is a valid value.
> +	 * Its noiommu support is in vfio_iommufd_bind().
> +	 *
> +	 * For device cdev path, iommufd pointer here is a valid value for
> +	 * normal cases, but it is NULL if it's noiommu. Check df->noiommu
> +	 * to differentiate cdev noiommu from the group/container path which
> +	 * also passes NULL iommufd pointer in. If set then do nothing.
> +	 */

If the group is in iommufd mode then it should set this pointer too.

Jason
