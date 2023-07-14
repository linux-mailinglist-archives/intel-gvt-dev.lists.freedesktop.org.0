Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6765A753C33
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Jul 2023 15:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457F010E893;
	Fri, 14 Jul 2023 13:54:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E6810E8A5;
 Fri, 14 Jul 2023 13:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3ok9ggniryzzZ7550kCRZ9n6MNSgeXV9YN9SfGaZW4INy/B8d2qhxYj2h+jnPnI261sjcJHHtpn6uNtbEijw300I+Xp8A/y/3ogXxys1NEqTdH4prjZddSIAqWXqxmtfjNX/fcFCfXZzLlDNBZ9h1R84FqlL1lKujUEiqt1rsaRi4Apqua6fRWAuGxWgSfgbyqjYhtVwBUikUZ4SNnZBs3CezvsocqzBR9idRc3bE0sty9Q03j3eBthgxVl/ftKvIT5NSo5dCXVq1pEzV34QjWgknj4can/9fK9f/jn0fJpuTQQxl2FI6VbmZ4tEz1g5rEBjlBoLBoly1Exf2RjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gqb50EHWAGRmgRFt2JDtV2SypNuuEhlXwgK53htImL0=;
 b=gZqjqialXdP5oHzIf91oklCTBXcS5GRs+o2axvjiAg/jISwEbRFo9I4ZgBfUrHGrdNTfEyYXzeCIBV1ksgskBn2e/SAuPvCSB3u8f7lNPTP0UtqDLxbmlTQ7YWRsG2t37K9Pfq8ITAyv/3v1XUvyi/ZkHBBTSgvPA1085CyHaJIES0EgQve2VD+M05ICFQtmukYq5C4EXno93Zs7esEFuyPTQKwPBNIp/0AEXbPcTI9s9vEoAm/pxkWiyW93GrtQ0tP8uu94CXXDnkpSZ3tZDvIA5fjpsD9GEnXWA3TJ0XX92UKCDgsGPrWTKweqk+MXV958hdJQK+SCZKk8PeZHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gqb50EHWAGRmgRFt2JDtV2SypNuuEhlXwgK53htImL0=;
 b=Zp07h30tsmLJOE80yNok6hQSVPMZmsg1rPEk3czk8cPJZ3H+9C+ZXlHVLa3bOzhMxxnqErWdbBIJkyNfFu9pSpmgJL8TiunlLeNMrDVAKEbUv9Wu//9b1EZ4b/ZJZAxi1M0143OXVvuo92aCNmqdluxBpKKZIS8LJw3XZqhwf0bOxsiCPLde7C4QUqMEipB17GpIxEbyp9Y46Llh4qqze292vzHHjzqHi3jXx+O8Lwhq1ywYReMQbOLzv/GncuBYUghxL7kYd9y+gHWQhzhjpxp8Q8kYqs04KkN6W/XE/68xmAfx8SLo1Y+xFgqySY6rmzyRkik6Sva3/HtP64HVuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:54:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::69c1:5d87:c73c:cc55]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::69c1:5d87:c73c:cc55%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 13:54:25 +0000
