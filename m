Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C081695C21
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Feb 2023 09:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37F10E810;
	Tue, 14 Feb 2023 08:07:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36E210E80E;
 Tue, 14 Feb 2023 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676362027; x=1707898027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=upMQRhHeGPaYDTlCBcylaekLEwfW/Ni5muYw4TzKxvo=;
 b=Jwk7y7+gkk7J6RuliarwGz+0roIZKGpmxdFdiRWm06mm5nCldMpVclT8
 dcSMoj1lR46DFtVj+J4tDofmgFUJHaKNQVDCMFmkhUWn81KemC1/QIGTt
 HydjvR3SaGS3jnjj4gmG0CW1Z8wu7kSoYNClBZNLza3+gWlCGW0wOJl6m
 PTQ4GLiZGa9M5v84y2h/Yqn+kOZaLOzI0yxnXTpf4PfTGEEojwsk5Y2Gv
 VZQOnvVudpretzs7WhTfIWXThCBljPGZd8ONpZBw1/FdHW2la50vwRshN
 mNEGzjQ8fNu1Ut+I0ZIPJpwYslSHpN9Fcsm3IBQkOTBb3H5ugDXtWdSZu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328815476"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328815476"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:06:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671145801"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="671145801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 00:06:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 00:06:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 00:06:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 00:06:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/GSX1kJNOy09Fz7cDmKno6sw5CeMfOGO2uP9P1AHH0BLmG1RKqht0FEx1vuZ7A8YD/E619Gw62Y+rJQyB1yOZTXhSS/WxXDBr83acLd0u3khLmj4OLMOGaj4jKRE9g3WP9dAcm2TuvuToPCK0T17NMQI/13G7TAo4T77GqWbzUUWRKriLe3J1q9gfILx2lNXV6p8bvQHWK2nsT4J76PFkJGcCAdqlH0DRNbUkhcRiT+7piAG1Im4FcFNlBRrc/WhT9vx6cpFFxjPY/IVQ4iDFE3lB2DmzhinloUz4CwO8hjtbpdyb/ByDDo4AjnTL6iwT9VsNdaMdkjQ8kGebfPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upMQRhHeGPaYDTlCBcylaekLEwfW/Ni5muYw4TzKxvo=;
 b=jWco2hf4/dK7uYRCe9J6e/9wRROB3hUEv90KBqruomaDEo27MjcejEbYP8sVmo1CFzuzMJ18P/5UcffQGQjKNABaSAb29D9QuVCxaTdgQgV35mSZHIqKktQTUZds331QV3yFDu5MvCb6+BoXBG3IH+aEHufgc0L2wIOwtBP7IIID1iTO/uGUnBeh8wknyPm2bX2iJRE53PzTcpL4JjIoNIFNbGEbBYGPrrN98C3h1WKI2D/dU3mhQUDaYHqVK9u0bbvxxmlZiDGjxSFfemLTm7Y5DzI0UZgUq4dweRX1Vp+OeX9q/8Rna1ZCrbSceP3Syer6qMpTNJD3KNGwivng9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 08:06:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 08:06:46 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>
Subject: RE: [PATCH v3 10/15] vfio-iommufd: Add detach_ioas for emulated VFIO
 devices
Thread-Topic: [PATCH v3 10/15] vfio-iommufd: Add detach_ioas for emulated VFIO
 devices
