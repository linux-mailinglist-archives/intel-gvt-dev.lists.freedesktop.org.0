Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61675252A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Jul 2023 16:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460C210E6EC;
	Thu, 13 Jul 2023 14:33:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDCC10E6EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jul 2023 14:33:07 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1b89e3715acso3340375ad.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jul 2023 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689258787; x=1691850787;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fr2vYa/Ch6xYV487nmzxcm8iM/FlpnkWVHQ5jynQTbg=;
 b=jacaK9M2p8ae07DYtf3WTwW4sJ88AeR0PMoTM/K8Zom80G9CNsRED8/7OkNACpL4FI
 vSrK+poAQrpW9b9XXAEX3N+/eJqGG0fl2uSilp/V2zhMmynFGmkNp19rQMAPCUIgro+L
 8wZFnIyWuBTpd6inSk0jhwWPq/qOKDhiCmrdy2nICENUOLQPMx4zm5vkc1J+N+jf8F/9
 NWijWeXBKP6nhRWfAZooF9dECtwpwP1B06LROVi+ZRGQWEPDlF+8FcWtS7IpVg38LWBC
 sabPszkfHQCdZSa4qO28HKir4zE3m+cUi5LtAFjCZb9xEKl25slyjVF3CoaXZrvttifT
 RnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689258787; x=1691850787;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fr2vYa/Ch6xYV487nmzxcm8iM/FlpnkWVHQ5jynQTbg=;
 b=gy9fFP0vANaZyHF6/QHhqLTWhdxl6WHUvzdkMbHDO9UcBiRnaTL05w7zCuSvKpilIt
 AmQ95aWigDeeVLmQA74iK5bQJwFpGf531G/AoiKdxNTM7Xesl02KhwgNyCeN5Tix7A89
 BujsMdDk7/t1AQ02ghQ7kMBf2ztayn5gekfhyABNcomqkzBM22iElWGJY2h0fgHcrBSY
 VuCkuakQukEVEAQW2qfz7sf2itsxRA7hsu5DtGV7a71ZQYBGQZXm7vynif31AgC3546q
 WhILiULKR/QkjMYSl5lHjlRYvIW96qUdzlQMVnFfL5fKpFYPtTfUzdH++ThmqwWLEgpo
 dMaA==
X-Gm-Message-State: ABy/qLbUb19cBLXCbXjET+9BN8zgjNc6v+6G+N8P8YHB9714Ht810uVe
 PaH7RS5y03PNpcfxObk6veSiXh7L88w=
X-Google-Smtp-Source: APBJJlFAAhWItEMB5PDxlVd4/XD0kDAeGPn5ZZPTnMU3ojU8FDM9Oji9AhkfLIh7rpZuc1o0H3AhYJQLwhY=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:b282:b0:1ba:1704:89d1 with SMTP id
 u2-20020a170902b28200b001ba170489d1mr5846plr.10.1689258786828; Thu, 13 Jul
 2023 07:33:06 -0700 (PDT)
Date: Thu, 13 Jul 2023 07:33:05 -0700
In-Reply-To: <20230713-vfs-eventfd-signal-v1-2-7fda6c5d212b@kernel.org>
Mime-Version: 1.0
References: <20230713-vfs-eventfd-signal-v1-0-7fda6c5d212b@kernel.org>
 <20230713-vfs-eventfd-signal-v1-2-7fda6c5d212b@kernel.org>
Message-ID: <ZLAK+FA3qgbHW0YK@google.com>
Subject: Re: [PATCH 2/2] eventfd: simplify eventfd_signal_mask()
From: Sean Christopherson <seanjc@google.com>
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, kvm@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, netdev@vger.kernel.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Xu Yilun <yilun.xu@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023, Christian Brauner wrote:
> diff --git a/fs/eventfd.c b/fs/eventfd.c
> index dc9e01053235..077be5da72bd 100644
> --- a/fs/eventfd.c
> +++ b/fs/eventfd.c
> @@ -43,9 +43,10 @@ struct eventfd_ctx {
>  	int id;
>  };
>  
> -__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask)
> +bool eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
>  {
>  	unsigned long flags;
> +	__u64 n = 1;
>  
>  	/*
>  	 * Deadlock or stack overflow issues can happen if we recurse here
> @@ -68,7 +69,7 @@ __u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask)
>  	current->in_eventfd = 0;
>  	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
>  
> -	return n;
> +	return n == 1;
>  }

...

> @@ -58,13 +58,12 @@ static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
>  	return ERR_PTR(-ENOSYS);
>  }
>  
> -static inline int eventfd_signal(struct eventfd_ctx *ctx)
> +static inline bool eventfd_signal(struct eventfd_ctx *ctx)
>  {
>  	return -ENOSYS;
>  }
>  
> -static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
> -				      unsigned mask)
> +static inline bool eventfd_signal_mask(struct eventfd_ctx *ctx, unsigned mask)
>  {
>  	return -ENOSYS;

This will morph to "true" for what should be an error case.  One option would be
to have eventfd_signal_mask() return 0/-errno instead of the count, but looking
at all the callers, nothing ever actually consumes the result.

KVMGT morphs failure into -EFAULT

	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) != 1)
		return -EFAULT;

but the only caller of that user ignores the return value.

	if (vgpu_vreg(vgpu, i915_mmio_reg_offset(GEN8_MASTER_IRQ))
			& ~GEN8_MASTER_IRQ_CONTROL)
		inject_virtual_interrupt(vgpu);

The sample driver in samples/vfio-mdev/mtty.c uses a similar pattern: prints an
error but otherwise ignores the result.

So why not return nothing?  That will simplify eventfd_signal_mask() a wee bit
more, and eliminate that bizarre return value confusion for the ugly stubs, e.g.

void eventfd_signal_mask(struct eventfd_ctx *ctx, unsigned mask)
{
	unsigned long flags;

	/*
	 * Deadlock or stack overflow issues can happen if we recurse here
	 * through waitqueue wakeup handlers. If the caller users potentially
	 * nested waitqueues with custom wakeup handlers, then it should
	 * check eventfd_signal_allowed() before calling this function. If
	 * it returns false, the eventfd_signal() call should be deferred to a
	 * safe context.
	 */
	if (WARN_ON_ONCE(current->in_eventfd))
		return;

	spin_lock_irqsave(&ctx->wqh.lock, flags);
	current->in_eventfd = 1;
	if (ctx->count < ULLONG_MAX)
		ctx->count++;
	if (waitqueue_active(&ctx->wqh))
		wake_up_locked_poll(&ctx->wqh, EPOLLIN | mask);
	current->in_eventfd = 0;
	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
}

You could even go further and unify the real and stub versions of eventfd_signal().
