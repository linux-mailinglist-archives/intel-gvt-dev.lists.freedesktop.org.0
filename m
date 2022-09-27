Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 673195ECC30
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Sep 2022 20:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E0410E079;
	Tue, 27 Sep 2022 18:34:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Tue, 27 Sep 2022 18:34:37 UTC
Received: from esa.nitc.gov.np (mx1.nepal.gov.np [202.45.146.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EB2010E079
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Sep 2022 18:34:36 +0000 (UTC)
IronPort-Data: A9a23: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
 XlhfjI6MIMpcYvai1zkpqQ=
IronPort-HdrOrdr: A9a23:FIawL648IDiychA1bQPXwPjXdLJyesId70hD6qkRc20yTiT7//
 rCoB1/73PJYVkqOE3I9erwW5VoIkmskqKdg7NhWItKNTOO0ADDQuBfBO3Zsl/d8kbFh4pgPN
 JbAtND4arLfCJHZL7BkXGF+oEbsaC6GX+T6tvj8w==
X-IronPort-AV: E=Sophos;i="5.93,350,1654539300"; d="scan'208,217";a="385335"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
Received: from unknown (HELO mta1.nitc.local) ([10.5.24.15])
 by esa.nitc.gov.np with ESMTP; 28 Sep 2022 00:12:27 +0545
Received: from mta1.nitc.local (localhost [127.0.0.1])
 by mta1.nitc.local (Postfix) with ESMTPS id 3EBEF421DFF3;
 Wed, 28 Sep 2022 00:12:26 +0545 (+0545)
Received: from localhost (localhost [127.0.0.1])
 by mta1.nitc.local (Postfix) with ESMTP id 541A042266F6;
 Wed, 28 Sep 2022 00:12:25 +0545 (+0545)
DKIM-Filter: OpenDKIM Filter v2.10.3 mta1.nitc.local 541A042266F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moha.gov.np;
 s=smtp25; t=1664303245;
 bh=yWuwQ4U+izCl33y55wxHsbENksAI4ztovB6g2u8qaeE=;
 h=Date:From:Message-ID:MIME-Version;
 b=M5tye617D4lJ6qVoPb1dXRZ4fZF+xHdUDLVNRTI/m7C3uBr5wzL7YbtqUgFB4oUS+
 KqUrEZv0eXU44Vxm7N8chBUphvXRhynWGwBQYVS8Gf0zRlkuK4GvoAGIcB6tf6xrmB
 xzlzqCkXP08toy3T7V3OhuTS2NYEMkNDorI1JSnpVPwqawLfZ9/niQQ/X/+lE04WFf
 QP001bOqqKkb85z349zoBiSm3nBxL6u/N6UAQV4rCS12kUFAoX8++PQnfpimOwTO0i
 5LCd1t9UYsbf5EfSmC+y81UyvJpLBB1tf68IITRwDYIuG/0g8klhRYQJAzptJVR+d/
 C05UeiAJzGqGg==
X-Virus-Scanned: amavisd-new at mta1.nitc.local
Received: from mta1.nitc.local ([127.0.0.1])
 by localhost (mta1.nitc.local [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uidhDjrZCf7R; Wed, 28 Sep 2022 00:12:25 +0545 (+0545)
Received: from store2.nitc.local (store2.nitc.local [10.5.24.20])
 by mta1.nitc.local (Postfix) with ESMTP id C0414421DFF1;
 Wed, 28 Sep 2022 00:12:21 +0545 (+0545)
Date: Wed, 28 Sep 2022 00:12:20 +0545 (NPT)
From: Rowell Hambrick <daosurkhet@moha.gov.np>
Message-ID: <1756949283.943272.1664303240899.JavaMail.zimbra@moha.gov.np>
Subject: 
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_85e4364c-7dfd-41c5-8710-d29b6d8deb8b"
X-Originating-IP: [110.34.3.229]
X-Mailer: Zimbra 8.8.15_GA_4372 (zclient/8.8.15_GA_4372)
Thread-Index: 5u/UZeQzY/HJZIe4R2DSunNVE4JhDQ==
Thread-Topic: 
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
Reply-To: rowellha0942@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=_85e4364c-7dfd-41c5-8710-d29b6d8deb8b
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Did you get my project
--=_85e4364c-7dfd-41c5-8710-d29b6d8deb8b
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style> body {height: 100%; color:#000000; font-size:12pt; font=
-family:arial, helvetica, sans-serif;}</style></head><body><div><div><div><=
div><div><div><div><div><div><div><span style=3D"color: #000000; font-famil=
y: arial, helvetica, sans-serif; font-size: 16px; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
; display: inline !important; float: none;" data-mce-style=3D"color: #00000=
0; font-family: arial, helvetica, sans-serif; font-size: 16px; font-style: =
normal; font-variant-ligatures: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decor=
ation-thickness: initial; text-decoration-style: initial; text-decoration-c=
olor: initial; display: inline !important; float: none;">Did you get my pro=
ject</span></div></div></div></div></div></div></div></div></div></div></bo=
dy></html>
--=_85e4364c-7dfd-41c5-8710-d29b6d8deb8b--
