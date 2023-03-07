Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014086ADFAC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Mar 2023 14:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FB210E49E;
	Tue,  7 Mar 2023 13:04:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB47D10E264;
 Tue,  7 Mar 2023 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678194243; x=1709730243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qV7OCB6Pi0Rwz88F0H7c2mjPTI8BrFB2rrUiaNgy78I=;
 b=DhyDV8kMCoNrPY2ULpgU9gAsoCofE5oOAM7PSXuyTiOxOmvfY2JXQJQu
 1cVo90061KlMJI6alQ+nVa+MR7RhhSSQJ0ffpU9NxVBlVyPf3Volt/zQM
 htJZb0R8O/tzvcrgqUFQILpLVzkRDm5PNXT5HUpUimqsJJpnwfhZhnBnx
 xTbY2kAs3XFpBGvZRul5ilM+sRsQ9UHeeEqelAhQaKMJ6PlXCUNwTpMnf
 Bs1WLwMOxmsSXjQNzX9OthgqOnKhBNcwxfQAnlM8USH8dotWvmzqrkjoC
 9XFvY4hOheffYWvkxvYc2aZMLulC5+eAGB5IUnTk6PTVWlDLQsY6qwTZs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400666366"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400666366"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 05:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786694771"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="786694771"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2023 05:04:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 05:04:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 05:04:01 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 05:04:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5ZtduvhF9LYpoYrHa6JS8seKZ+tHfiQbt6Fu230I4w0OrVhy8HSrn+ZTbdPEsLNVkehqg3RCf8Hfds+gyX8TW7+z/AwXI91rHIWNd9MXb6kn0uAvYgkm1YrxtlvJf8ZNjAzQxBndYajpzuEXiiFSgPm3GwhoELbQQgDKS6F7yMb7xhSyJ5XLm7CWCRJGtNZMsbpc0xp+nEnlK90PEY3pWjy7RcopGkDomBbl46sH49ylI6k82kKCyfJHrQtmzIxPh3xB/7NAph5GWBIFd4JW7bF5JMqU+gHg4YVL28FfDxNRS/psf20dp1ESH63A5hWVLNo5TTJPo3n3l8oW3V0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV7OCB6Pi0Rwz88F0H7c2mjPTI8BrFB2rrUiaNgy78I=;
 b=obfRX0smZW4IgrpjzUXwVYoecEu3EoJ4waLRn4XvDSAgIX0Ax/EoQf1GNPtqDmFIAQKX2iC2eGvw2o2S3E68q5JjePZ4lGGElILH6+xp3xt9RnISywpXWMpYFjC1+8xPWokFAEqEkqMvdWO5rYbHDpDiyU8sHmUlIzCsJ+vhOFBwjZ7uRnq9E6Fkl0Xzh3cDfIWq35NPfyPlcUhEtPbmHkOhZnKgbTf2aTP4KKaOFX9CQMLMnymXBM216qiqzTd5Qo/VMvHFVjrXfHnUlTgmwNyBOsMDqayTgDDzhA5/YF1o3UHcH59P6epxUY4ON1tQJvjgGxeOE77atkyLg0L0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 13:03:54 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 13:03:54 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: RE: [PATCH v5 16/19] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Topic: [PATCH v5 16/19] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Index: AQHZSpxP1elsXPP8bE2Y+PYEE7Tlg67ln1gwgACXEYCAAlTioIAGXnuAgABkS4CAAAZ0cA==
Date: Tue, 7 Mar 2023 13:03:54 +0000
Message-ID: <DS0PR11MB7529B4EFE9DCF2991F220A65C3B79@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-17-yi.l.liu@intel.com>
 <DS0PR11MB752959193D5CBA2A677B1F18C3AD9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <Y/+Pkbtr8KQmUjVp@nvidia.com>
 <DS0PR11MB7529E16DC2B558E8476D835FC3B39@DS0PR11MB7529.namprd11.prod.outlook.com>
 <BN9PR11MB52760241BBD8D6D670BD17D98CB79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZAcwJSK/9UVI9LXu@nvidia.com>
