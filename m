Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A6753E92
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Jul 2023 17:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9677F10E8B1;
	Fri, 14 Jul 2023 15:15:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FEB10E8B0;
 Fri, 14 Jul 2023 15:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0z23b3vjmcHzVnT77w9Mt88VtNF1Gf1vT4GJSj0gmvNPLb/oN2Jgh1jcLIGX1vnFkD00PL90NQqAvK8Tlzom31BJksCcu1u4wm6My/7ZGaWi5rf3Ie0Mr3JAYkXt9FkujDG552L0pegmrN/e2nyT/OMoBbJptt+8fcBbwFYY8FiHlNpo5f2WfPjAyWzf4Sq3QMod6aTFnJE167KTcMCZwe0tX8sM2S+PR0fwKNpbUd83ZOQvqXZwcYgR9J+SKbtkXwfSpBRv/h8HWmYkDHN/98DkFv682E0U6Q1HGofrE8cD+IPb3Dx7drp1mincGTxOf29UJ8/JZB8c+qqi+TEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG2CDZxFP+GZKp1g14IF4/etBLecPU9XcI88rHjt1RM=;
 b=hDRK2+EjFHSlvlCNYAxeO6vkS/UXU7cxEmmMIfPcpedPoYlTfP1pG2RwlfoBzhsjK/nBJMNHXNC4QxJlTPjsIIWlrmyTS4A/V+rFfU8COmfhFiQLv/39NEFODMHrGrwP1w8oxiO2QWFRf9c97YOVFJVLN3pOh6b7Xf4JSoqxgea6lc4QIiQ5+n/HEOnJuAdFU/IthgYgzaa0H4UEEFA6aTxgmRwq8zTyhSmyhRpBCexL9lOAC9sRscafs7tjNxcZcM3SzZh8baM1nEM05G8bpjuUkPLC/v/ZZAkDhEGQwEvPaOIakxchdQQFlZ416wzrgcd26Bh56DcS7s9Zaq/7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG2CDZxFP+GZKp1g14IF4/etBLecPU9XcI88rHjt1RM=;
 b=BhjSRdeexkeMKe0NOHbVdE3xweo4Z5tFKRxrq1Ofni0nnec86qVcoJlLS1i5DDD+bPpBAmjcXCYLsLiSQas3WR1/fBm+WV2nveZ49IkKSr3fOhU5vS7UNZ9n8UWn3SuXUgKYlCMckmqkHUmTMiudLJSGO9POyAdNuRn2bhCFpIYoD6WsPuiIDfAF40+n9mVY40IDgJ0tyydMI3Do4LVcNCA1+IDSXKqcpyXMnHIkEYrO4cXqpOfXBsAnrfH91YYy8xqeq3sPnZDoAuy2SnugDY/pPjvIdcl08lNlKdJQE/LLIOA0rcgeJxXpGfdOY6wTojOtkSynrOyJlLq1zgwTLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:15:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::69c1:5d87:c73c:cc55]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::69c1:5d87:c73c:cc55%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 15:15:02 +0000
Date: Fri, 14 Jul 2023 12:14:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v14 24/26] vfio: Move the IOMMU_CAP_CACHE_COHERENCY check
 in __vfio_register_dev()
