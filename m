Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B76CEBCBB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 Dec 2025 11:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71A810E46C;
	Wed, 31 Dec 2025 10:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVqcJ0HF";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E419C10E46C;
 Wed, 31 Dec 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767177338; x=1798713338;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=BGUbYfP8ojfg2fXWeOrnyDQFTdtG6JasmBj/7UsqdxQ=;
 b=DVqcJ0HFDFSuPehvpLpSAH50QA5FNSXKBdWDtjqCkMEdDovNqFbNn65r
 w2/16fajj2Z1Xph2mdbLZq/OCFTdv5ZIpf1tzm+9VUYU8WFK1RSO+fusk
 gcooE2d8+OyodQQ/Q9F7ui739I96GV+Evrm2bXpG71Wy4MwOMySV5N6f6
 jViDzc8YSvWR6YRhF0ae34ddE2ZPO9IOfK5YmR9FRKtXdjSawEaMy3NsM
 fm+zoLJsXWDGniTMGMUDJ1tSs/wgyMhqzcl0LQtQg+lQw1FSGLoAn5Xbz
 au2iXgnX3NWO6SW/HR1rjLNlRjAK0guLooAcC1kxU3LcpNHKyO8gPvKNZ g==;
X-CSE-ConnectionGUID: DoS29rSrSGGFzoKXRoELxg==
X-CSE-MsgGUID: EbZTUkksSp63k9Rk7WhSqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68908956"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="68908956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 02:35:37 -0800
X-CSE-ConnectionGUID: HtBBjOMhSTGpD9XKdVJdKw==
X-CSE-MsgGUID: qjp7aSUgT7SYq+2L4eIoKg==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 02:35:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/7] Prepare GVT for display modularization
In-Reply-To: <54c40d40-f365-49cc-93d0-b40a8db54585@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <54c40d40-f365-49cc-93d0-b40a8db54585@intel.com>
Date: Wed, 31 Dec 2025 12:35:32 +0200
Message-ID: <803681dce30df69342611e5dd132440e2c94ccc5@intel.com>
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

On Mon, 29 Dec 2025, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> PS: Fixed the SPDX license identifier styling for the header files (and 
> the checkpatch warnings due to these), before pushing.

Did you checkpatch the changes? Usually the style is to have the SPDX
identifier in a comment of its own, not combined with whatever follows:

/* SPDX-License-Identifier: MIT */

BR,
Jani.


-- 
Jani Nikula, Intel
