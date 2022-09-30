Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899A5F14E8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Sep 2022 23:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745E610EDC3;
	Fri, 30 Sep 2022 21:31:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8F410EDC3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Sep 2022 21:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664573512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u99SFb2mm6IMO2C/mDjsVShY7ib8HgVHNq4m7TjUMlU=;
 b=is4Ec/N7Y2KZFLY5ROYxSVIlxZXpyWG1DB3xBBkpjx9MKPrBifwjC+NbAXZwljo7ID5HLI
 jKpsIBs5Ws8RAqJ6daIG1YCfmlIak7N6rH9USOZKZsna3yYio+WFbuQurKDPLEk4CQllAc
 simcdXY4+n/dxg8G+zcC+X/rTQeqv+w=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-i6y-wwuyPqClEnamwP4w4A-1; Fri, 30 Sep 2022 17:31:51 -0400
X-MC-Unique: i6y-wwuyPqClEnamwP4w4A-1
Received: by mail-io1-f72.google.com with SMTP id
 a15-20020a6b660f000000b006a0d0794ad1so3559316ioc.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Sep 2022 14:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=u99SFb2mm6IMO2C/mDjsVShY7ib8HgVHNq4m7TjUMlU=;
 b=OK3am76dmkeEjHlyEFbc/c1HKqcig6/kGsW9Pwhx9Srt9Z2iGjfEnS65PnsvVSR50N
 WOVMpaPLWrNK860XGq+qFWw0vm745z4Nw5HNIPwy+5xQRU902jxuT5lXqnvyT2PTkwWm
 wQjo+iv/DPHUn1Wim1tKAUBv+fbKVMDtbQpwndHW4Uywq4uJFKLJLJqyCCOG0/MWnxs0
 TKypKotMeT4rTASVFWwBMI65ZJSucZC03NdcE2XNvlnZMQoiF5a299M6s9gM46PRFGFm
 0spYpKjUAqTo7rIghnva6QgMW53Zw1sIibpTAmj80yaqWbJAIYH+gtyKpO45b6+GMT0L
 1wjA==
X-Gm-Message-State: ACrzQf1AeZUUhSEr9VxoPLiEbWTKct1uYHj47PWn+PAF/L7vqWwL49YA
 XsddyXAVGQ81qCe+3exyq3aMLK60t247Z38+QPkbqtdBae6YTBaO2FpR9gfNLacSF38o2q75cRh
 rK+NGFUBLCOywr5l/Xis22PcRWgJNX4C73A==
X-Received: by 2002:a05:6638:3712:b0:35a:9c8a:698d with SMTP id
 k18-20020a056638371200b0035a9c8a698dmr5772791jav.151.1664573510567; 
 Fri, 30 Sep 2022 14:31:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VTcmsFBjypWqMFwP2pQez8YMxKnmnM54iEalnSS3t8MH21D5OVP8HPDXTGJs8BfLF5xZXKQ==
X-Received: by 2002:a05:6638:3712:b0:35a:9c8a:698d with SMTP id
 k18-20020a056638371200b0035a9c8a698dmr5772780jav.151.1664573510387; 
 Fri, 30 Sep 2022 14:31:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056638169000b0035a578870a4sm1337172jat.129.2022.09.30.14.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:31:49 -0700 (PDT)
Date: Fri, 30 Sep 2022 15:31:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify the mdev interface v8
Message-ID: <20220930153148.5eb8808e.alex.williamson@redhat.com>
In-Reply-To: <20220928121110.GA30738@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
 <20220927140737.0b4c9a54.alex.williamson@redhat.com>
 <20220927155426.23f4b8e9.alex.williamson@redhat.com>
 <20220928121110.GA30738@lst.de>
Organization: Red Hat
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 28 Sep 2022 14:11:10 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, Sep 27, 2022 at 03:54:26PM -0600, Alex Williamson wrote:
> > Oops, I had to drop this, I get a null pointer from gvt-g code:  
> 
> Ok, this is a stupid bug in the second patch in the series.  I did not
> hit it in my mdev testing as my script just uses the first type and
> thus never hits these, but as your trace showed mdevctl and once I
> used that I could reproduce it.  The fix for patch 2 is below, and
> the git tree at:
> 
>    git://git.infradead.org/users/hch/misc.git mvdev-lifetime
> 
> has been updated with that folded in and the recent reviews.
> 
> ---
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 1b67328c714f1..b0d5dafd013f4 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -123,7 +123,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
>  
>  		sprintf(gvt->types[i].name, "GVTg_V%u_%s",
>  			GRAPHICS_VER(gvt->gt->i915) == 8 ? 4 : 5, conf->name);
> -		gvt->types->conf = conf;
> +		gvt->types[i].conf = conf;
>  		gvt->types[i].avail_instance = min(low_avail / conf->low_mm,
>  						   high_avail / conf->high_mm);

Fix folded in, re-applied to vfio next branch for v6.1.  Thanks,

Alex

