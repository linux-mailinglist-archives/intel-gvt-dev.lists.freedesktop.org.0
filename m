Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77EA8CCAD9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2024 04:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7446310F632;
	Thu, 23 May 2024 02:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ca2HeFCr";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3957910F632
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 02:51:39 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ba0cb1ea68so1725929a91.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2024 19:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716432698; x=1717037498; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=2t+NNcAooBs+1uLVQmd6CHKgztQaFCVL8iN2oZTgqXk=;
 b=Ca2HeFCra7K/VMPhld5SJZs7IVqcPbA+oVO8rjGTAOPwK36nDGyBZxGW7X21tI7my1
 Ys83Nq3clrnLoEKnBWrmdrpEjran/X9WuQgT6OVffD5GSSfmG0ID+5eUYcH8wWF08H1u
 KGrBcMzr/Gv8p0bHWGbeXMwJ4I1NKwQvNgeqJa3VFIsQVaNArNW1IJDG0aHWcskpyCeK
 VM20i7tWAsV5u1dSoYDiQGrUGiEcZVlokEix7ESGCVx1QjKP1XIU8O96i0nt57eZAW5b
 h/UNmePOhA0J79Y/oQv6VRqpLB2AZQ8X6v1q8vqGQLutcwiAix4NP+R4XLQC/Uyp7OcF
 LeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716432698; x=1717037498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2t+NNcAooBs+1uLVQmd6CHKgztQaFCVL8iN2oZTgqXk=;
 b=rozTwVIyTaipFGHI19KUTQvh9CCTCVU6kMzWjys+1LfweWYP3im+z8SANId0yCDNN6
 IGe126ozM4H7nIvqYrjyHtQdJh3oETC2hDGUz5wLCphPFUtMDYIhUCSJFFXVYQXXpGQS
 RVhed0P+VuJoWm7YlJQOK/JCsTB74NmcnDQCW4/duasWnXglhWG1auSY6r63crmQFbaL
 52neseH4lUwSIH6qpB7h4g7pI9u5Zr6yBp/OZeA+XXHYmY4ShPkAK68vH/+oRnGpwhHC
 xaKPBjU/lRquXzg5mx9sEajOnhHXO8XJBPGz7sue2zR6PECwMzAvzIvCoczxa4jKNsvs
 9Ekw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEON4ztbdw/76qDvJUWECEjpOzoieOK7o/AK++ngn6g5IC87f3sfAoVZYtETVNZpcvNCmvbOSMHlG6epBaTAGNTqNqBYJkiF1PdcYsD+jVEvdx2g==
X-Gm-Message-State: AOJu0Yxum0H11SkFi9ig3/SdtWJ5rRooPr4ZhYD/wqrTJV6iVtKRLcE+
 8y8c/7WAqmTEpAYKr64dtDhlycIHin99hYsucSFkMJlmLmteDjEo
X-Google-Smtp-Source: AGHT+IFkp6UpIh1AGPSwzeu7PRXoylLdjeBnYEOtYMQKu1m9NKdsV0nftrMR0T4y+aBKEkMG7hxvGw==
X-Received: by 2002:a17:90a:a506:b0:2ad:6294:7112 with SMTP id
 98e67ed59e1d1-2bd9f456c77mr4103774a91.14.1716432698305; 
 Wed, 22 May 2024 19:51:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bdd9f0b3d3sm575494a91.26.2024.05.22.19.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 19:51:37 -0700 (PDT)
Date: Wed, 22 May 2024 19:51:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/2] treewide: Use sysfs_bin_attr_simple_read() helper
Message-ID: <e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net>
References: <cover.1712410202.git.lukas@wunner.de>
 <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
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

Hi,

On Sat, Apr 06, 2024 at 03:52:02PM +0200, Lukas Wunner wrote:
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

Not really; see below.

> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> ---
...
> index da79760..5193fae 100644
> --- a/init/initramfs.c
> +++ b/init/initramfs.c
> @@ -575,15 +575,7 @@ static int __init initramfs_async_setup(char *str)
>  #include <linux/initrd.h>
>  #include <linux/kexec.h>
>  
> -static ssize_t raw_read(struct file *file, struct kobject *kobj,
> -			struct bin_attribute *attr, char *buf,
> -			loff_t pos, size_t count)
> -{
> -	memcpy(buf, attr->private + pos, count);
> -	return count;
> -}
> -
> -static BIN_ATTR(initrd, 0440, raw_read, NULL, 0);
> +static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
>  

sysfs_bin_attr_simple_read is only declared and available if CONFIG_SYSFS=y.
With m68k:m5208evb_defconfig + CONFIG_BLK_DEV_INITRD=y, this results in

/opt/buildbot/slave/qemu-m68k/build/init/initramfs.c:578:31:
	error: 'sysfs_bin_attr_simple_read' undeclared here (not in a function)

This happens because CONFIG_SYSFS=n and there is no dummy function for
sysfs_bin_attr_simple_read(). Presumably the problem will be seen for all
configurations with CONFIG_BLK_DEV_INITRD=y and CONFIG_SYSFS=n.

On a side note, init/initramfs.c does not directly include linux/sysfs.h.
I don't know if that might cause problems with other builds.

Guenter
