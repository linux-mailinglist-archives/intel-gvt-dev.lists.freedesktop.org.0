Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35439508B77
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 17:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177F110F0AF;
	Wed, 20 Apr 2022 15:02:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32A910E1E1;
 Wed, 20 Apr 2022 15:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4FS+5ZOdu2hW2vH2jafZl96TUxcfB/l6G2jz7bqij3qnvFOFemg3YmpaLBRFo9eJVAWZj+w5GipAl4XhwjYeR+R3QHxi2cCF7CZqnA7NCEzIivz2cGnfEtaHpj7dh6Cl634caaP/A/nmZrJ1WVlgswQfXbuxNuC6WQoG9La3SO7RPM5pMJZJ4GvscbksbboHU644FoDDL/YhAD8Q6cRxmXDE3GkSVmGQkrqihOHeWIu4UqaS2TbcT9i+7xFBjRD/LVcHjsMj0x9aGxfQk6OyOZc8OpGcfvjpbEWzuWrrVsyt8ZmcKtYFlieCO39vbkrp1Pr7VLc728GzZ959ad3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S65JvFn+JVHkmHdSIAtlH/IgrJdsFqJvVvanaKwtRf8=;
 b=XZTGpuCI9BB6TTNArxDqH85fwrzS5IPwf6HooKIHkwmEBWPKwPueGUOcUyQKGz+taIz0Vzp7Q36lbdiaKoijGuyBVeVGWQGXu5ZxRPv0o834rRMIk5NJev561imc8qgf8U29/j3+Mt25pisEOKVCbio00IQVkVKUSNr6yFi0WGbxaKZtSIya0PBmy/7vECv6bJn+nvZTp6OGRpAAbwbXZnP1oIGnqa7Ks64h2y/YmRCGa3OdqoA83l7AjdYLcsvCHNDFPBiCqIE2vtCnRaPAwSJej0Rxz3M/2d6ORFklfTv6oEWdAyFvnXJU+24xEB29bjc4GnMQDT84G148TicM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S65JvFn+JVHkmHdSIAtlH/IgrJdsFqJvVvanaKwtRf8=;
 b=HAl2hvaqH/LX3Y8b9+d2g+g23yW0272Vy9Myf2uV3jIYx1DSUZMNBE1DeMdl/woDrqBS4T4bo7Xjuo6V78JeOoo+0aWmhQCfA/rXqeVXrW1CHpPswgcnvbCkgov78MLtlbIdMHFOhFuwC4nNKX3SqwxcM2yhjZKs7iq8702YBytb1M63IC6UCHGer0BTaTxo0gjSpjfFgnyTbCaHuY1OnV1f7ahTcQjI85wEx2eqJoD98nExXRApnxZps9kthtNxG5IbGT+SmvlrydUDkHM7G/YoAi0S2MTE2mpQs4rSIbcLcq5UD4t8DLuhmGOeiZSDO7/L1q7Qy58db4Kn5BOBZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 15:02:16 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 15:02:16 +0000
Date: Wed, 20 Apr 2022 12:02:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20220420150215.GA2120790@nvidia.com>
References: <18c3c1b1-6f78-6140-4ec8-e18bc7916352@intel.com>
 <20220420121317.GV2120790@nvidia.com>
 <16fd439d-6a6d-63d0-76d8-16daadfe5bde@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16fd439d-6a6d-63d0-76d8-16daadfe5bde@intel.com>
