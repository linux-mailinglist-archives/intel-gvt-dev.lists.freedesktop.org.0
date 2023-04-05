Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07576D765A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 10:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D1D10E870;
	Wed,  5 Apr 2023 08:08:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7533810E870
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680682081;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8U/LZFacKxvEJhXlhZDIRP53Ufg1yjOKWtnSX+iUULI=;
 b=DI6/9raUpEE2wQ4nCrLvX7xX1x52duzzdlVdlUvq9k9+D617noO0kCrO5wgKbSBQqX5MNP
 BXihdRZq0IQ428LdO4fcd48ra9xwOxgmsPQPVVAa381h9JhIEhj/1YRICnp+/2Oi2xRsTE
 b9o1D1miiXqsJnRzSeK540THeXMYNG0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-fiCfAOpTOmiXek3-0i1BHw-1; Wed, 05 Apr 2023 04:07:58 -0400
X-MC-Unique: fiCfAOpTOmiXek3-0i1BHw-1
Received: by mail-qk1-f200.google.com with SMTP id
 b142-20020ae9eb94000000b007486a8b9ae9so13223608qkg.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 01:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680682078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8U/LZFacKxvEJhXlhZDIRP53Ufg1yjOKWtnSX+iUULI=;
 b=Bv63o4ckghK7MHRAW88D6liWPH+B9B22/UcoUiqjGoqrbcLbPJ19lBvjvo8BW2xwgW
 uEFKD3vdivCXXQz2tBaQYN6wWvgYKti9ppuEY0F9ESiSg+HQStParoL+VhewFfcoKX4q
 P2bE3mQ4iqmsnElF5cfF/OwicdXItPz1AwHPqVd7IuZ0Wu8YIXu23J7K8En/uyFhRujb
 aYdjDlMA2BePKq4h5A8uynNtU3D9RjDYh4ogDJKAC6Q6WUyHSmEu/tVzSV5pAVnxJxyr
 asIZA76sE23trF5kzn80+lYqjyF9S8CL0ChjuRGhIehxutzANHKvvXohfeZGf6tZZoWv
 HFBA==
X-Gm-Message-State: AAQBX9foBP+Xkf256hojBiqEjcFAxDnhSwWcNTgnR5unAqzdvZ+o5rTF
 fSHzkHG+30XqWYh3zqxs1VoVrOnITIW09fqax8bFMMyhVZb1PnEMKgBygE+OATGlFqR1Nt0Apm0
 9M9Evuq+zjfzUZXAzhv0NOimjKxg+d93gvw==
X-Received: by 2002:a05:6214:27e8:b0:5a9:2bc0:ea8b with SMTP id
 jt8-20020a05621427e800b005a92bc0ea8bmr8017268qvb.47.1680682077933; 
 Wed, 05 Apr 2023 01:07:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgI1tC1SFeJbsYcH6xJzpDHdFw2Hx/LUgx1rr9zrgKewKcPFylgHGZySRoD8+iCQ6DLLI0oA==
X-Received: by 2002:a05:6214:27e8:b0:5a9:2bc0:ea8b with SMTP id
 jt8-20020a05621427e800b005a92bc0ea8bmr8017242qvb.47.1680682077580; 
 Wed, 05 Apr 2023 01:07:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 mz6-20020a0562142d0600b005dd8b9345e9sm4012411qvb.129.2023.04.05.01.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:07:56 -0700 (PDT)
Message-ID: <f92c5f99-f519-e67c-71a9-476f08e4117c@redhat.com>
Date: Wed, 5 Apr 2023 10:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 07/12] vfio: Accpet device file from vfio PCI hot reset
 path
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-8-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-8-yi.l.liu@intel.com>
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

On 4/1/23 16:44, Yi Liu wrote:
> This extends both vfio_file_is_valid() and vfio_file_has_dev() to accept
> device file from the vfio PCI hot reset.
typo in the title s/Accpet/Accept
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/vfio_main.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index fe7446805afd..ebbb6b91a498 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1154,13 +1154,23 @@ const struct file_operations vfio_device_fops = {
>  	.mmap		= vfio_device_fops_mmap,
>  };
>  
> +static struct vfio_device *vfio_device_from_file(struct file *file)
> +{
> +	struct vfio_device *device = file->private_data;
> +
> +	if (file->f_op != &vfio_device_fops)
> +		return NULL;
> +	return device;
> +}
> +
>  /**
>   * vfio_file_is_valid - True if the file is valid vfio file
>   * @file: VFIO group file or VFIO device file
>   */
>  bool vfio_file_is_valid(struct file *file)
>  {
> -	return vfio_group_from_file(file);
> +	return vfio_group_from_file(file) ||
> +	       vfio_device_from_file(file);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_is_valid);
>  
> @@ -1174,12 +1184,17 @@ EXPORT_SYMBOL_GPL(vfio_file_is_valid);
>  bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
>  {
>  	struct vfio_group *group;
> +	struct vfio_device *vdev;
>  
>  	group = vfio_group_from_file(file);
> -	if (!group)
> -		return false;
> +	if (group)
> +		return vfio_group_has_dev(group, device);
> +
> +	vdev = vfio_device_from_file(file);
> +	if (vdev)
> +		return vdev == device;
>  
> -	return vfio_group_has_dev(group, device);
> +	return false;
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_has_dev);
>  
With Alex' suggestion
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

