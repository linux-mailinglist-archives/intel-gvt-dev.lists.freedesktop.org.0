Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652729A2AA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Oct 2020 03:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCDC6EAB9;
	Tue, 27 Oct 2020 02:23:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4B86EAB9;
 Tue, 27 Oct 2020 02:23:08 +0000 (UTC)
IronPort-SDR: gKfq0Std6xNzKPwqABTNSIXMY774VNOieD0yrhazUG+oCcOtN9p5BuQkD0GDavGRO0xUX4ORIz
 I0jcwIR8ZBPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="154984438"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; 
 d="asc'?scan'208";a="154984438"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 19:23:07 -0700
IronPort-SDR: T+vUXGp46ZAeQ2vP4/29MfWoi+c68Z8kyXi9AK6Azj2aFPbCWFSx6mdpHnLZZS809gyLR/Q86e
 qBeIXWre+dVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; 
 d="asc'?scan'208";a="361214559"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 26 Oct 2020 19:23:05 -0700
Date: Tue, 27 Oct 2020 10:02:02 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH v6 1/2] drm/i915/gvt: Save/restore HW status to support
 GVT suspend/resume
Message-ID: <20201027020202.GY27141@zhen-hp.sh.intel.com>
References: <20201023081719.772816-1-colin.xu@intel.com>
 <20201026091954.GW27141@zhen-hp.sh.intel.com>
 <62d47b5a-142b-32dc-b144-15bc56d70933@intel.com>
 <20201027014906.GX27141@zhen-hp.sh.intel.com>
 <764fc9e3-707a-348b-1f62-202e8b0ae1d0@intel.com>
MIME-Version: 1.0
In-Reply-To: <764fc9e3-707a-348b-1f62-202e8b0ae1d0@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0228112354=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0228112354==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mFM6r0jQWo48NPCK"
Content-Disposition: inline


--mFM6r0jQWo48NPCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.27 10:16:08 +0800, Colin Xu wrote:
>=20
> On 2020-10-27 09:49, Zhenyu Wang wrote:
> > On 2020.10.27 08:42:40 +0800, Colin Xu wrote:
> > > On 2020-10-26 17:19, Zhenyu Wang wrote:
> > > > On 2020.10.23 16:17:19 +0800, Colin Xu wrote:
> > > > > This patch save/restore necessary GVT info during i915 suspend/re=
sume so
> > > > > that GVT enabled QEMU VM can continue running.
> > > > >=20
> > > > > Only GGTT and fence regs are saved/restored now. GVT will save GG=
TT
> > > > > entries on each host_entry update, restore the saved dirty entries
> > > > > and re-init fence regs in resume routine.
> > > > >=20
> > > > > V2:
> > > > > - Change kzalloc/kfree to vzalloc/vfree since the space allocated
> > > > > from kmalloc may not enough for all saved GGTT entries.
> > > > > - Keep gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c and
> > > > > move the actual implementation to gvt.h/gvt.c. (zhenyu)
> > > > > - Check gvt config on and active with intel_gvt_active(). (zhenyu)
> > > > >=20
> > > > > V3: (zhenyu)
> > > > > - Incorrect copy length. Should be num entries * entry size.
> > > > > - Use memcpy_toio()/memcpy_fromio() instead of memcpy for iomem.
> > > > > - Add F_PM_SAVE flags to indicate which MMIOs to save/restore for=
 PM.
