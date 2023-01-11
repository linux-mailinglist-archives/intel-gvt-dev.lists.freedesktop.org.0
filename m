Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAD66647D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Jan 2023 21:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EAF10E802;
	Wed, 11 Jan 2023 20:05:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8AF10E7FA;
 Wed, 11 Jan 2023 20:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6HuHcRWfy8ZhtRYJvIrWxISfgtcR1AZ8o1FB14pJMLhMwemiqkBhbOPmGDu2/68i6pin2S14nU3tql59cWuN06DvNG+G0yQqRaL+EIA+FFvLInFInNDtg8e/xuOJtox6983yEPBE4Bk5bNJZgHn/xewEhpVx8MPabTlY4CK77f9llTYf6xeg4OZvvSUz2WWZK98YUA+K/mYgbZicuatn0hGcknzUkTl8un0TG9C3q26nB176kUU2XIwoM6gCWfqDqBtbRrkXIXOyFLAXYYgmetAga3SV32GG9rJRYSRLqYDzICE3H50j1+p9h/zsWwDsTu1g8zSRJp6C6ELOJVpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt2ukDMVqYKWAhqLxCmKVvcA4i4CxMbXPvDlZL7FZy0=;
 b=Ae2lGpy0rsb+OKvUhIGR6zl+okV3mOaEnnvKlSWH0tqVKkNHhMq64OgFTOXIEfGrxJqGIznpChMEdQQMSnyXlULAM8YxaLwXkQ1GPOI7F/z8mR7P+WeoAO1dJ5vPsRrT2fziMaXIlZQprQvilcioXovpLGvGVHhP33n48Q52EjK2q9kY69xXDDWRddOEu4fF89gn3Ly26AdIFVGReKOonAWLbdg1id7gihqaB+44EsZ2bFsm72asoOP23/HNZYj12D1LQ23Ez0h1uk3ea+fUoXFvH+Lfzesnd5H4J9KxappAP2UwAs2g26yykM6NYWv0yBl8zRgR99ZjGDCXdZQABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xt2ukDMVqYKWAhqLxCmKVvcA4i4CxMbXPvDlZL7FZy0=;
 b=W1QsvQ4wloskNfc7z9yKI9kcrbUv9NDiFhpXYwY93wsPkX5VXR9oK1yIKYLvEkN94zT6HjKcONFf6PJ8iuVtcVe5NsOfh9s70swAFYPhSWJ8+Tj6xIMu0VosspMWzpXWB5JIoUgiqYYA4WeCWJil0BJe1xQMji9GOIm8B4K1RZUm5NQXJxfdkq73sOMHH851xgmiQHtDyHd9m4atr1auR0nxM7m8FUafxKivtj3aVwunQRgLurjmRKxf3Yqfe3JDOlB18AZV7mKg1AolEzWKy2uL+3Asmnlabx3hTI8pxN0nVbO3wM6QjVAsYsE03+RONhCx//SmLz/Y/tWt0bML8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BY5PR12MB4935.namprd12.prod.outlook.com (2603:10b6:a03:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 20:05:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%9]) with mapi id 15.20.6002.013; Wed, 11 Jan 2023
 20:05:41 +0000
Date: Wed, 11 Jan 2023 16:05:39 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/2] KVM: async kvm_destroy_vm for vfio devices
Message-ID: <Y78Wk2/P5+gLMdpk@nvidia.com>
References: <20230109201037.33051-1-mjrosato@linux.ibm.com>
 <20230109201037.33051-2-mjrosato@linux.ibm.com>
 <Y78UCz5oeuntSQtK@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y78UCz5oeuntSQtK@google.com>
