Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D692F48BABA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 23:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FE10E3F1;
	Tue, 11 Jan 2022 22:25:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA610E3F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Jan 2022 22:24:59 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id l15so1000099pls.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Jan 2022 14:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XKeC4xQo/PfbDo6WRSi7PtEvXxWDJP/wQSx188qODzk=;
 b=YiToIcGjGQdJ6EnkijizHvXqrxMXs3C+t01kp+TdrDx4d9xCdyxflgPnFTpPkQp5u0
 8k1GUer+uoLAJ/vzxEW6LWgOxbQdZ0thAE2ErajeOXg+7FnZgMxdWagQBz3rKPH7ihYC
 dpcloY6aQD3yaD0lkE04KqkP745Xr0RtFnNaG5LGTheWZt1BSaR+qEYEW+/me0CRcDsE
 qGdj6RTHplPl3hMmYxOnNOr9Z/YdJkz/q/tm+vPZyjjjc+GklqcG8wwmwwmtaDQGd/Le
 4Ojg7Yvg579zKrWOsMn+79qGxbIu6tGFQJ2HIUhHeECQbQeKVwUdLjrLBYFrW+ILOZNC
 4kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XKeC4xQo/PfbDo6WRSi7PtEvXxWDJP/wQSx188qODzk=;
 b=ZttfawMeqhN6xfZXV9gqYIzADE7SZDAOJ5++yOMLufcqbFD0oZxv7OBWW8hstQbIl3
 2vAQ2OfsURHOqf8uelV+1+4szYRaCHHOJu92k0b/KIApXpXmYVXB71vSwZJ/c81VxtP8
 kvx66bkT3PzQekbi98D8cXwqvpnRzEbtZ+WJfLXBf02/ZgjG2lyaY30da7VHmRKnDxI6
 BZ8i47ejCZYrc5cEwN12PykxXTbIF1rOGymKRLhNHmjS/SjBfSd24N1dEPkx7ixazwdC
 NvpjSPZdQDdInIDWinadVBnomaYRqYOPmwBSvk0fjGq07/8nKP3whrjj+T63SMBdl3GI
 o55w==
X-Gm-Message-State: AOAM533QNZycLaU2a63qjRC99rxM5dfTjy7Lw7sxOJZkLJnpFruTKJ8X
 65pLgbaA7Jxy7845tf8swilU3jQcFpNilsWmVg==
X-Google-Smtp-Source: ABdhPJwsEOd51v3QsaaJAHwoA838HyuuR9nhnlvUgM++Bkrrg5gZyNIFXiBAWgEmvdWHvHpsE1s5NnElQ9DZMkOe0LA=
X-Received: by 2002:a63:461c:: with SMTP id t28mr5821032pga.547.1641939899122; 
 Tue, 11 Jan 2022 14:24:59 -0800 (PST)
MIME-Version: 1.0
From: Akira kurosawa <akirarosawa@gmail.com>
Date: Wed, 12 Jan 2022 06:24:48 +0800
Message-ID: <CAJX5Mv3kGQX2h6+gP0rRJmN+tVKEpn7V6Lmq3zk10qxi4oVS6w@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000006e08c305d555ecba"
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

--0000000000006e08c305d555ecba
Content-Type: text/plain; charset="UTF-8"

Hello,


My name is Low Taek Jho, a Malaysian businessman.

I am writing to know if you are still using this email address. I am
interested in discussing mutual cooperation with you.

I will enclose the proposal for your reference as soon as I receive your
response.

Regards,

Low Taek Jho

--0000000000006e08c305d555ecba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><font face=
=3D"georgia, serif">Hello,</font></div><div><font face=3D"georgia, serif"><=
br></font></div><div><font face=3D"georgia, serif"><br></font></div><div><f=
ont face=3D"georgia, serif">My name is Low Taek Jho, a Malaysian businessma=
n.</font></div><div><font face=3D"georgia, serif">=C2=A0</font></div><div><=
font face=3D"georgia, serif">I am writing to know if you are still using th=
is email address. I am interested in discussing mutual cooperation with you=
.</font></div><div><font face=3D"georgia, serif">=C2=A0</font></div><div><f=
ont face=3D"georgia, serif">I will enclose the proposal for your reference =
as soon as I receive your response.</font></div><div><font face=3D"georgia,=
 serif">=C2=A0</font></div><div><font face=3D"georgia, serif">Regards,</fon=
t></div><div><font face=3D"georgia, serif">=C2=A0</font></div><div><font fa=
ce=3D"georgia, serif">Low Taek Jho</font></div><div><br></div></div></div><=
/div></div>

--0000000000006e08c305d555ecba--
