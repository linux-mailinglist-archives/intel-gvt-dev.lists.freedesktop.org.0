Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97857D1C0
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Jul 2022 18:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52310F8F2;
	Thu, 21 Jul 2022 16:42:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D7211AE58
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Jul 2022 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpgjxHYzUdT13dg92JGLQAgwmOcrc+nlknH/en5JH44=;
 b=RI2+3b9D3uHFwxoJ7qtwOrVY8ZtBrMNDfujWVCjTtfGR4gVTTLf6HIzm2suXrfUIdw19KB
 hB4DSwItppZUmgX6oaQorCSTw4UmRUZanWgPpiekxJU/r6GnwXASViKdUJECQ9yXERdTxi
 bkB5uwrlnw6yqjV2L8cmtV0Bear4/cs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-LNeSS2YXNbSgRWFIHtJJSw-1; Thu, 21 Jul 2022 12:42:01 -0400
X-MC-Unique: LNeSS2YXNbSgRWFIHtJJSw-1
Received: by mail-il1-f198.google.com with SMTP id
 d6-20020a056e020be600b002dcc7977592so1201749ilu.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Jul 2022 09:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=lpgjxHYzUdT13dg92JGLQAgwmOcrc+nlknH/en5JH44=;
 b=w3vtJhOuBB1MCrQ1ZjZefAM6o7MqxaL+RySawphENkfGOLf5q44K8x/mOBHGtrqaz0
 NUVTUzRY2Zdfa9kA5+1+SwGCqmtmjuqMcjnhVne2btSZycPpHelhMtvGMgu/D3zpIxwx
 KMe6c6coEftW4j32OjcWVtzqDsHubJoWzT62gmbax9aL7uqzwUNUaCO8wG61GMQWSFnH
 C2bctfS8JJv7mAc3j8BK5XRaDQXgK7VZZ8wyjf9Xgq0aKyeadXbmLXerB5H0U7jhIXqC
 4G3wbmgS7Dfbok2i5F8H2CotEjo9lgJvADM8hV77p9oX7LXanYxxbFNuVYtvyouHgLxo
 NzPw==
X-Gm-Message-State: AJIora9MANKxraAk1/nMoCFyGBrFhDXq3JzuncXLNqtj5RyiwExsCE5+
 Zus0eJQ5JCKpskP/GrbZFAZrMEG5OGiJeLg3D0WwRmAsTFVPZOB7LeTh/bs/jFjLcbvxRd9Mc73
 dyZ3dIRMMtyjofiPF28FJae2ve04iLmm/xg==
X-Received: by 2002:a02:9995:0:b0:33f:1def:a856 with SMTP id
 a21-20020a029995000000b0033f1defa856mr24004780jal.140.1658421721176; 
 Thu, 21 Jul 2022 09:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDra+sBjomhufuKVE3FoD1JmBYjfrwTVbG3vPUfrMl7qSHvCezbvx0MjlGPc8ncq7OqQjIFA==
X-Received: by 2002:a02:9995:0:b0:33f:1def:a856 with SMTP id
 a21-20020a029995000000b0033f1defa856mr24004742jal.140.1658421720864; 
 Thu, 21 Jul 2022 09:42:00 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d184-20020a0262c1000000b0033f0c9f4fbesm978665jac.135.2022.07.21.09.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:42:00 -0700 (PDT)
Date: Thu, 21 Jul 2022 10:41:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220721104158.225a3562.alex.williamson@redhat.com>
In-Reply-To: <d4b7abce8ef8646819d32fef57ea51e38cd53f1b.camel@linux.ibm.com>
References: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <20220720134113.4225f9d6.alex.williamson@redhat.com>
 <20220720200829.GW4609@nvidia.com>
 <20220720170457.39cda0d0.alex.williamson@redhat.com>
 <d4b7abce8ef8646819d32fef57ea51e38cd53f1b.camel@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 21 Jul 2022 12:01:47 -0400
Eric Farman <farman@linux.ibm.com> wrote:

> On Wed, 2022-07-20 at 17:04 -0600, Alex Williamson wrote:
> > On Wed, 20 Jul 2022 17:08:29 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Wed, Jul 20, 2022 at 01:41:13PM -0600, Alex Williamson wrote:
> > >    
> > > > ie. we don't need the gfn, we only need the iova.    
> > > 
> > > Right, that makes sense
> > >    
> > > > However then I start to wonder why we're passing in 1 for the
> > > > number of
> > > > pages because this previously notifier, now callback is called
> > > > for the
> > > > entire vfio_dma range when we find any pinned pages.      
> > > 
> > > Well, it is doing this because it only ever pins one page.  
> > 
> > Of course that page is not necessarily the page it unpins given the
> > contract misunderstanding below.
> >    
> > > The drivers are confused about what the contract is. vfio is
> > > calling
> > > the notifier with the entire IOVA range that is being unmapped and
> > > the
> > > drivers are expecting to receive notifications only for the IOVA
> > > they
> > > have actually pinned.
> > >   
> > > > Should ap and ccw implementations of .dma_unmap just be replaced
> > > > with a
> > > > BUG_ON(1)?    
> > > 
> > > The point of these callbacks is to halt concurrent DMA, and ccw
> > > does
> > > that today.  
> > 
> > ccw essentially only checks whether the starting iova of the unmap is
> > currently mapped.  If not it does nothing, if it is it tries to reset
> > the device and unpin everything.  Chances are the first iova is not
> > the
> > one pinned, so we don't end up removing the pinned page and type1
> > will
> > eventually BUG_ON after a few tries.
> >   
> > > It looks like AP is missing a call to ap_aqic(), so it is
> > > probably double wrong.  
> > 
> > Thankfully the type1 unpinning path can't be tricked into unpinning
> > something that wasn't pinned, so chances are the unpin call does
> > nothing, with a small risk that it unpins another driver's pinned
> > page,
> > which might not yet have been notified and could still be using the
> > page.  In the end, if ap did have a page pinned in the range, we'll
> > hit
> > the same BUG_ON as above.
> >   
> > > What I'd suggest is adding a WARN_ON that the dma->pfn_list is not
> > > empty and leave these functions alone.  
> > 
> > The BUG_ON still exists in type1.
> > 
> > Eric, Matt, Tony, Halil, JasonH, any quick fixes here?  ccw looks
> > like
> > it would be pretty straightforward to test against a range rather
> > than
> > a single iova.  
> 
> Agreed, ccw looks pretty easy. Should I send something to go before
> this series to make stable easier? (It's a trivial change in either
> direction, so either is fine to me.)

It looks like we're expecting an rc8 for this development cycle, so the
merge window will be pushed out a week (which works better for some
upcoming PTO on my end), but if it's trivial either way let's plan for
the fix to follow Nicolin's and Jason's series and we can always post a
backport to the stable list if there's any trouble.  Thanks,

Alex

