Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99B597ED2
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Aug 2022 08:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6886B829B;
	Thu, 18 Aug 2022 06:53:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A174BD34B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Aug 2022 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660805619; x=1692341619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZyE5j6cX5liRwuxAikBlxXXMK6FGtOih3/AYjcMNwME=;
 b=Uc1iQgHbqK9rXbQYAiozyiWnY5OipIi4d/RssF77oGesbvEWE2eoBtcB
 b1yt0Rp3jvn1PHjdPBXvgOMLaTtKdAVTE9t2uE48L0zpBwzRP8LrwkLX/
 yPYApcVDBBhDiOh8OhagRrEYERjs216lQXfKxKNwgO6bFaX4DCt/aW7qw
 G8q8fX6nvx6z8AUFyC0esdiKJElh2kcHDu37cB+QLzAxzx4yJX+qOxjDj
 cIvfHRFFIsDscormLBDUS2ZiRjxiVLxjCS+hN9ezPbEmmcyVVqgw6y6CM
 GxVOmw8fpfJqJ1hPWZiDdp4Ojd7e6PMmEt5tQb69AJUWtlhtGZp3Sc6CQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="354421110"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; d="scan'208";a="354421110"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 23:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; d="scan'208";a="640742901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 17 Aug 2022 23:53:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 23:53:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 23:53:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 23:53:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 23:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2nJxYzYV6ByCV8Jc+dKVkJjTr7bd/psWRd7qkuguUDM8LKlM1Q1x5l4vxBW1BYaDOj/jNodWThM/EqdyVwW2Fa9dyIvRVRWJk7cjpK1Dl5itVHD7gFXPD83Xzx9s4EhNC1gV9+/OpgbcR5i1yhq1azmIkgCcSszz1bA4OhG4taTZVMaETdYbVSyohxFA3Ffie3cz3BBScmNg6zh6D3QT4hmGQhFUFNxp3R7EH1betWm/tafv0r6MiQHXC/erVllgplXsbR6l4vErf7jg9ga9fw/JRvmBCnrPfH3UKMFZybPYaS3YLxfWQBK6oTng9JyWL9QP1QjUPwzrWLbLwyV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbguFW/k6HEhieyfjU4zOla8HJYUztzmZ2z9aARN/cU=;
 b=ZUIACpIbhN4mZJH+xjSkheLkxCm+O2BWnfNG8RcbGEBiYwS/F16s/H3c5GluRoep0x0teFN2wZEPLbv9EJ4Ba6g7ZmNelNKmoTkrAi+mUd5/tKAoaRuyhiXRNf+vGAxQpzZYAH1vDX7aIOA2mrnyhN6bx+672Jh7FthIJLUqkh9xca/7AUadMdMfVcp7VMu4aRz7d55da5wWE8a23hphBZEIEYj3flnFh2ISyqWMrVK+J1V8zMUqkzPEieCtKfsG+hhYV56LlyIPgTv9pstEgkkLzfrPWT4hVveXdO0TlEH3BFl8ocMInBUX2NRBO6o5E3ZaE/LHPVKbqPO/8DhmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 06:53:26 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::301a:151:bce8:29ac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::301a:151:bce8:29ac%3]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 06:53:25 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Eric Farman <farman@linux.ibm.com>, "hch@lst.de" <hch@lst.de>
Subject: RE: [RFC PATCH] vfio/ccw: Move mdev stuff out of struct subchannel
Thread-Topic: [RFC PATCH] vfio/ccw: Move mdev stuff out of struct subchannel
Thread-Index: AQHYoQb/SoILMwvFIUORf/veGNb9ba20VlbA
Date: Thu, 18 Aug 2022 06:53:25 +0000
Message-ID: <BN9PR11MB5276B1A7E2901A2A553D13938C6D9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220720050629.GA6076@lst.de>
 <20220726153725.2573294-1-farman@linux.ibm.com>
