Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E513B095C9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Jul 2025 22:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231EF10E89F;
	Thu, 17 Jul 2025 20:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ccX4pQNa";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4462C10E8A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jul 2025 20:35:48 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-6159466e80aso650550eaf.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jul 2025 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752784547; x=1753389347; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wf0o2zbRydKURzArs5aBIetWavcYZL1rsMpY2AMfJdM=;
 b=ccX4pQNa7yf+DtDQwXrFa7ErwXgNuq3hPCe1hinDXZ99kMx85SH2FH+Rg3NrZDqhSd
 HRPLy1OjrXPHIVFrf0JZ2yNsGeyotmhtgYb1yGE3fjbasdB0mqg4/i1oiGFzEDecHuup
 oRQlu0u1F9O63xrX7fp1Eoc/Khz9UBxzFWw3uDcE2bVpVXrVhB4wAILl7tGGcxjcfV2b
 ZLqw9bLszX0q+HB5YDajdYTwOoSompj4R1MPKxkGJryRb74FSOTzfoX5Md6rvMZwj+Jt
 0D20+d2IprgGp1hZwoNR8Cbd/BK8svMrr2nsxno0/09wW8Vl4S7wfzyvvvHEzCWOUH5M
 suog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752784547; x=1753389347;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wf0o2zbRydKURzArs5aBIetWavcYZL1rsMpY2AMfJdM=;
 b=Tlc2Pc4PNTr6qCSCXjU9/wjojCCevfbnG80GHYAPcaSNqLShE1sO2C+WnCtChpgaOZ
 DIkLoIIqwml0T2hj96indve/OnFRrivnkalGpMPJTCuvNDMaMo57EPC1LiLQk5Y0CSE0
 k2jmwEv3iwOzE1Llm573JtX5aSCYoSBjin+Fb7HpI0rjLVdaQ8bW4Twq/fw5+pAbE8C8
 66O3YgO3xnASs6FZKzrR/qipMOuSIfc3RGRBAboGyjrGCxqJUxE8++ezUXpVF/7spymX
 g/R7spBx7bFx4jHmTqArMTRubaU0QCxgJ+qWwFfTVrhEXwe2MLQFVm/J9W7BxUGv7ans
 FSuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ygGg9XR3vrgvMrr5KRyk3FssIiRnNB2EDjYkghA8xiZMLEunvWAacOluhnFnSMZIACifTac8+JsadfIu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRnKLlPuwt+iKm09CW4w5sTt7LeY+Ow12cSoC96yxrHxGluyYY
 AFOrHRIvJP9czc1vXFONBALtD+y7eivGqrKuMAOmHGaw53KskJL9xSoVyhfZUEvSUFJnvpWaJlx
 YUMLOdRtZbTwynmdg9Ir/TOfW+mbb6zk=
X-Gm-Gg: ASbGncsEaoKMJg0l0vtGZKxVWDXMbHs4X8ZGgoQTIpEjutjjeFg42jGoXbFjZO7l8er
 Bleel+PmYT2Xp5sWaFjsRPgNOM8hS24NfEq1wLpKwAYGXVZDQwOQiaWHPQlKlCN3NIefZtjjnVS
 nmNGs2XAgtBk698Z8We5IYkkCt1ynNACLJ6URFyxHhDvvp4nZ3DofhuzIypfSenQM+SUxN5UGyT
 HczErQmAzUNarxxsA==
X-Google-Smtp-Source: AGHT+IFbKmokvFE+UD6IPVc3GBuClU1jriVNzTbQG6FtxCWEBjioTgWtXC7cPJDCKDTJi/wsT4HeDepUzEJJdGdWLkc=
X-Received: by 2002:a05:6820:2004:b0:615:b293:1f17 with SMTP id
 006d021491bc7-615b2932180mr2023471eaf.8.1752784547342; Thu, 17 Jul 2025
 13:35:47 -0700 (PDT)
MIME-Version: 1.0
From: Pastor Cecil Williams <mrmaxwilson40@gmail.com>
Date: Thu, 17 Jul 2025 13:35:35 -0700
X-Gm-Features: Ac12FXwNZtLoaaeax4vwDeCnJ_3aQ9bi2fyJ073BAmW3q7OO22L6kM-gAcM5t2M
Message-ID: <CAMuiqwqN+obD9gxVWRrxrL=Z=fOORyHqqi8Y8FhojOqmoA=N8A@mail.gmail.com>
Subject: I wish you a happy day.
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000004fef34063a25f429"
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
Reply-To: pastorcecilwilliams@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000004fef34063a25f429
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear.

