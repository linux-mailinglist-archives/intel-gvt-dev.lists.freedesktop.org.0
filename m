Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6D6B4AAB
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 16:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD20F10E988;
	Fri, 10 Mar 2023 15:25:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8E10E99F;
 Fri, 10 Mar 2023 15:25:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0CN7mP5+WNCFST7CxfvpUbNL11H6aLrMcU7G3XU61rdCW/g/wgN2XaCmKcRF+PlJL7SjGyX8xBiL5jVuBz0LaBw5exZt+Kgx6uoW0T/pgdq7s+MJ6O9UTCDD1/O9bLDDM0bgqpiHRVIl9S9jQ6I0z1UB/3tyRMSnKd3CdfPiyGCw90L6wHAs5iz6XMrRIeewJwMNjXJOegNK9uHyr+HlZbTG3VPnfhGt6IQg6Tq7a93krmEnyCC+ELLHNe7EouSGHHYSqwZPpKu39MPITylhKPBBBaw3TzXZ3IrXsVehfGuJGQYIX67wehdzjE1OjZLVTUpd6SSEsizLhoRpikJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIGSujiWuMkSLXfEsClCyCOWISD0dhpQFnViay6r14A=;
 b=jSOcsu632cUz0urHbPMYJMLi6p7dZpq1aHSuDYMzwT2xZuEnmo3/BePg0/XMX5qqvuNpH67JiDUilW1Zvdkrvl65/570dYzJ6lYMZFw87LD9KlNEJUgJ5dPEkQ1jbNlUUFdSQuy9i7Npj4RFJqwTULvevQgF94jTEoSfGOqRQGiA3LU1CJM+0ePCQtYGbrYk54J/xq0mdp6OQGY8X4DuXzfDx2YVX6k0AVVriKni3Uf2sFf8uJGytcTZJR/N5Rnj07TIONdOSwnmESqkQKhWlovcjDP8wIp87y02IXCFFHKT5rg/6aMEtSux2PRq/Wmft9CSdUoq+MgCL256Sp6bIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIGSujiWuMkSLXfEsClCyCOWISD0dhpQFnViay6r14A=;
 b=rQ2VwEScV+hi7iBoBGzjzK5hc9Si7Y/1KNLC69/7Le6jPdI74chQcreOIgXR4puvuNtn1OHkbIJKTfLCg7TyczDBc4LU4cpJu7Xi5Tifa/RMn4PQbiYI3dMgbJKtpVFNR/Jw/eYSQF9rWHWK/6HsXDoBn4d8IEyFfMY6BV57YB47HeHCyj+LiVO+446HoOAN3/OyBNZpHSvI0Vj2aX/nrWFwq0S1TSKyBFsFtWkGma02+Y4BTSP5AnKxYmGHNKKKjDpcd2zUf46hmchGQaDEUPkizLzYkgcL/1YxD+gBLC5LtU0oPakptNNjRZIUqY/37+td2rX8vzlGJlbH79wxKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 15:25:39 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1%3]) with mapi id 15.20.6178.017; Fri, 10 Mar 2023
 15:25:39 +0000
Date: Fri, 10 Mar 2023 11:25:35 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 5/5] vfio: Check the presence for iommufd callbacks in
 __vfio_register_dev()
