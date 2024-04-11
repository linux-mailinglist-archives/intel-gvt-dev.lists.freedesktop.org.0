Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5238A1543
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 11 Apr 2024 15:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFAB10F091;
	Thu, 11 Apr 2024 13:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nEAigv/e";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9810810F091
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2024 13:07:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6AD82CE2F5A;
 Thu, 11 Apr 2024 13:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171F6C433F1;
 Thu, 11 Apr 2024 13:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712840831;
 bh=jBDcfNa+ZA0GhG6LAA8y9wdXr1NILjkk4RiSds6k6CM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEAigv/eqYtD+nsLaUlG13p5KlC4W5zHhp72SVBIi+SAijs3tSDYQHkjOz8atq0vF
 YHn+MDCqfVqEJm7JLB4lMHJtirV0VLuYgEmqShGnDjWGqMR5VUT0324OZlMJaDNg8P
 efibU29MYTA1wtA6bod9kF/GFyaPmhRldp5GKdYI=
Date: Thu, 11 Apr 2024 15:07:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH 1/2] sysfs: Add sysfs_bin_attr_simple_read() helper
Message-ID: <2024041101-haggler-devouring-9dcf@gregkh>
References: <cover.1712410202.git.lukas@wunner.de>
 <5ed62b197a442ec6db53d8746d9d806dd0576e2d.1712410202.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed62b197a442ec6db53d8746d9d806dd0576e2d.1712410202.git.lukas@wunner.de>
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

On Sat, Apr 06, 2024 at 03:52:01PM +0200, Lukas Wunner wrote:
> When drivers expose a bin_attribute in sysfs which is backed by a buffer
> in memory, a common pattern is to set the @private and @size members in
> struct bin_attribute to the buffer's location and size.
> 
> The ->read() callback then merely consists of a single memcpy() call.
> It's not even necessary to perform bounds checks as these are already
> handled by sysfs_kf_bin_read().
> 
> However each driver is so far providing its own ->read() implementation.
> The pattern is sufficiently frequent to merit a public helper, so add
> sysfs_bin_attr_simple_read() as well as BIN_ATTR_SIMPLE_RO() and
> BIN_ATTR_SIMPLE_ADMIN_RO() macros to ease declaration of such
> bin_attributes and reduce LoC and .text section size.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  fs/sysfs/file.c       | 27 +++++++++++++++++++++++++++
>  include/linux/sysfs.h | 15 +++++++++++++++
>  2 files changed, 42 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
