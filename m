Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876EA5B433B
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 10 Sep 2022 01:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D863D10E1C2;
	Fri,  9 Sep 2022 23:53:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5066B10E1C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Sep 2022 23:53:14 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id w4so2457715qvp.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 09 Sep 2022 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=I7AGr5kxvD7L8BGImkaiYYIcWYTyuHALX3Uwn5SFGes=;
 b=dABIJEmzczJA9TeUEwB/vqlw1on+BNexewwg9hQHdtE1Pf+5Eir7ZuRo5Ra74CBI2Y
 mcA+UH3eeO9aAd0QqE0L7SFCTjpphtpc0ELtMYBKyyRw1a/HWDzHyUcOactrzkgR2sl3
 L0nOmencTRW6FHXiEoY9iZZ+c/WYo/U0AzzN4UAFPlTI1iRVRUWqtRTHaf8sCXXZzJnf
 NJL3l99mu6NE5Asx87J+/QD6IeeyB3qXivdFsvkAKE6TbTRWix12Dqc9T+JmjOGbnts9
 4TFjGIVIDOrRXIamT7vOV1TzgaehJPaax4ZVZ8nlHpjlkRagg2W3Kahrivj4XNmSdY7D
 YIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=I7AGr5kxvD7L8BGImkaiYYIcWYTyuHALX3Uwn5SFGes=;
 b=36wfv6Er1jbfvqcabCIapxRkWURqueqeKQEf1xb+WRPP+MWJ9FxCHPJRKomqFtr3CX
 KTvxYvYLEFqEltAm7c896QxQ5S9v9rVTilYIReFai+MzUjYk+749P1QwRP8Z+jXOVJQ5
 hxElgnyESegSg1FB7WAG+uwhCfi8Iab9ItFt/hj7Ivb5SD1WGDJAkJcRSFByDLY5dqy+
 sKGaLC8KgVxxMI+v7n1TvLETrfwCeHQXSKCpq5boDXOGx1E5GWxNzATjlk8j6HkGxCyM
 dwwaQAkvcGZRnOKymIC9d6fcn336gv3ZXE+iJA5V6/e953FmGa1huz21uxcowpg61bkR
 bhgA==
X-Gm-Message-State: ACgBeo2/EOhI/UZMoUTi/hSZA2lHm7ee4s3Q9hHSKWbCEEL/Mmx6cxk2
 yQkGwYermMb8UAbXtjtUGcEcjw==
X-Google-Smtp-Source: AA6agR5hWM2GJ5zXaAdZz8/5jyfYnTB6f4lRkH4YbMaWcByENpIrNcfVlyo+HaeUh7LK3d+xbRkfaQ==
X-Received: by 2002:a0c:f445:0:b0:4a6:9f4a:9a66 with SMTP id
 h5-20020a0cf445000000b004a69f4a9a66mr14581963qvm.65.1662767593396; 
 Fri, 09 Sep 2022 16:53:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a05622a5a9000b00342fc6a8e25sm1348798qtb.50.2022.09.09.16.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 16:53:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oWno8-00A0GS-4S;
 Fri, 09 Sep 2022 20:53:12 -0300
Date: Fri, 9 Sep 2022 20:53:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Message-ID: <YxvR6PHywJCTgp3z@ziepe.ca>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-2-kevin.tian@intel.com>
 <acbaf0f2-91d4-3eae-5716-244893ca34c7@linux.intel.com>
 <BN9PR11MB5276E41114EEE687975C698F8C439@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276E41114EEE687975C698F8C439@BN9PR11MB5276.namprd11.prod.outlook.com>
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
 Ethan Zhao <haifeng.zhao@linux.intel.com>,
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

On Fri, Sep 09, 2022 at 08:42:25AM +0000, Tian, Kevin wrote:

> I think it's quite common to have an alloc() helper initialize refcount, e.g.
> vfio_group_alloc() both initialize its user refcount and also call
> device_initialize()  to gets kref initialized. Similar example in
> ib_alloc_device(), etc.

Right, it is quite a good/common pattern to have an allocation function
return a refcount to the caller.

I don't know of any naming standard for this however.

Jason
