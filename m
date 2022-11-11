Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6B624EE4
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 01:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5A810E156;
	Fri, 11 Nov 2022 00:22:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D4D10E156
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Nov 2022 00:22:30 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 bt19-20020a17090af01300b00213c7cd1083so1847846pjb.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 16:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=/Qtct265AUs3mCRq4YXmCFT3mbV9fW5IFtDc5J2z2zs=;
 b=FBR88osY8fIlZLbRznAOCa2Xf7BHDJaHVBD3PLmB9KlLJqRyRDDLI3zyzsZcD0Rn5m
 5oCwjogt2zecTA7RiD9yeOlvc55mEqbD8BgDuCuDPhgkuTUGCTX+PZfFw8d63rpWQhSP
 4YkKHAyfDPUatmW5/skfXM0hFEJa+6kp7KfEuEWXg7E4DNB1ZzIThCPt1PM0BzD8Xdhq
 A/EPbIV3ybXi65UzJTKQ8T8FJMvIkmMoPVo3GTuq4UapPDYeRJRzaqoquBxRN2AYC9KA
 A/DU8ldikEieGp5BDIr3DGthufNFJEG9FQ/iYXTHPCiQh1sE8mL3YkDDK1B4aUDeO2MN
 Z8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Qtct265AUs3mCRq4YXmCFT3mbV9fW5IFtDc5J2z2zs=;
 b=Rtx0ZAxz2zn6n+zLmcnnvAmdK208QDAo3PXSrsm8gJaBhocBpksjvgnuIEJbdPQ0kS
 LH488z6+nFBJSIhX3jU4PHcZvswQmADjfVqPZErLNTedO+yFCNbohRZUUE+fPQR6Tr7W
 tRkSWtAh+3qB0vUxgxKPIlEovnMpbrBnoJN5860vU7gJsP7IBYqZPx5ulctpRP1qEYHD
 xYKRDax404y/9YhLKOtLzYC+PkRNLEQ4vYxkqh/va10hqXKJsymn9IdjT1lqeFmRJ3YT
 mRwbyJbrsNQ5Mu7uYnDnQQpG+uT3R2DyF2vuey9DJcuUuW46KsdysKabIkpPpu/C3ckv
 x4/g==
X-Gm-Message-State: ACrzQf3rG+I4pw/cv+Owqv5RSULprS6ORAxrCEc+QKHLExezp9FVeA2i
 /e/7v8n/HqqHtw55+uZTfI4KGij2N94=
X-Google-Smtp-Source: AMsMyM7iJ8xUv6oGaaWJB9TjFOHAMhWthcMv2slpXsAbeSOdSGcqg31xUyPwviIZlQaEysgjStUI+jeH2IM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:703:b0:56c:e37d:ec12 with SMTP id
 3-20020a056a00070300b0056ce37dec12mr4208245pfl.80.1668126149761; Thu, 10 Nov
 2022 16:22:29 -0800 (PST)
Date: Fri, 11 Nov 2022 00:22:24 +0000
In-Reply-To: <20221111002225.2418386-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221111002225.2418386-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221111002225.2418386-2-seanjc@google.com>
Subject: [PATCH 1/2] drm/i915/gvt: Get reference to KVM iff attachment to VM
 is successful
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

Get a reference to KVM if and only if a vGPU is successfully attached to
the VM to avoid leaking a reference if there's no available vGPU.  On
open_device() failure, vfio_device_open() doesn't invoke close_device().

Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7a45e5360caf..e67d5267fde0 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -664,8 +664,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 		return -ESRCH;
 	}
 
-	kvm_get_kvm(vgpu->vfio_device.kvm);
-
 	if (__kvmgt_vgpu_exist(vgpu))
 		return -EEXIST;
 
@@ -676,6 +674,7 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 
 	vgpu->track_node.track_write = kvmgt_page_track_write;
 	vgpu->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
+	kvm_get_kvm(vgpu->vfio_device.kvm);
 	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
 					 &vgpu->track_node);
 
-- 
2.38.1.431.g37b22c650d-goog

