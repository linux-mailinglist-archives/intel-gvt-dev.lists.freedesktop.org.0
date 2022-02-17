Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2E4B9E44
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Feb 2022 12:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327B10E94B;
	Thu, 17 Feb 2022 11:06:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C518710E94B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Feb 2022 11:06:06 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id y6so12244326ybc.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Feb 2022 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=rTJBXwJxq9/qp8kzA5tfxQDlzYVeKstWP0UMLLFCZDs=;
 b=EqyaLHF6buO0HSwiRNgsNK3KN6gVElHJPj8qrEeJg6Sh1u8o5FkGtrN7rkJ5/Vgeg9
 qMbUZxQ2TZEwHRZmPkf+RTH8OJPM5ImvKp8frCEN778Z9XxM9LOTJV0HgU4JdM4qLTcN
 IWJmmmU5AYfa0dO++NfP8O1LgiP9Z1Qikrt4hsYtGoLk+Iwoug9klmVo2qPzM1G2xfFQ
 lpUStdLOpPUp5IFFbaD8lkOPn13W2S0hThT+fQKXVeK2We4jY0gxRG5v7C/oKFl8AqyF
 ZszVftymWWtjPZxb6TqPZ8dlLPTOq2zBWSedm2EoJE3xYlwZAljBBhrMcm+35TP+M/9S
 vi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rTJBXwJxq9/qp8kzA5tfxQDlzYVeKstWP0UMLLFCZDs=;
 b=PZaCkPay5tf+51b0nPNmaTISoPZHVZh2FdMoU5iuUUyjlf37klSahLFFfHYTatv8T3
 ZPnA6mcB6neQa5+dx9MWkIMBJJv+DpQvEayTOCraimsclGX4iQSZoTqWeln6wG8lHZMp
 QAvNOD6rdbbDBtDTRjtLaufrC1lmrMGnX0zIlFBp4RbYSVFgjaZMYR9aG2Iqnhnr0dFa
 5LD408KA+qzFWUA3zG3oIBveM/Yu4VaoxXmPiEOJgMHqsSXwnmYC7ptB0I+u/xcA7I/w
 qQAvltyOL8ulUdKYim+GzVc996+VfSuE61JKVTPmsobzY1Tv5DIqqmYBqXIhCyiPQcqU
 PUlw==
X-Gm-Message-State: AOAM53049DlN98SbajdPlol8Oila5WueH3cT5pAc2bHus9wp2/blL+Sq
 oaDnI9Ghkm1q9udsB+Y57GOFvhxNHxXdvas51Rg=
X-Google-Smtp-Source: ABdhPJzsTVzYkVsxP9BoId85d2EW8/5vPbRjAPv8JJwsgWU1cI1mrS/CbKqTfIByww7XMFXKiY9QlaEToq3vo2fdWFA=
X-Received: by 2002:a5b:b08:0:b0:615:304c:fbb0 with SMTP id
 z8-20020a5b0b08000000b00615304cfbb0mr1960469ybp.556.1645095965859; Thu, 17
 Feb 2022 03:06:05 -0800 (PST)
MIME-Version: 1.0
From: Lisa Jaster <lisajaster1414@gmail.com>
Date: Thu, 17 Feb 2022 11:05:51 +0000
Message-ID: <CALwm_YorpzrhPHmaNbfkqP=F1VrQZToyEmRb5SX9=zckjG4zQA@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000aaa37605d834c0a7"
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000aaa37605d834c0a7
Content-Type: text/plain; charset="UTF-8"

Hello,
How are you doing? I am Lisa.
Please get back to me urgently for an important discussion I want to have
with you.
Thank you.

--000000000000aaa37605d834c0a7
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hello,<br>How are you doing? I am Lisa.<br>Please get back to me urgently for an important discussion I want to have with you.<br>Thank you.<br><br><br></div>

--000000000000aaa37605d834c0a7--
