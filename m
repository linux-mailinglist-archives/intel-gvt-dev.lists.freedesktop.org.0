Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E909155BFD7
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Jun 2022 11:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395C812B01F;
	Tue, 28 Jun 2022 09:44:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306E12B003
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Jun 2022 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656409483; x=1687945483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PaOh/LHFnmDFIm99b0+Ofg/r4j1BhIgXchcuNv6dJgw=;
 b=BZpNTyju5TMo5Dws6alIUid9gUaCecfWs4wsmD+RwVOvEbsmnnC2yLMz
 mIdrJUU+UD6FZ4SAz/9tFbr8sAx2MtdMin92oj1djiHb7lRT5I8zZ/fed
 2zxfGfUdG3fmMkAA61t/h+KXnezXc9q6hGHTeD90Az0arkpPq4kL2ohDT
 HxT1LvIehqF3R7k8SdVCwsnRngcQIdmSl6T/VkWQaiY1mHdDC0lBhTl0g
 ow/WdvDkaWubzjFPn4owp7rRgJBLMHPmdowH7pBoT3eGfmd0nmhHZ+q0a
 hGhW0B2thokiC1J388f8dimCfcm3cCI05FZABYcXbcVmj1LIchz8EYDZE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="281732019"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="281732019"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 02:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="646844602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2022 02:44:43 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 02:44:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 28 Jun 2022 02:44:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 28 Jun 2022 02:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUqyqnIF/TCI7W/HrtEMBunu3O0XKUufpgmVxFbvGFViU4VqqhI5R6LYuDM5k+FdFL6x/pwjHnVvvDq5oZPsH1kh/AnxM6qmuvUjIZtnJpHQEhzY7leqKEC0z01ctYlEoW780qeKuOIICwmmB4BMzNwqF45o/uMPSXkh0YqGUXdaahk2Ib2EpR/Mj1jxUBcWJSpI3NfUnL8DXlBPCM7gJ9rmnHM+aAdrAQF6Mz/pqbausxJY91/rbRDTr3n/QUUWuGD2BxWUkT6ljG/vl5ppBEjdiGYT+S88ulWfDDPiWKJnmthSUgzxd/2tPL1QdkUw7A/mxI8tkw32hlmZEy9hAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu4bqCSHwhAJ1lPSG00+qljCLqeFSIIYUp6D2ycjEro=;
 b=Q3Ey/AyQFGIC07UZgXil3qsClyclhVJvAHgBzKvm1H20dSEJssa/NphHoqxtd1pi3ADkvQ1n5EPeqImJ42/3wEMOZE20uBJSxl10oNDX3bQ3xdixYm8K4cbB6aLij+w4xkbVvRDfu8+dwbedUyEs3q+hQKlJRvP68mmd7mG0b4TmOkTj3eDKeOOytNE3ejwWNVdjiWibpeE82VPKHJQUl8pw/0LP3lizGAi8qpAZWA5o8Wd133ESf6LsWQyE5fNN38BpKxYPZdPDQoS7raGXdXP+JYlNyt4sIUoPCIPPr1VlyvL0gW8zBgMoGtD006RpTxfa7xVR3jco4KVixbi6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN6PR11MB3023.namprd11.prod.outlook.com (2603:10b6:805:d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 09:44:40 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 09:44:40 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Christoph Hellwig <hch@lst.de>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
Subject: RE: [PATCH 03/13] vfio/mdev: embedd struct mdev_parent in the parent
 data structure
Thread-Topic: [PATCH 03/13] vfio/mdev: embedd struct mdev_parent in the parent
 data structure
Thread-Index: AQHYiq4KZzwjfXkupUqfaZoo0jtkK61kkdWw
Date: Tue, 28 Jun 2022 09:44:40 +0000
Message-ID: <BN9PR11MB52766DAB5F01F067F42D3DDB8CB89@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220628051435.695540-1-hch@lst.de>
 <20220628051435.695540-4-hch@lst.de>
In-Reply-To: <20220628051435.695540-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03768e34-8714-4782-35ee-08da58ead2b2
x-ms-traffictypediagnostic: SN6PR11MB3023:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NsZymFjHcF6f/BiXFEmvwNFgAGu7GKs5ZFFqJ1WC6SQ9ExkPJh+vfdtzsM8mtF/Z6DrfXqby3iEkq/ZkKyYDGG8ejw9eEHoYqGZpsO63fJLLJPJlpXHiOyIAv5iSBcUsfwSfBpKJ1gOItePqJcBzX/CZUyO+erqx9t+5GGosJBCWNN7i46anuFY+C2D3HG94yO65NuA3R4AYScdoHs0fVJ5S6gjf7WYQHB+DmjFeTyLK+r7jKzryXgHu2g9z3x6eWk7Vw5SJUSI0Tg8Kqc+dbJz0qHvXS8LTlI3cdLBS4h8r3CjTHny/Zu/vWfL2Zz8bV6d6bLq2CcyzcT/EWSx/WrThCnqhW6ATSUu3HYAsgqy/VEx73jv419ds1iWWNvfMh7DkiFe2eRJh8ozLVezzs0H0E8ygyz0ZEvCtiJpYAKmfW4mcdxJUZoAw7Bisuhic71rbE6TL9iCah5mfPH/85biC5yt0f9VnqTYGWEn8PxifUD9WDygIBJBw/pLG8LGb1hzgmBlNdFGMWtk6vlTXgu5ezgVAePmrqtSMf/8LSYEtxBciF+B5WP3UVO2Ocx8MWfCHVzElR1+26v2UwcOViEBNg9ZaLqxVFoQ5XRkNXpws5ZV+PBeQpwwYRFzMw3zkTmZlh++bI/xU4gjJCkOUTkX36Nhef2Y2kuDJD3yENBdYzj9yMZMeq/ogS92xZ0a/BoMjITDQWKLuTZHXuJmndcahMHg+L0x93ZppnRQlTOYUoaazdeNPlnKhsGw1K7n+IBkP6LjQoqhw9AJKXm804s4qY6cr9XC/g6OHTLvsAQ0dgx5ibF4sfvDknHou4uyi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(39860400002)(366004)(346002)(136003)(186003)(6506007)(38070700005)(122000001)(82960400001)(921005)(38100700002)(7696005)(41300700001)(55016003)(26005)(8676002)(4326008)(54906003)(478600001)(71200400001)(66946007)(2906002)(316002)(66446008)(110136005)(4744005)(76116006)(64756008)(66476007)(8936002)(5660300002)(66556008)(7416002)(9686003)(52536014)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nI7Qd9oKP+Soxfox+rIQYMneSlwkpTf1fra1c9WpvZuwhNCdsSdWtnlkCC5t?=
 =?us-ascii?Q?G1GoMd1IQVDoOFHjE97FPZCz1Pq22RaGeEW7rRa2drm8ACG0M9EDpzYnC8Ry?=
 =?us-ascii?Q?PNHIxMFBvT6XUP9oIBzZxUFSup8j1N/1bss+HoKBaTShFisqOCuNjKCrnCFy?=
 =?us-ascii?Q?m/3YvPgdcmXkAuwF1kjHt/q8mvS/S2VUujGazhryN21vTYggy3jVCjHfhNKd?=
 =?us-ascii?Q?TpBRXLorwWNfP/I+SKdWeNKEAM8n/2h+K2lRWbWHEQtByWhdX70UOmCMrPcO?=
 =?us-ascii?Q?4f5BAEyHAreco8NUbG8SZZkY9k+1p7jmAlcs1EWS5nwkRryEraWH2bsfMh4B?=
 =?us-ascii?Q?sP61E65ZgX/e3OpYPcIZ4/t7DJAzmxlhgD/0mvgMAuBCbx8syW+YtleJdL3h?=
 =?us-ascii?Q?76NjDomyelDszmGCrjlBlgfXgZNGrz3LoAZAE0IkMwgDjfSEYAUasL4scsq7?=
 =?us-ascii?Q?gFMAFY0WkBFIB5JQxIV9wkw663TeN/jhm2x1xjaMIjMfDq0u1gcEmRbLzuJt?=
 =?us-ascii?Q?N3hE29bhVUBBygUwyNytxxt6MHdXbbpwALnddbM0fxXFi0Awlh9mJKPWDn5W?=
 =?us-ascii?Q?hH0brf7ee5LJvTBXSrqrnxXfuRS9fG/14xb4SYyr/662Y3IdDyQiAy+YxmcK?=
 =?us-ascii?Q?4wbgfWV6ergONoZoT+HUoRfaP/Q1B4Htb6pwuoUZpCY9c2vB5ey1aEOUdVfO?=
 =?us-ascii?Q?f6hX537FJDQH3XmUmEwAthalP0VVgfIoUuLxaiRU/TQx+sz/C0kXHHy3iFrr?=
 =?us-ascii?Q?ZDjLH612ongmFpY0nijCN/dhV3Nvf5oWTWUGzT34OZTIojXD+H58YevoGi5N?=
 =?us-ascii?Q?6DYYEubwckmMgtrqCDuHq0MmwrgbboSFhabOQGi2VC+MI+xbQMMRhA4OJKLB?=
 =?us-ascii?Q?exq8RFY0QliKB80PwK3stbMuvyo1K7m2VlEqY+hqyVyZAn1fcsmWbmKWD8Ig?=
 =?us-ascii?Q?kiYEcuJk36naP+pJhppuA8px9OdASxqQMw8RSXM6aydLgRl2M+gBfGR7qdnf?=
 =?us-ascii?Q?tQXFVgdn5aPnRDYOv5bOSkz3TDMLoZeYzmcl6O7hg4eAOj8MkzH9DQ7wApnQ?=
 =?us-ascii?Q?gC38uu2S5L9ixF3r/Mkv4ryU0rJGTu3RL+OYfXMG/RxFtbjZ6S6VqgNnipN4?=
 =?us-ascii?Q?OpedCqDha4E7+QOWgAwgjfV214kiBPokBUz8qiW2wDknDDq6/7ZMS9ZlSIlD?=
 =?us-ascii?Q?lNIYeMh1pv23klcBgXEcGGgfxj+VG1tUVJFCcAlqJIoK+wSmYefxWPZPf1Sr?=
 =?us-ascii?Q?f4dDD32hjoUBqloRfxVIkUNo2LkzzBb7g0h/Es1O9DQfYyi9sqzWCA+JuNBm?=
 =?us-ascii?Q?BqXbDzHMQD4BmRP0jaB/HQ2LaxIyfRUskvp+PzQrUP7Ue5yfoGARvUEJC99P?=
 =?us-ascii?Q?QyJSC/EgLlKRYOMOOTdHlXyhmz4rEVTtGBiMPN263bfR3UeXUjEqBbGlX6Rk?=
 =?us-ascii?Q?dVYRn6+xPwVvjyq1wL862ULJM11gsrNE1oFhaO93mfvojpOXs3Lbwe1DtQc/?=
 =?us-ascii?Q?foU0RQsXrx94zmiVEaqH+3Gft/QG28cK6onoQvo5DQlS2tSmkHP0kgI8LW17?=
 =?us-ascii?Q?kqW7U6vJL5RdLukkAr4d1MlBJgviTMf4cs73lloE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03768e34-8714-4782-35ee-08da58ead2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 09:44:40.6363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jums1nZz4kUe3aJhQScT7kFxpTkk9sZ6RO8jeo/Xl1BeM+gYE6cRFiwZ9N5cig8x2rC7AzFxQ9oT8y73rphDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3023
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
 <intel-gvt-dev@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Christoph Hellwig
> Sent: Tuesday, June 28, 2022 1:14 PM
>=20
> Simplify mdev_{un}register_device by requiring the caller to pass in
> a structure allocate as part of the parent device structure.  This
> removes the need for a list of parents and the separate mdev_parent
> refcount as we can simplify rely on the reference to the parent device.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
