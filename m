Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0753F2A0
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43B51127CD;
	Mon,  6 Jun 2022 23:38:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B41127CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:38:10 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 15so6885913qki.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ewFcKPOa+2x6RXhVIR+v/VURcDtYVPRav4oUF2Rq3Fg=;
 b=hI01O5N11a+OWG1HisFkBQQWBXV1w6StkkZG9lXxvx7pzAsflSoBkrnnIt8qVcLeZX
 QpKb+uW+AUIFqqFs5Jzomqg/B47cQ2LYJKT5bdMgCXEwoaqctUc4IqQnw3yh6zgZ7X28
 lo23+1PCLig/vrVM3kbEbK48GIF2JeDaLiu6FPpw95BYJw9qp8jpZB8Gy0kRx0dYfNib
 2ML1mQIuoBQnZ1b45+il30LtIeeOScKxr8Kri0+EXFkLswIqeAjulzgb21a0KaJMtIdn
 7gLl7d9IzgsEjbMk3wgL151ZaHyv57BO9K1jI6BZLt8PBeVkRuh/iIsIzmWNTqq/7E6W
 hRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ewFcKPOa+2x6RXhVIR+v/VURcDtYVPRav4oUF2Rq3Fg=;
 b=PJcUjv95FoSrQHHpGA8ESRIygHiloU5ToPBFkuu/Ub09tBjBAr6nPokBmC7IdFNBrp
 4jt2SAuWyAghL5of1oLkJ96z1C0XbcQi+oR07QNCuIQozVsQxVuHBpMugUovykQMWFyQ
 gmprs+PBDqibodO9VpwMMDBjggsWue1lb/3MkGu5gRbMAgop5uV9L/Z+pZ0B0Jmh7Fjg
 Jrow0KeK9bx/sPcymEx6n5PRDlRcGg8aVbe+lPIdeOtNcim1EOk8Cmq3EHv1Oq0kJ/sj
 x/dx0NR0zjIVAXpuABB0CC756Z3FdYf0aHbwydSkVHi17Wq7YPc5Piyyki2rETYQchu9
 FRdw==
X-Gm-Message-State: AOAM532I2quJ2FFQXEsZyKVhBliqB3HYV2ddiNRkxIe1g6TlBJNSsohg
 3bbZ0CP0kB6TkeJya9ivoNMtEQ==
X-Google-Smtp-Source: ABdhPJzf37dz4Rqa77kSjV+oZpBSb6XWF30qEzih0C5uqAelmaT+JRLEKFfxjiPEZKYVgGEeLV8wig==
X-Received: by 2002:a05:620a:370f:b0:6a6:d7c3:a7f2 with SMTP id
 de15-20020a05620a370f00b006a6d7c3a7f2mr178760qkb.644.1654558689919; 
 Mon, 06 Jun 2022 16:38:09 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 a25-20020ac87219000000b00304eaca5e5csm3784236qtp.73.2022.06.06.16.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:38:09 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyMIS-002prR-Pq; Mon, 06 Jun 2022 20:38:08 -0300
Date: Mon, 6 Jun 2022 20:38:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/8] vfio/mdev: simplify mdev_type handling
Message-ID: <20220606233808.GD3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-4-hch@lst.de>
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

On Fri, Jun 03, 2022 at 08:33:23AM +0200, Christoph Hellwig wrote:

> @@ -112,9 +88,10 @@ int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
>  			return -ENOMEM;
>  	}
>  
> -	ret = parent_create_sysfs_files(parent);
> -	if (ret)
> -		return ret;
> +	parent->mdev_types_kset = kset_create_and_add("mdev_supported_types",
> +					       NULL, &parent->dev->kobj);
> +	if (!parent->mdev_types_kset)
> +		return -ENOMEM;
>  
>  	ret = class_compat_create_link(mdev_bus_compat_class, dev, NULL);
>  	if (ret)
[..]
	kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);

This changes the ordering with respect to this udev event, now the
mdev_supported_types directory is created but the directory is empty,
then the driver fills it after the KOBJ_CHANGE event is triggered.

Granted this whole abusing some other struct device's sysfs thing is
inherently wrong - I'm not really sure what impact this has. Though at
least someone seemed to care since their is this uevent here...

Maybe we need a 'finish register' call to trigger the uevent? Or
perhaps trigger the uevent when each add_type is done?

Everything else looks fine though, I looked at this for a while a long
time ago and didn't see this nice final arrangement :\

Jason
