Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD1A79AE7
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  3 Apr 2025 06:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096A610E903;
	Thu,  3 Apr 2025 04:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RdZQZgE+";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0A110E903
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  3 Apr 2025 04:45:47 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54991d85f99so1579643e87.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 02 Apr 2025 21:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743655546; x=1744260346; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=98cpEHba1foCD/7sQNL6TdP9cDmU5DWeoyfvoxEJr6I=;
 b=RdZQZgE+3oJcXfOfimg94287blWvtnUuEPA8VzD1PvDzpFGF6lBOwf47AS3/dyYAQf
 DFqUbGwqnTvwbHUjYz2umfRGriD1STJUyRlSj5l5/ntZX05IpMYAkvaq8iJmuAWs5qTG
 L8PKam8haU1vBppRcv6t7cU0mon7tIaF+Kwzpa1N7kVcOHdTK/FkAcZrSZfU7Evn9L74
 5rhT6ITlALb1Q1Qy4uw70crENyErRbzzkuVhAwX5FN4xTFkfXF0oZjbfAhiIa3Ah3s07
 GQ4Srfc+ANocYOS+Dy6XgDI9yCB2Vff4QqAdAaC0Hmbm13LJifC3/yJsX/EMY1cnL98I
 gBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743655546; x=1744260346;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=98cpEHba1foCD/7sQNL6TdP9cDmU5DWeoyfvoxEJr6I=;
 b=Nkx3eJ2d1KS+pIkrgOD8xLJ+BusIwQoJ4S4nawDQvElYyZ4Cx3x9p/o+ZPMFU235Vj
 ZLMJg/qaiaSf7a+bIkIgiVos6SEQRlr0ahqOYHjiDEzwNJjz1qdfidmpZMzk9nOLOdQ9
 ccyVhz6sjMlXutIDlPaC6m1GZIcAfqZbaAIapkwp+zSbRMF8uGVf8MIQdr23krDfW14a
 PT58b0QyLA7SCQ2pjDQ7eQEy8d2hQvZLetpnzFAKYv8NcpegGK/FOPfANdDjVNUfVJzq
 jongWlTL0HEsIrbmQl/St9PKw1/3wCZk4sRr/eQX00DjkTrtd7LClFNP1/hpc0Xb5v0D
 P7fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfmw1OVjZLIEZYBvcekvEhraDJwxePlkiaTEjxZHZKRW+KoNMeMGwC5Mi1LIbcQE68FUE7Gcgbdy0cNEZT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyQzYz65/PWSoPnXj53MG8+lEZYw+jeNqZ8Ih6zzLhG00RtBAO
 67mfn+mkVB1kCMq/dhSqlOfxSE4eoUqYtapY/mLylqtXlLeRFfKSaSbu0q6I0NqMRjoNT5NBSZ4
 OvcRCO0NanPdpebsk1WnB639Wiw8=
X-Gm-Gg: ASbGncuWhjC5chAr5R105U6YAUvRimTmovDTPAJFdXKJanhQMTPtt/5/gj3ROH31wEp
 Me0GXOVXiODGgqImL50wYz4EyNA7PdVvRJAWeqXDbfkjrgli48R1WIgfmOn+hqX/HJgfcWeZp9j
 sAaPV2/KGFmbdKylVmK88i8srY3A==
X-Google-Smtp-Source: AGHT+IHlWspV8IzOv5DyEVZs3yj4p9C5G4Xvnq2i1oWHKTjWwUqY1Gtvk94QkYYKkTwcGSOXKINhGYV//BCjh4oA3bs=
X-Received: by 2002:a05:6512:32d0:b0:549:6ae7:e679 with SMTP id
 2adb3069b0e04-54c1ca57062mr632598e87.3.1743655545821; Wed, 02 Apr 2025
 21:45:45 -0700 (PDT)
MIME-Version: 1.0
From: "Dr. Margaret. Owens" <infosafelifesfoundation2024@gmail.com>
Date: Thu, 3 Apr 2025 05:45:33 +0100
X-Gm-Features: AQ5f1Jq7Mdu5W0vAI5YU2nO41_090BAZW-VRWCA4kcgBUAMNZ2tMani7ooNuK38
Message-ID: <CAHwjCnMZfd-YnX5dnFx1XJMDfpD4p6A+_215-LxSaZZooWZB8A@mail.gmail.com>
Subject: Donation Request From Safe Life's Foundation International The
 Children Centers,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000006b63400631d8711b"
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

--0000000000006b63400631d8711b
Content-Type: text/plain; charset="UTF-8"

*USA Office*


























































