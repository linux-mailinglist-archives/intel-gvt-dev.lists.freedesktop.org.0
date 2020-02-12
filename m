Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B615AB6B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 Feb 2020 15:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3D6E063;
	Wed, 12 Feb 2020 14:54:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1E89C08;
 Wed, 12 Feb 2020 14:54:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 06:54:47 -0800
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; d="scan'208";a="226886052"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 06:54:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20200212065912.GB4997@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200212065912.GB4997@zhen-hp.sh.intel.com>
Date: Wed, 12 Feb 2020 16:54:43 +0200
Message-ID: <87y2t7yhxo.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 12 Feb 2020, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's two fixes for gvt. One for missed locking and another for
> firmware allocation change for late load.

Pulled, thanks.

BR,
Jani.

>
> Thanks
> --
> The following changes since commit 5e822e44cecec1ea48925630aa31dfac827fd202:
>
>   drm/i915/gvt: Fix guest boot warning (2019-12-17 11:19:58 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2020-02-12
>
> for you to fetch changes up to 0e9d7bb293f3f9c3ee376b126141407efb265f31:
>
>   drm/i915/gvt: more locking for ppgtt mm LRU list (2020-02-10 10:04:34 +0800)
>
> ----------------------------------------------------------------
> gvt-fixes-2020-02-12
>
> - fix possible high-order allocation fail for late load (Igor)
> - fix one missed lock for ppgtt mm LRU list (Igor)
>
> ----------------------------------------------------------------
> Igor Druzhinin (2):
>       drm/i915/gvt: fix high-order allocation failure on late load
>       drm/i915/gvt: more locking for ppgtt mm LRU list
>
>  drivers/gpu/drm/i915/gvt/firmware.c | 4 ++--
>  drivers/gpu/drm/i915/gvt/gtt.c      | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
