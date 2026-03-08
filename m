Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNJZJxYJrmkN/AEAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 09 Mar 2026 00:41:10 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7369232C33
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 09 Mar 2026 00:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5560E10E06E;
	Sun,  8 Mar 2026 23:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HmIT16LF";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547610E06E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  8 Mar 2026 23:41:06 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-79800183233so149006817b3.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 08 Mar 2026 16:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773013265; cv=none;
 d=google.com; s=arc-20240605;
 b=fyNnhQ8w7O6mke+/AzJGqBxSP7Jut4wyxQSyCjl17hp4EUqSAL+BbH8lL9bX8xK7DU
 GyfhGzldRUVEfWGbZJ1MQaDZ+3oLTWq1PwmtgItVJ2KvYZ3KAcQmEvFN1TO6BavSw3Tn
 DFYQvitY2s0XZWo0f+wYwRoekistvNb3T8u1aOx5flkQF0dOmxfW/fT/YSD/UBKp03fE
 F1q5mnuIUbfTm/yvxdgdFXsoNC+Z004kZCl1PoeyL9wj/5GzGt+MJPva+yK4helDdZSA
 f8/r0P07f1ffHZs9lhjopD39S1XztPsx6qq5gXRhzl6f2Cm43eD8/SvcO6XPDmKgfAeD
 OOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NQXx8uu4M0KLxzrAzxI+jDa08vrKCalXPwY/Drji+ig=;
 fh=FisNAEVYGapEgGH5Nfs+GpcKEOobIN0ZQLCauOBwGi4=;
 b=egN46HU/70i8We4ZUsNgJKenzDDklK2I5HodxjK4tyoAhT0QDkG0Vk4fnA0IhZ3mFU
 K4Kty5fD7tKBjW/u8spHP0Sc8SGhMe/xlkzv40CHnEZXzvVsjbv6U7jJgE2aMOALtn9F
 J5SA6rEZoLFF7MDhEH5DB+Jen1AbOa64/kwl+zZx6DcCe1MiobksAI67Q/C6FFEzhbOS
 7s512M1ts8+DiunU0Vyxj0Yrs2t1Fo1vmSVRqb3XGXRiQSg4v7CLeFSJyy0KpK4H5gQM
 a/006EmaYjb+4xfrI3vUTBpb+H0memjBRZcYr2m+24sT00OpCgGu6pSdPUyTbLayE0ru
 CLyA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773013265; x=1773618065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQXx8uu4M0KLxzrAzxI+jDa08vrKCalXPwY/Drji+ig=;
 b=HmIT16LFy3Qc/SOnEcRnxP4IrWF+j9Aa+zL/2QLaSO65+fjW3+i/5v1r4bg0PwL20O
 SCRaABU72ttJx+zdeptUMhqX6nKt6yr43x4Bh+aYcjOsz1CL8+NVAN37WrpaP0C8Xlto
 y0kpD7g2k1FWbd/9G/bneubiJ07nJnfRRoWClWLlHc2UHKXUzpQopVat2icoAZ9nnb6d
 1IC0cU1jqViTsmFZq9WdLdWkGRWV71ov+EeppvnoV5XB8RW9/JtFPvG+4Oh4Jm/Tfsqc
 dKG4O7yGVR6H6IQFuyc53HjEVqf7WmWZhim45WgjJY5o1PS2fAzuVZpQ6zOckwBn1EO1
 GUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773013265; x=1773618065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NQXx8uu4M0KLxzrAzxI+jDa08vrKCalXPwY/Drji+ig=;
 b=I9ungE4dPFp/oHNkiQcmKSatEix6YENHRU9VVW7vsfKDxH+wyOjcCzKlJk/Za3rH1I
 hcLHFm0ANgwHDg5+bbbT6EPkpney62Z278PGJci+KJIEUGbk4xKEZAHNi/J+40whsTIg
 4RLpR6yeOf0VufV0ghMNgXdHudeu0ySAYYkxflRQY1dagGubipD9RIhgjZPpv0g6ciLQ
 ti12XOrG4+EfPwT1Q0kEZ8LoIMo91/xAsiVxpjh9XrZnnw5goTYZpHvq5ImrJqaPiXIn
 kfWt8umKBQex+kyzzRGheqLLaJ8oXivMlHI6dW9CshKddWDZgB27HKvhF57AC48cyDGh
 JSkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvnNeVxM1Nb3xXxupcqlac068WV9SJr466bltt66sDddU5XnUBdQOvtH5dXu6m3RcHPe4b1WNKRRS9igy9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzdkx2/pgZsTsJrtTSCBuWPoDgcBs6EGgdKJyXhDVXMjixvbHk
 U7UXguVrYFZwXpw5zBDvQtHEwrrKb05AX97+4o2LNYy4LAO4W/6YH1Udv8yQetzqcCKQggcmvZ1
 Qz5Epywes4OxF9ZCO2RjJZE+It4Wx+9s=
