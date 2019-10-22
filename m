Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A673E0996
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Oct 2019 18:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A096E891;
	Tue, 22 Oct 2019 16:47:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50A16E891
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Oct 2019 16:47:54 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y22so11011835pfr.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Oct 2019 09:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language:disposition-notification-to;
 bh=0zCpds5iWETionW3p7LDWd9AfeWg8+9qCo1ykVVJVXg=;
 b=RHNAJLajLi/EScfYDG3gNI/DLh7ztXBYdul0L49gmveD0MfIXOs9sTv4sBuJKSwIQm
 aVKV6wm0Ulxu1kfc9IHd0m1phGADAiyd8tyw+HRYsiY03L8CnTbUmecT4IwCc/qKixi2
 LQA2GZ5AVkbSFeO3WFdzHQ2G1EUs2gomNrw3bBxRI/72Z+23dv3uSP1A/ZY3m42DyduU
 HokNE03g47Jzd5n6ICBSRvo77hNX8/qUcnrDabwi7SgtB9gSgxAbNBUqES/32ZROhuQE
 xjXdfBawnfDEfqpJ7IxbzBe0qdRm0S2lXPiVtvjrb3DdxUs+O/w2KPSs+H23KwaDHhTW
 +MnA==
X-Gm-Message-State: APjAAAVVkxehumwf9SFFoY0JFyX8Ib4H5RrRYXMO5jLj/fR9zhZGGY/u
 69TaTe1nyB1NyUBjrD1AfgO0Sbadb+c=
X-Google-Smtp-Source: APXvYqy76+m3nXDgS5eHOLpFFuocmGOTMyVTmVZEJKnXT9Gn3VweVeeJMUXGiKS1JPUybThsHOc7Mw==
X-Received: by 2002:a63:778f:: with SMTP id s137mr4769848pgc.147.1571762874012; 
 Tue, 22 Oct 2019 09:47:54 -0700 (PDT)
Received: from SNBS17 ([183.82.19.142])
 by smtp.gmail.com with ESMTPSA id o123sm6889702pfg.161.2019.10.22.09.47.52
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Oct 2019 09:47:53 -0700 (PDT)
From: "Angela Wang" <angela@technologydatahub.com>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: 10Gen
Date: Tue, 22 Oct 2019 12:49:05 -0400
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAACr8CvNeCztNrsWvpezUrLLCgAAAEAAAAGVeHrEPSaVHs05DV9wFjtgBAAAAAA==@technologydatahub.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWI+JnpU1/mjnnuQleI/lUBctxDkQ==
Content-Language: en-us
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technologydatahub-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language:disposition-notification-to;
 bh=0zCpds5iWETionW3p7LDWd9AfeWg8+9qCo1ykVVJVXg=;
 b=YKOeiXesfr1qbGP1yLES5ZaI2NSFflExJDz0KOsN0+w9a10pZmMFFheMoTCHuAjMRP
 lp96Pc9Dh/4aZEbmSlWaSC6RJ/Rv9r4FQ7jC+TN5QGehyPRwJPkW3q5RWk/UnNpimLdz
 Nw7HsfPUbcJ+b2CxQXMfYUyTR4LrtifP9oXb9BVYMCa7gRPFlOaQDgPr0pwBZrr8bi+x
 Ep3fU5WRxga+ZAG0nRpOXEzcAd0OL1idm/gbycmxoA45NWKeayC16TUWSXZdAS6wUlvx
 5VTvp8XeRqCSVfRy3NvTEuOBi2rRq8AzDiBqYe6MCIiGYD4czG2eYuq3J+WlOwL41vB8
 o68Q==
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0277547083=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is a multipart message in MIME format.

--===============0277547083==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_19F0_01D588D7.194758B0"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_19F0_01D588D7.194758B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

I would like to know if you are interested in acquiring a list of customers
that use 10Gen Software Users.

 

Our data file contains 15plus points with Email address, Contact Numbers and
Contact profiles.

 

We do have decision maker's data from Industry like: Manufacturing and
Logistics, Retail, Healthcare, Media and Entertainment and
Telecommunication.

 

Please let me know If you like to see sample file as per your requirements.

 

Note: - As per your requirement, I can break down the list.

 

---

 

Thanking you,

Angela Wang.

Manager | Demand Generation

 

Note: Before saying no to our product please check the quality and quantity
of our product.

 


------=_NextPart_000_19F0_01D588D7.194758B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;
	position:relative;
	top:0pt;
	mso-text-raise:0pt;
	letter-spacing:0pt;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'>Hi,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>I would like =
to know if you are interested in acquiring a list of customers that use =
<b>10Gen Software Users.</b><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>Our data =
file contains 15plus points with Email address, Contact Numbers and =
Contact profiles.<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>We do have =
decision maker&#8217;s data from Industry like: <b>Manufacturing and =
Logistics, Retail, Healthcare, Media and Entertainment and =
Telecommunication.</b><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>Please let =
me know If you like to see <b>sample file</b> as per your =
requirements.<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>Note: - As =
per your requirement, I can break down the list.<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'>---<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>Thanking =
you,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><b><span style=3D'color:#1F4E79'>Angela =
Wang.<o:p></o:p></span></b></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F4E79'>Manager | =
Demand Generation<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt;color:#1F4E79'>Note: =
Before saying no to our product please check the quality and quantity of =
our product.<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_19F0_01D588D7.194758B0--


--===============0277547083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0277547083==--

