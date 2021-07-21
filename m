Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE53D1840
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 22:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435F76E524;
	Wed, 21 Jul 2021 20:41:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780D36E840;
 Wed, 21 Jul 2021 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EJgGjA01GZw3Yk9ZuhCaXi6YbsFe3EryWSZjq277foA=; b=h3JWY57SwxRcR5pkUIK2zmYtJJ
 7a+Z5F+3nByq1Otuzd3mX2goCAHcU52bqd+/GFpbQx7M89j0+L07jP447bmO54RI1+v9md0mtp3DQ
 yMmaAsofQIVKcsOTC2NqoNfke+7F4A1JwWe8vnkBHUScE4PcB0rGXtmEhSEo23HwX9QjjtedNiqTC
 qhdkvMt+h+FE8iX5jejQNRZOW/l7yf/nFaLuoxF44xI+hQOafljSfNOsv8RVDn/fhhsnk5hgYWoUC
 QfyiO/a5vDFO0oSX5iqE+NnezrrwagppGUuA6qywjrIHa6D1UyPqxlb9EysxUnuRNe1bYm+1wYoU6
 hx5eJenA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6J0d-009aFJ-Us; Wed, 21 Jul 2021 20:40:09 +0000
Date: Wed, 21 Jul 2021 21:40:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <YPiGI9tzLzGZg47j@infradead.org>
References: <YPgAuSt6Ps7w4/AI@infradead.org> <YPgD/8Y3/te/Hsu3@intel.com>
 <YPhApJo1o6yBYUh2@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPhApJo1o6yBYUh2@infradead.org>
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

On Wed, Jul 21, 2021 at 04:43:44PM +0100, Christoph Hellwig wrote:
> > > I'm trying to test some changes for the gvt code, but even with a baseline
> > > 5.14-rc2 host and guest the 915 driver does not seem overly happy:
> > 
> > Is this a regression over -rc1 or over 5.13?
> > Bisect possible?
> 
> This was introduced somewhere between 5.12 and 5.13, still bisecting.
> Note that it only happens for "headless" setups.  Once a display is
> added on the qemu command line it goes away.

The culprit is:

commit f4eb6d4906669b4285c4f49c87814d4ce63c35bb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 17 18:36:45 2021 +0200

    drm/i915/bios: limit default outputs to ports A through F
        
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
