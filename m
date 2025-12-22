Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D278DCD4FAE
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B098B10E566;
	Mon, 22 Dec 2025 08:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKLtnzj6";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D8210E55A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:22:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso3689671b3a.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391748; x=1766996548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
 b=hKLtnzj6qWyMUEvZ6n0Wha1kMlHHX8NKuPU8vc8FRKwL2LQSRQyKyks78b1aY0c8dr
 chQ55OikODbpoTWW8/nAHK16cENFU1MarSWDvCrKpserunbDfv4SZSAu5x+w67YMtweQ
 jmwrRZCXQcpN8+Caie5ianEJZkX/4tzsSEhQ30wPUuso3kj1fv91NYG/v4HdzJc96Tky
 qZbFs1N+24vqVc2nHe2unGyhpXtD711aXWKfwtFAtEjTd5YZCV35AefseMQr88pBnH6v
 oet93qmIkMiAMlcSDyqgY90pUcM8E4UFUfwTFgG9SeALcsXn6MZWwAYqPnM24IZjFvZl
 TVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391748; x=1766996548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
 b=mUXoiIzW4RtUyCxSAPV0D3AgnA7/47lT2y6tngJ0O9UOPYagoaYRACCQdFG9SyYRr6
 AdL6j1Ednkshbselm+BfULslDGh7FRfaXwBmYf6k+NbfZqVG9zx8F0nT9osGElwy3FRk
 GrODesw6a/PkLgZ+KWPdJ2oW4YCT7vUgrYa55u44sSM18x03xpqP+hhLNrgwxIvGNxJ+
 RxwobcWszL+ONblbM9G8FjVDQyY51d8LrxavYFge98MagdqN2jIPsl5e4d6bUv7Wa5nr
 wehfP6EQAkzVa2owpHDcY6JbiXiEfIcmaXHwwWOwg6gb5kiY8XQ5VUEv7tWm/YyEcYKx
 q/hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQjDyfynR2PtT6J1HcVlkxkUit/6X6t/2ff/q9SX1soqqx0V7ryyOszRQReR/7fmhVinjaAo949p0OwDyu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjNQlWcrt+QW5G3y9cRAO2JnKoR/WbTN1F3GTkwgiH5kKRpwUc
 RUZc1Yn2rRCQutwEnyprB65XaXOLSxUOu0TA00xmBOte9N6UkY8V+/mz
X-Gm-Gg: AY/fxX7e5KKowpVNqhrnSXboJUbpCqu6Uj1ygaTgjmYCCBwRQm6flVkKpTih3a+appX
 geUuHDCMTf41y/l4zfINKdgkhYTbKChkXSVGD3p1znMY7uQVDA2zmb4rxSlSiKgs0iThV0kg66R
 hv59kJJHCRgH+6/f9YniMdNldtephh4ZBJSxfmFBCN2bIbZ7tL+6wQ5s9S8vG78cTESLzeLDYRF
 VEQtM+wpPOXRFta93Ipf0tysqdmZz8TTeCEsqZvv4rYyRZ1R4t6SSfxX0UjLnqIVXP9kO6K+4s3
 VUqND8td1qaQirgtns1xuuKzlKnjAER4NpcyXm+y4x0vMmv1Gjt+pFAKWt1OuJL6PBmZY1p/jis
 d+JU6KPLJYW9gPEo3vWJys4H4/SagHlLDrUV/V1tzA4vkZbKRIfh2I7gifq9h6aSXnwNJeVUgFt
 MX3F32hj+6
X-Google-Smtp-Source: AGHT+IFIaB8eWc1HtVa50QiWjAkChZ0TUx+nROmHgF5xveLYAYPTgHVZsZQQy8Wrx7bUcj5BQhCb5g==
X-Received: by 2002:a05:6a00:a24e:b0:7ab:63fe:d7d5 with SMTP id
 d2e1a72fcca58-7ff648ed939mr9692669b3a.20.1766391748333; 
 Mon, 22 Dec 2025 00:22:28 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:27 -0800 (PST)
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
Subject: [PATCH v7 06/31] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Mon, 22 Dec 2025 21:20:23 +1300
Message-ID: <20251222082049.1782440-7-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index eb5146bcfaca..cb171088850c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1165,7 +1165,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.52.0

