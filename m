Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C26A4A53
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Feb 2023 19:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F87A10E2E1;
	Mon, 27 Feb 2023 18:52:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711F10E2D7;
 Mon, 27 Feb 2023 18:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHPDYhv5jXJCi2tIh/vTs4Sph1D7NTEnuWTyp+T8TgLbMIEvlHXbaKSdSZJfImU4x022I/lAfw0T7HpzrHkSflb8UYWibmoboaS+b7lvt4Pl9BxEm4/ZxL9ZjPWWlA/Bl5FSNVLn1dk3DFGeotiph2dvWbtI6N9wX+hKuaLapwqrrSTMRjusWzogphhPK6+eWEwy+lalHh2M24NQRm3u2KvMaitpIBk5alBuaTz75NTt14BfIwQm2nuEgVlBTbsRHmo3syP2qj8M0fwLpKabjkWlXi/RKlIKWZ7suM2xFYHTkKz25akEvvb5DDC9vQurAwcL6t3HvmV2w2Ali4NV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfAoyINWLl82JYNpE/zLYYjVHSXiu+UTVuOH7wVu+a0=;
 b=k2gUoO14FEvtRsUUUjgpY/VwiQp5mvA33v6xIFo/GX4f/sMKpl18zd92+hnhWhFYCP/s3qxuH6ILV1z6GT4s93ROJUb+D98n+9oea/1vebLSOpANq6DJ9gcrVY1+m8wCTgGxMUEuNe11LOOljmFuSa0HAAImfYsSPOYTn0yLEQ2RP8YWwtPFXofAS/5Lsv5V+adOVFFspwyZXPm4pOY4YokG5dqW3qI0oedEjj+IB6vJ/WcJ4osn3gk4VpPMga7WGo9HEtmZBPHvFc1VHgkOuQsRH9Zg4euvDosClXH8AQNNJ7ExIiUZiq7XvvRzqjOXgmg9XzfeDwuKp+FlpF207w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfAoyINWLl82JYNpE/zLYYjVHSXiu+UTVuOH7wVu+a0=;
 b=GKCNNFQigDYvM8TRnA2TKoHEDGpeVcU4+L/mTyUSWwpk1cdLVYjqvc3to235Qcpz6nbySX76AjJ0J9nXE8OXXKRdTxdIR4gY2RAIz1raHXLWAGBSesWm2+45EE9Xq6MbPf9PMgT8imttYwBQgGo5WkTwjmL2mndis2NPrbQMDpD3Ag6wTzeW3driN0uAPJ8N4uLj1H/+J+Z2C2NmtbbPt4aXcSFkLxsQqjevMvANjnLAnczISjDkAuKAj2l/dK4koRosFoqGwWWhm82JZiqeqUHbC4lH9axkDsrYudM7Ml7XDoInj5F5/36cll5PsaH+0s3Y1fZg5vSulW1hnPM5cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB5456.namprd12.prod.outlook.com (2603:10b6:a03:3ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 18:52:11 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 18:52:11 +0000
Date: Mon, 27 Feb 2023 14:52:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 14/19] vfio: Make vfio_device_open() single open for
 device cdev path
