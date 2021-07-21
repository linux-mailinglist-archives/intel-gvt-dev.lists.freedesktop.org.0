Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB13D0E20
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 13:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A16E8F4;
	Wed, 21 Jul 2021 11:52:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3CF6E8F4;
 Wed, 21 Jul 2021 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Miekl0C0jt9QTUkhKolvQiEeelj16BDxerlUgw6Y5Ls=; b=mjaixGJM9DpTtil5lLRGoN7FCz
 lhdJCK+WaS4BeCpDxDNsbhnIXOTALHJK9O5RP4I7SevCps2bVA+e5BDqZQbC4mzJSwk6k2VGnHStX
 ivaW6CzdreSz/7QBh8QQLdbMNaPWpYLKQHrSuNPbmXyfHpjorpxtEKXlZ0y00C9dzlwLX+jol5aj+
 rB5HI1i8WoTucXzTUdfvBxVQqm5870ECMStinCNLyRsA1NKx76dvEOBOyqfB0gwgAZbYkzGDf71fA
 Ts+fV7cE5yQJwkN4C5cQObNLzGwoNgmEBWVt98P7t8lePaQv2i1Rydi87j62gX1OzMBxnD7U6ocaN
 oHPGi/iw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6AlM-0099Pz-2X; Wed, 21 Jul 2021 11:51:48 +0000
Date: Wed, 21 Jul 2021 12:51:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <YPgKUFddtu6Vj6KO@infradead.org>
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

Haven't tried anything earlier, but I'll try 5.13.

> 
> Could you please file a bug to our gitlab issues tracker:
> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs

That seems to require a login, so no.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
