Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0AA341886
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Mar 2021 10:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6336E33F;
	Fri, 19 Mar 2021 09:39:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDE76E33F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Mar 2021 09:39:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 183CC155E;
 Fri, 19 Mar 2021 05:39:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 19 Mar 2021 05:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=kO9EIFbwcecS2o10zQbVodVtOmf
 mhTFCB7/k828bLoM=; b=YLYiim/tX8bPjk6AuPLON+srkfCq/Lqn4e3GY5TcmBd
 sOvBH65cXWxq792sw8n5J/XrI/Uh1w9NAr7tgXED9NkrGgl2m8jttm6cbz9fq95c
 iXFM51S1tclmjcKX3N38gGPpdWzL67v+tmgUp0+N3AzwN5cLj6T6i6DXreLJXAmu
 4Qylc2Xh1Jy8cq5Gd6ESSCvv0+UuZu3ObJiUq6tD5AhN0EwpgfFt8eTBSaBYkbOU
 yKtk9zp9MTH5tSXE56NrpLZDMNt7YWl947MK0PWWPvvEM1NVX9WuImHrWNbg0HcT
 CPWxSnPW1UUXD8S2dC2hyUydRrP5mpS/LbIVuBNgUiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kO9EIF
 bwcecS2o10zQbVodVtOmfmhTFCB7/k828bLoM=; b=O8KkvYtrXIGVAlip+J5f5l
 v5NJMogcAmJnDWqshdFnYnMXLGB81wkWLapHzXi9FYtg9b32AKsU299YPNcAmLRB
 m2ZipM0vXyIw4xn88mVoAhq/se92o8DYgGHeaSzVJv/Gcav9a0r5TDF8QOh1FixF
 KZoyAIHhY3r3IvQSmA6KJ6HJ4izGXMSIxgxYSA4fSowurwtYVGcLd2WJXqR3orJK
 F59dt2xlSufMkcyWQuGa8tJS9Jr/TDEqnCaT5Aju67ffpfkaFx/XY7Kl5/41euSM
 icp/AiIzNvTi/KPF4vcK9FQbvQFJ60kpCwkCArwN38kgVPxAAzgL9XlUhFiUxFmw
 ==
X-ME-Sender: <xms:QnFUYPn5oTRmjmmTmaZxm1hykdJdhmifPItlTep9hg6WaSxSp38A-Q>
 <xme:QnFUYC1BD5c00-BpZq6BrUWrglK87IwKgejAd9XZockrcoGIE8FibFebuTI1uOq9K
 0VNXeGPnGMOyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedvvdetke
 fhgeejudeuueelfeethfeivefhheetveevhefhueduheegieefkeekgeenucffohhmrghi
 nhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvghes
 khhrohgrhhdrtghomh
X-ME-Proxy: <xmx:QnFUYFqG6Rgec7g4g5vTFUXc35rdxMShGBfGysryo923_SI_HeTswA>
 <xmx:QnFUYHl8_pW6GxwYCdhb5M5fDnfhvDbCNlSSsJsBQ5hnEbfNspZIMQ>
 <xmx:QnFUYN15_2pfAVr-_3G5QBT4LbMHlwDTp_LGaZCqKyXkB-7rT7Y8SQ>
 <xmx:QnFUYO898aREQY4nL4i9vx59piCU7_TokEwIkRvgNtzL-9xkpX4ZwQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04260108005C;
 Fri, 19 Mar 2021 05:39:13 -0400 (EDT)
Date: Fri, 19 Mar 2021 10:39:12 +0100
From: Greg KH <greg@kroah.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/gvt: Fix vfio_edid issue for BXT/APL
Message-ID: <YFRxQIExRDRMUhmI@kroah.com>
References: <cover.1615946755.git.colin.xu@intel.com>
 <982acc6579f652db9ed67f042453c302055b0692.1615946755.git.colin.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <982acc6579f652db9ed67f042453c302055b0692.1615946755.git.colin.xu@intel.com>
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

On Wed, Mar 17, 2021 at 10:55:04AM +0800, Colin Xu wrote:
> commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07 upstream
> 
> BXT/APL has different isr/irr/hpd regs compared with other GEN9. If not
> setting these regs bits correctly according to the emulated monitor
> (currently a DP on PORT_B), although gvt still triggers a virtual HPD
> event, the guest driver won't detect a valid HPD pulse thus no full
> display detection will be executed to read the updated EDID.
> 
> With this patch, the vfio_edid is enabled again on BXT/APL, which is
> previously disabled.
> 
> Fixes: 642403e3599e ("drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL")
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Link: http://patchwork.freedesktop.org/patch/msgid/20201201060329.142375-1-colin.xu@intel.com
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> (cherry picked from commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07)
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> Cc: <stable@vger.kernel.org> # 5.4.y
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 83 ++++++++++++++++++++++--------
>  drivers/gpu/drm/i915/gvt/vgpu.c    |  2 +-
>  2 files changed, 62 insertions(+), 23 deletions(-)

Can you also send a backport for 5.10.y for this patch as it is needed
there as well?

thanks,

greg k-h
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
