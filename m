Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E626972E5F4
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 16:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0D10E264;
	Tue, 13 Jun 2023 14:39:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13BE10E26B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686667178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+BOQ4Tqi5BD1aEHFPyVALHW8m6Hj0sn3lu1rbLX0rs=;
 b=d/8l6mbXK6PYsh0zFHjqtKxHhlRSGeHlIT3hapAGmyhV/y6zptYNuOrbJlkjB9VnmpLQW1
 EeGEfaIs5GRrrxLx0izykWG04RSOSphI1CJbX+Ahv0WOqyMlPj/9jR4ioJmFOqe59eh/PK
 Kcsno7yCzY8Lo7Ec8XOn/wuj+PZ+m0Q=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-z04hPJFlMfWeciUsnPn7sA-1; Tue, 13 Jun 2023 10:39:37 -0400
X-MC-Unique: z04hPJFlMfWeciUsnPn7sA-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3406661e649so9225535ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 07:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686667177; x=1689259177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+BOQ4Tqi5BD1aEHFPyVALHW8m6Hj0sn3lu1rbLX0rs=;
 b=DHA2bO2NYzox8JSmZnNczuqn/nSF0bPEVgUpwAwN7jhAdURG5xmAsu6WGvu5lA5yCB
 0XRYudjZNO4+FIT86ScmETLwb6GCcETCxWY/4YYASSa/HY8zZiGXUqXsi4ukX+T0zMiu
 N+CTydXkaL16sATfjiZYJQfSw0GWXpzrcjhMN1BOHdX865loSdkBOE5vYxTcqPoqNoEr
 AnlPLvXgtrk96V8R7nHzalQk9/hx/rf2ac3SJnGj7QLCyztUxyuJD3rlso4f1rfYSguF
 to6x0EVr2XpdVoxU3CU8gPqAbLX1G0ERgaTCyNB6PUxBva66trNmMHnVVUvLc0TU7TDd
 basQ==
X-Gm-Message-State: AC+VfDz8twKyLP2v+ZUYvRJbhAyLX0eLsEkOxRe9s4Xe5dVT14cSjpp4
 er86v/r4JGTtsq1kyAsWMlJUJIONmt9Bd7iZgnoMnlWhnZPZVB6PIVjQuZuk+ls79nA7GKiaAsH
 LUW0qvWoFPRdqbjbxoEBvOfdlJsXf86jNFg==
X-Received: by 2002:a92:d590:0:b0:33d:72c0:1b4 with SMTP id
 a16-20020a92d590000000b0033d72c001b4mr10835248iln.10.1686667176907; 
 Tue, 13 Jun 2023 07:39:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lQI1p26NkHPKfSda2Sz1nKZGRDYL+HesOxakQURNBK5DmwF/l7Xzxa63g4qD55bYHlO7/sw==
X-Received: by 2002:a92:d590:0:b0:33d:72c0:1b4 with SMTP id
 a16-20020a92d590000000b0033d72c001b4mr10835233iln.10.1686667176686; 
 Tue, 13 Jun 2023 07:39:36 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g20-20020a0566380c5400b0041f5a0b7fa1sm3495024jal.144.2023.06.13.07.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:39:36 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:39:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 18/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <20230613083935.753430ed.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529F0A41AA58AE37BCF8458C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-19-yi.l.liu@intel.com>
 <20230612162726.16f58ea4.alex.williamson@redhat.com>
 <DS0PR11MB752985BA514AFF36CA3A2785C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613081808.049b9e6d.alex.williamson@redhat.com>
 <DS0PR11MB7529F0A41AA58AE37BCF8458C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
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
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 14:28:43 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 10:18 PM  
> 
> > > > > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > > > > index 83cc5dc28b7a..e80a8ac86e46 100644
> > > > > --- a/include/linux/vfio.h
> > > > > +++ b/include/linux/vfio.h
> > > > > @@ -66,6 +66,7 @@ struct vfio_device {
> > > > >  	struct iommufd_device *iommufd_device;
> > > > >  	bool iommufd_attached;
> > > > >  #endif
> > > > > +	bool cdev_opened:1;  
> > > >
> > > > Perhaps a more strongly defined data type here as well and roll
> > > > iommufd_attached into the same bit field scheme.  
> > >
> > > Ok, then needs to make iommufd_attached always defined.  
> > 
> > That does not follow.  Thanks,  
> 
> Well, I meant the iommufd_attached now is defined only when
> CONFIG_IOMMUFD is enabled. To toll it with cdev_opened, needs
> to change this.

Understood, but I don't think it's true.  If defined we use one more
bit of the bit field, which is a consideration when we approach filling
it, but we're not using bit-shift operations to address these bits, so
why does it matter if one has compiler conditional usage?  Thanks,

Alex

