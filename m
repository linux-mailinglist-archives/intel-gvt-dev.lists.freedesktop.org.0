Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E34FFB2F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 18:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EACF10E69B;
	Wed, 13 Apr 2022 16:25:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F9A10E69B;
 Wed, 13 Apr 2022 16:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRzYfTTM8PQ1JDbCxEtzAsr24Kr1xTbCPrczGTs08CYS3PmEUtAgX/Cq+9+nhKRD3rQgpJyvYdStKaclEFHkbbGZyeukbmI7YujG+KHnoAzsoD12pcILBA+tP76YbdYjXBuHmv/EEeKv9R6V19/EqlIQfWqQgMlH+qq9kGgA/ps5ZvPkk0bDAjM/qXNkQOqWnXjMLy6UKtT8PGPYMoGvXTy3J7IgaKxYpV2pCbHtjGrWdH9QNcvbL/d2xP0guPX/7YUNMbx9x7V9DIAReqfFWndKqcW9ZGKS2hRurFgqGz6T3agRNrI3t/80iizJF7Gm/4Gen4h7h5g+AYevDZBcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEfBa3Z03ht4Ld2dYPxsL6SMenssckZYQJRvnYHifuw=;
 b=Mq9u78tmyiNOz42YW8Hbimp5BOWUBmo+DJ/bexmX4nFtF+8lGS16DB/5DKiCmkzDFgXVL5pE+rUEnjgm1KTfhcdbSwdwC0BFaKprhjvYCRmW6QhUiZ8L9rkdER4w5/ezYIF3YzAsil6GUDwTcWoonZEd768RaHhw5U3QsQqmw5U7hKaLE2RgnvZTXno9iqcvYufTY+bzf6vAtpNbeOu0e/eMRyRFZgLtCWZ888jtUrb7sZ+l6o2BmaXI6WinXTqwSdt1CRP1GhrrWGldGETkezv2GA8n6Hoi5mCbpGwYz7nAL6brgmf8SFc0DFTlkoYlzrB3iGI4ZKkM7pZUoMLy5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEfBa3Z03ht4Ld2dYPxsL6SMenssckZYQJRvnYHifuw=;
 b=nMeTDTHCS9moJqSFbSTQL8Rnqg/kCCPaQ7H/l7zfpgudEG+6DVNySYgj7RY1VZ+kRp30Ei+A4iV707T5cmUnhbtNT4oIylxt7bDlKRLw3uf1mM/zQTjvAS0BoSqJSoKZOooY/sdqJ81wMHCy3NuBatu+cVNIs7Qgw8vY5WpnwIjSeNEO/U++Mbu6WaW2nqFfrptUGc3Gp5ZKh5XfZsoPvG5+OJBUxAJWAaXa7ItGgD0UM2Q6+Vf7CCF9tG+mCrN5Rjzt7wbokJ24yyTmX+MaIwhrg7ECdgADNzUwRHpw+y+ViTdkaaohlDaOebrWm0vO4H9N5pXel0eLAFlkvaHfMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 16:25:21 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 16:25:21 +0000
Date: Wed, 13 Apr 2022 13:25:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/2] drm/i915/gvt: clean up makefile
Message-ID: <20220413162520.GT2120790@nvidia.com>
References: <cover.1649852517.git.jani.nikula@intel.com>
 <20220413154120.GC27532@lst.de> <87y209ezq1.fsf@intel.com>
 <20220413161212.GA30300@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413161212.GA30300@lst.de>
