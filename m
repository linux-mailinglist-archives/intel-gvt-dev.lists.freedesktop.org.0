Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2186D6E85
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 23:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3332410E7B0;
	Tue,  4 Apr 2023 21:00:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D1810E7B9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680642038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUlNSkHN+zXMVEgYFwpXLf7eXmZqDjBFuuY+21ymQM8=;
 b=QNXRjxDDVb8WnLfJzpLtcHe9kDPw8/ELQwrFT5e3ilaHTMscvOlkSVw16gcyCI8S21TKrI
 VeWxOX6cqsZOanftzA2xJ2EmhmzbmMm6FAR7SyGNYw4G5ihuzN/W2ez1GUPJTeKTeORA6m
 pRFfIRWDw4HXINHMPHQALeuWUShDVDY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-prTI_sOGMs6OpjcGYt1z3A-1; Tue, 04 Apr 2023 17:00:37 -0400
X-MC-Unique: prTI_sOGMs6OpjcGYt1z3A-1
Received: by mail-io1-f69.google.com with SMTP id
 l7-20020a0566022dc700b0074cc9aba965so20724211iow.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 14:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680642036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUlNSkHN+zXMVEgYFwpXLf7eXmZqDjBFuuY+21ymQM8=;
 b=fSoqG2IVn4taUn8mrl6j0rKtwV7lH9DxJhlPgpiIyTHYidc22VXlGpmjbhi0g8Jp41
 K6JS8Qn8j1RgsPY7bMaxtQ3b86LxHoICi7DkQSaub5YWmFHhMtU72IGY0jUn/Bu3w0GZ
 z2owcriGR3WQp/kzUFs8q4q45CVFbRpQITSF7qdJd92BTAMCWZGPmPnGkyheRhGVO1sX
 2Y0AsZQdQXSAOgwlYWRS/uz3yzWUENu/dCnQsG7B9ARRWHvm5TU3Zjy+pnF9lxHwrEau
 hYR8BVJXXkeAGcaVD+fJlM5qX2Un9Ezh7gv+7kSPfCVqBEgLp/RreKOaj2/+vUYQmtcP
 6ysw==
X-Gm-Message-State: AAQBX9fxza7CoNpMvcJuSiuhv/jWXbQqklpd1Idjomh5L7yK0FLK8hw8
 pdsfjtNx+qY325FUbQLl8vwxKhP745e8i5XzZ+cX4ALpBTrOWGCOSZYsT7dL2La35po5Mvjfcs7
 9L+1an0ZXoJvSgm4gGubhbv5l4HGa+ALZmQ==
X-Received: by 2002:a05:6602:2e05:b0:759:410c:99b6 with SMTP id
 o5-20020a0566022e0500b00759410c99b6mr565938iow.2.1680642036468; 
 Tue, 04 Apr 2023 14:00:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBxWm4a3+LGUk3NVVLqCociOCxX0vWRo5d6ZJ4vSC6uL/zuJZ3VkObdr8SZMcgBOlbc8NPLw==
X-Received: by 2002:a05:6602:2e05:b0:759:410c:99b6 with SMTP id
 o5-20020a0566022e0500b00759410c99b6mr565895iow.2.1680642036246; 
 Tue, 04 Apr 2023 14:00:36 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m41-20020a026d29000000b003c4d71489aasm3548333jac.6.2023.04.04.14.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 14:00:35 -0700 (PDT)
Date: Tue, 4 Apr 2023 15:00:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 11/12] iommufd: Define IOMMUFD_INVALID_ID in uapi
Message-ID: <20230404150034.312fbcac.alex.williamson@redhat.com>
In-Reply-To: <20230401144429.88673-12-yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-12-yi.l.liu@intel.com>
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

On Sat,  1 Apr 2023 07:44:28 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> as there are IOMMUFD users that want to know check if an ID generated
> by IOMMUFD is valid or not. e.g. vfio-pci optionaly returns invalid
> dev_id to user in the VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. User
> needs to check if the ID is valid or not.
> 
> IOMMUFD_INVALID_ID is defined as 0 since the IDs generated by IOMMUFD
> starts from 0.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  include/uapi/linux/iommufd.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 98ebba80cfa1..aeae73a93833 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -9,6 +9,9 @@
>  
>  #define IOMMUFD_TYPE (';')
>  
> +/* IDs allocated by IOMMUFD starts from 0 */
> +#define IOMMUFD_INVALID_ID 0
> +
>  /**
>   * DOC: General ioctl format
>   *

If allocation "starts from 0" then 0 is a valid id, no?  Does allocation
start from 1, ie. skip 0?  Thanks,

Alex

