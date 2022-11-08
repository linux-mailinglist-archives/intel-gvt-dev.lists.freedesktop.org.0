Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5850620997
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 07:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0841889101;
	Tue,  8 Nov 2022 06:33:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4950210E208
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 06:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667889214; x=1699425214;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=7CQXKei13/NvzYAa2ailfkQ8xM0gZqJjtIYzip4bzao=;
 b=UfMPXveRX4mOCSzIugcB8gtaRJIszxzxXcXgitGTi/0U8VIL+buNsoKk
 gaeOssiCEfvgfbFOTmr21WA/jCBTw5ATxopnf8bn3N04Kpeiu8lph7+sF
 RvwMh6Mrqidwj0kx7nLMGrGY3XoOpt6JRknfoofnHvwh5Pedmi2/puAhT
 +mgtYokVIa+Knmt7Em6WBVVLXCZrB1EIEW+D0S0tRyMD0w+EQr282MlXH
 m7Oiqz5knQdc0Ga++r+qxqBd/NN6QiqHPt63rUScFffRi+ngkJDqAhOoD
 7jVcKO+15FnFlQdaSoi6vuJkg4nRXUxtqdhPK8ZygJmkz4uLUYS/7rVKv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="372760390"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="372760390"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 22:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="587261103"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="587261103"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 22:33:31 -0800
Date: Tue, 8 Nov 2022 14:33:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux2@gmail.com>
Subject: Re: [PATCH 2/3] drm/i915/gvt: use atomic operations to change the
 vGPU status
Message-ID: <20221108063306.GH30028@zhen-hp.sh.intel.com>
References: <20221104145652.1570-1-zhi.a.wang@intel.com>
 <20221104145652.1570-2-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20221104145652.1570-2-zhi.a.wang@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.04 14:56:51 +0000, Zhi Wang wrote:
> Several vGPU status are used to decide the availability of GVT-g core log=
ics
> when creating a vGPU. Use atomic operations on chaning the vGPU status to
> avoid the racing.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c   |  1 -
>  drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
>  drivers/gpu/drm/i915/gvt/gtt.c       |  4 ++--
>  drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++----
>  drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 34 ++++++++++++----------------
>  drivers/gpu/drm/i915/gvt/scheduler.c |  3 ++-
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 12 ++++------
>  8 files changed, 37 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gv=
t/debugfs.c
> index 9f1c209d9251..bb301bc974a4 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -162,7 +162,6 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vg=
pu)
>  	snprintf(name, 16, "vgpu%d", vgpu->id);
>  	vgpu->debugfs =3D debugfs_create_dir(name, vgpu->gvt->debugfs_root);
> =20
> -	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);
>  	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
>  			    &vgpu_mmio_diff_fops);
>  	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 01e54b45c5c1..77f0522d2de9 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -134,7 +134,8 @@ static void dmabuf_gem_object_free(struct kref *kref)
>  	struct list_head *pos;
>  	struct intel_vgpu_dmabuf_obj *dmabuf_obj;
> =20
> -	if (vgpu && vgpu->active && !list_empty(&vgpu->dmabuf_obj_list_head)) {
> +	if (vgpu && test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status) &&
> +	    !list_empty(&vgpu->dmabuf_obj_list_head)) {
>  		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
>  			dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
>  			if (dmabuf_obj =3D=3D obj) {
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index ce0eb03709c3..55ab7abaf6df 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -55,7 +55,7 @@ static bool intel_gvt_is_valid_gfn(struct intel_vgpu *v=
gpu, unsigned long gfn)
>  	int idx;
>  	bool ret;
> =20
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return false;
> =20
>  	idx =3D srcu_read_lock(&kvm->srcu);
> @@ -1183,7 +1183,7 @@ static int is_2MB_gtt_possible(struct intel_vgpu *v=
gpu,
>  	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
>  		return 0;
> =20
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -EINVAL;
>  	pfn =3D gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
>  	if (is_error_noslot_pfn(pfn))
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 62823c0e13ab..2d65800d8e93 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -172,13 +172,18 @@ struct intel_vgpu_submission {
> =20
>  #define KVMGT_DEBUGFS_FILENAME		"kvmgt_nr_cache_entries"
> =20
> +enum {
> +	INTEL_VGPU_STATUS_ATTACHED =3D 0,
> +	INTEL_VGPU_STATUS_ACTIVE,
> +	INTEL_VGPU_STATUS_NR_BITS,
> +};
> +
>  struct intel_vgpu {
>  	struct vfio_device vfio_device;
>  	struct intel_gvt *gvt;
>  	struct mutex vgpu_lock;
>  	int id;
> -	bool active;
> -	bool attached;
> +	DECLARE_BITMAP(status, INTEL_VGPU_STATUS_NR_BITS);
>  	bool pv_notified;
>  	bool failsafe;
>  	unsigned int resetting_eng;
> @@ -467,7 +472,7 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
> =20
>  #define for_each_active_vgpu(gvt, vgpu, id) \
>  	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) \
> -		for_each_if(vgpu->active)
> +		for_each_if(test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status))
> =20
>  static inline void intel_vgpu_write_pci_bar(struct intel_vgpu *vgpu,
>  					    u32 offset, u32 val, bool low)
> @@ -725,7 +730,7 @@ static inline bool intel_gvt_mmio_is_cmd_write_patch(
>  static inline int intel_gvt_read_gpa(struct intel_vgpu *vgpu, unsigned l=
ong gpa,
>  		void *buf, unsigned long len)
>  {
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -ESRCH;
>  	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, false);
>  }
> @@ -743,7 +748,7 @@ static inline int intel_gvt_read_gpa(struct intel_vgp=
u *vgpu, unsigned long gpa,
>  static inline int intel_gvt_write_gpa(struct intel_vgpu *vgpu,
>  		unsigned long gpa, void *buf, unsigned long len)
>  {
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -ESRCH;
>  	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, true);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/=
gvt/interrupt.c
> index a6b2021b665f..68eca023bbc6 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -433,7 +433,7 @@ static int inject_virtual_interrupt(struct intel_vgpu=
 *vgpu)
>  	 * enabled by guest. so if msi_trigger is null, success is still
>  	 * returned and don't inject interrupt into guest.
>  	 */
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -ESRCH;
>  	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) !=3D 1)
>  		return -EFAULT;
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 897b6fdbbaed..37c581dc6a58 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -638,7 +638,7 @@ static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgp=
u)
> =20
>  	mutex_lock(&vgpu->gvt->lock);
>  	for_each_active_vgpu(vgpu->gvt, itr, id) {
> -		if (!itr->attached)
> +		if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))

