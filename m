Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881018CD0FD
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2024 13:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5201E10E030;
	Thu, 23 May 2024 11:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H+seZe7t";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE55F10E030
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 11:13:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E2DCECE16C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 11:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1934C4AF0B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716462825;
 bh=8Iv96qeK3XO6FCLRf729LFGYnVsyZm+QYnohsytJjMQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H+seZe7tia9XlPVFbMv1VD3pMpCR28zP+PYcUgiD0HO1ott5vOkK+LXl8bv8ATOEV
 Ad7Ijqn3GCoXbbBre2uB55H4H1dRQNmRXl/deA5egIYXocWhAF9rjgR8lVkJ5+o8NZ
 OG5SDUld0NahdcHQMt64J6N7ht+au3cZ7TP09Urx3Iapvq5rotxpP0AiIYeXXglQ+6
 eZ6rD75sGB4BUdqavP/iRsVStenQOXZHzPwo0753UW4DF8n8g0eL1BvpVIdVLbJYOM
 wm7k3mmwTOQHb3zq+xrznKr/qzcbVsen8qnT1gcW3fzAwIv2+ZiRq09Avg0ymvLDR1
 yv6vXxM56UoxA==
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5b2f4090ac9so1020929eaf.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 04:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxb3TiVK26p0v+sqfxvap9vXvlG4cUkhQnPHrdZ0yzTn1U0f9vB01HD7qFql4O+I6hGUUmPpNkL7CUtuH7FZydUMR1dXMc/nD88R2FxZ8jEMaUhA==
X-Gm-Message-State: AOJu0Yw6FIBdVCrkTPfh11u+QZpqvKWO+qe2st1ApICZEflCNo3XdAND
 85dP8qHUMW+ZFlaJhAdzPMTBfijDD67UwtLfrKJrBxBaewcNsNx4Itzv8Qz5SmSzKKSnpD3nFBk
 IcXz+52Ox9K03h/3s655Wmb1ielo=
X-Google-Smtp-Source: AGHT+IGDJUzVNILe+89DNDK58fKL2girzfjapTcy0TAMQFrntEneDV5GD9qcXO8dgV6h6vsQw1LQsO6L8qszS/mlEfc=
X-Received: by 2002:a05:6820:2c8a:b0:5b2:89f:452 with SMTP id
 006d021491bc7-5b6a240fad5mr4236608eaf.1.1716462825087; Thu, 23 May 2024
 04:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <2024052334-nape-wanting-0a2a@gregkh>
 <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
In-Reply-To: <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 May 2024 13:13:34 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ihKzCbFxfVn9s5zB3WJepzi+dUPk1LFRMnbFF-9EV6nw@mail.gmail.com>
Message-ID: <CAJZ5v0ihKzCbFxfVn9s5zB3WJepzi+dUPk1LFRMnbFF-9EV6nw@mail.gmail.com>
Subject: Re: [PATCH] sysfs: Unbreak the build around
 sysfs_bin_attr_simple_read()
To: Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
 linux-acpi@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org, 
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

On Thu, May 23, 2024 at 1:00=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> G=C3=BCnter reports build breakage for m68k "m5208evb_defconfig" plus
> CONFIG_BLK_DEV_INITRD=3Dy caused by commit 66bc1a173328 ("treewide:
> Use sysfs_bin_attr_simple_read() helper").
>
> The defconfig disables CONFIG_SYSFS, so sysfs_bin_attr_simple_read()
> is not compiled into the kernel.  But init/initramfs.c references
> that function in the initializer of a struct bin_attribute.
>
> Add an empty static inline to avoid the build breakage.
>
> Fixes: 66bc1a173328 ("treewide: Use sysfs_bin_attr_simple_read() helper")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/r/e12b0027-b199-4de7-b83d-668171447ccc@ro=
eck-us.net
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Works for me.

Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  include/linux/sysfs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index a7d725fbf739..c4e64dc11206 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -750,6 +750,15 @@ static inline int sysfs_emit_at(char *buf, int at, c=
onst char *fmt, ...)
>  {
>         return 0;
>  }
> +
> +static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
> +                                                struct kobject *kobj,
> +                                                struct bin_attribute *at=
tr,
> +                                                char *buf, loff_t off,
> +                                                size_t count)
> +{
> +       return 0;
> +}
>  #endif /* CONFIG_SYSFS */
>
>  static inline int __must_check sysfs_create_file(struct kobject *kobj,
> --
> 2.43.0
>
