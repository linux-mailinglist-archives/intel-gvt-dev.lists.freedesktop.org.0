Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E634D8CD59B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2024 16:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14B210E2AF;
	Thu, 23 May 2024 14:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmASmW/S";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFA810E2AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 14:23:26 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6f6a045d476so2289917b3a.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716474206; x=1717079006; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t/lNADwPwr25pysfe9uC4MhtrxN5wTcZxfw/uoqzjrk=;
 b=EmASmW/S+phH6lEHPvys7ZZUVxplOX9HgIElhSK4O1BqBP7rE/dvQpOz+kbh2usbeN
 fLhRNmcSF1b1j6MeXBPxnWqHvLDp4akLQ1kO+pey6r3UZgT192hI4d1+t9PL+bztvV4a
 SkcJaSCCkjojfp+s54zalAgjSaZa6V3RngbcVBbwnLQ0MtLz+/YfDy/ZB9fag0lXFbMB
 d/M5CXwZx01oY7HyY6k0e3/+k1XMCsh1KUunXi+d62cxwe0k2XaFBVLmhgoNSMu28GE4
 BweQ1t3awq5D1X2+GfgsQ+Wbo44RX043Z6kWro3ZQk+P6hEkfCzM30SSZFogtMPpsGtF
 JBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716474206; x=1717079006;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t/lNADwPwr25pysfe9uC4MhtrxN5wTcZxfw/uoqzjrk=;
 b=bv3RqEfZ5kZevpVXbQqyyKz9eHA+EV8mcuvN9PzF9wJUaQEgZ1etDqeqlvpag0GJwO
 WqbxVoy3KezV9jXKIZwgbMmhZS0T7po1Y6wnFZKvG4sEgkRU/gYDD2D9e4i87fm0OILw
 YAp332+5TD+id6T6RYiWzpj+qKAhBwkyKv3Nr3b7/ks5g/6td+ASdgvxFGzvVJzTNZgf
 a594XnLdvp4VuRDHPYjlgpxEMaE8s0iVC1JQp7MW9M3AlHGbtNdjGRbuZrxWwtoXvJE8
 M6HOFwOZiGOqzkWQBOIlaDKjI5/sc/a4Lfa96Pc5lp86VewAdPJvYM8efbhStbtLMOFU
 p+sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp99lLWhZrU1x0VQ84FlfxG0wMjiVRjMhof7fAgx7IkVHsTr0nk1ppDxCFRdcRBYcOwvCrsSw2HmVLzRwLupGAKHpOKUUL9HyLPL5e4+dXQWtCxQ==
X-Gm-Message-State: AOJu0YyU8OBwJXqjq+dyOuzMxRamPcFIM63+P1uZ6m8BmSHwDdNCXqpk
 f7tQzkGYnxoASQYqLEC7BSCQ++cyAYRVdgH5vWWrMBwDr1Rzko4QiS9DLA==
X-Google-Smtp-Source: AGHT+IEWmE003niz8KfDtTyBhJFuwL9l4X+RCaG61wMtnhF90Faa7QASay0WGaxzbP5zU+5qgt+XNg==
X-Received: by 2002:a05:6a21:999b:b0:1b0:31c8:edfb with SMTP id
 adf61e73a8af0-1b1f8a8669dmr5803662637.60.1716474205714; 
 Thu, 23 May 2024 07:23:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a665c0sm24088995b3a.3.2024.05.23.07.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:23:24 -0700 (PDT)
Date: Thu, 23 May 2024 07:23:23 -0700
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
Subject: Re: [PATCH] sysfs: Unbreak the build around
 sysfs_bin_attr_simple_read()
Message-ID: <a396a2ce-656b-4525-acee-ed7c3742b2da@roeck-us.net>
References: <2024052334-nape-wanting-0a2a@gregkh>
 <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
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

On Thu, May 23, 2024 at 01:00:00PM +0200, Lukas Wunner wrote:
> Günter reports build breakage for m68k "m5208evb_defconfig" plus
> CONFIG_BLK_DEV_INITRD=y caused by commit 66bc1a173328 ("treewide:
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
> Closes: https://lore.kernel.org/r/e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/linux/sysfs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index a7d725fbf739..c4e64dc11206 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -750,6 +750,15 @@ static inline int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
>  {
>  	return 0;
>  }
> +
> +static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
> +						 struct kobject *kobj,
> +						 struct bin_attribute *attr,
> +						 char *buf, loff_t off,
> +						 size_t count)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_SYSFS */
>  
>  static inline int __must_check sysfs_create_file(struct kobject *kobj,
> -- 
> 2.43.0
> 
