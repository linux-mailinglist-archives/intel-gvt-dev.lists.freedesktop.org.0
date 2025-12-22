Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F5CD4F9F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D010E55A;
	Mon, 22 Dec 2025 08:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Syu2tmjs";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2910E55E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:22:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so3689767b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391721; x=1766996521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
 b=Syu2tmjspjbsxZBZzGro64cQcQxDsuaF1oafdwsRYTmhV8m9oLv/T5CGThXCSSQpre
 KwrMxpwtrWG5MJP9eiw0dK4sX9hEOF5Olgzz8RN+zkWTdm5bvz8yM1Iti+bTt/ma4xj4
 REgQJtNslUwRe6fs2prz34bzz/FH7AyHFkTIP3tyTqi3HrIOfPYmEEZXEY1qoPdxIhoS
 MG2flnVi8hF9xIDw2wcl44BbzQisCRQdSQKBB4Z9k5l1pHx2GClnvhHADK/gnD07xSVF
 M9MphcIiuAcEISZ/qBmS3WhnA70rBSHcMaUvKJFYaryXyqjUvSpYSkuvkQKDn0w7EpKD
 sV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391721; x=1766996521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
 b=luIX429jqSDYWc7a6jxElJWvlDpG6eeMYkTmd2uE+LTz2Y/DfSgS8yCJqgyzjQBpHx
 vxRoCgnKI4k9WRTJncwgEGh0HErjArY+/7tsiaWcCJst1wI81F3AvE0WcGYoKvaPGoaE
 5WdK2qr5f2h9AA6cAZ/LVWlizieBWW5MJfNrGbiPwqBEgvb+Jes0qfBZPvoRmZjmz0+H
 aeQk+BKv1yqSNaFQh078a6zkZW64MFSRbxmg6Pr0Bfz05lQd8vFXNuzmGKiqtjMBSU/p
 sMuKCs/2EVptWg6W4oOD8SH/vANhSBa86l8fGgmuMAJqcdVTbYhOiwpLLYtb1LDj7R4T
 KGpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsje3KFSqmpQz1/KhB3HwcPxSoj1onVSfP62bZz21h2sCN3rD+8tzhWQaOn7WqZ9XWNmcdnetD5ZvJM7+r@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHMKPsYgiHAsA8XrEE3j8PR7DTp16fdaQs+N3ExLnjP/ogPMZM
 Xnh444+LK4ez9bwqYLixkD2imGhiK3IszNZR47eA6O7IemfbJYdxSvG3
X-Gm-Gg: AY/fxX6Rqtpgy1xCz9P7nzo7FOuJA7xvrbfTFo6iqYQiUlSzqWPWaMm5mLHUFtBufhN
 bo9QiHRfDqlKwiJy+ZJ4LAN8+BRQZJwlADKnQGVqwX9NqjIaHafQDp5BVfodGSQt1O1RzibH2to
 R6xGYWnDYzQn3uzwiB06yOykQ2f82FjoKwOHiZFl3Naym2RYPm5uMHMUQTJFwsaDOiA2L6H37pL
 F0HzxrZcU5Lx0tCkp7YQVtk0JZRzpqrla50kf0g1881tI/wmNBFc7KraCycKEnc6oqYvkhmFhey
 BCEc5RzfYhxxtgt09SoLCVM32qPMRadWbKwkx48lY4aXcvz+9cp/es4P5Vo7y/Gmjjx8KifOe7r
 ZQntbB4q68unwRhrU6dnFE7i7XQFwomOy153A+2vfjFvtKfMsEf/gWR+lp856bgfiosp7brFTTN
 Y0dFcYA75+
X-Google-Smtp-Source: AGHT+IG3eUuB5Tb1s+Zs70IjrZagHo/mf8fIHvmKfCB1AS8Rh4HCdjBPUwGbrg6oNBn8UN6DCsv0tQ==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id
 d2e1a72fcca58-7ff9657d93bmr10043630b3a.27.1766391721087; 
 Mon, 22 Dec 2025 00:22:01 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:00 -0800 (PST)
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
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com,
 linux-doc@vger.kernel.org
Subject: [PATCH v7 04/31] docs/dyndbg: explain flags parse 1st
Date: Mon, 22 Dec 2025 21:20:21 +1300
Message-ID: <20251222082049.1782440-5-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..e76ccd987704 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

