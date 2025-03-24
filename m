Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C3A6D650
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 09:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB3B10E233;
	Mon, 24 Mar 2025 08:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mh2Xl1z+";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA010E233;
 Mon, 24 Mar 2025 08:38:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3418167f8f.2; 
 Mon, 24 Mar 2025 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742805488; x=1743410288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lI99fnwoye6Q8fICOi58sOTUi88dGA8Wbff6aKoV7EI=;
 b=mh2Xl1z+Q9MyLqF80CU3OANdYN4vLxs+cs3NqbL4qs4lN3U+jt5LNIQiKlAA4f5rtb
 tNeGhusrJ7F6rMxpIeLL9GIqn0m0z/5GIP7D9mgUtCX3D991ZOeDyZwKo9N89AOwVR2V
 FDwHGykUInZwKEGYMbbBh33uK8QsU8O/yOtI34N9Rn8za/08d79zw3bvWL8wq7ruCW4W
 T9M8BQeTdbh28Kg30UXGaD3KbDGOTJTLKPYiyEKDz0+NDvOLxCM/Fq+aIYZI2rKSXGts
 G+Vbe9pewgqvwtxKQgLu5invMU/OmZDQ3ZlRPuY+vRL+NpcK6mAbq+CO0i6QXIWNUh1z
 h9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742805488; x=1743410288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lI99fnwoye6Q8fICOi58sOTUi88dGA8Wbff6aKoV7EI=;
 b=ru2V2afm+USu6gaqWtFIAba/LrxVbm0VuarvWADUHSZTM4kIUpSIyhHYYeIHIZXwyr
 +sDq2jqHU+IHtgLyWCgr0IAmoaaD5iXmSUIaGvdZkjWlIGQcuf6Ci21PYXOGWqEXN0SI
 Aj5x2J7LZoeD8XkEqbvlT3cbCUEkGsURGpz36ddF51JY3Clr9suXT5CA1d/8OJk52zIa
 tjA5LXRi0HC0ZPEUgSg6gEV+JOhPXHHLxVruF/+zLHw+Q9lVpLW8yahelD7ylKnIDzwM
 zPb90GorBKSrpqNGuPw3x/n9QsFes+ElHjsik1w5gntLIIlMUfoEOdytgJ2Aj1DbRraX
 Pi8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcdDHq5N1bgeWGOOpvHU/bvuEZG6aIomvnlwKz5KbWLpAdTbIBGl0aM+dIFnGwEsp77N/hQcPT1Mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZgMDf/4WuGEkZRmNGVoVV6BXUqJlQw2L1MkbmNTwI59u5Wetu
 iQUyBopNMTq6H74X+vcPq1snQ+ljZ5N2Fsm4pF47fVmL6e8jjERj
X-Gm-Gg: ASbGncux4cgD45wh7JWJeTri33xRJUtJ/QTUAPlTDtZfda/skASahBEZeaIPmZx2XnW
 a66RnJ8C8cwIntL4durrG/JWlcUGE4YNK84+Q8pY1AhkRtrteCS8EJDu+u766mK/JUHAiiWTKCG
 5h0dqUhqDQeLy88fHfdwQCGXYsYymV8ADrTfLztGaR5kWcTRfyEebnwyuqFSRSga9/N6UNRQ9s2
 NbvHNDkevVIZJM9le+jJCyXPByuhmtHNNJbz4dJN2MnmkBlnqU/lXLw2l5xFiq2ITz62f9Vg7Fh
 uqKCjBm+4LudRI2wtNKaYQRh2zW935KQwsnq1yhexJBv1DRcQ/3pP7zCJFqwddh5r3/hkL9b
X-Google-Smtp-Source: AGHT+IE5dnmZzlumAHOzeYmTNsGGoPkMWQP5cGeN5N9XavHeq3hHLFm7ggnXPVJJElCrQxSW73xyAA==
X-Received: by 2002:a5d:5987:0:b0:391:43cb:43e3 with SMTP id
 ffacd0b85a97d-3997f940621mr9615494f8f.46.1742805487437; 
 Mon, 24 Mar 2025 01:38:07 -0700 (PDT)
Received: from arrakis.kwizart.net (home.kwizart.net. [82.65.38.83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3c2csm10078670f8f.46.2025.03.24.01.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 01:38:06 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: [PATCH 1/3] Revert "drm/i915/gvt: Fix out-of-bounds buffer write into
 opregion->signature[]"
Date: Mon, 24 Mar 2025 09:30:01 +0100
Message-ID: <20250324083755.12489-2-kwizart@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324083755.12489-1-kwizart@gmail.com>
References: <20250324083755.12489-1-kwizart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This reverts commit ea26c96d59b27e878fe61e8ef0fed840d2281a2f.

This fix truncates the OPREGION_SIGNATURE to fit into 16 chars instead of
enlarging the target field, hence only moving the size missmatch to later.

As shown with gcc-15:
drivers/gpu/drm/i915/gvt/opregion.c: In function intel_vgpu_init_opregion:
drivers/gpu/drm/i915/gvt/opregion.c:35:28: error: initializer-string for array of char is too long [-Werror=unterminated-string-initialization]
   35 | #define OPREGION_SIGNATURE "IntelGraphicsMem"
      |                            ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gvt/opregion.c:225:45: note: in expansion of macro OPREGION_SIGNATURE
  225 |         const char opregion_signature[16] = OPREGION_SIGNATURE;
      |                                             ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Cc: stable@vger.kernel.org
Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Fixes: ea26c96d59 ("drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 509f9ccae3a9..9a8ead6039e2 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -222,7 +222,6 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	u8 *buf;
 	struct opregion_header *header;
 	struct vbt v;
-	const char opregion_signature[16] = OPREGION_SIGNATURE;
 
 	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
 	vgpu_opregion(vgpu)->va = (void *)__get_free_pages(GFP_KERNEL |
@@ -236,8 +235,8 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	/* emulated opregion with VBT mailbox only */
 	buf = (u8 *)vgpu_opregion(vgpu)->va;
 	header = (struct opregion_header *)buf;
-	memcpy(header->signature, opregion_signature,
-	       sizeof(opregion_signature));
+	memcpy(header->signature, OPREGION_SIGNATURE,
+			sizeof(OPREGION_SIGNATURE));
 	header->size = 0x8;
 	header->opregion_ver = 0x02000000;
 	header->mboxes = MBOX_VBT;
-- 
2.49.0

