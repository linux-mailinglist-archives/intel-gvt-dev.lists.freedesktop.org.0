Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D46BDE60
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Mar 2023 02:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42BF10E239;
	Fri, 17 Mar 2023 01:59:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DFF10E239;
 Fri, 17 Mar 2023 01:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679018370; x=1710554370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8xoMMjZ9gDoBnR/j/wnPzoV2vSyDHIFzuxZWwptGt64=;
 b=MCG9uFvebsTZemxPa94G+u6X2/O09lk67sBYoINEyqW9eA0Zhg00/7nW
 jIzwfO43YeX5Eec/r/zudhFGVlTbQfFtJ5/TfMPrA2ZPBrl+p9X4Tq7XV
 XNYhKL1tLBQd1c43Y22vcPg3M4w7IlNoiDp3o64Pg49a0YcPrdus6GxQQ
 jVogdF3ZWjF1OqgiITu6oHpF4M30Uu70LJO7HIpriZ934P/oy0yT14ODy
 ul/ITpBzplKmxxi8qjBOK1LXzsEK9cPPlkztXQuB2nzKKo5P0t1OVUPg9
 gM0FRC3U/fujLhVw9ePeYn+BzAzsqo1EEYoVJD5O9IMjTKVn0lV1nqr4S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339700251"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="339700251"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 18:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="749085763"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="749085763"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2023 18:59:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 18:59:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 18:59:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 18:59:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 18:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePUNO7vCHgzlbV6bNrGo+vDWhe4i3Su/dxCnH4gYCqpP2N0V0QvMkijExrwvnkSNAvtTTGNkuzgo1M9HOg/Fx38m49/BYF73mlIVDoJDFCcQn1FrrqeLK7XJfjqrwJf31QMwCX+MU6iUZ5Q69I/eVO6MibxDp0s726e1uzqkOEBHF32OxXSIYjIMr1LZwfGTM4gvU9K9BThRwv4uaYkRzNXRGsxs+rgmzDpqP8bUwe1UfAnzYHTU9sXlZfjBS6UmJkeQfO32RF11xwTujQOKEvLhQaiPh1srPj9ZQkpz3ciJtKL1n4Ji2rIH86bE3FxE+ErCLMHEI+nnozWCP+ipLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xoMMjZ9gDoBnR/j/wnPzoV2vSyDHIFzuxZWwptGt64=;
 b=PEVjrJ2/tT2OkweqLoprUa7+hVQnB8nkdvVVAAioqscwIFMrIvYEIc8253KMpaDeydcKh62Zvu6BmFPyPCrsBBIrQfen5jjkUqbMJmyngHpLLuBy7mugQrIN6H7aqUcjcopOGTFGPx+QaeodUd0br/qEJ4zqIp2QqBcj72rIaggicHp+QgxwStz0HoSjWzFxWx5M4GRsphIIMxnV+LXomI6H3XuLiJHyhy+WA2uBn4BUxgyN+CXAlnd+trHyk8dYJCJ8p3LxkhFJkcHLhMXdYKGOL8NB+EVKWo+s++2hBocOjdF2k6On6Fe5lWGJyUHywBZLPL3WKAGPtU1225dNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 01:59:12 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%8]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 01:59:12 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v7 14/22] vfio: Record devid in vfio_device_file
Thread-Topic: [PATCH v7 14/22] vfio: Record devid in vfio_device_file
Thread-Index: AQHZWAarTueg/ju/6kmSGel3m6eh+q7+N/qA
Date: Fri, 17 Mar 2023 01:59:12 +0000
Message-ID: <BN9PR11MB52761AB7DACF3DE05AB138928CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230316125534.17216-1-yi.l.liu@intel.com>
 <20230316125534.17216-15-yi.l.liu@intel.com>
