Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD08A0A969
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 12 Jan 2025 14:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3E10E309;
	Sun, 12 Jan 2025 13:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lGnoiPf7";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D2010E310
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 12 Jan 2025 13:06:07 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ee709715d9so4744131a91.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 12 Jan 2025 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736687167; x=1737291967; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdvdjD4hafuIDoighnw52A3LQrmtPZqVcXYtP+4TWJU=;
 b=lGnoiPf7O5Eu4X0JYTU+yPGXkE8EBnj+zckQgdxFEPfOV4elQPmJ/IOv4I8e5N5P4p
 jdYsHeiunegGbWvSeTx7U/hbFo5remGzuqIT+7thYphtZ9PDIbmYQ9ShUSrpsh4f4o+j
 P6S9g3mo4JMF3CdSKzjlTP6UQW4SQ1R0lfVAA2LlAlOTE+WI6+tH9fltm6FEaqCfLIfn
 GqGLhSLT4RXYQ9maPw2w56LkQLtvejBe1NpCX3mcHGkOzao1d9CGgMct5qk3KccGM972
 s0HllPIU20O7r+JFqil8gKyq1VR8zoZwUg8CbhdJ2Jp2+srE+VwPLgjMiZlBVwQvTPCL
 aqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736687167; x=1737291967;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XdvdjD4hafuIDoighnw52A3LQrmtPZqVcXYtP+4TWJU=;
 b=TZu4FFNZegoVyLHtgjec8wvMAHITUd5Ar8Ll4MIY3FuZxM6iqPTRVRtHCwts8SrJE6
 BvElCp3ayfyTJwEffFRppdvwMR9p1644qc6y7UX+0b+tKvdnjKAcRzaUYxC7HCkF1/MF
 e/Pc4e0k5dcsIHZCIZsZ/vVvnOCHrKIH1YGZzIYcnueovD/lM+o0EVJ6Uo3ikzYVUhbA
 hSKXzeti10tyluKKNJ5Rt/2HJ5hhMDxgrbBF0SA7dD24xAEdQMYYm3xlI+H8lbFwCZf6
 Rb2WY9gN+OoOEKjoAlCIityl2H3ePs6szSzGpaeqWDeQteYAlLqLrfvPMXEN5sVIzlw8
 1M4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI31f1UOKCJQVks+FI8Y+uEdGzsh8ERh/wZ1OlXwxz6xtGDiXT15BSHgmcJ4YqE77+hZ0CnVgu4R2cnAu8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFRj1BC/5QzfYJzHPDvvqldgA+JAArcZiMqMh3CAs7xcZbGa3s
 ZY0GmVeA9AcZX3ga6P2/TYNrZAwSghewFQ+YSzPxqGtoUeHe1lQPCElCzgWpglbVwnke6DEEIbC
 aIUhjzTLiDCKQFgoe7BVFb8p0AVM=
X-Gm-Gg: ASbGnctbLbA6kK0wtOx1c+15Kz1j04/ozVo2m+5lfyT2tjx2cu7AMo8TrMC2oQ4XjKg
 hC5LLhEj87jnNjqbVUq4triIs9i/lSHPO660OcA==
X-Google-Smtp-Source: AGHT+IH+gyEERfbt5YfKSfbcynxajYKq2J7b7Z/FQ4PJCYfxJyT8zqVVW/00akTEBwAMgftRLQX91Y3uyz9tqF22NKQ=
X-Received: by 2002:a17:90b:2c84:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-2f548eadfe8mr24111663a91.13.1736687167053; Sun, 12 Jan 2025
 05:06:07 -0800 (PST)
MIME-Version: 1.0
From: "Madam, Everett Lambert" <ruddirajj@gmail.com>
Date: Sun, 12 Jan 2025 23:21:58 -0800
X-Gm-Features: AbW1kvZiKBFR3VaHuhHZDu30qqyDhXBc5VWBNLSjMXM0zTTCajdnDAGfhXi3HZo
Message-ID: <CAFRtJn+iznwGs7=MAddEPo1MPbnWg=mxo2=XZ6CJ9bNeyc5wBA@mail.gmail.com>
Subject: My Dear Happy New Year,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000adac57062b81fd5a"
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
Reply-To: ruddirajj@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000adac57062b81fd5a
Content-Type: text/plain; charset="UTF-8"

I am Madam, Everett Lambert, from the United Kingdom.

I invite you to inherit my late client fund valued at the sum of
$25,500,000.00 USD Twenty Five Million five hundred thousand dollars
deposited here in one of the prime Banks in the United Kingdom. He was a
citizen of your country, dealer with  Oil & Gas here in the United Kingdom.

He is married, had a kid and all died in tragic COVID-19 dated April 26th,
2020.Having died without a WILL Testament, I want to present you to the
bank as the next of kin to claim the fund as the beneficiary while I stand
as your representative to take all legal steps to ensure the fund is
transferred to your account and we will share the funds 60% to you and 40%
to me.
For further details, I am waiting for your prompt response with the below
required information


Your Full Name:
Your Residence Home Address:
Your Occupation:
Your Date of Birth:
Your Mobile Number:
Your Country:
Your whats-app

Best Regards
Madam, Everett Lambert,

--000000000000adac57062b81fd5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br clear=3D"all"></div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">I =
am Madam, Everett Lambert, from the United Kingdom.<br><br>I invite you to =
inherit my late client fund valued at the sum of $25,500,000.00 USD Twenty =
Five Million five hundred thousand dollars deposited here in one of the pri=
me Banks in the United Kingdom. He was a citizen of your country, dealer wi=
th=C2=A0 Oil &amp; Gas here in the United Kingdom.<br><br>He is married, ha=
d a kid and all died in tragic COVID-19 dated April 26th, 2020.Having died =
without a WILL Testament, I want to present you to the bank as the next of =
kin to claim the fund as the beneficiary while I stand as your representati=
ve to take all legal steps to ensure the fund is transferred to your accoun=
t and we will share the funds 60% to you and 40% to me.<br>For further deta=
ils, I am waiting for your prompt response with the below required informat=
ion<br><br><br>Your Full Name:<br>Your Residence Home Address:<br>Your Occu=
pation:<br>Your Date of Birth:<br>Your Mobile Number:<br>Your Country:<br>Y=
our whats-app<br><br>Best Regards<br>Madam, Everett Lambert,</div></div></d=
iv></div>

--000000000000adac57062b81fd5a--
