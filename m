Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562E62163B
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 15:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC7E10E246;
	Tue,  8 Nov 2022 14:25:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901E310E28A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 14:25:13 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so13492498pjl.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 08 Nov 2022 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
 b=qJPWO9SMfKs9CV4DzOtfpg0tG5L2kEZQtV/LBBChMrnKplvig/HcfOA36QzOFbaour
 tgINSm9CFH0IH0weUkbi8oL7C5P0uFU99A+FANpQrOPV/x2at1b6HjUUAphEgu/Nt2rO
 YdZzEeguInvIt6hR0YTDbuGc0g6QmBH3JOdUVEiMakuZ8pUv0rSqDGDPPz36WP9L+M70
 Yi8Qvn61/fVJa/s6+O6bNGj9Vrx81J7VmEWQcrrTipgg1zMWjvYHOXsRX3Tp8F7t1isZ
 URWNY0E6DDGhkUjSdRf6tRRt6Dm01iRomcQNGIBkoA7vu4q8ZFmcmXCe9DgPR3TaW/OT
 odpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
 b=vk1j6IKn6wXn4WOEzSx7nJyYbQ3+6UyJfmn7nz2Cy/WGoQJMpJU0T5p/Y3RsL0clwb
 A6oPy8GDD2sMXcaQHQaawpei5IaH45PxQTiz8YTWYsAZoGxn+Dlu7jatKfLMjJbxrLJp
 7MBMBreDgnQHdKa5bJwf6e2VHjevz+Z86WG74EWY77h6uUER/cyhgvmdwHWfPuVXDrZU
 xVaFcUlAiA6lv8JGzQCOsBzjiG6cbjkCgOiaDItqb8vVkIrdql2r41r1OF1OgfRTTPfQ
 qipA3slu6waVw2OeCuFEY7wUeDDSKcCcEjUXCSEZOO5J8W+S+ZvhJHdcn9QdSvFZ/kQa
 NEtA==
X-Gm-Message-State: ACrzQf1jctHknG87twpPc1Aqle3qsYsKWvemNSkEIZQLo3jbR4nW6Vl+
 f1MkEjEzLxpXXxy3u10SNbI+izUWYe49VUujpFg=
X-Google-Smtp-Source: AMsMyM7xjnW3BCIcPmRXceI8CMPrgJsNpwknP0oXmxg9pb3hPM8UnVyASTbWsNqLc31U8nSLRepoWwOH4L/DHUye4LA=
X-Received: by 2002:a17:90b:1d90:b0:213:c798:86f6 with SMTP id
 pf16-20020a17090b1d9000b00213c79886f6mr52558648pjb.84.1667917512394; Tue, 08
 Nov 2022 06:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:5388:b0:85:81c6:896c with HTTP; Tue, 8 Nov 2022
 06:25:11 -0800 (PST)
From: "Mr.Abraham" <davidkekeli11@gmail.com>
Date: Tue, 8 Nov 2022 14:25:11 +0000
Message-ID: <CAPBO+FJ3Nhd2ncX9Z_fDUqYStiGQU821nC6EEFSDx5iCTdXkaQ@mail.gmail.com>
Subject: Greeting
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: mr.abraham022@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
