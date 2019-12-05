Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD93113D53
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Dec 2019 09:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F25D6E987;
	Thu,  5 Dec 2019 08:48:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8066F6E987
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Dec 2019 08:48:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 00:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; 
 d="asc'?scan'208";a="214118989"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 05 Dec 2019 00:48:41 -0800
Date: Thu, 5 Dec 2019 16:47:20 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Yuan, Hang" <hang.yuan@intel.com>
Subject: Re: [RFC PATCH] drm/i915/gvt: aggregation type support
Message-ID: <20191205084720.GJ4196@zhen-hp.sh.intel.com>
References: <20191204100456.1757-1-zhenyuw@linux.intel.com>
 <C294FBAE55175941838A8D362DCD8AA225F85A1A@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <C294FBAE55175941838A8D362DCD8AA225F85A1A@SHSMSX104.ccr.corp.intel.com>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1918768670=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1918768670==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9aSJXjR17r53A+a+"
Content-Disposition: inline


--9aSJXjR17r53A+a+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.05 08:12:36 +0000, Yuan, Hang wrote:
> > -----Original Message-----
> > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Be=
half Of
> > Zhenyu Wang
> > Sent: Wednesday, December 4, 2019 6:05 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: Tian, Kevin <kevin.tian@intel.com>
> > Subject: [RFC PATCH] drm/i915/gvt: aggregation type support
> >=20
> > To increase the flexibility for resource allocation on type, this trys =
to add
> > aggregation attribute for mdev type that can aggregate gfx memory resou=
rces
> > in GVT case.
> >=20
> > As Alex suggested to use sysfs method for this attribute, the most diff=
erence for
> > GVT is that the gfx resource allocation will be delayed until mdev open=
 instead
