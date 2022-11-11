Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31162510E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 03:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F84910E73C;
	Fri, 11 Nov 2022 02:49:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63410E73B;
 Fri, 11 Nov 2022 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668134984; x=1699670984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nN0m5J4YMEf+5J0YYpLHupACkVJRB4+2F833ZMMyuwE=;
 b=enJkLg2cZVLZVCWDrp3e2FiBh0/iFXuv+WBu/cGXhU0xqkK08yqypFeX
 BgA3+9zI48z863l14/lIdvmSdKXW/y4Eg+JquebS2uMjDj/u48m6PvlBv
 UQgiHXsXGItguJfaQRSkQYwkjcF9OIKF4iAD2JDm5Phgp6YsAwlxoWfhO
 kD+NkvJPHnzhOeh5K6Xszv15M8KO65RyKGjreDJLAFBt/p6WpbXy6XvHd
 /k68uhEzUtsggDZ7FKCgtPtmd6CQbySFejzUOfodZK1eoRMN+1dQE45w0
 lzLMvNgP5rmbks5YGoUm5DKli03RZZBIzMRFCzQ93dsHLs0XXNoLyTKl7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="313289598"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="313289598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="812290490"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="812290490"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 10 Nov 2022 18:49:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 18:49:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 18:49:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 18:49:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 18:49:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6dUJBg9lMquvVTupxBtBXfYTWrd14qfkvtFQG5dBeVqceAROYo3YVl4DhWEVJcoo1sdmBXwoTje3ZFqr/3HPQBQPsPUBG6PT4IYE1kxYJIW0tWUdHxh3JLlOJXsfoGEPcsYFTx1GMTEMOGe+etSWDYuJYQ2UgEUovvbYOlUOjwMABdlr6zg4fFVMzLrvEPfy7ibWPXi1SyAA5uUsmeEa0izqOjh4v3wU3HWWD+ogRb40Q23udPSuEzZ5oVKCrBjCdeli8zX+wbpg48YWbXZR8Vj2AqZxikbpsdgvEx47o5XyXfE8z+juRKcKLQAPdmKkm9+cLZdip6D8HISlLD3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN0m5J4YMEf+5J0YYpLHupACkVJRB4+2F833ZMMyuwE=;
 b=A3TVcXHy2KQ0OnkbdBs65t64BG3iGV4yIlHVpj1B7QsFPHU3GIEYY/lHwXqvdPqwYvSxTDHs3YBzCPI/u/AjaKzvKYDMpPeaOezCa2PszRK4xQCJK5k1G0Ilkhwg+FTEnpOIyKq7YSLs+26PR7f4M92d0Efft8TL08sV/yPNURsPK5K8iMROroKDTXGOYxSI60lZrZx9UcXX+//0vV7cmxOw0I+CH0vomLCHDkQljjjcZmICi85Zj4ltRZmbrCgPo65xsXTVun8bhlyM20YPiXwdOCLK8obbyvtQ6p3mazZrEfUGDULIH9MdSJJJsVSBkTfSyskG7kUQ/x9EMhS4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 02:49:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 02:49:41 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Christopherson,, Sean" <seanjc@google.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 1/2] drm/i915/gvt: Get reference to KVM iff attachment to
 VM is successful
Thread-Topic: [PATCH 1/2] drm/i915/gvt: Get reference to KVM iff attachment to
 VM is successful
Thread-Index: AQHY9WO7p53FAcCER0aIZ1hgIqWgf645BZMQ
Date: Fri, 11 Nov 2022 02:49:41 +0000
Message-ID: <BN9PR11MB52769EEE337073BE45B185DB8C009@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221111002225.2418386-1-seanjc@google.com>
 <20221111002225.2418386-2-seanjc@google.com>
