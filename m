Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5565F2FC
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Jan 2023 18:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9CA10E7E5;
	Thu,  5 Jan 2023 17:40:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED610E7E3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Jan 2023 17:40:40 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id jl4so33776058plb.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 Jan 2023 09:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0kbXgKOJsS8Z+jbEn56fulyxmGj5FZh1oxId45OhR8M=;
 b=N8XIhK045MkkRIiP6O5EdZ7OigBujdKSVRsliZrO2igyKTDNqw+6zG4NuTIjXnrm9n
 /aENa52CaJYwGt45hRQMIHj3cF7y6pgc4/fZAC8RLOcwl610aBTkiQlsDwrap/yJtFMz
 YvcNKNGhnbLHKd9jpzfUewGfN8u470pWga6OUDWMj264VwXQdqtfv3m8B9G+NXr1mMh+
 lIapdYshhh4t4u4bZMAMiCsKc16p+Xqn5rduSXP6ThQc0n86DYpFgfc9oARWSesGmQKL
 Igg1CRErPZLx16gHnRbE9DCGaFKzrrtmEw4/8vHok1Yn7Ox+Z1urn7Q8xJMA1ODmTrRH
 4A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kbXgKOJsS8Z+jbEn56fulyxmGj5FZh1oxId45OhR8M=;
 b=36lE2KpjeGTJ+530dnK0r5b3MVp+DTQ32NSEhkzxwUl2e4n1WMqQ9gP46/5yescPTB
 lhNM2JnagoYqtf8JAW+SbOc/tTcsUsqk/kodNsuliyhMF8v1EgSBlVfPdPCiKPc9fjwX
 YQlPhf2sK+DphnhKDmMoELa/yNNQcsubOlLv9RB4Q/l9fLXTxxqRCTBzNkjMNZ5WIhKd
 42aW/BLj9EACtouyTmT8BDFY75vrZEYdgxmmNiqjnpsuMhXrjYdkAtCLWym4umuV1Bsj
 3KLVkmq7f403G6JsZqtSU+Rtx9DeohXUTD+dQoFrRDUT10dQfVYmcsz+nMor3FNKmBg9
 t5Rw==
X-Gm-Message-State: AFqh2krOinMEVqaFweoXy+qD0eSq4YuK14ixCMZENne3hJmshA7MbMbT
 HfPvqjPq8V4Xiiage1NZAUobSg==
X-Google-Smtp-Source: AMrXdXvePNSVad+Quj8sWC2rRAHirPmdt1mq9PKarW0GCZMUR3HO7TrM/aj7vHPEwJOF/+hzfbe9Qg==
X-Received: by 2002:a05:6a20:9e49:b0:a3:49d2:9504 with SMTP id
 mt9-20020a056a209e4900b000a349d29504mr250818pzb.3.1672940439549; 
 Thu, 05 Jan 2023 09:40:39 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 i12-20020a63584c000000b004785a63b44bsm21924802pgm.43.2023.01.05.09.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 09:40:37 -0800 (PST)
Date: Thu, 5 Jan 2023 17:40:32 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 03/27] drm/i915/gvt: Incorporate KVM memslot info into
 check for 2MiB GTT entry
Message-ID: <Y7cLkLUMCy+XLRwm@google.com>
References: <20221223005739.1295925-1-seanjc@google.com>
 <20221223005739.1295925-4-seanjc@google.com>
 <Y6vXTcxDNovrmeVB@yzhao56-desk.sh.intel.com>
 <Y7SaklDQD0EoIs8l@google.com>
 <Y7Y+759IN2DH5h3h@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7Y+759IN2DH5h3h@yzhao56-desk.sh.intel.com>
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

On Thu, Jan 05, 2023, Yan Zhao wrote:
> On Tue, Jan 03, 2023 at 09:13:54PM +0000, Sean Christopherson wrote:
> > On Wed, Dec 28, 2022, Yan Zhao wrote:
> > > On Fri, Dec 23, 2022 at 12:57:15AM +0000, Sean Christopherson wrote:
> > > > Honor KVM's max allowed page size when determining whether or not a 2MiB
> > > > GTT shadow page can be created for the guest.  Querying KVM's max allowed
> > > > size is somewhat odd as there's no strict requirement that KVM's memslots
> > > > and VFIO's mappings are configured with the same gfn=>hva mapping, but
> > > Without vIOMMU, VFIO's mapping is configured with the same as KVM's
> > > memslots, i.e. with the same gfn==>HVA mapping
> > 
> > But that's controlled by userspace, correct?
> 
> Yes, controlled by QEMU.

...

