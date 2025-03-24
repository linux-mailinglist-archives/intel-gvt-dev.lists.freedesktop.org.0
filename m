Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EC0A6D88C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 11:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404310E041;
	Mon, 24 Mar 2025 10:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ree0Pcsk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCB110E237;
 Mon, 24 Mar 2025 10:47:37 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2c72cb91e9cso2971312fac.1; 
 Mon, 24 Mar 2025 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742813255; x=1743418055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jw7vEOJd9+kVHxfxG1vL7hag7BbqohE0PbGawFjKs4=;
 b=Ree0PcskcAGp9kFdWEBFQXuntEQ2rHpn3cHwy/offbiOyPYF4FLV68Im12I5kKKRq8
 ws+Um1Ouj6OeBpuJ4VoqOnf1PyK4TiHcF7jM3V5kr1rYX0+fTs1f5Q9oI5lRqY0rVIye
 KdwhH+P3SawFcmSqzox5Gt9ZtXt/cMnOcPgxlWnqqv37loVu+id3mX6W/WaXvWNuzz2W
 KcyGbzinWx854uDzMtOwf1FUbkrdQuLII8Ya+kJ9k9Q9Z0j9VBwDYMJ7SrnZt6q2yoHr
 Wcq66wuCuq91SNZQB3uKxsmGuCyWmaQXRCKn5mQ0yn97I6OgE5oPbTwUglWFqCqGsYM1
 T7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742813255; x=1743418055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jw7vEOJd9+kVHxfxG1vL7hag7BbqohE0PbGawFjKs4=;
 b=DsFLsE+mCOLJr+ORW6kFF0HcMaVgca/d/J+hyS8TBp9gyraRUuUvmm2mhDrLIZIU9z
 dpIfRMbnCfiCdYYThEEEmI5roIWHwZcu4tzg76HxGDJbQpp+Dsih/pNLr6hMHddfM0PP
 yGvfPCQdw/x6crEtYNw3TryUHUKRjqDUFcUzSGILxh37mg2sdnERNtSm5FGl5DH7y0T8
 wKnXG8IpzcrFgMt5W+kwgT/Yj+4fwFR4nGYtxrQhi/+RLtCZhrDstOwYML6rNlbCygAp
 7U28+uI/p1yNjJFfG9CzyOPOJcwH0ICZEiUmkwoH1C+3XctdaWEQuoslD8Xp1OonHEll
 oOVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRLgpNnrbbv5W2Hjp+/DoFb4RQFwPv03J9pDUezjImZxLmODBFp+xCYjL+DlEhhkvfJUYJiRn5heqEGv/D8g==@lists.freedesktop.org,
 AJvYcCW/gy0rGSiowdqwIJvZkIJbW/2tSKmKySsz2GnPoQlkf4/SKpGsIzVaoUOBadmynpwDSq2z9c4YuDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrKHrkKAFgS9jgGL6EDhTTIIZyhPxX2X01S6O/w5GbleOirnIn
 G09bRoD+mhkP1I9Ls6mqa1vgRO578vKLB/OzHln3ljY+yeD0BKKQbmOGbkwy7kJ61TrBUatTxHn
 qKgzEoTzIvuYuKl3i6HFB+evT8D4=
X-Gm-Gg: ASbGnctAK8zl5kYPIbxL8zuH2V6LF0PAV5JKG4hS+/vAlwuFnNBxdbnTtufVtGr6Ngq
 3fpjp73LbItIn0j9wuHz9sHcFdllVR0bTCzrFkYZa3H8YceBWZPFc8gPcKbl/a9E9MVbtfFMn4X
 KOggf25E8mrht/XJAcoy3wtbc=
X-Google-Smtp-Source: AGHT+IHdRQL4CSzJPpXSBIfWZCaqqx9IsDza48gb58MoU4sbd7mv0bZ+NfyczdL84bXw8ET1tmLi6+9Sj6+qfwbCaK4=
X-Received: by 2002:a05:6870:3c89:b0:2b8:41ef:2ca with SMTP id
 586e51a60fabf-2c780289b26mr7641268fac.6.1742813254753; Mon, 24 Mar 2025
 03:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250324083755.12489-1-kwizart@gmail.com>
 <20250324083755.12489-3-kwizart@gmail.com>
 <87pli6bwxi.fsf@intel.com> <87h63ibwma.fsf@intel.com>
In-Reply-To: <87h63ibwma.fsf@intel.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Mon, 24 Mar 2025 11:47:23 +0100
X-Gm-Features: AQ5f1Jpv52Yi-NV796ol6p6RUqVLUgoluSjVAoOFPu6MP-olcZdD_Qf9lZ9zltk
Message-ID: <CABr+WTmQ3rZ-UZH2Wv0R6qKegyjCovn3R7PWBeWiciAj+NbtnQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] [RFC] drm/i915/gvt: Fix opregion_header->signature
 size
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Le lun. 24 mars 2025 =C3=A0 10:34, Jani Nikula
<jani.nikula@linux.intel.com> a =C3=A9crit :
>
> On Mon, 24 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 24 Mar 2025, Nicolas Chauvet <kwizart@gmail.com> wrote:
> >> Enlarge the signature field to accept the string termination.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer wri=
te into opregion->signature[]")
> >> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
> >
> > Nope, can't do that. The packed struct is used for parsing data in
> > memory.
>
> Okay, so I mixed this up with display/intel_opregion.c. So it's not used
> for parsing here... but it's used for generating the data in memory, and
> we can't change the layout or contents.
>
> Regardless, we can't do either patch 2 or patch 3.

Thanks for review.
So does it means the only "Fix" is to drop Werror, at least for intel/gvt c=
ode ?
I have CONFIG_DRM_I915_WERROR not set but CONFIG_DRM_WERROR=3Dy, (same as F=
edora)
Unsure why the current Fedora kernel is unaffected by this build failure.
