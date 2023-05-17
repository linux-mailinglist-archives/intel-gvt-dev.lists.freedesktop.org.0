Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6F70709D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 May 2023 20:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2A310E22E;
	Wed, 17 May 2023 18:20:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F8710E222;
 Wed, 17 May 2023 18:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcfeGNV1HOEWf81BPAYkoO1yw34/ddfJp20TEjWfKI5aLw99oKlkHSiQYXX/OQRmJ7vTdimHh2U0+rAT3VutPAcfq5EZ/b4YLpH81CzRWMrkaO1Yhte1OjXKhz+jsql4gtOcCoQnWlrLIhu4ymv1lXr7p5QKsBef2f2XaroN8WN20S1krE4z2BYSjoW6KO4QPHPGU3CnfWezgSCM9TJL6QJyxLGq3yLybiqY2HLPrlBNrD4R9bgwQPImiM0GJLvZ5lUHK/+6pPpODI31v+O9Ji1s0A54mKb65y/Sstwp9lIlwutjvmd3Nkcjt1Bs+7NeSONpeGfGWmd1a52Aen+LOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxVeClIdmiks7Jxm2mrbqRr7zFAMl4cbiKEl98+oFOE=;
 b=bW7q4J9RCTF8bIYklA0bWujxEMxQvIxWvgzOYj/yE3z+2+Vnqe+XfTbb8BY9qyM5RYoBIcTq2FDK1qd7ICn7E3LRUcQB3LiGFMFenzMumve3iUCPYtvnJx3LOtTzn1NtkvphajqiohPOJqkNSMiURUMPgSohdHp6mHzjfm/FDOSCUmgaat1KastAW0nRoMNPWXovNYtn2d8wo7lRvIgyLldyVlcO9oTUePu8hBgmcOm9LKcZFqQ2ysYjvv7NNS4tC+CbdqSPXxkjqlnqj3lkxFxgelJmoQuijaAiycGEwr1PcxyDmWsXMkAr2aN1v3mUzkECQh8yE7UFASyDVIljJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVeClIdmiks7Jxm2mrbqRr7zFAMl4cbiKEl98+oFOE=;
 b=j01v7KkmIIdYbB2LAaAYvtRp3+QrLgoRmRs1mJmwBxlwV8Nvq8SWXi/QgF4CPmzkNxh3zAMz1B3/miAjQrS0vQ5LS8qDAkNlOAj2b40ksvHmjCiZs4DEQpOHrSCldWnBBoRuLdCVG6ceGXWRIpg/8o693EI1ugN+J6Oh95Y1YEHtMoBMfr/eHQBzffVsNRGQ7uNQoFRHrbLWAqK3oaPu4bKEGXhf8cF8Ppvx5/p+mmxGvEs8JCFioB6RBeePLKDSNgGIkuW44/HB1oF6RmWER4C2Ois5G7tRiUbgpD5/FPGXf+MeHDPHBvcUc2S/Y3df9wcnNUyNvfbY3i6CIenIDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 18:20:54 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 18:20:53 +0000
Date: Wed, 17 May 2023 15:20:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 01/10] vfio-iommufd: Create iommufd_access for noiommu
 devices
