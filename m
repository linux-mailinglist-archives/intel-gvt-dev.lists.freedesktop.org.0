Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBD6D839B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 18:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C76210E137;
	Wed,  5 Apr 2023 16:25:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F052610EA0F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 16:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680711951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4ig0uQbeRtB0g2LAhkneA3PjQMdz8uU0A2BtujzoTg=;
 b=GPufl0YiL2mTAmieFUK9ElD019JqQyJ458fhSUf1uM7iWbc235wxeY+Y2ECZjJiEPAn0rj
 XTX1MCjxh+HLNPaJnvcddMk+Bh6zpY4fOoIDyMqdce8izdKMfiXMyrNFND+brOA+b7f+kv
 /xCziCzyCfMEI+CTpYyawe245Yi1NMI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ldfsi-ijMeiRAOajN5N8kw-1; Wed, 05 Apr 2023 12:25:49 -0400
X-MC-Unique: ldfsi-ijMeiRAOajN5N8kw-1
Received: by mail-il1-f197.google.com with SMTP id
 n9-20020a056e02100900b00325c9240af7so23809981ilj.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 09:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X4+7nnzXcAT9Lcy2NEAc7Oy4ojychP/NJ1oPMxWfZgk=;
 b=GIxBGO5NkBZXbmaOUTv7AD4ONphDM7euw72fbjK3SP1XL/YHjVB3jv8LkrcA1F3v/W
 lIB2yL3dYjUlPbFp9MCfcLO0ikt+13BW9mcvD4kgYa/Pq7mllOiP/LPmEw/0bCLk5RWF
 i8rOxyCtJS84RdS55YosMl4YchK4rYV57GwOw2sNvCXKqd8QkD0Y4TnY6/FprkFqIJv2
 LG0LiZnnBPYYUPVxUWn1LzzVXNgtXa1IwbnQIOkIBeBSMPbh+XSNMjvMjaljFNY2fiEJ
 X+lWjD7dD1B4PLxrHQlHj6fD0Ga1cgx1lm8CcVOeFl41o6qWA3ebDI5vysT4l87IbdRJ
 Y29Q==
X-Gm-Message-State: AAQBX9djB01wNq0GD+TnG+oHvg5N484YNXfKTXrleKnBvkrlkJ+e+b/P
 TMKGdq490B86kexbTSKNAI5Go3v+OTNXr00s1Guo/pCACwzHb/kk4HHiUS3DC9glN6t065jetfn
 uGhjmec7vwhrx//zRNQi7hMXC/aZJMUDsgw==
X-Received: by 2002:a5e:c64c:0:b0:759:a96e:1d00 with SMTP id
 s12-20020a5ec64c000000b00759a96e1d00mr4878183ioo.6.1680711948603; 
 Wed, 05 Apr 2023 09:25:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350ap9t/2WA2FI+KNtC7x4KXiBcgP56i9y3IyNpkKbLzahAQJ6d+5h+xwHnIb+sx5Zqd7qmAlGw==
X-Received: by 2002:a5e:c64c:0:b0:759:a96e:1d00 with SMTP id
 s12-20020a5ec64c000000b00759a96e1d00mr4878172ioo.6.1680711948192; 
 Wed, 05 Apr 2023 09:25:48 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056638131600b0040b1ada219fsm4018655jad.26.2023.04.05.09.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:25:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:25:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230405102545.41a61424.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <a937e622-ce32-6dda-d77c-7d8d76474ee0@redhat.com>
 <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 14:04:51 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> Hi Eric,
>=20
> > From: Eric Auger <eric.auger@redhat.com>
> > Sent: Wednesday, April 5, 2023 8:20 PM
> >=20
> > Hi Yi,
> > On 4/1/23 16:44, Yi Liu wrote: =20
> > > for the users that accept device fds passed from management stacks to=
 be
