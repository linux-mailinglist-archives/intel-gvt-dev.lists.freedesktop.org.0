Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D16BCA724
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC710EACE;
	Thu,  9 Oct 2025 17:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MxdBUltC";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E3A10EAD3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:58:50 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-92c781fd73aso115607839f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032730; x=1760637530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTjH4sGVjFOYrHuOXXQp8+DmE+GbVi2pPpgMotQBb8c=;
 b=MxdBUltCGjYtzDyl5bwKvwl0amAdd8y6+7zVYo3CyUCyUu2Kb38wRgYidUt3vQM0DI
 ZjQuQ858S+iAZ683+p5GL8hIUUbX2CPceLV6g7QGiwRVkGW17EqWYm7xwOJxyGDOflMl
 Zp7AI2N6J4SMvMF8AvVd271F0B5bLATpqKVF/swIi0GNdTgZYHtKKilIRKDnjooZwn8r
 xWGUF9cz1hUmveMIcYRQ2OxaG/bAmHDMbFEJNvIPKXRCrGfO9wna505NtL6ARagcIcXW
 Ttc7lrS3qwjuptzZcq9HAYiFvl3j1KyE8TObJKSe1qRh5UZTtOgcha/JnQ4JS8V3/tuf
 9g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032730; x=1760637530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTjH4sGVjFOYrHuOXXQp8+DmE+GbVi2pPpgMotQBb8c=;
 b=McR/j4DMaXqfnQNzNRcWmyBSdWbPudUFJXySd3quDhjxfo4Roo10DC3FwFqiwhLuhn
 tffSmST2YilGzTx/pF67CI3dk5DfkIxotkeiM9IWh7M6oZEtTO52Hr6bfaVsIutSKrlU
 iizufsaF/MWlhrkprTbq/DqnYaihgv9PvXfxSRgrl4NETLRjnbyc1jjPK37fZk2EBnP5
 9x9F3491ZRHKMSBTDHgHYMS3kQ2ZcEidCXWIhVwe0jib8BlCpmvrHsjiHuy65kF1h6FG
 VyhQyisNJQ17E6+FHxeHi4jvB4wXezKUjxJ8/p1H7WI/I4HRuJzRGyJ2B3E8c7KEDvfc
 CGIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQUTTzo5q9Ivrv0bh9Zg2kXxoSCzOo+PSpEdm3te5UzsWyoXL82dvf87zIjtByBrmir6OnM+46Bp7nI9ik@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxbzzBefUexusw8tKfa8JDQFcw0onwZfd97fk4eR1tmHJIn0Wy
 K/G/HaJEhNG3kEaFKhA6A3VVmGyciuyagaZ8GWBrshVvrNfTFudWyiNY
X-Gm-Gg: ASbGncuTWjb29OOKFyPdMjHGBF8OFumWm9b/4jgroBCriSAFNF8byUG4SACc+hIWoYQ
 pUFVVwsshFPsUAA497Gkp1J3EOBN7Bz5RobzD9BDYJfAYVFbP8kcDwF3fK+Lt+7D/jLJIvW26Ro
 Kwsgz6kpOwzRVn9QFMDGUdB9oQm4EZcnrFaZAKHno6LSnZRX75Pw/i9vlboGZHEB/+U544haFru
 cnHqoYM81ovfCjHFokkTcUIYn4GRpAG06aetHSFd3ylzTr/VtJ+mug0JJ7kgrmcKR3VDboR9wuZ
 Ty8MZqBfVbRkTVyAZI94Uk8+p2t11R1P5v6JWOqHEMCXPyMDa6eOxm/cPO1Tcxz+PBFvZWqM/vg
 GeWuHaKJa9DGdV+oty9anolWhZqgOWgEbxAazLVbL8G35Xhbm68fsByWMa5Ahp1/e0X0rEGGbg1
 IK71dRKggXXuPxqkhBsrL3rEr5du7c+5U34ghkwg==
X-Google-Smtp-Source: AGHT+IGqp7iPYqC+hSmWS9kXElNlvxppUNSCrpXp6d0YnM0eWjcHcBKQts/HVhk5zAlEdOdTjEStJw==
X-Received: by 2002:a05:6e02:1a44:b0:42f:8b94:c128 with SMTP id
 e9e14a558f8ab-42f8b94e60dmr60429525ab.28.1760032729943; 
 Thu, 09 Oct 2025 10:58:49 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 03/30] test-dyndbg: fixup CLASSMAP usage error
Date: Thu,  9 Oct 2025 11:58:07 -0600
Message-ID: <20251009175834.1024308-4-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.51.0

