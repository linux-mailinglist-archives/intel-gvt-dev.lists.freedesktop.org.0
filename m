Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9059671AF
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 31 Aug 2024 15:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490D210E0AE;
	Sat, 31 Aug 2024 13:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AT+iIyO9";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306DD10E126
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 31 Aug 2024 13:05:54 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-533463f6b16so3485378e87.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 31 Aug 2024 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725109552; x=1725714352; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5wRZ2/YvLbD0rIlo0ds7GNcj84qpOcRrw/Btoavjv4=;
 b=AT+iIyO9Wq0SAUZrp7lq1W2AsVKasgLFfNRsvEh2lFeJIJKfsIchuKWGvxkySB000h
 zp6voR25BFyhu/bLsTQud1adOMRrKjz4RSKbaT9luR2xicvoK1yeXopw91agHjh6KXQp
 1B7v5dUW56V3RIswEGQEoPG0b6fPUcRlkXMO2aSU3Heh4JIAHuk70KYPSw0Vy3gaLpJZ
 2AlS8YjUnpl12oY8bLhm/ZDJGm18YxYe4QzAY+9X6BRfr4mghcMDm/aVVYpn2luhFU2k
 qYkBbf14ZtrJpFNbD0tFHilpO64QEJbIF5m+hHYEx1GESkYe9BfqGqlTkjbU8WWTL236
 PNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725109552; x=1725714352;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5wRZ2/YvLbD0rIlo0ds7GNcj84qpOcRrw/Btoavjv4=;
 b=QbjU7mp55obIfYP10LEwwdvmwq6AEYA+/Do2ySd1wpOaYAByDdR8wrBhLuAzCmhpkQ
 Mack1ARl1TiHRoXlfzQu8WGYwA1eDXmXmKP5fr6mdyU+Wb+suRLM7o28MQURdtvQh1ps
 lCFhyEQJDiRlwZhZrXGU8j7OvCsSTplnmg8G6Zj/C0HBA8wdeDlzjCC1LPdq4+DggS9K
 gr+Ar++jklI55rEsxZjt1hf83h87eanAlaDmb6mbdSbkydleT9Vf1DR990HAyGaO32Cr
 JOfYrpwvbJt5cQNSbTx38Twd5Mw+nbtnWFey86THe9QisAszFc1oWKQeFIkz2txtzsQr
 NItw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvwYrW5hMnpHL78MO8NpoXEUQzo4d4ppOd9QJ4KjsbRXXyRidW35j7o9zxNP31v92Br5kBF2In4M12nt7H@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6wpHyINh85EoFWpS3MbDZOvVlFUuS7ARQkjhzG3UaZa1389Jm
 /lQLFFt5YExhR1qy932pd8osc6wRrcwos4bzfyfeiyZmMGFmMlAW0bUFCNxeJto0XKSEsp6rlx6
 2iOANUUAFGRIJTmrAlx2WZaEpQ7U=
X-Google-Smtp-Source: AGHT+IF2XjB2RItHMjLuYTvx8BIriJrnf2w5lwaXIV3uCxmBC790T6vpbsTtY0FQ33PcP33e5OcJ5EETh7vIQ8ROk+M=
X-Received: by 2002:a05:6512:3351:b0:52f:89aa:c344 with SMTP id
 2adb3069b0e04-53546aff219mr2913702e87.16.1725109551166; Sat, 31 Aug 2024
 06:05:51 -0700 (PDT)
MIME-Version: 1.0
From: Amir Aaliyah <harunabb9@gmail.com>
Date: Sat, 31 Aug 2024 09:05:37 -0400
Message-ID: <CALvF3s+M3yLv8STZ51wt5rnvtn_Qcxk5O8KYrsH-bhrQiTF4dA@mail.gmail.com>
Subject: I await your urgent response.
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000fefc5d0620fa5d49"
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
Reply-To: FIRS01@protonmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000fefc5d0620fa5d49
Content-Type: text/plain; charset="UTF-8"

-- 
Dear Sir,

My name is Barrister Amir Aaliyah, I am a financial attorney practicing
here in UK, Kindly revert back on receipt of this proposal to enable me
divulge further details of transaction proper.

I await your urgent response.

Yours Sincerely,

Amir Aaliyah

--000000000000fefc5d0620fa5d49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">-- <br>Dear Sir,<br><br>My name is Barrister Amir Aaliyah,=
 I am a financial attorney practicing here in UK, Kindly revert back on rec=
eipt of this proposal to enable me divulge further details of transaction p=
roper.<br><br>I await your urgent response.<br><br>Yours Sincerely,<br><br>=
Amir Aaliyah</div>

--000000000000fefc5d0620fa5d49--