> > > able to figure out the host reset affected devices among the devices
> > > opened by the user. This is needed as such users do not have BDF (bus=
,
> > > devfn) knowledge about the devices it has opened, hence unable to use
> > > the information reported by existing VFIO_DEVICE_GET_PCI_HOT_RESET_IN=
FO
> > > to figure out the affected devices.
> > >
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  drivers/vfio/pci/vfio_pci_core.c | 58 ++++++++++++++++++++++++++++--=
--
> > >  include/uapi/linux/vfio.h        | 24 ++++++++++++-
> > >  2 files changed, 74 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio=
_pci_core.c
> > > index 19f5b075d70a..a5a7e148dce1 100644
> > > --- a/drivers/vfio/pci/vfio_pci_core.c
> > > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > > @@ -30,6 +30,7 @@
> > >  #if IS_ENABLED(CONFIG_EEH)
> > >  #include <asm/eeh.h>
> > >  #endif
> > > +#include <uapi/linux/iommufd.h>
> > >
> > >  #include "vfio_pci_priv.h"
> > >
> > > @@ -767,6 +768,20 @@ static int vfio_pci_get_irq_count(struct =20
> > vfio_pci_core_device *vdev, int irq_typ =20
> > >  =09return 0;
> > >  }
> > >
> > > +static struct vfio_device *
> > > +vfio_pci_find_device_in_devset(struct vfio_device_set *dev_set,
> > > +=09=09=09       struct pci_dev *pdev)
> > > +{
> > > +=09struct vfio_device *cur;
> > > +
> > > +=09lockdep_assert_held(&dev_set->lock);
> > > +
> > > +=09list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > > +=09=09if (cur->dev =3D=3D &pdev->dev)
> > > +=09=09=09return cur;
> > > +=09return NULL;
> > > +}
> > > +
> > >  static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
> > >  {
> > >  =09(*(int *)data)++;
> > > @@ -776,13 +791,20 @@ static int vfio_pci_count_devs(struct pci_dev *=
pdev, void =20
> > *data) =20
> > >  struct vfio_pci_fill_info {
> > >  =09int max;
> > >  =09int cur;
> > > +=09bool require_devid;
> > > +=09struct iommufd_ctx *iommufd;
> > > +=09struct vfio_device_set *dev_set;
> > >  =09struct vfio_pci_dependent_device *devices;
> > >  };
> > >
> > >  static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
> > >  {
> > >  =09struct vfio_pci_fill_info *fill =3D data;
> > > +=09struct vfio_device_set *dev_set =3D fill->dev_set;
> > >  =09struct iommu_group *iommu_group;
> > > +=09struct vfio_device *vdev;
> > > +
> > > +=09lockdep_assert_held(&dev_set->lock);
> > >
> > >  =09if (fill->cur =3D=3D fill->max)
> > >  =09=09return -EAGAIN; /* Something changed, try again */
> > > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pd=
ev, void =20
> > *data) =20
> > >  =09if (!iommu_group)
> > >  =09=09return -EPERM; /* Cannot reset non-isolated devices */
> > >
> > > -=09fill->devices[fill->cur].group_id =3D iommu_group_id(iommu_group)=
;
> > > +=09if (fill->require_devid) {
> > > +=09=09/*
> > > +=09=09 * Report dev_id of the devices that are opened as cdev
> > > +=09=09 * and have the same iommufd with the fill->iommufd.
> > > +=09=09 * Otherwise, just fill IOMMUFD_INVALID_ID.
> > > +=09=09 */
> > > +=09=09vdev =3D vfio_pci_find_device_in_devset(dev_set, pdev);
> > > +=09=09if (vdev && vfio_device_cdev_opened(vdev) &&
> > > +=09=09    fill->iommufd =3D=3D vfio_iommufd_physical_ictx(vdev))
> > > +=09=09=09vfio_iommufd_physical_devid(vdev, &fill->devices[fill-
> > >cur].dev_id);
> > > +=09=09else
> > > +=09=09=09fill->devices[fill->cur].dev_id =3D IOMMUFD_INVALID_ID;
> > > +=09} else {
> > > +=09=09fill->devices[fill->cur].group_id =3D iommu_group_id(iommu_gro=
up);
> > > +=09}
> > >  =09fill->devices[fill->cur].segment =3D pci_domain_nr(pdev->bus);
> > >  =09fill->devices[fill->cur].bus =3D pdev->bus->number;
> > >  =09fill->devices[fill->cur].devfn =3D pdev->devfn;
> > > @@ -1230,17 +1266,27 @@ static int vfio_pci_ioctl_get_pci_hot_reset_i=
nfo(
> > >  =09=09return -ENOMEM;
> > >
> > >  =09fill.devices =3D devices;
> > > +=09fill.dev_set =3D vdev->vdev.dev_set;
> > >
> > > +=09mutex_lock(&vdev->vdev.dev_set->lock);
> > > +=09if (vfio_device_cdev_opened(&vdev->vdev)) {
> > > +=09=09fill.require_devid =3D true;
> > > +=09=09fill.iommufd =3D vfio_iommufd_physical_ictx(&vdev->vdev);
> > > +=09}
> > >  =09ret =3D vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_d=
evs,
> > >  =09=09=09=09=09    &fill, slot);
> > > +=09mutex_unlock(&vdev->vdev.dev_set->lock);
> > >
> > >  =09/*
> > >  =09 * If a device was removed between counting and filling, we may c=
ome up
> > >  =09 * short of fill.max.  If a device was added, we'll have a return=
 of
> > >  =09 * -EAGAIN above.
> > >  =09 */
> > > -=09if (!ret)
> > > +=09if (!ret) {
> > >  =09=09hdr.count =3D fill.cur;
> > > +=09=09if (fill.require_devid)
> > > +=09=09=09hdr.flags =3D VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID;
> > > +=09}
> > >
> > >  reset_info_exit:
> > >  =09if (copy_to_user(arg, &hdr, minsz))
> > > @@ -2346,12 +2392,10 @@ static bool vfio_dev_in_files(struct =20
> > vfio_pci_core_device *vdev, =20
> > >  static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *dat=
a)
> > >  {
> > >  =09struct vfio_device_set *dev_set =3D data;
> > > -=09struct vfio_device *cur;
> > >
> > > -=09list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > > -=09=09if (cur->dev =3D=3D &pdev->dev)
> > > -=09=09=09return 0;
> > > -=09return -EBUSY;
> > > +=09lockdep_assert_held(&dev_set->lock);
> > > +
> > > +=09return vfio_pci_find_device_in_devset(dev_set, pdev) ? 0 : -EBUSY=
;
> > >  }
> > >
> > >  /*
> > > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > > index 25432ef213ee..5a34364e3b94 100644
> > > --- a/include/uapi/linux/vfio.h
> > > +++ b/include/uapi/linux/vfio.h
> > > @@ -650,11 +650,32 @@ enum {
> > >   * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE +=
 12,
> > >   *=09=09=09=09=09      struct vfio_pci_hot_reset_info)
> > >   *
> > > + * This command is used to query the affected devices in the hot res=
et for
> > > + * a given device.  User could use the information reported by this =
command
> > > + * to figure out the affected devices among the devices it has opene=
d.
> > > + * This command always reports the segment, bus and devfn informatio=
n for
> > > + * each affected device, and selectively report the group_id or the =
dev_id
> > > + * per the way how the device being queried is opened.
> > > + *=09- If the device is opened via the traditional group/container m=
anner,
> > > + *=09  this command reports the group_id for each affected device.
> > > + *
> > > + *=09- If the device is opened as a cdev, this command needs to repo=
rt =20
> > s/needs to report/reports =20
>=20
> got it.
>=20
> > > + *=09  dev_id for each affected device and set the
> > > + *=09  VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID flag.  For the affecte=
d
> > > + *=09  devices that are not opened as cdev or bound to different iom=
mufds
> > > + *=09  with the device that is queried, report an invalid dev_id to =
avoid =20
> > s/bound to different iommufds with the device that is queried/bound to
> > iommufds different from the reset device one? =20
>=20
> hmmm, I'm not a native speaker here. This _INFO is to query if want
> hot reset a given device, what devices would be affected. So it appears
> the queried device is better. But I'd admit "the queried device" is also
> "the reset device". may Alex help pick one. =F0=9F=98=8A

=09- If the calling device is opened directly via cdev rather than
=09  accessed through the vfio group, the returned
=09  vfio_pci_depdendent_device structure reports the dev_id
=09  rather than the group_id, which is indicated by the
=09  VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID flag in
=09  vfio_pci_hot_reset_info.  If the reset affects devices that
=09  are not opened within the same iommufd context as the calling
=09  device, IOMMUFD_INVALID_ID will be provided as the dev_id.

But that kind of brings to light the question of what does the user do
when they encounter this situation.  If the device is not opened, the
reset can complete.  If the device is opened by a different user, the
reset is blocked.  The only logical conclusion is that the user should
try the reset regardless of the result of the info ioctl, which the
null-array approach further solidifies as the direction of the API.
I'm not liking this.  Thanks,

Alex


> > > + *=09  potential dev_id conflict as dev_id is local to iommufd.  For=
 such
> > > + *=09  affected devices, user shall fall back to use the segment, bu=
s and
> > > + *=09  devfn info to map it to opened device.
> > > + *
> > >   * Return: 0 on success, -errno on failure:
> > >   *=09-enospc =3D insufficient buffer, -enodev =3D unsupported for de=
vice.
> > >   */
> > >  struct vfio_pci_dependent_device {
> > > -=09__u32=09group_id;
> > > +=09union {
> > > +=09=09__u32   group_id;
> > > +=09=09__u32=09dev_id;
> > > +=09};
> > >  =09__u16=09segment;
> > >  =09__u8=09bus;
> > >  =09__u8=09devfn; /* Use PCI_SLOT/PCI_FUNC */
> > > @@ -663,6 +684,7 @@ struct vfio_pci_dependent_device {
> > >  struct vfio_pci_hot_reset_info {
> > >  =09__u32=09argsz;
> > >  =09__u32=09flags;
> > > +#define VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID=09(1 << 0)
> > >  =09__u32=09count;
> > >  =09struct vfio_pci_dependent_device=09devices[];
> > >  }; =20
> > Eric =20
>=20

