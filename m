Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165F6D814B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 17:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80710E0A9;
	Wed,  5 Apr 2023 15:13:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7586210E0A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680707599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHZ/jIzCBVCjw8Sv1KUUo+r8mPEiPRUgi3mJO20sEiE=;
 b=dxNtiEp7BiD3LPa9HtJiYyu4yFC6GZbEShWxHzq3mIEPL6cN+fXpQq3zTxX5jQSpkkI1M5
 MvPR2ttoPCj14F+Cgi/uQJe0qVah0C0c7KdD/8Q+wwXZeCD6B5fV5zoAA1bIiABebP/a2h
 /5UahjHKgYUKNn5jZzX4FztcDZQlByw=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-8kJEIpORNF22zq2XAo0OsA-1; Wed, 05 Apr 2023 11:13:16 -0400
X-MC-Unique: 8kJEIpORNF22zq2XAo0OsA-1
Received: by mail-io1-f72.google.com with SMTP id
 d204-20020a6bb4d5000000b00758cfdd36c3so22158285iof.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHZ/jIzCBVCjw8Sv1KUUo+r8mPEiPRUgi3mJO20sEiE=;
 b=cssqZBXp5RmZ8S6DDeJmIbKmwccoYcm5Ccj+KgxWqaNRvC5a+gaROlrSSmEwv7Wgsq
 mVNG+ZNXTv8tV3QoAlJ5aTf07byPGHMROKyPdGBf8UoI8YIiabhmOAeeziysNp6wkWlo
 O5PSMFFAV9pNhI9UKsjc82kjPBp8+9L70cdhtHvJ0oZqAuRnhuS/JzFIajPD5jjrrPSP
 x9hIymKXpLtRxaNGYt9BIm9UqlEJaA7js39zZAS2EQDfueXgUP5AXKwCuBnXBW71VvKH
 2o8kQRV5hwiGQEzgnODXWD7KZGAjB6EwsJ7sL8HdERVqJE2Xwjx9HFZHhXucRL1PPD1+
 F2BA==
X-Gm-Message-State: AAQBX9dCUrF4ykURcYRmUE2H/yImLBYobaA+6/m8IRNOP1KI8uAsNQhK
 t+Z2RpQVRzo/hnegBkeTIAIpYTu/+gP4rjIMHbBnEaLsfZA9bVjFfSKYgYTY8kJmn7ZMp/QE3i+
 a5FbUh+qphFwM9YoOgl2Kr+AqFIkCrRi3Lg==
X-Received: by 2002:a92:dd04:0:b0:326:1fb2:40c4 with SMTP id
 n4-20020a92dd04000000b003261fb240c4mr5004298ilm.23.1680707595591; 
 Wed, 05 Apr 2023 08:13:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZP1bpPm4WhRQrqOqZKR50zNpeviNu90Bjdp+q5pCVln3oaoFR9YOzr1ahR+dQPp+xRvGH4tQ==
X-Received: by 2002:a92:dd04:0:b0:326:1fb2:40c4 with SMTP id
 n4-20020a92dd04000000b003261fb240c4mr5004271ilm.23.1680707595338; 
 Wed, 05 Apr 2023 08:13:15 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q10-20020a027b0a000000b00406496ef3dcsm4195746jac.49.2023.04.05.08.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:13:14 -0700 (PDT)
Date: Wed, 5 Apr 2023 09:13:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 11/12] iommufd: Define IOMMUFD_INVALID_ID in uapi
Message-ID: <20230405091312.6e9dbae0.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752985764A642C7B12436C53C3909@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-12-yi.l.liu@intel.com>
 <20230404150034.312fbcac.alex.williamson@redhat.com>
 <DS0PR11MB752985764A642C7B12436C53C3909@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Wed, 5 Apr 2023 09:31:39 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Wednesday, April 5, 2023 5:01 AM
> > 
> > On Sat,  1 Apr 2023 07:44:28 -0700
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >   
> > > as there are IOMMUFD users that want to know check if an ID generated
> > > by IOMMUFD is valid or not. e.g. vfio-pci optionaly returns invalid
> > > dev_id to user in the VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. User
> > > needs to check if the ID is valid or not.
> > >
> > > IOMMUFD_INVALID_ID is defined as 0 since the IDs generated by IOMMUFD
> > > starts from 0.
> > >
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  include/uapi/linux/iommufd.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> > > index 98ebba80cfa1..aeae73a93833 100644
> > > --- a/include/uapi/linux/iommufd.h
> > > +++ b/include/uapi/linux/iommufd.h
> > > @@ -9,6 +9,9 @@
> > >
> > >  #define IOMMUFD_TYPE (';')
> > >
> > > +/* IDs allocated by IOMMUFD starts from 0 */
> > > +#define IOMMUFD_INVALID_ID 0
> > > +
> > >  /**
> > >   * DOC: General ioctl format
> > >   *  
> > 
> > If allocation "starts from 0" then 0 is a valid id, no?  Does allocation
> > start from 1, ie. skip 0?  Thanks,  
> 
> yes, it starts from 1, that's why we can use 0 as invalid id.

So the comment is wrong, correct?

