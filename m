Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9757391D3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jun 2023 23:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06610E35C;
	Wed, 21 Jun 2023 21:55:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7E10E356
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jun 2023 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687384505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6jEmRGGWZiZIbtLCB07c+BQ7SykJxZq7jCAW+jXfr4=;
 b=JHn+oDrgBrj8CXoNOS6ZyFjrIJ0dhm/hSr0kOwh0/CHXx3QwvXCUVP/pFDlWM56ja9XgxJ
 Dudarrs1iDM0zX2o5JGnxWotdlb6BhfuPIPIV/Ds2CCKDlnd+qL1QDsFmy6B2FUTuwEnxV
 QgHJ+HEe1v3Uu9O0lYwHf1+BfDt/4Lo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-In00NlCMOvGQEtrQPmrtRQ-1; Wed, 21 Jun 2023 17:54:10 -0400
X-MC-Unique: In00NlCMOvGQEtrQPmrtRQ-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-340b21b5927so50476095ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jun 2023 14:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687384450; x=1689976450;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OcjIilpsL78GPEg4a3ym0OiUhfSk2+I2ITJppCJmAWg=;
 b=hW+xbG3kZ8UKkXLuzDT0IiTtJ0c6gzJSZ8RZDg5LJzDmoY8xUOkzPnffKiakX8lKw7
 Nurg0D+MBuYKAGiUvHWwGG82huF4k4Sn7BRy3nvWYs0CvRvjMxV9I1+PAhPn38QHMtvR
 Xvw7aHZGp/xodoCWkOIv1eAOWjxFyxeJWkNnQu6xm+5Ej3qM5u5CbPf6mBFw7HocI1pZ
 2cfhbtIaWYeH3C3NzEc7x/t81eNc9sYGTA7B2vQOW2bT2XeyUEQvGgkhZarRa0CHoetL
 8jfi/2PsFuxhpQsLgSaaI8aFy0EcCPoFu5DnkmPwUJGRaGozITADhwH17n7p87KjgIBv
 UlgQ==
X-Gm-Message-State: AC+VfDzVIFMQT2lZY1VZ9r9FMed76y3xa+ZqoQj/cU3pA6DzIQQInQuY
 33tX1kk/Z+BGnqKx3BFiMKRhxMD02dGSxNyIJq6U3T9et0GxCblkfClKRSFGbHcFaPTIDklcPk/
 +mkdTJBWh5dbCiQ1mZsj1oWrZdjGd25eFBQ==
X-Received: by 2002:a92:d30e:0:b0:335:56cb:a3a with SMTP id
 x14-20020a92d30e000000b0033556cb0a3amr12525789ila.16.1687384449644; 
 Wed, 21 Jun 2023 14:54:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ613jZQTJ1KTMYoXeiuIrb4tU9D0NboEaAaaUoUad7psM3xAVKMO/K0Tm70WZ+e+LyaLGRcEQ==
X-Received: by 2002:a92:d30e:0:b0:335:56cb:a3a with SMTP id
 x14-20020a92d30e000000b0033556cb0a3amr12525765ila.16.1687384449297; 
 Wed, 21 Jun 2023 14:54:09 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cu17-20020a05663848d100b00420d6fd5c06sm1607201jab.80.2023.06.21.14.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 14:54:08 -0700 (PDT)
Date: Wed, 21 Jun 2023 15:54:06 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v13 22/22] docs: vfio: Add vfio device cdev description
Message-ID: <20230621155406.437d3b4d.alex.williamson@redhat.com>
In-Reply-To: <20230616093946.68711-23-yi.l.liu@intel.com>
References: <20230616093946.68711-1-yi.l.liu@intel.com>
 <20230616093946.68711-23-yi.l.liu@intel.com>
