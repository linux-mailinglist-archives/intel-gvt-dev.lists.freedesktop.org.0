Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C7CC1CC8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Dec 2025 10:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C0510E474;
	Tue, 16 Dec 2025 09:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efgVYjzN";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B278A10E474;
 Tue, 16 Dec 2025 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877533; x=1797413533;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q/z6U6uQMkJRLWjVHocrbnpm1/2ha8C3uNS2RTFq4Ao=;
 b=efgVYjzN5UZk8A3AKqh8gcf/KUFSLi3UD7wRGmJtqDosY1ynPYjlZad5
 8Fl+nrN23vBn81rW51JmKKvgNceiVr8kIcWPfMcncImNAS4AWLMeg3lQQ
 CWJtiIuOW3hQp0Vp8Iojesf1lLEcN0X6nruntNTVtwIocXbqLZZ7fl7Yx
 pO1022uXFg2KZg60McCxWon604R3sEqeRoUnq6eaYb5hsi97MusIggJwI
 RYOgQr+73GSbJIzzoxXSRSVxzYQ6QSdspmytMNoEr0B70RuL8smYWcuNe
 I2RTt1tvV1JeuQkYMSJNOhRzInQGBiN+Cp/I4y8l5+HAtSxWBDawRMw7K g==;
X-CSE-ConnectionGUID: 7xlUV2i8TB63RUT1tNd/DQ==
X-CSE-MsgGUID: +74vdmKZT3yQpzdLDZP5TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79246234"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="79246234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:32:13 -0800
X-CSE-ConnectionGUID: gRx0WjmxTRqPM7QXFxum1g==
X-CSE-MsgGUID: orskfFZCRY+jw6CA3xBb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197716654"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:32:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:32:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 01:32:13 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhEMA/iTYWW6d9vTPnKRYIm/il1GZkaMRVQ4L/YWUlQTPqBpDBt0myJqtfPq7MispDESLzRDBViUzSzhWHsJmd1F05x2iyFWnQ+KXuAorQ82VrSxWvg9x4hFnQrDH3Finn0KgZrz/pRqIoVWjPBRF8j3HI5O8u2moWEWZEl1D8zeLmYzLV2JmU8kKHQh0qQALhnasObHd+Hh+2I48Kdo3KyT3lUDPnmJHZBQeIfcw9yBVeF0Zh4sFrgq1YB/n++SwkYckmM+jmvJNRHqxkT+qvKYXbK+5fAEGyZ9RSlzaIHni1jSpqmDPc+ipMn4aSgRNsJgoL5LPkCF1NduPu/MkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxHtenovWYamXL63ELQ+n16Nf5wIPfiQ57lc+Sbb1Hw=;
 b=rVi0JNt5P0NrKOaBY7tmUyC5I1fUdkCVkme1LQWzsflouLQOEtox8Re6RlaDU53Hv0l7GTt3eBgIeZEl+FsxxJU5nda1lF0rmsSABn+JSscVaEcpcozNCeAMFBwlahGKgjx8Lg68JRt8N3FXaiYp6J5uQhq5PRcvTpvhLUix04O+JjRMqgpLWPfx2eJX00e2QMNkjL6/Moxw03jLbPT8+ffAEygcJyNYyBMB/vP9ToQoSiNfZj7uH+RdWcIeG0gwKAE7hrg2WAitlHJMQHh0jvkbnRQKLf5AJEzVUtUJBtV82i2i8hHvvUb8hvewEDshpXMfJjxU9IAfBbBGUtX+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:32:08 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%3]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:32:08 +0000
