Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932C6F11D6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Apr 2023 08:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34B10EC59;
	Fri, 28 Apr 2023 06:41:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A44010EC59;
 Fri, 28 Apr 2023 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682664094; x=1714200094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+N6iz0aQT3PM0AvzCOZux0x3FR5xqFKUgJ3sQBB8rgY=;
 b=Tt5TaYWHlx8DRGMVHhkpltxemgV/M68hVsljtQjm5N9+MS9ofHr0g+8Y
 ngJVoc2gKqGTrlBUl8JYdi2KsK80TAogS11Y8d0bgu4WYB8b144IoaAYj
 F9VFeZ2eBE8ddFFgjBZNh2JUwZXMkiB846SXzH8H7raa7xXH7BlE6qDuM
 /kYHGpBwwWZrr+MIDgVy63oyAXakjiW2EkzhePUq+lhZ0rgevvUZDJ5ZK
 YpeB934T+5nzYCPtbr5ywTmAPMsu21Avww4jQxvIN7XMCjJNIoSCWVqGS
 jAAkf/AauZHNp1CclGrcZHPbeT0/+4jwWbKblz0N3iPvPtaXoEkLWqxgg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327992665"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="327992665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 23:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="697400689"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="697400689"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 27 Apr 2023 23:41:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 23:41:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 23:41:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 23:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4OT0L4diHrQ4Bx8ec0B6N2cYeYCsLTZjdjpyRA6GvTKiDZUmyouV7O15UCujGjsifs1gBwVnP14klTPqPeru+Lz42A00QReDj063glt8IOuLyIUJem0u1yjUry4C9uxIFxw+6uCeWzfG6UZoWnLRfietq0lz6H5XWXwFVp62+ZJqy4Il6IXQN9+EmIRmRZxWDICiu18joX8VJNr0CBYY51XlYh6gyBibOSxnfAFrJrCJpogmbb9AH1BMWWB7C+rt21Q1GOCi7fiHbjheK7A0mdyrZhINoo0/rlc71uNfSgVdWYHJBJZYQw7XM4wSmmZM4Yu+/srx7A6YpTcQfNlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La5VZBf+jr+dHhAswRFZJjlFfwY9NOR6Mhc7NkZBRTk=;
 b=IQhCnFMyBadxCiheHMNfrMvfod3cs9xW3PIG66If03DTtXKmB1BO6tZUT6dAuP1Vop3mDxAkpDyCxB8gM7QX2XsjvPdX1eK11+n+1szP06Z/S07xhmadvHcIEcAJyoJAfvYbmb9jc/dOTQOoZkM1arBijX3Y4bzMpVbrIJYEKsvgloedXwbFe8FveuLPZ2XwWiKSMnnsedtouSdlc5OgAb11cZRhwmBaCyXrj+Yqxn+r21SqbgtCXwmrqYy7r0cbmX/B57+gY8Az/s4H1qbQcE5TObADi5GL1AbKPSfo6zPIEv92+OkGYetTQh6MY/rZaHqxl7pa/WQpgyzsgWfEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 06:41:31 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5%3]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 06:41:30 +0000
