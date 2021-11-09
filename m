Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC9944A7DA
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Nov 2021 08:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5C26E03C;
	Tue,  9 Nov 2021 07:51:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8A6E5B6;
 Tue,  9 Nov 2021 07:51:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7B51568AFE; Tue,  9 Nov 2021 08:51:01 +0100 (CET)
Date: Tue, 9 Nov 2021 08:51:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/3] i915/gvt: seperate tracked MMIO table from handlers.c
Message-ID: <20211109075100.GA27284@lst.de>
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
 <875yt17qzs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yt17qzs.fsf@intel.com>
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
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org, hch@lst.de,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 09:00:39AM +0200, Jani Nikula wrote:
> On Mon, 08 Nov 2021, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> > From: Zhi Wang <zhi.wang.linux@gmail.com>
> >
> > To support the new mdev interfaces and the re-factor patches from
> > Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
> > MMIO snapshot still needs to be saved in i915 so that the inital clean HW
> > state can be used for the further vGPU. Seperate the tracked MMIO table
> > from GVT-g, so that GVT-g and i915 can both use it.
> 
> Do you really have to both put code in a header and then include that in
> multiple places?
> 
> I think you may need to rethink the whole approach, maybe make them
> actual tables instead of code.

Without understanding this code too well: an approach that makes in
actual table and uses an accessor seems more useful to me as well.
