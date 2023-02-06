Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E5568B4AC
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Feb 2023 04:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B3910E306;
	Mon,  6 Feb 2023 03:53:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0615210E0FE;
 Mon,  6 Feb 2023 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675655586; x=1707191586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3bGQUZ3Rc+7CWkMM4+ECuLgKL3ERreKpG7Bz5AI/wAw=;
 b=Em2KKdSZSYySZ8ZnyjH7aK/2+EhMUZLki2SjwD8oi8stmGDFTQeaWeLD
 eqCwn2iyRW/wULpGQ3Imqy7EJiEasVqwwLiAIlkhIYKXz+AfnTR0HMYXK
 sm0H78jAKVZW4+YTGKCTOyuQqB9CFm1eFObvqVuiHV/Wr79w2NJfNoPSG
 cfhDhGo0sIA+mCAykB4gAYUaDs5lLlKeB0chXpYwpit+Xk1eSNnEabFSU
 2uxd9rUxd9jqMh8Ad7a1zyFj8DNM0QtKTZokIttS645UwbT0ZgnLcw6/O
 w6OOriOzmLBWzmzVxHHM4mh8UmpxK0fAvLZxlTIjGB3ExhK1VasFbvB+E g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="327757411"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="327757411"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2023 19:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="668284906"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="668284906"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2023 19:53:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 5 Feb 2023 19:53:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 5 Feb 2023 19:53:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 5 Feb 2023 19:53:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKxH4IQEcybHslmT+unryhOj1oEa2aZZnqpv6JEh7f+A6ktT8xRxTMdZ67Xa/ApTKK2LgfNUqBqEaFx28Kx+L6uIqShTIsc8OkvFIhBhpT8VPOtsJBC7XWVfEQU9dXlQ8S8THJsUk6DL6gyN39nO+DafgV6OGXnudJclUihdJkSul/Bweq3xQnsVZI9DN/iYeQEa/aAQf9FLE661cU3kFuzxGAY9wzvGZKRtMSgSbirVs1t8Oziwr8hKOeTXiTkpb+xjK3jgwB568SZw3hymp0a9KE+VV4IUp9O7B0Eh90woMq38Z1Kp/u6PO/EnEhXfOI3TiqH1fISDD8tswo7Fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bGQUZ3Rc+7CWkMM4+ECuLgKL3ERreKpG7Bz5AI/wAw=;
 b=Rdhz/dRd4aIYdoA9pKBVzbGxstouwaU5bsIFRwZk8BFhIUybR45WX2gZH7zgWdahVycYXHEBOlu0HbDUHHO9xOSlS6xj80Z/GTEGZtKIzCNlC5UTSosuI0nwo+ArjL4gfixtFJpuMIng0EZwWBdC6CODMqbyqrJuwLHeCclUPU7jHnVjmuk41ut81WG9RDdhLr6gfqeTZaDlrz2b+dIDSNU2OxN5XAIo2PhvVxA2JBc3LaHywkZZxeS8Mjb1BIZG+R83dIcMB8+Ne6h59aabg34oWpgJZFQuxli2OBaxipPAH/aRhDJpKYN/+3L8JfW3dAFZ6B7swHhgwtebYIcDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 03:53:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 03:53:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v4 2/2] vfio: no need to pass kvm pointer during device
 open
Thread-Topic: [PATCH v4 2/2] vfio: no need to pass kvm pointer during device
 open
Thread-Index: AQHZOBmTMMXXStnqQky2257j7qcuNK7BTLkw
Date: Mon, 6 Feb 2023 03:53:02 +0000
Message-ID: <BN9PR11MB527697AF42AD2FE191441A8E8CDA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230203215027.151988-1-mjrosato@linux.ibm.com>
 <20230203215027.151988-3-mjrosato@linux.ibm.com>
