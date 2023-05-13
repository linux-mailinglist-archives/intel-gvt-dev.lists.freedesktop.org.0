Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B87701314
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E628E10E6F8;
	Sat, 13 May 2023 00:36:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B929E10E6FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:17 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-64389a4487fso6259682b3a.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938177; x=1686530177;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=K7Ya3jZlcB5DIRxzkVo+FZAIt5xtGXopE24BSYXVJKk=;
 b=XGrwjfzUB5Z1Jr54Bh0GK3KWvn+DCPj5RUIT8j+z/Np9og8cN1KchmZJeni93Uvy7s
 diX49O5EZtEAZDH2WnfFLiyblqMGn3njDBFEEx4TsGcwwfWlJUozJCqrroNvuCoxbIYz
 J0FqR0PoQrdGlfChocEzL4ehm6rj3oVBLYzpxsgigepwA3t/aWUQalt82flPm5MqOlRV
 yvOJrlvI7bNR8cuw6XxGtB9scFveudIqc6MylQO/+aUTS/d8dFu3I5ONlqZkRBCavgOK
 RZZqzwsCiukW+fDl2ye5ropvD2aVluFjExuqqI/dhyiqhNsRe/dsALVzXvEPG+ETz5qV
 D3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938177; x=1686530177;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7Ya3jZlcB5DIRxzkVo+FZAIt5xtGXopE24BSYXVJKk=;
 b=jvrdicWVW/dAHJbYGRImj8lKIK7rO74pvg5H7mk0nvnUlDNaFzp1hmLG5QIC4pnzrx
 79nB/Z5KTn1in7xRBtlHey3waiYKGnbQNxKQ4FdJkLD+BOyLBFDR495hajOXSrTdv/Gw
 MEEsqYm4GtIkKxHaM05EJjwN63tmi+1lsp1OwdbpMCPsMRkBDMc6F80wKSJMlJiNVYKO
 6m5TZ1BwRc5G5TX9yl7PQGSpgYky9Sy5RMA0CK3CD8Sa0X1tZpJo3asePwqP17Rv3Awy
 HPWmhe+nwKByBDNzQgI4zlPLs2o97QkXy06Nin8S0EMtcGEhyAn0HrD8AqaN/3jgZkUc
 cWaw==
X-Gm-Message-State: AC+VfDzuBse/tY1hfQpxcKnMbM+LeFeZUbfpLC1VMcv0pUjOl1Ux3N2b
 I9USC7cwUTeWnnKOo/cSr+R2ehoWulk=
X-Google-Smtp-Source: ACHHUZ6rw3ymcV2J3+x78P6uQz6mtkbxujPRSeirm0OG2Uoo/pYeAsqh0YVKR+ziA21mJLEFCY5YXAXWSGI=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:3a8:b0:643:ae47:9bc0 with SMTP id
 y40-20020a056a0003a800b00643ae479bc0mr6493792pfs.3.1683938177325; Fri, 12 May
 2023 17:36:17 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:38 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-7-seanjc@google.com>
Subject: [PATCH v3 06/28] drm/i915/gvt: Error out on an attempt to shadowing
 an unknown GTT entry type
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

Bail from ppgtt_populate_shadow_entry() if an unexpected GTT entry type
is encountered instead of subtly falling through to the common "direct
shadow" path.  Eliminating the default/error path's reliance on the common
handling will allow hoisting intel_gvt_dma_map_guest_page() into the case
statements so that the 2MiB case can try intel_gvt_dma_map_guest_page()
and fallback to splitting the entry on failure.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 2aed31b497c9..61e38acee2d5 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1306,6 +1306,7 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 		return -EINVAL;
 	default:
 		GEM_BUG_ON(1);
+		return -EINVAL;
 	}
 
 	/* direct shadow */
-- 
2.40.1.606.ga4b1b128d6-goog