X-Gm-Gg: ATEYQzyStMv+Iv8LByZTi0ion06m+RK+7gfocyeo3GdPoxoqso2V6Wt4mR75Jq9L82/
 hkQ0P+7CWH2C7hKGnfRgTpDil/6sFBzVYoDwYnMxW1jdaJkG330raYxaE/oE2s5gpMltCQjc95u
 MSmG7nOwtzXACo/ET/fqvNiebmzj+h+oYlbCQJ88hlrsJPk1G6BVUPhHl0FnmB2qgxClgFAPVh8
 P3ymLRrwUseSbs/d7a203pcV+C/s7f/drQ62uMbaR1AkOROT9clblXLHRGlKJU3NOVK+rOEo9wV
 KU5n
X-Received: by 2002:a05:690c:c50f:b0:796:4486:b7d0 with SMTP id
 00721157ae682-798dd6a9c02mr86884167b3.4.1773013265400; Sun, 08 Mar 2026
 16:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <2025022012-viscous-cringing-bf88@gregkh>
In-Reply-To: <2025022012-viscous-cringing-bf88@gregkh>
From: jim.cromie@gmail.com
Date: Sun, 8 Mar 2026 17:40:39 -0600
X-Gm-Features: AaiRm53r_scJ1hz_hrqKtTTL_x76n0lj7hLnJSP7FySmjXt2VLjJSlLhS6vTW4o
Message-ID: <CAJfuBxyqemd2FipDjt0TNo0KOG1XcnX1X9MJYnt80Zy2-6rPXw@mail.gmail.com>
Subject: Re: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, jbaron@akamai.com, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: D7369232C33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:intel-gfx-trybot@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:daniel.vetter@ffwll.ch,m:tvrtko.ursulin@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gitlab.freedesktop.org:url,linuxfoundation.org:email,patchwork.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, Feb 20, 2025 at 1:31=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Jan 24, 2025 at 11:45:14PM -0700, Jim Cromie wrote:
> > This series fixes dynamic-debug's support for DRM debug-categories.
> > Classmaps-v1 evaded full review, and got committed in 2 chunks:
> >
> >   b7b4eebdba7b..6ea3bf466ac6  # core dyndbg changes
> >   0406faf25fb1..ee7d633f2dfb  # drm adoption
> >
> > DRM-CI found a regression during init with drm.debug=3D<initval>; the
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
> > examines its drm.debug=3D<initval>, and applies it to the module being
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
> >   https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmai=
l.com/
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
>

If you'll have it, I'll send you the non-drm parts now.
Or the whole thing, and you can take the front half.
perhaps its too late for this cycle, but you can send it to linux-next IIUC=
.

This would free Lukas Bartosik to rework his dyndbg-to-tracefs patchset on =
top.
It has the nice feature of private tracefs buffers, allowing to
isolate drm.debug
messages there.  It also enables strong verification in selftests, by ensur=
ing
that no unrelated log-msgs get into the private tracebuf.


Ive been banging on DRM-CI, with some success.
Hopefully enough demonstrated soon to overcome the inertia.
https://gitlab.freedesktop.org/jim.cromie/kernel-drm-next-dd.git

Some tests on i915 timed out and failed, cuz toggling up to 1800
drm-dbg callsites with dyndbg took 800 ms when 150 ms was expected.
I have a fork of IGT adding time-dilation when drm-dbgs with classes
are found in dynamic_debug/control.  An alternate approach batches
256 static-key toggles in 1 IPI (by sorting rather than flushing on
out-of-order addys).
This cuts IPIs to 1/170, but is RFC, and only sorted on x86.



> And I think the last patch in this series isn't correct, it looks like a
> 000 email somehow.
>

IIRC, that was me trying to get a merge-message or something like it.


> thanks,
>
> greg k-h
