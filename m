Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B05B1808
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Sep 2022 11:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA06010E9CA;
	Thu,  8 Sep 2022 09:08:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C7910E9BB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Sep 2022 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662628110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAQa4isXcnz/CqAw9Or0VLGVMQujP+L3g/TlUU+ZO2I=;
 b=diCygZpyCdafwuD7e2PmbVE84zFzO+88akNjZeHQLvAzYyewPRiViBka9dsqGnitxPb45j
 hXUeDvM00U1tEUx7pyrUfZmYoA9/n77eIv3GKw5NCofbIOSCXuYy4zMji5BHPlgrQ/j3nd
 23x3YYHlTTIMNupYFdMwjRbTMT6rs7g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-4d0qbDl5OKC79l8iSX_E_A-1; Thu, 08 Sep 2022 05:08:29 -0400
X-MC-Unique: 4d0qbDl5OKC79l8iSX_E_A-1
Received: by mail-qt1-f200.google.com with SMTP id
 cj19-20020a05622a259300b003446920ea91so14010264qtb.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 08 Sep 2022 02:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=AAQa4isXcnz/CqAw9Or0VLGVMQujP+L3g/TlUU+ZO2I=;
 b=uTp95FySVcZer3JzUkgeLmKgApUFry+IPjpRNbKid5HdDo6y4kgPtfKQx5FxCzJYOJ
 T6A57kM8kefzvo0K6CU5wFofIoZuh1Jm1iLjCtRQTUTs+Kea8vzbkMLj68jzygmTCO1k
 VLeIba8ZORUL18dcNEM6N2bm4dkIxnAbSwbUgqmrbLvSr6hpGKrazqgTNEQ1F8WmdVvj
 dQ6QWrzXjhPNk9dBNZRU0yaL4eaItKvPyEDPfhXX51k7zJ7kFoNffjrQVnM5gaJ13xOE
 h3JJNW3H2TpNycyi4pcSHA2b+iK7v6OjZoZa/GeJECeMUjvYFAhAqvvh3EMPFuJRaxa/
 O/Zw==
X-Gm-Message-State: ACgBeo201glbwEiRlp2yacmZFT90RQ6zPRsDNg5H5rQsv19kY4+wiMk2
 LN2bt+/u6eSDl8nh3w5uQKmTweg8fcCS0PPyZB2Ge3fWuTAuhU6vCmSB54fDAuxYTgZFPZjCuiC
 v6pp6VMO/VT3Gigc8g2RKzFKF+O3RGTFlIw==
X-Received: by 2002:ac8:58d2:0:b0:344:5698:a2e8 with SMTP id
 u18-20020ac858d2000000b003445698a2e8mr7273776qta.392.1662628109333; 
 Thu, 08 Sep 2022 02:08:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7WJ3e3rc/rDtFXXj3tevRpC3CGaundZvbMDIERUF76jhlMbQUf5uKHf0h+nvyWes4AGw7qCA==
X-Received: by 2002:ac8:58d2:0:b0:344:5698:a2e8 with SMTP id
 u18-20020ac858d2000000b003445698a2e8mr7273747qta.392.1662628109111; 
 Thu, 08 Sep 2022 02:08:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r3-20020ae9d603000000b006af0ce13499sm16489061qkk.115.2022.09.08.02.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 02:08:27 -0700 (PDT)
Message-ID: <527db896-b064-2f02-ae96-6525496176c4@redhat.com>
Date: Thu, 8 Sep 2022 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
 <90862543-9343-7389-a1ff-be9a011be64e@redhat.com>
 <BN9PR11MB527639DCC5706ADA8F0519D38C409@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <BN9PR11MB527639DCC5706ADA8F0519D38C409@BN9PR11MB5276.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Reply-To: eric.auger@redhat.com
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Kevin,

On 9/8/22 08:19, Tian, Kevin wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Thursday, September 8, 2022 3:28 AM
>>> +/*
>>> + * Alloc and initialize vfio_device so it can be registered to vfio
>>> + * core.
>>> + *
>>> + * Drivers should use the wrapper vfio_alloc_device() for allocation.
>>> + * @size is the size of the structure to be allocated, including any
>>> + * private data used by the driver.
>>> + *
>>> + * Driver may provide an @init callback to cover device private data.
>> nit: this comment may rather relate to the vfio_init_device function
> Yes but vfio_init_device() is used only by ccw and presumably will be
> abandoned once ccw fixes its life cycle mess. Given that I prefer to leaving
> the comment here to be noted by broader users.

OK

Eric
>
>> Besides
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
> Thanks and other comments adopted. 

