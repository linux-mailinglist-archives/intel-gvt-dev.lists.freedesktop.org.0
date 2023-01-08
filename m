Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F366188D
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  8 Jan 2023 20:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238210E029;
	Sun,  8 Jan 2023 19:35:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6810E1FC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  8 Jan 2023 19:35:31 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id a9so3285030ilp.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 08 Jan 2023 11:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i/u+HDn8um5MjMIX8mXA8ayDGXj76n/I6IcOEwQ+Mgo=;
 b=CxWQGOUgVWC0Y03TRsYYav9hr/pIAK2dncebO9KjPevQXKMuQGVyhnagVYEtaHYqRG
 RxtXMU0vSCPq6b8KDJRt3GKCmpfMnmF4Ibm+kjq+WotGO2UMHTQCgYcfZC3UbWhQ6Qld
 rV4HPn04pUomeCKNjOXVDEQIv3S3jeU9t+l2m8Kl4AziRDjIQzitnjWM3/JWkXOU5zzj
 BnFEuVvN084c34KwxtAVlZVfhyF9Rhf9ZurorbMa1bfz8azmAQznYDyOkodZCSr5o6cC
 lbZZKlz5igj7f5oCpykJ/TqZo34sPN6hn0/UMwiWee1dkFz7tWguzpSjCon5BTxZezvv
 MeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i/u+HDn8um5MjMIX8mXA8ayDGXj76n/I6IcOEwQ+Mgo=;
 b=ePUTiIkrbtfpej3d1ZZ0ZRI1JeWwzCvVpUbmIHHdqrkfo4Bdep1jvcmcZVW8jCuMny
 Wi9C6uF/2rF2DK4yxNPZeJtoFX2fwvX5D5vB8YDU38XZvlLZgsGeXXQi+2q5dUHOkhNI
 M2yRs52cxzKYL6sKTK/z6+iaxSny08DiZWFdzwkPwDDnOrV8AEQdWNkDxLEprFStnOn5
 I+6WBDjVD2IUckyINuUkmyK+0T9KYKUIGsQpuEbqjphv9tG6GnZ7c7TQkxNQqs6hT/64
 ZoX0awQy1ULg0vavXxFKylJ9bIQdl9CfLQn9TtWba5f2uhRQo/pXQLPPtGErQlVkuzax
 bLmw==
X-Gm-Message-State: AFqh2koLhQU6bYhuD+L6T6B1AWi4rwQwmakLEaEURcVGUjlOlfsNBIkB
 SHepShVcUi8ZZ7p9pJjag1yUSTVUG5FqdxQXQ1U=
X-Google-Smtp-Source: AMrXdXsfgNCf0SdZzzJHEXCpqbi2U3kvaZyv4ygqz3AXBkrbMXOkV6febBvBn3+IRdRmkp40RIohCocBDCc/72SuQ24=
X-Received: by 2002:a92:cf4b:0:b0:30d:899f:aed2 with SMTP id
 c11-20020a92cf4b000000b0030d899faed2mr1356435ilr.214.1673206531181; Sun, 08
 Jan 2023 11:35:31 -0800 (PST)
MIME-Version: 1.0
From: AGENCE IMMO <immobilierintern@gmail.com>
Date: Sun, 8 Jan 2023 19:35:20 +0000
Message-ID: <CAPrpWc5g_S5cUrz2gKi--j6FAt1qtWsG2j8AJSNNk9n7=krPng@mail.gmail.com>
Subject: =?UTF-8?Q?R=C3=A8glement=2DLoyer?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000ed545905f1c5c05b"
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

--000000000000ed545905f1c5c05b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A votre aimable attention,



Nous vous informons qu'une mise =C3=A0 jour a =C3=A9t=C3=A9 effectu=C3=A9e =
au sein de notre
=C3=A9tablissement. De ce fait, nous avons apport=C3=A9 quelques changement=
s au
niveau compta,




Veuillez confirmer la r=C3=A9ception de notre diffusion, afin de vous envoy=
er
les nouvelles coordonn=C3=A9es bancaires pour le versement mensuel.



Vous souhaitant une tr=C3=A8s bonne et heureuse ann=C3=A9e 2023, ainsi qu'u=
ne bonne
r=C3=A9ception de la pr=C3=A9sente.



Bien cordialement,



*Le S.ervice G.estion L.ocative.*

