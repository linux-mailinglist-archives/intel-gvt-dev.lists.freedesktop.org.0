Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BED625116
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 03:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADDA10E73E;
	Fri, 11 Nov 2022 02:50:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E25310E73C;
 Fri, 11 Nov 2022 02:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668135006; x=1699671006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gzu8Z6Bj0tx4lcLvt8V3SaVkQCAUJfiB/Myx7/Xodt4=;
 b=nZ+ftZh7Sp6uDzzu+7IYJb1pWau2i/O8TojU6NLcio9AnzK+EY0hT0Te
 bBcVKkAg49qCF2PhPu9XgpALsgIn0Vb6mao4860H7vRv8SiHBDwM2Kcha
 rVIA/+fbvy8fprB0Qz9Hyoql4z+TcnggXZ/xEj/aF/rTSwpt1xlo/TC7r
 5+RaAvlx2gGZ5m8jBcR0m6B+AIoeCWcBiPIMM/OGlpNQzusg20K6BnGQG
 HYUKSZwXqBgmPjBkaYV18xqWdaUqjWZrjc0kihpMO9/AmJe+ehxnuJY85
 d932MDkCxnM2NIkcVaxPZfHUy/46DNwMIzdRgVRmiI4yAylpBwB6++BXG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291229028"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291229028"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966666958"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="966666958"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2022 18:50:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 18:50:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 18:50:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 18:50:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 18:50:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e//O6UVvFR5wde0tN1viBXcndxQkNpfS2P4RhNclcaVkmcEmoISmcLLcj44K/kt1hj8/V84HDm7+KZXnYErBqrJlEdf19WTreeTzQVkTFz51/PE+qSrPr6vdChOl5lniXJ9nDtGrUVrST2ivO/HVOQetcf3wzdfbZYL3yicPIxobKKtBAEvEHFudbdBF8T38o80Cv+tgNh/1HDUvwRG6I6fzxU9YQ5o7fu/OiubqUGCfFq7H1eZaVqnCB1U4oqU7E3RkCBLCz8PCw85LKAcDtr3c+tvs2UHxSSEN6+M7+v6jDh+DZPEKBwYB3mL8uW1pR/HqactzJruFgnY6E47hSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gzu8Z6Bj0tx4lcLvt8V3SaVkQCAUJfiB/Myx7/Xodt4=;
 b=H4GsoRlRoYeZE46kbrxAVupLvW7lu6z5oxIPt2pT4MWRGbmwobfgE8B8RrXlqQk2tl0hYgZmzF0nHibQwKdG9WfzdBaTlnf4OlD01OyC6W4oBh0fL1XiiOsgOQw0XK+Aw1FNsu5sHyk/03QRl3TBo/26COuQ4nrpHq+76SUsO77Mo9kNZgxPySqwjCxdMFBGdxH4PZTU9YwhmzdjjWmm0RTPxVbtjNWmyAn4LE7k3vIxy1Kvh21DGslAsIn/K24jTKpIysZLQfpDOIr8NkUpTPSrUNuM5bqRVFFCriKmT904/vRAP2D++VPjA4pCIgYJRUdIc8+qlyWtp75+AtnwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 02:50:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 02:50:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Christopherson,, Sean" <seanjc@google.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/gvt: Unconditionally put reference to KVM
 when detaching vGPU
Thread-Topic: [PATCH 2/2] drm/i915/gvt: Unconditionally put reference to KVM
 when detaching vGPU
Thread-Index: AQHY9WO9eqsVEb0fCUyWnvH17Dzvyq45BbgQ
Date: Fri, 11 Nov 2022 02:50:02 +0000
Message-ID: <BN9PR11MB527612BB4FF14878D7BD4CD48C009@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221111002225.2418386-1-seanjc@google.com>
 <20221111002225.2418386-3-seanjc@google.com>
