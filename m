Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6C5B0D3D
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Sep 2022 21:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B39010E855;
	Wed,  7 Sep 2022 19:28:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D256D10E856
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Sep 2022 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662578903;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBXIkDCgr9tveKGOP57d5T+YWqaUGeZBXBsyqXeReO8=;
 b=Woo8Y7VGlBTWHNVCYXwptyQKIuAOk4VsobQ9Z5P2pgRiNwISgWgB7tSI9P7lmRcw0bEJuC
 IxPwQQLNVVkEXIObh6cswW3vtypVM+L71ts+V/AmbG1hTMm0SWwSI43V7unu3WqeH+/Acl
 5ZaK3oMv/B9cDjo3G7CnznEnp8yLUes=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-wqIhHmtqONGbdhessJjgpA-1; Wed, 07 Sep 2022 15:28:22 -0400
X-MC-Unique: wqIhHmtqONGbdhessJjgpA-1
Received: by mail-wm1-f72.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so10658789wmc.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 07 Sep 2022 12:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=BBXIkDCgr9tveKGOP57d5T+YWqaUGeZBXBsyqXeReO8=;
 b=j3+HGfwysXF/dIC/ShIjk78qgYqhWeDLtKJNdp1+6vaqBFRz7GUhaRFHdVFyTJ1kdj
 VAITggFaYQGLpTP1nAVjn/LouOMoYna/3v7cskHS7bMnEuLaseCTWdrFlFuc6QYMiuEE
 r46KhBH9BGFqbbgJ+xQEMsDoyBGxyRvDdO39bLbRZIT6gpvLOf9pcg5b0BIKwaOgApYk
 a2N6m6+dDs+LEBROTf1Nfq8IZK3jZ8rkIitspMTyUfDAHGdZT14ewn0eL7CkRZ9nAz6P
 8Hx9Ftt/UqGiLnuw+RCdrZajptQpLpXDq8NPUf4vLPtcrdgoJG1G4uLg7WZj7eClNOxa
 ezvQ==
X-Gm-Message-State: ACgBeo0CJ0TEjLwwY8bLIVTobif+f36x4mbRsGaur7ichqJeEUNTvFrG
 jHAwqu+1Sgeqfftwf60VeMld8nm4XIPkKx+fzKlko/SBeYLPlD5qAhBWgeEkmnsAFeqPg2A+9eO
 ayuvv34IzY1qoKFZuyzmqxherilwOCjRkBA==
X-Received: by 2002:a7b:ce13:0:b0:3a6:34f8:e21d with SMTP id
 m19-20020a7bce13000000b003a634f8e21dmr25276wmc.22.1662578901643; 
 Wed, 07 Sep 2022 12:28:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR40op3Tb7VUHNm5ZEjvT5SgX2jUs1lQ+XehSdFoH4BccQAcPslw4EAOIbaLky7J3CiIlPkORQ==
X-Received: by 2002:a7b:ce13:0:b0:3a6:34f8:e21d with SMTP id
 m19-20020a7bce13000000b003a634f8e21dmr25234wmc.22.1662578901257; 
 Wed, 07 Sep 2022 12:28:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b00228db6b9406sm9318214wrx.45.2022.09.07.12.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 12:28:19 -0700 (PDT)