In-Reply-To: <20220726153725.2573294-1-farman@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf3c4aaf-d6ec-4a63-d86a-08da80e6597c
x-ms-traffictypediagnostic: BN9PR11MB5225:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uoRbUsxybomq8JRH9rqRtPIESmIfKfaKZr/ukmIp8t4Mcw/jBcBZmfQs4vp5yKZTZGQmDIo7ufU/TIP55hLB/MN9Iey746qetJ6L5pzcY7jk+ysUlGtrhjByfHodvppvTh1ImO2zNkeBVlfW7NfTcqQRgdGR0JYtSBGD24y6XoSKw1mFL2yckvJLeIBnw2qSUm9jrdLIdAfqO2KxG6zPC5nTzQNn9RCVyW0GopSRdUPLCkIp5G+uyYKfGEr6I7px8QHAgIa/kNxHDJJTnN/lFiS6dYMWZ9BDKIwP/VJ6ArWcVHkrqZQMwDU9AgWHxv9aYVRdmjEr0h4APTIuTTgMi4E1ZIU6zpNN3+4Qgp+0ioPwYaBMBOCjUpcOO+aTm+jPOAtlIv8hp9EMuHG8NQWvog8IqhCE3YlzjRKpMbwIFaBAHd+I9TD1CEb7NBV54NiSMneVygv9dLkaC8VF9hVPfrsrl8hSKA7OsKH4bhEXU+wWkVIR7SoZuCiXoktc1PXHtGWzjlpwUh8NbTJCZGvWGXzU8lwghDeU4AofTTPIDThH+xxuWVXWcF/fTc5JCSoYCAxfd+UmKuKJXRa4hCAI/JWhewKUbB/FGNxsozp//ldzxU3Sz76jKIdkpflFQ8t8ghU/yp3Vm38r21xeJ3lOAmsjKdPQ0Pftogi9EXbxKS6/timkUm/3BLZN2CF++n/HwnExZaxm3ZhG5tzvq7pmiyRSPhMoRo+Dnk/Bj0UsePkYIBSlmjJBYgdtZAGDMMAZWLDZZ1t8JNrWaNoasgCuo+1xpgGLu2EPdmpgdP/VO2I5uelS0dZcXWN/TlTf6joZs2+Mmt301xOVyU/q2jCL4K9Y5+YeDpBrr/Ax6Assllg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(39860400002)(346002)(396003)(376002)(2906002)(186003)(54906003)(9686003)(110136005)(33656002)(7416002)(86362001)(52536014)(5660300002)(55016003)(8936002)(966005)(66476007)(66556008)(4326008)(66946007)(38100700002)(76116006)(8676002)(122000001)(38070700005)(7696005)(26005)(316002)(82960400001)(41300700001)(6506007)(71200400001)(478600001)(64756008)(66446008)(533714002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TLqCRHBv57F3ADfDJvqC6O6mJIuShjiDC5UtlAkR18pa8tPauoR0+LhUShws?=
 =?us-ascii?Q?KZeQc6iMCMuLgSnsZCvRoVQii8N01NrdhYLTzkWo1aup++/s+2VGVSABIN85?=
 =?us-ascii?Q?mJnrGEN+ICSXDwJPaG6FzPGF8qrRvQZ16cYcxiw4L49IGsBRPsem1T7SDw71?=
 =?us-ascii?Q?0+bMtNbNfaNTRlpRW0zbMrBlvihV4BuU1dFWfgBzVIgNdDo//gi5z4wMh9Xc?=
 =?us-ascii?Q?JgqFXVS3DJDwV39HgA3TN5tM5/jIACdnbfi75zM7ekAZ3AO/h79PVy1hifra?=
 =?us-ascii?Q?7spF7uK8uZ0G1A6DKbxDR8Fj411DTugK+5kw9nCbG4ITzKdQe3U6fEwmsWlo?=
 =?us-ascii?Q?B3mBF6QCG1oNajjmYFZoOuKN0yIRZo3T61S3Bq179jDSB7CaLC2swY6xnaH6?=
 =?us-ascii?Q?UzRX/gYFRtER6G2BqKt1wFcNz5i023bgJrX1V65fmz2/+YzxqIaO6Oug0Yqd?=
 =?us-ascii?Q?Q2rUi5ukz5iTyaqmxATwKNK2bIjcve3sEUa7pRi7twMzl5AeZDcCRYj41U+f?=
 =?us-ascii?Q?Pvulg2R4X4NCqb5SLPOwF2NA8x8/cu5szkU+LE8f0083B7EKfZ6fLLE9uhh9?=
 =?us-ascii?Q?Q/6kwW1wjz9E0JEQ4Xa2SXOR8OehCK+Yrw1ejT39JkOhi0xSRlzCLE7lRqcj?=
 =?us-ascii?Q?32P8Qd5vkkvo7ZOqQY7JDR3djTx9cG2vKESIGmr8l4r+D42kSBozXA31P5Sj?=
 =?us-ascii?Q?Jw4k7BbGEcDf5BOJ67ESflbuttgjRi9aYu1IjiLf5w+9JnXlXIGhhxLFl08G?=
 =?us-ascii?Q?eHZgAeFrcJZ889up6yiSUmUd2f5d2x1vAS+zoWSs7V8AyP0SiX6i5+LQgbrg?=
 =?us-ascii?Q?tgwjTmw9QGF3gkA3H+d8N84pQvmdpT4/svcJtxa0n6iJJ6pLKfc7Ng/j5ZoO?=
 =?us-ascii?Q?w7Q16LvLJVSTeQOdLEDkfjR2ZPpMlzqmf9gpAFTo5WT5nJNup05rfZLpqQqM?=
 =?us-ascii?Q?Eg9iVKrcc1VC+Ye48Di3tc2SApIjkXu8HXC8xbwBo7+SCKxy9PiAVNa8VTk3?=
 =?us-ascii?Q?ZtN0mdX2H2RBptLBHzebMlIe7tskqtMy9OLgdHyeOgrfTXPi+mz1QGLWS8UP?=
 =?us-ascii?Q?sSt3cK7FM3nrByrJv7/o4YPSFDpIq6PbEoiyYYADpoesCxcdlGGJHoWVzqAv?=
 =?us-ascii?Q?7j7BfTdNJs0Y9PIN5g6ALhmsELv3wkiHWZqA/4Euat13eEW8eVtr8o4Wj3Sg?=
 =?us-ascii?Q?44lmnU1BgpfvAqyquf6rUyAjgxfLPzj/f3G/F+ZZdA0adLDRYg8IhK50Z9I5?=
 =?us-ascii?Q?Fg23KhdW2+evEYp3MIGxb28AQ9lPrC6QFfVzDcHZgXz1TLNFVNd/r9NklOEI?=
 =?us-ascii?Q?srGXTj6sLP8GjBOhO4RpIv8cRSOqewYO5GGfj49BjhXGU/kl5w7axm8J5xYA?=
 =?us-ascii?Q?FMcrfuQ1Wbjxfax3BO/wh+0U5FcvuhXxfQBSovExPiU4ix9zMNC2gOirU87Z?=
 =?us-ascii?Q?Hgr7mK765ctPYgmbxeCQHnQHirejNnisPVdb7kRjIeN9gttBl1ue/ibb9VgK?=
 =?us-ascii?Q?VBWOlraOx2gag7IhMR2MvF7U+Esn+fOMNpR7TQJ3UFiTV5tmSVlm6lvbWJxG?=
 =?us-ascii?Q?zIm6DY727U24xnAs7HG+F6ooIP/T1ZXC3Ikx+dOc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3c4aaf-d6ec-4a63-d86a-08da80e6597c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 06:53:25.8065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SePkWoxW9Ti6wN5ntHCeA95zKkLdI6tRPjKmg7bHja8Pypc3mczKi6bg+FhxmvTioihZAPJ0O4QKecLZNMxDyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
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
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi, Eric,

> From: Eric Farman
> Sent: Tuesday, July 26, 2022 11:37 PM
>=20
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -111,6 +111,10 @@ struct vfio_ccw_private {
>  	struct eventfd_ctx	*req_trigger;
>  	struct work_struct	io_work;
>  	struct work_struct	crw_work;
> +
> +	struct mdev_parent	parent;
> +	struct mdev_type	mdev_type;
> +	struct mdev_type	*mdev_types[1];
>  } __aligned(8);
>=20

IMHO creating a separate structure to encapsulate parent related
information is far cleaner than mixing both mdev and parent into
one structure.

mdev and parent have different life cycles. mdev is between
mdev probe/remove while parent is between css probe/remove.

Mixing them together prevents further cleanup in vfio core [1]
which you posted in earlier series and also other upcoming
improvements [2].

Thanks
Kevin

[1] https://lore.kernel.org/all/20220602171948.2790690-16-farman@linux.ibm.=
com/
[2] https://listman.redhat.com/archives/libvir-list/2022-August/233482.html
