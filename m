Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972C6950F3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Feb 2023 20:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555210E0B1;
	Mon, 13 Feb 2023 19:47:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F0510E6EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Feb 2023 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676317644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApEHODYHTQecrYr+nyaT7Nv1aSOq35c+xkLxu/KeFRY=;
 b=cR14hqFBdfJcOqgbAoc1bB2buiSCLom9mdyEEjcf0qclgaknJHEfeB2pLHzxWCUMqOLcjZ
 uWYWGRgq+CGeEsJDSiu7RKZGdx5mIxCFRTHwsR0JdgG+eDMJLkwwmGmVfHbQIkSqAxs1z4
 RFJWTya0hBi/5+Y5GsZKv6DFCv6B+JA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-ygjb1P-fO6O6R3bd1wwSuw-1; Mon, 13 Feb 2023 14:47:23 -0500
X-MC-Unique: ygjb1P-fO6O6R3bd1wwSuw-1
Received: by mail-il1-f197.google.com with SMTP id
 c11-20020a056e020bcb00b0030be9d07d63so9984071ilu.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Feb 2023 11:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jukjE54rA/NniTDMWLMlEUTdm+2tzCyGjiSO2l2TjQQ=;
 b=p+qHIH6NO8aVBGkLdgDUB6PD8158m9n6gIjtb+X4Z/DQ89vVvVEuTRwTyVuHBtxYiV
 epK4oX8xhnLNm9D/kmwpX6hFcb2gZrB2jkjGINBYdkOrtJDtOJkCEvVbuaK4itqhJAwQ
 EvKmpmTsJvnJhK+D287W+Veq7GsjWhhvtyNMLjVEA4IVn4isOqO+oD/VvCXUR2ThSfA7
 AyCJG+6LezaCWHoWIv3gJirCMqFVETRKsTLS+x8EG6Qiba+bpu/Gt/iykHwKdVrzgKOV
 TL22ClI5oBRufXxh/SAt1/JEr5zcJGgg5Ixh9lUrnVIZWcIpcXfyrjGM9Eo+xvJyNSga
 S2xA==
X-Gm-Message-State: AO0yUKXfitavqPHqQK21D2cWD1UJ2ismY8i8HtrMHbwIerjVKEaC8Or4
 xn97Uskcl2DV1E3qlZCqQ1wQ5HrVOa70XPG0HtqL3GEnW4qWUhAPy3XwokXK9lQj3y9L4Kzy5Hc
 4CTXcnkyZbxLud7lLPoOnuBiI3dkfBgmMuA==
X-Received: by 2002:a05:6e02:184d:b0:315:475c:5cfb with SMTP id
 b13-20020a056e02184d00b00315475c5cfbmr4365712ilv.2.1676317642517; 
 Mon, 13 Feb 2023 11:47:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+a3j5BS/mB6OljGhyF1TwNBaNZHDWgm8ontm8ZGuY3WL3AC4gQHk2dSPBwbafrr/9Ovuk7+A==
X-Received: by 2002:a05:6e02:184d:b0:315:475c:5cfb with SMTP id
 b13-20020a056e02184d00b00315475c5cfbmr4365682ilv.2.1676317642188; 
 Mon, 13 Feb 2023 11:47:22 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g15-20020a92dd8f000000b00313f2279f06sm4010881iln.73.2023.02.13.11.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 11:47:21 -0800 (PST)
Date: Mon, 13 Feb 2023 12:47:19 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 00/15] Add vfio_device cdev for iommufd support
Message-ID: <20230213124719.126eb828.alex.williamson@redhat.com>
In-Reply-To: <20230213151348.56451-1-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 peterx@redhat.com, suravee.suthikulpanit@amd.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com, jgg@nvidia.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 13 Feb 2023 07:13:33 -0800
Yi Liu <yi.l.liu@intel.com> wrote:

> Existing VFIO provides group-centric user APIs for userspace. Userspace
> opens the /dev/vfio/$group_id first before getting device fd and hence
> getting access to device. This is not the desired model for iommufd. Per
> the conclusion of community discussion[1], iommufd provides device-centri=
c
> kAPIs and requires its consumer (like VFIO) to be device-centric user
> APIs. Such user APIs are used to associate device with iommufd and also
> the I/O address spaces managed by the iommufd.
>=20
> This series first introduces a per device file structure to be prepared
> for further enhancement and refactors the kvm-vfio code to be prepared
> for accepting device file from userspace. Then refactors the vfio to be
> able to handle iommufd binding. This refactor includes the mechanism of
> blocking device access before iommufd bind, making vfio_device_open() be
> exclusive between the group path and the cdev path. Eventually, adds the
> cdev support for vfio device, and makes group infrastructure optional as
> it is not needed when vfio device cdev is compiled.
>=20
> This is also a prerequisite for iommu nesting for vfio device[2].
>=20
> The complete code can be found in below branch, simple test done with the
> legacy group path and the cdev path. Draft QEMU branch can be found at[3]
>=20
> https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v3
> (config CONFIG_IOMMUFD=3Dy CONFIG_VFIO_DEVICE_CDEV=3Dy)

Even using your branch[1], it seems like this has not been tested
except with cdev support enabled:

/home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c: In function =E2=80=
=98vfio_device_add=E2=80=99:
/home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c:253:48: error: =E2=
=80=98struct vfio_device=E2=80=99 has no member named =E2=80=98cdev=E2=80=
=99; did you mean =E2=80=98dev=E2=80=99?
  253 |                 ret =3D cdev_device_add(&device->cdev, &device->dev=
ice);
      |                                                ^~~~
      |                                                dev
/home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c: In function =E2=80=
=98vfio_device_del=E2=80=99:
/home/alwillia/Work/linux.git/drivers/vfio/vfio_main.c:262:42: error: =E2=
=80=98struct vfio_device=E2=80=99 has no member named =E2=80=98cdev=E2=80=
=99; did you mean =E2=80=98dev=E2=80=99?
  262 |                 cdev_device_del(&device->cdev, &device->device);
      |                                          ^~~~
      |                                          dev

Additionally the VFIO_ENABLE_GROUP Kconfig option doesn't make much
sense to me, it seems entirely redundant to VFIO_GROUP.

I think it's too late for v6.3 already, but given this needs at least
one more spin, let's set expectations of this being v6.4 material.  Thanks,

Alex

[1] 98491da60ae1 cover-letter: Add vfio_device cdev for iommufd support

