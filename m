Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C776D4B4E
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Apr 2023 17:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487EB10E4AE;
	Mon,  3 Apr 2023 15:01:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CFC10E4AE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Apr 2023 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680534116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDT5Lf+qM0AXT+Qr2m1vjFVPSH4VkpP6LN6DDAc5Ys4=;
 b=cPdhHpDtKZ4UPsPdXz/WVSWYZpTVeNx3t2sefMGfnpFc1kyD4HiZgwxZM2/Z4f2gPzE9w+
 WvMfU86ekfF0TsNUVsED+kFZfsVrFudfbyGPAZ8B+66euaUGzbgrsDf72EIJI2/+wLQb0B
 Eh54As+dbKFL+Chy03J0U1Gn7v/qqhY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-lJj-kOFEMbuHHwsZC_aLVA-1; Mon, 03 Apr 2023 11:01:54 -0400
X-MC-Unique: lJj-kOFEMbuHHwsZC_aLVA-1
Received: by mail-il1-f200.google.com with SMTP id
 n9-20020a056e02100900b00325c9240af7so19303600ilj.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 03 Apr 2023 08:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680534114;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDT5Lf+qM0AXT+Qr2m1vjFVPSH4VkpP6LN6DDAc5Ys4=;
 b=oAkF6hCqNT9mmiTuJxlpuix5bKOeO2D2mgfgY5roUREV59XIPDWKF7fpg8/S/jJORW
 b//5/rClrnozeY/vUjmOt1tUnil88Z4ItrXd5d3/XaRBoCGZTvwtgyM2sXHBREUdy4vw
 PVLNFlVQ2MdTlY/expyRcImlsi7/WubocHe3uSn7z5PVeaqZx2igigW7rc8+wREc6qyw
 LZdupxX1vTJhORXjiWdZ9/JskWezPihnQpIWp6EUSIhiJDCq4JY2kyMxN6N3Kz7/rUNW
 6O0uueRKv0QT04HwNVbRIIOXkrJqWTzqHNpM2Zchpoe1cG7/bomMnm+SY11W5F9L/gYe
 UztQ==
X-Gm-Message-State: AO0yUKU6MOuZ+Yp4cHJaLjMZ0/pi71xPu8+CQ7N14xbAQDaxHGGclT3v
 UvOByTKsUSUVGGR1uEWYJH8CJSHENShXmu9AhAeKt46+k21kOuHdYvCFHwG0z1r3hixYM6Y7STI
 0fE8lFLTfaDl1YUuUpXhSM6+X+hi0ZnQKSw==
X-Received: by 2002:a5d:8142:0:b0:74c:e456:629d with SMTP id
 f2-20020a5d8142000000b0074ce456629dmr25003466ioo.7.1680534114159; 
 Mon, 03 Apr 2023 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set+kaGi07I/wH0q13cJZHTVv8M0jb8SFu1aYqy0WHHoYlpxzwPnYGZcVa2Sxzy5OzWM2Y+hdQQ==
X-Received: by 2002:a5d:8142:0:b0:74c:e456:629d with SMTP id
 f2-20020a5d8142000000b0074ce456629dmr25003444ioo.7.1680534113860; 
 Mon, 03 Apr 2023 08:01:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q49-20020a056638347100b00408b3bc8061sm2735465jav.43.2023.04.03.08.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 08:01:53 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:01:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230403090151.4cb2158c.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Mon, 3 Apr 2023 09:25:06 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Saturday, April 1, 2023 10:44 PM  
> 
> > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
> >  	if (!iommu_group)
> >  		return -EPERM; /* Cannot reset non-isolated devices */  
> 
> Hi Alex,
> 
> Is disabling iommu a sane way to test vfio noiommu mode?

Yes

> I added intel_iommu=off to disable intel iommu and bind a device to vfio-pci.
> I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-vfio0. Bind
> iommufd==-1 can succeed, but failed to get hot reset info due to the above
> group check. Reason is that this happens to have some affected devices, and
> these devices have no valid iommu_group (because they are not bound to vfio-pci
> hence nobody allocates noiommu group for them). So when hot reset info loops
> such devices, it failed with -EPERM. Is this expected?

Hmm, I didn't recall that we put in such a limitation, but given the
minimally intrusive approach to no-iommu and the fact that we never
defined an invalid group ID to return to the user, it makes sense that
we just blocked the ioctl for no-iommu use.  I guess we can do the same
for no-iommu cdev.

BTW, what does this series apply on?  I'm assuming[1], but I don't see
a branch from Jason yet.  Thanks,

Alex

[1]https://lore.kernel.org/all/20230327093351.44505-1-yi.l.liu@intel.com/