Message-ID: <9889de08-605e-d04c-0bb6-b075bc63eb90@intel.com>
Date: Fri, 28 Apr 2023 14:42:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/9] vfio: Mark cdev usage in vfio_device
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-6-yi.l.liu@intel.com>
 <20230427124326.20621b3a.alex.williamson@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20230427124326.20621b3a.alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: c9015a28-0844-4285-56bf-08db47b3990c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUmCgAo4fCRar6nt0O5pol9WVlHNWUkn9tsp2fK4ojZhJ82bq+HQNTSFW6lkYhB2pKyMLq7vX+D5f7ekG9xgEO8/6VYuZTPkR8zNSmwEI2pGGY1W5VqvZ0CaxzoY9fdAd3WOMFAkktwGLqWUz0SxMdzdeuFuwgoxLkMt1XlSjqkDfGzDhQ2k17X+13WVO7TYmNevQBhYThEMh9+2rumBRat3mv4gDwobpKvOvOGoJC9KXNwGNlP6ehnA++VQhhG2vipO9jheP6Rurx83Gp0XNNrFajdpUH/YRIWqlDP5RSvIiCEfyupvrgPL5aL8CtL3mQ0bVHfFwyL79CAi+dUfEdF6Vysh4DjocF/sY+fPY1i9UArvlTR6kWFMrFl1w+on7/P/DIXsnv5zCCit2rdKvnBkkZzZLyQ5Nxsy51tM8PSR50EYW9abgMQclr+4V9Vvncnycd/yxMUAcKPjP2t9aWjx7wTbayiC6RZFN9Y5Vc/YsFfuEOWyMKs0Cly67RQvBzBYsCANPJEHgUdMVrkALrqU1Rc9SozVaH+wO7J5f+musen9ZOcbSDfxM1v2aQPhkE3YOtspmxNpEWoYRu65qKfEBR5BRXr4iH3p/3Ri8IGkZyIFZ/kmgt/n7zKU5LyXeDqTSxDJu/TDlatt1ftexg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(2616005)(83380400001)(186003)(6486002)(6666004)(966005)(53546011)(6512007)(6506007)(478600001)(26005)(31696002)(45080400002)(86362001)(36756003)(82960400001)(41300700001)(7416002)(316002)(8676002)(8936002)(31686004)(5660300002)(66556008)(66946007)(4326008)(6916009)(66476007)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9FSHNuT3o3VEtMMEVsRytjbG9DbmhmbklxNVpQbXh2ajVEeEVzL1MxaTdB?=
 =?utf-8?B?c3lWMUtQWWdTWDZBd3l1dXdoWEdaZXVoWFgzdEJRQXRiaDBLdzg1QmgvY2hq?=
 =?utf-8?B?QlMrdHhqNUk3bEtGWVY3UGkxcUhEVWo4cWJaaEFpaE8rOGttRUl3QWI4Vjhs?=
 =?utf-8?B?bjZSZFNqOXpKdGZGem9sME5LUXdBbWlNbURKRW5NcEhFQmhUbk5VdE5KdU9V?=
 =?utf-8?B?UjlKajZ1R3RoYzRYaVJYaDlYUUJzUlM2OE5ER0lOeGJXWllkaGpxM1pIcmw0?=
 =?utf-8?B?R3poV3ZiUDRqK1dzSERLcGFMc3FzajhCWFhBL3k5TnAwNXpIeHhoYXAzQVBK?=
 =?utf-8?B?cDI5NE9PbExhWDE1Z0xMTXZpNnFkUUtHWWxTVHpHTmUrczhuMGZQeFl4QVBS?=
 =?utf-8?B?VThwME43UUpwRElzOCtLdWsxWWxhMEtobVk4SjZua1pIYjErQk9BeFdyVFhL?=
 =?utf-8?B?UzFIMjZ1UkFud1B3bURuMHg2eS84d0pmQnVnWTdPcUlJQkk2ZzhLUzdFKzVQ?=
 =?utf-8?B?NFJPYURwc3JLbGkvRjJGWXFaWmUxWHE2emp2WlV5a051WC9McjhITzduTUhC?=
 =?utf-8?B?L1RpNGJCWm02S1kzeGlDVjdaSVJkUGQyRGFJd1JsbW1Vdno0VDZlbUlUY1F3?=
 =?utf-8?B?bjBLbFkvR2FKQzdQYmY1c1EzUWREdisvUnkwd2d3NkZoQ3VIUVZXaDNXOE95?=
 =?utf-8?B?dnhod2M5UlJkcUtEYVYrOVl6anV6WTFFTEZSMGFoQkM4MDlQMTV2NTVIMC84?=
 =?utf-8?B?NzFFc05CcktLL0VMOUducDc3cWdzZXIvWWdUOU5DNVU3ZmFIbFk4d3lXazEw?=
 =?utf-8?B?eGxmRUpta0tLeWMyUWc1UFJSLzV4am5lUEJIbDJ2UThLWkVjRVJ0Tk9HdWlo?=
 =?utf-8?B?bmliVCs0YXV0VTRJVUdtR3h5WDJ0bWt0UkZ2U1kyNktZYm5HLzFiVGFsTS9o?=
 =?utf-8?B?TE1JeTgzcmk5cCs4bkNMTGZXMmxZODRXR1g4Z3ZVVXdHT1hQQ3BCWERXWS9i?=
 =?utf-8?B?bVZyN3pJY3JBUVN5RzhSS3l0ZzZkRmFiVy8vaW4zRGd5aVR2R3VRS25XWmVx?=
 =?utf-8?B?WXZpTm9RVTRPNjZJY2liZTNXNWJlYkJLa3pmQVRvcWtuelpCWDh5QU5QSWJ6?=
 =?utf-8?B?U1RDVVBoRWp0dVZlWjU0eTVZeHQyYkR6SHNPVmY0S3dPZXVoYjRlM1lZZmJk?=
 =?utf-8?B?bjd1cEk2ZTU4SFJtUkNkem1YODZqQWMvWlQ3VE93SVJ2bkJsT3JySHN4S3Fq?=
 =?utf-8?B?bm03WXRrZGc4QU5kM2ZpZWltNFhPeWRZR21WWEk2ZzRIZTFleld6Uzk0OWhZ?=
 =?utf-8?B?cVJSR3VxNTczYkkwOGJQcTNxbnhzVEs4anhuK0drUkRGOXJLSmRPVjBXTlM2?=
 =?utf-8?B?N3NpZ0l1aWova2FoR01sTERRTElEbnMvWEpjNkxBRHc1TVN4eTVnU0V4WGxo?=
 =?utf-8?B?alFqdWhzRVE3blY5Q2VQUXhlS215TGpkSmp3WU42UEZXUzdTMGQyM0tXazVV?=
 =?utf-8?B?QmRDVUdSL1ZMS2c2eVNJL0FqeXNoTDkzcE9KaTZvOTZTQ242a2tjMy9nMVpC?=
 =?utf-8?B?b3pzeC9RU2lYeTBUK1R6NnFUdnQzbi80L1lWZWZIeVpMbnhUc3NQNTJCV0Fy?=
 =?utf-8?B?SGFhenVWK1hZNWtDc3JjU0lSalZsSzZISzRlenZDNzdBK3IwK2VWcXhHUzVE?=
 =?utf-8?B?MlAvek16WldYTnFpT1J3elJHRGFFeFVsN29oaHJ5SERSdlNwQXc0bU40RUpF?=
 =?utf-8?B?VVoxQmZVcDg1NjRnMWpxOTJBK29lUkVweGlscjBBSlU0RE5iRGhCUncvNmFx?=
 =?utf-8?B?bW11TUJkZ3ZnczRCL3RmYko4WmF2a3FSZk5vOVNlN0FheG5HSjBwT0JQU0tY?=
 =?utf-8?B?V2VYTzRxUjYxS3Q2bEhreVE0VllnSmh2SlNUa0RFakRxcHdFc2x0WEFnY3Vm?=
 =?utf-8?B?Q24xTFp4aUFCR2hoZW5WMzErZXA5WGFTUTkwL0N1Q1ZZaytLeE9KaG5XdHpV?=
 =?utf-8?B?MkdsN04zeVZUUDFNcWVEZVF2R2dHV3Q5NjV1WWpGekFZb2Q5TEdBZXFpVWVm?=
 =?utf-8?B?ZXFGZVJBdUVUZDNCOUZUOXNwMjhuSjFuM1dhdlBaNTFERWhxMnNrMlM4SU8w?=
 =?utf-8?Q?94UAT1hozBfPz+NVyxllgrt5c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9015a28-0844-4285-56bf-08db47b3990c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 06:41:30.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzE2AAIsNxUhWI9PHCsvWW3UDkdFlIKAULpDyiahi6P70UedcUzJqaV5tpkoZai2jfApQVzWarUq0dFCKe2Y3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 jgg@nvidia.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2023/4/28 02:43, Alex Williamson wrote:
