Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED853F2BA
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4641910E24D;
	Mon,  6 Jun 2022 23:46:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B543C10E247
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:46:28 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id br33so10366521qkb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BobLl+SlFstwFdCAgot2j19OhmEJmjKMcmrAyX++IpQ=;
 b=nTfkLS746hnRkFmQz8zZo7fxRpg63kXstyT8r7gW9PDX8jfk8n9wPYN+FQ0XgmC9fz
 nii/p1w15omesttBp8810sHQEh+P+NwdH+lOHKg2lWA3f2I8rz+/LiPoLfY9Uf3zExmn
 lZvIKLet/yrIs+LRJwbHr5A1+ceMHQeE50rVoUBTkrXSrBNNMbtbnb9Nvh3bdrFCuqce
 GrOxC1ZVY9FnqjAoPe7//ERX/vTKxps9R4em/RHDci4XEK17vekdDuvS/NZ2BAnQli9z
 Q3lznZLbcnaaLSm+/994C56wGWaJJmwTkCqSGQ7EQ/olGImF4gaBV85YzOVtWO4suYRA
 k0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BobLl+SlFstwFdCAgot2j19OhmEJmjKMcmrAyX++IpQ=;
 b=mpaDQ8aXiN3LgOPNQYBMmlp13knfGG4MNbuKOEQg0mu1c/ML2FrjVvARuPVtKMxrAA
 ckrOsnR6tGf7F4fiOhPSmNBcBLSImQpHnYQ25QUoAn83dZ7qw3Qpapxd5cI/+uHkGswT
 DxKO4hvDQvrzw6Unj+y4BeJt9cr4pbSavWFvgXRqVxiFKFLQILK2dx/Fc6wlu/HiJjpz
 +n+UX4G5yWml5Fi+iy+GdK+zN+cXNkEvxquW3dIu0tS7AnTNh1MNPPGdHp/UEHYlHscm
 gsHM7PPOhDRqDoJQVJ6Rzc3f+YsUyc6HYKvgMrgmzOQazi6aHq/7SpPqc0/goXKECp4P
 k4uw==
X-Gm-Message-State: AOAM530ABkMok9KaCRidCT5l1NZqdcPjDNc00+A6pUPy1EdZhSTr+niE
 dDnl68gXi1jCCfm1eOb/aOdCRg==
X-Google-Smtp-Source: ABdhPJxdw6L/xOuwADspsqstoD5nz7gt8vQH/za9tZhkeo/mqgj+nrGe6IzJ+9V9rqmxQ7fk9+5a4w==
X-Received: by 2002:ae9:eb88:0:b0:6a6:b3e3:4c44 with SMTP id
 b130-20020ae9eb88000000b006a6b3e34c44mr6995123qkg.83.1654559187889; 
 Mon, 06 Jun 2022 16:46:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 g16-20020ac85810000000b002f906fc8530sm2525617qtg.46.2022.06.06.16.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:46:27 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyMQU-002q3M-Lz; Mon, 06 Jun 2022 20:46:26 -0300
Date: Mon, 6 Jun 2022 20:46:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/8] vfio/mdev: remove mdev_parent_dev
Message-ID: <20220606234626.GH3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-8-hch@lst.de>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 08:33:27AM +0200, Christoph Hellwig wrote:
> Just open code the dereferences in the only user.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/driver-api/vfio-mediated-device.rst | 3 ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c                  | 2 +-
>  drivers/vfio/mdev/mdev_core.c                     | 6 ------
>  include/linux/mdev.h                              | 1 -
>  4 files changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
