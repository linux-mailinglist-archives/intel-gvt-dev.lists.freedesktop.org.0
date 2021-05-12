Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1EA37BCC8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 May 2021 14:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEB06EB90;
	Wed, 12 May 2021 12:47:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357926EB97
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 May 2021 12:47:42 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id l12so1913385qvm.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 May 2021 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jAGy+JHdAmwNt8Bec89jnmlR78e6xLrPonC4ZI12jKE=;
 b=P6dJCVfBboZLy6Qj65kvv5oi1/jgzznaW59dTu8qZkQdVicGScWORY97i82DBJhuNz
 uRzkehcgqAqzWFUfH7mId/TnXW+I1Ff4vX2tA5aX1DN8RL/j97P8/7mTRVSXEWgImExJ
 qCDN6DPAFxEA5I2A/RF8yxkTRMEx8L/zsyMnJPpyCgT8VywifbRXZkEL2Hg3Sa/9uYzK
 vhVvJn8K/1WYh3LZ/wpJzl6u9NypXUzZiUnOpx/ht3kdu3aY2hH5wR+YWklN3m8edFqm
 hI8NnuJD8BaR/RBZykuFXqSbUdA26rYZCNI1s4bCFnn0DMgApo0TGU9xel4kHNrHcBe7
 dDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jAGy+JHdAmwNt8Bec89jnmlR78e6xLrPonC4ZI12jKE=;
 b=ELbRonmpMVCi0NX0nrjb6ofsDdCsDTENyB5OOBzZySUKTVRQ/LCP2EVrbkmc23safs
 ykMfaidp1/GjE0nK9Ze0LqeCgGvUtELpkUPUdx4xYrOYun6Ol3nvTkttzQPNN59TWosl
 kwYZzsKKLvJFiD37KiYBJCt89UKhlR7//NYCpCGXtdsYI+o8aVs85jQHj3fPtn1yd/Dp
 CKdYZac/oXEMyfKfIRFVE+Q461r13T5xgBRTymwvceTvypPbndp2HBDvcx4XlIrVzx7z
 Whs+yKY4pOH40mqt/Rnws+yFAaF08WRLHM+38aiBpgWnRVktVP8iycaxkm+3/SfgCZn/
 0d5Q==
X-Gm-Message-State: AOAM533ojVbmDmN/ErTk5bSA1eAMHiFHmM6+Vlbyk8oePNXbDvuNuDpe
 11b4dH6Eo9ZWy8cLirE/m2ay+w==
X-Google-Smtp-Source: ABdhPJxeOvS68z8rvD2C8CZ/9X9K+hsI1yZ9ZF/EoBHpjQEDtoUYOcfm/uNANdnvRRCINv9TYaLAOw==
X-Received: by 2002:a0c:ab12:: with SMTP id h18mr34499125qvb.33.1620823661290; 
 Wed, 12 May 2021 05:47:41 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id j9sm18921372qtl.15.2021.05.12.05.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 05:47:40 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lgoH5-005pYR-V2; Wed, 12 May 2021 09:47:39 -0300
Date: Wed, 12 May 2021 09:47:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210512124739.GC1096940@ziepe.ca>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
 <20210511155446.GB1096940@ziepe.ca>
 <20210512023141.GN4589@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512023141.GN4589@zhen-hp.sh.intel.com>
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

On Wed, May 12, 2021 at 10:31:41AM +0800, Zhenyu Wang wrote:

> > This need to go into the vfio tree in some way, either directly
> > through it, via rc or otherwise
> 
> As this is only for i915/gvt, once drm/i915 backmerge with linus master,
> it should still go through normal i915/gvt merge path.

Don't do this, you will create conflicts with ongoing vfio work.

Jason

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
