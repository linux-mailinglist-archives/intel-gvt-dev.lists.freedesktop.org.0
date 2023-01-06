Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43825660A03
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  7 Jan 2023 00:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827810E174;
	Fri,  6 Jan 2023 23:02:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0143010E174
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Jan 2023 23:01:57 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so6774429pjq.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 06 Jan 2023 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VYXtBX/du996tJvdynzJ32ntkaPrtSq1hOW6/2PswpM=;
 b=TT4zT9wcuVbyBdPgC4xbhu3DT3qqLGzRLyTxKSOdADEnvyIHIs6oYWy3D4LBeYWsD3
 kYo2EvofmVDElte4bPA8UQDZXKuJ06Cxs9KKOyIGZmn8lrpQroScoRdKoqdsUimQQnXw
 qnANLXEBnglXDzALVgXKxyBupzS+/S0avbrG22jKhKsCjXQLlYaqbaram2AYYU1B4WdH
 Kp2C+JZSPa/X2X0ByhxQkCc6wUiJJ+A/aiFlOny9Lvi11N09C7qLyoTxtlG+itAyy5C/
 Dn4JxEqAOOJc84Ya/GtyzyqYOz1qqHkVA97yAsZL9VvaR1zXMQi5Fv/8gKkVp8mxoWuK
 sN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYXtBX/du996tJvdynzJ32ntkaPrtSq1hOW6/2PswpM=;
 b=6nMGeVRT6/chyXnv25nAT4qBWoAxUB2YyEdNeSlWH3wDLOx/7A/HwjJUBbA+GeTskp
 QV4vMjPYwWNhVb5UVrDNJZJ3kyqX5lxwlfj1VpCbWHkMVHCHrpf92BBwBY5NwhP73Zys
 dbR9OdwFd9Dy+qSxc4MvT0/8zoofE2yldq/jyP7UW3cAmYRKJUfSUpAV3Ku1J24uxL2A
 Yi1PY2FDcRI/Bp6eElxweX+0HxaNZpAITN/qr6hhI4r4mmL+k8YJHqkIdsn6FS71oqMW
 kfQXvvMWZUuvGvM9vn5P+KjHoe72r9Mq7Iak+2UMCfcTW91E4lpigMG4Al3CWq2+e40A
 wxTQ==
X-Gm-Message-State: AFqh2kpQBEN26BbShVSoJFGNWSm6rCan42A5kWJb7s0osjYe8OrLEc6t
 s86yW/SebgIJ0ln1GJiiJ7Dl4g==
X-Google-Smtp-Source: AMrXdXu5U4s/yFXeuvjVG6HixVW2S0SFuyuS/IfsjeRrGpQFHCGuzy/cTld+cIpOiV3Uxsy2tNHU8w==
X-Received: by 2002:a05:6a20:9f03:b0:a4:efde:2ed8 with SMTP id
 mk3-20020a056a209f0300b000a4efde2ed8mr45164pzb.0.1673046117468; 
 Fri, 06 Jan 2023 15:01:57 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 m124-20020a632682000000b0045dc85c4a5fsm1352548pgm.44.2023.01.06.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 15:01:56 -0800 (PST)
Date: Fri, 6 Jan 2023 23:01:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 03/27] drm/i915/gvt: Incorporate KVM memslot info into
 check for 2MiB GTT entry
Message-ID: <Y7ioYegkgKIH8uJL@google.com>
References: <20221223005739.1295925-1-seanjc@google.com>
 <20221223005739.1295925-4-seanjc@google.com>
 <Y6vXTcxDNovrmeVB@yzhao56-desk.sh.intel.com>
 <Y7SaklDQD0EoIs8l@google.com>
 <Y7Y+759IN2DH5h3h@yzhao56-desk.sh.intel.com>
 <Y7cLkLUMCy+XLRwm@google.com>
 <Y7e3fT8/V2NoXAUP@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7e3fT8/V2NoXAUP@yzhao56-desk.sh.intel.com>
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

On Fri, Jan 06, 2023, Yan Zhao wrote:
> On Thu, Jan 05, 2023 at 05:40:32PM +0000, Sean Christopherson wrote:
> > On Thu, Jan 05, 2023, Yan Zhao wrote:
> > I'm totally fine if KVMGT's ABI is that VFIO is the source of truth for mappings
> > and permissions, and that the only requirement for KVM memslots is that GTT page
> > tables need to be visible in KVM's memslots.  But if that's the ABI, then
> > intel_gvt_is_valid_gfn() should be probing VFIO, not KVM (commit cc753fbe1ac4
> > ("drm/i915/gvt: validate gfn before set shadow page entry").
> > 
> > In other words, pick either VFIO or KVM.  Checking that X is valid according to
> > KVM and then mapping X through VFIO is confusing and makes assumptions about how
> > userspace configures KVM and VFIO.  It works because QEMU always configures KVM
> > and VFIO as expected, but IMO it's unnecessarily fragile and again confusing for
> > unaware readers because the code is technically flawed.
> >
> Agreed. 
> Then after some further thought, I think maybe we can just remove
> intel_gvt_is_valid_gfn() in KVMGT, because
> 
> (1) both intel_gvt_is_valid_gfn() in emulate_ggtt_mmio_write() and
> ppgtt_populate_spt() are not for page track purpose, but to validate bogus
> GFN.
> (2) gvt_pin_guest_page() with gfn and size can do the validity checking,
> which is called in intel_gvt_dma_map_guest_page(). So, we can move the
> mapping of scratch page to the error path after intel_gvt_dma_map_guest_page().

IIUC, that will re-introduce the problem commit cc753fbe1ac4 ("drm/i915/gvt: validate
gfn before set shadow page entry") solved by poking into KVM.  Lack of pre-validation
means that bogus GFNs will trigger error messages, e.g.

			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
				     &cur_iova, ret);

and

			gvt_vgpu_err("fail to populate guest ggtt entry\n");

One thought would be to turn those printks into tracepoints to eliminate unwanted
noise, and to prevent the guest from spamming the host kernel log by programming
garbage into the GTT (gvt_vgpu_err() isn't ratelimited).

> > On a related topic, ppgtt_populate_shadow_entry() should check the validity of the
> > gfn.  If I'm reading the code correctly, checking only in ppgtt_populate_spt() fails
> > to handle the case where the guest creates a bogus mapping when writing an existing
> > GTT PT.
> Don't get it here. Could you elaborate more?

AFAICT, KVMGT only pre-validates the GFN on the initial setup, not when the guest
modifies a write-tracked entry.  I believe this is a moot point if the pre-validation
is removed entirely.

> > 	gfn = pte_ops->get_pfn(ge);
> > 	if (!intel_gvt_is_valid_gfn(vgpu, gfn, ge->type))
> > 		goto set_shadow_entry;
> As KVMGT only tracks PPGTT page table pages, this check here is not for page
> track purpose, but to check bogus GFN.
> So, Just leave the bogus GFN check to intel_gvt_dma_map_guest_page() through
> VFIO is all right.
> 
> On the other hand, for the GFN validity for page track purpose, we can
> leave it to kvm_write_track_add_gfn().
> 
> Do you think it's ok?

Yep, the only hiccup is the gvt_vgpu_err() calls that are guest-triggerable, and
converting those to a tracepoint seems like the right answer.
