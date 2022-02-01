Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C54A5489
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Feb 2022 02:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C8010E2D6;
	Tue,  1 Feb 2022 01:12:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F40610E2D6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Feb 2022 01:12:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v13so28737240wrv.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Jan 2022 17:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=RdO+S8IhMJhw9rPCRp5/w7vWahd+4h+4ukzA1Ad0CYc=;
 b=C9XB2VcXlFAgodLQkmE+X8j1vdRkfBakQysT/5tF2j9JcOtfZHqCHtCDMM9P87YOzG
 94LQTeOhwnKCR0jzP2jivNkfvqOGMa7Bzc7fWbFD0UzFdS2djDJJi9MPyAgikeBS3T/A
 3QP3tNUmeRkXiSdu9dYom5ktWx1jhnvFiDv/+mgVSkkUo82a8koRDDBBArmQqMc8+YrE
 jbJQgx6iZvNUsaukwRhzRxWh+j+Szxf49CiO/S4n/yOdlNSbDMbk72FLRyh1AHUcuxtI
 QZC66exygF12/E2fWb7hsSIJCwoTZOAVfYJyfX2dO3UeGFjFfnQzETyPHrKUxYCFe/kh
 2WLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=RdO+S8IhMJhw9rPCRp5/w7vWahd+4h+4ukzA1Ad0CYc=;
 b=dCUUMzdXTK0YYjQ86nbfhY+Ks6zRLjrbTp4TmbEc4pjl6DojkoMjoqOi/KK6MRbmSY
 TyyqldgtMthlnLAkuTbN8u9gOiJNO2ptqA0Ip3L81D54V9Sh2bJ0VXEm9imGq/xv8Ag+
 GAJaElyl0YzjNp/FplhlhhKNUAp1HRoA6tt1uSP/rRRD9IIMVHSVbhB3R+QYPSvECVRB
 X+ssTi8ehJZR12MKHrklDI2QOoZgaPdr4PmIdZx/c5VCZW2AHfUeocwz7DElHoIdU+sx
 etiPBmWxal/cWROLr6bw4nSV6/GV46MsbAkZ77Fr7gdXfUYHu5XhWZFy9IZVWNjeo+jW
 HHaw==
X-Gm-Message-State: AOAM531Wu2iK+odKJccXd7Gzay/lEkkhJnkpJyv8p2lloP/XmWPiftyM
 5G7s2t263HpEzQGoKYYovJuFvXUj+/5H5ULttgs=
X-Google-Smtp-Source: ABdhPJy+vPFamiNPncQQqzri5/VR6k+5/oNUH5cE50kMULYovaqHWuw8ezMYe9CEDs6+hY3yPktlIkQSMwZA+HdnyNs=
X-Received: by 2002:a5d:548a:: with SMTP id h10mr10596295wrv.221.1643677974868; 
 Mon, 31 Jan 2022 17:12:54 -0800 (PST)
MIME-Version: 1.0
From: mary mark <sinone.jessie@gmail.com>
Date: Mon, 31 Jan 2022 17:12:21 -0800
Message-ID: <CACFAAw5h06ZL6Z9CZJ60cfCW2uZPeKCnArEFAut10PJOb1umOA@mail.gmail.com>
Subject: Hello Dear
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000d1382c05d6ea992b"
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
Reply-To: marymarkvv@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000d1382c05d6ea992b
Content-Type: text/plain; charset="UTF-8"

Hello Dear





How are you today? I feel like communicating with you, my name is Mary
 22 years by age,It is my pleasure with respect to cultivate a healthy
friendship with you,I have great interest in making new friend my hobbies
are reading,
teaching little kids,Today i found your id then i took the opportunity to
write to you as i will really want us to be good friends and I will so much
appreciate it if we can click together as one great friend.

I will send you my photo at least for you to see who is writing to you, so
that I will give you full explanation about
myself and my reasons and purpose of contacting you,
Please feel free to write me back with my email address so i will send you
my pictures really hope
to hear from you soon,

Yours faithfully



Miss Mary Mark

--000000000000d1382c05d6ea992b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Dear<br><br><br><br><br><br>How are you today? I fee=
l like communicating with you, my name is Mary =C2=A0 =C2=A022 years by age=
,It is my pleasure with respect to cultivate a healthy friendship with you,=
I have great interest in making new friend my hobbies are reading,<br>teach=
ing little kids,Today i found your id then i took the opportunity to write =
to you as i will really want us to be good friends and I will so much appre=
ciate it if we can click together as one great friend.<br><br>I will send y=
ou my photo at least for you to see who is writing to you, so that I will g=
ive you full explanation about<br>myself and my reasons and purpose of cont=
acting you,<br>Please feel free to write me back with my email address so i=
 will send you my pictures really hope<br>to hear from you soon,<br><br>You=
rs faithfully<br><br><br><br>Miss Mary Mark=C2=A0 =C2=A0 =C2=A0 =C2=A0<br><=
/div>

--000000000000d1382c05d6ea992b--
