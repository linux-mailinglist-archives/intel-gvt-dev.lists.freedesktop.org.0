Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB7544441
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jun 2022 08:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71668113E30;
	Thu,  9 Jun 2022 06:52:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFE0113E37
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jun 2022 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654757544; x=1686293544;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HKlzrjwYyiGaBzg0z003xoZjgHQHh5w1x1IJgxOIl/E=;
 b=gxzW7yJTBBZNiVDTTnyjJF95YtYnjQXjzuM17LYpxyHSZei6XTVn3HZ8
 nOsSVTTKPzpAnofxqVXLohXadIcMvKKm3W6RZU1e9Cp25ZOn4GCFYlyU6
 DupI/aGzrPidFCWtUAoekfryR/LSi+i67cvv33qU/stGKzjTU7P4NKiwu
 Kb78mB0r0hn8vtu2vHxgKKoTxRCgAckm2A8lcZxmdwYn9yC1bF3fzLLfr
 TKDMXGS9EaZm+HwcxuNchQURGWaYwlG0pVsD5bzEzRN9mUv02NAPV2peh
 aVAG9I7LdgPCI50M/w37WQCJw8qK5+GQkS2GsFdtxG8Ugt1MAwS+KAPNj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="278327689"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="278327689"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 23:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="827414928"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2022 23:52:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 23:52:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 8 Jun 2022 23:52:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 8 Jun 2022 23:52:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTZp0csNiBB3FbcLXWFzWRVwtQbKRP+zbK8gNvCkVIoeYhg2mVeocy+D3Su42tayEwGvM8F0xpyJOfAJS6UOGsAirJA7HzeUnvKAg8YuvD7MhD9iErEPnq3D24dmebx0pq06n16Desb/JDDadSTkstlfXG0+5velrNnXfJCkllPbU3sSkjr64zBZ2m8+TcqtbHqyhi+YljDp8ppT3LBioV8rooYlUEi6A7NZp6RcR6+lX42x0x5aJz1NqOq5aUQidLT7O1z7U6YlbH48fEZERI+cCm1f7sW7MtdS44hUEncolj1jIZQ88BqBHoR0nDTAYsW08+4GRgVOxfwEwdTKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQxscVUs0hySMmGlW8QxOSCaYSZwkomtpaDoNYuy2cs=;
 b=gmaJrUarcjF92K5e2yThsO/nK8IukEwkGzUUPejd/MNE2z8QgOUIlrTqwzFKCuIyU0QjsxSL5Tm8VrZokFimU9VJ88efKw+4D93CwB5VmNHliS4Bo6iVN8M78Su/Qc5NGzcjSkPIrX5knt32dPToPlMFqLzecUtrk4Maii9bBfDui4c+h7fj1Iw2m62kb27/XsYqwR6wggnKcXkmFkxGV9Fi74gfbNdqJH7czaLAnK9sGQRgjVT76rYQXQZ24RxVOxrz/YuXo9B6eCyNpZ7N9Txf8DcMTuSY055VF7ucIEDfiABCh79R9lgfI3AP5jBqYNMe37aPVJrWVwOmrUaBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3340.namprd11.prod.outlook.com (2603:10b6:5:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Thu, 9 Jun
 2022 06:52:21 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3583:afc6:2732:74b8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3583:afc6:2732:74b8%4]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:52:21 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Christoph Hellwig <hch@lst.de>, Kirti Wankhede <kwankhede@nvidia.com>
Subject: RE: [PATCH 2/8] vfio/mdev: embedd struct mdev_parent in the parent
 data structure
Thread-Topic: [PATCH 2/8] vfio/mdev: embedd struct mdev_parent in the parent
 data structure
Thread-Index: AQHYdxPyiJwDXPrCQ0GTlnY3SffJtK1Cx18AgACvAQCAAzQX4A==
Date: Thu, 9 Jun 2022 06:52:20 +0000
Message-ID: <BN9PR11MB5276B401ABB6A07442CCF6358CA79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-3-hch@lst.de>
 <71e7d9a8-1005-0458-b8cd-147ccc6430d7@nvidia.com>
 <20220607054852.GA8680@lst.de>
