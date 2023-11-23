Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F797F6514
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Nov 2023 18:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AB410E034;
	Thu, 23 Nov 2023 17:18:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3E910E08B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 Nov 2023 17:18:00 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id
 006d021491bc7-58a7d13b00bso605029eaf.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 Nov 2023 09:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unn-edu-ng.20230601.gappssmtp.com; s=20230601; t=1700759880; x=1701364680;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvtWeM+Mwb3OHFcjh6p5CSC2tuQSRqfCHfpkw+ypzu8=;
 b=DsLrXirVSeL37SyFAcsUqVmSEBJraooJIfvNf5ldLcmEByU7Q4ZyOhSS0vma53bp41
 HOoBL6TRzANmfZcn40N5/Cxh7Qtt3wk4A1O+2+yZiaajXEFwpauK6MqK9cbulCyhTN4S
 HDtlZaAnxi3NLh4zEd6ngvAwFdeU2016gpMZeCtOk3z0joyBS0ZlrZn+waaul3lmxOfM
 iYWXEVk8ON2mFpO/THI7ESM2ncHvV3Ejf+sRwU9ltvn8Gj7nl7JYaGup03aCLMMUca8f
 TKZzNAcs/TrVmbc92TYld6MzPpDaZzUG6kLND+B7YJYFcD75cgSD/m2NcAU3ZnqU0geb
 LGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700759880; x=1701364680;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TvtWeM+Mwb3OHFcjh6p5CSC2tuQSRqfCHfpkw+ypzu8=;
 b=eUhwbTJW4JqviUxxzsO/hOktjn4jZhHcTiA35GDVabfAK/2Z70GeBLOW7gvTk+EDs/
 sC8KAazoOK7i8q0IQtKjoCJk3bdAFJPP/aRLaBw0zuAEt4vXmm5g7DrnyHiqz01t+geb
 h872VfAFjhsvYywBQMM/5LgHNEtGPKHtEVW5Uvk/Qd/Qq63vGB5zAUYV2XV/DsOziciN
 cQb18q9XASkLviLx7xGRFoPK8MYJkUtgu27/LZOvrLruMb1mgPepakAo9xyk/upA+bwg
 lPx1Lm0XVGLibWXvNlqaEFbv1Nh6AcjIG8fiFZWs9uBdBOaYcdAd1Les99V6QoRiL5EX
 OUlQ==
X-Gm-Message-State: AOJu0YyGwKItVqxG6BqbLTKPASfjuDIzIbY38NiR2qu+VZl7MJaoJOuj
 hFYpZFbyc5NALHUru40+0fgUEx9HFddzzUsTnIBDkb8X761LX8p0nduzixXP
X-Google-Smtp-Source: AGHT+IHFTm7FSZvqD0lj2YN30YtHE74aH+v2/rptK6u1L1yD6ssFcpTJmXMrj127JwUM0nsaUdayGhvzJsfcWj0z6Fo=
X-Received: by 2002:a05:6358:4429:b0:16d:ed11:4d19 with SMTP id
 z41-20020a056358442900b0016ded114d19mr7112461rwc.19.1700759879728; Thu, 23
 Nov 2023 09:17:59 -0800 (PST)
MIME-Version: 1.0
From: Jennifer Osarf <mariagoretti.omego.172913@unn.edu.ng>
Date: Thu, 23 Nov 2023 17:17:47 +0000
Message-ID: <CADiG0bQ_GFYSA3WmSnx1a-SpOaua7LR+aD_CYB3DmREexBxjtQ@mail.gmail.com>
Subject: cooperation for more details
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000007ad242060ad504e2"
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
Reply-To: jennifer@unitedstatesgrant.us
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000007ad242060ad504e2
Content-Type: text/plain; charset="UTF-8"

-- 

*Hello Dear.*



*  I am Mrs. Jennifer Osarf, a personal Accountant/Executive board of*

*Directors working with Texas Bank United Kingdom (London). I*

*have an interesting business proposal for you that will be of immense*

*benefit to both of us. Although this may be hard for you to believe,*

*we stand to gain a huge amount between us in a matter of days. Please*

*grant me the benefit of doubt and hear me out. I need you to signify*

*your interest by replying to my mail*



*Honestly, i have business transaction worth the sum of*

*(US$8,200,000.00) Eight Million two hundred thousand united state*

*dollars to transfer to you through proper documentation in position of*

*your own Account Most importantly, I will need you to promise to keep*

*whatever you learn from me between us even if you decide not to go*

*along with me. I will make more details available to you on receipt of*

*a positive response from you.*



*This transaction is risk-free; please urgently confirm your*

*willingness and interest to assist in this deal, I am in good faith*

*and with trust waiting for your Urgent response and maximum*

*cooperation for more details*


*Best Regards,*

*Mrs Jennifer Osarf.*

--0000000000007ad242060ad504e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><br></div><span class=3D"gmail_sign=
ature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"font-size:13px;=
color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,=
sans-serif;margin:0px;font-stretch:normal;line-height:normal;outline:none!i=
mportant"><b style=3D"outline:none!important">Hello Dear.</b></p><p style=
=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-height:no=
rmal;outline:none!important"><b style=3D"outline:none!important"><br style=
=3D"outline:none!important"></b></p><p style=3D"font-size:13px;color:rgb(29=
,34,40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;m=
argin:0px;font-stretch:normal;line-height:normal;outline:none!important"><b=
 style=3D"outline:none!important"><br style=3D"outline:none!important"></b>=
