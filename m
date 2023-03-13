Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C969F6B81EA
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Mar 2023 20:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C510E617;
	Mon, 13 Mar 2023 19:56:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C5110E617;
 Mon, 13 Mar 2023 19:56:21 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x3so53328386edb.10;
 Mon, 13 Mar 2023 12:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678737380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fjMVYl/zcmqZd7QTw6wKbhHzflyXdyDOQNkUW9nv/Bo=;
 b=2i6+fAhw18OG1Tc1N+EOS0fSWBkZ1HCetnm6rvqyUeZCEvhja+hstTGT3mE6AfIes/
 kiUy+YS6EZj+3ir8RmCBmUFoBrtmX2058+xvNtXpOd3RV4Mlja55X8XXf/VrmZA+eWzo
 tpNL9iEHuAUlmcx1HB6Z61Yev+tAFl/25Wja+OxbEmzCL6XDmkHDvqoKBDivIcbdAKoL
 DTuzmeRzTffZav71arDgRd7bzOyMMNfxMKVDeIpdY5IrjbBcE7zoFaMF8nVs73b3+5BK
 GOydI2E3q+jvYnd2KB/00FetL1sA3AnhcbTLPNmx9GGrbfoGzgequvQvUur7q1Rpy9Lq
 CA+g==
X-Gm-Message-State: AO0yUKV+oSuRSZ+zo7AnM3MkGYnPP8v8rfu0NuUzzbp0QjgCa2OtNf+Y
 a1lpj4hFv9qqFB/bHPMp8aFTgsAuPi2v6UN+KY8=
X-Google-Smtp-Source: AK7set+6bXxAz1AjPX0PoQzviwHtDnGhZeGybBm1XzqjXjCxdk0LzSFKdn0GMUK8pc0w02DXCKDF/nRF3teWxyC89FU=
X-Received: by 2002:a17:906:64d:b0:8d1:57cf:ef3c with SMTP id
 t13-20020a170906064d00b008d157cfef3cmr17373566ejb.2.1678737380313; Mon, 13
 Mar 2023 12:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230308141322.25201-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230308141322.25201-1-lukas.bulwahn@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Mar 2023 20:56:09 +0100
Message-ID: <CAJZ5v0jinyS0asCT3fG+cAMkFYd=wYk9-fRnf=w=24qPH9hUkA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update the 01.org website entries
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: Todd E Brandt <todd.e.brandt@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-pm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 3:15=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmail.c=
om> wrote:
>
> The 01.org links in MAINTAINERS now forward to different other pages or d=
o
> not resolve.
>
> The link https://01.org/linuxgraphics/ resolves to the Intel Graphics for
> Linux - Programmer's Reference Manuals. Update this webpage entry.
>
> The link
> https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
> does not resolve. Remove this webpage entry.
>
> The link https://01.org/igvt-g resolves to
> https://github.com/intel/gvt-linux. Remove the webpage entry, as the
> github repository is already referred to by the T: entry in that section.
>
> The link resolves the pm-graph project page in Intel's Open Ecosystem are=
a
> at intel.com. Update this webpage entry.
>
> M:      "Todd E Brandt" <todd.e.brandt@linux.intel.com>
> L:      linux-pm@vger.kernel.org
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

for the pm-graph entry.

Or I can apply this part of the patch if you send it to linux-pm separately=
.

Thanks!

> ---
>  MAINTAINERS | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1333928a7be4..99adcd74b06a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6747,7 +6747,6 @@ M:        Maarten Lankhorst <maarten.lankhorst@linu=
x.intel.com>
>  M:     Maxime Ripard <mripard@kernel.org>
>  M:     Thomas Zimmermann <tzimmermann@suse.de>
>  S:     Maintained
> -W:     https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.h=
tml
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/gpu/
>  F:     drivers/gpu/drm/*
> @@ -10250,7 +10249,7 @@ M:      Rodrigo Vivi <rodrigo.vivi@intel.com>
>  M:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>  L:     intel-gfx@lists.freedesktop.org
>  S:     Supported
> -W:     https://01.org/linuxgraphics/
> +W:     https://www.intel.com/content/www/us/en/develop/documentation/int=
el-graphics-for-linux-programmers-reference-guide/top.html
>  Q:     http://patchwork.freedesktop.org/project/intel-gfx/
>  B:     https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915=
-bugs
>  C:     irc://irc.oftc.net/intel-gfx
> @@ -10312,7 +10311,6 @@ M:      Zhi Wang <zhi.a.wang@intel.com>
>  L:     intel-gvt-dev@lists.freedesktop.org
>  L:     intel-gfx@lists.freedesktop.org
>  S:     Supported
> -W:     https://01.org/igvt-g
>  T:     git https://github.com/intel/gvt-linux.git
>  F:     drivers/gpu/drm/i915/gvt/
>
> @@ -16668,7 +16666,7 @@ PM-GRAPH UTILITY
>  M:     "Todd E Brandt" <todd.e.brandt@linux.intel.com>
>  L:     linux-pm@vger.kernel.org
>  S:     Supported
> -W:     https://01.org/pm-graph
> +W:     https://www.intel.com/content/www/us/en/developer/topic-technolog=
y/open/pm-graph/overview.html
>  B:     https://bugzilla.kernel.org/buglist.cgi?component=3Dpm-graph&prod=
uct=3DTools
>  T:     git git://github.com/intel/pm-graph
>  F:     tools/power/pm-graph
> --
> 2.17.1
>
