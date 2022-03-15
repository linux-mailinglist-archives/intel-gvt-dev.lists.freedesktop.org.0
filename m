Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E24D96AE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Mar 2022 09:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B81010E858;
	Tue, 15 Mar 2022 08:48:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFDC10E84F;
 Tue, 15 Mar 2022 08:48:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D8ED868AA6; Tue, 15 Mar 2022 09:48:17 +0100 (CET)
Date: Tue, 15 Mar 2022 09:48:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
Message-ID: <20220315084817.GA4105@lst.de>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
 <4e2faf7b-383e-58b3-8ae9-8f8d25c64420@intel.com>
 <20220315075217.GA2830@lst.de> <87a6drvc02.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6drvc02.fsf@intel.com>
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Xu,
 Terrence" <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 10:46:53AM +0200, Jani Nikula wrote:
> On Tue, 15 Mar 2022, Christoph Hellwig <hch@lst.de> wrote:
> > Just curious, what is the state of this seris?  It would be good to
> > have it ready early on for the next merge window as there is quite
> > a backlog that depends on it.
> 
> Can't speak for the status of the series, but for drm the deadline for
> changes headed for the merge window is around -rc5/-rc6 timeframe
> i.e. this has already missed the upcoming merge window.

I know.  I meant the next one, not the one ending now.  And I don't
want to miss another one.
