Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D7405D7A
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Sep 2021 21:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A56E914;
	Thu,  9 Sep 2021 19:38:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2616E90E;
 Thu,  9 Sep 2021 19:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMaOpTsM9iqlM1LD+2xQLcV89zAMjYbCe2aoRTDISIJMoV7so5Oi5ievZY02c4k6o8LuCPmcmA1bnOkJ6oxaeVxKmySvwct19OBdP5lCHeiEqnKx0DuT/uj/llmIF7Gw1nbsnODjRh3nAjIZ+M8VklzbroVDddi2dSUaUa+OXYbUF7wHBH5Mv1PX9q4qQQf4xDHmli9+BcUIINIZ4nHYKKtDai2jwIm0pFBxpG7ui2b3ry1kfrIhqbs27//4AKZXqz1fr9NdaqeTILxGWjz0o9rBdivN9QHeoegS0NtXe4IO0M+X8P2KNk7PjyQ3kXCmr/O6CG1fzr3ut+RX+dGpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=edW555ZKC7E+6Hfo+HiK/LCIsHGD1iwGAluReyiMkeA=;
 b=CoicXXOZvhDRmW58pfsrN9kwh90942tOBtrl6X5Zvb2Trc2YE7ATWZ1+SZz0JQ/dziOiEQKXzW7YU2MrPPgFhWrTAeIz/0EPbH8bLjuHSw0i0jfecpei8BX6cC+4Jr/sRL3uBVXruhDJuRRqsVAcnZ2irnyDdgVv8rUabrZ6ywxZCf7uCqxJ8fktb9+i2/L1f0Qu2uNuFzvXedLYgciAI+AJhYM8Njqyip+lCn6rKCoNWgIupA4MQHLnOgoHYp/icf9SAEZX0vU5RlH8zZfW62G3d57DkI8mJBdvkIY/a5mvxAQIGf5hCPKmdr1z3yxHSTufV+RtZDesic0DtBJG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edW555ZKC7E+6Hfo+HiK/LCIsHGD1iwGAluReyiMkeA=;
 b=Vvi2NPPGqztbwlBhC5hfbLHvvhi3g1vTRuOs/0rX/lrK28f3AQn9gE2lBkZDjXm36socXfTqGNe1P0m2iPdgn+gpaJeP6fbf/UQVq/oK3MFaaImDul58s6Ai/VcskheyX/NC+3IQ+YQ6aO9fJ0g0bYIMWyDoCr4nudlmdxpv/y4x/d8mBw2nJR4iVfdaj/xQ1qLiKCBTrrHOEb2oZV/d3nJ8iUosEe2PsCvuJlG1H8TW0TguBM7hW1aQ4kDILHsW7HPsKDSYXAfeEqe35G4EeKQGPdqV1fSXZ2DAILjybOydUWfa9KBxLLxNqIe+Xc1lvMBIriulG/KSpG/EYs77xw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:53 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 9/9] vfio/ccw: Move the lifecycle of the struct
 vfio_ccw_private to the mdev
