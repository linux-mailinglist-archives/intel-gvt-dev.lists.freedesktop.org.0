Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD0BCA72C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898C10EAD7;
	Thu,  9 Oct 2025 17:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BSnAPg4y";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1293310EAD8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:58:54 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-425911e5661so4815165ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032733; x=1760637533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFKSLN6BiOw7bUnN4PQUQFUZxRNUkszMTNMdPxBofl8=;
 b=BSnAPg4y3FbHu7LGYkZQnNA5KbAuOIMHsNwWGMgmJi/cTdzfaZicoo2h/Y0coDO2ey
 DmbdiyjEythU9uqxMtxyrWJgOEuySrgZMrYAXqrVOUw9EYl5xIZ04yeEjuDnfQObNXhJ
 szGWz5MuMjT/pYV5ama0lw6NGZ5UvteNFVCnSBaqUsTFPXSOXULIuw1cTZIy8fIrZq3R
 Mz+WLZt/GbBhMWzfxf8bnOwQeWSXFnMTYcJIUAAmY4On7+pj6eyrNz5Sxqxej+9D1vNL
 pKN7YU5BCS6Jw2ULXwkwFjPkN6ZVpr9Ej6PJe+Hm6dQyIdAPBLbiRbi4oWJVfM6tL+4O
 zIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032733; x=1760637533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFKSLN6BiOw7bUnN4PQUQFUZxRNUkszMTNMdPxBofl8=;
 b=Qa5T44PiK0664RVryFybxMVJj5+4tyGZqVZs8RYB6CHSXvCOjLUSAMhUXsGy5noRy5
 WDFDt7SkvcBKVHAryqCET8giXiBlrnFSIwt9ZtGR/O/NQE/Iy3nm8itnz4YgPJByGs/n
 BRLhf8xcebJcDVexW7o1nYekMMdK/bH6+UP2ajpUz0wi/BxrJTuJX5wzuXiFdrzkJJ5O
 GA87PMx83BHC4MLna0coMBDBn2cR34cD4rx8J1m8suaJ+D3ekT8XiK2j1PUnquq1mbep
 VGV5RXk+7BbvpWSwr+R1RPnXrdX4fg6H8EgouSkaBNGq7BI6HHpv8CzQWM8Feh+4I0Dy
 zw2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZwDLZGU9Z7ZJaSh+Kl3iXwLITy7+ayXrM94J2Rk97eay+NZdwGKb26+eszFvKoB4Ku10lOXC9uWUYSMNO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVI0H1Ed0oNnl4TITROTjTpgphRtf+k7kWuCHLGakvg87d+Tc4
 OI6cpOqtKAgHJ58wZBMwqMA3erQxI5yoD2rH0lpPnt19PReLHftUzOyK
X-Gm-Gg: ASbGnct4avm1ZZJUijvgH4Ccasu+n6MFlYqbPahvEF3zFcGxAHIe6z+sj71rrbvKRFP
 ftfXoYqoVZ1goTIGFGFrSynAgMM7/L+CyWYT9nWPlFPsNlpTxE6USUATqSCCLLVznMAMsbN88J2
 yDuvI47aWSu2+xvrK4JMSOZNficTfAnUeeRIHIBo+5eZINCHCDH/bQU6i0u2hWAYeT7FA5hbP05
 5dYERWklwPG89FoXFOrmHJY91e/QYimAjjcNYFkMO5sAYCQW8aAu3OgJCJ4UjaEUph2V6YVltxq
 Vnb/fVhtwduRWtNE2UfORO9jCWIMpB2SwkDt2JHxQl+/1ax1fA2EBihQrcIsh7XDx9mwfRJT645
 LXlsOpFCxDZwFm2CL4PGrw6YlPymXI04MSruJd12pt/aapjxBiAhi/bED+NCtklhDUgRcvFxFn2
 QoNJvRvJ049cQx53exEHnI6q7BN2DS1glNM1Dg7A==
X-Google-Smtp-Source: AGHT+IEFgHidntDfvFhDlZruUCJmrkaroGW1qP4eIEz2kkTaQPPkZf7Zvr9cHn+uTBEE/+gwDo4uRw==
X-Received: by 2002:a05:6e02:1a89:b0:42e:72ee:cde6 with SMTP id
 e9e14a558f8ab-42f8736aa0bmr82269925ab.12.1760032733126; 
 Thu, 09 Oct 2025 10:58:53 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 06/30] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu,  9 Oct 2025 11:58:10 -0600
Message-ID: <20251009175834.1024308-7-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7c..ac199293d203 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.51.0