How are you doing today, I do hope that my mail meets you and your
household well and in good health?

I'm happy to inform you about my success in getting those funds transferred
under the cooperation of a new partner from Switzerland.

Presently i'm in Paraguay for investment projects with my own share of the
total sum which i am investing the money in real Estate Business.
Meanwhile, I didn't forget your past efforts and attempts to assist in
transferring those funds despite that it failed us somehow.

I decided to reward you with a sum of (USD$850,000.00) Eight Hundred and
fifty thousand United States dollars on your behalf, this is a compensation
to thank you for your earlier response and assistance over the funds
proposal.

I am giving you this little money not that I am rich now but a kind of
thanksgiving to testify the goodness of almighty God in my life and to
prove the genuine and truthfulness over all the funds proposal.

Meanwhile, I have deposited your ATM card to my pastor office, so please
kindly contact Rev. Pastor Cecil Williams who used to be a Good-Father to
me when i was in C=C3=B4te d=E2=80=99Ivoire, at ( pastorcecilwilliams@gmail=
.com)  for
collection of your international bank ATM card, you can cash this ATM card
in any bank of your choice in your country.

I appreciated your kind efforts at that time very much. so feel free and
get in touch with my Pastor Cecil Williams and instruct him where to send
the bank ATM card to you.

Below is Pastor Cecil Williams contact details
Name: Cecil Williams
Address: Officially the Republic of C=C3=B4te d'Ivoire
Email:  pastorcecilwilliams@gmail.com

Please do let me know immediately you receive it so that we can share the
joy after all the suffernes at that time. At the moment, I'm very busy here
because of the investment projects which me and the new partner are having
at hand, so feel free to get in touch with my Pastor Cecil Williams, he
will send the bank ATM card to you without any delay.

Stay in good health

Best Regards.

--0000000000004fef34063a25f429
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear.<br><br>How are you doing today, I do hope that my ma=
il meets you and your household well and in good health?<br><br>I&#39;m hap=
py to inform you about my success in getting those funds transferred under =
the cooperation of a new partner from Switzerland.<br><br>Presently i&#39;m=
 in Paraguay for investment projects with my own share of the total sum whi=
ch i am investing the money in real Estate Business. Meanwhile, I didn&#39;=
t forget your past efforts and attempts to assist in transferring those fun=
ds despite that it failed us somehow.<br><br>I decided to reward you with a=
 sum of (USD$850,000.00) Eight Hundred and fifty thousand United States dol=
lars on your behalf, this is a compensation to thank you for your earlier r=
esponse and assistance over the funds proposal.<br><br>I am giving you this=
 little money not that I am rich now but a kind of thanksgiving to testify =
the goodness of almighty God in my life and to prove the genuine and truthf=
ulness over all the funds proposal.<br><br>Meanwhile, I have deposited your=
 ATM card to my pastor office, so please kindly contact Rev. Pastor Cecil W=
illiams who used to be a Good-Father to me when i was in C=C3=B4te d=E2=80=
=99Ivoire, at ( <a href=3D"mailto:pastorcecilwilliams@gmail.com">pastorceci=
lwilliams@gmail.com</a>) =C2=A0for collection of your international bank AT=
M card, you can cash this ATM card in any bank of your choice in your count=
ry.<br><br>I appreciated your kind efforts at that time very much. so feel =
free and get in touch with my Pastor Cecil Williams and instruct him where =
to send the bank ATM card to you.<br><br>Below is Pastor Cecil Williams con=
tact details<br>Name: Cecil Williams<br>Address: Officially the Republic of=
 C=C3=B4te d&#39;Ivoire<br>Email: =C2=A0<a href=3D"mailto:pastorcecilwillia=
ms@gmail.com">pastorcecilwilliams@gmail.com</a><br><br>Please do let me kno=
w immediately you receive it so that we can share the joy after all the suf=
fernes at that time. At the moment, I&#39;m very busy here because of the i=
nvestment projects which me and the new partner are having at hand, so feel=
 free to get in touch with my Pastor Cecil Williams, he will send the bank =
ATM card to you without any delay.<br><br>Stay in good health<br><br>Best R=
egards.<br></div>

--0000000000004fef34063a25f429--
