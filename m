Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A51A73F3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Apr 2020 09:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727B56E45C;
	Tue, 14 Apr 2020 07:00:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E89D6E456;
 Tue, 14 Apr 2020 07:00:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 024D068BEB; Tue, 14 Apr 2020 09:00:13 +0200 (CEST)
Date: Tue, 14 Apr 2020 09:00:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 2/6] i915/gvt/kvm: a NULL ->mm does not mean a thread
 is a kthread
Message-ID: <20200414070013.GA23680@lst.de>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-3-hch@lst.de>
 <20200407030845.GA10586@joy-OptiPlex-7040> <20200413132730.GB14455@lst.de>
 <20200414000410.GE10586@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414000410.GE10586@joy-OptiPlex-7040>
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
 Alex Deucher <alexander.deucher@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Wang <jasowang@redhat.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, linux-mm@kvack.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 08:04:10PM -0400, Yan Zhao wrote:
> > I can't think of another way for a kernel thread to have a mm indeed.
> for example, before calling to vfio_dma_rw(), a kernel thread has already
> called use_mm(), then its current->mm is not null, and it has flag
> PF_KTHREAD.
> in this case, we just want to allow the copy_to_user() directly if
> current->mm == mm, rather than call another use_mm() again.
> 
> do you think it makes sense?

I mean no other way than using use_mm.  That being said nesting
potentional use_mm callers sounds like a rather bad idea, and we
should avoid that.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
