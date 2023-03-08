Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93536B0DBA
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Mar 2023 16:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01E610E62F;
	Wed,  8 Mar 2023 15:54:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3668410E62F;
 Wed,  8 Mar 2023 15:54:49 +0000 (UTC)
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PWxh60g27z689xQ;
 Wed,  8 Mar 2023 23:54:14 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 15:54:45 +0000
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2507.021; 
 Wed, 8 Mar 2023 15:54:45 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: RE: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Thread-Topic: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Thread-Index: AQHZSpxHUh/YYv3qukeFp+lKFtoCf67jLB2AgACBDoCAAOlEAIAAn5IAgAIKi/CAAO3wAIAA+kPAgAEQJQCABt1mAA==
Date: Wed, 8 Mar 2023 15:54:45 +0000
Message-ID: <5152227cbe0e4bdcacf0763f1af16e8f@huawei.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <Y/0Cr/tcNCzzIAhi@nvidia.com>
 <DS0PR11MB7529A422D4361B39CCA3D248C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <SA1PR11MB5873479F73CFBAA170717624F0AC9@SA1PR11MB5873.namprd11.prod.outlook.com>
 <Y/64ejbhMiV77uUA@Asurada-Nvidia>
 <b7c1f9d5b4b647f0b0686c3b99f3d006@huawei.com>
 <ZAE2J0I1LiBjWUnm@Asurada-Nvidia>
 <d59a0262d5bf423c9e49ad4ac6015296@huawei.com>
 <ZALspPvvLGFuK96F@Asurada-Nvidia>
In-Reply-To: <ZALspPvvLGFuK96F@Asurada-Nvidia>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nicolin Chen [mailto:nicolinc@nvidia.com]
> Sent: 04 March 2023 07:01
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Xu, Terrence <terrence.xu@intel.com>; Liu, Yi L <yi.l.liu@intel.com>;
> Jason Gunthorpe <jgg@nvidia.com>; alex.williamson@redhat.com; Tian,
> Kevin <kevin.tian@intel.com>; joro@8bytes.org; robin.murphy@arm.com;
> cohuck@redhat.com; eric.auger@redhat.com; kvm@vger.kernel.org;
> mjrosato@linux.ibm.com; chao.p.peng@linux.intel.com;
> yi.y.sun@linux.intel.com; peterx@redhat.com; jasowang@redhat.com;
> lulu@redhat.com; suravee.suthikulpanit@amd.com;
> intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> linux-s390@vger.kernel.org; Hao, Xudong <xudong.hao@intel.com>; Zhao,
> Yan Y <yan.y.zhao@intel.com>
> Subject: Re: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
>=20
> On Fri, Mar 03, 2023 at 03:01:03PM +0000, Shameerali Kolothum Thodi
> wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > > -----Original Message-----
> > > From: Nicolin Chen [mailto:nicolinc@nvidia.com]
> > > Sent: 02 March 2023 23:51
> > > To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> > > Cc: Xu, Terrence <terrence.xu@intel.com>; Liu, Yi L
> > > <yi.l.liu@intel.com>; Jason Gunthorpe <jgg@nvidia.com>;
> > > alex.williamson@redhat.com; Tian, Kevin <kevin.tian@intel.com>;
> > > joro@8bytes.org; robin.murphy@arm.com; cohuck@redhat.com;
> > > eric.auger@redhat.com; kvm@vger.kernel.org; mjrosato@linux.ibm.com;
> > > chao.p.peng@linux.intel.com; yi.y.sun@linux.intel.com;
> > > peterx@redhat.com; jasowang@redhat.com; lulu@redhat.com;
> > > suravee.suthikulpanit@amd.com; intel-gvt-dev@lists.freedesktop.org;
> > > intel-gfx@lists.freedesktop.org; linux-s390@vger.kernel.org; Hao,
> > > Xudong <xudong.hao@intel.com>; Zhao, Yan Y <yan.y.zhao@intel.com>
> > > Subject: Re: [PATCH v5 00/19] Add vfio_device cdev for iommufd
> > > support
> > >
> > > On Thu, Mar 02, 2023 at 09:43:00AM +0000, Shameerali Kolothum Thodi
> > > wrote:
> > >
> > > > Hi Nicolin,
> > > >
> > > > Thanks for the latest ARM64 branch. Do you have a working Qemu
> > > > branch
> > > corresponding to the
> > > > above one?
> > > >
> > > > I tried the
> > >
> https://github.com/nicolinc/qemu/tree/wip/iommufd_rfcv3%2Bnesting%2B
> > > smmuv3
> > > > but for some reason not able to launch the Guest.
> > > >
> > > > Please let me know.
> > >
> > > I do use that branch. It might not be that robust though as it went
> > > through a big rebase.
> >
> > Ok. The issue seems to be quite random in nature and only happens when
> > there are multiple vCPUs. Also doesn't look like related to VFIO
> > device assignment as I can reproduce Guest hang without it by only
> > having nested-smmuv3 and iommufd object.
> >
> > ./qemu-system-aarch64-iommuf -machine
> > virt,gic-version=3D3,iommu=3Dnested-smmuv3,iommufd=3Diommufd0 \
> -enable-kvm
> > -cpu host -m 1G -smp cpus=3D8,maxcpus=3D8 \ -object iommufd,id=3Diommuf=
d0
> \
> > -bios QEMU_EFI.fd \ -kernel Image-6.2-iommufd \ -initrd
> > rootfs-iperf.cpio \ -net none \ -nographic \ -append "rdinit=3Dinit
> > console=3DttyAMA0 root=3D/dev/vda rw earlycon=3Dpl011,0x9000000" \ -tra=
ce
> > events=3Devents \ -D trace_iommufd
> >
> > When the issue happens, no output on terminal as if Qemu is in a locked
> state.
> >
> >  Can you try with the followings?
> > >
> > > --trace "iommufd*" --trace "smmu*" --trace "vfio_*" --trace "pci_*"
> > > --trace "msi_*" --trace "nvme_*"
> >
> > The only trace events with above are this,
> >
> > iommufd_backend_connect fd=3D22 owned=3D1 users=3D1 (0) smmu_add_mr
> > smmuv3-iommu-memory-region-0-0
> >
> > I haven't debugged this further. Please let me know if issue is
> > reproducible with multiple vCPUs at your end. For now will focus on VFI=
O
> dev specific tests.
>=20
> Oh. My test environment has been a single-core vCPU. So that doesn't
> happen to me. Can you try a vanilla QEMU branch that our nesting branch i=
s
> rebased on? I took a branch from Yi as the baseline, while he might take
> from Eric for the rfcv3.
>=20
> I am guessing that it might be an issue in the common tree.

Yes, that looks like the case.
I tried with:
 commit 13356edb8750("Merge tag 'block-pull-request' of https://gitlab.com/=
stefanha/qemu into staging")

And issue is still there. So hopefully once we rebase everything it will go=
 away.

Thanks,
Shameer
