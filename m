Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52E199B67
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 31 Mar 2020 18:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637EB89EB1;
	Tue, 31 Mar 2020 16:26:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF289DB2;
 Tue, 31 Mar 2020 16:26:43 +0000 (UTC)
IronPort-SDR: Z4syl+mVK5rHpuq2l2Mrcr2FPKfRHglsMIrwzvsPA6FDpfIKVmxin9+pMiKagUaWLwBuA6Rp8g
 MJoAG/EuqiiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 09:26:42 -0700
IronPort-SDR: aAkE6MTP9dk4wBbdQcV3YybxP40rNRr1azNcjSqDiPL1qumI7rsfzKVhs/8tq5dNfbHEYSdZe2
 QAeD3/0/nqCQ==
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; d="scan'208";a="395555435"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 09:26:42 -0700
Date: Tue, 31 Mar 2020 09:26:44 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next-fixes
Message-ID: <20200331162644.GA3779315@intel.com>
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331070025.GB16629@zhen-hp.sh.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 03:00:25PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's more queued gvt fixes for 5.7. Please see details below.
> 
> Thanks
> --
> The following changes since commit a61ac1e75105a077ec1efd6923ae3c619f862304:
> 
>   drm/i915/gvt: Wean gvt off using dev_priv (2020-03-06 10:08:10 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2020-03-31
> 
> for you to fetch changes up to eb0ff8074e0baecba2cd0c7813f6cfa99bafc430:
> 
>   drm/i915/gvt: Fix klocwork issues about data size (2020-03-27 15:37:58 +0800)

pulled, thanks

> 
> ----------------------------------------------------------------
> gvt-next-fixes-2020-03-31
> 
> - Fix non-privilege access warning (Tina)
> - Fix display port type (Tina)
> - BDW cmd parser missed SWTESS_BASE_ADDRESS (Yan)
> - Bypass length check of LRI (Yan)
> - Fix one klocwork warning (Tina)
> 
> ----------------------------------------------------------------
> Tina Zhang (3):
>       drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
>       drm/i915/gvt: Fix display port type issue
>       drm/i915/gvt: Fix klocwork issues about data size
> 
> Yan Zhao (2):
>       drm/i915/gvt: add support to command SWTESS_BASE_ADDRESS
>       drm/i915/gvt: do not check len & max_len for lri
> 
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 16 ++++------------
>  drivers/gpu/drm/i915/gvt/display.c    |  6 +++---
>  drivers/gpu/drm/i915/gvt/handlers.c   |  8 ++++++--
>  drivers/gpu/drm/i915/gvt/scheduler.c  |  4 ++--
>  4 files changed, 15 insertions(+), 19 deletions(-)
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
