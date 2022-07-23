Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB557EAF9
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 23 Jul 2022 03:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEB614AFDF;
	Sat, 23 Jul 2022 01:09:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4193314B071
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 23 Jul 2022 01:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658538546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtJITXeJe/HGejcmvCfgDWekHgAs+3zE0/89IdxKZLc=;
 b=AnRW15r6SqABdIHTcJw/b5bnbn8HaU4OO5yi5JK1+6XxL6x2Y1AAReAEKUBAbPh/7eITat
 fuI3AG4Hq4GsxSbgawWodSv8SNUMjBO76oJ58tMdDfLZFX0WMKC+BsT/BVkafLatQgdtbq
 q6pAG2x8Q+RP4gTP5zsYvAAGWWItJ2c=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-ZTZftjviPaK1Ton0Ea51yw-1; Fri, 22 Jul 2022 21:09:04 -0400
X-MC-Unique: ZTZftjviPaK1Ton0Ea51yw-1
Received: by mail-il1-f200.google.com with SMTP id
 u9-20020a056e021a4900b002dc685a1c13so3548918ilv.19
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Jul 2022 18:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=TtJITXeJe/HGejcmvCfgDWekHgAs+3zE0/89IdxKZLc=;
 b=J0kwBNCmca7ONv5n41HnMPWKxMVo095QNtFwd9Oqw8s97JIkTSy9ijXnsrMpqwl2nr
 0NRsU8khbGHkkdFUqPx30qQMI2NvZFMqgGXP/OCtO5POFGSJGoyBHzOnyUe2EzkQaGnv
 frYxcJEd0szWVlaUbuTs0Gv3HrQPanr35ybg3wCPKF3JiNeHmrTnSN5b1/GTkfWobBzq
 DhMTbBl55BFsdb7sRIeVRHF3FHP1k0ArM14kZsP0jqQGxFzOWQdiSQlGxcPG5gATOOFY
 0ODDlfaoNXIUVvbCA3L+SPtlu5ttFzWqkHG92ZBIw4F5MBLVnWW3OiriqLKNWcql3f7u
 AWpQ==
X-Gm-Message-State: AJIora8/IX5PIrXH2P0yEsX9zZS40Dh94TxFQmqOyjzFQEptF7NKZQwt
 EePSNhVddAEJEVBJhwLCM9/l0URRIlONZr3y09dCm4Yd92ZpIUnP0DdsYvfd8L+qGOS4xImaKa7
 /eZc6VZU8MBPkQA9+L2TmPjtl4JwGOu+PhA==
X-Received: by 2002:a05:6e02:1b07:b0:2dc:767c:6607 with SMTP id
 i7-20020a056e021b0700b002dc767c6607mr962230ilv.178.1658538544151; 
 Fri, 22 Jul 2022 18:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLeZy56sEhX34vmR/dm7wtpceD1ImpTzU8x3g21W4EturgnacF7y4YsmXib0rg5DdXzeXkiQ==
X-Received: by 2002:a05:6e02:1b07:b0:2dc:767c:6607 with SMTP id
 i7-20020a056e021b0700b002dc767c6607mr962219ilv.178.1658538543921; 
 Fri, 22 Jul 2022 18:09:03 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05663810f200b0033f43a220a6sm2654122jae.11.2022.07.22.18.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 18:09:03 -0700 (PDT)
Date: Fri, 22 Jul 2022 19:09:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Message-ID: <20220722190901.262a1978.alex.williamson@redhat.com>
In-Reply-To: <YttDAfDEnrlhcZix@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220722161129.21059262.alex.williamson@redhat.com>
 <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
 <20220722181800.56093444.alex.williamson@redhat.com>
 <YttDAfDEnrlhcZix@Asurada-Nvidia>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 joonas.lahtinen@linux.intel.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kwankhede@nvidia.com, terrence.xu@intel.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, jani.nikula@linux.intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com, daniel@ffwll.ch
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 17:38:25 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Fri, Jul 22, 2022 at 06:18:00PM -0600, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Fri, 22 Jul 2022 16:12:19 -0700
> > Nicolin Chen <nicolinc@nvidia.com> wrote:
> >   
> > > On Fri, Jul 22, 2022 at 04:11:29PM -0600, Alex Williamson wrote:
> > >  
> > > > GVT-g explodes for me with this series on my Broadwell test system,
> > > > continuously spewing the following:  
> > >
> > > Thank you for running additional tests.
> > >  
> > > > [   47.348778] WARNING: CPU: 3 PID: 501 at drivers/vfio/vfio_iommu_type1.c:978 vfio_iommu_type1_unpin_pages+0x7b/0x100 [vfio_iommu_type1]  
> > >  
> > > > Line 978 is the WARN_ON(i != npage) line.  For the cases where we don't
> > > > find a matching vfio_dma, I'm seeing addresses that look maybe like
> > > > we're shifting  a value that's already an iova by PAGE_SHIFT somewhere.  
> > >
> > > Hmm..I don't understand the PAGE_SHIFT part. Do you mind clarifying?  
> > 
> > The iova was a very large address for a 4GB VM with a lot of zeros on
> > the low order bits, ex. 0x162459000000.  Thanks,  
> 
> Ah! Thanks for the hint. The following commit did a double shifting:
>    "vfio: Pass in starting IOVA to vfio_pin/unpin_pages AP"
> 
> And the following change should fix:
> -------------------
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 481dd2aeb40e..4790c7f35b88 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -293,7 +293,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
>         if (dma_mapping_error(dev, *dma_addr)) {
>                 gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
>                              page_to_pfn(page), ret);
> -               gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
> +               gvt_unpin_guest_page(vgpu, gfn, size);
>                 return -ENOMEM;
>         }
> 
> @@ -306,7 +306,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
>         struct device *dev = vgpu->gvt->gt->i915->drm.dev;
> 
>         dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
> -       gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
> +       gvt_unpin_guest_page(vgpu, gfn, size);
>  }
> 
>  static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
> -------------------

Looks likely.  Not sure how Terrance was able to test this successfully
though.

> So, I think that I should send a v4, given that the patches aren't
> officially applied?

Yep, please rebase on current vfio next branch.  Thanks,

Alex

