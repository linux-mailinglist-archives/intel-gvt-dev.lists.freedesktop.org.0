Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD0C5EDC6F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Sep 2022 14:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A0A10E4C6;
	Wed, 28 Sep 2022 12:20:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Wed, 28 Sep 2022 12:20:17 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F247610E4CC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Sep 2022 12:20:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 14A6768BEB; Wed, 28 Sep 2022 14:11:11 +0200 (CEST)
Date: Wed, 28 Sep 2022 14:11:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: simplify the mdev interface v8
Message-ID: <20220928121110.GA30738@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
 <20220927140737.0b4c9a54.alex.williamson@redhat.com>
 <20220927155426.23f4b8e9.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927155426.23f4b8e9.alex.williamson@redhat.com>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 03:54:26PM -0600, Alex Williamson wrote:
> Oops, I had to drop this, I get a null pointer from gvt-g code:

Ok, this is a stupid bug in the second patch in the series.  I did not
hit it in my mdev testing as my script just uses the first type and
thus never hits these, but as your trace showed mdevctl and once I
used that I could reproduce it.  The fix for patch 2 is below, and
the git tree at:

   git://git.infradead.org/users/hch/misc.git mvdev-lifetime

has been updated with that folded in and the recent reviews.

---
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 1b67328c714f1..b0d5dafd013f4 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -123,7 +123,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
 
 		sprintf(gvt->types[i].name, "GVTg_V%u_%s",
 			GRAPHICS_VER(gvt->gt->i915) == 8 ? 4 : 5, conf->name);
-		gvt->types->conf = conf;
+		gvt->types[i].conf = conf;
 		gvt->types[i].avail_instance = min(low_avail / conf->low_mm,
 						   high_avail / conf->high_mm);
 
