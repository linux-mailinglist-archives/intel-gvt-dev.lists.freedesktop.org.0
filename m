Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608A6BECA9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Mar 2023 16:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9D910E3E4;
	Fri, 17 Mar 2023 15:16:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1C010E3E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Mar 2023 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679066164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rao+xNWRizX0LhN/4wRd+0JAP8O4y7cKTfv6w4e7mjg=;
 b=LhuSA81B7OvKpSovvl1wMSgBrQ+nC7RW7orsrKRQj2CCC5sOSomm3vvPYC75czIzylaOly
 DEOd4AX5riJfH0hedDfrnko79ZHuEe7U6RD1ZoC+pp3sk8XqpCH/BwFjFUNHpBqXQxX4Qy
 wNGB9oIRZtdTrNLePhxa6c4HcCiajzY=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-FJlsE8dJNFufVRxyFM_KNg-1; Fri, 17 Mar 2023 11:16:03 -0400
X-MC-Unique: FJlsE8dJNFufVRxyFM_KNg-1
Received: by mail-il1-f198.google.com with SMTP id
 l10-20020a056e0205ca00b00322fdda7261so2588917ils.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Mar 2023 08:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679066161;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rao+xNWRizX0LhN/4wRd+0JAP8O4y7cKTfv6w4e7mjg=;
 b=QlDW6gXCMBby+m0eejVdS+9sMwT1OW8t2lahMYyDagXcrtYIjqpfh3296FCnbAUpgN
 E59ORPke4m2V72b1pDavN6CG+tVrBUdrQo1ycNhrP56GcdPfQN8/D2vVXJ4sdkOb60Gq
 TTR/HiffTZelJBcPrMUaQYGm0XK143drX2F6nBj6zJIXBlOV257EpOJi0kxku0cgePpF
 /psZE7jFCUw/qKdQ+Nwg24wMnnrS/TeMazhEJgzq12cBHYRxaxEiD+17K6RuIBCJt5R+
 m9l6kLa5HbewQvtU5PE7H7Lt+xCbU787uqvD750popQ9N+BU9QYySO2IC7uHQJTxKRwy
 B5vw==
X-Gm-Message-State: AO0yUKV8t0/drsZ7ur3jGeKj98GMPuqda8U1u/hHI8wmVwxVhJUDHqww
 1hA2GjkCVTRG3B/3RSCtDrVYnUNOfBuGBY2oXg5mjph7AcpCVP8+FhJUYtvt+5B7PRVwOb3YIjH
 WVln4KNIZoTvhKPeW09xXml20dAzf4tDnIw==
X-Received: by 2002:a92:d6c4:0:b0:323:29e2:a19 with SMTP id
 z4-20020a92d6c4000000b0032329e20a19mr121686ilp.19.1679066161234; 
 Fri, 17 Mar 2023 08:16:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set80NGJKORot4gljugv8vYBR/BBkOhmUyaZ4ioD6GUgk2kD4aof7c53go0lOXTZ/o0x4VYZ9Cw==
X-Received: by 2002:a92:d6c4:0:b0:323:29e2:a19 with SMTP id
 z4-20020a92d6c4000000b0032329e20a19mr121668ilp.19.1679066160983; 
 Fri, 17 Mar 2023 08:16:00 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05663815c700b00406147dad72sm761750jat.104.2023.03.17.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:16:00 -0700 (PDT)
Date: Fri, 17 Mar 2023 09:15:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230317091557.196638a6.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-13-yi.l.liu@intel.com>
 <20230315165311.01f32bfe.alex.williamson@redhat.com>
 <BN9PR11MB5276300FCAAF8BF7B4E03BA48CBF9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316124532.30839a94.alex.williamson@redhat.com>
 <BN9PR11MB5276F7879E428080D2B214D98CBC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316182256.6659bbbd.alex.williamson@redhat.com>
 <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Fri, 17 Mar 2023 00:57:23 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson
> > Sent: Friday, March 17, 2023 8:23 AM
> > 
> > On Thu, 16 Mar 2023 23:29:21 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >   
> > > > From: Alex Williamson
> > > > Sent: Friday, March 17, 2023 2:46 AM
> > > >
> > > > On Wed, 15 Mar 2023 23:31:23 +0000
> > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > >  
> > > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > > Sent: Thursday, March 16, 2023 6:53 AM
> > > > > > I'm afraid this proposal reduces or eliminates the handshake we have
> > > > > > with userspace between VFIO_DEVICE_GET_PCI_HOT_RESET_INFO  
> > and  
> > > > > > VFIO_DEVICE_PCI_HOT_RESET, which could promote userspace to  
> > ignore  
> > > > the  
> > > > > > _INFO ioctl altogether, resulting in drivers that don't understand the
> > > > > > scope of the reset.  Is it worth it?  What do we really gain?  
> > > > >
> > > > > Jason raised the concern whether GET_PCI_HOT_RESET_INFO is actually
> > > > > useful today.
> > > > >
> > > > > It's an interface on opened device. So the tiny difference is whether the
> > > > > user knows the device is resettable when calling GET_INFO or later  
> > when  
> > > > > actually calling PCI_HOT_RESET.  
> > > >
> > > > No, GET_PCI_HOT_RESET_INFO conveys not only whether a  
> > PCI_HOT_RESET  
> > > > can
> > > > be performed, but equally important the scope of the reset, ie. which
> > > > devices are affected by the reset.  If we de-emphasize the INFO
> > > > portion, then this easily gets confused as just a variant of
> > > > VFIO_DEVICE_RESET, which is explicitly a device-level cscope reset.  In
> > > > fact, I'd say the interface is not only trying to validate that the
> > > > user has sufficient privileges for the reset, but that they explicitly
> > > > acknowledge the scope of the reset.
> > > >  
> > >
> > > IMHO the usefulness of scope is if it's discoverable by the management
> > > stack which then can try to assign devices with affected reset to a same
> > > user.  
> > 
> > Disagree, the user needs to know the scope of reset.  Take for instance
> > two function of a device configured onto separate buses within a VM.
> > The VMM needs to know that a hot-reset of one will reset the other.
> > That's not obvious to the VMM without some understanding of PCI/e
> > topology and analysis of the host system.  The info ioctl simplifies
> > that discovery for the VMM and the handshake of passing the affected
> > groups makes sure that the info ioctl remains relevant.  
> 
> If that is the intended usage then I don't see why this proposal will
> promote userspace to ignore the _INFO ioctl. It should be always
> queried no matter how the reset ioctl itself is designed. The motivation
> of calling _INFO is not from the reset ioctl asking for an array of fds.

The VFIO_DEVICE_PCI_HOT_RESET ioctl requires a set of group (or cdev)
fds that encompass the set of affected devices reported by the
VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl, so I don't agree with the
last sentence above.

This proposal seems to be based on some confusion about the difference
between VFIO_DEVICE_RESET and VFIO_DEVICE_PCI_HOT_RESET, and therefore
IMO, proliferates that confusion by making the scope argument optional,
which I see as a key difference.  This therefore makes the behavior of
the ioctl less intuitive, easier to get wrong, and I expect we'll see
users unitentionally resetting devices beyond the desired scope if the
group/device fd array is allowed to be empty.  Thanks,

Alex