In-Reply-To: <ZAcwJSK/9UVI9LXu@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CY8PR11MB6844:EE_
x-ms-office365-filtering-correlation-id: e72385cf-cbd6-439e-f9c5-08db1f0c67cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aXI32p0uldSAHc4jkkTIUIZWGb6gnH0QU8eNjeoHLJF0vUVbi2ZOTj72IxAwuWijnX4Lt0SAiO7z7pyOMqknuTbzPu1e3sfreiZPlwDX0zyTHVGtHL0PcjWDqlH6iJ8e4i1U5sdYlex9mbkjO5Ojui/U9NctnveG7Q7Re52Wr+3xO1Dj7faaKtvd5RKlsV+qiEqwx8A4ZhKMAW1cM2iAMCeeM+megVBuvRgzfo4rdpFGBg9jm9LONblN8K5Y0jl85ZigW1xEffXYAezHiOn2F8o8mV7MU6V2m6/h2afyVZl8xMT/Ijoj4ByduKuNB7U8UWWN8ZxD0PCFTBL8Qxzg4IBYv4DH6O2iwJY/b7d6emC6KV0+ZQGYSDlFAYCwoAjh1PAtlzsxt4d9vSMrJh475hz7LFrcXHaQkIzhUXi+qx8Z7bqDFYwMS+Lv5VwfGevSMHkpI9TXwSbVe2vHK3LSPbGKLaOLmcwP8NA9ous+dChUWEHOMNmoqxiDDI240pC9ZBexZVrByxkcSgL7E+17WUFuLGxZIIfELi0kJKuiKxX/mE8nqhC6CWF0L+YnympXWA/Aq+qlixo/RbBvot+zsdWabnUV//mPmxUPdRptaWcqeM9i9CaJQv9/MLDCdbhmOGIszQJBuqRE4wqEs3cg7NQlAVU7H+LrdQyF4SJ3w9iSZwgLOs2UVPjwcYhJipIW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(83380400001)(66446008)(71200400001)(76116006)(66946007)(66476007)(64756008)(66556008)(8676002)(7416002)(5660300002)(186003)(9686003)(41300700001)(122000001)(26005)(8936002)(2906002)(82960400001)(38100700002)(52536014)(478600001)(966005)(7696005)(6636002)(4326008)(54906003)(33656002)(6506007)(55016003)(316002)(110136005)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHJxZGw2NUxXZFFEZGhqQWhxYU4xTFRFMkpYR3ZzcU40YlIzNUR6ZnIwSHEr?=
 =?utf-8?B?bHUzQU00VmVvQVcyRWNSbUQyNnJwWGZOdVNsdDZ2c0lIaFltSDRtTGVsN0k5?=
 =?utf-8?B?T2xidGVtcVM4S2xNcHZDNGdxa1ZkV3JLc2VCbHd2TzNjY0ZjRnptVmYxcVpF?=
 =?utf-8?B?Z3ltSTRMRktvYTJuTyt0azBKeDh0cllzWGpGYVVnVWpWRGxKUWlYbzFLVFhr?=
 =?utf-8?B?TzFaL1k5dHVvY3NNSDJpSlg2TjhtL2Nwc1NCa1RwV2lRVGJ3cld2cW5uNHFp?=
 =?utf-8?B?WE9uOWZrbERwOGY5YXU2U3ZtdmFZallpRW0zRE9mT1FSMlpOMFoyMHJoaXRu?=
 =?utf-8?B?Wm9nV0hwOFJOR1IzaGhMNGZuYzlGczlGZXdDbC9vM2g1K0x0VlBsUjVXemVZ?=
 =?utf-8?B?R3l2cy9qSkpHMi9KUTVwVUEvTjZBS0ZFSUdaU2dscmZ0RkVkQlFDMDI1WFZx?=
 =?utf-8?B?UStVQi9QLzBZZUx4NFlzZGtjVEU2Rm0ydTJReWE5cVFXRFZIb2xnSUJ1dkZz?=
 =?utf-8?B?anVkU1JzaFhkM01mRmRQdEQ2U2U1ZUVDN2hxTWlUcUhrSXhsaE8wdlZlekZT?=
 =?utf-8?B?d2J2UTVpQyt1MDE0SFdNTEJOY056T0tvR05CZDFENGY2cG5VOE9CQlFiSkRK?=
 =?utf-8?B?QUVzQzBrMm13TTlTbE14UUp4UTA4YmpLRjB3UWF5MmswVU5sdjZlTkYrNVVC?=
 =?utf-8?B?OFJPbDVuVEVNbnY1eXVkRGE0b3BmSFFWREo2bXlPdjdtektMQmJXQXNXRHdM?=
 =?utf-8?B?SnA2cmxuc2s3UXB6NmtoQ2hpeFdFYy9qd3A0d3loT2V3dmFiRnYydHdXK3ZN?=
 =?utf-8?B?VGJnRnRPOUpuS1Y5S3FSOGJQc1JpMXJlR3BpQVR1bUdxMnhvdkF0ZWRUL0tm?=
 =?utf-8?B?aVRrWWhYK3YxYW1peHRBRzRSY2dRbFgzYlYzV2x4UkNhQnhCT0VRVTBtblJU?=
 =?utf-8?B?VlhjbTJBWk10UEF5Zi9Pczd6Z2JRVWhGTUVtaUxQQlNzVklIY2VYMEd1d04w?=
 =?utf-8?B?bURDV0lpN29TMjFqd0RXRjF6NFU3dFpqbW5NOTQ4VVZkOTNIQXllMm8wK0s0?=
 =?utf-8?B?MFlTZzNHNUhHZzkwTkRUOVltY2lVemp0UnVGMzBDRFVsSjJFVUE1TFBaNjM4?=
 =?utf-8?B?U1FsNXhvVkNkTXRTVzExZFdsS0lTS2g3N2VoY1FvZTgvVEtBaXo2cHRwcGJK?=
 =?utf-8?B?R05hb2djcXB6VGdrdTh0NThOVDJlUFhyOWFDQXRKSVNBY3NRM21RTkRLU0tC?=
 =?utf-8?B?bVhpMlUrdXZZZURyY2JlR3ZsbnZyakRyTVJxcjVDRVk3TzFqbGsrb1Nrc2lY?=
 =?utf-8?B?Ry9pN0pTSS9GVndKNGxUcmdVZndZa3VrNjBHajZ2ZStjbHBDalVQRjl6NU1D?=
 =?utf-8?B?Rkk4T2NqRDQwU2I2dFMrRDdvTEF3cE4yZjBKbnJpT0tYc1lzL1dnR0drSEY5?=
 =?utf-8?B?MG1nMExUaGJVWm1WRUtkZWhYYTJ0WUhYMDVJZm9CRld5eEJZSGhScWI0NDlI?=
 =?utf-8?B?Vml6Wk5WNTFlZmk1aGdMbG9QS0ZkOHpFQWhoTWZLc0NVY1FwVGN1RXlkWkto?=
 =?utf-8?B?Z3hqSEVadVV3WDZ3aDA1bWhTSjFrWmhTeE56dTI1MG1uRUFJa09UTVVNb1VW?=
 =?utf-8?B?a1BrRFBRWmszdEt2cThZZExZQWlsMklMRjA4WVd6eVBlYktNRFN5d0lHcHRI?=
 =?utf-8?B?QWJVSUdEbitaRVFhejl6QjdZeDJiZmdTMGIyVU03cWJMWVBYRFRjWG8rS1Fu?=
 =?utf-8?B?RU9hakV6UnkwLzZiQWRHK0ZNYXdGRjJLN1lTbC9VRlFEN09jMEx4V093bUND?=
 =?utf-8?B?QTNVOVBoT1lXcEcvNTF4djNPc3RFenYwL0NnaHI1K0Zoay8wVEhBc1BDM211?=
 =?utf-8?B?cVZQcm9rWEJYVkJmT2EvdUgzRnhnMS8xOFY2cFFRY2xSd3VTTkFOVFRrY0dD?=
 =?utf-8?B?Z1BHWFRRTkxzS3dOTVlmclRPams2YUpnVzY2RG5xSFQvaVZSV2RJalozSUd0?=
 =?utf-8?B?YWJVRGdmWlU2Y0pkcmlyR3l0b2FtV1U3NVc0ZkxnVEZlcWVOeWYzU2MxZUFn?=
 =?utf-8?B?M21tL3dRV3Y4NVBJdVR5R0hMV2MvR3FnSFlaSGI3SDhwbEI1QjVYTE9TbEJw?=
 =?utf-8?Q?/vHTP44hF4CDiPKACZAWN8XhT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72385cf-cbd6-439e-f9c5-08db1f0c67cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 13:03:54.4077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ecQHsXhwGpKLtdJCCi+y5wQiky5FB3nppGoCTEG6jV2BHnmFnMJY04hvkaQXcceFF1a/nzQhw4GK8/KJ+pxrtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBNYXJjaCA3LCAyMDIzIDg6MzggUE0NCj4gDQo+IE9uIFR1ZSwgTWFyIDA3LCAyMDIzIGF0IDA2