Date: Fri, 14 Jul 2023 10:54:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v14 14/26] iommufd/device: Add iommufd_access_detach() API
Message-ID: <ZLFTjkT7Ew4kYzFQ@nvidia.com>
References: <20230711025928.6438-1-yi.l.liu@intel.com>
 <20230711025928.6438-15-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711025928.6438-15-yi.l.liu@intel.com>
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: a591872a-f303-4a55-6da4-08db8471d5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EuBRKV9qw6XhE3e8XLnsANIsa+cpOioRcSCdNb6FNEfmZdqu7CWGleLCU1jG4p0TaSnbod8SxlxYIM9zaU1bWTntSb/FjYGCmZG7HDMcQblYaBN95TsM5BahoQbWLxFGDsKE3MaRPiGqeChpNYto4iH+2hJgqJeUZTAWJURjSGCGrOT/14tizOlPmPSNqOKf/M92IALVUvQJkmOImLL9CK+IdcgrwmkT+XchP1+dd56OMh+6bDXyzVZjMzCJrWkQd9p0/sOuGWv2bu4n3ly33vUxuEnVcopd9GFGUq6flAIeDBkseGbbGg/2sZNXCJMJfy06WFVPHXPEL1xcuwBQgKSN275AUYQ/Rvz/1pOKQjW6g90hngo8lcObmBLQJkPy70qRYmPdmJdoHNec8TWpxQH+F2mWGAvwKYG9ZYh+Vveoy7IEXShNA98Ryp8fYTCqsCBCRF/6o3JtqOaHTf5yZfU8+hE4qvjJB9m6WGMv3Mu9THLOv3IgSJESvF0fi0+rHp10udXpHwcTzvGlvcHlzvBl9Bc2e0uAipZbraGQ2aYxIqGxXBnnGThvcbxl4nMc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(6486002)(478600001)(6666004)(83380400001)(2616005)(36756003)(86362001)(2906002)(26005)(186003)(6506007)(6512007)(316002)(38100700002)(66556008)(66476007)(6916009)(4326008)(41300700001)(8936002)(8676002)(5660300002)(7416002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d6pQAjJWAHZscaLWdLCsw/bnBM1yWh3NcicMSb+qgL0j3kx4cdKB6XaB/hdM?=
 =?us-ascii?Q?IdZctD6WNPlfo8sc/FreaSkL1tMUTNNpHrywLDOqbrsgDm5yfVA8NMQmJWqe?=
 =?us-ascii?Q?VRqOAT+PQRlR1X+gvlIjB9U8yCzNXyH6Av62ddQY14Ga785xhS4NCgPRrDTQ?=
 =?us-ascii?Q?01KukQvS5J0eWqC1hbujml+m/5Aix3uAQaonrw78ttS5TwukYosBW4QwDFSB?=
 =?us-ascii?Q?qU5WTG/8rWRcWa3sG2+NrMaelBAJkP6Vqum0+vhkuQQ3pIfC1gS80zVQ1pXt?=
 =?us-ascii?Q?GgWMa/o5X2/f5hysI2ZOKKiEdQ+DnP+Chvdn4p1hDVdw+TaCZMfLY5u50we3?=
 =?us-ascii?Q?y5YbDkga7S5WjoSu8RrtSXcgNpdUt+6dVonjhsBOknu3jQpknqH6fZMaIJi3?=
 =?us-ascii?Q?GHiJJNbQMVI94+uk03G1wTW6e2phwG18QsklRUFolwTtGIpj4/e3EQ6+QEMZ?=
 =?us-ascii?Q?Wyht9ShZbsVR+maQkljyC9jzsR5HGwgpg+qJSeEm8SEPxohMwc3AgFbF6+4a?=
 =?us-ascii?Q?wBSbmUzxPRlTVPB4UtyT1xEre6+q8oxTYlGE6Thv4ocM19zrxT/84qInT23S?=
 =?us-ascii?Q?KzpPpbmzTUHzC7n78RpcK+9nEvwvPL1pleup3G19geROhcb67gehjSxDYnIE?=
 =?us-ascii?Q?aRuLHe+TLqamgcCcg/aDJiczAJKisT11qFag003LpUbdjWiF/zXxQUpMEs7A?=
 =?us-ascii?Q?E56c5109gSgHVTMHf+uZaan60O1RoWrkJww/5ozaFMu4HOmiPcYp1iY6PBeq?=
 =?us-ascii?Q?ajkrvil4Oggh+6iO4V+t9LTdiJ2jpua5XTCcIcZP6OrP1xGCREApUIY6kzgm?=
 =?us-ascii?Q?DEK93uUmJHuqcMu7RdTyxKX1Qfl9/PDBSq2EcFE7Qqvbd3D/d9cGQPOclG1/?=
 =?us-ascii?Q?Tipx/SYVU+abCMhvCRXyOgFyP1yaRDt445DAdGVH+ZXuJd4LLkBHFnZ+FWkI?=
 =?us-ascii?Q?alCTBHs9P55CzUa9gRZp8HH4chexEq0bz5q2exIfK/tin+hB0UFYAh2Z4S+s?=
 =?us-ascii?Q?Y3x47H5F2BlAydz9JYEgNNnygRZS5L6xjt58sUAhEP7xdxxi35AI1DMqjkqJ?=
 =?us-ascii?Q?V/srPciMey1dPobzNrD5sNS3JgYzRQoaB7+qzCAbRGDqE6EmErzvSagxf2Ma?=
 =?us-ascii?Q?rd1AbPDzpAN+bcjbKppW7eVKMqKd3+rw+t6TTHYe2eUO0AZxhXhdFCZgh/kN?=
 =?us-ascii?Q?iZCtlx0xl0GVfPY2YCEBF2ylKy4rz0yAfZNme8xAqIjtxBESIA1jtRD3cnUM?=
 =?us-ascii?Q?v3xvK4G+zAj/alrMmH1rR9WvgUie6u72z2/R/nFjg3hxHW+bn0EL4lvcFH4Z?=
 =?us-ascii?Q?DEa9DDbeZE6J3GK5U62a2VcuhIuhvmH9AetSyamMpNhp+WivxYjUBjLoBv1a?=
 =?us-ascii?Q?nZNJQkBSiXfWt8yd/2SIg/4CWKNMbwidHQ3f+yHhkRacNtMNV7mqzWDzVwqR?=
 =?us-ascii?Q?7Ptll3GIMGmTDqPbRCEir9DxnFkYLEsp+r/kAqKY/w/s10y5jP6xiRqkdugd?=
 =?us-ascii?Q?FIlWUe7aaXzbKCl832QQr20eTGomTTuyWRRNEZ6LObnmc7Stg/2IDKy7LDqQ?=
 =?us-ascii?Q?vizhZvk22k4gExFMyK8ab4JWd90HvYtZfxvszdGs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a591872a-f303-4a55-6da4-08db8471d5b9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 13:54:25.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vn9g8bo417IPLvOI5xl83lPj9JJBHcxFdWZOIzUWlqutqMF1rmjx0huymNz+oCKZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104
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

On Mon, Jul 10, 2023 at 07:59:16PM -0700, Yi Liu wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Previously, the detach routine is only done by the destroy(). And it was
> called by vfio_iommufd_emulated_unbind() when the device runs close(), so
> all the mappings in iopt were cleaned in that setup, when the call trace
> reaches this detach() routine.
> 
> Now, there's a need of a detach uAPI, meaning that it does not only need
> a new iommufd_access_detach() API, but also requires access->ops->unmap()
> call as a cleanup. So add one.
> 
> However, leaving that unprotected can introduce some potential of a race
> condition during the pin_/unpin_pages() call, where access->ioas->iopt is
> getting referenced. So, add an ioas_lock to protect the context of iopt
> referencings.
> 
> Also, to allow the iommufd_access_unpin_pages() callback to happen via
> this unmap() call, add an ioas_unpin pointer, so the unpin routine won't
> be affected by the "access->ioas = NULL" trick.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/iommu/iommufd/device.c          | 74 +++++++++++++++++++++++--
>  drivers/iommu/iommufd/iommufd_private.h |  2 +
>  include/linux/iommufd.h                 |  1 +
>  3 files changed, 72 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