Message-ID: <90862543-9343-7389-a1ff-be9a011be64e@redhat.com>
Date: Wed, 7 Sep 2022 21:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
To: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220901143747.32858-2-kevin.tian@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Reply-To: eric.auger@redhat.com
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Kevin,
On 9/1/22 16:37, Kevin Tian wrote:
> The idea is to let vfio core manage the vfio_device life cycle instead
> of duplicating the logic cross drivers. This is also a preparatory
> step for adding struct device into vfio_device.
>
> New pair of helpers together with a kref in vfio_device:
>
>  - vfio_alloc_device()
>  - vfio_put_device()
>
> Drivers can register @init/@release callbacks to manage any priviate
private
> state wrapping the vfio_device.
>
> However vfio-ccw doesn't fit this model due to a life cycle mess
> that its private structure mixes both parent and mdev info hence must
> be allocated/freed outside of the life cycle of vfio device.
>
> Per prior discussions this won't be fixed in short term by IBM folks.
>
> Instead of waiting introduce another helper vfio_init_device() so ccw
s/waiting/waiting for those modifications,
> can call it to initialize a pre-allocated vfio_device.
>
> Further implication of the ccw trick is that vfio_device cannot be
> freed uniformly in vfio core. Instead, require *EVERY* driver to
> implement @release and free vfio_device inside. Then ccw can choose
> to delay the free at its own discretion.
>
> Another trick down the road is that kvzalloc() is used to accommodate
> the need of gvt which uses vzalloc() while all others use kzalloc().
> So drivers should call a helper vfio_free_device() to free the
> vfio_device instead of assuming that kfree() or vfree() is appliable.
>
> Later once the ccw mess is fixed we can remove those tricks and
> fully handle structure alloc/free in vfio core.
>
> Existing vfio_{un}init_group_dev() will be deprecated after all
> existing usages are converted to the new model.
>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Co-developed-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/vfio_main.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/vfio.h     | 25 ++++++++++-
>  2 files changed, 116 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 7cb56c382c97..c9d982131265 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -496,6 +496,98 @@ void vfio_uninit_group_dev(struct vfio_device *device)
>  }
>  EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
>  
> +/* Release helper called by vfio_put_device() */
> +void vfio_device_release(struct kref *kref)
> +{
> +	struct vfio_device *device =
> +			container_of(kref, struct vfio_device, kref);
> +
> +	vfio_uninit_group_dev(device);
> +
> +	/*
> +	 * kvfree() cannot be done here due to a life cycle mess in
> +	 * vfio-ccw. Before the ccw part is fixed all drivers are
> +	 * required to support @release and call vfio_free_device()
> +	 * from there.
> +	 */
> +	device->ops->release(device);
> +}
> +EXPORT_SYMBOL_GPL(vfio_device_release);
> +
> +/*
> + * Alloc and initialize vfio_device so it can be registered to vfio
> + * core.
> + *
> + * Drivers should use the wrapper vfio_alloc_device() for allocation.
> + * @size is the size of the structure to be allocated, including any
> + * private data used by the driver.
> + *
> + * Driver may provide an @init callback to cover device private data.
nit: this comment may rather relate to the vfio_init_device function
> + *
> + * Use vfio_put_device() to release the structure after success return.
> + */
> +struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
> +				       const struct vfio_device_ops *ops)
> +{
> +	struct vfio_device *device;
> +	int ret;
> +
> +	if (WARN_ON(size < sizeof(struct vfio_device)))
> +		return ERR_PTR(-EINVAL);
> +
> +	device = kvzalloc(size, GFP_KERNEL);
> +	if (!device)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = vfio_init_device(device, dev, ops);
> +	if (ret)
> +		goto out_free;
> +	return device;
> +
> +out_free:
> +	kvfree(device);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(_vfio_alloc_device);
> +
> +/*
> + * Initialize a vfio_device so it can be registered to vfio core.
> + *
> + * Only vfio-ccw driver should call this interface.
> + */
> +int vfio_init_device(struct vfio_device *device, struct device *dev,
> +		     const struct vfio_device_ops *ops)
> +{
> +	int ret;
> +
> +	vfio_init_group_dev(device, dev, ops);
> +
> +	if (ops->init) {
> +		ret = ops->init(device);
> +		if (ret)
> +			goto out_uninit;
> +	}
> +
> +	kref_init(&device->kref);
> +	return 0;
> +
> +out_uninit:
> +	vfio_uninit_group_dev(device);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vfio_init_device);
> +
> +/*
> + * The helper called by driver @release callback to free the device
> + * structure. Drivers which don't have private data to clean can
> + * simply use this helper as its @release.
> + */
> +void vfio_free_device(struct vfio_device *device)
> +{
> +	kvfree(device);
> +}
> +EXPORT_SYMBOL_GPL(vfio_free_device);
> +
>  static struct vfio_group *vfio_noiommu_group_alloc(struct device *dev,
>  		enum vfio_group_type type)
>  {
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e05ddc6fe6a5..e1e9e8352903 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -45,7 +45,8 @@ struct vfio_device {
>  	struct kvm *kvm;
>  
>  	/* Members below here are private, not for driver use */
> -	refcount_t refcount;
> +	struct kref kref;	/* object life cycle */
> +	refcount_t refcount;	/* user count on registered device*/
>  	unsigned int open_count;
>  	struct completion comp;
>  	struct list_head group_next;
> @@ -55,6 +56,8 @@ struct vfio_device {
>  /**
>   * struct vfio_device_ops - VFIO bus driver device callbacks
>   *
> + * @init: initialize private fields in device structure
> + * @release: Reclaim private fields in device structure
>   * @open_device: Called when the first file descriptor is opened for this device
>   * @close_device: Opposite of open_device
>   * @read: Perform read(2) on device file descriptor
> @@ -72,6 +75,8 @@ struct vfio_device {
>   */
>  struct vfio_device_ops {
>  	char	*name;
> +	int	(*init)(struct vfio_device *vdev);
> +	void	(*release)(struct vfio_device *vdev);
>  	int	(*open_device)(struct vfio_device *vdev);
>  	void	(*close_device)(struct vfio_device *vdev);
>  	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
> @@ -137,6 +142,24 @@ static inline int vfio_check_feature(u32 flags, size_t argsz, u32 supported_ops,
>  	return 1;
>  }
>  
> +struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
> +				       const struct vfio_device_ops *ops);
> +#define vfio_alloc_device(dev_struct, member, dev, ops)				\
> +	container_of(_vfio_alloc_device(sizeof(struct dev_struct) +		\
> +					BUILD_BUG_ON_ZERO(offsetof(		\
> +						struct dev_struct, member)),	\
> +					dev, ops),				\
> +		     struct dev_struct, member)
> +
> +int vfio_init_device(struct vfio_device *device, struct device *dev,
> +		     const struct vfio_device_ops *ops);
> +void vfio_free_device(struct vfio_device *device);
> +void vfio_device_release(struct kref *kref);
> +static inline void vfio_put_device(struct vfio_device *device)
> +{
> +	kref_put(&device->kref, vfio_device_release);
> +}
> +
>  void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
>  			 const struct vfio_device_ops *ops);
>  void vfio_uninit_group_dev(struct vfio_device *device);
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

