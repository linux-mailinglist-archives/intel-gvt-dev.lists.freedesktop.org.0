Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11610857CD8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Feb 2024 13:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B0310E8D4;
	Fri, 16 Feb 2024 12:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+Ir+pN9";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90310E8D4;
 Fri, 16 Feb 2024 12:40:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5114a21176cso538002e87.1; 
 Fri, 16 Feb 2024 04:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708087243; x=1708692043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/BEPC0f21cX8+pFxjO9Xj6ogm+sj9UMJhy8cDHL9rc=;
 b=d+Ir+pN9AZXd6lacFT0PXFf/TDqacHeX1TlPY4P1trWOhjKI6NXAx9yqkVJ4pCLS5G
 F4VQ75+gdlBDEKV9uHBcctdMAnznQI58sniJI0ruULtKH73ixwHJrMgmUKICu84H2x5w
 tNyBVE5+Ek3dVfkzgXpIDkYercaMmxVNarDA5XDvC2R/9I0iqCI+TZN5sDqn43YWdP/H
 z+a2vJB2d/IoVeLhkv4B7QLMZb8C9K6pHznVlnrh54gFpKxDlzNlEBOvI/1BlKQO5Tm2
 fOo6ah8xl355gsljRxA144cP0zdQ5j4b9L+bQXuxEowrjLgbMxbkVuLf1CXi/R1UvIL6
 d57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708087243; x=1708692043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/BEPC0f21cX8+pFxjO9Xj6ogm+sj9UMJhy8cDHL9rc=;
 b=m0cbwhFxKnNfJ6Bu+5yEucoUJYpUTSrv8+NMpzB/O05AWPITlyWWaAJaE8umvyYqxk
 wZ6tuHiRawAkuDnQ2o8P5yXCtPQwkw1YlngEKmIkkMrWJzsqlr1O4GNo4mQlx8K9W36z
 jptj9PGHI9tAKxAQHXL6FhwXc3y5JJ8VHGcxul7pLk4jlkJnFEMYAVklLZLBDrvGfrkE
 Scu21kcHhma1MViTn3s3QqtjFHSwu1Y0XVF0e9jiKX+jhUbjgew05kFCoERwJAS1E0H2
 gzKrqRkJz7RvoOKgkugHWvnc1HGKPe1FEpDEMbQB8dEErR8vZqyvvdnvjSKRsow9lKrZ
 5pNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa3wIy8A8VCPr2lLaIT7I41AsQpgSTQf/MSmgP37ZI0Br/2JC/gb4/EUOLYDAtVXu4xlzbIlzO0+sFGyueFk3esJZlQSMxOb4V7eSgq0TyDLPJP7cm7Cuz1gBOCreTGDDAiJJhZaWFQbgBNPkUgHOwjamqFw==
X-Gm-Message-State: AOJu0Ywt9TQCJovzGy6UX1de+cPqk+aGjlEwTQd3x5S0ViqUZ3PDpp1d
 Yi8wLu3ymgJWDjoE5Nvqn3Z8W/ohSkvc28kwoSjPOGgJYFpjY4cH
X-Google-Smtp-Source: AGHT+IFRSaMnjw8+3knZoCRYoJ3YhOgeltpJKK6FMRHJWpFVSx03+fMwDDJJ9ib7uI6P0LQYFOzXgg==
X-Received: by 2002:a05:6512:249:b0:511:8e03:c9a3 with SMTP id
 b9-20020a056512024900b005118e03c9a3mr1302245lfo.2.1708087242403; 
 Fri, 16 Feb 2024 04:40:42 -0800 (PST)
Received: from localhost (88-115-160-21.elisa-laajakaista.fi. [88.115.160.21])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac259d1000000b005129c9758e0sm6230lfn.306.2024.02.16.04.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:40:42 -0800 (PST)
Date: Fri, 16 Feb 2024 14:40:26 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH 00/21] drm/i915: remove unused structure members
Message-ID: <20240216144026.00005144.zhi.wang.linux@gmail.com>
In-Reply-To: <87plww4ws7.fsf@intel.com>
References: <20240216065326.6910-1-jirislaby@kernel.org>
 <87plww4ws7.fsf@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
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

