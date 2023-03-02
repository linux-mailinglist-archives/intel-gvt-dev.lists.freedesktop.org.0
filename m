Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A36A7F4F
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Mar 2023 11:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547F10E424;
	Thu,  2 Mar 2023 10:00:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1033 seconds by postgrey-1.36 at gabe;
 Thu, 02 Mar 2023 10:00:17 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271210E424;
 Thu,  2 Mar 2023 10:00:17 +0000 (UTC)
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PS5kJ48fpz689Rs;
 Thu,  2 Mar 2023 17:42:48 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 09:43:00 +0000
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2507.021; 
 Thu, 2 Mar 2023 09:43:00 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "Xu, Terrence" <terrence.xu@intel.com>
Subject: RE: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Thread-Topic: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Thread-Index: AQHZSpxHUh/YYv3qukeFp+lKFtoCf67jLB2AgACBDoCAAOlEAIAAn5IAgAIKi/A=
Date: Thu, 2 Mar 2023 09:43:00 +0000
Message-ID: <b7c1f9d5b4b647f0b0686c3b99f3d006@huawei.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <Y/0Cr/tcNCzzIAhi@nvidia.com>
 <DS0PR11MB7529A422D4361B39CCA3D248C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <SA1PR11MB5873479F73CFBAA170717624F0AC9@SA1PR11MB5873.namprd11.prod.outlook.com>
 <Y/64ejbhMiV77uUA@Asurada-Nvidia>
In-Reply-To: <Y/64ejbhMiV77uUA@Asurada-Nvidia>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.178]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Nicolin Chen [mailto:nicolinc@nvidia.com]
> Sent: 01 March 2023 02:29
> To: Xu, Terrence <terrence.xu@intel.com>
> Cc: Liu, Yi L <yi.l.liu@intel.com>; Jason Gunthorpe <jgg@nvidia.com>;
> alex.williamson@redhat.com; Tian, Kevin <kevin.tian@intel.com>;
> joro@8bytes.org; robin.murphy@arm.com; cohuck@redhat.com;
> eric.auger@redhat.com; kvm@vger.kernel.org; mjrosato@linux.ibm.com;
> chao.p.peng@linux.intel.com; yi.y.sun@linux.intel.com; peterx@redhat.com;
> jasowang@redhat.com; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; lulu@redhat.com;
> suravee.suthikulpanit@amd.com; intel-gvt-dev@lists.freedesktop.org;
> intel-gfx@lists.freedesktop.org; linux-s390@vger.kernel.org; Hao, Xudong
> <xudong.hao@intel.com>; Zhao, Yan Y <yan.y.zhao@intel.com>
> Subject: Re: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
>=20
> On Tue, Feb 28, 2023 at 04:58:06PM +0000, Xu, Terrence wrote:
>=20
> > Verified this series by "Intel GVT-g GPU device mediated passthrough" a=
nd
> "Intel GVT-d GPU device direct passthrough" technologies.
> > Both passed VFIO legacy mode / compat mode / cdev mode, including
> negative tests.
> >
> > Tested-by: Terrence Xu <terrence.xu@intel.com>
>=20
> Sanity-tested this series on ARM64 with my wip branch:
> https://github.com/nicolinc/iommufd/commits/wip/iommufd-v6.2-nesting
> (Covering new iommufd and vfio-compat)

Hi Nicolin,

Thanks for the latest ARM64 branch. Do you have a working Qemu branch corre=
sponding to the
above one?

I tried the https://github.com/nicolinc/qemu/tree/wip/iommufd_rfcv3%2Bnesti=
ng%2Bsmmuv3
but for some reason not able to launch the Guest.

Please let me know.

Thanks,
Shameer
