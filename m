Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633F75C076
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Jul 2023 09:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACAB10E622;
	Fri, 21 Jul 2023 07:54:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6042610E623
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Jul 2023 07:53:59 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9926623e367so267854366b.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Jul 2023 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689926038; x=1690530838;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F13Xyxo0nhFsw5p3aBEVNgn334Hhkzypz5MU1EOkPj4=;
 b=oI+1KXwSc+pyfYnwnTzqm5ZIPchCnG21SStkCsAuxe5+lh/e1sk9dt15YocHQgNeoS
 H9i91YtLcWq0EgAO5uVcl1NiZAj0m+Ut7ZU+5/Dm32HF5mbwSA4J/2Pzvi9/xn4PFlIB
 6Tv7Y+NpD9GmjW3/WrgrrZmC8C+Ntws4itEpbWZAGB2ZHxkUoKSCesfdLPnV/DlT5XzY
 +m1l9/Cw1BRzQMA5XGx/BCodbosg0Bl2gcWuVw4bZzuRDQgLc2ZmwLzbCHWxVATvAQwt
 ZNoGVydqLdaQNUsi6nCIdtaJ8svpVKYu3vdkDlitVQL9Qrg6ciDI+CynbJvp5rpUSwws
 QobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689926038; x=1690530838;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F13Xyxo0nhFsw5p3aBEVNgn334Hhkzypz5MU1EOkPj4=;
 b=kg2UslnWp9nAdOsfQ4wWXz+r6EDXNjpGpmpnlv/uQdKSm+WEo4r7LxOdhvreYEM9hP
 LXLwaz6+w3QylM886X1Q0vDUkBLKFeNEYpG9JJarfO6JvIbPeOCEVIEoh8G2hXfeOkQB
 lNpEgBRiA/lR7HzkCSD+c05NcVarmFb7GXEqxBM0oIQrdbDyBz16hJIMOXgsY8IkzU/l
 sOAlBjN1570nG65jF3mYspB3j8qlh0lsDn2pErnoKxX8onT5KvAAO0N8DnPzhxEcGD9/
 c0KHTIAHect/aFhc5jVIrvYZWYxm2N8D7Xv9u4K2fTZUU9QoKWNtxYsH3DvqFbf0sgGl
 gK2w==
X-Gm-Message-State: ABy/qLZMf3EYnNPzH1M/JnfSidzVgYHNvjU9dqh3XCWbykxcRwOW9M5R
 JUGLWrsSN2DBz4poSbvKVHEHOA9ea9+Am0Neb9s=
X-Google-Smtp-Source: APBJJlFQij2Wm2As9n/xSorVMqD8BRu8+SBjn+1CvKU8b0kGxHf7/juu2LQANC4d2gnzoNb3futYdWWXyxcIKqvxBvM=
X-Received: by 2002:a17:906:cc5b:b0:98d:5ae2:f1c with SMTP id
 mm27-20020a170906cc5b00b0098d5ae20f1cmr1017515ejb.34.1689926037515; Fri, 21
 Jul 2023 00:53:57 -0700 (PDT)
MIME-Version: 1.0
From: Kris Jaana <krisjaa4@gmail.com>
Date: Fri, 21 Jul 2023 07:53:46 +0000
Message-ID: <CABxdz3crsOv3n7an1yVMhyXrp6pCMNK9J7EgpJSfgh9rrWumPw@mail.gmail.com>
Subject: Antwort
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000029b4470600fa914a"
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

