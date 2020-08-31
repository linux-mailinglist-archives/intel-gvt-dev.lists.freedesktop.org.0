Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283E257872
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Aug 2020 13:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA64E6E119;
	Mon, 31 Aug 2020 11:30:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic310-13.consmr.mail.bf2.yahoo.com
 (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07FF6E11B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Aug 2020 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598873399; bh=yhSBrV3PWyvGAZGHLSqPerN0izlfo8IOk1it1pB+lkU=;
 h=Date:From:Subject:References:From:Subject;
 b=DsfwCMl7NhKHgqFsddz6diNfRSoEFTot53cp4ZcPNsDWkywy8w4F0zP+FlFt1f5jsNSzVuiEQLbmGKCRW51HGn9rea0ozkLyDZKtK/EM2pL2tO3WfQJlpKISdLBygsS1+Eo9myPH6m9oGXPgz5/Hpm7peTvxiVE8vlGJMkBnSbPKGvHYU1L4xcYAeV3VhNYD8sn5TyhoCr6kwdkJHJVWAFmOREhsWHophuKZin3Nq8+mb9MIKHMg72SvgaNssxtlE8c7dLBlSumgOqac6e2BXfBPhvc1VTCv3a4NhtyxBbeDY3w19DqOjygPReVThGUsAjF5xoXlpXj63YO7Kap9kg==
X-YMail-OSG: ntmcluoVM1mYCLjvuXUuvwmtpNx1G8p_LYw.W49z5KV_s95Ydx31P6J6eQ6KMCQ
 2llMDgnr4XwXfdBoha3moy_.vKTcWaQFijPAOZOmb9NB6rEHCn3IQMCEweKjPr1o69aWgRm6MX_L
 41z8cBWP8gNtijas2d3G9RtILjRrlaPlEcMVe5g5Ew4_taZypC1aES.HCupIzMOXpR9b2Tcj9qAy
 88WeCPBUFwhukfrLsdWBJD82wSLqGaXq2Mak6x7sqOveJqDdpL7ifzdTGhVSI5VFBtPWtlx.Yy1a
 uIQqiZeYdpMphJ9Qg5qPhp_h9paoHo0DrwxGrY2Dsx4xaRSs2ErAYyJ2qDTJ4pGS_AWy5mbP0EQ1
 De_JGW9NQk9vNkkbFw2GVZbeZpNYaIRW8IQWLfnqJt5LUD_p7k0yWUIijD8NWU2dO1V.V2Ym.fx1
 r9bnrouJbYUvaC8_A1udC_iZFLrNdavbdn1DoQDyqbb_ko0P7wRThNxl6nXciSL.8k4j9SvfFxPi
 nwusyiztIE5ETtuD5fzFJdWX._VAvAb9fHIjrY755fAHKnZ9mV8M3A3vJmhDlatlNKvbQYjJHp0d
 3gXIPnK87aTqKeSBrB8Xkd07k7_oamJxFWAQcX2L5BfqUnlIoMTL8ayEODT.kn7cmHH.Vtrtmq8D
 W3zTciNUES6KugGYohZWwKIQ2eqx0tViVHnxGTuXqP4AOXhrSWJsf3jEF8iyAyqQNPwq0Xoms.us
 kNy8OCQXpcBS6ziZJ4v8Jmvf8FfEAm2JDlTO2LnHWHgF6A_Fa22foK5deGhi5rCu3PQL235hlB61
 CFyEi0qorU8HnRokFGRg9yLTBEoesK_nFGlKUcWl_Fe2o7aA8hvva23vbegz.v6tfc1ylAZqTLIk
 YBjG.L36LU3bCXX31sG9CWfjDRzd5qn9S3UDcFsxckBkrmM3zRrxd8uN473UM.Wrq_qN839DNbG_
 VPj2HmCC9X4hqez2la5DorYyH8RiZlFbfI2vm4knltTAYgIw.nmoCab.XP9c4gKIMGm0hJK96AdJ
 fRh_pG3l7ydNqjJTKGY1RH9atU3w3k2iCQCS4GP6_0.HaiyYSBVfAYdv6bCARzaYbQD9DBxl47Dj
 qtZhqLzMoVnCFlErssXsUhuxXftrzjTQEAbECrDTLn73R98UXsP4g1dTOmfmui..u4jYop_4k2Xq
 k4qa4ZCVUaNHxiZf_mbILIrSYHOxcHDEHlpoYdz1Uo7J2MEolmPJWmX_KV5C957fOxvSE1SY6nke
 3nu0KH4rKSzS.KlnetZwaCfKFezawFulTbEt2xyTEYhHhYwiFiuBuqcGYJ3gzhjb_Kl5dvsOWnxl
 Gt.76QjOVY9mqqfZgCw.5TmSUPPmEDTeMLFGQVytnS_K3vZgnO2b53QuF.5CG0d_66PjVGLOUw7s
 2N1mdlPbkkqRIT3pRT7L8AAIcvZ3q.RCX5zAYfVg5L0xDQ6pNMrUg
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.bf2.yahoo.com with HTTP; Mon, 31 Aug 2020 11:29:59 +0000
Date: Mon, 31 Aug 2020 11:29:57 +0000 (UTC)
From: "aishiag85@gmail.com" <aishiag85@gmail.com>
Message-ID: <2116461576.572166.1598873397135@mail.yahoo.com>
Subject: hello dear please kindly reply my email is very urgent
MIME-Version: 1.0
References: <2116461576.572166.1598873397135.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135
 Safari/537.36
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
Content-Type: multipart/mixed; boundary="===============1798234429=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1798234429==
Content-Type: multipart/alternative; 
	boundary="----=_Part_572165_1676303155.1598873397134"

------=_Part_572165_1676303155.1598873397134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear I Need An Investment Partner
Assalamu Alaikum Wa Rahmatullahi Wa Barakatuh
Dear Friend,
I came across your e-mail contact prior a private search while in need of y=
our assistance. I am Aisha Al-Qaddafi, the only biological Daughter of Form=
er President of Libya Col. Muammar Al-Qaddafi. Am a single Mother and a Wid=
ow with three Children.
I have investment funds worth Twenty Seven Million Five Hundred Thousand Un=
ited State Dollar ($27.500.000.00 ) and i need a trusted investment Manager=
/Partner because of my current refugee status, however, I am interested in =
you for investment project assistance in your country, may be from there, w=
e can build business relationship in the nearest future.
I am willing to negotiate investment/business profit sharing ratio with you=
 base on the future investment earning profits.=C2=A0If you are willing to =
handle this project on my behalf kindly reply urgent to enable me provide y=
ou more information about the investment funds.

Your Urgent Reply Will Be AppreciatedBest RegardsMrs Aisha Al-Qaddafi


------=_Part_572165_1676303155.1598873397134
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false"><div><div>Dear I Need An Investment Partner<=
/div><div><br></div><div>Assalamu Alaikum Wa Rahmatullahi Wa Barakatuh</div=
><div><br></div><div>Dear Friend,</div><div><br></div><div>I came across yo=
ur e-mail contact prior a private search while in need of your assistance. =
I am Aisha Al-Qaddafi, the only biological Daughter of Former President of =
Libya Col. Muammar Al-Qaddafi. Am a single Mother and a Widow with three Ch=
ildren.</div><div><br></div><div>I have investment funds worth Twenty Seven=
 Million Five Hundred Thousand United State Dollar ($27.500.000.00 ) and i =
need a trusted investment Manager/Partner because of my current refugee sta=
tus, however, I am interested in you for investment project assistance in y=
our country, may be from there, we can build business relationship in the n=
earest future.</div><div><br></div><div>I am willing to negotiate investmen=
t/business profit sharing ratio with you base on the future investment earn=
ing profits.&nbsp;</div><div>If you are willing to handle this project on m=
y behalf kindly reply urgent to enable me provide you more information abou=
t the investment funds.</div><div><br></div><div><br></div><div>Your Urgent=
 Reply Will Be Appreciated</div><div>Best Regards</div><div>Mrs Aisha Al-Qa=
ddafi</div><div><br></div></div><br></div></div></body></html>
------=_Part_572165_1676303155.1598873397134--

--===============1798234429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1798234429==--
