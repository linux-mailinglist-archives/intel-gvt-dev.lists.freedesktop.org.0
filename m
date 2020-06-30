Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75B20F3AE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Jun 2020 13:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BCD6E0EC;
	Tue, 30 Jun 2020 11:39:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jun 2020 11:39:49 UTC
Received: from mail01.rohde-schwarz.com (mail01.rohde-schwarz.com
 [80.246.32.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3196E0EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Jun 2020 11:39:49 +0000 (UTC)
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.595.3; Tue, 30 Jun 2020
 13:24:45 +0200
Subject: Questions on Intel UHD 520 / 620 Video BIOS
MIME-Version: 1.0
Received: from GMU418.rsint.net ([10.0.230.144])
 by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Jun 2020 13:24:40 +0200 (CEST)
Received: from GMU018.rsint.net (10.0.2.46) by GMU418.rsint.net (10.0.230.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1979.3; Tue, 30 Jun
 2020 13:24:40 +0200
Received: from GMU018.rsint.net (10.0.2.46) by GMU018.rsint.net (10.0.2.46)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 30
 Jun 2020 13:24:39 +0200
Received: from GMU018.rsint.net ([fe80::69f2:eb02:35c8:9a4a]) by
 GMU018.rsint.net ([fe80::69f2:eb02:35c8:9a4a%12]) with mapi id
 15.01.1979.003; Tue, 30 Jun 2020 13:24:39 +0200
From: Clemens Schulz <Clemens.Schulz@rohde-schwarz.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Thread-Topic: Questions on Intel UHD 520 / 620 Video BIOS /cr/
Thread-Index: AdZO0Qod1+Ic9TrfR1iibPM5TS+jzQ==
Date: Tue, 30 Jun 2020 11:24:39 +0000
Message-ID: <59f5d95acf0149bc80420f03316cbf3c@rohde-schwarz.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-rus_sensitivity: 20
hvs-classificationid: da48e46a-4823-4cc6-82ac-f236c0a43172
hvs-prefix: R_S
x-originating-ip: [10.0.9.40]
X-IQAV: YES
X-GBS-PROC: 2ElixKwQFUxMfuz99fpopvXqA+1zutX9d33Zw1SBpNo=
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
Content-Type: multipart/mixed; boundary="===============0235752627=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0235752627==
Content-Type: multipart/related;
	boundary="_004_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_";
	type="multipart/alternative"
Content-Language: en-US

--_004_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_
Content-Type: multipart/alternative;
	boundary="_000_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_"

--_000_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everybody,

we are currently running a project where we are using GVT-d technology toge=
ther with KVM/Qemu in order to passtrough the hosts Intel integrated graphi=
cs card from a Linux based OS (and Gen6 Intel Core-i CPUs or later) to a Wi=
ndows 10 based VM. This works more or less good on most of the machines. Ho=
wever, we are facing multiple issues from time to time regarding the used V=
ideo BIOS we need to specify while configuring KVM and video passthrough. A=
s those questions are pretty much specific to VBIOS and what kind of settin=
gs in the binary, etc. I would like to know if there is some kind of contac=
t person for such questions or if I should write my questions right here in=
 this mailing list. Would be really great to get some kind of hint here.

Best Regards,

Clemens Alexander Schulz
Director Desktop Security

Rohde & Schwarz Cybersecurity GmbH
Ettore-Bugatti-Str. 6-14 | 51149 Cologne | Germany
Phone: +49 89 4129 208161 | Mobile: +49 151 4065 0843
Internet: www.rohde-schwarz.com/cybersecurity<http://www.rohde-schwarz.com/=
cybersecurity>

[cid:image001.png@01D5FBC7.7C33F060]

Managing Director: Dr. Falk Herrmann (CEO)
Chairman of the Supervisory Board: Ralf Koenzen
Company's Place of Business: Munich
Commercial Register No.: HRB 160333 | VAT Identification No.: DE 295078969
WEEE Register No.: DE 138 891 79




Content provided within this e-mail including any attachments, is for the u=
se of the intended recipients and may contain Rohde & Schwarz company restr=
icted information. Any unauthorized use, disclosure, or distribution of thi=
s communication in whole or in part is strictly prohibited. If you are not =
the intended recipient, please notify the sender by reply email or by telep=
hone and delete the communication in its entirety.
--_000_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:"Arial Unicode MS";
=09panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
=09{font-family:"Arial Black";
=09panose-1:2 11 10 4 2 1 2 2 2 4;}
@font-face
=09{font-family:"\@Arial Unicode MS";
=09panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:0cm;
=09line-height:112%;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
h1
=09{mso-style-priority:12;
=09mso-style-link:"Heading 1 Char";
=09margin-top:18.0pt;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:21.25pt;
=09mso-add-space:auto;
=09text-indent:-21.25pt;
=09line-height:112%;
=09page-break-after:avoid;
=09mso-list:l5 level1 lfo1;
=09font-size:20.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09mso-fareast-language:EN-US;}
h1.CxSpFirst
=09{mso-style-priority:12;
=09mso-style-link:"Heading 1 Char";
=09mso-style-type:export-only;
=09margin-top:18.0pt;
=09margin-right:0cm;
=09margin-bottom:0cm;
=09margin-left:21.25pt;
=09margin-bottom:.0001pt;
=09mso-add-space:auto;
=09text-indent:-21.25pt;
=09line-height:112%;
=09page-break-after:avoid;
=09mso-list:l5 level1 lfo1;
=09font-size:20.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09mso-fareast-language:EN-US;}
h1.CxSpMiddle
=09{mso-style-priority:12;
=09mso-style-link:"Heading 1 Char";
=09mso-style-type:export-only;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:0cm;
=09margin-left:21.25pt;
=09margin-bottom:.0001pt;
=09mso-add-space:auto;
=09text-indent:-21.25pt;
=09line-height:112%;
=09page-break-after:avoid;
=09mso-list:l5 level1 lfo1;
=09font-size:20.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09mso-fareast-language:EN-US;}
h1.CxSpLast
=09{mso-style-priority:12;
=09mso-style-link:"Heading 1 Char";
=09mso-style-type:export-only;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:21.25pt;
=09mso-add-space:auto;
=09text-indent:-21.25pt;
=09line-height:112%;
=09page-break-after:avoid;
=09mso-list:l5 level1 lfo1;
=09font-size:20.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09mso-fareast-language:EN-US;}
h2
=09{mso-style-priority:9;
=09mso-style-link:"Heading 2 Char";
=09margin-top:2.0pt;
=09margin-right:0cm;
=09margin-bottom:0cm;
=09margin-left:0cm;
=09margin-bottom:.0001pt;
=09line-height:112%;
=09page-break-after:avoid;
=09font-size:13.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#002E58;
=09mso-fareast-language:EN-US;
=09font-weight:normal;}
p.MsoListBullet, li.MsoListBullet, div.MsoListBullet
=09{mso-style-priority:78;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:21.25pt;
=09text-indent:-21.25pt;
=09line-height:112%;
=09mso-list:l8 level1 lfo14;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
p.MsoListBullet2, li.MsoListBullet2, div.MsoListBullet2
=09{mso-style-priority:78;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:42.5pt;
=09text-indent:-21.25pt;
=09line-height:112%;
=09mso-list:l8 level2 lfo14;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
p.MsoListBullet3, li.MsoListBullet3, div.MsoListBullet3
=09{mso-style-priority:78;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:63.75pt;
=09text-indent:-21.25pt;
=09line-height:112%;
=09mso-list:l8 level3 lfo14;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
p.MsoListBullet4, li.MsoListBullet4, div.MsoListBullet4
=09{mso-style-priority:78;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:85.0pt;
=09text-indent:-21.25pt;
=09line-height:112%;
=09mso-list:l8 level4 lfo14;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
p.MsoListBullet5, li.MsoListBullet5, div.MsoListBullet5
=09{mso-style-priority:78;
=09margin-top:0cm;
=09margin-right:0cm;
=09margin-bottom:6.0pt;
=09margin-left:106.25pt;
=09text-indent:-21.25pt;
=09line-height:112%;
=09mso-list:l8 level5 lfo14;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
p.MsoTitle, li.MsoTitle, div.MsoTitle
=09{mso-style-priority:10;
=09mso-style-link:"Title Char";
=09margin-top:18.0pt;
=09margin-right:102.05pt;
=09margin-bottom:6.0pt;
=09margin-left:0cm;
=09mso-add-space:auto;
=09line-height:112%;
=09font-size:26.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09text-transform:uppercase;
=09mso-fareast-language:EN-US;
=09font-weight:bold;}
p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst
=09{mso-style-priority:10;
=09mso-style-link:"Title Char";
=09mso-style-type:export-only;
=09margin-top:18.0pt;
=09margin-right:102.05pt;
=09margin-bottom:0cm;
=09margin-left:0cm;
=09margin-bottom:.0001pt;
=09mso-add-space:auto;
=09line-height:112%;
=09font-size:26.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09text-transform:uppercase;
=09mso-fareast-language:EN-US;
=09font-weight:bold;}
p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle
=09{mso-style-priority:10;
=09mso-style-link:"Title Char";
=09mso-style-type:export-only;
=09margin-top:0cm;
=09margin-right:102.05pt;
=09margin-bottom:0cm;
=09margin-left:0cm;
=09margin-bottom:.0001pt;
=09mso-add-space:auto;
=09line-height:112%;
=09font-size:26.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09text-transform:uppercase;
=09mso-fareast-language:EN-US;
=09font-weight:bold;}
p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast
=09{mso-style-priority:10;
=09mso-style-link:"Title Char";
=09mso-style-type:export-only;
=09margin-top:0cm;
=09margin-right:102.05pt;
=09margin-bottom:6.0pt;
=09margin-left:0cm;
=09mso-add-space:auto;
=09line-height:112%;
=09font-size:26.0pt;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09text-transform:uppercase;
=09mso-fareast-language:EN-US;
=09font-weight:bold;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#009DEC;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#933973;
=09text-decoration:underline;}
span.TitleChar
=09{mso-style-name:"Title Char";
=09mso-style-priority:10;
=09mso-style-link:Title;
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09text-transform:uppercase;
=09font-weight:bold;}
span.Heading1Char
=09{mso-style-name:"Heading 1 Char";
=09mso-style-priority:12;
=09mso-style-link:"Heading 1";
=09font-family:"Arial Narrow",sans-serif;
=09color:#003E76;
=09font-weight:bold;}
span.Heading2Char
=09{mso-style-name:"Heading 2 Char";
=09mso-style-priority:9;
=09mso-style-link:"Heading 2";
=09font-family:"Arial Narrow",sans-serif;
=09color:#002E58;}
span.EmailStyle27
=09{mso-style-type:personal-compose;
=09font-family:"Arial",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;
=09font-family:"Arial",sans-serif;
=09mso-fareast-language:EN-US;}
.MsoPapDefault
=09{mso-style-type:export-only;
=09margin-bottom:6.0pt;
=09line-height:112%;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
=09{page:WordSection1;}
/* List Definitions */
@list l0
=09{mso-list-id:-128;
=09mso-list-type:simple;
=09mso-list-template-ids:-1065161782;}
@list l0:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:74.6pt;
=09mso-level-number-position:left;
=09margin-left:74.6pt;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l1
=09{mso-list-id:-127;
=09mso-list-type:simple;
=09mso-list-template-ids:-1206225484;}
@list l1:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:60.45pt;
=09mso-level-number-position:left;
=09margin-left:60.45pt;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l2
=09{mso-list-id:-126;
=09mso-list-type:simple;
=09mso-list-template-ids:-1263516298;}
@list l2:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:46.3pt;
=09mso-level-number-position:left;
=09margin-left:46.3pt;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l3
=09{mso-list-id:-125;
=09mso-list-type:simple;
=09mso-list-template-ids:753556074;}
@list l3:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:32.15pt;
=09mso-level-number-position:left;
=09margin-left:32.15pt;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l4
=09{mso-list-id:-119;
=09mso-list-type:simple;
=09mso-list-template-ids:-1762648096;}
@list l4:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:18.0pt;
=09mso-level-number-position:left;
=09margin-left:18.0pt;
=09text-indent:-18.0pt;
=09font-family:Symbol;}
@list l5
=09{mso-list-id:628360796;
=09mso-list-template-ids:-650887362;}
@list l5:level1
=09{mso-level-style-link:"Heading 1";
=09mso-level-text:%1;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:21.25pt;
=09text-indent:-21.25pt;}
@list l5:level2
=09{mso-level-text:"%1\.%2";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:29.75pt;
=09text-indent:-29.75pt;}
@list l5:level3
=09{mso-level-text:"%1\.%2\.%3";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:38.25pt;
=09text-indent:-38.25pt;}
@list l5:level4
=09{mso-level-text:"%1\.%2\.%3\.%4";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:46.8pt;
=09text-indent:-46.8pt;}
@list l5:level5
=09{mso-level-text:"%1\.%2\.%3\.%4\.%5";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:55.3pt;
=09text-indent:-55.3pt;}
@list l5:level6
=09{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:63.8pt;
=09text-indent:-63.8pt;}
@list l5:level7
=09{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:72.3pt;
=09text-indent:-72.3pt;}
@list l5:level8
=09{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7\.%8";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:80.8pt;
=09text-indent:-80.8pt;}
@list l5:level9
=09{mso-level-text:"%1\.%2\.%3\.%4\.%5\.%6\.%7\.%8\.%9";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09margin-left:89.3pt;
=09text-indent:-89.3pt;}
@list l6
=09{mso-list-id:632638006;
=09mso-list-template-ids:-1039730736;}
@list l6:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\0131;
=09mso-level-tab-stop:21.25pt;
=09mso-level-number-position:left;
=09margin-left:21.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09mso-ascii-font-family:"Arial Black";
=09mso-hansi-font-family:"Arial Black";
=09mso-bidi-font-family:"Arial Black";}
@list l6:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:42.55pt;
=09mso-level-number-position:left;
=09margin-left:42.5pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:63.8pt;
=09mso-level-number-position:left;
=09margin-left:63.75pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:3.0cm;
=09mso-level-number-position:left;
=09margin-left:85.0pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:106.3pt;
=09mso-level-number-position:left;
=09margin-left:106.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:127.6pt;
=09mso-level-number-position:left;
=09margin-left:127.5pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:148.85pt;
=09mso-level-number-position:left;
=09margin-left:148.75pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:6.0cm;
=09mso-level-number-position:left;
=09margin-left:170.0pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l6:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\25AA;
=09mso-level-tab-stop:191.35pt;
=09mso-level-number-position:left;
=09margin-left:191.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09mso-ascii-font-family:Arial;
=09mso-hansi-font-family:Arial;
=09mso-bidi-font-family:Arial;}
@list l7
=09{mso-list-id:803548800;
=09mso-list-template-ids:614502010;}
@list l7:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\25BA;
=09mso-level-tab-stop:21.25pt;
=09mso-level-number-position:left;
=09margin-left:21.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l7:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:42.55pt;
=09mso-level-number-position:left;
=09margin-left:42.5pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l7:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:63.8pt;
=09mso-level-number-position:left;
=09margin-left:63.75pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l7:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:3.0cm;
=09mso-level-number-position:left;
=09margin-left:85.0pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l7:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:106.3pt;
=09mso-level-number-position:left;
=09margin-left:106.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l7:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:127.6pt;
=09mso-level-number-position:left;
=09margin-left:127.5pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l7:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:148.85pt;
=09mso-level-number-position:left;
=09margin-left:148.75pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l7:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:6.0cm;
=09mso-level-number-position:left;
=09margin-left:170.0pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l7:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:191.35pt;
=09mso-level-number-position:left;
=09margin-left:191.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l8
=09{mso-list-id:874930355;
=09mso-list-template-ids:453293872;
=09mso-list-style-priority:99;
=09mso-list-style-name:"R&S Bullets";}
@list l8:level1
=09{mso-level-number-format:bullet;
=09mso-level-style-link:"List Bullet";
=09mso-level-text:\25BA;
=09mso-level-tab-stop:21.25pt;
=09mso-level-number-position:left;
=09margin-left:21.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l8:level2
=09{mso-level-number-format:bullet;
=09mso-level-style-link:"List Bullet 2";
=09mso-level-text:\2500;
=09mso-level-tab-stop:42.55pt;
=09mso-level-number-position:left;
=09margin-left:42.5pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l8:level3
=09{mso-level-number-format:bullet;
=09mso-level-style-link:"List Bullet 3";
=09mso-level-text:\2500;
=09mso-level-tab-stop:63.8pt;
=09mso-level-number-position:left;
=09margin-left:63.75pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l8:level4
=09{mso-level-number-format:bullet;
=09mso-level-style-link:"List Bullet 4";
=09mso-level-text:\2500;
=09mso-level-tab-stop:3.0cm;
=09mso-level-number-position:left;
=09margin-left:85.0pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l8:level5
=09{mso-level-number-format:bullet;
=09mso-level-style-link:"List Bullet 5";
=09mso-level-text:\2500;
=09mso-level-tab-stop:106.3pt;
=09mso-level-number-position:left;
=09margin-left:106.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;}
@list l8:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:127.6pt;
=09mso-level-number-position:left;
=09margin-left:127.5pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l8:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:148.85pt;
=09mso-level-number-position:left;
=09margin-left:148.75pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l8:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:6.0cm;
=09mso-level-number-position:left;
=09margin-left:170.0pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
@list l8:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\2500;
=09mso-level-tab-stop:191.35pt;
=09mso-level-number-position:left;
=09margin-left:191.25pt;
=09text-indent:-21.25pt;
=09mso-ansi-font-size:9.0pt;
=09mso-bidi-font-size:9.0pt;
=09font-family:"Arial",sans-serif;
=09mso-bidi-font-family:"Times New Roman";}
ol
=09{margin-bottom:0cm;}
ul
=09{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#009DEC" vlink=3D"#933973">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"line-height:112%">Hi e=
verybody,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"line-height:112%"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"line-height:112%">we a=
re currently running a project where we are using GVT-d technology together=
 with KVM/Qemu in order to passtrough the hosts Intel integrated graphics c=
ard from a Linux based OS (and Gen6 Intel
 Core-i CPUs or later) to a Windows 10 based VM. This works more or less go=
od on most of the machines. However, we are facing multiple issues from tim=
e to time regarding the used Video BIOS we need to specify while configurin=
g KVM and video passthrough. As
 those questions are pretty much specific to VBIOS and what kind of setting=
s in the binary, etc. I would like to know if there is some kind of contact=
 person for such questions or if I should write my questions right here in =
this mailing list. Would be really
 great to get some kind of hint here.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"line-height:112%"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"line-height:112%">Best=
 Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"line-height:112%"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<b><span lang=3D"EN-US" style=3D"color:#009DEC;text-transform:uppercase;mso=
-fareast-language:DE">Clemens Alexander Schulz<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE">Direct=
or Desktop Security<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE">Rohde =
&amp; Schwarz Cybersecurity GmbH<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE">Ettore=
-Bugatti-Str. 6-14 | 51149 Cologne | Germany<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE">Phone:=
 &#43;49 89 4129 208161 | Mobile: &#43;49 151 4065 0843<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE">Intern=
et: </span>
<span style=3D"color:#003C74;mso-fareast-language:DE"><a href=3D"http://www=
.rohde-schwarz.com/cybersecurity"><span lang=3D"EN-US" style=3D"color:#009D=
EC">www.rohde-schwarz.com/cybersecurity</span></a></span><span lang=3D"EN-U=
S" style=3D"color:#003C74;mso-fareast-language:DE"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#003C74;mso-fareast-language:DE"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span style=3D"color:black;mso-fareast-language:DE"><img border=3D"0" width=
=3D"280" height=3D"70" style=3D"width:2.9166in;height:.7291in" id=3D"Pictur=
e_x0020_1" src=3D"cid:image001.png@01D64DE8.650C1390" alt=3D"cid:image001.p=
ng@01D5FBC7.7C33F060"></span><span style=3D"color:#B5B9BC;mso-fareast-langu=
age:DE"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span style=3D"color:#B5B9BC;mso-fareast-language:DE"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#B5B9BC;mso-fareast-language:DE">Managi=
ng Director: Dr. Falk Herrmann (CEO)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#B5B9BC;mso-fareast-language:DE">Chairm=
an of the Supervisory Board: Ralf Koenzen<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#B5B9BC;mso-fareast-language:DE">Compan=
y&#8216;s Place of Business: Munich
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span lang=3D"EN-US" style=3D"color:#B5B9BC;mso-fareast-language:DE">Commer=
cial Register No.: HRB 160333 | VAT Identification No.: DE 295078969
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal">
<span style=3D"color:#B5B9BC;mso-fareast-language:DE">WEEE Register No.: DE=
 138 891 79</span><span style=3D"color:black;mso-fareast-language:DE"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<br/><br/><p style=3D"font-size: 8.0pt;">Content provided within this e-mai=
l including any attachments, is for the use of the intended recipients and =
may contain Rohde & Schwarz company restricted information. Any unauthorize=
d use, disclosure, or distribution of this communication in whole or in par=
t is strictly prohibited. If you are not the intended recipient, please not=
ify the sender by reply email or by telephone and delete the communication =
in its entirety.</p></body>
</html>

--_000_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_--

--_004_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=9150;
	creation-date="Tue, 30 Jun 2020 11:24:39 GMT";
	modification-date="Tue, 30 Jun 2020 11:24:39 GMT"
Content-ID: <image001.png@01D64DE8.650C1390>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAARgAAABGCAYAAAAXfYu/AAAKN2lDQ1BzUkdCIElFQzYxOTY2LTIu
MQAAeJydlndUU9kWh8+9N71QkhCKlNBraFICSA29SJEuKjEJEErAkAAiNkRUcERRkaYIMijggKND
kbEiioUBUbHrBBlE1HFwFBuWSWStGd+8ee/Nm98f935rn73P3Wfvfda6AJD8gwXCTFgJgAyhWBTh
58WIjYtnYAcBDPAAA2wA4HCzs0IW+EYCmQJ82IxsmRP4F726DiD5+yrTP4zBAP+flLlZIjEAUJiM
5/L42VwZF8k4PVecJbdPyZi2NE3OMErOIlmCMlaTc/IsW3z2mWUPOfMyhDwZy3PO4mXw5Nwn4405
Er6MkWAZF+cI+LkyviZjg3RJhkDGb+SxGXxONgAoktwu5nNTZGwtY5IoMoIt43kA4EjJX/DSL1jM
zxPLD8XOzFouEiSniBkmXFOGjZMTi+HPz03ni8XMMA43jSPiMdiZGVkc4XIAZs/8WRR5bRmyIjvY
ODk4MG0tbb4o1H9d/JuS93aWXoR/7hlEH/jD9ld+mQ0AsKZltdn6h21pFQBd6wFQu/2HzWAvAIqy
vnUOfXEeunxeUsTiLGcrq9zcXEsBn2spL+jv+p8Of0NffM9Svt3v5WF485M4knQxQ143bmZ6pkTE
yM7icPkM5p+H+B8H/nUeFhH8JL6IL5RFRMumTCBMlrVbyBOIBZlChkD4n5r4D8P+pNm5lona+BHQ
llgCpSEaQH4eACgqESAJe2Qr0O99C8ZHA/nNi9GZmJ37z4L+fVe4TP7IFiR/jmNHRDK4ElHO7Jr8
WgI0IABFQAPqQBvoAxPABLbAEbgAD+ADAkEoiARxYDHgghSQAUQgFxSAtaAYlIKtYCeoBnWgETSD
NnAYdIFj4DQ4By6By2AE3AFSMA6egCnwCsxAEISFyBAVUod0IEPIHLKFWJAb5AMFQxFQHJQIJUNC
SAIVQOugUqgcqobqoWboW+godBq6AA1Dt6BRaBL6FXoHIzAJpsFasBFsBbNgTzgIjoQXwcnwMjgf
LoK3wJVwA3wQ7oRPw5fgEVgKP4GnEYAQETqiizARFsJGQpF4JAkRIauQEqQCaUDakB6kH7mKSJGn
yFsUBkVFMVBMlAvKHxWF4qKWoVahNqOqUQdQnag+1FXUKGoK9RFNRmuizdHO6AB0LDoZnYsuRleg
m9Ad6LPoEfQ4+hUGg6FjjDGOGH9MHCYVswKzGbMb0445hRnGjGGmsVisOtYc64oNxXKwYmwxtgp7
EHsSewU7jn2DI+J0cLY4X1w8TogrxFXgWnAncFdwE7gZvBLeEO+MD8Xz8MvxZfhGfA9+CD+OnyEo
E4wJroRIQiphLaGS0EY4S7hLeEEkEvWITsRwooC4hlhJPEQ8TxwlviVRSGYkNimBJCFtIe0nnSLd
Ir0gk8lGZA9yPFlM3kJuJp8h3ye/UaAqWCoEKPAUVivUKHQqXFF4pohXNFT0VFysmK9YoXhEcUjx
qRJeyUiJrcRRWqVUo3RU6YbStDJV2UY5VDlDebNyi/IF5UcULMWI4kPhUYoo+yhnKGNUhKpPZVO5
1HXURupZ6jgNQzOmBdBSaaW0b2iDtCkVioqdSrRKnkqNynEVKR2hG9ED6On0Mvph+nX6O1UtVU9V
vuom1TbVK6qv1eaoeajx1UrU2tVG1N6pM9R91NPUt6l3qd/TQGmYaYRr5Grs0Tir8XQObY7LHO6c
kjmH59zWhDXNNCM0V2ju0xzQnNbS1vLTytKq0jqj9VSbru2hnaq9Q/uE9qQOVcdNR6CzQ+ekzmOG
CsOTkc6oZPQxpnQ1df11Jbr1uoO6M3rGelF6hXrtevf0Cfos/ST9Hfq9+lMGOgYhBgUGrQa3DfGG
LMMUw12G/YavjYyNYow2GHUZPTJWMw4wzjduNb5rQjZxN1lm0mByzRRjyjJNM91tetkMNrM3SzGr
MRsyh80dzAXmu82HLdAWThZCiwaLG0wS05OZw2xljlrSLYMtCy27LJ9ZGVjFW22z6rf6aG1vnW7d
aH3HhmITaFNo02Pzq62ZLde2xvbaXPJc37mr53bPfW5nbse322N3055qH2K/wb7X/oODo4PIoc1h
0tHAMdGx1vEGi8YKY21mnXdCO3k5rXY65vTW2cFZ7HzY+RcXpkuaS4vLo3nG8/jzGueNueq5clzr
XaVuDLdEt71uUnddd457g/sDD30PnkeTx4SnqWeq50HPZ17WXiKvDq/XbGf2SvYpb8Tbz7vEe9CH
4hPlU+1z31fPN9m31XfKz95vhd8pf7R/kP82/xsBWgHcgOaAqUDHwJWBfUGkoAVB1UEPgs2CRcE9
IXBIYMj2kLvzDecL53eFgtCA0O2h98KMw5aFfR+OCQ8Lrwl/GGETURDRv4C6YMmClgWvIr0iyyLv
RJlESaJ6oxWjE6Kbo1/HeMeUx0hjrWJXxl6K04gTxHXHY+Oj45vipxf6LNy5cDzBPqE44foi40V5
iy4s1licvvj4EsUlnCVHEtGJMYktie85oZwGzvTSgKW1S6e4bO4u7hOeB28Hb5Lvyi/nTyS5JpUn
PUp2Td6ePJninlKR8lTAFlQLnqf6p9alvk4LTduf9ik9Jr09A5eRmHFUSBGmCfsytTPzMoezzLOK
s6TLnJftXDYlChI1ZUPZi7K7xTTZz9SAxESyXjKa45ZTk/MmNzr3SJ5ynjBvYLnZ8k3LJ/J9879e
gVrBXdFboFuwtmB0pefK+lXQqqWrelfrry5aPb7Gb82BtYS1aWt/KLQuLC98uS5mXU+RVtGaorH1
futbixWKRcU3NrhsqNuI2ijYOLhp7qaqTR9LeCUXS61LK0rfb+ZuvviVzVeVX33akrRlsMyhbM9W
zFbh1uvb3LcdKFcuzy8f2x6yvXMHY0fJjpc7l+y8UGFXUbeLsEuyS1oZXNldZVC1tep9dUr1SI1X
TXutZu2m2te7ebuv7PHY01anVVda926vYO/Ner/6zgajhop9mH05+x42Rjf2f836urlJo6m06cN+
4X7pgYgDfc2Ozc0tmi1lrXCrpHXyYMLBy994f9Pdxmyrb6e3lx4ChySHHn+b+O31w0GHe4+wjrR9
Z/hdbQe1o6QT6lzeOdWV0iXtjusePhp4tLfHpafje8vv9x/TPVZzXOV42QnCiaITn07mn5w+lXXq
6enk02O9S3rvnIk9c60vvG/wbNDZ8+d8z53p9+w/ed71/LELzheOXmRd7LrkcKlzwH6g4wf7HzoG
HQY7hxyHui87Xe4Znjd84or7ldNXva+euxZw7dLI/JHh61HXb95IuCG9ybv56Fb6ree3c27P3Flz
F3235J7SvYr7mvcbfjT9sV3qID0+6j068GDBgztj3LEnP2X/9H686CH5YcWEzkTzI9tHxyZ9Jy8/
Xvh4/EnWk5mnxT8r/1z7zOTZd794/DIwFTs1/lz0/NOvm1+ov9j/0u5l73TY9P1XGa9mXpe8UX9z
4C3rbf+7mHcTM7nvse8rP5h+6PkY9PHup4xPn34D94Tz+49wZioAAAAJcEhZcwAADsMAAA7DAcdv
qGQAABktSURBVHic7Z0JfBvFvcdnZiWfsZMQP0JIKRQSIIaEhHLlPQolHyBQKGBZviQ7NtBw8zjD
XUxoaSlQCARIHoYkRrJiy7IcoEBzlJTrcUNLIEATPilXIIQjwbHjWNqd9/+vduXVeleWY8W2ePP7
fKRdzc7OzszOfOceOTjnREhI6Mehptb26wnhY71lrhuG2y8ox3B7QEhIKD1qCobnUUrvJIQCaMJk
JEBGAEZI6EcgqLlcC3C5S/9NCb1+JEBGAEZIKMOlwoWQu83mIwEyAjBCQhksO7joGm7ICMAICWWo
bODyLXy64TNRNxhOyAjACAlloGzg8p0s81MIi3ZK1PkcMUEmEAxzT7nrxqH0pwCMkFCGKQlcTq6p
dL2DP3zB4CyJOtYCWvaN26D0BoAMGUrICMAICWWQUoELqqa8/F8AmZOGGzICMEJCGSI7uHBOTjHC
RddIgIwAjJBQBigQbL+GUmu4eMtL3ra7b7ghIwAjJDTChXAhlNxjMu4XLrqGEzICMEJCI1iDhYuu
4YKMAIyQ0AhVuuCiKxlkmlrDirfMdfNg/WyWAIyQ0AhUuuGiyw4ylNCbtHkyt+y2py0kACMkNMLk
b227ilGWdrjoSlKTuVlrLqUNMgIwQkIjSCpcCLvXZPy9oiizqytKBw0XXUMFGQEYIaERoiRwORXg
8ma6n4eQaWoKzaJZ7Lk9BRkBGCGhEaBAsP1KaBaZ4YL6iDF2YaC1/UKjITSXugklnysyX2U1yS5V
eb3uj/YkZARghISGWQgXgMV9NpeP0z4JojR2lCR6Z1Nr+8pol1xXW+v+aneev3Ej2TRpCg2Dm5eZ
HjJoyAjACAkNo2zggh267ZDhz0/FDWDNbGee9JLP5zu2pqbm24E8vynYfsTkYqkRTo+wdnxwkBGA
ERIaJtnARe3QpZQdA+cpAUbTQVLOqDvgeFHKz28Nz6WUPgCnOUktAmSglsS9ZSW/HYB/VAnACAkN
g5LARe3QhZrFMcYLnJD3o10/HI/njDGJ5ORPk4gKh8MN1moWLAhddeWV7p3Jnj1//nzHpCnT7gO4
XGZxuZsTvogSWgnnE3RDqCXdApAhA4WMAIyQ0BBLg8tAR4vk2trabYbfawOBkIc4pXcNZnlFE+hh
cLQdcWpoaMibXDy1BU7PtLj8JonItV6Pe31jc/gRp0Rx06pBQUYARkhoCGWACzUY79ZQdCTSucHp
LEww44yOsX12IFCYP6boGTj9L4vLCzesl6+tr3f34I/aSteHAJlZg4WMAIyQ0BApnXBBOXMKTzeb
MU63WtldsiS0V05B7ko4Pcp0KcI5ucRbXvKo+Z50QEYARkhoCNQUDF9BKd1tuMBNowMt7W7tp8QZ
n0FZnz6UbRs/ePd9QkoSDP1+f35OQT7WXMxw2UEUpdRbUbrK7rkGyKyFn/sY/JMSZARghIT2sDS4
YIfuYGou+xNGWvUfNMGpmDjhS+vr66NGs/nzQ1mTivPb4PRYk/Xvo1H5tDlV7tf7e7AGmZOsIBMI
hhVPuave7l4BGCGhPSgbuGzbA9P/N3RtU+abDSdNkRbgPBmT8VZcOAlw+WeqjttBhlB6qzaEfZvV
fQIwQkJ7SEngcko64cIJeZf0kNPmznVvT3x++28oJRebrG+TZT67ptKVMlx0JanJ1GvNpdvM9wjA
CAntAQWC7ZenGS6fEIVcq54xUgbf5foFeMD4zq5vEuDSuDw03emQHjS5sQtodPZg1i4NFDICMEJC
aRbCBXLc/SSNNReopWz3VpSE8NznC70u5UjnwGmWdnl8/ugirKn8GX8sWhQaNbpIaobTbJMrF3rK
XS/szvONQsj4g8FZLPbnbkkh41CHzqwCxHmUUv5x5/bv1sydOzdivv5Yc/P4HJblBUrPgNDnwB2b
4J4V3orS/zXaa2wM7ePMlSrjBtGdSzwezw942tQaLqWc7ofniiK/W13pRg9DBPrGSdmjaiy8JSuU
f7Zzm7LWXB1Ue9gp+UmyiOER0uL1lnxpNvc1h6dJErkComgyhOUbQvkTG9av89XX1ytW7jDGqL+5
9SxC2engKkQw7YCwvxPdqQSsFpyhfV+gbTaROA4roh93QrjfUXo6fdXV1V8b7fpbwnWMxuYyQKJ6
2Vte8oZqHgwezojzZM28B8wf1sJdAuHePxY58ps1le6X1LjF6jEho/C8c7u8FOPL7w/9jGVJZ+tx
WV1Z+iAket4bh22nQpiK1WdQvsVb5lpuDksgEComDulUywimvFPh0Veqy8vfSwhTsM3LCPsPy3t0
z5DIM7h9QDI7mSA7uHBO0tbnUlPj/hTery9hrRIl8xoaGhZBXu0qHCctBJNDEu/iD3nKXI3peD4K
3vEHqUDGYbeKk6rLNSnJH1P0IRBzNgZKvwZgqMqVsh8hWgKORSXFe+bBteatXyjn6dOVpRy6v/EZ
EUlaAYcftDsuha+T8JxJbDEcVMDQ7OwJdv5iqp+kHyBjXeapKPEZLlwK379MFikKk1+DQwJg/C1t
x0oS+zvR12PEwlIyqXgqLv662uwG9sr7WtqeJPGOM6rHV7UzT6pvamk7EyD7om4fYelvbguCtVkJ
aY4SL8vOvwUytdtTUfq3eDAYxUVlB2k/cY/UN2LWncfpcQKudMBBBQxn/Fj8W1D1XomF4fASDkuC
2xifEprnF9L1cFhFs9hZhnh9DeCysDdc89nk4mkNcPrT2DNopKG5efXcyspvEiLAyY6Gb5uVv5RA
gsM1LpiY40OojLJ5xG4xnW6HODbDIaMBkwwuekGRLkVk/qcsB60j2jsmWi0GYP4pxHddom3+FpQi
L4D/msBnR4LBaPhs54Svh5LkWd7TuRwKus6B+iEVyKTSRDqU5ajb96ltPl9r+CSJUJ8hYAnCNQx7
T2S74LTO6nqaVAgpchn45cuaMteawThEGcUaHMKlG9q454O72M6dAeG4AGoe1xhLeNTkKdLlpLdX
fgdcfBUidCqcj0d/UcYeg/sOwfvUmk5LGw4tnmTz+DFAlODi5csnXVRV9f1u+V/hqyEHX6/9PFI1
c+ZiZu59P5RNJwgYQn8eN+N8ZUK4Dj0c/fhTg5Ezj2ZhzdPcjk/FV5cGgm1Pe8pLnx34vZmpoYQL
qq7KtSHQ2h6E06q4ISXXQU3R2dc23Q881WIa2Z4A6eFQMHPR7Pzb/M0hL7Qgnh+oP5JBBvf4NQFG
uYL38Ge4g46DzHEXGJygXThatyHF/llOT7zrFR5xRzo7P8/KH/M7qPRcoTk/p3F5aEFtlfsfA/Ww
lSATz6OEb435R6U2ww+A7jY49gEM2F/DufKY2bybRjdYOK+3Y9kuhb+azai+UIxCE4nGnDOI8l8a
0tDDQOnroaQvypey47WWJUuCRXDY+nhLCJtEcbhAM+qaru3fLs4tGHsck6S/gFEufPYqkHIQ3v/T
b0RYKNK942VnXmEXnOZBgjkAa0wsK/9IkzW19sCh9NJ9zk2A4YzOMc+soIxgMzUZYHbxHhkX20nU
IRXDW2nSwoR3Y5pRAcNlcgNnSnwKO5Swv4DDJQZ3/tm1TUnwj1AKish/JE61+0F/dXvb2LQz1zUR
0uOzUBiekO6d8xIBo7AtXm/JRjjbCE2dlyDBqoCB4xd4bGxpOcDJsuKloEz41dBu/gDPKypC15zl
Zi6wi30q1CkxnE7YBzBO5nwYaB+rjtGElaC2kmX+7JxK1/voBaDi1/g3C9qlmbi+Qu/T0UU5iXJK
u41mjNOv+lT3iUqPx2hs6mNWtoNiWLK0C4ut+mDA/g5DRpwHYTkqT8peBSXVnJrK0jeNNR5ozp1l
uPVtb7lLX+D2XFNL+DqoPR2h+bfDKtzwnCpwf4Z6TvnPCDEjgJDa2tpusPMCXDpNtefMPRLc1QEj
EywMKJmuNZsO1cy/fzLMX/NWxH5onYIu7Rr65ROirtKlxzQ1hQ7BXc+s/AdS4BqmF3z/G+H9f6O9
f4gnulm35K0s+at+7msOz+ASWWwIySbeQ04396llmjzlJQvhPRBTLWYMFLqrmoLte6QW4/G410Fz
FJrr9Oz+bceFeQ/7CXH3ulyDeS5UuBugYnGkudaeTFB7mWKuvaDAgfmQ3ucnAoaR68DD1eDhUZBQ
9AVRkHf4A+pl5pxktB7pUOKR1tLilqHd9RacqgkMcsRkay/R0y3yScqSFRKUJKIDhikOB1brEzoV
MbNB5j7NaASlN06VPsNo1tDQ4MwfUzQLThEkWCvTazMLn2iTr/OUkz7iCl8AGRjBkUdiEypnQXBm
YZigBNjobw1fXV3meipmmRzYG1b+ltEdb4UrlabH4b0Qto80eD+rqRZeKkkAFz5Ds499O9ghewjP
zpuphRHtr8H3pd8/ei8JATtKuwYwoB9RfRuALAnSA7GbDp4F6eUpiFx6tls6kOjvnpAvojt/CJkt
L1senpzloFirGa0ZbZV55LQab3mfjvdMVDLIQNoY0AiSrPDnHRKPz2GBTGi5kVQ0qvzB4ZCsAIMg
yU8w4fzuyM6OW7FQWrAglLv3vuxqyKe/77VAxy9bFkTwfJGKH5PCJd7JmyhInNRUveZPb1y/DhKL
i0gKBJP1JnSnc2dCqqeYjfV45SRlCg5E0PRhxu4FFmWWIz2pKH90ES5bLzGbg9e7IMO8CpkHI3u1
p8xVp1+DRPIa1OQOczDnVRBSd8I+poRMArCt8DWHTlRHc6gxDuggsJpcNKqshqpy7JxwAIm6ZJ9A
QbQcSiUEDDCZ1sbDpxBT84jEm0dUoStkRd4kOSRtBzNeDaXarTalGjyUnmliHwdcX2PaWoAEAu0/
cToJrnkZrxl1RqPymXOqMn/kyCg7yEAcrh4IZLQa+/v92YvQ6CcOImGts8BgHIWMstBQ08c0/Rmk
yev196gNwtwBfp0OvizCPWC6tn3bbjVibKVU4IJyJF7kzwMjNsEDx9FYac8wAU06dCpuOLxI7uEb
JMPeVzQnH9c3YM1A3cRmcvG0+GIqQI1Vfwc+ZCYE/3P13Ekwg/9nKgGKezjW9NIV3b6dfNrHEidP
QyZKqCHIXE5YZQov+yh46bpbX3GZnEslgitKJ+qjMpg+FK7Eq/e4l0ZOwdgjGeQrRVZad3xPbi4c
Jx0MbZxyuAc7i3HeAWMSw+YGDhdj80Ef0o33Y6ECre04YnO89vNJT1nJ9aSv7iIRoo70cAevopTe
ZRUn1dXl70F4sBYwAfz8K4Ixi76P0pVQJ/sOTveCT6keO0ymccAsa2nZL4tlzYo7RvlU5pAOIFrz
Cvt1/M1t2GdiNX9ChiLHB803aOXRoyDNHKZGGiOPLlsWeq6uzq3GuTrtIGfUSnRLuy8ClCtLZR1M
JipdkOlPOKI5uTgbBxGMcMFMfjs89SMj9yHuc5cuXYrpM6Hr4Luvv6i+7LLLdg3kuanCBZUAGCi9
FnkqSjDT4zyKpVDm1qnmjGJP9SIcqoZS/XVsm6M5lNb3QZv6S7lb+Xxy8dTbwWii/iwakdusPBfh
PV/VeipUwEAmSylgDkbO8beEj2OMzAAqx3dXhwD9/eKL3Tv63EBJHiT5hMAzyvbxBYMd+lwLyllR
/CInr2M/QSDYdikEdoXhthc//uC9oJ43WUFBgSRJ8c7cwiJeAxHqh4Tzjr8lNBtcnR57PFVLAUWW
VzBJ0jszj4Am5E27OuTF2fnS8ZSpcavGP+d8sVW41clVnhI1ruB92I4yYanU1BrGZtIcosEF9C3O
+QHzdWB+Iultb7/v0dxEOanTS2Kd5lrc0Rv6VLWo2tlrBRicj3Munmj9OAg5bGqNyspnv4bjkgcf
fDB7r/ETn4bzYkPAVimcjsc5P7oRo/RDyJiv2oUx04SQaQqGmWk2L0IGm0uDnhOjzq1qbsOBgV8Y
zXGAY+P6d++YNGXadFPNssiRV/CcP9j2EI3w12pqyj/GdLMn4YJKNkyNL7tOO+/te+F0Hnj8b9q9
B0sSfVvKTxyxhlJtidfjXjcQjycVtBNZ3wbGLq4odn/YfRLEf5+hYc6dc4k216KL7Hozn2Rj5GZD
eM4C2L2sTzIzaPqBh0zFvgh117DzKyu3gD3MaHrn9xLIwJdAghkLP/UOVC7LstoHU13pXg0l2V/j
HbBQJc0pkO4wPeMLGu1e2n8k9KvV8Jlj+B2Lf07XwYNP1A1jfSy9ggxguIdvBpMu7QfWVfWJi+7G
xsbLse1u93AEPcQNVumPjT0nNpensHCfImJeyUvJGZDzzkh0gT9EYmnuRyNvuet+gAwxQWZsOiAD
92M6qks05Zu75Z5qHJyAFsU/oEWBgxZT9KuQXmeCX2ZiTyPc3wFp8w1oaayKdsmNqfwjwUDhgrIF
DDQOPjUUbEXYKYTtNiDzC4GW9ipotz9KezvrDM/ij0d3dljt9ZlOrQe4XDSYF4QjShDBNxg2ADI2
1bCEx8xVwCTyhN/vP1afcduj9FQ7WdZf4IZpBCsA8NIM90UgAm7SZ9OiOrfLlflj2HK1c7uvNsky
P6fGNAq2O4p2KWuceRLXwoKQfy925OuooftHIb39L1ArOhou6QmQ71IiR59bUaGO/mjNmi0k1uE1
RsodhTWS+HYBNsLRJx0m+w82TD8G7QnIBILhenDQXLh2R6NKyflVlfjOCELG3xy6GGrQWPBYzI2B
ZpU2QAHp5lbICzdD3l5g90w7uEACux3CeJvdfQAYJd5THSXReGAjO3e84swbFb82btxOHDVR54hA
MyoECXAtyx5VAQkUh1FzoGTcBKXlCnhY4t9bRnZuItm5cXeUrq54b7hC+H2M8GDMo2y9bt6zg23O
KVASVoEqClWgXfMDZMgP//2v9981DyFzhdxHmdJiF1DVDpFfNv7GCG1qaXsLmoDYBMD+i63gpye3
bdn87Ni9970IXqJTTROOHKzFqLOM6yoqPoPS4ecHFU89HZqIs8DRCTh0Da6vp1HaBk2aT4zP0IZf
fwUv+0RIVGdAibGvNhP31UhXR4u5VgDx+FtK+GgtTl7vNY+8TImkxQntMYcNSyAAfy1hijZywF5R
v2X6DJjF43L7li/jTbyoLEecDqpeUzjp0OGCwr+/gNpZje4XytWhTcJ7lFdpVuwezlnC3iNQ5b4X
mrFrVfsKU6cEMNa9DVpn5hW9fQTv9b3+7GSq0gkZgMsfjZ23muD18fPMfVo4cc7XGv61RCjWkCcQ
e+XhDG9wu9BT7rrdfLGxOXyoU7Ksufzem2QvGJTDU1Zq2f7XRgEsr6G0/195OJnjKK3kt3QnPpxr
0nnnub9L9mx18MYkb0XJk/35xUratP4XLS7db3ePtqnPU9onJWmzJPudKWm1/ke9Pzbf6INk9yYs
ndDNYv0t1u84NhHSdjKklV+0OTGW82JwhA0OryWYxaagJ3mX/z+EkIFaAjVtmYmQWQk1yX7/1F77
J4CHAFIXmK9xhV/hrbBONzVlrpWLFoUOHl1EcfrJGdoEyPFWdgFc9VBTadXSmqoYXEx7wBANLmLL
TCGhkSOsMWujS0bI7AWtgNXJIIOTSSdPmRbAvivzNWgC39jfnCptIGSx9lEXIDtypGPguReY3GSU
OnA6g1pDGixcUAIwQkJDqIFCRl297szFSYtTTE7hTLOroWZk22+yePnysQVS9rlQ66l8IiTP1CdX
ah26T0Lt6Sl/c9ua2EJcXVQd6EgHXFACMEJCQywDZIyr0hMgE1so23ohcUq40Djf5AT+E8BvwN7j
ds8AdxYUOnKwOaVOTzjbJXngkNCExmHqQGv436ZZ4nK64IISgBESGgYlg4w/2Pbf/pY2hMMJFrd+
r8hyBU6BSOY+pXwMfPeuNWJkEcAkJ9LV4dMHFnyt4dkSoQkLYnBdXLrgghKAERIaJtlBhlHmt7KP
e+9GotxdV+W2niVvUEQmdzolgiut9V3toBZEH3HmFT4QaG3HtUYFAJe+q6ypuv1DIhc4vwOaYgOG
C+njkJCQ0JDKBjJm4SrAhVs3yzf297/TunBbS6ixXAIO45IUZriEEygPsrkN1QcunnLXLak8s3/H
hISEhlz9QOY9OSpfUFPlfmXA7pa5lgSCbd8SynBJgfXQdDINEi4oARghoREghIy/tY0ywu41XdqX
SdKA1gslulv6RENDw+q80UUeHJKmsTVhOHmyC5pcH0O76xNKCW7JkbhBeBrgghKAERIaIaouK70P
IENMkOl3nkx/wo3A4fCo9onLFwweLFHHWtwFO+GGNMEFJQAjJDSCtKcgY5YBLvsmXEgjXFACMEJC
I0wImUCwHf9A4x6DcdogM1RwQQnACAmNQHnKS/6sdfymFTJ2cOGE/8GbZrigBGCEhEaokkHG1xw+
eaB/AZuk5nInwOXmdPjZLAEYIaERLDvISBJdMxDIJIMLNIvsNm4btARghIRGuAYLmeGCC0oARkgo
A4SQaWptx70J7zYY9wuZ4YQLSgBGSChD5C0ruQf/8zlVyAw3XFACMEJCGaRUITMS4IISgBESyjD1
BxnCop1SbIPuYYULSgBGSCgDlQQyqwlx4n4vE432OeF/8g4xXFACMEJCGSobyIwz21PhUuYy/xPB
kEgARkgog2UDmbiGEy4oARghoQyXHWSGGy4oARghoR+BVMgEwxR0F/4eCXBBCcAICf1I5C133Q01
GQZ4GTsS4IL6P6va7OV2EOpcAAAAAElFTkSuQmCC

--_004_59f5d95acf0149bc80420f03316cbf3crohdeschwarzcom_--

--===============0235752627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0235752627==--
