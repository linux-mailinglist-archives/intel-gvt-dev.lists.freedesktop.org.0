Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147E14BFBE8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Feb 2022 16:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF46A10E9FF;
	Tue, 22 Feb 2022 15:05:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00A710E9FE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Feb 2022 15:05:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v28so12559110ljv.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Feb 2022 07:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=1UIENlO2BDmgbJAVL5zJuinO9nN+SxSSvkNXryr2ULA=;
 b=QAqFHvKpumd9U4e8FauY+ypG360yAeMtlFdaT+MCfSoXpiyRYLu3eI1TPYvi/8pahN
 IA1mCxaGAhA/7aK+uq9Pa7uNjzNdLFJ/U5tk91XKYA34TZtOgTBP6146ViwBcv0JAql3
 4MSvSpZoD0WRn0AEfPD5spiVP/12oNY6zYgU6BCLF+xB/JvJc6RJNprfaPPqNzy8CIi2
 R88Rmonv1mdIUHXuwBcbNDPUT4h0X1qlUa6M3Q4e7GRgzlFrBt9f4vrqBles7GZXtLUr
 JdRTpgPoRr/x8/JVU8advK8VLTv8dTw+g68jdZpgj7buA8pHT4RB4jpIu4LIIDKasBGS
 XgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1UIENlO2BDmgbJAVL5zJuinO9nN+SxSSvkNXryr2ULA=;
 b=Yt00wiwsJNh2AcX3CGSnWbom4yvQERye/aYyub5luQ1UzUrXJt2470TyNwXUVXCD9X
 fCq4DVV7w98ecSQm9Pz8AaQ62CyMcESCSRNCSEVquDmlPd++rVpfn596BJPWyGzPik6Y
 DPCMoJ5REtCcw+YYp3EAngSGqKAvW9AFakToRtjZENjE8Hf58ef1jmIm59NvzOxY4d+z
 xICKtHFnYLmNoztUj37pZiowBUHpjI8/u4dHfRtc6g6OX8Cjm1I2BDQQhjqeRd7RU1GG
 GX87tyx6jT+SZu5WAXqdFspcliEshfcMjbFDh3Z74nONjA0pvuf6E/OlQQoDFSAoFNm/
 TnZA==
X-Gm-Message-State: AOAM5329qOOXsZqyZi3Uiq0kS7G+BilGJkIBtmopNl44BaSH33X22erF
 1qSujpooVDWjGQnXPK+qA7g=
X-Google-Smtp-Source: ABdhPJx77VGxYeE9+nqBIyo3DyxlonTHQvVr1Dq1f5kKuD3JhIAcwZdUh6QRA2o/jOabMMsM0hqdQw==
X-Received: by 2002:a2e:b8cc:0:b0:246:4767:7a29 with SMTP id
 s12-20020a2eb8cc000000b0024647677a29mr4196538ljp.152.1645542336157; 
 Tue, 22 Feb 2022 07:05:36 -0800 (PST)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id x11sm977801ljc.54.2022.02.22.07.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:05:35 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Date: Tue, 22 Feb 2022 10:05:32 -0500
Message-Id: <20220222150532.9090-1-zhi.a.wang@intel.com>
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

v2:

- Fix the missing defination in gvt_type_attrs. (Zhenyu)

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Hui Chun Ong <hui.chun.ong@intel.com>
Cc: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 20b82fb036f8..da9d9f05985f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -186,14 +186,30 @@ static ssize_t description_show(struct mdev_type *mtype,
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
 	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_description.attr,
+	&mdev_type_attr_name.attr,
 	NULL,
 };
 
-- 
2.17.1

