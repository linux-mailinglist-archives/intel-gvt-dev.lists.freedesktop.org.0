Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFF6D703F
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 00:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A49110E2BD;
	Tue,  4 Apr 2023 22:45:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB7910E2BD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 22:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680648316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqCHmmroLr/ysooa2PnqjjEGm/oSk+1xFWZwtedU+d8=;
 b=J0BUKRIJRhyIjVicMGY4RHm3CJfhZUfblzwgOSC2YoO2zxNtHty2B5jYsjtH199wmWcakd
 zySL4cEpFSsw7WoYhCxVoBpIPovBBCmUSS7PiT2iHoCvVZpw2/RpvbYvoPPAltRHpQcgfj
 n/KB0b/2c7QXlymQ1AB11HYz/3hoU2A=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-MBPGGDOtN6S9Ux1NtWQxXw-1; Tue, 04 Apr 2023 18:45:15 -0400
X-MC-Unique: MBPGGDOtN6S9Ux1NtWQxXw-1
Received: by mail-io1-f72.google.com with SMTP id
 i189-20020a6b3bc6000000b00758a1ed99c2so20908109ioa.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 15:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680648314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqCHmmroLr/ysooa2PnqjjEGm/oSk+1xFWZwtedU+d8=;
 b=0npkLoZVjV5qqwAGIGz/O+Knt3iSY/M25eA0ejWmWPwrTomwtsk8FewA68g63ZTKJX
 7UsLy6XVfBO1qD2odn7UCEWE+MLYXO4RV1cQioYcctY/cL3cUjIdxy7o58q56iJRWHRi
 3kxBgj3sOFuy31naNyK/SbSNuF2Pqey1eXI7BKmOaDSSPxIxBat0V7Qdqme4UQtHCak5
 BjAkKM0iRUeknvlMbaw/t2LgZX+VxmBelG37rzjbw29r+OUee1SEtAWUTfy1qnIF4j2x
 Mi283pNqiO98FqlCE+Pco/CEbobP7UcimTwMSkBqRZSMeZ4j9QLgFJEH1pN1It8AzUGd
 wh0g==
X-Gm-Message-State: AAQBX9eQPIyB0vXWmuY75xxke/tf36xu9JtIwF5/pHPZBfaB46k4Evar
 ZV0fYiV4IsOWEGaxFzN+w25FGKAXDr8eb13XDIVqVsom9HQIBdK0YfjDMUhoqWyf6clX0FLy60Y
 qSDP0/WVxjQ4lGlz3QKiWbUa5g41X86ZW3A==
X-Received: by 2002:a5d:9284:0:b0:75e:7db3:f515 with SMTP id
 s4-20020a5d9284000000b0075e7db3f515mr4647293iom.19.1680648314762; 
 Tue, 04 Apr 2023 15:45:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350btE39tUqyxr8lCIfc8BBFYrDXLBwPQ03v/gOEC6MT6SW8i/qlQoIFkp32c7zyxF7EqZWRxzA==
X-Received: by 2002:a5d:9284:0:b0:75e:7db3:f515 with SMTP id
 s4-20020a5d9284000000b0075e7db3f515mr4647266iom.19.1680648314517; 
 Tue, 04 Apr 2023 15:45:14 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f4-20020a02a104000000b0040b4c29010fsm1367898jag.140.2023.04.04.15.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 15:45:14 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:45:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 16/25] iommufd/device: Add iommufd_access_detach() API
Message-ID: <20230404164512.37bca62e.alex.williamson@redhat.com>
In-Reply-To: <20230401151833.124749-17-yi.l.liu@intel.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
 <20230401151833.124749-17-yi.l.liu@intel.com>
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat,  1 Apr 2023 08:18:24 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> Previously, the detach routine is only done by the destroy(). And it was
> called by vfio_iommufd_emulated_unbind() when the device runs close(), so
> all the mappings in iopt were cleaned in that setup, when the call trace
> reaches this detach() routine.
> 
> Now, there's a need of a detach uAPI, meaning that it does not only need
> a new iommufd_access_detach() API, but also requires access->ops->unmap()
> call as a cleanup. So add one.
> 
> However, leaving that unprotected can introduce some potential of a race
> condition during the pin_/unpin_pages() call, where access->ioas->iopt is
> getting referenced. So, add an ioas_lock to protect the context of iopt
> referencings.
> 
> Also, to allow the iommufd_access_unpin_pages() callback to happen via
> this unmap() call, add an ioas_unpin pointer, so the unpin routine won't
> be affected by the "access->ioas = NULL" trick.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/iommu/iommufd/device.c          | 76 +++++++++++++++++++++++--
>  drivers/iommu/iommufd/iommufd_private.h |  2 +
>  include/linux/iommufd.h                 |  1 +
>  3 files changed, 74 insertions(+), 5 deletions(-)

Does this need to go in via iommufd first?  There seems to be quite a
bit of churn in iommufd/device.c vs the vfio_mdev_ops branch (ie. it
doesn't apply). Thanks,

Alex

