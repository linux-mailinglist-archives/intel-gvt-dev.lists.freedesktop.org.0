Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA74D13FA
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Mar 2022 10:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5510EC08;
	Tue,  8 Mar 2022 09:56:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253F10EC0D;
 Tue,  8 Mar 2022 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646733378; x=1678269378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WYiTS9KAWtzHuvlmSPbvUn0DeCl9EeLllMkgT90Sisg=;
 b=lE1+l2UM0QoGzHOIfbNs44PN4UEDtJD7mXkq8QZ22scg3Cq0KJ1PzvUE
 NceE+YYfj0V1yyPnzoBljZC2VicHsG8Z6rwhlXUCVg/myJG1EV1BVyoy5
 LWHm9GNaK2RncR3C0B6Vfaz432NCCrXoAFePyF+9GidPsc9cDJmlbtJ78
 pEq0lLrz1gVb+ageGr2kWidNtKE+94vlNK33CA2ACzN853njdxdrYSIwm
 YXe0ILEejGdg0Q541JU0fcUiFh5wWnu+2jIN0+uUvPI08qjPo+4YZ1WgG
 WzGlmJZcydHDGfTlCyaYR3+94KiPitSBfrdfTMhiLKxYFBlrdR94Lt3+c w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234598283"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="234598283"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 01:56:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="513048908"
Received: from acushion-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.29.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 01:56:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next
In-Reply-To: <e38f0725-6b22-8e49-b8f6-41986b0ece06@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com>
 <Yd2W4T1Y8X0cP/PL@intel.com>
 <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
 <e38f0725-6b22-8e49-b8f6-41986b0ece06@intel.com>
Date: Tue, 08 Mar 2022 11:56:13 +0200
Message-ID: <87wnh422f6.fsf@intel.com>
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
Cc: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 08 Mar 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Hi folks:
>
> Here is a new pull request of gvt-next. It contains a small patch to add the missing
> mdev attribute name, which will be used by the middleware, like kubevirt.

I'm wondering if I should pull this to drm-intel-next, which is already
targeting v5.19, or if it should be pulled to drm-intel-next-fixes
targeting v5.18. It does look like a fix.

BR,
Jani.


>
> This pull has been tested by:
>
> $ dim apply-pull drm-intel-next < this_email.eml
>
> The following changes since commit 30424ebae8df0f786835e7a31ad790fa00764f35:
>
>   Merge tag 'drm-intel-gt-next-2022-02-17' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next (2022-02-23 15:03:51 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-next-2022-03-07
>
> for you to fetch changes up to 43d26c4fc6c446d766253d546f0083d78023d34a:
>
>   drm/i915/gvt: add the missing mdev attribute "name" (2022-03-07 12:21:58 -0500)
>
> ----------------------------------------------------------------
> - add the missing attribute "name" in VFIO mdev hierarchy.
>
> ----------------------------------------------------------------
> Zhi Wang (1):
>       drm/i915/gvt: add the missing mdev attribute "name"
>
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>

-- 
Jani Nikula, Intel Open Source Graphics Center
