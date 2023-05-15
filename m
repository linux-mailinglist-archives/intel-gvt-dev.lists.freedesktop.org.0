Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B0703AE3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 May 2023 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AAA10E11E;
	Mon, 15 May 2023 17:57:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0C610E0FD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 May 2023 17:57:10 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-b99ef860a40so23904454276.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 May 2023 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684173429; x=1686765429;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=99srR1wR+oKvE5/WokGr4LZs8iI5brQIGfN7GCM4UrE=;
 b=qgBmAUsdMhWoFgdfIMBysrOMi/gESv0r34Xoj0igegtNAqMmPuZYSN8teIqqNTO4qr
 +o9xeOyk9osBGJxQbQuznSPE37lto98WL25ntsbJrltXSslcw1N9UwCjtAleA783eS5O
 9YwANM1uEr3ANtlR1gIiXFGuiQX6HZHez7Az1JmZfWcgZ8XXRvwsKlQVSp1qYogeiohP
 HZiUVEoNqJwtMnWDAcgFy21hoDfY46Zz54Xrc7sGdVcVXFt7SRAKBWqGimi1IwSKlxe6
 LTURlyPrfkfy2KvuKglvcB3GJiMGve4uIMdIImYsP6Uo1qtixcy8iwFrsPFnos8ejlvp
 S2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684173429; x=1686765429;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=99srR1wR+oKvE5/WokGr4LZs8iI5brQIGfN7GCM4UrE=;
 b=GU/+/WFy8E85z6xXK+ZVISRkvPX/9lKP9MhGjaJePtJ8UziOIHg15EUIMa1a1p7y3D
 LXeLs3VqPU7eXpPVr9N0kLN+jocilTpoqaR+O8992LDKEK4eB34GGpdBwwWRX7Ns5/QC
 PbdVWUkXen9v51JUoKKTBZGpM12zytd9RLarmVK85bvdVvLd1fQ/yqwz9nt/6V1utTQa
 s4NhPcoDfswHbynZZXdEDRtsrv20F5e97cKCcf1/FY4Z6fgPMOMSvaiabAZDllNMmtH/
 SDcRKm9PNiswWGAJOdeZ6eWj2zfYeFUJct3PCdJmWkWZSSD2b2pIlY54S6G/MXBE/DVs
 /E1g==
X-Gm-Message-State: AC+VfDyJZMANAGDwwMjWb0XFv43ZbPM7I1XWnAJ6DXuolj0/HEBx0S3W
 J/Q4njfoEf+DJ1EnlUBM+f7C0ooX67g=
X-Google-Smtp-Source: ACHHUZ4He0csQ4Oev4VXrHXbI7rX8wyUIkfOSTVuja6DxDI6qDgf1L+qcXE8dfIu5YKaWZQqJrs9xqp4fJ0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:5454:0:b0:ba2:1a28:c852 with SMTP id
 i81-20020a255454000000b00ba21a28c852mr14179279ybb.7.1684173429090; Mon, 15
 May 2023 10:57:09 -0700 (PDT)
Date: Mon, 15 May 2023 10:57:07 -0700
In-Reply-To: <66685365-86f9-9ddf-d63b-f87621b05b88@intel.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
 <20230513003600.818142-6-seanjc@google.com>
 <66685365-86f9-9ddf-d63b-f87621b05b88@intel.com>
Message-ID: <ZGJyc7k1Z4gXQH2U@google.com>
Subject: Re: [PATCH v3 05/28] drm/i915/gvt: Explicitly check that vGPU is
 attached before shadowing
From: Sean Christopherson <seanjc@google.com>
To: Zhi A Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: Yan Y Zhao <yan.y.zhao@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Ben Gardon <bgardon@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, May 15, 2023, Zhi A Wang wrote:
> On 5/13/2023 8:35 AM, Sean Christopherson wrote:
> > Move the check that a vGPU is attacked from is_2MB_gtt_possible() to its
> > sole caller, ppgtt_populate_shadow_entry().  All of the paths in
> > ppgtt_populate_shadow_entry() eventually check for attachment by way of
> > intel_gvt_dma_map_guest_page(), but explicitly checking can avoid
> > unnecessary work and will make it more obvious that a future cleanup of
> > is_2MB_gtt_possible() isn't introducing a bug.
> > 
> 
> It might be better move this check to shadow_ppgtt_mm() which is used
> in both shadow page table creation and pinning path so that the path
> can bail out even earlier when creating a shadow page table but a vGPU
> has not been attached to KVM yet.

Ah, yes, that'll work.  I traced through all of the paths that lead to
ppgtt_populate_shadow_entry(), and shadow_ppgtt_mm() is the only caller that isn't
already gated by INTEL_VGPU_STATUS_ATTACHED or INTEL_VGPU_STATUS_ACTIVE (ACTIVE
is set iff ATTACHED is set).

I'll move the check up to shadow_ppgtt_mm() in the next version.

Thanks!


workload_thread() <= pick_next_workload() => INTEL_VGPU_STATUS_ACTIVE
|
-> dispatch_workload()
   |
   |-> prepare_workload()
       |
       -> intel_vgpu_sync_oos_pages()
       |  |
       |  |-> ppgtt_set_guest_page_sync()
       |      |
       |      |-> sync_oos_page()
       |          |
       |          |-> ppgtt_populate_shadow_entry()
       |
       |-> intel_vgpu_flush_post_shadow()
           |
1:         |-> ppgtt_handle_guest_write_page_table()
               |
               |-> ppgtt_handle_guest_entry_add()
                   |
2:                 | -> ppgtt_populate_spt_by_guest_entry()
                   |    |
                   |    |-> ppgtt_populate_spt()
                   |        |
                   |        |-> ppgtt_populate_shadow_entry()
                   |            |
                   |            |-> ppgtt_populate_spt_by_guest_entry() [see 2]
                   |
                   |-> ppgtt_populate_shadow_entry()


kvmgt_page_track_write()  <= KVM callback => INTEL_VGPU_STATUS_ATTACHED
|
|-> intel_vgpu_page_track_handler()
    |
    |-> ppgtt_write_protection_handler()
        |
        |-> ppgtt_handle_guest_write_page_table_bytes()
            |
            |-> ppgtt_handle_guest_write_page_table() [see 1]