On Fri, 16 Feb 2024 10:51:20 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Fri, 16 Feb 2024, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> > this series removes unused i915 structure members as found by
> > clang-struct (and manually checked by me).
> 
> Thanks Jiri, good stuff!
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> However, you may have overlooked that drivers/gpu/drm/i915/gvt/ is
> maintained separately.
> 
> Cc: Zhenyu, Zhi, how do you want the gvt patches in this series
> handled?
> 

Many thanks for the clean-up patch Jiri! Jani, it would be easier
for us that you can help to apply the patches through i915.

Thanks,
Zhi.

> 
> BR,
> Jani.
> 
> 
> >
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >
> > Jiri Slaby (SUSE) (21):
> >   drm/i915: remove unused intel_dvo_dev_ops hooks
> >   drm/i915: remove structs intel_vgpu_pipe_format and
> >     intel_vgpu_fb_format
> >   drm/i915: remove intel_dsi::{port_bits,hs}
> >   drm/i915: remove
> >     intel_gvt_gtt::{mm_alloc_page_table,mm_free_page_table}
> >   drm/i915: remove intel_gvt_mmio_info::{device,addr_range}
> >   drm/i915: remove
> > intel_vgpu_workload::{ring_context,restore_inhibit} drm/i915:
> > remove intel_vbt_panel_data::edp::initialized drm/i915: remove
> > intel_guc::ads_engine_usage_size drm/i915: remove
> > i915_drm_client::id drm/i915: remove i915_perf_stream::size_exponent
> >   drm/i915: remove intel_vgpu_gtt::active_ppgtt_mm_bitmap
> >   drm/i915: remove intel_vgpu_fence::base
> >   drm/i915: remove intel_vgpu_opregion::mapped
> >   drm/i915: remove intel_vgpu::intx_trigger
> >   drm/i915: remove gvt_mmio_block::device
> >   drm/i915: remove intel_gvt_irq_info::warned
> >   drm/i915: remove intel_gvt_event_info::policy
> >   drm/i915: remove intel_gvt_irq::pending_events
> >   drm/i915: remove execute_cb::signal
> >   drm/i915: remove i915_vma::obj_hash
> >   drm/i915: remove intel_memory_region_ops::flags
> >
> >  .../drm/i915/display/intel_display_types.h    |  1 -
> >  drivers/gpu/drm/i915/display/intel_dsi.h      |  4 ---
> >  drivers/gpu/drm/i915/display/intel_dvo_dev.h  | 25
> > ------------------- drivers/gpu/drm/i915/gt/uc/intel_guc.h        |
> >  2 -- drivers/gpu/drm/i915/gvt/fb_decoder.h         | 11 --------
> >  drivers/gpu/drm/i915/gvt/gtt.h                |  3 ---
> >  drivers/gpu/drm/i915/gvt/gvt.h                |  5 ----
> >  drivers/gpu/drm/i915/gvt/interrupt.c          |  1 -
> >  drivers/gpu/drm/i915/gvt/interrupt.h          |  2 --
> >  drivers/gpu/drm/i915/gvt/mmio.h               |  2 --
> >  drivers/gpu/drm/i915/gvt/scheduler.h          |  2 --
> >  drivers/gpu/drm/i915/i915_drm_client.h        |  2 --
> >  drivers/gpu/drm/i915/i915_perf_types.h        |  1 -
> >  drivers/gpu/drm/i915/i915_request.c           |  1 -
> >  drivers/gpu/drm/i915/i915_vma_types.h         |  1 -
> >  drivers/gpu/drm/i915/intel_memory_region.h    |  2 --
> >  16 files changed, 65 deletions(-)
> 

