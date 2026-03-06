Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC2lDhIzqmmNNAEAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 02:51:14 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B153A21A62C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 02:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7C10E2EB;
	Fri,  6 Mar 2026 01:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fp7i4V/e";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDFD10E2E8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2026 01:51:11 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-673ee2a98b1so5760350eaf.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 Mar 2026 17:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761870; x=1773366670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBdiOYK9OqacwkN82GElrUr530ZKa03hWcr3nX6dVyA=;
 b=Fp7i4V/eOX6IhHuA14XXtTanknN8Y76o3kmMhbZUtog+mOGMjYrexwuiYKbkDcxUi9
 vQScxp9MaE0s19345coQM4gxHl+ChvaIyrUiWnseqZHITdzUDw3qQSghJrKCOZEK/1KA
 zgc5fBUYrHRkx6Ar5X74y09cS2d+FUqtWc84NGVMJYInqWq37fU29dVWlfjspv4cFBsU
 GdWu/08/EiN+uvJdYei5qmpZMYBg78OKv4Tv5x9QdoHgWHPEgxIJqPO7VEhynj9fkfTJ
 YGj8A2umI7k5jrX6PQmPVED7D6LNhuj6lzYiotj65un3MBTCAkOnMFd4WVvpImrw57mn
 TM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761870; x=1773366670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LBdiOYK9OqacwkN82GElrUr530ZKa03hWcr3nX6dVyA=;
 b=hZCDPQb/ZUpNwqlCLozzNeir1zxdYOynRvZRNhu2Ein/fzsUs3X1GBdhaJHPnzAJNe
 sVibLPpe9q3W9dRZnLqSaF8f6iKVx9ZZ9gnefzy3VGcsQ+swLwyXtYKR/Ug2jBmaL2dq
 wvfJccPM8gM64i0n4VKUyJa2mmytxu0MCGCgPE57p9Ym5tYioT/b01QCMw0/Cw/MLd+N
 1YiL0WRWw1YDoOkpCqytHqHlcjWwByGF54Dl1kyW129pzKGwfb7x9Rmkx2xVS3ZJl/Nx
 dhlvkffVO0c4WdJYIZn1T6+pJVm1+ddQiXlQ0zUD04LcJRBAAwzDAYSDPLilYkyNVcD5
 5lnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdEc1PSIvA0xyzcwPXkQOW94IanT3Klpns2yYNAvYOE3GLsllf/FulWY8lP7DjtOezknSrSUqg/SqPwW3K@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJVYsho2FxJDPoC2a/PZsJ9pUhOCkyoozmgDcs1FdH5JTiIDke
 itF5X2OVs0DOKEQy3Wp10hrb9hRdooRpBBesjYjalH8S3eCB1GlyGYqA
X-Gm-Gg: ATEYQzzSv1n9y7P7TjbH1V/8v1R5ZSoR3Eo+Tb/ii3c18l9ArSZEa2sXZm3pVAsLbTd
 t+NZzQx+rLFbCCqiJqIIYL9r9a56ZKHekyGqdT1wdEb2VhgASmfPk/0HUqx/NOOgABgl9wrrmKk
 CfyEnOpFJQJZF4ql8HF8vON0cHPEgP8bynPX49tyZaC0sLr40h6yuqcyHljW0wPeTjEzqBQWqGh
 QrNX3Rel3IAP+4Qs2OuC8joI4XOGiLUuIL8MHFjBpLob8uATds7P81Z1YyjibfZ2dkjQNC/343D
 3JG3Ap+PWVG2LvXaWnTvtjKeeUlmtPLKoDkg3ZCUCMnMHECDH7KlpUJ546sMoWnfjKgUdozFYF1
 c6kONC0nCk0t3870qJQNMUpSma8QI7jMZhkioKp8UNMkBJof69kP3e2kmSdPSz96QkHmaGzrNJp
 +BUx5MhSP8LeV5wp2CvApyqocaUAnGQkkFtC9wo22iyq8gxQ+C
