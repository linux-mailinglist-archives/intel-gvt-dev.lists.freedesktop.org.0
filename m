Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FCD8A154A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 11 Apr 2024 15:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AAC10F0A5;
	Thu, 11 Apr 2024 13:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l0iizJYj";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434C110FA5D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2024 13:07:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60623CE3081;
 Thu, 11 Apr 2024 13:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E59C433C7;
 Thu, 11 Apr 2024 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712840869;
 bh=pTPEJwwsJFjYG713GzWA/+ri2JEjt8G3lmiEPr5+Q7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l0iizJYjhDA9viVVBrewQz0x7ceASK0mzGS6oEsloKRpkcsx0urG/1EddVpslYkG2
 ZcuAUfOTiffyentqlm1/+PjzykDbUViTFaJCl1BBw6vGvcIm9Sy0l+11wci9GMAemP
 2BrR5/70rrKjL+iKFVTAZ13fvRwkPdHIvhpsukYQ=
Date: Thu, 11 Apr 2024 15:07:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
Message-ID: <2024041128-huddling-humped-4304@gregkh>
References: <cover.1712410202.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1712410202.git.lukas@wunner.de>
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

On Sat, Apr 06, 2024 at 03:52:00PM +0200, Lukas Wunner wrote:
> For my upcoming PCI device authentication v2 patches, I have the need
> to expose a simple buffer in virtual memory as a bin_attribute.
> 
> It turns out we've duplicated the ->read() callback for such simple
> buffers a fair number of times across the tree.
> 
> So instead of reinventing the wheel, I decided to introduce a common
> helper and eliminate all duplications I could find.
> 
> I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
> name. ;)

Seems like no one objects, should I just take this through my
driver-core tree for 6.10?

thanks,

greg k-h
