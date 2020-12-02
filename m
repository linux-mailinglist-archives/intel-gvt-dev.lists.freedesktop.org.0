Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1B2CB664
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Dec 2020 09:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BDD6E955;
	Wed,  2 Dec 2020 08:10:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D26EA03
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  2 Dec 2020 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnrzBwJgZU4I6Ezb6wFlxH0LO8dBB+DAYJtdnW/WoCA=;
 b=IBqFdzp1OAkCYrpYG7pX3pMmy6bYyhNr/6Hcw1YNyuCBbrX+2e05rA7Zuy/FV0zbwineTM
 JD7Yv9IPmtAk3qJTInPR37EP5mvt0tAQCkpNpNy1h1fH0rQ2AA+9hFUYKPDCIixbb+g4Xz
 j23vHCRiDIZSoQbU60dWvC7hTGdgSEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-CJ8zpBFONVCUPmqBiVyXjw-1; Wed, 02 Dec 2020 03:10:36 -0500
X-MC-Unique: CJ8zpBFONVCUPmqBiVyXjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8509457240;
 Wed,  2 Dec 2020 08:10:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED5B660BFA;
 Wed,  2 Dec 2020 08:10:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7382416E31; Wed,  2 Dec 2020 09:10:31 +0100 (CET)
Date: Wed, 2 Dec 2020 09:10:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/20] drm/bochs: Remove references to struct
 drm_device.pdev
Message-ID: <20201202081031.o63hddrz3gccbzvt@sirius.home.kraxel.org>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-5-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201201103542.2182-5-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Sam Ravnborg <sam@ravnborg.org>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 11:35:26AM +0100, Thomas Zimmermann wrote:
> Using struct drm_device.pdev is deprecated. Convert bochs to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 1 -
>  drivers/gpu/drm/bochs/bochs_hw.c  | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index fd454225fd19..b469624fe40d 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -121,7 +121,6 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto err_free_dev;
>  
> -	dev->pdev = pdev;
>  	pci_set_drvdata(pdev, dev);
>  
>  	ret = bochs_load(dev);
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index dce4672e3fc8..2d7380a9890e 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -110,7 +110,7 @@ int bochs_hw_load_edid(struct bochs_device *bochs)
>  int bochs_hw_init(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
> -	struct pci_dev *pdev = dev->pdev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  	unsigned long addr, size, mem, ioaddr, iosize;
>  	u16 id;
>  
> @@ -201,7 +201,7 @@ void bochs_hw_fini(struct drm_device *dev)
>  		release_region(VBE_DISPI_IOPORT_INDEX, 2);
>  	if (bochs->fb_map)
>  		iounmap(bochs->fb_map);
> -	pci_release_regions(dev->pdev);
> +	pci_release_regions(to_pci_dev(dev->dev));
>  	kfree(bochs->edid);
>  }
>  
> -- 
> 2.29.2
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
