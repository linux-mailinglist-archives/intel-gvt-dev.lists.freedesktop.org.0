Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15BC68CDC5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Feb 2023 04:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CB210E2D0;
	Tue,  7 Feb 2023 03:56:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297EF10E1CA;
 Tue,  7 Feb 2023 03:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675742179; x=1707278179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AHklZfJlrV1c6ya+ukIPpPPYqLVLiwZ5ke8KnsBT8L8=;
 b=g+Q+H/Von/tN2+iiEvtlRRC1oYsZtuinUkRoKqNwb9zK79CDMYN0LaNH
 Q6m4fX8VFut6+nwWPUTWxZ5CX65m1ixqs+idFU6t/J1B6arH7W1KUH0Wr
 CQjFWHrTzWw0cs8vlkFU39wT7N6ZTN3Po0Hc+YPPKe9QrDtps/cm0pTO1
 8XiduwuCjN4ojiNblOP9L9nPMVdHH1lu/ors+C9EnzcDeV5gMcrB2TaWb
 smpH9Cbnk4CuxaPF/vZfRhJp76aPd0oQyCjRSfAlrq7+EjWQy0rNHc+69
 2I6DflCctTO6YX7g/WYMgoifxLYXONkPu8ExrF2lg/Tqqfhq9hDC/ijYo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309730118"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="309730118"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 19:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="666697651"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="666697651"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 06 Feb 2023 19:56:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 19:56:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 19:56:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 19:56:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 19:56:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+nFDSuQcXhKGY1Q2uvbt6yUpk4sny4RwsxCkru2lQ8LXHd0Z8jRbeOy45vutYU7UyA9H3AxmGhdKBqcMGhbx41PNJpLt81ecdsFT6alg+vEWdz+XVhgi/vmPmByh342Yiux4OuRRbNeB1UWkPEMbdn3f6lS+GGmv5/zVnUbD/Dlm+LWVEuR3BnoryAgrlAZqOOutLXjJiRy+A/GMAdtMql2U+dwGYJc2v5bw43mg0Z5QM6kRafDkZNav0MN1wixSY6T9KNveEB58Xo5VR5dEk12N8KdO8+yaBsyVsqmcUw+MYKtUCbwq7HKP+YnEEEx4IKNLxM+icHYvKhRnZrPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHklZfJlrV1c6ya+ukIPpPPYqLVLiwZ5ke8KnsBT8L8=;
 b=UykReP8+g43GK6scA+dM1N3q9xJlHYvlqUpaNQI9BB8MkZ5gSWOIDDd/+M5MNhNUEjhf/MkxkM2aITGH8MVFrv0hRo2bKAJarlc9C3BnMbvePuMat7CQ1WeARBLWHUDpvVImnIFSc+lA1BxPxmVPPS7Qb+v2t5WQ5/KkCLTXkLzfq1/tkWa6wnYzjTZJfXhoisLyj0dbtB2yy+ed6oiO2+zkLi829D13EszVCgTrz7W1cNbKMq4zFZZ7LtYV8FYL9CdIus1TXETFN4kCsPytXS8OuIHqsA91zANgtk7QviS/9O7k442JMvWxNC0r3HCHp1ArqwdS7EDNh63hniuTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Tue, 7 Feb
 2023 03:56:07 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 03:56:06 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Subject: RE: [PATCH v2 08/14] vfio: Add infrastructure for bind_iommufd from
 userspace
Thread-Topic: [PATCH v2 08/14] vfio: Add infrastructure for bind_iommufd from
 userspace
Thread-Index: AQHZOgpAk95kySFhn02NaqF8JSM/Ia7C3Akw
Date: Tue, 7 Feb 2023 03:56:06 +0000
Message-ID: <BN9PR11MB52767B2B0882B845C75026D68CDB9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230206090532.95598-1-yi.l.liu@intel.com>
 <20230206090532.95598-9-yi.l.liu@intel.com>