Message-ID: <Y/z72jEID0QHgaLl@nvidia.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-15-yi.l.liu@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227111135.61728-15-yi.l.liu@intel.com>
X-ClientProxiedBy: MN2PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:208:120::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: 163410d5-4850-44b3-8652-08db18f3bbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vAgF1WBNC9/oe21FjoVckUmCF4aEj1qaj6bm750g3RQHBtbk4Rm+ex0Hb68k4EUEcCy1Owk0xN1E9JwmbaPI0t0XNvpX4VWNNHNHfObg9zib5Bo243uEbPvhKQMf8y6RqM2l+H7aAmp8t9cfZVXiJLakb1AUVODKOmkOXthE2Vy/ojrCt03WudwSRGRrFEjmFOtxFNYfA5yCdG2nAWaL/KAVfxeB8CkfVAy+MVuCKGPDA9bJn4JBrPYSlblMghwMl8mACRThU1S1kpsc50jOqwlxGCuAaKYqeVCpAKuLufmILbtRKnx/34MdaT02QNVOVI3yjyXQf/dFMMrkQqvJ5yOnzlgoD//KHGqJtKy5O/FY0siDbBL16Sm0JeSJNgf8xPL42ZOZeSskN7mGHN3ERNS3TzLn2sy0ZOHPfGiGAUGS5DCDShgHM6yfO7F9rzmL21j0zAC87xzsGwue/qIwYAHHdFvImTji/OC9QMCQEGFL8TMdtyVuXhl6Tcc9hqIGM+G89MkAbGyg000cOfyt0awG6NOyUmI4jIpwO4C6J2SBeG973sVuznY+/VFusyD1Jmu+dHLSbSEl80gbhvWsO/JG9jGlb1gpdl7UQv1sd3ux6US3W95h7iC1IbQs9JqaNGCOWieyeD5P8u/J8l5tMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199018)(186003)(2906002)(38100700002)(83380400001)(8936002)(6916009)(66476007)(41300700001)(8676002)(66556008)(7416002)(5660300002)(4744005)(66946007)(4326008)(6512007)(6506007)(478600001)(26005)(2616005)(316002)(36756003)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0eodGairgt1ri1DikSbIAzr2Qg3h9WdiXaXl3muF0LMgZIX1K1LZ+Y4/BYH?=
 =?us-ascii?Q?TUW1Xbg1RNbM38DwKxiuDaw0w1Js4BkOEMjoZIqAH2ExNp6M6Z8LNB8CT6zT?=
 =?us-ascii?Q?IzklhTaRmD9fUdai35lm0pHdNDhpqcgCm1a0bNK1dPsQbyhEZecMa3CLKEMG?=
 =?us-ascii?Q?u8Idl7OqCESLJWl8OK3ehbrakthlgl9jt1RB2r5UjZAIdjNc3dffOvExoCQ4?=
 =?us-ascii?Q?jnxYnHNKxkptHJaHKOapFpUJSQJT/LNnL+LFkQYCrNP/YrXATd5R7FOiSPeA?=
 =?us-ascii?Q?CSdgBGChfP/HtV21f4kglcmFz0rbOvTuU0Tt3meR9t6I4Jl2UA9O6+N2Yu51?=
 =?us-ascii?Q?Z1XOWjuglgtc6Z23gkPF5PH0PY3VK83hZESlnWW5STAAsJ1HrMo8vAIiQtDl?=
 =?us-ascii?Q?pXU8dMKTha8z7QtvjtuzjR7vtIvEK/FncUfRppNVjuLh7AucqnpMUZ39n+Wu?=
 =?us-ascii?Q?bvceahhrx1qk5w3RhY3SxgnIBM4MxkFOcMpDgVWGsRzIuT4XcrZHGXh2q1ZI?=
 =?us-ascii?Q?GiO6OKGm6tdjej5QTdEObn6nFWHxR5koprKoHmdSFXSNyH/5O7Pc8/6+lcyk?=
 =?us-ascii?Q?nhbGzYKt16dkVZPOV+mWELiS2cwxdBiJXQnADGjNx2IxXw9oNhJnGz8rVJuk?=
 =?us-ascii?Q?N2/RqBI7E4abaL/zIxJdr2V30sY8RmNgRGeo9sFnOD9XiBh+EcurcYgBrHfq?=
 =?us-ascii?Q?CSW7Vw0oo/py69zzxHodL862h0x2InsXlSSuV1CMLKKE80M5mPOCzZWahTl+?=
 =?us-ascii?Q?xg4AViWQ8YHmLtkf7ZXyeUAOHSoQtjWVL9UJUSaNvztKxwEN4x0IAEReAc0X?=
 =?us-ascii?Q?5xMGTDX41wDvPfmOuYDeZZ4GL59PKGeyXTtCDuS0fqYl8fOkRHAtKP/T6vKF?=
 =?us-ascii?Q?o2hUgptyvN2Rg2RVVUKJ4HHFpDfoh1olSQwpOJsB9ASt3WafeWFz99szMCfr?=
 =?us-ascii?Q?iC+f04yTiP7KuKtcwoDF4hDySK7PdztxdXac+IuvR6oREsMMAikSR298D288?=
 =?us-ascii?Q?uRURc+D38Wy5BMCgcSADNq8THITZr5E/7TWrYuLXq28btEZRDAQnQRqbJky8?=
 =?us-ascii?Q?W8zgunN/jhK89gBe7QhJpFZY5P5Sjuux0HpCFYNxDOwr2ggWkwrhtKteOd7v?=
 =?us-ascii?Q?zaNF4AshKBu2Vk1dc0LK2a0++9/wdaThG0AUtvhG7E3ioVwzuqignl2CVGdE?=
 =?us-ascii?Q?bQe42JjuOMZ26e5pRIU/DLxpTk/ejsXARrZwWmqbLpSaJsP6kwwgObR84OAw?=
 =?us-ascii?Q?DirR5V3Y92G7AgItyAyymU6TdMXDdsFH+iu7kPVxZBphmwjXAPFdMit5CHsN?=
 =?us-ascii?Q?q4kGHQEDJ4zVK7F8wq4IBrMi9mVX7+qYcy9gVJxwvazKrby9k1OW/1EWb8dg?=
 =?us-ascii?Q?rRhab71XM9mIGx1rRDJD9HffU0wN9/tTl3uZECJGPptyFwa3oovNOl6HpL1V?=
 =?us-ascii?Q?aFVyHoRsVZvmv61XbUhKkydczSW8Du1Xi+G0S6Cbu2oybneWrPlcplJMMwJw?=
 =?us-ascii?Q?1fhil8SwsjOQ5imoRJikaGQwGeMlS9fm0N/NVA0drq85ja159Ny0XXYi//jg?=
 =?us-ascii?Q?axym+WYV5H0wX91ELOCOGMJaTcmjPSpjqZfYjqps?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163410d5-4850-44b3-8652-08db18f3bbf1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 18:52:11.4063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAfsp6W4KBNPBLAZDXKgJywqK2+YGlaVOJhncgw4CHIxm5Ov2J0Zi2elxmlYDaYt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5456
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

On Mon, Feb 27, 2023 at 03:11:30AM -0800, Yi Liu wrote:
> @@ -535,7 +542,8 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> -	vfio_device_group_close(df);
> +	if (!df->is_cdev_device)
> +		vfio_device_group_close(df);

This hunk should go in another patch

Jason
