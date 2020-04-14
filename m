Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23981A6FF5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Apr 2020 02:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265FC6E42D;
	Tue, 14 Apr 2020 00:13:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731DC6E42D;
 Tue, 14 Apr 2020 00:13:53 +0000 (UTC)
IronPort-SDR: LABzmBzP4iD3hXYGMjALoa2ev3cUycAtjg5kfTLlPMFfqp4oqPg8clLqBVuSNB4EoL4id7Wq5U
 Dri14JugCuIg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 17:13:53 -0700
IronPort-SDR: WwSP/bjwzVqCvzpfDJVQx7mHVD9DqAVfA90u9u6YJ0BE3eg8B7Aus6XqC75wdrzGtPX0vlI9oI
 I6IjfgU71shQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,380,1580803200"; d="scan'208";a="277078198"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2020 17:13:48 -0700
Date: Mon, 13 Apr 2020 20:04:10 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/6] i915/gvt/kvm: a NULL ->mm does not mean a thread is
 a kthread
Message-ID: <20200414000410.GE10586@joy-OptiPlex-7040>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-3-hch@lst.de>
 <20200407030845.GA10586@joy-OptiPlex-7040>
 <20200413132730.GB14455@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413132730.GB14455@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Wang <jasowang@redhat.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, linux-mm@kvack.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 03:27:30PM +0200, Christoph Hellwig wrote:
> On Mon, Apr 06, 2020 at 11:08:46PM -0400, Yan Zhao wrote:
> > hi
> > we were removing this code. see
> > https://lore.kernel.org/kvm/20200313031109.7989-1-yan.y.zhao@intel.com/
> 
> This didn't make 5.7-rc1.
> 
> > The implementation of vfio_dma_rw() has been in vfio next tree.
> > https://github.com/awilliam/linux-vfio/commit/8d46c0cca5f4dc0538173d62cd36b1119b5105bc
> 
> 
> This made 5.7-rc1, so I'll update the series to take it into account.
> 
> T
> > in vfio_dma_rw(),  we still use
> > bool kthread = current->mm == NULL.
> > because if current->mm != NULL and current->flags & PF_KTHREAD, instead
> > of calling use_mm(), we first check if (current->mm == mm) and allow copy_to_user() if it's true.
> > 
> > Do you think it's all right?
> 
> I can't think of another way for a kernel thread to have a mm indeed.
for example, before calling to vfio_dma_rw(), a kernel thread has already
called use_mm(), then its current->mm is not null, and it has flag
PF_KTHREAD.
in this case, we just want to allow the copy_to_user() directly if
current->mm == mm, rather than call another use_mm() again.

do you think it makes sense?

Thanks
Yan

> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
