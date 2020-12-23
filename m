Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614162E1191
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 03:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9FA6E876;
	Wed, 23 Dec 2020 02:11:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EC96E876
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 02:11:18 +0000 (UTC)
IronPort-SDR: WgTZTpLwLReaXd1fHgjlooQOy7Nar32gSw+zp3EOPpIMBzvLYbaI1+fPk5wTREf5xJe4+Sv7vo
 Fw2M0qXC0xcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="172438902"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="172438902"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:11:17 -0800
IronPort-SDR: /ZZrg0g/3nC1vAdm8whQ+JOqnimLqkHknGfRZyqAknL1djbrR9HVMVsbdFFgq8+mj8X+xMWhcE
 DiQyUV2zaGAw==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; d="scan'208";a="373770848"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 18:11:12 -0800
Date: Wed, 23 Dec 2020 09:58:28 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 01/11] drm/i915/gvt: parse init context to update cmd
 accessible reg whitelist
Message-ID: <20201223015828.GA10522@yzhao56-desk.sh.intel.com>
References: <20201209043949.2454-1-yan.y.zhao@intel.com>
 <20201209044029.2525-1-yan.y.zhao@intel.com>
 <20201222052322.GZ16939@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222052322.GZ16939@zhen-hp.sh.intel.com>
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
> > +out:
> > +	if (!ret)
> > +		gvt->is_reg_whitelist_updated = true;
> > +
> > +	for (id = 0; id < I915_NUM_ENGINES ; id++) {
> > +		if (!requests[id])
> > +			continue;
> > +		i915_request_put(requests[id]);
> > +
> > +		if (!is_ctx_pinned[id])
> > +			continue;
> > +		intel_context_unpin(s->shadow[id]);
> 
> In error path, these two steps looks inconsistent which could skip ctx unpin...
> 
sorry, will fix it!

> > +	}
<...>
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
