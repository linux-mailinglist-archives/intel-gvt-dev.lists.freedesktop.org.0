Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C389BDCE
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Apr 2024 13:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20A0112465;
	Mon,  8 Apr 2024 11:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="KDdYgPfc";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DAD1123A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2024 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1712574719;
 bh=Gy2IffhRM6JRRrukWvLRqJnwzreji6m9bj34GwffDNM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KDdYgPfcoO4Xwkc9vPoJtb5pfxHOMMswqVXzEkb/jhRhZbDZDKl2m5brlJJmmnDdl
 0Kkk/GINLb1FttDTi7KiDUakFnGXKeHNjAMNPprZXB820lvKPVgL6e3YNFLJgM8X6r
 /Bt/2va9Kh+M5yTqqWdLcOsVJQBS6422N6PmXhpKT+4uMtLMWfFRYFOGVJ1PDbgp5W
 aBLla90cOIxiStLjk7j/zyOvU4VMGviSwd/s0Htc/v191CCU4vuhkXFJ/ldbpaMBn+
 vCiuYLbrxjHnMPxLxfiOeuQ7etxHECiSkN+/1wB6saocLq7ZwqZ+iE0iUd4YlxCv7i
 ww2jBxf3AqLhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCmdB2lhKz4wcF;
 Mon,  8 Apr 2024 21:11:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lukas Wunner <lukas@wunner.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, Jean Delvare
 <jdelvare@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org, Daniel
 Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, Luis
 Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/2] treewide: Use sysfs_bin_attr_simple_read() helper
In-Reply-To: <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
References: <cover.1712410202.git.lukas@wunner.de>
 <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
Date: Mon, 08 Apr 2024 21:11:57 +1000
Message-ID: <87jzl8az2a.fsf@mail.lhotse>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Lukas Wunner <lukas@wunner.de> writes:
> Deduplicate ->read() callbacks of bin_attributes which are backed by a
> simple buffer in memory:
>
> Use the newly introduced sysfs_bin_attr_simple_read() helper instead,
> either by referencing it directly or by declaring such bin_attributes
> with BIN_ATTR_SIMPLE_RO() or BIN_ATTR_SIMPLE_ADMIN_RO().
>
> Aside from a reduction of LoC, this shaves off a few bytes from vmlinux
> (304 bytes on an x86_64 allyesconfig).
>
> No functional change intended.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  arch/powerpc/platforms/powernv/opal.c              | 10 +--------
>  drivers/acpi/bgrt.c                                |  9 +-------
>  drivers/firmware/dmi_scan.c                        | 12 ++--------
>  drivers/firmware/efi/rci2-table.c                  | 10 +--------
>  drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++-----------------
>  .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
>  init/initramfs.c                                   | 10 +--------
>  kernel/module/sysfs.c                              | 13 +----------
>  8 files changed, 14 insertions(+), 85 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 45dd77e..5d0f35b 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -792,14 +792,6 @@ static int __init opal_sysfs_init(void)
>  	return 0;
>  }
>  
> -static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
> -				struct bin_attribute *bin_attr, char *buf,
> -				loff_t off, size_t count)
> -{
> -	return memory_read_from_buffer(buf, count, &off, bin_attr->private,
> -				       bin_attr->size);
> -}
> -
>  static int opal_add_one_export(struct kobject *parent, const char *export_name,
>  			       struct device_node *np, const char *prop_name)
>  {
> @@ -826,7 +818,7 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
>  	sysfs_bin_attr_init(attr);
>  	attr->attr.name = name;
>  	attr->attr.mode = 0400;
> -	attr->read = export_attr_read;
> +	attr->read = sysfs_bin_attr_simple_read;
>  	attr->private = __va(vals[0]);
>  	attr->size = vals[1];

I gave it a quick boot and checked I could still read the attributes,
everything seems fine.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
