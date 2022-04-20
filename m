Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54756508EA9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 19:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8F810E215;
	Wed, 20 Apr 2022 17:40:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80BA10ED80
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Apr 2022 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650476443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6Zu8efagxCg0qjIbj3LGsUm4V9r8EQ58X79KLBO8as=;
 b=Jh0vJuYeLXNjNvBoHmeQdiO+226CJo7QymEj1RC80qqGe6tNDcxW1wfNjbl+gSdqW+WLPX
 gj1OlJYwcuozE0iDUBOuVvYptzLt5s/2DMXe6rQrogXlbBz/qet5EeBvp5OiJLZkVC+Kw4
 Hn0gBmzTlcUw0UEnyg3rrHMzuMtkyp4=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-hHDGLk8dOo2EhG-U-T9BGA-1; Wed, 20 Apr 2022 13:40:42 -0400
X-MC-Unique: hHDGLk8dOo2EhG-U-T9BGA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-e653506dd0so628960fac.14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Apr 2022 10:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=N6Zu8efagxCg0qjIbj3LGsUm4V9r8EQ58X79KLBO8as=;
 b=l4RBzaVZvJ9wZDFxqoKRqcwgAAfzb7KYTU0OXGdkgFwWZP3SR86pGMwls4QhSCmlyI
 4UHmZ6GlePSm6oxrZM3bF5t63PxF7CxpkGjKZ870/wAFQCO0XUxaaEyB75xu1UdSBPEB
 FJN4W8W6aDn2X5YQNTjA7/hP+CIii3XMV9ysTt7eOGBWVAswVxOPmGPBbMGpTqps0HhQ
 jOu4F5wYfM2+lRnZKE1Axb4n8sX8s2u+froweWtUl9IvTFpg7spIIIO2AVDFWAvgqAye
 Ur8al5G55Z+DOwzcFJH4dKaNlpi0HHERCW9hSwAiWTp2mcx8F4PTNUu1dWkQ8dYMPT7e
 GulA==
X-Gm-Message-State: AOAM5314ihICsMqVlGUCMfs1CvAqyuG42Ft4xpLtzZHvqiWYRWGp7MOO
 thk1x8JJhuRf/bROAsjSu2O2Dl0a0HVkp4CnjDDJRvWzmGg/9nwTc6qNkVizJJY56+SaoeMOX8Q
 UDwwmA1U7KHRMc8KpzacGYrMirXR6A2jNeg==
X-Received: by 2002:a4a:b3c5:0:b0:324:527f:8709 with SMTP id
 q5-20020a4ab3c5000000b00324527f8709mr7558539ooo.90.1650476441819; 
 Wed, 20 Apr 2022 10:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQODyrfz4O2ySVJfB4AMKPDpvPokiiH++tjPxvtaenmiy7ATr53rd1FOYaFbMSL0CEN6bEdQ==
X-Received: by 2002:a4a:b3c5:0:b0:324:527f:8709 with SMTP id
 q5-20020a4ab3c5000000b00324527f8709mr7558526ooo.90.1650476441569; 
 Wed, 20 Apr 2022 10:40:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c8-20020a4ad788000000b0031ce69b1640sm6870564oou.10.2022.04.20.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 10:40:41 -0700 (PDT)
Date: Wed, 20 Apr 2022 11:40:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PULL v2] gvt-next
Message-ID: <20220420114033.7f8b57c7.alex.williamson@redhat.com>
In-Reply-To: <20220420164351.GC2120790@nvidia.com>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 13:43:51 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Apr 20, 2022 at 04:34:47PM +0000, Wang, Zhi A wrote:
> > Hi folks:
> > 
> > Here is the PR of gvt-next. Thanks so much for the patience.
> > 
> > Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> > new MDEV interfaces:
> > 
> > - Separating the MMIO table from GVT-g. (Zhi)
> > - GVT-g re-factor. (Christoph)
> > - GVT-g mdev API cleanup. (Jason)
> > - GVT-g trace/makefile cleanup. (Jani)
> > 
> > Thanks so much for making this happen.
> > 
> > This PR has been tested as following and no problem shows up:
> > 
> > $dim update-branches
> > $dim apply-pull drm-intel-next < this_email.eml
> > 
> > The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> > 
> >   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20-for-christoph
> > 
> > for you to fetch changes up to ae7875879b7c838bffb42ed6db4658e5c504032e:
> > 
> >   vfio/mdev: Remove mdev drvdata (2022-04-20 03:15:58 -0400)  
> 
> This looks well constructed now! thanks
> 
> Alex you can pull this for VFIO after Jani&co grab it
> 
> I'll respin my vfio_group series on top of this branch

Sure, so just to confirm tags/gvt-next-2022-04-20-for-christoph is
pruned down to exactly the commits we're looking for now?  Thanks,

Alex

