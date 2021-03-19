Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E69341888
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Mar 2021 10:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5366D6E33F;
	Fri, 19 Mar 2021 09:39:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486096E33F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Mar 2021 09:39:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BAA1C12B2;
 Fri, 19 Mar 2021 05:39:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 19 Mar 2021 05:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Vg0WcAYTaDJG3+UT2jouK9oxxKm
 O0P3cn5Cq+QkmLOY=; b=QtrzJH2cIbPtv5Romtvf+XOETynyfHZSV4MGII2crHV
 U5mlyrwa3uR/dbdexOSo2UdhpwFMj0I8cukw4Y31TuaGc5HugTQWpgQ9ulbgUbxN
 X3dVvmLxhqdFCqleSyXxAX2ENlvyv7MiQPvsCvmdcpy3zTKU0uE+edz3RuXyL9mb
 YGCWiBVbvq2uNe86BjD4jDG335x+d6mY7euGjDu+e+9sgmsgN7DWMi+GDY1Zugn6
 hnD1VWT7FYIJ8ii3NWJLE6pXzCET7EmkDSwjzFD9peXQP+eLUoUAD/dHCK465Zon
 0gaav+JnjkFKYMhg5OddRjOAewJ4YqwTEAh7m9pyt0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vg0WcA
 YTaDJG3+UT2jouK9oxxKmO0P3cn5Cq+QkmLOY=; b=BcKMIpTTJCIg3vCIARyJNg
 MJ5asVl171cIMGZuQhVe38oWxF6XQzCcqlJ/FK4xVpDO/+bbzcSP22N/H6RXHA0U
 iRHmWN+56XvPGtluRB+Rhk0/EmFbOXoJ2u5nEUCW9RDeTDnCAC3slfjPeRZGcVkf
 TXl02+xrioN7JMj4l0jmQyCpEbaY2mILUwu3U+Ee4n0S3YYJtjR3bIyZtDzrHHsx
 Y1l2Xg8CJ6tFdDqFCVqRbIUNTy4iPBAGXUwPrcoi01CiKpCymMkjCBDvoEJ4njGM
 ASN6GkMeHrRLwHh2dPe/2m9Poj+sD3sCPlM023pvIaK31HllEPpagGb/YURGy24A
 ==
X-ME-Sender: <xms:VXFUYJdSDfgmZEwjKPsge2jPsWsomibRX9tGMamFHm2yNyb9USMFXQ>
 <xme:VXFUYHPwCfMrsPBVm6yEpkxUr7ds0nBjHLKCcT5vZo_4lmwRe3liBu2hJbo4LTuwC
 BFMjoTklvqVbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefguddvhf
 dvueegieeuvdduledtgedvteehtefhkeevkeehgfdtledvhfefvdeigeenucffohhmrghi
 nhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvghes
 khhrohgrhhdrtghomh
X-ME-Proxy: <xmx:VXFUYCgLp8S7brvTY9rLj-XobFEKyQKMcfvStnaXk6bkSp1-foDNyA>
 <xmx:VXFUYC8c6Qzs5pBmzpyBoVBwm7iUxQ0iBmo8nkyTNX6YsYMGmSYTQQ>
 <xmx:VXFUYFv-KuhXi7t6CTEJYydQJMsrSHsx-30ES5jIaJtQrNWeL63H1g>
 <xmx:VXFUYGXer9EhP8IceCiQ0V03JtxQjOW1CBSsdiYDCKwAKC___n7IHw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC6B124005C;
 Fri, 19 Mar 2021 05:39:32 -0400 (EDT)
Date: Fri, 19 Mar 2021 10:39:30 +0100
From: Greg KH <greg@kroah.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 3/5] drm/i915/gvt: Fix virtual display setup for BXT/APL
Message-ID: <YFRxUpzFf/qAyMER@kroah.com>
References: <cover.1615946755.git.colin.xu@intel.com>
 <280168619124c762cb29add7e68952222a0e4801.1615946755.git.colin.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <280168619124c762cb29add7e68952222a0e4801.1615946755.git.colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 10:55:02AM +0800, Colin Xu wrote:
> commit a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a upstream
> 
> Program display related vregs to proper value at initialization, setup
> virtual monitor and hotplug.
> 
> vGPU virtual display vregs inherit the value from pregs. The virtual DP
> monitor is always setup on PORT_B for BXT/APL. However the host may
> connect monitor on other PORT or without any monitor connected. Without
> properly setup PIPE/DDI/PLL related vregs, guest driver may not setup
> the virutal display as expected, and the guest desktop may not be
> created.
> Since only one virtual display is supported, enable PIPE_A only. And
> enable transcoder/DDI/PLL based on which port is setup for BXT/APL.
> 
> V2:
> Revise commit message.
> 
> V3:
> set_edid should on PORT_B for BXT.
> Inject hpd event for BXT.
> 
> V4:
> Temporarily disable vfio edid on BXT/APL until issue fixed.
> 
> V5:
> Rebase to use new HPD define GEN8_DE_PORT_HOTPLUG for BXT.
> Put vfio edid disabling on BXT/APL to a separate patch.
> 
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Link: http://patchwork.freedesktop.org/patch/msgid/20201109073922.757759-1-colin.xu@intel.com
> (cherry picked from commit a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a)
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> Cc: <stable@vger.kernel.org> # 5.4.y
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 173 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
>  2 files changed, 178 insertions(+)

I've taken this backport for 5.10.y as well, because it is missing
there.

greg k-h
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
