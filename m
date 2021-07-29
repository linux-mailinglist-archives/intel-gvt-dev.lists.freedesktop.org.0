Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD23DA43A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Jul 2021 15:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308576E203;
	Thu, 29 Jul 2021 13:29:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8AC6ECAB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Jul 2021 13:29:09 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id d73so10181434ybc.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Jul 2021 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Qih+KbRqDFBNZUs7Erjueto/V5hFdte15xz/4dFRcec=;
 b=omTL83613rvVuQO63J40z3wYR4bTiG2IUUZEv74Ck2lswaKr7vuaJZxLQE9j3/30fC
 c1w85IYZCvH0lRMT4Ozoh1ySsI0KuibyRZIQ18rWx/7xZa3ycJL3XyaVlGs8ISpmdltv
 6MRJaorY3eqDWscMaltP9vdr9aVdFP6f2hC5xBgCJyjfOcrwjUsOd9m3EFrsX1crrdog
 TPY9d6wfGy3U/RrtgMJiYMwPaqvpcV17LRNDSbWpOc4Zworp8yd9RiqN7hsl+GrdW3K2
 80nFCmxjfrQi0j8LV2bWQ4TwGY+HTjKk63znJV/fFWU6f5nrp6DwwKk6MvAHrqaS+8vU
 2C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Qih+KbRqDFBNZUs7Erjueto/V5hFdte15xz/4dFRcec=;
 b=bRYKqdz6BNTnq3YvNsZ3V/Ilckc3XI6OrvgVmhJ8bHUxLaUjmW1+n6Bj2IGi7NXZ81
 IC8CgLXMdmocix9qGd4/wbRNJlAIMqAiMVRjx8bX8NahP6Qif2l4NnkUa3fi7Q8idguR
 KKQXmdPR8rZlTn1nX01PVjQcl+m5CHpEAacIwuu7rgE7nO0IP/y4gNYNay3bXVxeWPjs
 MEkwUzsc93FxGgn5lyWnAeIVVUfeX0Y3TPibi+GIWYyIRSw6mLY1l8eFE+13j/6kHB2Z
 dDCKp0unwnLYvbWlP/f1qDB71Jeg8i68LYUCdJSKatLdZvH0aN/QPCeCkQkkYpYbotbJ
 yM3g==
X-Gm-Message-State: AOAM531gUwLrR7kPSJCPAxtr9+PLJ++0vr3j5ncRuJjdmII2nTMy+EHF
 ygZdBf9cAC/DZ4JKQtgben8BJmm5Z4xORKfySEk=
X-Google-Smtp-Source: ABdhPJyUSiwi8GTZ97hzAg397xPJr0ESR7x/R5lUZoYRGoRnaRh8UgiSuuHvpYnyWCOTZJ6C86FQOn1GfkXXVLntI4s=
X-Received: by 2002:a25:b787:: with SMTP id n7mr6594453ybh.468.1627565348276; 
 Thu, 29 Jul 2021 06:29:08 -0700 (PDT)
MIME-Version: 1.0
From: Cynthia Sanchez <cynsanchez.00225@gmail.com>
Date: Thu, 29 Jul 2021 06:28:53 -0700
Message-ID: <CA+=AnS_FxxAJMk+ZtjworTZefV-PaVmw-z7fJkN6vPdhXqZ3Qg@mail.gmail.com>
Subject: Greetings in Christ,
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
Content-Type: multipart/mixed; boundary="===============0250349787=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0250349787==
Content-Type: multipart/alternative; boundary="0000000000006ece6805c84316e9"

--0000000000006ece6805c84316e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings in Christ,

My name is Mrs. Cynthia Sanchez, It is the third time i am contacting you
concerning my health issue with regards to the charity work. I know that
you will be surprise of me contacting you but my health leads me to contact
you. I have been unjustly treated by my late husband families and relatives
so, I seek your help, attention and genuine co-operation to stand this
charity work and I believe that you will not let me down the trust and
confidence I am about to repose on you. I have been maltreated by this evil
family of my late husband for the past ten years.

I am writing this letter in other to inform you of a charity work that will
be benefit of you and the needy immensely as long as you will make up your
mind to co-operate accordingly but before going into details, I want you to
take note that this charity work is my last wish on earth and not something
to toy with rather it is a humanitarian work that will give you the
opportunity to save lives around the world.

My husband is dead, I have fund which i inherited from my late husband Mr.
Carlos Sanchez, The total sum =E2=82=AC16.7Million Euros which he deposited=
 in one
of the good Banks.

kindly reply me back on' ( cynthiia.sanchez@yahoo.com ).

My Regards,

Mrs. Cynthia Sanchez.

--0000000000006ece6805c84316e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings in Christ,<br><br>My name is Mrs. Cynthia Sanche=
z, It is the third time i am contacting you concerning my health issue with=
 regards to the charity work. I know that you will be surprise of me contac=
ting you but my health leads me to contact you. I have been unjustly treate=
d by my late husband families and relatives so, I seek your help, attention=
 and genuine co-operation to stand this charity work and I believe that you=
 will not let me down the trust and confidence I am about to repose on you.=
 I have been maltreated by this evil family of my late husband for the past=
 ten years.<br><br>I am writing this letter in other to inform you of a cha=
rity work that will be benefit of you and the needy immensely as long as yo=
u will make up your mind to co-operate accordingly but before going into de=
tails, I want you to take note that this charity work is my last wish on ea=
rth and not something to toy with rather it is a humanitarian work that wil=
l give you the opportunity to save lives around the world.<br><br>My husban=
d is dead, I have fund which i inherited from my late husband Mr. Carlos Sa=
nchez, The total sum =E2=82=AC16.7Million Euros which he deposited in one o=
f the good Banks.<br><br>kindly reply me back on&#39; ( <a href=3D"mailto:c=
ynthiia.sanchez@yahoo.com">cynthiia.sanchez@yahoo.com</a> ).<br><br>My Rega=
rds,<br><br>Mrs. Cynthia Sanchez.</div>

--0000000000006ece6805c84316e9--

--===============0250349787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0250349787==--
