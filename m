Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431543D3616
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Jul 2021 10:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6856F4E8;
	Fri, 23 Jul 2021 08:05:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7660B6F4DE;
 Fri, 23 Jul 2021 08:05:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6E28D67373; Fri, 23 Jul 2021 10:05:43 +0200 (CEST)
Date: Fri, 23 Jul 2021 10:05:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210723080543.GD2795@lst.de>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <9-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
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

On Tue, Jul 20, 2021 at 02:42:55PM -0300, Jason Gunthorpe wrote:
> Keep track of all the vfio_devices that have been added to the device set
> and use this list in vfio_pci_try_bus_reset() instead of trying to work
> backwards from the pci_device.
> 
> The dev_set->lock directly prevents devices from joining/leaving the set,
> which further implies the pci_device cannot change drivers or that the
> vfio_device be freed, eliminating the need for get/put's.
> 
> Completeness of the device set can be directly measured by checking if
> every PCI device in the reset group is also in the device set - which
> proves that VFIO drivers are attached to everything.
> 
> This restructuring corrects a call to pci_dev_driver() without holding the
> device_lock() and removes a hard wiring to &vfio_pci_driver.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

I think the addition of the list to the dev_set should be a different
patch.  Or maybe even go into the one adding the dev_set concept.

> +static int vfio_pci_check_all_devices_bound(struct pci_dev *pdev, void *data)
>  {
> +	struct vfio_device_set *dev_set = data;
> +	struct vfio_device *cur;
>  
> +	lockdep_assert_held(&dev_set->lock);
>  
> +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> +		if (cur->dev == &pdev->dev)
> +			return 0;
> +	return -EBUSY;

I don't understand this logic.  If there is any device in the set that
does now have the same struct device we're in trouble?  Please clearly
document what this is trying to do.  If the bound in the name makes sense
you probably want to check the driver instead.

>  static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
>  {
> +	/* All VFIO devices have a closed FD */
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +		if (cur->vdev.open_count)
> +			return;
> +
> +	/* All devices in the group to be reset need VFIO devices */
> +	if (vfio_pci_for_each_slot_or_bus(
> +		    vdev->pdev, vfio_pci_check_all_devices_bound, dev_set,
> +		    !pci_probe_reset_slot(vdev->pdev->slot)))
> +		return;
>  
>  	/* Does at least one need a reset? */

These checks look a little strange, and the comments don't make much
sense.  What about an incremental patch like this?

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index fbc20f6d2dd412..d8375a5e77e07c 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -2188,10 +2188,34 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
 	return 0;
 }
 
+static struct pci_dev *vfio_pci_reset_target(struct vfio_pci_device *vdev)
+{
+	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
+	struct vfio_pci_device *cur;
+
+	/* none of the device is allowed to be currently open: */
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
+		if (cur->vdev.open_count)
+			return NULL;
+
+	/* all devices in the group to be reset need to be VFIO devices: */
+	if (vfio_pci_for_each_slot_or_bus(vdev->pdev,
+			vfio_pci_check_all_devices_bound, dev_set,
+			!pci_probe_reset_slot(vdev->pdev->slot)))
+		return NULL;
+
+	/* Does at least one need a reset? */
+	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
+		if (cur->needs_reset)
+			return cur->pdev;
+
+	return NULL;
+}
+
 /*
  * If a bus or slot reset is available for the provided device and:
  *  - All of the devices affected by that bus or slot reset are unused
- *    (!refcnt)
+ *    (!open_count)
  *  - At least one of the affected devices is marked dirty via
  *    needs_reset (such as by lack of FLR support)
  * Then attempt to perform that bus or slot reset.  Callers are required
@@ -2206,8 +2230,8 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
 static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
 {
 	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
-	struct vfio_pci_device *to_reset = NULL;
 	struct vfio_pci_device *cur;
+	struct pci_dev *to_reset;
 	int ret;
 
 	if (pci_probe_reset_slot(vdev->pdev->slot) &&
@@ -2216,35 +2240,18 @@ static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
 
 	lockdep_assert_held(&vdev->vdev.dev_set->lock);
 
-	/* All VFIO devices have a closed FD */
-	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
-		if (cur->vdev.open_count)
-			return;
-
-	/* All devices in the group to be reset need VFIO devices */
-	if (vfio_pci_for_each_slot_or_bus(
-		    vdev->pdev, vfio_pci_check_all_devices_bound, dev_set,
-		    !pci_probe_reset_slot(vdev->pdev->slot)))
-		return;
-
-	/* Does at least one need a reset? */
-	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
-		if (cur->needs_reset) {
-			to_reset = cur;
-			break;
-		}
-	}
+	to_reset = vfio_pci_reset_target(vdev);
 	if (!to_reset)
 		return;
 
-	ret = pci_reset_bus(to_reset->pdev);
+	ret = pci_reset_bus(to_reset);
 	if (ret)
 		return;
 
 	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
 		cur->needs_reset = false;
 
-		if (cur != to_reset && !disable_idle_d3)
+		if (cur->pdev != to_reset && !disable_idle_d3)
 			vfio_pci_set_power_state(cur, PCI_D3hot);
 	}
 }
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