In-Reply-To: <20221111002225.2418386-3-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 43db33c0-2e56-48ca-a8db-08dac38f6e75
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ArfzDvuuvKPZPu5lmD9WlS2t1v5ptSf1uaBY0waa8KuTKgDzCgvgAb+9zJBF0qrv10LfJNfVGSmtrCXzfpJM/TWwS2Qb6ht1RRmxMHQrcD8qsUTuZjPzQQgGsQprfDtnI+K1q7cdrrfiawi7bRU/XqyNRx0Ea0PO05qJOAqfI0TZH+IJ0hrpXwBJw8tgSMUQ8EJMRTf9ROuhnHYPza5SrNc8JG7SFNP3/PqDrNcSsnjjMJV9uCe39FTVQw9KHvyqH8X3liux/7KIJVIn5C92fEQ8JDW4PUbXBIXQxTN1FHWTKYYPnmxASaON4kFsVQiPFeam8MCtFiqBLAnz19l8gIcPfmot3liAJlAWUaa+/yt6/Z1WJqad87iVLbeQAqMhPQinkTnWcLHxW2eQrqq7dD7fCwBYZkN92cqkfDQbooZJrRZsvxD4SyV2BZVrTvg1Xr79CRkX0zKgCWX27wd9N252Gvkh3Om1JxgiYfRUM/MljW5cdAeN3iarZiaeqhItTgbLQmSz+DVB6yRgjS0fW0GshWiCpVHWMIidswGkv82/ZxnATgK4acivpVi+SrO5AAqjeLuiTVBYUrDFZD4QFRR+QqE6daGHfu2UfrShdxcaWMTyxnmTMuZhzKG+agbF4Z2UVp3YIEaHiBg0fyLrzzu6b6Pry0bQWNRJLR/IgO0KTVK21E94Fwb1jUe7sudLWep/8E21vIvi87rn5vUq4uZRcJJCJfBysL1oRgJcJ5Mi4Qr0gsQiq3EIu0E3hsEqj0NXlAVHuAjcEwdtPKTTow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(71200400001)(186003)(38070700005)(2906002)(86362001)(82960400001)(55016003)(38100700002)(122000001)(110136005)(478600001)(54906003)(6636002)(33656002)(316002)(66476007)(4744005)(7696005)(64756008)(6506007)(26005)(5660300002)(66446008)(8676002)(52536014)(66556008)(76116006)(9686003)(66946007)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmtGcXl2MEI0TzVOVmZVd0wwZGRHa012WDRhVldnaFJoY2pVMStBa3k1MC85?=
 =?utf-8?B?WVA3QU5WWm1OaFR1U0MxZ3NBR2EySTdMcEtiY0M1THdQaE9CRTd1S2NCZUdm?=
 =?utf-8?B?OUc1SGJ4MStVeGZCaTVnZE1ZQk9ZNjVVdDN6OHV0eU12enlpbjhWUlpMUnJQ?=
 =?utf-8?B?UUN4V0ZSS2Z4WnByY1Nlcy9WKzZQODlVWTdWbFJ4enhBK3FPM0xUM1VDNVVl?=
 =?utf-8?B?UWhkRkZqT0VTeTliM0k5Y2VCVGl1WndHUkhIME5MRlRHMlV3ejBGMFBPTmE0?=
 =?utf-8?B?aTd3b1BrZUVtRWt0MGF3cS84K0Z0KzVCL1Z5cXNLaHord3JEUHFUM2tlcXVF?=
 =?utf-8?B?MSszN2NuRmtXa3ZoNXY0U29RYU5pZmptSkR1VkQxVWpPRDkxTTJRaFl3UW9t?=
 =?utf-8?B?NDkyWmJvTUpIeitHeExIR0JlbmMwcitNaEtDalROTU1xMVZXOTA1R1dQdTVP?=
 =?utf-8?B?MFcrZlFGY1F1RitZNVFhdlVlSVpxVWVBc0Nnb0RDc0x2dWNDdWFHdHk3dVVh?=
 =?utf-8?B?WWxHSHpWTVFOcWcwMzVrMk1WTkQ3RWhqK1BVTW43L3lvNk05b0JMeGZMQWdh?=
 =?utf-8?B?TGVpTXQ0S3lYd1lkb2tjOFhkdjRYZmoxVzJ1bjFJVXBDTUtqTkhhcS9YbUdl?=
 =?utf-8?B?NHdKbWJCOFhFd2o5eWw2eGwyL1RmTmNESUpucHlKRWxuTTRzSTV1dS9GSWwy?=
 =?utf-8?B?ZnBPM2ozSG1jNjdGWHVHRUhUV1ZWMzZ4bTNoOWtKc0oyNytiWFBIWmRRUjVE?=
 =?utf-8?B?T3VrSmFUUTZjek9RaFBMSzM4TjFhUy83a0tPOVR1OWZ5MEFyTFp0RStJRGpn?=
 =?utf-8?B?UUtWU25zL3lCMjZSVVkyREtHNHBndjBZT0IwelJXQTA0clVuWU51N3VWMXox?=
 =?utf-8?B?S2tzTmNVQVkwNXJCRVZzSk45eStaeXBDYmxZNGRyOExXc1h6blIyTHhoZmVG?=
 =?utf-8?B?UHFsaVREeXIxekZoc1BXdmZCUUJaRXZZTkUwK2Z4TWcrRFhQWlp3bjZWN1E4?=
 =?utf-8?B?MUpYVDhzb3A2VzdCM1ZxYzlNVWNxbWlHR2tjSEFyNlZ4dm1ueGpGbU53bHlC?=
 =?utf-8?B?OGkrbGhXODFjT1VIWmhkK0EwSDJCSUVKY0JmOFI1Yk43cFZJU2ZsZFlKZStW?=
 =?utf-8?B?MVpqTC9xb3lPUWJDNXlzT2k5RWUwZFV5Y2NIOVlXNWJ1VTZUSDNHQnRlcHd5?=
 =?utf-8?B?dmNPa0MxWms1R2V2RWNaRUxGRldlNXhtbml6QUpDRkcreGRPZzR1VUE0WXJE?=
 =?utf-8?B?Mk9kcTg4dUJYM3J4K1VYYloyUVgyMlNTSDRFSE5qWXA4NjdoeGZQb3dIaVJi?=
 =?utf-8?B?UisvK0V2ZHJrLzdyZ1NFODZzZHA3UHcvREJsVHRueFJxc2g3UUFIb3FqWHBr?=
 =?utf-8?B?OXhFUlFyRGdxMlovQStxNjUweVM2N0c4Z2dMY3RObUt6UGovbG5WZlBQakhM?=
 =?utf-8?B?RTJnclFJanRLVFhRcWpsZUJ0T29hckI3V3RrQVRPSjljaWpzZUxvZGFSRzVD?=
 =?utf-8?B?MnRMa2N1bytRclI3Si9kRzNjQUVNdmIrTU52RTQ0R3l1RHZsem1HTWhPckpz?=
 =?utf-8?B?b2JKOEVOZVdReGVxVmpBMndEWndXWS9qWk9QOXNXVXZMWTl4R2M1SEJiOGNv?=
 =?utf-8?B?bzlWcFh5TWFaaFBpdjV2eTE1eks1U1RoWDgwajlpRzk4R1JSd1B2aExkajBZ?=
 =?utf-8?B?Ty85empNZ3JYWmkyQWRqaXExR2pQRlZRRktwOUFIZ000YnhITUdmbzBud3Mz?=
 =?utf-8?B?UDA1Rmh5dUVIaEJFbmJDckpxTDM0ZlNEY2p4QkxRZmlEUmRxYnBwSmtLeGNv?=
 =?utf-8?B?K1VQUWFQTjVQNkFPbXlJQ1FpMzZtU1hTbmQwTFNieUZaVHlwTzhrbWlsejZ6?=
 =?utf-8?B?cDdtd3F5eG5maWtyRXJoMW1nRklISHlLVGJ6LzUvQmNKcHBNTnpUMXdHSUor?=
 =?utf-8?B?RUJ0a25leHFEb1A0RklJUDZYNkpWbG54bGxsUFNsclpZRUJOODJTQWpCTEU5?=
 =?utf-8?B?czlGZnZONmRFc1VGWE5SdTZOcE54dVNTc3huaUFzdi9LZTlNaGZLYmpUUlk0?=
 =?utf-8?B?VEFwdHg2b1JNelhWdDdWUnQrUDlTTFdPQ09NRjlvK0lKUmNOS1ZqV01tRyty?=
 =?utf-8?Q?ZG5Q+5MD76a/3nyJ8n9xhSYna?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43db33c0-2e56-48ca-a8db-08dac38f6e75
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 02:50:02.7135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bln50gB05iWWLJ9yM10nkBCrK1ezCFELk8yqpqsn0Rn9ZotAsB6AJD3EXOw6vjmSzdKbNmjFC8i2xNq9Wq3x1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCj4gU2VudDog
RnJpZGF5LCBOb3ZlbWJlciAxMSwgMjAyMiA4OjIyIEFNDQo+IA0KPiBBbHdheXMgcHV0IHRoZSBL
Vk0gcmVmZXJlbmNlIHdoZW4gY2xvc2luZyBhIHZDUFUgZGV2aWNlLCBhcw0KPiBpbnRlbF92Z3B1
X29wZW5fZGV2aWNlKCkgc3VjY2VlZHMgaWYgYW5kIG9ubHkgaWYgdGhlIEtWTSBwb2ludGVyIGlz
DQo+IHZhbGlkIGFuZCBhIHJlZmVyZW5jZSB0byBLVk0gaXMgYWNxdWlyZWQuICBBbmQgaWYgdGhh
dCBkb2Vzbid0IGhvbGQgdHJ1ZSwNCj4gdGhlIGNhbGwgdG8ga3ZtX3BhZ2VfdHJhY2tfdW5yZWdp
c3Rlcl9ub3RpZmllcigpIGEgZmV3IGxpbmVzIGVhcmxpZXIgaXMNCj4gZG9vbWVkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQoN
ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==
