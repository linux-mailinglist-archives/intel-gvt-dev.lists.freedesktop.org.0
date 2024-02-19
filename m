Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74104859ADF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Feb 2024 03:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0A210E009;
	Mon, 19 Feb 2024 02:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b0ZjvAuq";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655FF10E03B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Feb 2024 02:59:16 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7c3e01a7fe0so180825739f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 18 Feb 2024 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708311555; x=1708916355; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IpXgLrpsCIS7yS5yrl+vggv2nSJrgYvHzK5VyEMRE6Q=;
 b=b0ZjvAuqV87+5bMFLfaI9vo6+BFuah0VFes/YuCPUT7ZJXocdOlj5/EXeu25m0/Kxg
 9C2ANezIZx4dk0rKY4Lojmd90gcoW+wQpmsdQhsPqlb7vk+bUcFpZw0NCvu00nRLQC3u
 ubo1jnCvflF92lU3Z9dNV2rrv4K0+9PP87sF0vCed81LbmUMONslV+wE3TntioLbXgR9
 nN2VQhCLMnbkSfp/RSi/QATkOiVSCRM3pxNmSNnUoAnJ6JJCr3WfAqmptLGIy1+AmKvU
 FYUf4lgXo68QAuq5i5KYAA9bUcwy+Bxwg0RfKPwAQZPDPlSmBasMEOVPhPZK94sRepZz
 IJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708311555; x=1708916355;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IpXgLrpsCIS7yS5yrl+vggv2nSJrgYvHzK5VyEMRE6Q=;
 b=Gj7WokLvNmsA0ENsY+UOH8w8ureBKiS+HTnMQap31Jif0oACsYfd2LSakDn+IA7yGV
 2RfdCjtatVewqkbCiuP1v799a2ANKibKd3PMvMIIECZQADzg1jjR1ankx1oAvFR4X/uX
 bw0d6d5kQQ2pzkXY1bTmOTiZheee+6y5/Hor2BsOZ6U2S8aRBlWH20+zu3tEfAX4sx9V
 6J50stDi/O+cnb7qOq+yfc1dLCxyQgSL5jbt0Omy9Ba7ut1voQk/2LtvV21NGL7Wn5E2
 UmOh4lFickMUif6un+Yig20/7K1mph7idQiPbUKBRenVsT1bwDDkCepla7HyLzYN9knx
 wfeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJXAYC9KV1jfpIUezcAHwSAkGU8SR7JwenbZyS2O3EqHUkuFCdE+9H0zvt7SC7AWTBMKaGLVoGWTsoMhme6MbhHMf3rGfKl3EOAKyq68uX/3SjKQ==
X-Gm-Message-State: AOJu0YzAP0vqPpa93Q6QlYTXsRqjzVA1JWd7FYkgktk+s/AUBuJyDkQo
 /a/Mp60W9b7rvBTU7t9KfEbC6T7IHXMAKvJvaxwHUZlzDKdX1K0Ml7hu/aXwOko9a+poYnKK4Kh
 SDKN4/8/kcUzRK1vKHxnos0v+wA==
X-Google-Smtp-Source: AGHT+IF3jnaJzB9EIVhSM5sKQOyF/XnQAeEj1b9sf3YeFti1clglIH78y9rARCRu6r0Tg49X5fM04M4Yx0ZfZaNywwI=
X-Received: by 2002:a05:6e02:1aa6:b0:365:ee1:237b with SMTP id
 l6-20020a056e021aa600b003650ee1237bmr10510696ilv.22.1708311555353; Sun, 18
 Feb 2024 18:59:15 -0800 (PST)
MIME-Version: 1.0
From: ROSE RICHARD <r2000016@gmail.com>
Date: Mon, 19 Feb 2024 03:59:04 +0100
Message-ID: <CANNWOeJ26k1gSOTh4VXkR5FNLdemPLJ3jmQc09KrFBZVYyteSg@mail.gmail.com>
Subject: Hallo Schatz
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000006c31c60611b347fc"
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

