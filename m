Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7408CCC8B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2024 08:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A0110E071;
	Thu, 23 May 2024 06:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fCKm2ZqA";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4E10E071
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2024 06:51:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5F78ACE1377;
 Thu, 23 May 2024 06:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01670C2BD10;
 Thu, 23 May 2024 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716447112;
 bh=vxr2mkzYP8mbnwy26aQJbbvOzWaMQB/nx4kIMYC3W1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fCKm2ZqAe71lxfgsC1I+obtVtvkM6KQ988dCXcZSItgRCne5xkpE9HqIVIHKcURGn
 OWi/X6qgvW381+OQ/PkhE0Gztw5g2taRrf+tH/4CpccMpg/oFdYXTYk3bx4mTg2JQF
 If/tlvTZPws+h4VEuXiCei21esZR+7aawIwmlyDM=
Date: Thu, 23 May 2024 08:51:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lukas Wunner <lukas@wunner.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/2] treewide: Use sysfs_bin_attr_simple_read() helper
Message-ID: <2024052334-nape-wanting-0a2a@gregkh>
References: <cover.1712410202.git.lukas@wunner.de>
 <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
 <e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net>
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

On Wed, May 22, 2024 at 07:51:35PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Sat, Apr 06, 2024 at 03:52:02PM +0200, Lukas Wunner wrote:
> > Deduplicate ->read() callbacks of bin_attributes which are backed by a
> > simple buffer in memory:
> > 
> > Use the newly introduced sysfs_bin_attr_simple_read() helper instead,
> > either by referencing it directly or by declaring such bin_attributes
> > with BIN_ATTR_SIMPLE_RO() or BIN_ATTR_SIMPLE_ADMIN_RO().
> > 
> > Aside from a reduction of LoC, this shaves off a few bytes from vmlinux
> > (304 bytes on an x86_64 allyesconfig).
> > 
> > No functional change intended.
> > 
> 
> Not really; see below.
> 
> > Signed-off-by: Lukas Wunner <lukas@wunner.de>
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > ---
> ...
> > index da79760..5193fae 100644
> > --- a/init/initramfs.c
> > +++ b/init/initramfs.c
> > @@ -575,15 +575,7 @@ static int __init initramfs_async_setup(char *str)
> >  #include <linux/initrd.h>
> >  #include <linux/kexec.h>
> >  
> > -static ssize_t raw_read(struct file *file, struct kobject *kobj,
> > -			struct bin_attribute *attr, char *buf,
> > -			loff_t pos, size_t count)
> > -{
> > -	memcpy(buf, attr->private + pos, count);
> > -	return count;
> > -}
> > -
> > -static BIN_ATTR(initrd, 0440, raw_read, NULL, 0);
> > +static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
> >  
> 
> sysfs_bin_attr_simple_read is only declared and available if CONFIG_SYSFS=y.
> With m68k:m5208evb_defconfig + CONFIG_BLK_DEV_INITRD=y, this results in
> 
> /opt/buildbot/slave/qemu-m68k/build/init/initramfs.c:578:31:
> 	error: 'sysfs_bin_attr_simple_read' undeclared here (not in a function)
> 
> This happens because CONFIG_SYSFS=n and there is no dummy function for
> sysfs_bin_attr_simple_read(). Presumably the problem will be seen for all
> configurations with CONFIG_BLK_DEV_INITRD=y and CONFIG_SYSFS=n.

Lukas, can you send a patch adding a dummy function?

thanks,

greg k-h
