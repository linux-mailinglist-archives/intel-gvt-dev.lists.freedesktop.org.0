Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA7324C33
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 25 Feb 2021 09:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827556E0D9;
	Thu, 25 Feb 2021 08:45:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB496E0CA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 25 Feb 2021 08:45:12 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l64so5355212oig.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 25 Feb 2021 00:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Pm7Vx8pzAFGXGLsftXDe2UIweOKX4sRQuqFSPegKbug=;
 b=SIUulibgSNhtlZN5JW7cIqV9IVlXpSo0pxe1OgJCNTqbmYlZhxsSoD9KkTLiKadRRS
 0+N+uf57BufufTbLoBUOWvhwNFww2UwvMbqIV0HM1e5V1KCaXOLooH741fdP93iKYHyN
 73Bv4WLV7Cm9JLl2+QSTSEqpQOhTarWqxFEWQifVJRMxOB359GRDIWxRITEGtXuNHbpv
 lusMPiTi3iMiUe/qZNbusxHtTw4qZKh6VErhmUAe2x15U/T4B/0N7smKYWCLlJEJa2yV
 O29HdGeiPiV8wxEk5+J/4dpJPzpvGqDM0oGPRqqgjb+e7E4WU+YjHwJ1TiXf8bD/XFlS
 G6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Pm7Vx8pzAFGXGLsftXDe2UIweOKX4sRQuqFSPegKbug=;
 b=oDxPVCmlk2Vofadb7ZBJ97gOwwxTn2RLxg/fWGo5zbHVtAHgdGjDOr7u08UU4u2Cj9
 zS3D0OByOQWvSrEIBKpDSJYflVBjNh8+z9L0KoDalaNDEH8KiMUH8z2YkmWtRFVx5Eik
 00nmNWsU7ZXnWqAj2it2Zm6qM1XrshxXcCXzCJiKgZgPnnZ6HWYBzFUV7/7p7NNuGvHv
 KhZHAr9czjneiFO0Dq1X69DCp9Sv3/8BHUnPF3KvKhxRMn0Va9jdIn+sTFXOb5yB23iz
 OcHIu0fwaS6/4jw4c3+3ly2vHdFhtDhoE/7B0SbYC4Ntr4UUuFhqVk60LZklb+QRQN6e
 RMag==
X-Gm-Message-State: AOAM532w6iajKLAPdyybJqOXFY/eoqwp5BWNt4DVYqZrnOwBJYweXxuv
 RiD1uZ393lwJgHC1d20LzEnx4DRw3FVnPRWLKcI=
X-Google-Smtp-Source: ABdhPJynIBZXa65YaeeqGFntvnsGndlPkjv/sqNGwY1kfiPCVymb72szJ4DGq9Q9b7TMMs8OgHlIoFzgUSUPZlfz7aM=
X-Received: by 2002:a54:410f:: with SMTP id l15mr1205601oic.149.1614242711959; 
 Thu, 25 Feb 2021 00:45:11 -0800 (PST)
MIME-Version: 1.0
From: Justice Thomson <tomsonjustice9@gmail.com>
Date: Thu, 25 Feb 2021 00:44:56 -0800
Message-ID: <CAFh_anwDTmdzFEcJJGBOCGSC7o9whhe_FFRU4HBnsJU=CBh+3A@mail.gmail.com>
Subject: Hi
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
Content-Type: multipart/mixed; boundary="===============1284791619=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1284791619==
Content-Type: multipart/alternative; boundary="0000000000006d7b2805bc252b78"

--0000000000006d7b2805bc252b78
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a good news for you.Please contact me for more details. Sorry if
you received this letter in your spam, Due to recent connection error
here in my country.

Looking forward for your immediate response to me through my private e-
mail id: (Justicethomson1@gmail.com)

Best Regards,

Regards,
Mr Justice Thomson

--0000000000006d7b2805bc252b78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I have a good news for you.Please contact me=
 for more details. Sorry if<br>you received this letter in your spam, Due t=
o recent connection error<br>here in my country.<br><br>Looking forward for=
 your immediate response to me through my private e-<br>mail id: (<a href=
=3D"mailto:Justicethomson1@gmail.com">Justicethomson1@gmail.com</a>)<br><br=
>Best Regards,<br><br>Regards,<br>Mr Justice Thomson<br><br><br><br><br><br=
><br></div>

--0000000000006d7b2805bc252b78--

--===============1284791619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1284791619==--
