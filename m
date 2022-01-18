Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD034921CD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jan 2022 10:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13993112985;
	Tue, 18 Jan 2022 09:03:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E204F112985
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Jan 2022 09:03:50 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id g81so53653381ybg.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Jan 2022 01:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=IAamEH5Xu1dJ3X0trVcFTPIrL7aTtcDGn5mUS4vw1a8=;
 b=MKVoGuH84JEqwH7FLePXiHWn749zPRU0NdtP8Sm2JMhUl9c1iVyWjbwz6g8cfGp/lf
 wGwjovvsv0mdzOrkruLS7VCe5a7nqOLOAOguQfLlO7KlNogBFH31ts7TJnJIMROay93O
 zLFD2FXmAbjh/mANJwaPSceaNEIBY2ial/GMPVceYyFjbk49spZ6usuG0YECL34rgvGB
 iei5o2VJiTWPHrHs+06yeYgSnvm3Lro4YfCcKClwdqQV0oHYRRf0rSUvau/jSGUGIY/g
 PIq25ry8zIUYTR1kpaKtOSp5p5QnPiBRoNfQN58gXlJM4igUY1pzRJNojXS4U/9SVgkd
 1m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=IAamEH5Xu1dJ3X0trVcFTPIrL7aTtcDGn5mUS4vw1a8=;
 b=NHW+Sh+Qi4dHfuTTEzONAtHi2z2Z/2tWBO7c9aCH7za1Xn8ygjXwYRlBTvIDxQwenF
 1W0S2stmOgs6cHZXGdHVvs7ohdfYTI0RXkKB01YcbMtUzjnP2wx4XvIEu55+6hLlvaD7
 WDXxVydgT5/WlKyUG0v/xbTR3YpHwqYIi22VSsXcuECnqON4DA9hX9JEKVsjtRwV9f0n
 jDw5dK/i+48SqWACdhYksbpSUZ75WmlZU5JFeqGogBqLmzmKNaUGo2Urlx+KQS1zoXw0
 nfkzjmcTGymFmwd8NesrrklkMsPq9xYFMqcFNN3YD3CHSR4U47DGYQFdOZdkxvypBuBx
 xbjA==
X-Gm-Message-State: AOAM530vyePA/IOKdwIKZSXsw9vRCgLzWdwfXoFCDT51nJmg8i2VC1aP
 Y8pU7UZ8o0bsMw31LypjqxjaKzYSS8x+NWRLIxQ=
X-Google-Smtp-Source: ABdhPJy6S8YpzyetQz5KgFrhfh63qx4z5C4Z/Y2SVI8oau6/Qt6fRl+454Z9GiaGeU2dYh9fMxr8ktnL9Tw7RDFSq4I=
X-Received: by 2002:a25:7287:: with SMTP id
 n129mr30710797ybc.351.1642496630031; 
 Tue, 18 Jan 2022 01:03:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7108:3655:0:0:0:0 with HTTP; Tue, 18 Jan 2022 01:03:49
 -0800 (PST)
From: Asil Ajwad <graceyaogokamboule@gmail.com>
Date: Mon, 17 Jan 2022 21:03:49 -1200
Message-ID: <CA+Yy_gAHH8Aue7iwiH_cJ4+g8NkHKK3sLYXeb_HRC+HesC70HA@mail.gmail.com>
Subject: Greetings,
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
Reply-To: asil.ajwad@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

-- 
Greetings,

I am Mr.Asil Ajwad, I work with United Bank of Africa, can you use
an ATM Visa Card to withdraw money at, ATM Cash Machine in your
country, if yes I want to transfer abounded fund the sum of $10.5million
US-Dollars, to you from my country, this is part of the money that was
abounded by our late old client a politician who unfortunately lost
his life and was forced out of power Du to greedy act, the bank will

change the account details to your name, and apply for a Visa Card
with your details, the Visa Card will be send to you, and you can be
withdrawing money with it always, whatever any amount you withdraw
daily, you will send 60% to me and you will take 40%, the Visa Card
and the bank account will be on your name, I will be waiting for your
response for more details, thanks to you a lot for giving me your time.

regards,
Mr.Asil Ajwad.
