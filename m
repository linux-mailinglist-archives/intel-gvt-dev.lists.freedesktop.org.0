Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1474F6B3B8B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Mar 2023 10:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BD910E9BC;
	Fri, 10 Mar 2023 09:59:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BAC10E9BC;
 Fri, 10 Mar 2023 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678442362; x=1709978362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oleQtMNdryoaA+QY03aVTpbG+T/j3Bn9ElaHk/HGdQc=;
 b=NM/V12C1HtiQ0c0P7Gwbtyve1ET3vQEkzHj9xGTWsJBq1pXuo2TmcBA5
 ZBVoXEb69SLmEr8mOAJR6/zqw/PyXCv5ATGyOZ13weLCdQ4VuFM0urzoR
 XNqFtRvlEFvFg9Ru4xVxa6kUWC08B93712dcfsJtj+lLtzLoW5+sOtIA1
 ofgp/YpF6WB0GV9ejhAzWQy5ph5zfNnAZRHmUA1AlrNJROLN6/vN+w+a9
 U20YEwQkGO2osfwYSEoAFTRetL+RhfN/FaCbz2kdE81RZMf3x7O4hjLpL
 9V+uFIv+GUWaCRoHBzOGvibjGNAuvB58CUcFKIuYLo3FeFMpPjMWLUISy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422962125"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="422962125"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="655128848"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="655128848"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2023 01:59:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:59:21 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:59:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 01:59:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 01:59:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMBH+HYt5gNkvvhPOAqxPJB7bbE7u7vEYaID0GqeSqYpw5lxIK2CIoYTKmn+oEpD1XZ5p9OvbBC7NczdL+Z5L0ABR20pSplT/BfuuLTZ0IceMF8XSngtIkLGtwzG4vLCEeaZbyfHJXpmlk3LDc/mrUHd1dAfHJtnVaLBMN+ip9DoOx+qIjbQQjrwzVve/5sOh9IppoZw+0wg2T9chGCKWtHlZvILXNIHJuRGLc+Ako+TzhJR2ulSeRKtYcnxSJO6kEolB9Yp8WdQo+TGRgwtTkTLtQeNLbc/SCbjCfdysrE6+SgsTV1YOWY2PwcecU8hW6NXVkgBSF6znUiIPNQ6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJCmpCuV7X9OOJarnpZngFNIj4aGvieArtjaw5JqQk4=;
 b=OPou7rER7CXRDNlB7rs85vGE94qImvk7eTu9Q1PeYv3TCW0knveG7hSJABA4EEW+X77vcGNzo1gq4WBpXarotEu+vgcbSaI4fuwzce25sHBemmVEFclYUZqRkJ7BM67inGxz+svzr2M+pP/IQOy5dtGRiXvqMQRGL71LY5dBFnohKnCP0mZ2CEGAu9BbykuL5KTMRQym0OfcHrWIexdiqSMikI/12alm27rNk0aAjJ5f9qmCrsvnQ6HwbrONL3w3zXcdr3AFQczkj92+Feqci8vxIHq3G7PxtKS+mswtCEQsl+R7qeSiKgBWAhPijJP6WYHxM+4oCqQMDN+/SuiqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 09:59:19 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:59:19 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v6 20/24] vfio: Add cdev for vfio_device
Thread-Topic: [PATCH v6 20/24] vfio: Add cdev for vfio_device
Thread-Index: AQHZUcIMU6XTKF1u+kuuM49ndl1Bma7ztrQAgAAAazA=
Date: Fri, 10 Mar 2023 09:59:18 +0000
Message-ID: <DS0PR11MB7529DAF5C24F91D0345E48B7C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-21-yi.l.liu@intel.com>
 <BN9PR11MB5276168FC09BFEF06E8683CE8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276168FC09BFEF06E8683CE8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|MW3PR11MB4634:EE_
