Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5172B20A
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 11 Jun 2023 15:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824AE10E02B;
	Sun, 11 Jun 2023 13:19:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CC710E02B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 11 Jun 2023 13:19:44 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b072753301so7177771fa.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 11 Jun 2023 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686489580; x=1689081580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3MT/Ma1O0xxdQLJSAJQpCtYd3X9J1umjG5jpEyVG1Kw=;
 b=fTl3DiWF65roZvHOqNB1fHGJt/ylzSIS4Xv+r7rvl/JdiUIMYCkPge1iRh5X124dpM
 O8V/1mKfmQm0JH8V5wsagsaEndrS4FSj9TI5mcdHoUvU9Cnq7YRTZHA7A+Xx+eA8aDrv
 M800L4y2FLDg6bkOvi0OR0yH3gcRXFYb8Ts3YUHTaZ2KtOLi2Nw5+S2chM4NLTB6ltB5
 Vub2qP/1M+dCJ6vmmPCONSDh+Zd/DUNQQEQlV4PiRWSI3/rGIFXL/sFncMsHhXOVMZw5
 zev/uV6dWvpItJMNBuBi2zxuDOgOXJPMORYg7zklViK1/47b0N1CthyNOnAuvPPQFEQk
 Ma3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686489580; x=1689081580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3MT/Ma1O0xxdQLJSAJQpCtYd3X9J1umjG5jpEyVG1Kw=;
 b=DXj5U8yBLgR77USxOkM5WSghlDdH4oHUo2Bldedp1f6Txl//SNZzaOPPUv3tCic4wi
 yan3ru+TH4Jw+44X9osytg8QboLhn7KHTUDIxt43BxVFJ8Xyfkus8r0jEwU0wgqbBQ9K
 1HV13RYTlq+AphvOpB004ocIl3yVAVGhA5n/b50R0zy0b6j6JKazaW9/GkMUnZYBMKRx
 erm7MJXUOx9NIg44b+FjlQKPvavadY25DOZMXcq/+VAIw/FWQ/sqUwMuwGYB5Rmxct2a
 KB+QRTIBFMy1mOzAnWWeiQUbP4OI5rXV4MgAwTlQ8Gi5brJulSAnxQnTVbPlVIIFgQOw
 vTtQ==
X-Gm-Message-State: AC+VfDyRB5wjZYyx8Hg2UpGryC4WoWD+NURzY5SJHqE3muthh/FbSHMU
 +nCZ4i+htoqUBZJInvmR4/wxyFnECDwXXw==
X-Google-Smtp-Source: ACHHUZ6UmKohah/CR7mbbmTJh+/VcYaCHlHHKlZaQFJ98AxtpKGMh8++8KDBInYkhEaknIdKouFANQ==
X-Received: by 2002:a05:651c:304:b0:2b2:4e86:63af with SMTP id
 a4-20020a05651c030400b002b24e8663afmr1584285ljp.2.1686489579730; 
 Sun, 11 Jun 2023 06:19:39 -0700 (PDT)
Received: from zhiwang1-mobl1.ger.corp.intel.com
 (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a2e3e13000000b002b1edfe817fsm1283130lja.88.2023.06.11.06.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 06:19:39 -0700 (PDT)
From: zhi.wang.linux@gmail.com
X-Google-Original-From: zhi.a.wang@intel.com
To: 
Subject: [PATCH] drm/i915/gvt: decrease the refcount when failing to create
 the shadow pgtable
Date: Sun, 11 Jun 2023 16:19:35 +0300
Message-Id: <20230611131935.6625-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

From: Zhi Wang <zhi.a.wang@intel.com>

Decrease the refcount in intel_vgpu_pin_mm() when failing to create the
shadow GPU pgtable in the shadow pgtable pinning path.

Intel GVT-g tracks the usage of a GPU shadow pgtable via manipulating the
refcount of a shadow pgtable.

However, the refcount was not correctly decreased when failing to create
a shadow pgtable in the intel_vgpu_pin_mm() in 'commit 2707e4446688
("drm/i915/gvt: vGPU graphics memory virtualization")'.

Decrease the mm->pincount in intel_vgpu_pin_mm() when shadow_ppgtt_mm()
fails.

Fixes: 2707e4446688 ("drm/i915/gvt: vGPU graphics memory virtualization")
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lists.freedesktop.org/archives/intel-gvt-dev/2023-June/013750.html
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 4ec85308379a..0f5e6125c0f0 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2048,8 +2048,10 @@ int intel_vgpu_pin_mm(struct intel_vgpu_mm *mm)
 
 	if (mm->type == INTEL_GVT_MM_PPGTT) {
 		ret = shadow_ppgtt_mm(mm);
-		if (ret)
+		if (ret) {
+			atomic_dec(&mm->pincount);
 			return ret;
+		}
 
 		mutex_lock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
 		list_move_tail(&mm->ppgtt_mm.lru_list,
-- 
2.25.1

