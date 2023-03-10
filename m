Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305E6B4F3B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 18:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F404110E302;
	Fri, 10 Mar 2023 17:42:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1DD10E302;
 Fri, 10 Mar 2023 17:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0IriHeho38jIu5k5FCDcioC93oxnnb0BdpAakrbN/V/vX7RUF40wujqfQ2TlMc6dJssFwMt/9XP5j6471YKcl4VuUfIJWwn+C8inpLMSVMTUZHZkwWhJByAj52itE5iNdcTgXP6ZbDidTrpZBVefnM84haV75YTG4HztgmYEDNIXtP6G/gSxLp0EnV13UyQBboHR9TSJt1PORT2cQhTf5WJiHg6yy8aARwhrU6kF34lz/4NVYDcUFsYPDqJgSRY3i0Mj4TjF2e9EePSx2fdIxTXOCsU67djQ9Qa12NHW4Z/ZO7FrLWrXWtQN3AtSDbLh97B+Ofiuoa0rp5CJECC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc9s/FkT54Fg3KihZHFxoESDIrL2P7GjWGyv8o3EWbw=;
 b=Gpf5l7PzfZG+gW/iWKFjj9b9GiDfDV12OCCyIvHOyFjDMHW+LH3UFCtfdXBMURF5us+ggEmysoIN1uZKx/mTnO+J2eTrTuKYAdnWlhTUBddON2uXJdM7S3Oxpi0EQkcMhDc1l+EqcBOKmfmNjx9jygsHeYpmbxCmMZFkGKgdGs+/6+xLtuawiuJob+AnrX9a7JyEe6XnVglxgJx4wOU2+nJaqe32MV0+YWB/z6dmfWgydnhgy9EkHos1q9ET1v4WzIBFwuhbyklXqcRwxQ0r7AhiytQXVQfpfEQhBXMmrdfPzMSvpCmzEiAzLoMzEe2C7EII5Czj7kVAJOvQUzby6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc9s/FkT54Fg3KihZHFxoESDIrL2P7GjWGyv8o3EWbw=;
 b=PC8xxrQ5AwUlnPe2fR014Qa3/a8dnlyOsl3ShMgykqI62yVRdUYIuslrPjEdCRAt+hWjmWl8m/qzL+jMZ84a0sfNgmb/XmRuJO27l07eAtS67Nv4XcbWSyN5NpUsphUzjBhLDTm0gJRWYtxZ7JsOskWHRDGqgC0sPnWwap1iFtln5tCkSxO8YIo5QJtBjMa3iHjVmVpkNBGMjS6qPUF+wKl6QZw9dLsb1UvXaK4gVlOdF+M5+ud40ZFC+jrDZNEdGbsJPKm4xZc02E1xt9iW8aybc//ig0wHkSYc0IX2imYU6HnuLWP07I3Q6c/cG3DFFhFNX+wxfKz/llnzL5AGgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 17:42:48 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1%3]) with mapi id 15.20.6178.017; Fri, 10 Mar 2023
 17:42:47 +0000
