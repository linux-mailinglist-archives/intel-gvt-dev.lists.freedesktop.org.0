Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B496D4BF5
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Apr 2023 17:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342110E4E6;
	Mon,  3 Apr 2023 15:32:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB7310E4E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Apr 2023 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680535943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENDFTObQ8xi63y8peRGoyO2GGKdY0wLoCLsXYTaUyEw=;
 b=HrKK4DfG/bBN8ZjL10jfYY+R6iN2RVnavoH/ZNDikIwPv4BwdOUOCz1M4PF5trhyUYsX/4
 LSwzeHjR2fmK1BC52RCp75ZThsFJD/tD1GjachpR0xMcOEn9ZANvVFYXASEvWGgMeReMYW
 gNit/YdZnKoACZbDWUVDBIzyRo+WXB0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-t373QEWMPxy5R_Sl2Ga3tg-1; Mon, 03 Apr 2023 11:32:21 -0400
X-MC-Unique: t373QEWMPxy5R_Sl2Ga3tg-1
Received: by mail-io1-f70.google.com with SMTP id
 9-20020a5ea509000000b0074ca36737d2so17756659iog.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 03 Apr 2023 08:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680535940;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mg/WY/5QTApvYEdExo6w0NW+ojlwZZElJz9ZdPVvAZI=;
 b=RpQxQEmtodb7jxLD3ziqOJmr0UUMAhOFBZqCeiWEg9ZN4rkeQSmKNhtAjMOt9uZmlq
 w9XKatXQidZLN39zWRCrHCrI1UxbWtjJvnhy0qYMABL9+gHRajTBzLwo5Wq4VuL7B14w
 FLiKRFvZboqKgKe5ORPJL5roBi428BValFgaTTBBHbuUnSnuVduc/q0nuhw/7Y+UAnvD
 Tvzh7gX9QrMv6nOfktBL1fZVckv3I6d1v6jpTt/jN/3dcDIKE9a/M1A2qEq5dtFnm0yU
 CK5vZkaagUHoVgUwNcaMckteiJysGhehhjl5qecQseoIioGAcRj7etpStVc+qY/oOd7M
 ZlFw==
X-Gm-Message-State: AAQBX9cgqVt355j5474J1ztdsOQ2sweBmzCY4xsnk2iXVfsjFxiNZEpL
 icvwszdphqm7Nu6MZ9N2ZqvuYZ+AqvYjjFnmK8k6vwERjhiC3dTMyG3d12+UZze/t9eejy2fY1d
 pM0505qnCvuSyy/WWz2DJbTRYQcfFp00ZSQ==
X-Received: by 2002:a6b:7d03:0:b0:74c:e1a5:c5e3 with SMTP id
 c3-20020a6b7d03000000b0074ce1a5c5e3mr11053642ioq.0.1680535940485; 
 Mon, 03 Apr 2023 08:32:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350bXWtL5Bw8Ad/8Ov2pt5McA0ZU3giGQcsZasTbEv+jukxYVvdtKYYQhb5IUNd4UqwaLyXy2hA==
X-Received: by 2002:a6b:7d03:0:b0:74c:e1a5:c5e3 with SMTP id
 c3-20020a6b7d03000000b0074ce1a5c5e3mr11053599ioq.0.1680535940161; 
 Mon, 03 Apr 2023 08:32:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q20-20020a5ea614000000b0075c47fb539asm2681451ioi.0.2023.04.03.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 08:32:19 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:32:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230403093218.04e79d32.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529A380EF7E3F33C5DCEE3EC3929@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
 <DS0PR11MB7529A380EF7E3F33C5DCEE3EC3929@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Mon, 3 Apr 2023 15:22:03 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Monday, April 3, 2023 11:02 PM
> >=20
> > On Mon, 3 Apr 2023 09:25:06 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >  =20
> > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > Sent: Saturday, April 1, 2023 10:44 PM =20
> > > =20
> > > > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *=
pdev, void =20
> > *data) =20
> > > >  =09if (!iommu_group)
> > > >  =09=09return -EPERM; /* Cannot reset non-isolated devices */ =20
> > >
> > > Hi Alex,
> > >
> > > Is disabling iommu a sane way to test vfio noiommu mode? =20
> >=20
> > Yes
> >  =20
> > > I added intel_iommu=3Doff to disable intel iommu and bind a device to=
 vfio-pci.
> > > I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-vfio0=
. Bind
> > > iommufd=3D=3D-1 can succeed, but failed to get hot reset info due to =
the above
> > > group check. Reason is that this happens to have some affected device=
s, and
> > > these devices have no valid iommu_group (because they are not bound t=
o vfio-pci
> > > hence nobody allocates noiommu group for them). So when hot reset inf=
o loops
> > > such devices, it failed with -EPERM. Is this expected? =20
> >=20
> > Hmm, I didn't recall that we put in such a limitation, but given the
> > minimally intrusive approach to no-iommu and the fact that we never
> > defined an invalid group ID to return to the user, it makes sense that
> > we just blocked the ioctl for no-iommu use.  I guess we can do the same
> > for no-iommu cdev. =20
>=20
> sure.
>=20
> >=20
> > BTW, what does this series apply on?  I'm assuming[1], but I don't see
> > a branch from Jason yet.  Thanks, =20
>=20
> yes, this series is applied on [1]. I put the [1], this series and cdev s=
eries
> in https://github.com/yiliu1765/iommufd/commits/vfio_device_cdev_v9.
>=20
> Jason has taken [1] in the below branch. It is based on rc1. So I hesitat=
ed
> to apply this series and cdev series on top of it. Maybe I should have do=
ne
> it to make life easier. =F0=9F=98=8A
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git/log/?h=3D=
for-next

Seems like it must be in the vfio_mdev_ops branch which has not been
pushed aside from the merge back to for-next.  Jason?  Thanks,

Alex

