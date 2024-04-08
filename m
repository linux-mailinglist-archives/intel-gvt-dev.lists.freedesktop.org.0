Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B375489C7AE
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Apr 2024 17:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4A91126B6;
	Mon,  8 Apr 2024 15:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iPVzIBvT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4C1126B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 15:01:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91C21612A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 15:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F04C43601
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712588493;
 bh=EITVdlJtkrnylLXhed9Pr1DfYAyVTQ3XvaUDh63E534=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iPVzIBvT/iSK03mJ74WyCdtfwrYQ0FIvhL5K8YMXOWzUcxtAW1X9DNCrqtBiFjfyi
 tl90sPwPpZ5rbnlWkWlrmucbJbApIpssRcLEk4bwAVt6FxwLnhmycj60p3s5ZulGuY
 Oi6kb5XzN6oeZLDaCEoYGMUGaCwA36s9aVa2vFCs+0r3L2ACNZZS6RJMIMK7lmGxXl
 LZaKWREq5eaTZ8dEmqubeluPfq1pepZhLI9FVjpANsP8XqyeISOYtrQC8gZ/KN/t0I
 J4RLdMza2ntow+e8CC8hAcBjXsrybDusTaZepo397svH4xSl9ToXUzq+mYubuhRT/b
 17pKAxdggeVsA==
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6ea1572136eso453457a34.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 08 Apr 2024 08:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXE6AKfksMyEorvwsecxKipTeQiRYJUuV/1GglIWOqT7ZJFfkN3f1xJ5+nLLp9P8Kzbpf2JDS2wU9GPNt01DMq59GlDvvpUWR73EPBzotVHjT17RQ==
X-Gm-Message-State: AOJu0YznddcSpghjZWplTbMkFJgr2yZyEG+zlXlly0XW4nRBzJ75npWB
 pPlzfLemZhCH8vs48ovHXeIa3cwA/kVToPqU9/uJUq3sbiFVzAXOHsoaRBDwNzoxQiUy59MDcAP
 VXlPAP2xr5dUcnMM6KJAuchn5E5A=
X-Google-Smtp-Source: AGHT+IE7BjvtTOsOgPqYkXR1Qq+KOOG/nJtiEyKbfNUuvRcPpCIK8D3B6ZYbWXxS6qJ87RK9Jxd6UH195uv+p6a4TTw=
X-Received: by 2002:a05:6808:603:b0:3c5:f534:e2c7 with SMTP id
 y3-20020a056808060300b003c5f534e2c7mr2839026oih.1.1712588493105; Mon, 08 Apr
 2024 08:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712410202.git.lukas@wunner.de>
In-Reply-To: <cover.1712410202.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Apr 2024 17:01:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hOHCSp8-8EZjuGAOR0QSH3CcvokG3uBGAKFFpTrkqQRA@mail.gmail.com>
Message-ID: <CAJZ5v0hOHCSp8-8EZjuGAOR0QSH3CcvokG3uBGAKFFpTrkqQRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
To: Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, 
 Jean Delvare <jdelvare@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, 
 intel-gvt-dev@lists.freedesktop.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
 Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org
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

On Sat, Apr 6, 2024 at 3:52=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> For my upcoming PCI device authentication v2 patches, I have the need
> to expose a simple buffer in virtual memory as a bin_attribute.
>
> It turns out we've duplicated the ->read() callback for such simple
> buffers a fair number of times across the tree.
>
> So instead of reinventing the wheel, I decided to introduce a common
> helper and eliminate all duplications I could find.
>
> I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
> name. ;)
>
> Lukas Wunner (2):
>   sysfs: Add sysfs_bin_attr_simple_read() helper
>   treewide: Use sysfs_bin_attr_simple_read() helper
>
>  arch/powerpc/platforms/powernv/opal.c              | 10 +-------
>  drivers/acpi/bgrt.c                                |  9 +-------
>  drivers/firmware/dmi_scan.c                        | 12 ++--------
>  drivers/firmware/efi/rci2-table.c                  | 10 +-------
>  drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++-----------=
-----
>  .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
>  fs/sysfs/file.c                                    | 27 ++++++++++++++++=
++++++
>  include/linux/sysfs.h                              | 15 ++++++++++++
>  init/initramfs.c                                   | 10 +-------
>  kernel/module/sysfs.c                              | 13 +----------
>  10 files changed, 56 insertions(+), 85 deletions(-)
>
> --

For the series

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
