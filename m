Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8393E44278F
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200316FAB9;
	Tue,  2 Nov 2021 07:06:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925916FAB9;
 Tue,  2 Nov 2021 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=INRIvMwo11KtgAa+SwQOYbNtpPBlU91CJ19G0u46jJ0=; b=DSt6DCMZlhjiXbvuwKukBsi6Et
 w2Ijqjvq7NVuOYPbhGiy8B2vJ/RSCApq5SnQnSbf+iDcPAJ8BGLnYV/As17Er5/g41XYvVIA13K3Y
 M+aJmNzD8aSecxka2AIM9To+RYfNqEUBdDExJTLCqK9YbRjEopp4gzFGxvTcjD37T1lxed+RFio8y
 hSUdcXa/yYVUS1yGIa/BqfBos//+T/zoLsiGyxXLuoW3dF3SIa9R61gh+ieNpgDIbq5bWK633tJsu
 XvaCOFQEjLu3zjuFY+OE/dg1XpBiD0PdWQz5Ou4ljxP8J+rLd7XCN/UwK0nBIsw4rQPeJ9rYj3OL6
 kiCeYiWg==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnsi-000i6l-Iv; Tue, 02 Nov 2021 07:06:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 08/29] drm/i915/gvt: remove the map_gfn_to_mfn and
 set_trap_area ops
Date: Tue,  2 Nov 2021 08:05:40 +0100
Message-Id: <20211102070601.155501-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The map_gfn_to_mfn and set_trap_area ops are never defined, so remove
them and clean up code that depends on them in the callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/cfg_space.c | 89 ++++++----------------------
 drivers/gpu/drm/i915/gvt/hypercall.h |  4 --
 drivers/gpu/drm/i915/gvt/mpt.h       | 44 --------------
 3 files changed, 17 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index b490e3db2e382..dad3a60543354 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -129,60 +129,16 @@ int intel_vgpu_emulate_cfg_read(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
-static int map_aperture(struct intel_vgpu *vgpu, bool map)
+static void map_aperture(struct intel_vgpu *vgpu, bool map)
 {
-	phys_addr_t aperture_pa = vgpu_aperture_pa_base(vgpu);
-	unsigned long aperture_sz = vgpu_aperture_sz(vgpu);
-	u64 first_gfn;
-	u64 val;
-	int ret;
-
-	if (map == vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].tracked)
-		return 0;
-
-	val = vgpu_cfg_space(vgpu)[PCI_BASE_ADDRESS_2];
-	if (val & PCI_BASE_ADDRESS_MEM_TYPE_64)
-		val = *(u64 *)(vgpu_cfg_space(vgpu) + PCI_BASE_ADDRESS_2);
-	else
-		val = *(u32 *)(vgpu_cfg_space(vgpu) + PCI_BASE_ADDRESS_2);
-
-	first_gfn = (val + vgpu_aperture_offset(vgpu)) >> PAGE_SHIFT;
-
-	ret = intel_gvt_hypervisor_map_gfn_to_mfn(vgpu, first_gfn,
-						  aperture_pa >> PAGE_SHIFT,
-						  aperture_sz >> PAGE_SHIFT,
-						  map);
-	if (ret)
-		return ret;
-
-	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].tracked = map;
-	return 0;
+	if (map != vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].tracked)
+		vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].tracked = map;
 }
 
