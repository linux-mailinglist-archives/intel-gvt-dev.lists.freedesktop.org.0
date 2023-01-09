Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636DA663119
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Jan 2023 21:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268BC10E08B;
	Mon,  9 Jan 2023 20:13:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E5710E08B;
 Mon,  9 Jan 2023 20:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWcD5JwHzoO7nuChwng99et5kC8UrgLFE24aANU/KErzdVqW1f3emIzpx946rugcT5ohpuGEthwWnYZNb23ayHhvsDt1C1QMkArydyxLZb8hsNuMo0rtTLmCCCIaKhvEXtTl9A+ENnojnYiOQda5hHZnKZyeMgJ5N84nj2VL6HVrQF0uzlydRPs8/v7bl3T33Q/lYqnmCJ085krkoZ5ptletUE8S22Z9QrP16N2jMzGIMPtCBg/X6suKpOTmilTHA5VFWb0wXE+odbHLD+9BYb/IXqZAwhpuRc/h0Uc81MtUnaX2pjK0ADdoArhiM5OXc61G/wiMJwBdfp+FlzR+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2NYdG+PgMDxwVGkLC21QbF8DQnBf+7ac+2/3GhBBzs=;
 b=ZbJSmeIt715O/5i7XpKG/GM4h36gzTWo8AykPTz+9NVFzTgKnJRLdHLIR+fzJhaqc5i1eSXT9iJyPt9CfLtTqm9Z/V05EKAEa2oNnTr6d6mRY+FIHcHEDoSzWNh2Ep8joIIlVdvzA26Tt+f+XDLqMt/5l97lYhLk6y/7Uur1z3ogmtwwCpBC78kVv8FxItBqkRESnH5NctsvGubEVgDpyyZ3KSokETT1Z5fwDp12rQRXZTOYD5yErHLOqJZZ1e3JGxJf+ODZaXzbuSdFtTqYy9YaZMa2uz4mWWjmOWHBeMbalqJFoyy04uVOGSKzf13NjA0AYIKTeM+LBCaRzTZlsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2NYdG+PgMDxwVGkLC21QbF8DQnBf+7ac+2/3GhBBzs=;
 b=ocg8cH4WsdfigbEjHfVNK9bzhZPkmWWE8R/mvHed9Jtk9TWJU0fYQFmX5QxCzOyc5eWYZtDR0LtKLiMu3nKWjVeBo1P75Xb4/Pj7RYsuvnqRj4KcyB1ewU2S0jrKVjf7BxNrg4XeWeUn10K7XVDNDfI6I/iCB8Gsf6jGNb9QBsJEc+awp/BKXQlQ8Krwz7nkDMux9IAASxC1Nqyhi8YIIFuZu6fb1NMioV2rXT+597NBRV6CjYTciy9RIxXyeTbnG5DHMAYQIQ2ZXqoWF0/U4szlN8Y5cmyo7toqG2e76ZW/doEAEd8c2G6ZQBOV5u1VM2w1QooQTegGJTWjEI79dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5281.namprd12.prod.outlook.com (2603:10b6:610:d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 20:13:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%8]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 20:13:29 +0000
