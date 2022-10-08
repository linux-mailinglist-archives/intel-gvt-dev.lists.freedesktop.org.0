Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E75F8642
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  8 Oct 2022 19:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6F610E32C;
	Sat,  8 Oct 2022 17:44:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB5010E328
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  8 Oct 2022 17:44:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a67so1522512edf.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 08 Oct 2022 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NejCTqQqUuB3V48BMCef9pKSecNc6ZjGXv7ruVN6amQ=;
 b=R82zc8MJaOVh1ipPMV0EfJNScK/Z/c002szTR1FiXW4ZpXAFjNeaxHtoFfxIXUjlBo
 bbeUSNJgv+b+0pmOkD+4TKoiN0LQNl5HeRVvecuPGd6g5QE95mEe/U3Amgfc3ak6Fiym
 cfbKa4Q24NAwkbzpD4R4/YhjwrpOM7mOmD8bTqx+fYZ1jDFPWQwLQfIKg4WEaJ9TQsY3
 IqAbotDVLYokMlQAR2L7FewRt9eOEVNtPPU4ry8tlzxadkzZq8sKnlPs5VwOHTofnze2
 ltcPlKUU8yAuAjpON2hidbKJj6lA4fZk75qOO3XDytjXvHeu6poBa43mRSZDBayRCAci
 rhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NejCTqQqUuB3V48BMCef9pKSecNc6ZjGXv7ruVN6amQ=;
 b=6tDpUKx0q6+8UvGK/div7V/f4pR/VESvqcO8I4AuuY43WX2vJPkTrStt0+ACrpHksR
 tmZW/M9DpmrtJbnGOhH0VUqLSMcwShO9Gj0UdOL6UTiIdPLq4l/4ldpzOrnMnMNoD+CZ
 WsiL855thjMpLugrq7sxH816aWgkL0H2hjMJM4I17TbqrGFlrv4Kee5jwW3rAk+o+0c0
 UyO6lDqHNYxJAzgQDXWOVW+Uduigm38iiR3Bo+GCd2WnlWODz6z+GLfy9GTSB7ueJSV7
 aia9+rBu9RUvzdO94fOSW8Qr7dnKeG4aOmqEV1/sD6XMQvwp4KNzAKQTzUZTK0lm72cV
 HfTw==
X-Gm-Message-State: ACrzQf2E1KuH3cpJbA/kybQOVKeEhy20BMDvuGp+AnO8xbZ33jjSTwry
 bQtC5qopgQQYKNg/wxqlG4ACC6iOxTt/4/Ltyk0=
X-Google-Smtp-Source: AMsMyM5IK4CQEuQIP1MHy5m5OoLhP4ouVKpRLcmE9WNWJ2TsZM0VQkm4TOl9IcH7kGccHiC5ey1kUWRTTq/TQ3kQThQ=
X-Received: by 2002:a05:6402:1a31:b0:458:587e:e397 with SMTP id
 be17-20020a0564021a3100b00458587ee397mr9842560edb.31.1665251085143; Sat, 08
 Oct 2022 10:44:45 -0700 (PDT)
MIME-Version: 1.0
From: marine medic <oilcom101@gmail.com>
Date: Sat, 8 Oct 2022 18:44:33 +0100
Message-ID: <CAOn4XELCX7wzOMgRc-j2v=meMWoUPu7+TmReo07KqmUHq_PZaQ@mail.gmail.com>
Subject: hallo
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000006452d005ea897bde"
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

--0000000000006452d005ea897bde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Du f=C3=BChlst dich zu mir hingezogen, ich w=C3=BCrde dich gerne kennen ler=
nen, ich
suche einen Seelenverwandten und Kameradschaft. Bist du interessiert? Es
tut mir leid, Ihre Privatsph=C3=A4re zu verletzen. Es hei=C3=9Ft: =E2=80=9E=
Ein Bild sagt mehr
als tausend Worte, aber als ich Ihres sah, war es mehr, als Worte erkl=C3=
=A4ren
k=C3=B6nnten =E2=80=A6

--0000000000006452d005ea897bde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Du f=C3=BChlst dich zu mir hingezogen, ich w=C3=BCrde dich=
 gerne kennen lernen, ich suche einen Seelenverwandten und Kameradschaft. B=
ist du interessiert? Es tut mir leid, Ihre Privatsph=C3=A4re zu verletzen. =
Es hei=C3=9Ft: =E2=80=9EEin Bild sagt mehr als tausend Worte, aber als ich =
Ihres sah, war es mehr, als Worte erkl=C3=A4ren k=C3=B6nnten =E2=80=A6=C2=
=A0=C2=A0<br></div>

--0000000000006452d005ea897bde--
