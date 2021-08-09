Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE73E4788
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Aug 2021 16:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3290089C33;
	Mon,  9 Aug 2021 14:29:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E83890DB;
 Mon,  9 Aug 2021 14:29:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2CAA967357; Mon,  9 Aug 2021 16:29:45 +0200 (CEST)
Date: Mon, 9 Aug 2021 16:29:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/21] drm/i915/gvt: move the gvt code into kvmgt.ko
Message-ID: <20210809142945.GA18850@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
 <20210721155355.173183-5-hch@lst.de>
 <162850857939.5634.17747219922172884449@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162850857939.5634.17747219922172884449@jlahtine-mobl.ger.corp.intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 02:29:39PM +0300, Joonas Lahtinen wrote:
> Thanks for putting the work into this. This conversion has been
> requested for a long time. For clarity, should we call the module
> i915_kvmgt?

If this was a new module that would be my preferance.  But the
kvmgt module already exists, so I thought it might be a good idea
to keep the name.

> How far would we be from dynamically modprobing/rmmoding the kvmgt
> module in order to eliminate the enable_gvt parameter?

Hmm.  I suspect it could be done fairly easily, but from what I see
it would still require to disable GUC at i915 module load time.

If you want I could look into that for an incremental patch, but
to unblock the vfio/mdev work I'd like to do that in a separate
stage.