x-ms-office365-filtering-correlation-id: 7eb0af27-3f1e-47a6-b8b2-08db214e1d77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vfV14Ycso2XrnJrwi39YRA1zOAE4lxrhy2Blp9qSqXzyVgSJyzuI44g0d1e4h3zvAzFC4/c0WML6/xdvt2HPdAOsA2WsovyYZXUDM2SuzBx8ZPOw7Z9Pw0IG0QqPqx+l+5lV2vqrKMk4BBTXinQEjgeX0hIX9RKYG7HMV/zL3lUy4ZmIdqoIlv+RWxz7D415qVqjqHEfEbEGX42E1kyJtU4tzgwuwtkDrg+FnWtHF1edGXvdxx/QF333y9HO9ZU7NjjC5H1A7GXPLhPX5ln2+XO7VdFGqRZ0cgYBnDbuBpJ4GhznsNAZF930HGXYEXpKIe+MjcDnD8n8cN+9zs7PmP3c6QQtvdw0IZkirL8scu8BHNs91pLMFLlHNXrO0utyk0zQ2Vube05EfcZ+idzTfejVnAQGa8khEk040ZchEdkdq3AJpwWzHbOh9bGMj6yRehkvXFCNA2638yXO0QdoLInk7q2hkHa08F10OKvsoCVhLuoZsWkIPLlVLthuiPdkQrOfbtNp9GTzL1tllhWeoPAafsDNQ2COhGU/qCAxrftTykzHiQB3vjlonxoEpLS1YAZI6BKGUyh1H8jwpJ2PoXSNLdolsqh7t/thEd/dfxg0N8+zm5fYhObjJwYsXqAZLHu2rArN9Z+P8tHY3h+/pd3gXFiQ5HVURuYZuBQdG3/gtCNmroMYquVZrOJUq0eUCY/dRzMduIqhmkJ8yAIopN4S+Babi2noirrhXckUGCw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(38070700005)(33656002)(55016003)(86362001)(122000001)(82960400001)(38100700002)(8936002)(52536014)(478600001)(110136005)(7696005)(71200400001)(5660300002)(2906002)(7416002)(4326008)(66476007)(8676002)(66446008)(64756008)(66556008)(76116006)(66946007)(316002)(54906003)(41300700001)(9686003)(186003)(26005)(6506007)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YEAYrjt6z/gbyacHT6oaq6TMKG/KXRCnqq8x6T1vmU+ebYC75OhgXMJotn3N?=
 =?us-ascii?Q?730udMnMupilN1oMu4DEdWI7PALjElBy5UEVdUMsvV1IkM00aO1KlX5jxmbx?=
 =?us-ascii?Q?H57blXAzjgjy2IxBxennr66BpK3+z0yGqnQDrcyHqzqq5stwOLXt6VsmOW/v?=
 =?us-ascii?Q?pJECS6qqkzvxr1ddh058luuBXwb3sivRaZ7Pxn69Dp73gTk6k4tf5fh2Rxj8?=
 =?us-ascii?Q?MwV+Kk7bzg1QzIhXieuI7vl3DIbhrilgTe/D9irzLmdNxylG5vmqZxmm8YHm?=
 =?us-ascii?Q?uXHdf9rD+AsKsUU391D3k9/NxgszjwSnlDEeTo/VDZIAOA+Q/yh/BAjGIgPK?=
 =?us-ascii?Q?3WlpWNtfTCdyUlFRbAcvJNT4VdyR2LEku+B20LOByPltByn6ktDPx0qjU5MN?=
 =?us-ascii?Q?KgSybIMc2PRzxRr+ZSUAyxQw6VLiHz2SeOZYrcI1RiwTlGzd07LVzP/i0gRm?=
 =?us-ascii?Q?MwV5hbTY4Ss589PJjgOpoTMliUKea7oMB+qmxiPVzk6CigdUfZXq+sNAvIg3?=
 =?us-ascii?Q?R/ZlZpqLwGXSh9JkKR+sNcVIH8mfSkkZgTvt8cLYNkClTced0KZQaYXC98Jw?=
 =?us-ascii?Q?xEKIyKNL2qUtptHO/qsPo5FRsG8I1qWd0e8AaOHvhkSNShaD66JHFcdprnF2?=
 =?us-ascii?Q?c6NZl1u6HxVbh1JUBKFhKQgcm4PWI4dcCxxSemtRXXdJfEr7/5AhlzoZQKD9?=
 =?us-ascii?Q?CXeKcncz0n0UJdofE4L7bsy0w0CBPGXnLHArTjJl41H3Y5wKPPJpFLMGcDzY?=
 =?us-ascii?Q?YVY+Rx1H1MPuBrCMAGV1unBRr+k+nIVXspyr3/1WB+SUtGQzNACsq0I4Ov0w?=
 =?us-ascii?Q?jdfogYQY1qBfESKyXL+B1JjP4vzHFMq4RCKPEnrnX99paGi1j8FwpvuAdE+v?=
 =?us-ascii?Q?v210Q8IHQ+hfpaXpsskUAalKo6lxATAipfnwe8JWOoIxVFviuLQmc47fuYFX?=
 =?us-ascii?Q?0QhBO3v1xdF7GPml5KaxylJHcGxwAQtkfQs2Lz4BGwsdextwGQYVdlW/Holk?=
 =?us-ascii?Q?ZwMtO3Z3XqpuBxsQ2OC5aszLTM9f2NbL8Tg+VU0VJWmNiZCTDrOw8uo/xW0P?=
 =?us-ascii?Q?8G58VGUvhSlrRYq5T5rg4e5E8PxDk2dnjzGD3Ip7OLt0wx7qTQPV4x730T7c?=
 =?us-ascii?Q?ao9SXjSDZbbJ1tdx5kiyxaEYVZtrdJKlrc95piYSuQB5eHG/s/j9jd1j7N8K?=
 =?us-ascii?Q?qSlLx5jo1zFVKYte/gi+n7BCgqmzWekgNpc8KY0t+bHHC4orns8ZOzwDlqd9?=
 =?us-ascii?Q?zcY2IlZMf7WpDgGh6qoDPta4eMXbLngc2w+4iGIKrR6hSdwCT+z/wPhaQTHN?=
 =?us-ascii?Q?oMY2uD1BBSPzOrTeBaxxukN7yBZI4a4DGo1KHRtmJbqCmTFCpE23pO4SaEc3?=
 =?us-ascii?Q?nhB2FIMEyfy1E9RFSYsiB/9j35fr5yt6C4Bjpt5KmqFFE88wpadfv2ML6rjE?=
 =?us-ascii?Q?IbDDx8+mRL/ls79BRc7C28ihCDYjr19cEZF5jVBWXMyLWrCJ9y5MQneIOhFv?=
 =?us-ascii?Q?d8diHMb3TK605nsE2XC4rGzADZ9sKUCH55TJBvOqc4ZPKn2LkU+xq4i1rOGx?=
 =?us-ascii?Q?f0OvjJlGOr2EhqdQn3wJliwYFieMA29YNxeUDDZ3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb0af27-3f1e-47a6-b8b2-08db214e1d77
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 09:59:18.8451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGLpscO9Af8uNW0p82Mt+ISsDO8Q44+MFeViBgQWzUFnMoetk1v2q3hWLAPC3NYhxsHHLhywAUDpsPL9IVht9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Friday, March 10, 2023 4:49 PM
>=20
> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Wednesday, March 8, 2023 9:29 PM
> >
> > +	/*
> > +	 * Placing it before vfio_device_put_registration() to prevent
> > +	 * new registration refcount increment by
> > VFIO_GROUP_GET_DEVICE_FD
> > +	 * during the unregister time.
> > +	 */
> > +	vfio_device_group_unregister(device);
> > +
> > +	/*
> > +	 * Balances vfio_device_add() in the register path. Placing it before
> > +	 * vfio_device_put_registration() to prevent new registration
> refcount
> > +	 * increment by the device cdev open during the unregister time.
> > +	 */
> > +	vfio_device_del(device);
> > +
>=20
> What about below?
>=20
> 	/*
> 	 * Cleanup to pair with the register path. Must be done
> 	 * before vfio_device_put_registration () to avoid racing with
> 	 * a new registration.
> 	 */
> 	vfio_device_group_unregister(device);
> 	vfio_device_del(device);

new registration is bit confusing. Maybe "new registration refcount
increment by userspace".

Regards,
Yi Liu=20
