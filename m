Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76987413F6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Jun 2023 16:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2495A10E106;
	Wed, 28 Jun 2023 14:41:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425310E0A8;
 Wed, 28 Jun 2023 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687963302; x=1719499302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9eXZHaf21iIA5QIK00/94E59rSHHZ7EiMXTyEgv4Y1g=;
 b=ABe+ibX48EmrtMmn8KXSl4THPxNDLfTt9YccVNlLsOCNN4OYFzPkaWOE
 +oUamylJdKT3L2Vy4hdzkqK34gvEgB2+cTcNuM1z2weKdB+gc+5KQ1TWn
 IWyS0KP1pAaUXqmvIhtWz2tUi9WerwrvWuJVgpEVI4BOppngfy4OmG9cM
 Dk8a0cGQ5a1r+wVdJvsUgm3+jKctT8Fk3Q1pb1b+wLZS+7LMMLKA7UXUL
 5dv7QjCgGxiQTp2R7gGNy8HuNwlPKZrbl6mrZBF1XqToXgQrz285kNkPP
 AUJOMc7QyfG7CcWJCRKp/jB5Ner75RJvMDODDVT/1v5FG6H9pC8oqWGTG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361903755"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="361903755"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861567558"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="861567558"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 07:41:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 07:41:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 07:41:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 07:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWS34K+fb3UDufRtiLOkW/u+K8KySmgQDyMXyb1bU5wA50i5TxxX4H2wf4LsCk35aeVZ8h1xUuNbK9C68HnTfyOVCHC+nkksh4mEJCBB/JCCpcr1QBhtboFGE8N9bYO90Py+AzGgkuLqSzYfN42YQ/ygfpypChx6pz9I6H5fpdmsWAP0FG0csFvTHTxASJ9MTrBs6gJrHqnvqj1JkfVRNvt7REAO2TKJINXUo4v+SMREzGDkVjjDBE2MEFyGO+SZNWbSTku//yKNp4YXtnAD7zr6csih1FbORn8Qp7HFTBhXQIS31PxYG8JKDZQEujGLQpwLOSxSzX+NyXEI/Hr5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY6xFPYebNJc8PbGzeLxsj2AZyvs/LkgJrC2t0m28mo=;
 b=glPJNBQMFMMc3FwKrVNtLzQ3VACFA6L2yx0rxXHOq8SwEFxAm5TSVM1bTZ4ywcqErXN5nyZlF51Jl4b+JlOPhpjwuTz6jzXjdjX3LRWPLrmtJlqR8aIcUPwCItYMUzTzPr7Cey+ndhTb1x27CkvBiLE0mh24wXqSzsKkucEpGqMkN6hZNjEvc3tDy8tGQcDBUXnxj4dGef9IH6cSr+0KRvgM7s31GXiQki4ag3SqlfzNcKfYVRxjQNeLTpOfVTAYXgjjDx6EKJn0OAVUDTkUSwB0lHMMpOINr+zzfHIlbIuq4BXY+RnVFge3y87SV29wuFwHPZTtX7wXmo5u2nxMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 14:41:36 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e7db:878:dfab:826d]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e7db:878:dfab:826d%3]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 14:41:36 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v12 18/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Topic: [PATCH v12 18/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Thread-Index: AQHZlUw0PINbjPidUkeXtdGCTAzTl6+YsS6AgAQ157CAAEl6gIAACkuwgAAVLOCAAyCaAIAAAaKw
Date: Wed, 28 Jun 2023 14:41:36 +0000
Message-ID: <DS0PR11MB7529B88C28CD2C7AA6027FB0C324A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-19-yi.l.liu@intel.com> <ZJXFEbmY7BOW6QIe@nvidia.com>
 <DS0PR11MB752904E31251E05619A442B9C326A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <ZJmK6ensADJS/kms@nvidia.com>
 <DS0PR11MB75291F4581566C7B78DC110CC326A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <DS0PR11MB7529790B9BDCB83BAA20DB77C326A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <ZJxE5n7/3FOF+Q7q@nvidia.com>
In-Reply-To: <ZJxE5n7/3FOF+Q7q@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|SA1PR11MB6895:EE_
x-ms-office365-filtering-correlation-id: d77064f9-a455-4490-6d74-08db77e5c648
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: McGPzbUh0+nb6U4E33atizs8xOMdpAu5P9LuQgms5uF9Qq+GvbOZUmkxcMP13aeHIeVbS2mncmKZJY+iDKfcpUsETUBSisbonAMSCofUC8YQTy+NrCZq5G3mm4kn6Eqtd+2xV44yOs6nrUg4KpZgaDPe1vBfcppFmbe1l7VN3s3JzTvq/Vyfug1w4zvjz18RU1yMviRngg0VduFczLReHoSnzbev0nxl8IAYkylL45MFBVrDppMmiSKL9IWXy3x6MZ2hSxzKMXGh7MdlAPnJZV8QddxsGv/hNIHWuCEAYL477k9C1/wm6BE7Y0ifm2entwBbr406uU1sADtM6fUpmP47gdV03EVIS57Zvu1cAQfwLERlL1eedvcSa/gobHZuqvHK29M+xLGy2ykWeYzP5hfH5NlqomEq28rduSWQoADiQliW5+IoKuY6ICEQkTyIaakXy3GA6lUS1yuvRqcCphlhb4XGowJxm+Ab5tSbFHJMm7VhrzhR12++DPGgmXxS2pWdUJA6iHn8woYp9Y/+xrbKYNYCQupvicPdALDkE3QQ7aC+DnABUeWZ7duzI7Gyml9MFBfvsoX8s6ZmspeFlXzUhrMcLm5TqcE5kD4jEdG5eUNxEuHfG7Ya4PUeA00d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(83380400001)(8936002)(52536014)(316002)(7696005)(71200400001)(8676002)(54906003)(4326008)(41300700001)(33656002)(55016003)(122000001)(86362001)(82960400001)(38100700002)(64756008)(9686003)(7416002)(5660300002)(66946007)(66556008)(66446008)(66476007)(6916009)(478600001)(2906002)(186003)(26005)(76116006)(38070700005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FwiAmVLBuc3C0Skp3xs3w2y67b5Pwtb3/tTtfIXcZ3r9hv1xMEklyU/7Ytf8?=
 =?us-ascii?Q?A6YHRNx/u8dnuqC/iYmNCZGGrQFpNCW02J2uYJunz7t/tF/76FYcXfqlAO3f?=
 =?us-ascii?Q?gEaqdUKZlPWALRrJFc245Kbm+yeBqOxorUEqNCdftJ4Ur49mVTPOyw1NZyXV?=
 =?us-ascii?Q?ghFG+vC7SkFxJobONVJRuJHt1/BrroWDZ/lskhP8Sm1x9mLAmonLVGWdhstD?=
 =?us-ascii?Q?SsoLufSivl3kpCqtoegA6SKGewc1FiRWWaY/R4PAuqqbnLOPvtDop567EMDC?=
 =?us-ascii?Q?3VCJLK7dS2EPAv2McoVRGhkw8MrRJJ6joPxjnT1UW0l7fDOCno7C/iAGKUEM?=
 =?us-ascii?Q?MbZT9yP4A8qgskhrqirlBKf9XY7OXhzf6cNANASc3LScUi+DUoiK53SzHPAj?=
 =?us-ascii?Q?xIDRl9e/0oTwawp1LFHqRyzsiG/vlY6dG5YpJYUQQ6MpW20cjLi9nfsoACPj?=
 =?us-ascii?Q?s+v+VQ7Zht4M0JdDJVIvEnfS7sqn2pLXOkubLnksfIJ0Eezu3T7EVczVNTFv?=
 =?us-ascii?Q?KDeB2ep+e9XQjfqCYY2LS8uiWz+xsl3cPdaDXK2t1bcGWRxjOP3su5kwoVt/?=
 =?us-ascii?Q?QJNyiJzwky7fvQjyVc/SKmA62fXgHo066PWGWQYL5kdYwQ20uguLpH/h1tIi?=
 =?us-ascii?Q?7b+jJzyBoMiNLOEunyM/iFdo+bsUSmhTRLrCAjhpUEqXl++kS+udnuE002T3?=
 =?us-ascii?Q?GzZwszhLUbeOSQ7K3owAmwqBubj3zv4dzt4bLrVp4t894SLRbPTXxAoV6sqc?=
 =?us-ascii?Q?PoKbVz6DZ2XtnlmCTHBZ5NC5ggpG/FUU14r9kxpRFextiMb/lw+nLaE/v0s+?=
 =?us-ascii?Q?AkJycsVO4BpfH3MW0B5MDGDgi5o6eFmr6uEtnd97iFp+4hZJFstXJSLixdxf?=
 =?us-ascii?Q?ZD6NQaf0LOm9p8nOq8lZx3o54p/9EPjZ5i/AGVHPbWM7D1hHrmmHy+JOONoS?=
 =?us-ascii?Q?UqFLnefFgJvxka0rLRIRzXJb/64Si4ptJhKz/AGIQjlv4xIxqS3OVCpACGAL?=
 =?us-ascii?Q?lGys0bbuCXtcnDes/Oc9aS4RSeUKgltMf3IMab6agVvLZHgAvi9ju8y7wVzI?=
 =?us-ascii?Q?lDcOdWNFZewOGKWz5hrVWRn1EqwP3GXRmV4Z9HTY/lzLi62/A8bQ/jCpc049?=
 =?us-ascii?Q?QdXgNyVDcP0phxms7FE3XambKN0yFjFVWievYiV8E/PViI8Yj5mOVxZYehD3?=
 =?us-ascii?Q?Di+EQcqe9NBtfF3mJAHmPa1I18XOBu5zNZjORpiifAR3kgCAw6r26wkIJxzT?=
 =?us-ascii?Q?wClc5iYh0ShSRRvDcaBFo6E/CKacJ5Xm6g/x4FO9YzP9OpAWwuMQjUINlReA?=
 =?us-ascii?Q?r+TJRN3zmwWuqBamPxTsdHivvr93fzeEVjUvveSWg199JUdE2aLnwNbdUNzw?=
 =?us-ascii?Q?dvuEcnprGh0ZjIlfxBd0AFE3gUUU9fMgnqNfSzaRzEFspJ1wAjo6xKGlIwMj?=
 =?us-ascii?Q?Xpkcgly8sksNtmFzCIUQ4juuj/vghf9ZRBGgbmjmJF/Cv8gGXF7b0m5ZPdgv?=
 =?us-ascii?Q?e5sYms7wXah+YTfjVRP748stqk7mmdowyDviFE5qPw5eaTMhcP5aMYcUw3Py?=
 =?us-ascii?Q?8foav/5d2gfbfXhMzL1uwXZAocZptZ2t9IyeTilw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77064f9-a455-4490-6d74-08db77e5c648
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 14:41:36.0887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBTEQXtgO1E17dlPmpJb22liXVAK/3x4naGp01oB52sDzZ2PSLxO3glEaCa5K6ACZLqW9SNSODohV17DzWr8nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
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
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, June 28, 2023 10:34 PM
>=20
> On Mon, Jun 26, 2023 at 02:51:29PM +0000, Liu, Yi L wrote:
> > > > >
> > > > > Ah, any suggestion on the naming? How about
> vfio_device_get_kvm_safe_locked()?
> > > >
> > > > I thought you were using _df_ now for these functions?
> > > >
> > >
> > > I see. Your point is passing df to _vfio_device_get_kvm_safe(() and
> > > test the df->kvm within it.  Hence rename it to be _df_. I think grou=
p
> > > path should be ok with this change as well. Let me make it.
> >
> > To pass vfio_device_file to _vfio_device_get_kvm_safe(), needs to make
> > the below changes to the group path. If just wants to test null kvm in =
the
> > _vfio_device_get_kvm_safe(), maybe simpler to keep the current paramete=
rs
> > and just move the null kvm test within this function. Is it?
>=20
> This does seem a bit nicer, yes
>=20
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index 8a9ebcc6980b..4e6ea2943d28 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -373,14 +373,22 @@ void vfio_unregister_group_dev(struct vfio_device=
 *device)
> >  EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
> >
> >  #ifdef CONFIG_HAVE_KVM
> > -void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm =
*kvm)
> > +void _vfio_df_get_kvm_safe(struct vfio_device_file *df)
>=20
> But still avoid the leading _ here

Ok, I'll move the kvm pointer test to _vfio_device_get_kvm_safe()
And also rename it as vfio_device_get_kvm_safe()

Regards,
Yi Liu
