Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685C6E1F0D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Apr 2023 11:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127E10E0EB;
	Fri, 14 Apr 2023 09:11:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB52310E0EB;
 Fri, 14 Apr 2023 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681463495; x=1712999495;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YAg+JiMQdpc+sL5NvzqYE+V8Bcrxff9hYG4jbDnSVP4=;
 b=aSnkusqHPmABUzVGPR+qF/+pZieKE5zH6GFVa/BZadtvKepNdgfPMOXK
 btGjEnnGWbUbVf9+JwUszKuB7ofnGOHlCyUYBGTVeOb4sFPJceUOl1LKh
 nF76lIrqwSitLQ2u/vLutyXADrrtsDS4TK5U1WwH8fgJ+ON7g1PogDbeI
 lXkUdtwn9DyDfV5vEumVirfXSyPoMWWo5pPuJs1wxUCd8fTOkmJGwEFEa
 n9RjEHqfKGbCyuHlmuq9bLA1f2Q2n1stWm6vwetNT+7xYB3RsvCFJq6YH
 Mb7jDkIl94FsrOvoD+mO3sqy9ZzNcTI2dE/ZZqM2kguAdSZWFSCHJHNM7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409621899"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="409621899"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 02:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864151904"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="864151904"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 02:11:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 02:11:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 02:11:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 02:11:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 02:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvo0sYyzXICe0t5AL4B2mItiKYs3hGj1O6UvWR9kSTqB1R4GihOryN+wmlg/AB9pHFtKF7dnyIUKU9r/2LeRFqUzKU40Rrpf+tzI6b2+u8G4JCY/VIBE1XQYHP5mAFwuzXqrSx8/jfQf0PIcP/nWgvJxmxoz558fzr+14cn5SlbOiL6HX9gLvSwke1MlwTYLEA6rUWeBZXUvoqTM9vhl4S2+AYyz5NmQWcyKDpzmo2vV62+1fxLbxgnoGllGTPpf9/Tj3bu/ByhDmke4JDJy9JR1iFygfXm/jbtq8cKBdgN2oTHa1EClBn/QmoNOqB8jrJP6gwhEuArSJiR57wKUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+oLStcGufsIjJGxNk9m9LxKkfYYw+HhBe0RZ1jyk+U=;
 b=J9ZzLDiP8Ix3v34PuE7hG6DZvRHbtIf/IeH19AyYICIvcKInwJKq6lssNeWfVIDFxQv8lD1XPbUKcOEHbL1qeYaF1XtyVXImo9eqJNzbjnlCmfrbOiRakKtxC+17jTSGybUvXb8/LdiJ1LKGMd/cz8laiAO/88rq9mKurprhgeW/CTtLAREpb2bCLWGHfQcazSiks+oZASS0UH2yPf6Io+X/7MZ+1j9Wpp8n1aUYCtjQnzfDDRPt4dhHbVtk6e0HQw0eyUopwbFRHm5UEPXN/i2+2D0okygrX84AM51g/9n2PoKBu2k8dhB2xsuu+mP0dq8dXzwUZwooElLEzcMOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 09:11:31 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 09:11:31 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>
Subject: RE: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Topic: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Index: AQHZZKiCXow33Wzeq0K314B/OZqu968cqG8AgAAdbYCAACdegIAAAyuAgAAEPICAAAjLgIAAGeKAgAAG7oCAAAf9gIAAO30AgACyrQCAAIPEgIAHkI0AgAApuICAABWEgIAAGNKAgAA3aoCAACJEAIABGhiAgAA2uYCAAMsIYIAAPMKAgABpLgCAAPe5MA==
Date: Fri, 14 Apr 2023 09:11:30 +0000
Message-ID: <BN9PR11MB5276A160CA699933B897C8C18C999@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230406115347.7af28448.alex.williamson@redhat.com>
 <ZDVfqpOCnImKr//m@nvidia.com>
 <20230411095417.240bac39.alex.williamson@redhat.com>
 <20230411111117.0766ad52.alex.williamson@redhat.com>
 <ZDWph7g0hcbJHU1B@nvidia.com>
 <20230411155827.3489400a.alex.williamson@redhat.com>
 <ZDX0wtcvZuS4uxmG@nvidia.com>
 <20230412105045.79adc83d.alex.williamson@redhat.com>
 <ZDcPTTPlni/Mi6p3@nvidia.com>
 <BN9PR11MB5276782DA56670C8209470828C989@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZDfslVwqk6JtPpyD@nvidia.com>
 <20230413120712.3b9bf42d.alex.williamson@redhat.com>
