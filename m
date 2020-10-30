Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B02A07FD
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Oct 2020 15:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446CA89A9F;
	Fri, 30 Oct 2020 14:35:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7B89A9F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Oct 2020 14:35:46 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u7so3491763vsq.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Oct 2020 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=9fkQXWnoPSypfyxvIrXWSyd1r4Ua0eeDJczOBpIf/BU=;
 b=Z+2LEfbBadAQzP3cuT/6buEtIEEX1Fk1hiBA2F5rrrmfnew1HCiYlE8qrEJe53M4nu
 PlHgusIWPvsYBWi3CzMOxRKosH5jwxNnfDjJ6nI1s/rkolnq/miLvsoaera8K0eSw60H
 vQS3MrgnSthQ6tFVOh6kCFAIAr6Fvp4KVZvVYgFi2ZGo9WM5QWbU5ptjJF74KI96Xnmd
 zzO+hqzFOoOLSp69DiwPos0XzRv8oCrTjqQ46g027BWZUdwnPntBkyYYhvt7sRGG+dxT
 Ya6xQAtM29ZwDPwFtt77+nx4X8oOglTIpfCJfiXV6lwGjcOHBsM7VeUcZh2Zp9i3sdMT
 DaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=9fkQXWnoPSypfyxvIrXWSyd1r4Ua0eeDJczOBpIf/BU=;
 b=PuqRlkjbizCepMtBmNjC+BPVSACkuuxDbmhZn/9iUjODEBy2U5zcYNnlMnf2hbV3lF
 94w7v6yX+UK0m2zv+Y0oBylxOYTjKygDRl98Y/z2LldStjrDMAdDKZltQFBxJZxuvge9
 6WWW+rgihM1onVRkmS085i6r/6TaDeLXEA6sg8rgbT7Pg5ip1do7EMR3Z7Clj7Y205Xp
 +gOhpt54iegiRpSEEZQ0Zg549hGCCWOlJ66iPZgyy9FbQSdiCcjqr4LpbVyF3VHujYEE
 VJoffeXHcVq+v8qblHuvs9boG8Yur2WSklm2ocGqBxhjeQDhkHRTmdibH+ZfQEGlojwi
 EBtQ==
X-Gm-Message-State: AOAM532HruADv/38wl5ZWQzhpYiooLKIecqLEs83wiJORh4cJe71jFko
 q5+YRr1Mgfy+e8tARuGqga85btH2hYRfLeXbcp8=
X-Google-Smtp-Source: ABdhPJzeX8sOkZtsnaJO0tZ0nvnXwhHPAc4yFgpKY6Kr+FCQZ3ulWWYbwl00d+TkwgIZGSdHE4J8QbvtA7Mi6HqsDgs=
X-Received: by 2002:a67:8e02:: with SMTP id q2mr7658710vsd.32.1604068541198;
 Fri, 30 Oct 2020 07:35:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:246:0:0:0:0:0 with HTTP;
 Fri, 30 Oct 2020 07:35:40 -0700 (PDT)
From: Liliane Abel <k.griest0@gmail.com>
Date: Fri, 30 Oct 2020 15:35:40 +0100
Message-ID: <CA+XH5AtwFCyH2hHaJf4hsty3pVdWQXEYDF673Yaz+GmEAFygrg@mail.gmail.com>
Subject: 
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
Reply-To: li.anable85@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dearest

Greeting my dear, I am Liliane Abel by name, The only daughter of late
Mr.Benson Abel. My father is one of the top Politician in our country
and my mother is a farmers and cocoa merchant when they were both
alive. After the death of my mother, long ago, my father was
controlling their business until he was poisoned by his business
associates which he suffered and died.

Before the death of my father, He told me about (two million five
hundred thousand united states dollars) which he deposited in the bank
in Lome-Togo, It was the money he intended to transfer overseas for
investment before he was poisoned. He also instructed me that I should
seek for foreign partners in any country of my choice who will assist
me transfer this money in overseas account where the money will be
wisely invested.
I am seeking for your kind assistance in the following ways:  (1) to
provide a safe bank account into where the money will be transferred
for investment. (2) To serve as a guardian of this fund since I am a
girl of 19 years old. (3) To make arrangement for me to come over to
your country to further my education. This is my reason for writing to
you. Please if you are willing to assist me I will offer you 25% of
the total money. Reply if  you are interested
Best regards.
Liliane Abel.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
