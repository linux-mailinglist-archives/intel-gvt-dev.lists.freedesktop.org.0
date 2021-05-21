Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9338138CDAF
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 May 2021 20:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DD46E7D1;
	Fri, 21 May 2021 18:43:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6026E7D1;
 Fri, 21 May 2021 18:43:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93B3861175;
 Fri, 21 May 2021 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621622588;
 bh=ZTYZ2vkk6ZEMhBdg/58fdsoFgDZsU5AoD++exEvZkvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dd1ss57MZaX10YODkyzjMSFGbN07ojOFThATdB0X1+6q8psLPnRt/yU4vpQIBlPdd
 4EfhSDrBMMRkSCJs/TM3Wb4MHDQYWwNtHs+WSLHmwlBGdgUPNZnEB7G9D9QC4R15V7
 e3Z0/KrrQg4hRv08xW+ZLcXbLRhA9VJkrpHa0R0E=
Date: Fri, 21 May 2021 20:43:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gvt: remove local storage of debugfs file
Message-ID: <YKf/OUC2WxHhDJPD@kroah.com>
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
 <YKPrRW+zBC8Wmjgz@kroah.com>
 <20210519080313.GH4589@zhen-hp.sh.intel.com>
 <YKTM1tQ7SMPnYgiV@kroah.com>
 <20210519082123.GI4589@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519082123.GI4589@zhen-hp.sh.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 04:21:23PM +0800, Zhenyu Wang wrote:
> On 2021.05.19 10:31:18 +0200, Greg Kroah-Hartman wrote:
> > On Wed, May 19, 2021 at 04:03:13PM +0800, Zhenyu Wang wrote:
> > > On 2021.05.18 18:28:53 +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, May 18, 2021 at 06:17:05PM +0200, Greg Kroah-Hartman wrote:
> > > > > There is no need to keep the dentry around for the debugfs kvmgt cache
> > > > > file, as we can just look it up when we want to remove it later on.
> > > > > Simplify the structure by removing the dentry and relying on debugfs
> > > > > to find the dentry to remove when we want to.
> > > > > 
> > > > > By doing this change, we remove the last in-kernel user that was storing
> > > > > the result of debugfs_create_long(), so that api can be cleaned up.
> > > > > 
> > > > > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Cc: intel-gvt-dev@lists.freedesktop.org
> > > > > Cc: intel-gfx@lists.freedesktop.org
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
> > > > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > > 
> > > > Note, I can take this through my debugfs tree if wanted, that way I can
> > > > clean up the debugfs_create_long() api at the same time.  Otherwise it's
> > > > fine, I can wait until next -rc1 for that to happen.
> > > > 
> > > 
> > > It's fine with me to go through debugfs tree. Just double check that recent
> > > kvmgt change would not cause conflict with this as well.
> > 
> > How can I check that?  I'll be glad to take this through my tree, we can
> > handle the merge issues later for 5.14-rc1 :)
> > 
> 
> Current kvmgt change in merge queue is just https://patchwork.freedesktop.org/patch/433536/?series=89995&rev=2
> It applies fine with debugfs change.

Thanks, I'll go take this through my tree now.

greg k-h
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
