Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E65C03C6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Sep 2022 18:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754310E0C5;
	Wed, 21 Sep 2022 16:10:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE3F10E31F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Sep 2022 16:10:33 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id ay9so4488349qtb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Sep 2022 09:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=AMTftBiMWZk2QAmHkrehOI1g5/daemu3hoROzAqo87c=;
 b=f/UulgVbJR9/vOmsWbt5U91/tnOJo2PNL7TKCK8SY11JbGK+VrMoYbcJhcnMEmf5jQ
 EovlYjMoktLgNatoK+CVy/Rs7kyV2UA6+8pOZJO7l4anbiUth706rX7MVcJm2FurqfvZ
 qefHdqd0c/ho17jos0I/MwJ0GFfLtiSQFIshBUoETfF+JIBKx/dTEV8P4MJcgAKTCfgw
 iOPIc2rXvMSMMVwnmZz1ld8coHSm6IkjdCY6psHq+gvZXV66Pty8+C6P9UseXBXGvQ70
 r4tkHYuAgGQJeczB7XpAp+Yau+TWBCZJuVUu2BM/CB1qYJNCkA9RyP2l842CVcM2rxWG
 DOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=AMTftBiMWZk2QAmHkrehOI1g5/daemu3hoROzAqo87c=;
 b=7ZHlmDE4uFQ+7dycMf/T0goa7URQxTeZ9wr1VmA+KUvN7MI+8THICZB1pZqg1mre+d
 RxzV7d1lw/a0aw5zKvOZTrvZH/H5TXUcy8LV6coNBEcFjtg6vwvX6IRi6ym7TMgxL1Zv
 sZXhsL2HXANz514pOvkhRPoz92ROpHewu41pqS1mIYvKXRdvkVAe65Wa6kCvbrCVkhNV
 j9fsH+kCSF8qyUjEdbac3bdGguRB7QSZIGUCPArVusWZLsxlHqSyvzGJgS6RMQUWi5Sq
 jHCnl4RJRG6EpuZ6dsP/5UZSDSUcOU2ETZ5JQdLaU4IOSOmeTVHd4S05HJUbwLTm/ZtB
 Q1Hg==
X-Gm-Message-State: ACrzQf0CH/XTDbYgMKhlk9YSAHkMkpkR6cdfi/x49u3wmHbXe/Gqqq2J
 wnNrTQpS2zLcLKMMhYBLkWLyVw==
X-Google-Smtp-Source: AMsMyM6D2XVUjaEeXTE0RkRp6giqAEccP/ds63pJ2ySWLbtpckoAq+4dbYsu8/rqDg2Hj9+Vy46RKw==
X-Received: by 2002:ac8:7d10:0:b0:35c:d519:545 with SMTP id
 g16-20020ac87d10000000b0035cd5190545mr20896336qtb.537.1663776631727; 
 Wed, 21 Sep 2022 09:10:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05620a28c300b006b872b606b1sm2199206qkp.128.2022.09.21.09.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:10:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ob2Iv-000qCI-Hh;
 Wed, 21 Sep 2022 13:10:29 -0300
Date: Wed, 21 Sep 2022 13:10:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 15/15] vfio: Add struct device to vfio_device
Message-ID: <Yys3dZS5ZUByiXin@ziepe.ca>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-16-kevin.tian@intel.com>
 <20220920142639.29b1bdc2.alex.williamson@redhat.com>
 <BN9PR11MB5276484952784F5E336814BD8C4C9@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276484952784F5E336814BD8C4C9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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

On Tue, Sep 20, 2022 at 10:55:40PM +0000, Tian, Kevin wrote:
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Wednesday, September 21, 2022 4:27 AM
> > 
> > On Fri,  9 Sep 2022 18:22:47 +0800
> > Kevin Tian <kevin.tian@intel.com> wrote:
> > 
> > > From: Yi Liu <yi.l.liu@intel.com>
> > >
> > > and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> > > sysfs path of the parent, indicating the device is bound to a vfio
> > > driver, e.g.:
> > >
> > > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > >
> > > It is also a preparatory step toward adding cdev for supporting future
> > > device-oriented uAPI.
> > >
> > > Add Documentation/ABI/testing/sysfs-devices-vfio-dev.
> > >
> > > Also take this chance to rename chardev 'vfio' to 'vfio-group' in
> > > /proc/devices.
> > 
> > What's the risk/reward here, is this just more aesthetically pleasing
> > symmetry vs 'vfio-dev'?  The char major number to name association in
> > /proc/devices seems pretty obscure, but what due diligence have we done
> > to make sure this doesn't break anyone?  Thanks,
> 
> I'm not sure whether the content of /proc/devices is considered as ABI.
> 
> @Jason?

Ah, I've forgotten why we got here - didn't we have a naming conflict
with the new stuff that is being introduced?

ABI wise it is not a problem unless there is a real user, I'm not
aware of anything scanning /proc, that has been obsoleted by sysfs a
long time ago.

Jason
