Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0064FFA5F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 17:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F49A10E579;
	Wed, 13 Apr 2022 15:36:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC48310E579;
 Wed, 13 Apr 2022 15:36:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8EAFF68BEB; Wed, 13 Apr 2022 17:36:41 +0200 (CEST)
Date: Wed, 13 Apr 2022 17:36:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
Message-ID: <20220413153641.GA27532@lst.de>
References: <cover.1649852517.git.jani.nikula@intel.com>
 <48b772795b7ab674f609ecad53b4882c66a8262a.1649852517.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48b772795b7ab674f609ecad53b4882c66a8262a.1649852517.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.wang.linux@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 03:25:38PM +0300, Jani Nikula wrote:
> TRACE_INCLUDE_PATH should be a path relative to define_trace.h, not the
> file including it. (See the comment in include/trace/define_trace.h.)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
