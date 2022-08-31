Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB35A7269
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 Aug 2022 02:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0989610E408;
	Wed, 31 Aug 2022 00:32:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77C10E40B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 31 Aug 2022 00:32:20 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id m5so9756518qkk.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 17:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=m6BZChVtTK+UGAguzCWejrDqoYzu+Sz7AkPqPhtFZKg=;
 b=iRMue+inDDgzPoZBlSffki7JldZ/QlafC20b2i0ZBxo0i3xmlsOecDLDz13B79wjHh
 YEqSPlUr39wUHw15ThhAyQe0of7R+dKWzTdu1xNlS3TiVFOn+NfLXbx8Wkfh29W6llrh
 GUKFoVha4k8UolCu0Qb7L1iRcHJhU1OO6LNaNHXYWUSzPLrozA8qos7jYpevZTik4ec6
 a4iRBoVvaxIubgBwOPBYQwxPA/E38lv8ZMq0sRPiL9s/AadEYdv6JBPMYeTQ3INnnskK
 o6KK5+uE2BWdRtlw9EQ7pSU5E+DgjqdH4Kvm+Ney032znbwhndoDhNQjxequU4tQ4Voh
 OP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=m6BZChVtTK+UGAguzCWejrDqoYzu+Sz7AkPqPhtFZKg=;
 b=BDDeg0GCLWhOeVtwfkRK/Z9fs1+zoTB0fkO3eAwvitE/xPHMx6cwqz1aXRUart0Rr0
 Rbv/ByqlWIca8RdlbUfV7DX+fz26p83eXlpRI3fJqfXUP/iXQtPmOWBFEi/+4nKBBGD0
 CFsdqDUE9CjYr9BYLZRntz51qWL0hvBnibNAsaVTMB9S7eIEv93ZFtRlWQX98gG9YreO
 WmSeUItXv02IkxClenMpz8nXpr7odo143QrJJ8TeH9kaY5Mg3SHQ03jXojbQCgvZgS3g
 9TFVVeLxsCvTHNnjfgEZz0mOMCO33CdZjPpJ6Ftx+AJ2rluqTiZmt+0r9OTwSP8QBO62
 I+qw==
X-Gm-Message-State: ACgBeo22DoW8qyVaM7QB1WLdJBuTL+PfqRVbUA+Fueq4NTk+GqhY1sXd
 UZxYQ9i4ne0XsX1erHi75U0kqA==
X-Google-Smtp-Source: AA6agR7vPL2Z8ouhUC6TUJw5X2BMyKkEw7SV4WNLjx6dmi1X+sQu+SSVO1IcqNlbchQb5t1I458yLA==
X-Received: by 2002:a05:620a:24d4:b0:6bb:760:4b8f with SMTP id
 m20-20020a05620a24d400b006bb07604b8fmr13906896qkn.83.1661905939523; 
 Tue, 30 Aug 2022 17:32:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05620a248100b006b5e296452csm9508750qkn.54.2022.08.30.17.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 17:32:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oTBeU-00417Z-2C;
 Tue, 30 Aug 2022 21:32:18 -0300
Date: Tue, 30 Aug 2022 21:32:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 15/15] vfio: Add struct device to vfio_device
Message-ID: <Yw6sEghuAm6OAXWE@ziepe.ca>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827171037.30297-16-kevin.tian@intel.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sun, Aug 28, 2022 at 01:10:37AM +0800, Kevin Tian wrote:
> From: Yi Liu <yi.l.liu@intel.com>
> 
> and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> sysfs path of the parent, indicating the device is bound to a vfio
> driver, e.g.:
> 
> /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> 
> It is also a preparatory step toward adding cdev for supporting future
> device-oriented uAPI.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/vfio/vfio_main.c | 70 +++++++++++++++++++++++++++++++++-------
>  include/linux/vfio.h     |  6 ++--
>  2 files changed, 61 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 0c5d120aeced..9ad0cbb83f1c 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -46,6 +46,8 @@ static struct vfio {
>  	struct mutex			group_lock; /* locks group_list */
>  	struct ida			group_ida;
>  	dev_t				group_devt;
> +	struct class			*device_class;
> +	struct ida			device_ida;
>  } vfio;
>  
>  struct vfio_iommu_driver {
> @@ -524,11 +526,19 @@ EXPORT_SYMBOL_GPL(_vfio_alloc_device);
>   *
>   * Only vfio-ccw driver should call this interface.
>   */
> +static void vfio_device_release(struct device *dev);

Since you added this new function in patch 1, it would be nice to
place it in a way that avoids this forward reference in this patch

>  	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1, "vfio");

I think we should change this "vfio" string at this point, it is
really the group fd, so "vfio_group" ?

It only shows in procfs.

Jason