--000000000000ed545905f1c5c05b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:ad" class=3D"gmail-Ar gmail-Au gmail-Ao"=
 style=3D"display:block"><div id=3D"gmail-:f1" class=3D"gmail-Am gmail-Al e=
ditable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Corps du messag=
e" role=3D"textbox" aria-multiline=3D"true" style=3D"direction:ltr;min-heig=
ht:331px" tabindex=3D"1" aria-controls=3D":12l"><div id=3D"gmail-:p0" class=
=3D"gmail-Ar gmail-Au" style=3D"display:block"><div id=3D"gmail-:ow" class=
=3D"gmail-Am gmail-Al editable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-l=
abel=3D"Corps du message" role=3D"textbox" aria-multiline=3D"true" style=3D=
"direction:ltr;min-height:331px" tabindex=3D"1" aria-controls=3D":rs"><div =
id=3D"gmail-:et" class=3D"gmail-Ar gmail-Au gmail-Ao" style=3D"display:bloc=
k"><div id=3D"gmail-:ep" class=3D"gmail-Am gmail-Al editable gmail-LW-avf g=
mail-tS-tW gmail-tS-tY" aria-label=3D"Corps du message" role=3D"textbox" ar=
ia-multiline=3D"true" style=3D"direction:ltr;min-height:331px" tabindex=3D"=
1" aria-controls=3D":hl"><p style=3D"font-style:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:no=
ne;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-fa=
mily:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><span style=3D"=
box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font-family:&quot=
;Times New Roman&quot;,serif;color:rgb(20,20,20)">A votre aimable attention=
,</span></p><p style=3D"font-style:normal;font-variant-caps:normal;font-wei=
ght:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing=
:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,=
sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-s=
tyle:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.=
0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68)=
;font-size:11pt"><span style=3D"box-sizing:content-box;line-height:1.4em;fo=
nt-size:13.5pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(20,2=
0,20)">Nous vous informons qu&#39;une mise =C3=A0 jour a =C3=A9t=C3=A9 effe=
ctu=C3=A9e au sein de notre =C3=A9tablissement. De ce fait, nous avons appo=
rt=C3=A9 quelques changements au niveau compta,<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0</span><br></span></p><p style=3D"font-style:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-h=
eight:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11=
pt"><span style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5p=
t;font-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,20)"><br></=
span></p><p style=3D"font-style:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing:co=
ntent-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,san=
s-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-styl=
e:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.000=
1pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);fo=
nt-size:11pt"><span style=3D"box-sizing:content-box;line-height:1.4em;font-=
size:13.5pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,2=
0)">Veuillez confirmer la r=C3=A9ception de notre diffusion, afin de vous e=
nvoyer les nouvelles coordonn=C3=A9es bancaires pour le versement mensuel.<=
/span></p><p style=3D"font-style:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing:c=
ontent-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sa=
ns-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-sty=
le:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.00=
01pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);f=
ont-size:11pt"><span style=3D"box-sizing:content-box;line-height:1.4em;font=
-size:13.5pt;font-family:Times,serif;color:rgb(12,12,12)">Vous souhaitant u=
ne tr=C3=A8s bonne et heureuse ann=C3=A9e 2023, ainsi qu&#39;une bonne r=C3=
=A9ception de la pr=C3=A9sente.</span></p><p style=3D"font-style:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;t=
ext-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-hei=
ght:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt=
">=C2=A0</p><p style=3D"font-style:normal;font-variant-caps:normal;font-wei=
ght:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing=
:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,=
sans-serif;color:rgb(68,68,68);font-size:11pt"><span style=3D"box-sizing:co=
ntent-box;line-height:1.4em;font-size:13.5pt;font-family:Times,serif;color:=
rgb(14,14,14)">Bien cordialement,</span></p><p style=3D"font-style:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;text-decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-h=
eight:1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11=
pt">=C2=A0</p><p style=3D"font-style:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;text-decoration:none;box-sizi=
ng:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibr=
i,sans-serif;color:rgb(68,68,68);font-size:11pt"><i style=3D"box-sizing:con=
tent-box;line-height:1.4em"><span style=3D"box-sizing:content-box;line-heig=
ht:1.4em;font-size:13.5pt;font-family:Times,serif;color:rgb(60,115,191)">Le=
 S.ervice G.estion L.ocative.</span></i></p></div></div></div></div></div><=
/div></div>

--000000000000ed545905f1c5c05b--
