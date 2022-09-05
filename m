Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7E5AD294
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Sep 2022 14:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E38710E352;
	Mon,  5 Sep 2022 12:32:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33BD10E357
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  5 Sep 2022 12:32:25 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id c6so3945473qvn.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 05 Sep 2022 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date; bh=Mfai+Z/XaCFyuSCRuqjmiPIg5FTpOzYILsQLxW5G+ig=;
 b=aPL5pu+cKeFXXniSyzWbfnD/DE3w6b4kWF98wIJQjulZ0AN6K94DASnC/SSFl+eCL4
 SWn9SokNX7/cf0RqKfTuTTpmQWkEbLiJT0u2aLfGjU5zeP9jKe3OZq04kADnfg2/skbZ
 cbZPu6r9/zfQwUFgSAXjB6vp5AXEzrHv1iq8cfJLJsCJiaye4MW0Upp1GjREW1Kaa6z4
 t67+fbFBu/yPzFFL+mQ5b55IsiMvPUcA7qHQYZQwjp2IYxyg0dmKlk3gRTMo3dtEIDHb
 0qI4iU7tY/zG7z61eK13jP13ZOzF3seeiON0QsNZO4FKOu+cqDl3Txvtp/yTnMbym61y
 7rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Mfai+Z/XaCFyuSCRuqjmiPIg5FTpOzYILsQLxW5G+ig=;
 b=tH/X+xvxGMroFQV9XX1LC6035yS3KIu6XXfKLTvwJZD1WveqVEX8nzMCwcwEju6tgU
 ya7QkImymlSJLZK3NyFCNBmP7khUsoZthPsVo6Wo7hXC74XifoEWJmEsu+Bi/AGR3W34
 mvO4TwfpVKv96Yf2FAEmUw7rlLXNLVPvO7L3SLNlIfIyW3syf8Am2Tkh48+0t2zcZeVf
 6RDv4FgcbpzlPQiOFaMc9AxdGHVvqkKiBqR1KXp5VFxQxFYRzdij2ZOlxbEqt/V51TDp
 cgzK7zAxwBVr5rq5+38as8UmbrmGZzPafE1POerUdgtmFJ79Jm2BMyP/F0tNulA0WrLO
 qDOA==
X-Gm-Message-State: ACgBeo3DPNwOqO/W52AxSONmGGhXl0YyDgtuEEjsc9lCPzmTf3fe4Gkm
 2BMgYDJZTDIrA71TdbsbOySPNDJomf18vEFinnk=
X-Google-Smtp-Source: AA6agR5PBvj+5PHZ2x13STCh+duTkJa+GUXGL4Dow/coFIgKhq28+rtnUDxtd/+dgkk6n/4AOhdN6MHTajs/R1HHMCA=
X-Received: by 2002:a05:6214:21a2:b0:499:3800:ecb4 with SMTP id
 t2-20020a05621421a200b004993800ecb4mr15268573qvc.20.1662381144904; Mon, 05
 Sep 2022 05:32:24 -0700 (PDT)
MIME-Version: 1.0
From: "Steven Davis Esq." <erug7048@gmail.com>
Date: Mon, 5 Sep 2022 13:32:08 +0100
Message-ID: <CAFkteQYs8sRpTiFBN_Zr8Gj7sMGuKD79N-2MEqCFvoRJ-KvkeA@mail.gmail.com>
Subject: Reply ASAP for more details
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000009f968505e7ed4567"
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
Reply-To: davissteven.esq@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000009f968505e7ed4567
Content-Type: text/plain; charset="UTF-8"

Greetings,

I am Barrister Steven Davis Esq. Please excuse me for addressing you in
this manner, but the situation at hand requires the urgent attention of the
beneficiaries. I have something important to tell you about my late Client
Martin, a national of your country with the same last name as you, whose
money was in his bank before his death. I am waiting to hear from you as
soon as possible for more details.

 Best regards,
Steven Davis Esq.

--0000000000009f968505e7ed4567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:times ne=
w roman,serif;font-size:large">Greetings,<br><br>I am Barrister Steven Davi=
s Esq. Please excuse me for addressing you in this manner, but the situatio=
n at hand requires the urgent attention of the beneficiaries. I have someth=
ing important to tell you about my late Client Martin, a national of your c=
ountry with the same last name as you, whose money was in his bank before h=
is death. I am waiting to hear from you as soon as possible for more detail=
s.<br><br>=C2=A0Best regards,<br>Steven Davis Esq.</div></div>

--0000000000009f968505e7ed4567--