Date: Thu,  9 Sep 2021 16:38:49 -0300
Message-Id: <9-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:207:3c::34) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:207:3c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 19:38:51 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLFI-Qw; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72280b45-d93e-406e-4cb6-08d973c973a4
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5507A9F0B6D601E2F15DF377C2D59@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SbjBNQcHsAW924s8dPPTmWhdpT0qGID3FfTqBH+wunr38RCSKdbk5MDkLrkiy1waARB1v1c8V/CX1/nRtMWWb5tjG0kuos1CCbzxuN7P19Pe+063XRsOBFuXMqs6CRWKiNUtUOAP8GC/UfPBQIia7H9CDRzmGnGdl0YYRzjIg0A80ovxdYSEsSS+iogN64TkeDHWZ+Ld/2QZ6Ixsc5oqBJ4nwcMkukcH7KjRR8vQUGuFi60Wk+Wc3ETkZayNUkU0+Kzz2wUv/1e9wsjVMMt6ews2t8vtT9fvubwHJjWBYTRvGTNYx4XwTZj06sJlXKDMes99Lm+6mNzErZ91WHAUdLvAGsR3Wra0PcgFYLB5lReeUqDx46bt4Xiz6w3RmRgqgwAHPslbQcwE56uoPsxrwo2NmVX0t9tkVt5EUxHwZPLbkoVh/1KkH/4f/QTzkIP3IqtvxBZblcDFzPpuoZWHqLIgzi+WwL6s4iDw+ZnafaSUrLZftz+l6rBKsBYNxd/YSHLi2urQHMXZG/w3bB6TwY8/ySBczd4RW0FENnaOXg6ACpwYG83c+zamyQsv7PkbE8C2h7slEmdZIr5i4SIDUUEWqoKxAayeMir9uPV74IHJvArZJfwo9OiSCaeKE16LgOhA1bQPrvgsjAMaDgrsnq0ucasurYoJRMKbGSRx97RwB4vrbWEwVvxYYXxnaE+WBy8yIfRYwsuwAyOua8+Fog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(8676002)(66476007)(478600001)(4326008)(66946007)(66556008)(30864003)(8936002)(921005)(5660300002)(186003)(26005)(86362001)(83380400001)(7416002)(2906002)(36756003)(426003)(2616005)(9746002)(9786002)(110136005)(38100700002)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3uSUx2dyD3VsgVQ59OzzsJ8eLCMqYitBd2anAH9zMKgEIxwJYilzYM8p4YNxnujSx6VYv1X6YfO1ds9+my8GTnYGMw5P5bjWwZZgyqg1Cz5vNZP1IadIChE78X75aAreZ7TBvNdapX8dMAPFiKTrIWyXx92yfnhPRQvr2B/y51XiqTTv51yQ/x5pE87jDeII6raIJPGHDISwEIsoby6ZVd+SmIpVsFdJC/Jlj1Lr/V/ZH0NTSXHp5Vx1vAdK4DEark/oUXoC8GKEo/vXZfU0ML2PCVk2joxToPsHd7PEq0ETH4AG2Ke3HeEFptAIIwQqwweoihmpdq3z/INokO3l+H72OS/PX4mbU9etNVqHYbmVNXyg2IzQjB5779E4Q7g4I5P1xFoq+wWrmlsYOkqXHmDOfoeo8sQKLSX7zZhZ+KCjNbT4ZYlP1bbb8Cy5Zx3V/i7sKphUJJADWvy/xThEZ1s8zaKIqvfw+oERQZuhluYU9TdisgNbbkcj1uTyuVLkUJipvbCZ8koXgxBlm1MKRvAmP07ryReMTky2eqgrRzQt7ARInBUMA6jJ6P6Gi/VES3/etWFn5upcH7jOuXWEgcJVdmgIgJvrojRmySUQRfOFUPAuH9alIZd8IQBs0CKlagNXILCyG/5lQUr4VzmOJbHac1/ayVpmB+nqQLQU3XQCogGLfnlsh1DoASchyFXiZdUyyMf38dSi2tvUC8JKWtE/IzatSJDQk9D9PjAj3pGI4scOc+GPO8kuAwCZBvye
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72280b45-d93e-406e-4cb6-08d973c973a4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:51.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nk7rX8JsGB7oF72Kvl3oAOSwrEhwGU+jLBtx4PENO1/wukYubXq9oFrq988jQRDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The css_driver's main purpose is to create/destroy the mdev and relay the
shutdown, irq, sch_event, and chp_event css_driver ops to the single
created vfio_device, if it exists.

Reframe the boundary where the css_driver domain switches to the vfio
domain by using rcu to read and refcount the vfio_device out of the sch's
drvdata. The mdev probe/remove will manage the drvdata of the parent.

The vfio core code refcounting thus guarantees that when a css_driver
callback is running the vfio_device is registered, simplifying the
understanding of the whole lifecycle.

Finally the vfio_ccw_private is allocated/freed during probe/remove of the
mdev like any other vfio_device struct.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 67 ++++++++++++++---------------
 drivers/s390/cio/vfio_ccw_ops.c     | 40 +++++++----------
 drivers/s390/cio/vfio_ccw_private.h | 23 +++++++++-
 3 files changed, 69 insertions(+), 61 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 0e2edd96567a09..b86da53443bfd7 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -86,13 +86,19 @@ static void vfio_ccw_crw_todo(struct work_struct *work)
  */
 static void vfio_ccw_sch_irq(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
+
+	/* IRQ should not be delivered after the mdev is destroyed */
+	if (WARN_ON(!private))
+		return;
 
 	inc_irq_stat(IRQIO_CIO);
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
+	vfio_device_put(&private->vdev);
 }
 
-static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
+struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device *mdev,
+						struct subchannel *sch)
 {
 	struct vfio_ccw_private *private;
 
@@ -100,6 +106,8 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	if (!private)
 		return ERR_PTR(-ENOMEM);
 
+	vfio_init_group_dev(&private->vdev, &mdev->dev,
+			    &vfio_ccw_dev_ops);
 	private->sch = sch;
 	mutex_init(&private->io_mutex);
 	private->state = VFIO_CCW_STATE_CLOSED;
@@ -145,11 +153,12 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	kfree(private->cp.guest_cp);
 out_free_private:
 	mutex_destroy(&private->io_mutex);
+	vfio_uninit_group_dev(&private->vdev);
 	kfree(private);
 	return ERR_PTR(-ENOMEM);
 }
 
