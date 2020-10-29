Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2429F212
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Oct 2020 17:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596FB6E8E2;
	Thu, 29 Oct 2020 16:48:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x746.google.com (mail-qk1-x746.google.com
 [IPv6:2607:f8b0:4864:20::746])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B589C6E8E3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Oct 2020 16:48:19 +0000 (UTC)
Received: by mail-qk1-x746.google.com with SMTP id r129so871831qkd.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Oct 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=YXgm8L8nxr5WFBrJK44lm++yH1yFUorde/nbOLGT5b8=;
 b=kEz8BNEJ2w/MjGV2x/pLghO1MOV/F2TCQYtSb9RGC/8c9Of1Q+bNP2a4yM7HoFve7v
 9NnG5JxKlxHQ8yjt3jcdUBbdgfEQuaHU8k6hXCr/cl2uHvJb3qC8hPvGbJ/nX7gsokVp
 LwWzOZeqetmA2MeWbJZQUJ9aaYfanisyUFpAr9jnVEr+H5vsTDsnkGoY2DqT/SQ2zcTU
 aB2CcAbFbPW8frL2scPSIwHgQXPM8aGca6twjW5IlW7Miw1Pp3kM9Go30GozFp6fFiHA
 Vi229HAs4XAHnw8ImY/eFjoQgNrQCO3tLU/RDITXlM5TvpkK/Zjy5C9xFK9Ay6M5LIof
 AXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=YXgm8L8nxr5WFBrJK44lm++yH1yFUorde/nbOLGT5b8=;
 b=r2L2l5SW/rHijLEM7qdUWWH3gUNtDiMX7s5GuHX2WC9ozk6Qhngmo9J5iasggDiSRt
 t2BBLiTiMAlqxoze32k4YHrvjEI9sIDEydTDyZI/r3BK0jmkHIjrFK7bNdFAV6hQy1P4
 20Mjgx7GcUrAM18b7qG4EjH8c6/JPS9djowRwO5edswJRgkC/jfzHPGzZcCsvuZHJy8y
 fGAO9k/6DXrg9O5TUtLvvawlnCYaVSJO5F2cUXQzHN/X+hEf5QAITUDFmElhZK1OzD1F
 Yg5tk3cuYsi+znJerlEt8p0YyadJisNCuY7CPAzTmVe1jwt2NeQPgdwIUlj8FlJ0P9Wa
 06nQ==
X-Gm-Message-State: AOAM532rQoG60XfRBUHF8DwNuGc9ozO9EYcePK5MyuYJLOeUwiPt/1lt
 Q3/ydPu+Du+NCs4xmo6jZFSWAzEV7kBwNe8Jz4S6
MIME-Version: 1.0
X-Received: by 2002:a05:620a:12b9:: with SMTP id
 x25mt4708486qki.475.1603990098830; 
 Thu, 29 Oct 2020 09:48:18 -0700 (PDT)
X-No-Auto-Attachment: 1
Message-ID: <00000000000010711605b2d20cc2@google.com>
Date: Thu, 29 Oct 2020 16:48:19 +0000
Subject: Could you help me in this transaction?
From: fabienne.tagro2017@gmail.com
To: intel-gvt-dev@lists.freedesktop.org
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
Reply-To: fabienne.tagro2017@gmail.com
Content-Type: multipart/mixed; boundary="===============1896097408=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1896097408==
Content-Type: multipart/alternative; boundary="0000000000001379a605b2d20c85"

--0000000000001379a605b2d20c85
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
Untitled form

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSe1wBhXSQ5Skw4YywgnRWiOLeNuYO0dbmnMnsDvN4YAMDRi3A/viewform?vc=0&amp;c=0&amp;w=1&amp;flr=0&amp;usp=mail_form_link

Hello Dear,

I am very sorry that my letter may come as a surprise to you since we have  
never met each other before. I am Miss Nidal Aoussa. I am the only daughter  
of Cheikh Ag Aoussa, the President of (HCUA) in Mali who was assasinated on  
the octobre 2016.

https://www.jeuneafrique.com/365432/politique/mali-sait-on-mort-de-cheikh-ag-aoussa/
https://fr.wikipedia.org/wiki/Cheikh_Ag_Aoussa

I have a business transaction which i solicit your help. It is all about a  
fund to be transferred in your country for urgent investment on important  
projects. I want you to guide me and invest this money in your country.  
This fund amount to Eleven Millions Five Hundred Thousand United States  
dollars which i inherited from my late dad.. If you are capable of handling  
or participate in this transaction, kindly respond quickly through my  
private emails to enable me give you more details about this fund and how  
this project shall be carried out. I will accord you 20% of the total fund  
for your kind assistance. Respond through this my private emails addresses  
below.

Miss Nidal Aoussa
Email: ( nidal.kong1998@gmail.com )

Google Forms: Create and analyze surveys.

