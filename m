Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23600698540
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Feb 2023 21:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614410E2AA;
	Wed, 15 Feb 2023 20:09:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF06C10E071
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Feb 2023 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y51/OeerQUAcE4FHGPat5ZaBWAiM+4DNeK4qhd+lUIk=;
 b=flIsudIg5OT9JamZLwxGRBgjR4rEdmKLfn3y5HYkFiYRWb9YT7/ssVx1/uPvCgxOO6J84N
 6N7HkdjJ1no57r0tu1r9m0TBdcarPQtzlh3wvnSdqGX5Z8eB+lRDQfB2m9xsPaXUD082nn
 TmfMLl0xNgm/LX1bS/CEPp4tp0RK4CY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-uPlZ1Sf2O6OO4x3DH9GJuw-1; Wed, 15 Feb 2023 15:09:13 -0500
X-MC-Unique: uPlZ1Sf2O6OO4x3DH9GJuw-1
Received: by mail-io1-f71.google.com with SMTP id
 m15-20020a5e8d0f000000b0073529b4aeaaso12613977ioj.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Feb 2023 12:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tESq3Kr/u9yLOnXdjifvftm+9NTQBLoMvmGrxgxjkhs=;
 b=5RCqGfVGM+DjSPE+skB9Oz589QM7wJXtCe1B8qSBMzKC+uMkVn3bqSdZBmGilte6dE
 5FKJbiSiFofp+0HTRG99DdpCaNbUp0b29x9tG3s5MgavoZgfVkFloGkkzs7AZgC0Tgaz
 m1XZ174uUDYd1hywDgdQPe6Bgum9d8Oh1nUtavMB+TnlhvhsUz5hxZxRkde4GKX+NmHG
 P3esJnodA7rmhZmKjvWzB0Ebz5T2GBkx7olBAGSZw9ijPPCI5OshqBUygNf4AaiII1Kb
 FeRbNxeHX9dIjY3Cw0wGZn6pGioJLEtchJJD4mE+aJ4luGrn8O6B0XamwPk1YpTQHE6A
 TQwg==
X-Gm-Message-State: AO0yUKWSnFmOL5xIhOwaWzkA3xQotKK9OoNyE3EMH1LAvTm0b1Hn5R61
 gPlPKEhcRraELSqBj9iUfZwRfRRBJKeje4GLSIcHZafJwUG3aDh7AvDBCrawz5G8qYtobDXzj+p
 rWnh7OmCEV6JkMb0+LrR0Bdlg7g1gmWm3Kg==
X-Received: by 2002:a05:6e02:20ea:b0:315:76c9:c691 with SMTP id
 q10-20020a056e0220ea00b0031576c9c691mr2079872ilv.19.1676491752224; 
 Wed, 15 Feb 2023 12:09:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8JBdO/SBIJXBNLRJ98reJHWQI1/84cDo+sGLa3gHSBo3sOQLxc6rg4k96BUs5PdS7dNlfyzQ==
X-Received: by 2002:a05:6e02:20ea:b0:315:76c9:c691 with SMTP id
 q10-20020a056e0220ea00b0031576c9c691mr2079826ilv.19.1676491751854; 
 Wed, 15 Feb 2023 12:09:11 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o12-20020a92d4cc000000b00313d6576c4fsm3171873ilm.84.2023.02.15.12.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:09:11 -0800 (PST)
Date: Wed, 15 Feb 2023 13:09:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 00/15] Add vfio_device cdev for iommufd support
Message-ID: <20230215130909.5d98e878.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529CFCE99E8A77AAC76DC7CC3A39@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213124719.126eb828.alex.williamson@redhat.com>
 <DS0PR11MB75298788BCA03FD9513F991AC3A29@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230214084720.74b3574e.alex.williamson@redhat.com>
 <DS0PR11MB7529CFCE99E8A77AAC76DC7CC3A39@DS0PR11MB7529.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 Kevin" <kevin.tian@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 15 Feb 2023 07:54:31 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, February 14, 2023 11:47 PM
> >=20
> > On Tue, 14 Feb 2023 01:55:17 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >  =20
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, February 14, 2023 3:47 AM
> > > >
> > > > On Mon, 13 Feb 2023 07:13:33 -0800
> > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > > =20
> > > > > Existing VFIO provides group-centric user APIs for userspace. =20
> > Userspace =20
> > > > > opens the /dev/vfio/$group_id first before getting device fd and =
=20
> > hence =20
> > > > > getting access to device. This is not the desired model for iommu=
fd. =20
> > Per =20
> > > > > the conclusion of community discussion[1], iommufd provides devic=
e- =20
> > > > centric =20
> > > > > kAPIs and requires its consumer (like VFIO) to be device-centric =
user
> > > > > APIs. Such user APIs are used to associate device with iommufd an=
d =20
> > also =20
> > > > > the I/O address spaces managed by the iommufd.
> > > > >
> > > > > This series first introduces a per device file structure to be pr=
epared
> > > > > for further enhancement and refactors the kvm-vfio code to be =20
> > prepared =20
> > > > > for accepting device file from userspace. Then refactors the vfio=
 to be
