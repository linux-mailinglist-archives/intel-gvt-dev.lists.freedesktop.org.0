Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE12CA659
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 15:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5876E573;
	Tue,  1 Dec 2020 14:55:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oo1-xc45.google.com (mail-oo1-xc45.google.com
 [IPv6:2607:f8b0:4864:20::c45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433886E575
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 14:55:23 +0000 (UTC)
Received: by mail-oo1-xc45.google.com with SMTP id y27so1055322ood.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 01 Dec 2020 06:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=Ji0pM3dt4SZmQE+xRk7pBFToPv6H1F8G2bxVBoU3dlU=;
 b=NJAUwxj3E2SGVTK0GhL5UwBUm7q+nubQaXK3ZlqSU4IGKVgFXqDoCd9dgCGEgnOPaI
 dLTR4Lpvar3cT4CoEdxL2ALg5mYBdDgB29yUar/0UPnQbzazNBUp1mkDqZIaJwjSzPNq
 KiYBQWWZlNuW6uX/+LsCED46+ETrjkvFk12lMKxG84eYRXfN8tO96w338bIch3BrnbX/
 FIJgUerlWgTGkDxxDSK49KVhXdl3jJrihEeFlxlQCZcfnHLF6RJbYFAhbirwgy9ddIRJ
 nQs0zbyfflYy1uuTLBgjePEjX6OcJpaTs/XUVl8i1jy63jy8zaMPj1kuAvbDyPvZDz5s
 eyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=Ji0pM3dt4SZmQE+xRk7pBFToPv6H1F8G2bxVBoU3dlU=;
 b=Nwksx1VNEbLoTNB4yS91ItnN2ezBvg1Dtl/hi5o7xM5dM9mhFpvUmnEv+JtI82aITO
 +7Vr7cKCNBZtSHo6w02ALkg8BLy5Mq3LJjpO7tYAQNKcMEy71f16IWRISdo/+2AyCGPQ
 0AHTE9vdGHn/I3n0kwhvHOb7CrgRA03Hf41MnAnu5lDH/NdlzN5sgmhxvckU4+f8eRk4
 YYfI9jFXg0pl3fBVYcgAiCb8B2xTRhi/d1Oz2wY6VFJwucfDH9dAU7OCy1eG8mCzrZLp
 trfJKsNzHomEtY+4gsaquh5O94JMIl4TOrRS6kghcGjuTqT7SeiTKzeROcdiqKZM95+r
 hqqQ==
X-Gm-Message-State: AOAM530v91uhFrY+MplK7RjU1F6gTTnkCjbYGydNjFBmxmceshHcYXwc
 2UURL8IfsXy8OVUYKn5apZO/DCXAjEvT3fd4RNyu
MIME-Version: 1.0
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mt2146425oie.119.1606834522078; 
 Tue, 01 Dec 2020 06:55:22 -0800 (PST)
X-No-Auto-Attachment: 1
Message-ID: <000000000000e6d7fa05b5685019@google.com>
Date: Tue, 01 Dec 2020 14:55:22 +0000
Subject: DEAR FRIEND,
From: jesstaley211@gmail.com
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
Reply-To: jesstaley211@gmail.com
Content-Type: multipart/mixed; boundary="===============2001845723=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2001845723==
Content-Type: multipart/alternative; boundary="000000000000effd0005b568504a"

--000000000000effd0005b568504a
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill in the following form:
Untitled form

To fill it in, visit:
https://docs.google.com/forms/d/e/1FAIpQLSfi2v_QwY_KtQFRSv66gKQXWIyn7sbvAx1_r8wjAat6yYUKUw/viewform?vc=0&amp;c=0&amp;w=1&amp;flr=0&amp;usp=mail_form_link

Dear,

I am Engr Uduak Walter Onnoghen, the son of the recently suspended Chief  
Justice of Nigeria. I write to make a plea to you as one of my father`s  
friends, who works with the Ministry of Finance under foreign Contractors  
payment Reconciliation Department , advised.

To be precise, my father`s case is still under investigation as such, there  
are some hidden funds which i want to keep in safer hands so that this  
Government will not get hold of it.

This is a secret. Even my father`s friends do not know i am communicating  
with you over this.

Please, if you are interested in helping me out by receiving the Fund,  
reply me (engrudukwalteronnoghen@yahoo.com ) for more details.

Thanks

Engr U.W Onnoghen.
engrudukwalteronnoghen@yahoo.com

Google Forms: Create and analyse surveys.

--000000000000effd0005b568504a
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
424242;" dir=3D"auto">Dear,<br><br>I am Engr Uduak Walter Onnoghen, the son=
 of the recently suspended Chief Justice of Nigeria. I write to make a plea=
 to you as one of my father`s friends, who works with the Ministry of Finan=
ce under foreign Contractors payment Reconciliation Department , advised.<b=
r><br>To be precise, my father`s case is still under investigation as such,=
 there are some hidden funds which i want to keep in safer hands so that th=
is Government will not get hold of it.<br><br>This is a secret. Even my fat=
her`s friends do not know i am communicating with you over this.<br><br>Ple=
ase, if you are interested in helping me out by receiving the Fund, reply m=
e (engrudukwalteronnoghen@yahoo.com ) for more details.<br><br>Thanks<br><b=
r>Engr U.W Onnoghen.<br>engrudukwalteronnoghen@yahoo.com</span></td></tr><t=
r height=3D"20px"><td></tr><tr style=3D"font-size: 20px; line-height: 24px;=
"><td dir=3D"auto"><a href=3D"https://docs.google.com/forms/d/e/1FAIpQLSfi2=
v_QwY_KtQFRSv66gKQXWIyn7sbvAx1_r8wjAat6yYUKUw/viewform?vc=3D0&amp;c=3D0&amp=
;w=3D1&amp;flr=3D0&amp;usp=3Dmail_form_link" style=3D"color: rgb(103,58,183=
); text-decoration: none; vertical-align: middle; font-weight: 500">Untitle=
d form</a><div itemprop=3D"action" itemscope itemtype=3D"http://schema.org/=
ViewAction"><meta itemprop=3D"url" content=3D"https://docs.google.com/forms=
/d/e/1FAIpQLSfi2v_QwY_KtQFRSv66gKQXWIyn7sbvAx1_r8wjAat6yYUKUw/viewform?vc=
=3D0&amp;c=3D0&amp;w=3D1&amp;flr=3D0&amp;usp=3Dmail_goto_form"><meta itempr=
op=3D"name" content=3D"Fill out form"></div></td></tr><tr height=3D"24px"><=
/tr><tr><td><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=
=3D"100%"><tbody><tr><td><a href=3D"https://docs.google.com/forms/d/e/1FAIp=
QLSfi2v_QwY_KtQFRSv66gKQXWIyn7sbvAx1_r8wjAat6yYUKUw/viewform?vc=3D0&amp;c=
=3D0&amp;w=3D1&amp;flr=3D0&amp;usp=3Dmail_form_link" style=3D"border-radius=
: 3px; box-sizing: border-box; display: inline-block; font-size: 13px; font=
-weight: 700; height: 40px; line-height: 40px; padding: 0 24px; text-align:=
 center; text-decoration: none; text-transform: uppercase; vertical-align: =
middle; color: #fff; background-color: rgb(103,58,183);" target=3D"_blank" =
rel=3D"noopener">Fill out form</a></td></tr></tbody></table></td></tr><tr h=
eight=3D"24px"></tr></tbody></table></div><table align=3D"center" cellpaddi=
ng=3D"0" cellspacing=3D"0" style=3D"max-width: 672px; min-width: 154px;" wi=
dth=3D"100%" role=3D"presentation"><tbody><tr height=3D"24px"><td></td></tr=
><tr><td><a href=3D"https://docs.google.com/forms?usp=3Dmail_form_link" sty=
le=3D"color: #424242; font-size: 13px;">Create your own Google Form</a></td=
></tr></tbody></table></div></body></html>
--000000000000effd0005b568504a--

--===============2001845723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2001845723==--
