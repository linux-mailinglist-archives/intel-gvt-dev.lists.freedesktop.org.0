Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B748593772E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2024 13:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBCA10EBAB;
	Fri, 19 Jul 2024 11:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZfBMQpb";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEAC10EBEA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2024 11:33:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-1fbc3a9d23bso13844125ad.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2024 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721388780; x=1721993580; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pD9Jcx/2kmf5Yki7yrBNbyE2xnpRx4VcjawAYhfgUno=;
 b=TZfBMQpbXCUVtjgqPhSTUOZpYbs8HZSgcP4tBEObTyphEHaNWp3c0swdWnEYCl1pxd
 iBYBIVgBsukWjStGJ2a3HBu3OH3pteljdQbzjH3Ha4IC6eaeXtpeSsGzNc6Vb2ATdsCm
 wtMgfTJCicNb3HEYqnkkFRBnom9B0Up/PvrO1k9cYQDHWcGkqbRWSaznW+zebgCu+qeS
 KKGm9DGbWz0VnQyhBoVxKm7e5i3rO7zpxSVUj8WZs531qfVhIrHA/Zcma3ogGp5jUIXC
 4LEWvdGz93yp1wKwdSJuAdrrftt0qnhf53oflpaWc2ngflZkZGWKhBo6be9/mWJeG0eQ
 Cr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721388780; x=1721993580;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pD9Jcx/2kmf5Yki7yrBNbyE2xnpRx4VcjawAYhfgUno=;
 b=T/Q4MzcrdlxahcqiceOhOTkDA1ooR9FYMHWfvri4HY33T8KAmebaLCK+OwYNiSNXlS
 Rfa9DQMlwG99vQsSSDJqlb/TvESadJrI82wAxss4dfGadOujKBXGYdDWwJbRdTMWg32G
 0VruQy/IZjdfLepMvnjzggHEWKjCMyHQETvAcnVy9ROxJNwwMLzGwEMrNAKrxZNCtVpw
 ihvLUtdR1Lyc29NfSqsvZPhrZQe6J9LxanTQrdea/ZbvAOwCNCHhkkaFiJ/mimdAbaM3
 ZLTeDEOg9NOs49OYQHICfyInU2Qw7n0nzWpq+t92jbvbMotICQUM17wDYX0Aq3YNjtep
 7J6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnbv44inPPPGP/Kodcqy/0wW6gll+9rr1/1/qKxvhWlFmD9vF7JVV7nEPwWLdsjxRwdQfbpFbpLKuRkBsftwCQCNQ/tJV8kOchFjRWXWRJSnJ+AQ==
X-Gm-Message-State: AOJu0YwHPYPt85GkNWCen7++zvhVIfcBDM50k/7yuaMtIK4yEFVoZm+Q
 A0B6lrpKmv10FHoahLkNbRBREuqWqv4lCfgeboZV4mtwnn87BiJ3OmDAgNImVuYBejP893D2ij0
 68K7H6cAMlvSCYraL/UeXDh8o6uc=
X-Google-Smtp-Source: AGHT+IEQZy6My+P7dBwXlgVEDamCvi9jfLfVlEHboPYwXgsM4My/RxET9ecr8ZdMrYCnbfIB4ltFSA24WkfXmgVsruI=
X-Received: by 2002:a17:90b:38e:b0:2c9:635b:7271 with SMTP id
 98e67ed59e1d1-2cb52662161mr6143675a91.21.1721388779242; Fri, 19 Jul 2024
 04:32:59 -0700 (PDT)
MIME-Version: 1.0
From: "I.M.F Department" <infosocietegeneralebj@gmail.com>
Date: Fri, 19 Jul 2024 12:32:30 +0100
Message-ID: <CAGoq13Rr9FgQ_KSmkfR6Q+uPp-KTxAGXG_nS=f50K0SoSJvy3A@mail.gmail.com>
Subject: Dear Esteemed Customer,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000b5119d061d980efb"
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
Reply-To: fk446876@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000b5119d061d980efb
Content-Type: text/plain; charset="UTF-8"

Dear Esteemed Customer,

Did you authorize  Mr. lee Khan Curtis that lives in Canada to pay for your
pending electronic funds transfer charges of $910.00 and claim your
life-changing compensation funds valued at the sum of Three million seven
hundred thousand US dollar each (US$3,700.000.00) that was willed to you by
the IMF in conjunction with the world bank dept reconciliation department.

Quickly response back to us now so that we will advise you accordingly on
what you are required to do before your (US$3,700.000.00) will be release
to you in the next 24 hours.

Get back to me for more clarification via email ( fk446876@gmail.com )

yours in service
Mr Frank Kelly
I.M.F Department
Fraud settlement victims.

--000000000000b5119d061d980efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Esteemed Customer,<br><br>Did you authorize =C2=A0Mr.=
 lee Khan Curtis that lives in Canada to pay for your pending electronic fu=
nds transfer charges of $910.00 and claim your life-changing compensation f=
unds valued at the sum of Three million seven hundred thousand US dollar ea=
ch (US$3,700.000.00) that was willed to you by the IMF in conjunction with =
the world bank dept reconciliation department.<br><br>Quickly response back=
 to us now so that we will advise you accordingly on what you are required =
to do before your (US$3,700.000.00) will be release to you in the next 24 h=
ours.<br><br>Get back to me for more clarification via email ( <a href=3D"m=
ailto:fk446876@gmail.com">fk446876@gmail.com</a> )<br><br>yours in service<=
br>Mr Frank Kelly<br>I.M.F Department<br>Fraud settlement victims.</div>

--000000000000b5119d061d980efb--