Message-ID: <ZGUbAzl985p5kX1Z@nvidia.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-2-yi.l.liu@intel.com>
 <20230517112609.78a3e916.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517112609.78a3e916.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 5263794e-5524-4193-ef47-08db5703732f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sc4PJQqFdhYAGL22AYcIZ19vPLLM8Rm/1zSgHHjRM8DUa//Jtvk5LY199OCytqaH/KUg7TxTw+H50sGD8RpPbKS3beZjHKzZs/PBPJniHYrAe4mjSQifRtMh+G05uPVKK0kC9tBjOKl8j7LiEEjlQGSE1ywDlyGhrk07Q3TpRt2K2RebTah77kSt5EAAzQvwarMQHQ/3Cf27AxBgSj6hUnOnp5MSfJS9bDxlcBIy68fmNt4sx6+dw+rIbQMxOK3HPG9bvLdSAM5/dMwvb6SpI6eBdTSCkSw0XzyKaKyYQFsZLFJQqSTreYO1F6gKvr3VV3Nm3yFXzRlsCNgIszX+7hV+TexpsNR2WSIoYXzs5SEOfTdWvzAr+iKAl7RnWlb70f0DFh9WGQcUhfS2B4HCPs0tyKl4kNVfJcQFtqrR+ew6iYdBGQgaWW7L5aI/bByt0f9iv/pXqrq8TQlIUha6aPzlDZmGBr/g0oG0PbYWJC0BBKl2+GnOiXEBUE9RU6gRfEKgmvOKmOb8wCRI8zC9D5oCxjsuvCLY4qFadPtBRKsQQz6ZzP6BWmMM36M2C3Wp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(38100700002)(83380400001)(6512007)(6506007)(26005)(2616005)(186003)(36756003)(6486002)(41300700001)(66476007)(66556008)(316002)(66946007)(4326008)(6916009)(86362001)(8936002)(8676002)(2906002)(7416002)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S2qpJkVsEIU8JH6/AkY9Jvm2MlSDEEcIBuXTEjEJd3amPQcw4TPBTTiI54nO?=
 =?us-ascii?Q?DZR2/KD1fWgj1yt5UPto0CEglhjpXylVr2McVF7HHCiLK9Do98CJGSc0MbNx?=
 =?us-ascii?Q?002QNlmzIsS0tFcs5oUzJIAZnWXMPn0/W+2vo3I2TKftVbGTGTJ/1w/owP3B?=
 =?us-ascii?Q?8YS6iTa/5PSjJM2rJfwiAZBRYPoj4RYUZiW/i5p0oPtxpokgWIM5Cm6rwR8W?=
 =?us-ascii?Q?08B2kVLHhiaeDlc80peh69kFSu7o8i29owiuB6sOugIbd6vj7UrViTpDgCWm?=
 =?us-ascii?Q?3G/boMZSFAYlPn1o6cWm1UTBv6ai0MkYompF0XxYWLLJBH7i8W28tR554/W9?=
 =?us-ascii?Q?ki3uWglg6oTwrFw+ynsTwecXtniXN8ZxuXZSJwD1Xy9SiOtj9Ez/fpEhQ4qI?=
 =?us-ascii?Q?j8yTAPyxd3hl7Yni7t7y1p4oVSgnNgry5SAE5pyV3QN+T7cjHpiFuBgGCbL9?=
 =?us-ascii?Q?yCnO0qO2JppFhKq/W14Am4Oz0j9wOXGApwyIbZy//zqItdSay7TASErSIqxR?=
 =?us-ascii?Q?n3RCV2A0FFxXh9PAtijFt7ms4+SsJc8qgrtGVKV3gEU061Nq5EDmiPz1Pywy?=
 =?us-ascii?Q?R47Q7+YT/k9ZEIN/eFu/gbaYk+/dNzpbqcUlqNEMnyEGT8JLnDf/w8jFQdr+?=
 =?us-ascii?Q?C3TnhDjRD9y6Z3d2fcOUrUfmokID3JEKxyEZXE+QaUhazcNJnFIrUKAWXM9J?=
 =?us-ascii?Q?cEkwaT0Wy69aYJgh6AdQrQisV/ly5GlNxUbt18/XWHKaUEHFNeW5HoTtzUuJ?=
 =?us-ascii?Q?Du+X1lx04+4dduPkOzVfq2JEM322ogx5K+hhsJxBJ4I0MOIg1JUy+xmq2Fvb?=
 =?us-ascii?Q?AB15A/AWsJo+eoG/jjrHXNt0DjNPhKGl8k5dl3792nYbVQxh5K7LqqY2SyO8?=
 =?us-ascii?Q?oX57Yd3Nf+F6/eaE/8a7wndeaLBqR7a84JIUfa178sNLPqo/6QMUsk0Qs6wm?=
 =?us-ascii?Q?Xn41kKna6LszbW7ZWR59AlGr68SgvLJQ9JbI3gQeQFqlNaRTotS7JoMjjAJ0?=
 =?us-ascii?Q?Z25S2vu5dCOuRuhOZ4uEAkbfip7r7DBYlwjnk0VCMSgVF4MavDxvztZ3s400?=
 =?us-ascii?Q?n7VoWOVytx9X9qDnbkZh2mB9CvISvOVQwNC+Xj5C3inrlqg55PY8msKkWbDp?=
 =?us-ascii?Q?uhnrVzab8+6Vf/Vn0J1wLh8cuk7hOFkrgC0a4WpOBHHWmf46mn+ZVkYVfRJH?=
 =?us-ascii?Q?iQ8sJYqOKSd7PJvHrXhJQHw/VQG/8rFywXUOWnG0vwg9yb26Rg9k954Z5ziU?=
 =?us-ascii?Q?nKKWgQUr5Hh7RqoBYWosijV9xfrrbuPQOpNHrp0fSeJrlPyxGdB4aHQE9MnQ?=
 =?us-ascii?Q?z1QyCudXnn0GL+i69EpjJMLOTyqfwoFhEvNFzbpOOYdrcWMSF5xfjOYBh5Lt?=
 =?us-ascii?Q?+7oMCPJqZsnlUzkzQ7VMnISgRsEh7UF1r3IGRMBhwOeun45rQ8B9MCh2Xpj1?=
 =?us-ascii?Q?pl5zoWxatnnDh6OFNMKkNxNSFXAGg/tjLJUSU+zbN6RxEPX89KDBH3dE9New?=
 =?us-ascii?Q?DKyRw7g+BxHWC55Qsvyhw44Wzfj59FwQjRlRcaaPi2u9i2jmoR4OjmwS4+U/?=
 =?us-ascii?Q?B1tLs9fEuj9OVoqEAVzPASny2EXaz8Bwh75H7HDA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5263794e-5524-4193-ef47-08db5703732f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:20:53.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sU/eby+A4+vSPueax37/Jc7kjh0UY2vvuBF0hMLr+BzOsGoHkh9676cYIurfLy6o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308
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

On Wed, May 17, 2023 at 11:26:09AM -0600, Alex Williamson wrote:

> It's not clear to me why we need a separate iommufd_access for
> noiommu.

The point was to allocate an ID for the device so we can use that ID
with the other interfaces in all cases.

Otherwise it is a too weird special case that is probably going to
keep causing trouble down the road...

Jason
