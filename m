Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAB45039C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Nov 2021 12:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8560F6E92B;
	Mon, 15 Nov 2021 11:37:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA1D6E95C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Nov 2021 11:37:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b15so70154707edd.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Nov 2021 03:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=wtngqm5yFXDL7M5pkjN2Cq3h6Vncor98nt3YFl3Ad6I=;
 b=F85zho0TDcWUPz4qRlsKvDoK1dNEjO6EoG/IGYV/Edawbw9nP/SyZ29oz9GAw+fGlA
 z+zgxwzR7uSolio7jd8IniEuN8R07xABuWFXq3pjDdkOudQ92vZb7FSHscFzMDR1xoVE
 YdmdU+pMbyTAC4DrF+TFPh3kOuciZKb2hyxGwX/g3sxAuZJXZtP72L5VXIokqNbjTKSl
 m+uMG9X4cQxOoKBF8T5TJahM15fXRQUADnkihoDGHlpNzdZWY68UIcrNp8MnGN9TU8Xi
 XwbLXMQ18RTEH0HL5PsZPU7bWGwv+xotszGQvFh5Ai3OS1WjEmmmV9m9YsAavZw66ZWe
 plQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=wtngqm5yFXDL7M5pkjN2Cq3h6Vncor98nt3YFl3Ad6I=;
 b=MbgIFRNG7r0K8Zvrvz8mxxh1r/ttY5Z578J/JMQStzlvEI0lVIYiqM+VWRRvjKXjJl
 Ddju/pTKUOUS/rcemHpuI456+Ear0fdsRGnqMtRTXwVbXEMKCTTdatZ4qZMyzxDuCs4E
 qlG03Wd1nJdUjnrIQeIkOqzmkb2VuEKMT/eIcxU9dJshYzFzQ42Srl1IYelrshRdrIv+
 32g9pzL0mYkgUc4gNWd+z2x8OgHMmK42oOIvwWw7UfEhnOaB+SnlMIe3HipkoutbyxiM
 AwQimXgch5vl7tBM6y2syjSn9kI+KfnH3BMcSO/6e7iZLH32AwXIeA416Kl9FsD5jGy2
 t93Q==
X-Gm-Message-State: AOAM5333DZMDEeC+I+ImsmO/haps+XagMGGJGfThb/dbFXKHmddbaQrE
 CPQvDSgHQctNENI1JZjCSnfhn/XxudpS+y9T7h8=
X-Google-Smtp-Source: ABdhPJwo5shdImuVjaQCIJuCZ/q0kDD4TKwftzau8YNaIXesfN6QsyY4HxQCgsip7lD4bERbp2OO6W58o2NyazMQ59M=
X-Received: by 2002:a17:906:2f10:: with SMTP id
 v16mr47901054eji.434.1636976242924; 
 Mon, 15 Nov 2021 03:37:22 -0800 (PST)
MIME-Version: 1.0
From: James williame55 <jwilliame30@gmail.com>
Date: Mon, 15 Nov 2021 03:35:30 -0800
Message-ID: <CA+3qtZhpHT3515RN1QFwNcdnkxaRch_EuczyEqAZxUxPXdT0yA@mail.gmail.com>
Subject: =?UTF-8?Q?HEI_KJ=C3=86RE?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000007722d105d0d23b87"
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
Reply-To: mrshawako72@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000007722d105d0d23b87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

M=C3=A5tte den allmektige Herre v=C3=A6re med deg.
ER ENKE TIL SENE MR David Lunner, JEG ER 59 .=C3=85R GAMLE. Mitt navn er
HAWA KOFFI. Jeg er gift med avd=C3=B8de Mr. David KOFFI, som jobbet i
Frankrike ambassade en her i Lome -Togo Vest-Afrika i ni =C3=A5r f=C3=B8r
han d=C3=B8de i
=C3=A5r 2010.

