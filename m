Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C25087DF
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 14:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B685010E5FF;
	Wed, 20 Apr 2022 12:13:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08B10E5B7;
 Wed, 20 Apr 2022 12:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjcc29Wu20BXnwsgrlLDOA03e8aiKxWk4e/+Ozhpua8KodnrGwSJV3S4dVwc9cJABEtuVjgYmEbe+xIb49Q6b3AGO8ljsIHE1Bvuo+a5NJ5hw19gd9oG57Lio6IGOZs7NmD++GhJBQDk86a/awm/sB/uRa4I2Su2+b6PMZkyN4bwVF2q4MAK1jocbLMhqhduMDBPBUblvf+83g1MPmhU1VnxjrngQbghmeRh33/DP5xQVOs9pt0/J5nbAHtzu0bb4llvOFhHSSC5cn9RDeJsuF/5rRaXxpJLecPDD7GoevKvXpq2C0zr+743pOcvT6pdJeW+GKkdhlgI09Ngk+83jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99Ffpdr51O5h2TGJK+qEA26+OrhoSWzrsgpMnOXmNaU=;
 b=F4peTedTHS0QyOXVfbMAzvQw2TebLKna3VLwiSIGQEtIw5y7AlZBIwNmWfmscnx5LXfmdMbhEdGf/ylfxlBSZF67S7Vm0hzABvaWBZhhj/VtKKhuq2V2uODDpAiV3rw5aA0PtBaH+mzt+s1VnrKSkl4s2jpFbf7kv0loG0zeuLxcioUGx0ruD//kkq0iZuTAgF0YHqo28SL+9DgL0wZaRtELNhqmT1vubr/ZQdnYOM1bHdyAGFG1BGmxTbkBm7dClc7jxvIPi71uzGs1xLx75nqojUk6pjfQQcx2xEPR4NDE5HZo/gGyslVUQYKfgoLx4bYnhJ47VRXeq7LsfaMuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99Ffpdr51O5h2TGJK+qEA26+OrhoSWzrsgpMnOXmNaU=;
 b=VppTa2Pv1zXW2NisbH0Ti5gkdXB/rGjzTKYtCXwb8JVmerQSv9+QQYGjHAVPJNI0fWPN2h5x+NetkOnjevmChDTdkQYmWYKlHOecpF7u8auLKfFGW2LkTJC5nNDHhFj0Q28wFiqlGWOYHhLL9mHv/ueVSI80qZfrwSQd1/U6DpiK861Cc6DmMNaczi7LbfJf3MuQHNGgDXW3rhtZXi4qVfvlznd9a3wTHSCl083QywzWCKcn2eaHcr7mspsQH4oWMW5EVF2K1xOl2zkZgSSZX2sSmvqkI1xPomsi+2cJ0DsN3Vs2DbEOJhGJJ62GK0KpiNOINzKHJEjOEQCBC9pUBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN9PR12MB5228.namprd12.prod.outlook.com (2603:10b6:408:101::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 12:13:19 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 12:13:19 +0000
Date: Wed, 20 Apr 2022 09:13:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20220420121317.GV2120790@nvidia.com>
References: <18c3c1b1-6f78-6140-4ec8-e18bc7916352@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c3c1b1-6f78-6140-4ec8-e18bc7916352@intel.com>
X-ClientProxiedBy: MN2PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:208:160::35) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6008aef4-f6b8-40bf-9509-08da22c727e4
X-MS-TrafficTypeDiagnostic: BN9PR12MB5228:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB522864A70FA68EB9EB98542AC2F59@BN9PR12MB5228.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 31OgQlASV/Egm+fWQAAqvM8NHL0eOip1trSclgQDKkGEeGz01LsloaFqsVBDgJV0GWs/wh68yYdSMgpAS2Pv+i1qmCKeG4xjUeiFe9uxaTyNFdkajuIEsGkFaxOYVFC/BoVFfP/HlaR+JU0xygDMOpTmgYS7JBM7gTF/yZ9HeaDP4Zi4lThP/TB2CFJPstc/uLGCmwBuCLTBEtxALX9TAACGQAmv8vX26p3PUhsYDhSDYZ8Q/EA/EHqbBgQddglIR0PULVPjzpZK3pv47ufhFfFf9ZvBRRSGjxb1NCheydoefqNfJ6vbL7vdmf3KrRcqpWSi3AUGq4Ls+n36DC6kmX3rjKXFRoe3V7frAGn6s6f9Zui7R35bzKgPp2gJ2wOiBcq7UKd83cufBs3gbqKsGKSWfcAPrs1UAHQL6VLbpWytTAIJQATw9cRqw331jWMmtO0vd2Hmdyj7IFswjsSc9ztLu6cUGvSHgVTz8TLrKNjsYc/6M7coHpMFv7iM+ilz9xRa7KlhQ7ecpSiPrRb26ZSrwAP5eELwkA6g/qCACkX1FDIuCkd0AkmvjEDYeVFmxA+HjAT/TLi5HUDTy6iooUTvApPBOthw7gZ7apOqOvFr5gVNam/SsPUsPldWDCYqqKplTYq2v8f24Ugb6A0xKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(33656002)(26005)(186003)(6512007)(6506007)(4744005)(6486002)(8936002)(2616005)(5660300002)(508600001)(38100700002)(66476007)(66946007)(66556008)(36756003)(83380400001)(316002)(6916009)(54906003)(8676002)(2906002)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZk9XQJz7aDHo1i9HHjqwspHg222pocVzE3SFaOfW1pihWN9//mU/gAQejTW?=
 =?us-ascii?Q?+yg05YmZyMrvr+hD5bsl+JtFej99QWBvHugwLXMRiRThQqn+Ay00tAY3knWN?=
 =?us-ascii?Q?0RSKoOQ5EQWLvySpR29HCNKdfEKVya+PnZQPEPtv1XCxowXhgIgBa8JZ9d12?=
 =?us-ascii?Q?2SzxhT1CyP0c+ZaFo8dUnpix4mm16lqbbVQtB6meHNkrBsSIqxPIlXBlofIe?=
 =?us-ascii?Q?xj/Wk/2LArFlNaQHWm7x19VsHayuL5p7a1RyhrkkaiGDwD4UN8UJ5PRD4RW5?=
 =?us-ascii?Q?pZY0FXJT2NykwYwyQEJSZ5r8kWVMa/66QVh6reCwkehQPwuXzYu0Gb06yGgK?=
 =?us-ascii?Q?66GK5rNRWqcoFpzpTQTaFXy8XnMizlueQYZpc1DtuMXpXsHKldbeA69BJYEP?=
 =?us-ascii?Q?6cqss3SafdW3v0SkZN9NvVR+X+yuh/Zra/zvF3U0BwghtQMTZNzgF0rsyJpM?=
 =?us-ascii?Q?x517Od9vZidJa1RVHdDoEYd9gPm0oX4ZYGELXqOSrtj8/9c/LUTB3pg03UXD?=
 =?us-ascii?Q?UxmEumxGGYDppJZwjdvMdpGZdYFkt5YNLtzNzRmxbH0qV/xUlHYrVkhPCT0G?=
 =?us-ascii?Q?O+VgcbAAB2bbpmDCX5hh/wkcLAOAcdBX4XmVeYMjhr/2qQte0QbAvN/AJ/Sb?=
 =?us-ascii?Q?HvdCknJK0PlFqS2LQC4bLjIf/KeIBlKVIdNsUUq3BIedHhMFHN/fEqEXNMS5?=
 =?us-ascii?Q?noO2E947BXRzdy4k7g7Tm+lp8oG7Ihm0VgzCZOzTK9ANP2n817CnXXqOXCXX?=
 =?us-ascii?Q?FAiHu7VjQ4fAK5HJqXc+WrUZBU6ch1BEuJnZGJxE3nVYrYoqSojmIWpKm8k/?=
 =?us-ascii?Q?+chwQzClb/U9Vw4Kqe0+SUGvHtMfUD8vp42GInluy8b5W/4FsfEN0QGYNbrP?=
 =?us-ascii?Q?srQgSKGTKng2teMPlVOvaMGBi7IVp0SMxxb6hlK3OlWemdNc1PmRVb6X1AHF?=
 =?us-ascii?Q?9SLetza5k74vFZrpkSWr+IcGQK6j9VJPwWqP/KNvd1b2VbYMMk9PLgiTOgDb?=
 =?us-ascii?Q?WS/rZqhTBotwyGIv82+thai1MGJGfYRIxBHCzz8ENtsOm64/TecvF0P9gEC6?=
 =?us-ascii?Q?uYFpIxzT5aGKflMz3EjFf/JYPYIeQnmZAUIRjZoxDHDPKgs+yUQRcMzEmLRH?=
 =?us-ascii?Q?zaBqTdRCrgJOvtvqKiTTT4ERH8ZjXj10uG4bwDaRxROwEgB3h3KiPe/Nt2uO?=
 =?us-ascii?Q?3kADl0dM9vngQuBSoO4OfUfX57vD4ghT+Qrkq7VJsh9nCzUB7U5ClAVII6B0?=
 =?us-ascii?Q?Ky8P9kNRC5V4UAEDcenEoCU/8mSRz4hkIWDUjw4SoWSAl9Zi4VFHBsP0yMD3?=
 =?us-ascii?Q?/Uz1zeIalnOVO4jIT5rHs//cBWHVFXeHYUPNrXLZ9b2vSlxrEXcPoq5VjXTa?=
 =?us-ascii?Q?+ZwVNnfeWcv3c6u/mHTudcohse0WDOvYQdvKnYF2ge+dgSQydAFGsJIY2RHz?=
 =?us-ascii?Q?rwpnDiHlIUyu4inRB0Hothw7tHRzxlDltavBZVULx1rLcvbi6+rsO9HRGTlZ?=
 =?us-ascii?Q?fTBMdQX/m4qJhAac3ps5gDusrrfqspEXNMh/u/FNn3CfHb9QPD9zG/pJaQ5q?=
 =?us-ascii?Q?j8SoABDkW9zOZgsOrCcucPEylnQN3dXazemKGa74JOVbwVAyxGUwdjliu1YS?=
 =?us-ascii?Q?X+a23FXHEnYknstWqni1zQy3UMPwITt88EGQtvQ8fwITC/rAo2scC2kQKUPq?=
 =?us-ascii?Q?0i7LGHyw3cRt+V0wYfIkaUx7BAFIWmrs4XfwPmtwAyFt+0hZVrTHRZ3RNOWK?=
 =?us-ascii?Q?dLRSzZyIkA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6008aef4-f6b8-40bf-9509-08da22c727e4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 12:13:19.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08k+QhO6m9vFkQkbCDNpZbmZisgIPhh+jK4u2iVqHL0Xg96h1Jg/Wti8X7RMS0k5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5228
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 08:04:31AM +0000, Wang, Zhi A wrote:
> Hi folks:
> 
> Here is the PR of gvt-next.
> 
> Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> new MDEV interfaces:
> 
> - Separating the MMIO table from GVT-g. (Zhi)
> - GVT-g re-factor. (Christoph)
> - GVT-g mdev API cleanup. (Jason)
> - GVT-g trace/makefile cleanup. (Jani)
> 
> Thanks so much for making this happen.
> 
> This PR has been tested as following and no problem shows up:
> 
> $dim update-branches
> $dim apply-pull drm-intel-next < this_email.eml
> 
> The following changes since commit b39d2c6202426b560641e5800c5523851b5db586:
> 
>   drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flush (2022-04-13 17:20:49 +0300)

??

Why did you rebase this again? It needs to be on a rc release tag as
you had in your github, not whatever this is.

Jason
