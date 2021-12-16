Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6FE477093
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Dec 2021 12:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4662110E90D;
	Thu, 16 Dec 2021 11:42:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A032C10E90D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Dec 2021 11:42:29 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id n15so25162206qta.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Dec 2021 03:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=xre5um49Rnqa1tZMCD58Cd6UlD4MleswKAp3tzt2gjo=;
 b=XAiY5JQCbKhUV3kfV68NxknTY8076aQ+jZiIG+NNSnrj8SbWsLA5ZyVis9Hv7MDsX5
 Wp1aJ8rEmDfQ1U3vhA+W5Q6fUW0sQxhqwaHiosPbQFbyYijHt4Icvm/T0vEK5/kKmBc+
 QqELCOAj0es+5TzRQyWwGBhwQGehjbOewfhMN3/S4hQw7QoR6Y3+tDzh1TbUcqm1TT9t
 NYT2/qpfB6ahTcpnyVYoBu/0br0EmuZ66fyA68h0ieuZcBkGcxPgfheRqd2GHCJMPyzP
 6QgpFUXd/uCVTtz1/hZUUGudKd9Q0ZImcSJeB1tjd8lIsCPvJkt1eKVnbTcB60Kk9v0/
 CoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=xre5um49Rnqa1tZMCD58Cd6UlD4MleswKAp3tzt2gjo=;
 b=WeM2ZNLYIl3Te7nHx6NNif1vt5t/jQo/j2gg6mpq6S83eedPgEglwmE+C6uL8/aCj/
 DAFtw2r3He0wUpm3dOomS/cSotrzqLcmy0UxFZNgeSEywpAUxLeB8H1uTDaaVTxcbyYM
 rWuByvN7IB0u8WKG4zXwXkXPyUqGCfnFQ/73DSR9On2Ev809b8vjXKLMzvIGegJnWpNZ
 FDMOJzUBJFeAsMAplZZkGrLn3drdGgsfGRKCBympZ4LWOeAnF0Qf3cJEgDUYkyYrS8wh
 J1PGwfv1NNyGvYxPonmvCaRTnY/8fuOC8mZy7yszIwqX+DTUSbScSu7Kf6UvXZxS+/yZ
 maDg==
X-Gm-Message-State: AOAM532CD5TJ8Tov+2StnWhyyCqU5ivVrulTvSCXTz+XY74653anUQBO
 GCf4Z5TqawA0ThG4KbJaByxdvZtRLI77l20cHGo=
X-Google-Smtp-Source: ABdhPJxzAaV5DauAecsJzqBWmheSvDxk3ghiLfb6YRovClVg4kL4yUlGwYUFAnV+1q8jYrfo3AT6l8iJutzsg/2jTPA=
X-Received: by 2002:a05:622a:1d4:: with SMTP id
 t20mr16497208qtw.84.1639654948506; 
 Thu, 16 Dec 2021 03:42:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:199c:0:0:0:0 with HTTP; Thu, 16 Dec 2021 03:42:28
 -0800 (PST)
From: Selvia Santiago <mariamatinez119@gmail.com>
Date: Thu, 16 Dec 2021 11:42:28 +0000
Message-ID: <CAONDhKOtxcgjB1YEPd0RXNOVbbQ8k-9k32v_cdFxEKFzk62kJg@mail.gmail.com>
Subject: Urgent
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
Reply-To: selviasantiago1@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Urgent

I am Mrs. Selvia Santiago from Abidjan, Cote D'Ivoire, I am a widow
suffering from long time illness (Cancer), there is funds I inherited
from my late loving husband Mr. Santiago Carlos, the sum of (US$2.7
Million Dollars) which he deposited in bank before his death, I need a
honest and Faithful person that can use these funds for humanity work.

I took this decision because I don't have any child that will inherit
this money and I don't want a situation where this money will be used
in an ungodly way. That is why I am taking this decision, and my
doctor has confirmed to me that I have less than two weeks to live,
having known my condition I decided to donate this fund to a charity
or individual that will utilize this money to assist the poor and the
needy in accordance to my instructions.

I want you to use 70% of this funds for orphanages, school, church,
widows, propagating the word and other humanity works,The remaining
30% should be yours for your efforts as the new beneficiary.

Please if you would be able to use these funds for humanity work
kindly reply me. As soon as I have received your response, I will give
you further directives on how you are to go about the claims of the
said funds.

Remain blessed.
Mrs Selvia Santiago.
