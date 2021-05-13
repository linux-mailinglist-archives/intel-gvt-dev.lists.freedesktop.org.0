Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42E37F756
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 May 2021 14:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991466ED00;
	Thu, 13 May 2021 12:02:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4E36ED00
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 May 2021 12:02:51 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 197so25144221qkl.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 May 2021 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K0iESOGZ18bCGFfLNCmCdFLmkE5q7MuymvwD5hGCDAI=;
 b=G3HV4nugaJEGAFM7aMItJmT1OmTq7vvAx8sZAqtnEs1Fbfl/dota7J1hL+npeIO61L
 tIpVnKI0iyub4/DGt/x1+D7YRMuSQQrOkQ+imZQLLd/8KPVWmgTZaarRQaX6R2pjYin6
 IsFZR7/BRLVvmOwuFMqNmxuv3b0SBhLCfLBjdnnirDo3oQhS7o3B1MfJfydHKVOdGsWt
 fNnLSC/luVP29wzOsKs60C/B1zO6ixvxDToYMNJMNS4TS9LoUmEzPdTNzmy2NsnORjuY
 zw/J+jAP0NMeXkEfGx3DjR4Ou4c5Az71pOCHknQ3NVEnXz5p9HEJbf7EqKwwKKuz5z6o
 VG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K0iESOGZ18bCGFfLNCmCdFLmkE5q7MuymvwD5hGCDAI=;
 b=NNVqc2Yni5G1xMPSW+XEUv3sjLS0PK2CCrqAQO5t2Gim/+QDJyVOMBE0PR7viudLVJ
 +GrDpqLUfmsYfILA+zv0I+MTtojrs1vpno6T+E6NE77DWFkc/K+wjJvGXKdvrROdbj0P
 zFQUAAJ1zEW0/hR3eUakahB860xSF88LR7uLdsEolr1ehxquqymd1eBB4lQF7kEs6uvm
 5EDTg2SENKtQEjhs8XbiEHJ9NpmEr+nQrRE9lBOrp9TODhRhpXN6ZaMWT9cWk5z+aUu4
 cgJ85Yd75zwBdtDe7yJqfVbtbPzMzknEmn0yIAaUZmWqiY38f4lP0wyRF6T9sLmrYnbs
 jrJA==
X-Gm-Message-State: AOAM532OGbCaBRFusNPRFtovkzDlEuxD3HesUsy5wP4aC6UbP2XaLDA6
 ZGjmMRMF/3glJGJ3bl4GG1l1xQ==
X-Google-Smtp-Source: ABdhPJwOHIPFB/6XTJQgJ1pLfizJmR6aedzGmxsFN48dohNG9D5p6f+/tzllBOnkp8EVUlG/PvP8PA==
X-Received: by 2002:a37:a391:: with SMTP id m139mr38993014qke.4.1620907370688; 
 Thu, 13 May 2021 05:02:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id y6sm2267877qkd.106.2021.05.13.05.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:02:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lhA3F-006nvr-QA; Thu, 13 May 2021 09:02:49 -0300
Date: Thu, 13 May 2021 09:02:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210513120249.GH1096940@ziepe.ca>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
 <20210511155446.GB1096940@ziepe.ca>
 <20210512023141.GN4589@zhen-hp.sh.intel.com>
 <20210512124739.GC1096940@ziepe.ca>
 <20210513045647.GQ4589@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513045647.GQ4589@zhen-hp.sh.intel.com>
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

On Thu, May 13, 2021 at 12:56:47PM +0800, Zhenyu Wang wrote:
> On 2021.05.12 09:47:39 -0300, Jason Gunthorpe wrote:
> > On Wed, May 12, 2021 at 10:31:41AM +0800, Zhenyu Wang wrote:
> > 
> > > > This need to go into the vfio tree in some way, either directly
> > > > through it, via rc or otherwise
> > > 
> > > As this is only for i915/gvt, once drm/i915 backmerge with linus master,
> > > it should still go through normal i915/gvt merge path.
> > 
> > Don't do this, you will create conflicts with ongoing vfio work.
> > 
> 
> Sure, there always could be conflict, which means you need to rebase onto
> this cleanup. Would that a problem? 

Yes.

> I'd want to fix current workaround in 5.13-rc.

This doesn't seem like a rc candiate to me, but going to -rc is also
fine.

> Merging i915/gvt only change through vfio doesn't make sense to me,

You need to do it to avoid major conflicts for stuff that will go into
the vfio tree this cycle.

VFIO drivers should not be outside drivers/vfio/ in the first place,
and this shows why.

Jason
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
