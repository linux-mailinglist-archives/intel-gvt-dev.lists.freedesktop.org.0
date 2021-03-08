Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89F331773
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Mar 2021 20:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38F6E0EC;
	Mon,  8 Mar 2021 19:39:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4048E6E118
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Mar 2021 19:39:46 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id n14so11283356iog.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 08 Mar 2021 11:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=0ehhh6prWi3uMWVEM7r1fA0412ejZXIVurTBunqSicQ=;
 b=p/boefNtfBfKeShcGFs4tW6fbSLDebq9uNO7HRKNWX5q5oBh8LC1bvg4kU/m2/Re/Q
 9BqDFvTlDL57LF5Vgux+BrHXEvFVfjihnYjvp04pIHHxiHKDwVsvUIHIDj8hC6+p7v2q
 GXSF2qwJfFK6OfFzv9gFDxYK6kWPyJAHQannHHkdZCwhaCJAmRZDo7vVOfdSp4sla/ON
 wDud/dDHXIOhPytvxQvBy84Xb7wPDIx49Mg4QA5FKBZ9fOMsNcn6+jwXRkdVBe07pPe/
 vVGPGUTInl4CVdpdT7IJDTmFidKAXs654Xw6HrbRMzwM759hrRIyOKanm9rO0eYQ/GI4
 tUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=0ehhh6prWi3uMWVEM7r1fA0412ejZXIVurTBunqSicQ=;
 b=oj7R2DWuoKYwpW3OrIZ6zZFvhkLk3HYcpGn0hjOikS3mmqp40soQ4RBkLvYrmGyuO8
 7/ID5BYDz9tQuNjHabRO/OFgVFCZs3ErQEKgjKuqj12CnZP4cDaWa0V+ta9Wgtrhovh5
 lS6bjP6dMvxTGy1WvOAGcXf2iE6OHR6rp6sdbVrsDMFPbLEegK0vxlpx03w3EC/p9KYi
 fvqxIa8OuYinEXKPiJoHuTQiV+qTPlcIwGCDIc5vyj5Qm7+4EspfjmB4DGztL33pE2DD
 f3VF9QctzmkLUmo4m3ZHjW8TXFqz6T8EVaogwNKP1A2REVlkyTeinX14/N1QOioeJ9Fw
 sDyA==
X-Gm-Message-State: AOAM5317vIG6vSbvBbiyjjfoAjUmyJeiJj4zKfKb0fMQAa+kkbayeElx
 ylUJHUDaniA0uxsKd+1sLYl5bKkPBfEc7suJLOE=
X-Google-Smtp-Source: ABdhPJwl5DwDblM01qzYTunHtgorwJFJIaVmekKJCzt1zaN28khoP4m134aUCExkR+/gqxRUU0sM+uxWsToYo5oSsgI=
X-Received: by 2002:a05:6638:210d:: with SMTP id
 n13mr25595292jaj.74.1615232384100; 
 Mon, 08 Mar 2021 11:39:44 -0800 (PST)
MIME-Version: 1.0
From: "J. Kirinec" <angelikag101@gmail.com>
Date: Mon, 8 Mar 2021 20:39:32 +0100
Message-ID: <CACGSbJe6y05mEfPM-x_=jteBWkRjay3j5xJKf4+hf=sm4P2ggA@mail.gmail.com>
Subject: hi there!
To: undisclosed-recipients:;
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
Content-Type: multipart/mixed; boundary="===============2037018704=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2037018704==
Content-Type: multipart/alternative; boundary="0000000000007beb8e05bd0b98b0"

--0000000000007beb8e05bd0b98b0
Content-Type: text/plain; charset="UTF-8"

  Hello there,  How are you today? fine i hope. It's nice to meet you, and
I hope you do not mind me being connected with you in such a way. in actual
fact i was looking for my old friend who reside in your country and that
was when I came across your profile and I decided to write you. My name is
J. Kirinec, USA marine officer. I am in charge of medic. I will like to
hear from you if it so please with you, i believe it's curiosity that
brings me to you in a time like this.  It will be my wish to establish a
very strong relationship with you because I felt the both of us want the
same thing. Once again I must say that I am sorry if the connection with
you contradicts your moral ethics. I look forward to hearing from you.
Regards, J. Kirinec

--0000000000007beb8e05bd0b98b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 Hello there, =C2=A0How are you today? fine i hope. =
It&#39;s nice to meet you, and I hope you do not mind me being connected wi=
th you in such a way. in actual fact i was looking for my old friend who re=
side in your country and that was when I came across your profile and I dec=
ided to write you. My name is J. Kirinec, USA marine officer. I am in charg=
e of medic. I will like to hear from you if it so please with you, i believ=
e it&#39;s curiosity that brings me to you in a time like this.=C2=A0 It wi=
ll be my wish to establish a very strong relationship with you because I fe=
lt the both of us want the same thing. Once again I must say that I am sorr=
y if the connection with you contradicts your moral ethics. I look forward =
to hearing from you. Regards, J. Kirinec=C2=A0=C2=A0<br></div>

--0000000000007beb8e05bd0b98b0--

--===============2037018704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2037018704==--
