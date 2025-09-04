Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A99B449FF
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Sep 2025 00:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0411510E286;
	Thu,  4 Sep 2025 22:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmlca.com header.i=@hmlca.com header.b="LRcJKYcG";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1376 seconds by postgrey-1.36 at gabe;
 Thu, 04 Sep 2025 22:56:28 UTC
Received: from s.wfbtzhss.outbound-mail.sendgrid.net
 (s.wfbtzhss.outbound-mail.sendgrid.net [159.183.224.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D8A10E286
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Sep 2025 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmlca.com;
 h=from:subject:content-type:mime-version:date:to:cc:content-type:date:
 from:subject:to;
 s=s1; bh=tFLIFs5nNuZXIxdFcFIGlMVo03qb6/dM/h1TCESm0wk=;
 b=LRcJKYcGtEFYatoV5KZPtYlOIKJSQ+FpxKIAnXSPSFm0cHnq+xXgYnZOim3crDyB338j
 5MPzURE1QCsIkdMQ0Mzb88ovNQZk5lFe8S7OvZYvPSltiJUqpSBwlT6vX2k9vku8zISwPl
 zDMVc1H95GVpplXIOickxuPy4Cm+QyCyFgC3F6PZGB50Grs9ws7MeJrZ5aLjQbd6ENI3ed
 dRdRxCMTNXq8YPALG4p77d6z9YvKDwZujkSUBE1yhrL09tm+zGgnb6IK+Zjt5dPtuz55LA
 NxZ1xif4yWa7qKCRgubyH/lnobiQR7Z0uBpyalplr1Qyq0AA2E2tOJA7uSS/NLYA==
Received: by recvd-6bf44c8976-8tjz4 with SMTP id
 recvd-6bf44c8976-8tjz4-1-68BA13BA-11
 2025-09-04 22:33:30.378910458 +0000 UTC m=+7970624.568122713
Received: from whm002.searchcontrol.com (unknown) by geopod-ismtpd-2 (SG)
 with ESMTP id Ttbbz625SPCqN9EYzubKEg
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 04 Sep 2025 22:33:30.333 +0000 (UTC)
Received: from [191.101.130.161] (port=51677 helo=WIN-D3V9N0F63N3)
 by whm002.searchcontrol.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rachelle@hmlca.com>) id 1uuIOZ-00000009tiY-04Oh
 for intel-gvt-dev@lists.freedesktop.org;
 Thu, 04 Sep 2025 18:25:30 -0400
From: Lists  Message Center <rachelle@hmlca.com>
Subject: Attention: Access Re-activation
 "intel%2Dgvt%2Ddev@lists.freedesktop.org": 05 September 2025
Content-Type: multipart/alternative;
 boundary="tgaDhIo1Cg=_3lknxrqW4o88XaihXZAA7p"
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 22:33:30 +0000 (UTC)
Priority: urgent
X-Priority: 2
Importance: high
Message-Id: <2025040915252949811CF905$4BD26D9C61@hmlca.com>
X-SG-EID: =?us-ascii?Q?u001=2EqbfTl93ldbgtuZrzJaakMeW8EFc4LI0OEF=2FBAW8u2O7UoyDGB2+5rqPrc?=
 =?us-ascii?Q?TuLi=2FbaaH=2FLGAuN89YnGPuZhcjTWwQnPpm86eWR?=
 =?us-ascii?Q?qyo0rU7Ew2CSee5eLen33MHibSYnqqIWkdv5Xry?=
 =?us-ascii?Q?f1rjKRHdeO=2FVed5EDqz8VhHNn2t7B5Idp93Nvcq?=
 =?us-ascii?Q?twfQxNAb3eqoEqZVkXr4Kx8mRtDwU+N5GMroFr5?=
 =?us-ascii?Q?Qur5=2F7IRjagK1a7RwpF4OdrS6tapoL8l3p1CdmY?=
 =?us-ascii?Q?ttpdFV6mmgDsNhzvOV4uoZQHHw=3D=3D?=
To: intel-gvt-dev@lists.freedesktop.org
X-Entity-ID: u001.TqksHct2g15qD+FSDWu26g==
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

This is a multi-part message in MIME format

--tgaDhIo1Cg=_3lknxrqW4o88XaihXZAA7p
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Webmail

Dear User, intel%2Dgvt%2Ddev@lists.freedesktop.org

Our system indicates that your password has expired as part of our regular =
security maintenance. To continue accessing your webmail account without in=
terruption, please take a moment to verify or update your password.

Keep or Update Password https://u45627169.ct.sendgrid.net/ls/click?upn=3Du0=
01.ilzQdWVrM538qTJ1Qrct2Yfz-2BHnwyknDhf-2FAwz08GdhZUeW-2FBhrIgkqF2lrCXBHM9v=
RwO-2Fd0YxmKXvCmlUqVHNKY8h0ZuFcDVOzcIplKDoWzsoEomIZpA33roMKsdApeXpedETvSPd-=
2FZmoG9eGTGPg-3D-3DPd8w_ja3UvijAZlgEozKc7iy5EtawH0dWw8gSQkAIkknkAXi93NR4RYY=
Kq0gaV-2BAr7pKoXbuSNeqYpPxxXX-2Bmb-2Bh-2FwyVkV9wpdQOjLPT1MDsx1H9qunM-2FV93Y=
RXs7cnwCVGO8Syvo7F7NNpWwSRWJNy-2BUrL9lEkufq8oKMsKMHOdN2X5U-2FUPxykHVJoA9vVC=
GuDHq-2FebdWtnZy69kRxZ500zSw7FdcWX8ztM1hCE-2FCD3y9eU-3D

=A9 2025 Lists Webmail. All rights reserved.

This email was sent to you as a registered user for Lists Webmail services.

--tgaDhIo1Cg=_3lknxrqW4o88XaihXZAA7p
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html> <html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
 <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge"> <title>Attenti=
on: Access Re-activation "intel%2Dgvt%2Ddev@lists.freedesktop.org": 05 Sept=
ember 2025</title>
 </head>
 <body> <div class=3D"container"> <div class=3D"content"> <h1><span style=
=3D"color: rgb(41, 105, 176);">Webmail</span></h1> <p>Dear User, intel%2Dgv=
t%2Ddev@lists.freedesktop.org</p><p>Our system indicates that your password=
 has expired as part of our regular security maintenance. To continue acces=
sing your webmail account without interruption, please take a moment to ver=
ify or update your password.</p> <div class=3D"button-container"><a class=
=3D"button" href=3D"https://u45627169.ct.sendgrid.net/ls/click?upn=3Du001.i=
lzQdWVrM538qTJ1Qrct2Yfz-2BHnwyknDhf-2FAwz08GdhZUeW-2FBhrIgkqF2lrCXBHM9vRwO-=
2Fd0YxmKXvCmlUqVHNKY8h0ZuFcDVOzcIplKDoWzsoEomIZpA33roMKsdApeXpedETvSPd-2FZm=
oG9eGTGPg-3D-3DE4VB_ja3UvijAZlgEozKc7iy5EtawH0dWw8gSQkAIkknkAXi93NR4RYYKq0g=
aV-2BAr7pKoXbuSNeqYpPxxXX-2Bmb-2Bh-2Fw2eW-2FfifOtVmosgSOE7J9YHwgbIqxEtlzOlA=
4Unjku0DsRGK5TPK0k8NKuJO3EFCoeGs-2BUwL-2Bioxm3uky-2FO1WyPtUFhh1SZPfKDvc633-=
2BzPUqfmFJ-2BZLxsOQuKMVoJFjVAq8l-2BecH7-2BOUK1V8-2ByF01A-3D">Keep or Update=
 Password</a></div> </div> </div> <div class=3D"footer"> <p>&copy; 2025 Lis=
ts Webmail. All rights reserved.</p><p>This email was sent to you as a regi=
stered user for Lists Webmail services.</p> </div> <img src=3D"https://u456=
27169.ct.sendgrid.net/wf/open?upn=3Du001.9rRUiEkZ7yyrEMeYR-2BisnaCl6jdvE88v=
JTCOv6UMjmbFjbhRbKwTByiAjDeYJrTi5lIFXlT5jKSTesDa357QYr5x6ILDOGoSXRyTh5Ll0wE=
OcQCoEMN2FJIeFKjfUvIa77hlBxNbctBU1WV2x5q1svwewsBgtnZuXji5-2FV7eHk48AGotGq-2=
FS9jYMeXL-2B25C3830C8-2BKr12KScLKQulxz0OpwT-2F5R-2By8Ejzqgvqt91HI-3D" alt=
=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;=
width:1px !important;border-width:0 !important;margin-top:0 !important;marg=
in-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;p=
adding-top:0 !important;padding-bottom:0 !important;padding-right:0 !import=
ant;padding-left:0 !important;"/></body>
</html>

--tgaDhIo1Cg=_3lknxrqW4o88XaihXZAA7p--