Message-ID: <ZLFmc3ZXlbE3mw9v@nvidia.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
 <20230711025928.6438-25-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711025928.6438-25-yi.l.liu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 9802c1c2-1e4a-43ee-f71f-08db847d1870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vsLKF//5ASr02wdPy4T/XkmGF0gvAZJX/Kl0p56z2CS2zeI8rKLkeCtPrchCjAK34J8fObKpQ3bALVf4wWs1ly2knc7BCG0rjsJxH2Ohldbc1T7QFGtu715E4Iw/bfTTowKppXSSAa7m/FJf4mM6rLjgo/q+/UnStnkX+bD7iAhjEu6auG2Be67t/T1MjRTw1OVPX9MEAA79vDzqDTGk81T1bYWe80Q4haZIiBi3j8SnE41TJgEw3PeXtPWadntXErAe3GY38i9iPjbU5WaM8iA/hA4tLiJBj5ohv5M7qQbkNAy9nN9fhHiWYSUi1Pd1jQSphMTdPh77XYgMoL93xg4f1dcuETahhrf5monhcHExdJHuVT6eDT1JyhsiWftHz5u2EC9d6DA/N5XHv7A4eJQzLqsnFjoKHR0h8UxaYuaVad6STahgCZkLwwE4VJpuNeergxE5ug0JT/fNn6MYDPvIiZICGB4wSwj5VDU0xvEcZ1513qRWoR4yeRe6AocyUacLv3XTUHY8rSbK5o+O+z9lMn6uQZu101JpfwKx2+/bifvVsLPCJn7obu2H8xEJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(2906002)(38100700002)(6512007)(83380400001)(186003)(2616005)(26005)(6506007)(5660300002)(86362001)(8676002)(4744005)(36756003)(7416002)(8936002)(6486002)(6666004)(41300700001)(66946007)(66556008)(6916009)(66476007)(316002)(4326008)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kk4P/IN3GdIredgP/+i1tpnILIILqpZ6Mh/KlgavOcXthYi6/QXJWR4mvIal?=
 =?us-ascii?Q?yIcj4Ln0ei6o5pciYeqadhQoAROwnmZ8zlZgVyPCf0pYpmBNCYMYrWMlgplt?=
 =?us-ascii?Q?2qT/ZVqsl8KR9vrYREdTydnKXLf6jkjqveDHqDkoIKNc7LWGwBny/Kz2Xs8j?=
 =?us-ascii?Q?+6wh0u9JmtkfczhjbDR1VIoK90Be1tqNx6HyPyTq5ECICKnyxOdo5GenIHah?=
 =?us-ascii?Q?60avGziT7/0BjpO+dd7BAp516vef69qwa1dBcCJlct8eev4C4KzDjRkdH5/R?=
 =?us-ascii?Q?dOe8YMmSiUeAEwrCgaK7QrGy35Ug5UJrUezFC7+coATGt3t5ymS6GeJyhHCM?=
 =?us-ascii?Q?Wpjbfhu5d+TaUHF3YOkBIqET2coEGFEo3pkb7TTjNTWSJfxYIgN08uVw8Dax?=
 =?us-ascii?Q?/BQp9vnibMgAtfgZ++qk6aLAGFeS5ZanwX/YaYEkWo6X7Iz8leSM0N1VGT9x?=
 =?us-ascii?Q?NlDymtVSFuhbeopTBtwmZ1LpZHnKmY8BP//9YoGBbhlOo9tOklhTudrOeAJq?=
 =?us-ascii?Q?GsS93H2QmAEvvt09gsDK8HDyAig1P72BKbHdx3TjCX5ky/p8jDQNElQK02J+?=
 =?us-ascii?Q?fM30ApD3RUg4HKq+kJ5+7O9auw3kxCd3vcs72D0rYer5iI2AR3tT7v8d9rDb?=
 =?us-ascii?Q?wjevMTv11dTptrXF6A9joZazxwwnpz9Gar+nXNvAJAqThVoKm/K7JjgbMoQX?=
 =?us-ascii?Q?J9uPlFb4KZ/ILa9sgMhq0h9UHgqz5FSA8WH94ik4wG7VidmSrseXwxlJ03KJ?=
 =?us-ascii?Q?PgVPqsf/utTb2iDKV2V18nu9k1ij7b+niVJHRjcTRw4NY5CjivppgqmGC86D?=
 =?us-ascii?Q?v6H6TONBpJ+ibep4xrp6z+SoL55LpnZtwDmNkDVg0FCyyak7eFNPrtqijtmg?=
 =?us-ascii?Q?1pN/XmgEPr8I10JNEtxGEYvtgUNQf2K3/xfaXT7cZJoCksYTexiYBgxGIEVz?=
 =?us-ascii?Q?gUqEP7h3mYuFzGclSfc84HwCoW4AXBn/6lful91PszuJA+osJ/r5umHO+1tG?=
 =?us-ascii?Q?ULHB4II70ilbjtuuYS3YhddYICp6k7Iy1Wzc0/JxVaJgp6Rurm+QK70dmta2?=
 =?us-ascii?Q?PjNkbZcbaAojDiBClM7I56W/XjFhVZ8Y46XaRVokAJjxZam+dzwAC2neQVLu?=
 =?us-ascii?Q?BVoTZXN9cHmKzqOXRe05Re+gDUXyvSSjRmYuzjQlP7SCTcPY6WLA+yRXQo8L?=
 =?us-ascii?Q?mx2L/jFKpwYpbgdTWjPjRrD9a+Fo7pci9KXJEz7rHkSFQDW1PTODlUez0FTN?=
 =?us-ascii?Q?y/t3p5lDbkRftp58aU69tuULaHQdgfJl10NOg+GBrit1uxzsziUWMJSvAsRQ?=
 =?us-ascii?Q?gLE/4PzaXUaDBUdHpkb2PyaZum+PR2Z6D5Ya2NajYw5mJy+cdlf6DY5+NoXA?=
 =?us-ascii?Q?PVALteBn4hLFbwcLF6g8HrHhNILTz8EDe3CfpeQR2cd1ruCeaM1iCz0qkcaK?=
 =?us-ascii?Q?qeVWV2jrpW2aTN2W2YHaA4MhL6d977gBn1f4h7LCfSmo2ybsTjTGK9WWYfGR?=
 =?us-ascii?Q?gApfDaE9qYORmFAyqj6Eezg/72k2tNP7kGBROA5Iqc+duqGMJyyMXbGJqANk?=
 =?us-ascii?Q?6puS5rRKwn5U/CF5RtUwRsyC4sv6Bo4buKioQF98?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9802c1c2-1e4a-43ee-f71f-08db847d1870
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:15:02.1209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t45ls7ntm5aq3FQr4o4fBdtAcl4iz2somt1Eb6J3jtANT4K0nBb1KPbKqZVonQLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
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

On Mon, Jul 10, 2023 at 07:59:26PM -0700, Yi Liu wrote:
> The IOMMU_CAP_CACHE_COHERENCY check only applies to the physical devices
> that are IOMMU-backed. But it is now in the group code. If want to compile
> vfio_group infrastructure out, this check needs to be moved out of the group
> code.
> 
> Another reason for this change is to fail the device registration for the
> physical devices that do not have IOMMU if the group code is not compiled
> as the cdev interface does not support such devices.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c     | 10 ----------
>  drivers/vfio/vfio_main.c | 11 +++++++++++
>  2 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
