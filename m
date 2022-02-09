Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4524AEB03
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Feb 2022 08:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDEA10E3DB;
	Wed,  9 Feb 2022 07:28:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC3C10E1D2;
 Wed,  9 Feb 2022 07:28:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 10BB668AFE; Wed,  9 Feb 2022 08:28:06 +0100 (CET)
Date: Wed, 9 Feb 2022 08:28:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
Message-ID: <20220209072805.GA9050@lst.de>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871r0dqtjf.fsf@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Terrence Xu <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 jgg@nvidia.com, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, hch@lst.de,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 05:15:00PM +0200, Jani Nikula wrote:
> >  #ifdef CONFIG_DRM_I915_GVT
> > +
> > +#define D_BDW   (1 << 0)
> > +#define D_SKL	(1 << 1)
> > +#define D_KBL	(1 << 2)
> > +#define D_BXT	(1 << 3)
> > +#define D_CFL	(1 << 4)
> > +
> > +#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
> > +#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> > +
> > +#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
> > +#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> > +
> > +#define D_PRE_SKL	(D_BDW)
> > +#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> 
> If these really need to be in a header in i915/, I think they need to be
> longer with some namespacing or something. I do wish these could be
> hidden though.

I think we could actually kill them off entirely.  They are used as
arguments to the macros that setup the mmio table.

Thefunctions to build these tabls are already organized by families,
so we'd need relatively few conditions to just build them the right
way.  There also are some runtime checks in the callbacks, but they
seem entirely superflous as far as I can tell.

Only the cmd parser is a bit messy.  So maybe we could keep these
constants just for the cmd parser inside of gvt for now (and clean
that up later) and remove them entirely from the mmio table.
