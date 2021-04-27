Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D136C5DB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Apr 2021 14:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5E86E94F;
	Tue, 27 Apr 2021 12:12:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA1F6E952
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Apr 2021 12:12:37 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id ef17so23159351qvb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Apr 2021 05:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=41k4dMp2hdNODxhFmA9x5RtkMYLKn0cWlpbJA4yJMuc=;
 b=WQ9bo+k8pcaQAcp8boCJwTqy6h/zpbGR8UzUgZz8OBg36ABj9LwN8dzupSMa42G06e
 6fzsFFZLKYtouuLE1OTSl0lNyikQnS0STRWzuaVLweGpfIAIa5IQZir+XuGqUe/Dt3YH
 N0DRlsjutokQeyBIQrwmLdNHaLF2x3QWhBVT0qyevkfhpgiVNZjKTP2wHpU4C4voghWp
 5XxCdoyOmswlWOV+avls2ZUBjW6zlUsnh9GjvVuXciPVqADJpglH+qiOVAkg4dc35yUo
 +jgyty5OaUbcGG9ObUaXLy3jkzO+GJHtrSV6fcZmCdUCsfL0T6W/b5IT2qEycgNAKD7p
 xcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=41k4dMp2hdNODxhFmA9x5RtkMYLKn0cWlpbJA4yJMuc=;
 b=a2btJe906yYeMpVsYZlMILg22t+oO8pe933S0QpxvN5sOo+9gVgadGeuUhqgnwRyDK
 oljnT/vzVlCRBzp19RnMgBK0NJAOC5UMtoXAz8dELHTGxEBj3rGEar+7T0Bq6kKlMIPM
 sF4+6sMl4RFDP0mxvI/KydGFFp0Dwwa/B220KXlwzEmn90kqEuhoqkxh3I6DpVWaBjqO
 eMFa9cfB1YWKxA6j67WJxd+ewcGZmIPQURlE2lSK4m76a1+S1A9LUQm5cDlbh1Vhhg2x
 z0qjfK+WFs53fwSx4WUYOvDYjFJUnVi7l07ypKLyoxt/GZm7v/cfb06i70E8KNZ1NAej
 SiRg==
X-Gm-Message-State: AOAM533P2dSOhyW078lWMUq/QlNk5AmZdzo0SUrm0F4U4BSehgrfMZI9
 CM7yXbgkoopG4VcOmHndBQVnPw==
X-Google-Smtp-Source: ABdhPJzF14eqoJb49YKYwQVITQG9zd2YPk5SL9BzDEpUEDTPTdq35DpcGt5hf6skksZsgk6gQkMIFQ==
X-Received: by 2002:a0c:8bda:: with SMTP id a26mr23016684qvc.1.1619525556460; 
 Tue, 27 Apr 2021 05:12:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id a3sm13264204qto.2.2021.04.27.05.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 05:12:36 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lbMZv-00DVlr-Ar; Tue, 27 Apr 2021 09:12:35 -0300
Date: Tue, 27 Apr 2021 09:12:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210427121235.GM2047089@ziepe.ca>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426133924.GK2047089@ziepe.ca>
 <20210427024506.GL1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427024506.GL1551@zhen-hp.sh.intel.com>
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

On Tue, Apr 27, 2021 at 10:45:06AM +0800, Zhenyu Wang wrote:
> On 2021.04.26 10:39:24 -0300, Jason Gunthorpe wrote:
> > On Mon, Apr 26, 2021 at 05:41:42PM +0800, Zhenyu Wang wrote:
> > > @@ -1667,19 +1773,26 @@ static struct mdev_parent_ops intel_vgpu_ops = {
> > >  
> > >  static int kvmgt_host_init(struct device *dev, void *gvt, const void *ops)
> > >  {
> > > -	struct attribute_group **kvm_vgpu_type_groups;
> > > +	int ret;
> > > +
> > > +	ret = intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
> > > +	if (ret)
> > > +		return ret;
> > >  
> > >  	intel_gvt_ops = ops;
> > > -	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
> > > -		return -EFAULT;
> > > -	intel_vgpu_ops.supported_type_groups = kvm_vgpu_type_groups;
> > > +	intel_vgpu_ops.supported_type_groups = gvt_vgpu_type_groups;
> > 
> > This patch is an improvement, but this fictional dynamic behavior is
> > still wrong. The supported_type_groups directly flows from the
> > vgpu_types array in vgpu.c and it should not be split up like this
> > 
> > The code copies the rodata vgpu_types into dynamic memory gvt->types
> > then copies that dynamic memory into a dynamic gvt_vgpu_type_groups,
> > which makes very little sense at all.
> 
> vgpu_types is static for we want fixed vgpu mdev type, but actual supported
> types depend on HW resources e.g aperture mem, fence, etc, that's dynamic for
> gvt->types, so gvt_vgpu_type_groups is dynamic from gvt->types.

Well, that's worse then, intel_vgpu_ops.supported_type_groups is a
static global, it cannot depend on HW variable calculations.

Jason
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