X-ClientProxiedBy: BLAPR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:208:32e::12) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a658ee7-0ae0-4ae0-39f5-08da1d6a3482
X-MS-TrafficTypeDiagnostic: BN9PR12MB5242:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB524291131720F3C67592F787C2EC9@BN9PR12MB5242.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /eyP8CAfaUpm2mOj7FFg8TeLa2R7L0+8fLVfOn4TXh3woCM3lyvz7Ey3Ll+8PpE7HLq8N2Rf3GPZUyQorJPdKT6+uQIW0iSBlC0lOiU56o6O8BSuHlQPyOSt8eCtjASmqH9ZGFbLvpe2EwCkHrMIqUVxQhiS7QCVWCNNsWXiENuvCS/PjyRqpOt+SQoINMeHY9wzCDnTvdJpoHDLWVEQ17fuhhHkZ4+f7EDh2yLcCnu9SGjQv2o45BMXFCHCPnVDDR60aSeWVwFLuYDlVW++xdJKhH/eLrDpsnwQS8o3ZVgTp3VlPdzsCnw6Hn5yk3ZUKosbM2hD5r/t1MdozLZfRrKrpbEzp9G8b1MX2U0TCqX5NtBzGP5VYU8Y4LI7IzUSuBDc0B6ayR3xbX0dHgLB3flY3+kvWi+1/61sAHZvmL67Z3xhgYI4MUoQwOhFRCi+JkHb/nnlI8L22W5uLjVIh+5baK4ITF68PBEBqOco0/Of8Aj6Av0HkgRqfPOyADhKUDowdADholFh/ZBmR/3o9ywJHF4Bw/SmKmQSCyXhhIxh68ZAyo6CYYx27iAZkfiXEsFuCxyOE9cAw7KuSUFV2Axr5nE4XjgoeS5bjBi1DnYNwrnRywT7+L9EvzZA+MHtU3czq9DtvjSo/1P+leyoBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(8676002)(5660300002)(83380400001)(6486002)(508600001)(2906002)(33656002)(1076003)(4744005)(26005)(86362001)(186003)(54906003)(6916009)(316002)(2616005)(8936002)(6512007)(38100700002)(66946007)(66476007)(6506007)(4326008)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8dPni4QvDfyfHqM10AuJFI29cmmUFAeiiSf8W+1dWETK0I/KFRz9QuvfgFJy?=
 =?us-ascii?Q?QxrdPpJgvRZy/qAUwKKQPPlENwWfFf02cBFz+aox8yeN2/AlpKu89cql7j/5?=
 =?us-ascii?Q?V7xLKa5EeDoK2MqAtyhsBdURIy29tUlBso6dTVn/tgtRddgoP2awLCOtALFb?=
 =?us-ascii?Q?LY8eDLFtEqHWgU7V7IMPM9TufOU9lPzCBSvo0DEBjD/myxRngg9Jy7xr/Nn3?=
 =?us-ascii?Q?ugETyrUIQwiMMWHaFEmiwhOsnPahFPnp+B6N6cIWQRYcjnXvoFK8ierci19o?=
 =?us-ascii?Q?B6YG4tnCIvlTRr59Dg3e3+gYN3cA5y5BzL9SijcyRsVe22E++uL92fN2B5cy?=
 =?us-ascii?Q?/n+iXo0dR+6rUVRAhWu3TffCuArckyhx1lA+3EP2qbVvBsZl0wA0IfMsFug0?=
 =?us-ascii?Q?Qr2J8ZbDzAGkkBogaZ1k2ztkYAyFGjO+fbN7xsaRim7ikhWsn5d+KfYnLRK8?=
 =?us-ascii?Q?rOo/Ksf7TzDw/y1kSz23TKF+iwu+uzWCzG29nHe8fDpmjh4EgIPdSiluDdO/?=
 =?us-ascii?Q?WgadKRfAVWuZv1S3P7o+FkrDXPYjUfxjR3p6SiyMVHLq1JXxuM1wL4BJQkf6?=
 =?us-ascii?Q?8RdJTmdsoE8HXh7Yu+kVlcKFfktSAn/aAKpGJCTmmDVzXlGggb1oalauT+fz?=
 =?us-ascii?Q?P+d6v/SB8qR9loaqDJqeO3SS9P+T++opKCGTu5fMH4QIltxoBObSd6Lk7nWn?=
 =?us-ascii?Q?u00M7Zlre62HvLR0NIX7WCsMyFmeXuTbEJ6H8dsuAs7Eij77d51yfdPY5uT1?=
 =?us-ascii?Q?LVYQ3yx4JXwSc+D1CCryKIyBVIGmBiB8cJ/FbFtTmcTGQ09I8L+GCyKig3Ij?=
 =?us-ascii?Q?+585Rrh7llWW+Zc91KJL3szkN2/Zaknuyi4ZWD9oDoCSYh8FwMQbOAsrcY2h?=
 =?us-ascii?Q?uj16WIjLleE+zrXifi7XmcaqzFxIg3Ewjsj+nzEkmmAfsB+YfOTobrwQjzBj?=
 =?us-ascii?Q?8//vBHWHq4tCwHaDvCtaTy9CzL5eqSL0iPWnAq5HbdbvPRWf9a7SU0IOFcse?=
 =?us-ascii?Q?N2OzfWYReScsT0v1fwYd5efIWfnT9O1itPNync9gJQEBWAsDTL/ej1B/GaIE?=
 =?us-ascii?Q?baNStUYclqoKpwihzLtEeWVAej4F9OqUKnWQF2r1mbpe5t/nbZtp4malyCNd?=
 =?us-ascii?Q?BaTlxm6yhexwnbDIT/FT0xjVWGJgU9Ks1rHLc+Mqh/T7IaGrZIo6lI0K6Y+r?=
 =?us-ascii?Q?K/fMvzzbocR9aP2OulkarNs/SWAMFxIcY+E61KwRsfxFspqZNim2sE4O4D0e?=
 =?us-ascii?Q?yEanBK3e5Kguf39cCmZ7F40Oocz87LHAk3UdtcOnregng/TYkQa3dIOjNLWa?=
 =?us-ascii?Q?vkPk7ODUSEHXEeOf8AwKpUXwAUUqP3Co/xfw4GriA+K2spY8hILAAN3RNBtz?=
 =?us-ascii?Q?DzMHCKn4zHBSi4xWxq7j5s1ZdnIa/xN1EF4JFjlNV18bQKZoxziXCoFYpivz?=
 =?us-ascii?Q?tAcmFabCk554S14+SASeQ+ER+WM7kEFKbBp+ewHTvBp+n8kvlLwLV6a7nDsd?=
 =?us-ascii?Q?NqGGGoppQPcaneKujOhOowVAqnS4rKDJiQRnRNMJRIZ2p2sqf4TYXdbXnK4M?=
 =?us-ascii?Q?yxVtL9UCjIGbNO/criI0UqKksOAD7JCGSAmt5fOGsobcDiGuAXk7o/6WWtJj?=
 =?us-ascii?Q?2qmGv0tCLEwTgCBPViddYCTIxk8HsOm7kwlrmcQShwdCYnXI6saO0mjFH2pK?=
 =?us-ascii?Q?OjpJQ0klM6mup39fy807phoMyWSCGcOBQtKVgrrTPoPhXCLJCxK5WhKb7TMm?=
 =?us-ascii?Q?DYhj5NeqiQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a658ee7-0ae0-4ae0-39f5-08da1d6a3482
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 16:25:21.2128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9GnAtmzdXkdI1luT8xR2S8COW0eauJ4oLyZxeTVHBqYnxZKkNAN/FwBGzGQrH0Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.wang.linux@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 06:12:12PM +0200, Christoph Hellwig wrote:
> On Wed, Apr 13, 2022 at 07:04:54PM +0300, Jani Nikula wrote:
> > > v6:
> > >  - Remove the reference of intel_gvt_device_info.(Christoph)
> > >  - Refine the save_mmio() function. (Christoph)
> > >
> > > which don't belong in the commit log.  It might be worth to fix that
> > > before sending a pull request.
> > 
> > I'll just note, without any value judgement, that it is customary in the
> > drm land to do so. They are fine here even if they're not accepted in
> > other subsystems. I'm not going to insist one way or the other.
> 
> Ok.  Seems very odd to me, but I guess I don't spend enough time in
> drm land to know this particular quirk.

FWIW, I've seen netdev has being doing this too sometimes..

IMHO I prefer maintainers put the Link: headers then we can get the
changelog/etc from lore.

Jason
