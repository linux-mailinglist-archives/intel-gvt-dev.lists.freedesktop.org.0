Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CE3CFA1D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Jul 2021 15:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1508C6E2C7;
	Tue, 20 Jul 2021 13:08:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41E56E2C7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Jul 2021 13:08:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k4so25926779wrc.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Jul 2021 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvHTohQOXUo1eNzTbptDnQ980SKchLpYfyQkug8oLsM=;
 b=FZ7B87n7ZKH5WlwYufOcG72EJmbAaUBUE4aFuEpuEsqmjOIyRz6/XyFpVO7exRf5Wb
 dyZrHG+WOrHkEo9owvwnpXCrJcTd7X4Frz4ddtsdLCY2qk9tlFUBWk94lopmcQM3+zt6
 BjfmggyN4mvYvqpXEhBlTfCVoea5a0qDcd/Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uvHTohQOXUo1eNzTbptDnQ980SKchLpYfyQkug8oLsM=;
 b=fMGbrd1PkOsT9NuSQ7KAmMAablNCJV0U18BFDTrkfrr++l0VTPK7TAZWqktzZ+ulnI
 uGDLZExoZurs938FWgj1jmuMsmYODyuXxC7GKW0cHXwKbKHIGmY0mPL+Ix4k1h5X/udB
 9OyQIr5Nj9nf7aty4kRL5rzyOFmUB1Z1udT9AnIj51EIz3f3rLUxHbroLxx25dDwxoYZ
 mNTfaMoOyMcuGeShG7BT7k5jUIhoGZUGxn/9701CH/GvJXVdjseyZ890viMj0EslvcgQ
 9jfUElGDpQm+YZAbZ40Rn2OxDgyX0eQl4pamBn7OsLHWBx1l1qV2pIMigkcjUf6joFYX
 1ouw==
X-Gm-Message-State: AOAM53064+En/GI0n5Y8YOxaoLk5lOs3NN9MTc7heAvCKXaX8S4wsMv9
 oMcqtqCEvV7enBTJduPBnqt12g==
X-Google-Smtp-Source: ABdhPJyUbagFa2jJYY8PhdxQ3iWQEkYXCDmIYQQXB8xNIPSArbgllu0G7MR5Pi9l2jz7RgWOZA4nAw==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr35043388wry.128.1626786493358; 
 Tue, 20 Jul 2021 06:08:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm2423906wmq.13.2021.07.20.06.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:08:12 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:08:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v3 1/5] drm/print: fixup spelling in a comment
Message-ID: <YPbKukQVbHt1Yuin@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jbaron@akamai.com
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714175138.319514-2-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 jbaron@akamai.com, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 11:51:34AM -0600, Jim Cromie wrote:
> s/prink/printk/ - no functional changes
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_print.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9b66be54dd16..15a089a87c22 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  /*
>   * struct device based logging
>   *
> - * Prefer drm_device based logging over device or prink based logging.
> + * Prefer drm_device based logging over device or printk based logging.
>   */
>  
>  __printf(3, 4)
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
