Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E166F44A813
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Nov 2021 09:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C9E6E527;
	Tue,  9 Nov 2021 08:01:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D96E4BA;
 Tue,  9 Nov 2021 08:01:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EA08867373; Tue,  9 Nov 2021 09:01:39 +0100 (CET)
Date: Tue, 9 Nov 2021 09:01:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v2
Message-ID: <20211109080139.GD27339@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
 <DM4PR11MB554905AC416FBD055251DE43CA8D9@DM4PR11MB5549.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB554905AC416FBD055251DE43CA8D9@DM4PR11MB5549.namprd11.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 02:51:28PM +0000, Wang, Zhi A wrote:
> Is it possible to separate the refactor part from the using new mdev API stuff? So that the design opens in the re-factor patches wouldn’t block the process of mdev API improvement?

Jason had an early patch for it, but it looks so horrible that I'd much
rather sort out the underlying issues first.
