Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6726E666254
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Jan 2023 18:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1210E7D2;
	Wed, 11 Jan 2023 17:55:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A710C10E7D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Jan 2023 17:55:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso18066373pjf.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Jan 2023 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i7Y/8dpiTrt5XwA66qUKG1WmzZB0zeXo7IcqUJW6CPQ=;
 b=MczkQLZ8ed6AHL2OMQOdtKRAQGm0lp4zyPT4PoqgM9PtkQnELcpd3qDLIXLvCdG3h2
 4K8vLqwwOaHavSfJsui7fuj5PJwnk4FFc0w3xGvI6TP5DH1s36+dDr1Ra6PsFByduW6g
 jb9dMI/SU+HRDQTAjwvjwyrpQVeErh+7G8aXwo6ZLT10mPle+5tAXecVjxxlWymPe7CY
 e9utDW6Czu0ww0QlRo80dD/SUZSVBE/EIG7td4Tewom5dIo15jQCg5q5ABjL1KYa6Na8
 qa8d3Z3OmPQLE5t2D1DPIATNRL/yT3aiktPdUbKc/3Vn/nOi2R0nOGd3MNRgx4BQx576
 LrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7Y/8dpiTrt5XwA66qUKG1WmzZB0zeXo7IcqUJW6CPQ=;
 b=08RPN1+bGcXxOaT/eEveK1uMP3pV+RlMni+T1CT9LytNRIB8DAumgBeQa5KJPxxQSz
 S3chRIRl87KyMG9xArN1CsqhDDLmDmHzGQeUws7RukMXhkI3IOHQX7D2ID/8ZiI5Lkvg
 vfMSmkX9nca4YPLF6RzeZGd+mLFwcIDQ5fnihS4gUKiyw8OYZ3PZaR2j9OLVWBjDg2YF
 q0CS+PSDjGeSc/VNuh26RORvjEU1ysUYLdzH73NGM3D4NG4ig+Zt45ZOp1eDrbKJ7Aa4
 7j2fr0GGH6Xna8ERpIJ/s6TexFx+x5J1z8JDxje5jaMc2HlmZiGVb/N0Oa2NC8Iiv1f3
 YcTw==
X-Gm-Message-State: AFqh2kqbJU//kzELN6CzfE5Nywmfuc31rGZQISS+m7kcdASSakaVfQin
 1ISx/AH/E41xarpHDyp+kVRRtw==
X-Google-Smtp-Source: AMrXdXsvU/ZwNX4itatc02092RMPqShT3EdhbakJAAkdRuwYzzFKWTW7c7/5rgO8QBFQNdhstw5LwA==
X-Received: by 2002:a05:6a20:47de:b0:b3:66b7:24ff with SMTP id
 ey30-20020a056a2047de00b000b366b724ffmr438100pzb.1.1673459708056; 
 Wed, 11 Jan 2023 09:55:08 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 i131-20020a628789000000b00573eb4a775esm10591458pfe.17.2023.01.11.09.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:55:07 -0800 (PST)
Date: Wed, 11 Jan 2023 17:55:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 03/27] drm/i915/gvt: Incorporate KVM memslot info into
 check for 2MiB GTT entry
