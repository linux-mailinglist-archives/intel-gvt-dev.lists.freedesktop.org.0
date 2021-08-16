Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B53ECE8E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Aug 2021 08:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6D589C07;
	Mon, 16 Aug 2021 06:22:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C7C89C07;
 Mon, 16 Aug 2021 06:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xsvqImlktTgwIAXp0oXAhVPLBXMkPr0Ho9dmWnNdMJA=; b=UrSgpLdoF+H/N7Mjn7t7PKMHmm
 qtyRLsfb3vDWrGlrTcDbPt62gZDE4mrKzTbcGQB6ol832WftuIeyJOsIeF63tTFA1LoyTiovCj0y8
 pdfKFMuI/ujC9fbzDVz2d6pLMvok72DU1TsFQXeb2KNRZNSfGUyAdGneAL0ZxTAz8UTjFBRn20i2B
 TepVE3aA4ebk8I6lsCsyQyPoVxHvdWDj4Ny365Q/uhZ03fmXKANAWnUxXxY1WU5rzmEClT2W5oTih
 tfIwLA9z+hwh0Bez5aMR8DHGAKKQAhBSKFu3KjkVLaBuG1Rkmexb24nP8x/QZEZwzrj1g5oGjpTQE
 TgSGCCWA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mFW0J-0012V1-0B; Mon, 16 Aug 2021 06:21:53 +0000
Date: Mon, 16 Aug 2021 07:21:46 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: i915 timeouts delaying boot under GVT
Message-ID: <YRoD+p2tdkfAmA8U@infradead.org>
References: <YRYRwG5jscfl54pj@infradead.org>
 <20210816024534.GV13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816024534.GV13928@zhen-hp.sh.intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Aug 16, 2021 at 10:45:34AM +0800, Zhenyu Wang wrote:
> Hi, Christoph, what platform is this?

Kaby Lake ( i7-8550U)

>
> And what's your guest i915 config?

guest config as in i915-related .config options?

---------------- snip ----------------
CONFIG_DRM_I915=y
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging
#

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=100
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation
---------------- snip ----------------
