Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44D6A657B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  1 Mar 2023 03:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19D810E095;
	Wed,  1 Mar 2023 02:29:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0631D10E095;
 Wed,  1 Mar 2023 02:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE7hv0TOXAS6tWqAg5K5V6rT6JhZyAoWmVKlIx6U1pcyld7IVgRcwHtvnBXHEseusxtRDdrFnJZbgq2y38LcPhbaZTL/RWKRiQCLlNUfFdkzN5eFIRb0dzLA+jSPWVGUu4PjtdUG/CZusa9qvsJPhe9jnL/flLftP3o+AvdBTZQlSFhwYTMqk/8bbBk+gqIuYQvhaS18CTv2i3aFr2nAhjU3T4jR8MGosKTXxC56w4pomcq8Wrzc5LWvMebDbWzu5Rc7e0ZLx0vuFmxbRm56p4vSVIFThG9CWD0yeiy0oSIDS5JGijm7By8qy3A72Iu+0WrpJ31n9CTToQsOaYYPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmuCpoB01OdbbveZbaHh9jyvk+ZB0HxTioJXjat78d8=;
 b=Wsj55rIiXLqdKiD1wqLEPV9LDrpJEo7aM4hcP7YIFz86Qgl9Mrwf5FxzyN0v+mqvnXsy6PGCHSb4ygm3+5Y3wHE560mDxHDLq2157uWl9cTPVdvJFA/U4BNCSuq+cl+M5+TVvyO0kcIA2wxvBCOBUkxmkDQtgmE4gvlS1q1Ntu2I9umNDALPJIj96tctKJ5+vupcDcpxR8UvV1D9SEfjeuXq138LLbx28PNPBzEfXxFlcMt1GEAOriFSuXd/ylgPBkx6RtosZqsI5sGis93TxMwLS6vshZ/+i5SsTKY96FzjDxPjmAEmgPp0JA5a9A5t6Br2AB3ADY88eB0Un1/HkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmuCpoB01OdbbveZbaHh9jyvk+ZB0HxTioJXjat78d8=;
 b=hqMbkL05g8xZ2tsYCx+X8nMhB5zYjwvXi4ryGarqzd+yZ1hHCUOQ68m9hJEaJfDy0EZPC3+vbKPJYtz9gIHYkzBw1yhJqaJ2aniANo6oqL6iyd0SV2OsXAp1oc3Fn+PgHgxVjLEQV1Og1pM5MV+8CbfyAtX/CrpQeMGMb/g67qP1kVcCiF+T/S7fGlYkhBk3oi436GtDcQulk/eBDG97CzJvZIeE1OhwVkHSZ8A/FZ01/YRcnO2FkAOEb31j7YNmFKtZYowgjyvZ0CFtY+bnjECjE4/EG87FEMh51bnYeOs0nEStA6qaJlagk6VUEs1BqYcH0sKplzbL7fQcUrbjvQ==
Received: from BN0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:408:142::19)
 by MW5PR12MB5624.namprd12.prod.outlook.com (2603:10b6:303:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 02:29:31 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2603:10b6:408:142:cafe::cb) by BN0PR08CA0003.outlook.office365.com
 (2603:10b6:408:142::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Wed, 1 Mar 2023 02:29:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.12 via Frontend Transport; Wed, 1 Mar 2023 02:29:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 28 Feb 2023
 18:29:17 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 28 Feb
 2023 18:29:16 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5 via Frontend
 Transport; Tue, 28 Feb 2023 18:29:15 -0800
Date: Tue, 28 Feb 2023 18:29:14 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Message-ID: <Y/64ejbhMiV77uUA@Asurada-Nvidia>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <Y/0Cr/tcNCzzIAhi@nvidia.com>
 <DS0PR11MB7529A422D4361B39CCA3D248C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <SA1PR11MB5873479F73CFBAA170717624F0AC9@SA1PR11MB5873.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB5873479F73CFBAA170717624F0AC9@SA1PR11MB5873.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|MW5PR12MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ffe1d1d-28fb-4b1d-781e-08db19fcca02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 855aZpNoLcMon+7asaM3Wh45wRASHsHd9ZZ4Qu9aMgcPbODgn2dGC5Uz5EKWRxxk3Lwh+TxzLir0rhp/aDB7jUNqbJ1XK9rCAsBegwg4NHp8TnsxUs8uqcu+qRkFg2ctF5BVvQEsKw6rpR+YajFKj0nFWqM//q2zALqXQoYxU22pS077dnw/NU8cvxcj/jHYKEnsp3OiBtIWxYIhH0yMCxnDBUpEf/Sejm/qG0l/ThBWPcJ51DTBqBMc1r32S2Sux8azh9xpcPoE8n4gS8TTLaLgG20UvOW7GgXVr/1bx3QewtZbYbmWFi9eWwep2h0yef5oo4gZgB5fWBSbgkqnfaXcP0tH/IEtdJN/UEf+uVTC41/ID/dm/VDA9kwxbBAJA/i5rwtLkM5CkrXss6CGvXaBWa10Qh1QSE8QnpWoWtvI3wrzF8AWcS+QQtMN8HWX7VifYWLwQYJbVn6f8DhlPaqqXPUnn4PzxnT0TLT47MV37D91tV8x6SsecC4b3bT0TaT+e4BNRl94+hpo/S2hNJFBO9kGx9NJlK+2PzfmDA0pi7NFHn3ao2+u371Yj/vgyTNTcoawhR92qM2/UlWJwKND9wjlCEiZKA3Zt9QJWBglt7FzaJK9ddpUyc9MuZrZscwbNr2lRxsx1l+wTwpzevGsfNNtAk94B8aKZfIZXuAldO2gqJmg0/SxPH2G5Aby9ZZtS7lPEfDHz2jzda+zI94uUX4JOKXCUto1KO34c+ac0LlGbqvrDnUioTsWBgX3
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199018)(46966006)(36840700001)(40470700004)(9686003)(186003)(26005)(82310400005)(36860700001)(426003)(47076005)(83380400001)(356005)(40480700001)(82740400003)(7636003)(55016003)(86362001)(40460700003)(336012)(33716001)(41300700001)(70206006)(70586007)(8676002)(4326008)(6916009)(2906002)(8936002)(4744005)(7416002)(5660300002)(966005)(478600001)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:29:31.2482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffe1d1d-28fb-4b1d-781e-08db19fcca02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5624
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
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
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

On Tue, Feb 28, 2023 at 04:58:06PM +0000, Xu, Terrence wrote:

> Verified this series by "Intel GVT-g GPU device mediated passthrough" and "Intel GVT-d GPU device direct passthrough" technologies.
> Both passed VFIO legacy mode / compat mode / cdev mode, including negative tests.
> 
> Tested-by: Terrence Xu <terrence.xu@intel.com>

Sanity-tested this series on ARM64 with my wip branch:
https://github.com/nicolinc/iommufd/commits/wip/iommufd-v6.2-nesting
(Covering new iommufd and vfio-compat)

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
