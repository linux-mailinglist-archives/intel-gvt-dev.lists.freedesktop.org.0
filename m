Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846438A161D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 11 Apr 2024 15:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A31910F0BE;
	Thu, 11 Apr 2024 13:46:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 405 seconds by postgrey-1.36 at gabe;
 Thu, 11 Apr 2024 13:46:38 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80E10F0BE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2024 13:46:38 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 5FE7E28013A52;
 Thu, 11 Apr 2024 15:39:50 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 4AE723FFCDE; Thu, 11 Apr 2024 15:39:50 +0200 (CEST)
Date: Thu, 11 Apr 2024 15:39:50 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <ZhfoJkIxJvRal8aF@wunner.de>
References: <cover.1712410202.git.lukas@wunner.de>
 <2024041128-huddling-humped-4304@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024041128-huddling-humped-4304@gregkh>
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

On Thu, Apr 11, 2024 at 03:07:46PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Apr 06, 2024 at 03:52:00PM +0200, Lukas Wunner wrote:
> > For my upcoming PCI device authentication v2 patches, I have the need
> > to expose a simple buffer in virtual memory as a bin_attribute.
> > 
> > It turns out we've duplicated the ->read() callback for such simple
> > buffers a fair number of times across the tree.
> > 
> > So instead of reinventing the wheel, I decided to introduce a common
> > helper and eliminate all duplications I could find.
> > 
> > I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
> > name. ;)
> 
> Seems like no one objects, should I just take this through my
> driver-core tree for 6.10?

That would be awesome, thank you!

Lukas
