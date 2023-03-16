Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F210B6BC4A4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Mar 2023 04:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB4E10E0E4;
	Thu, 16 Mar 2023 03:26:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D854110E031;
 Thu, 16 Mar 2023 03:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOsi/itVVw/x8yOWi8s7ve9XdWtLJdukXi9ICS//P8UrK1UhwnVi7T519I1uUFQ+6dtjV8pRLQHoNcdVjraKSBp9d9McCS2dXyOXm97IPmkjO4hth+zLs8FnylIr2r9lx9y1dlKubRIS1B3J+mJ75FKqHyfo9TG6iOqZWhzzWIYD+gsAFFCgAWbcjvyYqCDfAH1BYeGcitw7KBar8JGszzmd83dy0YjqHBauBAf11FedG4Cb+Q6RJ86smPDx+lHvse0xYemAAZYDt0Xg5dcbHmdJihv1UeG3oGogBRlGD1wa251O8kAVgakUv47Th7Z+VmW+b2tzqUQ9Xxoqp9lRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xjz9HlfDeQfkutRQrHX2DaiJ8PSumZ6IzmSLMVPNbbY=;
 b=Y4FoZvS4bxtk2ERWtNzEPD0HWr1Pza/oan8A9WkZx9qvfVe/lsdl/fOhQWELCaixcrxxRyNZIkg9kCDtq73iZhg837cJU+9dmYlDSrdVR1xqcpBtjPcm10DEc9F2/AYrN2VYILlecbYpjsbgOjwBHpGsK7a9BGVcMZwvIh7DjCVXkm0ApFz1XREXMf0hWx5BLQ01ta2D53A502/h0e1gLRCBUjoayj5ojF1zEtVHGWMsBKL3+Yg0Tm6lOXnO8thvfRWc1OFHXePKWEVRSuC8IWAxIwORcH9Hy5ryH/z/8HmEb8+izNrLB2wU3qOlgxsgCmgDAmIZfCynzg6qbMiu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjz9HlfDeQfkutRQrHX2DaiJ8PSumZ6IzmSLMVPNbbY=;
 b=OCkW8XFCkbNzvhbCY9SJdULO0J7tOwDzVXbDLhth+oeSan3dw/tQdBR7Ox8GbBe2md3q1uVx7Q0BqhcKjSdhOq6OubeSevFLPCqIiG5clQw/z3+tn92kCcao6L/TTvFcoeNke+XaLoKn0lgb5r08JDrejNNa3nJV6zidsiO1MP17pNoBFSAJ+rj6ewYQGgRsAlw/2I+vKYTdSx55jgpUzabqOpMaa7UJevYfokbcnYvRjNf5ELkzijUkqvDN7lR8wytgiqD3MPDQuu3qw2pmfUVFI++pShWCmSKDrFIJXnHXOnfl36qjO3ztVwuenhDmvfJKOGeH7Brk7MeSMnsHlg==
Received: from BN9PR03CA0714.namprd03.prod.outlook.com (2603:10b6:408:ef::29)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 03:26:09 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::41) by BN9PR03CA0714.outlook.office365.com
 (2603:10b6:408:ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30 via Frontend
 Transport; Thu, 16 Mar 2023 03:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.18 via Frontend Transport; Thu, 16 Mar 2023 03:26:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 15 Mar 2023
 20:25:59 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 15 Mar 2023 20:25:59 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37 via Frontend
 Transport; Wed, 15 Mar 2023 20:25:58 -0700
Date: Wed, 15 Mar 2023 20:25:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v1 1/5] iommufd: Create access in
 vfio_iommufd_emulated_bind()
Message-ID: <ZBKMROKplWlHc5Fw@Asurada-Nvidia>
References: <20230308131340.459224-1-yi.l.liu@intel.com>
 <20230308131340.459224-2-yi.l.liu@intel.com>
 <ZAtqlnCk7uccR5E7@nvidia.com> <ZBAuXo166M+z8b3z@Asurada-Nvidia>
 <ZBEY49XtiFUImfe4@Asurada-Nvidia>
 <BN9PR11MB5276738DC59AC1B4A66AB3C38CBF9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZBFmh2iAqGGb8CjK@Asurada-Nvidia>
 <BN9PR11MB52765D7977F987960072482E8CBF9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZBGJzefTm4p/ReIu@Asurada-Nvidia>
 <BL1PR11MB52710B5DCB08214EF4542D098CBC9@BL1PR11MB5271.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL1PR11MB52710B5DCB08214EF4542D098CBC9@BL1PR11MB5271.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT018:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 024343b4-fb13-4094-ea4c-08db25ce2f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0M5y9LugdroxIkRTdEIyZgDzLchqUUocODj7VHp7qyG9AQD3yRuQkfH0lAGACFYqzQKB67bzLMbp5ZCZvKSMqnEFRLA9wRFTesWUdHQeg4HfyRUatnlEZ05slEl5M2JpuIhnJBSC9dx97iYjHu1X4fKg+EgCJ9jmgqDCPCnPVvV3mRXF+e/9RBAGwb5BG/zBLsYmNeb1AP5YIAmsn9HYHL3snQyMdxyLb7RePzydQ0fncyDIn9Ez0dZmvLbeDqOVxi94U+8zRmZUa9lmXHq0GFeIdJ3H31MrheM488/noAbooQW85BD0KZ9Q5xP6rni/XNl8V5iXoGDNXqiV9FHR+GjC4PZg3ANL6oR76EiPuD4KolEmtjpU0O3Cx44urX8K/rdFIn8/osrNiuejf7+NyUO6FQ4V/O3utZyUQO8FyI+p3y2o8MmLFnzmyhLxWAEci0fVZbo3sx5dabuko0Cjk5WWRTb/mC81+GbfzotHKLrO1q11s5y6QoWFPWUqyRAPenq+jXC62fPwXxjeAeyQMuT5eaJBh7OmuMOj8Go4sAau5gG8/fqBs2MoMJIY5w3aajcV3LJUg7KT8vAdjdvtVkqKa0NlTaWv7nxGaheOq9DjnxnLA3LfKC6R4+XKJQKIOcJoTBUF3f3y+zKdB4rhvgG8FUu+PirpJZhw01xdkLCAQNzqOVWNdQLvSWxzi21B3Xse4bTBnf45W6+aQo5SczIrZ9h9BnjCNa3pK6vJ8IDXvQQc9X2y+dV2jpVtgvXu
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(40460700003)(478600001)(426003)(47076005)(70586007)(7636003)(82310400005)(82740400003)(33716001)(5660300002)(8936002)(86362001)(7416002)(4744005)(356005)(2906002)(110136005)(8676002)(41300700001)(316002)(26005)(4326008)(55016003)(186003)(54906003)(336012)(36860700001)(40480700001)(9686003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 03:26:08.9397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024343b4-fb13-4094-ea4c-08db25ce2f60
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Hao, 
 Xudong" <xudong.hao@intel.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Xu, 
 Terrence" <terrence.xu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 02:53:50AM +0000, Tian, Kevin wrote:

> > Please check if they look okay, so that Yi can integrate them
> > accordingly to the emulated/cdev series.
> 
> this split looks reasonable to me. Go ahead.

Thanks for the review! I will address those comments and renew
those commits by the end of the day.

Thanks
Nic
