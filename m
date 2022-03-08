Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F54D1B84
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Mar 2022 16:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D776010E26A;
	Tue,  8 Mar 2022 15:19:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114F310E26A;
 Tue,  8 Mar 2022 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646752763; x=1678288763;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:from:cc:to:subject:message-id:date;
 bh=9//EF2mZkWU/vvcBOnXGX08QjjBqL6FT4wEwlorG5S4=;
 b=hS2NVVMrxmFv+WfDrzcoUNypXoH2y+IlGwjZR5k3Okb16n43415heDL5
 KbmkJJ4AaQzugVwyJyMTTJ0+oxs3yPfrB/Sl5gIge6Qq4tz50cljnuAbm
 FXmjQfjLVioT9HMx1gy9oPmDAJ6CvbbF63DuW7YNx93aUFs14Tn8rFI2I
 oBLZltqBH40H9rD+kd5vkTfJ5lS45vEFjgmfcUUx1xIbbzM5tiM07dPxq
 q733N5OrMsHlTLeA8Rec+TAIG6k5rErdZhdtFL05Y0ukNA4yMbFWXE3zT
 GEDuu4UEiQEV6xd2bPOq0T6w1qIL8Tj1vV0M4V7+fCxzjkS8/6XAZWYvf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341138515"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="341138515"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 07:19:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="643685252"
Received: from nlyalyus-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 07:19:20 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ebfe0e0f-d240-8435-0517-2be3b89252ba@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com> <Yd2W4T1Y8X0cP/PL@intel.com>
 <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
 <e38f0725-6b22-8e49-b8f6-41986b0ece06@intel.com> <87wnh422f6.fsf@intel.com>
 <ebfe0e0f-d240-8435-0517-2be3b89252ba@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <164675275779.144512.4612996465580196155@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 08 Mar 2022 17:19:17 +0200
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Quoting Wang, Zhi A (2022-03-08 12:07:04)
> Which suits better for you? For me, I am OK with both. If you are not in =
a rush of closing the window, I can submit through drm-intel-next-fixes.

I pulled this into drm-intel-next-fixes now.

For future reference, let's have fixes only PRs as gvt-fixes and PRs
with features as gvt-next and each as a new mail thread instead of a
reply to older, so they will be easy to spot :)

Regards, Joonas

>=20
> Thanks,
> Zhi.
>=20
> On 3/8/22 9:56 AM, Nikula, Jani wrote:
> > On Tue, 08 Mar 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> >> Hi folks:
> >>
> >> Here is a new pull request of gvt-next. It contains a small patch to a=
dd the missing
> >> mdev attribute name, which will be used by the middleware, like kubevi=
rt.
> >=20
> > I'm wondering if I should pull this to drm-intel-next, which is already
> > targeting v5.19, or if it should be pulled to drm-intel-next-fixes
> > targeting v5.18. It does look like a fix.
> >=20
> > BR,
> > Jani.
> >=20
> >=20
> >>
> >> This pull has been tested by:
> >>
> >> $ dim apply-pull drm-intel-next < this_email.eml
> >>
> >> The following changes since commit 30424ebae8df0f786835e7a31ad790fa007=
64f35:
> >>
> >>   Merge tag 'drm-intel-gt-next-2022-02-17' of git://anongit.freedeskto=
p.org/drm/drm-intel into drm-intel-next (2022-02-23 15:03:51 -0500)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/intel/gvt-linux tags/gvt-next-2022-03-07
> >>
> >> for you to fetch changes up to 43d26c4fc6c446d766253d546f0083d78023d34=
a:
> >>
> >>   drm/i915/gvt: add the missing mdev attribute "name" (2022-03-07 12:2=
1:58 -0500)
> >>
> >> ----------------------------------------------------------------
> >> - add the missing attribute "name" in VFIO mdev hierarchy.
> >>
> >> ----------------------------------------------------------------
> >> Zhi Wang (1):
> >>       drm/i915/gvt: add the missing mdev attribute "name"
> >>
> >>  drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >=20
>=20