X-ClientProxiedBy: BL1PR13CA0371.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::16) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb002c3-8842-4cf3-3f19-08da22dec270
X-MS-TrafficTypeDiagnostic: CH2PR12MB4184:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB41846447455F1D8AB3D6B318C2F59@CH2PR12MB4184.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ERVHuHadltD4Fg6ednDJyMsvYtEey5C0a4RpgvmXs7nIWM2pNSp86mvHy76J4PEi6n7R4XiYf39x00D24vIddXsj9GoSZ9TXjHM9pokR7RgdXYeQbD8zvpy0knr1gYnxXT9bQlI4sVjxV3NuIS1HhFvR1HoBoJ+NiYOrwdHqFtq/I/pFkU5bzNWIJ2hPiUYkp6ADr2OoVRrP0q5OIJ/v2HbKWR4ULfoo4glvZ1V4tjJYgJwBMqrRhxS390K1bbC4iszXU8esH6+TFNWpWvqqioJrdt/6cOptj2NZrZ1FqlsHDtGkLDZrqx8x3DhXkr0oj+A3RiX8JVuZ23q4VYoPSZ+dE3g3O8v1BFPUVAhd33AfrvU7HsSJmhQIuioyTmDtSOHU0eJoJWWLjwk23f8cjnYyFNPKGM31vuYnuJ+sHmSOTB2enfQrJ38uAywDT5fjTsqL5/HPHRu7xEp/yqN5BiNREJJ5PbhsQW0mwfcsL8go2mKWpRta8NRSev2rsRKemZMmXxynxZqJhI2RREbQZo9/0UJnqg2FdwPnG7yc0+TDuEyah4nQJnljyPa2FCdKqvjxiOI6zSNSnpbhlrC1kYY81+OM68C9/KKYPj4DSa4L9WQbmEv5zeSziI94BpI9euc10+wBlFO0aDYSu7+mdwlhQY265XzwmkFJGDqvVdWJipdANfXMxR+CxHn3pN+DLYMtxFU0ifxg6Ru4dLj6WwaVfNHbDyclZYN3/G2nj1CEtPLgC5x0m2aGV9RLEWTPRXMy4/LGVVPMAHeHGs9KPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(5660300002)(36756003)(6486002)(86362001)(6916009)(54906003)(508600001)(316002)(2906002)(186003)(26005)(66946007)(6506007)(83380400001)(53546011)(2616005)(8936002)(33656002)(38100700002)(66556008)(8676002)(66476007)(4326008)(1076003)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kSWleorxmO1t6XQNtUqEGy8XG/EwF1a3Xy86DlZIMQ0rxxvuozkOfbWXwwn8?=
 =?us-ascii?Q?W4qfQB2WfBmgCuNgGFqZcIXfnqBJ5InBPbn0cMUFYt4y9CgOrQoOBNr/GVgQ?=
 =?us-ascii?Q?w7f/mupdrC44rmWsYQwPi6LkFGyTrpRJXSPZ1HkewwslkgZzpDK6ui3xoPEJ?=
 =?us-ascii?Q?dPUdD3hfLYsDqF6I1RJQryJg94IZ8X8rjArHI8gNTapTb9iI+Oj+ya+Trgxt?=
 =?us-ascii?Q?gtinb/cA/RUwmv+tOOL18AY1BpvVRV1Kh1j1GEGBDV9F7EiCBloHg5DXbNm6?=
 =?us-ascii?Q?QZX4uM2P1xD7YrztJaTbn/jp3WdsGMINJQN0qmtJUZe/YGeuy1/HKkKpU3TY?=
 =?us-ascii?Q?6KVDx8fhdGjkJomM9J1ENkeCxXFMQpryzLo28TVduDt8ksRcgcWRfKIRlaIA?=
 =?us-ascii?Q?GpTALjq9WYe7EMnpr7xGAzufwqVjOePwveQGyAOIEDIIJ3zHTCC6I1hf2LLk?=
 =?us-ascii?Q?xVpaij4NObZ3VEIzUIIHV0IWtvcZA5/zyU6T8HGBRqbgecNRiRow+7RLkiOE?=
 =?us-ascii?Q?PKMVEbYrhXgRJuOdRxwreWPiDHa13IeDgXAUo6uEHlJ4iizPF7hmMKUbM3s9?=
 =?us-ascii?Q?XC6ejT7lhhYQmlkXSjULcFw3BZ+sgEIqJuDbFqVGDzfFAi9wBVFv+bcVYXta?=
 =?us-ascii?Q?ceiSf5sjNYG1Y5QdQrbTd3s0k5dRyI7KtWzpmkuNTDn9fpoGdgzCu/RcREEJ?=
 =?us-ascii?Q?2w6yquPx/CCNYztuT5OvJCCEqksslacQpqXxhe4U6+ulBoURywXKltIR9yWW?=
 =?us-ascii?Q?FYIfT+AICkyb94V145kI4j1C0LoCP5Uh8dCt/g+t8Y8CxnKStcEihvtn3L+v?=
 =?us-ascii?Q?F7fLlyGKSYpItvZPAZewyOaLiqo5Bgae47MBKzgTIkNNhyDbFghOkHh7gBFv?=
 =?us-ascii?Q?oB3fYAX/m+ljaEA6fgcg9z/SJVKs1/iSAAPzALRAlt2fv/M9yRPCo/BUhSmZ?=
 =?us-ascii?Q?rJXIoorLhQ1n8AD+twZ8CzprJ9nr+9LMgF8mdkZIyXMyDK3cuWketMfbZS8r?=
 =?us-ascii?Q?sCfq36AeI0VxMx0DPWh1QH7dvWHvlfEu7i8dNiA/eScN1COvV3gq0rXRzEle?=
 =?us-ascii?Q?TnJEnwa4k4t9hoxw0++hH6c/VwpFbXqyDeVGkZDzfil0/eMW37hyJbRtnj+/?=
 =?us-ascii?Q?Zl+TcdaR2tHyDJYsNPFeJ2Hvygxg+ophzPxE/IaogRKouwrXr1AO5K9jIXkF?=
 =?us-ascii?Q?qpcjhVoZ9KYWjpfi9qburgA3GtKVsgamFL6V/qZIsE+BRKHldRmyGjeQekGc?=
 =?us-ascii?Q?JD2T5+ZMjO13aJKxkLjp6ZLwVxOL3mD9PzN0kekoTXr66VEqW7AzW3ruDKZA?=
 =?us-ascii?Q?T5A92lK1tC5Zj1txZqh0GO3oJbQj/G0eAG6mBU5EjfRZ6lmNWqS01M9pBWvK?=
 =?us-ascii?Q?ldffRPhlcRnAOju5LzsGqnNTMH9wDeT5XLOmG70DAHPUSmqK5uZI8OhdrWul?=
 =?us-ascii?Q?n8fUTRMfiSd/4OltTi3WXtwpqKkQzKstjpvS5YD58ujzuc+XrQnVx0l5Id7c?=
 =?us-ascii?Q?ezQxT3N4nOjcT7o2fr4ktRc7D00Hc8/JRFD7TTDzI5lBqSb0T8ofWGjLCneA?=
 =?us-ascii?Q?E38kdXjaUY6NlxzCMFt/7cx0C5rMAsSBIlNXgdbLNpm2lvuWWfVoxG0dHAB7?=
 =?us-ascii?Q?ovHOQycyZLOVyeCJfjKqyruH3CrSEORasS4Uvt//wXo+4RevhppJDpmBMAV7?=
 =?us-ascii?Q?8UbDBXyLMr4plwh09QP2XAnAtH8txQojiV2OqQEJxol90sYgpA+Z023KEaRx?=
 =?us-ascii?Q?JsM1mv+SJg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb002c3-8842-4cf3-3f19-08da22dec270
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 15:02:16.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhPpwTLhs1bgCYTL0p20evdFQrAGpqV/44fncCnvlQctujYjcZaGIQd4rstfCPCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184
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

