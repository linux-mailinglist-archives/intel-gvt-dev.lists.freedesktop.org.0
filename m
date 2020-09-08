Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38126193E
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 20:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246D26E886;
	Tue,  8 Sep 2020 18:11:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DFD6E891
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 18:11:38 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id e23so23906712eja.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 08 Sep 2020 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sior-be.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2jeAKbPcMYL3zKYHWUAD80qBl6LQnPeUqzL2ybjhdJg=;
 b=GRWuV3D+NPs+O8PhfljngvbH+/zdl1IG8s+i5wlKJNll0vYKQc3oEZmRBq2GPksBfB
 KZqDXGLyapYUntSwXu7zK1WBhKrrjsmYheZ21l9UPvc2kysM5F4IbTnkh/il6rSNqwoL
 EdCab1UyiUXvyGG2hYYrI867vxh2q3cIXvimK6XSZJgxiaFUvNOV4Mln6uGZ2yinOj01
 OpRJg968cPDL9fxOL2uFJCforjAmLjmTrsy4/frYWGR4IaBF8bCZ7fGBT6ABNkJ4qWa/
 8rXZp3U0TvvLv7/t94dXEBoHvAfxre9JV3R14nppWYwCg8WRqahVi/+t1FDgtIafF0Al
 PATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2jeAKbPcMYL3zKYHWUAD80qBl6LQnPeUqzL2ybjhdJg=;
 b=Lo0DS6CCufNDG42AGo4AXq4aMkMAlztMIKAAUOPA9clffVBa7QxwB+1VSlXhNZHv6e
 IPmIZ6gqwxOy1/CyIeTTRmQBKlbMDGtmTOWsXoBlPORkZ75BTKobd4kzmsw/+x4TpYkb
 1ZSZxb3Y9gl1VGtfNu4EWwBCSYWw9M7i4bo0wn/7h1xWvUtwb9VH5Co3RDyM9JLV1+bF
 WsdQDKlZdhp1AcoxADUXZGBD6sRZkrE8hB2Jz3H1DRItyVwu8dDbbEJts3GpOTEwauzT
 mButPHtDMPwr/VdOIdRd31WGkwywe8CYO5bsq9iotcpmia58yG2tZromjwbEGQiBYotA
 zhWw==
X-Gm-Message-State: AOAM532ZOxRwQX6KIv5p4+BLnuooyoV2/rzbKapmLki05afq/X7ZSljR
 avgXsab1uXduLjOAwEqE8S3OHWobJ9Avef86Luc=
X-Google-Smtp-Source: ABdhPJzXcxEi0aj0yBJLuuB4LmRVp2OUfbxb1m0J1V/0WroShEQJp8UGXqXJyJVSx6nGyPsh9AglWA==
X-Received: by 2002:a17:906:3552:: with SMTP id
 s18mr26864500eja.23.1599588697308; 
 Tue, 08 Sep 2020 11:11:37 -0700 (PDT)
Received: from aws.localdomain ([94.107.139.190])
 by smtp.gmail.com with ESMTPSA id g20sm16127ejx.12.2020.09.08.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:11:36 -0700 (PDT)
From: Alejandro Sior <aho@sior.be>
To: 
Subject: [Intel-gfx][PATCH v2] drm/i915/gvt: Prevent NULL pointer dereference
 in intel_vgpu_reg_rw_edid()
Date: Tue,  8 Sep 2020 20:11:21 +0200
Message-Id: <20200908181122.9100-1-aho@sior.be>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
References: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Alejandro Sior <aho@sior.be>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

In the function intel_vgpu_reg_rw_edid of kvmgt.c, pos can be equal
to NULL for GPUs that do not properly support EDID. In those cases, when
pos gets passed to the handle_edid functions, it gets added a short offset
then it's dereferenced in memcpy's, leading to NULL pointer
dereference kernel oops.

More concretely, that kernel oops renders some Broadwell GPUs users
unable to set up virtual machines with virtual GPU passthrough (virtual
machines hang indefinitely when trying to make use of the virtual GPU),
and make them unable to remove the virtual GPUs once the kernel oops has
happened (it hangs indefinitely, and notably too when the kernel tries to
shutdown). The issues that this causes and steps to reproduce are
discussed in more details in this github issue post:
https://github.com/intel/gvt-linux/issues/170#issuecomment-685806160

Check if pos is equal to NULL, and if it is, set ret to a negative
value, making the module simply indicate that the access to EDID region
has failed, without any fatal repercussion.

Signed-off-by: Alejandro Sior <aho@sior.be>

---
Changes in v2:
- removed middle name of author to comply with git name
- rephrased the patch description with imperative phrasing
- removed useless paragraph
- made a paragraph more concise
- fixed typos
- made individual lines shorter than 75 chars

 drivers/gpu/drm/i915/gvt/kvmgt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ad8a9df49f29..49163363ba4a 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -557,7 +557,9 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_vgpu *vgpu, char *buf,
 		(struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
 	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
 
-	if (pos < region->vfio_edid_regs.edid_offset) {
+	if (pos == NULL) {
+		ret = -EINVAL;
+	} else if (pos < region->vfio_edid_regs.edid_offset) {
 		ret = handle_edid_regs(vgpu, region, buf, count, pos, iswrite);
 	} else {
 		pos -= EDID_BLOB_OFFSET;
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
