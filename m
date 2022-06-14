Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F454AE04
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Jun 2022 12:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727210E6D2;
	Tue, 14 Jun 2022 10:14:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2192B10F37C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Jun 2022 10:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655201667; x=1686737667;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jroHmvYfw+Kd/MUi9YpkjdZqWHVdloXdBDcgXTCcex4=;
 b=ACX0LRwqsmiLCN6buqCOUGnhigsnj1qys8K/RWNzg1EYD3uj/ego8qMA
 8afONGESSPX1QmuafRSwPHOnxfuV/fauvXc7wHoQgWBRPN5qfOeo1qQHK
 pAxlnvfe3nZuVY03tjXkytpCXmEmo2NS3Of58RgYY6qKffmQ2J5Sgj5GS
 uB7OAvdSBWQv/fVIasoeHYUFg7+OSJZhUCh8/mhLPF9cLof14aK/7AU/z
 jzFyHJNBg/c14qtqb/ehloHLk87R0zoFoiOTRb4qdeau33dNy4myJf4Wg
 VbN8YRKkxx/uIlYa46dERYpp8G4a2SYy52ozaivCC3o10gJv2hAvw6hnz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277355908"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="277355908"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 03:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="612167369"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2022 03:14:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 03:14:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 03:14:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 03:14:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvK7P3+cvCfVR3d+pF38y80p8J4/PTD7DAg2I/JnKNY2VpXjuc4k586UM7nyAVTf6HWfDeQEEn/CM5yH1yU+E8xfvk7lbP6XlFcHxJM7vasrnYuTvhWFHO2/VS1zCRzLVTzdJ2rU7submS3jFGXWIdeweu9pMQjKtqAQO/7nWZsBg5KW7U/RdMrT9ZYJA0mE+A+xkzSJdwm4cowjDorX/lwzyQ0+LAqg5OPXS2tcKybFx6E2lFo4DlUkMuA/9KktHhtG6YZv2Px9QAwYl1jLB2gsFCHPpzPtjxjc3S1VwFSOK+mufa7lkeRvgqpVW1eL68OVSx1uzxka0jwT2xgM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jroHmvYfw+Kd/MUi9YpkjdZqWHVdloXdBDcgXTCcex4=;
 b=K2WAHKaJivKpwoHJ97MkWyDYBZuoc0SuCH8eoBu6N8IOgmgXqCWa/pNYk+DqJ0ycldjuRKoSdxqmHaSJJ+JfjXylvJZf3VCuY0m+vp5lZTRE0lbhtFUAwG5ekRu7Dwy2toacg/DSf8BdMrZJUpnqGnByS0T/QxSFmKALZir5N12BHLKuGOqA36WS3TZ2B+47/VxO9eG92V5iE2vCkE79NDoAlmGRVNDZuPmrkA1+D6rVl/EZsi2Pgtd0O+J4LuoI0D2MJxGCmXYHFF/4WN9O1w+wSxBh62kPIbJQ5472jTo4YoCITmml9n9cqFQGECnOG8AgP+H7+AQTZ3QGJ9MGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 10:14:22 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3583:afc6:2732:74b8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3583:afc6:2732:74b8%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 10:14:22 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Christoph Hellwig <hch@lst.de>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
Subject: RE: [PATCH 11/13] vfio/mdev: consolidate all the available_instance
 sysfs into the core code
Thread-Topic: [PATCH 11/13] vfio/mdev: consolidate all the available_instance
 sysfs into the core code