> > > > >=20
> > > > > V4:
> > > > > Rebase.
> > > > >=20
> > > > > V5:
> > > > > Fail intel_gvt_save_ggtt as -ENOMEM if fail to alloc memory to sa=
ve
> > > > > ggtt. Free allocated ggtt_entries on failure.
> > > > >=20
> > > > > V6:
> > > > > Save host entry to per-vGPU gtt.ggtt_mm on each host_entry update.
> > > > >=20
> > > > > Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> > > > > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gvt/gtt.c      | 75 +++++++++++++++++++++=
++++++++
> > > > >    drivers/gpu/drm/i915/gvt/gtt.h      |  9 ++++
> > > > >    drivers/gpu/drm/i915/gvt/gvt.c      |  8 +++
> > > > >    drivers/gpu/drm/i915/gvt/gvt.h      |  3 ++
> > > > >    drivers/gpu/drm/i915/gvt/handlers.c | 39 +++++++++++++--
> > > > >    drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
> > > > >    drivers/gpu/drm/i915/intel_gvt.c    | 15 ++++++
> > > > >    drivers/gpu/drm/i915/intel_gvt.h    |  5 ++
> > > > >    8 files changed, 154 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i91=
5/gvt/gtt.c
> > > > > index a3a4305eda01..33385d640cb9 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > > > @@ -636,9 +636,20 @@ static void ggtt_set_host_entry(struct intel=
_vgpu_mm *mm,
> > > > >    		struct intel_gvt_gtt_entry *entry, unsigned long index)
> > > > >    {
> > > > >    	struct intel_gvt_gtt_pte_ops *pte_ops =3D mm->vgpu->gvt->gtt.=
pte_ops;
> > > > > +	unsigned long offset =3D index;
> > > > >    	GEM_BUG_ON(mm->type !=3D INTEL_GVT_MM_GGTT);
> > > > > +	if (vgpu_gmadr_is_aperture(mm->vgpu, index << I915_GTT_PAGE_SHI=
FT)) {
> > > > > +		offset -=3D (vgpu_aperture_gmadr_base(mm->vgpu) >> PAGE_SHIFT);
> > > > > +		mm->ggtt_mm.host_aperture[offset].val64 =3D entry->val64;
> > > > > +		mm->ggtt_mm.host_aperture[offset].dirty =3D true;
> > > > > +	} else if (vgpu_gmadr_is_hidden(mm->vgpu, index << I915_GTT_PAG=
E_SHIFT)) {
> > > > > +		offset -=3D (vgpu_hidden_gmadr_base(mm->vgpu) >> PAGE_SHIFT);
> > > > > +		mm->ggtt_mm.host_hidden[offset].val64 =3D entry->val64;
> > > > > +		mm->ggtt_mm.host_hidden[offset].dirty =3D true;
> > > > > +	}
> > > > Looks 'dirty' flag is not needed at all, as what you need is to res=
tore all present
> > > > entries, so can just check present bit of val64 for that.
> > > Strictly it's different. Host could update a page which isn't present=
 but
> > > other PTE fields are still valid, this is "present". For dirty it's p=
urpose
> > > is to record whether or not host has update this entry, regardless th=
e page
> > > presence. If only check the present bit, there will be a case that pr=
evious
> > > PTE points to region that shouldn't be walked by the new PDE, but new
> > > PDE/PTE update only updates PDE w/ present, but PTE w/o present. That=
 could
> > > leak information by new PDE + old PTE. Hypervisor should follow guest
> > > behavior to update all PDE/PTEs, and guest should make sure partial u=
pdate
> > > won't leak information. If hypervisor doesn't follow guest page updat=
e,
> > > information could be leaked.
> > But this is only for GGTT which is just single level table right?
> >=20
> > > And actually, when vGPU created, all GGTT pages are updates so in pra=
ctice,
> > > all entries are dirty. So from real practice, it's true that dirty ch=
eck can
> > > be removed.
> > You mean guest would update all entries normally? That's ok which we ju=
st follow
> > guest's behavior. And we've also seen guest partial update of GGTT entr=
y which
> > could be point for suspend/resume and we reset present bit at that time=
 so can be
> > skipped in this case.
> Yes guest would update all. So should I check present again, or just
> save/restore all?
> >

I mean we could depend on present bit which not only represents guest state=
 and
also could handle for partial update case as well.=20

> > > > > +
> > > > >    	pte_ops->set_entry(NULL, entry, index, false, 0, mm->vgpu);
> > > > >    }
> > > > > @@ -1928,6 +1939,7 @@ static struct intel_vgpu_mm *intel_vgpu_cre=
ate_ggtt_mm(struct intel_vgpu *vgpu)
> > > > >    {
> > > > >    	struct intel_vgpu_mm *mm;
> > > > >    	unsigned long nr_entries;
> > > > > +	u64 size;
> > > > >    	mm =3D vgpu_alloc_mm(vgpu);
> > > > >    	if (!mm)
> > > > > @@ -1944,6 +1956,25 @@ static struct intel_vgpu_mm *intel_vgpu_cr=
eate_ggtt_mm(struct intel_vgpu *vgpu)
> > > > >    		return ERR_PTR(-ENOMEM);
> > > > >    	}
> > > > > +	size =3D (vgpu_aperture_sz(vgpu) >> PAGE_SHIFT) *
> > > > > +		sizeof(struct intel_vgpu_host_ggtt);
> > > > > +	mm->ggtt_mm.host_aperture =3D vzalloc(size);
> > > > I think normally just write required size calculation in alloc para=
meter
> > > > instead of in extra variable.
> > > Only for trim line length within 80 otherwise align to parentheses do=
esn't
> > > look clean. Since kernel has 80 columns as the 'strong preferred limi=
t', if
> > > it's OK I'll put it into same line then no extra variable is required.
> > No, that strong word is deprecated. ;)
> It makes the things easier.
> >=20
> > > > > +	if (!mm->ggtt_mm.host_aperture) {
> > > > > +		vfree(mm->ggtt_mm.virtual_ggtt);
> > > > > +		vgpu_free_mm(mm);
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +	}
> > > > > +
> > > > > +	size =3D (vgpu_hidden_sz(vgpu) >> PAGE_SHIFT) *
> > > > > +		sizeof(struct intel_vgpu_host_ggtt);
> > > > > +	mm->ggtt_mm.host_hidden =3D vzalloc(size);
> > > > > +	if (!mm->ggtt_mm.host_hidden) {
> > > > > +		vfree(mm->ggtt_mm.host_aperture);
> > > > > +		vfree(mm->ggtt_mm.virtual_ggtt);
> > > > > +		vgpu_free_mm(mm);
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +	}
> > > > > +
> > > > >    	return mm;
> > > > >    }
> > > > > @@ -1971,6 +2002,8 @@ void _intel_vgpu_mm_release(struct kref *mm=
_ref)
> > > > >    		invalidate_ppgtt_mm(mm);
> > > > >    	} else {
> > > > >    		vfree(mm->ggtt_mm.virtual_ggtt);
> > > > > +		vfree(mm->ggtt_mm.host_aperture);
> > > > > +		vfree(mm->ggtt_mm.host_hidden);
> > > > >    	}
> > > > >    	vgpu_free_mm(mm);
> > > > > @@ -2852,3 +2885,45 @@ void intel_vgpu_reset_gtt(struct intel_vgp=
u *vgpu)
> > > > >    	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
> > > > >    	intel_vgpu_reset_ggtt(vgpu, true);
> > > > >    }
> > > > > +
> > > > > +/**
> > > > > + * intel_gvt_restore_ggtt - restore all vGPU's ggtt entries
> > > > > + * @gvt: intel gvt device
> > > > > + *
> > > > > + * This function is called at driver resume stage to restore
> > > > > + * GGTT entries of every vGPU.
> > > > > + *
> > > > > + */
> > > > > +void intel_gvt_restore_ggtt(struct intel_gvt *gvt)
> > > > > +{
> > > > > +	struct intel_vgpu *vgpu;
> > > > > +	struct intel_vgpu_mm *mm;
> > > > > +	struct intel_vgpu_host_ggtt *host_ggtt;
> > > > > +	int id;
> > > > > +	u32 idx, num_low, num_hi, offset;
> > > > > +
> > > > > +	/* Restore dirty host ggtt for all vGPUs */
> > > > > +	idr_for_each_entry(&(gvt)->vgpu_idr, vgpu, id) {
> > > > > +		mm =3D vgpu->gtt.ggtt_mm;
> > > > > +
> > > > > +		num_low =3D vgpu_aperture_sz(vgpu) >> PAGE_SHIFT;
> > > > > +		offset =3D vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
> > > > > +		for (idx =3D 0; idx < num_low; idx++) {
> > > > > +			host_ggtt =3D &mm->ggtt_mm.host_aperture[idx];
> > > > > +			if (host_ggtt->dirty) {
> > > > > +				write_pte64(vgpu->gvt->gt->ggtt,
> > > > > +					    offset + idx, host_ggtt->val64);
> > > > > +			}
> > > > > +		}
> > > > > +
> > > > > +		num_hi =3D vgpu_hidden_sz(vgpu) >> PAGE_SHIFT;
> > > > > +		offset =3D vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
> > > > > +		for (idx =3D 0; idx < num_hi; idx++) {
> > > > > +			host_ggtt =3D &mm->ggtt_mm.host_hidden[idx];
> > > > > +			if (host_ggtt->dirty) {
> > > > > +				write_pte64(vgpu->gvt->gt->ggtt,
> > > > > +					    offset + idx, host_ggtt->val64);
> > > > > +			}
> > > > > +		}
> > > > > +	}
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i91=
5/gvt/gtt.h
> > > > > index 52d0d88abd86..7ec333a2ead5 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/gtt.h
> > > > > +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> > > > > @@ -139,6 +139,11 @@ struct intel_gvt_partial_pte {
> > > > >    	struct list_head list;
> > > > >    };
> > > > > +struct intel_vgpu_host_ggtt {
> > > > > +	u64 val64;
> > > > > +	bool dirty;
> > > > > +};
> > > > > +
> > > > >    struct intel_vgpu_mm {
> > > > >    	enum intel_gvt_mm_type type;
> > > > >    	struct intel_vgpu *vgpu;
> > > > > @@ -164,6 +169,9 @@ struct intel_vgpu_mm {
> > > > >    		} ppgtt_mm;
> > > > >    		struct {
> > > > >    			void *virtual_ggtt;
> > > > > +			/* Save/restore for PM */
> > > > > +			struct intel_vgpu_host_ggtt *host_aperture;
> > > > > +			struct intel_vgpu_host_ggtt *host_hidden;
> > > > >    			struct list_head partial_pte_list;
> > > > >    		} ggtt_mm;
> > > > >    	};
> > > > > @@ -280,5 +288,6 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct=
 intel_vgpu *vgpu,
> > > > >    	unsigned int off, void *p_data, unsigned int bytes);
> > > > >    void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
> > > > > +void intel_gvt_restore_ggtt(struct intel_gvt *gvt);
> > > > >    #endif /* _GVT_GTT_H_ */
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i91=
5/gvt/gvt.c
> > > > > index c7c561237883..d0e9c43b031b 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/gvt.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> > > > > @@ -405,6 +405,14 @@ int intel_gvt_init_device(struct drm_i915_pr=
ivate *i915)
> > > > >    	return ret;
> > > > >    }
> > > > > +int
> > > > > +intel_gvt_pm_resume(struct intel_gvt *gvt)
> > > > > +{
> > > > > +	intel_gvt_restore_regs(gvt);
> > > > > +	intel_gvt_restore_ggtt(gvt);
> > > > > +	return 0;
> > > > Please split restore_regs part which seems to be separate.
> > > Split intel_gvt_restore_regs() further to fence regs and normal track=
ed
> > > mmios with F_PM_SAVE?
> > yep, those for regs restore handling.
> >=20
> > Thanks
> >=20
> > > > > +}
> > > > > +
> > > > >    int
> > > > >    intel_gvt_register_hypervisor(struct intel_gvt_mpt *m)
> > > > >    {
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i91=
5/gvt/gvt.h
> > > > > index a81cf0f01e78..b3d6355dd797 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > > > > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > > > > @@ -255,6 +255,8 @@ struct intel_gvt_mmio {
> > > > >    #define F_CMD_ACCESS	(1 << 3)
> > > > >    /* This reg has been accessed by a VM */
> > > > >    #define F_ACCESSED	(1 << 4)
> > > > > +/* This reg requires save & restore during host PM suspend/resum=
e */
> > > > > +#define F_PM_SAVE	(1 << 5)
> > > > >    /* This reg could be accessed by unaligned address */
> > > > >    #define F_UNALIGN	(1 << 6)
> > > > >    /* This reg is in GVT's mmio save-restor list and in hardware
> > > > > @@ -685,6 +687,7 @@ void intel_gvt_debugfs_remove_vgpu(struct int=
el_vgpu *vgpu);
> > > > >    void intel_gvt_debugfs_init(struct intel_gvt *gvt);
> > > > >    void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> > > > > +int intel_gvt_pm_resume(struct intel_gvt *gvt);
> > > > >    #include "trace.h"
> > > > >    #include "mpt.h"
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/dr=
m/i915/gvt/handlers.c
> > > > > index 89353b97589a..1f2432d7df34 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > @@ -3120,9 +3120,10 @@ static int init_skl_mmio_info(struct intel=
_gvt *gvt)
> > > > >    	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NU=
LL);
> > > > >    	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NU=
LL);
> > > > >    	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> > > > > -	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS,
> > > > > -		NULL, gen9_trtte_write);
> > > > > -	MMIO_DH(_MMIO(0x4dfc), D_SKL_PLUS, NULL, gen9_trtt_chicken_writ=
e);
> > > > > +	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE,
> > > > > +		 NULL, gen9_trtte_write);
> > > > > +	MMIO_DFH(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE,
> > > > > +		 NULL, gen9_trtt_chicken_write);
> > > > >    	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
> > > > > @@ -3661,3 +3662,35 @@ int intel_vgpu_mmio_reg_rw(struct intel_vg=
pu *vgpu, unsigned int offset,
> > > > >    		intel_vgpu_default_mmio_read(vgpu, offset, pdata, bytes) :
> > > > >    		intel_vgpu_default_mmio_write(vgpu, offset, pdata, bytes);
> > > > >    }
> > > > > +
> > > > > +static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
> > > > > +					  u32 offset, void *data)
> > > > > +{
> > > > > +	struct intel_vgpu *vgpu =3D data;
> > > > > +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> > > > > +
> > > > > +	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
> > > > > +		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +void intel_gvt_restore_regs(struct intel_gvt *gvt)
> > > > > +{
> > > > > +	struct intel_vgpu *vgpu;
> > > > > +	int i, id;
> > > > > +	u64 val;
> > > > > +
> > > > > +	idr_for_each_entry(&(gvt)->vgpu_idr, vgpu, id) {
> > > > > +		mmio_hw_access_pre(gvt->gt);
> > > > > +		for (i =3D 0; i < vgpu_fence_sz(vgpu); i++) {
> > > > > +			val =3D vgpu_vreg64(vgpu, fence_num_to_offset(i));
> > > > > +			intel_vgpu_write_fence(vgpu, i, val);
> > > > > +		}
> > > > > +
> > > > > +		intel_gvt_for_each_tracked_mmio(gvt,
> > > > > +						mmio_pm_restore_handler, vgpu);
> > > > > +
> > > > > +		mmio_hw_access_post(gvt->gt);
> > > > > +	}
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i9=
15/gvt/mmio.h
> > > > > index cc4812648bf4..999d9dda0614 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/mmio.h
> > > > > +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> > > > > @@ -104,4 +104,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu =
*vgpu, unsigned int offset,
> > > > >    int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsign=
ed int offset,
> > > > >    				  void *p_data, unsigned int bytes);
> > > > > +
> > > > > +void intel_gvt_restore_regs(struct intel_gvt *gvt);
> > > > > +
> > > > >    #endif
> > > > > diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i=
915/intel_gvt.c
> > > > > index 99fe8aef1c67..4e70c1a9ef2e 100644
> > > > > --- a/drivers/gpu/drm/i915/intel_gvt.c
> > > > > +++ b/drivers/gpu/drm/i915/intel_gvt.c
> > > > > @@ -24,6 +24,7 @@
> > > > >    #include "i915_drv.h"
> > > > >    #include "i915_vgpu.h"
> > > > >    #include "intel_gvt.h"
> > > > > +#include "gvt/gvt.h"
> > > > >    /**
> > > > >     * DOC: Intel GVT-g host support
> > > > > @@ -147,3 +148,17 @@ void intel_gvt_driver_remove(struct drm_i915=
_private *dev_priv)
> > > > >    	intel_gvt_clean_device(dev_priv);
> > > > >    }
> > > > > +
> > > > > +/**
> > > > > + * intel_gvt_resume - GVT resume routine wapper
> > > > > + *
> > > > > + * @dev_priv: drm i915 private *
> > > > > + *
> > > > > + * This function is called at the i915 driver resume stage to re=
store required
> > > > > + * HW status for GVT so that vGPU can continue running after res=
umed.
> > > > > + */
> > > > > +void intel_gvt_resume(struct drm_i915_private *dev_priv)
> > > > > +{
> > > > > +	if (intel_gvt_active(dev_priv))
> > > > > +		intel_gvt_pm_resume(dev_priv->gvt);
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i=
915/intel_gvt.h
> > > > > index 502fad8a8652..d7d3fb6186fd 100644
> > > > > --- a/drivers/gpu/drm/i915/intel_gvt.h
> > > > > +++ b/drivers/gpu/drm/i915/intel_gvt.h
> > > > > @@ -33,6 +33,7 @@ int intel_gvt_init_device(struct drm_i915_priva=
te *dev_priv);
> > > > >    void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
> > > > >    int intel_gvt_init_host(void);
> > > > >    void intel_gvt_sanitize_options(struct drm_i915_private *dev_p=
riv);
> > > > > +void intel_gvt_resume(struct drm_i915_private *dev_priv);
> > > > >    #else
> > > > >    static inline int intel_gvt_init(struct drm_i915_private *dev_=
priv)
> > > > >    {
> > > > > @@ -46,6 +47,10 @@ static inline void intel_gvt_driver_remove(str=
uct drm_i915_private *dev_priv)
> > > > >    static inline void intel_gvt_sanitize_options(struct drm_i915_=
private *dev_priv)
> > > > >    {
> > > > >    }
> > > > > +
> > > > > +static inline void intel_gvt_resume(struct drm_i915_private *dev=
_priv)
> > > > > +{
> > > > > +}
> > > > >    #endif
> > > > >    #endif /* _INTEL_GVT_H_ */
> > > > > --=20
> > > > > 2.29.0
> > > > >=20
> > > > > _______________________________________________
> > > > > intel-gvt-dev mailing list
> > > > > intel-gvt-dev@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> > > --=20
> > > Best Regards,
> > > Colin Xu
> > >=20
> --=20
> Best Regards,
> Colin Xu
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--mFM6r0jQWo48NPCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX5d/mgAKCRCxBBozTXgY
J9hFAJwPDy3OKU3xyzc/W0IPYuWSugSpzACfd2Mq14ygU0nzQfZtdLlRUrgiFU8=
=wujJ
-----END PGP SIGNATURE-----

--mFM6r0jQWo48NPCK--

--===============0228112354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0228112354==--
