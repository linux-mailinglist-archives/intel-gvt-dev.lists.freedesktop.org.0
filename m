Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPeIDVi/gGl3AgMAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 02 Feb 2026 16:14:32 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF880CE029
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 02 Feb 2026 16:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB25110E2CD;
	Mon,  2 Feb 2026 15:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKJIxC3Q";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46D10E2CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Feb 2026 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770045250; x=1801581250;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YWHzaPoctVzoqtEZaOXV/rrsMeyvPBuUDEtJtDhfQRA=;
 b=PKJIxC3QenBQeJqXU3yjO3yn/ddSb1wroyV7z0524MADxdDiQCgPnDex
 Pge3v2DfZ4GR5fF7ATJYz5rW3yCU2FbkqzBqG7Stz3uGl6yzqRhWAM36w
 UnEdMWk8SNRK+sa/jQMCA1Ym3taJo1evONxBNkUj30TJlx/KJNKbUREqj
 ZaAjfO4FDFwCZJ0VVxz+HXxSrGAVaypnOtRmbBPlqpgxbdwjrKeeZ4EmT
 Zi6umC7kGJ4kd1meMeXfLkCniW+1fZWsuyahWXybPQVjyDBqAyTKmGwub
 e+j4M5Ts442I8Ms4ZrELxkUAjGxI+jK9Gz7LuyOgFfFdoCqP9Gl1oZ6+I g==;
X-CSE-ConnectionGUID: A+J8sdVcRWekj2QCoeKX+w==
X-CSE-MsgGUID: Zm6GB35fQmGel24/Tr089g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="93856980"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="93856980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:14:09 -0800
X-CSE-ConnectionGUID: mhuihvSuR1eFLyKiVg+11g==
X-CSE-MsgGUID: 5A06XyioTnuUZocmJMkIaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208646934"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:14:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ingyu Jang <ingyujang25@korea.ac.kr>, intel-gvt-dev@lists.freedesktop.org
Cc: zhenyuw.linux@gmail.com, zhi.wang.linux@gmail.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: Re: [Question] Dead code in intel_gvt_init() for
 intel_gvt_init_irq() error check?
In-Reply-To: <20260131172858.3370637-1-ingyujang25@korea.ac.kr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260131172858.3370637-1-ingyujang25@korea.ac.kr>
Date: Mon, 02 Feb 2026 17:14:03 +0200
Message-ID: <77e282c7481e7e12300c11c35072efcbe08df966@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,ursulin.net,korea.ac.kr];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ingyujang25@korea.ac.kr,m:zhenyuw.linux@gmail.com,m:zhi.wang.linux@gmail.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:zhenyuwlinux@gmail.com,m:zhiwanglinux@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jani.nikula@linux.intel.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AF880CE029
X-Rspamd-Action: no action

On Sun, 01 Feb 2026, Ingyu Jang <ingyujang25@korea.ac.kr> wrote:
> Hi,
>
> I noticed that in drivers/gpu/drm/i915/gvt/kvmgt.c, the function
> intel_gvt_init() checks the return value of intel_gvt_init_irq()
> (at line 1858):
>
>     ret = intel_gvt_init_irq(gvt);
>     if (ret)
>         goto out_free_firmware;
>
> However, looking at intel_gvt_init_irq() in
> drivers/gpu/drm/i915/gvt/interrupt.c (line 717), the function
> always returns 0 and has no error paths.
>
> What's interesting is that the function's documentation comment
> (line 714-715) states:
>     "Returns:
>      Zero on success, negative error code if failed."
>
> This suggests the function was designed to return error codes, but
> the current implementation only returns 0. The error check in
> intel_gvt_init() is therefore unreachable.
>
> Is this intentional defensive coding for potential future changes,
> or should the documentation be updated to reflect that the function
> always succeeds? Alternatively, should the function be changed to
> void since it never fails?

It may have had failure modes in the past, it may have failure modes
again in the future. I would just leave it be.

BR,
Jani.



-- 
Jani Nikula, Intel
