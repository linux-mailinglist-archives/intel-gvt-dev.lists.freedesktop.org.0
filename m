Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948746954AB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Feb 2023 00:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1BD10E78B;
	Mon, 13 Feb 2023 23:21:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC8D10E7A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Feb 2023 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676330515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PalnaCa+45zmfRne4PsaOrNHcKeNAHWEUJgujCCpms4=;
 b=fpLnoggxeCuQBlyblQwikOyp1o5A44uqB9/54QFsyVZ9X4FAhXvenzrkz9uQlssUYdAqPR
 fCd2gKHslv1bT9jeTEH0L2azbzfCdoNnQLGB0f+aNtNMvuuDFI7jxfqHAgNEmFxR2qOiFt
 KW5sAIFUoOBlTJj3mqV8lPnK/FxeDZM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-roslNH-fO3KzTWep8vhw9A-1; Mon, 13 Feb 2023 18:21:54 -0500
X-MC-Unique: roslNH-fO3KzTWep8vhw9A-1
Received: by mail-il1-f197.google.com with SMTP id
 s12-20020a056e021a0c00b0030efd0ed890so10202969ild.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Feb 2023 15:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PalnaCa+45zmfRne4PsaOrNHcKeNAHWEUJgujCCpms4=;
 b=fii18haRd/Z2784EZnA825B2ZB4UrpvtXM+2f16RKIqdm6Id9kDrEBzaQvTCYREWlz
 Ek8ev6CDsMAQ65F/A9LZdx5JkMRTiqFAp7WYs8bPCO68uk3sMkpH1iiM3j00cdrGv5aN
 Q7+aRuXly4gvvGfNm/H7VRw+zlYIT9wX1aKTfXEIDpJYMNdXq7kv8YoDN7zxHxoIJW6W
 nyn3M0KF+DkOuC9pTlgu86r8/tlDT8BnAetse0PxwARA5YdBUi6+7gYZB7DwilIlBMsb
 CtKtiR3VOym6QaOvfu6FW8FzdPyhRm23Kp2e361NzQ5jO9IjHmjJ7fC5x86IjN1KDrn1
 ycPw==
X-Gm-Message-State: AO0yUKVBsdJfC4OsEeHU4h2SXWzagn0TNNad0flxudiXvobwjHrYaE9L
 PipcNH6nF6mz5JCRHxcycS7sudGOnH44fOEiafKLyoUpHQS/x0UwrGmhsI1WtNXuONfHTDbr4bK
 Hbkb3hRrVrcuV+zaTxbsXiECrtd5QjaXvNA==
X-Received: by 2002:a05:6602:424e:b0:707:85b3:5dbb with SMTP id
 cc14-20020a056602424e00b0070785b35dbbmr247725iob.6.1676330513399; 
 Mon, 13 Feb 2023 15:21:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9iQtjrUB3qKlMbOa//wqF8gVTJyU2h1pAAMQbJhVobtNII43EJPHV4Swgm5qp296ZsP/lafg==
X-Received: by 2002:a05:6602:424e:b0:707:85b3:5dbb with SMTP id
 cc14-20020a056602424e00b0070785b35dbbmr247701iob.6.1676330513164; 
 Mon, 13 Feb 2023 15:21:53 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t66-20020a6bc345000000b00704878474c7sm4626794iof.53.2023.02.13.15.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 15:21:52 -0800 (PST)
Date: Mon, 13 Feb 2023 16:21:50 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 03/15] vfio: Accept vfio device file in the driver
 facing kAPI
Message-ID: <20230213162150.7626055b.alex.williamson@redhat.com>
In-Reply-To: <20230213151348.56451-4-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213151348.56451-4-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 peterx@redhat.com, suravee.suthikulpanit@amd.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com, jgg@nvidia.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 13 Feb 2023 07:13:36 -0800
Yi Liu <yi.l.liu@intel.com> wrote:

> This makes the vfio file kAPIs to accepte vfio device files, also a
> preparation for vfio device cdev support.
> 
> For the kvm set with vfio device file, kvm pointer is stored in struct
> vfio_device_file, and use kvm_ref_lock to protect kvm set and kvm
> pointer usage within VFIO. This kvm pointer will be set to vfio_device
> after device file is bound to iommufd in the cdev path.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/vfio/vfio.h      |  2 ++
>  drivers/vfio/vfio_main.c | 51 ++++++++++++++++++++++++++++++++++++----
>  2 files changed, 49 insertions(+), 4 deletions(-)

This subtly changes the behavior of the vfio-pci hot reset functions
without updating the uAPI description or implementation to use less
group-centric variables.  The new behavior appears to be that cdev fds
can also be passed to prove ownership of the affected set of devices
for a hot reset, but this probably needs to be examined for gaps.
Thanks,

Alex

