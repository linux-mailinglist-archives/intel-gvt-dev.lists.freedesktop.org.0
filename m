Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70467CD4FB4
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5401910E568;
	Mon, 22 Dec 2025 08:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eNza9X9c";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11610E566
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:22:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso5830098b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391759; x=1766996559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
 b=eNza9X9cWDOMp2GilAlg91Nzc21blG8h1Hc0U/KUi5BTUkG7ZybroPG41eRKjuhO5e
 A8tFirPssDMIwFgU9j306iDKiOpa4M7CUciZ5X7PGvKh7wEZRTRHsPE1oLaxhk/mhzMM
 EW9V35TGtd46aFBvkO42IyutYy6DrKt221sQyjWB0vlF0d0HYhFyZtCB18xoS4mFNcoA
 CAZrSiVTBTuK1Ay5esg2sxSt726VYJzjwyYtjguUUSDXOHVCzrZbHAz8lLkueLQ1gcqw
 S6o5JkDYr6JVd0s1y3RlSiEVnjgDUWglC/dDWElI5+w6qeTw4f09+SICD9/GgH/X8eAu
 YWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391759; x=1766996559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
 b=pIkf6upcKUhPgAVJgCBwM3BYyM1skWuu0TH/+4KDLJXrdGuDBV6qqgVkT9as5JT433
 JWOvlC686rh1ruq6fpnoSDnwETm3m7tTQKWJSVix4pGUCBB8J8RZJj4wZPAsDU+B1wyA
 dqv3Qe21bmh6VC2kGyin/gwEnENMA0Ff+VR4ACjRUssLhSznc4gsnz0nF2em/Yb6a7lt
 2a5hJNuu4wiCnats6rzlzWvuWCaSz/eHPZ3jcoQX2SNn3BToVChojwCBG4AItXH7+YbU
 GIW0tZSP4i6nTHnhA7Ko6nVEHBa0BVg1EuJWmBtMbJky1+RHhv3IDk8yRZhD5e+BkFsd
 3SYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPZEQAr7eotur8S9CPS6h8deooQXX/jfCvUTO+sl7X+DcU1jiiD9zz65tLGiDtakHLKu63fSJuttVDOCDE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKs2iq7mONpD7nilI6oQ/r7+2lQCGf5tWw0Uqpg3hPEvHwCyqw
 KgaSaOYL81ZCj81lEjO60WEt/b8ogp7TEDXobE4TcLmvnSBMQRPcC5pu
X-Gm-Gg: AY/fxX6/IKnayE33MZ96kSdhvt0XUYd4MkecV4nHX5bdgojLwAARs+PBpK7/8RKikxm
 BZ6gCZFsm1RcIYfi6ESY6F/iXwJWNuk0LeKtqbo6CEI95YbImwiU1gksOK4VgZy5FmEYf1c88By
 koqgw0SbXIdooY215lqtRm1xUiioqzk75H1V7vnHW5SD2MDMUFTiR1Ot97TEZCs/KsAN5WwVXYo
 iTEqB3xFvWAYrtp/tS/6PZNC54QspwSVwt3oX/YZ0xE3YhO15WI8dUZlhxa1otWnB//dW9HRe8P
 jx3S2v9xg7xwwuIiMUyb65DGe+iIneR40DSbIh+QELxicVGgeV0F+iyGO2wdyAsbfY67tSVs88W
 J52D3184JxO8UNZBaSZDu5jASg/nhOjErz0r8q3a7c1iHj46B7vuRKV8TXj79p9BRXM5dzAxgff
 hSWI/OVoFQ
X-Google-Smtp-Source: AGHT+IEbn13GAc82azOlCQBzD0kgiJPbfq4yJfKj6lNc2cko7ljpTpb+ZvesmNM1IQ0X0cprC78m6A==
X-Received: by 2002:a05:6a21:3395:b0:366:2341:4980 with SMTP id
 adf61e73a8af0-376a81dd746mr9694106637.11.1766391759442; 
 Mon, 22 Dec 2025 00:22:39 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:38 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 07/31] dyndbg: make ddebug_class_param union members same
 size
Date: Mon, 22 Dec 2025 21:20:24 +1300
Message-ID: <20251222082049.1782440-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98a36e2f94b6..4b7c3b997657 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -103,7 +103,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb171088850c..d2ff203d0873 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -810,7 +810,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0

