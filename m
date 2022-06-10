Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E98545AE7
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jun 2022 06:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B9C113D3F;
	Fri, 10 Jun 2022 04:11:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42851113D3F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Jun 2022 04:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654834318; x=1686370318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TWyRfwMuq0AtP+7U9fcBEYrJVbDTLOb4OYpXj3J2Vbk=;
 b=hve+pC/6qwkcCBXiltO2uUWQ7KBguvGL1sr1+ZN0lFSBtVkr2TYuJT9A
 bLqib8wd+riLf/Y+B3N9fms1zdNWyLStNL+VhIl46czRTC7RVSPs6Jqmq
 +7OFrhED6tTtxEmg9uL/cWY3xO5OMM+spO5UE4UdEmw7AheHUbr3VLMqt
 o4wHvbpnnlsWraDxkyDlMjqZ6OyMFi+yiTbig5SCjQNACgt06kYNHOsTm
 RupSaJ2ccwrAATGPV5KJUYfd7LLtrjZ+F7Vu7HQB760BIKFVlYa7eB7BS
 JYzyte4bp8v/tbHY0IBYPUfrS1tU+YcSEY2XJ4PQho1OcBdAZX4oZs9oC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278646942"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="278646942"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 21:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="616243080"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 09 Jun 2022 21:11:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 21:11:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 21:11:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 9 Jun 2022 21:11:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 9 Jun 2022 21:11:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7Acay3dwKwMdL0s+oljc2Ff4ApC7TBNyJw5wo8RAJNbdaoME4PMb2M2y9J8e41paQc4MZcDl9SzgK/+Xve/tGX44+80YxbhXB1UKRObxRvnvcIXKQJ6TcAcYo19skhOFTjeLHlwm7A1CfwuIJtKNCe4qkHmz4l27OhxEeOgH7kve+Got/T3dH9rPuciJy3yOa53OyxZ4Xl/afJPoFTCKTTSAPmdfyEVppq0mHC4vLq19qwj44KqsQyOPWMI/T3JjfCj6qfsuPNvvBKNrnPk9gPnpeEVLDVSlmURQfGxdaEYlossfnKAeu03HtClFD+eDOGWAph2LRdC/ZjJn+7DxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ilceyWT5Chm1noXGSUiAM6OL1XycyuO5VujlCSe9Yo=;
 b=LxwGro/H5dkvOgjnmDhT7SDg4UTBW5FM8n38XXyB/Sk0C0Z+sBAYAa7g/JTmg3j8eXx9u9JrOSwNftGlPU/BBLxUbBWVoLswHcAvf3cY0DxbOeAaZ2OFBTXyVThS9T0vXtJnGVzC2aQdDUOT+xvuhRDVxzhsnGozbCSry2/mDmaWVEK7u35nGhd7kXpd9UVVBO+IdzOTfVHJUJWka019YKAe8wH6xXIvqAU2wbTzAKj85moJUto8PpnTKzjtR+zn+LiyaXaOn/Qysfx5X8ge5L8IjgNE9+uxTp8+I213FPMdJbbjbtYRDmjKR+GeNx6PK5n1X6NLLmzsbks3nD9qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BN6PR1101MB2132.namprd11.prod.outlook.com (2603:10b6:405:5b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 04:11:53 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::d518:17a2:11e6:bd6]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::d518:17a2:11e6:bd6%7]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 04:11:53 +0000
