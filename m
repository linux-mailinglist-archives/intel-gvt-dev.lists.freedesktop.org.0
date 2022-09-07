Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581D5AFCF7
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Sep 2022 08:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE6710E396;
	Wed,  7 Sep 2022 06:59:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34EB10E397
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Sep 2022 06:59:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a70so2130101edf.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 06 Sep 2022 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=qvR1N7BkwDYnsAvrsfaIO11nwQpKCU3X2O+a+Y27DUY=;
 b=JboZiw5UMpW3fLQ7FupCjwd6aK+mUdgjr5hh3TDItIM8ud3MPqItdIZvSBy6At4SrH
 PwHoYA4AU7ZjeZqaYWaA3JMJIRefSwml0t4qwc+ktxSSMu3EjO0DighbDKTn3xqOODKU
 8aA5FL4HALl1QQW2k4T0rKr+B9yknpX5DSbnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qvR1N7BkwDYnsAvrsfaIO11nwQpKCU3X2O+a+Y27DUY=;
 b=7HEjQvA/CKXco6kFdXKs59LRHhztQjjt34GNdof6/nsn2Uud09ME4YxP4/k195J7si
 VjBH7Soq+eWSNCAGg4MIcHmcSi9f9UVNMkslmHHzVU1KhI36Gg0U6apwH4sCMDRRkV9L
 Ta/tzCD2Pup3y4OTzGL/YbyMnf5voN1WdELjeyZSQf34wRtY2TgGyDXPnPG3q/VRU6nN
 sfd/PuPCpmyhFB+lzIdz4IaJFbT8sHGHt9G3BKecmsHnI6Ah6+IuF7iI88WySkfn5gAp
 fmc1z0EZB9GjmoKYLJdVBippVPAjc5aawTj6VOgKzbHVY7LO7HqsQv9O1DRBVTxY6kwa
 wizw==
X-Gm-Message-State: ACgBeo30F0KSX96Jmc5HIL5xOxX+AXKfSxu+8ZE1tVwglba3Uoy1VEmJ
 3MSMB4yk9uIxuLZTlLIarXXUpg==
X-Google-Smtp-Source: AA6agR5JW86JYwYYzN91pflVev5axL6S1Bv3lsKRf4XqvatlwpwQmUIlpWFZiPfqhA85TeaL1Xn6kg==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr1916771edx.12.1662533990421; 
 Tue, 06 Sep 2022 23:59:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s25-20020a170906bc5900b007081282cbd8sm7824571ejv.76.2022.09.06.23.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 23:59:49 -0700 (PDT)
Date: Wed, 7 Sep 2022 08:59:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v6 39/57] dyndbg/drm: POC add tracebits sysfs-knob
Message-ID: <YxhBZLAasKaBPEDT@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, robdclark@gmail.com,
 linux@rasmusvillemoes.dk, joe@perches.com
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-40-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904214134.408619-40-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: robdclark@gmail.com, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, jbaron@akamai.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 joe@perches.com, intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sun, Sep 04, 2022 at 03:41:16PM -0600, Jim Cromie wrote:
> clone DRM.debug interface to DRM.tracebits: ie map bits to
> drm-debug-categories, except this interface enables messages to
> tracefs, not to syslog.
> 
> 1- we reuse the class-map added previously.
>    this reflects the single source of both syslog/trace events
> 
> 2- add a 2nd struct ddebug_classes_bitmap_param
>    refs 1, reusing it.
>    flags = "T", to enable trace-events on this callsite.
> 
> 3- module_param_cb([2]) - does the sysfs part
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

All the drm patches (excluding nouveau) I haven't commented on:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think nouveau I'll leave up to nouveau folks.
-Daniel



> ---
>  drivers/gpu/drm/drm_print.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index c50edbf443d3..75d0cecd7e86 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -45,6 +45,9 @@
>  unsigned long __drm_debug;
>  EXPORT_SYMBOL(__drm_debug);
>  
> +unsigned long __drm_trace;
> +EXPORT_SYMBOL(__drm_trace);
> +
>  MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
>  "\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
>  "\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
> @@ -77,6 +80,13 @@ static struct ddebug_class_param drm_debug_bitmap = {
>  	.map = &drm_debug_classes,
>  };
>  module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
> +
> +static struct ddebug_class_param drm_trace_bitmap = {
> +	.bits = &__drm_trace,
> +	.flags = "T",
> +	.map = &drm_debug_classes,
> +};
> +module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap, 0600);
>  #endif
>  
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
> -- 
> 2.37.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