</p><p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvet=
ica Neue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;li=
ne-height:normal;outline:none!important"><b style=3D"outline:none!important=
">=C2=A0 I am Mrs. Jennifer Osarf, a personal Accountant/Executive board of=
</b></p><p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;He=
lvetica Neue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:norma=
l;line-height:normal;outline:none!important"><b style=3D"outline:none!impor=
tant">Directors working with Texas Bank United Kingdom (London). I</b></p><=
p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica N=
eue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-he=
ight:normal;outline:none!important"><b style=3D"outline:none!important">hav=
e an interesting business proposal for you that will be of immense</b></p><=
p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica N=
eue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-he=
ight:normal;outline:none!important"><b style=3D"outline:none!important">ben=
efit to both of us. Although this may be hard for you to believe,</b></p><p=
 style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-hei=
ght:normal;outline:none!important"><b style=3D"outline:none!important">we s=
tand to gain a huge amount between us in a matter of days. Please</b></p><p=
 style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-hei=
ght:normal;outline:none!important"><b style=3D"outline:none!important">gran=
t me the benefit of doubt and hear me out. I need you to signify</b></p><p =
style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neu=
e&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-heig=
ht:normal;outline:none!important"><b style=3D"outline:none!important">your =
interest by replying to my mail</b></p><p style=3D"font-size:13px;color:rgb=
(29,34,40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f;margin:0px;font-stretch:normal;line-height:normal;outline:none!important"=
><b style=3D"outline:none!important"><br style=3D"outline:none!important"><=
/b></p><p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Hel=
vetica Neue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal=
;line-height:normal;outline:none!important"><b style=3D"outline:none!import=
ant"><br style=3D"outline:none!important"></b></p><p style=3D"font-size:13p=
x;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif;margin:0px;font-stretch:normal;line-height:normal;outline:none=
!important"><b style=3D"outline:none!important">Honestly, i have business t=
ransaction worth the sum of</b></p><p style=3D"font-size:13px;color:rgb(29,=
34,40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;ma=
rgin:0px;font-stretch:normal;line-height:normal;outline:none!important"><b =
style=3D"outline:none!important">(US$8,200,000.00) Eight Million two hundre=
d thousand united state</b></p><p style=3D"font-size:13px;color:rgb(29,34,4=
0);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;margin=
:0px;font-stretch:normal;line-height:normal;outline:none!important"><b styl=
e=3D"outline:none!important">dollars to transfer to you through proper docu=
mentation in position of</b></p><p style=3D"font-size:13px;color:rgb(29,34,=
40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;margi=
n:0px;font-stretch:normal;line-height:normal;outline:none!important"><b sty=
le=3D"outline:none!important">your own Account Most importantly, I will nee=
d you to promise to keep</b></p><p style=3D"font-size:13px;color:rgb(29,34,=
40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;margi=
n:0px;font-stretch:normal;line-height:normal;outline:none!important"><b sty=
le=3D"outline:none!important">whatever you learn from me between us even if=
 you decide not to go</b></p><p style=3D"font-size:13px;color:rgb(29,34,40)=
;font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;margin:0=
px;font-stretch:normal;line-height:normal;outline:none!important"><b style=
=3D"outline:none!important">along with me. I will make more details availab=
le to you on receipt of</b></p><p style=3D"font-size:13px;color:rgb(29,34,4=
0);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;margin=
:0px;font-stretch:normal;line-height:normal;outline:none!important"><b styl=
e=3D"outline:none!important">a positive response from you.</b></p><p style=
=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-height:no=
rmal;outline:none!important"><b style=3D"outline:none!important"><br style=
=3D"outline:none!important"></b></p><p style=3D"font-size:13px;color:rgb(29=
,34,40);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;m=
argin:0px;font-stretch:normal;line-height:normal;outline:none!important"><b=
 style=3D"outline:none!important"><br style=3D"outline:none!important"></b>=
</p><p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvet=
ica Neue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;li=
ne-height:normal;outline:none!important"><b style=3D"outline:none!important=
">This transaction is risk-free; please urgently confirm your</b></p><p sty=
le=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&q=
uot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-height:=
normal;outline:none!important"><b style=3D"outline:none!important">willingn=
ess and interest to assist in this deal, I am in good faith</b></p><p style=
=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;line-height:no=
rmal;outline:none!important"><b style=3D"outline:none!important">and with t=
rust waiting for your Urgent response and maximum</b></p><p style=3D"font-s=
ize:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quot;,Helveti=
ca,Arial,sans-serif;margin:0px;font-stretch:normal;line-height:normal;outli=
ne:none!important"><b style=3D"outline:none!important">cooperation for more=
 details</b></p><p style=3D"font-size:13px;color:rgb(29,34,40);font-family:=
&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stret=
ch:normal;line-height:normal;outline:none!important"><b style=3D"outline:no=
ne!important"><br style=3D"outline:none!important"></b></p><p style=3D"font=
-size:13px;color:rgb(29,34,40);font-family:&quot;Helvetica Neue&quot;,Helve=
tica,Arial,sans-serif;margin:0px;font-stretch:normal;line-height:normal;out=
line:none!important"><b style=3D"outline:none!important">Best Regards,</b><=
/p><p style=3D"font-size:13px;color:rgb(29,34,40);font-family:&quot;Helveti=
ca Neue&quot;,Helvetica,Arial,sans-serif;margin:0px;font-stretch:normal;lin=
e-height:normal;outline:none!important"><b style=3D"outline:none!important"=
>Mrs Jennifer Osarf.</b></p></div></div></div>

--0000000000007ad242060ad504e2--
