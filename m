Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53B41D1E9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Sep 2021 05:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4921C6EB44;
	Thu, 30 Sep 2021 03:37:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9808C6E2D5;
 Thu, 30 Sep 2021 03:37:43 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id w68so2180124vkd.7;
 Wed, 29 Sep 2021 20:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4b3DOEuint+WBw7an5Qknmrkjl0i1y1HcTIoKU3zalE=;
 b=BNthy7e7lNpu4+NE9vBtOHHjcEgbb9FfvTE2xiomHVM5k2AoSstsZb0Ib/bCmpHFL2
 I7MR8CYJ1bz2mS6+go3Vk3zlHbpEz2YpzUW4xC+aZL+sl50WG8u78lofZsgMmXGZO6wh
 SLuR9F9VRZ68fE7aorklrfFUs40JM6A2qD1kgg8mj6vBGvoiR/kUJ0cnY9Shc0zUkdmu
 ZSWq3OAoyiTyhP074mbKhtSX7Dif1MwN/KE1ylJ708rkMwt1FA6CQhcKE2gVly5xOd3G
 cJOK7OgaI/JneKqOYeXV4utbWJjLCypgybzg8yYzI27DyrECFZKR+YY/IVrB4p1G4/h5
 jiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4b3DOEuint+WBw7an5Qknmrkjl0i1y1HcTIoKU3zalE=;
 b=4qoY6rZpKtsu31ZmuwpxhDQjDjHVuO8MQxdvAgvQAqGtuhfHA6FSIlhW5hPupPwt6A
 rtk/cvtF3JIYC0q48Oz9YTWV6i63qVCIeS5aRrqKSwi78mSyP1IijTZqVJDLfswshCx8
 w2cYr8gwRNFEpCR8Fgz74Ro9MTt49TcpCoV6KXXCjtDutHKD0zvsvX60gsPU7hAUxFh7
 QAFWyJECwwCU0qCV7Z8YQFHps8S6HrF2vDaQtAVUkIeS7TYfqhb495Hn5eb1TjVSRtXZ
 4Ugm7VtrTZF7EGBD4vco0ZQ9JqOVUemqowRuK/pHZ0+kkLq50ayN2JBVljkFvPKR8dSQ
 idqw==
X-Gm-Message-State: AOAM533UoJjx+ZPVQESgwQ7zuKg+7lSA7LUCnuXnj5FT7rMOk0zRWtkF
 Nlf1ukdXX3DckNGaKM1Te+IaM36T+e/EDDktaug=
X-Google-Smtp-Source: ABdhPJziVCgaFcxzo8BazIHTTlgJGuIrwL4ipzqezGpkldOKIC4mrZi+hraS0wbXD15E+6UNWvZS0MEa3h+MYmpMsEU=
X-Received: by 2002:a1f:1f0a:: with SMTP id f10mr1667502vkf.21.1632973062492; 
 Wed, 29 Sep 2021 20:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210930014427.14239-1-jim.cromie@gmail.com>
 <20210930014427.14239-3-jim.cromie@gmail.com>
 <a61f6bc2dc18397de92e4b7cdd9b37e2dff7e114.camel@perches.com>
In-Reply-To: <a61f6bc2dc18397de92e4b7cdd9b37e2dff7e114.camel@perches.com>
From: jim.cromie@gmail.com
Date: Wed, 29 Sep 2021 21:37:16 -0600
Message-ID: <CAJfuBxxHM+peMGnFQaQVOvhLC8n9GhVtWBOk1zmLwXpVmDSYpA@mail.gmail.com>
Subject: Re: [PATCH 2/4] amdgpu_ucode: reduce number of pr_debug calls
To: Joe Perches <joe@perches.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 29, 2021 at 8:08 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2021-09-29 at 19:44 -0600, Jim Cromie wrote:
> > There are blocks of DRM_DEBUG calls, consolidate their args into
> > single calls.  With dynamic-debug in use, each callsite consumes 56
> > bytes of callsite data, and this patch removes about 65 calls, so
> > it saves ~3.5kb.
> >
> > no functional changes.
>
> No functional change, but an output logging content change.
>
> > RFC: this creates multi-line log messages, does that break any syslog
> > conventions ?
>
> It does change the output as each individual DRM_DEBUG is a call to
> __drm_dbg which is effectively:
>
>         printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
>                __builtin_return_address(0), &vaf);
>
>

ok.  that would disqualify the nouveau patch too.
