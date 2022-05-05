Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0D51C89D
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 May 2022 21:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9365F10E252;
	Thu,  5 May 2022 19:02:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 19:02:25 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E673710E252
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 May 2022 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651777344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f18f3HFDzcWcpCnJEAghZSsw8ma5U8xDHMSYzQxl1Kw=;
 b=bhLJO9WJKFPJ5BJvl8TaE9og71b7ZgnosKAfS1p1vmn/vxoDknpFLXkgz4Ka4NDWlx7WQc
 Ve5tzTgB2rTMj+n9SXFeeAOp8nE+KqtZYOKg2Cl7ulNYV1vfYixxdbDtSeSPNZ0chC5ASZ
 JahSY2Pz7nBqDo9trQKJZh5+3edv3Yg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-IQYaHoQlMSK_sTJ9C6ISLA-1; Thu, 05 May 2022 14:56:17 -0400
X-MC-Unique: IQYaHoQlMSK_sTJ9C6ISLA-1
Received: by mail-io1-f71.google.com with SMTP id
 o4-20020a0566022e0400b0065ab2047d69so1515406iow.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 May 2022 11:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=f18f3HFDzcWcpCnJEAghZSsw8ma5U8xDHMSYzQxl1Kw=;
 b=BXQkOAypJW5z8X2H8K3w/Fk014bouPAa+Qec7wsNebHXBdqVuYSaR3T3CKkrQw3059
 5hsT/uF4rlj1R3u5pz9+2it4DoiFF53B+bZIfluWccMGpoSLZfgQP7YbpqUJFybjhPNS
 Rqxf5UPMotY7XtasuLWg7fLQhax+du8nYOGJ1XdOECF+3JYwQn5W+4b1+PfPQKoQnOL5
 g9y9cSmEI7g68F2O5K6C1venj1aJon3bnF1m2Xl2dLOmwKwui62ozjhYufwutl13HQTH
 UUGO1mcOADn8w7/IbkZEyd5c3eKZFEQYCerKIrAcy4dlZqd7eVQaStvPu4O72HkydNAj
 lEhQ==
X-Gm-Message-State: AOAM532LU444yT7Nxbo55ZvwB5MAB8B3bPYwOr37sMz9uhvEJfLiIXgY
 lHWmJ77KaKpXM7BPAAKk0jQONblrRVKX0+qfUZmi9s00fW1753cGdGKyQJHNDmZbnyY6hTUjn8r
 7tPJ5bFmFcI8o1AKtamO4TWnV1iRzHhEXhw==
X-Received: by 2002:a05:6e02:101:b0:2ca:c6d7:b077 with SMTP id
 t1-20020a056e02010100b002cac6d7b077mr11076517ilm.306.1651776976243; 
 Thu, 05 May 2022 11:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHFbJ0nCKsQ0bBlR27/4L6UbMkIWyWen+MSEs+NIpdNuI/bZ/K9W8lim3i/GNxpjm4hIKzqw==
X-Received: by 2002:a05:6e02:101:b0:2ca:c6d7:b077 with SMTP id
 t1-20020a056e02010100b002cac6d7b077mr11076495ilm.306.1651776975845; 
 Thu, 05 May 2022 11:56:15 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f7-20020a926a07000000b002cde6e352f2sm621896ilc.60.2022.05.05.11.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:56:15 -0700 (PDT)
Date: Thu, 5 May 2022 12:56:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 0/7] Make the rest of the VFIO driver interface use
 vfio_device
Message-ID: <20220505125614.0f927782.alex.williamson@redhat.com>
In-Reply-To: <20220504174926.GA88353@nvidia.com>
References: <0-v3-e131a9b6b467+14b6-vfio_mdev_no_group_jgg@nvidia.com>
 <20220504174926.GA88353@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
 "Jason J. Herne" <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, "Tian, Kevin" <kevin.tian@intel.com>,
 zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 4 May 2022 14:49:26 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, May 02, 2022 at 02:31:30PM -0300, Jason Gunthorpe wrote:
