Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B91AD617
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 08:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC03E6E32B;
	Fri, 17 Apr 2020 06:31:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442E6E101;
 Fri, 17 Apr 2020 06:31:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CB09368BEB; Fri, 17 Apr 2020 08:31:02 +0200 (CEST)
Date: Fri, 17 Apr 2020 08:31:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: improve use_mm / unuse_mm v2
Message-ID: <20200417063102.GA18556@lst.de>
References: <20200416053158.586887-1-hch@lst.de>
 <20200417031744.GI5820@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417031744.GI5820@bombadil.infradead.org>
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
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-usb@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 08:17:44PM -0700, Matthew Wilcox wrote:
> On Thu, Apr 16, 2020 at 07:31:55AM +0200, Christoph Hellwig wrote:
> > this series improves the use_mm / unuse_mm interface by better
> > documenting the assumptions, and my taking the set_fs manipulations
> > spread over the callers into the core API.
> 
> I appreciate all the work you're doing here.
> 
> Do you have plans to introduce a better-named API than set_fs() / get_fs()?

Eventually.  For now I just plan to kill as many as possible.

> Also, having set_fs() return the previous value of 'fs' would simplify
> a lot of the callers.

One thing that should go relatively soon is the need to store the
previous value because we'll have so few callers left that we know we can't
recurse. We should be able to get there around 5.9 / 5.10.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
