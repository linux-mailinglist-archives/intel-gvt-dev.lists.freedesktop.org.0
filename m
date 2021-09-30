Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40641E465
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  1 Oct 2021 00:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973A06E48B;
	Thu, 30 Sep 2021 22:58:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E63B6E491
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Sep 2021 22:58:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z24so31562004lfu.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Sep 2021 15:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=AnIUtRQtDgk3YDJAatwz+LXUKRWPbctJNdAprjwvZ5o=;
 b=FYrpNEp0zwymsUrUWvdUY9zg7bQqbIGfxDPPCHvF42IJ3bBpebm7KBYvtEnhjVJU+k
 kc0RkBkQWIC9qz9CmBvVwjaqxOXjsJrW+nKNcZSRCDscgYzAFIAzmbAFq4EDpnq2sNEI
 sbWlhfW7LvmJcBf2lYyFaAQ1NoPe0MZZNTMSdqwxSZQ9FrihxeYL48acwLrCVx0/oOCu
 bo/5xgQpQVGtvQrGXriciZI6ZLcCfsanEfD3fSOc+k4HKjLcd5FiNq+W1H/K1U0FLt0x
 TtjtVS2fUVBBlnpRN7k6ja0F1yP1w+LTfJJvd97Etbqlgl/4h4tpEJiIbsHj2huvYLaO
 4TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=AnIUtRQtDgk3YDJAatwz+LXUKRWPbctJNdAprjwvZ5o=;
 b=31r2Dx3nuiwlZrQFL4ipYx0sKPEEaQFtHoYOoTq/A614+IsQ79fmFX+wHBrwiOPKSb
 gB39L2tju3B7AggBXxt/GJd+J4Y6dC3gAzT+26A/dqIgsxvMU2QdFQB/OBvrwTRPGMG5
 EtsH6CoXrWDrQWdn5Qv0vHvsRZWqIIZKZKuBxKtbKwaKJ+CfkXvWIM2mo9VW5YmF9oqs
 it4/75KPW0L298ksPqFMYroUn7/QkfPDT5klW3eT67Oo2Zb6PPtcY6S0VaTAI9TQG9JC
 7f5pYNHTLb0QXQcidoQobnA/43HM8idv/EbQOZbb0OPqjVt8TEFNanH/hFVo8iXScGXE
 igkA==
X-Gm-Message-State: AOAM533Cecyn4eAHI14ehhUzz6j0Exa51XloPoDMsvJzHPisER5KYeL4
 4aJ48Kd9q7FMYNoqCw0n4dlazSjQGmJW3tO6vwU=
X-Google-Smtp-Source: ABdhPJx4GVBpAqUdpSc6GV2Ccser+SzsoFXEvbqpvIweCdcopVV+06RlyWu2S8RAkedNbXO5I85gVF7ApS9JXlkXPY0=
X-Received: by 2002:a2e:98c3:: with SMTP id s3mr8845623ljj.430.1633042719148; 
 Thu, 30 Sep 2021 15:58:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:5d8:0:0:0:0 with HTTP; Thu, 30 Sep 2021 15:58:38
 -0700 (PDT)
From: SOUTHWESTLOANCO <saniabdullahinng2020@gmail.com>
Date: Thu, 30 Sep 2021 15:58:38 -0700
Message-ID: <CA+3X9TwgMQ7NU-AkrdA8VQ5-2PDYbids5N+jtor+L_1QHLjV2w@mail.gmail.com>
Subject: Dear owner,
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
Reply-To: southwestloanco59@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Good day,
          Do you need a loan ? We offer any kind of loan to repay in
6months with just 2% interest

Kindly Reply with below information

NAME...............
ADDRESS..........
OCCUPATION....
AGE...................
PHONE..............
AMOUNT NEEDED......

Regards

Contact  Mr Gary Edward +13182955380

Remittance Department southwestloanco59@gmail.com
