Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE5C607BE
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 15 Nov 2025 16:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D610E0A3;
	Sat, 15 Nov 2025 15:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bf-xwwei-com.20230601.gappssmtp.com header.i=@bf-xwwei-com.20230601.gappssmtp.com header.b="IGXNwWbI";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF56C10E0A3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 15 Nov 2025 15:11:44 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-64107188baeso2680910d50.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 15 Nov 2025 07:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bf-xwwei-com.20230601.gappssmtp.com; s=20230601; t=1763219504; x=1763824304;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrxZyi+m23mucq2Z/P3CM6sjm1oN40KGDpxi+vbcFdI=;
 b=IGXNwWbIJZ6AYc3yf68iOY9xqVVfR5M1dD96v4Lt4UFaccdIRHePV+1uYgwvdg6GoP
 p+emORp7oZhRVe+tXm4xTCYaVwF5ymoQJE6XVTS2Hk95B9zvUSUQbsK0XRsVPpZAxtMX
 vuc98GLMoXk0bsIjj3LgXJbtjNOy/CyzzcFX905kay3rHTHpGQwAx7yR7L9/hqoj0M9L
 wyndbCuGl3EcFG1QCOVEw+3shmfPU3JdIvKQa3mPuR8ww0gVj65WFQ8wQlz8MNNiE1gR
 rrOQQ/+Z+a52Ns18PSZ8PsluCB0zyMOvy73tbTytcvMhp8gzXBfuioWMHnQcWEBnKByU
 0E+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763219504; x=1763824304;
 h=to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrxZyi+m23mucq2Z/P3CM6sjm1oN40KGDpxi+vbcFdI=;
 b=AcxM8aGRKvOk4AAU/+U11tp41Sh/Eb/bB98YNhjt0XHlSk57UdCbmQUX9GTnMhNOod
 lxm77nX0gg03aXesx+GtTDdGuQomqe4JOUa4LTbuadq8xQ/XpQuLRi/dowG3UzbssQm/
 yecdhgsUmildxHNcA4Faa5SkNnwbxcTKc5I9NIBuLXgcXgr6Ja3w6Vt63srEPcOFpUIG
 8sayAocggmvZ4vJAI4ezjNIn4V18t9rY6eLUp/4cPk9YzEiw4wpsFS33VNfm5ItXd1a/
 CJV+mInoozWmO5dtLQxM2rNMkWmY+uAynU9O+uYz2BbN/TBclCu2Jxo1kU227ERxhaHn
 bUww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwIxLHFgFmUQDRgfm2I63KylXxsZsdRhzvHFgktIE6AY6KXvO9O/YoSUdhAZFCcPoMT48ueNE1ImhbtMCK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz74HvytRgkOWxNzu2RAzDYTRzysAtSdOsUfY3SUxHJDXamQcp
 khK7qllIVY3hdnR4Bm/n3EtDUsg7Kojy52g6yTCw9glIflcToPJkvNBRfzHhLfjuwOn8hu7RjfH
 Sxg3t5Gx3bZ3GIIBUXv9Lrqm2ggPja9v75uDs66yKMA==
X-Gm-Gg: ASbGnctuojOQ3pMFmVdI3gCrAmVekgzvhnBKh+t1Lz2DuuM+lyiu2dB9wmABaqL5ZWN
 B6XzLVh+3DMnoH4DRgC/oWwPxcQchZCyS9ynbymeRyTN+h1S8yMHp+pAG2ueX03vmz9zOq2sDsU
 CtH9+2OL3wqD0+coMn/BpdO66dvQ4RRjcPPyUETk7eAlQHS+yLm7u5Pl9pY4xlbgF/mo1Cf3mSg
 x5S5+5XhFLN1OVLidi/o4AIcBXh4+s5787NKt4BDRu3RTcDjrcFRva7WvvCU6b1rSunI8M5Urf+
X-Google-Smtp-Source: AGHT+IERMz0jPVl+FaPWL6OZyMQBY0erbG6M88yIUya6UHrIKa4ya6nwFhMzr1uahnRhxj+5RsausfpZPcrECQD+Aa4=
X-Received: by 2002:a53:c04b:0:10b0:641:f5bc:6961 with SMTP id
 956f58d0204a3-641f5bc71eemr1725429d50.77.1763219503756; Sat, 15 Nov 2025
 07:11:43 -0800 (PST)
MIME-Version: 1.0
From: ALLAR TANKLER <wnfht@bf.xwwei.com>
Date: Sat, 15 Nov 2025 15:11:31 +0000
X-Gm-Features: AWmQ_bm_XU9mRG7KqCKeoBKS_WKMGDWc1q3Fky3-wEBxwOlGzW442zO61ObQKbg
Message-ID: <CAM97E-00Cau6959rRnPzbFOGdphwMvxSJJyduLk_qDFH6hfBnw@mail.gmail.com>
Subject: =?UTF-8?Q?Freigabe_von_F=C3=B6rdermitteln?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002ec6830643a388a9"
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
Reply-To: allartankler.eib@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000002ec6830643a388a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

