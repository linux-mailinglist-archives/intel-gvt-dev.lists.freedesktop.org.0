Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96058407217
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Sep 2021 21:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA946EA8B;
	Fri, 10 Sep 2021 19:43:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3C6EA8D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Sep 2021 19:43:15 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id v10so6083688ybq.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Sep 2021 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=EXQL75fBdnA7KFnoJtq38EtjcdGOjFa4b77LQ6HqOag=;
 b=Ujptgrk8VhQO+tWhVcunVmZog2RMfGeFjPIV4vEJ0MU3+D9/bKXr3uuU+YoMhAl1ko
 a3DPT9PNzBjn/rBRHBG3C0O2ir3FXt8f8AzqMXwUcnHxTjU4Dyna0SSldP//108SfkQ8
 dUmBT33QJlK4pn2iK5Kd+KbL4nBx6vbzESq2vgcMvalBcAV0kmuk4tTCGV1IDGDRwd1t
 tX/s73KGbEwt95ya4vYYuT7nmjI7und2lYnQM1fLv2AJwy51HwAOXywxTwAgXggRkpH6
 HnbqlMRuUQGHyMV+3QPVh0HTbj45SWt+xNWAd1An4zpBbJ/jjOP2Eusz2XWyKDsN3i4Z
 mIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=EXQL75fBdnA7KFnoJtq38EtjcdGOjFa4b77LQ6HqOag=;
 b=JYIzW0qiDM1vTaRjvzj7OTQ0234HQWRlBuYFuDrgBYnvKh4LNTPQR43VvltdAzN1se
 wanmlcRDTyDRaa5O9cQlauI6YJ3mrc7ecrGN6F5UrjguiuiLEvIbOs5JqK4XvXjOsyo3
 bR4ckVHenKSo1njDIFs9qJR5oI/AMuUmOcMQ5iPS/qpyf/ZBeprVvfq3QYw1bmfTdUeI
 ZCWyNUT1/Jz+3diJ1mw92ExjZi1c1Jyt+O3SU7cPUktWdiTDngsVUDbNQEwHDBC5HIyP
 5NZhAyojFjNG9OtEeLvdzngJBIo87WHKAp3WlZwZaAy9Uj/gTG6bWRmT9FYtMGhBQmYm
 x8Rg==
X-Gm-Message-State: AOAM532CEPaXpE3m4qgTyc7lnz0W56dyw8uy8cq91wlpUnZk81xq+/xj
 MDLdqiB3PvXQYi39dT0EF+UrHGNjVw8ykY1CFaA=
X-Google-Smtp-Source: ABdhPJy0077yp3BSsOBMDFR/oDw3FZN39T6vRdpvvhrnxqiBTPsQq+DAV7YIZ9RaTeCVlwbasTZFRzMXPNYCJ7QLya0=
X-Received: by 2002:a05:6902:725:: with SMTP id
 l5mr14695057ybt.178.1631302994147; 
 Fri, 10 Sep 2021 12:43:14 -0700 (PDT)
MIME-Version: 1.0
From: Prof Laurent David <llaurentdavid47@gmail.com>
Date: Fri, 10 Sep 2021 19:43:04 +0000
Message-ID: <CAHA3qLKuA_qPTV3tLQgTKz1N-VZBdOop0ZmmUkFzQbv10dwCQA@mail.gmail.com>
Subject: Project Information
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000007cbe8305cba95398"
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
Reply-To: lau.david.ld@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000007cbe8305cba95398
Content-Type: text/plain; charset="UTF-8"

Hello.,

How are you and how is your family doing? I'm Laurent David, CEO, BNP
Paribas. I would humbly request that you keep the contents of this message
confidential and also respect the integrity of the information you may come
across as a result of this communique. I'm contacting you privately, no one
else is aware of this communique hence I am contacting you unofficially and
then advocate we communicate strictly via our private emails. I was an
account officer or a personal accountant to one of our bank's high
reputable customers who once owned a reputable company here in Paris, and
also one time the CEO of a company, and then he operated an investment
account worth millions of euros in our bank.

