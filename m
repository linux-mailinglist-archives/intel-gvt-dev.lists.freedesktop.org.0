Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A23D9E71
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Jul 2021 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEAD6ECC6;
	Thu, 29 Jul 2021 07:30:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2D96ECC4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Jul 2021 07:30:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id p5so5632172wro.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Jul 2021 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tb+0rRKuqDnjOL1ASnfrRF1A89N4P92fMWjclPMkDss=;
 b=DOm1OvhgzgwgHgDIrraZ03XoHOA+d6dH762ZTJo+E6S39/5h6jRhFRd+nsUazfCfLf
 S2Lkxsdk7hwdmUXxR5OwXDEk4YRTKj7sadSS89ys7t7SG5QJL5cy5+h4oeCB0txEXIsE
 dEHc7JF5fJepkGCz2g+EKTUszzyxAsZeEzsgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Tb+0rRKuqDnjOL1ASnfrRF1A89N4P92fMWjclPMkDss=;
 b=OVVwI/67iCLDC5xXGWj5tvT+wMkJWP7m0HL038DhEww/MEolo8L9lcIpvUTgb4DWdF
 jvffCE+6Xcj+QW7qAh5jymnR20nz8QdpsT/soRSwQ2cboe7l5zkttcA9N6ePnC0WGieP
 ic9n2zJpwuwQvV47FzfKua0Reu8fgI/ufxeIfN8XsCltg5NrvY+0x5FvUTuDuPZHMQuq
 9qwqdJrrgiIdz2w7WfkuB4RQLAcVzKHZJTbyTsiz+MN3i/Ov1vWbexef3kAGYxVr2dii
 P80/R+eNJ1zcgIA/pjpiwV0mn6tB6hk9MDv0CQDqfiNW1PHJRf+uqHHrGDtOtc8zjaR4
 4y6g==
X-Gm-Message-State: AOAM532MO+cZ3ogMA6E1MNpQffEmyVSZWeb0PwA/ZMvNKpnpTSYXGxQ0
 o1emQ/h5vymcbWRbkofdzO6PLQ==
X-Google-Smtp-Source: ABdhPJzVoNhNuWzyJb6b5KpqveRPXRf80R7n4sTS1a3iK3O41OT/IBBs23MW0vHKeYXlErBFvWWpYQ==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr1549831wrw.197.1627543822183; 
 Thu, 29 Jul 2021 00:30:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q22sm2207751wmc.16.2021.07.29.00.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:30:21 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:30:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Intel-gfx] refactor the i915 GVT support
Message-ID: <YQJZCwyT9YSZWLnO@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729072022.GB31896@lst.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 09:20:22AM +0200, Christoph Hellwig wrote:
> On Wed, Jul 28, 2021 at 02:59:25PM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 28, 2021 at 01:38:58PM +0000, Wang, Zhi A wrote:
> > 
> > > I guess those APIs you were talking about are KVM-only. For other
> > > hypervisors, e.g. Xen, ARCN cannot use the APIs you mentioned. Not
> > > sure if you have already noticed that VFIO is KVM-only right now.
> > 
> > There is very little hard connection between VFIO and KVM, so no, I
> > don't think that is completely true.
> 
> The only connection is the SET_KVM notifier as far as I can tell.
> Which is used by a total of two drivers, including i915/gvt.  That
> being said gvt does not only use vfio, but also does quite a few
> direct cals to KVM.
> 
> > In an event, an in-tree version of other hypervisor support for GVT
> > needs to go through enabling VFIO support so that the existing API
> > multiplexers we have can be used properly, not adding a shim layer
> > trying to recreate VFIO inside a GPU driver.
> 
> Yes.  And if we go back to actually looking at the series a lot of
> it just removes entirely pointless indirect calls that go to generic
> code and not even the kvm code, or questionable data structure designs.
> If we were to support another upstream hypervisor we'd just need to
> union a few fields in struct intel_gpu and maybe introduce a few
> methods.  Preferably in a way that avoids expensive indirect calls
> in the fast path.

fwiw I concur with the direction of this series. gvt landed 5 years ago,
that should have been plenty of time to merge at least one of the other
backends that float around. If it didn't happen in 5 years it aint
suddenly happening in the next few, and the abstraction layer should be
sunset.

Also yes structuring it more as a helper layer with some
unions/subclassing than full blown backend abstractor layer would be a
good idea too I guess (it usually is the right thing to do).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
