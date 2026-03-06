Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CEVKvIyqmm8NAEAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 02:50:42 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1CA21A5DD
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 06 Mar 2026 02:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0584C10E2C2;
	Fri,  6 Mar 2026 01:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iJ6KU0B9";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61EA10E2E1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2026 01:50:39 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-40ee8b4f925so2651505fac.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 Mar 2026 17:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761839; x=1773366639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bkFWDNzYpAaNf6nKTX9X2HQLMlJtuGjLEa5TVIf/IA4=;
 b=iJ6KU0B9xpJmpAsnoXuhKqsVAnPEzYjYgty+P0/JMZMxUvgkTOAkk6kUG8Dx+JQaUD
 OthHA9qZiFXu4hXIVQH9U7RLpVHmi/WsCikVQuDwLvJCjgJjiZqMIJZ+Tf8XejENNKrO
 JTKhfcx4bKMclqFOKKiwrG6LdOju3iW9pkv/KwKoQ9lShGZgzU3gep+mG8T6wTCghQqL
 1zrEZ80GgQHIi/GVfccTOUYrQVwm/rUNSjjF5ObN5aoKrrpFsWfsjgj8DbJOpjwKZLsV
 N2zjXz7GpfLcOH865jrEuIJxZsRPYmq9b1w9X57RFzG0hpCGqQOqEKEGlipFTS5l0x9Y
 aToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761839; x=1773366639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkFWDNzYpAaNf6nKTX9X2HQLMlJtuGjLEa5TVIf/IA4=;
 b=firtttgDOUh2H97quC0kFC8WmKbjB4gtSVngpWi2kqum4zV2xk0YGh3JpjTHvXlb0Z
 NopFbpVjiRFABM2dEjmEaOwFPrhI0hdI4IOnBwy+eAuLhnb7+laz9A8qd/bdQcEuj49o
 fxCspAGGPZoSTgZftCyCZDDtpS9TB9QFydE/SJXMR/gMpTi7bmYOV7kzPCsGsHZTKW1y
 YEvXKAQwqFlFTRsgR0JD9Hy89WPLhHtH/snLtYUeCELX1S4MCX5LrB9Jtp1iPJLzH4NJ
 2uVBwipqVPHFr9G/KNeDtNCXG6YvWxxCsPUQ2TcHq7fKHUGvvdGm6DFxOOQjEVrqTGey
 bmyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoh9plbhlN9SDG6RenA+Kh6S5S1oftXrBvxdCwBp5T/HgDplVKVW72Xj2gMWXb8aIBmVAJtsibLnPLq0LG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxROhTmOXB3I5yGVDFVu5wtMXu2UaGbBM42ntPTkLWPuY/xTK1o
 ulIOl+wrdol5lA6Va9HO2MLgRRvNKCoumW0BgvCTcFy9AhVZGL2Cp94S
X-Gm-Gg: ATEYQzywZmxc9HAnOMJeHpYr5Sb7ZmsYIgjT0preFbw5/52i7TJVkkv0qhV57hF0X2p
 JzXX9euqFVoUAhutgQdxqQb5C2zA71jzZ6m6wKWTStfbWs+CQU0zxGNDPeDgjtl8dt4VrJIf5Gl
 snmIOEVXX5O5yZEH8F3NgkZNLxTjLJhlcIEUKIr5pHvxXTCrH5IopyH2677ZgeeSNQtVuCaLF14
 nKp5n0lyk51Nltv8mHPa7S0b4tE7emXShXGIwaSaYMeurj1OchUa7Qns6XRxwHrP8boQ4Jdomes
 E64/KToODXap2YNYmJ3APB9/Tga9Dy3QEz+2PEEBy3espGyLogf3WRiXyDXq2wQ6W+ek+4y5EYm
 uH0TwiYdK7qxLDHJ91mnSXEVYct1gi85E/DwMJeWpYl4LzxzrfUHOhrG0zqzNUgpTKaOGRJoBWR
 8u40V2EFAdYBefN72Y/CMYNtRALUs+eRO1sr35eg+4e7Qot+8z
X-Received: by 2002:a05:6820:4487:b0:679:96f:3f11 with SMTP id
 006d021491bc7-67b9bd4c44bmr385436eaf.64.1772761838800; 
 Thu, 05 Mar 2026 17:50:38 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:50:38 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [RFC PATCH 0/7] queued static-key API reduces IPIs to 134/16154 in
 dyndbg 
