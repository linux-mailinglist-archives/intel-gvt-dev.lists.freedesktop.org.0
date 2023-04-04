Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E576D6468
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 16:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84510E6BB;
	Tue,  4 Apr 2023 14:00:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EBC10E6BD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykhmPw67VbhDtXPSpfVmWbPSuu2IMuu2dxGXXWfzz7E=;
 b=E0Rsi68Iv2lzFpQ8jDwIrkpBsVr7OIQpIzEBcg0Gv5Z0XXrfJp+npwlHX3hhZxwr+5Edzi
 +i9HnNmE02Qyf9R4z2HE1JrpZTqz0k9ZoJp30npCML6hvkGznFX1GtvMOQWPckK2ZlAHF3
 Y8KzLI5cujWsDoyoIcwP13TZsD2B3NY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-AycJxx4dPB-c2fxZcpDs5g-1; Tue, 04 Apr 2023 10:00:04 -0400
X-MC-Unique: AycJxx4dPB-c2fxZcpDs5g-1
Received: by mail-qv1-f71.google.com with SMTP id
 dl18-20020ad44e12000000b005a4d5420bc6so14624646qvb.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 07:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ykhmPw67VbhDtXPSpfVmWbPSuu2IMuu2dxGXXWfzz7E=;
 b=vW9oReDmBhIbxcygSziTp6WXIhm1IHM4iXfktpSw+2mu2YjxHHBDGK+apVYtp4HLN8
 dMCyjtHzi5NT0SZ3pOb/ItAkPhh8n7POGO9wlQAil+UAe82F3lmY3b5gB+Vq1kYvVDus
 c5vlKkdUEBinucDG3AVCdi3WrvGkz4uWYsMJzS7jk86SipOlGMs/ngLJQy17WH0L4GFx
 4j3sVA2JuE+6heHBbZiZV0JmxaxK/tSFrgW9bbS+CghgmDr8hQbhNlg9thVF9hP+QlgY
 PNWV2imw65Ghewe9QfAbHZGBCouZS6r2kThaUwtJw/WfJknsMUo9lhKspfID4f9h7CBN
 bKTg==
X-Gm-Message-State: AAQBX9dxCi6AuJbHLFDwvCU89AmYVk/ReWuGQMkys2tEyQQCO/ffUFLK
 dzEBX5+wyxLsGoCdxvTVr85k4l3aZR+FUe0dP1WLOVyuRyTJR1dmaYbaAC1ED46Asd2Sq7JbfuO
 Rifs/N5I6783p5ngxXFerFE1eQx+o6CJeKQ==
X-Received: by 2002:ad4:5b87:0:b0:5e2:1381:6105 with SMTP id
 7-20020ad45b87000000b005e213816105mr3459177qvp.18.1680616802046; 
 Tue, 04 Apr 2023 07:00:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350bJCynXCOrEKhxb44G8d+k4Dr+19c9yImUsR/GZAakKp2zi913dOKWU2dCtLWnBy7YVL0UkpQ==
X-Received: by 2002:ad4:5b87:0:b0:5e2:1381:6105 with SMTP id
 7-20020ad45b87000000b005e213816105mr3459060qvp.18.1680616801354; 
 Tue, 04 Apr 2023 07:00:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 jy1-20020a0562142b4100b005dd8b9345ebsm3412112qvb.131.2023.04.04.06.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:00:00 -0700 (PDT)
Message-ID: <1f8ddafd-6fad-aff6-5dc7-9d67f89eea73@redhat.com>
Date: Tue, 4 Apr 2023 15:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 01/12] vfio/pci: Update comment around group_fd get in
 vfio_pci_ioctl_pci_hot_reset()
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-2-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-2-yi.l.liu@intel.com>
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
> this suits more on what the code does.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index a5ab416cf476..65bbef562268 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1308,9 +1308,8 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	}
>  
>  	/*
> -	 * For each group_fd, get the group through the vfio external user
> -	 * interface and store the group and iommu ID.  This ensures the group
> -	 * is held across the reset.
> +	 * Get the group file for each fd to ensure the group held across
to ensure the group is held

Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


> +	 * the reset
>  	 */
>  	for (file_idx = 0; file_idx < hdr.count; file_idx++) {
>  		struct file *file = fget(group_fds[file_idx]);