Message-ID: <508d8eb8-1de9-47bd-9f54-c7a18eca8713@intel.com>
Date: Tue, 16 Dec 2025 15:01:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/i915/gvt: Change for_each_pipe to use pipe_mask
 API
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gvt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-5-ankit.k.nautiyal@intel.com>
 <2785d3cddb6199bc7e6cef3374dbff46d4cae205@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <2785d3cddb6199bc7e6cef3374dbff46d4cae205@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 80822376-80ff-4a37-0a92-08de3c85e6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmZWUmt5R29qeGxTQlJ1VnduSFhod3Q5bys4czJkMlIxNG5BS1hDSytOVFEr?=
 =?utf-8?B?Y09rT3h5d2MzbE80TmRsK242RVk4cDV6NUhNTlRqS255YVUwQmplQlNPMDg5?=
 =?utf-8?B?ZjRpZEE1eGcrV1RCNkNrSUFwY0h6em1EVWRvdXdBMEJHSmxSZi9SM20xL1VQ?=
 =?utf-8?B?UmJKdWlIUkZBRXVaeDJZOEdZaVVpM1UxS3lyaVBkTWt6eWFYVmxIZ2U1RDNq?=
 =?utf-8?B?ZkluS1BQL3pjZVpGcGF6SlVYNERKaUY3MFJoZkFVVi9zRDRzc3F0RGVrWkc2?=
 =?utf-8?B?NUJkZWtNSXZGZXBSQjIzd0JSeUdnMUlkdzN1bkRFOTJQVng1UVV6MklzU3Nw?=
 =?utf-8?B?TUZmT0pENWlzbmszdmcyNHBNVmdMdnYyNWJiUy9vVmc2N2VLRVcyUGlSeWND?=
 =?utf-8?B?YVU5QzhpelNzWmFGT2FPaTdIVkRQYm9UZEVLTnB3aGcwRWRmVXRDYmNOeFQw?=
 =?utf-8?B?MjZOeEdSTjJTUkZESzRHVUFWVFp0UWxpY2ZEdGZSMXQvOGpLUXVpUTN1cGpJ?=
 =?utf-8?B?Q2NJdEE1QmU3eU8xU3dGNTlhZGttMXZDUnVJejZicyt2c0ZMam5GK3RSZlpW?=
 =?utf-8?B?Vk1MNlpXUXVvbUlBNEdiOC9BelQ2VG1jeWpDL1liem9BanlLK0RTWGNMN1Rh?=
 =?utf-8?B?K1J6MENsbW1EWW00WnFWK3F6c1Job3Q3VThqMFo2SUhBbytHODNRNHdNRlVu?=
 =?utf-8?B?eW9DZlVxdVFsbkt2M3E5cjFEaWVZeG5wUy9GQ3ZhVzFpUURxdUVOTWVkTWxw?=
 =?utf-8?B?aFRnaTVvVHh5ekJMSEt3SE1lbE9iais2SURab3VvQXZVeHNUdGREamhjRHhX?=
 =?utf-8?B?T0hua3B4c1NZSTNOM1prNlFpait4OGoreFdIbGszejRXc25WaGVhLzlkUlVz?=
 =?utf-8?B?eTRaZHdxTUNPNC9Eai9hMXgybXQvTkZraUxJYUJRa3hadzdqbjhwMFJMdHFr?=
 =?utf-8?B?UHltSTBOd2RZa3p0K1J3SmlZN0xjUk11aWM2NnVKRmhoZVU3QjZJNm02S1Zw?=
 =?utf-8?B?U1hkM29PN0w3aWhrS0tiMlpwR2ZFc1pFc1hqdXhaa2VGaGlSVCs5T2Z3WFZW?=
 =?utf-8?B?YXdmVDd1UE9ycFNUc0lGdGhkbHVMYnJyai9wR05CSG5RYSs2dVV5V250aVJ2?=
 =?utf-8?B?V0d6Y0ZidHpXaEtITFRGUWVHV3dib2hjNlVHc2pZM21VOCt6V1R1ZHMxYUFk?=
 =?utf-8?B?RVpNUjRxbmRNZmQ1eUVtdEFDWWVpeDY5K2QrQk0vNnY1eWlXRmhIMVlTaG1X?=
 =?utf-8?B?T1VFZkpBc0NzRkJES2M3Sjd2RGluanpGSmRvNThvdTEvS0pFOGZtbDFPM21G?=
 =?utf-8?B?UzVYWnliNE5xWW1ydHo5STRNYjk1dXpxa0tmei82OEtKRUd1NE1ZWlJiejJy?=
 =?utf-8?B?OFlMbFRudHVQVGUzNzdYaU1xMG1WdnI4RWVjMXoyQkhnOUV5SjMvaVMyR3BF?=
 =?utf-8?B?bkdONjVOVXVGdTZhc0FITGl4dlQxUnU0RW5CME1Ob2dOVDE5Y291M0U5TkEy?=
 =?utf-8?B?VDh6Y2JLSjlqS0xyUksrYlZXVlROclJJWTNybTFmZ3luVi8zMWNwRkZOL092?=
 =?utf-8?B?a0x3bmRLeitrMmRlMXdtSWhKM0JLTHNsczN0N1FnRXE1RGM3azVIOVNablM5?=
 =?utf-8?B?N0l4dlhZK0ZOUTlMaFUvZW9sTTdlZjN4ZXdwb0ZGZ3JCb2RUaHZWeE9Za2ZI?=
 =?utf-8?B?MEY1K1BhVXRZNHFuaGlhSDNxVnZXNWltRGwySkthaTl5eTNya05GYzhlK3Zi?=
 =?utf-8?B?Ym9UQ3lmZkVTeTYzalBHVkxOUDVacFdpYnFHREl4bDg0WElMWHBUTGliMWl5?=
 =?utf-8?B?bFdKbU5aNndsNFBGQVg3TkNWL3lHTzFxdkdYQ1plT1JzTTFKTy90Z0RSTnkv?=
 =?utf-8?B?YUt5eTJrZkM1SndoZVFtU284V1UrM2ZaRVRXTm1GT0c0WkNRVEEwa2JSSEdO?=
 =?utf-8?Q?QRLRNayrb8ccPjVX+OxxFMCjziyZTfjv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5332.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpxdDhxTVM0ZGRPck1YYWxvd1Z2cmNDTEZpZkE3QWgvUVVqd0NXRCt3N0xK?=
 =?utf-8?B?R2RiK3ZYRVdVS1A1a255bHpSMFltUjUxZjVIVXV5RUR4Mm1JcVBsQ0pNb1pZ?=
 =?utf-8?B?L0ZDMWx5WTNzNzlOVFZheGt5RnlaQXhQVmNpVGt2RENNWWQxWHZYN0gvb2tR?=
 =?utf-8?B?L05LRGpoWGprWTR4TURhcFlOank2VE16dXlRZDR4SjZRUEYyYUlHQVZOalFK?=
 =?utf-8?B?QjRUZGhZZ0JSTUtsbGZNTk9rem0zcmJnYVIwNEJocVJ6Tk03SGVsckR5czVH?=
 =?utf-8?B?NGNZaXVpa0ZpeEdCTFIzbjN3ak1QNi9Lb1BibWJOOHBzTlRIOEd3MjF6dDZn?=
 =?utf-8?B?dEJoMUlHalJxVzNwWWdjNGV5bjlPY0MvbmFhdFQyNjlMb1VFT0pVUCtlT04v?=
 =?utf-8?B?V3RTeUtZcS81UVd5QmxwdzU3ZHR6d1hYV20vTlhNUExGK1VGdDZjK0JrcVhz?=
 =?utf-8?B?dURveXYySFlkWHNuRFRpbC9UaG5VczY2MkRtOWh3QVZuRUNsZG9TUkF1LzRa?=
 =?utf-8?B?dDREOHUremdXUDUvZVZMbG11UVVkcEJFY0x4cy9YZEhoMitmOFBmMzdwbWtG?=
 =?utf-8?B?YXA0U24zbS9YZ1k0WE5lOUc4UGxiNWF4M1NibE9jZ3liOXhGcE1ySXpLNDRw?=
 =?utf-8?B?VnNRaWJUMnNTNTBBbzJnWVo0ODNtVkg3MU8vSmdwRXNBK0w4TTNqRjlVb1I0?=
 =?utf-8?B?aFBNQkY2WGRMNEF4bi93RThIZ3laRWdXb202UDlFYXAxQmFpWWYwMHRob1cz?=
 =?utf-8?B?SlpWSDlwN0pONjVMcG5TS1lTdXBCb2s3cDJpb0UzNVo4Z08zOThQWGFhcm1t?=
 =?utf-8?B?aEZEQUJIaE9sQnhySDBlYzY1bWEya3RnMCsrU255ekhQR2J2bjJucVoxYUY5?=
 =?utf-8?B?K1BDSU5sUDJtWnlBVms4TU5HOXVuNXhVcEpCdTZXNkVrYjRJb0FseGlsdlpv?=
 =?utf-8?B?MUV5VGpmVm94S3hSNkZqTDVTQjBhamd0NTJpaEdaRi8yb054YXJ1MExMaFlm?=
 =?utf-8?B?dU5XTVMxOTl3emNteisra0ozRGt3MnJYVnY2WVJyS3Y3ajd0SHFCZUtmeEI2?=
 =?utf-8?B?ZFBvdXl2d0pSdTNRTFBod050RDdzNHJhS1JJcE1lUWtHbXBxVnNraS94YVow?=
 =?utf-8?B?R0hCdjBHcXJJVlBoQXdBNklrUXZBaFNDUWJaRDUxZ1NtQVRYLzBlWCtSRkdD?=
 =?utf-8?B?dGFxbWZrenhuU1pFcmFCS2dRSXhXeE5JRmZqcDRacUVYSWU1Y0wwbzA5MGRP?=
 =?utf-8?B?RUthdzVqSUt1OTVTcVdEUmtzZ043bGxhRTRIQ2pOS25SZE9GNHZVZ3FpZ2N1?=
 =?utf-8?B?ZVowK3FQcXRCR21oMjV0ZUkwZVZWa0RVRldraEdwbjFHTW91UWtHMHlBTk5H?=
 =?utf-8?B?dEtudXBzeU44U1hNcFBlOWQrMnRMaWQ0QlZKUVJPSUtKZkpHMkhaTDNmWmk4?=
 =?utf-8?B?eUFWdWtCZkNDOUErZytwR2VlMEUybWJIWHdQcHRmcEpiZUptMloxYnFsMXJB?=
 =?utf-8?B?a01KYmgvdDFmVnlCVmMrNmU0U2g1RGw4SVhOK013VzBWYTIwZEtGUlo5MS9n?=
 =?utf-8?B?WkdvdmxnK1JCY2IwZFlkVCtodjNZaW5mRlJ0d2tTcnFDdHJabWhLMUR1TUZ5?=
 =?utf-8?B?d1lWQU13eCthT0ZjR2dMaGd5VUkzRm9Dbm9SMlVsZDBldW51UG55MmxzN1ZP?=
 =?utf-8?B?Zyt0TjYybGMycm1La0JNOXNrenA0SjNyNWNTalRISkVBZzFkT2I5b2dvc2FO?=
 =?utf-8?B?dmVaMHF6V0NJQk9ueEU5NWFORWtDYXFENS82aVlibklxYTZPcVZ2Si9vR3JE?=
 =?utf-8?B?OHlhN0lwNFlUTFVtWW1rZ3VmOHdCQzFZL2tQKzZETTFzcVRqUkRHQmFFa1lM?=
 =?utf-8?B?eHM2UGc0R3c3eisvTEtZalo1KzUyRXlMS252aTZTeGVXeHJTamhlc1IyVk9V?=
 =?utf-8?B?U0xYWHc1eHpGNm1MUlplcXlBZ3l6bzZjRkZLNVdxeWR3ZndueXlRb2FiamUx?=
 =?utf-8?B?TWNEMHlPTzd3VXd0NFdYSEFKT05NUUJtZGpxa2lyVVp3S3c3TDNTbzBTRDgw?=
 =?utf-8?B?Z0J1OW9BQzJaSXlGbW5VMG9zeEtzd0pXdzJFbUtwM2swZnZyTXl4QkpaWmdr?=
 =?utf-8?B?aXRrR2pRMGFWM0xNY3R2Y0JEWm00aTNFcng5S3kvZmhEbHNKd2FNMzFSUGZp?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80822376-80ff-4a37-0a92-08de3c85e6d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:32:08.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImaN3WG9Ywl3XZCqxpxb0e2Sflgp/2VuTlHX3rdAxqPk+XY4PLP2n6qAfx6WxtGky805IR5EQUs+lyHLrXkG/fFg7OViWOiOXgo17u+McTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 12/15/2025 5:30 PM, Jani Nikula wrote:
