Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3CCEE53E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 02 Jan 2026 12:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A010E078;
	Fri,  2 Jan 2026 11:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmCKFYUJ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3A810E039;
 Fri,  2 Jan 2026 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767353069; x=1798889069;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=aUV6jIfwJYtJCB8EOUaG/Gib8B1MSI59NYafDXROZrE=;
 b=mmCKFYUJtfiDNnRJEWreGfAO1bQDGrWuqRClT50R957tRiXCxaHsIGsQ
 vIvDsQl43OsRL4VA7QHV8vDr8xX7fqsHo6Oi+DsTEBRqB6bKpPZan+/1O
 8bRd+yIWERz8bmKLV+2Xd/7kenso9XKBeU80NsnVxIiuelMAGe/f7L5TS
 JuP2iQxyrmo4s2rO+PHHTT0i6/8xyBAcwN3KjMKucm1bkKz8fkMbers1y
 86ZvTf5H4QH+41UXJOYm5FaRRZ3n19zmkUo1dFyj+eJyclQSj4AXgC2NB
 6aEb94yTfG28EuImIejte9hl0SMTV8lHwQRtoIfqI0WEAMfJ5enN+JyoL A==;
X-CSE-ConnectionGUID: Wq9K2flcQqKtEngpgveTXg==
X-CSE-MsgGUID: tCZ9itEYQS6+X4GnKXFkmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94317303"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="94317303"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 03:24:28 -0800
X-CSE-ConnectionGUID: 9wkP1fZZQE6fgQThESJx1Q==
X-CSE-MsgGUID: bCtsvre7Qr2C3SuBLKt1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="202266340"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 03:24:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/7] Prepare GVT for display modularization
In-Reply-To: <97e62d7a-d6f4-4356-985c-1b605d9d07a1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <54c40d40-f365-49cc-93d0-b40a8db54585@intel.com>
 <803681dce30df69342611e5dd132440e2c94ccc5@intel.com>
 <97e62d7a-d6f4-4356-985c-1b605d9d07a1@intel.com>
Date: Fri, 02 Jan 2026 13:24:23 +0200
Message-ID: <3e52d815fc723b7961a37458ae32998f83954499@intel.com>
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

On Fri, 02 Jan 2026, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> In the new year I intend not to repeat older mistakes (but may be to 
> make new ones :)).

I'm on board with that! :D

> Wish you a Happy New Year!

Thanks, you too!

BR,
Jani.-


-- 
Jani Nikula, Intel
