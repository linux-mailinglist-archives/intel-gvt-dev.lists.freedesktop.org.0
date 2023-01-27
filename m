Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07C67E790
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Jan 2023 14:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75B10E98C;
	Fri, 27 Jan 2023 13:59:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFFE10E98C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Jan 2023 13:59:31 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id j5so4697074pjn.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Jan 2023 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
 b=ELPVJ6i19uUILwOmXwVpuGn4gzTgyON58i8xqHbMYXlfy2iRtxyJ8s7uo39722KKSx
 HcDnR7OB2QxiqN+RcogiSUqWUaleVvxo/+uNXa/UiTLbvomtU+9b+BITIOW26BFnQuH1
 k+niwm9t5dTHl1vPrVIEOZG1eNvmYhbhvmMxiiXTf8vfSqLN7SQjJB4O+ArD0xILJjMS
 +nUzJS7niyA2WkVtXPaWI4tjkpbGhs1bp3cchJz6DuORfK+wBhD08Vx15WodHrUffJmJ
 x4afNqMzgneZ5kcgWlVf+2cD1G4PzOZrEcpLXvXw0VLI/NPo4Qa/cqO4Hb3lre9w/WhH
 UfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
 b=bODbZ7mF3q4p+ZQ+REgZYi97IAPkDpcoPYGBOcfKEBFwF+ursitr6Z312QeQ/Mvbzh
 bd+XlmcTK4e199sXh/VEKZbbXHQw/HiQRGUmqySFsgHdNh75sYQVRPQPRJxsQedfB6yI
 QRv8fquIoOkJ61EztCBY268hgY3rMdL+uz5ElueP30/FaCYiG8b9nqa/Bg6j/z5NnCYy
 9AVzFxyLw3wcej8wVijvSBhzZWPjpSKbW4J7whPfs6EgIi+FSkrkFk+tmCTbev3xj/Gr
 Ge0YZhaWkFAAowU2BpkRwTDG0Gy/bbkjy4iISWorrlh6XupTT875FGZL+VlfkWOpXrrY
 cZDg==
X-Gm-Message-State: AO0yUKUQhWFmwOYqmyZNPQQPWaoXvxjpOY/tGfXNjnx3azUbJOhLa3g8
 2TRT/89FhYAxOlEE2RHZ2p+cx1HtEkpSU79253U=
X-Google-Smtp-Source: AK7set+4WmzbnJlNrHx7tyGhJd0zG3D3J+Dv1SvQoK6Y+75Njg3rEtc/tZCYc7dqpUOuGWZ1IKvznTcxn/LP4yr/aGE=
X-Received: by 2002:a17:90a:d809:b0:22c:22e9:b614 with SMTP id
 a9-20020a17090ad80900b0022c22e9b614mr1104391pjv.91.1674827970862; Fri, 27 Jan
 2023 05:59:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:2d44:b0:3bf:7a41:d805 with HTTP; Fri, 27 Jan 2023
 05:59:30 -0800 (PST)
From: Bikram Susan <susanbikram73@gmail.com>
Date: Fri, 27 Jan 2023 05:59:30 -0800
Message-ID: <CALpyRY02w4-Df99UXm_7SkjVMYBsdZm0B8CinVA16Kv33h0ADQ@mail.gmail.com>
Subject: please can i have your attention
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
Reply-To: subik7633@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
