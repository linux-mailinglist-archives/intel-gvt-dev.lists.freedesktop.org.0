Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7B2C9787
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 07:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47286E483;
	Tue,  1 Dec 2020 06:26:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4D46E483
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 06:26:14 +0000 (UTC)
IronPort-SDR: GhJbuw37NZS03AVdTtlOJ+o2wYdRLIQBXF9tBDWDYl+0i/9FHfV75Nfaf6YYo1v6kE44VecSS2
 Lf/HjINFuihA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172873258"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="172873258"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:26:13 -0800
IronPort-SDR: 2wtHikhi3k86P/pbZ86gg4Yr15Hl73Z/lc1G/i8KoHSezO2cMvJPPX+ZmtgG+fEC+sN2hr5vq+
 W6RZ9dZS2kbg==
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="549428012"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:26:12 -0800
Date: Tue, 1 Dec 2020 14:13:37 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 01/10] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Message-ID: <20201201061337.GB31495@yzhao56-desk.sh.intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
 <20201125003741.17857-1-yan.y.zhao@intel.com>
 <20201201054604.GQ16939@zhen-hp.sh.intel.com>
 <20201201060430.GA31495@yzhao56-desk.sh.intel.com>
 <20201201060539.GS16939@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201060539.GS16939@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Wang Zhi <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<...> 
> > > > +
> > > > +	if (intel_gt_wait_for_idle(&dev_priv->gt,
> > > > +				I915_GEM_IDLE_TIMEOUT) == -ETIME) {
> > > > +		ret = -EIO;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	for_each_engine(engine, &dev_priv->gt, id) {
> > > > +		struct i915_request *rq;
> > > > +
> > > > +		rq = requests[id];
> > > > +		GEM_BUG_ON(!i915_request_completed(rq));
> > > > +		GEM_BUG_ON(!intel_context_is_pinned(rq->context));
> > > > +		ctx_obj[id] = rq->context->state->obj;
> > > > +	}
> > > > +
> > > 
> > > and these two iterations?
> > This iteration cannot be combined with previous one because there's only
> > one intel_gt_wait_for_idle for all rings.
> >
> 
> yeah, I mean above this and below which handles for each engine's ctx,
> should be in one, right?
> 
yes, I'll try to merge them.

Thanks for spotting it :)


Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