In-Reply-To: <20230316125534.17216-15-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH3PR11MB8209:EE_
x-ms-office365-filtering-correlation-id: 8756ab90-e0d4-4eda-49c5-08db268b3434
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mX/V8ryUb7MFxb0qYX29kKoW0Om+LOxtADHcmmp1uia/BMi0swhdPptM9EuO1DGBXEZ3j9GwIWVRTUWFPdxVEydWEt8bks9dBm9kOLnh7SvrzdmXlNsS7PMGMNiDiRkV6N5L20jECklobekN6dcrP5SsJU4cz0VTP5gaM5FoGLPdsHa4y22w0RG0yU/tNRn3VpMNFbnePBCNhrOUOL31VHNmtBfCWVSDtlPAKf6WrwNIT8ZgMG6Yv8OZvN6NNsllugacS01O9i7QlmjaWaMPjn5n8w9UtYhXW6n80ZcCD9FG6yeP9ZubEShZkw1mx7MMD5H1EnIr5YImOS7VRbG7VfXypISMBtaXxzUHnqQhQVRGYZ8w0UGIEK3O3RtmRxwBq71q42EP9S7WS9qrliyPLjfN7RC6Qk4xvl/Rt0B5hRFXWjg0nbn6vMQrHd485xjdUH/qH35ttHEoTpnHoFFoRnecPZzIGN3skNVAjDGqVZSF+werpwEnLK8zTACAGlWfbKGOgH8rHDKiTOoGg0t0yI+awyxQHxW4W/dJIJIT2QegwPW5njhyucvklrRlhIfbtHULx8FvKsf0qJebkJq4SnrWQqZIs7iitpzLFbvKdH9/kedsbIYLtN2uOxH59oPkhRbkJOeuAj1Mo/Jb+JqGmy6OMhZH4Zc3uf5XKDS1kQHNMXcSx6q8doM/9WqAgYf0Jd1Wf6DoICtwD6xOBeMfqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199018)(4326008)(2906002)(38100700002)(41300700001)(8676002)(82960400001)(122000001)(38070700005)(4744005)(71200400001)(26005)(7696005)(55016003)(54906003)(478600001)(110136005)(66446008)(64756008)(66476007)(66556008)(76116006)(66946007)(6506007)(9686003)(186003)(316002)(86362001)(5660300002)(52536014)(33656002)(7416002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m0r5JKie9et7YqkWc0v13dyLj79ycL2HKZ4XqwJYt1LBcoR9SQ0UnVnTja4E?=
 =?us-ascii?Q?lATMz2Bk4ex95+xvRR00ErFMFw/LDMQzrTLjPh4cw3YP8xR22fE9WYkUK5sp?=
 =?us-ascii?Q?xdPI5bD8ZATRMeN1H4e44mECBF9X/w5dahPPl4uG4aDIZCsYDUpHMMbrpsb3?=
 =?us-ascii?Q?r4Wyixv/NnwwhkEEDUXzqbVqiMmWhRW1yT/jYwBeFEV6LbbV2ORaoVotODYu?=
 =?us-ascii?Q?fDeY247qvr7EO9BY7Mi+rOeRiyaxOn9m0XsH7A56hDC7WWxf/Lie4oqNA2GH?=
 =?us-ascii?Q?U4kngMjHVGZUbK/HOYxvdWdP2FFDaGq3PWdRMU8HAqE0zH8QTajpizFeDdDN?=
 =?us-ascii?Q?5cXUJlKPOUdxaLyzgJIfycvw+8mteYLM4nINz625rFGxlev+U9mJpSP0PlOg?=
 =?us-ascii?Q?IHq6FiE4OBOZTbSFLO5PeLJ53/FBQSLi+OiuIb+zWhdj01XDsyM/o/967VwM?=
 =?us-ascii?Q?/FaBsgUAW7jmQyXpOk8XYkXlah9XQxHMyJT1Q2BGvy5JoxlDahG/zis3/H1e?=
 =?us-ascii?Q?iwXG+BBRD7ev7MGedk2cQu2ggvxGVflSrUGF+PzZG5NGGSnrDPl1+8RGxQ81?=
 =?us-ascii?Q?j+ldU8GQjM/aLkv81rUG2cjQQCHxCIjaWTyYq3jmoEMG/HQo0XWNkx8F3+LZ?=
 =?us-ascii?Q?35Y2EXMcKj3UcugNiLOYM0bytdgm3BD0y/EMZ9zL2GfROPZLg5OC5rTpoeXe?=
 =?us-ascii?Q?tc9zH4Q0omUISbgS0/W8wUOmvz+mIo4p9JMaJBZ5D265RN8dTkxRjbRqTL+d?=
 =?us-ascii?Q?HlUMSMylTFFMtK1d+bbytTZCzKDSi3809CD2XG6ZJRmvRNsWCax826UKgKUY?=
 =?us-ascii?Q?N6SehJ4ZwXG4I9Iiebkhj/VHQ1hNki8Lw7770jQu/d+rgJF8YrfwOOTduNmt?=
 =?us-ascii?Q?JUA3Wu9u3t0kV9isRgYUCKJPr8NBNwgseEIR2R3CZgqTESm8bRExCONZpvd8?=
 =?us-ascii?Q?RTtHrdlS+6RnAi3vZhnIC32QFgGZ0jTsQS3maxUYn7lEmvy86mX8P7qUO8ir?=
 =?us-ascii?Q?cZHGw75CknxBWYWVHf+wbs9jb50CBxZ6X4mVOBCfTMva085OmBg6ML5471Z3?=
 =?us-ascii?Q?IGyIQZ5GE+0s64swqUCm91XDVfQ9OkXqqybOm66a4EQf64yLBpd4DzY1wLp8?=
 =?us-ascii?Q?HdSqNheNCdWYpm8eiy4m3+uToIlJPrG0etE35tRlkLNn9EC46rm1dsQX/x18?=
 =?us-ascii?Q?gaNlFDJkjSAnVTYil3HwUhyXtKKMHneqh2dDUFritQ7DTltOVUcfrdETP72N?=
 =?us-ascii?Q?9M6HBrD0HJErFiA2m0gqEP4PolBoISdMpbDj9VaW9XJg0C6fFzbn4cC4ORU8?=
 =?us-ascii?Q?K7ZkdF0CK8NMfJkj63LCrayimccHLQpCESI+ZtBkoMjTpHA/I0yDnLyL5RCr?=
 =?us-ascii?Q?TJRMq/sZ26UGKRrWJ+P7TRpYtGL81pVpH9rSHeksnJmbktR2LwBItzQIuFsJ?=
 =?us-ascii?Q?qoE54gSDMywQAOPofprMdALeF8wMNp7fOcZk1JBkGj+nI1G8G7ngA06hyTB9?=
 =?us-ascii?Q?tq8Wr5Ye4BM3KelLQhJqEh+oA6dyJ12lQTTvJ3P2vqxPcf+9ldO/OetlqyGD?=
 =?us-ascii?Q?HbXlUMdfypmKweiLSJxJK8KDj3AFj4R+ocVYThXq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8756ab90-e0d4-4eda-49c5-08db268b3434
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 01:59:12.0896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gj2NhTMB5cZnkI5ISchLzQ+3yjA8KaQcEbrksg1kJzjlyQOMFgMZzEj4MfhfVL535m0Qvj0gOyteeurmTxzjng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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
> Sent: Thursday, March 16, 2023 8:55 PM
>=20
> .bind_iommufd() will generate an ID to represent this bond, which is
> needed by userspace for further usage. Store devid in vfio_device_file
> to avoid passing the pointer in multiple places.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
