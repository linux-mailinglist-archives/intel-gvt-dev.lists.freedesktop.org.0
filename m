Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482986D7BDA
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 13:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219D210E8F2;
	Wed,  5 Apr 2023 11:46:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5478B10E8F2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680695216;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDrWMAyxvXy+bl3Pxr9kc6xlTFSjm+8B+3mxBz/Z2lU=;
 b=JyzHaaIs8XfnIMscyikmvqpuLsYLWgPtheAvNXHDVPr3MiMQlQqm/sK9u7PhAg6qCG0n5m
 NRGvpvfufIP2A0ovaXlb2muYQ4XXTr+mwSVSnmuJk4fjsLqMOnKBMzpWze1A//yqZa/9ud
 orvgPIpSLn0dNpMx9wgS2oEMkuEtJfw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-wcujC-lKNgWCtOATrwAB_w-1; Wed, 05 Apr 2023 07:46:53 -0400
X-MC-Unique: wcujC-lKNgWCtOATrwAB_w-1
Received: by mail-qt1-f200.google.com with SMTP id
 c14-20020ac87d8e000000b003e38726ec8bso24171964qtd.23
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 04:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680695213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uDrWMAyxvXy+bl3Pxr9kc6xlTFSjm+8B+3mxBz/Z2lU=;
 b=4q1fC05+tEZIPU8bSkir3F0j0a59tIiPjWWBVNhE09pdWYyOu1VvEFhKRsLI7yIF8t
 KtlvYyX0rIQEbJxVdmxR7GuItpGYo35VQZ8seoAFsOEj1SdEYTRRo9Hx6X10xRM0PGkP
 AyoMMCoHdKeyUbXUNGA6iYT9Txt8WEfvovWfRR0IUwrXpPhCA+tMcfmnpYpsJEqY2tPg
 Up4id2YQL8+An5x98jfI13xqY3EbYUSHMiSpZVsHYhNnP3Fe6NutR01Hy1fztfvGw+95
 GnSWO2LALHu5ZKIAEsXQU7DJJxGhS/ImYGfJtp3wweRRRFewND7kY2qwu/kcXkO4h2PJ
 qtIg==
X-Gm-Message-State: AAQBX9eE0M6sfnRVKBJg6Lm6ADVHkQ0wgJsOhM1QobcHyb+RIuEoZsLN
 BJ4ex1EMRHPTxIAUYGqCPWmV7vBGTLpY/oXuYhFMl/p2Vr0G0u9GnzMXTHt4d3fd57HBdhyh6vT
 4F9qJJ9XpVW6JnX3MlUPrqvGp6RMio+sbmQ==
X-Received: by 2002:a05:622a:1309:b0:3e6:3ed2:3a91 with SMTP id
 v9-20020a05622a130900b003e63ed23a91mr3790613qtk.32.1680695212509; 
 Wed, 05 Apr 2023 04:46:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350bfNGaC4yZyoW2hoZTEeT/b+1aIRezZ/X2Gn+pULgPtxtF6FxAek4ahkkKm+7tynn0L/af5KQ==
X-Received: by 2002:a05:622a:1309:b0:3e6:3ed2:3a91 with SMTP id
 v9-20020a05622a130900b003e63ed23a91mr3790588qtk.32.1680695212273; 
 Wed, 05 Apr 2023 04:46:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 203-20020a3708d4000000b0074a3c282c7dsm2654941qki.97.2023.04.05.04.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 04:46:51 -0700 (PDT)
Message-ID: <567d99c0-4448-f2f4-1d7b-7d811a3d7c8c@redhat.com>
Date: Wed, 5 Apr 2023 13:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 11/12] iommufd: Define IOMMUFD_INVALID_ID in uapi
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-12-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-12-yi.l.liu@intel.com>
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

Hi Yi

On 4/1/23 16:44, Yi Liu wrote:
> as there are IOMMUFD users that want to know check if an ID generated
s/want to know check/ need to check
which type of ID?
> by IOMMUFD is valid or not. e.g. vfio-pci optionaly returns invalid
optionally
> dev_id to user in the VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl. User
> needs to check if the ID is valid or not.
so dev id ...
>
> IOMMUFD_INVALID_ID is defined as 0 since the IDs generated by IOMMUFD
> starts from 0.
from 1, same as below
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
ditto
> +#define IOMMUFD_INVALID_ID 0
> +
>  /**
>   * DOC: General ioctl format
>   *
Eric