In-Reply-To: <20220607054852.GA8680@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f60e56bb-d08d-488b-0366-08da49e499e8
x-ms-traffictypediagnostic: DM6PR11MB3340:EE_
x-microsoft-antispam-prvs: <DM6PR11MB334062E0923C6103F6F1495B8CA79@DM6PR11MB3340.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 25f2obhEyK8BY8xuBiUHSlVu0vhipaJ3rzztJuv8d9erjV3MFg8LbXi25uM7f8mOfexiFVBYi6awwr+OPY/IwmbNAX28hHRxPE5HHPezW6x0+DVoc1AFpnLkHXxHVKvr39xkSGW53PgW0dfiatCIjGO/RNJaePsqNmO4L+ueAe7la9pXKXLcYAde+fQj5tq6RIkesmcwpP3J5ssdBBHaYVOhGvNf0/Gfpnr+U4Tr33gWIs97blAXmHIgWcvZvCUerewALR+A08JyuOY8If3SIcnhqIn08H5lfMyuqhMiaVx2N3IpKSE891VmuSlbBRMZCFbzcbOOumevb4wt1NewKWA8Y4G3okKxx89tCoBGR8SZa8Ce771YrVjpPAYDZtBDJPSFBPgNcw3RsK6jnWzPmXHPZl1INbIg0nfQzOR3pLvSSuJaeBQAd3T+PQXQjwnrWZqoV1XhZrPR3svnI5TVvpkXhWR5ythWZnE3ZnSFH2an1CrMyt6P4JF7xoKEgXamzYekzazseUPoDmC54d1/HzrR1OaTY0b9QP6Etp9Tsn4D9LRwS5sS+hVFxkUJjnyQNfeBIT7FNGXJYq0KIhTmp5rXEvJh0Q65bQgjYCZ8cqyXKvYFOG7sAzu0I3n9bJ1nkHX2EJRuDWAahPROTT1lgXB2ovuG/1Z5L/6ncIylDEnJRy9vFZvjE3wLy8sRHptnKF/nlytTNmCulsL4jPWEJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(8936002)(110136005)(4744005)(9686003)(186003)(71200400001)(2906002)(316002)(6506007)(33656002)(508600001)(66946007)(122000001)(54906003)(38100700002)(66476007)(66446008)(64756008)(55016003)(76116006)(4326008)(7696005)(8676002)(7416002)(26005)(82960400001)(5660300002)(52536014)(86362001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hI8QfGo4NYMgFCFMGVfwk6Ir4G5NhH4yobOq7qw6JUtQp44MTjYr6gSyG77/?=
 =?us-ascii?Q?5qKhufWNSA/ONfLR9DiF3JcjjdnwnvZSaBd7DqCHYW4tM597/HBzLd/ImD8B?=
 =?us-ascii?Q?XenJHPBGjXbQSU2fmcHIAKMyufF8//7iLoO1f0agI3jBkVSlAs2l89xyUVQv?=
 =?us-ascii?Q?zpuziXO2OxxUpNaJWbBYN51tHR+eYTJKsNtmNM317kiEXFMFl6sb7MQZRrUv?=
 =?us-ascii?Q?B5+WpEiXiu6q78GlWj4u00/nbeNYYQpgyJUyyARreVtdhPNkRvnCYQMAtwJD?=
 =?us-ascii?Q?X7x6JrYKyZ+ochmtFIYAuphNdV10VI0V6fAn2LWsadkhdBk6+Mnovzkvz6WD?=
 =?us-ascii?Q?4liNNMJVRSW/eJRXsqZGpTde1WBqJaZCgOjUjIt262BwloV5CAX5bvQGnO4p?=
 =?us-ascii?Q?tTBaIJ9MQH/m32UAfMUIOtPy+7FRIFprUfP9ANLpry5u5hBKqZJBjO285TbP?=
 =?us-ascii?Q?84Obf0r1+wqyjymv9DkwR3dsza5TM3Vqys4tHWv+1bikiL33oirBFDJjckgP?=
 =?us-ascii?Q?sH73EjHbieo9vFlevrQ0uDb2MbodOk5ckhf0GxWDupISL1EQUWnoMk8g0cKM?=
 =?us-ascii?Q?x+ya2+c0l5C6DjR8/+H7KGfF+oW1/hNqoff6s3+Q+kOL71jnwfcguHar4gWh?=
 =?us-ascii?Q?CJTRT6ifxDjt4jjTzDbyWl8nvc+tTJWPFhkMe0+4ELiWuStMZQ5shjC1Q/As?=
 =?us-ascii?Q?/EhfuunmHr0Twa2q5Kx9WcR6Pc16rRT96uMdMmKpLVZO6tmMMu6xltxS2JFi?=
 =?us-ascii?Q?aEwJtUYZDGYl3cITUHpEyLQuq/Ctr14LSI3WlBjM33KggD7ih6Q1h8Zh/6jm?=
 =?us-ascii?Q?AU/a3aSfet1agcc3gRy5NkQcZe8u/I/My4seTTdo7mQRZreZi7CyBdhFGHnm?=
 =?us-ascii?Q?2B1zBma2HpDK4dHmCtiiOrhj5nfJaFZfnPJgG6flEpQMWywPRKGr/6F4XauL?=
 =?us-ascii?Q?WA/B8Bj4JIiCc1Hsb/tci0QF9ii4GCdt96/uyM2dj/MZBaQ2ezvjnkLT3IxZ?=
 =?us-ascii?Q?KhJuM2Md3OjhX4pFEb15f2fFcUV+jLm/jLRWvNxVtSq23uuSrUBMGc1D1LT6?=
 =?us-ascii?Q?Tad97UOFjdAUOkgRX6MN9SGYBJlKxgpf6Iyq9WEfU+MrJw04wjcW+SGHWV0w?=
 =?us-ascii?Q?UXyBuA9ciPi8JQc5jsfFcf0Jv6do/+njlxFcq2kGCnT+STfobhuy9uXwbmpH?=
 =?us-ascii?Q?/67jDx+soQshMjUrpRJv/PUnGeMRopEBr+sswcY+bcxUpYoGtVmOc3NQsqGE?=
 =?us-ascii?Q?7iwumsosa3p5bkj8muzjigxKdiSLrQRaFiueN7XlcjeMc52OsC4vBlU/jn97?=
 =?us-ascii?Q?PEQi96zfBDl8pjCzMAAAATClNUsAWtfhNtbApQfMoXQprtC9u9ZByk0X318V?=
 =?us-ascii?Q?5rLCD7vdXf8hQgFiNp2z67nAmDbR6x87cGgjUI3bw9dSJ6fHZ5bRmS8lFABG?=
 =?us-ascii?Q?ShoAcoxEIzCpcZTPRVWGHuV/jjH2KznhWNQ5SN3ttKgVaT31ZCM0TmGdssv/?=
 =?us-ascii?Q?uy0apDhJdfdtWIubrwVWaHdtrKcChl4iclpWyjvMgs5oOkyDD124X1mpH1Z7?=
 =?us-ascii?Q?EUv/i9PAczCYzbR5Gu9T1YKx/bvpUUr3E8+bCiPC4gOnbLVGX3bCdcE/S53X?=
 =?us-ascii?Q?2hzTlXUrdi9elrIS4qdwihwvIdpYMfe9zO49FIq4hfAItYmDnFXmfLZCmSoY?=
 =?us-ascii?Q?OGJdBApuU4l/xwv8lGJ7y3xvxF08kvM43b5RxmPoGuOynaeEcFtTuE52OMNf?=
 =?us-ascii?Q?1P/EG5RRRg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60e56bb-d08d-488b-0366-08da49e499e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 06:52:20.9367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlIYnywWfaYWeVbWY3WszfbClp7rLKBgSXOjhw+I0tfX6GmGZBTsKKvgrC07SsWt17Uf/hqTchIXAnhJ7l1b3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3340
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Neo Jia <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>, Alex
 Williamson <alex.williamson@redhat.com>, Dheeraj Nigam <dnigam@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Tarun Gupta <targupta@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Christoph Hellwig <hch@lst.de>
> Sent: Tuesday, June 7, 2022 1:49 PM
>=20
> >>   -	mdev_unregister_device(i915->drm.dev);
> >> +	mdev_unregister_parent(&i915->vgpu.parent);
> >
> > Ideally, parent should be member of gvt. There could be multiple vgpus
> > created on one physical device. Intel folks would be better reviewer
> > though.
>=20
> i915->vgpu is not for a single VGPU, but all VGPU related core
> support.
>=20

Yes i915->gpu is per parent, but i915->gvt is a better fit. The former
is solely for mmio snapshot while the latter contains everything
actually related to vgpu core support.

apart from that,

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
