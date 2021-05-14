Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78373380960
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 May 2021 14:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8C06E1DE;
	Fri, 14 May 2021 12:21:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE726E1DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 May 2021 12:21:11 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id g13so22037522qts.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 May 2021 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v8WUS08p0vBGtW2th1ZAXkZ6OvxGpScuDQHTR4hEaW0=;
 b=jgIPQ+0b+xMaY88MFJEbBXiGTcLAGI6OWeKQTdL/TclX5nBfr2HG9Im8dlfPFnGc7J
 crCIAa4zZPv2CjD9NV9DFuTOqZkhHu6jzEXu5FbCaYoypltiHkQaumz9RsFdn9qBgS6V
 wbBlY32Xg3Ue3WpJsq7CLSjLM6g2EmxycMXpUKw4WguDNN5wEmAVuDnjpOoslEmNuc5g
 ItK3GiHlQxOGYLIgYCmpn8fgVJhe5Y4y4sGrUh0oXeF2/mWa7z3WtiRYk/ftpn2nrBn4
 cAAQE/bWcj0XI9zyKZf+Z6KSB0EQAqUhW+K+YxmzJ4Z2aCRKJ/HNvrRbfH2uMassA3kz
 Dh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v8WUS08p0vBGtW2th1ZAXkZ6OvxGpScuDQHTR4hEaW0=;
 b=WXirB+4flp9m8XLpRXy0UOfeai2FwxLcwpdlcVyo1IRvsFLDfvpgqGSFKYnMu0jHdO
 q1dWeHPPbHFUnFdzupu9Aw2aRM3K0Rcs731dLTbM3TTMy0RkDUm68PXyjPs0j0ACIBkh
 5qoFjiquk1HHMu79W+9WNweT5oDJj7UouodkCtemrdkYmI0Qgr8O4ocvdu6PL6wq6CAR
 TodTK/2HHIZ4TgAFanFpSn3rY/oBWfNhvcp9FsCcfvpvIwXBW1H3CvCfwmTMkq332bg6
 IAyskspD2E+wBstneKAKW2b7Gj9lFRcYRQ11yU6jxMmLVZXPbQODrCCew08rv1CFspUu
 Hj2w==
X-Gm-Message-State: AOAM533dLr/SlOZC4KeDsiWrzEy5y9Wzp2LB2oupnHJXqmmx+Y30DHqx
 wJGmFRj3RrPmHuLlu8+0CNmULw==
X-Google-Smtp-Source: ABdhPJwYx5JXKopE4lFACVUDqw3WMJBR3URd1CunJELa9xF8EadY9C5aK63hY+/m/l26nfEcjxueyw==
X-Received: by 2002:a05:622a:130a:: with SMTP id
 v10mr29515101qtk.113.1620994871094; 
 Fri, 14 May 2021 05:21:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id i5sm4549385qki.115.2021.05.14.05.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:21:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lhWoY-007OKN-13; Fri, 14 May 2021 09:21:10 -0300
Date: Fri, 14 May 2021 09:21:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210514122110.GJ1096940@ziepe.ca>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
 <20210511155446.GB1096940@ziepe.ca>
 <20210512023141.GN4589@zhen-hp.sh.intel.com>
 <20210512124739.GC1096940@ziepe.ca>
 <20210513045647.GQ4589@zhen-hp.sh.intel.com>
 <20210513120249.GH1096940@ziepe.ca>
 <20210514070808.GW4589@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210514070808.GW4589@zhen-hp.sh.intel.com>
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

On Fri, May 14, 2021 at 03:08:08PM +0800, Zhenyu Wang wrote:
> On 2021.05.13 09:02:49 -0300, Jason Gunthorpe wrote:
> > On Thu, May 13, 2021 at 12:56:47PM +0800, Zhenyu Wang wrote:
> > > On 2021.05.12 09:47:39 -0300, Jason Gunthorpe wrote:
> > > > On Wed, May 12, 2021 at 10:31:41AM +0800, Zhenyu Wang wrote:
> > > > 
> > > > > > This need to go into the vfio tree in some way, either directly
> > > > > > through it, via rc or otherwise
> > > > > 
> > > > > As this is only for i915/gvt, once drm/i915 backmerge with linus master,
> > > > > it should still go through normal i915/gvt merge path.
> > > > 
> > > > Don't do this, you will create conflicts with ongoing vfio work.
> > > > 
> > > 
> > > Sure, there always could be conflict, which means you need to rebase onto
> > > this cleanup. Would that a problem? 
> > 
> > Yes.
> > 
> > > I'd want to fix current workaround in 5.13-rc.
> > 
> > This doesn't seem like a rc candiate to me, but going to -rc is also
> > fine.
> > 
> > > Merging i915/gvt only change through vfio doesn't make sense to me,
> > 
> > You need to do it to avoid major conflicts for stuff that will go into
> > the vfio tree this cycle.
> 
> Looks apply to vfio/for-linus is fine, and vfio/next missed gvt change to
> apply...but not conflict with any new stuff. Alex, pls let me know if you
> have any concern of this.

The conflicting stuff hasn't landed to a tree yet, I am helping you
plan things out so you don't have to explain to Linus why your tree
has conflicts all over the place.

> > VFIO drivers should not be outside drivers/vfio/ in the first place,
> > and this shows why.
> > 
> 
> Well, I can't agree, otherwise that'll be dependency nightmare for device
> driver writer. ;)

Not really

Jason 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
