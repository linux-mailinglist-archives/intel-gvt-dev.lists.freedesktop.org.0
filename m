Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C314637A5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Nov 2021 15:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53016E40F;
	Tue, 30 Nov 2021 14:53:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B486E40F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Nov 2021 14:53:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 133so17737910wme.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Nov 2021 06:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=J9lFUqgl3KDiUCndICRqorsM/g9ZCb56WVlusWNoLtc=;
 b=pFY4Xs/L4Z64FrKCNgPkTSez18ipPk/6ySg9jw9vvf/X01/lku6M2uUpsEwqKmMpQY
 U3236UhaUKfq1f9ZlmXGlE3Nnq6xwSJJzu4bmubIf8756VUgGBzWHS2vPPmHksLc9t+E
 CP2I721818ZbJPb+8U4Tpcv40mBpvw81e7aINMaq/2Vde4J+YBLkeuWFBZDjR9FDe5+t
 ysuKFEYLlPXPL9tgF+I/jc68Kn03yXUZHDxIDHCYPblHfw+SfjWgC1drEYPDS8jRnX6t
 xmcXmza9ddEjtcIXKdEHBpWTQJvI2pN+6jELBrv6MTUtWINjeCGjvgb/KC1CIwRHExX8
 Vc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=J9lFUqgl3KDiUCndICRqorsM/g9ZCb56WVlusWNoLtc=;
 b=lPZXXWGHDG2y9wjHvBNBwlxjjID9B9J3qJCsxqr16nqihBBRYySW3bzHnemz54oLf/
 nhYxdxklbzgm+YsBlUpjmv6q1NWjz8ToOdv+Vcp8cnelBWibzmrLGwTlu7gTELbr0qhY
 POnftxRV6HnsX211NcAEVMQ16UcftPVffp5yTnzOga6jNarg1Hn2I58qaUFbkweBEAbs
 w8M9357gvAA4DmLtleA/sghEvw7EX5lVOYZHh3ZmwwDo77wBKCuAajbvgC28nwLex+oe
 tAn6D60/FL6P6FvVpR+AoxOfY38A2t0rfQs8Ex1On9LCIPv6y+wGZVCvI8lmPKwx+tiw
 qE3A==
X-Gm-Message-State: AOAM532u+hEfx1Dy40fBVnewidiEd/UJ9NOE8XRuJJ90V2yDaqviQqP6
 hYc6sGKyE7itc1TDhGhEnp5ajNdRYkOP6t6om6s=
X-Google-Smtp-Source: ABdhPJwnCREN4T0OReDFhnZ9759atQxZInjlQbvNo1erApYlh8+Iax1BLYr7roFsQPRDpMwmXIvKPjvsN73/aIbUgiA=
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr5555333wmg.86.1638283987925; 
 Tue, 30 Nov 2021 06:53:07 -0800 (PST)
MIME-Version: 1.0
From: Bruce Phillip Westbury <brucewestphilesq@gmail.com>
Date: Tue, 30 Nov 2021 14:52:55 +0000
Message-ID: <CAMXHJudPbdtbhd12ncRn1RG4jvW5R47PM0fCv2G2eGBca_fvMQ@mail.gmail.com>
Subject: Kindly Confirm
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000243d3105d202b708"
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
Reply-To: ahemmuela6@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000243d3105d202b708
Content-Type: text/plain; charset="UTF-8"

 Dear sir,
My name Emmanuela Hamed Bakayoko the wife of Late Ivorian prime minister
and minister of Security Hamed Bakayoko who died recently in Germany of
Cancer, I want to invest a huge sum of money in your country so as to have
a long-term business relationship with you .
If you are capable and ready to partner with me in this investment,
 respond as soon as possible for more information.
Regards
Emmanuela Bakayoko

--000000000000243d3105d202b708
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">



Dear sir,<br>My name Emmanuela Hamed Bakayoko the wife of Late Ivorian=20
prime minister and minister of Security Hamed Bakayoko who died recently
 in Germany of Cancer, I want to invest a huge sum of money in your=20
country so as to have a long-term business relationship with you .<br>If yo=
u are capable and ready to partner with me in this investment, =C2=A0respon=
d as soon as possible for more information.<br>Regards<br><div>Emmanuela Ba=
kayoko <br></div><div><br></div><div><br></div><div>
<h2 id=3D"gmail-:ms" class=3D"gmail-hP" tabindex=3D"-1"><br></h2>

</div>





</div>

--000000000000243d3105d202b708--