Thread-Index: AQHZP73UitONeFV1XEyoFPFfvN9lSK7OFvzA
Date: Tue, 14 Feb 2023 08:06:46 +0000
Message-ID: <BN9PR11MB52762E04CD46EEFCFBEB53E98CA29@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213151348.56451-11-yi.l.liu@intel.com>
In-Reply-To: <20230213151348.56451-11-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7577:EE_
x-ms-office365-filtering-correlation-id: 0d237a47-2f5d-4edc-602c-08db0e626af3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvpznMkgRbxa2CjZH+SEZMiDIJx1URvWchf0I21cLXd+eLQ7EGQtlP/27ySOYVVmHlnV6V3+C1P88pLp3ja1U7snQxd8ZMUvxbrTsQkISzuRDrjSflF7vxhbFt8dH4UKbBZnA+krFaMcqt98MV2paiIW9AxOrQTAqFn3oXiCCRPY0mJvq5YrCPBeXDxj53t+b9zbKllSMnxnCRqIHm3vbqbqGsZ0s/tpA2ev8mp5AfLUj4r8HNGtM47NU+4TvbPwnNtjW7Mznf9yZrCjQh1BUtPZH/99X8pZSodmkC87Di7S73IPM+HYCudUdNrkttgVTmqa+T+cbwTSiD/Y5JMirGeLT9jh12y6RKE/NBRvn8jdGgYTJVylxS3yKaK7RBLJAPGWs+yjUoFtaOtG6ZI9NgctD3CBiK5cD7YcLtklAGfq5zZyOUk75OP/z3dP8ZygLU9wIghJuIWvGZuAWajH541iE+5z15m4avuXSPrZKyrZFn2cITNXvIAxNa5U8eVsKb+xU12HSMYSs/ixL6dAg98ch97R+7n2NDhY+s/frEGhSmp6JBraG+yhuWK3MkfryEJmdtektVtcZkvBQXRl4LcVPpNxHfsDQQdt2Nksp35x4yMYBARQ1265C39eNSTkQc4fQY4nCdDNXzbpF4/akq2hqQML+sls6PBPYTEl5AC1lN9/D/OL5qWESXRLgPEVBYjzca5zRbb97FIyLnJSsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199018)(71200400001)(7696005)(2906002)(33656002)(55016003)(558084003)(38070700005)(82960400001)(86362001)(38100700002)(122000001)(478600001)(9686003)(186003)(26005)(6506007)(8936002)(41300700001)(52536014)(110136005)(54906003)(66556008)(66476007)(76116006)(4326008)(8676002)(66946007)(64756008)(66446008)(316002)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dezcme6XATHD5tBtv4NORflnETzD97E3ZjBssgqcsL2pOEppqvPN2yViNYTb?=
 =?us-ascii?Q?FmeMf+cvK9aAEA22yQ68JApDw/Pc3avdMg1FoHFU6E8f7Ldr8KdZxHca2qkw?=
 =?us-ascii?Q?ShRgTFqrMBniMLxUCDqWm903TaONOE/yoOlRHYBWdsJCiyM/HtYfAggeKR9j?=
 =?us-ascii?Q?Sm63v55K22hbUBA8d/pc1nqDoY3Hn4i1NdMuj31ymT1yjI9i7lQwS5MBGCe+?=
 =?us-ascii?Q?moKDWFeoVCLzLZabUeVtELjhoVLpuHZ6tbjgJPryHFE3wdzgATE7a3knfocn?=
 =?us-ascii?Q?4KaLAJpnSegOyRg07J+zACJ6bM/nHu9gcJX+P5H8CMDBBfLRHX/59dzRMpGR?=
 =?us-ascii?Q?0LTa70uCP4aChrX9P/jd+o31z4aMPEN+vobrPFTViJ0kfiqCYDlBCwdsKv9p?=
 =?us-ascii?Q?WQojM+AsU5k6fEYgjD5MK+DmNcHzav8o2B7w0h25Qtod7Th8TC0zkYICyAPM?=
 =?us-ascii?Q?J+a29CFJetuIYTTt7eYmH2Wz3qkCw4404WD9upr10btHMSg9xTjBLkpf5ABB?=
 =?us-ascii?Q?7xyfY30xfGf0K69bYP44eun8anwdf4eKUn3eAYhHRq8TtQsFbNFrp0lZkFKK?=
 =?us-ascii?Q?GWlxuFTwUS+pPq9kYr0kBK9FlNIzvYRUw5ErBTWrC70fF9yYAIpzc1aiCr8t?=
 =?us-ascii?Q?78Las/I0A2MUeYunH+VgynfaeKcRIqZ6aLEmQEVHE9VKynNToAXs66mUw7RG?=
 =?us-ascii?Q?Em5JlHmjCeE5JV4wkTwfSpb/mn54DHpVncsBQTixFpIRuYhrpxcKKG/upAeI?=
 =?us-ascii?Q?0aJlpuFN1BRDlfFEzAXSnYjnP5S2uXVxw6VORNfXIipg9NVxTrFA4NGQjBaT?=
 =?us-ascii?Q?b9UjIT0h97Fpxsj5xh8S9kX5KJorcWZMLxEiLwNEk8Yk5OPIuuhmafeab3NA?=
 =?us-ascii?Q?SnqsS2cWGi8RUZr+nhrAxF4VPx5LPd/N7ul14EbayrZvnVZdNQ8yUiKR1bgY?=
 =?us-ascii?Q?EGGJNBSl2zlFy7pyOZlsJAfBSlDYEw+rSDK139hULYQeCPez6tWSZxjloMsA?=
 =?us-ascii?Q?QRbRMsLgtqCOP3KcMqMFKQm2VvwQC1NEulLgKZE48Zvy0tZMW7SFcqKo70uF?=
 =?us-ascii?Q?XIyQMAoOaWpfn170z+/euJeaBP/Dto4W+tCq/ezLICzuWcVsG9ka/BI0UGw/?=
 =?us-ascii?Q?If9iMzggchJTPCT1Qt6qw5jJeMRCzogBEG5o1YFXZe5IZmyrFGD01EFudg4M?=
 =?us-ascii?Q?Jxdw0QmsWKvtzuvFaxwNgDflpVJZWMuvj9htTaltYz94/LOhMuwOzOfKi6rV?=
 =?us-ascii?Q?v2r/q0WvyJ0IMUgn7NRBYB2C74idozfL5LoKvCOHa4sCrFc7daMAk6BSxHfH?=
 =?us-ascii?Q?b4biCLkDaSdtdXHSQ+fdW8eKqVTR7zHA3pSD938SMHQx0uk/iPkaqZIASLjn?=
 =?us-ascii?Q?IBpN5mzJm4IsyT68kpsz7BU0cCkwh/ur3RsPxYUI9jigbWeUUuJ3wle9E/Rp?=
 =?us-ascii?Q?7fQ9NylHmOu9Hinmo9adNMBh19TNXQMz6rmHSir8yAAGJi0UJMwdU7uFsXL7?=
 =?us-ascii?Q?IaP/lxHXkEVVsEfE6t75uEd3o3V4xrNq5hEOFrzs52VQYROjMEjCgz+xE4HL?=
 =?us-ascii?Q?QUwlRixUrEmzJhbU7q48IWFgr7Ocbq1mZyFIT0Uv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d237a47-2f5d-4edc-602c-08db0e626af3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 08:06:46.6663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5I8bC9koX9h2Z7XTSX6XKSrBwm72+Gae2Wz9OPnw4elfWL3f3bYSLx6Lmb3blZpihgYa1dUIx/A0hWkzGyOyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Monday, February 13, 2023 11:14 PM
>=20
> this prepares for adding DETACH ioctl for emulated VFIO devices.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
