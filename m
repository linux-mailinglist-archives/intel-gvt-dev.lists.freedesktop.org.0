Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109949706D
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 23 Jan 2022 08:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D08C10EE61;
	Sun, 23 Jan 2022 07:03:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C0710EE5B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 23 Jan 2022 07:03:03 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id b37so7198530uad.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 22 Jan 2022 23:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
 b=HW9sl8VFP4Qktb78ttQItQsfiXz6oCWNUpE1O4Z7iCipKxBzjW0aTPsQm9lLxnoxui
 92WBklVeWdwXAPV4BTJRuGRiByNPBcsy+PORttZZejna+qIkMfNZJWZuZDsgDs3rlufI
 DxaxTz2LiTKQzVD95G3Rz/XEk3LaBGXfKA/bLyJbGjBvJYQtimYx0ZtjpX2F0LuNem0f
 IqSivYIHiuHm4Tyu/x2Fk+blQzYzopSpaZB4j7fgcYdLcokKzMLKWyYg+dji8eWBxd7I
 IDxL/lgEmTO63UyT0BQLMuoh/BM/Gjg5S+xPT1OCjeazU7X8W3ckuDNQRskNmdidO2kD
 +Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
 b=7YGOsPOBvwl7rrtjhzD+HcxTbOulvHHtOHoJXhh3vC8Sp4dlVxUKXali5iyNvF2Ait
 GTLr9gr5kmnvW5eN4vlkGwUSdFdeP+ezm+FrFVpMHbM82deU6uqW8mYB6altxqR+0RXM
 57yhSvzAVKhpmxe+X/x7RvW5d8tC+rB1rnbVZFiCMW8pixIvAEPmXNRVh67sotrVpt8c
 D+hu56oraFN6DhYRF4GH6URZ0FqMJx8T4eValL3eHI2t2SRjjX6TciebHpFlz6dUYsta
 U0gHy1w/+2b3hYSx5njX1aLjhU4Ntlmy4qdsGiRA+6HPjezZFS/c5JAsujcBPgV+CYPv
 ne3Q==
X-Gm-Message-State: AOAM532UZtSbUL2+44CS4BzBizuEIvOtlanZQJPi/2+xvF4HKaZA4e/u
 FHO2KxuqLZ0NQLp69jrfK8/1DcaW1bQufKNWwQg=
X-Google-Smtp-Source: ABdhPJw77vvVJlLjBB/8Mo9YtdMH37wRan1KioQzSx40769Imo6LeRNxc86+5LKFuk/0PbFo1JckvqU9EneNBrZQ5e4=
X-Received: by 2002:a9f:31cc:: with SMTP id w12mr4414443uad.46.1642921382321; 
 Sat, 22 Jan 2022 23:03:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:cff0:0:b0:282:20c4:52f9 with HTTP; Sat, 22 Jan 2022
 23:03:01 -0800 (PST)
From: Seyba Daniel <kango3159@gmail.com>
Date: Sun, 23 Jan 2022 08:03:01 +0100
Message-ID: <CAN=6-KXWhp1eo-FRy=+ApkkowRa57mLuVo4ZVMPkWOVkCtptDA@mail.gmail.com>
Subject: Hello,
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
Reply-To: daniel.seyba@yahoo.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
