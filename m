Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5ED36B42F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 26 Apr 2021 15:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEB86E15F;
	Mon, 26 Apr 2021 13:39:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6056E15F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Apr 2021 13:39:26 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 8so22689887qkv.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Apr 2021 06:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VkiOojb7moMRIU1ab6KjmNlfxBVPJZUU9x6++IJL05o=;
 b=bArgFHcXpLc+w+eP2Jm88IVQFXatfKxPj12PfreG+C3nETzyyQKznU1WiBQosBhzi3
 IxUN9+5ak/l8TIANjWJ1nv+PVeXXOHCuyeaGelvRsFu7YJtBzQrT0G8j3vdPUxFk9M8e
 yztQ5aj+RCsvM5qj4T1qwmwMG6xKsdYfSUeA0X7AHuMR2T7xtKb4R4vxc6IWUEU9F/uQ
 x4QHELrWg9hmmqJFLcgcyk1hM4fwjDBErWdDATyiX6mk5NmdKGN7srTEoY/B4C2vWm2N
 dLsPev5drK/Le2/xCgRy9Nq4vaseeG5EMlLF76JMpJT2OQ98WyjH/3mbd16L1Iv8lUNQ
 iGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VkiOojb7moMRIU1ab6KjmNlfxBVPJZUU9x6++IJL05o=;
 b=ff5s/zSSno13qzkradXWyLvmV1cdYG5kLOsLUs60+BI4DSxbvgnPgdbxJeSg+BIp98
 SveK9FgTTXIn5Qk3Qi/ykFOGOb3vsas/lKtxWNH7TYgHhkYRtijCoolKkAzm9/4tSPvr
 +dyDd05t7LOgeuTSBNzprRB5zqUOm6EJ/D2XycvxJ9g8YDT1qg92TSaxBrwJiXYcyid+
 GmEefcwVrEhxhM36OeilxCVgNF9bhbuSmJZa45AelaCHltIneAOA/2mf322+udOuxTqA
 tnEKGWLu9czBG7rVyBTkgQbjt4tBU98FtETchMNmKyt4LRqsDlrdpqaYfznb73RcctzE
 oeAw==
X-Gm-Message-State: AOAM532kwJyiM29XvfY6+GEFvozekx5Lg7mEVQiKWqst6OQ2kb6Y3J2J
 U6Viz+odk9N/zCqFk4Tl5vVa9Q==
X-Google-Smtp-Source: ABdhPJznRtj43ioA6gZuqE8S2oFZN9kyxq/2/UJ5vmvuHPZtYybZFBODQ9NiSNQcOUSRvLNynSvGLQ==
X-Received: by 2002:a05:620a:9dd:: with SMTP id
 y29mr589125qky.83.1619444366099; 
 Mon, 26 Apr 2021 06:39:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id k18sm11082258qkg.53.2021.04.26.06.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 06:39:25 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lb1SO-00D3cu-Tx; Mon, 26 Apr 2021 10:39:24 -0300
Date: Mon, 26 Apr 2021 10:39:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210426133924.GK2047089@ziepe.ca>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 05:41:42PM +0800, Zhenyu Wang wrote:
> @@ -1667,19 +1773,26 @@ static struct mdev_parent_ops intel_vgpu_ops = {
>  
>  static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
>  {
> -	struct attribute_group **kvm_vgpu_type_groups;
> +	int ret;
> +
> +	ret = intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
> +	if (ret)
> +		return ret;
>  
>  	intel_gvt_ops = ops;
> -	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
> -		return -EFAULT;
> -	intel_vgpu_ops.supported_type_groups = kvm_vgpu_type_groups;
> +	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;

This patch is an improvement, but this fictional dynamic behavior is
still wrong. The supported_type_groups directly flows from the
vgpu_types array in vgpu.c and it should not be split up like this

The code copies the rodata vgpu_types into dynamic memory gvt->types
then copies that dynamic memory into a dynamic gvt_vgpu_type_groups,
which makes very little sense at all.

vgpu_types should be moved to kvmgt and everything should be static,
like every other mdev driver. Copy the 'type' information from the
gpu_types static when the mdev is created.

Jason
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
