Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E9696865
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Feb 2023 16:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE31810E905;
	Tue, 14 Feb 2023 15:47:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7596D10E905
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676389645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mGjKolpvwZw5KDGp9hmYi6Ze5Knpzeml/f5seyrpNo=;
 b=InWrogqEUWhZtY1xZO03sCz3Ey0fXrudFca19KB30Gvn4MPRuT0JOSl6dmufG6OH5ZdSnX
 zvgONshouGd3lQCJ8hAk+2P2FBMHhY7PvberDznGjajiYX10q9mvD3LyH5DpSNemQzNHMb
 I4iS7nt8IRD/7y0zEu/T0MVSeJw3q7s=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-mRzJ487tM9KqsE3xVH7vQQ-1; Tue, 14 Feb 2023 10:47:24 -0500
X-MC-Unique: mRzJ487tM9KqsE3xVH7vQQ-1
Received: by mail-io1-f70.google.com with SMTP id
 d14-20020a05660225ce00b00734acc87739so10495243iop.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 07:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dF8oAqlz95bIOcOVCAeaX6K0tlmtU+5fJeYgHw8uZHs=;
 b=GeItDU9zKvcfcptmVjAMkdvuxXdexLklK+weTms2veyhKICtEkMxMoo8udpH6cIDA6
 gAorafg/9XTxw37gUUlwubR9f3ob4ta5GmOZMSZ3fEWEvMkFH6T4wu5OF1q4KdkMasbC
 g7nBJDWlQDgt2cZkzrOHa6l/SRn/ZLBx2UfZ7nnJDqbAgEAcvwOUwTXM7CKB1z0ILsr3
 Qd9eqedBi7YOPt4M8Jw0hDn2sh2OilqkO0175psBk4+F41UkMp1mHONMmUk+vsx2COTM
 MifZV8GIQ18AgDpA0vcvFJxd7D05VViQVDU4P+ia8bv0NKpCGJEFI/d0X75SIVNVG7hr
 Hl/w==
X-Gm-Message-State: AO0yUKUEmNrTdiFZzxBADAHNacgj7GE2uK4+ksu7DQJg9xemnss7VnVo
 +s9NNtcZjKF46KfObVxcWvgFRq71FA4Risg4Hvks9JFytN6wItwazEdw8qXxIaSIZi2T+DsRBg6
 HDxbMOS+WTqli8BAvUYFCoB3e4ZsXZbegtw==
X-Received: by 2002:a05:6e02:b46:b0:315:3fab:195b with SMTP id
 f6-20020a056e020b4600b003153fab195bmr3127009ilu.20.1676389643537; 
 Tue, 14 Feb 2023 07:47:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+QyPBpjyOP4beHC997KFQ4c9DMd5Kti6+9unU5tJWqfEML/h+K7BuEX21SBcHNYcHniWZAyw==
X-Received: by 2002:a05:6e02:b46:b0:315:3fab:195b with SMTP id
 f6-20020a056e020b4600b003153fab195bmr3126971ilu.20.1676389643222; 
 Tue, 14 Feb 2023 07:47:23 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t5-20020a02cca5000000b003b1f0afe484sm4930903jap.141.2023.02.14.07.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 07:47:22 -0800 (PST)
Date: Tue, 14 Feb 2023 08:47:20 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 00/15] Add vfio_device cdev for iommufd support
Message-ID: <20230214084720.74b3574e.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75298788BCA03FD9513F991AC3A29@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213124719.126eb828.alex.williamson@redhat.com>
 <DS0PR11MB75298788BCA03FD9513F991AC3A29@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Tue, 14 Feb 2023 01:55:17 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, February 14, 2023 3:47 AM
> >=20
> > On Mon, 13 Feb 2023 07:13:33 -0800
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >  =20
> > > Existing VFIO provides group-centric user APIs for userspace. Userspa=
ce
> > > opens the /dev/vfio/$group_id first before getting device fd and henc=
e
> > > getting access to device. This is not the desired model for iommufd. =
Per
> > > the conclusion of community discussion[1], iommufd provides device- =
=20
> > centric =20
> > > kAPIs and requires its consumer (like VFIO) to be device-centric user
> > > APIs. Such user APIs are used to associate device with iommufd and al=
so
> > > the I/O address spaces managed by the iommufd.
> > >
> > > This series first introduces a per device file structure to be prepar=
ed
> > > for further enhancement and refactors the kvm-vfio code to be prepare=
d
> > > for accepting device file from userspace. Then refactors the vfio to =
be
> > > able to handle iommufd binding. This refactor includes the mechanism =
of
> > > blocking device access before iommufd bind, making vfio_device_open()=
 =20
> > be =20
> > > exclusive between the group path and the cdev path. Eventually, adds =
the
> > > cdev support for vfio device, and makes group infrastructure optional=
 as
> > > it is not needed when vfio device cdev is compiled.
> > >
> > > This is also a prerequisite for iommu nesting for vfio device[2].
> > >
> > > The complete code can be found in below branch, simple test done with=
 =20
> > the =20
> > > legacy group path and the cdev path. Draft QEMU branch can be found =
=20
> > at[3] =20
> > >
> > > https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v3
> > > (config CONFIG_IOMMUFD=3Dy CONFIG_VFIO_DEVICE_CDEV=3Dy) =20
> >=20
> > Even using your branch[1], it seems like this has not been tested
> > except with cdev support enabled:
> >=20
> > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c: In function
> > =E2=80=98vfio_device_add=E2=80=99:
> > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c:253:48: error: =
=E2=80=98struct
> > vfio_device=E2=80=99 has no member named =E2=80=98cdev=E2=80=99; did yo=
u mean =E2=80=98dev=E2=80=99?
> >   253 |                 ret =3D cdev_device_add(&device->cdev, &device-=
>device);
> >       |                                                ^~~~
> >       |                                                dev
> > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c: In function
> > =E2=80=98vfio_device_del=E2=80=99:
> > /home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c:262:42: error: =
=E2=80=98struct
> > vfio_device=E2=80=99 has no member named =E2=80=98cdev=E2=80=99; did yo=
u mean =E2=80=98dev=E2=80=99?
> >   262 |                 cdev_device_del(&device->cdev, &device->device)=
;
> >       |                                          ^~~~
> >       |                                          dev =20
>=20
> Sorry for it. It is due to the cdev definition is under
> "#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)". While, in the code it
> uses "if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))".  I think for
> readability, it would be better to always define cdev in vfio_device,
> and keep the using of cdev in code. How about your taste?

It seems necessary unless we want to litter the code with #ifdefs.

> > Additionally the VFIO_ENABLE_GROUP Kconfig option doesn't make much
> > sense to me, it seems entirely redundant to VFIO_GROUP. =20
>=20
> The intention is to make the group code compiling match existing case.
> Currently, if VFIO is configured, group code is by default compiled.
> So VFIO_ENABLE_GROUP a hidden option, and VFIO_GROUP an option
> for user.  User needs to explicitly config VFIO_GROUP if VFIO_DEVICE_CDEV=
=3D=3Dy.
> If VFIO_DEVICE_CDEV=3D=3Dn, then no matter user configed VFIO_GROUP or no=
t,
> the group code shall be compiled.

I understand the mechanics, I still find VFIO_ENABLE_GROUP redundant
and unnecessary.  Also, Kconfig should not allow a configuration
without either VFIO_GROUP or VFIO_DEVICE_CDEV as this is not
functional.  Deselecting VFIO_GROUP should select VFIO_DEVICE_CDEV, but
VFIO_DEVICE_CDEV should be an optional addition to VFIO_GROUP.  Thanks,

Alex

