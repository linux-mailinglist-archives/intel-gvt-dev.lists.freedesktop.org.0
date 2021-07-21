Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BBE3D12B6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1996E819;
	Wed, 21 Jul 2021 15:44:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E1B6E819;
 Wed, 21 Jul 2021 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xGDQCg8K3gMLPJfNe3HDAYa4LlCFJK24tPvQoRpr7cQ=; b=ZlIZY+ZqXctBhXKiS5UTCH335I
 5ZhAmhVx4Ek9Z78ML0Dez5TM5NYxtgH348auvop1wOQ9GQNH5urD6Zk/Po0b1MoE9cvkEZBryUfoT
 QcqrFZ60hhh2fFSEFKp1Cu6imRGPmGLZ86JdNBlrs8ZzZloFMseDyuicn1rBHxGDoRYZaiRcYHNd+
 mRGv8ReujMZdh01Py72I9S6Oib5L5O0LipiarWxhBZjL+LnstnbWVDN7QH62aS1H5N3l4PN0egdJ2
 LrIUTIw5Oxs9NvVyiEK2KWfqmPwVgfX4mYdtKcX4J3+X9WQQ/Vbj9Yqk55imlU0QVE1iiDb3rF5JK
 jSDGtgwA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6ENg-009LhK-67; Wed, 21 Jul 2021 15:43:36 +0000
Date: Wed, 21 Jul 2021 16:43:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <YPhApJo1o6yBYUh2@infradead.org>
References: <YPgAuSt6Ps7w4/AI@infradead.org>
 <YPgD/8Y3/te/Hsu3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPgD/8Y3/te/Hsu3@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Christoph Hellwig <hch@infradead.org>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 07:24:47AM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 21, 2021 at 01:10:49PM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > I'm trying to test some changes for the gvt code, but even with a baseline
> > 5.14-rc2 host and guest the 915 driver does not seem overly happy:
> 
> Is this a regression over -rc1 or over 5.13?
> Bisect possible?

This was introduced somewhere between 5.12 and 5.13, still bisecting.
Note that it only happens for "headless" setups.  Once a display is
added on the qemu command line it goes away.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