--0000000000001379a605b2d20c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"font-family: Roboto,Helvetica,Arial,sans-serif; margin=
: 0; padding: 0; height: 100%; width: 100%;"><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" style=3D"background-color:rgb(103,58,183);" width=
=3D"100%" role=3D"presentation"><tbody><tr height=3D"64px"><td style=3D"pad=
ding: 0 24px;"><img alt=3D"Google Forms" height=3D"26px" style=3D"display: =
inline-block; margin: 0; vertical-align: middle;" width=3D"143px" src=3D"ht=
tps://www.gstatic.com/docs/forms/google_forms_logo_lockup_white_2x.png"></t=
d></tr></tbody></table><div style=3D"padding: 24px; background-color:rgb(23=
7,231,246)"><div align=3D"center" style=3D"background-color: #fff; border-b=
ottom: 1px solid #e0e0e0;margin: 0 auto; max-width: 624px; min-width: 154px=
;padding: 0 24px;"><table align=3D"center" cellpadding=3D"0" cellspacing=3D=
"0" style=3D"background-color: #fff;" width=3D"100%" role=3D"presentation">=
<tbody><tr height=3D"24px"><td></td></tr><tr><td><span style=3D"display: ta=
ble-cell; vertical-align: top; font-size: 13px; line-height: 18px; color: #=
424242;" dir=3D"auto">Hello Dear,<br><br>I am very sorry that my letter may=
 come as a surprise to you since we have never met each other before. I am =
Miss Nidal Aoussa. I am the only daughter of Cheikh Ag Aoussa, the Presiden=
t of (HCUA) in Mali who was assasinated on the octobre 2016.<br><br>https:/=
/www.jeuneafrique.com/365432/politique/mali-sait-on-mort-de-cheikh-ag-aouss=
a/<br>https://fr.wikipedia.org/wiki/Cheikh_Ag_Aoussa<br><br>I have a busine=
ss transaction which i solicit your help. It is all about a fund to be tran=
sferred in your country for urgent investment on important projects. I want=
 you to guide me and invest this money in your country. This fund amount to=
 Eleven Millions Five Hundred Thousand United States dollars which i inheri=
ted from my late dad.. If you are capable of handling or participate in thi=
s transaction, kindly respond quickly through my private emails to enable m=
e give you more details about this fund and how this project shall be carri=
ed out. I will accord you 20% of the total fund for your kind assistance. R=
espond through this my private emails addresses below.<br><br>Miss Nidal Ao=
ussa<br>Email: ( nidal.kong1998@gmail.com )</span></td></tr><tr height=3D"2=
0px"><td></tr><tr style=3D"font-size: 20px; line-height: 24px;"><td dir=3D"=
auto"><a href=3D"https://docs.google.com/forms/d/e/1FAIpQLSe1wBhXSQ5Skw4Yyw=
gnRWiOLeNuYO0dbmnMnsDvN4YAMDRi3A/viewform?vc=3D0&amp;c=3D0&amp;w=3D1&amp;fl=
r=3D0&amp;usp=3Dmail_form_link" style=3D"color: rgb(103,58,183); text-decor=
ation: none; vertical-align: middle; font-weight: 500">Untitled form</a><di=
v itemprop=3D"action" itemscope itemtype=3D"http://schema.org/ViewAction"><=
meta itemprop=3D"url" content=3D"https://docs.google.com/forms/d/e/1FAIpQLS=
e1wBhXSQ5Skw4YywgnRWiOLeNuYO0dbmnMnsDvN4YAMDRi3A/viewform?vc=3D0&amp;c=3D0&=
amp;w=3D1&amp;flr=3D0&amp;usp=3Dmail_goto_form"><meta itemprop=3D"name" con=
tent=3D"Fill out form"></div></td></tr><tr height=3D"24px"></tr><tr><td><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%"><tbody>=
<tr><td><a href=3D"https://docs.google.com/forms/d/e/1FAIpQLSe1wBhXSQ5Skw4Y=
ywgnRWiOLeNuYO0dbmnMnsDvN4YAMDRi3A/viewform?vc=3D0&amp;c=3D0&amp;w=3D1&amp;=
flr=3D0&amp;usp=3Dmail_form_link" style=3D"border-radius: 3px; box-sizing: =
border-box; display: inline-block; font-size: 13px; font-weight: 700; heigh=
t: 40px; line-height: 40px; padding: 0 24px; text-align: center; text-decor=
ation: none; text-transform: uppercase; vertical-align: middle; color: #fff=
; background-color: rgb(103,58,183);" target=3D"_blank" rel=3D"noopener">Fi=
ll out form</a></td></tr></tbody></table></td></tr><tr height=3D"24px"></tr=
></tbody></table></div><table align=3D"center" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"max-width: 672px; min-width: 154px;" width=3D"100%" role=
=3D"presentation"><tbody><tr height=3D"24px"><td></td></tr><tr><td><a href=
=3D"https://docs.google.com/forms?usp=3Dmail_form_link" style=3D"color: #42=
4242; font-size: 13px;">Create your own Google Form</a></td></tr></tbody></=
table></div></body></html>
--0000000000001379a605b2d20c85--

--===============1896097408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1896097408==--