Message-ID: <ac9fc9e5-c2fe-c37c-ab96-87361248319f@intel.com>
Date: Fri, 10 Jun 2022 12:11:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v1 00/18] VFIO ccw/mdev rework
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20220602171948.2790690-1-farman@linux.ibm.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20220602171948.2790690-1-farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:3:18::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fd1c8db-1ae2-4c6f-044b-08da4a9759d7
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2132:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1101MB21324261FC6029B061F09489C3A69@BN6PR1101MB2132.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ym2iWp3/6sebOJFEBH3F5vx02EVAQB2HouV2QFLIPC1LgyRhHGF4sq3H3+zf3uym4pIbbaLsYaTuvrzxIxoyoMsWdDgbq3/rwRNtmX4dOzEt+RSHVCWFI9+lyr1hCDPCGXMUTtgckOOO8hLYInW2zr+cUA1Yavj5/Y9ayNsQspLv97H607pP8kHMZDGFU0gjRUUOLsCBBSzFMMXVFNZgFBF3yUvAzEhu0BeKUMoL5MtkznDskHDpxnVjzyVafa43WCZEqg2RY66u6Un0nI/LMEZ95kOvu/EQb0cTR83BD8iBqQpQKdIP99CUL9vQd/8ujwHRXBIuCwFu8WTLF1Ojv6TJY7gziPc5r6cdVSmO1FlklyqURxbeVbIiDcS1EIiibW2I+4vEt2eqpHYTynWAU1JAc0Fwq7Eic4bZyn1RG7SkOFiaV+EZNeqJvO29VvHP9C6chdB3I5OuJMcgpU2/hJu6ApJp8FQr1BJ2iDqmGcyllNQt3JZ5aAetxxuDwkADxShOH8TBQ420lk3azyU4QKkPD30bVIjPqtqJA1o2yVUE/EWfRQNvcXBoO65B+64B9wuQDWpmt9/dBHs9x5ciQC2/ijnm3hkkOlBT/BQ3POGTvPpTCHnetvc/TW9f0oOG+7Lbqo8rmudcBHpN0bbtpvLiYzOKUHpLz4ENw8xgqZe4xjk0d6oTxPZR8FZdZ7vqMm0L57coFns7qPLgAlCvkJJrVeLNn8JfODv79MDuVahguonOxgOy+PKQUmCEQAZ+bJLelAqQK1PfcoQgEezhdqLUtgDY+wEYF28fFSfRtfWie08T7r2dP3Mz/C2WZ2MywcFox0+ER6cOQO0VIL17zIeleIOwdOPV8fc94U0/wNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(6486002)(966005)(2616005)(508600001)(2906002)(186003)(86362001)(38100700002)(31696002)(6506007)(4326008)(53546011)(66946007)(8936002)(6666004)(5660300002)(316002)(82960400001)(31686004)(7416002)(54906003)(83380400001)(66556008)(66476007)(6512007)(8676002)(26005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmJ3VXBaaGJTV0liWlNKdVFPTlIxaHYxTThkcmI0aDVGaHppa1B3YnZEb3JI?=
 =?utf-8?B?eDVvNENvSm1YYytjVHd6TnBDMU12VzA5ODQ3NGF0U3NWeGg0dG1RK1JTalVQ?=
 =?utf-8?B?a2dDc21PWFRoVUlTdXJEV1haT3ppR3lOYmVjLzRkWVpTd3RKNHZLNXUvYzJ6?=
 =?utf-8?B?disvS2NvcU80R1dYLzMzbDgzL2N1QmVSc1RYaVJtc0tOTnVUTE8wU1h2Qjk2?=
 =?utf-8?B?RXlQM1J6dTVucW15UjJ4aVRQcmZ6bkZjbTdibDBpOFpudjU2aUh3citFL1JB?=
 =?utf-8?B?Z1B2Ty8wTE1qZjh3K2d6b0xBMFhrTFFWeUxaL0xLNHdBVHA4YU1Rdjh4RC9n?=
 =?utf-8?B?d0t1MU1HU0QzV0UxN0NnQlZIZEJTbjJMM2x0VDhyR2JvOEZBUHhyQnB0V3kz?=
 =?utf-8?B?QzRraUpaWHBkOS9oWlFXRnRLLzNkOTF5WVFsUmJXREFFNDduU3J5R0wyYW54?=
 =?utf-8?B?SkxwZDM0ZkFrbTN5R21rUjIyRThkSnVFWXNCRHEyZUMrMXo5bU1kWHdCNU1J?=
 =?utf-8?B?TDBzWStaTjlvOE5ueEFvQVMzQlNVU0NvcWFtWGlFNDlWTGVCbElFOG1HRW5V?=
 =?utf-8?B?czBsendQZ0VzMEw0RTMwTXo4c28zMkFwTUJQWHVpSUlYV05yVWxnTm5jckdr?=
 =?utf-8?B?K0pubk9PdmlTcmN5MHdkWWZrRnRkQVZVdWR3bUxOYURvOU14eGF1Y1Q4VDhr?=
 =?utf-8?B?TDBIK0I2VldZYVB2NmJvM3BEcXVlaElHRkQ2SlhaWUl5ZSsxWGs4WGQ2bXhG?=
 =?utf-8?B?dDIwUWhYY1NyVi9qUzJabDJvN0JxY00zR1NhanRzdzc4Z09CMDlEQm5xQksx?=
 =?utf-8?B?OGRicG1yS01NbXRPR3RlVy9pOFVNaWk4ZU9zd3kxVjhGdHZjNDFLNWFFNlB2?=
 =?utf-8?B?WDdsR3JSTEVYRmtLRjcxQ2haejlJVjRLZzBwUmYreEk3eFdnN3JiUlVTb3Fk?=
 =?utf-8?B?MXFjY1RUYUZ1Qm5tcGRmcHc1cFQ0eUwrL2loR0tRbEZyS3kvdmlNZDYvbW4v?=
 =?utf-8?B?Q0xDKzIzUGJzYWZkRkVXK2YwS3hWR3N2NnRtVForMWdweGR6NGh3ZzhIV2x4?=
 =?utf-8?B?dGxPU1BnMkhHN2pIREFqZUFuMXBybnhWOTFuamZpWVJhT0tacGhZTktpZmVG?=
 =?utf-8?B?TGpOQWx0alY4NU0yRTlZS2oxQnRFcCs0d3k5TmdlL3E1OXhMdFFNVUlvM2hV?=
 =?utf-8?B?cWYrQzlXbkMzbGl4eWVsZDJ1QVFFNkxZcE5OMzE1ZDVKTlVWVWpMNkxTSyts?=
 =?utf-8?B?TEdKTlFpVGh2a1Zla21TbWRJQWZSMk4vMEpURTVLNmZHSk1aQlBjSEtJZmps?=
 =?utf-8?B?aE1Bd1NhdVN2UThGVmo0QU0rK1prQnRqaGFoMzFjMEhhdVhvWHY1SlJQdS9W?=
 =?utf-8?B?dCtQcXZ2eGYwaTBOOWtyYU0wM3pKQVFRRmt1ckR3R3UxM1JoVTJKdkdsRUJj?=
 =?utf-8?B?empLK3hjU3ZyaXpwMHpBbm15M1E2VTNMZ3k5N25hcjF0TmlKeGYwOVdTQnJQ?=
 =?utf-8?B?cUdEV1RKc3U0WkFBbFJWdkwwa1V0Vkd2MlBjYUhOOEo3Zm9yeUJtNHQ2b3Rw?=
 =?utf-8?B?c2dTdXB3dnpKZ1VpU0dZU0pUZG9QSnBkRWhqRUUydFdoMHR6REc4eHJrZzBQ?=
 =?utf-8?B?ZXVNL25ESEZmQkNvYW9WdTZKYUYxYlhQKy8zK3ZFbVF5Mmx5NEZWOWswcVhL?=
 =?utf-8?B?dWlHNSs4UlY2elVQQWVwQ041anhkd2NBcy9LaUQxQjQ0Uk9HUlhQTGh2Q1B6?=
 =?utf-8?B?L1FDMnU0Wm5YNG9IbStRVW9USlZuYjhRSXhzM0trU1dXZ0ltUHJKYzNqM0JC?=
 =?utf-8?B?UkYyeDFsZDZodkx4VHJwTTFyZDcycGVGcjVuNG5yZFFzN3hYekUzRTJZT3FI?=
 =?utf-8?B?cWpYaUtlc01GanltTHFSTWcrTlUzejVpRE1sdWNKam5HT0wwaVBqWEFZVEtX?=
 =?utf-8?B?OHp3bFAyYWFHWHdlWlZpODFEVktOWlZvd3BhK0JQWUFOMXRBbzdSQmErVlpa?=
 =?utf-8?B?NUNHQWJVa3dxbUM5SFBkQjQvOEx3Tkd0VW5oRmZ3dDV3ejJrTzU2Y3hSV3BM?=
 =?utf-8?B?a0VUZjhWbXNmaGVQTW5XckZ2NGFsWEgvemJFK0JGS3c2TjBqNEhVYThFdFh2?=
 =?utf-8?B?SzU2dlpza2lwWXBxL1FFZlFBTnRIak5BZXpsakN4dE9KSm5CY3Nmd2NyYStS?=
 =?utf-8?B?d2Nkb3B4Qk5OSEpJaGpJZFAzZ1k5ZzIrQUlnVXBYVFRrUGZYdDdFNVF1c2g2?=
 =?utf-8?B?THliTXV2YTZ2SGJwalhmUUpOUXNvZ0Z6V3IyVDBjOU96VDlWVjdVYm1MaXA0?=
 =?utf-8?B?bnBiTXV2MVNVdmY1QzhQdS9DeDRkSjExcEF1eHIvS2daVHNrZVRtZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd1c8db-1ae2-4c6f-044b-08da4a9759d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 04:11:53.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVlNO3nuVtIZCq9fblMtkjnPvwW3B81pt1BHavhHQK06eVECtwuxSaPLVAmeecM1+bTqIYpVlEJS9snewdX2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2132
X-OriginatorOrg: intel.com
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, linux-s390@vger.kernel.org,
 Jason Herne <jjherne@linux.ibm.com>, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Kirti Wankhede <kwankhede@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Eric,

On 2022/6/3 01:19, Eric Farman wrote:
> Last autumn, Jason Gunthorpe proposed some rework of vfio-ccw [1],
> to better fit with the new mdev API (thank you!). Part of that
> series was pulled for kernel 5.16 [2], but the complexities of
> the remaining patches got them hung up behind other work.
> 
> This series attempts to dust off and complete that, with the
> goal of untangling the lifecycle of a s390 subchannel when
> bound to vfio-ccw instead of the usual io_subchannel driver.
> 
> Patches 1-8 are inspired by and/or split out from that series,
> in order to be consumable on their own (backports, etc.).
> 
> Patches 9-12 handle the goal of making the FSM complete,
> and synchronizing the subchannel's life with that of the mdev.
> (This was the goal of patch 5 of the larger series [3].)
> 
> Patches 13-14 are pulled directly from the earlier series.
> As these patches hit some other of the consumers of vfio,
> those on CC who are unfamiliar with vfio-ccw probably only
> care about these. :)
> 
> Patches 15-18 links the lifecycle of the vfio_ccw_private struct
> with the mdev via a vfio reference. (Patch 17 was also pulled
> directly from the earlier series.)
> 
> In the end, the subchannel probe/remove callbacks from the css
> driver simply register/unregister with vfio-mdev. The communication
> with the subchannel is delayed until the mdev routines, which
> handles all the vfio-related memory and subchannel enablement.
> There's no longer a configuration where the mdev is closed while
> the subchannel remains enabled, since that's weird.
> 
> @Jason: I carried the S-o-b/r-b tags on patches 13, 14, and 17,
> as they were cherry-picked straight from your v3.
> If you'd prefer your S-o-b on others, please let me know.