--0000000000006c31c60611b347fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo Schatz
Ich bin Miss.Rose Richard aus Abidjan, Elfenbeink=C3=BCste (C=C3=B4te d'Ivo=
ire). Ich
bin ein 17-j=C3=A4hriges M=C3=A4dchen, eine Waise. Da ich keine Eltern habe=
, drohen
meine Onkel, mich wegen des Erbes, das mein Vater mir hinterlassen hat,
umzubringen.
Bitte, ich brauche Ihre aufrichtige Hilfe. Ich habe (3.500.000,00 $
(US-Dollar) Drei Millionen f=C3=BCnfhunderttausend US-Dollar, die ich von m=
einem
verstorbenen Vater geerbt habe, aber er hat das Geld auf ein Fest-/Suspense
Konto bei einer der besten Banken hier in Abidjan eingezahlt, in Absprache
mit der Bank, an die das Geld =C3=BCberwiesen werden soll ein ausl=C3=A4ndi=
sches
Bankkonto f=C3=BCr Investitionen im Ausland, er verstarb jedoch, ohne das G=
eld
zu =C3=BCberweisen.
Mein Vater hat meinen Namen als seine einzige Tochter f=C3=BCr die n=C3=A4c=
hsten
Angeh=C3=B6rigen verwendet, als er das Geld eingezahlt hat, und das Geld ka=
nn
nur auf ein ausl=C3=A4ndisches Bankkonto =C3=BCberwiesen werden.
Alles, was ich brauche, ist Ihre Ehrlichkeit als mein ausl=C3=A4ndischer
Berater, Ihre Hilfe bei der Anlage des Fonds und Ihre Hilfe bei der
Fortf=C3=BChrung meiner Ausbildung in Ihrem Land.
Bitte bekunden Sie Ihr Interesse, indem Sie mir zur=C3=BCckschreiben, wenn =
Sie
bereit sind, mir bei diesem Zweck zu helfen. Anschlie=C3=9Fend werde ich Ih=
nen
die erforderlichen Informationen zum weiteren Vorgehen zukommen lassen und
Ihnen anschlie=C3=9Fend 20 % des Gesamtbetrags f=C3=BCr Ihre Hilfe auszahle=
n . Danke
f=C3=BCr deine Besorgnis.
Dein,
Miss.Rose Richard

--0000000000006c31c60611b347fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hallo Schatz<br>Ich bin Miss.Rose Richard aus Abidjan, Elf=
enbeink=C3=BCste (C=C3=B4te d&#39;Ivoire). Ich bin ein 17-j=C3=A4hriges M=
=C3=A4dchen, eine Waise. Da ich keine Eltern habe, drohen meine Onkel, mich=
 wegen des Erbes, das mein Vater mir hinterlassen hat, umzubringen.<br>Bitt=
e, ich brauche Ihre aufrichtige Hilfe. Ich habe (3.500.000,00 $<br>(US-Doll=
ar) Drei Millionen f=C3=BCnfhunderttausend US-Dollar, die ich von meinem ve=
rstorbenen Vater geerbt habe, aber er hat das Geld auf ein Fest-/Suspense K=
onto bei einer der besten Banken hier in Abidjan eingezahlt, in Absprache m=
it der Bank, an die das Geld =C3=BCberwiesen werden soll ein ausl=C3=A4ndis=
ches Bankkonto f=C3=BCr Investitionen im Ausland, er verstarb jedoch, ohne =
das Geld zu =C3=BCberweisen.<br>Mein Vater hat meinen Namen als seine einzi=
ge Tochter f=C3=BCr die n=C3=A4chsten Angeh=C3=B6rigen verwendet, als er da=
s Geld eingezahlt hat, und das Geld kann nur auf ein ausl=C3=A4ndisches Ban=
kkonto =C3=BCberwiesen werden.<br>Alles, was ich brauche, ist Ihre Ehrlichk=
eit als mein ausl=C3=A4ndischer Berater, Ihre Hilfe bei der Anlage des Fond=
s und Ihre Hilfe bei der Fortf=C3=BChrung meiner Ausbildung in Ihrem Land.<=
br>Bitte bekunden Sie Ihr Interesse, indem Sie mir zur=C3=BCckschreiben, we=
nn Sie bereit sind, mir bei diesem Zweck zu helfen. Anschlie=C3=9Fend werde=
 ich Ihnen die erforderlichen Informationen zum weiteren Vorgehen zukommen =
lassen und Ihnen anschlie=C3=9Fend 20 % des Gesamtbetrags f=C3=BCr Ihre Hil=
fe auszahlen . Danke f=C3=BCr deine Besorgnis.<br>Dein,<br>Miss.Rose Richar=
d<br></div>

--0000000000006c31c60611b347fc--