-static void vfio_ccw_free_private(struct vfio_ccw_private *private)
+void vfio_ccw_free_private(struct vfio_ccw_private *private)
 {
 	struct vfio_ccw_crw *crw, *temp;
 
@@ -164,14 +173,14 @@ static void vfio_ccw_free_private(struct vfio_ccw_private *private)
 	kmem_cache_free(vfio_ccw_io_region, private->io_region);
 	kfree(private->cp.guest_cp);
 	mutex_destroy(&private->io_mutex);
-	kfree(private);
+	vfio_uninit_group_dev(&private->vdev);
+	kfree_rcu(private, rcu);
 }
 
 static int vfio_ccw_sch_probe(struct subchannel *sch)
 {
 	struct pmcw *pmcw = &sch->schib.pmcw;
-	struct vfio_ccw_private *private;
-	int ret = -ENOMEM;
+	int ret;
 
 	if (pmcw->qf) {
 		dev_warn(&sch->dev, "vfio: ccw: does not support QDIO: %s\n",
@@ -179,15 +188,9 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 		return -ENODEV;
 	}
 
-	private = vfio_ccw_alloc_private(sch);
-	if (IS_ERR(private))
-		return PTR_ERR(private);
-
-	dev_set_drvdata(&sch->dev, private);
-
-	ret = vfio_ccw_mdev_reg(sch);
+	ret = mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	if (dev_get_uevent_suppress(&sch->dev)) {
 		dev_set_uevent_suppress(&sch->dev, 0);
@@ -198,22 +201,11 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 			   sch->schid.cssid, sch->schid.ssid,
 			   sch->schid.sch_no);
 	return 0;
-
-out_free:
-	dev_set_drvdata(&sch->dev, NULL);
-	vfio_ccw_free_private(private);
-	return ret;
 }
 
 static int vfio_ccw_sch_remove(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
-
-	vfio_ccw_mdev_unreg(sch);
-
-	dev_set_drvdata(&sch->dev, NULL);
-
-	vfio_ccw_free_private(private);
+	mdev_unregister_device(&sch->dev);
 
 	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
 			   sch->schid.cssid, sch->schid.ssid,
@@ -223,10 +215,14 @@ static int vfio_ccw_sch_remove(struct subchannel *sch)
 
 static void vfio_ccw_sch_shutdown(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
+
+	if (!private)
+		return;
 
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
+	vfio_device_put(&private->vdev);
 }
 
 /**
@@ -241,14 +237,14 @@ static void vfio_ccw_sch_shutdown(struct subchannel *sch)
  */
 static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
 	unsigned long flags;
 	int rc = -EAGAIN;
 
-	spin_lock_irqsave(sch->lock, flags);
-	if (!device_is_registered(&sch->dev))
-		goto out_unlock;
+	if (!private)
+		return -EAGAIN;
 
+	spin_lock_irqsave(sch->lock, flags);
 	if (work_pending(&sch->todo_work))
 		goto out_unlock;
 
@@ -261,7 +257,7 @@ static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 
 out_unlock:
 	spin_unlock_irqrestore(sch->lock, flags);
-
+	vfio_device_put(&private->vdev);
 	return rc;
 }
 
@@ -295,7 +291,7 @@ static void vfio_ccw_queue_crw(struct vfio_ccw_private *private,
 static int vfio_ccw_chp_event(struct subchannel *sch,
 			      struct chp_link *link, int event)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
 	int mask = chp_ssd_get_mask(&sch->ssd_info, link);
 	int retry = 255;
 
@@ -308,8 +304,10 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 			   sch->schid.ssid, sch->schid.sch_no,
 			   mask, event);
 
-	if (cio_update_schib(sch))
+	if (cio_update_schib(sch)) {
+		vfio_device_put(&private->vdev);
 		return -ENODEV;
+	}
 
 	switch (event) {
 	case CHP_VARY_OFF:
@@ -339,6 +337,7 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 		break;
 	}
 
+	vfio_device_put(&private->vdev);
 	return 0;
 }
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 23004e67c492f6..04a10f37d64225 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -17,8 +17,6 @@
 
 #include "vfio_ccw_private.h"
 