> On Wed, 26 Apr 2023 07:54:15 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
> 
>> Use it to differentiate whether to report group_id or dev_id in revised
>> VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. Though it is not set at this
>> moment introducing it now allows us to get hot reset ready for cdev.
>>
>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>> ---
>>   include/linux/vfio.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
>> index 4ee613924435..298f4ef16be7 100644
>> --- a/include/linux/vfio.h
>> +++ b/include/linux/vfio.h
>> @@ -63,6 +63,7 @@ struct vfio_device {
>>   	bool iommufd_attached;
>>   #endif
>>   	bool noiommu;
>> +	bool cdev_opened;
>>   };
>>   
>>   /**
>> @@ -140,6 +141,12 @@ int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
>>   	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
>>   #endif
>>   
>> +static inline bool vfio_device_cdev_opened(struct vfio_device *device)
>> +{
>> +	lockdep_assert_held(&device->dev_set->lock);
>> +	return device->cdev_opened;
>> +}
> 
> The lockdep test doesn't make much sense here, the method of opening
> the device can't change from an ioctl called on the device, which is
> the only path using this.  

yes, it is only used by the ioctl paths so far. And this flag should be
static in other user-space trigger-able paths with device fd, like the
read/write/mmap. Do you think a comment would help to avoid abuse in other
paths or the name of it implies it should be used after a device is opened?

> If there needs to be a placeholder for
> future code, it should probably statically return false here and we can
> save adding the structure field and locking checks based on the
> semantics of how the field is actually used later.  Thanks,

Thanks for this suggestion. I was also wondering how to handle it when
Eric questioned better to add cdev_opened when it is really used.[1]

[1] 
https://lore.kernel.org/kvm/DS0PR11MB752914607E1DC9CFBFC2EF7AC3609@DS0PR11MB7529.namprd11.prod.outlook.com/

-- 
Regards,
Yi Liu