> > of mdev create to allow aggregation setting before VM start.
> >=20
> > For VFIO/mdev core part, only formal interface definition would be prov=
ided.
> > This one trys to provide the suggested sysfs attributes and driver chan=
ge for GVT
> > review.
> >=20
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/aperture_gm.c |  17 ++-
> >  drivers/gpu/drm/i915/gvt/gvt.c         |   6 +-
> >  drivers/gpu/drm/i915/gvt/gvt.h         |  35 +++---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c       | 108 ++++++++++++++++++-
> >  drivers/gpu/drm/i915/gvt/vgpu.c        | 141 +++++++++++++++----------
> >  5 files changed, 222 insertions(+), 85 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> > b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> > index 771420453f82..b74d1f9f07b8 100644
> > --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> > +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> > @@ -234,10 +234,10 @@ static void free_resource(struct intel_vgpu *vgpu)
> >  	gvt->fence.vgpu_allocated_fence_num -=3D vgpu_fence_sz(vgpu);  }
> >=20
> > -static int alloc_resource(struct intel_vgpu *vgpu,
> > -		struct intel_vgpu_creation_params *param)
> > +static int alloc_resource(struct intel_vgpu *vgpu)
> >  {
> >  	struct intel_gvt *gvt =3D vgpu->gvt;
> > +	struct intel_vgpu_creation_params *param =3D &vgpu->param;
> >  	unsigned long request, avail, max, taken;
> >  	const char *item;
> >=20
> > @@ -250,7 +250,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
> >  	max =3D gvt_aperture_sz(gvt) - HOST_LOW_GM_SIZE;
> >  	taken =3D gvt->gm.vgpu_allocated_low_gm_size;
> >  	avail =3D max - taken;
> > -	request =3D MB_TO_BYTES(param->low_gm_sz);
> > +	request =3D param->low_gm_sz * param->aggregation;
> >=20
> >  	if (request > avail)
> >  		goto no_enough_resource;
> > @@ -261,7 +261,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
> >  	max =3D gvt_hidden_sz(gvt) - HOST_HIGH_GM_SIZE;
> >  	taken =3D gvt->gm.vgpu_allocated_high_gm_size;
> >  	avail =3D max - taken;
> > -	request =3D MB_TO_BYTES(param->high_gm_sz);
> > +	request =3D param->high_gm_sz * param->aggregation;
> [Yuan, Hang] For vgpu with aggregated resource, shall it get more fence, =
more scheduling weight and support bigger resolution?

For fence, current number should be enough, and I don't think guest
requires more. Weight and resolution still binds to type, as can't
define the behavior for aggregation, how to aggregate resolution?

>=20
> >=20
> >  	if (request > avail)
> >  		goto no_enough_resource;
> > @@ -279,8 +279,8 @@ static int alloc_resource(struct intel_vgpu *vgpu,
> >=20
> >  	vgpu_fence_sz(vgpu) =3D request;
> >=20
> > -	gvt->gm.vgpu_allocated_low_gm_size +=3D MB_TO_BYTES(param-
> > >low_gm_sz);
> > -	gvt->gm.vgpu_allocated_high_gm_size +=3D MB_TO_BYTES(param-
> > >high_gm_sz);
> > +	gvt->gm.vgpu_allocated_low_gm_size +=3D param->low_gm_sz;
> > +	gvt->gm.vgpu_allocated_high_gm_size +=3D param->high_gm_sz;
> [Yuan, Hang] multiply param->aggregation?

Right, thanks for catching.

>=20
> >  	gvt->fence.vgpu_allocated_fence_num +=3D param->fence_sz;
> >  	return 0;
> >=20
> > @@ -334,12 +334,11 @@ void intel_vgpu_reset_resource(struct intel_vgpu
> > *vgpu)
> >   * zero on success, negative error code if failed.
> >   *
> >   */
> > -int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu,
> > -		struct intel_vgpu_creation_params *param)
> > +int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu)
> >  {
> >  	int ret;
> >=20
> > -	ret =3D alloc_resource(vgpu, param);
> > +	ret =3D alloc_resource(vgpu);
> >  	if (ret)
> >  		return ret;
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/=
gvt.c
> > index cb5fa30b8e63..013e6ca0b180 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> > @@ -98,11 +98,11 @@ static ssize_t description_show(struct kobject *kob=
j,
> > struct device *dev,
> >=20
> >  	return sprintf(buf, "low_gm_size: %dMB\nhigh_gm_size: %dMB\n"
> >  		       "fence: %d\nresolution: %s\n"
> > -		       "weight: %d\n",
> > +		       "weight: %d\naggregation: %s\n",
> >  		       BYTES_TO_MB(type->low_gm_size),
> >  		       BYTES_TO_MB(type->high_gm_size),
> >  		       type->fence, vgpu_edid_str(type->resolution),
> > -		       type->weight);
> > +		       type->weight, type->aggregation ? "yes" : "no");
> >  }
> >=20
> >  static MDEV_TYPE_ATTR_RO(available_instances);
> > @@ -184,6 +184,8 @@ static const struct intel_gvt_ops intel_gvt_ops =3D=
 {
> >  	.vgpu_get_dmabuf =3D intel_vgpu_get_dmabuf,
> >  	.write_protect_handler =3D intel_vgpu_page_track_handler,
> >  	.emulate_hotplug =3D intel_vgpu_emulate_hotplug,
> > +	.vgpu_res_alloc =3D intel_vgpu_res_alloc,
> > +	.vgpu_res_free =3D intel_vgpu_res_free,
> >  };
> >=20
> >  static void init_device_info(struct intel_gvt *gvt) diff --git
> > a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h index
> > 0081b051d3e0..20ee1d5aeb17 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -165,6 +165,18 @@ struct intel_vgpu_submission {
> >  	bool active;
> >  };
> >=20
> > +struct intel_vgpu_creation_params {
> > +	__u64 handle;
> > +	__u64 low_gm_sz;
> > +	__u64 high_gm_sz;
> > +	__u64 fence_sz;
> > +	__u64 resolution;
> > +	__s32 primary;
> > +	__u64 vgpu_id;
> > +	__u32 weight;
> > +	__u32 aggregation; /* requested aggregation number if type supports
> > */
> > +};
> > +
> >  struct intel_vgpu {
> >  	struct intel_gvt *gvt;
> >  	struct mutex vgpu_lock;
> > @@ -174,6 +186,8 @@ struct intel_vgpu {
> >  	bool pv_notified;
> >  	bool failsafe;
> >  	unsigned int resetting_eng;
> > +	struct intel_vgpu_creation_params param;
> > +	struct intel_vgpu_type *type;
> >=20
> >  	/* Both sched_data and sched_ctl can be seen a part of the global gvt
> >  	 * scheduler structure. So below 2 vgpu data are protected @@ -296,6
> > +310,7 @@ struct intel_vgpu_type {
> >  	unsigned int fence;
> >  	unsigned int weight;
> >  	enum intel_vgpu_edid resolution;
> > +	bool aggregation;
> >  };
> >=20
> >  struct intel_gvt {
> > @@ -421,20 +436,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt);
> > #define vgpu_fence_base(vgpu) (vgpu->fence.base)  #define
> > vgpu_fence_sz(vgpu) (vgpu->fence.size)
> >=20
> > -struct intel_vgpu_creation_params {
> > -	__u64 handle;
> > -	__u64 low_gm_sz;  /* in MB */
> > -	__u64 high_gm_sz; /* in MB */
> > -	__u64 fence_sz;
> > -	__u64 resolution;
> > -	__s32 primary;
> > -	__u64 vgpu_id;
> > -
> > -	__u32 weight;
> > -};
> > -
> > -int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu,
> > -			      struct intel_vgpu_creation_params *param);
> > +int intel_vgpu_alloc_resource(struct intel_vgpu *vgpu);
> >  void intel_vgpu_reset_resource(struct intel_vgpu *vgpu);  void
> > intel_vgpu_free_resource(struct intel_vgpu *vgpu);  void
> > intel_vgpu_write_fence(struct intel_vgpu *vgpu, @@ -542,6 +544,9 @@ sta=
tic
> > inline u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar)
> >  			PCI_BASE_ADDRESS_MEM_MASK;
> >  }
> >=20
> > +int intel_vgpu_res_alloc(struct intel_vgpu *vgpu); void
> > +intel_vgpu_res_free(struct intel_vgpu *vgpu);
> > +
> >  void intel_vgpu_clean_opregion(struct intel_vgpu *vgpu);  int
> > intel_vgpu_init_opregion(struct intel_vgpu *vgpu);  int
> > intel_vgpu_opregion_base_write_handler(struct intel_vgpu *vgpu, u32 gpa=
);
> > @@ -576,6 +581,8 @@ struct intel_gvt_ops {
> >  	int (*write_protect_handler)(struct intel_vgpu *, u64, void *,
> >  				     unsigned int);
> >  	void (*emulate_hotplug)(struct intel_vgpu *vgpu, bool connected);
> > +	int (*vgpu_res_alloc)(struct intel_vgpu *vgpu);
> > +	void (*vgpu_res_free)(struct intel_vgpu *vgpu);
> >  };
> >=20
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index a699ecade3fc..001ae5d01b4e 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -668,7 +668,8 @@ static int intel_vgpu_create(struct kobject *kobj, =
struct
> > mdev_device *mdev)
> >  		gvt_err("failed to create intel vgpu: %d\n", ret);
> >  		goto out;
> >  	}
> > -
> > +	vgpu->type =3D type;
> > +
> >  	INIT_WORK(&vgpu->vdev.release_work, intel_vgpu_release_work);
> >=20
> >  	vgpu->vdev.mdev =3D mdev;
> > @@ -748,6 +749,8 @@ static int intel_vgpu_open(struct mdev_device *mdev)
> >  	unsigned long events;
> >  	int ret;
> >=20
> > +	mutex_lock(&vgpu->vgpu_lock);
> > +
> >  	vgpu->vdev.iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
> >  	vgpu->vdev.group_notifier.notifier_call =3D intel_vgpu_group_notifier;
> >=20
> > @@ -769,21 +772,32 @@ static int intel_vgpu_open(struct mdev_device *md=
ev)
> >  		goto undo_iommu;
> >  	}
> >=20
> > +	if (vgpu->type->aggregation && vgpu->param.aggregation) {
> > +		ret =3D intel_gvt_ops->vgpu_res_alloc(vgpu);
> > +		if (ret)
> > +			goto undo_group;
> > +	}
> > +
> [Yuan, Hang] If firstly create one aggregated vgpu with maximum aggregati=
on number, secondly create non-aggregated vgpu, later when open the aggrega=
ted vgpu, resource allocation will be failed. Is it a known unsupported usa=
ge?

