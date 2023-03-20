Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8866C24ED
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Mar 2023 23:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4610E00F;
	Mon, 20 Mar 2023 22:52:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA9110E00F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Mar 2023 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679352744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7y/3HAZ3wfAvPwVJ/7JyA9v2d7U1+6FVR3qfhwvOp+k=;
 b=OSMVfl++eEBSRUaWGQunOIz/oYRql71r5HG875UKb2jD/boz8tGfejrVduFtiQg+gSgKuR
 cPrJB6+AuT4+OxRo8c2SXM9/Q1uQeu+I5IpvBkztAoZ3/ejcWYekO4Viwb0KfSS2dSjviu
 wAMPz+yR9AMQM1G+LXR+2AjCt8uWBDc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-jYduzjNIO5mlsGL6fuMH_A-1; Mon, 20 Mar 2023 18:52:20 -0400
X-MC-Unique: jYduzjNIO5mlsGL6fuMH_A-1
Received: by mail-il1-f198.google.com with SMTP id
 j24-20020a056e02219800b00322f108a4cfso6814165ila.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Mar 2023 15:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679352740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7y/3HAZ3wfAvPwVJ/7JyA9v2d7U1+6FVR3qfhwvOp+k=;
 b=m3htrQbS6uW+9/E00XXpn4MPp2UGqjGl1bXENcVcX47PM3//5cj/zdQU4B5XLUcS3S
 75WpxflZcpTe9BqswhnCmddMbU+U/g0v4qdG6JnpYukudBXWXnz6KyCvij6xcZBPhJfP
 pLS6y4njsIO7niuWC4TK3ObfbBOUJwn4mt7/vOz+XxGx3kcJ3WJt4oZPe29C4x2n6z3p
 keaSUZZX2PtlP4Es/KOPo/va1WW5YLvMAptXYRLKqDQqiZ4KfbXA0qpDIyyaKHW7SLFK
 3RXYNcRn4qq3umcVLnSMKQD+vawa0GEr/Mrpar7W7hMx9QqdUq5oS3fFQly//4K6IABo
 7Dug==
X-Gm-Message-State: AO0yUKXsFitkypFNA/LB8FEzMrqsNOD4iKnEudY+fu2/m7cBCRs9lpo7
 3ft93Q9G099Xf+aNnYbnHVa2T9K6nOWJniKQarZRkqUEHSwJVz79uaGb9iVbC7SyCmhljPLzCBS
 b7WGZx15bbHWdgk1DWJJ+wwywjUNSDuvOIQ==
X-Received: by 2002:a92:d0c5:0:b0:315:4b70:8376 with SMTP id
 y5-20020a92d0c5000000b003154b708376mr147250ila.29.1679352740162; 
 Mon, 20 Mar 2023 15:52:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set+//D7ynk55WQbxx3kMdwYsMpYqnO34ebRyHnzzvy+2P9QDQRcsbaasFIm+/n0ZluW7NpmwqQ==
X-Received: by 2002:a92:d0c5:0:b0:315:4b70:8376 with SMTP id
 y5-20020a92d0c5000000b003154b708376mr147215ila.29.1679352739744; 
 Mon, 20 Mar 2023 15:52:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h24-20020a056602009800b00743fe29dd56sm3188905iob.4.2023.03.20.15.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:52:19 -0700 (PDT)
Date: Mon, 20 Mar 2023 16:52:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230320165217.5b1019a4.alex.williamson@redhat.com>
In-Reply-To: <ZBiUiEC8Xj9sOphr@nvidia.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-13-yi.l.liu@intel.com>
 <20230315165311.01f32bfe.alex.williamson@redhat.com>
 <BN9PR11MB5276300FCAAF8BF7B4E03BA48CBF9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316124532.30839a94.alex.williamson@redhat.com>
 <BN9PR11MB5276F7879E428080D2B214D98CBC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316182256.6659bbbd.alex.williamson@redhat.com>
 <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230317091557.196638a6.alex.williamson@redhat.com>
 <ZBiUiEC8Xj9sOphr@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Mon, 20 Mar 2023 14:14:48 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Fri, Mar 17, 2023 at 09:15:57AM -0600, Alex Williamson wrote:
> > > If that is the intended usage then I don't see why this proposal will
> > > promote userspace to ignore the _INFO ioctl. It should be always
> > > queried no matter how the reset ioctl itself is designed. The motivation
> > > of calling _INFO is not from the reset ioctl asking for an array of fds.  
> > 
> > The VFIO_DEVICE_PCI_HOT_RESET ioctl requires a set of group (or cdev)
> > fds that encompass the set of affected devices reported by the
> > VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl, so I don't agree with the
> > last sentence above.  
> 
> There are two things going on - VFIO_DEVICE_PCI_HOT_RESET requires to
> prove security that the userspace is not attempting to reset something
> that it does not have ownership over. Eg a reset group that spans
> multiple iommu groups.
> 
> The second is for userspace to discover the reset group so it can
> understand what is happening.
> 
> IMHO it is perfectly fine for each API to be only concerned with its
> own purpose.
> 
> VFIO_DEVICE_PCI_HOT_RESET needs to check security, which the
> iommufd_ctx check does just fine
> 
> VFIO_DEVICE_GET_PCI_HOT_RESET_INFO needs to convey the reset group
> span so userspace can do something with this.
> 
> I think confusing security and scope and "acknowledgment" is not a
> good idea.
> 
> The APIs are well defined and userspace can always use them wrong. It
> doesn't need to call RESET_INFO even today, it can just trivially pass
> every group FD it owns to meet the security check.

That's not actually true, in order to avoid arbitrarily large buffers
from the user, the ioctl won't accept an array greater than the number
of devices affected by the reset.

> It is much simpler if VFIO_DEVICE_PCI_HOT_RESET can pass the security
> check without code marshalling fds, which is why we went this
> direction.

I agree that nullifying the arg makes the ioctl easier to use, but my
hesitation is whether it makes it more difficult to use correctly,
which includes resetting devices unexpectedly.

We're talking about something that's a relatively rare event, so I
don't see that time overhead is a factor, nor has the complexity
overhead in the QEMU implementation ever been raised as an issue
previously.

We can always blame the developer for using an interface incorrectly,
but if we make it easier to use incorrectly in order to optimize
something that doesn't need to be optimized, does that make it a good
choice for the uAPI?  Thanks,

Alex

