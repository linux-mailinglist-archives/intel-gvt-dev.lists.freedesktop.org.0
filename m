Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C607205195
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jun 2020 14:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0156E3AA;
	Tue, 23 Jun 2020 12:00:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781D76E999
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Jun 2020 12:00:09 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id j80so7163849qke.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Jun 2020 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=7fNnQnFssZCc2Jtw2cUlJB4v7zrpRiQS682aXMZO9+Q=;
 b=PtPx3T3XHYXgoHjhzjBss8Xwdh4xUGFYORKqCEBuVukaMfC7a0bI6GVmucy5d7AIZf
 EitLrxybtTC57u1INY+yhag4iS9LByMQtJdriTDcmgAbxkq5Qdo52JfcrGGFvBSv7FAX
 aLSiD+FsOCm9xkqg3AYokSOj233JAscw0HoEvhTPDb4e0sgA2y0HgkEW6lxc1hYlzBmc
 ZTpvjfYElYHV42b3tpxEAre0J6m08TmYu9lgnT5HF4nY/uzVGypFwLuSHNltUcdiuTCT
 I0ptRAlE9tbLWtr+HaOmWOdWXIQwuBeADHUG+wU2liLeGvhBecCInQgXAnIRKv52PTP4
 jraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=7fNnQnFssZCc2Jtw2cUlJB4v7zrpRiQS682aXMZO9+Q=;
 b=cjrmYmBHV569E9pUNcg5By4tTEnni/k2LuRuxGikepDbGNNzfdSG7W8vjJ/EBklRl3
 LDbPR/shM0qtw8Xu1Cb0lHioPD6mgZnhD0qxrXct5a39b2EIjt+Jg5UmEMBdd1Py5HMI
 ivAjTbRHe9cGd6wGRsVx1PEqMf71LICrqoZor/66dbcIXWrDhycnTrpF6moO8DmcGs8W
 /y1k2amI2F4zWsXGvh9KY0igZZkdhsUO4F7RjFgEG6ulDyyQOmpW+ynyd+zxUpa3gZeN
 A9HgQM49+w7s4FtC8TvEF/nD3UG3ceZkzNQem81ABasHs9v4b5EGxkTpz7Mb6dNMkDH6
 g3sw==
X-Gm-Message-State: AOAM5339MabINk/SKPcbMD5nAVNbDEKm5KaxUmlfX6blDNrcXwpvM8k+
 dMyZJKt/Fm9HuQUWfMx5CFNbZUhCCReZnUZguD8=
X-Google-Smtp-Source: ABdhPJxDcuet4cmh7bpujlUkwxegwHR3jcRiUEKag1Rv1qUv3RQd0BrYaPITnuE++v4L8jY9upsYJAQD3eMqk7a3jSg=
X-Received: by 2002:a37:a18f:: with SMTP id k137mr9378069qke.249.1592913608672; 
 Tue, 23 Jun 2020 05:00:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:47c2:0:0:0:0:0 with HTTP; Tue, 23 Jun 2020 05:00:07
 -0700 (PDT)
From: YAVUZ BEKTER <bakert.jg@gmail.com>
Date: Tue, 23 Jun 2020 05:00:07 -0700
Message-ID: <CAAUSuTVsh_tvnwN-83X0zuCNzQiU-FXM2wLYmEPZLnNLBuS+ZQ@mail.gmail.com>
Subject: Hello.
To: undisclosed-recipients:;
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
Reply-To: bektery@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

I am the foreign operations director of Bank of Turkey.
My name is Mr, Yavuz. I have a sensitive investment project to discuss
with you, please reply now.
________________________
Ik ben de directeur buitenlandse activiteiten van de Bank of Turkey.
Mijn naam is meneer Yavuz. Ik moet een gevoelig investeringsproject bespreken
met u, antwoord dan nu.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