Thread-Index: AQHYf6r9GCN8Bm6jaE2Jy6P5KBbbia1Or2Yw
Date: Tue, 14 Jun 2022 10:14:22 +0000
Message-ID: <BN9PR11MB5276F45F5B2E93CF455E49548CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-12-hch@lst.de>
In-Reply-To: <20220614045428.278494-12-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fde8e95-658d-4b4a-d984-08da4deea723
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_
x-microsoft-antispam-prvs: <BN9PR11MB5289B8B642BDE0B75ABA72E38CAA9@BN9PR11MB5289.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mfru03DV2I5Xbdsdrhk4N++zid3CjPtvTkz0HEhHucChJ1uIdeFt9ZsxnW3ttne8DdG51bQQejDXHen7NNJhNvykoBUA3NPTYkLooZgtgIpMRmOZyVvaUxhIPLfUgKQH8+JS6ngJqFuKPcFIDwaSU5OgqEitbPgT12UDlg208Dq4FYYoOCTpVCArA9EOH0WRO/8wgttkxyB+ibOSKaxmW7lEoktqvOcpgHRR1lJFLhbcTNDrglgla+KgC4QxQ/G0l9ef/RMe2QzSxXZ5Q7jhUtiBYc25R0YZ3tE3UDzVAauiCfEa1gUWz/xSMTFxifYesHS8oFut7rFO6eQaaDlJtgHfe0cV76DBs8fERTzxk1p6/pDk1cuPhWp2VRovXasamwZdXB4ecPkqutsG+fVRbD3DFIaR8acXjt8eEgsjxyrQ2pd4hPTi1oe0U7wWl2m++YaPdFUat6RM3gjBGzXceaWEqacUbTifj8ChOgQoD/F8rGTTMUOA2N6uMls6qY+PEQlX5qhwKkInXBaUbK6iF3Sf2OdOBBS+Ma/l/U59JO8DuovcljD5hBbNyZu7ef7DEA8IVqMp1nyhc0IP0ERPm3/EkLuyWbQoGxIf5BAyiyT4KI352Vnw8CVjvnubKOUtwCT9Cz0W7pbJb9k4J9SClmXoYqsGw0e61PJnWMpR78nnEjIhpsHcPUDT2Zkd+USJxrLWLjHhJwv3JUu2BA3yZXV7pzS2eUfvSTRS7FS+Mp8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8936002)(52536014)(54906003)(558084003)(33656002)(76116006)(5660300002)(7416002)(71200400001)(66556008)(66946007)(66476007)(64756008)(66446008)(38100700002)(2906002)(8676002)(4326008)(110136005)(316002)(86362001)(508600001)(26005)(55016003)(9686003)(82960400001)(186003)(921005)(122000001)(6506007)(7696005)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?47i4KgSpu0ddo9wD3iAq73332y+h755NWwBRaU/h0qCachvyGk4YFedOg8ul?=
 =?us-ascii?Q?WV3I+1SKusRuccLP0H2Pls1qZOTFkUzucZIWRTS4x8aRWnAdRypwVI20dNZU?=
 =?us-ascii?Q?2aHvT7XWYsUl6T+XMVx0iZFhJaQT+WYZpgfwt/j17Lg11brX7r5NmJdfogvM?=
 =?us-ascii?Q?zSslZTiJ08x4lkCYubWZikyAgQSZcn1FIq4nt8uD6BVIrqSM4DM9pyf31oCW?=
 =?us-ascii?Q?446yIzsULPNbxO6aliBP7yBBDBMFzLOXCjyrVnID+SlB22fJ5gtcfb/ICp/Z?=
 =?us-ascii?Q?nCxtgup5l30l4iKr5Fh35O6sP2mNORlqlc3fVxbwR/pi4dl/xOJQrC9OVrL2?=
 =?us-ascii?Q?IBZnwmmNIyKXjxqSwf/YO4k3ypwAxjosJsisqCHEbBN7TA2ZHufPxKEK5kbT?=
 =?us-ascii?Q?oS0I1zVhyJf7OKgzfr8pwfiKRgb9CovG7diQo+kqTywIoO1JApq35lOoyr99?=
 =?us-ascii?Q?EwxVCpzIv0cZetDxemROVn9bz3eXb/TVihEAQf1s9gW9K5Ob67FRMS+kchm3?=
 =?us-ascii?Q?ueoXj2QgbzBV4M88NVrbMr240KudIkY47X2MNfcKvmW81ofPF4EwF3XDFlAT?=
 =?us-ascii?Q?rvgu9eRSRRECiz+46TeyH1KIU0xAQg64X0Pv1PIG+Y5J4gaRtYYHJrkwt33A?=
 =?us-ascii?Q?fTdnuRDgu+G9uH8gk7mSqqz9Uu7V3mhUg6AT0+lxH2YsHpWY1MSuDQtfrCqv?=
 =?us-ascii?Q?0qGZ3ZiKY2bzUmXl9lFiR5UV7pm3FXm4WNdjEb2KSdBdOKdHcB4teGc3Byot?=
 =?us-ascii?Q?v874ZM/EK6p/Gd6gCfdFnBgRMA5FsBakgyGeFrXwjGXDl6vxIYEfNsiccI8U?=
 =?us-ascii?Q?bc/pB+owR5HyCWMumlKFBZHDBH7szepyIMELrV0fM7QhsFGQbOrhvycs6pJv?=
 =?us-ascii?Q?oK8XJMWwsAZfw1gQM2u+tHvG9FdmS76A1IZjPMgKCHwXqaJmQBPmRYVpiX0J?=
 =?us-ascii?Q?ax4DrFPw/DSF2tMdDcozbop3NnB2bJxhJrVHGIEwU/sw+Vw28+gyKQ9BdwKq?=
 =?us-ascii?Q?g2hkw4MYWV6ePv8j1Q7IjIKCRyDSUWsjJ5U9agAXYzdqN9GmS0mVxiOHirBK?=
 =?us-ascii?Q?SuojSOuvuRik75df0btuw6qZKiR1Z5hFHLo+9zQoT2zrG17w5uqihsj+Iv4l?=
 =?us-ascii?Q?y5sIdXoBl6XHDkY8cq+r5S/ZfwTMXArAM2Cx3pOlShCPpi2C4OhKPXHXbnDv?=
 =?us-ascii?Q?RSAz56w967Qeu9KF3Gv2Yfrk4rwh2GXkYlW0e3TQDDZTq/VMnA8n2E0t0AMI?=
 =?us-ascii?Q?pmrIDQiYpwS+/zj9WssIxnuNaNO+A1Gr2bjE2u1jdmqW/HeXPfDrqyHKeAbD?=
 =?us-ascii?Q?qRlntNnoj3QTCcqhyxXtH9DSOphzbdYdXN2sFESrgTlywM8gzCZgaJDi8G5X?=
 =?us-ascii?Q?DMSGgj50Wo1I2po/AGBA+N3S0Pj5hvgIZV9M5MhWLNEuCFSDciBNAxsF60Qt?=
 =?us-ascii?Q?OxJzIyvJE6A5MLQk+1yflMiUy4E8Xv4ARAGesjAzj0YNkBe6eJIfzOggzwuf?=
 =?us-ascii?Q?d4dN6hC7fVej0Sa9pvzqO48OXAxdnhbgU9KTgR2h9UiOHTcP1m+ybVaiKiC5?=
 =?us-ascii?Q?tCqCLjJfTuwcgeeZwZUZqiHUTa8GjE0xZz+r+Lkh6UsGRejKV/NxfZboHvBp?=
 =?us-ascii?Q?jEq/jX9IAofE5jpS6EuUTYKLu2AfEJ1ly5+4sFCLH/F9FYasUH1pfoPBPQvW?=
 =?us-ascii?Q?ILhLbJ5vfqU5T0DAm+lnrCS1LgcWAeUn1FHFHBOEGpo7Sg6qUG3kdXphFwh3?=
 =?us-ascii?Q?gnCmSHoZRw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fde8e95-658d-4b4a-d984-08da4deea723
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 10:14:22.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEBovMUzlKKv1ZsqqFRNvreQo6YYdCKTuBvWjD34JRMJRTrRsFxz6lMpASA5dSyIrreRncGYTlmLKkH7ATdB1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Christoph Hellwig
> Sent: Tuesday, June 14, 2022 12:54 PM
>=20
> Every driver just print a number, simply add a method to the mdev_driver
> to return it and provide a standard sysfs show function.

I didn't get why not simply adding a field to mdev_type?

