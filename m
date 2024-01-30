Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A2842EA6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Jan 2024 22:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CA81135F7;
	Tue, 30 Jan 2024 21:28:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1971D113612
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Jan 2024 21:28:52 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2cf44decb72so8931971fa.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Jan 2024 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706650070; x=1707254870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8F+8Ja8urYH+l87ud/VeWHqnP/Oq6Ivx1TH4610GCnM=;
 b=OuWr8In2hOg+424lyjGsWXuitpPygkmFONCudHKrs/FNuiMF140Y+2NLwX+aPQ2V52
 flm7Fe8QiwsstU9xBjTZfS5UGudNmXiV4scr0Q/uOqGlHOPa1bcddntCEXc6hKWILWN1
 3BbV+q599nNFyNaCtzEYpnBTxN/dCOD5V7mmXFVFwcdDOjO+xP9C3wLe5bgF97KTNxlw
 YecE2mTfdiCCisgIXbzTIENKmvM18R4s9BhEnkpZV3ruku38PJ/CS1Ha3qn0mpKzpssy
 Fafi32JoVpwcA3IqnPAAGe/E9un+kJOHxO6Z3IcM7ct12udvGftbyjK7j9fYEuie51qY
 JQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706650070; x=1707254870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8F+8Ja8urYH+l87ud/VeWHqnP/Oq6Ivx1TH4610GCnM=;
 b=YBLSheJV94nk6k0ntI9/Du1isgqenNSNBiuqE3qgWtrqUu2HcvjAsEQoLwlzzVQJXd
 gQaL9Mofwh8gtjZ63tHq6DszkVLyV/Yj2I87btS2krgN8V94mgfsmNRnKgk8Rzfd3N/c
 2cmKQ2wEFkeZRLyehFKpsJ5B4KlcB2HAmYviUB7u9WEb1Vs8b/dnYRX+0N1j0wmEzMMB
 rXlj1/VNePk/PTkIFL57Bt2tRqBByCnNJsdYBJvOF5KfCBrqOqntuLjHFUy92uXbCBcm
 ePn3aoJrn1KIRTURD7Ik1JFq8ti2BEhfy2MsKVD5f41uZFqjGX3YMk+pnNDX1a6/PvlF
 OyNA==
X-Gm-Message-State: AOJu0YzBiPB4NfooAJzWGwePph+glr13GqbK9joY8NpqtPI8NoUreo50
 BH9cIyd9N6S6XRqLW8LwxtTBJetmQQC0FkMx/VSZ1IimqHy59NMPvtyDzI8hnvc=
X-Google-Smtp-Source: AGHT+IEtDgU3vR122u7Ag+F0fLXgv4PBCe44CqmVMQf86rmYcEX2vjJUwAzjql3UF3iOqNx0VdDbGg==
X-Received: by 2002:a2e:4611:0:b0:2cd:fb0e:1f68 with SMTP id
 t17-20020a2e4611000000b002cdfb0e1f68mr6067913lja.5.1706650069841; 
 Tue, 30 Jan 2024 13:27:49 -0800 (PST)
Received: from inno-dev.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 p8-20020a2e7408000000b002cdfbbb4f8asm1652302ljc.74.2024.01.30.13.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 13:27:49 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Update Zhi Wang's email address
Date: Tue, 30 Jan 2024 21:27:43 +0000
Message-Id: <20240130212743.7727-1-zhi.wang.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Update my email address to zhi.wang.linux@gmail.com.

CC: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32a47aa6aa76..3d36696e99a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10801,7 +10801,7 @@ F:	drivers/gpio/gpio-tangier.h
 
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 M:	Zhenyu Wang <zhenyuw@linux.intel.com>
-M:	Zhi Wang <zhi.a.wang@intel.com>
+M:	Zhi Wang <zhi.wang.linux@gmail.com>
 L:	intel-gvt-dev@lists.freedesktop.org
 L:	intel-gfx@lists.freedesktop.org
 S:	Supported
-- 
2.34.1

