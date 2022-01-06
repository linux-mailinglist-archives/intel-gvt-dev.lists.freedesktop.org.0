Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458C48696B
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Jan 2022 19:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8341310E750;
	Thu,  6 Jan 2022 18:13:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FB610E750
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Jan 2022 18:13:37 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id t2so5441257ljo.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 06 Jan 2022 10:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=YeOt1ye8FZi8tKRtD9thBNSVBz47iaJ/BbXBO7gg6vU=;
 b=muv7ZhOs2bOCalj5r5ICkfDQpJtbCSdqNaog+EzTJDq/25w3yX9VfxjtFGMUavNOKx
 7lGQxY9CDmO1qpO44YMH0EiJcxaRJLLDSkJ7DKAB0MiPLtJ1PFsbih4vwJ1W2MTPujIW
 nE5x8i397BPnhdEQ/AANQMODTjYxVZKDULCedtyA9XORoHiwosYnwc0M+kNwqckOSdqn
 gmYd8NryJa12bE2dM1utOZULbyax2dvfKIbjtBb+OgUZmymBtAOqE245WeQaDegfOjjp
 U05pFMepKde7lUiFnmyd9Ud7qa1cGAtpjTWwaOWS55GOyGCfY432SE5t1O0VvBTxFSYj
 Al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YeOt1ye8FZi8tKRtD9thBNSVBz47iaJ/BbXBO7gg6vU=;
 b=NzJ4q+/pTyOwOCkYKJ+hMsU/oC8FJ0WbuLWgM2JWIzazymy0SKccwEjCRJjIRaGZE/
 L+TOozwpg6gEgM7pz9QUM3Dd/0nAa8f9dsqV5bkLPcAoXjBDVp9n3LZb1UzpzgJ9EDQK
 AgP0e1c25LaB6X2glEcWdn76xppcbO8+LovZ5y0a33ly24kSjcEzKFT7TM3xCRI3f8vu
 f4ON/caeJW0vcJlGecqTCkdoPqPVBWUzMsk/jn/Df9vgFDWqBCem2AIE5xD2xZ3ZKkDZ
 F1XXDkMXfC2z4f+Ha9OErx+anS4qFI56yV6Jw2L1yuUcIZU7ofgSboTzmIt0gDCeiDI5
 /YjQ==
X-Gm-Message-State: AOAM530D4ZF4dz6rPgpQHhXhVvMW7HbUpRv7KqOjinC7tDX9fHMUcAKs
 OgJdOCcfQuzzMoUf4WfxVkvK8ehG01x/Qvgk0ok=
X-Google-Smtp-Source: ABdhPJzSkD39cyGvRxMgtpNW3bnQAzudBUwgk/1UbxIsl8PGJko2lXCXhFR4PWRQRfdXpzqTZS0zK4vdMkKblA0PswM=
X-Received: by 2002:a2e:a486:: with SMTP id h6mr15557623lji.68.1641492816255; 
 Thu, 06 Jan 2022 10:13:36 -0800 (PST)
MIME-Version: 1.0
From: yacine  8447904 <yacinebeker88@gmail.com>
Date: Thu, 6 Jan 2022 19:13:24 +0100
Message-ID: <CA+QAkA9BOt2jB4oPOfGKYdSZYK3JeKHv=mVMwRfN=hCOJ16RwQ@mail.gmail.com>
Subject: hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000036df5805d4edd490"
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

--00000000000036df5805d4edd490
Content-Type: text/plain; charset="UTF-8"

My name is yacine can i talk to you

--00000000000036df5805d4edd490
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br clear="all"><div><div dir="ltr" class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr">My name is yacine can i talk to you<br></div></div></div></div>

--00000000000036df5805d4edd490--
