Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352F89BA7F
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Apr 2024 10:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A87112295;
	Mon,  8 Apr 2024 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j+qi3BU/";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4BE1122AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 08:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B23C860ED1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A165C43399
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712565745;
 bh=x5uAG/ltu+aXdeMkNcec1QhqHWClHSds/cSLz1O5N+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j+qi3BU/XayOJEtk+zUWGNNXQZwmsfv+7aRrjOixLWr9b8aDnkabQa9KH3L/LY6DI
 m+NUPCrWQD+jJhcuDStJoFGhTxPISCbmLKbIMwc1bFdbxldPGeFotZRP6XX6Yyd1Sw
 8wW/P/+K3Tm/krPTPGekFenbgHv7BnAJwy+LJocFCu1wAm/93oF6WXorKLzFVtb796
 5Q/i+69eFIPDnCr0eBPH58O33gEBpxh53m0HOGjCTGWk4+u1OXRHXOZLCw5h7+TNm8
 xz7Or05SIZ89ACo+2Vey5KDI9TxFEUmkyU6UxNShLs+ZjjGIyqQbPR5Gy+6aw56pgm
 UQ1Y0TfhTn4wg==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d717603aa5so49948651fa.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 08 Apr 2024 01:42:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXSHiNPcq9j9N4Temn3iaIzN9EdWeU+2tVgo6iXNrKdtTGwHbc1jWianWnfgvwbQJVJdNwPQXjh0EkmJteTLCQEOOO1mvXLYhquRahepKWbBCTzqQ==
X-Gm-Message-State: AOJu0Yz0Wx8TxrLp3zaXi2SlnO8S/bw2oR/oWuP2LxPcyj3/m/BgE7pr
 UU/C+1c6IF4wO+zAFI7J2soSbfAzmDl+o6NZd+JYzBM21sQHl0A8kD4V03/U9j3aMehgslJmKP3
 uGl+c/R+NCF7so9NTVuLOqkBy8bI=
X-Google-Smtp-Source: AGHT+IEEZZz1BlhQIx5HBD9lAq9n0KDHPwdJDpGGUfNMfpXy5a9hhWu2MwVcoReA5TtUW0Y7LCD+C38a7qls1lB/zag=
X-Received: by 2002:a2e:8911:0:b0:2d8:713f:817b with SMTP id
 d17-20020a2e8911000000b002d8713f817bmr4768893lji.26.1712565743595; Mon, 08
 Apr 2024 01:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712410202.git.lukas@wunner.de>
In-Reply-To: <cover.1712410202.git.lukas@wunner.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 8 Apr 2024 10:42:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHsRLqdXZmRddVUZswCmiJqy8-ncgDF-ooTM2Wdi9q0Qw@mail.gmail.com>
Message-ID: <CAMj1kXHsRLqdXZmRddVUZswCmiJqy8-ncgDF-ooTM2Wdi9q0Qw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
To: Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, 
 Jean Delvare <jdelvare@suse.com>, linux-efi@vger.kernel.org, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, 
 intel-gvt-dev@lists.freedesktop.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
 Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 6 Apr 2024 at 15:52, Lukas Wunner <lukas@wunner.de> wrote:
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

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  arch/powerpc/platforms/powernv/opal.c              | 10 +-------
>  drivers/acpi/bgrt.c                                |  9 +-------
>  drivers/firmware/dmi_scan.c                        | 12 ++--------
>  drivers/firmware/efi/rci2-table.c                  | 10 +-------
>  drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++----------------
>  .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
>  fs/sysfs/file.c                                    | 27 ++++++++++++++++++++++
>  include/linux/sysfs.h                              | 15 ++++++++++++
>  init/initramfs.c                                   | 10 +-------
>  kernel/module/sysfs.c                              | 13 +----------
>  10 files changed, 56 insertions(+), 85 deletions(-)
>
> --
> 2.43.0
>