Du er valgt til =C3=A5 motta en donasjon i kontanter fra min avd=C3=B8de ma=
nn
som finansierer $5,7 000, 000,00 (fem millioner syv hundre tusen
amerikanske dollar) for =C3=A5 hjelpe de fattige og barnehjem gjennom din
oppriktig hjelp f=C3=B8r min d=C3=B8d. Jeg lider av langvarig kreft
brystet, alt tyder p=C3=A5 at tilstandene mine virkelig forverres
og det er helt =C3=A5penbart at jeg ikke ville leve lenger i f=C3=B8lge
til legen min fordi kreften har kommet til et veldig d=C3=A5rlig stadium at=
 nei
h=C3=A5per for meg =C3=A5 bli en levende person igjen, alt jeg trenger fra =
deg er din
oppriktighet til =C3=A5 bruke disse midlene til =C3=A5 gj=C3=B8re dette pro=
sjektet slik
jeg =C3=B8nsket og jeg trenger
informasjonen din som hvor Min Bank vil sende midlene,

som for eksempel:
Mottakers navn:_ Adresse:_ Telefon
nummer:_ Land:_

Vennligst ikke bli forn=C3=A6rmet av m=C3=A5ten eller m=C3=A5ten jeg kom ti=
l deg som en
fremmed =C3=A5 gj=C3=B8re dette, det er omtrent den eneste m=C3=A5ten jeg k=
an komme til
deg etterp=C3=A5
g=C3=A5r gjennom kontakt-ID. Jeg skal gi deg kontaktene til
bank. For legitimitet med et fullmaktsbrev som vil etablere
du som min utpekte mottaker av disse pengene.

Jeg venter p=C3=A5 at du skal svare.
Fra s=C3=B8ster HAWA KOFFI.

--0000000000007722d105d0d23b87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">M=C3=A5tte den allmektige Herre v=C3=A6re med deg.<br>ER E=
NKE TIL SENE MR David Lunner, JEG ER 59 .=C3=85R GAMLE. Mitt navn er<br>HAW=
A KOFFI. Jeg er gift med avd=C3=B8de Mr. David KOFFI, som jobbet i<br>Frank=
rike ambassade en her i Lome -Togo Vest-Afrika i ni =C3=A5r f=C3=B8r<br>han=
 d=C3=B8de i<br>=C3=A5r 2010.<br><br>Du er valgt til =C3=A5 motta en donasj=
on i kontanter fra min avd=C3=B8de mann<br>som finansierer $5,7 000, 000,00=
 (fem millioner syv hundre tusen<br>amerikanske dollar) for =C3=A5 hjelpe d=
e fattige og barnehjem gjennom din<br>oppriktig hjelp f=C3=B8r min d=C3=B8d=
. Jeg lider av langvarig kreft<br>brystet, alt tyder p=C3=A5 at tilstandene=
 mine virkelig forverres<br>og det er helt =C3=A5penbart at jeg ikke ville =
leve lenger i f=C3=B8lge<br>til legen min fordi kreften har kommet til et v=
eldig d=C3=A5rlig stadium at nei<br>h=C3=A5per for meg =C3=A5 bli en levend=
e person igjen, alt jeg trenger fra deg er din<br>oppriktighet til =C3=A5 b=
ruke disse midlene til =C3=A5 gj=C3=B8re dette prosjektet slik jeg =C3=B8ns=
ket og jeg trenger<br>informasjonen din som hvor Min Bank vil sende midlene=
,<br><br>som for eksempel:<br>Mottakers navn:_ Adresse:_ Telefon<br>nummer:=
_ Land:_<br><br>Vennligst ikke bli forn=C3=A6rmet av m=C3=A5ten eller m=C3=
=A5ten jeg kom til deg som en<br>fremmed =C3=A5 gj=C3=B8re dette, det er om=
trent den eneste m=C3=A5ten jeg kan komme til deg etterp=C3=A5<br>g=C3=A5r =
gjennom kontakt-ID. Jeg skal gi deg kontaktene til<br>bank. For legitimitet=
 med et fullmaktsbrev som vil etablere<br>du som min utpekte mottaker av di=
sse pengene.<br><br>Jeg venter p=C3=A5 at du skal svare.<br>Fra s=C3=B8ster=
 HAWA KOFFI.<br></div>

--0000000000007722d105d0d23b87--