Organization: Red Hat
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 jgg@nvidia.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 clegoate@redhat.com, cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 02:39:46 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This gives notes for userspace applications on device cdev usage.
>=20
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  Documentation/driver-api/vfio.rst | 139 ++++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>=20
> diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api=
/vfio.rst
> index 363e12c90b87..633d11c7fa71 100644
> --- a/Documentation/driver-api/vfio.rst
> +++ b/Documentation/driver-api/vfio.rst
> @@ -239,6 +239,137 @@ group and can access them as follows::
>  =09/* Gratuitous device reset and go... */
>  =09ioctl(device, VFIO_DEVICE_RESET);
> =20
> +IOMMUFD and vfio_iommu_type1
> +----------------------------
> +
> +IOMMUFD is the new user API to manage I/O page tables from userspace.
> +It intends to be the portal of delivering advanced userspace DMA
> +features (nested translation [5]_, PASID [6]_, etc.) while also providin=
g
> +a backwards compatibility interface for existing VFIO_TYPE1v2_IOMMU use
> +cases.  Eventually the vfio_iommu_type1 driver, as well as the legacy
> +vfio container and group model is intended to be deprecated.
> +
> +The IOMMUFD backwards compatibility interface can be enabled two ways.
> +In the first method, the kernel can be configured with
> +CONFIG_IOMMUFD_VFIO_CONTAINER, in which case the IOMMUFD subsystem
> +transparently provides the entire infrastructure for the VFIO
> +container and IOMMU backend interfaces.  The compatibility mode can
> +also be accessed if the VFIO container interface, ie. /dev/vfio/vfio is
> +simply symlink'd to /dev/iommu.  Note that at the time of writing, the
> +compatibility mode is not entirely feature complete relative to
> +VFIO_TYPE1v2_IOMMU (ex. DMA mapping MMIO) and does not attempt to
> +provide compatibility to the VFIO_SPAPR_TCE_IOMMU interface.  Therefore
> +it is not generally advisable at this time to switch from native VFIO
> +implementations to the IOMMUFD compatibility interfaces.
> +
> +Long term, VFIO users should migrate to device access through the cdev
> +interface described below, and native access through the IOMMUFD
> +provided interfaces.
> +
> +VFIO Device cdev
> +----------------
> +
> +Traditionally user acquires a device fd via VFIO_GROUP_GET_DEVICE_FD
> +in a VFIO group.
> +
> +With CONFIG_VFIO_DEVICE_CDEV=3Dy the user can now acquire a device fd
> +by directly opening a character device /dev/vfio/devices/vfioX where
> +"X" is the number allocated uniquely by VFIO for registered devices.
> +cdev interface does not support noiommu devices, so user should use
> +the legacy group interface if noiommu is wanted.
> +
> +The cdev only works with IOMMUFD.  Both VFIO drivers and applications
> +must adapt to the new cdev security model which requires using
> +VFIO_DEVICE_BIND_IOMMUFD to claim DMA ownership before starting to
> +actually use the device.  Once BIND succeeds then a VFIO device can
> +be fully accessed by the user.
> +
> +VFIO device cdev doesn't rely on VFIO group/container/iommu drivers.
> +Hence those modules can be fully compiled out in an environment
> +where no legacy VFIO application exists.
> +
> +So far SPAPR does not support IOMMUFD yet.  So it cannot support device
> +cdev either.

Why isn=C2=B4t this enforced via Kconfig?  At the vfio level we could simpl=
y
add the following in patch 17/:

config VFIO_DEVICE_CDEV
        bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
        depends on IOMMUFD && !SPAPR_TCE_IOMMU
                           ^^^^^^^^^^^^^^^^^^^

Or if Jason wants, IOMMUFD could depend on !SPAPR_TCE_IOMMU for now and
the existing Kconfig options would exclude it.  If we know it doesn't
work, let's not put the burden on the user to figure that out.  A
follow-up patch for this would be fine if there's no other reason to
respin the series.

Otherwise the series is looking pretty good to me.  It still requires
some reviews/acks in the iommufd space and it would be good to see more
reviews for the remainder given the amount of collaboration here.

I'm out for the rest of the week, but I'll leave open accepting this
and the hot-reset series next week for the merge window.  Thanks,

Alex