On Wed, Apr 20, 2022 at 02:41:04PM +0000, Wang, Zhi A wrote:
> On 4/20/22 12:13 PM, Jason Gunthorpe wrote:
> > On Wed, Apr 20, 2022 at 08:04:31AM +0000, Wang, Zhi A wrote:
> >> Hi folks:
> >>
> >> Here is the PR of gvt-next.
> >>
> >> Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> >> new MDEV interfaces:
> >>
> >> - Separating the MMIO table from GVT-g. (Zhi)
> >> - GVT-g re-factor. (Christoph)
> >> - GVT-g mdev API cleanup. (Jason)
> >> - GVT-g trace/makefile cleanup. (Jani)
> >>
> >> Thanks so much for making this happen.
> >>
> >> This PR has been tested as following and no problem shows up:
> >>
> >> $dim update-branches
> >> $dim apply-pull drm-intel-next < this_email.eml
> >>
> >> The following changes since commit b39d2c6202426b560641e5800c5523851b5db586:
> >>
> >>   drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flush (2022-04-13 17:20:49 +0300)
> > 
> > ??
> > 
> > Why did you rebase this again? It needs to be on a rc release tag as
> > you had in your github, not whatever this is.
> > 
> Hi Jason:
> 
> Here is what I understand, the pull going to the drm-intel-next
> needs to be based on drm-intel-next from the branch gvt-next. 

No, there cannot be two pulls, as I explained when using topic
branches you must never rebase.

> The pull going to the VFIO needs to be based on -rc, the
> topic/for-christoph brnach.

Yes, so what you need to do is:

# Get a clean tree on drm-intel-next
$ git worktree add /tmp/gvt-next
Preparing worktree (new branch 'gvt-next')
$ cd /tmp/gvt-next
$ git reset --hard b39d2c6202426b560641e5800c5523851b5db586  # drm-intel-next commit you tested

# Merge Christoph's topic:
$ git fetch https://github.com/intel/gvt-linux.git topic/for-christoph
$ git merge FETCH_HEAD
Auto-merging drivers/gpu/drm/i915/Makefile
Auto-merging drivers/gpu/drm/i915/gvt/handlers.c
Auto-merging drivers/gpu/drm/i915/i915_driver.c
Auto-merging drivers/gpu/drm/i915/i915_drv.h
Merge made by the 'ort' strategy.

[..
Merge branch 'topic/for-christoph' of https://github.com/intel/gvt-linux into gvt-next

# By Christoph Hellwig (27) and others
# Via Zhi Wang
* 'topic/for-christoph' of https://github.com/intel/gvt-linux: (37 commits)
]

And then check it against what you prepared in this PR here:

$ git diff HEAD 888471711a80b22c53547f3a625f20f487714f28
[empty]

*do not rebase a topic branch* this is very important.

Now - given that we can see there is no merge conflict you don't need
to do anything! Just send topic/for-christoph, exactly as-it-is to
drm-intel-next as a PR and that is all.

> Sorry this is way too complicated to me. Let me prepare the new pull
> as what you ask. Shall I send the exact same pull to i915 and VFIO ?

Yes, exact same, this is important.

You were very close before, the only issue was rebasing
topic/for-christoph instead of merging.

Jason
