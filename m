Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D8A3D516
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Feb 2025 10:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEC810E4A7;
	Thu, 20 Feb 2025 09:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X4Noble0";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA310E4BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Feb 2025 09:45:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f22fe8762so321134f8f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Feb 2025 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740044757; x=1740649557; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/QbdcI7C6XxVE5jz6sKFGZdf665BDupYKEBKSwxSEs=;
 b=X4Noble0GS90b+QuH2pGjLISpTs1qZFVg9+Ex3gqZEWvXgZKOK9iy6o3cKUhOD8IMZ
 p1YqODujjEu+2WXBzg01ph/M0+90mWcmorVUy26G12LMSNoQDwWVK1WEFSKzu37qZ0mA
 +u6pTMJShMecQdrYjkFvHeULxwjmxl6zz15fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044757; x=1740649557;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j/QbdcI7C6XxVE5jz6sKFGZdf665BDupYKEBKSwxSEs=;
 b=FrTO7zxYfgfUPsvMG3MBE8w7K9+eHv6JA/qaF8FRw4WiVxT7SMIR/4TSvAaLtEZMKt
 JgC/UsmX9gzrcHEogjFZIEzSdRlUvnivvakqhKu17XphQMDnVBxJJ8h1iCcIjwbr4hDL
 jJcVQdbHhRpteCEI/lro4Ni0eHL2UVeob6HO95dLs+CvIFso5oviZp7pzL6V6DevMJgR
 5VFIjt8gnI+JBcsPgkOSBLp4bQnX2Vk7ej8Vyw536+mYiKSdyaEc+lF1WZVlK0d1Efiz
 oVpmhLU9gbUApUvTf4W5xc0/2WrZ9VR+kuaZxB+Hr9qtWRm+5Ksp7bbYDO9HQCaYzHoI
 Xb9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWureS8/L0s8EhI1lntlMT+vRbJIYZTa3fz6frVHlAwMYuL3EaE4cWWz7Lodg+2q81SJFVtuOD1MpMl7xq2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBMHZGHymoxmwAhMskeHQ9KyA9A1Xw0R6dYTQZtIHZyaoI5fzr
 nUQ9PUdOtbaI0tFCcsASlu8cQQobTpfPt11c7l7tCOiJWwyxCvvk6cdl8eztVfY=
X-Gm-Gg: ASbGnctVmVw5LRHVWz7iqsl0NRQ+/S/TzVj1kM09HHRIirUNfNCT374jSNViyuncRMz
 yrf0Ad6dCM+NYr0IH5usB2RGY0fYnpesSFmzg0N8/ePxZZoozchoXjfqCnpDoAU9FqvzsUQxoQa
 BTPZjfRQtHfSkK93T+NkUusbX5j+/fCAm3ajvPzb7fqIa8IrzIfaeLTsv3PTo9b56c/eF+VIwrl
 MhgWa3s3p9iphFdPVCHv4CWZjZBdgx/pMDFPojVkiAZzJxeytrpKo0d3+/PKheO+vFNCxy9cBQb
 MzBzYVy5Tj0akvrq05kbw/FccMA=
X-Google-Smtp-Source: AGHT+IGpuAwEB4NAeWO90X12ML8FmH1WxKE/6GeffuYce5PPhHcnTL5xNEF5aXBpLAm2OEdPIQ/h0w==
X-Received: by 2002:a05:6000:1948:b0:38f:218c:f672 with SMTP id
 ffacd0b85a97d-38f65145d52mr1206188f8f.41.1740044757301; 
 Thu, 20 Feb 2025 01:45:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b434fsm20419757f8f.16.2025.02.20.01.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:45:56 -0800 (PST)
