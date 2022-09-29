Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0B5EFC3D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Sep 2022 19:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851F710EB9F;
	Thu, 29 Sep 2022 17:50:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB0410EBA5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Sep 2022 17:49:59 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id jy22so817654qvb.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Sep 2022 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=xa8hoH9SnDPlJIeXGYh843CRJD1tjWdMf/dTq8TipPM=;
 b=TTqX1qhbwY8oXLjTYWELHEsRERRC+tYA4I14qRpviPTnMPxxd/vPEPS/znbsofO0+c
 4bwTdW8+z/pWbH07euOuLtVPnrXYN4FM3+Cx3+6df9BnwzMRVSyQ1vC15hIyhMjMipuQ
 qlzZ7Fu4h7IQcnc4aD13PnswpHL+dCBN4e0DgSfgytTo+Borsg650FpgD3ZVlkkzogU1
 opPTvDdjbXUTLZKa0F4b83jrDhZt81cEI/hRhpm0Bun+0Wq7SRl0wOcvarlvT3D7N0e1
 b7XskLXtlA/O+SKSR/BQgRPL969bnpg4P6x3JIZubcOO7fHzsFTljemfyNnz/GZSpyiX
 iL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=xa8hoH9SnDPlJIeXGYh843CRJD1tjWdMf/dTq8TipPM=;
 b=PpiUHqoTVqidU7ZWG3hLvX0vv3RV7TClkd0pEbNnUFp/j88Z6Ta1OYOI+lx//VxG1N
 mW8/hha0nzarIiA/kZC0sLZ55v3y5PS1eG84mOwLHJa/qSlnhdJskx+T01vvAz0bK1QW
 fc6F0kxAlcSxvEm3Oi2d6I6bJ5OIqRXknHlx2LchM1c1qTBJ9Py23bVBxG1l03Dr+UUA
 KJId1yolyvWPA3LeF7x97ivqVSDqWRdU88TLSWzsWyw8yrbcn8G9tgAaw7fWLJR+a6KX
 VB9I2l+47vptsaLnZcoljn0M5VmcIyaVhAVb+PdM8wROBErxyF/bQ1q6eQSGZh2/GXo/
 1Q5Q==
X-Gm-Message-State: ACrzQf1QFCQ7e1KKgugdcFsL7aW1AVKdfUuF8t3Ju9sYUj53L876zS3c
 x++Vihv6SfZSXQnSpoGwXpLxOg==
X-Google-Smtp-Source: AMsMyM7Xarezc23TZVeEEbR3Uk9puQBAc1mIn47qgL8JGhJP31afpTjPWuOiERJgd9lOx+IPbEN2Vg==
X-Received: by 2002:a05:6214:3006:b0:496:ad87:6784 with SMTP id
 ke6-20020a056214300600b00496ad876784mr3557984qvb.7.1664473798680; 
 Thu, 29 Sep 2022 10:49:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b006ceb8f36302sm6929qkh.71.2022.09.29.10.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 10:49:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1odxfY-003fcM-BW;
 Thu, 29 Sep 2022 14:49:56 -0300
Date: Thu, 29 Sep 2022 14:49:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 15/15] vfio: Add struct device to vfio_device
Message-ID: <YzXaxPpkc+90Xx+T@ziepe.ca>
References: <20220921104401.38898-1-kevin.tian@intel.com>
 <20220921104401.38898-16-kevin.tian@intel.com>
 <20220929105519.5c9ae1d8.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929105519.5c9ae1d8.alex.williamson@redhat.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 10:55:19AM -0600, Alex Williamson wrote:
> Hi Kevin,
> 
> This introduced the regression discovered here:
> 
> https://lore.kernel.org/all/20220928125650.0a2ea297.alex.williamson@redhat.com/
> 
> Seems we're not releasing the resources when removing an mdev.  This is
> a regression, so it needs to be fixed or reverted before the merge
> window.  Thanks,

My guess at the fix for this:

https://lore.kernel.org/r/0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com

Jason
