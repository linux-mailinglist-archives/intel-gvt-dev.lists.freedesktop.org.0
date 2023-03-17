Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1536BDEF6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Mar 2023 03:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B867210E239;
	Fri, 17 Mar 2023 02:40:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28BA10E0A2;
 Fri, 17 Mar 2023 02:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679020807; x=1710556807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TlDe97QSD4Y7E++/pkjlt46z+pjNfSpkuZDAYB5hXko=;
 b=n3l6PFdN79wNzPtmb5KqIKzlkQTnmORYbs7n5Xo/kEaHrb6i9OdnpkJO
 GIVGLo363DuTwHXTsuJ+kOcEm5x2q3uWPw026VAllL2SgpdRVz9Re9cNn
 8bZh1UFQOirVOjQWqOG2qd3yfqQpVYaOmkQJ02lzQigBbZVv/8UElAQlm
 wiD1RzNxcO8Oyk7aSJgnSTXOpATGTdDfzw3yQhI105LCGblHZlzSnQhDA
 fOlkM0miBXjtNu4bbu+F1AGbnAI+CvWE6QUgSGsiRvvOEshyTiY2aCPAI
 chaU5655dJy4HcYuHUb6My/ef0QBMXT+x3q9kVARLdRZRGig+1BuSoz1P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335654408"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="335654408"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 19:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823494091"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="823494091"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2023 19:40:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 19:40:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 19:40:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 19:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBnT3qfMbFQpxQOP/tFh5vOoqkSd8wARkHfJGjmHjQimbI2ag4Wbfq2nFS721eVMmDyA+TsKgXtPj0BgjkeLXdqUUGt3ntINxpCwjG9tV0PBDkac0Cd57P2QaPv7H0gVu21fmJMxSCu1tYXCT0RFtO34Jgg1rzzNpOlmk71x7j7DDAcnkwJgV1XDZpCErf/J7GggKOVQ51Fu73qeqJyLUawPTMJUUMXbGQJUOwftEgBn7WHISIIJ2mngCAMYrlHnnvkUwOii8+tRNp6n9zz1xXIsyHMaN+vW4jPr4BQbGsCU0CGSu6Fp2RgqxAo+FM02wNKvIuhHreRD5Twa+UqwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlDe97QSD4Y7E++/pkjlt46z+pjNfSpkuZDAYB5hXko=;
 b=SHUfHNUKAhCyM09KWFZ6/g6xPwUDotjewXktudxZ8UNbJJ4iIrGADQedWcJdhIiRddTdCnbE8DpAU3/TVffvBkz/aEu+U/Tv3S29YJYTev2JbnLD+xYIk6fyIKu8M8ELu38e9sKzUYcA02qByc8ajzondJZP1Z/jKmflKk7sXH43PfsQJUS+y7eOaTNZK8tHRIXWpWP2ppmZ5IqndEsu5KLF0B0RBpnF4eDYBhtk3r6dZAaW+tggN+kxljcPpkMqHwo/cvUZB4iADWRxNpJmcxbugjODyQZKvLRpzqVgLt6p345ZPCrnk3kneO+plngmYBEEIHZPg+wgXaEJ7lVXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 02:40:01 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%8]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 02:40:01 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v7 22/22] docs: vfio: Add vfio device cdev description
Thread-Topic: [PATCH v7 22/22] docs: vfio: Add vfio device cdev description
Thread-Index: AQHZWAa430BWjelnxUmMJuvGq7KRga7+Q2Qg
Date: Fri, 17 Mar 2023 02:40:01 +0000
Message-ID: <BN9PR11MB5276D36688E0EAE22A8A8C2A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230316125534.17216-1-yi.l.liu@intel.com>
 <20230316125534.17216-23-yi.l.liu@intel.com>
