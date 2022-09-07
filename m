Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068FD5B0372
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Sep 2022 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A23310E61C;
	Wed,  7 Sep 2022 11:55:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A41C10E61C;
 Wed,  7 Sep 2022 11:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BM2xHrfmxe+STDKKXSowY9hGQLIOtaAF8m9cL5/wDWk=; b=h/UQBtGd2bbjkcASv3lH0arQWz
 thvfSm6sN9MwBmusPTiYDemn1x33oURDjpuH0ws/E3qX991rVKb/fSZ0S3xgvv6AfeccKlZhSkohy
 sU8eMVJzi86CP1ZxSnQR6y44HjkvYXg53BVbW7b6E0TO5KzwFS9WkRg1d8F7hs9m6UTWf8YOttaRQ
 9u3bwIfEwALBVaKutcRK5+OM37JbbVXD/yScf1SxlJMwaz7adoPlUIziChtiYWq2v7MQCGS1e8/xs
 iPFO8ZuHB0w20MuW3hCwKJ/CEPXibmys5p+gFYGxPK1TK1F6EqsOzSuIGA9Fk83XXmpv6sPUSx0MA
 CUOG073Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oVteI-005sv8-Au; Wed, 07 Sep 2022 11:55:18 +0000
Date: Wed, 7 Sep 2022 04:55:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Message-ID: <YxiGpryRNrxvEoiY@infradead.org>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
 <YxcV05AVN4kqdPX6@infradead.org>
 <BN9PR11MB5276EE6209C1E3D4662368DC8C419@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276EE6209C1E3D4662368DC8C419@BN9PR11MB5276.namprd11.prod.outlook.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 12:43:30AM +0000, Tian, Kevin wrote:
> > From: Christoph Hellwig
> > Sent: Tuesday, September 6, 2022 5:42 PM
> > 
> > What is the point?  This adds indirect calls, and actually creates
> > more boilerplate code in the drivers.  i.g. when using this code there
> > is more, and harder to read code.
> 
> The point is to align with struct device life cycle when it's introduced
> to vfio_device. The object is released via put_device() then what would
> be the alternative if the driver doesn't provide a @release callback?
> 
> and with @release then naturally @init is also expected.

No, with a release no @init is expected.  The init method is one
of the major obsfucations here, only topped by the weird
vfio_alloc_device macro.  Yes, that saves about 4 lines of code
in every driver, but places a burden on the struct layout and
very much obsfucated things.  Without vfio_alloc_device and
the init method I think much of this would make a lot more sense.

See the patch below that goes on top of this series to show how
undoing these two would look on mbochs.  It it a slight reduction
lines of code, but more readable and much less churn compared
to the status before this series.

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index df95f25fbc0ede..7f01b335fd4dbd 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -505,14 +505,12 @@ static int mbochs_reset(struct mdev_state *mdev_state)
 	return 0;
 }
 
-static int mbochs_init_dev(struct vfio_device *vdev)
+static int mbochs_probe(struct mdev_device *mdev)
 {
-	struct mdev_state *mdev_state =
-		container_of(vdev, struct mdev_state, vdev);
-	struct mdev_device *mdev = to_mdev_device(vdev->dev);
+	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
 	const struct mbochs_type *type =
 		&mbochs_types[mdev_get_type_group_id(mdev)];
-	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
+	struct mdev_state *mdev_state;
 	int ret = -ENOMEM;
 
 	do {
@@ -521,10 +519,14 @@ static int mbochs_init_dev(struct vfio_device *vdev)
 	} while (!atomic_try_cmpxchg(&mbochs_avail_mbytes, &avail_mbytes,
 				     avail_mbytes - type->mbytes));
 
-	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
-	if (!mdev_state->vconfig)
+	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
+	if (mdev_state == NULL)
 		goto err_avail;
 
+	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
+	if (mdev_state->vconfig == NULL)
+		goto err_state;
+
 	mdev_state->memsize = type->mbytes * 1024 * 1024;
 	mdev_state->pagecount = mdev_state->memsize >> PAGE_SHIFT;
 	mdev_state->pages = kcalloc(mdev_state->pagecount,
@@ -546,38 +548,33 @@ static int mbochs_init_dev(struct vfio_device *vdev)
 	mbochs_create_config_space(mdev_state);
 	mbochs_reset(mdev_state);
 
+	ret = vfio_init_device(&mdev_state->vdev, &mdev->dev, &mbochs_dev_ops);
+	if (ret)
+		goto err_mem;
+
+	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
+	if (ret) {
+		vfio_put_device(&mdev_state->vdev);
+		return ret;
+	}
+
 	dev_info(vdev->dev, "%s: %s, %d MB, %ld pages\n", __func__,
 		 type->name, type->mbytes, mdev_state->pagecount);
+
+	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
 
+err_mem:
+	kfree(mdev_state->pages);
 err_vconfig:
 	kfree(mdev_state->vconfig);
+err_state:
+	kfree(mdev_state);
 err_avail:
 	atomic_add(type->mbytes, &mbochs_avail_mbytes);
 	return ret;
 }
 
-static int mbochs_probe(struct mdev_device *mdev)
-{
-	struct mdev_state *mdev_state;
-	int ret = -ENOMEM;
-
-	mdev_state = vfio_alloc_device(mdev_state, vdev, &mdev->dev,
-				       &mbochs_dev_ops);
-	if (IS_ERR(mdev_state))
-		return PTR_ERR(mdev_state);
-
-	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
-	if (ret)
-		goto err_put_vdev;
-	dev_set_drvdata(&mdev->dev, mdev_state);
-	return 0;
-
-err_put_vdev:
-	vfio_put_device(&mdev_state->vdev);
-	return ret;
-}
-
 static void mbochs_release_dev(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
@@ -585,7 +582,7 @@ static void mbochs_release_dev(struct vfio_device *vdev)
 
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
-	vfio_free_device(vdev);
+	kfree(vdev);
 	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 }
 
@@ -1414,7 +1411,6 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static const struct vfio_device_ops mbochs_dev_ops = {
 	.close_device = mbochs_close_device,
-	.init = mbochs_init_dev,
 	.release = mbochs_release_dev,
 	.read = mbochs_read,
 	.write = mbochs_write,
