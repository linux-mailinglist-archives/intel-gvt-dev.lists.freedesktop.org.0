Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3FE6E1016
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Apr 2023 16:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE80C10E15F;
	Thu, 13 Apr 2023 14:36:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448FD10E15F;
 Thu, 13 Apr 2023 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681396559; x=1712932559;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tnQbMBAzahSmZ9fDlve7PGNl+eSiV4RvfIvLMsZ6Y0Q=;
 b=DAS5mOciAFqA3FEurleLyoP++83GkHpchOGG83c0e1Y7yJQ2I+Qu3oK5
 WN0nVRxi6IthaVB672c9mNpaBlGrc8DqSbTJRcd7facBM1Gthj0fvd5dF
 h/vQ4lqH2QuW6eIcwi2RpewOvepFCDUJmlvrwCFBsSHPYAD7NdWKWt79+
 Ybsh1nRDLGOlr/0KlmnWJBaWWrJ6kHX0BLNRQ7mYJ9XDUGFVAnVcPis2e
 82QZkTiajJXt0UAKXYJ88JaP/nu58ygHn77FxDVaVvQND1E67pThVymZt
 X2G3bH8lgnOIqBn980mNoZIVrtsRFV8X9zAjAh3md4YqISf7X/uqWxuxG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344192994"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="344192994"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="800839435"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="800839435"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 07:36:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 07:35:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 07:35:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 07:35:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 07:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThC23xXyzO3utZ0fOFBeXddsQCx8BcMjnmsD7No8tsmC/6uDB1tup9f6EBVF8ermC2sH7cxiI2Yi+CPPv4BlwhXmQrSFuNG7s6HJUEn2WIOE1OPxPZBwHsts3udQ1lMEUZJUM6/cVaT2WtR1I8GkekCLjPEMLDBlqauRvXEK6uHmOjnu9I7EHqg/w6ZdZ4SRMASWQHTiIkRVaF78Q7KNuIRdvDuRPAHO048KMYVwIvoAu0Yh5ZCoqNo1ta5YZ7+cCtx42UAfAmqMpFvNmQS2m2wrZ2LllnoQDQbhaHhS8r/AFWZgmthUzy2f/NbioyHNTsNF0cNcTVNypTWWGDDpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4vnh8/CtEMZ6gFGUnE1wtA9fW0xXKVCKewyTCtq+Dg=;
 b=JzrPIatKcibLLSpGUCliaO37PZEjrIU7b0S5ecnigKTEy6F6rYgFsRLI0h7KLVrxoyrlC2SasuugJfzPDNw6c1E1CjUu7ryQah4Ze1w/3QGQO1obIg+u43Vm1+gsMHGrQvXA7w+ZYBF95kRsXTjlsx2j/YnI+9srgM+ds7cEyBZhAKSnWn7h+mN4gRpX/QqVIiZbpHdSUhCLVMkTvM7q67yNAC835lc+uQpToD0BRgGQYhY1FoaXPSW7q6Iskn9apIfDkOP3I/Jp0y7RRSWUE5v3NrvIchelVdVT5N8x9sjksvvwEV99PJ34zzSkTifgz3HDIt1ldx8yNQrcXxtQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 14:35:57 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::5b44:8f52:dbeb:18e5%4]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 14:35:57 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: RE: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Topic: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Thread-Index: AQHZZKiCMJJkpNrujkKpjX0h05Zqwa8cqG8AgAAcMGCAACibgIAAAyuAgAAEPICAAAjLgIAAGeKAgAAG7oCAAAf9gIAAO30AgACaIeCAAJxQgIAHkI0AgAApuICAABWEgIAAGNKAgAA3aoCAACJEAIABGhiAgAA2uYCAAM6MAIAAOT6AgAAqOqA=
