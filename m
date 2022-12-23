Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E46654A00
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162710E190;
	Fri, 23 Dec 2022 00:57:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF91D10E0D1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:57:47 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 me18-20020a17090b17d200b00219f8dc7cb3so4004986pjb.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=KwIE4ETZbha1iVHVnmmk26NjJzT7Ww98bDHeI8SzWEM=;
 b=VdmJ3vuW5hwx3kJCnM8faRJP7RuSvtbP2ikWNhpFTp9I9z0DVVcdJ0RfscWi+OoGoi
 MJ2G5H/yD95pjyp//Pb2jYl7A1gWkqRHGZf2J32KbjsKXqp3gU3YboP6KKuyiMaD/AAr
 Z4u1PblzAICguwGToRHR80qO4jWKIisB8zsX66tglczJgHgpnkX/z0MTFX/GN81elusD
 X4oC8eqWPYcYBtDK58vck3vcbZzBkrMVqKhuWer4YBW96UOB5yjMiHVT8pk1wkRZ8D6y
 IoBiiZe2OfEeW8J0ouvD8oVG1pVP9aTU5g6XrC5yWQaGBH6sOX3ntS60GO2VjtyS3ZB+
 hOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KwIE4ETZbha1iVHVnmmk26NjJzT7Ww98bDHeI8SzWEM=;
 b=VsESWa3Klq2QBfedip3I7Y2zcr7mYEqH1XUxyxvnxtDU4btxmcOsjVx+Hsv9NEC2nj
 kq/MJVN6/AWYU0THd28Db4EwPuz8u5hpAQbFRnP7mihkjL130kmkbvUZEp5l+Oq4HHHy
 SRw8UWzF4mwdRxsPqDgYVY9Jt44YNWg1y5+CZR87q8bdq7jDOxLeIiZUtPpeWbzKLLFU
 V85u6nuuLrpyzBwYPMfMWm8RSsGZbjZ28K5Ux8G6iRVouQuKDPX0T5CfP2D0fEzRsDL/
 aYi/3XIR7seddO9EC3Oa2ofzBxbZ2WgcyDg3d3PGH3l5fGUr1kAeGOyPdae8bmcAt0O6
 wCXw==
X-Gm-Message-State: AFqh2konAE8XQyjcxCykp5LfFHADwUWPFxzANqVSt2zDOIo3XtPlUMQF
 ZjAP0zP5+fFhKqDSze+vKiVwz1NsEkU=
X-Google-Smtp-Source: AMrXdXtkgpf6dDrWJjo57M40NYNaWtKweyvUHpN66Us7oNs+QBzk+DEmGWx4z2DdCJIQiZm1KZ2ESd9jW+0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c217:b0:219:aa90:3198 with SMTP id
 e23-20020a17090ac21700b00219aa903198mr779140pjt.112.1671757067336; Thu, 22
 Dec 2022 16:57:47 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:13 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-2-seanjc@google.com>
Subject: [PATCH 01/27] drm/i915/gvt: Verify pfn is "valid" before
 dereferencing "struct page"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Check that the pfn found by gfn_to_pfn() is actually backed by "struct
page" memory prior to retrieving and dereferencing the page.  KVM
supports backing guest memory with VM_PFNMAP, VM_IO, etc., and so
there is no guarantee the pfn returned by gfn_to_pfn() has an associated
"struct page".

Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..d0fca53a3563 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1188,6 +1188,10 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
+
+	if (!pfn_valid(pfn))
+		return -EINVAL;
+
 	return PageTransHuge(pfn_to_page(pfn));
 }
 
-- 
2.39.0.314.g84b9a713c41-goog

