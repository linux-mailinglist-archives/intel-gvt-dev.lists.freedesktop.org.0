Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33215624EE3
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 01:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0807610E16B;
	Fri, 11 Nov 2022 00:22:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37910E156
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Nov 2022 00:22:32 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 a18-20020a62bd12000000b0056e7b61ec78so1823782pff.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 16:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=n36J7s+0ilM0Tsn5slAdsXyaRWJfxWCAeT/6FWqeTp8=;
 b=TZiKdFTbv7ULH977/XXkoaKwCBWIUXcZgjj3kk67qk6G/7NTnWl7f9ErIfa3sgs6Iu
 PIE2j9lVQnRevVhSmgy5ghpMaowZSmo/JvV26NB/u5XUxIGVX2T3kGhGEB+GX40/BH+e
 dMm5i34zN0Ep9bgjqiptCmyqKJTPz98+Gc5Erv/2Hk0eC6sx/JrEjrvIb4L//JadZb+D
 yyrZCQmeoRcq14GM/aKC8IJAyy66Zz5B57Ex00OXo4YACUPRLXDVs9TboavE9uxTi60O
 H5HIhz1q4T4MEoC0qbI3gIAqHaqRVBYY+wU9Sv6jmDDDGplg8ezaO+Oydl1V1nV+l4ZE
 GG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n36J7s+0ilM0Tsn5slAdsXyaRWJfxWCAeT/6FWqeTp8=;
 b=0eMMXUNblH9yERh4YwDbP9C6LCMRGitbtmP2tI2VZOX4k8AZqLOLxDpo2rD88dJTn1
 NWMiv6fPTTeFvBMSwH0jVRq9eCJOeFtcGVdPrU9OZv37pO+PRo6t+6QjZy1vlQ7oO+VF
 sI08xlLWI9wuQAaBkqN8M+Y///MtTvewfdxVhwFoel0uWRQpdlNvxKd7x7D9n+NjpoK/
 Rn10NwtXC4BcEMe0VYQ+BSHPbaB4cGl9JmWr4RBSrAWIrgdrQRG9BxlN33Q8157179L5
 zCKD3LKVSLEDZVt6iCKbwEqJHieUUW4lmWDKi1P2crLtdPnMUGO+vDXfyABGDxTjsj8H
 13mQ==
X-Gm-Message-State: ANoB5pm1Vnzmsu0KzaevB7rUkBV0h9YFhU/NtERG3aw43rhWfm4090VO
 9Lh+lxYk4xcZkkvzEtQnDZe2Bn0q+DI=
X-Google-Smtp-Source: AA0mqf59PK1ce8OQvm+mdu5I4wtiwB4LZ1gWqBvwwJnwlP7+YuZxp1WsB+ro/Om0CHqF+A4TMJj0VFzo6aE=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac4:b0:186:5f54:18cf with SMTP id
 q4-20020a170902dac400b001865f5418cfmr4884plx.141.1668126151578; Thu, 10 Nov
 2022 16:22:31 -0800 (PST)
Date: Fri, 11 Nov 2022 00:22:25 +0000
In-Reply-To: <20221111002225.2418386-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221111002225.2418386-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221111002225.2418386-3-seanjc@google.com>
Subject: [PATCH 2/2] drm/i915/gvt: Unconditionally put reference to KVM when
 detaching vGPU
From: Sean Christopherson <seanjc@google.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: Sean Christopherson <seanjc@google.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Always put the KVM reference when closing a vCPU device, as
intel_vgpu_open_device() succeeds if and only if the KVM pointer is
valid and a reference to KVM is acquired.  And if that doesn't hold true,
the call to kvm_page_track_unregister_notifier() a few lines earlier is
doomed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e67d5267fde0..714221f9a131 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -714,15 +714,14 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 
 	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
 					   &vgpu->track_node);
+	kvm_put_kvm(vgpu->vfio_device.kvm);
+
 	kvmgt_protect_table_destroy(vgpu);
 	gvt_cache_destroy(vgpu);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
 	vgpu->attached = false;
-
-	if (vgpu->vfio_device.kvm)
-		kvm_put_kvm(vgpu->vfio_device.kvm);
 }
 
 static u64 intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
-- 
2.38.1.431.g37b22c650d-goog