In-Reply-To: <20230206090532.95598-9-yi.l.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB7711:EE_
x-ms-office365-filtering-correlation-id: 6d5d27fc-a3e5-40d0-c721-08db08bf3d7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4PNteh0x9o84VbKcA3i1MxMm7h9trZ9etmFTADMU5mG6X/SbfvkKe4+0w618hmuXb4ut4/D63Iz0iGvN6GsbjGYjuIQCkVJB40rLcVpM5RhbiYyaOYw8mB74PfnaOtrtk0QwNmum73oslonKumXJM2R4Y3ouTwr/NkOMHu3pCRjasnFqXrPaLemCGlFlECkFQDjQTq0hyCa82HM4cv2NfJ+3Dv4Goi0ZJSVkmH+lDek4K3qQXCIuzaRqeF/f033Mjxx7DcsE9veIGtEMxkE2O3Cz2fKFt9PhxpjeVKdyiY87F8w2ogxTXAEbnwAf3hNaWGVQuIltT0q/Iavj7tQ1+HaFO4YOXeUPKnyWlaJ5cqDbIVKDGlnU1EafNI6xEayEPXL9IQpp7BzP+D6EML+7gxNNy1sNNRLfFH5W6mequUJ7P1Vr6X4BJdMVKWaPmq2kV0Ah5JHmmi92HfpFvYehHgPhNmmlcmdiy9hrtMp3x++ulP5rb36kA6eEUAsHsTkO5NqeBJvCop44/3SLD8Xce/20LCD81xaSxGMsPFd1Z8gLiOwk92ibBj9zn6o45I2yISxngNNpgqFgucq9sV6Bn+AyPQfO8MpvYocaCcnXiWTNdnIf01jdHcDUYHH8auNtPRJbxJbDyAjKjNrZN7zZbwhqjUDVd1cvmGmckiZbnG3pkdQkgTKp/oBkUpprw39
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199018)(41300700001)(316002)(83380400001)(71200400001)(6506007)(26005)(7696005)(9686003)(186003)(2906002)(478600001)(8936002)(33656002)(7416002)(86362001)(110136005)(5660300002)(52536014)(54906003)(55016003)(38100700002)(122000001)(4744005)(38070700005)(82960400001)(66476007)(66446008)(4326008)(64756008)(66556008)(8676002)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9eW6tojS7yeuM3mRUEi2Ya0NNvq4yKMoeOSzjkCncHcq9s3q0reCZW/DLQB+?=
 =?us-ascii?Q?Q2xVu6CjuTKlarKY4YbJbi2HukXsbzt7g4Qsphe7j8C3gKE4da/QZOgl0VnU?=
 =?us-ascii?Q?AO4m+KnfI2cSRMwcw+p/XPzfteBdoP5K4dCVg0AOix9D+evfpUfpBUBqo7Mu?=
 =?us-ascii?Q?LMhZLCeqNMpiVeN4Zk7v0dJSqrxMYwOdfP51HJyncwsvKhIOgtLy1+9tZO1v?=
 =?us-ascii?Q?eyRdpfcriouRvaW9zrkgFOWhm3sO26ZFKnh7SYpptPDD0lhPYzU6phIemwPI?=
 =?us-ascii?Q?9EE8QLZBuFltcXRaM4aeWGTzxww+sF/8ZYKYrBcx/ToKQKNuoIWQRRsQlrGs?=
 =?us-ascii?Q?fK+JxFcnydQhWRS3Rd/DR+167544Q9oH9ZtiT+m9XTVPvn5yrsRwt9kkQqxI?=
 =?us-ascii?Q?2G2D9hE9bPLF9toBKo5HS2ZG0FLQXQE/WQkW7JED1O/dnW5rIkmqtD7C/Vq+?=
 =?us-ascii?Q?KuvaoXU7WzEjutbyr4wyzPzYO7xRSF1fWXpJd7BAxw29mtzhDsqllV9Rqq9V?=
 =?us-ascii?Q?Wt379smAvp7J5MVhV6/FYPT3K/43RTTDnTZfJ4C/nx2YnufEehaHPWBXS3lD?=
 =?us-ascii?Q?htikgmev8CuMb/3WS0aPVoCmcX4BPg1MC2LukH2l0n5x6Brxfgu8BefklDA9?=
 =?us-ascii?Q?pM2Dzombzl3XRUA1PS8NSZzAqE4TX38FU5JWkPx2LHJknh/bQ+49HCZ9c/s6?=
 =?us-ascii?Q?6E1kueqEnXfowpOq7u+lYwqxduXxyfMtC/aMuIrugYejPVohFBEfYd0i9CIx?=
 =?us-ascii?Q?RktoaXHpNqr7DgriljFt+f+N6zvhjypMzRHQzEQA36T1w5z3OD39TpWvYgSB?=
 =?us-ascii?Q?ZzpJ2kvW9zieripJVl/VIwDWrGEdPZWTIRADBAQiBqrYZ+RHwegyTsvz11IK?=
 =?us-ascii?Q?mqcRli7+N10h01hUo2182JlaTwyBbG8qACmbStIOrepEO9tZioIAC6wwoGFj?=
 =?us-ascii?Q?RXk4sZM0A2YA4Q9q700SLdQSzNZZ3lo1RCx/OuqUW4JjlvQvrASf1v6JGyaQ?=
 =?us-ascii?Q?Jwf8YUUkZPgvppNVElZjBtElO52bJq/urMC3m5pX9J7e8H0iujC5x+Pr2bTV?=
 =?us-ascii?Q?DK5qfHbbhgaBpO07f0Ho5ofjoQHKbbK9wlIeArpt7cHF2C5pDkW7/5OA21P4?=
 =?us-ascii?Q?3qW0rLYmMPSnP59zW5QhbpgHjAOYaRBR3ME/xFDb9qQUmSxt2Q3B4pVPgZMs?=
 =?us-ascii?Q?IKJzgOV7XPlsCtlgGkHhk1xg5emtU6mQzXNeoWsTfWRy55sxtj2Y4Odr0rGP?=
 =?us-ascii?Q?W2RS1/R8ub27JUEsZrq788pvi0JomA4NBWKJoi4k20LpCs7rqRVovhrdX9/J?=
 =?us-ascii?Q?WPSyC1LGds86YSpMRy7VEW99j0WS3HBSSyZotEwqTwpwRkj1DCFv9HNYYWdw?=
 =?us-ascii?Q?Ah9LNOHa5x2i7KPn9HY1ursUXv+AbOga/jGZ79XZYfRFCki7h3GWdZjE2GxJ?=
 =?us-ascii?Q?B6G4xwKhn4MsJCTZqDw/O8w8JKb+uaUmipU+t6/DrVR8jQps2PyCoPgWwPdW?=
 =?us-ascii?Q?WWR/X3OkSwTjzPokPfVeVfOepNvGJ1v3acAasvRDxNek0gWEWkKZGRn7SljM?=
 =?us-ascii?Q?/upihmmFOIc1oSKGvw99nbUoJ8B2EvLpjYfL/VNI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5d27fc-a3e5-40d0-c721-08db08bf3d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 03:56:06.6107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A41BmCXUWPRzWHFOuLZP/CZ4ElS9hHDp1Kme14cL8d4aIshCeGt1bhLKhYEgVn07uuSUc3SBiclarofJwPrmOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7711
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
> Sent: Monday, February 6, 2023 5:05 PM
>=20
> For the device fd opened from cdev, userspace needs to bind it to an
> iommufd and attach it to IOAS managed by iommufd. With such operations,
> userspace can set up a secure DMA context and hence access device.
>=20
> This changes the existing vfio_iommufd_bind() to accept a pt_id pointer
> as an optional input, and also an dev_id pointer to selectively return
> the dev_id to prepare for adding bind_iommufd ioctl, which does the bind
> first and then attach IOAS.
>=20
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