X-Received: by 2002:a05:6820:198e:b0:672:fec8:e61 with SMTP id
 006d021491bc7-67b9bcc0fabmr433464eaf.32.1772761870142; 
 Thu, 05 Mar 2026 17:51:10 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:51:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 4/7] dyndbg: use static-key queueing API in dynamic-debug
Date: Thu,  5 Mar 2026 18:50:07 -0700
Message-ID: <20260306015022.1940986-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: B153A21A62C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:tglx@linutronix.de,m:akpm@linux-foundation.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,infradead.org,kernel.org,linutronix.de,linux-foundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,akamai.com:email,infradead.org:email]
X-Rspamd-Action: no action

Use the new static-key queueing API in dynamic-debug

function _get_cal_count() {
    # Sum all CPU columns for the 'CAL' (Function call interrupts) line
    grep CAL /proc/interrupts | awk '{ sum=0; for(i=2; i<NF-2; i++) sum+=$i; print sum }'
}
function ddcmdq () {
    local cal_before=$(_get_cal_count)
    echo $* > /proc/dynamic_debug/control
    local cal_after=$(_get_cal_count)
    printf "Delta-CAL (IPI): %d\n" "$((cal_after - cal_before))"
}

Before:

  #> ddcmdq +p
  #> ddcmdq -p
  ...
  [   37.165860] virtqueue callback for 000000009e760656 (00000000011de1b1)
  [   37.165952] virtiofs virtio0: virtio_fs_vq_done requests.0
  [   37.166119] dyndbg: query 0: "-p" mod:*
  Delta-CAL (IPI): 16154

After:
  ...
  [   32.189131] dyndbg: batch desc: ffffffff89468028, static_key addr ffffffff89468050 (fbcon_startup:1032)
  [   32.189225] dyndbg: batch desc: ffffffff89468060, static_key addr ffffffff89468088 (acpi_table_parse_entries_array:264)
  [   32.189332] dyndbg: batch desc: ffffffff89468098, static_key addr ffffffff894680c0 (acpi_table_print_madt_entry:229)
  Delta-CAL (IPI): 134

Extra context:

  #> wc /proc/dynamic_debug/control
  1903 15092 185427 /proc/dynamic_debug/control
  #> ddgrep dynamic_debug
  lib/dynamic_debug.c:386 [dynamic_debug]ddebug_change =_ "batch desc: %px, static_key addr %px (%s:%d)\n"
  lib/dynamic_debug.c:397 [dynamic_debug]ddebug_change =_ "applied queued updates to %d sites in total\n"
  #> dmesg | grep queued
  [   26.837520] dyndbg: applied queued updates to 1902 sites in total
  [   26.837631] applying 1866 queued jump_labels

The baseline has the 2 ratelimited patches cherry-picked in, so both
of these numbers include whatever overhead is caused by virtio and
dynamic-debugs pr_debug()s.

Cc: Jason Baron <jbaron@akamai.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index aa16782bc93b..e555a8dbdc27 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -371,10 +371,12 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 #ifdef CONFIG_JUMP_LABEL
 			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
 				if (!(newflags & _DPRINTK_FLAGS_PRINT))
-					static_branch_disable(&dp->key.dd_key_true);
+					static_branch_disable_queued(&dp->key.dd_key_true);
 			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
-				static_branch_enable(&dp->key.dd_key_true);
+				static_branch_enable_queued(&dp->key.dd_key_true);
 			}
+			pr_debug("batch desc: %px, static_key addr %px (%s:%d)\n",
+				 dp, &dp->key.dd_key_true, dp->function, dp->lineno);
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
@@ -384,6 +386,8 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 			dp->flags = newflags;
 		}
 	}
+	pr_debug("applied queued updates to %d sites in total\n", nfound);
+	static_key_apply_queued();
 	mutex_unlock(&ddebug_lock);
 
 	return nfound;
-- 
2.53.0

