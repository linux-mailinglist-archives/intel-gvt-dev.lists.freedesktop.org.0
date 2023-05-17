Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516087070B0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 May 2023 20:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65D510E22E;
	Wed, 17 May 2023 18:22:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91F110E222;
 Wed, 17 May 2023 18:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3pF4RAfgjaiIiuKl5kBcSoQFPbvtmIFi5nxQ0NoVdUbmv2qb7mM14zlfUrGUBbRYrQALDq1Sx8wocLwdglpk6Wr0l1sAQXQNFGHVDdBQNl4lFqTI5rATLs4BPG0tJn5i+jQB/EPlfj7zebj3rPXqqwFCO2JITGDIdePsQdKAuFj19NZw/4wTUHw3xQtZ7MOPnVEKdun1hyLrRNGIvk18HH8C4ujySmZN1qfKWRwtA6p2POtdpGKhhIc/WKUSHGGVvUuLFCmd5/UQrZlVSEe0f8gfoPXD8mtCBg3gkPfjD7LRPZkpaYxXt6vTmocX+i3hI9CxhhsHZ+2VI51lw6uyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/BzCF609S0XN9tSLHoXN9uf+s4GaK/W1BWhbimU39o=;
 b=ABIxFPoCrJoLjCL/rmLOPHrOP07IE98VzHnct1YoK2MVx2HyIM9dT3GJUeM/rUS+2yLaOc970YFLFUNikKQ84pkwqTHGRdfmsEgSiZmJSl8pAUZCE7XMdBhG9rin9e2jmT2BVJHtm/KFRTTVga+YhOXH+dTGh6MPwNNHKfKE8HNAZptN1IHC8T8f8PWZDE/YPwFCmkYrurvryijPDxGEJoAMkeIznIH3xVBIz0Pr9+U2oSj1GD8qLn/DVpqlWUk7Fe7IGUXsPak3XINBgVCjjwIBec/14Ep674iQHLco16cyOO4bMwzB2Ei2JtB0l6yBlTWuXu8b29EQ109dbFdMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/BzCF609S0XN9tSLHoXN9uf+s4GaK/W1BWhbimU39o=;
 b=c+Nl8yb34PaNbfBlXVIekNex4SlwOaynzp/644cGIOGoAQIz0Moo5+QL65PtaMWLNGO4p/PNwKJhCNVC4rn+ea+e6wJu8huk1HDiguc5baufkMa19tyqNsYGfPc/Mnctsh4VwNWmr9MxQ1GXJiLH8TuVM7CL5MH7ayTp/sfFLf0AfEbSWETQ7ScA4gaQa+96WR06H9XKUAqIRNaw7hMdYwO4QjmhYaBMBAZOZEL2fSq37cNVP5OCcTt8tleRcWyNXvztyslEEgShdLpB6dZjWdIeXaMUX/zVc18f9dh5Q8WN0W0YP1GsKJtGq5jzA8Dm3IT5Vvu1cW6xB1Mjue+Q9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Wed, 17 May
 2023 18:22:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 18:22:29 +0000
Date: Wed, 17 May 2023 15:22:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 06/10] vfio-iommufd: Add helper to retrieve
 iommufd_ctx and devid for vfio_device