--00000000000029b4470600fa914a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Guten Tag. Ich bin Rechtsanwalt Kris Jaana, Rechtsanwalt und
Staatsangeh=C3=B6riger Togos. Einer meiner Kunden ist gestorben und hat ein=
en
riesigen Geldbetrag hier auf einer Bank hinterlassen, und ich m=C3=B6chte, =
dass
Sie die Gelder (12,8 Millionen US-Dollar) erhalten, die mein verstorbener
Kunde aufgrund seines tragischen Todes infolge eines Autounfalls hier in
einer Bank zur=C3=BCckgelassen hat der 7. Juni 2011. Ich m=C3=B6chte, dass =
Sie als
n=C3=A4chster Angeh=C3=B6riger meines verstorbenen Kunden das Geld erhalten=
. Ich
werde Sie unterst=C3=BCtzen, damit die Bank hier das Geld an Sie =C3=BCberw=
eist. Ich
m=C3=B6chte, dass Sie das Geld erhalten, weil Sie eines mit meinem verstorb=
enen
Kunden gemeinsam haben. Und was Sie mit meinem verstorbenen Kunden
gemeinsam haben, wird die Bank hier zu der Annahme veranlassen, dass Sie
mit meinem verstorbenen Kunden verwandt sind, und die Gelder, die er Ihnen
als seinen n=C3=A4chsten Verwandten hinterlassen hat, freigeben. Gr=C3=BC=
=C3=9Fe,
Rechtsanwalt Kris Jaana.

--00000000000029b4470600fa914a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<span class=3D"gmail-HwtZe" lang=3D"de"><span class=3D"gmail-jCAhz gmail-Ch=
Mk0b gmail-Jj6Lae"><span class=3D"gmail-ryNqvb">Guten Tag.</span></span> <s=
pan class=3D"gmail-jCAhz gmail-ChMk0b gmail-Jj6Lae"><span class=3D"gmail-ry=
Nqvb">Ich bin Rechtsanwalt Kris Jaana, Rechtsanwalt und Staatsangeh=C3=B6ri=
ger Togos.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b gmail-Jj6L=
ae"><span class=3D"gmail-ryNqvb">Einer meiner Kunden ist gestorben und hat =
einen riesigen Geldbetrag hier auf einer Bank hinterlassen, und ich m=C3=B6=
chte, dass Sie die Gelder (12,8 Millionen US-Dollar) erhalten, die mein ver=
storbener Kunde aufgrund seines tragischen Todes infolge eines Autounfalls =
hier in einer Bank zur=C3=BCckgelassen hat</span></span> <span class=3D"gma=
il-jCAhz gmail-ChMk0b gmail-Jj6Lae"><span class=3D"gmail-ryNqvb">der 7. Jun=
i 2011.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b gmail-Jj6Lae"=
><span class=3D"gmail-ryNqvb">Ich m=C3=B6chte, dass Sie als n=C3=A4chster A=
ngeh=C3=B6riger meines verstorbenen Kunden das Geld erhalten.</span></span>=
 <span class=3D"gmail-jCAhz gmail-ChMk0b gmail-Jj6Lae"><span class=3D"gmail=
-ryNqvb">Ich werde Sie unterst=C3=BCtzen, damit die Bank hier das Geld an S=
ie =C3=BCberweist.</span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b gm=
ail-Jj6Lae"><span class=3D"gmail-ryNqvb">Ich m=C3=B6chte, dass Sie das Geld=
 erhalten, weil Sie eines mit meinem verstorbenen Kunden gemeinsam haben.</=
span></span> <span class=3D"gmail-jCAhz gmail-ChMk0b gmail-Jj6Lae"><span cl=
ass=3D"gmail-ryNqvb">Und was Sie mit meinem verstorbenen Kunden gemeinsam h=
aben, wird die Bank hier zu der Annahme veranlassen, dass Sie mit meinem ve=
rstorbenen Kunden verwandt sind, und die Gelder, die er Ihnen als seinen n=
=C3=A4chsten Verwandten hinterlassen hat, freigeben.</span></span> <span cl=
ass=3D"gmail-jCAhz gmail-ChMk0b gmail-Jj6Lae"><span class=3D"gmail-ryNqvb">=
Gr=C3=BC=C3=9Fe, Rechtsanwalt Kris Jaana.</span></span></span>

</div>

--00000000000029b4470600fa914a--