Date: Thu, 13 Apr 2023 14:35:57 +0000
Message-ID: <DS0PR11MB7529AEB1CA7528C6FD51CBD6C3989@DS0PR11MB7529.namprd11.prod.outlook.com>
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
In-Reply-To: <ZDfslVwqk6JtPpyD@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|MW4PR11MB6863:EE_
x-ms-office365-filtering-correlation-id: 527b95c2-95a1-4893-0f88-08db3c2c64d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mFqDhbZvU3JvxueSxlT/nZ6GKyoOYUps2Iw9uk2fYq4URFhDwn1Z5ddya4BKFCDcLb80yNJO+/+/NtXut+C/kfdD5CUJxKJzh9Z/8SO1isFm/TBYs2jS77cd7zfuwVzUzFHP8LYuCY3znuyhYX0Cer0h8/c0PSymgG+k2nhNyMAiFh8nfLDdMlFKokpdQcOKY5Nl+twb23ACSb/PK2j2OUxDU83CXWUeWMdEn+U5BzgHemgghXoSw9jh6JSuxLVj1g/lzTNtASXFscVkv+UAhDb0SszaDpl5/rJWrtg8fZgMxn4MPgWE2pg+RLi+NpnyA7yffy5TSxqdMI1nmjBT0KcRLnNKXaCILdroCv61VNhy9u0z4JBPJ8nwIdNY+5RKE2sDIiIdZ41bzjEZsmnoIA3UlxjaEa0sRSYSCtVGIUIugIInPJ/YZ5hyt4Fqf3r5XnaBD7lGGdMZmntIMKB9B8O1OSeK7gVk8YvIj/sXBwMMCDgsLwQPy3gmZ3BAgBQeKmcs5BXFukpPNN77SqWzv1MEpdxNXsuf7ztvp6X/SrMYnemRBsW0j152eOCKNn+fYEjqOxY9xWUevI0LlkXgar6iL9xyUnX9BmBs18Y32p7LlJmi7ro9qQ205y+v3E5l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(38070700005)(76116006)(66446008)(4326008)(66946007)(64756008)(66476007)(66556008)(55016003)(6506007)(9686003)(26005)(2906002)(71200400001)(7696005)(83380400001)(186003)(6636002)(54906003)(86362001)(7416002)(110136005)(52536014)(5660300002)(122000001)(8936002)(8676002)(38100700002)(33656002)(478600001)(41300700001)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CYXLxZTzKXMZmv7QGjY7lYE5YDG+jtZ5tbT+DI86a1hqAi/+rWjZSfluuOuE?=
 =?us-ascii?Q?NiEukTIRLCcF0acjex5oH6BXUFrhSd0A1f2F8Rl1O/HhQVWgl0YXPLdyiuuJ?=
 =?us-ascii?Q?DDxi44DYI89X+9CGYTrRDMR68qp8bkeY652Wq9GXs9jHKVWb5I6YzHLV9w9r?=
 =?us-ascii?Q?g2MDkRpcO3gFKxILP8NXXKMsDqmQOSVmkP4MEW9NaoQ0dovGRUyNgdHlWwA+?=
 =?us-ascii?Q?HVh/8aktMJRrYT/sqxaxLyS86Deo0BMnXtywKFbHmOu+kAnzPXeJMcCb0/Ni?=
 =?us-ascii?Q?LnMnBjNcGKPtoVJM6FZ38DTbC+vUKqAiD42+2dXzebGDiLFza43vWtLjLrL3?=
 =?us-ascii?Q?s3b5EsFLL0mz50Z7SuZ7PA8O3+wG0PgEw/3gmLb10AsnHt0iFWmL3sHYccIG?=
 =?us-ascii?Q?Yds/xh2K1L3qTaASKErtXWVrA/e/5W312Wk+ARv+dG/kO304UnY8HHlDPEb7?=
 =?us-ascii?Q?WBSeLEpujj/IgB0pX7OX4gQV/rCof7toERi3Fr0jOF6L8XHPUVPoa18qtOMr?=
 =?us-ascii?Q?6YTs3RyI+1Ay3ko9spzoJob+Gstd0iDyP288+YuBPw0coIAtIT9oZLztwosp?=
 =?us-ascii?Q?l0zeJ/wmiuf91WfMsvBS4m1g3RNGg0vjqAcousm9Tx7E9tHLclmoqigAwyuX?=
 =?us-ascii?Q?6EBg7Q6fhzbsi2hOEnLTPd+TkNXRB1Sk3rQmZ2TiDWay5x4U9bQmgggWOREh?=
 =?us-ascii?Q?l/UlC9qk5MAPUJ+1oQpTWiT3fd0SZQuUY00vZ8vxRmnqAv5diVfh4/rmKLdW?=
 =?us-ascii?Q?AArIv0U3EKx6YsO7cL8uxOE5GJKxt2MjcVG9X5EXPVhcsilavTNJ3TSLASW6?=
 =?us-ascii?Q?kG2EaVPZNXFcE6y2ME/ZqwZ1CoHYsZfOqvAJaSMscg5dYIremtiSBcdj0Aa5?=
 =?us-ascii?Q?SjS+afQiPuHgLhtsXgzwtIR+fA3C1Cu2CBNSIJqaAS0tik0HA1eT+KaVDIbh?=
 =?us-ascii?Q?8Q+alhxMdRGk7w1h1OPXa2RnJ2pkN0EK04IdJpG3SI/k9Wvmi4uot7j2d7BD?=
 =?us-ascii?Q?kM8XJuY8IEYnHM4eYORpdJnwlneAElFykh2NrNUhj1+lKiQmG26a5py1b9YG?=
 =?us-ascii?Q?IqZLVUutgO2ZlGjE+MyF+cvgtYxI2qW1IfnM51Qwy4T6Vw1IM2P/cHlTPGzh?=
 =?us-ascii?Q?vLc9jqoqm176W39dRRtIFP06qJDqBwiWDBA7OFPKcAp/MfTm4790HbsyRTCz?=
 =?us-ascii?Q?Wbz15sPwv2b31+gWbQPisstVeJCLPj4mTl+dEge9B4wMrVVsVg6Hb1v35MeT?=
 =?us-ascii?Q?pSeTYaao+jUVyUD8hwJ+6CFpmpWZ9X5//Xv9nd7vf9nMovrGEI1wh+vOj033?=
 =?us-ascii?Q?MkXDSFWOp4kcaPQi8TveCX2ykPCjiWn2LW4EI8xa2Q/WD2XUlnrgJlKZkLsI?=
 =?us-ascii?Q?zkfkD44BYtiCp31Ae0KaLswnwjz5tvWglpT5CJk73GNTRlKUzreFSr4rfY6k?=
 =?us-ascii?Q?Ya+oW/Upnrv8tog2iTZliAbVhxNXr3iCv78kAv7UbXNUl9NOmU9cNe3kfPDc?=
 =?us-ascii?Q?xTFtL0BZhQh86jTyQjknmV6e4Pvp/zf8x/M16on55yQ3fOooylhPuKuDD/6y?=
 =?us-ascii?Q?H1oD8htBks4YmxOep/c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527b95c2-95a1-4893-0f88-08db3c2c64d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 14:35:57.0938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FVuGsJlh23tx6pTOvc+rcoFJmhSaihPK7MixzwlG3y9fPyTb5JZQW9TRzj13h8Y5LZDT3H5uJdm1xuey6B44w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
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
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, April 13, 2023 7:51 PM
>=20
> On Thu, Apr 13, 2023 at 08:25:52AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Thursday, April 13, 2023 4:07 AM
> > >
> > >
> > > > in which case we need c) a way to
> > > > report the overall set of affected devices regardless of ownership =
in
> > > > support of 4), BDF?
> > >
> > > Yes, continue to use INFO unmodified.
> > >
> > > > Are we back to replacing group-ids with dev-ids in the INFO structu=
re,
> > > > where an invalid dev-id either indicates an affected device with
> > > > implied ownership (ok) or a gap in ownership (bad) and a flag somew=
here
> > > > is meant to indicate the overall disposition based on the availabil=
ity
> > > > of reset?
> > >
> > > As you explore in the following this gets ugly. I prefer to keep INFO
> > > unchanged and add INFO2.
> > >
> >
> > INFO needs a change when VFIO_GROUP is disabled. Now it assumes
> > a valid iommu group always exists:
> >
> > vfio_pci_fill_devs()
> > {
> > 	...
> > 	iommu_group =3D iommu_group_get(&pdev->dev);
> > 	if (!iommu_group)
> > 		return -EPERM; /* Cannot reset non-isolated devices */
> > 	...
> > }
>=20
> This can still work in a ugly way. With a INFO2 the only purpose of
> INFO would be debugging, so if someone uses no-iommu, with hotreset
> and misconfigures it then the only downside is they don't get the
> debugging print. But we know of nothing that uses this combination
> anyhow..

Today, at least QEMU will not go to do hot-reset if _INFO fails. I think
this check may need to be relaxed if want _INFO work when there is
no VFIO_GROUP (also no fake iommu_group).

Regards,
Yi Liu
