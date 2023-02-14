Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C3696884
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Feb 2023 16:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D157310E911;
	Tue, 14 Feb 2023 15:54:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D62910E90D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676390062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xb46HmzYSch6mL85Mc29IUcDhw17TwDxuJ7aIajpOQI=;
 b=Vr0iZY5qOMEEu5X8aVk5zyNvJiFSALxGQcrWXjWbtD3rHZ1EDsBOZ7l1bMpxCII+FO6W6z
 iHDDdHIU0vjCq1S4pLHXMvZz3G6+QbypFnoOqVkPWKFigVAfSSueCE6tFPfworkML4qYCF
 sRdz8oQN672a259ekoxSKhxW/oDDmfo=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-6TaY449NNl-pXe1ZzK5j2g-1; Tue, 14 Feb 2023 10:54:21 -0500
X-MC-Unique: 6TaY449NNl-pXe1ZzK5j2g-1
Received: by mail-io1-f72.google.com with SMTP id
 u6-20020a6be406000000b00716ceebf132so10450995iog.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 07:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xb46HmzYSch6mL85Mc29IUcDhw17TwDxuJ7aIajpOQI=;
 b=ZnfGYBQNt+QrmbCaqmUwQw/B80epgeyWozvJ13KNeE9gv7mhxvFpFVYh+NxRNLjkP8
 VAsg3HBpCadFoomht58tn3pe1bGi1ozFxcGeV5BYiu6niAyFg7DUZn84VG+Yd52Y8rA3
 WZ0pw/TSMhIMYm+5hdecG+hWM9k345Aq72D1nbpow7PqSLWu27TUyVHuAA3gv3GcxCTA
 4VgrUS5HmIDnC8MVvmGvoq1BpgEwGkmOOjoH04n3P9P85e1hwL1kLQlV3mKOqao2QYR8
 BpW3/dfyI961ahD+0bDtFeKisLULXt8XSZp8+EMXrzB7ZW2QoGiLVzLpS7xMY2NAroKg
 MRaw==
X-Gm-Message-State: AO0yUKUbkUpBxoNprvxp9irnDEe7O5+13NrcEHH4/v1G9Xhc/8x0/I2a
 PnnVB4wanNHToQ07XZ6ym5J0zJeMdB0HLcYMgvI5nTx3Vx2ay+9mKdwnQ0FumoyPecAokZejE43
 e7DAjfPJEAWj1r3FNUX25TZ6Mig1VI+r7Yg==
X-Received: by 2002:a05:6e02:20e4:b0:314:f7f:a369 with SMTP id
 q4-20020a056e0220e400b003140f7fa369mr4046636ilv.11.1676390060691; 
 Tue, 14 Feb 2023 07:54:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+yb7BFh0lx0KigAZF0OwR9/57RngCfPYMxWA+ojxz0Hlv7JuDsuFBdGIHTFwUQVEMWcfb2KQ==
X-Received: by 2002:a05:6e02:20e4:b0:314:f7f:a369 with SMTP id
 q4-20020a056e0220e400b003140f7fa369mr4046617ilv.11.1676390060461; 
 Tue, 14 Feb 2023 07:54:20 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e10-20020a02a50a000000b003c4d64a4d10sm705354jam.4.2023.02.14.07.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 07:54:20 -0800 (PST)
Date: Tue, 14 Feb 2023 08:54:19 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 00/15] Add vfio_device cdev for iommufd support
Message-ID: <20230214085419.4ac6d2c2.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529F0B20A73690C5650778BC3A29@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213124719.126eb828.alex.williamson@redhat.com>
 <Y+rGDeEMTB8FxjAH@nvidia.com>
 <DS0PR11MB7529F0B20A73690C5650778BC3A29@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 14 Feb 2023 15:15:28 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, February 14, 2023 7:22 AM
> > 
> > On Mon, Feb 13, 2023 at 12:47:19PM -0700, Alex Williamson wrote:
> >   
> > > I think it's too late for v6.3 already, but given this needs at least
> > > one more spin, let's set expectations of this being v6.4 material.  Thanks,  
> > 
> > Please let's continue to try to get this finished during the merge
> > window, all the other series depend on it. We can manage it with a
> > shared branch again..
> >   
> 
> Sure. I've updated the below branch to address Kevin's latest remarks.
> Fixed the compiling failure reported by Alex as well.
> 
> https://github.com/yiliu1765/iommufd/commits/vfio_device_cdev_v3


Sorry, I think this is an abuse of the merge window.  We have a new uAPI
proposal that's barely a week old and has no reviews or acks other than
Yi's, we have build configuration issues which suggests a lack of
testing, we're finding subtle implications to other existing uAPIs, and
nobody seems to have finished an upstream review, including me.

Code for the merge window should already be in maintainer trees by now,
the merge window should be for integration.  There are a lot of things
in flight and many more review comments coming in than we should see
for this to be a v6.3 candidate.  Thanks,

Alex

