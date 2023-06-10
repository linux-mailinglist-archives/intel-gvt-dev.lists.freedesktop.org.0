Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A92172AA5F
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 10 Jun 2023 10:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A126E10E17F;
	Sat, 10 Jun 2023 08:45:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5347D10E17F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 10 Jun 2023 08:45:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6e68cc738so19374335e9.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 10 Jun 2023 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686386716; x=1688978716;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BW7GdTD5EPhJnwrEgBRkUa3CUUP9KNwS/1fwBa0P3qQ=;
 b=At5zSla/p8xyNvIE0UK3/u/yZXCNa1qDnw9p026CJmV6SDPRd+GxsYPZv2SdLps+sr
 2uE87HlVevehvWNO+o87DWmm3f0yvQBQJrtHWEdABXJMjaWczHA6Ay1WhoUuJUFdZiwT
 0kuT3ndSWwctAcNr2GLdMhStp8HQla0W9l6mcJmcF25rIXh1qphy94ExSryy5b5A+01r
 BrQF0AaldwWNigHxXJvMFumyv7Sla7fyeMiBK2IF8bdlFvzZV+lmCXEokBrYdmpZxulO
 RfwfmHrq5qo32Xes43AspkUQUYiOQEOKic/zhWdqJK+2Oj405MC1wsdnJ9Uqs6/SH4lY
 Q3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686386716; x=1688978716;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BW7GdTD5EPhJnwrEgBRkUa3CUUP9KNwS/1fwBa0P3qQ=;
 b=jZL8ITR2H+JZzFU5WwH7H7wwYvB/wATZXVOZi9Jgjb3cB3qB3CyOGgZ55+UOZN9n1w
 VbnTBLggENKK4EAej61G82BgBx8uJ31f4MCNHxsuJv1grcDSUxQ5Pw2Z/QFxV1ic8hff
 CN4/fSXp2wp4BT8lMFzMezdUXhR7kqsAY0gB2LnV6i9/vxhUcNFzqHOaJTX9db7XhKRR
 T0zVjyfHYrcZBPRc0Z/Mx/oBQacs8AGUfAI8Y/e+V3RlzXKhMYk8M1mRMhcWAAErTLHz
 yLH4DRMRed5fvy6wVS6RV77Ix9MT4gZP2WEv1gj1XSGZDKrqyxNxuDn9xNP+0YPSnYLk
 rHxg==
X-Gm-Message-State: AC+VfDy06X356t2Zhf/O2DjD5tOIzPZYrQhWXQ5qy7dwA1roZvLv59/H
 303t1BS9Vg41wVDq3VU4lxLhx//YSYazsuwYBxs=
X-Google-Smtp-Source: ACHHUZ6OQCrLNk4yjQUlKnc8+HCIJwWsWVU8C8jQ4QOnNXGtRtxjSxCLTlx0lteAu+XCtqJi3GqxPQ==
X-Received: by 2002:a1c:750a:0:b0:3f7:5d:4a06 with SMTP id
 o10-20020a1c750a000000b003f7005d4a06mr2378298wmc.1.1686386716041; 
 Sat, 10 Jun 2023 01:45:16 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c218d00b003f709a7e46bsm4966282wme.46.2023.06.10.01.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 01:45:13 -0700 (PDT)
Date: Sat, 10 Jun 2023 11:45:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: changbin.du@intel.com
Subject: [bug report] drm/i915/gvt: Rework shadow graphic memory management
 code
Message-ID: <93390ecb-a9f0-4f42-99e0-7d859b40eb1d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello Changbin Du,

The patch ede9d0cfcb78: "drm/i915/gvt: Rework shadow graphic memory
management code" from Jan 30, 2018, leads to the following Smatch
static checker warning:

	drivers/gpu/drm/i915/gvt/scheduler.c:796 prepare_workload()
	warn: inconsistent refcounting 'workload->shadow_mm->pincount.counter':

drivers/gpu/drm/i915/gvt/gtt.c
  2043  int intel_vgpu_pin_mm(struct intel_vgpu_mm *mm)
  2044  {
  2045          int ret;
  2046  
  2047          atomic_inc(&mm->pincount);
                ^^^^^^^^^^^^^^^^^^^^^^^^^

  2048  
  2049          if (mm->type == INTEL_GVT_MM_PPGTT) {
  2050                  ret = shadow_ppgtt_mm(mm);
  2051                  if (ret)
  2052                          return ret;

decrement the pincount on error?

  2053  
  2054                  mutex_lock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
  2055                  list_move_tail(&mm->ppgtt_mm.lru_list,
  2056                                 &mm->vgpu->gvt->gtt.ppgtt_mm_lru_list_head);
  2057                  mutex_unlock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
  2058          }
  2059  
  2060          return 0;
  2061  }

regards,
dan carpenter
