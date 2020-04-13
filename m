Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0D1A66BB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Apr 2020 15:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFE189ED6;
	Mon, 13 Apr 2020 13:08:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D1B89ED6;
 Mon, 13 Apr 2020 13:08:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2D8A968BEB; Mon, 13 Apr 2020 15:08:07 +0200 (CEST)
Date: Mon, 13 Apr 2020 15:08:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 3/6] i915/gvt: remove unused xen bits
Message-ID: <20200413130806.GA14455@lst.de>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-4-hch@lst.de>
 <20200408014437.GF11247@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408014437.GF11247@zhen-hp.sh.intel.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org, linux-mm@kvack.org,
 Al Viro <viro@zeniv.linux.org.uk>, intel-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:44:37AM +0800, Zhenyu Wang wrote:
> On 2020.04.04 11:40:58 +0200, Christoph Hellwig wrote:
> > No Xen support anywhere here.  Remove a dead declaration and an unused
> > include.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> We'll keep that off-tree.
> 
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Can you pick this up through the i915 tree?
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