In-Reply-To: <20230203215027.151988-3-mjrosato@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB7810:EE_
x-ms-office365-filtering-correlation-id: 3d189af0-21ca-40bf-a253-08db07f5a541
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fTUr7xCtDy1ttV6528sdiyNBFaW9LCIpQuEo1LawztK3nB/hBT0jEkjiay/YrasUwZBYKcgqIh8xq1giulKpC+E3DDAUjaa0DiGsF3mfM99Fs7r4WASexncEjZkANuvRU3bgXC9XtExKC/rkPNQfybJLSvSQwhpo3xfaaLfT//bxruKkhgfBEeqkuZWbTYr4j/S6+8RgWP2/BSM6c3OcgqS6HsnSfI4GX5Us83LL4FWLCVzzneB1gEG5mecrFzscdCqpUPsYpVxZWGgSOyo0/bOerATysmLJxnOH3AnysDMCKHaStG/n0EedHdCw44neESTh78kFrq0qjF26YBfCiL10Q/E4SDcKEvv60UeZRNuk4n/mEOq4ERFcEP89nWltZ6ILbojwscFqFX/d8uVO8ozq1J7d3hk4j5RoAn8RD6WGdPtVRXje5IcksRR3c/gym48gTPtk8fYKPhoXjaFb27dL6VFtt4n4k1Sqf5LJXfy9d38Jagl0ruUlgEDT6e5ZBx1tSsVgqW3N97OyJIW/vErJqvJ/4zeumS2WnGJBps/bVdBuOiQIrPMdKS2BvaxaHAZ6qb8LEuVJOx0poULAzdJrLZHkuM9kOtVVI6maYYnWAKp17dI6LuVDAQugsf1fGURUfrKpWpFaMox9JbbqNaY0iKtiLSL4sQm3ZOYBS9RpWl7t0rPfF/fyvW62E91SJP4VODqi3cpksSK4MaA1xg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199018)(7416002)(5660300002)(52536014)(8936002)(41300700001)(86362001)(38100700002)(38070700005)(55016003)(82960400001)(122000001)(2906002)(558084003)(186003)(26005)(9686003)(110136005)(54906003)(6506007)(478600001)(71200400001)(7696005)(33656002)(66476007)(76116006)(66446008)(66946007)(66556008)(4326008)(64756008)(8676002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wdlzw634Cx1NPXD2vN8gdmXrSdmpzupql6B0mAqgNnQsCgrP4xHlcXQuBFoY?=
 =?us-ascii?Q?TBDQSi0CW2/0Tn8GdF5y2njt+dFwCkvuwLFm+URMOHDQ/bjs0BquQhML9RH9?=
 =?us-ascii?Q?ucS3EUZflEZ2HIxBd2vRA9WZKAnbGXFANDFbGhci37Aibt8FW+SzhG8YosRr?=
 =?us-ascii?Q?DsAbRSa1q7taYtRxPJPYv+ZOZq5toD3UQIeAWC+Gwl1yDMJeRAbiWn/4eqbU?=
 =?us-ascii?Q?hNolgzquX9yWWRE2N0e+ECUWP9wp9IXUzIw4Zw2G0uL77GOGK20VxZHEVdlO?=
 =?us-ascii?Q?sA1utYB30wi4mySM+8L2QH/FICOrsXgfYh9S0psAY8BK9+3L1P9vFIHMBanM?=
 =?us-ascii?Q?0Pwq0UXCST8gngYiWPprIVv7KlRlRm/HWGEmNiN8IRSDvHFW92el7QOOAXQv?=
 =?us-ascii?Q?CGvZYGq11fWl2TsotPDwkzIXl27UpW2Zr79JXY07Xgh7p1lRvG0uDDZwX7i/?=
 =?us-ascii?Q?oyKnTyjw5mybzGFQNjsGCP0dWv/75tI9L2ALw0EEVEdrzKwg8Pveda7lMSN8?=
 =?us-ascii?Q?xXJPeZFOSZmyiDEDBQibMv8s41c8PSWTymSPnKF0lFuAPq88dytRXovdFNrO?=
 =?us-ascii?Q?iLO9rm9XcjMH3NfDer+LCD90XP4hxJXWrfOHTzRoPoxR6zwNvxF42hM9f+07?=
 =?us-ascii?Q?uBGiEjbsH//E3uMixu966dBJuDsQ93xdisgL1LPKkKPLvQlOCSelUrYLINUe?=
 =?us-ascii?Q?eMAgdseQFUOZp2fuX0a3oBpdJENctMVL9Jb6zR5zIgEAWZbb9N1C526MvrGM?=
 =?us-ascii?Q?qtjCjO3vti8szNeAAerskA6yi+kOmdsTgBTizcf77LzkOmpFqFfEA+wnSAxQ?=
 =?us-ascii?Q?I8tagEYlknCSXvlaLw/BsBYzq732EvKkchweQY+Cz6hL/o5r4lWcPL9asHiW?=
 =?us-ascii?Q?/5O6rakqgMUrIO09sv//cm8FWcVPWIR9sU16Ucpk6jcXhs6L8ccbTRhN79Ln?=
 =?us-ascii?Q?z/pP6olIPSzprEH+oaTVJONAMMrf2lCu6oAVA8rnFliycvZ7T0KYVQhPzHJx?=
 =?us-ascii?Q?G6U769NZx+ah97J3SURDTAn5zoidN2PO+tWx2nQDj6mde1UzxWx6EsqVF2O9?=
 =?us-ascii?Q?oSILotyq7T5ix+R7wr6BbBl4jkRsXeIsGB3LSvKXT79wLCxC5FoIJ/aeQkcJ?=
 =?us-ascii?Q?QyLlOXAAeuvGpRuVLyMFDYz93sJsMBQXxlRpEVkQs/MnJEKztSl74KjArAN7?=
 =?us-ascii?Q?iunpJa393ipIEp0WmzxblvXAzZS4ps8ydoL8hKJSHCcppjjVtoMIJ/+8wgnB?=
 =?us-ascii?Q?vIHlu4ifI/WCqf4kxXW71GqKJ0GI7gSubFoMdiTD8LH5d0uvjrFMqrEye4iP?=
 =?us-ascii?Q?mO733Dw+XLpG1jK17X4/4tVksIVYgm0LxXU74JmU+MnxSNUO5ynw8pyOB+ct?=
 =?us-ascii?Q?v+lZFp4UX5ot9mED5saXEAWpFtUcqS4Y2cTCPAEICDZiPMnq9A/FOQzfkIh1?=
 =?us-ascii?Q?GxLZ+J2S6J3iwgT/9FxRnCfQop9luvPhMahfyKBk5IiNuDMJDUJh39Q9KKh9?=
 =?us-ascii?Q?LdkW6jtDHBhL48NjVknf6hcoOPJK+Lw7975vPS4JbXSxTijKpAnd7wWp9M/+?=
 =?us-ascii?Q?InTvVMP2etGLMQ1x5FUpYn52KcE9OH+oufWvAXbL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d189af0-21ca-40bf-a253-08db07f5a541
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 03:53:02.3822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMmGrXn3kTbSIvSPRFbayejcDNmxI4llsA3IirrISfZi561MY01VBp9MNyOUHXl8YhJ0Xd10CPjWT4qJ8GoDkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "Christopherson, ,
 Sean" <seanjc@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Matthew Rosato <mjrosato@linux.ibm.com>
> Sent: Saturday, February 4, 2023 5:50 AM
>=20
> Nothing uses this value during vfio_device_open anymore so it's safe
> to remove it.
>=20
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
