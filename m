Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B85A8B35
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  1 Sep 2022 04:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55A10E06F;
	Thu,  1 Sep 2022 02:07:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B060410E06F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  1 Sep 2022 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661998020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Uc9eSniapYBlyChWU+AZI0xqtO1iDX5hC1kW3YMyLk=;
 b=HRhjegm6n7Wya3u0408mPPgk3NupQ93zjlN9QJmAVk7r5o+IEhY6xp8vgxPIN5y67kDVTj
 Vumi5EgfMmvFIMIYzWYcx54c/ULiiKgbRi3cM07d6vKK4iRuiAH22X+/QWe5SaKhZDN9vl
 3Du29tFYQKR9be6hZVtC8PydOMs0d1M=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-G-z41bf7MFO3D7sByNsuBA-1; Wed, 31 Aug 2022 22:05:56 -0400
X-MC-Unique: G-z41bf7MFO3D7sByNsuBA-1
Received: by mail-io1-f70.google.com with SMTP id
 q10-20020a0566022f0a00b00688d703717bso9818468iow.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 31 Aug 2022 19:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=/Uc9eSniapYBlyChWU+AZI0xqtO1iDX5hC1kW3YMyLk=;
 b=qQKM6aSUJljlax86/efV4Xgdg+PRSU/J/+GSBR08KM8JQX/RAakDSVstO9MDppCMlJ
 8SiPzvUCrIgRWmMXQb9aAKwDpbioAXuf3eFJcLwHA6YG8l/1Dxogc5SR81dgrP1GxTvp
 pL1GXYk6f4ftA2espB7jhlQ9hF/fLkSn/0OIGmYgg0hEM79ooiJlcROOQWs5j7eO3Rw6
 iSAQr8ovHvPAGCerkijdZhlCh0mPOMFO3tYfXZlH4MC2EFyT5zNXRla/u+oG/XTROJZB
 OvGLqR4mNmsTDQhYjC8YLBGOzvpxTDfTdrP+O0DntFWXmL0wFBTqF1CmcqQ9YGWzLKpO
 1inQ==
X-Gm-Message-State: ACgBeo3uhuWgq7VROrYSkaHY6DRrVmK451Rx52uYZ0uSoUvWmMTENgMc
 EukzLkDJYfSY3DBGZzEGcY5wRZYrnj4I/ueTlMCO1+if23JLcKa2htucDO6RxunklljxAer8OId
 TVOF80vk54k0GeFfFJi2c30pX5iVeat9qxw==
X-Received: by 2002:a02:caa6:0:b0:349:bbca:9a90 with SMTP id
 e6-20020a02caa6000000b00349bbca9a90mr16413143jap.203.1661997955771; 
 Wed, 31 Aug 2022 19:05:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69HUeX58FMkYxODUyoKw5kYP6agdJ53j1pRzyBTmGQRYpiiEtOoSguPX68IkBTLGR0Abgyow==
X-Received: by 2002:a02:caa6:0:b0:349:bbca:9a90 with SMTP id
 e6-20020a02caa6000000b00349bbca9a90mr16413094jap.203.1661997955449; 
 Wed, 31 Aug 2022 19:05:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u7-20020a02b1c7000000b0034293459b44sm7434106jah.142.2022.08.31.19.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 19:05:55 -0700 (PDT)
Date: Wed, 31 Aug 2022 20:05:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220831200552.12169ae3.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB527652B0557897BDA08B5FE38C7B9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
 <20220830161838.4aa47045.alex.williamson@redhat.com>
 <Yw6i7btDKcUDPADP@ziepe.ca>
 <BN9PR11MB5276BF3B8D65B66DB292CAE58C789@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220831111512.4924e152.alex.williamson@redhat.com>
 <BN9PR11MB527652B0557897BDA08B5FE38C7B9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 1 Sep 2022 00:46:51 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, September 1, 2022 1:15 AM
> > 
> > On Wed, 31 Aug 2022 06:10:51 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >   
> > > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Sent: Wednesday, August 31, 2022 7:53 AM
> > > >
> > > > On Tue, Aug 30, 2022 at 04:18:38PM -0600, Alex Williamson wrote:  
> > > > > On Sun, 28 Aug 2022 01:10:37 +0800
> > > > > Kevin Tian <kevin.tian@intel.com> wrote:
> > > > >  
> > > > > > From: Yi Liu <yi.l.liu@intel.com>
> > > > > >
> > > > > > and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> > > > > > sysfs path of the parent, indicating the device is bound to a vfio
> > > > > > driver, e.g.:
> > > > > >
> > > > > > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > > > > >
> > > > > > It is also a preparatory step toward adding cdev for supporting future
> > > > > > device-oriented uAPI.  
> > > > >
> > > > > Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.  
> > > >
> > > > I always thought that was something to use when adding new custom
> > > > sysfs attributes?
> > > >
> > > > Here we are just creating a standard struct device with its standard
> > > > sysfs?
> > > >  
> > >
> > > There is nothing special for vfio-dev/vfioX. But from pci device p.o.v
> > > this does introduce a custom node in the directory, which is probably
> > > what Alex referred to?  
> > 
> > Yup, but not just for pci, we're adding a node into the device
> > directory for any device bound to vfio.
> >   
> > > Anyway if required following can be introduced:
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev  
> > b/Documentation/ABI/testing/sysfs-devices-vfio-dev  
> > > new file mode 100644
> > > index 000000000000..dfe8baaf1ccb
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> > > @@ -0,0 +1,8 @@
> > > +What:		 /sys/.../<device>/vfio-dev/vfioX/
> > > +Date:		 September 2022
> > > +Contact:	 Yi Liu <yi.l.liu@intel.com>
> > > +Description:
> > > +		 This directory is created when the device is bound to a
> > > +		 vfio driver. The layout under this directory matches what
> > > +		 exists for a standard 'struct device'. 'X' is a random
> > > +		 number marking this device in vfio.  
> > 
> > It's not really random, it's a unique index.  Seems like a good
> > starting point.
> >   
> > >
> > > At the start I thought it might make more sense to add it into an
> > > existing vfio ABI file. But looks it doesn't exist.
> > >
> > > Curious why nobody asked for ABI doc for /dev/vfio/vfio, /sys/class/vfio,  
> > etc...
> > 
> > Oversight, there should probably be a sysfs-class-vfio file.  Thanks,
> >   
> 
> I can help add one.
> 
> btw I plan to respin v2 tomorrow. Regarding to this ABI thing there are
> three options:
> 
> 1) Just add sysfs-devices-vfio-dev in this series. Later merge to
>    sysfs-class-vfio once the latter is introduced in a separate patch.

This.  Thanks,

Alex

> 
> 2) Do sysfs-class-vfio in this series, including both existing vfio ABIs and
>    the new vfio-dev.
> 
> 3) No ABI file in this series. Handle it in a separate patch with
>    sysfs-class-vfio.
> 
> Which one do  you prefer to?
> 
> Thanks
> Kevin
> 

