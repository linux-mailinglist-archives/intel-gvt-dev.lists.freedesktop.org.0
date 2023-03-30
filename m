Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB0E6D123A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 Mar 2023 00:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369810F084;
	Thu, 30 Mar 2023 22:39:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78EA10F070;
 Thu, 30 Mar 2023 22:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTqCEA173I72Apd4jHkBujXMF2Zt6eZUh6DgIQPfCbRGAu0sx8lOlTqAj3Y8tQd/7YgTYUkrPgD/UzWcE3m8og8xr7ReVm3yHuRENve00HtyZyUDLy19bo4EdQVXGaU160bLRGNuwmxSa1oBhuR9CdbmuGY/efcogJlPX3fbd6+ZM+EJleh4J4Z9xoA7QYaFRHjEhoHjmkZTqWaKV1hnXp6+9PgH2Tj5ydWN4/mlODKty0CTn+X+d2AA7YuLfhAvFlABc20t6JKyotJVFuG8YzV6GwgME0O5ZnMZw+b4waL/KKItIJyqbY6F+Lce2sC/TSuFVmlrgTC7D9grFm74gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA8Eet9Hmohl9tOC2+O0ZX4+qKF44zbOCWFjWQwo2Cg=;
 b=e7QR9Z0IUkIJAJahWmwD0NAkETL9AFG4AfkipRqsHGK0xMfr6t+Uqzmrh++gcMbXQQHyxio0Eg1UvrTSeWzMlE2X+iGR8/xLh2oA6FWMa/6qkHDWW9IjKfDlSMhoEVgAaN22KMq9xFT/7/rTsquLS51xHgr2HWaUpW4Zx8sXKot4TLgjGQPdl0n8aJqP9bm8ZhznVOQt2m9a9hRZ6PB6Sm+6bpA0fNni+cDbnn6auDA+KDkATqdVAGK9tUD1Qj9oFY8FbRZ0FazFbmSx4eRbzbjspq8lXN+iZy+rIxoIAiQKLayMI40jYZ+BturhqoNQlL/We589vicNcRFdyCtBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA8Eet9Hmohl9tOC2+O0ZX4+qKF44zbOCWFjWQwo2Cg=;
 b=oa/KiQke6RULk3BPyZ7/XH8CDRze54kBWRb3LNkHLF8i2kYkna5axWPVMYkXs6OQI7xMiWnmol9moA7sPcZa0SwxOoQH7nMPQlToWNLaBH9FeFEOzPVhkEHkeOeLWFeHPETCAjv++owUR383VagDutxl58yqEjMQLzb4l6beA0gNQt2rZ0ppx9ZuYoyoiSlRZ9XY4FUqKZ9GP44sP6ClXZcXPvNXmfUZ8UhLOYuYR+t65Bfycj0wsaQ1idGJDuFWs+Vg95cUCazuc7yVOCcJ/T+4kiClQEBYzUYSIkPb4yqPxOTCf71eI1X4+lrX1aWLKIj2yIIcRzqxHg7RJ9PExg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB5018.namprd12.prod.outlook.com (2603:10b6:610:6e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 22:39:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1%3]) with mapi id 15.20.6178.037; Thu, 30 Mar 2023
 22:39:00 +0000
