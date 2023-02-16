Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71A699751
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Feb 2023 15:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09310ED73;
	Thu, 16 Feb 2023 14:25:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8A10ED73;
 Thu, 16 Feb 2023 14:25:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijdBlvzu5ojp0NQkrIkSP/gBRAQR8q5RiVztyPRkAHw1JuSlgRo8wB9hzg8cBPjn6N5bs9W1EAdUnEGZiyyu71gBIkGhEXruzuXBZz+8riSUfq0tjSTW6tn5Pz6Wl8GYKaFw+FIsVwZlpcPFljeD0NCmc6+u06QmOlMIDQaTkpNkkXPIS32EnTqSWV99/ZGOp4JoDBVvw290lIccuC6iRZN3vNqjXIWm9reKx9U1e52wVLiapiT+TfugHN8TgiwE+nbydL3X1ROJPE6WfiT8damsscz7AGdIDQJjCxkrfSS8X1Zsoua0pK/TLA3Mdo5O6g216/I8SmZeZKPQvZpfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+70/tiYo5gvlGOyFdwesywpMiH8aEgMjsgDL56cHLo=;
 b=YxDUdnU8ayDfx+XJSp0D0ksxhjp3avVRUglFDWd5iLDevzVpmql4vNeFWuuoQ27pvnkQW6kR6CXF9SH+pk+/vmHj4QI9sCylCF4+KKWPS0odS7gCU+YE0yFLC6E2HsqPIwuRjWIOj8e63tIPkI2tx8BG9uhK2LAouNtFQJK0MCFiTvnVYzHM7/+dbCIxQ8FAcGLi681TR8Xw6vEAmv5LDD2G5ROTENg+KbMVQJsFzZFl8zKtBYQ8DpxV9GOSl0s1LlGD3AXn8+31UCOvoR9E07Do+Qn5kxG18SDTgkNyiRgnDs4vAMO2OqN2v+Le02SNAt9B9F0/7jV0h+lQI8ZvOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+70/tiYo5gvlGOyFdwesywpMiH8aEgMjsgDL56cHLo=;
 b=AvNRs7THE4LPGBw+0Ep+ctkcIwqINvh9DU0OOpDyUnF9j3iJnAw8ivFE4YA4kHKrGyjEX+FUG2mPKW4Z8r5/8mh8jM6IzbhKCQoqalAkI0k8KajJwmXLniMNGa58/PwTCBDD25T4arFS4NAwA+IimVW3j2qN9/E+GnG0/gws+ZKcPl/qjgSotzFgugiqdnSwDCczgI2/w+1RBgd0jFOX5OKkb3520/fMu4HuGFBsP21tqNCkmyb+X1elr15lrD/OhJ6mApARqWKJOivOBixFGQp1Cy/DwNvF/QmAM7AyHBC+YJoOv7vJ2kXnY2TT9qj43qLC2CMaX2QSUTv9K3Z32g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5222.namprd12.prod.outlook.com (2603:10b6:208:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:24:58 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 14:24:58 +0000
Date: Thu, 16 Feb 2023 10:24:57 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 14/15] vfio: Add ioctls for device cdev using iommufd
Message-ID: <Y+48uXLCb1YlA+a6@nvidia.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213151348.56451-15-yi.l.liu@intel.com>
 <Y+3oObuMG/v3+x0N@yzhao56-desk.sh.intel.com>
 <SN7PR11MB754074DEC60C9852D42EA4A6C3A09@SN7PR11MB7540.namprd11.prod.outlook.com>
 <Y+31+puocZcGFnSQ@yzhao56-desk.sh.intel.com>
 <DS0PR11MB752979FC4A54F6459D7A162AC3A09@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB752979FC4A54F6459D7A162AC3A09@DS0PR11MB7529.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR14CA0016.namprd14.prod.outlook.com
 (2603:10b6:208:23e::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7e63d7-3643-4eeb-b2af-08db102994d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uP8cNqqzUhybryuk8ybzk6FE9E48HsiNTZDmamtkRpNy7pkI51cm6kKynlq9Wv1gI5Ty7J9K71Eq8P6Db+qMoUSI9yBSyH7NFO0yW+7m+vt9iUJhXsMABtKHgxuXVgY9tMOXGP73AfdU08OL8RJG40Fr3Z4+SK1VXOGwXlzPEd+l0cRVn8nCybJy0HNATZ1lIojuYnlbfWER0mwwfXEX07ZM7SGGcwtWMXkz3oJY6XqDYki5x8TPIND5sJUrzRGgJ+f2+vh8FRg+y6aETkMMgNvE9bmgSIRH65ZuXJG4BGeT3+4c/Mlh6IJCwu10ZBNlQD/sQhXx0K2UJv4U3gC5D0/bHTeuyKipim6upVC/tQ9Bb2bTrccG1uhBG0tu8mvMZddLC4JbNQUCdFhV/HiG8RGNvrxxArxNe5exqS1OKLFmAKXqWPFc2R/5Bx7dBXdVfV59ob+MaztDW2jh++1YrYBr26vLTtUDBrbZKkn/nAE2ih7Jpnkd1WxRJX0OlfMaSrzj7lIfoA0Rtvb/R7D5DeiXL823A+uWrtQjAxtczR9VQ6ptvaZClXcLV1VpETMU4mORuVXHvr2Bs5ymF53+6IQrkfF46nftVINifzV/XcY7fA4CdHUR6+PraRzBJx7sXP0pwk6UGl+DvmsztNiIqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199018)(41300700001)(8676002)(66476007)(36756003)(66946007)(4326008)(6916009)(66556008)(8936002)(316002)(4744005)(26005)(5660300002)(6512007)(186003)(54906003)(7416002)(6486002)(86362001)(478600001)(6506007)(2616005)(2906002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2NSV01oVlhiMnFNNWNFMWJnRVByT2xtNmdaQXdNZlBGdmY0eWlHZ2lLcUpO?=
 =?utf-8?B?OXhWYWxlMm1CUStERWV5VHc4RlQ3WC92UjdEWUFkNUNyZTlXRUFOVGRldkVt?=
 =?utf-8?B?Zmo5clFJU0IweC9qbWx4ZkpPUUlWQmt5QzhuMzZmbGpDNWh4MTBVTkVyVDJV?=
 =?utf-8?B?YmVEMWxHcm5Cb3FkK3VsNGV2NGZSa3JIdDROZGhVd1hYd0g2VkY1WjJPbTdV?=
 =?utf-8?B?bHJyTmtqQjVSOE80Z0xvYlZFcFY1d292alNQMDVpWTdRZFl3Qy9Cdmd1V0My?=
 =?utf-8?B?SElKdXpIdzYvR1R4b1JlNUx0UW83VTRsREVTQUpvbU1DQ3BLSWhPNEpXZUpB?=
 =?utf-8?B?VUIxa0FVVUpnMW5CWXZteGpRVXJSclN4KzVXQzRuSzlqU01xa0ZwMFk0aEJG?=
 =?utf-8?B?alRBaGdTaTV6VU5TSHVtVlpXOHdha2VRV0tMVm9aTnJnT1NJWWoyazBwcjBS?=
 =?utf-8?B?NnFmU2Mrb1ZUMDUzYUN4SVB5aStGRUlOb1ZqanVuVUIrYkJFSUxjQnpoaTla?=
 =?utf-8?B?dlBncWsyaGY3bnJBN25XMDhKcHk5dld2bGxzVzZoYXIxcnUyempTdW4rYXNW?=
 =?utf-8?B?SDhMMlU1MHMzV1ZsaDBXdms2YVI0Zkt1ZTZuTk1uVHJidnhPK04vcWc1bFlK?=
 =?utf-8?B?R2ErTFJrNG5KRklEamFrOVRiSGF6L041Q3JWRkwwRXgvS3R1NWJXYmxTZVk0?=
 =?utf-8?B?MGR1L0tpWnFTUzNET0hnRDdRZVlKL0ZwSTRvK1p0NnZSTTlOVDJabjE5cVFG?=
 =?utf-8?B?SlhhUThvRmhRaUhzK1YvNDNTTGRsRVVZUWlBdUFsUVBlUjE3L25iWmYwZ3kz?=
 =?utf-8?B?dnBuOWprbnZxMnZHTlNpUTRCek1reG1XVlRnTm9lNDVzY3dXU3hEZjgwT3FL?=
 =?utf-8?B?WUNscXdPL1BGRFdienphQUEvV1NzUjd0R3ZIcklqb2w4NGhYNDcxYndJSkdS?=
 =?utf-8?B?dkRYVnU4NTBjWnVFZng3SkZwOWdwYzBMcE4yT29FcmNWeHR5Y1FDY3Erb05k?=
 =?utf-8?B?SFJlN0xmc2gwWm5QU3ZmeVFOWVdvVnlMR3pFNDUvNDNmTGxvRzBYbE9nV0tq?=
 =?utf-8?B?dWlMWjRiYVRvMGFieUJUTjZVTTlJRXkrRFF5blAyWVZzdTBsQURVRG1KWURD?=
 =?utf-8?B?UHVnL0FrUUZYb3FRVmY2MWtWblpKSmx0QUQwRkg2MlRRSUFaVUNSSFhRL2xD?=
 =?utf-8?B?T1ZUb2ZQMkxUU1hHQkdwUGRIYmp0Zk5saWhBVzA2amRjV2FCbktXRWc4TFRP?=
 =?utf-8?B?bzZta2ZYbjA2Z2JNaWZrVUNxZjR3WGJtempIYVJGWkxaekl0SmIva1VqOWFu?=
 =?utf-8?B?T2NqcWxBSWs5V25UM05XUkRtSHAvTWpiV01IVCtab1ZPK3dLU1d6UXpOcjJQ?=
 =?utf-8?B?VEcwU0RnWGhLalBDYVRqS2x1dFRhL0FUQTd2dTBjUVRkc0NKYU45Y25oaEZG?=
 =?utf-8?B?NTJadDNkell4REZsRHVsbytkbUd4ckM1U3NrQ0FSQU9iSGhNN3RRclJjcDdL?=
 =?utf-8?B?ajZacUkvd3Zqa1YxUlo4N1MyMFdqbmM1SG1ob2o4S29qZitSeHpJQ1J3bHZF?=
 =?utf-8?B?WEpEZ0VEZEdqTlNKNnJsTGpuMTltUmNPanR0UGY5RXByNlErYk9RMkN6MmNQ?=
 =?utf-8?B?Ny9mZit4T1RxclpwMXB5UFAvbVR5cjAvRXh3b1ArMkhLTkNTY2gyK0N3QUR6?=
 =?utf-8?B?MzBmclIvL3NyQnJKR2dCRFliTEZiNElVWUhxSWx3WXRaWTNldDQzcGNpa0hN?=
 =?utf-8?B?Q0g2MzQ3RkNZU1RuNkRMN3BiaGtVT2NsaXRXMjJVdm13eCt3QXVJallhY1dF?=
 =?utf-8?B?SEtYb2czZ0JSK0dHYU1sL2txYVduTDVIVm1jK1cyVVN3WGNrNjZ3VkNPMXJs?=
 =?utf-8?B?R0JMZWIwQ1JnQ1JicFFtOUZ5eHliNUp6aWRaK2ZOcDhFR3FvZEUzQzJQNXdM?=
 =?utf-8?B?YllFQzNIRktReml2MThBTXg5M2Q0OUdEMUFCUFFKbEpFVXNYeVN6N1JmYzlV?=
 =?utf-8?B?TUNIZ0lIb294aW01SXYybjhhQmFaOVljUXJTM1VvK25sK05IZUZ3ajUvWHNT?=
 =?utf-8?B?RU5ET2N5b0hjd3g0aFlCQVM5TElGYnMwaFBBUUJQNkl0cXJVeVhrSjdhMnda?=
 =?utf-8?Q?ZGjlKuklP5489iGGa2qmPTvP8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7e63d7-3643-4eeb-b2af-08db102994d5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:24:58.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MluBsHZZYzdOTj1IiSZ9sl2WWTMz0J3k4BzF/fXabZtVUAZxwhOFuLh7jpyv0bYm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5222
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 10:28:33AM +0000, Liu, Yi L wrote:

> However, I need to admit, your fix can reduce the reference of iommufd file.
> This may avoid file reference counting overflow if there are multiple devices
> assigned to an application. I'm not sure how possible it is though. 😊 I'll see
> if Alex or Jason have any preference.

Please write refcounting in a way that is easy to understand and don't
try to be clever.

Every stored pointer to a ref object should hold its own ref.

Jason
