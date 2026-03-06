Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOAqDhEzqmmNNAEAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 02:51:13 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7221A620
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 02:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E75E10E2E6;
	Fri,  6 Mar 2026 01:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OfbcGuQQ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC9B10E2EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2026 01:51:09 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-662efd1bdd4so6117073eaf.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 Mar 2026 17:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761869; x=1773366669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bUT8OXayauJDeUXGjkmGNUpTYIk2PPPOV9CpVsGLhj0=;
 b=OfbcGuQQXk7TnXTWL2CayiETbUGRKuAKDLAR3z/uCEMjgD1qBeHy/yzGSMXVupEMGR
 b1I577PMAa+ymRxUfpTRQXdzugWJYIduWvXZrB54JmFZhkXboxKMmFkQ9KQZg7g1tkjw
 TjljFOJJT0AeGdaGlc4mOXCpGrgtDv2ILtydNFZ2xtcSbObXuuOS5mGaHMfL7OGpCd1r
 2mjRq9CV7R4jK6R05IaJjfIE1RYWxBoigAB3fSHA5eaOTd4A9Y0LGKth9zLoFGeVGxit
 JGMZS7rLQEu13s66hLif+27ugwoSsWUzlVvKDwgCcEWtKmmU8i4PSoV+qK0ypcrsi++p
 3nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761869; x=1773366669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bUT8OXayauJDeUXGjkmGNUpTYIk2PPPOV9CpVsGLhj0=;
 b=IqJKxzN5gQaFcx7r9G76i11kKTrZzQA85FRH5uf5AeZwp1FbOKDeUTPEyA/N0NfK2X
 lW80kPRFZKTYqBYKr/uXV81jgcP7JLjkVTFoaAG1Bz4WxaynmAuTyaBLjSzHSZU0RlCq
 jYgw1R84V4OHoJrZkUHZWZvopfhJgWoNHSE0zyADWAT3VJXEt/M2QZiX4jEpf2Zlc3h/
 463akKyrt/JEiT3RB0IyIVNmGEvNKE2amhAt9dPzEadHr0h7CKXnZ/DYRkviBrd49lsB
 cxmh4OXCzK0ygjipBryc7jdlKkSS/cFT7zPk1Nr1+iruHc0tqqgkbQl2Ah2ZY5EuZc/l
 tSig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUMVEfIjtBTWGNuGQFwRN8oEKHJ6aw5XllwCI4l8KL0e0RVrYWtRRV/FQwQ/XijiuNcywsY0YRoILeY6H7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxBAzIpyLWxvpzgCRgA3MphER3JxiHFX5onolTM0x03GL+jvor
 OpI5hfBKU5O0a3QLZtwVPPaOLE9W2SAFbjBeQdbpMuw1IpdQWElzYTmJ
X-Gm-Gg: ATEYQzyQhDFuI/9pP6eYDY5UtTgtlmocZJEeWjYsnu0GQ3SBOa1VD1PzQGvMIHGMe0C
 tyAg3jsskNbMaENOVNTA3ImsTG3b24hHR5Q/RCOwCrmfckKSg+I8FOZE3KsZ/nj0f15wTigvVe7
 taeyKZujhUeuqBae/txfL15J0o4gqVT9+AUhi1BvussbzolykSoGQtVXwNgxMABhU5gVdnvTpgh
 di8qSg1QBcKzV8tOJyTbGIGyz/XWT7UNgDrXbWZN4HS51ota87gsdkF5ot1THWJ9EMjv/0y/eYC
 Tv3/Of8eXUiM5dRbOrVzrwlhknxc3J4Wq/yrMZ01HsteLBszxJ6VPTvDL3TsONnEEWmDVy+nkW3
 ohU/x6+j+qZ2pXGPOCBwqX4NWYq12NgbVdN0tklcwvd9d+46DtboS6DMyNt4jzw+hHdeQnvtAw6
 O+WuDI+AgIEFRs/1ZfRlvQ6Bl444epPvxDMDxa3LJs7JQFzC1w
X-Received: by 2002:a4a:ee14:0:b0:677:3b8f:43a4 with SMTP id
 006d021491bc7-67b9c485db9mr276619eaf.36.1772761868900; 
 Thu, 05 Mar 2026 17:51:08 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:51:08 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Joseph Tilahun <jtilahun@astranis.com>, linux-serial@vger.kernel.org
Subject: [RFC PATCH 3/7] drivers/tty/serial/serial_core: ratelimit
 uart_wait_until_sent
Date: Thu,  5 Mar 2026 18:50:06 -0700
Message-ID: <20260306015022.1940986-4-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: BFA7221A620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:pmladek@suse.com,m:ilpo.jarvinen@linux.intel.com,m:linux@treblig.org,m:jtilahun@astranis.com,m:linux-serial@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,suse.com,linux.intel.com,treblig.org,astranis.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Ratelimiting these pr_debug()s can reduce the console flood during
bulk dynamic-debug activation, in environments where a serial console
is used.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/tty/serial/serial_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 487756947a96..6db465619c70 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1790,8 +1790,8 @@ static void uart_wait_until_sent(struct tty_struct *tty, int timeout)
 
 	expire = jiffies + timeout;
 
-	pr_debug("uart_wait_until_sent(%u), jiffies=%lu, expire=%lu...\n",
-		port->line, jiffies, expire);
+	pr_debug_ratelimited("waiting on (%u) jiffies=%lu, expire=%lu...\n",
+			     port->line, jiffies, expire);
 
 	/*
 	 * Check whether the transmitter is empty every 'char_time'.
-- 
2.53.0