Date: Fri, 10 Mar 2023 13:42:44 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <ZAtsFH7lXRyjTDZT@nvidia.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-13-yi.l.liu@intel.com>
 <BN9PR11MB5276C4BB18EC47CD047D498A8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB75299B12BFB1A12DF786E6C9C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB75299B12BFB1A12DF786E6C9C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 1802e9ba-cc6a-4117-7049-08db218edccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6UyLoF7oQruUs5fAz4kmxDyMhh5o/Cs2+KVIgGbrHHuubtMDuYm96I9SoroFCcWgSlvmAvWAVt8PN1PjmDVLjWKM+SpFUYJB7u8ny0XkIZE4xRxdzoqmJWa1aEdmIAHZFv+wd4p+c6TYdOPA2o5TrFHfwzXI9R73ckWrKDBJWlVNqhs3UigKUjdEto7EodPoRcy6RxUdH2uBEbyaZe5Jj6Iz9BJqqgG3i5ltLiCyy887HeAbPNAGaqttv2Udc+rKNJwU8JYWst+HbbLEONwBoPweBGtPEbxTSwf7ePdC8Iu8MfEw5cWyl6b6OYWa7VLVpjlH1wJwww+zetltqsmoNR5WnoCzExbKsA5te8zf1iw5444Px1mNFl6OMnetIY8+yCurfcJ4ESAUHS41rbsuLscGx/f21OZt6C/zd99BAfb6fvhTCnAoA4R+GmBNnZ2KuB+097ws4etkOwmIXgKqdODtEfY0BO5803R9m1MTk4fBq8wYvLfsRcirSAQf5ejkdKW4v80Idh0XrSMreio0ywaf57Yw9SIbdfhKTi7XOVATUGDPN/YbpkPG7UBEtTXeXFGSuhP2BNa5RM0j8ToSCvMl5z3wANESNmtbcQqiFGBm5/LbUyD8G/N+iXHdrYvQHPVXJ/0W6+3N6SFOjjdSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(36756003)(86362001)(38100700002)(8936002)(478600001)(6486002)(5660300002)(2906002)(7416002)(6916009)(4326008)(8676002)(66556008)(66476007)(316002)(54906003)(66946007)(41300700001)(186003)(2616005)(6666004)(6512007)(6506007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z9WJfVb5IaMQ/4aSBBJHDTY2sjXUaJHNckzt/q616/WFJGu5hFTVUv09nBcQ?=
 =?us-ascii?Q?8MhIP5ZCbBN59sFAd0H1NUpdyCUrZ8af0TwWZCSsVdenhki62gruJOfAv3Uf?=
 =?us-ascii?Q?J0Wr2aeDbnI+SX2bEt4r8Y5U3wJw6KUdfLwfwkD3q3VHh7G8s5VUcloSW+9r?=
 =?us-ascii?Q?osnXNewms6Kk0rE13TVSPiIXGvNCmNt0YBGEhh9wPhTMUdV8Ywl9C44ucURi?=
 =?us-ascii?Q?IsWCOk6nNJmIghqYvB/YgUSw7mLx8xRFKkoKwBocDKwJXym5S9JUA4xkQKmH?=
 =?us-ascii?Q?BtFkplXisnlKEp4OdOkbI3IW0M4wBPwFV8S4Pm+J02qzX0ziItcEjjTLREfB?=
 =?us-ascii?Q?5+S7nUGwa9FqVOPV/lrDN3Xn1mDPeacR7IOUQcGS6GHEY9GGssIXbpP7qWkd?=
 =?us-ascii?Q?3hXnVVg5zrcI6LP1yU3gEW6+U5gKJZsGayBYd5AQzEX1DG1dXj2UA0/cqZei?=
 =?us-ascii?Q?XKWhYPxjGRH+z0HJjLzKEIpAU8LJCm2JSQhsAiYldpQ6yFgntX6QoWFCibvZ?=
 =?us-ascii?Q?F2m6tMp3ywSD5y0jUQzWAsZGTg8qKBZ7vkOKqC4QkpbWhI2PsT7Y18LwxTAI?=
 =?us-ascii?Q?9ng9iD5PpAieFdpUn0Z86Dk0VxhY+HUtLVEtUCn0/J+LMqWCB7j4zsCxlx6n?=
 =?us-ascii?Q?gaTd9lUIT9yt3vYwqY/sbeJuAZlfS71nH2I5bzACvTESa85L06bmxhM68PXT?=
 =?us-ascii?Q?RZ6dD5XNrtFdnV9CCF/zxwuWIccuyxtpI2vwyXy3let7wLbD67P3Cppd7Cxt?=
 =?us-ascii?Q?20bw5cm7mOhJ710X4uqs8FWS+9FisI1/ujk0ffn9kA6M5MAurSTPV4kFErLu?=
 =?us-ascii?Q?My6iAJbiK8kWBz37I4kBi+qKpxiaEXtnTmM6rp4rL/64V4DUQYkVrAMKKHAm?=
 =?us-ascii?Q?vOCXnI2L7BIkXTTSBmbl7KJQmbW0O1mwpIEHlYpfBheRVX3QEMA/5DzAAwzU?=
 =?us-ascii?Q?EUXGKzXFnQR4S6l54M3DTMAdtdt6Z2bBukdEKZXXStbkT3dJWTZf7mBlTQZO?=
 =?us-ascii?Q?ApRkn1LYSXgYNdeaErC+HZrFAZaa2kPs48T37OiS4U7PIheyhGL+ORgj0sWL?=
 =?us-ascii?Q?PVJDEcr/WtOv+UDRWqcVisZMnO47lSzM3i0vz2208sRZPfUt8WEWz7kk1ZlH?=
 =?us-ascii?Q?oHePS5TPe2ZGx/w5uK+CEonNmcsQN+rMFxPKBrYG8l9U+7/bV3kU+UkeItSy?=
 =?us-ascii?Q?OC+NtteDx2cSZJKyhMraA9XZN892RByreFUXKbzWmeq6kuAYA6YWi/cK9rPY?=
 =?us-ascii?Q?pWZKRi8S+IzkyOpu/Ac64Ni2L8fNdRax0XbW4BMmWepJhLnRL4yo7O8V3Qrb?=
 =?us-ascii?Q?HKxGF062CguopsF8WNRg4Fd3setyWRclS6ckBz0I68WjeBBz1R2tzqKR43v/?=
 =?us-ascii?Q?3c0YNXFec8gVlrYqKLROlDWLjPGd1P5IZXS3KJpv+IhRzMYsOANiOSuxTxTf?=
 =?us-ascii?Q?9VDisdSPtjSQl+2GF0Fn0wnjtYVZsD/iScM1FWdETH9dknc8jiHeeEkh5Hb2?=
 =?us-ascii?Q?DThfNES4IyWgeBuUfyFi0B6FZlLwC6nS+hIU+Wy8cRS++/h77Xgm7/RiHQhi?=
 =?us-ascii?Q?WwLFhx3QKg9XxVGi0h2n/KpQ8GNDNjKWQTqrZx7r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1802e9ba-cc6a-4117-7049-08db218edccd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:42:47.8768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxcmN+ZKQq5P1X0E5RCz3DJ03ePp08kMe80yEbBNrUfRlkG4DFJx9Jff7ZI9MehH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
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

On Fri, Mar 10, 2023 at 06:04:02AM +0000, Liu, Yi L wrote:
> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Friday, March 10, 2023 1:31 PM
> > 
> > > From: Yi Liu
> > > Sent: Wednesday, March 8, 2023 9:29 PM
> > >
> > > This is another method to issue PCI hot reset for the users that bounds
> > > device to a positive iommufd value. In such case, iommufd is a proof of
> > > device ownership. By passing a zero-length fd array, user indicates kernel
> > > to do ownership check with the bound iommufd. All the opened devices
> > > within
> > > the affected dev_set should have been bound to the same iommufd. This
> > is
> > > simpler and faster as user does not need to pass a set of fds and kernel
> > > no need to search the device within the given fds.
> > >
> > > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > 
> > I think you also need a s-o-b from Jason since he wrote most of the
> > code here.
> 
> Yes, it is. I'll add it if no objection from Jason.

Go ahead

Jason
