Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C100B5AF451
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  6 Sep 2022 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B043310E8B2;
	Tue,  6 Sep 2022 19:18:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048710E8B2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  6 Sep 2022 19:18:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e13so16928039wrm.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 06 Sep 2022 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ldW0aueJLSvFBgFoP+jVpya8KF5NDDRSTKWLEKQB0Mg=;
 b=UfB5K2IGJ3KmpZjfe/zyCnJmZ5c3Kq9j3d+0Rv76CZxF3H96scfi3BURNTLXDCp8NZ
 hD/ENVoNsH9mTdc8HeffjfefDZYsneYwEiy7VA2JNg6h7d2JdxWyHUXiPlQLdz4EP5rw
 3mVD3HHGkOyrGMvtVhHpOPu/wTHimVHE+ZnGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ldW0aueJLSvFBgFoP+jVpya8KF5NDDRSTKWLEKQB0Mg=;
 b=cb3Kqfxqex0Sg1U0yhLJck5QHDRcw6G0OMhnmkQLkJ5oChfqPcrTMAe8ZBAEXruNvt
 xqIKCe7F07RviHe1+pbjdkJo/StVuY/5m6omkiWE+MZ9L9ho5XCId+GbXhjxwC+SpmKD
 fmZGvf12L0z00l2Eh462xnnBEPzjkL9MzvjLyvM2dHXkILXhgrn/GPfWAQtmAY7ajq1R
 12YZreFhCS2TQ0erZCUyY8WkCiAXSdV7Csz98FNpslprkEjPzeK4/+qv36VaePuqBq28
 5GrOFvlTMTfEgowKUmUHh5KTPLgBYIG5jTpEAoBkSiaFxNoC1D6H18vLIuGC1dd85cmg
 oM0w==
X-Gm-Message-State: ACgBeo0oJ2O/rNFq9XXN0vP1fvecGXzZTucY/2ac7IEJ9j7Vp26kI341
 0BrMtmLNQgz5ls4N0xZMAq1WEQ==
X-Google-Smtp-Source: AA6agR7/xGFspJWbW+/38yyVTrYmpvw1aq1F4ekVwGK63qBo1VvKHy6ltg3qtJAHeQrqYUJh87qgVg==
X-Received: by 2002:a5d:6d8f:0:b0:225:6285:47fb with SMTP id
 l15-20020a5d6d8f000000b00225628547fbmr29375256wrs.211.1662491891887; 
 Tue, 06 Sep 2022 12:18:11 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 bd7-20020a05600c1f0700b003a331c6bffdsm15569682wmb.47.2022.09.06.12.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:18:11 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:18:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <Yxec8VRCQT5fJdqk@phenom.ffwll.local>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
 <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
 <YvUz2Nk6YHl+jVwR@phenom.ffwll.local> <YvXtQ7/FJFSVXlGU@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvXtQ7/FJFSVXlGU@kroah.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: jim.cromie@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 robdclark@gmail.com, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 08:03:47AM +0200, Greg KH wrote:
> On Thu, Aug 11, 2022 at 06:52:40PM +0200, Daniel Vetter wrote:
> > On Wed, Aug 03, 2022 at 04:13:05PM -0400, Jason Baron wrote:
> > > 
> > > 
> > > On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> > > > On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> > > >>
> > > > 
> > > >> Hi Jason, Greg, DRM-folk,
> > > >>
> > > >> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> > > >> means either DISJOINT (like drm debug categories), or VERBOSE (like
> > > >> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> > > >> drivers i915, amdgpu, nouveau.
> > > >>
> > > > 
> > > > This revision fell over, on a conflict with something in drm-MUMBLE
> > > > 
> > > > Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> > > > not applied
> > > > Applying: dyndbg: fix static_branch manipulation
> > > > Applying: dyndbg: fix module.dyndbg handling
> > > > Applying: dyndbg: show both old and new in change-info
> > > > Applying: dyndbg: reverse module walk in cat control
> > > > Applying: dyndbg: reverse module.callsite walk in cat control
> > > > Applying: dyndbg: use ESCAPE_SPACE for cat control
> > > > Applying: dyndbg: let query-modname override actual module name
> > > > Applying: dyndbg: add test_dynamic_debug module
> > > > Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> > > > 
> > > > Jason,
> > > > those above are decent maintenance patches, particularly the drop export.
> > > > It would be nice to trim this unused api this cycle.
> > > 
> > > Hi Jim,
> > > 
> > > Agreed - I was thinking the same thing. Feel free to add
> > > Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.
> > 
> > Does Greg KH usually pick up dyndbg patches or someone else or do I need
> > to do something? Would be great to get some movement here since -rc1 goes
> > out and merging will restart next week.
> 
> Yes, I can take these into my tree after -rc1 is out.

[uncovering from an absolutely impressive cascade of holes :-(]

Did this happen and I can stop worrying here? I'd like to make sure these
drm debug infra improvements keep moving.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
