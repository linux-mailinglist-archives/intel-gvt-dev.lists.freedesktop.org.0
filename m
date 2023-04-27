Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C6D6F0C18
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 20:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C74F10E396;
	Thu, 27 Apr 2023 18:43:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07BD10E396
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682621010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+PdhbKN3Hq6ATKU2FwFReGd5PqSlgE93t3FlWgzR0mA=;
 b=WZJ+tfAy/9Miccwu+LctYqsHJZZYJgXFZRI5CJ5a63mu5MbJTz2wZUeoOCjZqwJnuemGLt
 Y2x/SOqMPQcNlanEV9VfvOjqpR6GLaES4pca3jKSjgr1pOE/Giu6Zy82Nrp268CV3bLLaw
 ys0u6hOK8BkbWY7KsRSZRUAI0UAhEXc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-gSGBE_cHOZKRz4onQQfCPg-1; Thu, 27 Apr 2023 14:43:29 -0400
X-MC-Unique: gSGBE_cHOZKRz4onQQfCPg-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-32aff21222eso138137545ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 11:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682621008; x=1685213008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PdhbKN3Hq6ATKU2FwFReGd5PqSlgE93t3FlWgzR0mA=;
 b=J61jqCE9dveCZn5XL6IVCXRUXlU8E66xd+wsjmuUfyKm4IR2wJSEKzHyDhINPUc8g4
 FeGUuc7AwaaFZzCpfg6hVOtp8RMFimcWTeQI5cVThQlbC6OW/1GbHqe0uDkrplmloIQ2
 NgINtU33MgHRKzxDeK6kGG9bhzVNujUbtSx/5TwRyH4nCTuaW9FpNdr/lL9k4/ZqEFGv
 KUmj4nnZdunrl+22cxetBaKD1Pm2yd6c3+Cp3g/NaK4xji8J7d4qm4df+ca+uEhY8Y2t
 k3jN9qXIJlVBPQhZd2P+BjBPBBUMz6SCuUdSrl+CsycEBg7RMBut1hX3Cc2Dd9K7GYz7
 Pq3w==
X-Gm-Message-State: AC+VfDxysSSrxBqfAvBVgG8uBwvWvsK69QeXlZ8cvo2xejX4bKv9HIQ5
 Vvda4AuyCRuFcyFpA+6EXUvAESdjN8tSYT60iQdnabgOCqcXJvg4jnHtOw9a4ZGQC16m8pT78uV
 jKdlp2yzbXyrjBA9Ke8MLwHRhqmYgdF66ew==
X-Received: by 2002:a92:2807:0:b0:32a:b78f:e7d5 with SMTP id
 l7-20020a922807000000b0032ab78fe7d5mr1938803ilf.27.1682621008595; 
 Thu, 27 Apr 2023 11:43:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UUI5T89n2E0LlOJtzG6NmTPZsvmV0AM+vihZgbau2Vo7OjUcOrWffld+4o1Eu4YBc56YFUA==
X-Received: by 2002:a92:2807:0:b0:32a:b78f:e7d5 with SMTP id
 l7-20020a922807000000b0032ab78fe7d5mr1938791ilf.27.1682621008333; 
 Thu, 27 Apr 2023 11:43:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056638148800b0040fa726ff04sm5845305jak.45.2023.04.27.11.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 11:43:27 -0700 (PDT)
Date: Thu, 27 Apr 2023 12:43:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 5/9] vfio: Mark cdev usage in vfio_device
Message-ID: <20230427124326.20621b3a.alex.williamson@redhat.com>
In-Reply-To: <20230426145419.450922-6-yi.l.liu@intel.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-6-yi.l.liu@intel.com>
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
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 jgg@nvidia.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 26 Apr 2023 07:54:15 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> Use it to differentiate whether to report group_id or dev_id in revised
> VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. Though it is not set at this
> moment introducing it now allows us to get hot reset ready for cdev.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  include/linux/vfio.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 4ee613924435..298f4ef16be7 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -63,6 +63,7 @@ struct vfio_device {
>  	bool iommufd_attached;
>  #endif
>  	bool noiommu;
> +	bool cdev_opened;
>  };
>  
>  /**
> @@ -140,6 +141,12 @@ int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
>  	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
>  #endif
>  
> +static inline bool vfio_device_cdev_opened(struct vfio_device *device)
> +{
> +	lockdep_assert_held(&device->dev_set->lock);
> +	return device->cdev_opened;
> +}

The lockdep test doesn't make much sense here, the method of opening
the device can't change from an ioctl called on the device, which is
the only path using this.  If there needs to be a placeholder for
future code, it should probably statically return false here and we can
save adding the structure field and locking checks based on the
semantics of how the field is actually used later.  Thanks,

Alex