This looks wrong, should check itr->status instead of vgpu's.

>  			continue;
> =20
>  		if (vgpu->vfio_device.kvm =3D=3D itr->vfio_device.kvm) {
> @@ -655,7 +655,7 @@ static int intel_vgpu_open_device(struct vfio_device =
*vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> =20
> -	if (vgpu->attached)
> +	if (test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -EEXIST;
> =20
>  	if (!vgpu->vfio_device.kvm ||
> @@ -669,8 +669,6 @@ static int intel_vgpu_open_device(struct vfio_device =
*vfio_dev)
>  	if (__kvmgt_vgpu_exist(vgpu))
>  		return -EEXIST;
> =20
> -	vgpu->attached =3D true;
> -
>  	kvmgt_protect_table_init(vgpu);
>  	gvt_cache_init(vgpu);
> =20
> @@ -679,6 +677,8 @@ static int intel_vgpu_open_device(struct vfio_device =
*vfio_dev)
>  	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
>  					 &vgpu->track_node);
> =20
> +	set_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
> +
>  	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
>  			     &vgpu->nr_cache_entries);
> =20
> @@ -702,11 +702,12 @@ static void intel_vgpu_close_device(struct vfio_dev=
ice *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> =20
> -	if (!vgpu->attached)
> -		return;
> +	WARN_ON_ONCE(!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status));
> =20
>  	intel_gvt_release_vgpu(vgpu);
> =20
> +	clear_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
> +
>  	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
> =20
>  	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
> @@ -716,8 +717,6 @@ static void intel_vgpu_close_device(struct vfio_devic=
e *vfio_dev)
> =20
>  	intel_vgpu_release_msi_eventfd_ctx(vgpu);
> =20
> -	vgpu->attached =3D false;
> -
>  	if (vgpu->vfio_device.kvm)
>  		kvm_put_kvm(vgpu->vfio_device.kvm);
>  }
> @@ -1502,9 +1501,6 @@ static void intel_vgpu_remove(struct mdev_device *m=
dev)
>  {
>  	struct intel_vgpu *vgpu =3D dev_get_drvdata(&mdev->dev);
> =20
> -	if (WARN_ON_ONCE(vgpu->attached))
> -		return;
> -
>  	vfio_unregister_group_dev(&vgpu->vfio_device);
>  	vfio_put_device(&vgpu->vfio_device);
>  }
> @@ -1549,7 +1545,7 @@ int intel_gvt_page_track_add(struct intel_vgpu *inf=
o, u64 gfn)
>  	struct kvm_memory_slot *slot;
>  	int idx;
> =20
> -	if (!info->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
>  		return -ESRCH;
> =20
>  	idx =3D srcu_read_lock(&kvm->srcu);
> @@ -1579,8 +1575,8 @@ int intel_gvt_page_track_remove(struct intel_vgpu *=
info, u64 gfn)
>  	struct kvm_memory_slot *slot;
>  	int idx;
> =20
> -	if (!info->attached)
> -		return 0;
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, info->status))
> +		return -ESRCH;
> =20
>  	idx =3D srcu_read_lock(&kvm->srcu);
>  	slot =3D gfn_to_memslot(kvm, gfn);
> @@ -1658,7 +1654,7 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu =
*vgpu, unsigned long gfn,
>  	struct gvt_dma *entry;
>  	int ret;
> =20
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -EINVAL;
> =20
>  	mutex_lock(&vgpu->cache_lock);
> @@ -1704,8 +1700,8 @@ int intel_gvt_dma_pin_guest_page(struct intel_vgpu =
*vgpu, dma_addr_t dma_addr)
>  	struct gvt_dma *entry;
>  	int ret =3D 0;
> =20
> -	if (!vgpu->attached)
> -		return -ENODEV;
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
> +		return -EINVAL;
> =20
>  	mutex_lock(&vgpu->cache_lock);
>  	entry =3D __gvt_cache_find_dma_addr(vgpu, dma_addr);
> @@ -1732,7 +1728,7 @@ void intel_gvt_dma_unmap_guest_page(struct intel_vg=
pu *vgpu,
>  {
>  	struct gvt_dma *entry;
> =20
> -	if (!vgpu->attached)
> +	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return;
> =20
>  	mutex_lock(&vgpu->cache_lock);
> @@ -1768,7 +1764,7 @@ static void intel_gvt_test_and_emulate_vblank(struc=
t intel_gvt *gvt)
>  	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) {
>  		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK + id,
>  				       (void *)&gvt->service_request)) {
> -			if (vgpu->active)
> +			if (test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status))
>  				intel_vgpu_emulate_vblank(vgpu);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index d6fe94cd0fdb..aa162ac0d76e 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -866,7 +866,8 @@ pick_next_workload(struct intel_gvt *gvt, struct inte=
l_engine_cs *engine)
>  		goto out;
>  	}
> =20
> -	if (!scheduler->current_vgpu->active ||
> +	if (!test_bit(INTEL_VGPU_STATUS_ACTIVE,
> +	    scheduler->current_vgpu->status) ||
>  	    list_empty(workload_q_head(scheduler->current_vgpu, engine)))
>  		goto out;
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index 56c71474008a..ae7d2919240f 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -166,9 +166,7 @@ void intel_gvt_clean_vgpu_types(struct intel_gvt *gvt)
>   */
>  void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)
>  {
> -	mutex_lock(&vgpu->vgpu_lock);
> -	vgpu->active =3D true;
> -	mutex_unlock(&vgpu->vgpu_lock);
> +	set_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status);
>  }
> =20
>  /**
> @@ -183,7 +181,7 @@ void intel_gvt_deactivate_vgpu(struct intel_vgpu *vgp=
u)
>  {
>  	mutex_lock(&vgpu->vgpu_lock);
> =20
> -	vgpu->active =3D false;
> +	clear_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status);
> =20
>  	if (atomic_read(&vgpu->submission.running_workload_num)) {
>  		mutex_unlock(&vgpu->vgpu_lock);
> @@ -228,7 +226,8 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
>  	struct intel_gvt *gvt =3D vgpu->gvt;
>  	struct drm_i915_private *i915 =3D gvt->gt->i915;
> =20
> -	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
> +	drm_WARN(&i915->drm, test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status),
> +		 "vGPU is still active!\n");
> =20
>  	/*
>  	 * remove idr first so later clean can judge if need to stop
> @@ -285,8 +284,7 @@ struct intel_vgpu *intel_gvt_create_idle_vgpu(struct =
intel_gvt *gvt)
>  	if (ret)
>  		goto out_free_vgpu;
> =20
> -	vgpu->active =3D false;
> -
> +	clear_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status);
>  	return vgpu;
> =20
>  out_free_vgpu:
> --=20
> 2.25.1
>=20

Besides one above error, others look fine to me. So with that fixed,

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2n4HQAKCRCxBBozTXgY
JzBaAKCVHC4HnWuHSOTMjgAIvVP1GLEuMgCfbv7Eg7NBPBvi4Vk8qbb9qq5oFpw=
=3bmp
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
