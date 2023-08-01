Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D876BA7C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Aug 2023 19:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C431B10E445;
	Tue,  1 Aug 2023 17:03:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065B310E457;
 Tue,  1 Aug 2023 17:03:47 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1bc479cc815so2496002fac.1; 
 Tue, 01 Aug 2023 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909426; x=1691514226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iCNWvd7mdJx34DAX7Wae2aC5uwBwu5nJTt0y8KbTx8=;
 b=aJzaQpO+iKoeSkqk0qUhUXPdCplJv4ISfU4yAwr+5tyWNnq2DaWE+l97DNaAgrIaD4
 7U/oj7kzdf7rjc1jiOrsvsQkkts93G/2xXMk++5fgR5utNmEXIyItX7b3gsnh3HX2TWM
 lXwwP0jT0m8bAqoeHQ/SP6y56Vks45+PrJRT63gecbcpHUBnYl7i8zBsoc3qaYSmAYam
 LULtsUCkhPDSIbvL/bhUQ8nkN8eomoHRDHe9546qlyFP8g2IdNespF3GDg1ZjTIbUl8x
 OqCk6MSjN5DhoftTzGTAizO7c9UqTOTMvZ6Mn4xF7KFX3icVHkUXIHwOcAI0J4fSuVT0
 /9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909426; x=1691514226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iCNWvd7mdJx34DAX7Wae2aC5uwBwu5nJTt0y8KbTx8=;
 b=h0ii9WNZTgtR19qOmamVzGAw9VjeXfG8WGkTxl20nHbHkNhdaVrlcTCuRh9y4SsEiy
 39RiNC70RFCgG6ESdtYVozpDLAw8BKjWck9Qut0x7KL6v73eWuF/wDcPpSNaYfG9BuBN
 QtEdeBcKItt+bYKz9pb+mOg30UW3UwmKK1cFH7BDWhNIkXAqPf7hk1QZNIPgXNLl8DpV
 t0tf7lNozbKVOBJBm1G3HydhG2I5tg78lNZ+lrm3LZ1k+NP7mTxGfVGWWDCJ1VGABd82
 oeX/UFs3v35Lz2iaMGxXiqHevBk3UoIlbU9zgnbWMmbDwhMH38IGAhJdGkVgcXBeLKfR
 idZw==
X-Gm-Message-State: ABy/qLaNySuHUtlsrguxVDVIX9iIBm7aMH54ribpAoaF7/t2wwvUfD2Z
 Z1AQPVQjP3fYbwTkNAEmf2g=
X-Google-Smtp-Source: APBJJlHSNTZ2BaqMZvdSTgWjUX4MA/sAFkg+pUvFWHolW24p/6jpaAEuX5JOwNOA86Kh6n02As3N3w==
X-Received: by 2002:a05:6870:64a4:b0:1bb:fd78:4f22 with SMTP id
 cz36-20020a05687064a400b001bbfd784f22mr13866571oab.34.1690909426252; 
 Tue, 01 Aug 2023 10:03:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 22/22] checkpatch: reword long-line warn about commit-msg
Date: Tue,  1 Aug 2023 11:02:55 -0600
Message-ID: <20230801170255.163237-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: apw@canonical.com, jani.nikula@intel.com, linux@rasmusvillemoes.dk,
 Jim Cromie <jim.cromie@gmail.com>, robdclark@gmail.com, seanpaul@chromium.org,
 joe@perches.com, ville.syrjala@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reword the warning to complain about line length 1st, since thats
whats actually tested.

Cc: apw@canonical.com
Cc: joe@perches.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f6b6b2a50dfe..31c55e3ece09 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3272,7 +3272,7 @@ sub process {
 					# A Fixes:, link or signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+			     "Prefer a maximum 75 chars per line (possible unwrapped commit description?)\n" . $herecurr);
 			$commit_log_long_line = 1;
 		}
 
-- 
2.41.0