> > Prior series have transformed other parts of VFIO from working on struct
> > device or struct vfio_group into working directly on struct
> > vfio_device. Based on that work we now have vfio_device's readily
> > available in all the drivers.
> > 
> > Update the rest of the driver facing API to use vfio_device as an input.
> > 
> > The following are switched from struct device to struct vfio_device:
> >   vfio_register_notifier()
> >   vfio_unregister_notifier()
> >   vfio_pin_pages()
> >   vfio_unpin_pages()
> >   vfio_dma_rw()
> > 
> > The following group APIs are obsoleted and removed by just using struct
> > vfio_device with the above:
> >   vfio_group_pin_pages()
> >   vfio_group_unpin_pages()
> >   vfio_group_iommu_domain()
> >   vfio_group_get_external_user_from_dev()
> > 
> > To retain the performance of the new device APIs relative to their group
> > versions optimize how vfio_group_add_container_user() is used to avoid
> > calling it when the driver must already guarantee the device is open and
> > the container_users incrd.
> > 
> > The remaining exported VFIO group interfaces are only used by kvm, and are
> > addressed by a parallel series.
> > 
> > This series is based on Christoph's gvt rework here:
> > 
> >  https://lore.kernel.org/all/5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com/
> > 
> > and so will need the PR merged first.
> > 
> > I have a followup series that needs this.
> > 
> > This is also part of the iommufd work - moving the driver facing interface
> > to vfio_device provides a much cleaner path to integrate with iommufd.
> > 
> > v3:
> >  - Based on VFIO's gvt/iommu merge
> >  - Remove mention of mdev_legacy_get_vfio_device() from commit message
> >  - Clarify commit message for vfio_dma_rw() conversion
> >  - Talk about the open_count change in the commit message
> >  - No code change
> > v2: https://lore.kernel.org/r/0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com
> >  - Based on Christoph's series so mdev_legacy_get_vfio_device() is removed
> >  - Reflow indenting
> >  - Use vfio_assert_device_open() and WARN_ON_ONCE instead of open coding
> >    the assertion
> > v1: https://lore.kernel.org/r/0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com  
> 
> Hi Alex,
> 
> This v3 is still good to go, it applies clean on top of the gvt series.

I wasn't cc'd on that version.  It looks to me like we'd still prefer
to see acks from GVT-g maintainers, Zhenyu and Zhi.

Also, I was thinking of posting the below cleanup patch unless you'd
prefer to roll it in.

Regarding your other outstanding patches, I think all of these depend
on the IOMMU changes, please correct if there are any that can be
queued with only the GVT-g topic branch dependency:

Subject: [PATCH v3 0/8] Remove vfio_group from the struct file facing VFIO API
Date: Wed,  4 May 2022 16:14:38 -0300
https://lore.kernel.org/all/0-v3-f7729924a7ea+25e33-vfio_kvm_no_group_jgg@nvidia.com/

Subject: [PATCH] vfio: Delete container_q
Date: Fri, 29 Apr 2022 15:46:17 -0300
https://lore.kernel.org/all/0-v1-a1e8791d795b+6b-vfio_container_q_jgg@nvidia.com/

And I'm waiting for a respin based on comments for:

Subject: [PATCH v3 0/2] Remove vfio_device_get_from_dev()
Date: Wed,  4 May 2022 16:01:46 -0300
https://lore.kernel.org/all/0-v3-4adf6c1b8e7c+170-vfio_get_from_dev_jgg@nvidia.com/

If there are others I should be tracking, please let me know.  Thanks,

Alex

commit e35ab17c48abcd8f6b40a35025d6d34a4d57f67a
Author: Alex Williamson <alex.williamson@redhat.com>
Date:   Wed May 4 17:01:51 2022 -0600

    vfio: Rename notifier function args
    
    We typically use "device" for a struct vfio_device* whereas "dev" is
    more likely a "struct device*".
    
    Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index b566ae3d320b..5de9a9892877 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2104,7 +2104,7 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
 /*
  * Pin a set of guest PFNs and return their associated host PFNs for
local
  * domain only.
- * @dev [in]     : device
+ * @device [in]  : vfio device
  * @user_pfn [in]: array of user/guest PFNs to be pinned.
  * @npage [in]   : count of elements in user_pfn array.  This count
should not
  *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
@@ -2112,15 +2112,16 @@
EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
  * @phys_pfn[out]: array of host PFNs
  * Return error or number of pages pinned.
  */