Unfortunately, he died along with his nuclear families while on sabbatical
in the summer of 2005 in northwest Venezuela. He died in intestacy
(intestate), without a functional will. After his death my bank made
several efforts to locate any member of his extended families via his
consulates without success. Fleetingly, in line with our bank inheritance's
claim(s) rules and regulate, as stipulated by the WBG I have been mandated
by our bank board/committee as his personal accountant to declare the
account without an inheritor, provide one or the bank will revert the funds
back into our treasury as an unclaimed and abandoned monies otherwise the
funds will be confiscated by the government (es-cheat). Like they say
"drastic situations call for drastic measures" Hence I decided to contact
you and then have you nominated/listed as the next of KIN to be awarded the
abandoned estate of (US$ 23.7 millions dollars)

I went through your profile. You share the same family/surname with the
subject matter before I decided to contact you. You will stand as his
family representative of the deceased for the bank to release and award you
the funds as his heir. This project will be executed legally, officially
without breaking any law, and success is guaranteed with your total
corporation. Please if you are interested, indicate so that I can give you
all the necessary information and also some back up documents. Please I
cannot be discussing this sensitive issue with people as such your
cooperation is seriously needed. Please, treat this proposal with utmost
confidentiality as I assure you it's 100% risk free. Please get back to me
with your full Name and direct telephone number.


Thank You
Yours Sincerely,
Prof. Laurent David
CEO BNP Paribas Personal Finance.
Please reply me to my private email address ( proflaurentdavid020@outlook.fr
)

--0000000000007cbe8305cba95398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello.,<br><br>How are you and how is your family doing? I=
&#39;m Laurent David, CEO, BNP Paribas. I would humbly request that you kee=
p the contents of this message confidential and also respect the integrity =
of the information you may come across as a result of this communique. I&#3=
9;m contacting you privately, no one else is aware of this communique hence=
 I am contacting you unofficially and then advocate we communicate strictly=
 via our private emails. I was an account officer or a personal accountant =
to one of our bank&#39;s high reputable customers who once owned a reputabl=
e company here in Paris, and also one time the CEO of a company, and then h=
e operated an investment account worth millions of euros in our bank.<br><b=
r>Unfortunately, he died along with his nuclear families while on sabbatica=
l in the summer of 2005 in northwest Venezuela. He died in intestacy (intes=
tate), without a functional will. After his death my bank made several effo=
rts to locate any member of his extended families via his consulates withou=
t success. Fleetingly, in line with our bank inheritance&#39;s claim(s) rul=
es and regulate, as stipulated by the WBG I have been mandated by our bank =
board/committee as his personal accountant to declare the account without a=
n inheritor, provide one or the bank will revert the funds back into our tr=
easury as an unclaimed and abandoned monies otherwise the funds will be con=
fiscated by the government (es-cheat). Like they say &quot;drastic situatio=
ns call for drastic measures&quot; Hence I decided to contact you and then =
have you nominated/listed as the next of KIN to be awarded the abandoned es=
tate of (US$ 23.7 millions dollars)<br><br>I went through your profile. You=
 share the same family/surname with the subject matter before I decided to =
contact you. You will stand as his family representative of the deceased fo=
r the bank to release and award you the funds as his heir. This project wil=
l be executed legally, officially without breaking any law, and success is =
guaranteed with your total corporation. Please if you are interested, indic=
ate so that I can give you all the necessary information and also some back=
 up documents. Please I cannot be discussing this sensitive issue with peop=
le as such your cooperation is seriously needed. Please, treat this proposa=
l with utmost confidentiality as I assure you it&#39;s 100% risk free. Plea=
se get back to me with your full Name and direct telephone number.<br><br><=
br>Thank You<br>Yours Sincerely,<br>Prof. Laurent David<br>CEO BNP Paribas =
Personal Finance.<br>Please reply me to my private email address ( <a href=
=3D"mailto:proflaurentdavid020@outlook.fr">proflaurentdavid020@outlook.fr</=
a> )<br></div>

--0000000000007cbe8305cba95398--