> On Mon, 15 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Add a new API to get pipe_mask from DISPLAY_RUNTIME_INFO() for GVT.
>> Update the for_each_pipe() macro in GVT to call this API, instead of
>> accessing DISPLAY_RUNTIME_INFO()->pipe_mask directly.
>>
>> This keeps the macro usable in GVT without exposing display internals
>> and prepares for display modularization.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_gvt_api.c | 6 ++++++
>>   drivers/gpu/drm/i915/display/intel_gvt_api.h | 1 +
>>   drivers/gpu/drm/i915/gvt/display_helpers.h   | 7 +++++++
>>   3 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> index 8abea318fbc2..0b09bbf2c29a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> @@ -32,3 +32,9 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
>>   	return DISPLAY_MMIO_BASE(display);
>>   }
>>   EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
>> +
>> +u8 intel_display_runtime_info_pipe_mask(struct intel_display *display)
>> +{
>> +	return DISPLAY_RUNTIME_INFO(display)->pipe_mask;
>> +}
> I don't think gvt needs to know it's about "runtime info". Maybe make it
> just intel_display_device_pipe_mask()?

Makes sense.


>
> Though I'm also wondering about making it even more abstracted with
> something like intel_display_device_pipe_valid(), and using that for the
> various other cases that check pipes in GVT. But maybe the patch at hand
> is a good start.


I agree this can be further abstracted. I can try that stuff and see how 
much change it might require.

Thanks Jani, for the suggestions and for the reviews.


Regards,

Ankit

>
>> +EXPORT_SYMBOL_GPL(intel_display_runtime_info_pipe_mask);
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> index e9a1122a988d..8ceda30a969b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> @@ -16,5 +16,6 @@ u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pi
>>   u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
>>   u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
>>   u32 intel_display_device_mmio_base(struct intel_display *display);
>> +u8 intel_display_runtime_info_pipe_mask(struct intel_display *display);
>>   
>>   #endif /* __INTEL_GVT_API_H__ */
>> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> index 6f68a1e8751a..d11ebb03b946 100644
>> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
>> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> @@ -36,4 +36,11 @@ struct display;
>>   #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>>   	intel_display_device_cursor_offset((display), (pipe))
>>   
>> +#ifdef for_each_pipe
> Ditto about ifdefs here as with previous patch.
>
>> +#undef for_each_pipe
>> +#endif
>> +#define for_each_pipe(display, __p) \
>> +	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
>> +		for_each_if(intel_display_runtime_info_pipe_mask((display)) & BIT(__p))
>> +
>>   #endif /* __DISPLAY_HELPERS_H__ */
