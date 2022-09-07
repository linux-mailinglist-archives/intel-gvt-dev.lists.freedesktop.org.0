Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFE5AFC23
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Sep 2022 08:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AA910E331;
	Wed,  7 Sep 2022 06:08:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B6610E32D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Sep 2022 06:08:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a70so1984338edf.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 06 Sep 2022 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=s4afVmtZrj2yE4ZH0qN126RX1/YJ7bOqfTTyi6e2VfQ=;
 b=iNvn+xFvBU3gG202ZB3IxSE7E2zfsCPETADmVVvwwTaGefLtdfoy13uL4QSQFdeNan
 9KOVmrIvNndmzBekqn1tpdVMjkUJ+CBJlvMm8KODLzsp7jZnH0z23WCuZHdkPqOVkM/8
 NW9A/F0g4Z5oKQjAcynPAWs3/rgX/QQTVAs7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=s4afVmtZrj2yE4ZH0qN126RX1/YJ7bOqfTTyi6e2VfQ=;
 b=hO0+5HBR3mXiD72rNqO4tqcPaSqvch/JBKIXPAPs8aMO1jblBDnDkuFvYY8gCAYv0t
 T14tfFNMaBmFhEjDW6JGOmfbbhp6Q9M1/SPJluhyJ/05ZnkJ/ZB1SdfVYVQitG77YzVR
 QVRUzQl4YFcEquH2qR9Zx2d/ogL8wfil9BXijESykhFFDOmsTdVFdmwITCSd8B6URs2a
 yfAkH+A8ngKZiK3poyR2OajGdu4UsUK/9x9IUXcakGZvd9tPZfKad9AtfHxSAlruhG2Y
 grPEw5hvl8Em21U/z+B5nrEptZweZdo/z9IYQhAARpUjhPFPY9xU+HBbvqvqz+v81H2K
 JxVg==
X-Gm-Message-State: ACgBeo1eqqk4mTsWvP/Bctic2Y0d4eROPHhsDDqCOLS3nB23ir/IfBec
 /rbTmNgsw5OGNT0QtYEL4yWXLA==
X-Google-Smtp-Source: AA6agR77BAciYBgwqpKnAc9x8rLCWXKGOPypzZ9RHfLUvfx/sMK/oygA+CUYL6PI6U3Cntlx11hJhQ==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id
 h4-20020a056402280400b0043983c28be2mr1748729ede.292.1662530922538; 
 Tue, 06 Sep 2022 23:08:42 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m14-20020a1709062b8e00b0072f42ca292bsm7642841ejg.129.2022.09.06.23.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 23:08:41 -0700 (PDT)
Date: Wed, 7 Sep 2022 08:08:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <Yxg1Z8SzpcuTpRAC@phenom.ffwll.local>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
 <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
 <YvUz2Nk6YHl+jVwR@phenom.ffwll.local> <YvXtQ7/FJFSVXlGU@kroah.com>
 <Yxec8VRCQT5fJdqk@phenom.ffwll.local> <YxgwXgEpzyqg0cjR@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxgwXgEpzyqg0cjR@kroah.com>
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

On Wed, Sep 07, 2022 at 07:47:10AM +0200, Greg KH wrote:
> On Tue, Sep 06, 2022 at 09:18:09PM +0200, Daniel Vetter wrote:
> > On Fri, Aug 12, 2022 at 08:03:47AM +0200, Greg KH wrote:
> > > On Thu, Aug 11, 2022 at 06:52:40PM +0200, Daniel Vetter wrote:
> > > > On Wed, Aug 03, 2022 at 04:13:05PM -0400, Jason Baron wrote:
> > > > > 
> > > > > 
> > > > > On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> > > > > > On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> > > > > >>
> > > > > > 
> > > > > >> Hi Jason, Greg, DRM-folk,
> > > > > >>
> > > > > >> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> > > > > >> means either DISJOINT (like drm debug categories), or VERBOSE (like
> > > > > >> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> > > > > >> drivers i915, amdgpu, nouveau.
> > > > > >>
> > > > > > 
> > > > > > This revision fell over, on a conflict with something in drm-MUMBLE
> > > > > > 
> > > > > > Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> > > > > > not applied
> > > > > > Applying: dyndbg: fix static_branch manipulation
> > > > > > Applying: dyndbg: fix module.dyndbg handling
> > > > > > Applying: dyndbg: show both old and new in change-info
> > > > > > Applying: dyndbg: reverse module walk in cat control
> > > > > > Applying: dyndbg: reverse module.callsite walk in cat control
> > > > > > Applying: dyndbg: use ESCAPE_SPACE for cat control
> > > > > > Applying: dyndbg: let query-modname override actual module name
> > > > > > Applying: dyndbg: add test_dynamic_debug module
> > > > > > Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> > > > > > 
> > > > > > Jason,
> > > > > > those above are decent maintenance patches, particularly the drop export.
> > > > > > It would be nice to trim this unused api this cycle.
> > > > > 
> > > > > Hi Jim,
> > > > > 
> > > > > Agreed - I was thinking the same thing. Feel free to add
> > > > > Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.
> > > > 
> > > > Does Greg KH usually pick up dyndbg patches or someone else or do I need
> > > > to do something? Would be great to get some movement here since -rc1 goes
> > > > out and merging will restart next week.
> > > 
> > > Yes, I can take these into my tree after -rc1 is out.
> > 
> > [uncovering from an absolutely impressive cascade of holes :-(]
> > 
> > Did this happen and I can stop worrying here? I'd like to make sure these
> > drm debug infra improvements keep moving.
> 
> I didn't take these, and I think I saw a 6th series sent:
> 	https://lore.kernel.org/r/20220904214134.408619-1-jim.cromie@gmail.com
> 
> If you ack them, I will pick them up.

Hm here we only talked about the first 9 or so patches from the series, do
you still want my ack on those?

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Since yeah I do like the direction of this :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
