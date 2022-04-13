Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA164FFAFD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 18:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F22410E485;
	Wed, 13 Apr 2022 16:12:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56DF10E485;
 Wed, 13 Apr 2022 16:12:15 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 723C368AFE; Wed, 13 Apr 2022 18:12:12 +0200 (CEST)
Date: Wed, 13 Apr 2022 18:12:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 0/2] drm/i915/gvt: clean up makefile
Message-ID: <20220413161212.GA30300@lst.de>
References: <cover.1649852517.git.jani.nikula@intel.com>
 <20220413154120.GC27532@lst.de> <87y209ezq1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y209ezq1.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 07:04:54PM +0300, Jani Nikula wrote:
> > v6:
> >  - Remove the reference of intel_gvt_device_info.(Christoph)
> >  - Refine the save_mmio() function. (Christoph)
> >
> > which don't belong in the commit log.  It might be worth to fix that
> > before sending a pull request.
> 
> I'll just note, without any value judgement, that it is customary in the
> drm land to do so. They are fine here even if they're not accepted in
> other subsystems. I'm not going to insist one way or the other.

Ok.  Seems very odd to me, but I guess I don't spend enough time in
drm land to know this particular quirk.
