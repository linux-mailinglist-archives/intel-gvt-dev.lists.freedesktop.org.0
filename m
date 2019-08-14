Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32B8CF18
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 14 Aug 2019 11:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2146E46F;
	Wed, 14 Aug 2019 09:11:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1800 seconds by postgrey-1.36 at gabe;
 Wed, 14 Aug 2019 09:11:34 UTC
Received: from bosmailout01.eigbox.net (bosmailout01.eigbox.net [66.96.185.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E889C6E46F;
 Wed, 14 Aug 2019 09:11:34 +0000 (UTC)
Received: from bosmailscan06.eigbox.net ([10.20.15.6])
 by bosmailout01.eigbox.net with esmtp (Exim)
 id 1hxoqb-0004fz-J2; Wed, 14 Aug 2019 04:41:33 -0400
Received: from [10.115.3.31] (helo=bosimpout11)
 by bosmailscan06.eigbox.net with esmtp (Exim)
 id 1hxoqb-00039J-HR; Wed, 14 Aug 2019 04:41:33 -0400
Received: from boswebmail05.eigbox.net ([10.20.16.5]) by bosimpout11 with 
 id owhK2000706ZEP601whNLn; Wed, 14 Aug 2019 04:41:33 -0400
X-Authority-Analysis: v=2.2 cv=RKvDJ8q+ c=1 sm=1 tr=0
 a=ugAwYMi5Ce8m9tm4hY6jtQ==:117 a=UuIbADj5wyglL54oTYG/ew==:17
 a=T37_3-_xDYUA:10 a=x7bEGLp0ZPQA:10 a=FmdZ9Uzk2mMA:10
 a=v7K953DbmOMTLgNcn5AA:9 a=CjuIK1q_8ugA:10 a=fwGTFvqGrGwt2QmmicoA:9
 a=_W_S_7VecoQA:10 a=QEXdDO2ut3YA:10 a=NMy4LrQXOexfsfnTc0V3:22
Received: from [127.0.0.1] (helo=ipage)
 by boswebmail05.eigbox.net with esmtp (Exim)
 id 1hxoqN-0004wy-8u; Wed, 14 Aug 2019 04:41:19 -0400
Received: from 112.208.40.164.pldt.net ([112.208.40.164]) by emailmg.ipage.com
 with HTTP (HTTP/1.1 POST); Wed, 14 Aug 2019 04:41:19 -0400
MIME-Version: 1.0
Date: Wed, 14 Aug 2019 02:41:19 -0600
From: sophia@gorohachiro.com
To: undisclosed-recipients:;
Subject: My humble request
Mail-Reply-To: urmsophia@gmail.com
Message-ID: <0d44cd59e6ab346546757a0cfdf8e684@gorohachiro.com>
X-Sender: sophia@gorohachiro.com
User-Agent: Roundcube Webmail/1.3.8
X-EN-AuthUser: sophia@gorohachiro.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=gorohachiro.com; s=dkim; h=Sender:Message-ID:Reply-To:Subject:To:From:Date:
 Content-Type:MIME-Version:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfrGpB7zmjcMKGJWA+FrE6+DMrKejDR5IsoLNWMzk6I=; b=kOBs7UFsvrm/o3B2/HZmWAu8Zm
 /Zn1FfE6eFeQXp9PrhI0OwXwtf3+5fQk9qx6wz+djw/sYBdOudc7QN/PLpXk1WvgKotaH83lO+fPp
 73BlEboxqW4Sx4987q4+0rpc8YJ1mMWDdxwCR8PAFxQh7AaeZVAp0TaZr1Kxmv6eQ3eVhHvI9sQVT
 Ks7Pi9VmOZfCvQ3MsoMjgvR453Xc45DAxEn7m9DCEC555Jf0pFPOsO+Hx0mDkA2FQ9SYSqcboJ9qK
 bqEHaUF+9h5AZATN+QrBWCeTwyVtt1BSslJoVNgDfA9VWTFfC2cFVB4ASBvlv3o0eFhZTIbYn4SiD
 kaGnNMtg==;
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
Reply-To: urmsophia@gmail.com
Content-Type: multipart/mixed; boundary="===============1836052725=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1836052725==
Content-Type: multipart/alternative;
 boundary="=_04321ca11d2aecc2e4cb3cf1fce6a8ba"

--=_04321ca11d2aecc2e4cb3cf1fce6a8ba
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Greetings 
How are you today,
I am a NATO soldier serving in Afghanistan.I and my comrades, we are
seeking your assistance as a business entrepreneur or business
development manager to help us receive/invest our funds in your country
in any lucrative business.Please if this proposal is acceptable by you,
kindly respond back

Best Regards
Sophia
--=_04321ca11d2aecc2e4cb3cf1fce6a8ba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p><br /></p>
<div>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Greetings <br /> How are you today,<br /> I am a NATO soldier serving in Af=
ghanistan.I and my comrades, we are seeking your assistance as a business e=
ntrepreneur or business development manager to help us receive/invest our f=
unds in your country in any lucrative business.Please if this proposal is a=
cceptable by you, kindly respond back<br /> <br /> Best Regards<br /> Sophi=
a</div>
</div>
</body></html>

--=_04321ca11d2aecc2e4cb3cf1fce6a8ba--

--===============1836052725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1836052725==--
