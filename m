Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC2A6D64D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 09:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F6C10E22C;
	Mon, 24 Mar 2025 08:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQyLe+9E";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C284D10E22C;
 Mon, 24 Mar 2025 08:38:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso2173765f8f.0; 
 Mon, 24 Mar 2025 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742805481; x=1743410281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p2eMhzuW/T/v54obbAFay23c/FPuEQhYHeqieqEvYbI=;
 b=fQyLe+9E6pxqep28WXlpVv3dKGBw0i3a6AheKUDW3FmvnAUJzdmaPkxVFL1qTF8C9V
 nhZGAbs03kC+4TwtDwSSQe0E0iUcfzG6xFwdaESMvFEzWNty12/l/kIi0wVLOr9aSoBk
 bm1Gg9CZHBzGLq8/cyPX2KVam9ZczakoLyz60Wn6RHY8h7aIP6WmqDKWkDuPYiwMqhC9
 oW/6NEtRJCs5gW5DsWIEZgNj+qJ0VNPHHzjZ05+Mwa+GaPVT5OqZBawKGNMNTqYksBAv
 pyiwMx73JMGw3Lmw7TmglNPvRAhjDay1zOIjss78SFXKUNyZBTTCy8etD/FaXme4TCSc
 HXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742805481; x=1743410281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2eMhzuW/T/v54obbAFay23c/FPuEQhYHeqieqEvYbI=;
 b=eF0x9pFlOXb9M89lmKLKlPW6O8QjwHHiHWxonhAujUNgAuZYYrB6ZaRrtzV8lbUm3m
 gI/dGONp80vDYeOPVJaeY1uxfNJ1+qwyi1Iv818Dmx/NzHGqeYQYqQaT1WcKvUH/vCWR
 fHpQenXz3SfyQOBwxRol+q6P08oeM+d7tncKgEXclHb6rL00XXCfo8s7ph4q9wZtAl0d
 x6W5cUOw1jUPO2WjppFbzmmF59Od7pCZjdL8YU6A48W69h0n+JsN63S0JNttQxLo280i
 NZkuOOZKxyjyAn/1n2hbNU725a2cYYNJsxEeT0u7GLBI11+3IknV7wJ7ugS39qrdulka
 OKww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDoMLfIx1Hqqodhy52fdp73LRpzma0Z/LDMuVdD/85E5bN4KmqK6ZaBszwpUQN8XMZ1iND8Vdma00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5YSI0eJQzZZeoa92oHiue/fwMk/CMA1CnZE6G0auOhaZOHQ8O
 kZqr/Jz4JAdrSF4uKaV8Eqqnosh1FAWfSO0HrVrLjx0Qip1U+0Ft
X-Gm-Gg: ASbGncuF11c+Wa7kS0pXP2iUB4mZR4o+MBA3QSdeOmoD6Bc6PC5gHrWzPkAQsOgUaMy
 lfyzXnBicA3tycEY2At8JHEaLNjcZ/dDhShMLlo5FAuG1oqJ6SGfTSQ+LpxAWAzUJMrAGDlS4P4
 HsPYcg+W2yvBOikvV//K30acwPHnQNf6wXntT5qc/FMHMSOjpPHTuCtFQsiQMbauXKwXLNwpFy9
 CSlI/wEAb99VQkCZQtxXrssr7u1WyuAzZ9UJhsjZc71dUcFbxlEMKXEXLK1Gix6jQMQNgeShtje
 6+j3UI8tAqCZ1IQTCUVzbJl1SOqyVWnGyNgl6HWY85PPNJ7ZNOeWtfIENp98Xg==
X-Google-Smtp-Source: AGHT+IGJTSJbIlyg3JuKo4OUUbwE6Hhq1ca9/N90jrvxYqu0uEEqFpc42Aa6KTHJO+ied4Kf0aifaQ==
X-Received: by 2002:a5d:6d86:0:b0:38d:d701:419c with SMTP id
 ffacd0b85a97d-3997f92da9amr12006201f8f.41.1742805480584; 
 Mon, 24 Mar 2025 01:38:00 -0700 (PDT)
Received: from arrakis.kwizart.net (home.kwizart.net. [82.65.38.83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3c2csm10078670f8f.46.2025.03.24.01.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 01:37:59 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>
Subject: drm/i915/gvt: Rework fix out-of-bounds buffer write into
 opregion->signature
Date: Mon, 24 Mar 2025 09:30:00 +0100
Message-ID: <20250324083755.12489-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.49.0
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

With gcc-15, there is a new warning treated as error
    As shown with gcc-15:
    drivers/gpu/drm/i915/gvt/opregion.c: In function intel_vgpu_init_opregion:
    drivers/gpu/drm/i915/gvt/opregion.c:35:28: error: initializer-string for array of char is too long [-Werror=unterminated-string-initialization]
       35 | #define OPREGION_SIGNATURE "IntelGraphicsMem"
          |                            ^~~~~~~~~~~~~~~~~~
    drivers/gpu/drm/i915/gvt/opregion.c:225:45: note: in expansion of macro OPREGION_SIGNATURE
      225 |         const char opregion_signature[16] = OPREGION_SIGNATURE;
          |                                             ^~~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors

Rework the previous fix by reverting it, then two options:
- Enlarge the signature field
- Reduce the string size 

I would use the latter, but I don't know the runtime implication of it
(hence the RFC).

This issue was discovered by building longterm kernel-6.12 in newer
fedora, See also:
https://copr.fedorainfracloud.org/coprs/kwizart/kernel-longterm-6.12/

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>