> > Strictly speaking, no.  E.g. if a 2MiB region is covered with multiple memslots
> > and the memslots have different properties.
> > 
> > > If for some reason, KVM maps a 2MiB range in 4K sizes, KVMGT can still map
> > > it in IOMMU size in 2MiB size as long as the PFNs are continous and the
> > > whole range is all exposed to guest.
> > 
> > I agree that practically speaking this will hold true, but if KVMGT wants to honor
> > KVM's memslots then checking that KVM allows a hugepage is correct.  Hrm, but on
> > the flip side, KVMGT ignores read-only memslot flags, so KVMGT is already ignoring
> > pieces of KVM's memslots.
> KVMGT calls dma_map_page() with DMA_BIDIRECTIONAL after checking gvt_pin_guest_page().
> Though for a read-only memslot, DMA_TO_DEVICE should be used instead
> (see dma_info_to_prot()),
> as gvt_pin_guest_page() checks (IOMMU_READ | IOMMU_WRITE) permission for each page,
> it actually ensures that the pinned GFN is not in a read-only memslot.
> So, it should be fine.
> 
> > 
> > I have no objection to KVMGT defining its ABI such that KVMGT is allowed to create
> > 2MiB so long as (a) the GFN is contiguous according to VFIO, and (b) that the entire
> > 2MiB range is exposed to the guest.
> > 
> sorry. I may not put it clearly enough.
> for a normal device pass-through via VFIO-PCI, VFIO maps IOMMU mappings in this way:
> 
> (a) fault in PFNs in a GFN range within the same memslot (VFIO saves dma_list, which is
> the same as memslot list when vIOMMU is not on or not in shadow mode).
> (b) map continuous PFNs into iommu driver (honour ro attribute and can > 2MiB as long as
> PFNs are continuous).
> (c) IOMMU driver decides to map in 2MiB or in 4KiB according to its setting.
> 
> For KVMGT, gvt_dma_map_page() first calls gvt_pin_guest_page() which
> (a) calls vfio_pin_pages() to check each GFN is within allowed dma_list with
> (IOMMU_READ | IOMMU_WRITE) permission and fault-in page. 
> (b) checks PFNs are continuous in 2MiB,
> 
> Though checking kvm_page_track_max_mapping_level() is also fine, it makes DMA
> mapping size unnecessarily smaller.

Yeah, I got all that.  What I'm trying to say, and why I asked about whether or
not userspace controls the mappings, is that AFAIK there is nothing in the kernel
that coordinates mappings between VFIO and KVM.  So, very technically, userspace
could map a 2MiB range contiguous in VFIO but not in KVM, or RW in VFIO but RO in KVM.

I can't imagine there's a real use case for doing so, and arguably there's no
requirement that KVMGT honor KVM's memslot.  But because KVMGT taps into KVM's
page-tracking, KVMGT _does_ honor KVM's memslots to some extent because KVMGT
needs to know whether or not a given GFN can be write-protected.

I'm totally fine if KVMGT's ABI is that VFIO is the source of truth for mappings
and permissions, and that the only requirement for KVM memslots is that GTT page
tables need to be visible in KVM's memslots.  But if that's the ABI, then
intel_gvt_is_valid_gfn() should be probing VFIO, not KVM (commit cc753fbe1ac4
("drm/i915/gvt: validate gfn before set shadow page entry").

In other words, pick either VFIO or KVM.  Checking that X is valid according to
KVM and then mapping X through VFIO is confusing and makes assumptions about how
userspace configures KVM and VFIO.  It works because QEMU always configures KVM
and VFIO as expected, but IMO it's unnecessarily fragile and again confusing for
unaware readers because the code is technically flawed.

On a related topic, ppgtt_populate_shadow_entry() should check the validity of the
gfn.  If I'm reading the code correctly, checking only in ppgtt_populate_spt() fails
to handle the case where the guest creates a bogus mapping when writing an existing
GTT PT.

Combing all my trains of thought, what about this as an end state for this series?
(completely untested at this point).  Get rid of the KVM mapping size checks,
verify the validity of the entire range being mapped, and add a FIXME to complain
about using KVM instead of VFIO to determine the validity of ranges.

static bool intel_gvt_is_valid_gfn(struct intel_vgpu *vgpu, unsigned long gfn,
				   enum intel_gvt_gtt_type type)
{
	unsigned long nr_pages;

	if (!vgpu->attached)
		return false;

	if (type == GTT_TYPE_PPGTT_PTE_64K_ENTRY)
		nr_pages = I915_GTT_PAGE_SIZE_64K >> PAGE_SHIFT;
	else if (type == GTT_TYPE_PPGTT_PTE_2M_ENTRY)
		nr_pages = I915_GTT_PAGE_SIZE_2M >> PAGE_SHIFT;
	else
		nr_pages = 1;

	/*
	 * FIXME: Probe VFIO, not KVM.  VFIO is the source of truth for KVMGT
	 * mappings and permissions, KVM's involvement is purely to handle
	 * write-tracking of GTT page tables.
	 */
	return kvm_page_track_is_contiguous_gfn_range(vgpu->vfio_device.kvm,
						      gfn, nr_pages);
}

static int try_map_2MB_gtt_entry(struct intel_vgpu *vgpu, unsigned long gfn,
				 dma_addr_t *dma_addr)
{
	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
		return 0;

	return intel_gvt_dma_map_guest_page(vgpu, gfn,
					    I915_GTT_PAGE_SIZE_2M, dma_addr);
}

static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
	struct intel_vgpu_ppgtt_spt *spt, unsigned long index,
	struct intel_gvt_gtt_entry *ge)
{
	const struct intel_gvt_gtt_pte_ops *pte_ops = vgpu->gvt->gtt.pte_ops;
	dma_addr_t dma_addr = vgpu->gvt->gtt.scratch_mfn << PAGE_SHIFT;
	struct intel_gvt_gtt_entry se = *ge;
	unsigned long gfn;
	int ret;

	if (!pte_ops->test_present(ge))
		goto set_shadow_entry;

	gfn = pte_ops->get_pfn(ge);
	if (!intel_gvt_is_valid_gfn(vgpu, gfn, ge->type))
		goto set_shadow_entry;

	...


set_shadow_entry:
	pte_ops->set_pfn(&se, dma_addr >> PAGE_SHIFT);
	ppgtt_set_shadow_entry(spt, &se, index);
	return 0;
}
