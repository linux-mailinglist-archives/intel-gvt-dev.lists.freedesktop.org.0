Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586E3D23EA
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jul 2021 14:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A436E971;
	Thu, 22 Jul 2021 12:55:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453F6E971;
 Thu, 22 Jul 2021 12:55:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9C05767373; Thu, 22 Jul 2021 14:55:19 +0200 (CEST)
Date: Thu, 22 Jul 2021 14:55:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210722125519.GA25887@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
 <20210722094516.GQ13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722094516.GQ13928@zhen-hp.sh.intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 05:45:16PM +0800, Zhenyu Wang wrote:
> The reason we isolated hypervisor specific code from core vgpu
> emulation is to make multiple hypervisor support possible. Yes, we do
> have Xen support but never got way into upstream...And we also have
> third party hypervisors which leverage gvt function through current
> hypervisor interface.

Out of tree stuff simply does not matter for the upstream kernel,
especially when it creates such a huge burden.

As a background:  I started this refactoring as a lot of the code did
not make much sense when reviewing the mdev integration in preparation
to switching them to the new mdev interface from Jason.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
