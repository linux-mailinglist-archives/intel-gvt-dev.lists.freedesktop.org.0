Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C839D01C3
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 17 Nov 2024 01:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB5410E00B;
	Sun, 17 Nov 2024 00:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=l_giovanna@gmx.com header.b="HCw/Vd+t";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D431610E00B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 17 Nov 2024 00:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1731804469; x=1732409269; i=l_giovanna@gmx.com;
 bh=rlQttLARBfSB3zFIUgXxDLxib+5X+pjjmJ33sOLcvwo=;
 h=X-UI-Sender-Class:Message-ID:From:To:Subject:Date:MIME-Version:
 Content-Type:cc:content-transfer-encoding:content-type:date:from:
 message-id:mime-version:reply-to:subject:to;
 b=HCw/Vd+tGmhmvqQjGIaz0mC6/mPS+qmpdyHGii5pKwg0sbKvw2wXXJU7J3ZJMMl6
 g5DHhjoQ4K0BId8SZ95oqkZdc0dMqCJTeWlCguDQIq5oNy7YqZtf3MYNBWL89R1+d
 wwftKXTW3kOd4viOlaiH/Nn2bB04m91JARH3BNwb+o1I3+YF9p5rGcqC6cdtjx8VE
 J9nzIFBdqUwnfjwWEipceQBTLCN4KYFc/i1ZOi98G1kDP5M9YEn+OdK0Jgtr0jpWD
 hMQMQROvAf7rB+sQCb5dzgU3oeO8q937xwlsQX8CrVPY+0Ai77XIu5Az+uvfYQcoC
 Lc/38ak3BxeGusgGtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from 187-19-205-51-tmp.static.brisanet.net.br ([187.19.205.51]) by
 mail.gmx.net (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MYvY2-1tGtIy0YnA-00LXXQ for <intel-gvt-dev@lists.freedesktop.org>; Sun, 17
 Nov 2024 01:47:49 +0100
Message-ID: <0f3972d96a2bada680da9338dbffd4f2a02d1e@gmx.com>
From: Freeman Campbell <l_giovanna@gmx.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: RE: Hello,  Requested Data Summary.
Date: Sun, 17 Nov 2024 03:47:43 +0300
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="a0367f93e28aa0ae7dd79e2236f3f4d7e4da"
X-Provags-ID: V03:K1:euFekIi5qkW5MIst7nfGWx0tJ4qM76xVMVxVCTsJcIOo9hW4G61
 d+v4J44qV8f3dbKzBLaytVXJG+8BdL4rf5CLUyEZnLcX/lh4P8qxYd3JsovGNpE2TivFrk9
 uOZX52wNmhqM83ctMIKRWGwY+1BeNzWOtIlcAcsard34BzEY45v+fd3eYIePbfJahnE0QSe
 N1H4jaDTDga+QhvIBQTEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HgwELzuqT8U=;Tw7EEkCEDZA0ii0OfcCwVtmM+rH
 YzvhcyIH9iBwvviaCPnNbxgw6NT9c18+v0KKNZg5x9T7QupaB/SCPsjjB5tVkUIww0VrdBIJH
 9UGT64+6YUnZjDHWEqdVeYh30EPsGBVL4j3+lhUQFMwOEsuLEL6TGLC640oI4sO8dksywcmNV
 xOI7Qj9AiI2lFwYvbdcWvuhShNN/snfvbzP6XIWn6bnhyDHgdaEd9HFWX758h2xIr6/APW2OU
 tMsrvwRUJxpknYNXfwaI/IDVd2NME4ursmmO3FWXCjB/tocX5E1gnhG+0qh6AmIYqLb33mlgc
 E5KjKmw/8xaASsoN6ZmLP6Hnojrh0J9z07sndm3Mwb7zrL9Clw6GKnPUJ7gp1/eacWCcbVPYk
 WuQJV6wARsrd/xsydI2rtcftPcEHqBLpyUNJ2XEtn3UVKY86Z41rmPLpqKfcRRDnb4tUNty70
 GoOoF6vpF8M8wL8BUIiNel2IhojfEuhUR0f7HXMtdhhhNiWMCULMPvM+jsZQq6Uyad1g8s4NL
 Mwyb2qLTdAdEnh42DoQa677tS/AIRG7NQTXOY6Uc/Fjdide5iUqQ71r7jhYxAcRY5hulXfaZv
 F+nOQlLwaSW6q07Np701Dv5fHCt9N6eL537Hvyzf7FtF9pnywZRYiJCzM0m756yP0jjfv128o
 rIvarJrQJI0remleqc96y6oV+6Q0c/BpK1ETHjv/Ih/MIzLbQTGKeAbmhaem7hW5Y8G14DqQ8
 qstvWTDB2tAesNnOGF6EGYueUDjJD79CDXR4Tosfhbd3GqJgNdfE6QVPqSZrcY71nkyms67Hl
 4gV7Inpouz3rSEpXt7j76WfYPYWksRLENdzr6GIvVIrky5p4QAFKrnSjAfEVKm0EVx1VnRzIR
 BwBRZVlv+X1dNb1GKeeLQQ9kvMpq//tmVv3475OUUAAM9zIuvq6vVHu436bCH2V94UFi+J5W5
 6tiWEHSyQMlhly/DpozgmaQ4UXsdbAgN3QANuAXgdQanZCF5Fif8NmNVwOhziISSnb28YURCc
 334ADJFkgYir9Z941yic9Fk9Gb5prTpJA9aARHN
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

--a0367f93e28aa0ae7dd79e2236f3f4d7e4da
Content-Type: multipart/alternative; boundary="2085cc205139131dce642d918540475776f3"

--2085cc205139131dce642d918540475776f3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Everyone,

We sincerely appreciate your patience, and we apologize for the extended =
time taken to get back to you. We acknowledge your inquiry and are happy =
to present you with the required information.

Please find attached a screenshot with important information related to y=
our inquiry. Please open the attachment to understand the relevant detail=
s and achieve a comprehensive view of the provided information.

If you have any inquiries or need more details, do not hesitate to get in=
 touch. We are always available to assist you and ready to provide the ne=
cessary help.

With best regards,
Freeman=C2=A0Campbell
Tranquil Holdings
+1 (212) 700-34-20

--2085cc205139131dce642d918540475776f3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
</head>
<body bgColor=3D"#ffffff">
<div>Hello Everyone,</div>
<div>&nbsp;</div>
<div>We sincerely appreciate your patience, and we apologize for the exte=
nded time taken to get back to you. We acknowledge your inquiry and are h=
appy to present you with the required information.</div>
<div>&nbsp;</div>
<div>Please find attached a screenshot with important information related=
 to your inquiry. Please open the attachment to understand the relevant d=
etails and achieve a comprehensive view of the provided information.</div=
>
<div>&nbsp;</div>
<div>If you have any inquiries or need more details, do not hesitate to g=
et in touch. We are always available to assist you and ready to provide t=
he necessary help.</div>
<div>&nbsp;</div>
<div>With best regards,<br>Freeman&nbsp;Campbell<br>Tranquil Holdings<br>=
+1 (212) 700-34-20</div><div><img width=3D1 height=3D1 alt=3D"" src=3D"ht=
tps://pictot.shop/stat.php?9AXav35iM6b9foTqKIE5BR5ubDrErB4fMNkZgnQQgxiKTh=
aaxh2piKpaRvlhdtUv45RHGMW2fV2K0QRGS8zJYFbstE5ERrZ3PkvVATlkAA%2FIkpWxYEsQQ=
tJ19OZr%2BtyeKrhDuhaHDI2g%2BI%2FmtjZ88QyArGxi9OkysECaYsdplaQ%3D"></div></=
body></html>

--2085cc205139131dce642d918540475776f3--

--a0367f93e28aa0ae7dd79e2236f3f4d7e4da
Content-Type: image/png; name="screenshot_time_2024_45659174.png"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="screenshot_time_2024_45659174.png"

iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVR4nGNg8JcAAAC6AGiD4IIV
AAAAAElFTkSuQmCC

--a0367f93e28aa0ae7dd79e2236f3f4d7e4da--
