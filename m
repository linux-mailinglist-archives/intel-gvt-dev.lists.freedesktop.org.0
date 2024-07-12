Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A905892FDC8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 12 Jul 2024 17:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D20D10E182;
	Fri, 12 Jul 2024 15:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DvP/J91q";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EA010ED43
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Jul 2024 15:44:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52e99060b41so2300157e87.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Jul 2024 08:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720799058; x=1721403858;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gm+dL+hq2H7t5EiDDEM1tOdPxkkuckw7URFjri0hY5Y=;
 b=DvP/J91qtXmUjno5NsvXWeGBdf+jkXFtFPYYWz2XwNPsdppiUcyb2u/8FIaG1/AIk+
 JCoqroTAPJ0rEubk/PZzyzHMw0JFDLEgnnfv+tsK+vN+OjWP51ifBT8y1J9W31zul+DS
 F8aJpfGaw/b2c21HMmUNrBXJwm4EgZfYzfI5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720799058; x=1721403858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gm+dL+hq2H7t5EiDDEM1tOdPxkkuckw7URFjri0hY5Y=;
 b=jRtvwM3RtqNp8zBo5Drgf9F6BVjPP05oi0ycdJu2JD2zRR56JKPcQyDpkd7JZs0VAt
 YCauOaW/2dO3U5Lt43liCQ8X28DdA3kMwjtMxpZho2BneIoRS6W1lCE+aD9I0xxf3l7P
 RvUJr7rn5IATQPkjeyQJoRWvW8L6CKIrBEUlOXnJu6Ya3lu1Kjw7qxqs4u1KCYtYDPhz
 yDNre7nmRZtj20dSDeo9TDhP63AT9OuI+CcIpYIZOA6DYJIjoD1GWnfVfUiGhEWSnaGK
 NKJ6XFIhMlTMZcxG1ML4u57x72BTb8TvVjhz9zdKf+SW+W/PPDZIj1PGhJNqrYcDQqbF
 ouQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPwzUNndx3qDd6/2OuwScpHjUpMHfm1niQiKzKq+8rfxx/FnEvMkPOdEEg+gdRIXK7IUPX1s0CyacKQv4mVpXRDMZQLCHDcHn7xEqC9LNHaB0yUQ==
X-Gm-Message-State: AOJu0YwcBv1zyBZ4XbicOOTFJRNB4kHxQVu98L2Z4u9yKW9dxDfZC14D
 StSDspOAQSRLtkFougqy3/l2cJeWHOgxiLpw4JAEsE8aYu2GcqO1fjgzLuC7k5s/D0W+p2s/15o
 43+V2y1K9kY3rlU7Jq659/pAR/X/dVQVlD9a3k9uZ4aPwbzqnKvw=
X-Google-Smtp-Source: AGHT+IH9pJBNkOUybx5L7VzoPfxzDl6G5bgrKTfUB/1jjytiloEd89f5W+QGClFOQf+tuEha2LiMoViJKAOxrZ9jfME=
X-Received: by 2002:a05:6512:ea1:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-52eb99d4f5dmr8246097e87.58.1720799058056; Fri, 12 Jul 2024
 08:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
 <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
In-Reply-To: <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 12 Jul 2024 17:44:06 +0200
Message-ID: <CALwA+NbUCfEj_DzT5eMQ7_pSNpyp-zBe6PEL2XnMZrb303J4_Q@mail.gmail.com>
Subject: Re: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: jim.cromie@gmail.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com
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

On Wed, Jul 3, 2024 at 12:14=E2=80=AFAM <jim.cromie@gmail.com> wrote:
>
> On Tue, Jul 2, 2024 at 4:01=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
> >
> > On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> > > This fixes dynamic-debug support for DRM.debug, added via classmaps.
> > > commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> > >
> > > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because drm.debug=
=3Dval
> > > was applied when drm.ko was modprobed; too early for the yet-to-load
> > > drivers, which thus missed the enablement.  My testing with
> > > /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycmd option=
s
> > > obscured this omission.
> > >
> > > The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
> > > DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for drivers.
> > > The distinction allows dyndbg to also handle the users properly.
> > >
> > > DRM is the only current classmaps user, and is not really using it,
> > > so if you think DRM could benefit from zero-off-cost debugs based on
> > > static-keys, please test.
> > >
> > > HISTORY
> > >
> > > 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dyndbg p=
arts
> > > 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm part=
s
> > >
> > > https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> > > greg k-h says:
> > > This should go through the drm tree now.  The rest probably should al=
so
> > > go that way and not through my tree as well.
> >
> > Can't this just be defined as a coccinelle smpl patch? Must easier
> > to read than 53 patches?
> >
>
> perhaps it could - Im not sure that would be easier to review
> than a file-scoped struct declaration or reference per driver
>
> Also, I did it hoping to solicit more Tested-by:s with drm.debug=3D0x1ff
>
> Jim
>

Jim,

When testing different combinations of Y/M for TEST_DYNAMIC_DEBUG and
TEST_DYNAMIC_DEBUG_SUBMOD in virtme-ng I spotted test failures:

When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
TEST_MOD_SUBMOD selftests passed
When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
TEST_PERCENT_SPLITTING selftest fails with ": ./dyndbg_selftest.sh:270
check failed expected 1 on =3Dpf, got 0"
When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
TEST_PERCENT_SPLITTING selftest fails also with ":
./dyndbg_selftest.sh:270 check failed expected 1 on =3Dpf, got 0"

Have I missed something ?

Thanks,
Lukasz

> >   Luis
> >
