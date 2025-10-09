Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70944BCA723
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921BB10EAD2;
	Thu,  9 Oct 2025 17:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N19mMDzr";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BC510EAD3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:58:51 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-42f7b17f9f7so11200975ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032731; x=1760637531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCaJXGEEoKxacl2B/5AyBFFUSkEK+Qm7rR3SS8wI7Gk=;
 b=N19mMDzr9eKdR1/lfrzPkA1PvTBzmibNeRQ2Om8CMUNm3rLEqln14ORw/og1V72SQC
 4A+tPRp/xjsSMbPh2y3ckR1ZUjVGsyRoBs7SjxtdnrTCMKBFRkOT+6JqzNTiB9/N5saz
 WQkwElcXwZswFxbOmVzp1191IVa63r8EE8ZT625QErJ7ab+Akb7AnMx6RNsgq5Sszhe3
 uGrz3mpO2IV86DaAJuu43q0bXbtQ902zqGfu7YvWN8/eEW9ddYZETAzGLAC//EmBTFdA
 g6ViGc8Y6tyZ1XdCw6Rl0WZ761a5mnyIU0mWYucIi6NMgND8fJrFj5dZiSU+G66PO18M
 0VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032731; x=1760637531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCaJXGEEoKxacl2B/5AyBFFUSkEK+Qm7rR3SS8wI7Gk=;
 b=t1IElRXRdmgRwfvz4gU6Q/BJesNI/2jSfpys75tfMdgoFciCY2FQKreFsN2xbeyo0y
 AmGUrqjoR9sZYZvD+WhYwNMq5RgTioGXGkTWPNtc7PescZphRtJZbViIN+Y/GcF6XH1Y
 EopNy/mBG/YTu3Md9vYnB0Cfydah8ZnVD44a90H9pbAE9VFRnz76zW7+BhBVb5bPGp6J
 3RPJRgHFbUq3GXNp9bHK3Rd+n1uQYoHMRVzIpAhnjJUvUGq5hC0N6zljApZ7gQbjwKyi
 S+sOUmFt6g4Q6jSmO0019HxPn6sXRyTwCigh9M2UpWZZwE/01IJB+sigTqpdj6dZU2ri
 P9pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Ue8GsmYVqNfa5NWVTkn/4Mo+lze5+P/CXlu2EL0k2BM0/xMfTbpZtKq6Z+MUE4ZVnUr34MDRH3ncFPT5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznIsQOReW13EvxcxflKptYRQEF4TEuNdc3q81ojN4JZDRnXeb1
 Mnnx8H8vIaWuNPAb9b6lEI6UPdXEAm878QqF6ui4I0rwH34SD8qhBfNv
X-Gm-Gg: ASbGnctolStHYU0OOyDNgghQb8AWsoRQnlHoXft2qTpnhqL5lOdzxgjHTLTSrdP1AMv
 jKo6TGWEO0TAw7gJerwy4Ty/FzRAK5xRTaTDORtRB4ZWopGS9GDyMxzCgwlHtrHvrvSg0xiLzda
 rx7zLH8I8VH8NzjLlGdwlcGq0ClxQkYro73WlSBKmLWPsnRX8fRpSMVqrTLk4wzymQec11fK6Jh
 2yVhS5zhWK+iBH2SLNx8PUN4Q5p08wlA7kjKZanXAa7iBmaP6HtBZgLp9ODhwc4pWuqv/JsbbQs
 PDSMgGGz+Umu7FSrPfWtWtUatIkicb1yVf3EIlp1fEO3Z9ysutCsuXJM5Y+kesdMM4+yCAseWch
 Fr1F0Zk1LaPl8TEm4ATin9arhYPDwM9w/g6VLvm70hf65twC0DRdBa1nCbTpDoYiprWN8IUuCRQ
 l7o4L+qqrC3ZySFqwoH/2VU+bejzg3PQA9EvWygQ==
X-Google-Smtp-Source: AGHT+IFGYwQAi6/+LnQSrv5XVqN8PJXx4dyNZG3PIv3e3G7kxepvzgPF7iyA+hTKfqnZ5PXXLeiArQ==
X-Received: by 2002:a05:6e02:4706:b0:42f:8eeb:499e with SMTP id
 e9e14a558f8ab-42f8eeb4a3amr54728835ab.13.1760032731025; 
 Thu, 09 Oct 2025 10:58:51 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 04/30] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Thu,  9 Oct 2025 11:58:08 -0600
Message-ID: <20251009175834.1024308-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..147540c57154 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.51.0

