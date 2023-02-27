Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891B6A4A32
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 19:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AED10E48C;
	Mon, 27 Feb 2023 18:47:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042C110E479;
 Mon, 27 Feb 2023 18:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agqPAMW3/UaAC1BHc0fP9VlLmXAqonEICeROtSZdrKfDCnf/H9zycFyrCUqDFEhTKlTahNRFXQkNdgTCpM7crtNpCOOnYkLz0sNtpBtzz9pSM4//gADLDZCyqYXvBkhFbflQF47DvuQO1n5CkTI6671cDHXdefa8o8PS14dADwn5Z/AKywMHiyoKM4NO113EL8DyRVVznLu2wdpb6mQdc0vw+DhT+wtJzhm/zock5Uh6PTv1hQ7Wscn2qZulQELWfV3q1Xh2K9dCnWWk6v3gwsfkFuzeiCXQTpdoxttlSJeW0unoU2qCzrpGuhtsfzsJG9wQSEn5MbeBZN7jOAxjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XkiDmqimhy7MN3KRDiCPqKAbjY/Lsb9Kt+Azv8dNtQ=;
 b=O063u2hpvxS/phzt9A4JoZovhpdf6cFFE1YxcXQolq3QtykQVGWlRdJ5duhAE8woIm4milHtxq9/tek+IT35kfLhS8xfp/DgPyAU6R6HuSPnfIn7/s4JMWP0DvyJtzp1XZMoswchS+6DnltVxaqR8ffw8uC0+TylfUs4ar/s20N/3lyixm90GIjjEqpMux/Ttqti4XAFrPy7KhywaKm5L477ujvqa70IshAK6digTQ5G9GO8ZTU5ZAxrNigje6085/opb5HVAHdsZ2TBH+SLaJFMKE+8JZ3pSSohk6294eahAaRnPfWl7oRZOY8vb4hpAY68O4TJnlOPlz3hfHPpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XkiDmqimhy7MN3KRDiCPqKAbjY/Lsb9Kt+Azv8dNtQ=;
 b=aRbDOaIPk9nueEj0CuhE8rSZm35rLtXQmFxDLUIOw6msMbdUx41qMvguHts8hkjBH3gIV3iCNu21fYxJIrgLb33ePxKjJPPYmICID7th7mwG2bxR2NtQyOKwjISBE/sBjguLBBJsz42eJCm+Xsa2JcjDXfiNT+HhHYqn9gZ+9j2mKZb8fdXEpqusH5zHCz5uZ4uQshWnDk7uDFGnW/zZDGfPCB0UT8F8GJWsF/4o9TiqKRqZliLB0YYOKrHFqD7hLO/NF6S9MHmby7+mvIY/IKtG0rf78+9G18X4+o95bsh95+4+EtdjchT3k7w93u8OZn4yDN1oJj28ulGXrEvreg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 18:47:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 18:47:00 +0000
Date: Mon, 27 Feb 2023 14:46:59 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 03/19] vfio: Accept vfio device file in the KVM facing
 kAPI