-int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
int npage,
-		   int prot, unsigned long *phys_pfn)
+int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
+		   int npage, int prot, unsigned long *phys_pfn)
 {
 	struct vfio_container *container;
-	struct vfio_group *group = vdev->group;
+	struct vfio_group *group = device->group;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage ||
!vfio_assert_device_open(vdev))
+	if (!user_pfn || !phys_pfn || !npage ||
+	    !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -2144,27 +2145,27 @@ EXPORT_SYMBOL(vfio_pin_pages);
 
 /*
  * Unpin set of host PFNs for local domain only.
- * @dev [in]     : device
+ * @device [in]  : vfio device
  * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number of
user/guest
  *		   PFNs should not be greater than
VFIO_PIN_PAGES_MAX_ENTRIES.
  * @npage [in]   : count of elements in user_pfn array.  This count
should not
  *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
  * Return error or number of pages unpinned.
  */
-int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
+int vfio_unpin_pages(struct vfio_device *device, unsigned long
*user_pfn, int npage)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !npage || !vfio_assert_device_open(vdev))
+	if (!user_pfn || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	container = vdev->group->container;
+	container = device->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
 		ret = driver->ops->unpin_pages(container->iommu_data,
user_pfn, @@ -2186,24 +2187,24 @@ EXPORT_SYMBOL(vfio_unpin_pages);
  * As the read/write of user space memory is conducted via the CPUs
and is
  * not a real device DMA, it is not necessary to pin the user space
memory. *
- * @vdev [in]		: VFIO device
+ * @device [in]		: VFIO device
  * @user_iova [in]	: base IOVA of a user space buffer
  * @data [in]		: pointer to kernel buffer
  * @len [in]		: kernel buffer length
  * @write		: indicate read or write
  * Return error code on failure or 0 on success.
  */
-int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova, void
*data, +int vfio_dma_rw(struct vfio_device *device, dma_addr_t
user_iova, void *data, size_t len, bool write)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!data || len <= 0 || !vfio_assert_device_open(vdev))
+	if (!data || len <= 0 || !vfio_assert_device_open(device))
 		return -EINVAL;
 
-	container = vdev->group->container;
+	container = device->group->container;
 	driver = container->iommu_driver;
 
 	if (likely(driver && driver->ops->dma_rw))
@@ -2211,6 +2212,7 @@ int vfio_dma_rw(struct vfio_device *vdev,
dma_addr_t user_iova, void *data, user_iova, data, len, write);
 	else
 		ret = -ENOTTY;
+
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
@@ -2287,13 +2289,15 @@ static int vfio_register_group_notifier(struct
vfio_group *group, return ret;
 }
 
-int vfio_register_notifier(struct vfio_device *dev, enum
vfio_notify_type type,
-			   unsigned long *events, struct
notifier_block *nb) +int vfio_register_notifier(struct vfio_device
*device,
+			   enum vfio_notify_type type, unsigned long
*events,
+			   struct notifier_block *nb)
 {
-	struct vfio_group *group = dev->group;
+	struct vfio_group *group = device->group;
 	int ret;
 
-	if (!nb || !events || (*events == 0) ||
!vfio_assert_device_open(dev))
+	if (!nb || !events || (*events == 0) ||
+	    !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	switch (type) {
@@ -2310,14 +2314,14 @@ int vfio_register_notifier(struct vfio_device
*dev, enum vfio_notify_type type, }
 EXPORT_SYMBOL(vfio_register_notifier);
 
-int vfio_unregister_notifier(struct vfio_device *dev,
+int vfio_unregister_notifier(struct vfio_device *device,
 			     enum vfio_notify_type type,
 			     struct notifier_block *nb)
 {
-	struct vfio_group *group = dev->group;
+	struct vfio_group *group = device->group;
 	int ret;
 
-	if (!nb || !vfio_assert_device_open(dev))
+	if (!nb || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	switch (type) {
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 9a9981c26228..6195edd2edcd 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -148,11 +148,11 @@ extern long vfio_external_check_extension(struct
vfio_group *group, 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned
long)) 
-extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long
*user_pfn, +extern int vfio_pin_pages(struct vfio_device *device,
unsigned long *user_pfn, int npage, int prot, unsigned long *phys_pfn);
-extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long
*user_pfn, +extern int vfio_unpin_pages(struct vfio_device *device,
unsigned long *user_pfn, int npage);
-extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
+extern int vfio_dma_rw(struct vfio_device *device, dma_addr_t
user_iova, void *data, size_t len, bool write);
 
 /* each type has independent events */
@@ -167,11 +167,11 @@ enum vfio_notify_type {
 /* events for VFIO_GROUP_NOTIFY */
 #define VFIO_GROUP_NOTIFY_SET_KVM	BIT(0)
 
-extern int vfio_register_notifier(struct vfio_device *dev,
+extern int vfio_register_notifier(struct vfio_device *device,
 				  enum vfio_notify_type type,
 				  unsigned long *required_events,
 				  struct notifier_block *nb);
-extern int vfio_unregister_notifier(struct vfio_device *dev,
+extern int vfio_unregister_notifier(struct vfio_device *device,
 				    enum vfio_notify_type type,
 				    struct notifier_block *nb);
 

