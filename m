Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4800F436170
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Oct 2021 14:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAED16E44E;
	Thu, 21 Oct 2021 12:19:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F266E454
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Oct 2021 12:19:48 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h27so333362ila.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Oct 2021 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=G2Jq8ABcZaKAiy06d3oRm5z7XXaT0OFvg3EWPt/6AmM=;
 b=F1jMFWa3tcrf6C/q10jKM2KHE+3YUSGVvIR6OAK0HmxUbnqdLb697/8MbvJYm/Zv2j
 hOdIDWtDq9eKS6DYl5aBeEJV06nEuV6Tpmd+KIJvU2tWgw6XN4fEAKXNbftvQsQsYZ+Z
 FofRpROvB4fsoVF1OY/H42ntC4aKtdV1mbs2NuW4+lOfF+q88iyax2G/FJvgUUe9L9f+
 oksNKi6CJ9Vhe/SFWlCUzhq48RRSNZ01IPiJ3wyMZ7HJfTlOhQAtLIHu4mBgG7CT0WpQ
 XhuIjDaivbFll6AcGXzmi/34hO4BMv6n/DdHRtR+BvHZmkUFE/eag8cnyR6q1NNc+c1b
 GpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=G2Jq8ABcZaKAiy06d3oRm5z7XXaT0OFvg3EWPt/6AmM=;
 b=GKBwkDEVYPZ4UX6j1EwS5vwDUvA/4rl+18aiX6oVo5LBfFbFx6BYFZqWJnkpzHfQxj
 cRoiYtU/pe9Ntfdou53vw7Gv9o41UMXwmz53hzxShesu+k+8nMumfEg0mmdr/hhRjjqi
 +yt7w/sy9f+LcucCTqOA6nFU84kjeWxkadOaU/704COdg2GVBN9nuy/UWwyPQOyEDxr5
 +Pw09DWFDKn6me7jH8VJNV5MJiI5lhv8t/FFfDU1wx2Qu93QaUO6+BFV3QoEDpy6z5PV
 WIpUfrIC4l/YBPNWwGsyLpHXDWFUorn9846Gh4nIDx7a7pz8ZvOcu7ru+f/BZu6E4snd
 cBTQ==
X-Gm-Message-State: AOAM533Wt/dAGK3MuHyVlfSfBatMr/KFGZ745dkfobQQ6XfUKcZJWW1t
 JuzPA6mQr4cqKg3WUdP1wbkqjJgYYxlehLLpYuo=
X-Google-Smtp-Source: ABdhPJx7pj0M+cQ0AHi6lCbgCpKulVRUXY7U66KdcH22YrWFVe/Yy9CZ/xIvBhCDxkUezv4+TH1X7IPH1Sd+tOfwhHg=
X-Received: by 2002:a92:c206:: with SMTP id j6mr3370839ilo.71.1634818787157;
 Thu, 21 Oct 2021 05:19:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:1924:0:0:0:0 with HTTP; Thu, 21 Oct 2021 05:19:46
 -0700 (PDT)
From: Mr Ooi Sang Kuang <mrsshirleyperezfosgate7@gmail.com>
Date: Thu, 21 Oct 2021 05:19:46 -0700
Message-ID: <CA+ynneAvQZSQVfF33SxyGk281-1Gx_d3FMuBrk1N2PF-sHgqzw@mail.gmail.com>
Subject: Hello
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
Reply-To: ooisangkuang63@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Hello,

I want to discuss an important project issue with you.
Please, let me know if this email is valid. Reply me at ooisangkuang63@gmail.com

Thank you,
Mr Ooi Sang Kuang