Message-ID: <Y/z6owizI0LkK1Co@nvidia.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-4-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111135.61728-4-yi.l.liu@intel.com>
X-ClientProxiedBy: MN2PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:208:120::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: bc31b5e5-1e07-4ef4-3b88-08db18f302a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3zdavPkAYf1I9IB4GWXenNz9A5z0EC1PbxsYJvLUijdOtWfwtJMAosRgBj6VieHjs8Xq3nLG9p9WF2wYfoiqCCwpX0NgNwokuzQ0g6bKfGUnoRA2ygGg1lqV+VSTJvhc4+SdufV83napWeQ8TpQXlBhgeLep+xDrtqtrGpgtLZmr9TLuypozhDhiJImRIVhVAA4Wo/NIyzveXeK9JbweqtyL1CZ225Pi2G/0qyG594NU+aJxjjCKI+dj5fUuO32YFKxQLgejBN6+1G+H8/pEogEQK7VnLBVxHMvxEZVaw5KwFwOPyda9ovCJBY6/4SRQQCnwQwp6+yAzKCe1V6fiRTosbgt7GuvuIfirF1VrtStDttRNuD+c/nqWBmfgyqmmHj0AF5wAiRNA/l3ZkwKyu75aSPBMpBhDB3aQh2ghmVvXes5d1vDe6J0PGrxohBcPCM8OICcN8Lew8WHFGYQN9t55Hmm0nnnWlA2PTUrP4KMAWJsJzrzvNEmPAtDgnnsEq6u5UdWnGmlRydADEpmFJqO8RX3aMQwVMSv3YDSY/Lqh/4VoEFC/LYElEbVTptCngJsFxclHG2hHOvkibbGrGAqJ/g+oH9hUbHs7xQ7/QMj/TVBti0ncE+3ecqtHBRGaH6ETBjF272033F2Qgi9WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199018)(4326008)(83380400001)(2616005)(38100700002)(8936002)(4744005)(7416002)(6512007)(41300700001)(2906002)(5660300002)(6506007)(26005)(186003)(316002)(86362001)(478600001)(6916009)(6486002)(8676002)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJ+s60rOtNuAL5PQnI5d4BSgtUprMLuL+DhlfJ4NltVWBpnpJSO4gBMv6PQ6?=
 =?us-ascii?Q?P7MgSW0gO8JVn1gJYFijwruOZbdhNNQyFnTMPz9VAfCPPASwC2LDTACNW7o3?=
 =?us-ascii?Q?a1FbnhPOyQz1udDqmQInj+FLQmKoYTM7t8mH4ydS2EfAI1wAA6i9mRBDpIWR?=
 =?us-ascii?Q?q1eku7c6xtuPCZXgn0cWL4e2rNSuooqA0g2WTFDWM4Qd0jotRmbp9TCYbG2r?=
 =?us-ascii?Q?fFjyWhs1Nc4qGbvNRatnFS4iAagMwOZOArdTNb3x1631YbhLTRIynZL1J6J5?=
 =?us-ascii?Q?mYelBJXIYaEyl/Vv1IU8M0F8bujsBsvnXS+kiBw+I03Tz3PgaYoz6vVaSnop?=
 =?us-ascii?Q?2OuS7XzaZcCTZ6odw2Wi2emcuO+5qoqeYA7Xn+E69N3tQmLfa2+5Z90giZ8t?=
 =?us-ascii?Q?34RE2GFtkAmjswBiqmW6d3b+4cJc0d1Dze47OU0zp3d0l0wxegJWCe0HfHQq?=
 =?us-ascii?Q?0bvx3VdzzG7RdpayuIp500rWSRbYVdvVKMC5pioA0bgjWIu1bQZVeeinKOaK?=
 =?us-ascii?Q?S4w0WbEO6RMPnauhukdKA5UhYf6A9WAQZ7/mnup5iDMKfsskQ8eajjcVDdNq?=
 =?us-ascii?Q?9zO31eq5VTu5bdXxu0WvpSU9BHDLQxsGyTuoo/1cEhSWTJOwsefPUOhIZ6yl?=
 =?us-ascii?Q?/z5MXq4VSyT+wCAbVZBqzkGPn8OGIIvoj1pM/uUopfRajViseu0GX10POf/K?=
 =?us-ascii?Q?IH2eUjN10C+cLWzk8jSIlEkzI6GA1At7V2KZOwbBd2rLz/kshD78IgoyfgMe?=
 =?us-ascii?Q?gCGwDkEfMKanXJdydR93VuZai6wpHVwmRazzyLp5NCn2HGYmB5t8AQxLGd3g?=
 =?us-ascii?Q?LK2/cRYG7mCtxaZrsmCnT1MaCECHfxiOOwYE+bGHoxhIA3Gzn+AP9winBj/K?=
 =?us-ascii?Q?QMafsQAfqE8hBuRbs9USmwLkOJaIQfj6hgmGis9v08p353ny++En5KiD9jo2?=
 =?us-ascii?Q?NLHDgJ3CfzD6FP8A2LN8J1R/acJewwM/4qCHvodcbhcBKgN9+1Nd1mVUy9LW?=
 =?us-ascii?Q?d+tjemrwYG5La0Xhai7X9d49STmwfu64lIzJ9ZbWthpbAxBcZPATlRo/reWY?=
 =?us-ascii?Q?o1+MHOIgX6HEdcoEA9+PxyVF8Eq6wbbPZTBzJbcVVPISxfSiwDyJQdbK8tGg?=
 =?us-ascii?Q?gPlJGuMSBGyPnlGwBJ0Z/9i11CLATuLS5wo/fRrxqM01xOAdlxwmbzP7Eh4B?=
 =?us-ascii?Q?h+476pWPXmTzer7m/01paC1Tx1FE6wRKqH2/KnPDPEUryaTwAMdOKvbsPf+G?=
 =?us-ascii?Q?C+9s//c0XkLElGBDnrIXuCuVJ3bun6/0aJTnZYRsvFICam3D6wrqz4TIckxF?=
 =?us-ascii?Q?xFArdbdjEWjj1GK6m4j+5tMIcMBiGuDnuMg6NRiiNQIuO0pfnJ5r1cVcpA1h?=
 =?us-ascii?Q?R4e/xij77Ly7pO0bX9ic4XLl80SzY1XK3gO1/t6cn13zwABPGVT76GAseWl1?=
 =?us-ascii?Q?Y2ALg/w83MG+aZVkWEVvE7a9eZXELXqWTqEVgS+DZL/92LnvrivjTOz9Pizc?=
 =?us-ascii?Q?Cl8QMHZUetR7dkdcrQdFbOID1x/qP1PZn8GB1dnlYhvF6AIT7CY8NUD5Gm5Y?=
 =?us-ascii?Q?17Aj6ieCS7HBTJFABsfx7A7lqOTJg6wUHGWgEF+X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc31b5e5-1e07-4ef4-3b88-08db18f302a1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 18:47:00.5172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vicuOiiq34E1kCCwoH4gmXTStrxJTCeRDaeBgMtFb5Ixu7S8xTrrU9YBxLKAxzWk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263
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

On Mon, Feb 27, 2023 at 03:11:19AM -0800, Yi Liu wrote:
> This makes the vfio file kAPIs to accepte vfio device files, also a
> preparation for vfio device cdev support.
> 
> For the kvm set with vfio device file, kvm pointer is stored in struct
> vfio_device_file, and use kvm_ref_lock to protect kvm set and kvm
> pointer usage within VFIO. This kvm pointer will be set to vfio_device
> after device file is bound to iommufd in the cdev path.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/vfio/vfio.h      |  2 ++
>  drivers/vfio/vfio_main.c | 42 +++++++++++++++++++++++++++++++++++++---
>  2 files changed, 41 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