> > > > > able to handle iommufd binding. This refactor includes the mechan=
ism =20
> > of =20
> > > > > blocking device access before iommufd bind, making =20
> > vfio_device_open() =20
> > > > be =20
> > > > > exclusive between the group path and the cdev path. Eventually, a=
dds =20
> > the =20
> > > > > cdev support for vfio device, and makes group infrastructure opti=
onal =20
> > as =20
> > > > > it is not needed when vfio device cdev is compiled.
> > > > >
> > > > > This is also a prerequisite for iommu nesting for vfio device[2].
> > > > >
> > > > > The complete code can be found in below branch, simple test done =
=20
> > with =20
> > > > the =20
> > > > > legacy group path and the cdev path. Draft QEMU branch can be fou=
nd =20
> > > > at[3] =20
> > > > >
> > > > > https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v3
> > > > > (config CONFIG_IOMMUFD=3Dy CONFIG_VFIO_DEVICE_CDEV=3Dy) =20
> > > >
> > > > Even using your branch[1], it seems like this has not been tested
> > > > except with cdev support enabled:
> > > >
> > > > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c: In function
> > > > =E2=80=98vfio_device_add=E2=80=99:
> > > > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c:253:48: erro=
r: =20
> > =E2=80=98struct =20
> > > > vfio_device=E2=80=99 has no member named =E2=80=98cdev=E2=80=99; di=
d you mean =E2=80=98dev=E2=80=99?
> > > >   253 |                 ret =3D cdev_device_add(&device->cdev, &dev=
ice->device);
> > > >       |                                                ^~~~
> > > >       |                                                dev
> > > > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c: In function
> > > > =E2=80=98vfio_device_del=E2=80=99:
> > > > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c:262:42: erro=
r: =20
> > =E2=80=98struct =20
> > > > vfio_device=E2=80=99 has no member named =E2=80=98cdev=E2=80=99; di=
d you mean =E2=80=98dev=E2=80=99?
> > > >   262 |                 cdev_device_del(&device->cdev, &device->dev=
ice);
> > > >       |                                          ^~~~
> > > >       |                                          dev =20
> > >
> > > Sorry for it. It is due to the cdev definition is under
> > > "#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)". While, in the code it
> > > uses "if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))".  I think for
> > > readability, it would be better to always define cdev in vfio_device,
> > > and keep the using of cdev in code. How about your taste? =20
> >=20
> > It seems necessary unless we want to litter the code with #ifdefs. =20
>=20
> I've moved it to the header file and call cdev_device_add()
> under #if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))".
>=20
> > > > Additionally the VFIO_ENABLE_GROUP Kconfig option doesn't make much
> > > > sense to me, it seems entirely redundant to VFIO_GROUP. =20
> > >
> > > The intention is to make the group code compiling match existing case=
.
> > > Currently, if VFIO is configured, group code is by default compiled.
> > > So VFIO_ENABLE_GROUP a hidden option, and VFIO_GROUP an option
> > > for user.  User needs to explicitly config VFIO_GROUP if VFIO_DEVICE_=
CDEV=3D=3Dy.
> > > If VFIO_DEVICE_CDEV=3D=3Dn, then no matter user configed VFIO_GROUP o=
r
> > > not, the group code shall be compiled. =20
> >=20
> > I understand the mechanics, I still find VFIO_ENABLE_GROUP redundant
> > and unnecessary.  Also, Kconfig should not allow a configuration
> > without either VFIO_GROUP or VFIO_DEVICE_CDEV as this is not
> > functional.  Deselecting VFIO_GROUP should select VFIO_DEVICE_CDEV,
> > but  VFIO_DEVICE_CDEV should be an optional addition to VFIO_GROUP. =20
>=20
> How about below? As Jason's remark on patch 0003, cdev is not available
> for SPAPR.
>=20
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index 0476abf154f2..96535adc2301 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -4,6 +4,8 @@ menuconfig VFIO
>  =09select IOMMU_API
>  =09depends on IOMMUFD || !IOMMUFD
>  =09select INTERVAL_TREE
> +=09select VFIO_GROUP if SPAPR_TCE_IOMMU
> +=09select VFIO_DEVICE_CDEV if !VFIO_GROUP && (X86 || S390 || ARM || ARM6=
4)
>  =09select VFIO_CONTAINER if IOMMUFD=3Dn
>  =09help
>  =09  VFIO provides a framework for secure userspace device drivers.
> @@ -14,7 +16,8 @@ menuconfig VFIO
>  if VFIO
>  config VFIO_DEVICE_CDEV
>  =09bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
>  =09depends on IOMMUFD && (X86 || S390 || ARM || ARM64)
> +=09default !VFIO_GROUP
>  =09help
>  =09  The VFIO device cdev is another way for userspace to get device
>  =09  access. Userspace gets device fd by opening device cdev under
> @@ -23,9 +26,21 @@ config VFIO_DEVICE_CDEV
> =20
>  =09  If you don't know what to do here, say N.
> =20
> +config VFIO_GROUP
> +=09bool "Support for the VFIO group /dev/vfio/$group_id"
> +=09default y
> +=09help
> +=09   VFIO group is legacy interface for userspace. As the introduction
> +=09   of VFIO device cdev interface, this can be N. For now, before
> +=09   userspace applications are fully converted to new vfio device cdev
> +=09   interface, this should be Y.
> +
> +=09   If you don't know what to do here, say Y.
> +

I think this does the correct thing, but I'll reserve final judgment
until I can try to break it ;)

This message needs some tuning though, we're not far enough along the
path of cdev access to consider the group interface "legacy" (imo) or
expect that there are any userspace applications converted.  There are
also multiple setting recommendations to befuddle a layperson.  Perhaps:

=09VFIO group support provides the traditional model for accessing
=09devices through VFIO and is used by the majority of userspace
=09applications and drivers making use of VFIO.

=09If you don't know what to do here, say Y.

Thanks,
Alex

>  config VFIO_CONTAINER
>  =09bool "Support for the VFIO container /dev/vfio/vfio"
>  =09select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
> +=09depends on VFIO_GROUP
>  =09default y
>  =09help
>  =09  The VFIO container is the classic interface to VFIO for establishin=
g
>=20
> Regards,
> Yi Liu

