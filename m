Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0843D172D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 21:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FD06E86C;
	Wed, 21 Jul 2021 19:41:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D506E86C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jul 2021 19:41:31 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id y38so1946922ybi.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Jul 2021 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aE+5WwECBEzPAUwAaWfDdAD19hgeRUlb1b67ifBCq5o=;
 b=NHYeqjAvIR5LX96lTaPKxGXirYVHohK75u0STCtpH04+EhGdt5RBfH8jzsRvPlV7D0
 /YGsy0IYccphno9DdjcT0mO52fkPh+Z+n4iF6zfYXBJdC7kzLk2R/MufTGGJb59S8Uwv
 ZrQ5prbfZxJTqWGdbeQ54WrSKbtUc424c3vmHupcPvbs9+jMk91TizR1RESmW4P6h+xz
 kpWv6wz+xHU8UudN2lEvSA51KK28QvhEpJuKfxocw0M+4o6UD7MGlEmQyVyaSbrs7LWy
 RdkhpSPnCtXSjIT2wRXULKihbl74OMq4F8FDmUHHiZVyUDuycIjVQUs9Z2mCwC1XdGhS
 YEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aE+5WwECBEzPAUwAaWfDdAD19hgeRUlb1b67ifBCq5o=;
 b=IK/ZKfAq7Qje66qqg3VNAGZlvHafevTvGisW2sMmup4c27/layGO/cbBpfNGBlW18D
 7r9GVewB3fOvUUmH3UE3gc4hsQpprgTFYCe5avckqO5kL/rAlWquO/J/lOSCkLmUR+ta
 1rLsAKkhoLxgJgZXUs0v0XmjKdBSg60a1Ge3G3IQJYAeXMdLhzoB/ZOBftru7y4OGU2c
 gNJ6Qb/8ZdR0X19VGpaaDsz8qbn+KyM5N4ESGzdZdgkSz7y3WGc8bLAn/WQTJKbOoQe0
 kB3cuoCEPNhWL3MvvWr1G+Ar2s1EZ/g5/Pzn/ThoWEXi2eabo3ljGmVddK+e5gD+RLnr
 CEsw==
X-Gm-Message-State: AOAM53394oUngbM9VU1XtE7ibFVgads2LoJTD0tmhvLQEM2sPfFE/0DK
 qCpZF8jFdfVzlZUyymoPsRbC1PUe/4ZiSPTwtYoFIg==
X-Google-Smtp-Source: ABdhPJwv81VIOC4BcCR36exqFNCJG7bRgBnlMaYWgf2/RhJ0NJYg55BQ0FzNosliXCaFLiih8NKuFq7PxdVM6uvCJ44=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr48626057ybi.241.1626896490772; 
 Wed, 21 Jul 2021 12:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210721062607.512307-1-zhenyuw@linux.intel.com>
 <CAKMK7uGhcnfOPMUuWOZMErHWFqeixpPFURXFS2oVm2d-r32NZw@mail.gmail.com>
In-Reply-To: <CAKMK7uGhcnfOPMUuWOZMErHWFqeixpPFURXFS2oVm2d-r32NZw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 21 Jul 2021 14:41:19 -0500
Message-ID: <CAOFGe97Q=gVZcH2U94s87ftj-YeeeoEVwF8cuo4-jO8Y-ZR4NQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: Fix cached atomics setting for
 Windows VM
To: Daniel Vetter <daniel@ffwll.ch>
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
 stable <stable@vger.kernel.org>, "Xu, Terrence" <terrence.xu@intel.com>,
 "Bloomfield, Jon" <jon.bloomfield@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 4:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 21, 2021 at 8:21 AM Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> > We've seen recent regression with host and windows VM running
> > simultaneously that cause gpu hang or even crash. Finally bisect to
> > 58586680ffad ("drm/i915: Disable atomics in L3 for gen9"), which seems
> > cached atomics behavior difference caused regression issue.
> >
> > This trys to add new scratch register handler and add those in mmio
> > save/restore list for context switch. No gpu hang produced with this one.
> >
> > Cc: stable@vger.kernel.org # 5.12+
> > Cc: "Xu, Terrence" <terrence.xu@intel.com>
> > Fixes: 58586680ffad ("drm/i915: Disable atomics in L3 for gen9")
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>
> Adding Jon Bloomfield, since different settings between linux and
> windows for something that can hard-hang the machine on gen9 sounds
> ... not good.

The difference there is legit and intentional.

As far as what we do about it for GVT, if we can safely smash L3
atomics off underneath Windows without causing problems for the VM, we
should do that.  If not, we need to discuss this internally before
proceeding.

--Jason

> -Daniel
>
> > ---
> >  drivers/gpu/drm/i915/gvt/handlers.c     | 1 +
> >  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> > index 98eb48c24c46..345b4be5ebad 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -3134,6 +3134,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
> >         MMIO_DFH(_MMIO(0xb100), D_BDW, F_CMD_ACCESS, NULL, NULL);
> >         MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
> >         MMIO_D(_MMIO(0xb110), D_BDW);
> > +       MMIO_D(GEN9_SCRATCH_LNCF1, D_BDW_PLUS);
> >
> >         MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
> >                 D_BDW_PLUS, NULL, force_nonpriv_write);
> > diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> > index b8ac80765461..f776c470914d 100644
> > --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> > +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> > @@ -105,6 +105,8 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
> >         {RCS0, COMMON_SLICE_CHICKEN2, 0xffff, true}, /* 0x7014 */
> >         {RCS0, GEN9_CS_DEBUG_MODE1, 0xffff, false}, /* 0x20ec */
> >         {RCS0, GEN8_L3SQCREG4, 0, false}, /* 0xb118 */
> > +       {RCS0, GEN9_SCRATCH1, 0, false}, /* 0xb11c */
> > +       {RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
> >         {RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
> >         {RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
> >         {RCS0, HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
> > --
> > 2.32.0.rc2
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