Date: Mon, 9 Jan 2023 16:13:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH 1/2] KVM: async kvm_destroy_vm for vfio devices
Message-ID: <Y7x1Z64g4H0kWOo/@nvidia.com>
References: <20230109201037.33051-1-mjrosato@linux.ibm.com>
 <20230109201037.33051-2-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109201037.33051-2-mjrosato@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e744c70-a4ac-458b-3e24-08daf27df905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVzOu/2OZ/HCfnozulhGMbAqnU6SDxFJzRMnx+3iU6vcm+TqhEqnOv6apPKE1yfF5bJkeUS8FUcIIkEJfldh7Ez2ZTLw3gCkqave1YwP7YTYwjU9rJ0bqyghh4bZ4oLt4+0BG/CqQ9BaJj2tExBY5r7FGLtl4SqLQ5cl1p5YHwCdAnrQQsE3AZCrI/rkZhtH2SU3u+kDFMPmYL6lMw6ht2+maHaZIU1sXjqcZVcDjcvTIvs/6JGqOb/qL77M76n3o6fAKCQHlq3BceNwC4/J0IloKsr04ie3re9hqxLufEJeBXzx9ydtNVBIu9y/hanbh31K3GuySEw9crGVAGnFb6NfBDnK5OlVeLPT45SuRxGk2sXrXgfVmRuHy62N/2I2oAYqTyXsiXOwarJykSrWZjE/7ZOb9LXmtyaBowCM8RvvZn8XpP91TYUD8sE70p/lOqlwAqNhr14CFZUE1gKgUD+qEJUIZbQxgz9a0bWhwRumLKZYBspwGp8h+yH4Hs4h/f09Sa0FnjHb29fE1xcxTDjmYe6j0AydGphgNSF8+4S9fsmpslnOSkHawoHmqIq92Qd4ucIFt+Kf39ODbWfaQcwXESrDU1qEZw5JGjUzV6Eun+3yNtMy+Eum/gtU5A2aneHjqj9068bT2Xvk3ROEMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199015)(6506007)(38100700002)(2906002)(478600001)(6486002)(2616005)(26005)(6512007)(186003)(316002)(5660300002)(7416002)(83380400001)(8936002)(36756003)(86362001)(41300700001)(8676002)(66476007)(66556008)(66946007)(6916009)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cQGkv9WK05Q0FMNC625sVEr1puvhlB1fwM+TP1bOpXrE7SXgZsMkrurgs8XJ?=
 =?us-ascii?Q?YOL5mHRVAhD1dQg1EGC+lzZ3GUspDxIiNF3pAaESv9qqdjzJ0jRZPkAg0OF+?=
 =?us-ascii?Q?CQ4XbdBUrj4S/QG1jUt+BD7e7yuOjJsterB+tcVl8jfKW/n3gubjPbWXOBO3?=
 =?us-ascii?Q?MaxdLD4iqL8UYnXH3+pWTlNqXrHrWQKrdFG8v4IbxfMFKCAsG795uNqhauhS?=
 =?us-ascii?Q?Yp/tWsfmZLLfTpeOxjfPzIgPJFot5M9VBjOxpwLSM6P15L1EV/c10NGvyQNu?=
 =?us-ascii?Q?EHUwjTktEyrg0IhYEJPd4YtIIHOoYH1IDaZ6pVTkqHftKvmD0SjBaRrMbO1f?=
 =?us-ascii?Q?MQfffLRmOpMeINhM2PhatXuVtTkVE7Qv0lTbyzpzeKOKs4eNnjO4mVX4zl27?=
 =?us-ascii?Q?B3oSAHcRQ8T3/Ur6u5SplCA/tRKlhpP75MpzhXqn+M311IZZxYfUtrzTLuF1?=
 =?us-ascii?Q?02x2iCiQXYYg+2rJgdtQS1bX4g/rrRwiT9811dnsAvBRUMn9V/K1Pe+rOz7J?=
 =?us-ascii?Q?0GX1NRgDr55KV0gIO/7UWBNQmhZoIU6UBxcwO6XYCJq+Dci30OgHi9pGdwmP?=
 =?us-ascii?Q?Wf/x4HemWCHyuLdvFUg0Hk5LXbyoLUk3A56N/0n3Jg0cAEdlxXmulXPUpC7y?=
 =?us-ascii?Q?KtTeEMiM6n2EHvM4TuzCeU2GKwCk/tpu9P4+OE/4PdBSuNISUtJjgY89xe1K?=
 =?us-ascii?Q?9620UuvzGYNPpN213/xpsXvBjl6GsnVnfplGNXikRrdadmhBolcDjfSRUNIU?=
 =?us-ascii?Q?HlqUND5mMWHpu+mxrweSsnptTP+tsZH79qaNJvZaOMddCOgmwA+0oUANbhkM?=
 =?us-ascii?Q?o4a8pA/O6st+zk822o70GvMXqwzZRQ1U2Ddl1+cUCLDJHPuALJyTtWzju5wp?=
 =?us-ascii?Q?IHkgx6HlomuN0X8B3Y7U0MC9RkeOyeNP06WX2AFyHpx4JIq2goTRF6n5QQgE?=
 =?us-ascii?Q?Okn2a/J9E9MwM+BHaxvVKaiNdaV27ZHMAmEE2pWwFBUqLkxZ0reTbUxSfSlH?=
 =?us-ascii?Q?7Gr/H5LvldZuyeCtzupAF+SOQgBvclXU6hbKfMf0qEdAPQTBjrPh83rZPkfd?=
 =?us-ascii?Q?OSo664gHgmmqaQMn4OPFwmwYxh5YxJAljKETCsvub1i2xrRRpkLY0nQr3dij?=
 =?us-ascii?Q?OQ3ZZi4jjamjIFaQKO+eNKDcfa27hIhCaRFIktHLnpm2+ZGx3WGZUoCmC5ce?=
 =?us-ascii?Q?ngYBwJ+CNgp9EX3oUNEqo5g6rfSPeWqWRxa9A7emYrsgJHQ2Y8Jm0eGoFuuU?=
 =?us-ascii?Q?/dlpa9tz0eTDrOHy9oz6F9q3/uIUSPP1bSF2i/FoiUFgi0o5Ud8FvrjOJECW?=
 =?us-ascii?Q?TBXAlXcTzaDVH8F0NImRu2APeGsMNjhZ74UTvraHTnCdzGixe4RcCHn+3mx6?=
 =?us-ascii?Q?VuKgSRFBLAV3eIwnWhYlyKaPt4LHyJnN6oMmLxfhwsrfzY92lCWzOBEq8K6z?=
 =?us-ascii?Q?nWTzS8UIc39FACDIZmKfk3ocdv24Zawg2WQAQkozfYBTyQ1AofJ94rkHgyf8?=
 =?us-ascii?Q?ZK+PRAj0R+or0nXoGq5Ddr/YuiIJRuc6VRUPIiAgI9EKnyiYJu/Eeu+YpdLx?=
 =?us-ascii?Q?4+tZRic4jUKFev2dB0cR44FAhAYIsg9IRw7bmV9f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e744c70-a4ac-458b-3e24-08daf27df905
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 20:13:29.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RnyAtYdkgBhSvKiZ3Oaq0i75GYQi0f4aaGGt/eIlKDxaJf1aJs0nN8kMKq159We
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5281
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 imbrenda@linux.ibm.com, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 david@redhat.com, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 pasic@linux.ibm.com, alex.williamson@redhat.com, kvm@vger.kernel.org,
 pbonzini@redhat.com, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 03:10:36PM -0500, Matthew Rosato wrote:
> Currently it is possible that the final put of a KVM reference comes from
> vfio during its device close operation.  This occurs while the vfio group
> lock is held; however, if the vfio device is still in the kvm device list,
> then the following call chain could result in a deadlock:
> 
> kvm_put_kvm
>  -> kvm_destroy_vm
>   -> kvm_destroy_devices
>    -> kvm_vfio_destroy
>     -> kvm_vfio_file_set_kvm
>      -> vfio_file_set_kvm
>       -> group->group_lock/group_rwsem
> 
> Avoid this scenario by adding kvm_put_kvm_async which will perform the
> kvm_destroy_vm asynchronously if the refcount reaches 0.
> 
> Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c  |  6 +++++-
>  drivers/s390/crypto/vfio_ap_ops.c |  7 ++++++-
>  include/linux/kvm_host.h          |  3 +++
>  virt/kvm/kvm_main.c               | 22 ++++++++++++++++++++++
>  4 files changed, 36 insertions(+), 2 deletions(-)

Why two patches?

It looks OK to me

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