> +
> +vfio device cdev access is still bound by IOMMU group semantics, ie. the=
re
> +can be only one DMA owner for the group.  Devices belonging to the same
> +group can not be bound to multiple iommufd_ctx or shared between native
> +kernel and vfio bus driver or other driver supporting the driver_managed=
_dma
> +flag.  A violation of this ownership requirement will fail at the
> +VFIO_DEVICE_BIND_IOMMUFD ioctl, which gates full device access.
> +
> +Device cdev Example
> +-------------------
> +
> +Assume user wants to access PCI device 0000:6a:01.0::
> +
> +=09$ ls /sys/bus/pci/devices/0000:6a:01.0/vfio-dev/
> +=09vfio0
> +
> +This device is therefore represented as vfio0.  The user can verify
> +its existence::
> +
> +=09$ ls -l /dev/vfio/devices/vfio0
> +=09crw------- 1 root root 511, 0 Feb 16 01:22 /dev/vfio/devices/vfio0
> +=09$ cat /sys/bus/pci/devices/0000:6a:01.0/vfio-dev/vfio0/dev
> +=09511:0
> +=09$ ls -l /dev/char/511\:0
> +=09lrwxrwxrwx 1 root root 21 Feb 16 01:22 /dev/char/511:0 -> ../vfio/dev=
ices/vfio0
> +
> +Then provide the user with access to the device if unprivileged
> +operation is desired::
> +
> +=09$ chown user:user /dev/vfio/devices/vfio0
> +
> +Finally the user could get cdev fd by::
> +
> +=09cdev_fd =3D open("/dev/vfio/devices/vfio0", O_RDWR);
> +
> +An opened cdev_fd doesn't give the user any permission of accessing
> +the device except binding the cdev_fd to an iommufd.  After that point
> +then the device is fully accessible including attaching it to an
> +IOMMUFD IOAS/HWPT to enable userspace DMA::
> +
> +=09struct vfio_device_bind_iommufd bind =3D {
> +=09=09.argsz =3D sizeof(bind),
> +=09=09.flags =3D 0,
> +=09};
> +=09struct iommu_ioas_alloc alloc_data  =3D {
> +=09=09.size =3D sizeof(alloc_data),
> +=09=09.flags =3D 0,
> +=09};
> +=09struct vfio_device_attach_iommufd_pt attach_data =3D {
> +=09=09.argsz =3D sizeof(attach_data),
> +=09=09.flags =3D 0,
> +=09};
> +=09struct iommu_ioas_map map =3D {
> +=09=09.size =3D sizeof(map),
> +=09=09.flags =3D IOMMU_IOAS_MAP_READABLE |
> +=09=09=09 IOMMU_IOAS_MAP_WRITEABLE |
> +=09=09=09 IOMMU_IOAS_MAP_FIXED_IOVA,
> +=09=09.__reserved =3D 0,
> +=09};
> +
> +=09iommufd =3D open("/dev/iommu", O_RDWR);
> +
> +=09bind.iommufd =3D iommufd;
> +=09ioctl(cdev_fd, VFIO_DEVICE_BIND_IOMMUFD, &bind);
> +
> +=09ioctl(iommufd, IOMMU_IOAS_ALLOC, &alloc_data);
> +=09attach_data.pt_id =3D alloc_data.out_ioas_id;
> +=09ioctl(cdev_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, &attach_data);
> +
> +=09/* Allocate some space and setup a DMA mapping */
> +=09map.user_va =3D (int64_t)mmap(0, 1024 * 1024, PROT_READ | PROT_WRITE,
> +=09=09=09=09    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> +=09map.iova =3D 0; /* 1MB starting at 0x0 from device view */
> +=09map.length =3D 1024 * 1024;
> +=09map.ioas_id =3D alloc_data.out_ioas_id;;
> +
> +=09ioctl(iommufd, IOMMU_IOAS_MAP, &map);
> +
> +=09/* Other device operations as stated in "VFIO Usage Example" */
> +
>  VFIO User API
>  ------------------------------------------------------------------------=
-------
> =20
> @@ -566,3 +697,11 @@ This implementation has some specifics:
>  =09=09=09=09\-0d.1
> =20
>  =0900:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
> +
> +.. [5] Nested translation is an IOMMU feature which supports two stage
> +   address translations.  This improves the address translation efficien=
cy
> +   in IOMMU virtualization.
> +
> +.. [6] PASID stands for Process Address Space ID, introduced by PCI
> +   Express.  It is a prerequisite for Shared Virtual Addressing (SVA)
> +   and Scalable I/O Virtualization (Scalable IOV).