Date: Thu, 20 Feb 2025 10:45:54 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Message-ID: <Z7b50rGRA4RuybgC@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <2025022012-viscous-cringing-bf88@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022012-viscous-cringing-bf88@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Feb 20, 2025 at 09:31:41AM +0100, Greg KH wrote:
> On Fri, Jan 24, 2025 at 11:45:14PM -0700, Jim Cromie wrote:
> > This series fixes dynamic-debug's support for DRM debug-categories.
> > Classmaps-v1 evaded full review, and got committed in 2 chunks:
> > 
> >   b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
> >   0406faf25fb1..ee7d633f2dfb	# drm adoption
> > 
> > DRM-CI found a regression during init with drm.debug=<initval>; the
> > static-keys under the drm-dbgs in drm.ko got enabled, but those in
> > drivers & helpers did not.
> > 
> > Root Problem:
> > 
> > DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
> > afterwards".  Replace it with DYNDBG_CLASSMAP_DEFINE (invoked once in
> > drm-core) and DYNDBG_CLASSMAP_USE (invoked repeatedly, in drivers &
> > helpers).
> > 
> > _DEFINE exports the classmap it creates (in drm.ko), other modules
> > _USE the classmap.  The _USE adds a record ref'g the _DEFINEd (&
> > exported) classmap, in a 2nd __dyndbg_class_users section.
> > 
> > So now at modprobe, dyndbg scans the new section after the 1st
> > __dyndbg_class_maps section, follows the linkage to the _DEFINEr
> > module, finds the (optional) kernel-param controlling the classmap,
> > examines its drm.debug=<initval>, and applies it to the module being
> > initialized.
> > 
> > To recapitulate the multi-module problem wo DRM involvement, Add:
> > 
> > A. tools/testing/selftests/dynamic_debug/*
> > 
> > This alters pr_debugs in the test-modules, counts the results and
> > checks them against expectations.  It uses this formula to test most
> > of the control grammar, including the new class keyword.
> > 
> > B. test_dynamic_debug_submod.ko
> > 
> > This alters the test-module to build both parent & _submod ko's, with
> > _DEFINE and _USE inside #if/#else blocks.  This recap's DRM's 2 module
> > failure scenario, allowing A to exersize several cases.
> > 
> > The #if/#else puts the 2 macro uses together for clarity, and gives
> > the 2 modules identical sets of debugs.
> > 
> > Recent DRM-CI tests are here:
> >   https://patchwork.freedesktop.org/series/139147/
> > 
> > Previous rev:
> >   https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmail.com/
> > 
> > Noteworthy Additions:
> > 
> > 1- drop class "protection" special case, per JBaron's preference.
> >    only current use is marked BROKEN so nobody to affect.
> >    now framed as policy-choice:
> >    #define ddebug_client_module_protects_classes() false
> >    subsystems wanting protection can change this.
> > 
> > 2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
> >    implement several required constraints, and fail obviously.
> > 
> > 3- modprobe time check of conflicting class-id reservations
> >    only affects 2+classmaps users.
> >    compile-time solution not apparent.
> > 
> > 4- dyndbg can now cause modprobe to fail.
> >    needed to catch 3.
> >    maybe some loose ends here on failure.
> > 
> > 5- refactor & rename ddebug_attach_*module_classes
> >    reduce repetetive boilerplate on 2 types: maps, users.
> >    rework mostly brought forward in patchset to reduce churn
> >    TBD: maybe squash more.
> > 
> > Several recent trybot submissions (against drm-tip) have been passing
> > CI.BAT, and failing one or few CI.IGT tests randomly; re-tests do not
> > reliably repeat the failures.
> > 
> > its also at github.com:jimc/linux.git
> >   dd-fix-9[st]-ontip  &  dd-fix-9-13
> > 
> > Ive been running it on my desktop w/o issues.
> > 
> > The drivers/gpu/drm patches are RFC, I think there might be a single
> > place to call DRM_CLASSMAP_USE(drm_dedbug_classes) to replace the
> > sprinkling of _USEs in drivers and helpers.  IIRC, I tried adding a
> > _DEFINE into drm_drv.c, that didn't do it, so I punted for now.
> > 
> > I think the dyndbg core additions are ready for review and merging
> > into a (next-next) test/integration tree.
> 
> So whose tree should this go through?

I'm trying to get some drm folks to review/test this, but thus far not
much success :-/ I think it's good stuff, but I'm somewhat hesitant if no
one else agrees that it's useful for CI or in-field crash-recording or
whatever ...

I guess worst case we can land it and hope it attracts more folks?

Wrt tree I don't care, but I guess we should then also land the drm side
too.
-Sima

> And I think the last patch in this series isn't correct, it looks like a
> 000 email somehow.
> 
> thanks,
> 
> greg k-h

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
