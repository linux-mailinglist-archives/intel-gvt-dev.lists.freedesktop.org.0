Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A559CD5057
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34410E5BD;
	Mon, 22 Dec 2025 08:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RQvrTyqo";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE46D10E5C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:24:56 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso5832376b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391896; x=1766996696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
 b=RQvrTyqooS4I1OuftFOJxV7Vemd2N0GjeH7zs5n+Cc3c2Wgu0PE2S0G2thVLoZgwvN
 B+Rv9O1y1bJpFrIPn065S8AA5c6IcfaQTCEretrk7dYigtGb2QNlWgGH/XSGpawoIUr+
 p65UhHMT2W/0bsKFjgSaP+AcR7LI3OE/8iCV3Uhb6Dz3t8h0sVJA4r319o8n6wn9ohYG
 02x7NExK4A+qbnE10ypC/f7CS1pCsMizQyJla1woaIS0b492HNAS/qGvLLP6ed1vJgjg
 dZeooiF8ETS59lfYbyFhViv1gA0y0b4NCq0n5VuB61UKlwAYgKnOgFPAjxVgY+Boz+u6
 bP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391896; x=1766996696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
 b=ab3DnFhSgNkqvadFeHG0YTn1nEfvlL60IbJWw1YruPKVePjN9R8/KYb9KtSuNjnbDd
 /R9ObViJ9MAb03fh9zQzABJe48n4ZqDdbrkTl9OwKai6I1IZcEu6ECkSaukwLRjgek2W
 Scdi4ct07JENzTge95n6DRhoEIPzwAE+v34+j/1e3kLdiaF/Un1oKJ2DfYqfNtL8yURv
 kb5FKhPOZbI0sWulwpd2Sg7BHs/HREKwncFm2qlt4tW1Lg70gQqQelLFToiUTSzEc3H9
 2uKlWkiFYyZX9bGD5n+N4eQVR4cLmCz5yBhDQd6Zmx7Kc8R1fn5j9bXgexhP2bF4VmtH
 xiDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW5hT/TolYU/9q3hHuqNRGguBV5vLg/PL6+EV32OGXrd0GLC9H+/JehiyT/B1sz4HRquE0W/MQ+wEXmwhj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc4nNe9Zc29/Clbh5OxAQtbH3XfTdiPdUNIgHV07kTDA1Hu6FK
 W5bjmhgbj7EckBUHmmy2jY1LAePjmTrX0/coh4roNyqjRlR9AZztGP3/
X-Gm-Gg: AY/fxX4Ehb6Z5F1OKf8sq188ir+AQKJ3os38S0S2gzK3kzrDRg06w724oAV8Nlsodzj
 +OvqxvxQBp2rnL6x7/NUh8uq5Uxv27V8/jDjnyVbqqa4OFlMLuuLw/epsOI1fy3p3+IuV+27k8x
 mB5zVso6tnZ2ZCAfq1/Qvjus+J3eI4Ezbn1gbAXpXO/KLVnenBzCCikKQdnCvmNx+HF5zjJt+N+
 7LM9dQ/NHuU+zU6Td8fZordFwTjcllGlPMkT7YthFx2WbaiiFen5tM0NtpVcJBKmvI+mIeAKj5N
 TTFbf/+KQ2F9EfVURfaxYsWCu7KvH3uKX9wiN1q6tgzNWsa16IQU1f0ZUNIC73eVVpV+TxjHJWl
 5N21pXCKivqNmfU4mqSGzebb5KgZpRUL3AEUoOZE4eyLEpU3sU7K7fwXRPPR65nn07HH/UmgzKu
 a3Jgsug01n
X-Google-Smtp-Source: AGHT+IEBN8n7tfe9iu0lB0z5JyKVlf1YDr7ixcXKx8kSouS/KoZMy7Fhajpfqtky2YSRXNA/9ikrkg==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id
 d2e1a72fcca58-7ff650ce054mr9990683b3a.31.1766391896403; 
 Mon, 22 Dec 2025 00:24:56 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:24:55 -0800 (PST)
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
Subject: [PATCH v7 20/31] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Mon, 22 Dec 2025 21:20:37 +1300
Message-ID: <20251222082049.1782440-21-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d543b84d447e..c4ebbccca5d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.52.0

