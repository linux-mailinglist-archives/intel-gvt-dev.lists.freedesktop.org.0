Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5194BF76E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Feb 2022 12:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B35410E5D8;
	Tue, 22 Feb 2022 11:46:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E9810E5D8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Feb 2022 11:46:08 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e8so11144342ljj.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Feb 2022 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=eM/ZWqW/gTWOQUV5w8fk2cP8DSN//kWCONHAhKLXZb0=;
 b=OXYSYFPSByEF/HkugDpKfa/qq1KjbyQnCPBF/B3e4tNoAbSZZpjvdalqSYAHNRPJbP
 rvtNi89vHrGvcOxhyqwI0kCVMPiKoxNeAcFsJ/AwhtRFp01osD6MTM8EIvZ76NWJdseO
 hZFCdynBor0XK6Jk0U0pZ713GzUJN8dxVc1cwcEwHO2q6iaqYPJECJQwztWqYRHGoQU2
 gOlfcB6w0YQ5hoNJF3AldQKqHQRsBPhKwdjPqwwEy5NVsyAcBgaOai3u4mCf9xcy2vTR
 UE0gsgnZXyEq/IIDg4CGNwW7hBzjILAnW0NfJ1ujr0ZoGk2yBOx/qV8pQZFugUvWmp8E
 4A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eM/ZWqW/gTWOQUV5w8fk2cP8DSN//kWCONHAhKLXZb0=;
 b=kAz23mM7khShs17sMT5mM3t00K7MPu/89fg0PYv0frgBEJcDy2A6j4gYmEwcstH/PC
 qBHaCQUdcGtp5s7vKF8qf3wU2WIYiTzcZN/x2ekZO5yIJRZkc5FVQAGLofDBo2wvsah/
 LSv8iDN35oAfbUDPnj6StJkXNo6WLgGibr91oXu2XQah1Ke9H3ZsgQBYNNOeqA0x4JPg
 3XU9rnzVn7J6Yrx3Mpf+Tkhp7aAmtSYc65VGOd11hH4bPEmFirLuzj7QB6d4fDExoXVY
 VJcrMBBPh4Wp3Fi7D0H/ouvpHLZRflsiZGTOsyBI15TCKbaHsS1glyBvZPLwtnW70P1e
 5U8A==
X-Gm-Message-State: AOAM5328g3y041ssw3lj7Q1rWOSOwnu8xg2d0X3Up0XB3ZC+6SRQR2Ef
 /Pa+hGo01BHEPJOGdxBP0xDXgP+pTSwIow==
X-Google-Smtp-Source: ABdhPJzbQ4EDVhZD4qe+SwLyOGpWML9NWSlZ8dpTO+AOAUrYTCDF0+L4GYd71qcsugPlxMkwY4j+/w==
X-Received: by 2002:a2e:8e98:0:b0:246:3f53:6b0d with SMTP id
 z24-20020a2e8e98000000b002463f536b0dmr6432551ljk.255.1645530366591; 
 Tue, 22 Feb 2022 03:46:06 -0800 (PST)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id s21sm1368029lfi.154.2022.02.22.03.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:46:06 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Date: Tue, 22 Feb 2022 06:46:02 -0500
Message-Id: <20220222114602.460-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Terrence Xu <terrence.xu@intel.com>, Hui Chun Ong <hui.chun.ong@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The mdev attribute "name" is required by some middle software, e.g.
KubeVirt, an open source SW that manages VM on Kubernetes cluster uses
the mdev sysfs directory/file structure to discover mediated device in
nodes in the cluster.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Hui Chun Ong <hui.chun.ong@intel.com>
Cc: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 20b82fb036f8..306b394848b0 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -186,9 +186,24 @@ static ssize_t description_show(struct mdev_type *mtype,
 		       type->weight);
 }
 
+static ssize_t name_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
+{
+	struct intel_vgpu_type *type;
+	struct intel_gvt *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
+
+	type = &gvt->types[mtype_get_type_group_id(mtype)];
+	if (!type)
+		return 0;
+
+	return sprintf(buf, "%s\n", type->name);
+}
+
+
 static MDEV_TYPE_ATTR_RO(available_instances);
 static MDEV_TYPE_ATTR_RO(device_api);
 static MDEV_TYPE_ATTR_RO(description);
+static MDEV_TYPE_ATTR_RO(name);
 
 static struct attribute *gvt_type_attrs[] = {
 	&mdev_type_attr_available_instances.attr,
-- 
2.17.1

