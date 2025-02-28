Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4DEA48FEC
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Feb 2025 05:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10C10E025;
	Fri, 28 Feb 2025 04:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tascanada.com header.i=@tascanada.com header.b="MPAxTJzQ";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="XyDkAUnM";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Fri, 28 Feb 2025 04:09:32 UTC
Received: from e234-4.smtp-out.ap-northeast-1.amazonses.com
 (e234-4.smtp-out.ap-northeast-1.amazonses.com [23.251.234.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B610E025
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Feb 2025 04:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=liymgxe6xhciq5gqclroj5ubrzhhiwa3; d=tascanada.com; t=1740715407;
 h=Content-Type:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version;
 bh=gS4qgeGTQDyug+3+dCsEOhwO+J7xq1fPWaTNsMUTj2g=;
 b=MPAxTJzQnQw6BXSff1WLCgPq1a4cGrY4gb25fGnt6HlelTHEuIyZPOS0MFE6aG6a
 S88B2SW9tRY1xD171aWkKteyFCtwFB0quOzG+VrPxSBzZdgvUE/Z2G5wV4l6E61DiP7
 /DZXoHSXiDorDR2qdSvivzqgloYVeXFI25DJZfSru1WxlLtcjLi/JPZ0yyHRHI49HIH
 Kr0x9Pc3e39Ka2kJe/N5W/baJlFL7jApoKp1Z3MCGasbB2lz3IfHjCilMOsvoN8f8SX
 TzIOk+fqkG6rOSuZNqQcx8kWh0KIA+c3zYmebixLc7SWL1Vi7dsWctPy1ITyOhCdQGz
 JJME7qTtPQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=wf7ez2pjvcsodozkoqksj277kza7wu47; d=amazonses.com; t=1740715407;
 h=Content-Type:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Feedback-ID;
 bh=gS4qgeGTQDyug+3+dCsEOhwO+J7xq1fPWaTNsMUTj2g=;
 b=XyDkAUnMyxqmBXS5CP5wm7yzMfvJ3UmEzbuoUd9QZiIjUmZRQvvs8owi+q1T8iZw
 H5f+P2pHhgp5b4IvzwsuekJdz2jjZHXZHAFioaJ5rrgHPGujrWhxOPUzeZpdoh3zfVB
 1ucJbddFPS+F0Y48i8+DjWl2XS0KZ+groMD+eHgM=
Content-Type: text/html; charset=utf-8
From: Global Help <bjordan@tascanada.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: =?UTF-8?Q?Urgent_Kindness_Needed=E2=80=94Your_Help?=
 =?UTF-8?Q?_Could_Save_Us?=
Message-ID: <010601954ab93789-28824afe-178a-4cb9-b632-bf267b18ff71-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Feb 2025 04:03:27 +0000
MIME-Version: 1.0
Feedback-ID: ::1.ap-northeast-1.cml7J4CwF5y2aTZvZTQG3wy5AKeze3EYjL+THh0asYk=:AmazonSES
X-SES-Outgoing: 2025.02.28-23.251.234.4
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

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dwindows-1252">
<meta name=3D"viewport" content=3D"width=3Ddevice-width, =
initial-scale=3D1">
<meta name=3D"format-detection" content=3D"telephone=3Dno">
<title></title></head>
<body>
<p align=3Dleft><font size=3D3 face=3DArial>&nbsp;&nbsp;Dear Intel-gvt-dev,=
</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>I hope this message reaches you=
 with=20
warmth and light. Today, I write to you not just as a stranger, but as =
someone=20
humbly reaching out in a moment of vulnerability. Life has placed us in a =
storm=20
we never anticipated, and we are clinging to hope&#8212;hope that =
compassionate hearts=20
like yours might help us find shelter.</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>This is not a scam. This is not=
 a trick. I=20
repeat these words because I know how distrustful the world can feel. But =
I=20
promise you, with every ounce of sincerity in my soul, that this plea comes=
 from=20
genuine desperation. My family and I are struggling to keep our heads =
above=20
water. Medical bills, overdue rent, and the crushing weight of uncertainty =
have=20
left us with no choice but to ask for help.</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>We understand the hesitation =
that comes=20
with online appeals. That&#8217;s why we vow to be as transparent as =
possible&#8212;ask us=20
anything, and we&#8217;ll answer. Our only "condition" is honesty: we seek =
no=20
obligations, no hidden fees, just the kindness of those moved to help. =
Sadly,=20
internet access is a luxury we can&#8217;t always afford, so replies may be=
 delayed.=20
But know this: every word here is true, and every detail shared is from =
the=20
heart.</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>Why cryptocurrency? Because =
it&#8217;s the only=20
way to connect directly with those willing to extend a lifeline across =
borders.=20
We&#8217;ve seen miracles happen when good people unite, even through =
digital means.=20
If you cannot give financially, we understand completely. Your prayers, =
positive=20
thoughts, or even a moment of solidarity would mean the world to us. But if=
 you=20
can spare even a little, here&#8217;s how you can help:</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>BTC:=20
bc1q5k22hpgq0e5kjsuvej6qpjnm62f5tqlkqx2yr7<br>ETH:=20
0x85128B00BDE6f4E118FE86e256a8A426dbE03656<br>TRX:=20
TFYdopTTXvdYAUYhub5gahWxbzj25YZaow<br>USDT (TRC20):=20
TFYdopTTXvdYAUYhub5gahWxbzj25YZaow<br>USDT (ERC20):=20
0x85128B00BDE6f4E118FE86e256a8A426dbE03656</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>From the depths of our hearts, =
thank you.=20
Your support isn&#8217;t just about money&#8212;it&#8217;s a reminder that =
we&#8217;re not alone. We=20
pray this message finds you safe, healthy, and surrounded by love.=
</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>With unwavering gratitude,=
<br>Global=20
Support<br>Kim C Bauer</font></p>
<p align=3Dleft><font size=3D3 face=3DArial>P.S. Even if you cannot give, =
please keep=20
us in your thoughts. Sometimes, hope is the greatest currency of=20
all.</font></p></body></html>
