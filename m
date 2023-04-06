Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16BF6D9DB4
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Apr 2023 18:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B749410E2A2;
	Thu,  6 Apr 2023 16:45:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7AF10EC62
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Apr 2023 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680799498;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cj1qdraUDIqQ4wyinXOunxUjzkj6NEpe76it1VNYXg4=;
 b=EiNpaJsegCsL1vzX3Qdt1gMrLkdygUFpx0uScmzX8nx0l87df3nTguyf0s3GwNxtqapHwA
 Sp6s2Kg5tE/PKzL2ByNlrvEmAxP8M20h3Cx1ed5eASFY6/EjzK7CkNN0j9u7yoxthJfGJ6
 BqS/Wz5V88/8KgjV9fUvTClJBFcQxKA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-Uh7VBqNVM5aAdI-t3WoPHA-1; Thu, 06 Apr 2023 12:44:55 -0400
X-MC-Unique: Uh7VBqNVM5aAdI-t3WoPHA-1
Received: by mail-qk1-f198.google.com with SMTP id
 r197-20020a37a8ce000000b0074a59c12b10so4024993qke.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 06 Apr 2023 09:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680799495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cj1qdraUDIqQ4wyinXOunxUjzkj6NEpe76it1VNYXg4=;
 b=xpZ0XSp9GLYq7yIdQuzbEW0RuFkgiebfYU5C50dpnLdQEm1OxlFhw9hPstezPz+FQU
 VTudcr+SigHcDI3OaWCzmL6qK1627dNcFAqMELZJBQtFV4EBVfzP3e+Z1WbbytIUOzCp
 jjAFdEtT2g9FJGbARsTMnORGpVmpBwQ2VgZlewCKS/86yvG7mudFO79b8A+ELGIs7IEa
 BJfRPinBGBaPVo9ihrlnW2qvF1M6hsIZnLIeG7EQLT+nSQe91/9ke24E3zF9Wje+E4TQ
 suqB4197ZOY0WfWvMKvxwVUslkFBnvI7Y7yX1ndzIYn59g2dg4TO03jfcGubJ7HriQ6E
 Nyjg==
X-Gm-Message-State: AAQBX9fATjjikOE66gq1bj7AweK2kYBf+mJzDlm+W4T7HHOxe16rrsOw
 WxUITEssRzS4Dn93Malt8nWbAEzK0tfd8W0HHiiCbyUAlmGfygC3DhbSlCVCgYkiCOnWi0jsa+J
 7ei5Hk1t6k5NKiot18izzwD+uT0pJIBX9vg==
X-Received: by 2002:ac8:59ca:0:b0:3b8:2cf6:4bd6 with SMTP id
 f10-20020ac859ca000000b003b82cf64bd6mr12365679qtf.57.1680799494847; 
 Thu, 06 Apr 2023 09:44:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZSS7EeAJwH0ALWV4bKpdOrqM0X6ZUGe2iW062njbJkUl7t6KGbG/PG3FNAG8z/sy0GF4g7UQ==
X-Received: by 2002:ac8:59ca:0:b0:3b8:2cf6:4bd6 with SMTP id
 f10-20020ac859ca000000b003b82cf64bd6mr12365645qtf.57.1680799494556; 
 Thu, 06 Apr 2023 09:44:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac846c7000000b003e3921077d9sm532848qto.38.2023.04.06.09.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 09:44:53 -0700 (PDT)
Message-ID: <dbf2057d-b715-f32d-454a-e4953921d232@redhat.com>
Date: Thu, 6 Apr 2023 18:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 10/25] vfio: Make vfio_device_open() single open for
 device cdev path
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401151833.124749-1-yi.l.liu@intel.com>
 <20230401151833.124749-11-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401151833.124749-11-yi.l.liu@intel.com>
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
> VFIO group has historically allowed multi-open of the device FD. This
> was made secure because the "open" was executed via an ioctl to the
> group FD which is itself only single open.
>
> However, no known use of multiple device FDs today. It is kind of a
> strange thing to do because new device FDs can naturally be created
> via dup().
>
> When we implement the new device uAPI (only used in cdev path) there is
> no natural way to allow the device itself from being multi-opened in a
> secure manner. Without the group FD we cannot prove the security context
> of the opener.
>
> Thus, when moving to the new uAPI we block the ability of opening
> a device multiple times. Given old group path still allows it we store
> a vfio_group pointer in struct vfio_device_file to differentiate.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  drivers/vfio/group.c     | 2 ++
>  drivers/vfio/vfio.h      | 2 ++
>  drivers/vfio/vfio_main.c | 7 +++++++
>  3 files changed, 11 insertions(+)
>
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index d55ce3ca44b7..1af4b9e012a7 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -245,6 +245,8 @@ static struct file *vfio_device_open_file(struct vfio_device *device)
>  		goto err_out;
>  	}
>  
> +	df->group = device->group;
> +
>  	ret = vfio_device_group_open(df);
>  	if (ret)
>  		goto err_free;
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index b2f20b78a707..f1a448f9d067 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -18,6 +18,8 @@ struct vfio_container;
>  
>  struct vfio_device_file {
>  	struct vfio_device *device;
> +	struct vfio_group *group;
> +
>  	bool access_granted;
>  	spinlock_t kvm_ref_lock; /* protect kvm field */
>  	struct kvm *kvm;
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 6d5d3c2180c8..c8721d5d05fa 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -477,6 +477,13 @@ int vfio_device_open(struct vfio_device_file *df)
>  
>  	lockdep_assert_held(&device->dev_set->lock);
>  
> +	/*
> +	 * Only the group path allows the device opened multiple times.
> +	 * The device cdev path doesn't have a secure way for it.
> +	 */
> +	if (device->open_count != 0 && !df->group)
> +		return -EINVAL;
> +
>  	device->open_count++;
>  	if (device->open_count == 1) {
>  		ret = vfio_device_first_open(df);

