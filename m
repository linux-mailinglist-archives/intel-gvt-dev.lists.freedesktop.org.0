Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4466DAB10
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Apr 2023 11:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164510E2BF;
	Fri,  7 Apr 2023 09:48:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C910E2BF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  7 Apr 2023 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680860892;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4iRHgbQhPwVpyJmMFVyQJvJ+/Z7zOQeM679Xa5eK6c=;
 b=iSlEb6dRvXMDop5RMYRqn5Njq7rKFqLE/qz6/OPdrW24enisci/r5c5cefC2WmekTn136F
 yMwSvBYrCh77g3Y27frbugvhQjP1YYEA55cWs2M7Aa7LlX0r1hnYbKZdj/CqqIsK3hnCI0
 BHHETUeX+C5BuGw3KBFwJYFkzHxtipA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-WSfV2GVxNnetzQZ_tO-ruQ-1; Fri, 07 Apr 2023 05:48:11 -0400
X-MC-Unique: WSfV2GVxNnetzQZ_tO-ruQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d11-20020a05600c34cb00b003ee89ce8cc3so19045430wmq.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 07 Apr 2023 02:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680860890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4iRHgbQhPwVpyJmMFVyQJvJ+/Z7zOQeM679Xa5eK6c=;
 b=gFpEUiWOW59jW51rme5DtFME6WulGn0aljxhAHHyomWzqk2xk3CF2uk+Vq/Hwcc1k1
 nGzQgSRVU8/r/+90iM5D+khYG5Ue8VXBdl607I15XAdBsCpeoXWoNMK8eHrzsliwr1MA
 de9BP58JNNDBFNpozKASZAKLfCMxxO9C9vDdzYzNxwIr6MzBNyIAJWDWmfjZ4GnMNC46
 VUPOXPn5oiY/+beD6vtm/XkoSn2/0Qi19ophQF7UVrD/wZl+ZQPSKFQgaxHRaIaNz2kI
 9SB/jRgv2U5IodqsPu/AT7WdrOQ4XDNpbjxyWBiE4E6R4jOfS6iE0A4g1O27NHA/q7dm
 w5/w==
X-Gm-Message-State: AAQBX9c8DXM0L0hDlszJ/5uGTXn4CzuNaLPklk9bIYJ4//PBDSipwa3T
 1rZ7QEOXHSh6I3h9ydt/tqXMZnq1kQhru7Dp3ognfxyZQ+dYQAMLsa5dRqv9i3k+904L2hI2NP3
 BzfnUruvQ22aPcSMmjsSJlK/vcWV5r87Zyg==
X-Received: by 2002:a05:600c:204d:b0:3ea:e4f8:be09 with SMTP id
 p13-20020a05600c204d00b003eae4f8be09mr909029wmg.30.1680860889937; 
 Fri, 07 Apr 2023 02:48:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZlpsPfpxKVEL2171G53vaHOkQSd6+4Svqt/X88zEcX4kRYEeQU3ue1qYmeM1kP8/bXxozatA==
X-Received: by 2002:a05:600c:204d:b0:3ea:e4f8:be09 with SMTP id
 p13-20020a05600c204d00b003eae4f8be09mr908998wmg.30.1680860889634; 
 Fri, 07 Apr 2023 02:48:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a1cf002000000b003f049a42689sm4103205wmb.25.2023.04.07.02.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 02:48:07 -0700 (PDT)
Message-ID: <05d59a7e-fa75-a93e-95a5-a376c00721d5@redhat.com>
Date: Fri, 7 Apr 2023 11:48:05 +0200
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
in previous patches df fields were protected with various locks. I refer
to vfio_device_group_open() implementation. No need here?

By the way since the group is set here, wrt [PATCH v9 06/25] kvm/vfio:
Accept vfio device file from userspace you have a way to determine if a
device was opened in the legacy way, no?
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
allows the device to be opened multiple times
> +	 * The device cdev path doesn't have a secure way for it.
> +	 */
> +	if (device->open_count != 0 && !df->group)
> +		return -EINVAL;
> +
>  	device->open_count++;
>  	if (device->open_count == 1) {
>  		ret = vfio_device_first_open(df);
Thanks

Eric

