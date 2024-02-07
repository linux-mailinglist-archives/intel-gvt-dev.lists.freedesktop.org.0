Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E97284D039
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Feb 2024 18:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857810E82C;
	Wed,  7 Feb 2024 17:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LP0PGrI9";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFC210E59E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Feb 2024 17:53:15 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5600d950442so1100202a12.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 07 Feb 2024 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707328394; x=1707933194; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpNU4pUsAwVbsA7vp40xZfyWg7vBQ2MnMCGKRJepDR8=;
 b=LP0PGrI9xiNjO6cKygfFwYb9dFVWgp2gNkbiSCV2NUQSATqBqg7hD3FDvA2QyKIj08
 bzHC13upLeEevdKUWb5moSyA6tbmk9LaVZ/mMeV4/OY49M9Q7ea82fFCBpUqUOjXNkAh
 rurl0qEtuoeARkAB3fIR3bak2XcB19eJ9Z6J/Os1N48MlgIxfXWrOqLhnpht4JyL8UHQ
 sFWsQYkO73Hk5seitykNw4uArUhTnYzAueC/O2MzoP4aYwWd+kiMN+3hOBrTJGxUsqih
 Zr9m0xi/WPg10D7XiyW82Usl/QpxIlo+39OiXvBPAgO6mFg436yXc+CdMBIfmCI9XRyD
 Vskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707328394; x=1707933194;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DpNU4pUsAwVbsA7vp40xZfyWg7vBQ2MnMCGKRJepDR8=;
 b=Bftqo7I39AOtGQeRxEHhID9IRuBaS+tH7e45DB8b1cGZl8YCC0/PYL2xEd48CmMRe6
 87KgKh6rfYLzFqNtsXkIiitqLywjSfYKn5QSoPrBU55bEyJIgEGiGj3LqGuW0sH/YT8b
 uZEf6hsySAHlNTv1mWarGKjUvwRw9W4PO+8cU+u4L8X8lRKSUIvasoRGEXasFtRPrjbX
 i2gm0xD1UIErPdQIdc/GWK9TOvB8m2xpiqcogUcjlpaB/oHHq6KRUmtFq0gEfeC08Ew+
 shsGDpEnz6Z07lqyNPFozLNsIl+FxP+ST38QJcMKyQNVvmYfcmrh5+LvSQ6fv2gKz/ME
 4uQA==
X-Gm-Message-State: AOJu0YwuQJSKS73wkkKs2y7HFHKWkKyzK8SE8iPYe+qyxIUHsFyNvZaw
 6dWhpu1EPdyp5kUTprSDGI2KobLI62jUfFlO0FCUVhb/uZv9LvgrAxF88shJzvLtPQ9z720sg/Q
 HrBY0l5r3KeCEeG3QlgPyL9jr9MQ=
X-Google-Smtp-Source: AGHT+IHisl6b+BUTQGe86RQn2WxE80SL/lrmSltn0lz22xbj0P8CFYDhzQ+4tnHSgc8iVx3Kgw2yvsJ8TAoDDtU5h3M=
X-Received: by 2002:a17:906:bc94:b0:a36:fb2c:8701 with SMTP id
 lv20-20020a170906bc9400b00a36fb2c8701mr5702181ejb.55.1707328394124; Wed, 07
 Feb 2024 09:53:14 -0800 (PST)
MIME-Version: 1.0
From: Sara Meijerink <saragadon2009@gmail.com>
Date: Wed, 7 Feb 2024 09:53:03 -0800
Message-ID: <CA+grQNSz4YdfJp+OZEDOymwLFpsmxPD8py30NHigkK5bfHH32Q@mail.gmail.com>
Subject: Hello From Mrs. Meijerink
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000007261b00610ce5ed8"
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
Reply-To: mrsmeijerink@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000007261b00610ce5ed8
Content-Type: text/plain; charset="UTF-8"

Hello From Mrs. Meijerink

My name is Mrs. Sara Meijerink and I live in the United Kingdom. I am
married to the late Mr. Jan Hendrik Meijerinkfrom Netherland.

My late husband has a deposit of 5,000,000.00 EURO [Five Million Euros] in
a bank. Before my husband died, he told me to use the funds to support the
development and solidarity for LGBTQ human rights. We have always seen on
TV that many LGBTQ employees, people with HIV/AIDS, refugees and
transgender people are facing a lot of challenges and discriminations in
the society. We want to change the ideology of well-intentioned people to
understand that discriminations is the less favourable treatment of a
person on the grounds of age, disability, ethnic origin, race, gender,
religion belief, or sexual orientation.

Our mission is to support the development and solidarity for LGBTQ human
rights so that everyone can be proud of who they are and enjoy their right
to dignity. In particular, to support the rights of LGBTQ employees, people
with HIV/AIDS, refugees and transgender people in the society.

Due to my poor health, I want to donate the 5,000,000.00 EURO to you so
that you can use the funds to support the development and solidarity for
LGBTQ human rights.

Please if you are ready to handle this project in your country, get back to
me immediately so that I will give you all the necessary information to
transfer the 5,000,000.00 EURO to your account.

I am waiting for your quick reply

Thank you very much,
From Mrs. Meijerink

--0000000000007261b00610ce5ed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Hello From Mrs.=
 Meijerink<br><br>My name is Mrs. Sara Meijerink and I live in the United K=
ingdom. I am married to the late Mr. Jan Hendrik Meijerinkfrom Netherland.<=
br><br>My late husband has a deposit of 5,000,000.00 EURO [Five Million Eur=
os] in a bank. Before my husband died, he told me to use the funds to=C2=A0=
support the development and solidarity for LGBTQ human rights.=C2=A0We have=
 always seen on TV that many LGBTQ employees, people with HIV/AIDS, refugee=
s and transgender people are facing a lot of challenges and discriminations=
 in the society.=C2=A0We want to change the ideology of well-intentioned pe=
ople to understand that discriminations is the less favourable treatment of=
 a person on the grounds of age, disability, ethnic origin, race, gender, r=
eligion belief, or sexual orientation.<br><br>Our mission is to support the=
 development and solidarity for LGBTQ human rights so that everyone can be =
proud of who they are and enjoy their right to dignity. In particular, to s=
upport the rights of LGBTQ employees, people with HIV/AIDS, refugees and tr=
ansgender people in the society.<br><br>Due to my poor health, I want to do=
nate the 5,000,000.00 EURO to you so that you can use the funds to support =
the development and solidarity for LGBTQ human rights.<br>=C2=A0<br>Please =
if you are ready to handle this project in your country,=C2=A0get back to m=
e immediately so that I will give you all the necessary information to tran=
sfer the=C2=A05,000,000.00 EURO to your account.=C2=A0<br><br>I am waiting =
for your quick reply<br><br>Thank you very much,<br>From Mrs. Meijerink=C2=
=A0=C2=A0<br></div></div></div></div>

--0000000000007261b00610ce5ed8--
