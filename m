Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF79140D96
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Jan 2020 16:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243616F5E0;
	Fri, 17 Jan 2020 15:15:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7E06F5DD;
 Fri, 17 Jan 2020 15:15:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 07:15:42 -0800
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="218934603"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 07:15:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Wean gvt off
 dev_priv->engine[]
In-Reply-To: <157164501001.24426.17278525357815707355@skylake-alporthouse-com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191016183902.13614-1-chris@chris-wilson.co.uk>
 <20191016183902.13614-2-chris@chris-wilson.co.uk>
 <20191021053724.GB8745@zhen-hp.sh.intel.com>
 <157164501001.24426.17278525357815707355@skylake-alporthouse-com>
Date: Fri, 17 Jan 2020 17:15:36 +0200
Message-ID: <87ftgegllz.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 21 Oct 2019, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Zhenyu Wang (2019-10-21 06:37:24)
>> On 2019.10.16 19:39:02 +0100, Chris Wilson wrote:
>> > Stop trying to escape out of the gvt layer to find the engine that we
>> > initially setup for use with gvt. Record the engines during initialisation
>> > and use them henceforth.
>> > 
>> > add/remove: 1/4 grow/shrink: 22/28 up/down: 341/-1410 (-1069)
>> > 
>> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> > ---
>> 
>> Thanks for this cleanup! Quick review seems good to me, although it
>> looks pretty fine for me on ring_id replacement, this big one also
>> includes other changes like indent fix, debugfs item change, etc.
>> Could we split them for easier merge? Can have a gvt developer to
>> help on that.
>
> Just make gvt/ checkpatch clean so that CI doesn't reject patches
> because the surrounding code does not conform to coding style.

Sadly this has fallen between the cracks. Could someone pick this up
again please, maybe from the gvt team?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