Message-ID: <ZAtL7/Tpa+bD3IUq@nvidia.com>
References: <20230308131340.459224-1-yi.l.liu@intel.com>
 <20230308131340.459224-6-yi.l.liu@intel.com>
 <BN9PR11MB5276BA4E1FF1345433FB8D338CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZAs419G/RNoEgPxq@nvidia.com>
 <DS0PR11MB75299B3370F1AA71D7993895C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB75299B3370F1AA71D7993895C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6fe510-e4dd-4fe2-a56a-08db217bb3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47uddFoOKfCRrW6F3xRkzpC1Z0JH2fQ46EIe5l1yx7yc/E3baeyi/V61VBWPkMOxqWW7RPDWm8o/f/LYEEOkzdZLFjNKYdTDZdqXPtKnHOPuFOJY2njEutUegh3zbXNBkf22/P8S5Bc+6N3yhfrrqkCz1mkl2PUIyU25WTDmTxWhRH5WVa+4Xp6nJeZ4NHZURHXk08AFocvs+2cIyT2s9XDFVDx8xZyclpAqWYE9E+8l6vWgvs63sg92QnHncUzMMeAasnUWPSZCmKBhU/OfVax5o5Ltm2lNaS/Ou7ZPCwyZGfWAaI14IW1pfyj3oWVAbDx5q8FyCQp0IkYqLoGR2mE22OGYRORsBF1t9SlZfhESBmzAY+E634h5M5N3PwiWM41zFVhOYMEgUfuWTBX+I0b7AYHT6BK+hmTnKkLlur5HFaXchP0h21JqbKM0sTCamwQP2UhyGvRpeIR6PWiUimvrcrJiJIG7K+AhhO2nHHzi9SNSiOhfF1piDzHZ5sg5pzPRYkGLEChfeqyfbViNUxLbHRWHlBAfiQbHPFs/ug+QmQLTzrUGEkpaea8SHBSbNiOiAsZz4yhd6WTOjedguUuuhZe1UxO2lY9/VUYcjzebSWXXg5YUa7JL4MWv8dJsASlui2bmBDqjtcSH05YdRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199018)(36756003)(6486002)(186003)(6512007)(2616005)(26005)(6666004)(6916009)(5660300002)(4326008)(66556008)(8936002)(8676002)(66946007)(66476007)(7416002)(2906002)(4744005)(6506007)(38100700002)(86362001)(316002)(54906003)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhzyCa6+oaJ9lwF3QlekhL0yK0tSH0KfPvfXB3noIjLVZjpxaa5DWXptBaKX?=
 =?us-ascii?Q?yN7wV02HVwh4g5dxWuyadqjEjSz7ILtlFUHQm5nMJelFjmFvSyiq9/fyxm0q?=
 =?us-ascii?Q?9meKL8mCf9clpniOCDSUUC2/0SHQ8lcLYHl0wOB3eDMu+M9swOwjFCnwf9p+?=
 =?us-ascii?Q?p1D5L2gECZwKlHM1bfHD2aOSZ1eIXq58unr2ER96+1UvxD+TLE5v3E/tM68i?=
 =?us-ascii?Q?FboTCzqcQyDpa/rOAcjnh8vwdEIH5l5pS2uTXDbVskI8M+SOEFCteA8P/n1X?=
 =?us-ascii?Q?iNh6+lOcKpBa6/H03qVfRZAPfE2ss5j5P+cTUzFIU5ok7QpyDAf16YPWbnGw?=
 =?us-ascii?Q?AAiTD7Neh+vBLMQMijFZ1rPOl+MbcndxD7gzXDJ3bpqAQtjVof3JpsZbqP4A?=
 =?us-ascii?Q?eA6aCJzR30EkyDe6kv8I9XQPIUSc88QjirN40rFgAgnvSIUt+T/e1tAK7ZJR?=
 =?us-ascii?Q?0UgtNvooz4MWbnwWxEPNBpVlVUKW3OJGm5/nYuAztlsIr1WXOa0zfefA5Vcf?=
 =?us-ascii?Q?Xx2X9I6r52vfjaTHFOJC95atsRuL5LT5/Vyc3XI41ijtfcCKgaZlZbpMFrst?=
 =?us-ascii?Q?h/UniK3/9VY77qj+etYwVyCuEkyWs8wzVMl7KKFd/tmcVlGU0YRO6jimZD6H?=
 =?us-ascii?Q?0e6fXgiqNh5Q4MMEYktOVazlSsdfiUhdZC3z4ZpoMXwLeZQbqgn7HVUZY+LF?=
 =?us-ascii?Q?VTaQwrA/8zQKkuziaBF41qkWp4lQuPjlVdzJjAssfmakbjlvTe3H0DXoePl9?=
 =?us-ascii?Q?uAcQiBWJOSmVcWaQZpzdFYk0L4bzHC45bNu6PzuY+yLq8fS5j2wjBK8BBPiH?=
 =?us-ascii?Q?r2VoZH1F+u5X8g6PrH9KfjuiIEud3Y0+Vrc8a/71D2tT3zG8D4FHn/3IQf6R?=
 =?us-ascii?Q?lVDpwP3Q9Hn3bxVr/XqR42bcJ5wO1Dy81+EXyIHrd1CF2NxUHgVYovajcSil?=
 =?us-ascii?Q?HANfL2CbvwAY1+2BKWFgJl5w1sfWtl8S2hq3XVIjiZAwsDbA60cf4ZqWMgsj?=
 =?us-ascii?Q?dJemjnwirXn62cP4w7ufB5p5SI9RC44F0Htq7k95O1Pekuh/QTkR8wBlOISi?=
 =?us-ascii?Q?UJJoXx0siSZc8J9Hr32gjhk6VVY9FdJxl+0+Bca9kYT8qUnvDkdw8xCYGy/n?=
 =?us-ascii?Q?ktnQDxhUNpMyPS2qmZ8gprnVdLONaIEtdkBNPjOFKJR6silBqvbjwXnEIhCW?=
 =?us-ascii?Q?zBuF3EvJvOAibTZQ4uhZezboipDSL53Zq7aEU8a5P8TREp6fKpXrME3IAYG7?=
 =?us-ascii?Q?2ri4sw/Vf90KmjDNTmfS3AzAS7WXpb3ov1y8z2iGUrxpftEPlgffdfYfYwXa?=
 =?us-ascii?Q?iqhjcF2hYygcVU3PYxgf5Hl8pXfNjGKjZi7R2ap0814hG06xag+CQjlqi+nq?=
 =?us-ascii?Q?mJ8mzzBZCD/33lsIfE+Cy0Kt5GWsAL3bKIQe8t5vv71pn0o+0tl0PRkv/D5R?=
 =?us-ascii?Q?ohXmmzDtdEo4MdeqZp2STS2fOnFvvLKVpW/ZUzcL6Q73PU2KRIUofiniiv+i?=
 =?us-ascii?Q?/ROZg5+mR6zTIvH7Ba995rEaCb1K583xPaZw7sAYwdJhjpFuCVWfHO+uWIXd?=
 =?us-ascii?Q?YtKSjp9UvickieBjFCCGQJPeCUe0gO2FONd8I+SD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6fe510-e4dd-4fe2-a56a-08db217bb3f1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 15:25:38.8740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atEU5mf2fDoROKcHK/VQ8KXZP3/AuLjEwk88d9bn65foQTkLS1IgVoK1WHLFhBok
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052
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

On Fri, Mar 10, 2023 at 02:12:21PM +0000, Liu, Yi L wrote:

> > The ops are NULL if !CONFIG_IOMMUFD. The previous code was OK
> > because
> > it checked for non-null bind before demanding the others be non-null.
> 
> Now we want the no-dma drivers to reuse the emulated iommu op set,
> so if CONFIG_IOMMUFD==y, bind_iommufd/unbind_iommufd/attach_ioas
> should be non-null for all the drivers registered to vfio. Is it?

Yes

Jason