EUROP=C3=84ISCHE INVESTITIONSBANK

98-100 KONRAD-ADENAUER-BOULEVARD L-2950 LUXEMBURG,

LUXEMBURG



Sehr geehrte/r Beg=C3=BCnstigte/r, wir haben Ihnen diese Nachricht bereits
gesendet, aber Sie haben noch nicht geantwortet. Bitte beachten Sie, dass
dies Ihre letzte Chance ist, diese F=C3=B6rderung zu beantragen.



Wir freuen uns, Ihnen mitteilen zu k=C3=B6nnen, dass Sie f=C3=BCr eine kost=
enlose
F=C3=B6rderung in H=C3=B6he von 1.000.000 US-Dollar von WARREN BUFFETT im R=
ahmen des
Programms zur Armutsbek=C3=A4mpfung und wirtschaftlichen St=C3=A4rkung der
Europ=C3=A4ischen Investitionsbank ausgew=C3=A4hlt wurden.



Sie wurden aufgrund der Empfehlungen der Programmsponsoren und Ihres
gesellschaftlichen Engagements ausgew=C3=A4hlt. Bitte kontaktieren Sie in d=
iesem
Zusammenhang die Pr=C3=A4sidentin der Europ=C3=A4ischen Investitionsbank, D=
r. Nadia
Calvino, per E-Mail unter nadiacalvino@outlook.com. Sie ist f=C3=BCr die
=C3=9Cberweisung zust=C3=A4ndig und wird Ihnen weitere Anweisungen zur Guts=
chrift auf
Ihr Konto geben.



HINWEIS: Es gelten die Allgemeinen Gesch=C3=A4ftsbedingungen.



Herzlichen Gl=C3=BCckwunsch im Voraus.



Allar Tankler

Kommunikationsdirektor der EIB

--0000000000002ec6830643a388a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.=
0001pt;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lan=
g=3D"FR" style=3D"font-size:12pt">EUROP=C3=84ISCHE INVESTITIONSBANK</span><=
/p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">98-100 KONRAD-ADENAUER-BOULEVARD L-2950 LUXEMBURG,</span><=
/p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">LUXEMBURG</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">=C2=A0</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">Sehr geehrte/r Beg=C3=BCnstigte/r, wir haben Ihnen
diese Nachricht bereits gesendet, aber Sie haben noch nicht geantwortet. Bi=
tte
beachten Sie, dass dies Ihre letzte Chance ist, diese F=C3=B6rderung zu bea=
ntragen.</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">=C2=A0</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">Wir freuen uns, Ihnen mitteilen zu k=C3=B6nnen, dass
Sie f=C3=BCr eine kostenlose F=C3=B6rderung in H=C3=B6he von 1.000.000 US-D=
ollar von WARREN
BUFFETT im Rahmen des Programms zur Armutsbek=C3=A4mpfung und wirtschaftlic=
hen
St=C3=A4rkung der Europ=C3=A4ischen Investitionsbank ausgew=C3=A4hlt wurden=
.</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">=C2=A0</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">Sie wurden aufgrund der Empfehlungen der
Programmsponsoren und Ihres gesellschaftlichen Engagements ausgew=C3=A4hlt.=
 Bitte
kontaktieren Sie in diesem Zusammenhang die Pr=C3=A4sidentin der Europ=C3=
=A4ischen
Investitionsbank, Dr. Nadia Calvino, per E-Mail unter <a href=3D"mailto:nad=
iacalvino@outlook.com">nadiacalvino@outlook.com</a>.
Sie ist f=C3=BCr die =C3=9Cberweisung zust=C3=A4ndig und wird Ihnen weitere=
 Anweisungen zur
Gutschrift auf Ihr Konto geben.</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">=C2=A0</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span style=3D"font-size:1=
2pt">HINWEIS:
Es gelten die Allgemeinen Gesch=C3=A4ftsbedingungen.</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span style=3D"font-size:1=
2pt">=C2=A0</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span style=3D"font-size:1=
2pt">Herzlichen
Gl=C3=BCckwunsch im Voraus.</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span style=3D"font-size:1=
2pt">=C2=A0</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span style=3D"font-size:1=
2pt">Allar
Tankler</span></p>

<p class=3D"gmail-MsoNoSpacing" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span lang=3D"FR" style=3D=
"font-size:12pt">Kommunikationsdirektor der EIB</span><span style=3D"font-s=
ize:12pt"></span></p></div>

--0000000000002ec6830643a388a9--