Message-ID: <ZGUbY6yVfbd3hRxY@nvidia.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-7-yi.l.liu@intel.com>
 <20230517121517.4b7ceb52.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517121517.4b7ceb52.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:208:23c::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: dd54a3d4-05dc-42aa-05aa-08db5703ac0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TafRgOWj75kEkZN8Kk8IGg44HXkEL+lzCcPvXKosOYn3GnMWi8aII5hTdhsLVSH4k50nUF44yuWjUk0IPjre9Gp6B6ll3iFvy1ph5LOl+ZPRFiBoexXN7ajsXD5V28xAm55Svstg62AJiqoCWjsis5avnTcWyuZWnjI1s8BhvvLop38y7/5dMCuW4DMhtBrBX/xEFyyJntLqGBLxniCtQiUh/3gv7SvSY3XIWjBGwFk97ngL81acAHFBEdR0gg/aHE5IvYeeFB5LMcPUdxSRZk6li4Zwdi5lFNfUKrixNR0Lk4IpiS0FNBnIZCK7sX2y7CU56OgSlojyYjZe/VCuPsNGBL1sY1eSZlsH0TxQuMqCyPLbVOyUrqvF2H1hXQAiANivOsohEVJhaNQtLGWCA0vDnh54VFA9F4GTC8HlnlwTs4BWziwRWmt1xU17Te0esNLXhbiIOb864ZGBYkVdj/HLvJ9YQPzRQD3rB7uC6/cJrKxiUAiugkm1a38CeFNY0kvGbMgMsHdTKif5KmifPtrEyspQSv6UJXjI7OQ0/WzDqCFXJomTM4OHvgH9X8z+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(38100700002)(478600001)(2616005)(83380400001)(6506007)(6512007)(26005)(36756003)(6486002)(186003)(316002)(41300700001)(66556008)(66476007)(66946007)(4326008)(8936002)(6916009)(86362001)(8676002)(2906002)(7416002)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bkWw7AXgGVH5hN7gvpdbjaZebrMWcG9P28+KO0i3hsg4tU3UspX5va69+1VD?=
 =?us-ascii?Q?2zsz+UWkv2pfqCPaWfhf9qg0uGzwzr2JYoeTz6Ky//A5xPggeA4jr0bKREMI?=
 =?us-ascii?Q?l3B92K+TCRCkiJIK/cqgItSOoH5DQSdFpA1+xhFRuQdFVgU1wa2Omfag18w/?=
 =?us-ascii?Q?YK9m8a1gxebwco2XJ1eG8G5jt0ZpKZjxDlMfZOvXRen0H1MAofPzad/ZZDjM?=
 =?us-ascii?Q?we46unud2PtlRWzixYx8t2KutxNW7JZxXaMs8H01SUXWHsJMI2u9gmBtqoXj?=
 =?us-ascii?Q?XT1KsoJm8rCP17sURKszjAo3hvJ/NGXnSKUjLxP8i6XCX6IpOoSMWB3SIVJx?=
 =?us-ascii?Q?ORfSeKINbjntr6vcg3OAUnPc/gPkwZQnzL6DgLp1exM5ugtwV4yVmRSsFb0g?=
 =?us-ascii?Q?lyQaf+D5Qbu9XtqTKUbzbLsAI6M52Ya6eEmG+diZXa00DME0V0rEfMvUxUbw?=
 =?us-ascii?Q?VexgrJJNbnpffHAgX4JpHaU3dEMc5kdW0PLpEjxuhnnqhaQLSM6Vb8II/wI3?=
 =?us-ascii?Q?jlQUA9kupBkUQX2JraYBj8TjTFdiZegYe1T8wih+fpfzAKmosYdlESZgqpCw?=
 =?us-ascii?Q?VCGjo0GuVMTGJwOGIdhMx0e/Xs9MElnQJEu5wy6NfXTOZ7Gsc0JEQYsi6E2x?=
 =?us-ascii?Q?pKWBm8zgmM0Y4MALgJJS03mzt94K7HHb+YSMNKabSkgCz2vygFvs5+mgPy1D?=
 =?us-ascii?Q?m+a+7wL1Pylro9LMYDXB5HGX0Vt4P8unjAlpcAs2n2GpHeET7JkaEUtD3534?=
 =?us-ascii?Q?oy//qtNfWURaphVWooB82+nDKH6WMrhiS6a8syhHROfikaeHP8m/CZbxeSb2?=
 =?us-ascii?Q?286ruQu7Iydvbrhm0Rvp4zQxO6PdteQvRm1LyPQgx4H/d+lrj8O2xC+FIVD0?=
 =?us-ascii?Q?2ZrKxzE/jE7JzCdsOLsFvgYRoum6qF4vYQj5jFUtqXAnHtivd8Feh99jaCf1?=
 =?us-ascii?Q?4zG7cZO04PXlZ+idj0BDCH4tVCNuB2j/E2USVJpivHKNglfI+9mP8wQkeo7w?=
 =?us-ascii?Q?W17G2KZ9C4N/h9y8IplSpdAM5juqNo8zCNS69O2q7Gsjm8G2hMSxQsQDEbdd?=
 =?us-ascii?Q?uOKyG7GmNxIV9HebqFnnFzDCznhgYfI3Ji5bmtySJDMZHraUG1dgVyaiaAYe?=
 =?us-ascii?Q?1EiTV81tnpCX9yG03OLQzD5t26Tvyrbvtgkaul7EoAZMgSALsMaEFJKvnTWU?=
 =?us-ascii?Q?NMmIuJ76798HzySBh0yo0TUwPaN0EbeM7vM1MqUjFzN6u/08KKLz0JDWbOu7?=
 =?us-ascii?Q?GYgGLzD/uReAsOxyfOSGqA2zqysJZdRrjs9gX0ziNTw003WrWIDTRN4y4qSU?=
 =?us-ascii?Q?4MB2FiIJPbdCdBDEl+dwt7ANHZCqBLyIgVJV4inmU9hIJhWhk9CjPLmbhRDz?=
 =?us-ascii?Q?IDzV30Ry0aiwIG7iQIqhibXM9ov0zf3yoQRTYHqKd5YKiyJKfhNvzpikLSsZ?=
 =?us-ascii?Q?ScDoyTVGuX4xUMYxoM+AqqL6OAxHDLPqYyBv5VVy/hlzpJbs2n5bxo15aPBL?=
 =?us-ascii?Q?4TwmTIr+j0x+1OG3RqK9JjjKb/oNzgJCH2G074sM/pT9y+g1W6s8XurCBC9o?=
 =?us-ascii?Q?KF3ZoIWvu84vNUTs9h3h2Q44zCSXEhqFt3WJzhcw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd54a3d4-05dc-42aa-05aa-08db5703ac0b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:22:28.8052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLAy4ShsZZxbJpZ50ykTimabfEWPAdLEYGqwcJhgKEots+fZSF/taVkdBp1AbuLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488
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
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 12:15:17PM -0600, Alex Williamson wrote:

> > +int vfio_iommufd_physical_devid(struct vfio_device *vdev)
> > +{
> > +	if (vdev->iommufd_device)
> > +		return iommufd_device_to_id(vdev->iommufd_device);
> > +	if (vdev->noiommu_access)
> > +		return iommufd_access_to_id(vdev->noiommu_access);
> > +	return -EINVAL;
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_iommufd_physical_devid);
> 
> I think these exemplify that it would be better if both emulated and
> noiommu use the same iommufd_access pointer.  Thanks,

Oh, I mis understood your other remark.. Yeah good question I have to
study this also

Jason
