Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B33D35AA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Jul 2021 09:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3C96E926;
	Fri, 23 Jul 2021 07:47:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074C6E3B7;
 Fri, 23 Jul 2021 07:47:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5CF0167373; Fri, 23 Jul 2021 09:47:49 +0200 (CEST)
Date: Fri, 23 Jul 2021 09:47:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 08/14] vfio/pci: Move to the device set infrastructure
Message-ID: <20210723074749.GC2795@lst.de>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <8-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 02:42:54PM -0300, Jason Gunthorpe wrote:
> From: Yishai Hadas <yishaih@nvidia.com>
> 
> PCI wants to have the usual open/close_device() logic with the slight
> twist that the open/close_device() must be done under a singelton lock
> shared by all of the vfio_devices that are in the PCI "reset group".
> 
> The reset group, and thus the device set, is determined by what devices
> pci_reset_bus() touches, which is either the entire bus or only the slot.
> 
> Rely on the core code to do everything reflck was doing and delete reflck
> entirely.
> 
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci.c         | 156 ++++++----------------------
>  drivers/vfio/pci/vfio_pci_private.h |   7 --
>  2 files changed, 31 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index fab3715d60d4ba..22774e447b5f4a 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -530,53 +530,40 @@ static void vfio_pci_vf_token_user_add(struct vfio_pci_device *vdev, int val)
>  	vfio_device_put(&pf_vdev->vdev);
>  }
>  
> -static void vfio_pci_release(struct vfio_device *core_vdev)
> +static void vfio_pci_close_device(struct vfio_device *core_vdev)
>  {
>  	struct vfio_pci_device *vdev =
>  		container_of(core_vdev, struct vfio_pci_device, vdev);
>  
> -	mutex_lock(&vdev->reflck->lock);
> -
> -	if (!(--vdev->refcnt)) {
> -		vfio_pci_vf_token_user_add(vdev, -1);
> -		vfio_spapr_pci_eeh_release(vdev->pdev);
> -		vfio_pci_disable(vdev);
> +	vfio_pci_vf_token_user_add(vdev, -1);
> +	vfio_spapr_pci_eeh_release(vdev->pdev);
> +	vfio_pci_disable(vdev);
>  
> -		mutex_lock(&vdev->igate);
> -		if (vdev->err_trigger) {
> -			eventfd_ctx_put(vdev->err_trigger);
> -			vdev->err_trigger = NULL;
> -		}
> -		if (vdev->req_trigger) {
> -			eventfd_ctx_put(vdev->req_trigger);
> -			vdev->req_trigger = NULL;
> -		}
> -		mutex_unlock(&vdev->igate);
> +	mutex_lock(&vdev->igate);
> +	if (vdev->err_trigger) {
> +		eventfd_ctx_put(vdev->err_trigger);
> +		vdev->err_trigger = NULL;
>  	}
> -
> -	mutex_unlock(&vdev->reflck->lock);
> +	if (vdev->req_trigger) {
> +		eventfd_ctx_put(vdev->req_trigger);
> +		vdev->req_trigger = NULL;
> +	}
> +	mutex_unlock(&vdev->igate);
>  }
>  
> -static int vfio_pci_open(struct vfio_device *core_vdev)
> +static int vfio_pci_open_device(struct vfio_device *core_vdev)
>  {
>  	struct vfio_pci_device *vdev =
>  		container_of(core_vdev, struct vfio_pci_device, vdev);
>  	int ret = 0;
>  
> -	mutex_lock(&vdev->reflck->lock);
> -
> -	if (!vdev->refcnt) {
> -		ret = vfio_pci_enable(vdev);
> -		if (ret)
> -			goto error;
> +	ret = vfio_pci_enable(vdev);
> +	if (ret)
> +		return ret;
>  
> -		vfio_spapr_pci_eeh_open(vdev->pdev);
> -		vfio_pci_vf_token_user_add(vdev, 1);
> -	}
> -	vdev->refcnt++;
> -error:
> -	mutex_unlock(&vdev->reflck->lock);
> -	return ret;
> +	vfio_spapr_pci_eeh_open(vdev->pdev);
> +	vfio_pci_vf_token_user_add(vdev, 1);
> +	return 0;
>  }
>  
>  static int vfio_pci_get_irq_count(struct vfio_pci_device *vdev, int irq_type)
> @@ -1870,8 +1857,8 @@ static int vfio_pci_match(struct vfio_device *core_vdev, char *buf)
>  
>  static const struct vfio_device_ops vfio_pci_ops = {
>  	.name		= "vfio-pci",
> -	.open		= vfio_pci_open,
> -	.release	= vfio_pci_release,
> +	.open_device	= vfio_pci_open_device,
> +	.close_device	= vfio_pci_close_device,
>  	.ioctl		= vfio_pci_ioctl,
>  	.read		= vfio_pci_read,
>  	.write		= vfio_pci_write,
> @@ -1880,9 +1867,6 @@ static const struct vfio_device_ops vfio_pci_ops = {
>  	.match		= vfio_pci_match,
>  };
>  
> -static int vfio_pci_reflck_attach(struct vfio_pci_device *vdev);
> -static void vfio_pci_reflck_put(struct vfio_pci_reflck *reflck);
> -
>  static int vfio_pci_bus_notifier(struct notifier_block *nb,
>  				 unsigned long action, void *data)
>  {
> @@ -2020,12 +2004,17 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	INIT_LIST_HEAD(&vdev->vma_list);
>  	init_rwsem(&vdev->memory_lock);
>  
> -	ret = vfio_pci_reflck_attach(vdev);
> +	if (pci_is_root_bus(pdev->bus))
> +		ret = vfio_assign_device_set(&vdev->vdev, vdev);
> +	else if (!pci_probe_reset_slot(pdev->slot))
> +		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);
> +	else
> +		ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);

Maybe invert this and add a comment:

	if (pci_is_root_bus(pdev->bus))
		ret = vfio_assign_device_set(&vdev->vdev, vdev);
	/*
	 * If there is no slot reset support for this device, the whole
	 * bus needs to be grouped together to support bus-wide resets.
	 */
	else if (pci_probe_reset_slot(pdev->slot) < 0)
		ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);
	else
		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
