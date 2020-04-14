Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A241A7C00
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Apr 2020 15:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149276E4CD;
	Tue, 14 Apr 2020 13:11:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB156E3FC;
 Tue, 14 Apr 2020 13:11:31 +0000 (UTC)
IronPort-SDR: 3cG6U2YNpoVn0tBPXpUpPhtyf/yky2qgfEbgoF+/JxmSONoZcIyUExa3g4KzNFO/nPWcxO1qmN
 /0YgOGpZ8VeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 06:11:28 -0700
IronPort-SDR: 50ouSXyFUkfaZqv6WgTzhIINXRBbGDQ6X3JBi8W7yox5JpSHKPBeXPn/Yi1qGEkrAsIZ8HhRKY
 69ICwl3oaOKA==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427056264"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 06:11:28 -0700
Date: Tue, 14 Apr 2020 06:11:07 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
Message-ID: <20200414131107.GB4008304@intel.com>
References: <20200414083626.GQ11247@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414083626.GQ11247@zhen-hp.sh.intel.com>
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 04:36:26PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> As I stated in last pull
> (https://lists.freedesktop.org/archives/intel-gvt-dev/2020-April/006542.html),
> this one includes gvt fixes for guest page access by using VFIO
> interface instead, so remove the concern from KVM and do the right thing.

Looking the patches now with more calm and the vfio part merged there
it makes sense to get this for -rc1 imho.

So, pulled to drm-intel-fixes.

thanks for the patches and sorry for the previous confusion,
Rodrigo.

> 
> Thanks
> --
> The following changes since commit bcad588dea538a4fc173d16a90a005536ec8dbf2:
> 
>   drm/i915/perf: Do not clear pollin for small user read buffers (2020-04-13 14:09:48 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-04-14
> 
> for you to fetch changes up to ec7301d5146c9abe8aaf6e16e420ea3951018503:
> 
>   drm/i915/gvt: switch to user vfio_group_pin/upin_pages (2020-04-14 16:30:17 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2020-04-14
> 
> - Fix guest page access by using VFIO dma r/w interface (Yan)
> 
> ----------------------------------------------------------------
> Yan Zhao (3):
>       drm/i915/gvt: hold reference of VFIO group during opening of vgpu
>       drm/i915/gvt: subsitute kvm_read/write_guest with vfio_dma_rw
>       drm/i915/gvt: switch to user vfio_group_pin/upin_pages
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 46 +++++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