Date: Thu,  5 Mar 2026 18:50:03 -0700
Message-ID: <20260306015022.1940986-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: 2C1CA21A5DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,drm-misc-fixes-2026-02-26-78-g535e886b182f:email]
X-Rspamd-Action: no action

This patchset formalizes and exposes the internal
architecture-specific arch_jump_label_transform_queue API as a public
kernel interface (static_key_*_queued).

Currently, dynamic_debug toggles static keys individually, which
triggers a machine-wide synchronization (IPI) for every callsite.
This causes $O(N)$ overhead.

By using the new queued API, (which also adds an insert-sort to the
queue) dynamic_debug can now toggle up to 256 sites (x86 queue length)
with a single IPI.

Without the sort, dyndbg saw a far more modest IPI reduction; ~6k/16k.
Ordered descriptors does not insure ordered patch-addresses.
Currently, only x86 has the sort.

I tested on virtme-ng, using:

  echo +p > /proc/dynamic_debug/control
  echo -p > /proc/dynamic_debug/control

With this patch and test, IPIs reduced to 134 from 16154.

Patchset also changes virtio.c to use pr_debug_ratelimited() instead
of pr_debug(), which otherwise flooded my test-setup, obscuring
results.

serial_core.c also gets 1 _ratelimited() change, though I didnt see
them in my setup, and likely missed a few conversion candidates.

Patchset also includes a new query-cmd syntax for dyndbg:

  echo 'module !virtio* +p' > /proc/dynamic_debug/control
  echo -p > /proc/dynamic_debug/control

It further reduced the console output, so might have sufficient
utility for eventual inclusion, despite lacking and/or logic.

The patch hoisting the static_key_apply_queued() out of
ddebug_change() up to ddebug_exec_queries() does nothing in this case,
and would only affect multi-queries:

  echo 'module !virtio* +p ; module serial -p' > /proc/dynamic_debug/control

ISTM such queries are currently rare, but could be leveraged in
classmap-params, to optimize drm.debug=0x1ff, which currently would
get one query-command per bit (12+ IPIs).

DRM is the biggest potential beneficiary of this:

root@drm-misc-fixes-2026-02-26-78-g535e886b182f:/home/jimc/projects/lx/wk-D/b0-dd-drm-all# modprobe i915
[   20.405557] dyndbg:  25 debug prints in module i2c_core
[   20.459373] dyndbg: 340 debug prints in module drm
[   20.459851] ACPI: bus type drm_connector registered
[   20.471366] dyndbg:  89 debug prints in module drm_kms_helper
[   20.482336] dyndbg: 155 debug prints in module drm_display_helper
[   20.496153] dyndbg:   2 debug prints in module ttm
[   21.136619] dyndbg: 1801 debug prints in module i915
root@drm-misc-fixes-2026-02-26-78-g535e886b182f:/home/jimc/projects/lx/wk-D/b0-dd-drm-all# modprobe amdgpu
[   32.907485] dyndbg: 4532 debug prints in module amdgpu


Jim Cromie (7):
  jump_label: expose queueing API for batched static key updates
  virtio: use pr_debug_ratelimited to avoid flooding
  drivers/tty/serial/serial_core: ratelimit uart_wait_until_sent
  dyndbg: use static-key queueing API in dynamic-debug
  dyndbg: hoist static_key_apply_queued up
  lib/dynamic_debug: add negation support to queries
  dyndbg-test: test keyword !value negation

 arch/Kconfig                                  |   3 +
 arch/x86/Kconfig                              |   1 +
 arch/x86/kernel/alternative.c                 |  50 ++++---
 arch/x86/kernel/jump_label.c                  |  13 +-
 drivers/tty/serial/serial_core.c              |   4 +-
 drivers/virtio/virtio_ring.c                  |  12 +-
 include/linux/jump_label.h                    |  24 ++++
 kernel/jump_label.c                           | 125 ++++++++++++++++--
 lib/dynamic_debug.c                           |  88 ++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          |  35 +++++
 10 files changed, 290 insertions(+), 65 deletions(-)

-- 
2.53.0