very nice to see it. do you have a 5.19 based branch including these
changes on github? I'd like to rebase my vfio cdev patches on top of
your changes. :-)

> [1] https://lore.kernel.org/r/0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
> [2] https://lore.kernel.org/r/0-v4-cea4f5bd2c00+b52-ccw_mdev_jgg@nvidia.com/
> [3] https://lore.kernel.org/r/5-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com/
> 
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: Tony Krowiak <akrowiak@linux.ibm.com>
> Cc: Jason Herne <jjherne@linux.ibm.com>
> 
> Eric Farman (14):
>    vfio/ccw: Fix FSM state if mdev probe fails
>    vfio/ccw: Ensure mdev->dev is cleared on mdev remove
>    vfio/ccw: Do not change FSM state in subchannel event
>    vfio/ccw: Remove private->mdev
>    vfio/ccw: Pass enum to FSM event jumptable
>    vfio/ccw: Flatten MDEV device (un)register
>    vfio/ccw: Check that private pointer is not NULL
>    vfio/ccw: Create an OPEN FSM Event
>    vfio/ccw: Create a CLOSE FSM event
>    vfio/ccw: Refactor vfio_ccw_mdev_reset
>    vfio/ccw: Move FSM open/close to MDEV open/close
>    vfio/ccw: Manage private with mdev
>    vfio/ccw: Create a get_private routine
>    vfio/ccw: Manage ccw/mdev reference counts
> 
> Jason Gunthorpe (3):
>    vfio/mdev: Consolidate all the device_api sysfs into the core code
>    vfio/mdev: Add mdev available instance checking to the core
>    vfio: Export vfio_device_try_get()
> 
> Michael Kawano (1):
>    vfio/ccw: Remove UUID from s390 debug log
> 
>   .../driver-api/vfio-mediated-device.rst       |   8 +-
>   drivers/gpu/drm/i915/gvt/kvmgt.c              |   9 +-
>   drivers/s390/cio/vfio_ccw_async.c             |   1 -
>   drivers/s390/cio/vfio_ccw_drv.c               | 114 ++++++--------
>   drivers/s390/cio/vfio_ccw_fsm.c               |  91 +++++++++--
>   drivers/s390/cio/vfio_ccw_ops.c               | 145 ++++++------------
>   drivers/s390/cio/vfio_ccw_private.h           |  33 +++-
>   drivers/s390/crypto/vfio_ap_ops.c             |  41 ++---
>   drivers/s390/crypto/vfio_ap_private.h         |   2 -
>   drivers/vfio/mdev/mdev_core.c                 |  13 +-
>   drivers/vfio/mdev/mdev_private.h              |   2 +
>   drivers/vfio/mdev/mdev_sysfs.c                |  64 +++++++-
>   drivers/vfio/vfio.c                           |   3 +-
>   include/linux/mdev.h                          |  13 +-
>   include/linux/vfio.h                          |   1 +
>   samples/vfio-mdev/mbochs.c                    |   9 +-
>   samples/vfio-mdev/mdpy.c                      |  31 +---
>   samples/vfio-mdev/mtty.c                      |  10 +-
>   18 files changed, 300 insertions(+), 290 deletions(-)
> 

-- 
Regards,
Yi Liu
