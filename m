Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D11C2AF760
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Nov 2020 18:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F956E09A;
	Wed, 11 Nov 2020 17:28:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86DC6E09A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Nov 2020 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
 bh=qvZFqlmy5yhWafuW6N6RW9PIqdkeYV0dZPTyqZyzGLQ=; b=Uvi8i5Yod4MfqZs0wXRX4FLzVS
 Lyrx3YvT0dWnn4I1B+jX+b16BhRWUVHooxx8rK2BGwtFvStI1Voe+plcooFLFn5YQM6tXXMiFmml4
 R9qwP1qHK0uyiDxeoCI89HsqJ03DybK7FpTd964THxPzuhw8qSI3AX00u6zuX253AP8BG01YAiSH4
 LMxv0bHpKWPrYLQ/yBW55GvDfcmVVaOSTKqH3ttzyYbzJHPZz5UoJF++QjM9qVaooXkyfehJVOmXU
 uRkSg6JHj1wfwdUHR/dPHH4dOx+bKlQkplGZkL5l4IauGdiJjdOVZunRLE+Z1uwjoxarq2XkPC86Q
 dTlIp44A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kctvJ-00011f-1k; Wed, 11 Nov 2020 18:28:45 +0100
Received: from [2001:16b8:508b:7300:db84:91f:33f9:5d39] (helo=linux.fritz.box)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1kctvI-000DOn-RP; Wed, 11 Nov 2020 18:28:44 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: 
Subject: [PATCH] i915/drm/gvt: treat intel_gvt_mpt as const in gvt code
Date: Wed, 11 Nov 2020 18:28:11 +0100
Message-Id: <20201111172811.558443-1-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25985/Wed Nov 11 14:18:01 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The current interface of intel_gvt_register_hypervisor() expects a
non-const pointer to struct intel_gvt_mpt, even though the mediator
never modifies (or should modifiy) the content of this struct.

Change the function signature and relevant struct members to const to
properly express the API's intent and allow instances of intel_gvt_mpt
to be allocated as const.

While I was here, I also made KVM's instance of this struct const to
reduce the number of writable function pointers in the kernel.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c   | 2 +-
 drivers/gpu/drm/i915/gvt/gvt.h   | 2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 drivers/gpu/drm/i915/gvt/mpt.h   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 495b6afd65713..5da02ec3a6105 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -415,7 +415,7 @@ intel_gvt_pm_resume(struct intel_gvt *gvt)
 }
 
 int
-intel_gvt_register_hypervisor(struct intel_gvt_mpt *m)
+intel_gvt_register_hypervisor(const struct intel_gvt_mpt *m)
 {
 	int ret;
 	void *gvt;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index b3d6355dd797d..cf3578e3f4dda 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -56,7 +56,7 @@ struct intel_gvt_host {
 	struct device *dev;
 	bool initialized;
 	int hypervisor_type;
-	struct intel_gvt_mpt *mpt;
+	const struct intel_gvt_mpt *mpt;
 };
 
 extern struct intel_gvt_host intel_gvt_host;
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ad8a9df49f295..d830b6c652840 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -2099,7 +2099,7 @@ static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
 	return ret;
 }
 
-static struct intel_gvt_mpt kvmgt_mpt = {
+static const struct intel_gvt_mpt kvmgt_mpt = {
 	.type = INTEL_GVT_HYPERVISOR_KVM,
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 9ad224df9c68b..6f92cde71971e 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -392,7 +392,7 @@ static inline bool intel_gvt_hypervisor_is_valid_gfn(
 	return intel_gvt_host.mpt->is_valid_gfn(vgpu->handle, gfn);
 }
 
-int intel_gvt_register_hypervisor(struct intel_gvt_mpt *);
+int intel_gvt_register_hypervisor(const struct intel_gvt_mpt *);
 void intel_gvt_unregister_hypervisor(void);
 
 #endif /* _GVT_MPT_H_ */
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
