Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8316A06E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Feb 2020 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28066E1D6;
	Mon, 24 Feb 2020 08:51:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772946E1D6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Feb 2020 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582534275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHGik2V9WaCCAJ4QmMb1zLrayHoHn+mNhVamjlOD1Io=;
 b=Jt1u5GudlT1UXyViBexO/noFu6zb8FFwAvvVzlZIAijQ1cp6EB0OI1c0xFxITa1DTKCbpd
 qoBwLxzPmNuLEVXU4oTBJs81YlH8cr8CtBzeRZMTra8M2j4Oz0MIbJEOKZ0vB8r4C5XC77
 9RQlDMYkr08wr9wt9gKqewKIERjGV1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-eCtyU_0CPW2M5qPFwCd98A-1; Mon, 24 Feb 2020 03:51:11 -0500
X-MC-Unique: eCtyU_0CPW2M5qPFwCd98A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A890DBB4;
 Mon, 24 Feb 2020 08:51:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0BE19298E;
 Mon, 24 Feb 2020 08:51:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3BCF1747F; Mon, 24 Feb 2020 09:51:08 +0100 (CET)
Date: Mon, 24 Feb 2020 09:51:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: EDID / guest resolution handling
Message-ID: <20200224085108.2htat4lvxn4t4p5r@sirius.home.kraxel.org>
References: <b890a3ee8bb81710b65fa4c5d66bfc62f0c59021.camel@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <b890a3ee8bb81710b65fa4c5d66bfc62f0c59021.camel@cyberus-technology.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 02:04:05PM +0100, Julian Stecklina wrote:
> Hello,
> 
> we wondering what the best way is to handle different guest resolutions.
> Specifically, we are looking into adding "normal" FullHD resolution (1920x1080)
> to guests. 
> 
> At the moment, we do this by adding another vGPU type. This is certainly
> possible, but it seems a more flexible approach is to give the VMM control over
> the EDID information exposed to guests.

qemu -device vfio-pci,xres=1920,yres=1080,... should do exactly that and
should work with new enough qemu and kernel (was merged upstream roughly
a year ago IIRC).

> Is there anything that speaks against uploading the EDID from the VMM?

No ;)

cheers,
  Gerd

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
