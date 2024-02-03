Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3E984848F
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  3 Feb 2024 09:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9914D10EB57;
	Sat,  3 Feb 2024 08:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kUwWJVZr";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBF710EB57;
 Sat,  3 Feb 2024 08:52:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d0438dfd67so6919181fa.1; 
 Sat, 03 Feb 2024 00:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706950319; x=1707555119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pea/BPo7Xiir/urmGLrzN9bo/A8kwIQBKO16FDhr0Zs=;
 b=kUwWJVZryCcfF2dgzqNHt4PRjLIXgMWwo59vIqkgMSMcBf5ARhHQ5rNkDzr/VedkKf
 vgwnGCqiNFl0KME2uNqVwxSiFlgkqshUhYvq0iPUrriIfXVTPi1UcjiyBcVSkKrIG11/
 ECRZZNIjn5+UA73QZVt1yrr+O0vxr7+89Z7pIjGjQkYG9HlHjC6jy3idz99oHbM5Oddb
 Oi92pMSTqlQJCemEqWS4oHnUfK0dWqI72jwkpEB/m+7zPXHXyu1PnzKRJSsJwr2VKKS7
 mVpT84Rt6pIbo4juRMpjkC5RqfsndXs6BMjQwwACACDCRm6PhM+sld/fCZqNG/8jYqrn
 MD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706950319; x=1707555119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pea/BPo7Xiir/urmGLrzN9bo/A8kwIQBKO16FDhr0Zs=;
 b=Sh/BvMUPjZ7ju56HKK2iVrzcpI5rnkqONSL72Plg90yBFIFCEtG/KSsuo1O2UmV6Ks
 I6R1svmw/aRPVhCXYLLRuxlAtYQGKqyJ84XpXu5p8gwvtv7LT0mH0KrHa8CkFib7UnLO
 woOu5qak+HvVPuwqirAL39Hgc1bxJ00/PHk+h5qC9SRj5JWiXgDikNBjtsXBefb27hAL
 00y+KHXwCRwCdeLk/sqpOjslbxLT+pE7+5WjD3NnqgSsTEe+Zf3VGAII6D8S1xqleujK
 ZKUZvvjSolqgLgPom7IX1tkRvQz/cZiQYQ8hrnw7sufjuDYhqWFPw8FnxA1WgXzjuzP2
 KJXQ==
X-Forwarded-Encrypted: i=0;
 AJvYcCXiiod+khC1d9J310xjhQJDS71T9jJmMS5zEE978/kGKqlXOhFFl/K2TlHvL6eb5mqy5YBCS/6shkogw0YUau5enkReDRd03li1VX3sGhoyAOyVQQ==
X-Gm-Message-State: AOJu0YwRlByJ+tYJHiiYYUafqDikCUzGM9zyK/O3ezbx/S9UlhTNey/r
 TlzGmPgjTNK5uUQ3aPZgY0CDFH+GWIvKpzopgLzEd4kibIK3McuJiKT9E4iZ
X-Google-Smtp-Source: AGHT+IG1xetV+Z7GoI29P+3sUzpp09rlr6lGQv8JqNEUhALl4QyD2WtAxzMqq6dPPknZuZ1sCMH4wA==
X-Received: by 2002:a2e:4612:0:b0:2ce:1d5:c225 with SMTP id
 t18-20020a2e4612000000b002ce01d5c225mr4931900lja.2.1706950318542; 
 Sat, 03 Feb 2024 00:51:58 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWkjW5W7jLOeLUP1PuRnY2hofKAUBA249/fyVHe49RT8ODHr3ete7Bcb0N2FjDapkv9L1tcFcp8VxYHqSWQ78SE/AnjTpbSR532C3ccd77tHgRt6Q==
Received: from localhost ([193.209.96.43]) by smtp.gmail.com with ESMTPSA id
 n2-20020a2e7202000000b002d09b3cb281sm114141ljc.61.2024.02.03.00.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 00:51:58 -0800 (PST)
Date: Sat, 3 Feb 2024 10:51:58 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Replace dead 01.org link
Message-ID: <20240203104728.000043c5.zhi.wang.linux@gmail.com>
In-Reply-To: <20230804040544.1972958-1-zhenyuw@linux.intel.com>
References: <20230804040544.1972958-1-zhenyuw@linux.intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  4 Aug 2023 12:05:44 +0800
Zhenyu Wang <zhenyuw@linux.intel.com> wrote:

> 01.org is dead so replace old gvt link with current wiki page.
> 
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  MAINTAINERS                      | 2 +-
>  drivers/gpu/drm/i915/Kconfig     | 2 +-
>  drivers/gpu/drm/i915/intel_gvt.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d516295978a4..805d33a107aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10436,7 +10436,7 @@ M:	Zhi Wang <zhi.a.wang@intel.com>
>  L:	intel-gvt-dev@lists.freedesktop.org
>  L:	intel-gfx@lists.freedesktop.org
>  S:	Supported
> -W:	https://01.org/igvt-g
> +W:	https://github.com/intel/gvt-linux/wiki
>  T:	git https://github.com/intel/gvt-linux.git
>  F:	drivers/gpu/drm/i915/gvt/
>  
> diff --git a/drivers/gpu/drm/i915/Kconfig
> b/drivers/gpu/drm/i915/Kconfig index 01b5a8272a27..854255966d3d 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -140,7 +140,7 @@ config DRM_I915_GVT_KVMGT
>  
>  	  Note that this driver only supports newer device from
> Broadwell on. For further information and setup guide, you can visit:
> -	  http://01.org/igvt-g.
> +	  https://github.com/intel/gvt-linux/wiki.
>  
>  	  If in doubt, say "N".
>  
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c
> b/drivers/gpu/drm/i915/intel_gvt.c index e98b6d69a91a..9b6d87c8b583
> 100644 --- a/drivers/gpu/drm/i915/intel_gvt.c
> +++ b/drivers/gpu/drm/i915/intel_gvt.c
> @@ -41,7 +41,7 @@
>   * To virtualize GPU resources GVT-g driver depends on hypervisor
> technology
>   * e.g KVM/VFIO/mdev, Xen, etc. to provide resource access trapping
> capability
>   * and be virtualized within GVT-g device module. More architectural
> design
> - * doc is available on https://01.org/group/2230/documentation-list.
> + * doc is available on https://github.com/intel/gvt-linux/wiki.
>   */
>  
>  static LIST_HEAD(intel_gvt_devices);

Reviewed-by: Zhi Wang <zhi.wang.linux@gmail.com>
