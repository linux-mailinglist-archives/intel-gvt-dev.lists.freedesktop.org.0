Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F237B979
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 May 2021 11:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645EE6EB83;
	Wed, 12 May 2021 09:42:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D26EB4C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 May 2021 09:42:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CE869131E;
 Wed, 12 May 2021 05:42:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 12 May 2021 05:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=J6tud28kU+o44k7J2+5qqEvqPes
 2RVNGsgrOS6UVvsE=; b=pld1EO+mtW/gr8p0QlKVS7GrQGJckxO8ht/V69C09hM
 eGLWCI/GZ2TQpfsQG5RbVBtyQmAzaXrClIxDdaHVtpZ9Hn1pTZR8WqhoA1q+KKCc
 kwl4yHV5C6igo3n98RUQDtqKVZQHNpjIfu56xDZcfpxvS48OUpNk7BjRcwmVqY5p
 oO3129oS3sZPZwTIogApiwMmyqJ517WixlLeFnjLq3fIlFlDMr8a6wnNtKAw5G6i
 JP+FFqeFbJkXsRtdzud/Px2mAQ+5jB79prVVpufFVUOi/UgeqG6CQCi6xTzo0atW
 ZhWIEPKmEkkTTKOURlC0QrYyKMZgw4gE8JZ1vSf5AZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=J6tud2
 8kU+o44k7J2+5qqEvqPes2RVNGsgrOS6UVvsE=; b=N6Ft6IBIKs8uDI+s2uG+Ja
 bEh47kexy8w2835NdrBuw3Tq9cNg3HgkLbavrAmEhPxRkNlZb2xSII+iORqI5TDo
 A8LwPr0Ab7V70JMRKYv1Rnqw/i4/l+OupSOF5vbQ+CWRLDDFpWHPST4O/gwHXykf
 lqGlHQNdDUL/K2G82NzTi9kQ5AnK7uj5lzKjd0dyoXxaGstmm8WvzzRrPeuVcXnM
 w7pf6niVuBrNkeOhZVOCHcwpyWaN8LMhVpEPHP//ktti5aOHF7ZGCd5/edbQo2DR
 lD8ULPTV74I5nfBYHeAGVtIaIyQAtbrJYthYqKjXgZatK5MlJ7fyJomiwtd8ZkuA
 ==
X-ME-Sender: <xms:EaObYPQZKWLHypNy1tpJ-W-HTtYjugFjtDurZbFaGUFopsCP4-wQSw>
 <xme:EaObYAxht4VeWkng3QHJ3Z_TvPNhjLAyTNx8v5Z00ASTv1Rtv_-8_rXR67iRicKZa
 1WRi_RjDiDXRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:EaObYE1ytYbvmm66_Zc_x7bh21x7QswyNSHUae5T9hZUg8N54setNA>
 <xmx:EaObYPBE0smYOjWsefpY3hk-jzq-5L06SSVDj8KgaNQX8MJLeN_Chg>
 <xmx:EaObYIi--sEOaF9uCBI9npXkwWKflTdqVnJB4DTfaJtTeAwo9x_enQ>
 <xmx:EqObYCajWQde9AoDTyOnTkQc-1bnMH-M1bcvAbFoeTA-p5e5-E0C1A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 12 May 2021 05:42:40 -0400 (EDT)
Date: Wed, 12 May 2021 11:42:39 +0200
From: Greg KH <greg@kroah.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 0/2] drm/i915/gvt: Backport GVT BXT/APL fix to 5.10.y
Message-ID: <YJujD8tUc9Csr6wo@kroah.com>
References: <cover.1620702000.git.colin.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1620702000.git.colin.xu@intel.com>
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

On Tue, May 11, 2021 at 11:02:53AM +0800, Colin Xu wrote:
> commit a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a upstream
> commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07 upstream
> 
> Upstream intel-gvt fixed some breaking and GPU hang issues on BXT/APL platform
> but 5.10.y doesn't have so backport them. These patch have been rebased to
> linux-5.10.y.
> 
> Colin Xu (2):
>   drm/i915/gvt: Fix virtual display setup for BXT/APL
>   drm/i915/gvt: Fix vfio_edid issue for BXT/APL
> 
>  drivers/gpu/drm/i915/gvt/display.c | 212 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
>  drivers/gpu/drm/i915/gvt/vgpu.c    |   5 +-
>  3 files changed, 219 insertions(+), 3 deletions(-)
> 
> -- 
> 2.31.1
> 

All now queued up, thanks.

greg k-h
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