In-Reply-To: <20221111002225.2418386-2-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 8d25aef3-5920-4d94-85cb-08dac38f6192
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eeYS1vf/AxTQnQg87IgNU2fTEURvGU+OTrtXNIdwI0bhYKsQfBE/2TXbRAYuCjD2bG3AGdD+rc3GE0eNLqlVuxolzVudy3M/uNb/OLJzLL/xnHFi9bVc+9DRSr0+jdRVLCMO58XRgQsqfHM2pJJqKlLbDzvrYuyw0fitXiNgx3TFO/4DzhNS9B+8c2nJgwLld+Zgk2VqafKI5JNP1KTmwbRTr6CptkdWi181I3Z/3KnGUZkaHyIqvrGD+M3iAS4zHcUOFLehLGn5b/g8Mu28M7Je2a4ECKuFB2NLGcxIF+tGAgbLlcDD08Uni/33xae2p16vo9Ov/VPDq9KTVhZyNKa1DqgNLBaDD2Szxt8z7YHBNp4yroQz/nev0vTrnB+0hqdtEmtvyA1pgsynO7F/mN+PnjPn5GkBMjWLmSIZD4L07vnWoeAVKrUT1erxMCR0nr2cRVxtp1admibEUMA95SzGMiDH5ElrsW/Wi8Yb18YcG47twnifFtLR6zvXxyT0NTLBF4idQhqOiq62+ZYNp9jCAStPrdB0wCody5XFeBK6wpVDfQEg3eSiPJgKyWF+/BGb8cEkh+3wKzJFfb3929cR7XWyuTkdiv5h0q2h9/YlIQh/AtSgFgJkNM9UyPkHroqCMe/tZKBIUDLSp/y5hpdrBm/w+c7IROA3rtbDEj8lncDG/0pFYSbBmD0ubBtUURXMf+8M4n/0/wjSF9a/rQZ4TQWT1YbJ95JAdqGOCykekNvb2VrEMu9z/5FiWZJy5curVAOeaQO8oSE3hfuuNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(83380400001)(71200400001)(186003)(38070700005)(2906002)(86362001)(82960400001)(55016003)(38100700002)(122000001)(110136005)(478600001)(54906003)(6636002)(33656002)(316002)(66476007)(4744005)(7696005)(64756008)(6506007)(26005)(5660300002)(66446008)(8676002)(52536014)(66556008)(76116006)(9686003)(66946007)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEt5NGRsSFM0Q3J5eHlYTmVwY2NSY08rN1duNGZIRHAwaWY0VGJTdGhjTjIx?=
 =?utf-8?B?M1B2TWJ2ZEdSaXhIbWZmNWROMitLMDR4dUdrSHE1ekU3M0ttUUNWMCtxT0xp?=
 =?utf-8?B?ak1DL2tBUlE1SGVEWnZjWm5DWlVZbS9IZEQ0anRDcHFCTDd3UDdISnk3OUFJ?=
 =?utf-8?B?UGpSdjlHRVdCaXpzSzc3alpFR2lyRS90OGNQWEI1VkRXOWlFMHpOUGo1ZmlM?=
 =?utf-8?B?RFBpcGRPREVLempHeDF1THFUNk00UWRrSEJJVFMvMXU0TXNtTDRNOWRUMWdG?=
 =?utf-8?B?N2Mxbk0ydTlmQk13NEFkYmhsWlZ4SjNlc0dweUtsdS9mTXNSQ3Z0dm1JUzh2?=
 =?utf-8?B?UnhEWXpwaG95VXpWSlpSNlJ4dzkxYzFGS0Y1U2Z1QzByaXFmM1pjZC9QeUox?=
 =?utf-8?B?RG9lVTNlbjlhQ200UVZvZSsxMG80eGdnN2MvajJpQXF1ZDE1VW5Wc2pvbyt3?=
 =?utf-8?B?Z25ObmMvM2ZxYW9xTmZ4RzExN3hqZ1FtamtBc2JmRUFJcGRPTEIwQ2ljUzBz?=
 =?utf-8?B?WUpPcUpNWDRUcDhHSzl0cXVvMVZjNzlVV2JjVFhINDVwS1dPenZLbXRSeHgr?=
 =?utf-8?B?M1ZpOXJ5bHNkTnRXeGpvdVJ2blpSUUNubmFJWU4wNFdGb1JINEx0WFFpSjdB?=
 =?utf-8?B?ZWQ3SnVnU3h2L1l0TUc4TjNQb29oazVzOFVoMjVHcldRb3JxbGNvd3FNWWt3?=
 =?utf-8?B?eDNiVjZxdXlXSm5LVTdpMk94djJRVERMNWg5MEdScm1DQStralFWT29RbEw0?=
 =?utf-8?B?N3hoYzBzaW1RQUMza1J2aUlTVlBhRmVJWWEvQ1dLa25KdW9KMy9sSzh0Z3pB?=
 =?utf-8?B?U0pwUDdvbkJXaVdpaTczYXNEcFJwZjJwc0RDc3BKbktZa0s2UHJiZGpSVVlG?=
 =?utf-8?B?NUFBVExlNTRnWmw4V2gwUzZFTnp1ZmV6bldiVjlDZmMzUGt1THBhNHZLQzVa?=
 =?utf-8?B?bFpiK1NiVFAyZnVvMHJwRmhVWnA4SXZqcHpRUnM5M3ZrMUV0Vk9EdFRMOUMx?=
 =?utf-8?B?TnlZZS9vUWlvZ0JJSE1OaENiakpjTjYvR3UyKy9tS0RzdnhzbjFsbnR1SjZj?=
 =?utf-8?B?N3pEUSs3eFNzeWJxRUcrcnZERXhNYlJyak1mY3lpU3UwMW9IU0ZJczNsMVl6?=
 =?utf-8?B?akdBTHFFOHZCdDNHZ0hZMlBTYUozNU1hUTVzVldtR0hGSVZxVytYUU82d0pZ?=
 =?utf-8?B?MXl6VjZUMmZMODhpQmRTK3RNVUt5dFJVbWp4aExQL3YyVi9NMFdKc0dQQS9l?=
 =?utf-8?B?TVNSZzlMSUdqaVlQcW9NdVRORXNNallhY2s3c1pRMXdheSt6bGM4NW44eWlO?=
 =?utf-8?B?dEhUOXBZWW9pSyt5Tk8rSit0NFE0TWxPT1VybXIxSDNoSC80SlJXWjN3RndW?=
 =?utf-8?B?VWJPalN6Zmx3T1F1SGVRVm85ekROS24xb3FieGFrc0hYL0lUai9TVEFhZ2xa?=
 =?utf-8?B?dEpMYndvNDhUNFp1TkNMMjlUYk5mbFhZQU0wWk9uVHY3akRtODJ6UlpjbEIr?=
 =?utf-8?B?a3RXaHlhODNnSXN3YzlKczI5eXYzbmZCMkpRSit0aUFJM25yVGJyYVJMb0NQ?=
 =?utf-8?B?SVVha3BscUMrTFoxVlJKT0pITWwrZ0ppT055Q0Z4WDNUNEZxS0FTQjZ3OC9j?=
 =?utf-8?B?ZEhkZHg0T3hLNmxmUkFrc1oycEFJeEFoR1JmR2dVWWlNZWVzQUF4a2JRUFdL?=
 =?utf-8?B?M3RtaVRVMm9KY0k5VnpzWSs2dXR5cjRFZnh6L0Jwb1BzWHVVR3NoVzFMTGFj?=
 =?utf-8?B?ZEZ1dHRIREtKczA3UGs5R2NqbldQbDZGTDRxVzlJdllFSlBHT3dDQnRrTlNB?=
 =?utf-8?B?Y0Q0U2c5em03WEk3YnNISDRaYlFEYjUvVm4rbmJ0RWdqU1R5YkpRY2VhOU1O?=
 =?utf-8?B?MEh6NERmNHIyNWpTYlBLYWJBeWRnazczUCtzQTFCR3c0UXVXLytLZzc0Rk0y?=
 =?utf-8?B?R0pQUVl5eVovcjNIOTJTMS9GMVVXVTJsT1pwRklhcCs0ZlJFSmlRaVEvVFBv?=
 =?utf-8?B?T3QvZEVjVjg4ajhjOU9jSWdPZEZYMjBFakZ2NDdYM04zeGZIZ2pzY3BFT0dy?=
 =?utf-8?B?QUtZOHduckxEODJESm9iVk9UakFiQ1dtcWlJOFZNS3hQYlBEMzFnVi9JVlZH?=
 =?utf-8?Q?wLvClLXVFQyfdGn7E+WakcUoT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d25aef3-5920-4d94-85cb-08dac38f6192
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 02:49:41.0922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVKBCDvSdJ9qxpyig+/Unc4UYr4WetUzubQh6QLMDZswIn3UQhJa2uiUCFrN3NTI6112VTtJN/55r7Ostl56EQ==
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

PiBGcm9tOiBTZWFuIENocmlzdG9waGVyc29uDQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTEs
IDIwMjIgODoyMiBBTQ0KPiANCj4gR2V0IGEgcmVmZXJlbmNlIHRvIEtWTSBpZiBhbmQgb25seSBp
ZiBhIHZHUFUgaXMgc3VjY2Vzc2Z1bGx5IGF0dGFjaGVkIHRvDQo+IHRoZSBWTSB0byBhdm9pZCBs
ZWFraW5nIGEgcmVmZXJlbmNlIGlmIHRoZXJlJ3Mgbm8gYXZhaWxhYmxlIHZHUFUuICBPbg0KPiBv
cGVuX2RldmljZSgpIGZhaWx1cmUsIHZmaW9fZGV2aWNlX29wZW4oKSBkb2Vzbid0IGludm9rZSBj
bG9zZV9kZXZpY2UoKS4NCj4gDQo+IEZpeGVzOiA0MjFjZmU2NTk2ZjYgKCJ2ZmlvOiByZW1vdmUg
VkZJT19HUk9VUF9OT1RJRllfU0VUX0tWTSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
DQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29t
Pg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=