In-Reply-To: <20230413120712.3b9bf42d.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB5774:EE_
x-ms-office365-filtering-correlation-id: d8746fe7-2d08-45b4-dc6b-08db3cc83c20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wcTaCUIaX/ZvFsmtibVTUbUmWurCjhwniZ+hFCQA0vfOI9Nnm1QlPgb2K1LfbDgLo/JYo4Efzy5Vgo7Efw2Vjx19qQ0h6QtpbVGgE2PPpl+VNhyo5fTe0FEAKZSA8WZeHIkeh5H8uHq0+tN7a8qGPJ4Y8JyUZEwzp7lkAyE2VZEnjlJOWzP7ykJvbpyaBhvZ1o6WBSxADpHQFShcq2IH2N+FcpGlb/m+fb9LwZcqFj+34N0QzFQqVqPa0vngtc8fGY8vrRnuoLjDbNFw3aNAMqHGVKqs5LgF9j+idYWWxvN2IjFbTbjmpizjLof5A+sn7kSxG/IB0PWbAHZbGk99CMKX15HtmKACqDtz3PUOy1QyNP5wEUFlUIf4bb0t8zhWeqIxKml5BxnsHCE4s9MKht2N1haZRW4uMJphLjymm0UxYbtL7DU07kHN5JKI9I+pUa++5W60FP6FygLJZ55u4gm+2JDBVMFTE24J9GAhRlDB7jTqEupLlVRxdXiyTLH6OIilNyIj7tjf/bJhRX02GlLkz8ERGn6FC+yyDoW2E9/bcVCG16wS6XH/HD3XSQDdJLeKabub39pOEg+gTZJUaMIcxKRlHswVNIkAlcLPu/wUj1vohxEYS71c3TiTs74S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(71200400001)(7696005)(66476007)(66556008)(64756008)(66946007)(76116006)(4326008)(66446008)(2906002)(7416002)(38070700005)(86362001)(38100700002)(122000001)(52536014)(41300700001)(82960400001)(5660300002)(33656002)(8936002)(8676002)(316002)(478600001)(110136005)(55016003)(54906003)(9686003)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SPLSXF/ck/AycSDr/jgTrFkCdA6U0SeF76Vj2e1VA48dfyV0AxNaQ37nDUhY?=
 =?us-ascii?Q?mFgUX1YjBORLG8cNJuPh7xR5H6mPD6jBCxP+qSlcTVGzga9TdbMjPOMlkPnl?=
 =?us-ascii?Q?R23mRH23AIu1Zk0X//LhPV0CRU61rslzvUsfsYSplUlxWP+gJhTq1VD2s03E?=
 =?us-ascii?Q?v1N6bLWRT7SkgFRVZmAGvZ8YpY/UqOYjywJR4MAd0FBOayf+EmMVnuXBEUSL?=
 =?us-ascii?Q?cfBDRNpXnOjcckMd/pZcweNnzN9qMS9sU7mWFyF5pYGUkmCm/mX1LyliYQcE?=
 =?us-ascii?Q?JoO474yuRqBQoVrab51XXh9HZA7d1aahpG58P7yvpR3uKQGKsQ5CjoA02tKt?=
 =?us-ascii?Q?XdOO6GtlN8jcZIkGYUHmYYbpIcwhU8QaaPQ5VUsQr3S8IMvyUAb3Vn3CWneK?=
 =?us-ascii?Q?uucSgxsMfFTK9JOAFZnnvTHkKc6+CRiq2Q08XeGaB/ZEccTAmvLn0/4AeZkh?=
 =?us-ascii?Q?tuDyATxN6bIFfiYxvDW92OPQ/ZOgZkOMzd7WcvKenum3ST7+5UOMhGsr9zpy?=
 =?us-ascii?Q?HzOLaEq83gF43O3amaShXoZjHcfjC+l6P0s0uugR8B2CWV0no35tAca+mWMM?=
 =?us-ascii?Q?0TkPUnC+WD6RaIFGXqkCBKN2UA4AhBPUpdX+w2abxo/LC4chb2N7RWUzKWYa?=
 =?us-ascii?Q?iScTD06ezaaa+MM5iSi8XjMGkbyTb2vFAnxOJd277RdihMFXEg7mS1cmlrOC?=
 =?us-ascii?Q?0pCRaSUMpLxtkfn4uZp9dOfgSIPXP9RkuQQTtYM6tebqA2Q4YzJ28G5AbwkH?=
 =?us-ascii?Q?LHIzmHb5x8+L7EopZus9bgtWIPZTKjagmUBwu19Ll9LjNpxvTqBfLLrMxmb8?=
 =?us-ascii?Q?zW0WiiQnPtsVMDDYa2TBQdXpuVMeNQTOBq8ePn9qm3Sp6+pHLDjTCav+BxBD?=
 =?us-ascii?Q?J5WgCFD0revP1w5GQIm0ZXmFFVTJ18E8/rfbJaymefQQnCy2mL+lb3tZV1jJ?=
 =?us-ascii?Q?FuzuGy9PXVM13Ioq+AX9QYPy/+EIdnbCYkEay7LUxt71tzmpepJivtV9YeXX?=
 =?us-ascii?Q?eb2qJLvux3Ea1yR39aMwqjxbL4GxK+iszD3znWJd9xOao3nnZc2uMN3BX1y/?=
 =?us-ascii?Q?0O/g+C9I64uWPGvqRtNolPSWIIJ5oAwyfpwK9mCWzKe5KfdoZkslSW5tQ3pe?=
 =?us-ascii?Q?MKsRk8pbEYLMtgQ+S/+dsBxZLUAzdJs5L3sa0lEST+9DxQHhys1KAzGof4uS?=
 =?us-ascii?Q?7DgzW/wcrjpoYXbJugQKtmbe3NEBmuc9cAPBpWvNGhDYzJQmIiq3rqZhdtHM?=
 =?us-ascii?Q?Sl4mdlIKwfLUPU1nbdIE5chaGr2KRyOV4Xs3fzIsRBGVpgpF8pmIJeBxguYi?=
 =?us-ascii?Q?RdMw7jRZSeM/DKXAoWk1RMHpN8of7ZOTn0ZIdyOFiOYCguGZJ85d9kofLXl7?=
 =?us-ascii?Q?YC2wYUxDl2his1T71DXFrZH3Iq7wd2GetZGf5nJiTZl2v6oZIQPz3t2Y+P3r?=
 =?us-ascii?Q?joxdIKOTo/SzdTn6AAS2CXCmTU+s0x5xL3RnNoOO05Ua7DbALYnLp89tkhNk?=
 =?us-ascii?Q?p88JXRHOsxuetM0eyt0WgyvHRO2hWY9nxHRQZ5/n8gCK/RCVGwuFcD2R926H?=
 =?us-ascii?Q?UUhAY8GXbeijq4D9y+VJu66PGnG9ze/XBxxJlE7w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8746fe7-2d08-45b4-dc6b-08db3cc83c20
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 09:11:30.2519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXA9qK13mVZ8hYn6DFaHnuqKGrn9sTIs7c9eX2o6BtBTGYv+9bXLTLA8XK13n6wQe3aJLtTRyoBeK1uAeesOHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, 
 Zhenzhong" <zhenzhong.duan@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Xu, Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, April 14, 2023 2:07 AM