-static int trap_gttmmio(struct intel_vgpu *vgpu, bool trap)
+static void trap_gttmmio(struct intel_vgpu *vgpu, bool trap)
 {
-	u64 start, end;
-	u64 val;
-	int ret;
-
-	if (trap == vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].tracked)
-		return 0;
-
-	val = vgpu_cfg_space(vgpu)[PCI_BASE_ADDRESS_0];
-	if (val & PCI_BASE_ADDRESS_MEM_TYPE_64)
-		start = *(u64 *)(vgpu_cfg_space(vgpu) + PCI_BASE_ADDRESS_0);
-	else
-		start = *(u32 *)(vgpu_cfg_space(vgpu) + PCI_BASE_ADDRESS_0);
-
-	start &= ~GENMASK(3, 0);
-	end = start + vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size - 1;
-
-	ret = intel_gvt_hypervisor_set_trap_area(vgpu, start, end, trap);
-	if (ret)
-		return ret;
-
-	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].tracked = trap;
-	return 0;
+	if (trap != vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].tracked)
+		vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].tracked = trap;
 }
 
 static int emulate_pci_command_write(struct intel_vgpu *vgpu,
@@ -191,26 +147,17 @@ static int emulate_pci_command_write(struct intel_vgpu *vgpu,
 	u8 old = vgpu_cfg_space(vgpu)[offset];
 	u8 new = *(u8 *)p_data;
 	u8 changed = old ^ new;
-	int ret;
 
 	vgpu_pci_cfg_mem_write(vgpu, offset, p_data, bytes);
 	if (!(changed & PCI_COMMAND_MEMORY))
 		return 0;
 
 	if (old & PCI_COMMAND_MEMORY) {
-		ret = trap_gttmmio(vgpu, false);
-		if (ret)
-			return ret;
-		ret = map_aperture(vgpu, false);
-		if (ret)
-			return ret;
+		trap_gttmmio(vgpu, false);
+		map_aperture(vgpu, false);
 	} else {
-		ret = trap_gttmmio(vgpu, true);
-		if (ret)
-			return ret;
-		ret = map_aperture(vgpu, true);
-		if (ret)
-			return ret;
+		trap_gttmmio(vgpu, true);
+		map_aperture(vgpu, true);
 	}
 
 	return 0;
@@ -230,13 +177,12 @@ static int emulate_pci_rom_bar_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-static int emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
+static void emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
 	u32 new = *(u32 *)(p_data);
 	bool lo = IS_ALIGNED(offset, 8);
 	u64 size;
-	int ret = 0;
 	bool mmio_enabled =
 		vgpu_cfg_space(vgpu)[PCI_COMMAND] & PCI_COMMAND_MEMORY;
 	struct intel_vgpu_pci_bar *bars = vgpu->cfg_space.bar;
@@ -259,14 +205,14 @@ static int emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
 			 * Untrap the BAR, since guest hasn't configured a
 			 * valid GPA
 			 */
-			ret = trap_gttmmio(vgpu, false);
+			trap_gttmmio(vgpu, false);
 			break;
 		case PCI_BASE_ADDRESS_2:
 		case PCI_BASE_ADDRESS_3:
 			size = ~(bars[INTEL_GVT_PCI_BAR_APERTURE].size -1);
 			intel_vgpu_write_pci_bar(vgpu, offset,
 						size >> (lo ? 0 : 32), lo);
-			ret = map_aperture(vgpu, false);
+			map_aperture(vgpu, false);
 			break;
 		default:
 			/* Unimplemented BARs */
@@ -282,19 +228,18 @@ static int emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
 			 */
 			trap_gttmmio(vgpu, false);
 			intel_vgpu_write_pci_bar(vgpu, offset, new, lo);
-			ret = trap_gttmmio(vgpu, mmio_enabled);
+			trap_gttmmio(vgpu, mmio_enabled);
 			break;
 		case PCI_BASE_ADDRESS_2:
 		case PCI_BASE_ADDRESS_3:
 			map_aperture(vgpu, false);
 			intel_vgpu_write_pci_bar(vgpu, offset, new, lo);
-			ret = map_aperture(vgpu, mmio_enabled);
+			map_aperture(vgpu, mmio_enabled);
 			break;
 		default:
 			intel_vgpu_write_pci_bar(vgpu, offset, new, lo);
 		}
 	}
-	return ret;
 }
 
 /**
@@ -336,8 +281,8 @@ int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 	case PCI_BASE_ADDRESS_0 ... PCI_BASE_ADDRESS_5:
 		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
-		return emulate_pci_bar_write(vgpu, offset, p_data, bytes);
-
+		emulate_pci_bar_write(vgpu, offset, p_data, bytes);
+		break;
 	case INTEL_GVT_PCI_SWSCI:
 		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index 395bce9633faa..f1a4926f6f1be 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -62,10 +62,6 @@ struct intel_gvt_mpt {
 
 	int (*dma_pin_guest_page)(unsigned long handle, dma_addr_t dma_addr);
 
-	int (*map_gfn_to_mfn)(unsigned long handle, unsigned long gfn,
-			      unsigned long mfn, unsigned int nr, bool map);
-	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
-			     bool map);
 	int (*set_opregion)(void *vgpu);
 	int (*set_edid)(void *vgpu, int port_num);
 	int (*get_vfio_device)(void *vgpu);
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 0e3966e1fec8b..bb0e9e71d13e2 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -270,50 +270,6 @@ intel_gvt_hypervisor_dma_pin_guest_page(struct intel_vgpu *vgpu,
 	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu->handle, dma_addr);
 }
 
-/**
- * intel_gvt_hypervisor_map_gfn_to_mfn - map a GFN region to MFN
- * @vgpu: a vGPU
- * @gfn: guest PFN
- * @mfn: host PFN
- * @nr: amount of PFNs
- * @map: map or unmap
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_map_gfn_to_mfn(
-		struct intel_vgpu *vgpu, unsigned long gfn,
-		unsigned long mfn, unsigned int nr,
-		bool map)
-{
-	/* a MPT implementation could have MMIO mapped elsewhere */
-	if (!intel_gvt_host.mpt->map_gfn_to_mfn)
-		return 0;
-
-	return intel_gvt_host.mpt->map_gfn_to_mfn(vgpu->handle, gfn, mfn, nr,
-						  map);
-}
-
-/**
- * intel_gvt_hypervisor_set_trap_area - Trap a guest PA region
- * @vgpu: a vGPU
- * @start: the beginning of the guest physical address region
- * @end: the end of the guest physical address region
- * @map: map or unmap
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-static inline int intel_gvt_hypervisor_set_trap_area(
-		struct intel_vgpu *vgpu, u64 start, u64 end, bool map)
-{
-	/* a MPT implementation could have MMIO trapped elsewhere */
-	if (!intel_gvt_host.mpt->set_trap_area)
-		return 0;
-
-	return intel_gvt_host.mpt->set_trap_area(vgpu->handle, start, end, map);
-}
-
 /**
  * intel_gvt_hypervisor_set_opregion - Set opregion for guest
  * @vgpu: a vGPU
-- 
2.30.2