*54th N Spring .Los Angeles, CA 90118Tel :
1-800-942-0821E-mail:: infosafelifesfoundation2024@gmail.com
<infosafelifesfoundation2024@gmail.com> South African officeV.W.L
Building,122 Madiba Street, Pretoria 0001,Tel: +27(12) 441
300Email: wi0523475@gmail.com <wi0523475@gmail.com>N.G.O. RegistrationNo.
D.S.W./1379432765 -TkCertificate of IncorporationNo. G--72064422--SADear
Blessed Executive.Greetings From The Safe Life's Foundation International.
The Children Center'sFrom Dr Margaret OwensWriting on behalf of The Safe
Life's Foundation International,We are a well reputable Foundation saving
lives in the innermost villages and communities,A non profit, non
sectional, non political N.G.O based in the Africa Villages, located in the
Greater Accra Region of Ghana. Ivory's coast abidjan in Lake Chad,OUR
OBJECTIVES ARE AS FOLLOWS:A. What is of paramount importance is our
obligation to pay the cost of educating the children when the parents are
unable to, and fight against HIV/AIDS in Ghana and Africa as a whole.B. We
advocate the rights o children in the line with international convention.C.
We protect the rights of children through a long term plan of building
their capacity.D. We provide self reliance at adulthood through career
development and technical skill training.E. We protect the lives of the
children against S.T.D and HIV-AIDS pandemic.E. We raise consciousness
about the effects on environmental degradation on economic
development.S.L.F. would really appreciate your views and thoughts of the
above mentioned objectives as C.P.A. believe very strongly in bringing joy
into the faces of under-privileged, deprived, unheard voices refugees, able
and disabled children in Ghana and other parts of Africa.S.L.F. is writing
to your organisation primarily to affiliate with your honourable
organization to work together to help these children to be what God wants
them to be in the US and extended African countries,Please, these 2000 and
more children, made up of South African ivorian and Liberian Ghanaians Lake
Chad refugee's children, lack educational logistics such as children's
literature books, computer books, used computers, educational toys,
children's clothing and any thing that will be of a great help to these
children that none of us doesn't know what they will be come in posterity.I
thank you so much in anticipating for your prompt reply.Sincerely,Dr
Margaret Owens,SNR Vice CFO Safe Life's Foundation International The
Children Centers.*

--0000000000006b63400631d8711b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" w=
idth=3D"100%" style=3D"color:rgb(60,60,60);font-family:arial,helvetica,sans=
-serif;font-size:16px"><tbody><tr><td style=3D"background-color:rgb(255,255=
,255);padding:0px 20px 0px 0px"><table border=3D"0" cellpadding=3D"0" cells=
pacing=3D"0" width=3D"100%"><tbody><tr><td align=3D"left" valign=3D"top"><b=
r><div dir=3D"auto" style=3D"color:rgb(0,0,0);font-family:sans-serif;font-s=
ize:12.8px"><div style=3D"width:328px;margin:16px 0px"><div dir=3D"auto"><d=
iv dir=3D"auto"><div style=3D"width:328px;margin:16px 0px"><div dir=3D"auto=
"><b>USA Office</b></div><div dir=3D"auto"><b>54th N Spring .<br>Los Angele=
s, CA 90118<br>Tel : 1-800-942-0821<br>E-mail::=C2=A0<a href=3D"mailto:info=
safelifesfoundation2024@gmail.com" style=3D"color:rgb(66,133,244)">infosafe=
lifesfoundation2024@gmail.com</a>=C2=A0<br><br>South African office<br>V.W.=
L Building,122 Madiba Street, Pretoria 0001,<br>Tel: +27(12) 441 300<br>Ema=
il:=C2=A0<a href=3D"mailto:wi0523475@gmail.com" style=3D"color:rgb(66,133,2=
44)">wi0523475@gmail.com</a><br><br>N.G.O. Registration<br>No. D.S.W./13794=
32765 -Tk<br><br>Certificate of Incorporation<br>No. G--72064422--SA<br><br=
><br><br>Dear Blessed Executive.<br><br>Greetings From The Safe Life&#39;s =
Foundation International. The Children Center&#39;s<br><br>From Dr Margaret=
 Owens<br>Writing on behalf of The Safe Life&#39;s Foundation International=
,<br><br>We are a well reputable Foundation saving lives in the innermost v=
illages and communities,<br><br>A non profit, non sectional, non political =
N.G.O based in the Africa Villages, located in the Greater Accra Region of =
Ghana. Ivory&#39;s coast abidjan in Lake Chad,<br><br>OUR OBJECTIVES ARE AS=
 FOLLOWS:<br><br>A. What is of paramount importance is our obligation to pa=
y the cost of educating the children when the parents are unable to, and fi=
ght against HIV/AIDS in Ghana and Africa as a whole.<br><br>B. We advocate =
the rights o children in the line with international convention.<br><br>C. =
We protect the rights of children through a long term plan of building thei=
r capacity.<br><br>D. We provide self reliance at adulthood through career =
development and technical skill training.<br><br>E. We protect the lives of=
 the children against S.T.D and HIV-AIDS pandemic.<br><br>E. We raise consc=
iousness about the effects on environmental degradation on economic develop=
ment.<br><br>S.L.F. would really appreciate your views and thoughts of the =
above mentioned objectives as C.P.A. believe very strongly in bringing joy =
into the faces of under-privileged, deprived, unheard voices refugees, able=
 and disabled children in Ghana and other parts of Africa.<br><br>S.L.F. is=
 writing to your organisation primarily to affiliate with your honourable o=
rganization to work together to help these children to be what God wants th=
em to be in the US and extended African countries,<br><br>Please, these 200=
0 and more children, made up of South African ivorian and Liberian Ghanaian=
s Lake Chad refugee&#39;s children, lack educational logistics such as chil=
dren&#39;s literature books, computer books, used computers, educational to=
ys, children&#39;s clothing and any thing that will be of a great help to t=
hese children that none of us doesn&#39;t know what they will be come in po=
sterity.<br><br>I thank you so much in anticipating for your prompt reply.<=
br><br><br>Sincerely,<br><br><br>Dr Margaret Owens,<br><br><br>SNR Vice CFO=
 Safe Life&#39;s Foundation International The Children Centers.</b></div></=
div></div><div dir=3D"auto"><div style=3D"height:0px"></div></div><p dir=3D=
"ltr"><br></p></div></div><div style=3D"height:0px"></div></div><br></td></=
tr></tbody></table></td></tr></tbody></table><br></div>

--0000000000006b63400631d8711b--
