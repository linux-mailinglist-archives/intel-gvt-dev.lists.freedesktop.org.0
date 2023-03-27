Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CD36CA352
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 14:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B99110E583;
	Mon, 27 Mar 2023 12:15:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3971C10E583
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Mar 2023 12:15:23 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id cf7so10244857ybb.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Mar 2023 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679919322;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLqkbmJip/jMekdeZljU19tMxsE6BwRoWHyDlDr1308=;
 b=m2pZHyPBvKqyixF5KikiP1wcjsV4dp2+5njDnxNQAbSP96WE0zw5C6Zw7VMZaCYPdu
 rM7ZUZ6x+29Z/fb9jai/w1qdiY0Nli28H6kWkC/Uw20kyXFEj4oX/ZUSv/9auWDIMlwJ
 ivU17fcFr3WY0L84F98vj14RzCRIET2ft9/e7Rr8EK63wl6jz7MUHZKUB0fONAFsS1gS
 nvd0i0rMGCHKfJii2ogMnPDN+QY821Od9W6ob8MPupIAqFZq/icf8y3iGgQftiCse4oH
 UEpJ0qJkUHI8iRWexoW2sYBQdiXiofEqKl9ph1HoHRzxCl8g22Yd7hDLHKcDnzTqzV6R
 47ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679919322;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eLqkbmJip/jMekdeZljU19tMxsE6BwRoWHyDlDr1308=;
 b=d9jncVvZTJdv+hgOpmv4KBmxQlSaYdROcnJQe5Kd+L8gQ4OtzIHTgKGDb1DlHpPaK0
 hSFKLWBii7uWsSr4DRfwhC5Vho80XABFAsW6+TvCsLvxrsO9hdunTep/Yhw3nuVx7KOR
 td56pFwsjPLrq/DPYxrPdtwpicm4pCIXq2jWwDrW76rrOw0AAGgAlt8aB43lJNBa1tRn
 YfrPswIah4I2GA6dxm6Nofrao2C3KXRhJ9pdKzpp1u9fZ/KF0ncsDrDDaZxVTbe1HPlG
 XLVOnKpwDrv0aZwgRrhKSZr4lLwtHyoQcal40yzxpYfsjjuRZbg9wk6bmIl5D2SC7VRt
 Ui6g==
X-Gm-Message-State: AAQBX9crH5ZP3v6YgYwjW8/tpnuUHU8FkdTjFirEaauuiSrPWCHpQjSp
 BRyRI/+lrL90CUgFiFuZ5qVrleCK9yRwH9QJMro=
X-Google-Smtp-Source: AKy350aC3RbEJD1BMDOAN6MpMM2ksn6Oyrv5cKG/9PPAEFfo3b/YxgRyLG4hispYvZ+eM6Y3MDHWNnQ2JJR8DmbWRIw=
X-Received: by 2002:a05:6902:722:b0:a09:314f:a3ef with SMTP id
 l2-20020a056902072200b00a09314fa3efmr6970341ybt.12.1679919322005; Mon, 27 Mar
 2023 05:15:22 -0700 (PDT)
MIME-Version: 1.0
From: marine medic <bwllcs103@gmail.com>
Date: Mon, 27 Mar 2023 13:15:10 +0100
Message-ID: <CAFekM9Xb2fi9CFAUg78GBi55MTTvTi72-V+KFUOZck=HcJDHYA@mail.gmail.com>
Subject: Hallo
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000070915a05f7e0b2ad"
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
Reply-To: jkirinec101@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--00000000000070915a05f7e0b2ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo. Wie geht es dir heute? Es ist sch=C3=B6n, Sie kennenzulernen, und ic=
h
hoffe, es macht Ihnen nichts aus, mit Ihnen verbunden zu werden. Eigentlich
habe ich auf der sozialen Plattform nach meinen alten Schulkameraden
gesucht, als ich auf Ihr Profil gesto=C3=9Fen bin und Sie von mir angezogen
wurden. Ich w=C3=BCrde mich freuen, von Ihnen zu h=C3=B6ren, damit wir uns =
treffen
und kennenlernen k=C3=B6nnen. Es wird mein Wunsch sein, eine starke Beziehu=
ng zu
Ihnen aufzubauen, weil ich das Gef=C3=BChl hatte, dass wir beide dasselbe
wollen. Noch einmal muss ich sagen, dass es mir leid tut, wenn meine
Verbindung zu Ihnen Ihrer moralischen Ethik widerspricht. J. Kirinec

Hi. How are you today? It's nice to meet you, and I hope you do not mind
being connected with you. Actually, I was looking for my old schoolmates on
the social platform when I came across your profile and you were attracted
to me. I would like to hear from you so we can get to meet and get to know
each other. It will be my wish to establish a strong relationship with you
because I felt that both of us want the same thing. Once again I must say
that I am sorry if my connection with you contradicts your moral ethics. J.
Kirinec

--00000000000070915a05f7e0b2ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:rk" class=3D"gmail-Ar gmail-Au gmail-Ao"=
><div id=3D"gmail-:rg" class=3D"gmail-Am gmail-Al editable gmail-LW-avf gma=
il-tS-tW gmail-tS-tY" aria-label=3D"Message Body" role=3D"textbox" aria-mul=
tiline=3D"true" style=3D"direction:ltr;min-height:240px" tabindex=3D"1" ari=
a-controls=3D":ua"><div><span style=3D"font-family:monospace">Hallo.
 Wie geht es dir heute? Es ist sch=C3=B6n, Sie kennenzulernen, und ich hoff=
e,
 es macht Ihnen nichts aus, mit Ihnen verbunden zu werden. Eigentlich=20
habe ich auf der sozialen Plattform nach meinen alten Schulkameraden=20
gesucht, als ich auf Ihr Profil gesto=C3=9Fen bin und Sie von mir angezogen=
=20
wurden. Ich w=C3=BCrde mich freuen, von Ihnen zu h=C3=B6ren, damit wir uns =
treffen
 und kennenlernen k=C3=B6nnen. Es wird mein Wunsch sein, eine starke=20
Beziehung zu Ihnen aufzubauen, weil ich das Gef=C3=BChl hatte, dass wir bei=
de
 dasselbe wollen. Noch einmal muss ich sagen, dass es mir leid tut, wenn
 meine Verbindung zu Ihnen Ihrer moralischen Ethik widerspricht. J.=20
Kirinec</span></div><div><span style=3D"font-family:monospace"><br></span><=
/div><div><span style=3D"font-family:monospace">Hi.
 How are you today? It&#39;s nice to meet you, and I hope you do not mind=
=20
being connected with you. Actually, I was looking for my old schoolmates
 on the social platform when I came across your profile and you were=20
attracted to me. I would like to hear from you so we can get to meet and
 get to know each other. It will be my wish to establish a strong=20
relationship with you because I felt that both of us want the same=20
thing. Once again I must say that I am sorry if my connection with you=20
contradicts your moral ethics. J. Kirinec</span></div></div></div></div>

--00000000000070915a05f7e0b2ad--