>=20
> We had already iterated a proposal where the group-id is replaced with
> a dev-id in the existing ioctl and a flag indicates when the return
> value is a dev-id vs group-id.  This had a gap that userspace cannot
> determine if a reset is available given this information since un-owned
> devices report an invalid dev-id and userspace can't know if it has
> implicit ownership.
>=20
> It seems cleaner to me though that we would could still re-use INFO in
> a similar way, simply defining a new flag bit which is valid only in
> the case of returning dev-ids and indicates if the reset is available.
> Therefore in one ioctl, userspace knows if hot-reset is available
> (based on a kernel determination) and can pull valid dev-ids from the

So the kernel needs to compare the group id between devices with
valid dev-ids and devices with invalid dev-ids to decide the implicit
ownership. For noiommu device which has no group_id when
VFIO_GROUP is off then it's resettable only if having a valid dev_id.

The only corner case with this option is when a user mixes group
and cdev usages. iirc you mentioned it's a valid usage to be supported.
In that case the kernel doesn't have sufficient knowledge to judge
'resettable' as it doesn't know which groups are opened by this user.

Not sure whether we can leave it in a ugly way so INFO may not tell
'resettable' accurately in that weird scenario.

> array to associate affected, owned devices, and still has the
> equivalent information to know that one or more of the devices listed
> with an invalid dev-id are preventing the hot-reset from being
> available.
>=20
> Is that an option?  Thanks,
>=20

This works for me if above corner case can be waived.
