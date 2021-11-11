Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2644D2E8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 11 Nov 2021 09:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E7789A76;
	Thu, 11 Nov 2021 08:08:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C886389A61
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Nov 2021 08:08:29 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v11so20978782edc.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Nov 2021 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=P/ZecPNDa3hRUX1Ry3b1qiDhL/ZjcQcKn1LTyiDxAio=;
 b=JYLjJfgnxcRky+H29VkdKzMbawuhaokAsv7pCQA26jZPDOLGRddBgEyIGz3VrS5+zs
 IvlOA4Ec3vsKuilH3TTWZA+RQsyuHuAEe/Fe8DNPe1PlcXW3IsdjjDqJE6VMTI4XaKuV
 7OxCAUl4RiYO3nBOFEBCpg8LMAH7Tv6RGMVxxF0K4NTBbvm4e9f9tKKLFlEwStQXMAhf
 cgiApkmZC26DPu2Ex+HQkuNga5BObXU+YEM4Ailx3wZhuoSfZqcGzF9MVUODML4jP14i
 K9JZIjEYUZng8MyQYeESm/04qoYKD7nXojsqo+UiLTOTj0AZ5mXqE4ddFbBvz7c9EuYk
 yR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P/ZecPNDa3hRUX1Ry3b1qiDhL/ZjcQcKn1LTyiDxAio=;
 b=OSDcK1aXkSBhI70IR7sr+VzCvRZKwb+vvmy29eUVB1OGHuUjaSkzYrIvcyZ81FeTH2
 w+K/rVWstFhiDAYt0hGhkZys6Sz61uVMY/p07rfpuRKqRCz8AKCBxSfFU/ztRu4Bm4MP
 v+p6TyJBUhow4DUyxaAoC0+s6wvmyTAVP7VlHl+gTZY9Mipn2qpJ/QZ/N7qYGDj0J1Go
 Fk+rEAThjKAZhR1CKLiePpwFKW7D/x8lsLqehY5KxyTfrTrZn9B3V/flZSykqguwC13r
 lDb6S38pZ4kR9g6sb9Mb4AtoIebPztlfokjyecZbib8IcvqM1rfA9Bjz3rUGYBZewqsd
 P02w==
X-Gm-Message-State: AOAM530kqWl55Zk6644HPR6ncUk+PHjir37Ne/GIYFbZFLOZ/CMaDy/y
 SYg1wOetNGxpzFP/yu7d5FACPfaLU0sHbCkebgs=
X-Google-Smtp-Source: ABdhPJy+uFEbTsKMFl6JBj+NES862dQBlES6wbPkRQEGwRtwJJQjGon16gaDS/se8VF2eQ+wfXO5/I8j3nJPxFGssYE=
X-Received: by 2002:a05:6402:2753:: with SMTP id
 z19mr7435494edd.143.1636618108258; 
 Thu, 11 Nov 2021 00:08:28 -0800 (PST)
MIME-Version: 1.0
From: Joseph david <jos09me@gmail.com>
Date: Thu, 11 Nov 2021 00:08:12 -0800
Message-ID: <CANiNsHr82Um-5+TMahoFYZ4861HFmdfdE5Nar8cKJ-kvoYBx5Q@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000f9cda205d07ed825"
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

--000000000000f9cda205d07ed825
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

   Hello
How are you , I hope you strictly adhere to the COVID 19 Pandemic
guidelines ?
I know this email might come to you as a surprise as first coming from one
you haven=E2=80=99t met with before.. Please do accept my apologies. I do n=
ot wish
to invade your privacy.I have contacted you in respect to the estate of my
late client.He  had a bank deposit of Seven Million Five Hundred Thousand
US Dollars .
The Management of the bank instructed me to provide his next of kin or any
of his relatives who can make claim to his funds but all my efforts to
trace any of the relations, proved abortive hence I have contacted you to
present you for this claim.The said sum can be used for an investment if
you are interested
Waiting for your response for further details on the procedure of the
transaction .
Regards,
Bar.Joseph

--000000000000f9cda205d07ed825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">















=C2=A0
Hello<br>How are you , I hope you strictly adhere to the COVID 19 Pandemic =
guidelines ?<br>I
 know this email might come to you as a surprise as first coming from=20
one you haven=E2=80=99t met with before.. Please do accept my apologies. I =
do=20
not wish to invade your privacy.I have contacted you in respect to the=20
estate of my late client.He =C2=A0had a bank deposit of Seven Million Five=
=20
Hundred Thousand US Dollars .<br>The Management of the bank instructed=20
me to provide his next of kin or any of his relatives who can make claim
 to his funds but all my efforts to trace any of the relations, proved=20
abortive hence I have contacted you to present you for this claim.The=20
said sum can be used for an investment if you are interested<br>Waiting for=
 your response for further details on the procedure of the transaction .<br=
>Regards,<br>Bar.Joseph <br>

































</div>

--000000000000f9cda205d07ed825--
