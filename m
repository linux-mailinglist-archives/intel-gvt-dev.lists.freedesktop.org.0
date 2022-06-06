Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A820553F2BC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5826E10E247;
	Mon,  6 Jun 2022 23:46:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E0F10E247
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:46:39 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id x16so8254662qtw.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j1H7IqILsLgN2CLXPDKK6acRAfuZh56Xcw12qco3jXo=;
 b=bc9kiCl7t9BZtFVHNxzFELos2shypIE0YUTZCngM0Yp7jg9XtY9c6eUzlTZP2E1Jk5
 AXxKO4dl1Ci4IwS1k/Sh25q55jcee0jvpBKkK95nwry1tJxmgXCek/f5NPaXEhFIuWw+
 4ppyLgdp95IsMou+3NZPE4LClKvKT/DTg56fW9rT9uxjn/L9KpsViEA+dYagM/H74iqz
 PSm9+uW7uTYReIf6JlsHjyweJ0+MaCdVncu97/sSvSqrDeNIudGRAYg5bXmOFBfW8INF
 g/haibEx0ibK72fG0Oi2l0qAsZXAPcwu+MjNxjQpYDlwYQc1j6SktB/0rZzAb4vMeQSa
 QmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j1H7IqILsLgN2CLXPDKK6acRAfuZh56Xcw12qco3jXo=;
 b=W0A0zlrUK2TPHDMoVptsk8WDkWBr03/4kmP76p5gK8Www2Q+v/POobpY9Q7QycWuj4
 7bYn728mCo6yZwKhxWVXIQnJJZWh9NdX2KL8ti6usvE1rSPhHBlrRM8FsncbH3WAL4c6
 dPaHif/GSAulpltIAUBT66DUrJwUU7mwxqmWOPc24AFngjPKkbAH8J+kyWfFAD6K3lif
 Ra7A/WQTUAZrcJaGwOP5Co3ATlWmtKOWbkgsVLAU2lpGR4q5tKAUUYeuorsKmX7NSrcT
 IkXln6euqgz35UUyeXtpJ0YXw8E29+y3Col8K/OQ70ORBRS10/2JfLXwYvaaaLoiSCFI
 QHtg==
X-Gm-Message-State: AOAM532Ifuqe2RwBcC3paWDt2s+VBtq+AT1uRrKEvQat3pGXiJ4FhqJ7
 KOAeiKjmQTR1jd6Oxu9G8yR8hA==
X-Google-Smtp-Source: ABdhPJz68POlk+9eI9qP8Z7p2wfePXMmY+ovCyRTsxy5OMhFkzf6KgrRPgaa4PQPV7u/FDrTKaAJuA==
X-Received: by 2002:ac8:5f0b:0:b0:2f9:3e0c:b569 with SMTP id
 x11-20020ac85f0b000000b002f93e0cb569mr20105545qta.663.1654559198226; 
 Mon, 06 Jun 2022 16:46:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 cb24-20020a05622a1f9800b002fc8a2c14c0sm11031129qtb.66.2022.06.06.16.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:46:37 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyMQf-002q3r-3h; Mon, 06 Jun 2022 20:46:37 -0300
Date: Mon, 6 Jun 2022 20:46:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 8/8] vfio/mdev: remove mtype_get_parent_dev
Message-ID: <20220606234637.GI3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-9-hch@lst.de>
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

On Fri, Jun 03, 2022 at 08:33:28AM +0200, Christoph Hellwig wrote:
> Just open code the dereferences in the only user.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/s390/cio/vfio_ccw_ops.c |  3 +--
>  drivers/vfio/mdev/mdev_core.c   | 10 ----------
>  include/linux/mdev.h            |  2 --
>  3 files changed, 1 insertion(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