Message-ID: <Y773+EB35bAchVTC@google.com>
References: <20221223005739.1295925-1-seanjc@google.com>
 <20221223005739.1295925-4-seanjc@google.com>
 <Y6vXTcxDNovrmeVB@yzhao56-desk.sh.intel.com>
 <Y7SaklDQD0EoIs8l@google.com>
 <Y7Y+759IN2DH5h3h@yzhao56-desk.sh.intel.com>
 <Y7cLkLUMCy+XLRwm@google.com>
 <Y7e3fT8/V2NoXAUP@yzhao56-desk.sh.intel.com>
 <Y7ioYegkgKIH8uJL@google.com>
 <Y7vlOCKkJ+QyO3EM@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7vlOCKkJ+QyO3EM@yzhao56-desk.sh.intel.com>
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
Cc: kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023, Yan Zhao wrote:
> On Fri, Jan 06, 2023 at 11:01:53PM +0000, Sean Christopherson wrote:
> > On Fri, Jan 06, 2023, Yan Zhao wrote:
> > > On Thu, Jan 05, 2023 at 05:40:32PM +0000, Sean Christopherson wrote:
> > > > On Thu, Jan 05, 2023, Yan Zhao wrote:
> > > > I'm totally fine if KVMGT's ABI is that VFIO is the source of truth for mappings
> > > > and permissions, and that the only requirement for KVM memslots is that GTT page
> > > > tables need to be visible in KVM's memslots.  But if that's the ABI, then
> > > > intel_gvt_is_valid_gfn() should be probing VFIO, not KVM (commit cc753fbe1ac4
> > > > ("drm/i915/gvt: validate gfn before set shadow page entry").
> > > > 
> > > > In other words, pick either VFIO or KVM.  Checking that X is valid according to
> > > > KVM and then mapping X through VFIO is confusing and makes assumptions about how
> > > > userspace configures KVM and VFIO.  It works because QEMU always configures KVM
> > > > and VFIO as expected, but IMO it's unnecessarily fragile and again confusing for
> > > > unaware readers because the code is technically flawed.
> > > >
> > > Agreed. 
> > > Then after some further thought, I think maybe we can just remove
> > > intel_gvt_is_valid_gfn() in KVMGT, because
> > > 
> > > (1) both intel_gvt_is_valid_gfn() in emulate_ggtt_mmio_write() and
> > > ppgtt_populate_spt() are not for page track purpose, but to validate bogus
> > > GFN.
> > > (2) gvt_pin_guest_page() with gfn and size can do the validity checking,
> > > which is called in intel_gvt_dma_map_guest_page(). So, we can move the
> > > mapping of scratch page to the error path after intel_gvt_dma_map_guest_page().
> > 
> > IIUC, that will re-introduce the problem commit cc753fbe1ac4 ("drm/i915/gvt: validate
> > gfn before set shadow page entry") solved by poking into KVM.  Lack of pre-validation
> > means that bogus GFNs will trigger error messages, e.g.
> > 
> > 			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
> > 				     &cur_iova, ret);
> > 
> > and
> > 
> > 			gvt_vgpu_err("fail to populate guest ggtt entry\n");
> 
> Thanks for pointing it out.
> I checked this commit message and found below original intentions to introduce
> pre-validation:

...

> (I actually found that the original code will print "invalid entry type"
> warning which indicates it's broken for a while due to lack of test in
> this invalid gfn path)
> 
> 
> > One thought would be to turn those printks into tracepoints to eliminate unwanted
> > noise, and to prevent the guest from spamming the host kernel log by programming
> > garbage into the GTT (gvt_vgpu_err() isn't ratelimited).
> As those printks would not happen in normal conditions and printks may have
> some advantages to discover the attack or bug, could we just convert
> gvt_vgpu_err() to be ratelimited ?

That's ultimately a decision that needs to be made by the GVT maintainers, as the
answer depends on the use case.  E.g. if most users of KVMGT run a single VM and
the guest user is also the host admin, then pr_err_ratelimited() is likely an
acceptable/preferable choice as there's a decent chance a human will see the errors
in the host kernel logs and be able to take action.

But if there's unlikely to be a human monitoring the host logs, and/or the guest
user is unrelated to the host admin, then a ratelimited printk() is less useful.
E.g. if there's no one monitoring the logs, then losing messages due to
ratelimiting provides a worse debug experience overall than having to manually
enable tracepoints.   And if there may be many tens of VMs (seems unlikely?), then
ratelimited printk() is even less useful because errors for a specific VM may be
lost, i.e. the printk() can't be relied upon in any way to detect issues.

FWIW, in KVM proper, use of printk() to capture guest "errors" is strongly discourage
for exactly these reasons.