Date: Thu, 30 Mar 2023 19:38:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Message-ID: <ZCYPg0iKO1V+IDag@nvidia.com>
References: <20230328084616.3361a293.alex.williamson@redhat.com>
 <DS0PR11MB75290B84D334FC726A8BBA95C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230328091801.13de042a.alex.williamson@redhat.com>
 <DS0PR11MB752903CE3D5906FE21146364C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230328100027.3b843b91.alex.williamson@redhat.com>
 <DS0PR11MB7529C12E086DAB619FF9AFF0C3899@DS0PR11MB7529.namprd11.prod.outlook.com>
 <BN9PR11MB52762E789B9C1D8021F54ECC8C899@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230329094944.50abde4e.alex.williamson@redhat.com>
 <ZCRf+OdpBVnw5ntC@nvidia.com>
 <BN9PR11MB52762D26CF9BC68F5738AA438C8E9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52762D26CF9BC68F5738AA438C8E9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:207:3c::39) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a089da2-04f8-47bc-95dd-08db316f8e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACHrZF+tgK00iWsR7jf1xIHEGN2JPWiZn/77hSjqtO5L45D7J4NVhWD2vpx6L7C+rm0kQCR82fF3uoCwIElAeVkyLCMvybE2lQ3mR5o8RZJJW7XB8321UxeHJn1TAUj+WVWrcvxj8agQ4MxMLUMy29FEq32KzW/eDWaARE2KxCfvoW5oh+6HQAqGTkcdJtS2dxeFSOHbar2m41Tl79miflBiwtbXobbZ/waL2PzQ8xg8cpsXIO2XH6kJtuXwIvgt49SXNlk67qEp/YGsNX6DgFpGxDseg+0JuqgrDbEl7ECwaMPPBfjNxMzEjx/FTpQE2iKySEYE8WzwSWQgIJ5J4k1KyAgRgQuJ3nuYzHnCGbR6fsuwyitcFIY5S1hglCoug6qlREGsIKtXtFlkn2FEhlsy4p2BnJ45JcLvf6aembm7HoQsOTChHWrxlRHaoL5H6w+8STmnGXNI47yqKWZg5Y8ACzav43au3fjqXVowbhMr5+B1WOsMy7L3r8E3iZuUgXbJDSoMRSpcgSFuAXkM89JuM4ZgJZ+l12NCMSzK79OA82JlyEod6TBu6yx8HfACxcxU4VMXZ1K/DsXaeHNGip98DbBVLy24UXWJMLrm/qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(66556008)(26005)(6486002)(38100700002)(186003)(2616005)(6512007)(2906002)(5660300002)(8936002)(54906003)(66946007)(7416002)(36756003)(478600001)(316002)(4326008)(558084003)(41300700001)(6506007)(86362001)(8676002)(6916009)(66476007)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XFFXehEtIEXG6NWRdJggiI5gdPS4Iz5x+P8Q1lr+FPUZBqBHHdZKPS52hiJj?=
 =?us-ascii?Q?rm48sxfFZpSWZJfJEW8FkmjbEu4PpIZwuPHpr5x7KRJNuxlriZuRQKHHZ3TY?=
 =?us-ascii?Q?XfuNK0j7zZdvWk/rocj6oMmpkPkHZDJTjopfnoNapO3JBp6wzSYrO4Vzazz3?=
 =?us-ascii?Q?iNok+yOOulKYq/vF7e0iGgaJ/SeH1n4k2eze12APs/ZtoqPn4bP2yZ521vUi?=
 =?us-ascii?Q?N5ogssQ4ScKziGNdyIlS0V6B4Y9WQC+NJnPZat8MlVbLu/OFCf+GlrBJ8Jl2?=
 =?us-ascii?Q?GoT8/WEaQvFXY+Hd9Qzh85nTPc7aEKouNvJqRnwaz+PPoLKDveVUFj+l4HER?=
 =?us-ascii?Q?5NZ/Owv/E9Mp3Y8xH2lGRnpmtPOjGs3KXv/r6xM7d6MXaNp4FMMiK1qQhO4h?=
 =?us-ascii?Q?yexg+HUhKrSK6SqXSRTPiBnIQ4Y23i9uopB1AZ9BEw2g4OTBdH4ntJ/LU17O?=
 =?us-ascii?Q?3xkSiiYx1viU0bFmVEIR9/jKJ/aiXKDfDOxZq9WZzDMxlz5V/wTzDA2pQEBz?=
 =?us-ascii?Q?88QfGlnwJQedXipGeVtE4B+xzy58VTSnm67+ILYFg6XiNhMDgtvC/cBR4vJg?=
 =?us-ascii?Q?8v/CN7tX7giCwebIv+2eXBeFFcAJ8eP4kzjtLs9pztiHa3DoJ2EeryKMyTST?=
 =?us-ascii?Q?tFu6W29AapFsA+RYZXaQnRAR8ktRujtT/zYcVYncVRo55SyNojf7nioBkuvq?=
 =?us-ascii?Q?WNTZFhfc2xMMtwzNzyTEGGCXxkKedRw+seS5m2tEW/yE3AqYeL5s2K0BRLnh?=
 =?us-ascii?Q?D5Uzg60Wzi3Ti9bM/Lr4L9Y3CEdrpqgMp+nS1F21KDhRStLN0QuUylspvYj2?=
 =?us-ascii?Q?pxljPBf1vxwKsYu6mNvMSO6g46xSMjMwuapzdcjM8QgYd5B6GfVU69u8EPtl?=
 =?us-ascii?Q?qHVsAyuabyqt6IjBW5pfqTTqih0PkZLPlXx3JUqrW7u2bnRZGOC7PYW66V7G?=
 =?us-ascii?Q?7b0cEu/Se3sfp6b7N22XthxauMU/h2qIC06qiWG6nHdd3iZpjk61Y2LwhVz/?=
 =?us-ascii?Q?g1v9isarsIXHPObm6h04Dh+q0KTnzMU/zT3hGEn9o6ZTGI7a5Lqqqcgpoun3?=
 =?us-ascii?Q?edFHcQx/PnefgU2tXlkdaFY7ZUeN0xbNw7eqvTgqYzKk3OebhlqYBJHD3R1x?=
 =?us-ascii?Q?Wg96VjH5GlmpAdlwu+6YHEKLZObjDlQ1MDhitK2m00Vi1ExzdAD+Oc0xTh5U?=
 =?us-ascii?Q?uiWxMZPp48ZefgD04F+ipbSdge4nevMmJdDV0yN09vUYoe1dsqnJx+t4GNsK?=
 =?us-ascii?Q?3Ct/W8gBA8XAPI1sj97UpCf/B4OlGfui1o7El/+y1ql6XygymiuxXEwsBZUP?=
 =?us-ascii?Q?Dj1yGTK1F5H/XoyzRe50XkjhRUG1vGcC/chBvKNE6CP3ZFwBRDRtGMQyy9F+?=
 =?us-ascii?Q?WuYgUrdZqV6V74L/Q9AHhSxwwyvXW74+OHl00dKfVQCtGS2Q3xvXpeNtKQCd?=
 =?us-ascii?Q?E1dMPtb+2YyW5ecw9Hmq+wwaxcsVIaDBTDTxUQeOS58yfx/c7ZP7p+DpAmyT?=
 =?us-ascii?Q?VPfQ3OIulWVVWa4TISzjJwpIaVzgZyEiu0g59mR/zcn6S9TisSszbFBV4LAP?=
 =?us-ascii?Q?LeNQnxwApj6nZLsGPnc8kCcmpXdXyl35DC6X/ijf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a089da2-04f8-47bc-95dd-08db316f8e3a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 22:39:00.3047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l39T7Sy2aqoprROsFQhwkUaxXbbIrXU5o1oMXgmzsYzwAzrhypIsByaWrfl7S1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5018
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
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 01:17:03AM +0000, Tian, Kevin wrote:

> In nesting series we'll have a GET_INFO ioctl per dev_id. It could be
> extended to report group_id too.

I like the GET_INFO because it would work with VDPA, is it possible?

Jason