OjM4OjU5QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+ID4gRnJvbTogTGl1LCBZaSBM
IDx5aS5sLmxpdUBpbnRlbC5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIE1hcmNoIDMsIDIwMjMg
Mjo1OCBQTQ0KPiA+ID4NCj4gPiA+ID4gV2hhdCBzaG91bGQgd2UgcmV0dXJuIGhlcmUgYW55aG93
IGlmIGFuIGFjY2VzcyB3YXMgY3JlYXRlZD8NCj4gPiA+DQo+ID4gPiBpb21tdWZkX2FjY2Vzcy0+
b2JqLmlkLiBzaG91bGQgYmUgZmluZS4gSXMgaXQ/DQo+ID4NCj4gPiBUaGlua2luZyBtb3JlIEkn
bSBub3Qgc3VyZSB3aGV0aGVyIGl0J3MgYSBnb29kIGlkZWEgdG8gZmlsbCB0aGUNCj4gPiBkZXZf
aWQgZmllbGQgd2l0aCBhbiBhY2Nlc3Mgb2JqZWN0IGlkIGFuZCB0aGVuIGxhdGVyIGNvbmZ1c2UN
Cj4gPiB0aGUgdXNlciB0byBnZXQgYW4gLUVOT0VOVCBlcnJvciB3aGVuIHRyeWluZyB0byBhbGxv
Y2F0ZSBhDQo+ID4gaHdwdCB3aXRoIGFuIGFjY2VzcyBvYmplY3QgaWQuDQo+ID4NCj4gPiBIb3cg
Y2FuIHVzZXIgZGlmZmVyZW50aWF0ZSBpdCBmcm9tIHRoZSByZWFsIGVycm9yIGNhc2Ugd2hlcmUN
Cj4gPiBpbnZhbGlkIGlvbW11ZmQgb2JqZWN0IGlzIHVzZWQ/DQo+ID4NCj4gPiBJdCBzb3VuZHMg
Y2xlYXJlciB0byByZXR1cm4gZGV2X2lkIG9ubHkgd2hlbiB0aGVyZSBpcyBhIHRydWUNCj4gPiBk
ZXZpY2Ugb2JqZWN0IGJlaW5nIGNyZWF0ZWQgYnkgdGhlIGJpbmRfaW9tbXVmZCBjbWQuIFRoZW4N
Cj4gPiB0aGUgdXNlciBjYW4gdXNlIGl0IHRvIGRlY2lkZSB3aGV0aGVyICB0byBmdXJ0aGVyIGF0
dGVtcHQNCj4gPiBkZXZfaWQgcmVsYXRlZCBjbWRzLg0KPiANCj4gSXQgbWVhbnMgd2UgY2FuIG5l
dmVyIHJldHVybiBhbiBhY2Nlc3NfaWQNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIHBy
b2JsZW0sIHRoZSBmaXJzdCB0aGluZyB1c2Vyc3BhY2Ugc2hvdWxkIGRvDQo+IGlzIGEgZ2V0IGlu
Zm8gdG8gdGhlIGRldl9pZCB3aGljaCBpcyBuZWVkZWQgdG8gbGVhcm4gd2hpY2ggaW9tbXUNCj4g
ZHJpdmVyIGlzIHJ1bm5pbmcgaXQsIGlmIHRoYXQgcmV0dXJucyBFT1BOT1RTVVBQIHRoZW4gaXQg
aXNuJ3QgYQ0KPiBwaHlzaWNhbCBpb21tdSBkZXZpY2UuDQoNClRoaXMgbWF5IG1lYW4geW91ciBi
ZWxvdyBwYXRjaCBkZXBlbmRzIG9uIHRoZSBnZXQgaW5mbyBzZXJpZXMuIPCfmIoNCkFsc28gbmVl
ZCB0byB1cGRhdGUgdGhlIGRlc2NyaXB0aW9uIHRvIHRoZSBpb2N0bC4NCg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMTItdjEtNzYxMmY4OGMxOWY1KzJmMjEtaW9tbXVmZF9h
bGxvY19qZ2dAbnZpZGlhLmNvbS8NCg0KUmVnYXJkcywNCllpIExpdQ0K
