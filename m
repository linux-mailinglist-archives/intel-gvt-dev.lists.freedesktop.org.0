Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E61AF2A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 May 2019 05:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02014892B8;
	Mon, 13 May 2019 03:38:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137D7892B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 May 2019 03:38:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 May 2019 20:38:20 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 12 May 2019 20:38:17 -0700
Date: Mon, 13 May 2019 11:37:35 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 3/3] drm/i915/gvt: Enable vGPU direct flip
Message-ID: <20190513033735.GA12913@zhen-hp.sh.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <1557461728-2831-4-git-send-email-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1557461728-2831-4-git-send-email-tina.zhang@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 ville.syrjala@linux.intel.com, kraxel@redhat.com, daniel@ffwll.ch,
 kalyan.kondapally@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, zhiyuan.lv@intel.com
Content-Type: multipart/mixed; boundary="===============0425162341=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0425162341==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDfw0eiGGL81pE1o"
Content-Disposition: inline


--dDfw0eiGGL81pE1o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.10 12:15:28 +0800, Tina Zhang wrote:
> When vGPU does page flip, display model flips the shadow framebuffer
> to the assigned hardware plane through drm display framework.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c   |   8 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.h   |   6 +
>  drivers/gpu/drm/i915/gvt/handlers.c | 332 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 345 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index e9adcd4..b6d9317 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -201,7 +201,7 @@ static bool validate_hotspot(struct intel_vgpu_cursor=
_plane_format *c)
>  		return false;
>  }
> =20
> -static int vgpu_get_plane_info(struct drm_device *dev,
> +int vgpu_get_plane_info(struct drm_device *dev,
>  		struct intel_vgpu *vgpu,
>  		struct intel_vgpu_fb_info *info,
>  		int plane_id)
> @@ -221,6 +221,8 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		info->height =3D p.height;
>  		info->stride =3D p.stride;
>  		info->drm_format =3D p.drm_format;
> +		info->src_x =3D p.x_offset;
> +		info->src_y =3D p.y_offset;
> =20
>  		switch (p.tiled) {
>  		case PLANE_CTL_TILED_LINEAR:
> @@ -289,6 +291,8 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		return -EFAULT;
>  	}
> =20
> +	info->vgpu_id =3D vgpu->id;
> +
>  	return 0;
>  }
> =20
> @@ -406,6 +410,8 @@ int intel_vgpu_query_plane(struct intel_vgpu *vgpu, v=
oid *args)
> =20
>  	mutex_unlock(&vgpu->dmabuf_lock);
> =20
> +	fb_info.vgpu_id =3D vgpu->id;
> +
>  	/* Need to allocate a new one*/
>  	dmabuf_obj =3D kmalloc(sizeof(struct intel_vgpu_dmabuf_obj), GFP_KERNEL=
);
>  	if (unlikely(!dmabuf_obj)) {
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt=
/dmabuf.h
> index cf97eb4..184445b 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.h
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.h
> @@ -46,6 +46,8 @@ struct intel_vgpu_fb_info {
>  	__u32 x_hot;    /* horizontal position of cursor hotspot */
>  	__u32 y_hot;    /* vertical position of cursor hotspot */
>  	__u32 vgpu_id;
> +	__u32 src_x;
> +	__u32 src_y;
>  	struct intel_vgpu_dmabuf_obj *obj;
>  };
> =20
> @@ -66,4 +68,8 @@ int intel_vgpu_get_dmabuf(struct intel_vgpu *vgpu, unsi=
gned int dmabuf_id);
>  void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu);
>  struct drm_i915_gem_object *vgpu_create_gem(struct drm_device *dev,
>  					    struct intel_vgpu_fb_info *info);
> +int vgpu_get_plane_info(struct drm_device *dev,
> +			struct intel_vgpu *vgpu,
> +			struct intel_vgpu_fb_info *info,
> +			int plane_id);
>  #endif
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 18f01ee..698a72d 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -36,6 +36,8 @@
> =20
>   */
> =20
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include "i915_drv.h"
>  #include "gvt.h"
>  #include "i915_pvinfo.h"
> @@ -743,6 +745,334 @@ static int south_chicken2_mmio_write(struct intel_v=
gpu *vgpu,
>  	return 0;
>  }
> =20
> +static int vgpu_fb_update(struct drm_device *dev,
> +			 struct intel_vgpu *vgpu,
> +			 int plane_id,
> +			 struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	struct drm_i915_gem_object *obj;
> +	struct intel_vgpu_fb_info info;
> +	int ret;
> +
> +	ret =3D vgpu_get_plane_info(dev, vgpu, &info, plane_id);
> +	if (ret || !info.size || !info.drm_format)
> +		return ret;
> +
> +	if (plane_id =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		obj =3D vgpu->display.shadow_fbs.shadow_obj[PRIMARY_PLANE];
> +	else if (plane_id =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		obj =3D vgpu->display.shadow_fbs.shadow_obj[CURSOR_PLANE];
> +	else
> +		obj =3D vgpu->display.shadow_fbs.shadow_obj[SPRITE_PLANE];
> +
> +	if (obj =3D=3D NULL)
> +		return -ENODEV;
> +
> +	memcpy(obj->gvt_info, &info, sizeof(info));
> +
> +	mode_cmd->pixel_format =3D info.drm_format;
> +	mode_cmd->width =3D info.width;
> +	mode_cmd->height =3D info.height;
> +	mode_cmd->handles[0] =3D 0;
> +	mode_cmd->offsets[0] =3D 0;
> +	mode_cmd->pitches[0] =3D info.stride;
> +	mode_cmd->flags =3D DRM_MODE_FB_MODIFIERS;
> +	mode_cmd->modifier[0] =3D info.drm_format_mod;
> +
> +	return ret;
> +}
> +
> +static int check_vgpu_plane_assignment_status(struct intel_vgpu *vgpu,
> +					      enum plane_id plane_id,
> +					      struct drm_crtc **crtc,
> +					      struct drm_plane **drm_plane,
> +					      struct drm_plane **cur_drm_plane)
> +{
> +	struct drm_device *dev =3D &vgpu->gvt->dev_priv->drm;
> +	struct drm_plane *plane;
> +	struct intel_plane *intel_plane;
> +	struct drm_mode_object *obj_fb;
> +	struct intel_framebuffer *intel_fb;
> +	struct drm_gem_object *gem_obj;
> +	struct drm_i915_gem_object *i915_gem_obj;
> +	struct intel_vgpu_fb_info *fb_info;
> +	u32 fb_id =3D 0;
> +	int ret =3D 0;
> +
> +	*crtc =3D NULL;
> +	*drm_plane =3D NULL;
> +
> +	drm_for_each_plane(plane, dev) {
> +		intel_plane =3D to_intel_plane(plane);
> +		if (intel_plane->id =3D=3D plane_id) {
> +			if (plane->state && plane->state->fb)
> +				fb_id =3D plane->state->fb->base.id;
> +			else if (!plane->state && plane->fb)
> +				fb_id =3D plane->fb->base.id;
> +			else
> +				continue;
> +
> +			obj_fb =3D idr_find(&dev->mode_config.object_idr, fb_id);
> +			intel_fb =3D to_intel_framebuffer(obj_to_fb(obj_fb));
> +			gem_obj =3D intel_fb->base.obj[0];
> +			i915_gem_obj =3D to_intel_bo(gem_obj);
> +			fb_info =3D i915_gem_obj->gvt_info;
> +
> +			if (i915_gem_object_is_proxy(i915_gem_obj) &&
> +			    fb_info && fb_info->vgpu_id =3D=3D vgpu->id &&
> +			    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +				if (plane->state && plane->state->crtc) {
> +					*crtc =3D plane->state->crtc;
> +					*drm_plane =3D plane;
> +					*cur_drm_plane =3D
> +						plane->state->crtc->cursor;
> +					break;
> +				} else if (!plane->state && plane->crtc) {
> +					*crtc =3D plane->crtc;
> +					*drm_plane =3D plane;
> +					*cur_drm_plane =3D plane->crtc->cursor;
> +					break;
> +				}

Instead of walking all planes every time, why not let i915 display
to provide a helper to get vGPU plane assigned pipe info? which can
be got from fb's gem object to check its gvt_info.

> +			}
> +		}
> +	}
> +
> +	if (fb_id =3D=3D 0 || *crtc =3D=3D NULL || *drm_plane =3D=3D NULL)
> +		ret =3D -1;
> +
> +	return ret;
> +}
> +
> +static void __i915_gem_object_reset_page_iter(struct drm_i915_gem_object=
 *obj)
> +{
> +	struct radix_tree_iter iter;
> +	void __rcu **slot;
> +
> +	rcu_read_lock();
> +	radix_tree_for_each_slot(slot, &obj->mm.get_page.radix, &iter, 0)
> +		radix_tree_delete(&obj->mm.get_page.radix, iter.index);
> +	rcu_read_unlock();
> +}
> +
> +static struct sg_table *
> +__i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
> +{

Copy i915 internal function is not good..and this is too hacking. I think
when new display flip, you need to unreference old buffer and create new
one to reference new backing pages.

> +	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +	struct sg_table *pages;
> +
> +	pages =3D fetch_and_zero(&obj->mm.pages);
> +	if (IS_ERR_OR_NULL(pages))
> +		return pages;
> +
> +	spin_lock(&i915->mm.obj_lock);
> +	list_del(&obj->mm.link);
> +	spin_unlock(&i915->mm.obj_lock);
> +
> +	if (obj->mm.mapping) {
> +		void *ptr;
> +
> +		ptr =3D page_mask_bits(obj->mm.mapping);
> +		if (is_vmalloc_addr(ptr))
> +			vunmap(ptr);
> +		else
> +			kunmap(kmap_to_page(ptr));
> +
> +		obj->mm.mapping =3D NULL;
> +	}
> +
> +	__i915_gem_object_reset_page_iter(obj);
> +	obj->mm.page_sizes.phys =3D obj->mm.page_sizes.sg =3D 0;
> +
> +	return pages;
> +}
> +
> +static int handle_vgpu_page_flip(struct intel_vgpu *vgpu, int pipe,
> +				 enum plane_id plane_id)
> +{
> +       /* struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv; */
> +       /* struct intel_vgpu_plane_info vgpu_plane_info; */
> +	struct drm_device *drm =3D &vgpu->gvt->dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_crtc *crtc;
> +	struct drm_plane *plane, *cur_plane;
> +	struct drm_framebuffer *pri_fb, *cur_fb;
> +	struct drm_i915_gem_object *pri_obj, *cur_obj;
> +	struct drm_atomic_state *state;
> +	struct drm_plane_state *plane_state =3D NULL, *cur_plane_state =3D NULL;
> +	struct drm_mode_fb_cmd2 mode_cmd;
> +	struct intel_vgpu_fb_info *fb_info;
> +	int ret =3D 0;
> +
> +	if (!vgpu->display.shadow_fbs.enable_direct_flip)
> +		return ret;
> +
> +	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> +retry:
> +	ret =3D drm_modeset_lock_all_ctx(drm, &ctx);
> +	if (ret)
> +		goto fail;
> +
> +	/* 1. Check assignment status */
> +	ret =3D check_vgpu_plane_assignment_status(vgpu, plane_id, &crtc,
> +						 &plane, &cur_plane);
> +	if (ret) {
> +		DRM_DEBUG_KMS("%s, vgpu plane %d has no assgined plane\n",
> +			      __func__, plane_id);
> +		ret =3D -EINVAL;
> +		goto fail;
> +	}
> +	/* 2. Update shadow primary plane */
> +	if (plane_id =3D=3D PLANE_PRIMARY) {
> +		pri_fb =3D vgpu->display.shadow_fbs.shadow_fb[PRIMARY_PLANE];
> +		pri_obj =3D vgpu->display.shadow_fbs.shadow_obj[PRIMARY_PLANE];
> +
> +		fb_info =3D pri_obj->gvt_info;
> +
> +		state =3D drm_atomic_state_alloc(drm);
> +		if (!state)
> +			goto fail;
> +
> +		state->acquire_ctx =3D &ctx;
> +		plane_state =3D drm_atomic_get_plane_state(state, plane);
> +		if (IS_ERR(plane_state)) {
> +			ret =3D PTR_ERR(plane_state);
> +			goto out;
> +		}
> +
> +		ret =3D vgpu_fb_update(drm, vgpu, DRM_PLANE_TYPE_PRIMARY, &mode_cmd);
> +		if (ret) {
> +			DRM_DEBUG_KMS("vgpu_fb_update failed\n");
> +			goto out;
> +		}
> +
> +		drm_helper_mode_fill_fb_struct(drm, pri_fb, &mode_cmd);
> +		ret =3D drm_atomic_set_crtc_for_plane(plane_state, crtc);
> +		if (ret !=3D 0)
> +			goto out;
> +		if (plane_state->fb !=3D pri_fb)
> +			drm_atomic_set_fb_for_plane(plane_state, pri_fb);
> +
> +		plane_state->src_x =3D fb_info->src_x;
> +		plane_state->src_y =3D fb_info->src_y;
> +		plane_state->src_w =3D mode_cmd.width << 16;
> +		plane_state->src_h =3D mode_cmd.height << 16;
> +
> +		/* Don't allow full modeset */
> +		state->allow_modeset =3D false;
> +
> +		if (i915_gem_object_has_pinned_pages(pri_obj)) {
> +			struct sg_table *pages;
> +			struct i915_vma *vma;
> +			struct i915_address_space *vm =3D
> +						&vgpu->gvt->dev_priv->ggtt.vm;
> +
> +			pages =3D __i915_gem_object_unset_pages(pri_obj);
> +			if (!IS_ERR(pages))
> +				pri_obj->ops->put_pages(pri_obj, pages);
> +			ret =3D pri_obj->ops->get_pages(pri_obj);
> +
> +			/* pri_obj->cache_dirty =3D true; */
> +
> +			vma =3D i915_vma_instance(pri_obj, vm, NULL);
> +			if (IS_ERR(vma))
> +				goto out;
> +
> +			vma->ops->set_pages(vma);
> +
> +			ret =3D i915_vma_bind(vma, vma->obj ?
> +					    pri_obj->cache_level : 0,
> +					    PIN_UPDATE);
> +			if (ret)
> +				goto out;
> +		}
> +
> +		/* 3. Update shadow cursor plane */
> +		if (cur_plane) {
> +			ret =3D vgpu_fb_update(drm, vgpu, DRM_PLANE_TYPE_CURSOR,
> +					     &mode_cmd);
> +			if (ret) {
> +				DRM_DEBUG_KMS("cursor vgpu_fb_update failed\n");
> +				goto flip;
> +			}
> +			cur_fb =3D vgpu->display.shadow_fbs.shadow_fb[CURSOR_PLANE];
> +			cur_obj =3D vgpu->display.shadow_fbs.shadow_obj[CURSOR_PLANE];
> +			cur_plane_state =3D drm_atomic_get_plane_state(state,
> +								     cur_plane);
> +			if (IS_ERR(cur_plane_state)) {
> +				ret =3D PTR_ERR(cur_plane_state);
> +				goto flip;
> +			}
> +
> +			fb_info =3D cur_obj->gvt_info;
> +			drm_helper_mode_fill_fb_struct(drm, cur_fb, &mode_cmd);
> +			ret =3D drm_atomic_set_crtc_for_plane(cur_plane_state,
> +							    crtc);
> +			if (ret !=3D 0)
> +				goto flip;
> +			if (cur_plane_state->fb !=3D cur_fb)
> +				drm_atomic_set_fb_for_plane(cur_plane_state,
> +							    cur_fb);
> +
> +			cur_plane_state->crtc_x =3D fb_info->x_pos;
> +			cur_plane_state->crtc_y =3D fb_info->y_pos;
> +			cur_plane_state->crtc_w =3D mode_cmd.width;
> +			cur_plane_state->crtc_h =3D mode_cmd.height;
> +			cur_plane_state->src_x =3D 0;
> +			cur_plane_state->src_y =3D 0;
> +			cur_plane_state->src_w =3D mode_cmd.width << 16;
> +			cur_plane_state->src_h =3D mode_cmd.height << 16;
> +
> +			if (i915_gem_object_has_pinned_pages(cur_obj)) {
> +				struct sg_table *pages;
> +				struct i915_vma *vma;
> +				struct i915_address_space *vm =3D
> +					&vgpu->gvt->dev_priv->ggtt.vm;
> +
> +				pages =3D __i915_gem_object_unset_pages(cur_obj);
> +				if (!IS_ERR(pages))
> +					cur_obj->ops->put_pages(cur_obj, pages);
> +				ret =3D cur_obj->ops->get_pages(cur_obj);
> +
> +				vma =3D i915_vma_instance(cur_obj, vm, NULL);
> +				if (IS_ERR(vma))
> +					goto out;
> +
> +				vma->ops->set_pages(vma);
> +
> +				ret =3D i915_vma_bind(vma, vma->obj ?
> +						    cur_obj->cache_level : 0,
> +						    PIN_UPDATE);
> +				if (ret)
> +					goto out;
> +			}
> +		}
> +flip:
> +
> +		/* 4. Commit drm_framebuffer */
> +		ret =3D drm_atomic_commit(state);
> +		if (plane_state->fb !=3D pri_fb)
> +			drm_framebuffer_put(pri_fb);
> +		if (cur_plane_state && cur_plane_state->fb !=3D cur_fb)
> +			drm_framebuffer_put(cur_fb);
> +	} else {
> +		DRM_DEBUG_KMS("Assigning sprite plane hasn't been supported\n");
> +	}
> +
> +out:
> +	drm_atomic_state_put(state);
> +fail:
> +	if (ret =3D=3D -EDEADLK) {
> +	       ret =3D drm_modeset_backoff(&ctx);
> +	       if (!ret)
> +		       goto retry;
> +	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	return ret;
> +}
> +
>  #define DSPSURF_TO_PIPE(offset) \
>  	calc_index(offset, _DSPASURF, _DSPBSURF, 0, DSPSURF(PIPE_C))
> =20
> @@ -758,6 +1088,8 @@ static int pri_surf_mmio_write(struct intel_vgpu *vg=
pu, unsigned int offset,
> =20
>  	vgpu_vreg_t(vgpu, PIPE_FLIPCOUNT_G4X(pipe))++;
> =20
> +	handle_vgpu_page_flip(vgpu, pipe, PLANE_PRIMARY);
> +
>  	if (vgpu_vreg_t(vgpu, DSPCNTR(pipe)) & PLANE_CTL_ASYNC_FLIP)
>  		intel_vgpu_trigger_virtual_event(vgpu, event);
>  	else
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--dDfw0eiGGL81pE1o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNjmfwAKCRCxBBozTXgY
JzyNAKCESorNtkdzEBC4ebH6jtSSbdjs8QCfZ2CSGLT/02BHgZ+4j8yqwHvfjyE=
=WCSD
-----END PGP SIGNATURE-----

--dDfw0eiGGL81pE1o--

--===============0425162341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0425162341==--