X-ClientProxiedBy: BL1PR13CA0374.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BY5PR12MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4e6071-8626-46ef-398a-08daf40f36ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HAa813yoz6EdhKKhfMXZf1ITQyeMxYm3u1nsQs75Gf0odKIWvKTKDff9SnJjLLmxUSp2NYcOMejRYbMEAJtf5aZL+bQZrdxr9amwfYNkTydMBLbWMtnfdTeht+K4PB3bLpoiDGPyp6BCKQhNrmUf/VxDoJPV7LK4tsRZW7pNyhdpEmTbE2gpYsY6HAvQtZW5FkUnhJ/Cm5A6AMOYwmpUVQBFyfmbh2/+Y4TzCBfUB2QTcwjGCn6hBMg/G98jbs04wGhrHbBI8kA/pUhaXU6Qww3pyVthuf7pejfsn3bjIwidGdBTFBOkiDYs3wM6qiVVthubi5knjehEBLX75lpHJgOFKFiZMYqOBBnwFSxkPrh2GxpszkYLWzJqV9FYNumQxOo/obkcP9MwFQSrbUfdZkrOVr7H9Yw862u3C8jfDceBWcKBQNVOKdyH1MFdbJ4VuyQDafkLUswn6Ggrg8nFJsP7c6pAiB1qQH28t0J5toJQQ/9gN2Jk2mr3GlPcxH57K5ygFTsLT66jmWsQMXK/OVfnCv6GRqK26QDgXr/KDorvc/ZChGp0k/dVLRDiSp70/9DFe8KhIRpi3UIO8uL0FT9pYJHx6UTPA5Inc3FHD5MU3paVAuhLiUFHYi5QrYjGfXl80cqFjR89o9c1XxpyHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(86362001)(6506007)(186003)(26005)(6512007)(36756003)(316002)(38100700002)(478600001)(6916009)(2906002)(6486002)(83380400001)(41300700001)(2616005)(7416002)(5660300002)(4744005)(66946007)(4326008)(66556008)(66476007)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hr7sYkZK7JmRPuF7AOi7inrJDuFi1goWnynUV1yL0JDKPgP7M849xtWUOqh+?=
 =?us-ascii?Q?LPu6SaJdqFzJRTeKrKQM+WEz7+aqMoPcimQ9kTQKKx9poInCiXlzbNtYuZQp?=
 =?us-ascii?Q?3dpAeA1XTMZVpWjenSNipp/HNF3FNLWCz97FVg83ZO3Y+br5Y6NOEpm4nNa1?=
 =?us-ascii?Q?vc4Q+64t1ji6TXrHIv6SkfAnMO1Hxpb/Se0BPxtqcd0myMI72ZSDenZLz6mK?=
 =?us-ascii?Q?3GKrZlTS9/24NSm7WteHM7EW76Hp9Z2x8vggI/YlsLXl8qcreXT2s7+r3lYn?=
 =?us-ascii?Q?XmuFnp5ZRZd2bu+h6Nit1fBRS5QmDRCSv+Hof5DIgWYHUd6831WLdCS/gDfX?=
 =?us-ascii?Q?1j/RPqaNqhMv4SrDCco+6dfm5VmOCw8wEOQzDzuQduc/0c+FVR99P0BVEkCL?=
 =?us-ascii?Q?ayohBwRNQXLham/epi7TT8YUy6eb3VoVwhzrW85drHj+deZzuqFk9QsFdlQW?=
 =?us-ascii?Q?+L6Fs8PtkSV1wU0VWNHEEpwHMLr3EYe8NUTqhKkIk1v37eI9O979T4TzTkiB?=
 =?us-ascii?Q?tX0aojsIRg2U1Z/5g2cHUltF5bZ4T4WgI48Zyb8Vp8sU1CXJe8PUIJwzjiqU?=
 =?us-ascii?Q?h1h5+jchRQYsiaLd//xDE+YVGWDqJVemKtIKUW439W9OklMWadgcas4LcDek?=
 =?us-ascii?Q?g6F56ROD3xU45wftQi93LOu8SD79qSo5bPr3eW2P2dg8cVBWjukpYDqObBGv?=
 =?us-ascii?Q?JQY8zaC5r3XGiSpjcxUZbENblaDLUre3HkL35seC2qe8rIdIsclRPIFCS5bj?=
 =?us-ascii?Q?UZsC4FaKdxyE5XEKjKCzp7VayoKhlrHyIt/TMrFcN3jcF7HigBxdcmuhGqQ7?=
 =?us-ascii?Q?zWJZeT2mqfobagqQ5QWfheruq47yklr24RCf98xbqhuSnajFi2zf6+FGEB02?=
 =?us-ascii?Q?gl/5x1GTstXErIViyQtoQt/q/p3MeBrKlbsd5u1WDuaGWwnPAuRVwRqdXz5a?=
 =?us-ascii?Q?xkzOJLIXnD+YM9uUPl625zc/1p32bTAdZvOZ9/rct9jsSdnOIhpFBeExsVfM?=
 =?us-ascii?Q?hdf3r7jKw7rzQpQy7uYsP/GIMk4ivZjoZpg73k2FP8j7RJWc5lxH+XJFMANl?=
 =?us-ascii?Q?h+n7QNez/ta2qz49nlLvmiaMpBbN+OjP/DUSjnvrK0mjOTwS4qxOQpQX49IZ?=
 =?us-ascii?Q?mAz7cX1YjAjd+aZdtz3Leg6H73Ds0nItogI8EZF6LSlzEcHKh1+RQTheI6o4?=
 =?us-ascii?Q?+DpBei/QLQm+xcrc62SRKWQFeOvGM+u15igIGo6LfnImuUU22E/Wjn1A7yYE?=
 =?us-ascii?Q?rpC47+JnNNbMQbj/eM393NnUG8oXo8qBniBQVLlO2e/SwpmWJdN811hX9gw3?=
 =?us-ascii?Q?OjdX/NMd5b1kX4GhM3uyok17zxgJ+kfCP2Rg/20yVnq8hzmJ8503Huze0gkU?=
 =?us-ascii?Q?vUNpyNnLbPgUMjILcb07nEF9oEcd/kWAOJ2YOl4YsObXbz7HYIhlknuo74Tv?=
 =?us-ascii?Q?RDex7L2wmgMIZLQveBM+hwyfKwsEYpNBfY7lsf0TUyQNvls4ZS2dbHUDWrO1?=
 =?us-ascii?Q?+NItz4VCkPgf5neYvxqfzy9LcXuEtJW/j766xflwekWN7T5/v203v19oNhi7?=
 =?us-ascii?Q?SZMjbPQCmkigiAeilW3EUF6k3U+Gres0f9vZWTMz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4e6071-8626-46ef-398a-08daf40f36ca
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 20:05:40.9286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2amaGh9cLYLxLHhDrwLRXuqsnwMeboU0vUKiM+cDrZ5uJZ7BA70JF0V+9GR7/ewI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4935
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
 imbrenda@linux.ibm.com, Matthew Rosato <mjrosato@linux.ibm.com>,
 pmorel@linux.ibm.com, david@redhat.com, linux-s390@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 alex.williamson@redhat.com, kvm@vger.kernel.org, pbonzini@redhat.com,
 borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, frankja@linux.ibm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 07:54:51PM +0000, Sean Christopherson wrote:

> Something feels off.  If KVM's refcount is 0, then accessing device->group->kvm
> in vfio_device_open() can't happen unless there's a refcounting bug somewhere.

The problem is in close, not open.

Specifically it would be very hard to avoid holding the group_lock
during close which is when the put is done.

> Rather than force devices to get KVM references, why not handle that in common
> VFIO code and drop KVM refcountin from devices?  Worst case scenario KVM is pinned
> by a device that doesn't need KVM but is in a group associated with KVM.  If that's
> a concern, it seems easy enough to add a flag to vfio_device_ops to enumerate
> whether or not the device depends on KVM.

We can't make cross-dependencies between kvm and core VFIO - it is why
so much of this is soo ugly.

The few device drivers that unavoidably have KVM involvment already
have a KVM module dependency, so they can safely do the get/put

Jason
