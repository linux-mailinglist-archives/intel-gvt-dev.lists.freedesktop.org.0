Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A25A7203
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 Aug 2022 01:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFD410E37C;
	Tue, 30 Aug 2022 23:53:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBB310E37C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 23:53:20 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id j17so9820132qtp.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 16:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=0L9lzbhkZzftrSeDaWijQDCQO9j3SGBYGuP12lwKrD4=;
 b=abU+GXUqXS02jbKnf2PRzA2SplEPWEhWBJXpAj1du50snC84YOMDGmANpop4r2D5RI
 A4U3zwrxmKzP85VmYMfLmMr9d8tg6zzPw06qrOb8xn1+gH+99+F/OqVnG6/Lre9KSBn4
 zo1W9hlGuorJ3UbplvrCJJ7kZsv0daqDi0GQGmd0ruLNnRpZj56ErHB8VXLg1xOm3LHq
 maRIgx82QxWYjhHSesGndBYpHaVl6id5aHSVMfdeECEz4kib+EUHa1ZBuE/1RPBUFsgE
 JcJxShe4TJ5UBGVmwQuxC4y1kwMf2mv/hIY9Ot37rDwVObnAzUnFQD20KAt94BvvUosg
 gM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=0L9lzbhkZzftrSeDaWijQDCQO9j3SGBYGuP12lwKrD4=;
 b=A9wcT/OEVEnFRaApXgkjBdvBbDAElvOs6rFnevo6HSfAMCaNUPhaQ/tPMBMA4tJkmE
 vFC6Af0Mgv8vhHQ3LveUndbC2QfT2lBZlcXEKLxUsXimLT/Nk8cB2rmt05LCdVzxdPH6
 YsYBU73IbT89DKIzZiTIXT/YnmVyu1ksy6Z3XpZnuKgGyh8DJbjF02UkYptqQaEgklug
 l0nwX+dT/2LenbIOOyoxRPiV3MgxElVtdRRTwwOb/0QO22EOY9YaTvThv/jEP9e4tak+
 tuoATo41uSjUSUbGiVMc529xC1sg1CumGYc9TgTFvHXmsgsBy7S+RiltTOfq+DPG2F1v
 pOcw==
X-Gm-Message-State: ACgBeo3/tIIY5E7SHzazGpbATbVm8ZSnK1cDavHeP5bXsrA1rrwh4Scb
 QQYetZshyffx/wM8T/9zcEE93A==
X-Google-Smtp-Source: AA6agR6SnhQJ6ZIIgoEC6fgDH1kdHhhz4b0pJAYeL3h92b1z66EiWbI66KVBnDlLAl7TgsI8hPuL0g==
X-Received: by 2002:a05:622a:195:b0:344:5630:dcc with SMTP id
 s21-20020a05622a019500b0034456300dccmr17037439qtw.598.1661903599526; 
 Tue, 30 Aug 2022 16:53:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05620a0d8d00b006b942f4ffe3sm1800753qkl.18.2022.08.30.16.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 16:53:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oTB2j-0040T4-8t;
 Tue, 30 Aug 2022 20:53:17 -0300
Date: Tue, 30 Aug 2022 20:53:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 15/15] vfio: Add struct device to vfio_device
Message-ID: <Yw6i7btDKcUDPADP@ziepe.ca>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
 <20220830161838.4aa47045.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830161838.4aa47045.alex.williamson@redhat.com>
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
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
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

On Tue, Aug 30, 2022 at 04:18:38PM -0600, Alex Williamson wrote:
> On Sun, 28 Aug 2022 01:10:37 +0800
> Kevin Tian <kevin.tian@intel.com> wrote:
> 
> > From: Yi Liu <yi.l.liu@intel.com>
> > 
> > and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> > sysfs path of the parent, indicating the device is bound to a vfio
> > driver, e.g.:
> > 
> > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > 
> > It is also a preparatory step toward adding cdev for supporting future
> > device-oriented uAPI.
> 
> Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.

I always thought that was something to use when adding new custom
sysfs attributes?

Here we are just creating a standard struct device with its standard
sysfs?

Jason
