Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F35E8CEF
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 24 Sep 2022 15:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F151810E295;
	Sat, 24 Sep 2022 13:02:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14E10E295;
 Sat, 24 Sep 2022 13:02:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F9CDB80D6F;
 Sat, 24 Sep 2022 13:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5B9C433C1;
 Sat, 24 Sep 2022 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664024557;
 bh=f9TI+zLW1k/oFp4jM/JMZaUsym4/RFdsc3oPkp8gl1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vITOSzQTGC/YMameL61MhoY34yQPY9hA/15BiGXn3DaQb0P/4ieDqrLxOzgFJD/EC
 OaJ5R8dLDwURtAdRo2n3a07T27JXSXU6D94vXm+uPBGbELv+Mk6Qeh0ckggaTKWgi3
 NCAIw6POslOurSMVto1kITZtI4YmGXRMz+l4pFeQ=
Date: Sat, 24 Sep 2022 15:02:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Yy7/6oTBW2lqVSK1@kroah.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: robdclark@gmail.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, jbaron@akamai.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> hi Greg, Dan, Jason, DRM-folk,
> 
> heres follow-up to V6:
>   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> 
> It excludes:
>   nouveau parts (immature)
>   tracefs parts (I missed --to=Steve on v6)
>   split _ddebug_site and de-duplicate experiment (way unready)
> 
> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> 
> If these are good to apply, I'll rebase and repost the rest separately.

All now queued up, thanks.

greg k-h