In-Reply-To: <20230316125534.17216-23-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB5390:EE_
x-ms-office365-filtering-correlation-id: 1f526774-3893-4b22-4b5b-08db2690e830
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hOVgj36b3CTq2w/WsW1rSV01M5D6/IkJg1LOGBxXTEHsxf7XSCyKbkFwjQBbWJdeacQv4xcHxJYfBbyld25+r5VK060kjSFCfXs9L+lY1BUtNVBFVo1Yi/g1w48WQIIHIxkCnrnAe4xtkfT8NU3os9yFRcLI9guZocBALDyAoxBGkTXYDo/B6ZFbDQy+Gi4BljrhTulRO/+9IAcU6PVJoEnXBrpfqfhToy8sO50+08ajMCCVSCDywVbAFwumTcMDIalvkanNX76E/H7OD4Xdn1v9VoIHRfCXRgrmeZqtgSEMj5tKVU7nkx/1YFD3qyAlKpVbLGQZMBHdVIf2eZCVh4/8vs7YIe1DovWjo/6KYrJYe+Y2bV7btRhHCTaPs1UbgZzddyasFspjbJQQavYPHfmyzTARUNAKESzb579wg6CypSgfX4fBLQjyoHXPmHpAToPtkX7i6Guv4Ua2hUQTJOG3ZxD8XjDVitt4ugIj7HTuRRaeKGdjwKBbJ8WsvggoaV9X431P+yXLHL0Q5wlsajiPIrtQmgr9sU8DECKwVo3vLk4YhXUkr8dx17VOAz89wgq5pkEBF33uEUmxqdKCypTmKnUhyjhgyMz7hzKQLVS6FTN1nbv//26jhxiB2HG2cSSVUjmO7xccoghXSp/ApQ3FhDM9nb12rxdPqj+uM5UUWBR/nboCldJxNPRhylikwWMMf/N79Iav6tvlJU+MZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199018)(86362001)(38070700005)(82960400001)(122000001)(5660300002)(38100700002)(7416002)(33656002)(7696005)(558084003)(2906002)(52536014)(41300700001)(8936002)(26005)(55016003)(9686003)(186003)(6506007)(110136005)(316002)(54906003)(4326008)(66476007)(66446008)(8676002)(76116006)(478600001)(71200400001)(66946007)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eEWc2eZioVKy7Y5pXGaS1UtSfvMu8q+cMWt55GMwJSVw6wrEWo5npB3C1t/h?=
 =?us-ascii?Q?BpGXg2IaZrh4VtR+qZM0CcELfNmUUVUPh4ZB8ymTCrSQcPIaJLF02VzcfglY?=
 =?us-ascii?Q?LIszRVJj1XVMyU8KtP8zN2+kC32Wwxq2ok0QtnEIrt8j3YH7YyurGuZ+1IMy?=
 =?us-ascii?Q?+5v8hfYXCG+USDhllT3yuRKXNdGSE0TjSkM+sA8aoLCAWPQIWaYVQih6qA9W?=
 =?us-ascii?Q?P3lP9o6HP5Y514sjYmN6IIJV+jE99da5fklPoscAgi+i3+00trEAA14mSP+I?=
 =?us-ascii?Q?TpCDrHNejkAUbF4J+36qLJ6Bi8KRkY1l70x8JTsSq+HXsfLvX5+HInWiH00U?=
 =?us-ascii?Q?lRUaAFmMbDZn/JxwnfmLIodcO8Ky3T1VgarNjz8Lox8sKBiiLgU9y73vXRy3?=
 =?us-ascii?Q?BcUmRJ7i21kcOGSiFu8d2K4MZ0gdVVySYLyff2toeB/bwkz3wi3OU+cProxn?=
 =?us-ascii?Q?kxA/oy3/vViYUI6uLjOBQNMhEKOgcyozFCunVTeKgy0c7nWT+Z5jIFoTY0lR?=
 =?us-ascii?Q?EhWScvsS3mnmFduq57/ZthICzR9SWNTiXRiY/Ie1FtRLSweXxYMwlHL53ZCG?=
 =?us-ascii?Q?icVvndjeLapL5AUMHnd3VAPyQHhPnaNOwlv2HXEJMyMQqkyDcq+kalQCWGMn?=
 =?us-ascii?Q?31mdggex9loHzXDneiKdFzSG3wP8xjNwVWSm4xJeVI+torV6lMuguNSAOcGM?=
 =?us-ascii?Q?ofMs0n5v8AGlIBFsqyJ06MrhydhWLoVfR2Ohg42dDEmeXAhAHrRVHYCXPKyQ?=
 =?us-ascii?Q?uFF8l8O5JzWGYtkEKT8gUrrFUs8bX4/9ut4Q/7vmSzA86n9DYeN8gL9b17IM?=
 =?us-ascii?Q?vuAKgelypnNbvr1Bc5Bh+Hx/fWMgzW7/Klibec5y6yGy8iuT97xw1kI1DgQC?=
 =?us-ascii?Q?L9MlE1iwAPXXRDUB6AI8tyNpKldqdcqDR9LAa1oLXR9OQWCDAxk2ZptEadYG?=
 =?us-ascii?Q?DG6d35whp/O6c0osQH/IejxBNuwvzR6piw3kuCrBZymIbb0aKuF3TWZpOgTC?=
 =?us-ascii?Q?BUg79SXRRsyNa6b+G41Q59Fqn7iFqxzeD9dyLcTSUngiItdaH+gdZOHOdl8O?=
 =?us-ascii?Q?SGdpczXRI0yFTsAasjCI0iJzzjie6iBzunWS/AXSVmYcDwl1rbJhOd6SHp0l?=
 =?us-ascii?Q?P70c7ZhMk0cw11P+sE+BtkzR6n3vGjRZRPYiFA4/EMarIzXW78pBRToz7/Ba?=
 =?us-ascii?Q?UcYafPYzwiiqL7DzdmM73vPIYpAXt82NEJrlZ+BPTSfkZqKwJh5k4B7Gaz9T?=
 =?us-ascii?Q?KJ0y5Bpx8o7oP1pmDzl15G9D9L2H0gIG3XFbD/TZahzZkE550+aSzeuqCAJB?=
 =?us-ascii?Q?Oo6Tx4MTzDPZPgR/cSMFbglH692ZW4ZJP5wAXKGUS3pVltpzho7bU34QBind?=
 =?us-ascii?Q?I0Wl4cYk09msaGaMReE3so7h9+73fPxvwo1l9N4uSjhItQsAUxKTE4H7bUJ+?=
 =?us-ascii?Q?2bbE9qvCOMMSVSH+VcU8C6JSPszUZ1YRgAEP+7iZRUMlvw8nP39Erxp0A0fG?=
 =?us-ascii?Q?e6J27uoKwalfV9XNO9xosD7x0yfd9d7zQWc7z4nmrdRQKaq4MgJK5JT0YaUV?=
 =?us-ascii?Q?16UT91yzWY4hVHLILVj2Sb/wt6k+2juR2vkN2v/n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f526774-3893-4b22-4b5b-08db2690e830
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 02:40:01.5526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMC5xNHShawrmTTfjTH9BeVDfBSXimiVwCwS7wmB47+jqpurH+mAFp+RZIN4r5TTcyxdGplenD2zt6GfxMlm2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
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
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Xu,
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

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Thursday, March 16, 2023 8:56 PM
>=20
> This gives notes for userspace applications on device cdev usage.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
