Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65E48F66B
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 15 Jan 2022 11:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492B410E5C8;
	Sat, 15 Jan 2022 10:46:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000010E5C8;
 Sat, 15 Jan 2022 10:46:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m3so24722410lfu.0;
 Sat, 15 Jan 2022 02:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=6/WqjtvaldvIuuDILXcOhy2UUZHcFUmWvxb8cg9aqZE=;
 b=fI7XUHCO75BeA0ZGEszIWf1Wuth81Clw7+miYojKvdV46DzreGYdGIt47UTAsnsxJh
 TnAMUz8YPyOWIA9GMcv6kvhRjsx+u4DBbdR/2iUF8afdQpOEck0ZOIFuoVMZ9EqsNOPQ
 CH+BZ/DDBo4H4LUbpPX8r/GEijEtqu4L7VoiCH5ZyqMcm0RzLIrnb/hE0DzCoAFkMecC
 iPZ5554X7pPzC9eyBANGZIBzz8YaGIOmgmMp9O+h8IrYzLMuP+u+B+jBGR0RP02Hy9Sp
 wiyO1xW0CBnX1Kfg3Rx7DNne4hhzK9lwDUs/Y59eMXGJRdx7GYLAPl8XLoK+/dV7KV+H
 IkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=6/WqjtvaldvIuuDILXcOhy2UUZHcFUmWvxb8cg9aqZE=;
 b=PvTcm8C90/iBiH1zkOUliYkNkc6YriQrt0tNPpHR+1acVuo0LFYyPXHDmfde81wvp8
 jWewdXzH89Z1bGHNOtuXD+4Y8/oZeRJel23jO0COHswFHQKCjvkAPBUnuzOM+Dsaxnu1
 ZCIi3y3RS1yr7miIXhO4LO0BRwYrb8YdFTsFWGXm3jF3dqu7ul2TJpDZP3myR/iAzNJG
 4SDSIWEt6rU6SxcwryCob5jpEQ36hijDhgC0YNeAstoswWISjbF5mnP+/AoYoBtaW6J9
 UfgMX0aePi9LtATV1Qf4zcu8coOK/2f1xmQKBdeN3UnzMN5eoBoebgYmaDBBNfYGww/Z
 E3CQ==
X-Gm-Message-State: AOAM532+h9eYmOuoePftAGYsMzHYiCZYEmyFZetyr4KW90N0lbbsVYYf
 Nqya1sDoT0PExq6jJa2ca9E=
X-Google-Smtp-Source: ABdhPJzDNdwOkxS97tI2rsozJpm7dE8suX70zKimxNyqGQMPdii7rl0iYPHAw1aJSrvpWthJRU/mkA==
X-Received: by 2002:a05:6512:3f20:: with SMTP id
 y32mr9913631lfa.401.1642243580991; 
 Sat, 15 Jan 2022 02:46:20 -0800 (PST)
Received: from [192.168.1.14] (88-113-32-99.elisa-laajakaista.fi.
 [88.113.32.99])
 by smtp.gmail.com with ESMTPSA id g8sm80294ljl.78.2022.01.15.02.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 02:46:20 -0800 (PST)
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com
From: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [GVT PULL] gvt-fixes for drm-intel-fixes
Message-ID: <1f619581-e3da-3899-09ac-f714d954a580@gmail.com>
Date: Sat, 15 Jan 2022 10:46:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi folks:

Here is the gvt-fixes pull for drm-intel-fixes. It contains:

- Make DRM_I915_GVT depend on X86 (Siva Mullati)
- Clean kernel doc in gtt.c (Randy Dunlap)

This pull has been tested by: dim apply-pull drm-intel-fixes < this_email.eml

Zhi.

The following changes since commit d46f329a3f6048e04736e86cb13c880645048792:

  drm/i915: Increment composite fence seqno (2021-12-27 11:33:40 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-01-13

for you to fetch changes up to d72d69abfdb6e0375981cfdda8eb45143f12c77d:

  drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +0000)

----------------------------------------------------------------
gvt-fixes-2022-01-13

- Make DRM_I915_GVT depend on X86 (Siva Mullati)
- Clean kernel doc in gtt.c (Randy Dunlap)

----------------------------------------------------------------
Randy Dunlap (1):
      drm/i915/gvt: clean up kernel-doc in gtt.c

Siva Mullati (1):
      drm/i915/gvt: Make DRM_I915_GVT depend on X86

 drivers/gpu/drm/i915/Kconfig   | 1 +
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