As I don't like to really allocate res during changing 'aggregation'
number before really open, so that could be problematic.

One way to mitigate that is to make sure 'aggregation' would always
show current maxium left instances for aggregation, e.g maybe
orchestration can check 'aggregation' before open, if it's 0 then
there's no resource left, so won't use this device. Then we need clear
definition on value of 'aggregation' for different cases.

>=20
> >  	/* Take a module reference as mdev core doesn't take
> >  	 * a reference for vendor driver.
> >  	 */
> >  	if (!try_module_get(THIS_MODULE))
> > -		goto undo_group;
> > +		goto free_res;
> >=20
> >  	ret =3D kvmgt_guest_init(mdev);
> > -	if (ret)
> > -		goto undo_group;
> > +	if (ret) {
> > +		module_put(THIS_MODULE);
> > +		goto free_res;
> > +	}
> >=20
> >  	intel_gvt_ops->vgpu_activate(vgpu);
> >=20
> >  	atomic_set(&vgpu->vdev.released, 0);
> > -	return ret;
> > +	goto out;
> >=20
> > +free_res:
> > +	if (vgpu->type->aggregation && vgpu->param.aggregation)
> > +		intel_gvt_ops->vgpu_res_free(vgpu);
> >  undo_group:
> >  	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
> >  					&vgpu->vdev.group_notifier);
> > @@ -792,6 +806,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
> >  	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> >  					&vgpu->vdev.iommu_notifier);
> >  out:
> > +	mutex_unlock(&vgpu->vgpu_lock);
> >  	return ret;
> >  }
> >=20
> > @@ -1576,8 +1591,91 @@ static const struct attribute_group intel_vgpu_g=
roup
> > =3D {
> >  	.attrs =3D intel_vgpu_attrs,
> >  };
> >=20
> > +/*
> > + * "aggregation" display current maxium instances for aggregation,
> > + * if type doesn't support aggregation, it displays 0  */ static
> > +ssize_t aggregation_show(struct device *dev, struct device_attribute
> > +*attr,
> > +		 char *buf)
> > +{
> > +	struct mdev_device *mdev =3D mdev_from_dev(dev);
> > +
> > +	if (mdev) {
> > +		struct intel_vgpu *vgpu =3D (struct intel_vgpu *)
> > +			mdev_get_drvdata(mdev);
> > +		struct intel_vgpu_type *type =3D vgpu->type;
> > +		if (type->aggregation)
> > +			return sprintf(buf, "%u\n", type->avail_instance);
> > +	}
> > +	return sprintf(buf, "0\n");
> > +}
> > +
> > +static ssize_t
> > +aggregation_store(struct device *dev, struct device_attribute *attr,
> > +		  const char *buf, size_t count)
> > +{
> > +	struct mdev_device *mdev =3D mdev_from_dev(dev);
> > +	unsigned long val;
> > +
> > +	if (kstrtoul(buf, 0, &val) < 0)
> > +		return -EINVAL;
> > +
> > +	if (val && mdev) {
> > +		struct intel_vgpu *vgpu =3D (struct intel_vgpu *)
> > +			mdev_get_drvdata(mdev);
> > +		struct intel_vgpu_type *type =3D vgpu->type;
> > +
> > +		mutex_lock(&vgpu->vgpu_lock);
> > +		if (vgpu->active) {
> > +			mutex_unlock(&vgpu->vgpu_lock);
> > +			goto out;
> > +		}
> > +		if (type->aggregation && val <=3D type->avail_instance) {
> > +			/* check val against maxium aggregation instance
> > number */
> > +			/* set vgpu's aggregation parameter as val */
> > +			vgpu->param.aggregation =3D val;
> > +			mutex_unlock(&vgpu->vgpu_lock);
> > +			return count;
> > +		}
> > +		mutex_unlock(&vgpu->vgpu_lock);
> > +	}
> > +out:
> > +	return -EINVAL;
> > +}
> > +static DEVICE_ATTR_RW(aggregation);
> > +
> > +static ssize_t
> > +aggregated_instances_show(struct device *dev, struct device_attribute =
*attr,
> > +		 char *buf)
> > +{
> > +	struct mdev_device *mdev =3D mdev_from_dev(dev);
> > +
> > +	if (mdev) {
> > +		struct intel_vgpu *vgpu =3D (struct intel_vgpu *)
> > +			mdev_get_drvdata(mdev);
> > +		struct intel_vgpu_type *type =3D vgpu->type;
> > +		if (type->aggregation)
> > +			return sprintf(buf, "%u\n", vgpu->param.aggregation);
> > +	}
> > +	return sprintf(buf, "0\n");
> > +}
> > +static DEVICE_ATTR_RO(aggregated_instances);
> > +
> > +static struct attribute *mdev_attrs[] =3D {
> > +	&dev_attr_aggregation.attr,
> > +	&dev_attr_aggregated_instances.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group mdev_group =3D {
> > +	.name =3D "mdev",
> > +	.attrs =3D mdev_attrs,
> > +};
> > +
> >  static const struct attribute_group *intel_vgpu_groups[] =3D {
> >  	&intel_vgpu_group,
> > +	&mdev_group,
> >  	NULL,
> >  };
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt=
/vgpu.c
> > index 1e0865905136..6a9ad7ec3dd8 100644
> > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > @@ -88,12 +88,13 @@ static struct {
> >  	unsigned int weight;
> >  	enum intel_vgpu_edid edid;
> >  	char *name;
> > +	bool aggregation;
> >  } vgpu_types[] =3D {
> >  /* Fixed vGPU type table */
> > -	{ MB_TO_BYTES(64), MB_TO_BYTES(384), 4, VGPU_WEIGHT(8),
> > GVT_EDID_1024_768, "8" },
> > -	{ MB_TO_BYTES(128), MB_TO_BYTES(512), 4, VGPU_WEIGHT(4),
> > GVT_EDID_1920_1200, "4" },
> > -	{ MB_TO_BYTES(256), MB_TO_BYTES(1024), 4, VGPU_WEIGHT(2),
> > GVT_EDID_1920_1200, "2" },
> > -	{ MB_TO_BYTES(512), MB_TO_BYTES(2048), 4, VGPU_WEIGHT(1),
> > GVT_EDID_1920_1200, "1" },
> > +	{ MB_TO_BYTES(64), MB_TO_BYTES(384), 4, VGPU_WEIGHT(8),
> > GVT_EDID_1024_768, "8", true },
> > +	{ MB_TO_BYTES(128), MB_TO_BYTES(512), 4, VGPU_WEIGHT(4),
> > GVT_EDID_1920_1200, "4", false },
> > +	{ MB_TO_BYTES(256), MB_TO_BYTES(1024), 4, VGPU_WEIGHT(2),
> > GVT_EDID_1920_1200, "2", false },
> > +	{ MB_TO_BYTES(512), MB_TO_BYTES(2048), 4, VGPU_WEIGHT(1),
> > +GVT_EDID_1920_1200, "1", false },
> >  };
> >=20
> >  /**
> > @@ -147,6 +148,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
> >  		gvt->types[i].resolution =3D vgpu_types[i].edid;
> >  		gvt->types[i].avail_instance =3D min(low_avail /
> > vgpu_types[i].low_mm,
> >  						   high_avail /
> > vgpu_types[i].high_mm);
> > +		gvt->types[i].aggregation =3D vgpu_types[i].aggregation;
> >=20
> >  		if (IS_GEN(gvt->dev_priv, 8))
> >  			sprintf(gvt->types[i].name, "GVTg_V4_%s", @@ -212,9
> > +214,7 @@ static void intel_gvt_update_vgpu_types(struct intel_gvt *gvt)
> >   */
> >  void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)  {
> > -	mutex_lock(&vgpu->vgpu_lock);
> >  	vgpu->active =3D true;
> > -	mutex_unlock(&vgpu->vgpu_lock);
> >  }
> >=20
> >  /**
> > @@ -258,6 +258,8 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
> >  	mutex_lock(&vgpu->vgpu_lock);
> >  	intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
> >  	intel_vgpu_dmabuf_cleanup(vgpu);
> > +	if (vgpu->type->aggregation)
> > +		intel_vgpu_res_free(vgpu);
> >  	mutex_unlock(&vgpu->vgpu_lock);
> >  }
> >=20
> > @@ -356,59 +358,77 @@ void intel_gvt_destroy_idle_vgpu(struct intel_vgpu
> > *vgpu)
> >  	vfree(vgpu);
> >  }
> >=20
> > -static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gv=
t,
> > -		struct intel_vgpu_creation_params *param)
> > +int intel_vgpu_res_alloc(struct intel_vgpu *vgpu)
> >  {
> > -	struct intel_vgpu *vgpu;
> >  	int ret;
> > +
> > +	ret =3D intel_vgpu_alloc_resource(vgpu);
> > +	if (ret)
> > +		return ret;
> >=20
> > -	gvt_dbg_core("handle %llu low %llu MB high %llu MB fence %llu\n",
> > -			param->handle, param->low_gm_sz, param-
> > >high_gm_sz,
> > -			param->fence_sz);
> > +	populate_pvinfo_page(vgpu);
> >=20
> > -	vgpu =3D vzalloc(sizeof(*vgpu));
> > -	if (!vgpu)
> > -		return ERR_PTR(-ENOMEM);
> > +	ret =3D intel_vgpu_init_gtt(vgpu);
> > +	if (ret) {
> > +		intel_vgpu_free_resource(vgpu);
> > +		return ret;
> > +	}
> > +	/* calculate left instance change for types */
> > +	mutex_lock(&vgpu->gvt->lock);
> > +	intel_gvt_update_vgpu_types(vgpu->gvt);
> > +	mutex_unlock(&vgpu->gvt->lock);
> > +	return 0;
> > +}
> > +
> > +void intel_vgpu_res_free(struct intel_vgpu *vgpu) {
> > +	intel_vgpu_clean_gtt(vgpu);
> > +	intel_vgpu_free_resource(vgpu);
> > +	mutex_lock(&vgpu->gvt->lock);
> > +	intel_gvt_update_vgpu_types(vgpu->gvt);
> > +	mutex_unlock(&vgpu->gvt->lock);
> > +}
> > +
> > +static int
> > +__intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
> > +			bool delay_res_alloc)
> > +{
> > +	struct intel_gvt *gvt =3D vgpu->gvt;
> > +	int ret;
> >=20
> >  	ret =3D idr_alloc(&gvt->vgpu_idr, vgpu, IDLE_VGPU_IDR + 1,
> > GVT_MAX_VGPU,
> > -		GFP_KERNEL);
> > +			GFP_KERNEL);
> >  	if (ret < 0)
> > -		goto out_free_vgpu;
> > -
> > +		return ret;
> >  	vgpu->id =3D ret;
> > -	vgpu->handle =3D param->handle;
> > -	vgpu->gvt =3D gvt;
> > -	vgpu->sched_ctl.weight =3D param->weight;
> > +
> >  	mutex_init(&vgpu->vgpu_lock);
> >  	mutex_init(&vgpu->dmabuf_lock);
> >  	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
> >  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
> >  	idr_init(&vgpu->object_idr);
> > -	intel_vgpu_init_cfg_space(vgpu, param->primary);
> > +
> > +	intel_vgpu_init_cfg_space(vgpu, vgpu->param.primary);
> >=20
> >  	ret =3D intel_vgpu_init_mmio(vgpu);
> >  	if (ret)
> >  		goto out_clean_idr;
> >=20
> > -	ret =3D intel_vgpu_alloc_resource(vgpu, param);
> > -	if (ret)
> > -		goto out_clean_vgpu_mmio;
> > -
> > -	populate_pvinfo_page(vgpu);
> > +	if (!delay_res_alloc) {
> > +		ret =3D intel_vgpu_res_alloc(vgpu);
> > +		if (ret)
> > +			goto out_clean_vgpu_mmio;
> > +	}
> >=20
> >  	ret =3D intel_gvt_hypervisor_attach_vgpu(vgpu);
> >  	if (ret)
> >  		goto out_clean_vgpu_resource;
> >=20
> > -	ret =3D intel_vgpu_init_gtt(vgpu);
> > -	if (ret)
> > -		goto out_detach_hypervisor_vgpu;
> > -
> >  	ret =3D intel_vgpu_init_opregion(vgpu);
> >  	if (ret)
> > -		goto out_clean_gtt;
> > +		goto out_detach_hypervisor_vgpu;
> >=20
> > -	ret =3D intel_vgpu_init_display(vgpu, param->resolution);
> > +	ret =3D intel_vgpu_init_display(vgpu, vgpu->param.resolution);
> >  	if (ret)
> >  		goto out_clean_opregion;
> >=20
> > @@ -430,7 +450,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(s=
truct
> > intel_gvt *gvt,
> >  	if (ret)
> >  		goto out_clean_sched_policy;
> >=20
> > -	return vgpu;
> > +	return 0;
> >=20
> >  out_clean_sched_policy:
> >  	intel_vgpu_clean_sched_policy(vgpu);
> > @@ -440,19 +460,17 @@ static struct intel_vgpu
> > *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
> >  	intel_vgpu_clean_display(vgpu);
> >  out_clean_opregion:
> >  	intel_vgpu_clean_opregion(vgpu);
> > -out_clean_gtt:
> > -	intel_vgpu_clean_gtt(vgpu);
> >  out_detach_hypervisor_vgpu:
> >  	intel_gvt_hypervisor_detach_vgpu(vgpu);
> >  out_clean_vgpu_resource:
> > +	intel_vgpu_clean_gtt(vgpu);
> >  	intel_vgpu_free_resource(vgpu);
> > +	intel_gvt_update_vgpu_types(vgpu->gvt);
> >  out_clean_vgpu_mmio:
> >  	intel_vgpu_clean_mmio(vgpu);
> >  out_clean_idr:
> >  	idr_remove(&gvt->vgpu_idr, vgpu->id);
> > -out_free_vgpu:
> > -	vfree(vgpu);
> > -	return ERR_PTR(ret);
> > +	return ret;
> >  }
> >=20
> >  /**
> > @@ -466,30 +484,43 @@ static struct intel_vgpu
> > *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
> >   * pointer to intel_vgpu, error pointer if failed.
> >   */
> >  struct intel_vgpu *intel_gvt_create_vgpu(struct intel_gvt *gvt,
> > -				struct intel_vgpu_type *type)
> > +					 struct intel_vgpu_type *type)
> >  {
> > -	struct intel_vgpu_creation_params param;
> >  	struct intel_vgpu *vgpu;
> > +	struct intel_vgpu_creation_params *param;
> > +	int ret;
> >=20
> > -	param.handle =3D 0;
> > -	param.primary =3D 1;
> > -	param.low_gm_sz =3D type->low_gm_size;
> > -	param.high_gm_sz =3D type->high_gm_size;
> > -	param.fence_sz =3D type->fence;
> > -	param.weight =3D type->weight;
> > -	param.resolution =3D type->resolution;
> > +	vgpu =3D vzalloc(sizeof(*vgpu));
> > +	if (!vgpu)
> > +		return ERR_PTR(-ENOMEM);
> >=20
> > -	/* XXX current param based on MB */
> > -	param.low_gm_sz =3D BYTES_TO_MB(param.low_gm_sz);
> > -	param.high_gm_sz =3D BYTES_TO_MB(param.high_gm_sz);
> > +	param =3D &vgpu->param;
> > +	param->handle =3D 0;
> > +	param->primary =3D 1;
> > +	param->low_gm_sz =3D type->low_gm_size;
> > +	param->high_gm_sz =3D type->high_gm_size;
> > +	param->fence_sz =3D type->fence;
> > +	param->weight =3D type->weight;
> > +	param->resolution =3D type->resolution;
> >=20
> > +	gvt_dbg_core("handle %llu low %llu MB high %llu MB fence %llu\n",
> > +		     param->handle, BYTES_TO_MB(param->low_gm_sz),
> > +		     BYTES_TO_MB(param->high_gm_sz),
> > +		     param->fence_sz);
> > +
> > +	vgpu->handle =3D param->handle;
> > +	vgpu->gvt =3D gvt;
> > +	vgpu->sched_ctl.weight =3D param->weight;
> > +	param->aggregation =3D 1;
> > +
> >  	mutex_lock(&gvt->lock);
> > -	vgpu =3D __intel_gvt_create_vgpu(gvt, &param);
> > -	if (!IS_ERR(vgpu))
> > -		/* calculate left instance change for types */
> > -		intel_gvt_update_vgpu_types(gvt);
> > +	ret =3D __intel_gvt_create_vgpu(vgpu, type->aggregation ? true : fals=
e);
> >  	mutex_unlock(&gvt->lock);
> >=20
> > +	if (ret) {
> > +		vfree(vgpu);
> > +		return ERR_PTR(ret);
> > +	}
> >  	return vgpu;
> >  }
> >=20
> > --
> > 2.24.0
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--9aSJXjR17r53A+a+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXejEFwAKCRCxBBozTXgY
J34EAJ46uzj7aLkrV3KRd/YKKxyRhI1XdgCfQKaE19TsDw8+DkLbCKavqmiW2Bw=
=y03b
-----END PGP SIGNATURE-----

--9aSJXjR17r53A+a+--

--===============1918768670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1918768670==--
