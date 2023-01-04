Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADFD65D2E8
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Jan 2023 13:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB7E10E0B0;
	Wed,  4 Jan 2023 12:40:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8873410E0B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Jan 2023 12:40:17 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3e45d25de97so474333007b3.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 04 Jan 2023 04:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
 b=BM4m4Mvvf1eR1Ekdv9kbucBUOUNYijaW3+BJONY54u+E9onlKL8MzqL5JjNV7UGvsK
 VoQv3ud0LYyo5PWG+2omaup7Xys3CgVR42VQGpQ3wMjEo5iEyiAqCTHEWZhs1K6xAhMs
 0Wp7YmUKLTJjFtNW+4/jw6bNUNeGWKVPVVKG3T2WZYLCjJdrsRJNP41e1B7uHm/kvsun
 ir4eL/YYZHWcQIwoXfrUGzbANyf3jamrQqb3KTqh2XYigZPfzoIKpemJojuFjWzcqfuM
 919GCy8B9Qoxz9BJI0SZm9N57JT4SxjMk9iY/N25EZJCKQ5k+pn03On5uoBKsgkvRhGK
 Ad+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
 b=e18KtZcrcVTVOVSSsdKWMmXC+1guS+fUQbG7tiRL0AUjrKLQiUD2Z67HZh9im0ReuR
 A98ZKvObHF6vkELi+vkMgWs7j+c9PnA32dP+G1ffB8SaeDSxSTLzkyW00oRilQS1n1I/
 xrzkeY3krHPxXQPGiHEhtDhExJRhxMW/HVMJJ/DRKjiGjFM+fjLT88t0RdKEDAu7qtE/
 FvvrsJHMTJt4TDnNpKLPH2U014PjXwOMvjUBBRuNWbG4yMgyS3a0ZhQOyvG5s03TLVXH
 xvbcFN9MtzU3tsVbhJquBNEUZlU0zYL8dGV2qbJcmwn09v41Mb5ralosiscEihuvqLUm
 gTyw==
X-Gm-Message-State: AFqh2kqjddMU+PAyL3ew/DnzpaH8hgvJM9YuELRE8frpLOZVPrbtsHDU
 cPhBOW8HekA9YA9rSfGdMVsDYt6VZd1hjD+blMU=
X-Google-Smtp-Source: AMrXdXvkmjQXm4uc0m6JQ4pCgXaSyohBmph//qTgtElIGgO/ffhjiPlS6pVI9x66erMM4t12AW3zDEnrW5tStN7RADc=
X-Received: by 2002:a81:8a02:0:b0:3b9:3977:596c with SMTP id
 a2-20020a818a02000000b003b93977596cmr6295961ywg.271.1672836016346; Wed, 04
 Jan 2023 04:40:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:418f:b0:316:b598:d63c with HTTP; Wed, 4 Jan 2023
 04:40:15 -0800 (PST)
From: Greg Denzell <greg098d@gmail.com>
Date: Wed, 4 Jan 2023 12:40:15 +0000
Message-ID: <CAH6STvBnh9TzH-6Fqz-fj9fcBibjD_BPXtYjm3ueG3C13B--KA@mail.gmail.com>
Subject: 
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
Reply-To: Gregdenzell9@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.
