Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD06D7C49
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 14:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EC610E8A2;
	Wed,  5 Apr 2023 12:20:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2970210E8A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680697215;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erf4UNO3fNS9mv22A+JjIcgyW6S0YpQ5DUbNcYGvtZ0=;
 b=Vv4bu1gFUdPCE0hvzS7JGgrxDvPYvsck+PahetuwUkXrcTNPKiWOu+gYzURj+YIKO9beXf
 O9J3ohWquh5LkXs/I4PLyyjDJFkDzf6gIwYrgmtAQ4fnn0JL0g2oSbESDjfSE3nWRrxJsf
 9xWA4dC1BVG5YJD/TZ27Le5o+Oirz+A=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Uoyf0DhaMXq2Yg2fjJF6HQ-1; Wed, 05 Apr 2023 08:20:14 -0400
X-MC-Unique: Uoyf0DhaMXq2Yg2fjJF6HQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 v10-20020a05622a130a00b003e4ee70e001so18043484qtk.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 05:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680697213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=erf4UNO3fNS9mv22A+JjIcgyW6S0YpQ5DUbNcYGvtZ0=;
 b=qyeDCjzXOPPfSJVpY0HcjUilWi/gYFyR+6NzEGP33bn+dYm4+Je8XucT4+MjpKlexU
 8p7YZhl+sjkZ8khGjbDlLMmU56qCaJzM2SPPVlzbmnWa1qKUycV7AGZ2mh7PRQfFZIWn
 t6a1md/InZUNgGpLGMGH78gJh6QvwI9VQ4P5VlWziB0hh/VrxtusYGsVZtZsxO8FV0j7
 JqqsbeCG9/Ab/wkM6F6bQe0mXqj76r5qNwSnJvlRI2+nJnj7EWABS2nciYP6sAr1xa55
 zAy6+V8fS28QYIFYI4tyVsifkhlypk5h1WWkQ5wbPmcPDb00Yw0tkFOIIhd6HoOFOn5H
 ILwA==
X-Gm-Message-State: AAQBX9eSzKQfRJAehPtJAmBw0cG2wL1upuWLdtBJzhM71zB39SB58XGo
 kNXHxcUB0jFmT2/7bLkvEbF6WvF8ZfNIZ9WLUJfaTX5chBnWrTFIj6NKQUgrEpn5NlqcfRHAIfB
 nOuL+Jbexvjtgh9U/kHQMN3wNAz1wyq+tJg==
X-Received: by 2002:a05:6214:e6e:b0:56e:f9a2:1aff with SMTP id
 jz14-20020a0562140e6e00b0056ef9a21affmr7785862qvb.35.1680697213745; 
 Wed, 05 Apr 2023 05:20:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350YufqLIW4kTurRmpoStx2boSEtRlVeqT/uSnU6kdOvvAZfwzmAklgvT9NeSB7a7bO7FCPIIzA==
X-Received: by 2002:a05:6214:e6e:b0:56e:f9a2:1aff with SMTP id
 jz14-20020a0562140e6e00b0056ef9a21affmr7785819qvb.35.1680697213472; 
 Wed, 05 Apr 2023 05:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a0cc208000000b005dd8b9345a2sm4164191qvh.58.2023.04.05.05.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 05:20:12 -0700 (PDT)
Message-ID: <f90410e0-96f1-9719-9d83-f7caa5992d6d@redhat.com>
Date: Wed, 5 Apr 2023 14:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 03/25] vfio: Remove vfio_file_is_group()
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401151833.124749-1-yi.l.liu@intel.com>
 <20230401151833.124749-4-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401151833.124749-4-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, yi.y.sun@linux.intel.com, kvm@vger.kernel.org,
 mjrosato@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org,
 cohuck@redhat.com, xudong.hao@intel.com, peterx@redhat.com,
 yan.y.zhao@intel.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com, yanting.jiang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Yi,

On 4/1/23 17:18, Yi Liu wrote:
> since no user of vfio_file_is_group() now.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/vfio/group.c | 10 ----------
>  include/linux/vfio.h |  1 -
>  2 files changed, 11 deletions(-)
>
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index ede4723c5f72..4f937ebaf6f7 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -792,16 +792,6 @@ struct iommu_group *vfio_file_iommu_group(struct file *file)
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_iommu_group);
>  
> -/**
> - * vfio_file_is_group - True if the file is a vfio group file
> - * @file: VFIO group file
> - */
> -bool vfio_file_is_group(struct file *file)
> -{
> -	return vfio_group_from_file(file);
> -}
> -EXPORT_SYMBOL_GPL(vfio_file_is_group);
> -
>  bool vfio_group_enforced_coherent(struct vfio_group *group)
>  {
>  	struct vfio_device *device;
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index d9a0770e5fc1..7519ae89fcd6 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -264,7 +264,6 @@ int vfio_mig_get_next_state(struct vfio_device *device,
>   * External user API
>   */
>  struct iommu_group *vfio_file_iommu_group(struct file *file);
> -bool vfio_file_is_group(struct file *file);
>  bool vfio_file_is_valid(struct file *file);
>  bool vfio_file_enforced_coherent(struct file *file);
>  void vfio_file_set_kvm(struct file *file, struct kvm *kvm);

