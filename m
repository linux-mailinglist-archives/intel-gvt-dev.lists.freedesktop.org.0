Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716B4BCA718
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E193110EACD;
	Thu,  9 Oct 2025 17:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HLWLzPwF";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E2E10EACD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:58:45 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-42f5f2d238fso5466385ab.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032724; x=1760637524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BFoISqrXfzunSW6Z4lpDyEbHwjrfmpqrwUs/T2P0T4=;
 b=HLWLzPwFjDVlA8/LiQVysznL9yTgnC3IGb5NHs3sEFmIAP0/rcys6dm/HzSQSA/aiX
 QD8aRHEmzKGwzWZ8JYal5ACE8sPIPwB5FsLnnYoHv8iqshdJ1D+LiY+xe/3+ddLIWA5p
 cqn4htZmyCkjfHG/v7p8PXXM07DOIu/nq1F69EBCtEwI/XLUEQ87t0+ushp1gQf2icvE
 qbz13D3H6Y3eIEeNBJWw73CIls45EU1qrt8HBgEtSis2IBBtoVu6FKOlE+XopYIzbHnp
 v+AVZx3SLt9iuslpRpnRQiFFPhKUrPFotanqOPcotr69BNvQEXIXH0lEO05Vx5M16dFA
 iiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032724; x=1760637524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BFoISqrXfzunSW6Z4lpDyEbHwjrfmpqrwUs/T2P0T4=;
 b=i96Qvd2foqyB0ohmopa5fqfUw9SnUBgwB1l78Ni0m/DS1rLBE9Rwmu/SDZMaraarQ4
 W3XQw1lgvKfTka+BfkLhuoMoIk3Dgt1+b3cRdxLVS33hSuPUbe06taBecAta+ayhx4ot
 O3uTJKa3ZxIRLWOa9tGtvlrnDu7H/0cib516f3qQJFkWfyZ3+FSQ9sIfd3nMGwiAQRA0
 vO2upUUipT2G8lr1hQwFG/+1vRo54BiCH5xSurDswcLBJmph0qO3q/jZePdDhiJSTIsL
 Zx8r1wWhGsxzJE/Gunm1WkWeEBWSSaG5cqlBrb9k2T8mUqgJZZlaa3Xjakf8dySEDyzx
 iFnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBLF8ZKazsgWqZVLf1Ps9Kx+4kPmzsH/GuEEzQK4ZOPnOA/F3QLG2oV9EI8IjIrYEjJlmptWvZyZWWsEpi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHWOSc6RaCaSPlbPIuA3XnlOX2OUNQLedsT7OnXT6AXhMJagLY
 Nk9zw54EnFPyiiKNVfvD3jong4sTHWra/HGv8cWUZVC31EYXZENP8Bp0
X-Gm-Gg: ASbGncurXAiAxjC1SlrA01FPeN4f+93XCejW+vv8wgOipbLCul5VDgxqoipOyxRK6B7
 gx7/WSuV0O5uB2OMhG0oKDNi8rP14DF/Xn/BrGgOlaz3rxErXKX2mipvkhkJv0E7BoaqHU6NV5e
 Yjq/n5DbcNAgnBFc3USHx7EgA8UkhtAvAkED0hYRSGH22hIkqlgLUON5rgshTFJQRqR+1ecXkW5
 G4G6kVnFO7AzgIGiU5ryORdtev6Y5jVZ/Gmy+XOgwujqVRfa2+xZUp5jaHs/8/usxKjO3pzvuOa
 HBHsInEloEHePJwTfQTWAKZXDywtPVJWbkl2gA2Vyt3k4DxXwpXwl+YFxOx6M9FG/8Cw9wXeJ/h
 mziWvk6NT/NejwJ2uNgPUOuiTPpoAJDMbqLwxn/67SeIekt6MzABdEXG0/FfZ0A9r+Dq+YGYTx1
 1nqhWZq1NbXEBziMAk14oPDGgEGW8=
X-Google-Smtp-Source: AGHT+IFdvzN/Qe3kT6LC4KV36Vpx8Hont4QG2a9m6SfK0vqpuJ8k6n9bUCxYy5aRpvHqGEB15mxCww==
X-Received: by 2002:a05:6e02:1946:b0:42f:96ec:50a5 with SMTP id
 e9e14a558f8ab-42f96ec51a2mr14056415ab.20.1760032724385; 
 Thu, 09 Oct 2025 10:58:44 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 01/30] docs/dyndbg: update examples \012 to \n
Date: Thu,  9 Oct 2025 11:58:05 -0600
Message-ID: <20251009175834.1024308-2-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
-v2 fix missed \012's
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.51.0