-static const struct vfio_device_ops vfio_ccw_dev_ops;
-
 static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 {
 	/*
@@ -88,26 +86,27 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
+	struct subchannel *sch = to_subchannel(mdev->dev.parent);
+	struct vfio_ccw_private *private;
 	int ret;
 
-	memset(&private->vdev, 0, sizeof(private->vdev));
-	vfio_init_group_dev(&private->vdev, &mdev->dev,
-			    &vfio_ccw_dev_ops);
+	private = vfio_ccw_alloc_private(mdev, sch);
+	if (IS_ERR(private))
+		return PTR_ERR(private);
 
 	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x: create\n",
-			   dev_name(private->vdev.dev),
-			   private->sch->schid.cssid, private->sch->schid.ssid,
-			   private->sch->schid.sch_no);
+			   dev_name(private->vdev.dev), sch->schid.cssid,
+			   sch->schid.ssid, sch->schid.sch_no);
 
 	ret = vfio_register_group_dev(&private->vdev);
 	if (ret)
-		goto err_init;
+		goto err_alloc;
 	dev_set_drvdata(&mdev->dev, private);
+	dev_set_drvdata(&sch->dev, private);
 	return 0;
 
-err_init:
-	vfio_uninit_group_dev(&private->vdev);
+err_alloc:
+	vfio_ccw_free_private(private);
 	return ret;
 }
 
@@ -120,8 +119,9 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 			   private->sch->schid.cssid, private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
+	dev_set_drvdata(&private->sch->dev, NULL);
 	vfio_unregister_group_dev(&private->vdev);
-	vfio_uninit_group_dev(&private->vdev);
+	vfio_ccw_free_private(private);
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
@@ -595,7 +595,7 @@ static unsigned int vfio_ccw_get_available(struct mdev_type *mtype)
 	return 1;
 }
 
-static const struct vfio_device_ops vfio_ccw_dev_ops = {
+const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.open_device = vfio_ccw_mdev_open_device,
 	.close_device = vfio_ccw_mdev_close_device,
 	.read = vfio_ccw_mdev_read,
@@ -615,19 +615,9 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 	.get_available = vfio_ccw_get_available,
 };
 
-static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
+const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &vfio_ccw_mdev_driver,
 	.device_api		= VFIO_DEVICE_API_CCW_STRING,
 	.supported_type_groups  = mdev_type_groups,
 };
-
-int vfio_ccw_mdev_reg(struct subchannel *sch)
-{
-	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
-}
-
-void vfio_ccw_mdev_unreg(struct subchannel *sch)
-{
-	mdev_unregister_device(&sch->dev);
-}
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 67ee9c624393b0..852ff94fc107d6 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -24,6 +24,8 @@
 #include "css.h"
 #include "vfio_ccw_cp.h"
 
+struct mdev_device;
+
 #define VFIO_CCW_OFFSET_SHIFT   10
 #define VFIO_CCW_OFFSET_TO_INDEX(off)	(off >> VFIO_CCW_OFFSET_SHIFT)
 #define VFIO_CCW_INDEX_TO_OFFSET(index)	((u64)(index) << VFIO_CCW_OFFSET_SHIFT)
@@ -69,6 +71,7 @@ struct vfio_ccw_crw {
 /**
  * struct vfio_ccw_private
  * @vdev: Embedded VFIO device
+ * @rcu: head for kfree_rcu()
  * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
@@ -91,6 +94,7 @@ struct vfio_ccw_crw {
  */
 struct vfio_ccw_private {
 	struct vfio_device vdev;
+	struct rcu_head rcu;
 	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
@@ -115,10 +119,25 @@ struct vfio_ccw_private {
 	struct work_struct	crw_work;
 } __aligned(8);
 
-extern int vfio_ccw_mdev_reg(struct subchannel *sch);
-extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
+struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device *mdev,
+						struct subchannel *sch);
+void vfio_ccw_free_private(struct vfio_ccw_private *private);
 
 extern struct mdev_driver vfio_ccw_mdev_driver;
+extern const struct mdev_parent_ops vfio_ccw_mdev_ops;
+extern const struct vfio_device_ops vfio_ccw_dev_ops;
+
+static inline struct vfio_ccw_private *vfio_ccw_get_priv(struct subchannel *sch)
+{
+	struct vfio_ccw_private *private;
+
+	rcu_read_lock();
+	private = dev_get_drvdata(&sch->dev);
+	if (private && !vfio_device_try_get(&private->vdev))
+		private = NULL;
+	rcu_read_unlock();
+	return private;
+}
 
 /*
  * States of the device statemachine.
-- 
2.33.0

