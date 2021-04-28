Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37836DE23
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Apr 2021 19:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8196E0EE;
	Wed, 28 Apr 2021 17:21:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50216E0EE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Apr 2021 17:21:48 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id k127so8733591qkc.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Apr 2021 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CaPG0o5g+dWFi7uj7+JhVw7sGs5Mr/6jP/TVxwt/17A=;
 b=HLOpv+OjOD5j8I9gnIWX39fP+vfy2+E4atNqPfcWfpBq0dgxsAXEL81Q52y7Oi+rNH
 h42GiJRY6jDyx7H90PtNit5whUl64x1C6ozQczMFGgAZunUjiXEMRgERih80qDquMMxJ
 ITHpcGvKDDH2cHEwY9Kf5NfybdB3LKSJVDHn1tC5r5aQpY0WQA3empvj27abipcb75Cn
 Cyj23LGbjejzNPQodT1XgF2UhOb/So3UK1wIHT+puHcPqDVF3e0r5aCBeGrmTIxF1WYr
 Z1WoF/o9HrzcMx59VxesQHp9yuCFOfMUeSmylogU2TW1mv8z/rNa5eFGDXhICep7/Jqt
 iQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CaPG0o5g+dWFi7uj7+JhVw7sGs5Mr/6jP/TVxwt/17A=;
 b=T2akTiRr9yxupUhlgVmSkG99etnL8Go/6SRYUeh2tl4UbxVGy+pgAOurkE1fjoaEs8
 JO5GsoiKSFkurkDE+A3OpSoeGul8r/dSVxkEaa4yJ+LbjPMqWhAQBbnTmZ2dNDiL8nL/
 WnQPQCITodhudQHNAJdqtRTea9Ov9J2R6ojzEXqIJ4bb72WlxmXw0g8R3igxuN5KmogZ
 H4xFWvAtX8sUiyc5yIJQlAeGlQ2yMweF1q6szBYxZ2q4crnctd4Kyo7hbhIvJzeBAIwA
 NHeRvdGUp5q+o7Oe/lE801xl4pudJTNn8brJYnn6kWweeyPIM28si0egzx38kvZ3nTCT
 r5hg==
X-Gm-Message-State: AOAM532ypl/rGmLoMKq6SvO/OFh7ySjXKhUkIg7PTJU4bePaX/3uwkTv
 kIbCK8z59ENpmFL7XX7cvvkINw==
X-Google-Smtp-Source: ABdhPJzpozZ8by5D0r7silvmHCyhLx+MYxQCb6vR8humt5otuJASI2AoNyyt0A26g8/it7SzwBZTww==
X-Received: by 2002:a37:b807:: with SMTP id i7mr29645139qkf.126.1619630503084; 
 Wed, 28 Apr 2021 10:21:43 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id c192sm270624qke.25.2021.04.28.10.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:21:42 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lbnsb-00E4vb-HO; Wed, 28 Apr 2021 14:21:41 -0300
Date: Wed, 28 Apr 2021 14:21:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210428172141.GW2047089@ziepe.ca>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426133924.GK2047089@ziepe.ca>
 <20210427024506.GL1551@zhen-hp.sh.intel.com>
 <20210427121235.GM2047089@ziepe.ca>
 <20210428053243.GQ1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428053243.GQ1551@zhen-hp.sh.intel.com>
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

On Wed, Apr 28, 2021 at 01:32:43PM +0800, Zhenyu Wang wrote:
> On 2021.04.27 09:12:35 -0300, Jason Gunthorpe wrote:
> > On Tue, Apr 27, 2021 at 10:45:06AM +0800, Zhenyu Wang wrote:
> > > On 2021.04.26 10:39:24 -0300, Jason Gunthorpe wrote:
> > > > On Mon, Apr 26, 2021 at 05:41:42PM +0800, Zhenyu Wang wrote:
> > > > > @@ -1667,19 +1773,26 @@ static struct mdev_parent_ops intel_vgpu_ops = {
> > > > >  
> > > > >  static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
> > > > >  {
> > > > > -	struct attribute_group **kvm_vgpu_type_groups;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > >  
> > > > >  	intel_gvt_ops = ops;
> > > > > -	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
> > > > > -		return -EFAULT;
> > > > > -	intel_vgpu_ops.supported_type_groups = kvm_vgpu_type_groups;
> > > > > +	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;
> > > > 
> > > > This patch is an improvement, but this fictional dynamic behavior is
> > > > still wrong. The supported_type_groups directly flows from the
> > > > vgpu_types array in vgpu.c and it should not be split up like this
> > > > 
> > > > The code copies the rodata vgpu_types into dynamic memory gvt->types
> > > > then copies that dynamic memory into a dynamic gvt_vgpu_type_groups,
> > > > which makes very little sense at all.
> > > 
> > > vgpu_types is static for we want fixed vgpu mdev type, but actual supported
> > > types depend on HW resources e.g aperture mem, fence, etc, that's dynamic for
> > > gvt->types, so gvt_vgpu_type_groups is dynamic from gvt->types.
> > 
> > Well, that's worse then, intel_vgpu_ops.supported_type_groups is a
> > static global, it cannot depend on HW variable calculations.
> 
> sorry, maybe I didn't describe this properly, gvt_vgpu_type_groups is
> static global, but the actual supported types is determined from
> gvt->types and initialized before mdev device register.

No, I got it, I saw the code too.

Think about what happens if there are two GPUs in the system, you get
two gvt's and with different properties and you are trying to squeeze
that into a single static global - it doesn't work. 

Jason

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
